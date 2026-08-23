# Evidence Maintenance

This repository is a living reference, not a stream of longevity news. Keep the front-page conclusions stable unless new primary evidence changes them.

## Rules for Updates

1. **Separate stable evidence from time-sensitive status.** Trial recruitment, company programs, approvals/clearances, and projected results dates are time-sensitive. Mark them with a `last verified` date and cite the canonical source (trial registry, regulator, or sponsor disclosure).
2. **Use the outcome paper, not a protocol or design paper, for results.** When a trial reports, cite the publication reporting the endpoint. Retain protocol citations only for design details.
3. **Name the endpoint precisely.** Do not turn a composite endpoint into a component outcome, a diagnostic-performance result into a patient-outcome result, or a biomarker change into rejuvenation.
4. **Record scope and conflicts.** State the studied population, follow-up, primary endpoint, and material company funding, employment, equity, or author conflicts.
5. **Sync the layers.** A changed conclusion must be reflected in `FINDINGS.md`, `PREVENTING_AGING_RESEARCH.md`, and `data/evidence-tracker.csv`.
6. **Do not rely on search snippets or press coverage for core claims.** Prefer PubMed/PMC, NIA ITP, ClinicalTrials.gov, FDA/EMA, and the original paper. A company statement can establish a company-program status but not efficacy.
7. **Keep personal-care brands separate from interventions.** A formula or device inherits only evidence generated for that exact product. Update `PERSONAL_CARE.md` and `data/personal-care-evidence.csv` together, record material challenges or reversals in `data/personal-care-adversarial-audit.csv`, and recheck current labels/formulas before a purchase decision.
8. **Prescriber instructions control.** Tretinoin, compounded hair-loss medication, and periodontal adjuncts must be described as clinician-directed. The repository can summarize evidence and monitoring questions; it must not silently replace the prescription or dental plan.
9. **Protect the universal baseline.** Update `HUMAN_OPTIMIZATION.md` and `data/human-optimization-evidence.csv` together, and record material challenges in `data/human-optimization-adversarial-audit.csv`. Do not promote a condition treatment, surrogate-only intervention, optional performance aid, or low-actionability test into the general routine merely because it has a mechanism or a positive small trial.
10. **Separate evidence strength from universality.** An intervention can have HIGH evidence for a narrow goal and still be OPTIONAL or EXCLUDED from the healthy-adult core. Record both judgments.

## Review Cadence

- **Focused review:** October 2026, unless a material peer-reviewed result appears earlier.
- **Watch only:** POLYCAD, AKG ABLE, ER-100, TRIAD, AI-originated therapies with randomized human outcomes, and FDA biomarker-qualification developments.
- **Do not update merely for a funding round, preprint, target-discovery announcement, or biological-age-clock marketing claim.**

## Before Publishing a Research Update

1. Run `./scripts/verify-evidence.ps1` from PowerShell.
2. Verify each changed claim against the original source and confirm the source supports the exact wording.
3. Update `last_verified` in the tracker for time-sensitive rows.
4. Run `git diff --check` and parse `data/evidence-tracker.csv` with `Import-Csv`.

For personal-care updates, also parse `data/personal-care-evidence.csv` and `data/personal-care-adversarial-audit.csv`, confirm each audit row has a final disposition, and verify current product or drug labels when a claim depends on formulation, concentration, market, or regulatory status.

For umbrella-routine updates, also parse `data/human-optimization-evidence.csv` and `data/human-optimization-adversarial-audit.csv`, verify that every CORE row has a broadly applicable outcome, and challenge each new inclusion against the best contrary evidence before publishing.

The verifier checks whether cited PMIDs and NCT identifiers resolve. It does not establish that a source supports a claim; that remains a human review task.
