-- creatdb encylopedia
-- psql -d encylopedia

-- create table countries (
--  id serial,
--  name varchar(50) unique not null,
--  capital varchar(50) unique,
--  population integer
--);

-- create table famous_people (
-- id serial,
-- name varchar(100) not null,
-- occupation varchar(150),
-- date_of_birth varchar(50),
-- deceased boolean default false
-- );

-- create table animals (
-- id serial,
-- name varchar(100) not null,
-- binomial_name varchar(100) not null,
-- max_weight_kg decimal(8, 3),
-- max_age_years integer,
-- conservation_status char(2)
-- );

-- \dt
 
-- \d animals
 
-- create database ls_burger;

-- \c ls_burger;

create table orders (
  id serial,
  customer_name varchar(100) not null,
  burger varchar(50),
  side varchar(50),
  drink varchar(50),
  order_total decimal(4, 2) not null
);