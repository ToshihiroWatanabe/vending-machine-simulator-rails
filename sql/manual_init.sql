-- 製造者テーブル
CREATE TABLE IF NOT EXISTS vendors(
  -- 製造者ID
  id VARCHAR(36) PRIMARY KEY,
  -- 製造者名
  name VARCHAR(100) NOT NULL
);

-- 温度テーブル
CREATE TABLE IF NOT EXISTS temperatures(
  -- 温度ID
  id INTEGER PRIMARY KEY,
  -- 温度名
  name VARCHAR(36) NOT NULL
);

-- 製品テーブル
CREATE TABLE IF NOT EXISTS products(
  -- 製品ID
  id VARCHAR(36) PRIMARY KEY,
  -- 製品名
  name VARCHAR(100) NOT NULL,
  -- 温度ID
  temperature_id INTEGER NOT NULL,
  -- 価格
  price INTEGER NOT NULL,
  -- 製造者ID
  vendor_id VARCHAR(100) NOT NULL,
  FOREIGN KEY (temperature_id) REFERENCES temperatures(id),
  FOREIGN KEY (vendor_id) REFERENCES vendors(id)
);

-- 商品在庫テーブル
CREATE TABLE IF NOT EXISTS item_stocks(
  -- 在庫ID
  id INTEGER PRIMARY KEY,
  -- 製品ID
  product_id VARCHAR(36) NOT NULL,
  -- 在庫数
  quantity INTEGER NOT NULL,
  FOREIGN KEY (product_id) REFERENCES products(id)
);

-- 売上履歴テーブル
CREATE TABLE IF NOT EXISTS sales_histories(
  -- 履歴ID
  id VARCHAR(36) PRIMARY KEY,
  -- 購入時刻
  purchase_time TIMESTAMP NOT NULL,
  -- 製品ID
  product_id VARCHAR(36) NOT NULL,
  FOREIGN KEY (product_id) REFERENCES products(id)
);

-- 投入金額とお釣りテーブル
CREATE TABLE IF NOT EXISTS money_stocks(
  -- ID
  id INTEGER PRIMARY KEY,
  -- 投入金額
  deposit INTEGER NOT NULL,
  -- 投入した10円玉の残り枚数
  deposit_10 INTEGER NOT NULL,
  -- 投入した50円玉の残り枚数
  deposit_50 INTEGER NOT NULL,
  -- 投入した100円玉の残り枚数
  deposit_100 INTEGER NOT NULL,
  -- 投入した500円玉の残り枚数
  deposit_500 INTEGER NOT NULL,
  -- 投入した1000円札の残り枚数
  deposit_1000 INTEGER NOT NULL,
  -- 10円玉の残り枚数
  stock_10 INTEGER NOT NULL,
  -- 50円玉の残り枚数
  stock_50 INTEGER NOT NULL,
  -- 100円玉の残り枚数
  stock_100 INTEGER NOT NULL,
  -- 500円玉の残り枚数
  stock_500 INTEGER NOT NULL,
  -- 1000円玉の残り枚数
  stock_1000 INTEGER NOT NULL
);

INSERT INTO
  money_stocks(
    id,
    deposit,
    deposit_10,
    deposit_50,
    deposit_100,
    deposit_500,
    deposit_1000,
    stock_10,
    stock_50,
    stock_100,
    stock_500,
    stock_1000
  )
VALUES
  (
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    100,
    50,
    50,
    50,
    0
  );

INSERT INTO
  vendors (id, name)
VALUES
  ('1', '株式会社しみずき');

INSERT INTO
  vendors (id, name)
VALUES
  ('2', '株式会社あたつみ');

INSERT INTO
  temperatures(id, name)
VALUES
  (1, "つめたい");

INSERT INTO
  temperatures(id, name)
VALUES
  (2, "あたたかい");

INSERT INTO
  products (id, name, temperature_id, price, vendor_id)
VALUES
  (
    '1',
    '天然の水',
    1,
    '100',
    '1'
  );

INSERT INTO
  products (id, name, temperature_id, price, vendor_id)
VALUES
  (
    '2',
    'あったかコーヒー',
    2,
    '120',
    '2'
  );

INSERT INTO
  item_stocks (id, product_id, quantity)
VALUES
  (1, '1', 24);

INSERT INTO
  item_stocks (id, product_id, quantity)
VALUES
  (2, '2', 24);