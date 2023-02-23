# Unix-like system setup 

Personal setup for MacOS or Debian based machines. 

📥 **Installs your packages** after a simple OS deduction using Homebrew or APT 

```shell
 ~/setup > sh install.sh
```

🔗 **Symlinks/refreshes your dotfiles** to the user's home directory using GNU stow

```shell
 ~/setup > sh symlink-dotfiles.sh
```

🛑 **Unlinks your dotfiles** in user's home directory using GNU stow

```shell
 ~/setup > sh unlink-dotfiles.sh
```

🧼🌸 **Cleans directories** of your choice
```shell
 ~/setup > sh spring-clean-directories.sh
```

E.g.
```shell
# Before
~/Desktop > tree
.
├── 6pqm72.jpg
├── AP311_CustomerList-MW-NTL (1).docx
├── _Its_A_Long_Way_To_Tipperary_.mp3
├── cgoban.dmg
└── test.mp4

# After
~/Desktop > tree
.
├── Documents
│   └── AP311_CustomerList-MW-NTL (1).docx
├── Images
│   └── 6pqm72.jpg
├── Misc
│   └── cgoban.dmg
├── Music
│   └── _Its_A_Long_Way_To_Tipperary_.mp3
└── Videos
    └── test.mp4
    
5 directories, 5 files
