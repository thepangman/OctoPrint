#!D:\UNIVERSITY\ENGR302\OctoPrint\venv\Scripts\python.exe
# EASY-INSTALL-ENTRY-SCRIPT: 'pkginfo','console_scripts','pkginfo'
__requires__ = 'pkginfo'
import re
import sys
from pkg_resources import load_entry_point

if __name__ == '__main__':
    sys.argv[0] = re.sub(r'(-script\.pyw?|\.exe)?$', '', sys.argv[0])
    sys.exit(
        load_entry_point('pkginfo', 'console_scripts', 'pkginfo')()
    )
