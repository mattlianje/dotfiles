# Unix-like system setup 

Personal setup for MacOS or Debian based machines. 

📥 **Installs your packages** after a simple OS deduction using Homebrew or APT 

```shell
 ~/setup > sh install.sh
```

🔗 **Symlinks/refreshes/unlinks your dotfiles** to the user's home directory using GNU stow

```shell
 ~/setup > sh symlink-dotfiles.sh
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
├── Marengo.jpg
├── Jena.docx
├── Austerlitz.mp3
├── Arcole.dmg
└── Rivoli.mp4

# After
~/Desktop > tree
.
├── Documents
│   └── Jena.docx
├── Images
│   └── Marengo.jpg
├── Misc
│   └── Arcole.dmg
├── Music
│   └── Austerlitz.mp3
└── Videos
    └── Rivoli.mp4
