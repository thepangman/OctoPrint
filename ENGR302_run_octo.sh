#!/usr/bin/bash

# 0. Activate the virtual environment
echo -e "\e[24;32m0. Activating venv... \e[0m" && sleep 2
source ./venv/bin/activate
echo -e "\e[24;32m0. Done. \e[0m"

old=$PWD

# 1. Install pip Requirements
echo -e "\e[24;32m1. Installing pip Requirements... \e[0m" && sleep 1
pip install -r requirements.txt
echo -e "\e[24;32m1. Done. \e[0m"


# 2. Setup OctoPrint generally. Maybe swap this with the previous step?
echo -e "\e[24;32m2. Setting Up OctoPrint... \e[0m" && sleep 2
python setup.py install
echo -e "\e[24;32m2. Done. \e[0m"

# 3. Install *Plugin* pip requirements
echo -e "\e[24;32m3. Installing Plugin pip Requirements... \e[0m" && sleep 1
cd ./src/octoprint/plugins/OctoPrint-LaserCutter/
export PWD=$old/src/octoprint/plugins/OctoPrint-LaserCutter/
pip install -r requirements.txt
echo -e "\e[24;32m3. Done. \e[0m"

# 4. Setup the Laser Cutter Plugin
echo -e "\e[24;32m4. Setting Up Plugin... \e[0m" && sleep 2
python setup.py install
echo -e "\e[24;32m4. Done. \e[0m"


# 5. Run OctoPrint
cd ../../../.. && export PWD=$old
echo -e "\e[24;32m5. Running OctoPrint... \e[0m" && sleep 2
echo "Go to localhost:5000"
./venv/bin/octoprint

# 6. After close: Show port 5000 and kill whatever's using it
echo ""
thing=$(lsof -i tcp:5000 | grep octoprint)
IFS=' ' read -a process <<< $thing
lsof -i tcp:5000
echo -e "\e[24;32m Killing process: ${process[1]} \e[0m"
kill -9 ${process[1]}
lsof -i tcp:5000
echo -e "\e[24;32mDone. \e[0m"
