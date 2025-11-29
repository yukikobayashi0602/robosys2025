#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Kobayashi Yuki
# SPDX-License-Identifier: BSD-3-Clause

# テスト対象コマンド
CMD="python3 avg.py"

ng () {
    echo "NG at Line $1"
    res=1
}

res=0

### 正の数字のみ ###
out=$($CMD 1 2 3 4 5)
[ "${out}" = "3.0" ] || ng ${LINENO}

### 負の数も含む ###
out=$($CMD -2 -1 1 2)
[ "${out}" = "0.0" ] || ng ${LINENO}

### 0 も含む ###
out=$($CMD 0 1 2)
[ "${out}" = "1.0" ] || ng ${LINENO}

### 少数も含む ###
out=$($CMD 0.5 1.1 -2.5)
[ "${out}" = "-0.3" ] || ng ${LINENO}

### 数字の区切りが空白二つの場合 ###
out=$($CMD -2  -1 1  2)
[ "${out}" = "0.0" ] || ng ${LINENO}

### アルファベット（小文字）を含む ###
out=$($CMD 1 2 a 3 4)
[ "$?" = 1 ] || ng ${LINENO}
[ "${out}" = "" ] || ng ${LINENO}

### アルファベット（大文字）を含む ###
out=$($CMD 1 2 B 3 4)
[ "$?" = 1 ] || ng ${LINENO}
[ "${out}" = "" ] || ng ${LINENO}

### ひらがなを含む ###
out=$($CMD 1 2 あ 3 4)
[ "$?" = 1 ] || ng ${LINENO}
[ "${out}" = "" ] || ng ${LINENO}


