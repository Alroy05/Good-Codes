
CREATE TABLE product_dimension (
    product_id SERIAL PRIMARY KEY NOT NULL,
    product_name VARCHAR(255),
    category VARCHAR(255),
    manufacturer VARCHAR(255),
    price DECIMAL(10, 2),
    size VARCHAR(20),
    weight DECIMAL(5, 2)
);

INSERT INTO product_dimension (product_name, category, manufacturer, price, size, weight)
VALUES
    ('Laptop', 'Electronics', 'Dell', 800.00, '15 inches', 5.0),
    ('T-Shirt', 'Clothing', 'Nike', 25.00, 'M', 0.3),
    ('Apples', 'Grocery', NULL, 2.00, NULL, 0.1),
    ('Washing Machine', 'Appliances', 'LG', 600.00, '30 inches', 20.0),
    ('Shoes', 'Footwear', 'Adidas', 70.00, '10', 0.7);
    
CREATE TABLE store_dimension (
    store_id SERIAL PRIMARY KEY,
    store_name VARCHAR(255),
    location VARCHAR(255),
    size VARCHAR(20),
    manager VARCHAR(255),
    contact_information VARCHAR(255)
);

INSERT INTO store_dimension (store_name, location, size, manager, contact_information)
VALUES
    ('HyperMart', 'New York', 'Large', 'John Doe', 'john.doe@hypermart.com'),
    ('SuperMart', 'Los Angeles', 'Medium', 'Jane Smith', 'jane.smith@supermart.com'),
    ('MegaMart', 'Chicago', 'Large', 'Bob Johnson', 'bob.johnson@megamart.com');
    
CREATE TABLE time_dimension (
    time_id SERIAL PRIMARY KEY,
    date DATE,
    day_of_week VARCHAR(20),
    month VARCHAR(20),
    quarter VARCHAR(5),
    year INTEGER,
    holiday_indicator INTEGER
);

INSERT INTO time_dimension (date, day_of_week, month, quarter, year, holiday_indicator)
VALUES
    ('2023-10-01', 'Sunday', 'October', 'Q4', 2023, 0),
    ('2023-10-02', 'Monday', 'October', 'Q4', 2023, 0),
    ('2023-10-03', 'Tuesday', 'October', 'Q4', 2023, 0);

CREATE TABLE promotion_dimension (
    promotion_id SERIAL PRIMARY KEY,
    promotion_name VARCHAR(255),
    type VARCHAR(255),
    start_date DATE,
    end_date DATE,
    discount_percentage DECIMAL(5, 2)
);

INSERT INTO promotion_dimension (promotion_name, type, start_date, end_date, discount_percentage)
VALUES
    ('Back to School', 'Seasonal', '2023-08-01', '2023-09-15', 10.00),
    ('Holiday Sale', 'Seasonal', '2023-11-25', '2023-12-25', 15.00);
    
CREATE TABLE sales_fact (
    fact_id SERIAL PRIMARY KEY,
    product_id INTEGER REFERENCES product_dimension(product_id),
    store_id INTEGER REFERENCES store_dimension(store_id),
    time_id INTEGER REFERENCES time_dimension(time_id),
    promotion_id INTEGER REFERENCES promotion_dimension(promotion_id),
    sales_amount DECIMAL(10, 2),
    quantity_sold INTEGER,
    profit DECIMAL(10, 2)
);

INSERT INTO sales_fact (product_id, store_id, time_id, promotion_id, sales_amount, quantity_sold, profit)
VALUES
    (1, 1, 1, 1, 800.00, 1, 100.00),
    (2, 2, 2, 2, 50.00, 2, 15.00),
    (3, 1, 3, 1, 5.00, 10, 2.00),
    (4, 3, 2, 2, 600.00, 1, 80.00),
    (5, 2, 1, 1, 140.00, 2, 30.00);


select * from product_dimension;
select * from store_dimension;
select * from time_dimension;
select * from promotion_dimension;
select * from sales_fact;


