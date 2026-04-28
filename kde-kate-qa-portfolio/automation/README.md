# Automation Layer — KDE Kate QA Portfolio

## Objective
This automation layer complements the manual QA workflow by introducing a minimal, structured smoke validation using Robot Framework.

The goal is not full UI automation, but rather to demonstrate:
- A clean and readable Robot Framework test structure
- Basic smoke validation that Kate can be launched
- A first automation layer that stays simple and stable in the VM environment

---

## Environment
- Host OS: macOS (Intel and Apple Silicon environments tested)
- OS: Kubuntu (UTM virtual machine)
- Application under test: KDE Kate
- Automation framework: Robot Framework

Tests are intended to run inside the Kubuntu VM where Kate is installed.

---

## Scope
Current automated coverage includes:
- Smoke validation that Kate can be launched
- Basic UI interaction to access the "Configure Language" dialog via AT-SPI (dogtail), as a feasibility check

Automation is intentionally limited to a small exploratory scope to validate feasibility.

---

## Project Structure
```text
automation/
├── tests/
│   └── test_kate_process.robot
├── libraries/
│   └── kate_keywords.py
├── resources/
│   ├── Kate.resource
│   └── CommonKate.resource
├── results/
├── requirements.txt
├── tool-spike-atspi.md
└── README.md
```

---

## Setup
```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

## Run Tests
From inside the automation/ folder:
```bash
cd kde-kate-qa-portfolio/automation
source .venv/bin/activate
robot -d results tests/test_kate_process.robot
```

From the project root (recommended to keep paths explicit):
```bash
source kde-kate-qa-portfolio/automation/.venv/bin/activate
robot -d kde-kate-qa-portfolio/automation/results kde-kate-qa-portfolio/automation/tests/test_kate_process.robot
```

---

## Limitation
Automation was explored using AT-SPI (dogtail) to validate feasibility on a Linux desktop application.

While basic interactions were successfully automated, the approach proved complex and less stable compared to standard web automation.

For this reason, automation was intentionally kept minimal, as Linux desktop UI automation does not seem to be a commonly required skill in the QA job market.

The main focus of this project remains on:
- test design
- manual testing
- clear and structured documentation

---