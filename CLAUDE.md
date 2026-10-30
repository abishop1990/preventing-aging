# CLAUDE.md — Preventing Aging Research Repo

## Project Purpose

This is a living research project about delaying or reversing biological aging and extending healthy life. Aging biology, human healthspan, and the evidence needed to translate between them are the primary scope. General health, diet/exercise, and personal-care routines are supporting guides. Apply the claim-specific appraisal and update workflow in EVIDENCE_MAINTENANCE.md; use RESEARCH_INBOX.md to record searches and decisions.

## Repo Structure

- `FINDINGS.md` — Front-page summary. The "what we know" distillation. Keep concise and current.
- `PREVENTING_AGING_RESEARCH.md` — Full research document. Deep dive with all citations, mechanisms, trial details.
- `HUMAN_OPTIMIZATION.md` — Umbrella cadence-based operating system for a generally healthy adult. Keep the universal core separate from optional goal-specific aids and diagnosed-condition care.
- `DIET_AND_EXERCISE.md` — Detailed operating and evidence guide for food and physical training; the umbrella guide should link here rather than reproduce every rationale.
- `PERSONAL_CARE.md` — Cadence-based evidence guide for recurring skin, hair/scalp, body, nail, foot, and oral care. Keep it organized as an operating routine rather than a review of a supplied product list; low-evidence options stay outside the scheduled core.
- `README.md` — Entry point and scope. Leads with findings, research, and evidence maintenance.
- `RESEARCH_INBOX.md` — Prioritized review queue, search plan, and decision records.
- `EVIDENCE_MAINTENANCE.md` — Canonical appraisal rules, review cadence, migration guidance, and publishing checks.
- `data/human-optimization-evidence.csv` — Structured evidence, cadence, scope, and exclusion decisions for the umbrella routine.
- `data/human-optimization-adversarial-audit.csv` — Independent challenge record for the claims admitted to or rejected from the umbrella routine.
- `data/personal-care-evidence.csv` — Structured personal-care evidence ratings and review dates.
- `data/personal-care-adversarial-audit.csv` — Independent challenge record and final disposition for current claims and candidate additions.

When updating findings, always update BOTH `FINDINGS.md` (summary) and `PREVENTING_AGING_RESEARCH.md` (detail). They must stay in sync.

When updating a personal-care conclusion, update `PERSONAL_CARE.md` and `data/personal-care-evidence.csv`; also update `data/personal-care-adversarial-audit.csv` when a claim is added, materially challenged, downgraded, or rejected. Do not add routine instructions for prescription drugs or periodontal treatment that conflict with a current label or clinician plan.

When updating the umbrella routine, update `HUMAN_OPTIMIZATION.md` and `data/human-optimization-evidence.csv` together; update `data/human-optimization-adversarial-audit.csv` when a claim is added, materially challenged, downgraded, or rejected. An intervention belongs in the universal core only when it is broadly applicable, tied to a meaningful outcome, supported by credible human evidence or evidence-based preventive guidance, and worth its burden. Keep condition-specific treatment and low-actionability testing outside the core even when the intervention can be effective in an indicated population.

## Research Methodology

### Agent Architecture

All research tasks MUST be performed by an Opus-class agent (or whatever is currently the most capable model). Use `model: "opus"` when spawning research agents.

The primary research agent should delegate to smaller/faster subagents (Sonnet or Haiku) for parallel evidence gathering. Pattern:

- **Opus agent**: Plans the research strategy, synthesizes findings, writes final content, makes judgment calls on evidence quality
- **Sonnet/Haiku subagents**: Fetch PubMed searches, pull specific paper abstracts, check ClinicalTrials.gov, gather raw data in parallel

This keeps costs efficient while maintaining quality on the synthesis and judgment layer.

### Evidence Verification

Assess each claim in its stated species/population, intervention, and outcome. Follow EVIDENCE_MAINTENANCE.md rather than the legacy combined scale.

Record result direction separately from confidence (HIGH / MODERATE / LOW / VERY LOW, with reasons). A rigorous null result is not automatically LOW; industry funding is a conflict to assess, not an automatic downgrade. Strong animal evidence does not establish human benefit. NO DIRECT EVIDENCE IDENTIFIED requires a documented search and does not mean ineffective. Use NOT ASSESSED when appraisal is incomplete.

Check study design and bias, uncertainty, independent replication, endpoint prespecification and multiplicity, adverse effects, relevance to the exact claim, and conflicts of interest. State which full papers or abstracts were inspected. Legacy grades remain pending reappraisal; do not silently relabel all rows.

### Fetching Evidence

Use available search, retrieval, or connected research tools to inspect primary sources, including:
- `https://pubmed.ncbi.nlm.nih.gov/?term=<query>&sort=date` — PubMed search
- `https://pubmed.ncbi.nlm.nih.gov/<PMID>/` — Specific paper abstracts
- ClinicalTrials.gov for trial status (may require alternative access if blocked)

For research, cite author, year, journal, PMID/DOI when available, and a direct source URL. For registry and regulatory facts, cite the canonical record and access date. Record publication date, search window, and claim/status verification dates separately.

## Writing Style

- Lead with the claim context and outcome-specific confidence, for example `> **Context: mice; outcome: lifespan; confidence: X (rationale).**`
- State what the data actually shows, not what we hope it shows
- Flag conflicts of interest explicitly
- State limitations precisely. A null primary endpoint, lack of replication, and manufacturer funding are different facts and should not be treated as interchangeable judgments.
- Apply equal scrutiny to positive, negative, and skeptical claims. Report estimates and uncertainty without forcing either an optimistic or pessimistic narrative.
- Keep FINDINGS.md readable in 5 minutes. Push detail to the full report.

## Key Context

- The user's framing is preventing aging mechanisms and preserving healthy life, not a general optimization catalog.
- Separate discoveries worth investigating from interventions justified for human use.
- Do not equate biomarkers, disease-specific clinical outcomes, and slowed biological aging.
- Regulatory status, funding incentives, evidence quality, and personal applicability are separate judgments.
- The October 2026 scope cleanup is not a new literature review. Preserve historical verification dates until the claims are checked.
- Review current sources before repeating trial statuses, forecasts, or claims that a field has no human results.
