# robosys2025

## コマンド一覧

* **plus** — 標準入力から読み込んだ数字の和を計算
* **average** — 引数で与えた数字の平均を計算
* **dispersion** — 引数で与えた数字の分散（母分散）を計算
* **standarddeviation** — 引数で与えた数字の標準偏差（母標準偏差）を計算

---

## プラスコマンド

標準入力から読み込んだ数字の和を出力する。

### 使い方

```
$ seq 10 | ./plus
55

$ ./plus < nums
6
```

---

## 平均コマンド

引数で与えた数字の平均を出力する。

### 使い方

```
$ ./average 1 2 3 4 5
3.0
```

---

## 分散コマンド

引数から読み込んだ数字の分散（母分散）を出力する。

### 使い方

```
$ ./dispersion 1 2 3 4 5 6
2.9166666666666665
```

---

## 標準偏差コマンド

引数から読み込んだ数字の標準偏差（母標準偏差）を出力する。

### 使い方

```
$ ./standarddeviation 1 2 3 4 5 6
1.707825127659933
```

---

## インストール方法

Python が動作する環境で、以下のコマンドを実行してリポジトリを取得する。

```
$ git clone https://github.com/yukikobayashi0602/robosys2025.git
```

取得後、ディレクトリへ移動する。

```
$ cd robosys2025
```

ファイル一覧を確認する。

```
$ ls
```

必要に応じて実行権限を付与する。

```
$ chmod +x plus
$ chmod +x average
$ chmod +x dispersion
$ chmod +x standarddeviation
```

---

## 必要なソフトウェア

* Python（テスト済: ver. 3.8〜3.10）

## テスト環境

* Ubuntu 20.04

---

## ライセンス

このソフトウェアパッケージは、3 条項 BSD ライセンスの下で再頒布および使用が許可されている。

プラスコマンドのコードは、Ryuichi Ueda 氏の以下のスライド（CC-BY-SA 4.0）を参考にし、本人の許可を得て自身の著作としたもの。

* [https://github.com/ryuichiueda/slides_marp/tree/master/prob_robotics_2025](https://github.com/ryuichiueda/slides_marp/tree/master/prob_robotics_2025)

© 2025 Kobayashi Yuki
