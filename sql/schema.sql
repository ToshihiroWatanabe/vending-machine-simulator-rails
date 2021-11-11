-- Table: public.vendors
-- DROP TABLE IF EXISTS public.vendors;
CREATE TABLE IF NOT EXISTS public.vendors (
    id bigint NOT NULL DEFAULT nextval('vendors_id_seq' :: regclass),
    name character varying COLLATE pg_catalog."default" NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    CONSTRAINT vendors_pkey PRIMARY KEY (id)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS public.vendors OWNER TO postgres;

-- Table: public.temperatures
-- DROP TABLE IF EXISTS public.temperatures;
CREATE TABLE IF NOT EXISTS public.temperatures (
    id bigint NOT NULL DEFAULT nextval('temperatures_id_seq' :: regclass),
    name character varying COLLATE pg_catalog."default" NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    CONSTRAINT temperatures_pkey PRIMARY KEY (id)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS public.temperatures OWNER TO postgres;

-- Table: public.products
-- DROP TABLE IF EXISTS public.products;
CREATE TABLE IF NOT EXISTS public.products (
    id bigint NOT NULL DEFAULT nextval('products_id_seq' :: regclass),
    name character varying COLLATE pg_catalog."default",
    temperature_id bigint NOT NULL,
    price integer,
    vendor_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    CONSTRAINT products_pkey PRIMARY KEY (id),
    CONSTRAINT fk_rails_52615103db FOREIGN KEY (vendor_id) REFERENCES public.vendors (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT fk_rails_7a981fbe98 FOREIGN KEY (temperature_id) REFERENCES public.temperatures (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS public.products OWNER TO postgres;

-- Index: index_products_on_temperature_id
-- DROP INDEX IF EXISTS public.index_products_on_temperature_id;
CREATE INDEX IF NOT EXISTS index_products_on_temperature_id ON public.products USING btree (temperature_id ASC NULLS LAST) TABLESPACE pg_default;

-- Index: index_products_on_vendor_id
-- DROP INDEX IF EXISTS public.index_products_on_vendor_id;
CREATE INDEX IF NOT EXISTS index_products_on_vendor_id ON public.products USING btree (vendor_id ASC NULLS LAST) TABLESPACE pg_default;

-- Table: public.item_stocks
-- DROP TABLE IF EXISTS public.item_stocks;
CREATE TABLE IF NOT EXISTS public.item_stocks (
    id bigint NOT NULL DEFAULT nextval('item_stocks_id_seq' :: regclass),
    product_id bigint NOT NULL,
    quantity integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    CONSTRAINT item_stocks_pkey PRIMARY KEY (id),
    CONSTRAINT fk_rails_0a46d3b6a0 FOREIGN KEY (product_id) REFERENCES public.products (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS public.item_stocks OWNER TO postgres;

-- Index: index_item_stocks_on_product_id
-- DROP INDEX IF EXISTS public.index_item_stocks_on_product_id;
CREATE INDEX IF NOT EXISTS index_item_stocks_on_product_id ON public.item_stocks USING btree (product_id ASC NULLS LAST) TABLESPACE pg_default;

-- Table: public.sales_histories
-- DROP TABLE IF EXISTS public.sales_histories;
CREATE TABLE IF NOT EXISTS public.sales_histories (
    id bigint NOT NULL DEFAULT nextval('sales_histories_id_seq' :: regclass),
    purchase_time timestamp without time zone NOT NULL,
    product_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    CONSTRAINT sales_histories_pkey PRIMARY KEY (id),
    CONSTRAINT fk_rails_1cb2ee81e8 FOREIGN KEY (product_id) REFERENCES public.products (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS public.sales_histories OWNER TO postgres;

-- Index: index_sales_histories_on_product_id
-- DROP INDEX IF EXISTS public.index_sales_histories_on_product_id;
CREATE INDEX IF NOT EXISTS index_sales_histories_on_product_id ON public.sales_histories USING btree (product_id ASC NULLS LAST) TABLESPACE pg_default;

-- Table: public.money_stocks
-- DROP TABLE IF EXISTS public.money_stocks;
CREATE TABLE IF NOT EXISTS public.money_stocks (
    id bigint NOT NULL DEFAULT nextval('money_stocks_id_seq' :: regclass),
    deposit integer NOT NULL,
    deposit_10 integer NOT NULL,
    deposit_50 integer NOT NULL,
    deposit_100 integer NOT NULL,
    deposit_500 integer NOT NULL,
    deposit_1000 integer NOT NULL,
    stock_10 integer NOT NULL,
    stock_50 integer NOT NULL,
    stock_100 integer NOT NULL,
    stock_500 integer NOT NULL,
    stock_1000 integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    CONSTRAINT money_stocks_pkey PRIMARY KEY (id)
) TABLESPACE pg_default;

ALTER TABLE
    IF EXISTS public.money_stocks OWNER TO postgres;