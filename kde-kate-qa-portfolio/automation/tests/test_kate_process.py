import subprocess
import time


def test_kate_process_starts():
    subprocess.Popen(["kate", "--new", "/tmp/pytest_kate_smoke.txt"])
    time.sleep(1)

    check = subprocess.run(["pgrep", "-af", "kate"], capture_output=True, text=True)
    assert check.returncode == 0, f"Kate process not found. stdout={check.stdout} stderr={check.stderr}"