# fermy
このアプリは、「仮設構築力」を鍛えるジムである。
![書き出す](https://user-images.githubusercontent.com/68729117/102678741-b97d8e00-41ed-11eb-9d33-2a0b4af57206.jpg)

## 概要

- ユーザーは他ユーザーが出題したフェルミー推定問題（注1）を閲覧できる。また、問題ごとの詳細画面へ遷移できる。
- ログインユーザーは、フェルミー推定問題に自分なりの回答を投稿できる。
- ログインユーザーは、フェルミー推定問題を出題できる。

注1：調査が困難な数量を実測を行うことなく論理的に概算する思考問題のこと。

## 本番環境

url
<fermy.herokuapp.com>

## ログイン情報（テスト用）

- Eメール：stargest.@com
- パスワード：stargestgest


## 制作背景（意図）

- 本アプリの開発理由は、プログラミングの知識量に依存することなく、仮説構築力を向上させる環境をつくるためです。

プログラミング学習中、私は様々なエラーに遭遇しました。エラーの解決をしていく中で、ある気づきを得ることが出来ました。
その気付きとは、「エラーの原因がどのようなもので、どうすれば上手くいくかの仮説構築力が、コーディングには必須である」です。

「仮説構築力」は、物事を構造的にとらえて考える力と言い換えることが出来ます。ネット上には、この力を鍛えるツールが存在しました。
そのツールが「フェルミ推定問題」です。
しかし、ネット上に存在するサイトは、フェルミ推定そのものを説明するものが多く、「実際に解答練習する」ことが想定されていないと感じました。

そこで、「フェルミ推定を解く」ことに焦点をあてたアプリを開発することにしました。

## DEMO

- トップページ
[![Image from Gyazo](https://i.gyazo.com/44d91891317b1b06983c317bb355051c.png)](https://gyazo.com/44d91891317b1b06983c317bb355051c)
- 問題詳細ページ
[![Image from Gyazo](https://i.gyazo.com/be84a4a564d9d23e4eaf494421e854d8.png)](https://gyazo.com/be84a4a564d9d23e4eaf494421e854d8)
- 解答展開時
[![Image from Gyazo](https://i.gyazo.com/8068120519cb713537f4a3b367a28f9f.png)](https://gyazo.com/8068120519cb713537f4a3b367a28f9f)
- 解答ページ
[![Image from Gyazo](https://i.gyazo.com/2c69351b7c7c5ff547d6369fa4d608e6.png)](https://gyazo.com/2c69351b7c7c5ff547d6369fa4d608e6)


## 工夫したポイント

- シンプルな情報表示にすることで、思考を阻害する情報を遮断するレイアウトを実装しました。
- フェルミ推定に対して解答するか、出題するかの単純な操作系により、ユーザーがひと目見ただけで、サイトの用途を把握できるように操作の流れを構成した。
- 解答を、方針と本文に分離しました。本文を展開しない限り解答は方針のみを表示することにより、サイト内が文字で溢れないようにした。
- 全体的に青を貴重とした色使いを意識しました。青が及ぼす心理効果には、知的、落ち着きがあります。論理的思考をする際は落ち着いた状態へと誘導したいという意図があります。

## 使用技術（開発環境）

### バックエンド
Ruby, Ruby on Rails
### フロントエンド
Haml, Sass, JavaScript
### データベース
PostgreSQL
### インフラ
Heroku
### ソース管理
GitHub, GitHubDesktop
### テスト
Rspec
## #エディタ
VSCode


## 今後実装したい機能

ユーザーが仮説構築力をより効率よく向上できる仕組みには、以下のものが必要だと考える。

1, 構造的な思考をアシストする、思考のロードマップが存在すること。
      初学者が持つ可能性のある「何から初めたらよいか分からない」という課題を解決するため。

2, 秀逸な解答を効率よくインプットできる仕組みが存在すること。
      「どんな思考方針が、最も妥当な結論を導いているのかを知りたい」という想定課題を解決するため。

### 機能の原案

- 仮説構築力のワークシートを作成し、必要に応じて利用できるようにする。（初学者のガイドラインを作成）
- 解答に対して、他のユーザーが反応できる仕組みを実装する。（例：ツイッターのいいね機能）
- 高評価が多く集まった解答は、上位表示する。


## Fermy DB設計

### usersテーブル

|Colum|Type|Options|
|------|----|------|
|name|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false, unique: true|

### Association
- has_many :answers

### questsテーブル

|Colum|Type|Options|
|------|----|------|
|title|string|null: false|

### Association
- has_many :answers

### answersテーブル

|Colum|Type|Options|
|------|----|------|
|plan|string|null: false|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|quest_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :quest
- has_many :stamps


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
