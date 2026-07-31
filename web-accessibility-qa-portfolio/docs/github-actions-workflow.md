# GitHub Actions Workflow for OpenCart

## Purpose
The GitHub Actions workflow automatically executes the Robot Framework test suite in a clean and reproducible environment.

## Workflow Location
The workflow is stored at the root of the repository:
`.github/workflows/robot-tests.yml`

The repository contains multiple QA projects, while this workflow currently targets the OpenCart project located in:
`web-accessibility-qa-portfolio`

## Triggers
The workflow runs:
- on pushes to the `main` and `develop` branches;
- when a pull request is opened or updated.

## Execution Environment
GitHub Actions creates a temporary Ubuntu runner for each execution.

The runner:
1. checks out the repository;
2. installs Python 3.12;
3. installs the dependencies from `requirements.txt`;
4. builds and starts the local OpenCart environment with Docker Compose;
5. waits until OpenCart is available on `http://localhost:8888`;
6. executes the Robot Framework test suite using headless Chrome;
7. uploads the generated reports as a workflow artifact.

The temporary runner is deleted after the workflow finishes.

## Browser Configuration
Local execution uses the default browser configuration:
`${BROWSER_OPTIONS}    ${NONE}`

The CI workflow overrides this variable and starts Chrome in headless mode with a desktop viewport:

```text
add_argument('--headless=new')
add_argument('--window-size=1366,768')
add_argument('--no-sandbox')
add_argument('--disable-dev-shm-usage')
```

The desktop viewport is required because, in headless mode, Chrome may otherwise render the responsive mobile layout. This changes the keyboard navigation path used by the accessibility tests.

Using browser options instead of modifying the test keywords allows the same Robot Framework implementation to run unchanged both locally and in GitHub Actions.

## Test Reports
During CI execution, Robot Framework generates reports in:
`web-accessibility-qa-portfolio/automation/robot-framework/results/ci-reports/`

The reports are uploaded to GitHub Actions as an artifact named:
`robot-results`

The artifact may contain:
- `report.html`
- `log.html`
- `output.xml`
- screenshots generated when tests fail

The reports are available from the individual workflow run under the **Artifacts** section.
They are not committed to the repository.

## Local Execution
The complete local suite can still be executed with:

```bash
cd web-accessibility-qa-portfolio/automation/robot-framework
robot -d results tests
```

Local reports remain in:
`automation/robot-framework/results/`

## Current Status
The complete Robot Framework test suite executes successfully in GitHub Actions using Docker, headless Chrome and artifact publication for test reports.

The workflow has been validated through multiple successful executions.

## Related Documentation
This document focuses on the technical implementation of the GitHub Actions workflow.

The Continuous Integration workflow, branch protection strategy, pull request process and quality gate configuration are documented in `docs/ci-cd-workflow.md`.