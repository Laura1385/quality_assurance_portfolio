# Tool Spike – AT-SPI feasibility for Kate automation

## Objective
Check whether Kate UI elements can be inspected and accessed through the Linux accessibility layer (AT-SPI), before selecting a Robot Framework automation approach.

## Context
Kate is a desktop application running on Kubuntu. Selenium is not suitable because the application is not web-based.

## Tools used
- Accerciser
- Python
- pyatspi
- dogtail

## Steps performed
1. Installed and opened Accerciser.
2. Opened Kate.
3. Verified that Kate appears in the accessibility tree.
4. Opened Settings → Configure Language manually.
5. Verified that the Configure Language dialog exposes readable elements.
6. Used dogtail from Python to identify Kate as an application object.

## Evidence
Kate was visible in the accessibility tree.
The Configure Language dialog exposed labels and controls.
Dogtail was able to retrieve the Kate application object.

## Conclusion
AT-SPI appears suitable for limited UI interaction, particularly for dialogs such as "Configure Language".