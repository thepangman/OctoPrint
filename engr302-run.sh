#!/bin/bash
#----------------------------------------
#             Peter Presents...
# **** General Run Instructions!!! ****
#             (Run this 2nd!)
#----------------------------------------

# 0. Check all commands are available
echo -e "\e[4mChecking this script can actually run...\e[0m"
comms=(compgen virtualenv pip python 
       lsof fuser kill)

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
# sleep 2
source ../venv/bin/activate
echo -e "\e[24;32m1. Done. \e[0m"

# 1.5 Just Print a variable to make sure it's all good
old=$PWD
echo "Base Directory: "$old
# sleep 4


# 2. Run OctoPrint
echo -e "\e[24;32m2. Running OctoPrint... \e[0m"
# sleep 2
cd ../../../..
export PWD=$old
echo "Go to localhost:5000"



octoprint



# 3. After close: Show port 5000 and kill whatever's using it
echo ""
thing=$(lsof -i tcp:5000 | grep octoprint)
IFS=' ' read -a process <<< $thing
lsof -i tcp:5000
echo -e "\e[24;32m Killing process: ${process[1]} \e[0m"
echo "lsof result: "$thing
echo ${process[@]}
kill -9 ${process[1]}
lsof -i tcp:5000
echo -e "\e[24;32mDone. \e[0m"
