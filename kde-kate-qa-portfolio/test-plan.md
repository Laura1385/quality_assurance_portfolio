Biot (FR), 2026-01-28

# Mini Test Plan – Kate Language Selection

## 1. Scope
This test plan covers the **language selection feature inside the Kate UI**.

The scope includes:
- Accessing language settings from Kate
- Display of available languages in the dropdown menu
- Ability to scroll the language list when it exceeds the visible area
- Selection of a language from the list
- Visual confirmation of the selected language

Expected scope:
Menus, dialogs, and settings UI labels should reflect the selected language
(immediately or after restart, depending on design).

---

## 2. Out of Scope
The following areas are explicitly excluded from this test plan:
- System-wide language changes
- Translation correctness or linguistic quality
- Persistence of language settings after system reboot
- Localization of plugins or external components

---

## 3. Test Types
The following test types are planned:
- **Smoke tests** – basic validation of the feature availability
- **Happy path tests** – standard user flows
- **Edge / Negative tests** – boundary conditions and abnormal behaviors

---

## 4. Test Environment
- Operating System: Kubuntu 26.04 (Snapshot – Dec 2025)
- Execution environment: Virtual Machine
- Virtualization tool: UTM
- Desktop environment: KDE Plasma
- Application under test: Kate (KDE text editor)
- Language: English

---

## 5. Entry Criteria
Testing can start when:
- Kate launches correctly
- The Settings menu is accessible
- The Language configuration screen is reachable

---

## 6. Exit Criteria
Testing is considered complete when:
- All planned test cases have been executed
- Test results have been recorded
- Identified issues have been documented and refined

---

## Traceability – Feature to Test Cases

Feature: Language selection in Kate UI

| Feature area | Test Case ID | Test Type | Notes |
|-------------|-------------|-----------|-----------|
| Access language settings | TC-SMOKE-01 | Smoke | -----------|
| Access language settings | TC-SMOKE-01-GH | Smoke | -----------|
| Change UI language | TC-HAPPY-01 | Happy Path | -----------|
| Dropdown scroll behavior | TC-EDGE-01 | Edge / Negative | Intermittent behavior observed |
| Dropdown scroll behavior | TC-EXP-01 | Exploratory | Intermittent behavior observed, conditions not yet isolated |