--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4beta3
-- Dumped by pg_dump version 9.4.0
-- Started on 2015-04-27 01:59:28

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

DROP DATABASE d388rk93lku2h2;
--
-- TOC entry 2040 (class 1262 OID 16398)
-- Name: d388rk93lku2h2; Type: DATABASE; Schema: -; Owner: zthxnmqipqknci
--

CREATE DATABASE d388rk93lku2h2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE d388rk93lku2h2 OWNER TO zthxnmqipqknci;

\connect d388rk93lku2h2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 7 (class 2615 OID 16399)
-- Name: lunch; Type: SCHEMA; Schema: -; Owner: zthxnmqipqknci
--

CREATE SCHEMA lunch;


ALTER SCHEMA lunch OWNER TO zthxnmqipqknci;

--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2041 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 181 (class 3079 OID 11861)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2043 (class 0 OID 0)
-- Dependencies: 181
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = lunch, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 176 (class 1259 OID 24588)
-- Name: restaurant; Type: TABLE; Schema: lunch; Owner: zthxnmqipqknci; Tablespace:
--

CREATE TABLE restaurant (
    id integer NOT NULL,
    name text
);


ALTER TABLE restaurant OWNER TO zthxnmqipqknci;

--
-- TOC entry 175 (class 1259 OID 24586)
-- Name: restaurant_id_seq; Type: SEQUENCE; Schema: lunch; Owner: zthxnmqipqknci
--

CREATE SEQUENCE restaurant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE restaurant_id_seq OWNER TO zthxnmqipqknci;

--
-- TOC entry 2044 (class 0 OID 0)
-- Dependencies: 175
-- Name: restaurant_id_seq; Type: SEQUENCE OWNED BY; Schema: lunch; Owner: zthxnmqipqknci
--

ALTER SEQUENCE restaurant_id_seq OWNED BY restaurant.id;


--
-- TOC entry 174 (class 1259 OID 16402)
-- Name: users; Type: TABLE; Schema: lunch; Owner: zthxnmqipqknci; Tablespace:
--

CREATE TABLE users (
    id integer NOT NULL,
    username text,
    pwd text
);


ALTER TABLE users OWNER TO zthxnmqipqknci;

--
-- TOC entry 173 (class 1259 OID 16400)
-- Name: users_id_seq; Type: SEQUENCE; Schema: lunch; Owner: zthxnmqipqknci
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO zthxnmqipqknci;

--
-- TOC entry 2045 (class 0 OID 0)
-- Dependencies: 173
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: lunch; Owner: zthxnmqipqknci
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 180 (class 1259 OID 24603)
-- Name: votes; Type: TABLE; Schema: lunch; Owner: zthxnmqipqknci; Tablespace:
--

CREATE TABLE votes (
    voteid integer NOT NULL,
    restaurantid integer NOT NULL,
    userid integer NOT NULL,
    date date,
    vote integer
);


ALTER TABLE votes OWNER TO zthxnmqipqknci;

--
-- TOC entry 178 (class 1259 OID 24599)
-- Name: votes_restaurantId_seq; Type: SEQUENCE; Schema: lunch; Owner: zthxnmqipqknci
--

CREATE SEQUENCE "votes_restaurantId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "votes_restaurantId_seq" OWNER TO zthxnmqipqknci;

--
-- TOC entry 2046 (class 0 OID 0)
-- Dependencies: 178
-- Name: votes_restaurantId_seq; Type: SEQUENCE OWNED BY; Schema: lunch; Owner: zthxnmqipqknci
--

ALTER SEQUENCE "votes_restaurantId_seq" OWNED BY votes.restaurantid;


--
-- TOC entry 179 (class 1259 OID 24601)
-- Name: votes_userId_seq; Type: SEQUENCE; Schema: lunch; Owner: zthxnmqipqknci
--

CREATE SEQUENCE "votes_userId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "votes_userId_seq" OWNER TO zthxnmqipqknci;

--
-- TOC entry 2047 (class 0 OID 0)
-- Dependencies: 179
-- Name: votes_userId_seq; Type: SEQUENCE OWNED BY; Schema: lunch; Owner: zthxnmqipqknci
--

ALTER SEQUENCE "votes_userId_seq" OWNED BY votes.userid;


--
-- TOC entry 177 (class 1259 OID 24597)
-- Name: votes_voteid_seq; Type: SEQUENCE; Schema: lunch; Owner: zthxnmqipqknci
--

CREATE SEQUENCE votes_voteid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE votes_voteid_seq OWNER TO zthxnmqipqknci;

--
-- TOC entry 2048 (class 0 OID 0)
-- Dependencies: 177
-- Name: votes_voteid_seq; Type: SEQUENCE OWNED BY; Schema: lunch; Owner: zthxnmqipqknci
--

ALTER SEQUENCE votes_voteid_seq OWNED BY votes.voteid;


--
-- TOC entry 1905 (class 2604 OID 24591)
-- Name: id; Type: DEFAULT; Schema: lunch; Owner: zthxnmqipqknci
--

ALTER TABLE ONLY restaurant ALTER COLUMN id SET DEFAULT nextval('restaurant_id_seq'::regclass);


--
-- TOC entry 1904 (class 2604 OID 16405)
-- Name: id; Type: DEFAULT; Schema: lunch; Owner: zthxnmqipqknci
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 1906 (class 2604 OID 24606)
-- Name: voteid; Type: DEFAULT; Schema: lunch; Owner: zthxnmqipqknci
--

ALTER TABLE ONLY votes ALTER COLUMN voteid SET DEFAULT nextval('votes_voteid_seq'::regclass);


--
-- TOC entry 1907 (class 2604 OID 24607)
-- Name: restaurantid; Type: DEFAULT; Schema: lunch; Owner: zthxnmqipqknci
--

ALTER TABLE ONLY votes ALTER COLUMN restaurantid SET DEFAULT nextval('"votes_restaurantId_seq"'::regclass);


--
-- TOC entry 1908 (class 2604 OID 24608)
-- Name: userid; Type: DEFAULT; Schema: lunch; Owner: zthxnmqipqknci
--

ALTER TABLE ONLY votes ALTER COLUMN userid SET DEFAULT nextval('"votes_userId_seq"'::regclass);


--
-- TOC entry 2031 (class 0 OID 24588)
-- Dependencies: 176
-- Data for Name: restaurant; Type: TABLE DATA; Schema: lunch; Owner: zthxnmqipqknci
--

INSERT INTO restaurant VALUES (1, 'r1');
INSERT INTO restaurant VALUES (2, 'r2');
INSERT INTO restaurant VALUES (3, 'r3');
INSERT INTO restaurant VALUES (4, 'r4');
INSERT INTO restaurant VALUES (5, 'r5');


--
-- TOC entry 2049 (class 0 OID 0)
-- Dependencies: 175
-- Name: restaurant_id_seq; Type: SEQUENCE SET; Schema: lunch; Owner: zthxnmqipqknci
--

SELECT pg_catalog.setval('restaurant_id_seq', 1, false);


--
-- TOC entry 2029 (class 0 OID 16402)
-- Dependencies: 174
-- Data for Name: users; Type: TABLE DATA; Schema: lunch; Owner: zthxnmqipqknci
--

INSERT INTO users VALUES (1, 'elendal', 'blah');
INSERT INTO users VALUES (2, 'foo', 'bar');
INSERT INTO users VALUES (3, 'u1', 'p1');
INSERT INTO users VALUES (4, NULL, NULL);
INSERT INTO users VALUES (5, NULL, NULL);
INSERT INTO users VALUES (6, NULL, NULL);
INSERT INTO users VALUES (7, NULL, NULL);
INSERT INTO users VALUES (8, 'Helloi.gouss@gmail.com', 'blah');
INSERT INTO users VALUES (9, 'i.gouss@gmail.com', 'blah');


--
-- TOC entry 2050 (class 0 OID 0)
-- Dependencies: 173
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: lunch; Owner: zthxnmqipqknci
--

SELECT pg_catalog.setval('users_id_seq', 10, true);


--
-- TOC entry 2035 (class 0 OID 24603)
-- Dependencies: 180
-- Data for Name: votes; Type: TABLE DATA; Schema: lunch; Owner: zthxnmqipqknci
--

INSERT INTO votes VALUES (31, 1, 9, '2015-04-27', 1);
INSERT INTO votes VALUES (32, 2, 9, '2015-04-27', 1);
INSERT INTO votes VALUES (33, 3, 9, '2015-04-27', 1);


--
-- TOC entry 2051 (class 0 OID 0)
-- Dependencies: 178
-- Name: votes_restaurantId_seq; Type: SEQUENCE SET; Schema: lunch; Owner: zthxnmqipqknci
--

SELECT pg_catalog.setval('"votes_restaurantId_seq"', 3, true);


--
-- TOC entry 2052 (class 0 OID 0)
-- Dependencies: 179
-- Name: votes_userId_seq; Type: SEQUENCE SET; Schema: lunch; Owner: zthxnmqipqknci
--

SELECT pg_catalog.setval('"votes_userId_seq"', 4, true);


--
-- TOC entry 2053 (class 0 OID 0)
-- Dependencies: 177
-- Name: votes_voteid_seq; Type: SEQUENCE SET; Schema: lunch; Owner: zthxnmqipqknci
--

SELECT pg_catalog.setval('votes_voteid_seq', 33, true);


--
-- TOC entry 1914 (class 2606 OID 24596)
-- Name: restaurant_id; Type: CONSTRAINT; Schema: lunch; Owner: zthxnmqipqknci; Tablespace:
--

ALTER TABLE ONLY restaurant
    ADD CONSTRAINT restaurant_id PRIMARY KEY (id);


--
-- TOC entry 1910 (class 2606 OID 24622)
-- Name: unique_username; Type: CONSTRAINT; Schema: lunch; Owner: zthxnmqipqknci; Tablespace:
--

ALTER TABLE ONLY users
    ADD CONSTRAINT unique_username UNIQUE (username);


--
-- TOC entry 1912 (class 2606 OID 16410)
-- Name: users_id; Type: CONSTRAINT; Schema: lunch; Owner: zthxnmqipqknci; Tablespace:
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_id PRIMARY KEY (id);


--
-- TOC entry 1916 (class 2606 OID 24610)
-- Name: vote_id; Type: CONSTRAINT; Schema: lunch; Owner: zthxnmqipqknci; Tablespace:
--

ALTER TABLE ONLY votes
    ADD CONSTRAINT vote_id PRIMARY KEY (voteid);


--
-- TOC entry 1918 (class 2606 OID 24616)
-- Name: restaurant_id; Type: FK CONSTRAINT; Schema: lunch; Owner: zthxnmqipqknci
--

ALTER TABLE ONLY votes
    ADD CONSTRAINT restaurant_id FOREIGN KEY (restaurantid) REFERENCES restaurant(id);


--
-- TOC entry 1917 (class 2606 OID 24611)
-- Name: user_id; Type: FK CONSTRAINT; Schema: lunch; Owner: zthxnmqipqknci
--

ALTER TABLE ONLY votes
    ADD CONSTRAINT user_id FOREIGN KEY (userid) REFERENCES users(id);


--
-- TOC entry 2042 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-04-27 01:59:29

--
-- PostgreSQL database dump complete
--
