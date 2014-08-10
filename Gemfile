source 'https://rubygems.org'

gem 'rails', '4.1.4'

gem 'mysql2'
gem 'bcrypt', '3.1.7'


# JavaScript
gem 'therubyracer',  platforms: :ruby    # JavaScriptのエンジン
gem 'uglifier', '2.5.3'                  # JavaScriptの圧縮
gem 'jquery-rails', '3.1.1'              # jQueryが使える
gem 'jbuilder', '2.1.3'                  # JSONレスポンスを効率的に書ける
# gem 'turbolinks', '2.2.2'                # ページ遷移をJavaScriptで代用する

# Configuration
gem 'rails_config', '0.4.2'    # 設定ファイルの管理

# Authentication
gem 'devise', '3.2.4'               # 認証系のライブラリ
gem 'omniauth', '1.2.2'             # 外部アカウントでログインできる
gem 'omniauth-twitter', '1.0.1'     # Omniauthを使ってTwitterログインできる
gem 'omniauth-facebook', '2.0.0'    # Omniauthを使ってFacebookログインできる

# Sass
# 現状、Twitter Bootstrap十分
# 必要になったら使う
# gem 'sass-rails'        # CSSを効率的に書ける
# gem 'bootstrap-sass'    # Twitter Bootstrapが使える
# gem 'compass-rails'     # Sassの機能拡張

# Twitter Bootstrap
gem 'twitter-bootswatch-rails', '3.2.0.0'            # TwitterBootstrapのデザインコレクションを簡単に使える
gem 'twitter-bootswatch-rails-helpers', '3.2.0.0'    # TwitterBootstrapのヘルパ

# Form
gem 'simple_form', '3.1.0.rc2'    # TwitterBootstrapに対応したフォームを簡単に書ける

# Pagination
# gem 'kaminari'                         # ページング
gem 'will_paginate', '3.0.7'           # ページングのライブラリ
gem 'will_paginate-bootstrap', '1.0.1' # ページングをTwitterBootstrapに対応させる

# i18n
gem 'geoip', '1.4.0'    # ipからロケール情報を知るために

# Uploader
# gem 'carrierwave'    # 画像アップローダ
# gem 'mini_magick'    # CarrierWaveでリサイズなどができるようになる
# gem 'fog'            # CarrierWaveでAmazon S3に保存できるようになる

# AutoLink
# gem 'rails_autolink'    # URLの自動リンク化

# Tag
# gem 'acts-as-taggable-on'    # タグ機能を実装できる

group :development, :test do

  gem 'guard', '2.6.1'                 # ファイルが変更を検知するライブラリ
  gem 'guard-rspec', '4.3.1'           # ファイルが変更されたらRsepcを自動実行
  gem 'guard-livereload', '2.3.0'      # ファイルが変更されたらページを自動リロード
  gem 'spring', '1.1.3'                # Railsをプリロードする
  gem 'spring-commands-rspec', '1.0.2' # Rspec用のSpring
  gem 'bullet', '4.13.1'               # N+1問題とか余計なSQLを検出できる

  # Test
  gem 'rspec', '3.0.0'                  # テストのライブラリ
  gem 'rspec-rails', '3.0.2'            # RailsをRspecでテストするためのgem
  gem 'ffaker', '1.24.0'                # テストデータの生成
  gem 'factory_girl_rails', '4.4.1'     # テストデータの生成
  gem 'selenium-webdriver', '2.42.0'    # ブラウザでの操作をシミュレートしてテストができる
  gem 'capybara', '2.4.1'               # ブラウザでの操作をシミュレートしてテストができる
  gem 'database_cleaner', github: 'bmabey/database_cleaner' # テスト実行後にDBをクリア

  # Deploy
  gem 'capistrano', require: false            # デプロイツール
  gem 'capistrano-ext', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rbenv', require: false
  gem 'capistrano-bundler', require: false

  # Debug
  gem 'debugger'                      # デバッガー
  gem 'better_errors', '1.1.0'        # エラー画面を見やすくする
  gem 'binding_of_caller', '0.7.2'    # better_errorsのエラー画面でREPLが使える
  gem 'tapp', '1.4.1'                 # プリントデバッグがしやすくなる
  gem 'pry-rails', '0.3.2'            # railsでpryが使える
  gem 'pry-byebug', '1.3.3'           # pryでデバックコマンドが使える
  gem 'awesome_print', '1.2.0'        # プリントデバッグの出力を整形
  gem 'hirb', '0.7.2'                 # SQLの結果を見やすく整形してくれる
  gem 'hirb-unicode', '0.0.5'         # hirbの日本語対応
end

group :doc do
  gem 'sdoc', '0.4.0', require: false
end

# Use unicorn as the app server
# gem 'unicorn'
