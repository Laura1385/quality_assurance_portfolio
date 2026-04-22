## KDE Kate – QA Portfolio Project
This project documents a structured QA process applied to **Kate (KDE text editor)**.

It focuses on manual testing, functional analysis, and bug reporting, with a minimal automation layer added as a final validation step.

### Scope of the project
The project covers the following QA activities:

- Functional analysis of a selected Kate feature
- Identification of expected behavior and edge cases
- Design of manual test cases
- Execution of test cases in a controlled environment
- Bug identification and refinement
- Structured bug reporting (expected vs actual, impact, reproducibility)

Automation is **not the primary focus** of this project; the emphasis is on **test analysis, test design, and structured bug investigation** applied to a real application.

### Feature under test
- Application: **Kate (KDE)**
- Area: User Interface / Settings
- Feature: Language selection inside Kate

During test execution, a **UI failure** was identified related to the language selection dropdown not scrolling as expected.

## Testing Strategy
Testing combined structured test cases with exploratory testing.

The approach included:

- Smoke testing to verify that the feature is accessible and functional
- Happy path testing to validate standard user workflows
- Edge case testing to explore boundary conditions
- Exploratory testing to investigate unexpected UI behavior

## Key Findings
During testing a UI defect was identified in the language selection dialog.

The dropdown list was not scrollable on the first opening of the configuration dialog, preventing access to languages outside the visible area.

The issue was reproduced in the testing environment and confirmed against an existing KDE Bugzilla report.

### Tools and artifacts
- Documentation: Markdown files within this repository
- Test management: **SquashTM**
- Test execution: Manual testing (primary) and automated checks with **Robot Framework**
- Internal bug tracking simulation: **Jira**
- Bug tracking reference: **KDE Bugzilla** 
- Bug reporting guidelines: **KDE guidelines**

### Project structure
- `analysis/` – Functional analysis and feature understanding  
- `test-design/` – Manual test cases and traceability  
- `bug-report/` – Bug description and refinement  
- `evidence/` – Screenshots or notes collected during testing  
- `automation/` –  Minimal automation using Robot Framework to validate application launch

### What this project demonstrates
- Practical QA thinking applied to a real application
- Ability to analyze software behavior beyond “happy paths”
- Clear distinction between analysis, test design, and execution
- Professional bug documentation aligned with open-source practices

### Future Extensions
- Accessibility considerations related to language switching
  (screen readers compatibility, keyboard navigation, UI scaling behavior)
- Potential expansion to additional Kate features
