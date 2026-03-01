Biot (FR), 2026-02-26

# Language dropdown does not scroll on first opening (scroll enabled only after dialog is reopened) – Primary & Fallback

## 1. Environment
Host OS: macOS Ventura 13.7.8 (22H730)
Virtualization: UTM (QEMU)
Guest OS: Kubuntu 26.04 (snapshot, Dec 2025)
Application: Kate
Version tested: 25.12.1
UI Language: English
Test date: 2026-02-15

Also reproduced on:
- Kate 25.12.2 (post isolated application upgrade)
- Kate 25.12.2 after full system upgrade (Kernel 6.19.0-6-generic)

## Steps to reproduce :
1. Launch Kate
2. Open **Settings → Configure Language…**
3. Open **Primary Language** dropdown (first opening in this dialog session)
4. Try to scroll with mouse wheel / trackpad 
5. Click outside the **Primary Language** dropdown to close it
6. Reopen **Primary Language** dropdown again and try to scroll
7. Close Kate
8. Launch Kate
9. Open **Settings → Configure Language…**
10. Click on **Add Fallback Language**
11. Open **Fallback Language** dropdown (first opening in this dialog session)
12. Try to scroll with mouse wheel / trackpad 
13. Click outside the **Fallback Language** dropdown to close it
14. Reopen **Fallback Language** dropdown again and try to scroll

## Expected result:
- The dropdown should allow scrolling on first opening of the dialog without requiring additional interaction.

## Actual result:
- On first dialog opening in a session, the dropdown list does not scroll. Navigation is limited to visible entries and items outside the visible area are not reachable.
- After closing and reopening the dialog, scrolling works normally.
- After restarting the application, the issue reproduces again on the first dialog opening.

## Impact:
- Users cannot reach languages outside the visible area on first opening, which may block language selection.

## Reproducibility
- Reproducible 100% on first dialog opening after each application restart.

## Version tested
- 25.12.1 (pre-update baseline)
- 25.12.2 (post isolated application upgrade)
- 25.12.2 (post full system upgrade – Kernel 6.19.0-6-generic)

## Update status
Revalidated after:
- Isolated Kate-only upgrade (25.12.1 → 25.12.2)
- Full system upgrade (Kernel 6.19.0-6-generic, Kate 25.12.2)

Issue persists unchanged in all environments tested.

## Link Jira
[SCRUM-3](https://lauraproto.atlassian.net/browse/SCRUM-3)

## Discovery context:
- Initially observed during execution of TC-SM-AccessSettings-01.
- Further analyzed during exploratory session TC-EXP-DropdownScroll-01.
- Same behavior observed in both Primary and Fallback dropdown.

## Bugzilla Cross-Reference - KDE Bug 471293 (master)

### Existing Report Identified
During investigation, an existing report was identified in KDE Bugzilla:
- **Bug ID:** 471293 (master)
- **Product:** frameworks-kxmlgui
- **Summary:** Language select dialog overflows display
- **Status:** CONFIRMED
- **Duplicates:** 462057, 497462, 503018

Multiple Bugzilla entries (e.g., 494931, 475437) describe partial manifestations of the same scroll initialization issue (mouse wheel not working, scroll arrows not visible, list not scrollable).

The observed behavior in this project consolidates these symptoms into a single reproducible flow:
- First dialog opening → scroll inactive
- Dialog closed
- Reopened → scroll active

This suggests a common UI initialization defect.
The issue is reproducible across multiple platforms according to Bugzilla entries (Windows, Arch Linux, Other Linux).

### Component Ownership
Although the issue is reproduced in Kate, the Bugzilla entry is filed under **frameworks-kxmlgui** (KSwitchLanguageDialog), indicating a framework-level UI issue rather than an application-specific one.

### Behavioral Match
The reproduced behavior is consistent with the Bugzilla report:
- Scroll controls / scrolling do not appear or work on first opening.
- After closing/dismissing and reopening the list/dialog, scrolling becomes available.

### Triage Decision
No new bug report was created to avoid duplication.
The issue is tracked under [KDE Bug 471293](https://bugs.kde.org/show_bug.cgi?id=471293)