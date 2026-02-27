# Update Impact Analysis – Dropdown Scroll Bug

## Objective
To determine whether the dropdown scroll issue is caused by the application or system components.

## Reference
Jira Bug ID: SCRUM-3

## Baseline (Pre-Update Environment)
- Date of observation: 2026-02-16
- Environment: Kubuntu 26.04 (Snapshot – Dec 2025)
- Kate Version: 25.12.1
- Reproducibility: the dropdown scroll issue is consistently reproducible on first dialog opening (mouse wheel / trackpad).

### Smoke Execution History
- Execution #1: Failed  
  Dropdown list does not allow mouse scroll, preventing selection of languages outside visible area.

- Execution #2: Passed (with workaround)  
  Language successfully selected (via keyboard type-to-select or mouse click).
  Scroll becomes responsive only on the second opening of the dialog (close & reopen).

Known issue tracked in Jira: SCRUM-3
Functional test execution continued to assess overall feature impact despite the known issue.

Evidence available in:
- [Pre-update log screenshot](../evidence/dropdown-scroll-pre-update-log.png)
- [Pre-update reproduction video](../evidence/dropdown-scroll-pre-update-reproduction.mp4)

---

## Step 01 – Kate-only Update
Execution date: 2026-02-26
Environment: Kate 25.12.1 → 25.12.2 (isolated upgrade)

Action:
- Update Kate package/version only using:
  sudo apt install --only-upgrade kate

Purpose:
- Determine whether the issue is caused by the Kate application itself.

Outcome:
- Kate-only upgrade does not resolve the issue.

Clarification (behavior trigger):
- Scroll becomes available on the second dialog opening (after closing and reopening the dialog), independently of any selection interaction.

---

## Step 02 – Full System Update (excluding Kate)
Execution date: 2026-02-27
Environment: Full system upgrade (all packages updated)

Action:
- Update all remaining system packages using:
  sudo apt full-upgrade

Purpose:
- Determine whether the issue is caused by system components (Qt, KDE libraries, etc.).

Outcome:
- Full system upgrade does not resolve the issue.
- Bug remains reproducible: scrolling is disabled on the first dialog opening and becomes available only after closing and reopening the dialog.

Post-update environment:
- Kate: 25.12.2
- Kernel: 6.19.0-6-generic

---

### Current Status
The issue remains reproducible after both:
- Isolated Kate-only upgrade (25.12.1 → 25.12.2)
- Full system upgrade (Kernel 6.19.0-6, Kate 25.12.2)

Scrolling is disabled on the first dialog opening and becomes available only after closing and reopening the dialog.

The behavior is consistent and reproducible.
