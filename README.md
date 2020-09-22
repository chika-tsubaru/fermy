# README

#Fermy DB設計

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
