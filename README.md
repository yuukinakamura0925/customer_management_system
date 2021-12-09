
# Customer Management System (顧客管理システム)

&emsp;顧客の管理を行うアプリケーションです。
会員カードと連携して使うような想定をして作成しました。
顧客が来店回数、過去にどんな商品を注文し、いくらのお会計をしているか。を記録できます。
記録を元に顧客にサービス（接客等）を提供することで、再来店につなげることができます。
ユニークな機能も付与して、顧客にも楽しんでもらえるようなアプリケーションを目指します。

### URL

- アプリ URL：https://customer-management-system.link/#/login（グーグルアカウントにてログイン可能）
- （http://customer-management-system.link/#/login）にアクセスしても上記（httpsから始まる）URLにリダイレクトを設定済み。
## アプリの特徴

- 顧客情報（名前、性別、年齢、特徴など）を登録し管理することができる
- お会計機能がついていて、顧客ごとのお会計記録を残すことができる。
- 分析機能を充実させ、分析を元に集客案を開発できる（未実装）


# アプリ作成背景

&emsp;私が飲食店で業務している中で、顧客情報を把握することは非常に重要だと感じました。
それはリピーターを増やすことに大きく影響します。
例えば、前回話した内容を覚えていたり、食べ物やドリンクの好みをわかっていたり、そんな接客をできるとお客様は大変喜ばれます。

&emsp;そこで、そういった情報を記憶力ではなく、しっかりとデータにすることで確実に接客のチャンスを増やしお客様に喜んでもらうことができると考え、今回のアプリケーションを制作しました。
そして結果としてリピート率や売り上げの増加につながっていくのが理想の形であると考えます。

## 工夫した点

- Railsをapiモードで
- 顧客の情報を保持するだけでなくお会計システムも使えるアプリケーションにしました。
- 顧客が膨大になったとしてもID,名前など様々な情報で検索できます。
- メニューをカテゴリー別に登録や編集、削除ができるので、最新の状態のメニューに合わせお会計システムを使うことができます。
- 顧客の過去の注文を記録しているので、今までにのんだお酒の量を表示できるようにして、それに応じランクをつけていくというユニークな機能をつける（実装予定）

## 使用イメージ

### ログイン
[![Image from Gyazo](https://i.gyazo.com/bde3e16babf3a8912bf3e95f134ee4ee.gif)](https://gyazo.com/bde3e16babf3a8912bf3e95f134ee4ee)

### ホーム画面
[![Image from Gyazo](https://i.gyazo.com/2261ac4536c98fab62a839364d70d280.gif)](https://gyazo.com/2261ac4536c98fab62a839364d70d280)

### サイドメニュー
[![Image from Gyazo](https://i.gyazo.com/69a4898e5cf1b13880cd8063f00c3bfd.gif)](https://gyazo.com/69a4898e5cf1b13880cd8063f00c3bfd)

### 顧客登録
[![Image from Gyazo](https://i.gyazo.com/a414509755588587bafe5b5091b73058.gif)](https://gyazo.com/a414509755588587bafe5b5091b73058)


### 検索機能
[![Image from Gyazo](https://i.gyazo.com/6a551dac78b06f47d0e518dde0dab8ef.gif)](https://gyazo.com/6a551dac78b06f47d0e518dde0dab8ef)


### お会計機能
[![Image from Gyazo](https://i.gyazo.com/c488a019fd4007d14ad1292b75ad2b7d.gif)](https://gyazo.com/c488a019fd4007d14ad1292b75ad2b7d)



## 機能一覧

### ユーザー機能一覧
- ログイン機能(Firebase Authentication)


### 顧客管理機能一覧
- 顧客登録機能
  - 新規顧客登録
- 顧客一覧
  - 顧客検索機能
  - 顧客並べ替え機能
  - 顧客情報編集機能
  - 顧客削除機能

### お会計用メニュー管理機能一覧
- メニューの一覧表示
  - メニュー情報の新規登録
  - メニュー情報の編集機能
  - メニュー削除機能
### メニュー登録時用カテゴリー管理機能一覧
- カテゴリーの一覧表示
  - カテゴリー情報の新規登録
  - カテゴリー情報の編集機能
  - カテゴリー削除機能
### 会計機能一覧
- お会計機能
  - メニューのカテゴリー別表示
  - カートに注文商品を登録
  - おつりの計算
  - 会計完了でオーダー内容を登録


### 検索機能一覧
- 検索機能
  - キーワード検索
  - カテゴリ検索
  - ID検索
  - ソート機能
  - ページネーション機能

### その他
- バックエンドユニットテスト機能(Rspec)

### テーブル設計
- customers テーブル（カスタマーを情報管理するテーブル）

| カラム名 | データ型 | 備考 |
| :------- | :------- | :--- |
| id       | integer  | PK   |
| name     | string   |      |
| age    | integer   |      |
| sex | string   |      |
| memo | string   |      |
|created_at|datetime| 自動生成|
|updated_at|datetime| 自動生成|

- menus テーブル（メニュー内容を管理するテーブル）

| カラム名 |データ型 |備考 |
|:--|:--|:--|
|id| integer| PK|
|name| steing | |
|price| integer | |
|category_id |integer |FK|
|created_at|datetime| 自動生成|
|updated_at|datetime| 自動生成|

- categories テーブル（カテゴリーを管理するテーブル）

| カラム名 |データ型 |備考 |
|:--|:--|:--|
|id| integer| PK|
|name |string ||
|created_at|datetime| 自動生成|
|updated_at|datetime| 自動生成|

- carts テーブル（カートを管理するテーブル）

| カラム名 |データ型 |備考 |
|:--|:--|:--|
|id| integer| PK|
|customer_id |integer| FK |
|created_at|datetime| 自動生成|
|updated_at|datetime| 自動生成|

- cart_details テーブル（カートの内容を管理するテーブル）

| カラム名 |データ型 |備考 |
|:--|:--|:--|
|id| integer| PK|
|cart_id| integer| FK|
|menu_id |integer |FK|
|qty |integer ||
|price |integer ||
|created_at|datetime| 自動生成|
|updated_at|datetime| 自動生成|

- orders テーブル（オーダーを管理するテーブル）

| カラム名 |データ型 |備考 |
|:--|:--|:--|
|id| integer| PK|
|customer_id| integer| FK|
|created_at|datetime| 自動生成|
|updated_at|datetime| 自動生成|

- order_details テーブル（オーダー内容を管理するテーブル）

| カラム名 |データ型 |備考 |
|:--|:--|:--|
|id| integer| PK|
|order_id| integer| FK|
|menu_name| string | |
|menu_price| integer | |
|created_at|datetime| 自動生成|
|updated_at|datetime| 自動生成|

### ER図
[![Image from Gyazo](https://i.gyazo.com/296d63de6a0b8182c49b2077f0068c51.png)](https://gyazo.com/296d63de6a0b8182c49b2077f0068c51)

### 使用技術
- フロントエンド
  - Vue.js (2.6.11)
- バックエンド 
  - Ruby (2.7.1)
  - Ruby on Rails (6.0.3.6)
  - Firebase authentication（ログイン機能）
- DB 
  - MySQL (RDS)
- インフラ
  - AWS (VPC | RDS | EC2 | ECR | ECS | Route53 | ACM| ALB ）
  - Docker  / docker-compose 
- ソースコード管理
  - GitHub
- CI/CD
  - GitHubActions 

### 今後追加したい機能
- 顧客詳細ページに「今まで飲んだビール（お酒）の量」を表示できるようにし、その量に応じてランクも表示される。
- お会計カートに商品を入れる際の処理を早くしたい。（画面をリダイレクトせず、フロントの処理で表示する）
- お会計一覧を年別、月別表示できるようにする。
- お会計詳細ページにて合計金額、お預かり金額、おつりを表示する。
- インフラのコード化を行う