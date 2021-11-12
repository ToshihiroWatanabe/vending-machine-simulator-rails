# vending-machine-simulator-rails

自動販売機シミュレーター

# 主な使用技術

- Ruby on Rails
- PostgreSQL
- Docker

# 実行方法

Dockerを起動して、以下のコマンドを実行してください。

```
docker-compose up -d
docker-compose run web rails db:create
docker-compose run web rails db:migrate
```

その後、テーブルに初期データを挿入してください。
[data.sql](sql/data.sql)