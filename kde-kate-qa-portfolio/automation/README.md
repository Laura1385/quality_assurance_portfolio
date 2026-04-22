# Automation Layer — KDE Kate QA Portfolio

## Objective
This automation layer complements the manual QA workflow by introducing a minimal, structured smoke validation using Robot Framework.

The goal is not full UI automation, but rather to demonstrate:
- A clean and readable Robot Framework test structure
- Basic smoke validation that Kate can be launched
- A first automation layer that stays simple and stable in the VM environment

---

## Environment
- Host OS: macOS Tahoe 26.4.1 (Apple Silicon)
- OS: Kubuntu (UTM virtual machine)
- Application under test: KDE Kate
- Automation framework: Robot Framework

Tests are intended to run inside the Kubuntu VM where Kate is installed.

---

## Scope
Current automated coverage includes:
- Smoke validation that Kate can be launched from the system
- Process-level verification that a Kate process is running

This keeps the setup simple and stable before moving to UI-level automation.

---

## Project Structure
```text
automation/
├── tests/
│ └── test_kate_process.robot
├── requirements.txt
└── README.md
```

---

## Setup
```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

## Run Tests
```bash
robot test_kate_process.robot
```

---

## Notes
This first automated test does not interact with the Kate UI yet.
It only verifies that the application can be started and detected as a running process.

---

## Future Improvements
- UI-level automation via Linux desktop accessibility tooling
- Better process cleanup after execution
- Expanded functional coverage

---