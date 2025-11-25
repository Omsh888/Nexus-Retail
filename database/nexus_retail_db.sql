
DROP TABLE IF EXISTS tbl_order_items;
DROP TABLE IF EXISTS tbl_items;
DROP TABLE IF EXISTS tbl_orders;
DROP TABLE IF EXISTS tbl_category;
DROP TABLE IF EXISTS tbl_users;

-- CATEGORY TABLE
CREATE TABLE tbl_category (
    id SERIAL PRIMARY KEY,
    bg_color VARCHAR(255),
    category_id VARCHAR(255) UNIQUE,
    created_at TIMESTAMP,
    description VARCHAR(255),
    img_url VARCHAR(255),
    name VARCHAR(255) UNIQUE,
    updated_at TIMESTAMP
);

-- ITEMS TABLE
CREATE TABLE tbl_items (
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMP,
    description VARCHAR(255),
    img_url VARCHAR(255),
    item_id VARCHAR(255) UNIQUE,
    name VARCHAR(255),
    price NUMERIC(38,2),
    updated_at TIMESTAMP,
    category_id INTEGER NOT NULL,
    CONSTRAINT fk_items_category FOREIGN KEY (category_id)
      REFERENCES tbl_category(id) ON DELETE RESTRICT
);

-- ORDERS TABLE
CREATE TABLE tbl_orders (
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMP,
    customer_name VARCHAR(255),
    grand_total DOUBLE PRECISION,
    order_id VARCHAR(255),
    razorpay_order_id VARCHAR(255),
    razorpay_payment_id VARCHAR(255),
    razorpay_signature VARCHAR(255),
    status SMALLINT CHECK (status >= 0 AND status <= 2),
    payment_method TEXT,  -- replacing ENUM('CASH','UPI')
    phone_number VARCHAR(255),
    subtotal DOUBLE PRECISION,
    tax DOUBLE PRECISION
);

-- ORDER ITEMS TABLE
CREATE TABLE tbl_order_items (
    id SERIAL PRIMARY KEY,
    item_id VARCHAR(255),
    name VARCHAR(255),
    price DOUBLE PRECISION,
    quantity INTEGER,
    order_id INTEGER,
    CONSTRAINT fk_order_items_order FOREIGN KEY (order_id)
        REFERENCES tbl_orders(id)
);

-- USERS TABLE
CREATE TABLE tbl_users (
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMP,
    email VARCHAR(255),
    name VARCHAR(255),
    password VARCHAR(255),
    role VARCHAR(255),
    updated_at TIMESTAMP,
    user_id VARCHAR(255) UNIQUE
);
