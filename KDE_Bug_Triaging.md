Biot January,13 2025 

# QA Portfolio – KDE Bug Triaging

## 1. Project Purpose
To understand and apply the KDE project's bug triaging guidelines.

## 2. Context
KDE is an open-source project with a structured bug management process.

## 3. Summary of Bug Triaging Guidelines (personal interpretation)
https://community.kde.org/Guidelines_and_HOWTOs/Bug_triaging#Bug_Janitor

The purpose of bug triaging in KDE is focused on improving the quality of bug reports, rather than solving the issues, in order to allow developers to start working on fixing the problem.

Bug triaging can involve different types of reports, such as bugs, feature requests, crash reports, and product-related issues.

No programming knowledge is required to perform this activity. However, a basic understanding of KDE software and the Linux environment is necessary.

The activity should be performed using the latest versions of KDE software, through the Bugzilla tool, and by following the provided bug triage flowchart.

## 4. Quality criteria for a Good Bug Report
Based on the KDE bug triaging guidelines and the triage flowchart, a bug report can be considered triage-ready when it is not a duplicate or an external issue and when the problem can be reproduced.

A low-quality bug report typically lacks essential information such as clear steps to reproduce the issue, a well-defined expected result, and a clear description of the actual behavior. Missing these elements makes it difficult to correctly assess and classify the issue.

Clearly written expected and actual results are fundamental to explain the nature of the problem and to understand whether the reported behavior represents a real defect or an intended functionality.

When important information is missing, such as the software version or the operating system, the appropriate action for a triager is to request additional details rather than making assumptions or proceeding with an incomplete assessment.

A good bug report should strike a balance between completeness and clarity: it should include all mandatory information while remaining focused and detailed enough to allow effective triaging and further handling.


## 5. Example of a Triaged Bug (simulated)
Title:
Broken link on KDE website support page

Description:
While browsing the KDE website, a link on the support page leads to a non-existing or incorrect destination, preventing users from accessing the expected information.

Steps to reproduce:
1. Open the KDE website.
2. Navigate to the Support section.
3. Click on the specified support link.

Expected result:
The link should redirect the user to the correct support resource.

Actual result:
The link redirects to a non-existing page or returns an error.

Environment:
- OS: macOS Ventura 13.7.8 (22H730)
- Website: KDE.org
- Version: latest available at observation date
- Observation date: 2026-01-14
- Language: English

Severity:
Medium

Priority:
Medium

Suggested status:
CONFIRMED

Reason for triaging:
The issue is easily reproducible and directly impacts user navigation, although it does not block core functionality. The bug is not related to external systems and contains sufficient information to be confirmed and properly classified.

## 6. QA Reasoning and Investigation Notes
While analyzing the Italian version of the KDE website, specifically the support section (https://kde.org/it/support/), I noticed that some sections were displayed in English. Before classifying this behavior as a bug, I considered the possibility of an intentional partial localization.

I then compared the Italian page with the English version and with other localized versions of the same page. This comparison revealed a recurring pattern: section titles are translated into the selected language, while the paragraph content remains in English regardless of the localization.

The consistent behavior across multiple languages indicates that the page structure supports localization, while the main content is either not included in the standard localization flow or managed separately. No indication such as “page being translated” or similar notices is currently provided to the user.

Based on these observations, the case was not classified as a bug, but rather as a potential localization or content communication issue, pending further clarification.


### Summary of QA Reasoning
While reviewing the localized versions of the KDE website, I observed that section titles were translated while paragraph content consistently remained in English across multiple languages.  
Before classifying this behavior as a bug, I evaluated its consistency and scope from a QA perspective.  
The recurring and systematic pattern indicated that the behavior was unlikely to be an isolated defect.  
This case helped me distinguish between internationalization (i18n) and localization (l10n): the website correctly supports multiple languages at a structural level, while the actual content localization appears to be partial.  
This analysis illustrates the importance of cautious interpretation and context evaluation during bug triaging.