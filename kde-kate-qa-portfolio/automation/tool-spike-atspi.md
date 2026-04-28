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
AT-SPI can be used to inspect and interact with Kate UI elements, and basic interactions were successfully validated.

However, the approach proved complex and fragile compared to standard web automation tools.

For this reason, AT-SPI automation was not pursued further, and only a minimal proof-of-concept was kept to demonstrate feasibility.

## Outcome
- Feasibility validated
- Minimal automation implemented (smoke level)
- Approach not retained for further development