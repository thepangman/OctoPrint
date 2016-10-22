#!/usr/bin/bash
#----------------------------------------
#             Peter Presents...
# **** General Setup Instructions!!! ****
#             (Run this 1st!)
#----------------------------------------

# 0. Check all commands are available
echo -e "\e[4m0. Checking this script can actually run...\e[0m"
comms=(compgen virtualenv pip python lsof fuser kill)

for i in $(seq 0 $((${#comms[@]} - 1)))
    do
    com=${comms[i]}
    #echo $com
    res=$(compgen -c $com)
    res_c=$(echo $res | wc -w)
    #echo -e "\tRESULT:"$res
    #echo -e "\tWords:"$res_c

    if [[ $res_c -ge 1 ]]
        then
        echo -e $com": \e[24;32mfound! :)\e[0m"
    else
        echo -e $com": \e[31mNOT FOUND!\e[0m"
        echo "Exiting Script..."
        exit
    fi
done


# 1. Activate the virtual environment
echo -e "\e[24;32m1. Activating venv... \e[0m"
sleep 2
virtualenv ../venv
source ../venv/bin/activate
echo -e "\e[24;32m1. Done. \e[0m"

old=$PWD
echo "Base Directory: "$old
sleep 4

# 2. Install pip Requirements
echo -e "\e[24;32m2. Installing pip Requirements... \e[0m"
sleep 4
pip install -r requirements.txt
echo -e "\e[24;32m2. Done. \e[0m"


# 3. Setup OctoPrint generally. Maybe swap this with the previous step?
echo -e "\e[24;32m3. Setting Up OctoPrint... \e[0m"
sleep 4
python setup.py install
echo -e "\e[24;32m3. Done. \e[0m"

# 4. Install *Plugin* pip requirements
echo -e "\e[24;32m4. Installing Plugin pip Requirements... \e[0m"
sleep 4
cd ./src/octoprint/plugins/lasercutter-plugin/
export PWD=$old/src/octoprint/plugins/lasercutter-plugin/
pip install -r requirements.txt
echo -e "\e[24;32m4. Done. \e[0m"

# 5. Setup the Laser Cutter Plugin
echo -e "\e[24;32m5. Setting Up Plugin... \e[0m"
sleep 4
python setup.py install
echo -e "\e[24;32m5. Done. \e[0m"


# 5. Run OctoPrint
# echo -e "\e[24;32m5. Running OctoPrint... \e[0m"
# sleep 2
# cd ../../../..
# export PWD=$old
# echo "Go to localhost:5000"


# Setup Cura Engine
# cd ../../../..            // Just go back to the parent directory fam
# git clone git@github.com:Ultimaker/CuraEngine.git
# cd CuraEngine
# git tag -l
# git checkout tags/15.02

# make          # THIS SHIT RIGHT HERE SUPER IMPORTANT!!! GOTTA COMPILE YO!


#Go to localhost:5000 in you web browser

# 5 - Configure OctoPrint
# 5.1 - Add Cura Engine to OctoPrint
#       Add CuraEngine/build/CuraEngine to the 
#       OctoPrint config "Path to CuraEngine" thing.
#         e.g. "/home/scrivepete/Documents/Coding/LaserCutter/CuraEngine/build/CuraEngine"

# 5.2 - Add default Cura profile
#       The add first_profile.ini from the 
#       "Import Profile" button in OctoPrint
#       (Just get this from Peter - I'll 
#        chuck it up in the messenger)


# Note: To make another profile document you need to install Cura (version 15.02) at:
#    https://ultimaker.com/en/products/cura-software/list 
#    And then you can export custom profiles