-- create departments table
CREATE TABLE departments (
  department_id int DEFAULT NULL,
  department text,
  primary key (department_id)
) ;

-- create aisle table
CREATE TABLE aisle(
   aisle_id INTEGER NOT NULL PRIMARY KEY
  ,aisle   VARCHAR(29) NOT NULL
);

-- create orders table
CREATE TABLE orders (
  order_id int NOT NULL primary key,
  user_id int DEFAULT NULL,
  eval_set text,
  order_number int DEFAULT NULL,
  order_dow int DEFAULT NULL,
  order_hour_of_da int DEFAULT NULL,
  days_since_prior_order text
)

-- create products table
CREATE TABLE products(
  product_id int NOT NULL primary key,
  product_name text,
  aisle_id int DEFAULT NULL,
  department_id int DEFAULT NULL,
  CONSTRAINT ai FOREIGN KEY (aisle_id) REFERENCES aisle (aisle_id) ,
  CONSTRAINT di FOREIGN KEY (department_id) REFERENCES departments (department_id) 
)

-- create order_products table
CREATE TABLE order_products(
   order_id         INTEGER NOT NULL 
  ,product_id       INTEGER NOT NULL 
  ,add_to_cart_order INTEGER NOT NULL
  ,reordered        INTEGER NOT NULL,
   primary key(order_id,product_id),
  CONSTRAINT od FOREIGN KEY (order_id) REFERENCES orders (order_id),
  CONSTRAINT pr FOREIGN KEY (product_id) REFERENCES products (product_id)
);

