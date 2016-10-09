#----------------------------------------
#             Peter Presents...
# **** General Setup Instructions!!! ****
#----------------------------------------

# 0 - Do your shit in a Virtual Env Son!
virtualenv venv
source venv/bin/activate


# 1 - Setup OctoPrint
git clone git@github.com:thepangman/OctoPrint.git
cd OctoPrint
python setup.py install

# 2 - Setup Laser Cutter Plugin
cd src/octoprint/plugins
git clone git@github.com:thepangman/OctoPrint-LaserCutter.git
cd OctoPrint-LaserCutter
python setup.py install

# 3 - Setup Cura Engine
cd ../../../..            // Just go back to the parent directory fam
git clone git@github.com:Ultimaker/CuraEngine.git
cd CuraEngine
git tag -l
git checkout tags/15.02

make          # THIS SHIT RIGHT HERE SUPER IMPORTANT!!! GOTTA COMPILE YO!

# 4 - Run OctoPrint
octoprint

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