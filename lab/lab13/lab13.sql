.read data.sql

-- QUESTIONS --



-------------------------------------------------------------------------
------------------------ Give Interest- ---------------------------------
-------------------------------------------------------------------------

UPDATE accounts
  SET amount = amount*1.02;


create table give_interest_result as select * from accounts; -- just for tests

-------------------------------------------------------------------------
------------------------ Split Accounts ---------------------------------
-------------------------------------------------------------------------

DELETE FROM accounts;
INSERT INTO accounts(name, amount) SELECT name ||"'s Savings account", amount/2 FROM give_interest_result;
INSERT INTO accounts(name, amount) SELECT name ||"'s Checking account", amount/2 FROM give_interest_result;

create table split_account_results as select * from accounts; -- just for tests

-------------------------------------------------------------------------
-------------------------------- Whoops ---------------------------------
-------------------------------------------------------------------------

DROP TABLE accounts;


CREATE TABLE average_prices AS
  SELECT category AS category, avg(MSRP) AS average_price
  from products GROUP BY category;

CREATE TABLE lowest_prices AS
  SELECT store AS store, item AS item, min(price) AS price
  from inventory GROUP BY item;

CREATE TABLE shopping_list AS
  SELECT name AS item, store AS store from products, lowest_prices
  WHERE name = item GROUP BY category HAVING min(MSRP/rating);

CREATE TABLE total_bandwidth AS
  SELECT sum(Mbs)AS Mbs from stores AS a, shopping_list AS b where a.store = b.store;
