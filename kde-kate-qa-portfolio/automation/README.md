# Automation Layer — KDE Kate QA Portfolio

## Objective
This automation layer complements the manual QA workflow by introducing a minimal, structured smoke validation using Python and pytest.

The goal is not full UI automation, but rather to demonstrate:
- Clean test structure with pytest
- Process-level validation of application launch
- Separation between manual QA reasoning and automated checks

---

## Environment
- OS: Kubuntu (UTM virtual machine)
- Application under test: KDE Kate
- Language: Python 3
- Test runner: pytest

---

## Scope
Current automated coverage includes:
- Smoke validation that Kate can be launched via CLI
- Process-level verification via CLI execution and system inspection

This keeps the setup simple and stable in the VM environment.

---

## Project Structure
```text
automation/
├── tests/
│ └── test_kate_process.py
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
pytest -q
```

---

## Future Improvements
- UI-level automation via accessibility layer (AT-SPI)
- CI pipeline integration
- Expanded functional coverage

---