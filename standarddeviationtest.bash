#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Kobayashi Yuki
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo NG at Line $1
    res=1
}

res=0

equal() {
    [ "$1" = "$2" ]
}

### 正の数字のみ ###
out=$(./standarddeviation 1 2 3 4)
equal "${out}" "1.118033988749895" || ng ${LINENO}

### 負の値を含む ###
out=$(./standarddeviation -1 3)
equal "${out}" "2.0" || ng ${LINENO}

### 0 を含む ###
out=$(./standarddeviation 0 1 2 3)
equal "${out}" "1.118033988749895" || ng ${LINENO}

### 小数を含む ###
out=$(./standarddeviation 0.5 1.5 2.5)
equal "${out}" "0.816496580927726" || ng ${LINENO}


