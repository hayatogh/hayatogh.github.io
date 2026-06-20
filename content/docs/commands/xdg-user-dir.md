---
title: "xdg-user-dir"
weight: 1
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
# bookHref: ''
# bookIcon: ''
---

## Update directories' path such as `Downloads`, `Documents`

- These directories are defined as XDG user dir.

- Update by editing config file, and logout to take effect.

  **Note** that the directory must exist or the config file entries will be updated to "$HOME/" at your login.

```bash
# Query
xdg-user-dir DOWNLOAD

# Update
mkdir ~/LocalDocuments
# by editing the config file (assuming $XDG_CONFIG_HOME is unset or set as ~/.config)
vim ~/.config/user-dirs.dirs
# or by command
xdg-user-dirs-update --set DOCUMENTS ~/LocalDocuments

# You have to logout to take effect.
# And you may have to re-pin the places on your apps like a file manager.
```

## Default example

- The format is strictly `XDG_xxx_DIR="$HOME/yyy"` or `XDG_xxx_DIR="/absolute/path/to/yyy"`.
  It's a very specific small subset of Bourne Shell style variables assignment.

```bash
# Default example in en_US locale
XDG_DESKTOP_DIR="$HOME/Desktop"
XDG_DOWNLOAD_DIR="$HOME/Downloads"
XDG_TEMPLATES_DIR="$HOME/Templates"
XDG_PUBLICSHARE_DIR="$HOME/Public"
XDG_DOCUMENTS_DIR="$HOME/Documents"
XDG_MUSIC_DIR="$HOME/Music"
XDG_PICTURES_DIR="$HOME/Pictures"
XDG_VIDEOS_DIR="$HOME/Videos"
XDG_PROJECTS_DIR="$HOME/Projects"

# Default example in ja_JP locale
XDG_DESKTOP_DIR="$HOME/デスクトップ"
XDG_DOWNLOAD_DIR="$HOME/ダウンロード"
XDG_TEMPLATES_DIR="$HOME/テンプレート"
XDG_PUBLICSHARE_DIR="$HOME/公開"
XDG_DOCUMENTS_DIR="$HOME/ドキュメント"
XDG_MUSIC_DIR="$HOME/音楽"
XDG_PICTURES_DIR="$HOME/画像"
XDG_VIDEOS_DIR="$HOME/ビデオ"
XDG_PROJECTS_DIR="$HOME/プロジェクト"
```

Upstream [git](https://gitlab.freedesktop.org/xdg/xdg-user-dirs),
Upstream [Wiki](https://www.freedesktop.org/wiki/Software/xdg-user-dirs/)\
`xdg-user-dir` may be a shell script like the one shown in the wiki.

XDG user dirs translations: [The xdg-user-dirs textual domain](https://translationproject.org/domain/xdg-user-dirs.html)
