[CmdletBinding()]
param(
    [string[]]$Path = @(
        "FINDINGS.md",
        "PREVENTING_AGING_RESEARCH.md",
        "WHATS_NEXT.md",
        "REGULATORY_AND_ETHICS.md",
        "RECOMMENDATIONS.md",
        "data/evidence-tracker.csv"
    )
)

$ErrorActionPreference = "Stop"

$existingPaths = $Path | Where-Object { Test-Path -LiteralPath $_ }
if ($existingPaths.Count -eq 0) {
    throw "No input files found. Run this script from the repository root or pass -Path."
}

$content = $existingPaths | ForEach-Object { Get-Content -LiteralPath $_ -Raw }
$pmids = [regex]::Matches(($content -join "`n"), '(?<!NCT)(?<!\d)\d{7,8}(?!\d)') |
    ForEach-Object Value |
    Sort-Object -Unique
$ncts = [regex]::Matches(($content -join "`n"), '\bNCT\d{8}\b') |
    ForEach-Object Value |
    Sort-Object -Unique

Write-Host "Checking $($pmids.Count) unique PMID(s) and $($ncts.Count) ClinicalTrials.gov identifier(s)."

$missingPmids = [System.Collections.Generic.List[string]]::new()
foreach ($batch in @($pmids | ForEach-Object -Begin { $items = @() } -Process {
    $items += $_
    if ($items.Count -eq 100) { ,$items; $items = @() }
} -End { if ($items.Count) { ,$items } })) {
    $ids = $batch -join ','
    $uri = "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esummary.fcgi?db=pubmed&id=$ids&retmode=json"
    $response = Invoke-RestMethod -Uri $uri
    $found = @($response.result.uids)
    foreach ($id in $batch) {
        if ($id -notin $found) { $missingPmids.Add($id) }
    }
}

$missingNcts = [System.Collections.Generic.List[string]]::new()
foreach ($nct in $ncts) {
    try {
        Invoke-RestMethod -Uri "https://clinicaltrials.gov/api/v2/studies/$nct" | Out-Null
    }
    catch {
        $missingNcts.Add($nct)
    }
}

if ($missingPmids.Count -or $missingNcts.Count) {
    if ($missingPmids.Count) { Write-Error "Unresolved PMIDs: $($missingPmids -join ', ')" }
    if ($missingNcts.Count) { Write-Error "Unresolved NCT IDs: $($missingNcts -join ', ')" }
    exit 1
}

Write-Host "All checked PMIDs and NCT identifiers resolved."
