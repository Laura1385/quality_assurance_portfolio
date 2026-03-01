Biot (FR), 2026-01-26

# QA Portfolio – KDE Kate Analysis

## 1. Project Context

### Environment
- Host OS: macOS Ventura 13.7.8 (22H730)
- Virtualization: UTM (QEMU)
- Guest OS: Kubuntu 26.04 (snapshot, Dec 2025)
- Application: Kate
- Version tested: 25.12.1
- Observation date: 2026-01-20
- UI Language: English

---

## 2. Feature Analysis

# The Language Selection

### Description
The language selection feature allows the user to change the UI language of Kate.
This impacts menus, labels, dialogs, and other textual elements of the application.

### Expected Scope
- Menus, dialogs, and settings UI labels should reflect the selected language.
- The language change should be applied either immediately or after restart, depending on the intended design (to be clarified).

### Context
The user changes Kate’s UI language via the Settings menu.
This feature supports international users and impacts usability and accessibility.

### Happy Path – Main Flow
1. User opens Kate.
2. User navigates to Settings → Configure Language…
3. A dropdown list of available languages is displayed in Primary Language menu.
4. If the list exceeds the visible area, the user can navigate the list (e.g., scrolling).
5. The user selects a language.
6. The UI updates to reflect the selected language.

### Assumptions:
- The list of available languages can be longer than the visible area.
- The dropdown component supports scrolling without lag.
- Input devices (mouse, trackpad, keyboard) allow scrolling inside the dropdown.
- The dropdown provides a mechanism to access items outside the visible area (scroll wheel, touchpad, keyboard navigation, etc.).

### Risks / edge cases:
- The language list does not allow navigation/scrolling when it exceeds the visible area.
- The selected language is not applied immediately or requires restart without being communicated.
- The dropdown behaves differently depending on window size, screen resolution, or display scaling.
- Input methods behave inconsistently (mouse wheel vs trackpad vs keyboard).

### Acceptance criteria:
- The language dropdown allows navigation/scrolling when the list exceeds visible space.
- The user can reach and select any available language.
- The selection is visibly confirmed.
- No UI elements become unreachable.
- The user can navigate the list via keyboard when applicable.
- Navigation does not freeze the UI or unexpectedly lose focus.

### Configuration Storage – Restart Confirmation Suppression
The "Do not show this message again" preference is stored in:

~/.config/katerc

Modifying or removing the corresponding configuration entry restores the restart confirmation dialog upon the next language change
This was verified during HP6 execution (PRE update baseline).

## Known Issue Identified During Testing
During structured and exploratory testing activities, a defect was identified in the Language Selection feature.
On the first opening of the Configure Language dialog, the dropdown list does not allow scrolling (mouse wheel / trackpad), limiting access to items outside the visible area.
Scrolling becomes available only after closing and reopening the dialog.

The issue is documented and tracked in Jira: SCRUM-3.

---

## External Contribution – KDE Bug 471293

During investigation of the dropdown scroll issue (SCRUM-3), an existing KDE Bugzilla entry was identified:

- KDE Bug 471293 (frameworks-kxmlgui) – https://bugs.kde.org/show_bug.cgi?id=471293 
- Product: frameworks-kxmlgui
- Status: CONFIRMED

After cluster analysis of related duplicate reports (462057, 497462, 503018), the issue was confirmed as reproducible in the current environment (Kubuntu 26.04, Kate 25.12.2, UTM virtual machine).

A structured confirmation comment was submitted on 2026-03-01 to the existing bug report, including:

- Updated 2026 environment details
- Cross-platform context (Linux, Windows, Arch Linux)
- Reproducibility after application restart
- Post-update validation

No new bug report was created to avoid duplication.

This contribution reinforces the existing bug report with updated reproducibility data.

---

## 3. Accessibility Considerations (Future Extension)