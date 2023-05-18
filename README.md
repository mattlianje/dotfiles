# Unix-like system setup 

Personal setup for MacOS or Debian based machines. 

**Installation**
To install your packages based on the operating system type (MacOS or Debian-based), execute the install.sh script:

```shell
 ~/setup > sh install.sh
```

**Dotfile Management**
Use GNU stow to symlink, refresh, or unlink your dotfiles in the user's home directory

- To symlink/refresh your dotfiles:
```shell
 ~/setup > sh symlink-dotfiles.sh
 ```

 - To unlink your dotfiles:
 ```shell
 ~/setup > sh unlink-dotfiles.sh
```

**Directory Cleaning** 
To clean directories of your choice, use the spring-clean-directories.sh script:
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
