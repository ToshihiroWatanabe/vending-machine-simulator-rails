# vending-machine-simulator-rails

自動販売機シミュレーター

# 実行方法

Dockerを起動して、以下のコマンドを実行してください。

```
docker-compose up -d
docker-compose run web rails db:create
docker-compose run web rails db:migrate
```

money_stocksテーブルに初期データを挿入してください。