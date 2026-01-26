Biot January,26 2025 

# QA Portfolio – KDE Kate Analysis

## 1. Context and Feature
Environnment: 
- Virtual machine on UTM application
- OS: macOS Ventura 13.7.8 (22H730)
- Version: Kubuntu 26.4 - Snapshot - Dec 2025 (latest available at observation date)
- Observation date: 2026-01-20
- Language: English

Application: Kate (KDE text editor)
Feature: Language selection in Kate
The language selection feature allows the user to change the UI language of Kate.
This impacts menus, labels, dialogs, and other textual elements of the application.

Context: User changes the application language from the settings menu.
This feature is critical for accessibility and international users.

## 2. Haappy path
Main flow:
1. User opens Kate.
2. User navigates to Settings → Configure Language...
3. A dropdown list of available languages is displayed in Primary Language menu.
4. The user scrolls the dropdown list if needed.
5. The user selects a language.
6. The UI updates to reflect the selected language.

### Assumptions:
- The list of available languages can be longer than the visible area.
- The dropdown component supports scrolling without lag
- Input devices (mouse, trackpad, keyboard) allow scrolling inside the dropdown.
- The arrows on top and bottom of the list can allow to visualize the hide part of the list.

### Risks / edge cases:
- The language list does not scroll when it exceeds the visible area.
- The selected language is not applied immediately.
- The dropdown behaves differently depending on window size or screen resolution.
- Input methods behave inconsistently.

### Acceptance criteria:
- The language dropdown must allow scrolling when the list exceeds visible space.
- The user must be able to reach and select any available language.
- The selection must be visually confirmed.
- No UI elements should become unreachable.