Biot January,26 2025 

# QA Portfolio – KDE Kate Analysis

Kubuntu version: 26.4 - Snapshot - Dec 2025

Feature: Language selection in Kate
The language selection feature allows the user to change the UI language of Kate.
This impacts menus, labels, dialogs, and other textual elements of the application.

Application: Kate (KDE text editor)

Context: User changes the application language from the settings menu.

Main flow:
1. Main flow:
1. User opens Kate.
2. User navigates to Settings → Configure Language...
3. A dropdown list of available languages is displayed in Primary Language menu.
4. The user scrolls the dropdown list if needed.
5. The user selects a language.
6. The UI updates to reflect the selected language.

Assumptions:
- The list of available languages can be longer than the visible area.
- The dropdown component supports scrolling.
- Input devices (mouse, trackpad) allow scrolling inside the dropdown.

Risks / edge cases:
- The language list does not scroll when it exceeds the visible area.
- The selected language is not applied immediately.
- The dropdown behaves differently depending on window size or screen resolution.
- Input methods (mouse wheel vs trackpad) behave inconsistently.

Acceptance criteria:
- The language dropdown must allow scrolling when the list exceeds visible space.
- The user must be able to reach and select any available language.
- The selection must be visually confirmed.
- No UI elements should become unreachable.