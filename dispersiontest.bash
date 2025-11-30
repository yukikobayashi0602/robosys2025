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

### 小数を含む ###
out=$(./dispersion 0.5 1.5 2.5)
[ "${out}" = "0.6666666666666666" ] || ng ${LINENO}

### 空白 2 個でも正常に動作する ###
out=$(./dispersion 1  2.5  3)
[ "${out}" = "0.7222222222222222" ] || ng ${LINENO}

### 以下はすべて異常系（エラー終了＋出力なし） ###

check_error() {
    out=$(./dispersion "$@")
    status=$?
    [ "$status" = 1 ] || ng ${LINENO}
    [ -z "${out}" ] || ng ${LINENO}
}

### アルファベット（小文字） ###
check_error 1 2 a 3 4

### アルファベット（大文字） ###
check_error 1 2 H 3 4

### ひらがな ###
check_error 1 2 ん 3 4

### カタカナ ###
check_error 1 2 ン 3 4

### 記号 "-" 単体 ###
check_error 1 2 - 3 4

### 記号 "@" ###
check_error 1 2 @ 3 4

### 引数なし ###
check_error

[ "$res" = 0 ] && echo OK
exit $res
