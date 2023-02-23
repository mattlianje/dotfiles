#!/bin/bash

# -----------------------------------------------------------------------
# [Author: Matthieu Court]
# [E-mail: matthieu.court@protonmail.com]
#
#         🌸 Spring cleans most frquently used macOS directories. 🌸
# -----------------------------------------------------------------------


# Source commons
source colours.sh

# Check if the script is being run as root
if [ "$EUID" -eq 0 ]; then
    echo -e "${YELLOW}Error: This script should not be run as root.${NC}"
    exit 1
fi


#
# Cleans the user's home
#
function clean_home {
    # Set the path to the Spring Cleaning folder
    SPRING_CLEANING="$HOME/SpringCleaning"

    # Make sure the Spring Cleaning folder exists
    mkdir -p "$SPRING_CLEANING"

    # Move all loose files to the Spring Cleaning folder
    echo -e "${PINK}Moving loose files to Spring Cleaning folder...${NC}"
    find "$HOME" -maxdepth 1 -type f -not -name ".*" -exec mv -n {} "$SPRING_CLEANING" \;

    # Remove any empty directories in the home directory
    echo -e "${PINK}Removing empty directories...${NC}"
    find "$HOME" -mindepth 1 -type d -empty -delete

    # Remove any broken symbolic links in the home directory
    echo -e "${PINK}Removing broken symbolic links...${NC}"
    find "$HOME" -type l -exec sh -c "file -b {} | grep -q ^broken" \; -print0 | xargs -0 rm

    echo -e "${PINK}${HOME} is now clean!${NC}"
}

#
# Function to do the cleaning
#
function clean_directory {
    local dir="$1"

    echo -e "${PINK}🌸 Doing a spring cleaning of $dir... ${NC}"
    cd "$dir"

      # Remove any broken symbolic links in the Desktop directory
    echo -e "Cleaning up broken symbolic links in ${dir}..."
    find ${dir} -type l -exec sh -c "file -b {} | grep -q ^broken" \; -print0 | xargs -0 rm

    # Move files to appropriate folders
    echo -e "Moving files to appropriate folders..."
    mkdir -p ${dir}/Images ${dir}/Documents ${dir}/Music ${dir}/Videos ${dir}/Archives ${dir}/Misc

    # Move image files to Images folder
    mv -n ${dir}/*.{jpg,jpeg,png,gif,webp,svg,tiff,bmp} ${dir}/Images/ 2>/dev/null

    # Move document files to Documents folder
    mv -n ${dir}/*.{pdf,doc,docx,ppt,pptx,xls,xlsx,txt,rtf,md} ${dir}/Documents/ 2>/dev/null

    # Move music files to Music folder
    mv -n ${dir}/*.{mp3,m4a,ogg,flac,wav} ${dir}/Music/ 2>/dev/null

    # Move video files to Videos folder
    mv -n ${dir}/*.{mp4,mov,mkv,avi,flv,wmv} ${dir}/Videos/ 2>/dev/null

    # Move archive files to Archives folder
    mv -n ${dir}/*.{zip,gz,rar,tar,tgz,7z} ${dir}/Archives/ 2>/dev/null

    # Move remaining files to Misc folder
    find ${dir} -maxdepth 1 -type f -exec mv -n {} ${dir}/Misc/ \; 2>/dev/null

    # Remove any remaining empty directories
    find ${dir} -type d -empty -delete

    echo -e "${GREEN}${dir} cleanup complete!${NC}"
}

#
# Defines what the user wants cleaned 
#
clean_directory "$HOME/Desktop"
clean_directory "$HOME/Downloads"
clean_directory "$HOME/Documents"

#
# Cleans your home (optional)
#
# clean_home
# clean_directory "$HOME/SpringCleaning"

echo -e "${GREEN}🧼 Cleanup complete!${NC}"
