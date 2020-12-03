# README

# アプリ名
fermy


# 概要
このアプリは、「仮設構築力」を向上させる機会を提供する。
ログイン、ログアウト状態に関わらず、ユーザーは他ユーザーが出題したフェルミー推定問題（注1）を閲覧できる。また、問題ごとの詳細画面へ遷移できる。
全ユーザーは、フェルミー推定問題に自分なりの回答を投稿できる。
ログインユーザーは、フェルミー推定問題を出題できる。

注1：調査が困難な数量を実測や調査を行うことなく論理的に概算する思考問題のこと。

# 本番環境

url
# ログイン情報（テスト用）
- Eメール：
- パスワード：


# 制作背景（意図）

- 
- 
- 
- 


# DEMO

# 各ビューの画像

- 
- 
- 
- 


# 工夫したポイント

- 
- 
- 
- 


# 使用技術（開発環境）

## バックエンド
## フロントエンド
## データベース
## インフラ
## Webサーバ（本番環境）
## アプリケーションサーバ（本番環境）
## ソース管理
## テスト
## エディタ


# 課題や今後実装したい機能

- 
- 
- 
- 


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
