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
