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

These default directories are defined as XDG user dir.
```bash
# Query
xdg-user-dir DOWNLOAD

# Update by editing config file (assuming $XDG_CONFIG_HOME is unset or set as ~/.config)
vim ~/.config/user-dirs.dirs
# or by using command
xdg-user-dirs-update --set DOWNLOAD ~/Downloads

# Default example in ja_JP locale
$ grep ^XDG ~/.config/user-dirs.dirs
XDG_DESKTOP_DIR="$HOME/デスクトップ"
XDG_DOWNLOAD_DIR="$HOME/ダウンロード"
XDG_TEMPLATES_DIR="$HOME/テンプレート"
XDG_PUBLICSHARE_DIR="$HOME/公開"
XDG_DOCUMENTS_DIR="$HOME/ドキュメント"
XDG_MUSIC_DIR="$HOME/音楽"
XDG_PICTURES_DIR="$HOME/画像"
XDG_VIDEOS_DIR="$HOME/ビデオ"
```

Upstream [git](https://gitlab.freedesktop.org/xdg/xdg-user-dirs),
Upstream [Wiki](https://www.freedesktop.org/wiki/Software/xdg-user-dirs/)\
`xdg-user-dir` may be a shell script like the one shown in the wiki.
