INSERT INTO
    money_stocks(
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
        stock_1000,
        created_at,
        updated_at
    )
VALUES
    (
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
        0,
        '1970-01-01 00:00:00',
        '1970-01-01 00:00:00'
    );

INSERT INTO
    vendors (name, created_at, updated_at)
VALUES
    (
        '株式会社しみずき',
        '1970-01-01 00:00:00',
        '1970-01-01 00:00:00'
    );

INSERT INTO
    vendors (name, created_at, updated_at)
VALUES
    (
        '株式会社あたつみ',
        '1970-01-01 00:00:00',
        '1970-01-01 00:00:00'
    );

INSERT INTO
    temperatures(name, created_at, updated_at)
VALUES
    (
        'つめたい',
        '1970-01-01 00:00:00',
        '1970-01-01 00:00:00'
    );

INSERT INTO
    temperatures(name, created_at, updated_at)
VALUES
    (
        'あたたかい',
        '1970-01-01 00:00:00',
        '1970-01-01 00:00:00'
    );

INSERT INTO
    products (
        name,
        temperature_id,
        price,
        vendor_id,
        created_at,
        updated_at
    )
VALUES
    (
        '天然の水',
        1,
        100,
        1,
        '1970-01-01 00:00:00',
        '1970-01-01 00:00:00'
    );

INSERT INTO
    products (
        name,
        temperature_id,
        price,
        vendor_id,
        created_at,
        updated_at
    )
VALUES
    (
        'あったかコーヒー',
        2,
        120,
        2,
        '1970-01-01 00:00:00',
        '1970-01-01 00:00:00'
    );

INSERT INTO
    products (
        name,
        temperature_id,
        price,
        vendor_id,
        created_at,
        updated_at
    )
VALUES
    (
        'エナジーパワー',
        1,
        210,
        1,
        '1970-01-01 00:00:00',
        '1970-01-01 00:00:00'
    );

INSERT INTO
    item_stocks (product_id, quantity, created_at, updated_at)
VALUES
    (
        1,
        24,
        '1970-01-01 00:00:00',
        '1970-01-01 00:00:00'
    );

INSERT INTO
    item_stocks (product_id, quantity, created_at, updated_at)
VALUES
    (
        2,
        24,
        '1970-01-01 00:00:00',
        '1970-01-01 00:00:00'
    );

INSERT INTO
    item_stocks (product_id, quantity, created_at, updated_at)
VALUES
    (
        3,
        24,
        '1970-01-01 00:00:00',
        '1970-01-01 00:00:00'
    );