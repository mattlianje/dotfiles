# Unix-like system setup 

Personal setup for MacOS or Debian based machines. 

📥 **Installs your packages** after a simple OS deduction using Homebrew or APT 

```shell
sh install.sh
```

🔗 **Symlinks/refreshes your dotfiles** to the user's home directory using GNU stow

```shell
sh symlink-dotfiles.sh
```

🛑 **Unlinks your dotfiles** in user's home directory using GNU stow

```shell
sh unlink-dotfiles.sh
```

🧼🌸 **Cleans directories** of your choice
```shell
 ~/setup > sh spring-clean-directories.sh
```

E.g.
```shell
 ~/Desktop > tree
.
├── 6pqm72.jpg
├── AP311_CustomerList-MW-NTL (1).docx
├── _It's A Long Way To Tipperary_.mp3
├── cgoban.dmg
└── test.mp4

0 directories, 5 files
 ~/Desktop > tree
.
├── Documents
│   └── AP311_CustomerList-MW-NTL (1).docx
├── Images
│   └── 6pqm72.jpg
├── Misc
│   └── cgoban.dmg
├── Music
│   └── _It's A Long Way To Tipperary_.mp3
└── Videos
    └── test.mp4
    
5 directories, 5 files
