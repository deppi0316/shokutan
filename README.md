# アプリケーション名：食たん

アプリ名は"食たん"と命名しました。
理由としては、食を探検するという意味をこめて、
アプリケーションから自分が好みのお店や料理を探し、食事をし、笑顔になる
というストーリーを思い浮かべ、この名称にしました。

## アプリケーション概要

ユーザー（未ログイン者）とお店（ログイン者）との2つの視点があります。

基本的な機能としては、
投稿された記事（お店）を閲覧することができます。
記事には、お店の紹介、概要、メニュー、ECサイトのリンク、デリバリーサイトのリンクが設置されています。
記事を探す機能として、検索機能とタグの絞り込み機能を搭載しています。
人気の記事を探せるように、いいね機能の搭載と、TOPページにいいね数上位の記事を閲覧することが可能です。

お店側（ログイン者）は記事の投稿、メニューの追加・編集・削除、お店の概要編集を行えます。

## URL

https://shokutan.herokuapp.com/

## テスト用アカウント

メールアドレス:test@test.acount.com
password:test11

## 目指した課題解決
このアプリケーションを利用することでできる課題解決は、
①美味しい料理がおうちで食事できる
②自宅の食事で悩む時間を短縮
③お店でECやデリバリーサイトを簡単に提示できる
主に上記3点になります。
①②に関しては、昨今の新型ウィルスの影響で、自宅にいる時間が多くなり、外食をする機会が大きく減った状況になってしまったことから、自炊が増えていると思います。美味しい料理が食いたい、また料理が大変と思う人が増えている中で、お店が探しやすく、そこにECやデリバリーサイトの誘導があるサイトは中々登場してこなかったため、自分自身で作成をしました。
③に関しては、今はSNSなどを活用できる人がオンラインへの進出をしており、逆にしていないお店は置いて行かれているのではないかと感じておりました。お店側のECやデリバリーの広告代理として、このサイトを利用していただくことで簡単に、オンラインからの注文ができるようになると思ったのでECやデリバリーのリンクを設置し、お店側の助けにもなってほしいと願い作成しました。

## 洗い出した要件

## 実装予定の機能



## データベース設計

### usersテーブル

| Column             | Type       | Options                    |
| ------------------ | ---------- | -------------------------- |
| shop_name          | string     | null: false                |
| owner_name         | string     |                            |
| email              | string     | null: false, unique: true  |
| encrypted_password | string     | null: false                |

#### Association

- has_one :shop
- has_many :menus
- has_many :posts
- has_many :likes
- has_many :like_posts

### posts テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| content       | text       | null: false                    |
| ec_url        | text       | null: false                    |
| delivery_url  | text       | null: false                    |
| prefecture_id | integer    | null: false                    |
| genre_id      | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |


#### Association

- belongs_to :user
- has_many :likes
- has_many :liked_users

### shops テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| address      | string     |                                |
| phone_number | string     |                                |
| station      | string     |                                |
| parking_id   | integer    |                                |
| year         | integer    |                                |
| month        | integer    |                                |
| url          | string     |                                |
| user         | string     | null: false, foreign_key: true |


#### Association

- belongs_to :user, optional: true


### menus テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| name   | string     | null: false                    |
| price  | integer    | null: false                    |
| user   | string     | null: false, foreign_key: true |


#### Association

- belongs_to :user


### likes テーブル

| Column       | Type       | Options                        |
| -------------| ---------- | ------------------------------ |
| user         | string     | null: false, foreign_key: true |
| post         | string     | null: false, foreign_key: true |


#### Association

- belongs_to :user
- belongs_to :post


## ローカルでの動作方法
% git clone https://github.com/deppi0316/shokutan.git
% bundle install
% rails db:migrate