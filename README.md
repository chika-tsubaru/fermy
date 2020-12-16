# README

# アプリ名
fermy


# 概要
このアプリは、「仮設構築力」を向上させる機会を提供する。

ログイン、ログアウト状態に関わらず、ユーザーは他ユーザーが出題したフェルミー推定問題（注1）を閲覧できる。また、問題ごとの詳細画面へ遷移できる。
ログインユーザーは、フェルミー推定問題に自分なりの回答を投稿できる。
ログインユーザーは、フェルミー推定問題を出題できる。

注1：調査が困難な数量を実測や調査を行うことなく論理的に概算する思考問題のこと。

# 本番環境

url：fermy.herokuapp.com
# ログイン情報（テスト用）
- Eメール：gest.@com
- パスワード：gestgest


# 制作背景（意図）

- プログラミング学習中、様々なエラーに遭遇した。エラーの解決には、何が原因で、どうすれば上手くいくかの仮説構築力が不可欠であることを理解した。
- 仮説力はどのように訓練すればよいのかを模索したところ、フェルミー推定問題が訓練に適していると判断する。
- ネット上には、フェルミー推定の解説は多く存在するが、例題に挑戦する環境がなかった。
- プログラミングのエラー解決や様々な仕事の段取りを作成するのに役立つ「仮説構築力」を養うジムをネット上に作成するために「fermy」を作成した。


# DEMO

# 各ビューの画像

- 
- 
- 
- 


# 工夫したポイント

- シンプルな情報表示により、思考において、余計な情報を受け取る可能性を排除した。
- 出題するか、解答するかの簡単な操作系により、ユーザーがひと目見ただけで、サイトの用途を把握できるように操作の流れを構成した。
- サイト内の色数を限定することにより、視覚的な情報が過多になることを避けた。思考の妨げになる情報は削った。
- 解答を、方針と本文に分離し、本文を展開しない限り解答は方針のみを表示することにより、サイト内が文字で溢れないようにした。


# 使用技術（開発環境）

## バックエンド
Ruby, Ruby on Rails
## フロントエンド
Haml, Sass, JavaScript
## データベース
PostgreSQL
## インフラ
Heroku
## ソース管理
GitHub, GitHubDesktop
## テスト
Rspec
## エディタ
VSCode


# 課題や今後実装したい機能

- 解答に対して、他のユーザーが反応できる仕組みを実装したい。（例：ツイッターのいいね機能）
- 高評価が多く集まった解答は、上位表示する。
- 仮説構築力のワークシートを作成し、必要に応じて利用できるようにする。（初学者のガイドラインを作成）
- ユーザーが解答を作る際、本文のレイアウトをユーザーが加工できるようにする。


# Fermy DB設計

## usersテーブル

|Colum|Type|Options|
|------|----|------|
|name|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false, unique: true|

## Association
- has_many :answers

## questsテーブル

|Colum|Type|Options|
|------|----|------|
|title|string|null: false|

## Association
- has_many :answers

## answersテーブル

|Colum|Type|Options|
|------|----|------|
|plan|string|null: false|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|quest_id|integer|null: false, foreign_key: true|

## Association
- belongs_to :user
- belongs_to :quest
- has_many :stamps

## stampsテーブル

|Colum|Type|Options|
|------|----|------|
|stamp|string||
|answer_id|integer|null: false, foreign_key: true|

## Association
- belongs_to :answer


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
