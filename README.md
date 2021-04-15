# SolveApp
### ユーザーが抱える悩みを解決するアプリケーション

[![Image from Gyazo](https://i.gyazo.com/68832881ad7b59f986a4cb3fb3255010.jpg)](https://gyazo.com/68832881ad7b59f986a4cb3fb3255010)


# ⚫︎概要

### 誰にも相談できない悩みを解決する。
### 同じ悩みを抱える人に寄り添える。

投稿されたお悩みにチャットルーム内で相談にのる。
ユーザー同士が「悩み」という一つの題材で、チャットを用いてその悩みの解決に向けて会話をする。


# App URL

https://solve-app-34761.herokuapp.com


# 利用方法

#### ・ユーザー新規登録・ログイン
#### ・トップページに遷移
#### ・新規お悩み投稿はサイドバー左上の「相談する」をクリック
[![Image from Gyazo](https://i.gyazo.com/d010dee111e39c511c5289b127299ce6.gif)](https://gyazo.com/d010dee111e39c511c5289b127299ce6)
<br>

#### ・投稿完了後はトップページに遷移
[![Image from Gyazo](https://i.gyazo.com/0179932676b8f0e7ea773ad5a3b8471a.gif)](https://gyazo.com/0179932676b8f0e7ea773ad5a3b8471a)
<br>

#### ・トップページ下部にお悩み一覧が表示されている
#### ・サイドバーに自身のお悩みが表示されている
[![Image from Gyazo](https://i.gyazo.com/c2ebbdd19771b26e199b22a0e702db71.gif)](https://gyazo.com/c2ebbdd19771b26e199b22a0e702db71)
<br>

#### ・お悩み一覧かサイドバーに表示されているお悩みタイトルをクリックするとチャットルームに遷移
[![Image from Gyazo](https://i.gyazo.com/0c2af562a94bf8bdd9f61ca3b8578ec6.gif)](https://gyazo.com/0c2af562a94bf8bdd9f61ca3b8578ec6)
<br>

#### ・下部のコメント投稿フォームに文章を入力し、送信をクリックするとコメントできる
[![Image from Gyazo](https://i.gyazo.com/b3dcd1ca4bd3429f7ea609c0107afc4d.gif)](https://gyazo.com/
b3dcd1ca4bd3429f7ea609c0107afc4d)
<br>

#### ・右上「お悩み解決！！」をクリックすると、ルームが削除される※相談者（ルーム作成者）のみ削除可能
[![Image from Gyazo](https://i.gyazo.com/dab141c3bde702df2b207266c11b6268.gif)](https://gyazo.com/dab141c3bde702df2b207266c11b6268)
<br>

#### ・カテゴリーごとに検索することができる
[![Image from Gyazo](https://i.gyazo.com/f17ec503eb9c474bc61fec6f5b18fad6.gif)](https://gyazo.com/f17ec503eb9c474bc61fec6f5b18fad6)
<br>

#### ・サイドバー左上のマイユーザー名をクリックすると情報編集ページに遷移
[![Image from Gyazo](https://i.gyazo.com/37377526011cf81b7826452782992ab0.gif)](https://gyazo.com/37377526011cf81b7826452782992ab0)
<br>

#### ・お悩み一覧のお悩みタイトル横のユーザー名をクリックするとユーザー詳細ページに遷移
[![Image from Gyazo](https://i.gyazo.com/da0bb2ca037aa8a8bb49f3c3d36b7f6e.gif)](https://gyazo.com/da0bb2ca037aa8a8bb49f3c3d36b7f6e)
<br>


# 課題解決

| ユーザーストーリーから考える課題         | 課題解決                                                              |
| ----------------------------------- | ------------------------------------------------------------------- |
| 身近な人に相談できない悩みの解決         | チャットルームを作成することにより、特定されずにアドバイスをもらうことができる    |
| 解決したい内容が自分の中で曖昧である      | カテゴリー分けすることでジャンルが絞られ、内容を文章にすることで悩みがあ整理できる |
| 早期解決のために相談者の詳細情報を知りたい | ユーザー名をクリックすることで詳細情報を閲覧できる                           |
| 類似した相談内容を閲覧したい             | カテゴリー検索機能実装により、類似した内容に絞り込める                        |


# 要件定義




# 機能一覧

| 機能              | 概要                                                       |
| ---------------- | ---------------------------------------------------------- |
| ユーザー管理機能    | 新規登録、ログイン、ログアウトが可能                             |
| ユーザー編集機能    | 自身の情報を編集できる                                         |
| ユーザー詳細閲覧機能 | ユーザー名をクリックするとユーザーの詳細を閲覧できる                |
| ルーム作成機能      | タイトル、カテゴリー、内容を記述することでルームを作成することができる |
| ルーム削除機能      | 作成したユーザーのみ削除することができる                          |
| コメント機能        | ルーム内でコメントすることができる                               |
| カテゴリー検索機能   | 相談内容をカテゴリー別に検索できる                               |


# ローカルでの動作方法

$ git clone 
</br>
$ cd solve-app
</br>
$ bundle install
</br>
$ rails db:create
</br>
$ rails db:migrate
</br>
$ rails s
</br>
👉 http://localhost:3000


# 開発環境

VScode
<br>
ruby '2.6.5'
<br>
'rails', '~> 6.0.0'
<br>
'mysql2', '>= 0.4.4'
<br>
javascript


# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| gender   | string | null: false |
| age      | string | null: false |
| position | string | null: false |

### Association

- has_many :problems
- has_many :comments


## problems テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| title    | string | null: false |
| content  | string | null: false |
| category | string | null: false |

### Association

- belongs_to :user
- has_many   :comments


## comments テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| solution | text       |                                |
| user     | references | null: false, foreign_key: true |
| room     | references | null: false, foreign_key: true |

### Association

- belongs_to :problem
- belongs_to :user