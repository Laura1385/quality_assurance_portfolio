Biot (FR), 2026-01-26

# QA Portfolio – KDE Kate Analysis

## 1. Context and Feature
Environnment: 
- Host OS: macOS Ventura 13.7.8 (22H730)
- Virtualization: UTM (QEMU)
- Guest OS: Kubuntu 26.04 (snapshot, Dec 2025)
- Observation date: 2026-01-20
- Language: English

Application: Kate (KDE text editor)
Feature: Language selection in Kate

The language selection feature allows the user to change the UI language of Kate.
This impacts menus, labels, dialogs, and other textual elements of the application.

Expected scope:
- Menus, dialogs, and settings UI labels should reflect the selected language.
- The language change should be applied either immediately or after restart, depending on the intended design (to be clarified).

Context: The user changes Kate’s UI language via the Settings menu.
This feature supports international users and impacts usability and accessibility of the application.

## 2. Happy path
Main flow:
1. User opens Kate.
2. User navigates to Settings → Configure Language...
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