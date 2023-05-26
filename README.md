# *NIX system setup 

Personal setup for MacOS or Debian based machines. 

## Spring cleaning 🧼🌸
```shell
 ~/> sh spring-clean-directories.sh
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
