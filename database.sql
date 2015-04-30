--
-- PostgreSQL database dump
--


CREATE TABLE restaurant (
    id integer NOT NULL,
    name text
);


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
-- TOC entry 2035 (class 0 OID 24603)
-- Dependencies: 180
-- Data for Name: votes; Type: TABLE DATA; Schema: lunch; Owner: zthxnmqipqknci
--

INSERT INTO votes VALUES (31, 1, 9, '2015-04-27', 1);
INSERT INTO votes VALUES (32, 2, 9, '2015-04-27', 1);
INSERT INTO votes VALUES (33, 3, 9, '2015-04-27', 1);


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
