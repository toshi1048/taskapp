# README

・アプリ名
 Taskapp

・概要(このアプリでできることを書いて下さい)
 ログインを行い、自分のタスクの登録を行う音ができる
 タスクは画像のアップロードが可能

・制作背景(意図)
　⇒作業を行う上で、今日のやるべきことは何かということを可視化して確認する頃ができる

・DEMO(gifで動画や写真を貼って、ビューのイメージを掴んでもらいます)
　⇒できている範囲で貼り付けましょ
・実装予定の内容


・DB設計
 ## tasksテーブル
 
|Column|Type|Options|
|------|----|-------|
|name|string|null: false,unique: true|
|description|text|null: false|

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password_digest|string|null: false|