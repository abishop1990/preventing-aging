# Evidence Maintenance

**Methodology revised: October 30, 2026.** This date does not reverify existing scientific claims.

This repository follows aging biology and human healthspan. It should remain open to emerging research while making uncertainty, relevance, and risk visible. The rules below are an editorial appraisal framework, not a claim that every entry has undergone a formal GRADE systematic review.

## Scope gate

For each addition, state how it informs one of the following:

1. A mechanism or intervention that could affect biological aging.
2. Survival, multimorbidity, frailty, disability, cognition, function, or age-related disease.
3. Measurement, translation, safety, or the ability to test those claims.

Routine grooming, shopping, productivity, and performance material belongs in the supporting guides only when useful there. A peptide is a molecular category, not an aging indication. Record an obesity or injury-treatment result under its actual outcome; do not promote it to a longevity result.

## Appraise claims on separate axes

| Axis | Required information |
|---|---|
| Context | Species/strain/sex or human population; baseline disease/risk; intervention, formulation, route, dose, comparator, follow-up |
| Design | Randomized or observational; blinding; registration; sample randomized and analyzed; attrition; analysis population |
| Outcome | Exact endpoint and time point; survival, clinical event, function, biomarker, or mechanism; prespecified primary, secondary, or exploratory |
| Result | Between-group effect with confidence interval where available; absolute and relative effects for event outcomes; adverse events and discontinuations |
| Confidence | Risk of bias, precision, consistency, directness, publication bias, and replication, with reasons |
| Applicability | What population and claim the evidence supports; what extrapolations it does not support |
| Interests | Funding, author employment/equity, sponsor role, and data access; unknown is not the same as none |
| Status | Publication type, corrections/retractions, trial and regulatory status, source, and verification date |

For new or reappraised claims, use HIGH / MODERATE / LOW / VERY LOW confidence **in the specified outcome and population**, with an explicit rationale. Use NOT ASSESSED when appraisal is incomplete and NO DIRECT EVIDENCE IDENTIFIED when a documented search finds none. Neither is a synonym for ineffectiveness.

Keep confidence separate from the result. Describe benefit, harm, mixed results, or a null primary endpoint directly. A nonsignificant result with a wide confidence interval may leave meaningful benefit and harm unresolved; a precise null result can be informative. Do not use DEBUNKED as an evidence-quality grade.

These distinctions draw on the [GRADE Working Group's outcome-specific appraisal principles](https://www.gradeworkinggroup.org/) and the [Cochrane Handbook, chapter 14](https://www.cochrane.org/authors/handbooks-and-manuals/handbook/current/chapter-14). A formal GRADE assessment requires its full methods and evidence profile.

## Interpretation rules

- **Keep species separate.** Replicated mouse lifespan findings are important preclinical evidence, not HIGH confidence in human lifespan benefit.
- **Keep endpoints separate.** Biomarker movement, clinical benefit, and survival are different claims. Surrogate validity depends on the outcome and context; see [FDA's surrogate-endpoint resources](https://www.fda.gov/drugs/development-resources/surrogate-endpoint-resources-drug-and-biologic-development).
- **Use the outcome report.** A protocol establishes intended design, not results. A trial listing establishes registered information, not efficacy.
- **Do not salvage a failed primary endpoint with an unqualified secondary or subgroup result.** Report multiplicity, prespecification, uncertainty, and whether the finding needs replication.
- **Assess bias rather than assigning it by identity.** Industry funding triggers scrutiny, not an automatic LOW rating. Academic affiliation or lack of commercial sponsorship does not establish reliability.
- **Separate access from evidence.** Approval is specific to an indication, formulation, and jurisdiction. Compounding permission and off-label availability do not establish efficacy. Non-approval alone does not establish ineffectiveness.
- **Separate policy facts from causal interpretations.** Cite the rule or decision, then identify what is inferred about incentives, funding, or access. Avoid asserting institutional motives without supporting evidence.
- **Use the same standard in both directions.** Record promising, negative, and conflicting results. Neither excitement nor a skeptical narrative is a reason to overstate a conclusion.

## Finding new evidence

Use PubMed and original journal reports for published research; ClinicalTrials.gov and other appropriate registries for trial changes; NIA ITP for its experiments; regulators for approval and safety decisions. Use sponsor disclosures only for attributed program status or clearly labeled preliminary results.

Search snippets, podcasts, press releases, and social posts can supply leads. Read the primary source before changing a conclusion. Record when only an abstract was accessible.

Use [RESEARCH_INBOX.md](./RESEARCH_INBOX.md) for search strings, date windows, included/excluded records, open questions, and decisions. Search for corrections, retractions, replication, null findings, and adverse effects as well as positive results. A registered or unpublished study must not be counted as a completed efficacy trial.

For each review distinguish:

- **Search date and coverage:** when and where the search ran, and publication/update dates covered.
- **Publication date:** when the source appeared; distinguish online publication from issue date.
- **Evidence verification date:** when the exact claim was checked.
- **Status verification date:** when a registry, label, or program status was checked.

Never refresh dates for untouched claims or describe a targeted search as an exhaustive review.

## Proposed cadence

This is a maintenance plan, not an active automation.

- **Monthly:** screen the previous 45 days, overlapping to catch indexing delays; record no-change reviews as well as useful findings.
- **Quarterly:** recheck priority trial registries, important negative findings, safety signals, and high-impact conclusions; revisit the backlog.
- **Event-driven:** review a pivotal result, independent replication, correction/retraction, trial termination, or material safety/regulatory change.

Prioritize changes to meaningful outcomes and to the benefit-risk assessment. Important preclinical discoveries and preprints may enter the labeled research inbox without changing human-use conclusions. Funding rounds, predicted readout dates, and biological-age marketing do not by themselves justify a new efficacy conclusion.

## Updating existing material

A substantive aging-research conclusion must be synchronized across:

1. `PREVENTING_AGING_RESEARCH.md` for detail and citations.
2. `FINDINGS.md` for the concise synthesis.
3. `data/evidence-tracker.csv` for the corresponding structured record.
4. `WHATS_NEXT.md` when a trial, forecast, or watch item changes.

Keep the main findings readable in about five minutes. Put history and technical detail in the full report. In research updates, cite author, year, journal, PMID/DOI when available, and a direct source URL. Regulatory and registry sources need identifiers/URLs and access dates.

For supporting guides, retain the paired records:
- Personal care: `PERSONAL_CARE.md`, `data/personal-care-evidence.csv`, and its adversarial audit for material changes.
- General routine: `HUMAN_OPTIMIZATION.md`, `data/human-optimization-evidence.csv`, and its adversarial audit for material changes.

Brands inherit only evidence for the tested product/formulation. Keep condition treatment separate from universal routines and preserve clinician-directed medication and dental care.

### Legacy tracker migration

The current CSV schema and existing grades are preserved during this editorial cleanup. Do not mechanically convert them into the new framework or imply the old claims were rechecked.

When a claim is next reviewed, record context, outcome, result, and confidence in its narrative and existing `notes`/status fields; update the corresponding row and verification date. Split distinct populations/endpoints into separate rows where needed. A later schema migration can introduce dedicated columns with a documented mapping and validation. Preserve historical judgments in the review record.

## Before publishing

1. Inspect the diff and confirm the scope of the change.
2. For research changes, open the original sources and check that they support the exact wording.
3. Run `./scripts/verify-evidence.ps1` from PowerShell for the changed research files, or the full repository when doing a broad audit.
4. Run `git diff --check`, parse any changed CSV with `Import-Csv` or an equivalent parser, and check changed relative links.
5. State what was verified, which checks ran, and any unavailable tools or unresolved claims. Do not report skipped checks as passed.

The identifier verifier checks resolution, not whether the paper supports the claim. An editorial change that adds no clinical claim or research identifier needs diff and link checks; it must not be presented as a fresh scientific audit.
