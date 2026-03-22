# CLAUDE.md — Preventing Aging Research Repo

## Project Purpose

This is a living research document tracking the science of preventing aging mechanisms. All claims must be verified against published literature (PubMed, NIA ITP, ClinicalTrials.gov). The goal is evidence-based rigor, not hype.

## Repo Structure

- `FINDINGS.md` — Front-page summary. The "what we know" distillation. Keep concise and current.
- `PREVENTING_AGING_RESEARCH.md` — Full research document (~1,500+ lines, 23 sections). Deep dive with all citations, mechanisms, trial details.
- `README.md` — Entry point. Points to FINDINGS.md and the full report.

When updating findings, always update BOTH `FINDINGS.md` (summary) and `PREVENTING_AGING_RESEARCH.md` (detail). They must stay in sync.

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
