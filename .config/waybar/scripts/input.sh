#!/usr/bin/env bash

set -euo pipefail

name=$(fcitx5-remote -n 2>/dev/null || echo "")

case "$name" in
  *keyboard-us* )
    echo "A"
    ;;
  *mozc* )
    mode=$(fcitx5-remote) # 2 = active, 1 = inactive
    # TODO: detect actual Mozc mode (hiragana vs katakana) if needed
    echo "あ"
    ;;
  * )
    echo "A"
    ;;
esac
