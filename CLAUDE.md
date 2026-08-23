# CLAUDE.md — Preventing Aging Research Repo

## Project Purpose

This is a living evidence project tracking both the science of preventing aging mechanisms and the broadly applicable practices that maintain human health, function, appearance, and energy. All claims must be verified against published literature or authoritative evidence-based guidance. The goal is evidence-based rigor, not hype.

## Repo Structure

- `FINDINGS.md` — Front-page summary. The "what we know" distillation. Keep concise and current.
- `PREVENTING_AGING_RESEARCH.md` — Full research document (~1,500+ lines, 23 sections). Deep dive with all citations, mechanisms, trial details.
- `HUMAN_OPTIMIZATION.md` — Umbrella cadence-based operating system for a generally healthy adult. Keep the universal core separate from optional goal-specific aids and diagnosed-condition care.
- `DIET_AND_EXERCISE.md` — Detailed operating and evidence guide for food and physical training; the umbrella guide should link here rather than reproduce every rationale.
- `PERSONAL_CARE.md` — Cadence-based evidence guide for recurring skin, hair/scalp, body, nail, foot, and oral care. Keep it organized as an operating routine rather than a review of a supplied product list; low-evidence options stay outside the scheduled core.
- `README.md` — Entry point. Points to FINDINGS.md and the full report.
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

Every claim in the report must have an evidence quality rating:

- **HIGH** — Replicated human RCT data, or definitive NIA ITP multi-site animal data
- **MODERATE** — Strong animal data + early human trials with positive signals, or strong epidemiology
- **LOW** — Single studies, unreplicated, human trials that missed primary endpoints, or manufacturer-funded only
- **DEBUNKED** — Contradicted by subsequent evidence

When verifying a claim, check:
1. Has the original finding been independently replicated?
2. Was it tested by the NIA ITP (for mouse lifespan claims)?
3. Have human RCTs met their PRIMARY endpoints (not just secondary/exploratory)?
4. Are there conflicts of interest (company-funded studies, author equity)?
5. Have meta-analyses been published? What do they conclude?

### Fetching Evidence

Use the `mcp__fetch__fetch` tool to pull live data from:
- `https://pubmed.ncbi.nlm.nih.gov/?term=<query>&sort=date` — PubMed search
- `https://pubmed.ncbi.nlm.nih.gov/<PMID>/` — Specific paper abstracts
- ClinicalTrials.gov for trial status (may require alternative access if blocked)

Always cite: Author, Year, Journal, PMID.

## Writing Style

- Lead with the evidence rating (blockquote format: `> **Evidence quality: X.**`)
- State what the data actually shows, not what we hope it shows
- Flag conflicts of interest explicitly
- When a claim is weak, say so directly — "primary endpoint null," "not replicated," "manufacturer-funded"
- No hype. No hedging toward optimism. If the evidence is negative, report it as negative.
- Keep FINDINGS.md readable in 5 minutes. Push detail to the full report.

## Key Context

- The supplement industry has wildly outpaced the evidence (NMN, resveratrol, fisetin)
- Almost no anti-aging drug has met a primary endpoint in a human trial as of March 2026
- Exercise remains the strongest evidence-based intervention by a wide margin
- Mouse-to-human translation has been the consistent failure point
- The user's framing is "preventing aging mechanisms," not "immortality"
