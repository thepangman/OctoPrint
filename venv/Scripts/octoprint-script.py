#!D:\UNIVERSITY\ENGR302\OctoPrint\venv\Scripts\python.exe
# EASY-INSTALL-ENTRY-SCRIPT: 'OctoPrint','console_scripts','octoprint'
__requires__ = 'OctoPrint'
import re
import sys
from pkg_resources import load_entry_point

if __name__ == '__main__':
    sys.argv[0] = re.sub(r'(-script\.pyw?|\.exe)?$', '', sys.argv[0])
    sys.exit(
        load_entry_point('OctoPrint', 'console_scripts', 'octoprint')()
    )
