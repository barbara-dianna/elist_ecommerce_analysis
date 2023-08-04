--Create a grocery store database for March 2023
CREATE TABLE miabellacasa (id INTEGER PRIMARY KEY, item TEXT, selling_price INTEGER, buying_price INTEGER, quantity_sold INTEGER, category TEXT);

INSERT INTO miabellacasa VALUES 
(1, "couch", 1500, 800, 23, "furniture"),
(2, "chandelier", 450, 200, 45, "decor"),
(3, "pillow", 30, 15, 67, "decor"),
(4, "dining table", 700, 500, 15, "furniture"),
(5, "dining chairs", 150, 75, 60, "furniture"),
(6, "night stand", 100, 40, 40, "furniture"),
(7, "bath robe", 20, 10, 50, "clothing"),
(8, "shower curtain", 25, 9, 48, "decor"),
(9, "desk", 250, 150,  23, "furniture"),
(10, "desk chair", 70, 40, 23, "furniture"),
(11, "pillow case", 15, 5, 50, "decor"),
(12, "geode statue", 150, 80, 3, "decor"),
(13, "desk lamp", 50, 20, 21, "decor"),
(14, "cooking apron", 14, 7, 22, "clothing"),
(15, "basket", 18, 6, 31, "decor");

--display the database ordered by price. 
SELECT * FROM miabellacasa 
ORDER by selling_price;

--what was the gross revenue of all the items sold in March 2023?
SELECT category, SUM(selling_price*quantity_sold) FROM miabellacasa GROUP BY category;

--what were the expenses of all the items sold in March 2023?
SELECT category, SUM(buying_price*quantity_sold) FROM miabellacasa GROUP BY category;
