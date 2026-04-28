import subprocess
import time
from robot.api.deco import keyword
from dogtail.tree import root


@keyword("Open Kate")
def open_kate():
    subprocess.Popen(["kate"])
    time.sleep(1)


@keyword("Open Configure Language")
def open_configure_language():
    app = root.application("kate")
    window = app.children[0]

    menu_bar = window.child(roleName="menu bar")
    settings_menu = menu_bar.child(name="Settings")
    settings_menu.click()
    time.sleep(1)

    #configure_language = settings_menu.child(name="Configure Language…") or
    configure_language = settings_menu.findChild(
        lambda x: "Configure Language" in x.name
    )
    configure_language.click()
    time.sleep(1)

    dialog = app.child(name="Configure Language — Kate", roleName="dialog")
    assert dialog is not None

    
