/*
*
*  En esta version se une la tabla info y categorias en una sola y ahora solo quedan 3 tablas.
*
*
 */

CREATE DATABASE IF NOT EXISTS uripass2;

USE uripass2;

CREATE TABLE users(
  id_user INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  user_name VARCHAR(30) NOT NULL,
  user_last_name VARCHAR(30) NOT NULL,
  user_avatar VARCHAR(150) DEFAULT 'no-poster.jpg',
  user VARCHAR(15) NOT NULL,
  email VARCHAR(80) UNIQUE NOT NULL,
  pass CHAR(32) NOT NULL,
  role ENUM('Admin', 'User') NOT NULL
);

CREATE TABLE categories(
  id_categorie INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  categorie_name VARCHAR(20) NOT NULL
);

CREATE TABLE accounts(
  id_account INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  id_user INTEGER UNSIGNED NOT NULL,
  id_categorie INTEGER UNSIGNED NOT NULL,
  account_name VARCHAR(80) NOT NULL,
  sm_login VARCHAR(20),
  sm_password VARCHAR(30),
  sm_email VARCHAR(80),
  sm_tel VARCHAR(20),
  sus_login VARCHAR(20),
  sus_password VARCHAR(30),
  sus_email VARCHAR(80),
  sus_tel VARCHAR(20),
  edu_login VARCHAR(20),
  edu_password VARCHAR(30),
  edu_email VARCHAR(80),
  edu_url VARCHAR(150),
  ema_login VARCHAR(20),
  ema_password VARCHAR(30),
  ema_tel VARCHAR(20),
  bnk_on_login VARCHAR(20),
  bnk_on_password VARCHAR(30),
  bnk_tel_password VARCHAR(30),
  bnk_num_account INTEGER,
  bnk_clabe INTEGER,
  serv_on_login VARCHAR(20),
  serv_on_password VARCHAR(30),
  serv_url VARCHAR(150),
  serv_ftp_user VARCHAR(30),
  serv_ftp_pass VARCHAR(30),
  serv_ftp_url VARCHAR(150),
  FOREIGN KEY (id_categorie) REFERENCES categories(id_categorie)
      ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (id_user) REFERENCES users(id_user)
    ON DELETE CASCADE ON UPDATE CASCADE
);

/*
* Inserts de catalogo
*/

INSERT INTO categories (categorie_name) VALUES
 ('social media'),
 ('suscriptions'),
 ('education'),
 ('e-mails'),
 ('banks'),
 ('servers');



 /*
 * Inserts de pruebas
 */

 INSERT INTO users(user_name, user_last_name, user, email, pass, role) VALUES
    ('Adan Uri', 'Plata', 'urivanhalen', 'adnauriplata@gmail.com', MD5('irunada'), 'Admin');

INSERT INTO users(user_name, user_last_name, user, email, pass, role) VALUES
  ('Viviana', 'Arellano', 'hiedrak', 'vivianaarellano123@gmail.com', MD5('sopita.com'), 'User');

INSERT INTO accounts(id_user, id_categorie, account_name) VALUES
    (1, 1, 'Twitter');

INSERT INTO accounts(id_user, id_categorie, account_name) VALUES
    (1, 1, 'Twitter');

INSERT INTO accounts(id_user, id_categorie, account_name, sm_login, sm_password, sm_email) VALUES
    (2, 1, 'twitter', 'hiekrak', MD5('sopita.com'), 'hiedrak@hotmail.com');



/*
*
* Query+s Test
*
*/

SELECT  account_name, sm_login, sm_password
FROM accounts WHERE id_user = 1;

SELECT  accounts.account_name, accounts.sm_login, accounts.sm_password, categories.categorie_name
FROM accounts
INNER JOIN categories ON accounts.id_categorie = categories.id_categorie
WHERE id_user = 1;

SELECT  users.user_name, accounts.account_name, accounts.sm_login, accounts.sm_password, categories.categorie_name
FROM users
  INNER JOIN accounts
    ON users.id_user = accounts.id_user
  INNER JOIN categories
    ON accounts.id_categorie = categories.id_categorie
WHERE accounts.id_user = 1;

SELECT  users.user_name, accounts.account_name, accounts.sm_login, accounts.sm_password, categories.categorie_name
FROM users
  INNER JOIN accounts
    ON users.id_user = accounts.id_user
  INNER JOIN categories
    ON accounts.id_categorie = categories.id_categorie
WHERE categories.categorie_name = 'social media' && accounts.id_user = 2;