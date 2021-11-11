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
    products (id, name, temperature, price, vendor_id)
VALUES
    (
        '1',
        '天然の水',
        'cold',
        '100',
        '1'
    );

INSERT INTO
    products (id, name, temperature, price, vendor_id)
VALUES
    (
        '2',
        'あったかコーヒー',
        'hot',
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