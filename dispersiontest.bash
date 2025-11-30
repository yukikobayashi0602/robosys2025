#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Kobayashi Yuki
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo NG at Line $1
    res=1
}

res=0

### 正の数字のみ ###
out=$(./dispersion 1 2 3 4)
[ "${out}" = "1.25" ] || ng ${LINENO}

### 負の値を含む ###
out=$(./dispersion -1 3)
[ "${out}" = "4.0" ] || ng ${LINENO}

### 0 を含む ###
out=$(./dispersion 0 1 2 3)
[ "${out}" = "1.25" ] || ng ${LINENO}


