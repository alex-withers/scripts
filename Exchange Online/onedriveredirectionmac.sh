#!/bin/bash
# Current User Local Home Folders to OneDrive
# Note: Do NOT run as su, just sudo

sudo
ODFolder="OneDrive"
ODOrganisation="The Strategy Distillery"
ODFinalFolder="$ODFolder - $ODOrganisation"

# Documents
WorkingFolder="Documents"
sudo mv -f ~/$WorkingFolder "/Users/$USER/$ODFinalFolder"
ln -s "/Users/$USER/$ODFinalFolder/$WorkingFolder" ~/$WorkingFolder

# Desktop
WorkingFolder="Desktop"
sudo mv -f ~/$WorkingFolder "/Users/$USER/$ODFinalFolder"
ln -s "/Users/$USER/$ODFinalFolder/$WorkingFolder" ~/$WorkingFolder

# Downloads
WorkingFolder="Downloads"
sudo mv -f ~/$WorkingFolder "/Users/$USER/$ODFinalFolder"
ln -s "/Users/$USER/$ODFinalFolder/$WorkingFolder" ~/$WorkingFolder

# Pictures
WorkingFolder="Pictures"
sudo mv -f ~/$WorkingFolder "/Users/$USER/$ODFinalFolder"
ln -s "/Users/$USER/$ODFinalFolder/$WorkingFolder" ~/$WorkingFolder

# Movies
WorkingFolder="Movies"
sudo mv -f ~/$WorkingFolder "/Users/$USER/$ODFinalFolder"
ln -s "/Users/$USER/$ODFinalFolder/$WorkingFolder" ~/$WorkingFolder

# Music
WorkingFolder="Music"
sudo mv -f ~/$WorkingFolder "/Users/$USER/$ODFinalFolder"
ln -s "/Users/$USER/$ODFinalFolder/$WorkingFolder" ~/$WorkingFolder