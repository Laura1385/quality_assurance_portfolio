## KDE Kate – QA Portfolio Project

This project is a hands-on QA portfolio exercise focused on **manual testing, functional analysis, and bug reporting** applied to a real open-source application: **Kate (KDE text editor)**.

The goal of this project is to demonstrate a **structured QA workflow**, from feature analysis to bug identification and documentation, acting as an external QA contributor within the KDE ecosystem.

### Scope of the project

The project covers the following QA activities:

- Functional analysis of a selected Kate feature
- Identification of expected behavior and edge cases
- Design of manual test cases
- Execution of test cases in a controlled environment
- Bug identification and refinement
- Structured bug reporting (expected vs actual, impact, reproducibility)

Automation is **not the primary focus** of this project; the emphasis is on **QA reasoning, clarity, and methodology**.

### Feature under test

- Application: **Kate (KDE)**
- Area: User Interface / Settings
- Feature: Language selection inside Kate

During test execution, a **UI failure** was identified related to the language selection dropdown not scrolling as expected.

### Tools and artifacts

- Test management: **SquashTM**
- Bug tracking reference: **KDE Bugzilla / KDE guidelines**
- Test execution: Manual testing
- Documentation: Markdown files within this repository

### Project structure

- `analysis/` – Functional analysis and feature understanding  
- `test-design/` – Manual test cases and traceability  
- `bug-report/` – Bug description and refinement  
- `evidence/` – Screenshots or notes collected during testing  

### What this project demonstrates

- Practical QA thinking applied to a real application
- Ability to analyze software behavior beyond “happy paths”
- Clear distinction between analysis, test design, and execution
- Professional bug documentation aligned with open-source practices