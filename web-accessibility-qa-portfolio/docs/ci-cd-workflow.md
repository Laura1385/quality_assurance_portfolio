# Continuous Integration Workflow

## Scope
This document describes the Continuous Integration workflow implemented for the project.
It explains how GitHub Actions, protected branches and required status checks were combined to ensure that automated tests are executed before code is merged into the main branch.

Technical details about the GitHub Actions implementation are documented separately in `docs/github-actions-workflow.md`.

## Initial implementation
Initially, GitHub Actions was configured to execute the Robot Framework test suite after every push to the `main` branch.
This provided immediate feedback about test failures, but it did not prevent unstable code from reaching the main branch.
As a result, the CI pipeline acted as a notification mechanism rather than as a protection mechanism.

Developer
     │
git push main
     │
     ▼
GitHub Actions
     │
 ┌───┴────┐
 │        │
✅ Pass   ❌ Fail
          │
          ▼
    Broken code may already be in main

## Why GitHub Actions Alone Was Not Enough
GitHub Actions automatically executes the test suite and reports the outcome of each execution.
The initial implementation successfully automated test execution, but it did not yet protect the main branch.

Whenever a commit was pushed directly to `main`, the workflow started only after the branch had already been updated. A failing pipeline immediately highlighted the problem, but unstable code had already become part of the project's baseline.

As a result, the CI pipeline provided visibility into failures rather than preventing them.

To transform automated testing into an effective quality gate, the development workflow needed to be redesigned by introducing branch protection and required status checks.

## Protecting the Main Branch
The objective was to ensure that automated tests became a mandatory validation step before changes could reach the main branch.

To achieve this, the repository workflow was updated by combining feature branches, pull requests, branch protection rules and required status checks.

Developer
     │
     ▼
Feature branch
     │
     ▼
Pull Request
     │
     ▼
GitHub Actions
     │
     ▼
 Quality Gate
     │
 ┌───┴────┐
 │        │
✅ Pass   ❌ Fail
 │        │
 ▼        ▼
Merge   Merge blocked

### Repository Configuration
The repository was configured to ensure that every change is validated before it can be merged into the main branch.

The following repository rules were introduced as part of the Continuous Integration workflow.

| Setting | Configuration | Purpose |
|----------|---------------|---------|
| Branch protection | Default branch (`main`) | Protect the project's primary branch |
| Pull requests | Required | Prevent direct updates to `main` |
| Required approvals | 0 | Suitable for a single-maintainer repository |
| Conversation resolution | Enabled | Ensure review discussions are resolved before merging |
| Required status checks | `robot-tests` | Allow merges only after successful automated tests |
| Branch up to date | Enabled | Re-run validation against the latest version of `main` |
| Force pushes | Blocked | Preserve branch history |
| Branch deletion | Restricted | Prevent accidental deletion |

Although this repository is maintained by a single developer, the same validation process commonly used in collaborative software projects was adopted.
This ensures that every change follows a consistent verification workflow before becoming part of the project's baseline.

## Development workflow
Once the repository configuration was in place, every change followed the same validation process before becoming part of the main branch.

The resulting workflow consists of the following steps:
1. Create a feature branch from `main`.
2. Implement and test the changes locally.
3. Commit and push the feature branch.
4. Open a pull request targeting `main`.
5. Automatically execute the Robot Framework test suite through GitHub Actions.
6. Merge the pull request only after all required status checks have passed.

Feature Branch
       │
       ▼
Local Development
       │
       ▼
Commit & Push ◄──── Fix if tests fail
       │                   ▲
       ▼                   │
Pull Request ─────────► GitHub Actions
                 │
                 ▼
             Merge after
         successful checks
                 │
                 ▼
               Main

## Benefits

| **Initial workflow**              | **Improved workflow**          |
| --------------------------------- | ------------------------------ |
| Direct pushes to `main`           | Pull requests required         |
| Tests executed after merge        | Tests executed before merge    |
| CI reported failures              | CI prevents unvalidated merges |
| Main branch could become unstable | Main branch always validated   |


### Why this matters for QA
Automated tests provide value only when they are integrated into the software development workflow.

Executing tests after code has already reached the main branch helps identify defects, but it does not prevent unstable changes from becoming part of the project's baseline.

By combining automated testing with pull requests, protected branches and required status checks, the test suite becomes a quality gate rather than a reporting mechanism.

This approach increases confidence in every change merged into the main branch and improves the overall reliability of the automated testing process.

## Lessons learned
This implementation highlighted several important aspects of Continuous Integration:
- Automated test execution alone does not create an effective Continuous Integration workflow.
- GitHub Actions executes the pipeline, but branch protection rules determine whether the pipeline actually protects the repository.
- Pull requests and required status checks transform automated tests from a notification mechanism into a quality gate.
- Designing the development workflow is as important as designing the automated tests themselves.

## Future Improvements
- Extend the pipeline to include API test execution.
- Publish Robot Framework reports through GitHub Pages.