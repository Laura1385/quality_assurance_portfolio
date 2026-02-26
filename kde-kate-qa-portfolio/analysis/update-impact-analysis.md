# Update Impact Analysis – Dropdown Scroll Bug

## Objective
To determine whether the dropdown scroll issue is caused by the application or system components.

## Reference
Jira Bug ID: SCRUM-3

## Baseline (Pre-Update Environment)
- Date of observation: 2026-02-16
- Environment: Kubuntu 26.04 (Snapshot – Dec 2025)
- Kate Version: 25.12.1
- Reproducibility: the dropdown scroll issue is consistently reproducible when using mouse wheel interaction.

### Smoke Execution History
- Execution #1: Failed  
  Dropdown list does not allow mouse scroll, preventing selection of languages outside visible area.

- Execution #2: Passed (with workaround)  
  Language successfully selected using keyboard letter navigation.  
  The dropdown becomes responsive once keyboard interaction is triggered.

Known issue tracked in Jira: SCRUM-3
Functional test execution continued to assess overall feature impact despite the known issue.

Evidence available in:
- [Pre-update log screenshot](../evidence/dropdown-scroll-pre-update-log.png)
- [Pre-update reproduction video](../evidence/dropdown-scroll-pre-update-reproduction.mp4)

---

## Step A – Kate-only Update

Action:
- Update Kate package/version only using:
  sudo apt install --only-upgrade kate

Purpose:
- Determine whether the issue is caused by the Kate application itself.

Outcome:
- (To be documented after test execution)

---

## Step B – System Update (excluding Kate)

Action:
- Update remaining system packages while keeping Kate version fixed.

Purpose:
- Determine whether the issue is caused by system components (Qt, KDE libraries, etc.).

Outcome:
- (To be documented after execution)

---

### Current Status

The issue remains reproducible in the pre-update baseline environment.
Further investigation will determine whether the root cause lies in system-level components or within the Kate application itself.
