#!/bin/bash
#
# -----------------------------------------------------------------------
# [Author: Matthieu Court]
# [E-mail: matthieu.court@protonmail.com]
#
#         🌸 Wizard to spring clean Most.Frequently.Used UNIX directories. 🌸
#
# Example Usage:
#   1. Run the script: ./clean.sh
#   2. (Optional) Choose an option from the wizard:
#      - To clean a specific directory, enter '1' and specify the directory path.
#      - To clean the default directories (Desktop, Downloads, Documents),
#        enter '2'.
#      - To clean the current directory, enter '3'.
#   3. The script will then proceed to organize files into categorized folders
#      like Images, Documents, Music, etc., remove any broken symbolic links,
#      and clean out empty directories.
#
# The script also adds a 'clean' alias to your .zshrc file for easy future use,
# enabling you to simply type 'clean' in the terminal to start the cleaning process.
# -----------------------------------------------------------------------


source colours.sh

# Clean directory function
clean_directory() {
    local dir=$1
    echo -e "${PINK}🌸 Cleaning $dir...${NC}"

    # Define arrays for file types
    local images=(jpg jpeg png gif webp svg tiff bmp)
    local documents=(pdf doc docx ppt pptx xls xlsx txt rtf md)
    local music=(mp3 m4a ogg flac wav)
    local videos=(mp4 mov mkv avi flv wmv)
    local archives=(zip gz rar tar tgz 7z)

    # Helper to move files by type
    move_files() {
        local exts=("${!1}")
        local subdir=$2
        mkdir -p "$dir/$subdir"
        for ext in "${exts[@]}"; do
            mv -n "$dir"/*.$ext "$dir/$subdir/" 2>/dev/null
        done
    }

    # Move files and clean up
    [[ -d "$dir" ]] && cd "$dir"
    move_files images[@] Images
    move_files documents[@] Documents
    move_files music[@] Music
    move_files videos[@] Videos
    move_files archives[@] Archives
    find . -maxdepth 1 -type f -exec mv -n {} Misc/ \; 2>/dev/null
    find . -type d -empty -delete
    echo -e "${GREEN}Cleaned $dir${NC}"
}

# Wizard for cleaning
cleaning_wizard() {
    echo -e "${BLUE}Cleaning options:${NC}"
    echo "1. Clean a specific directory"
    echo "2. Clean Default directories (Desktop, Downloads, Documents)"
    echo "3. Clean the current directory ($(pwd))"
    read -p "Enter your choice (1/2/3): " choice

    case $choice in
        1)
            read -p "Enter the directory to clean: " dir
            clean_directory "$dir"
            ;;
        2)
            echo -e "${PINK}Cleaning Default directories: Desktop, Downloads, Documents${NC}"
            for dir in Desktop Downloads Documents; do
                clean_directory "$HOME/$dir"
            done
            ;;
        3)
            clean_directory "$(pwd)"
            ;;
        *)
            echo -e "${RED}Invalid choice. Exiting.${NC}"
            exit 1
            ;;
    esac
}

# Check root and run wizard
[[ "$EUID" -eq 0 ]] && { echo -e "${YELLOW}Don't run as root.${NC}"; exit 1; }
cleaning_wizard

# Update .zshrc with alias
add_clean_alias() {
    local zshrc="$HOME/.zshrc" alias_line="alias clean='bash /path/to/clean_script.sh'"
    grep -q "^$alias_line" "$zshrc" || { echo "$alias_line" >> "$zshrc"; echo -e "${GREEN}Updated .zshrc${NC}"; }
}
add_clean_alias

echo -e "${GREEN}🧼 All done!${NC}"
