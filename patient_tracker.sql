--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: doctors; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE doctors (
    id integer NOT NULL,
    specialty_id integer,
    first_name character varying,
    last_name character varying
);


ALTER TABLE doctors OWNER TO "Guest";

--
-- Name: doctors_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE doctors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE doctors_id_seq OWNER TO "Guest";

--
-- Name: doctors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE doctors_id_seq OWNED BY doctors.id;


--
-- Name: patients; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE patients (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    dob character varying,
    doctor_id integer
);


ALTER TABLE patients OWNER TO "Guest";

--
-- Name: patients_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE patients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE patients_id_seq OWNER TO "Guest";

--
-- Name: patients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE patients_id_seq OWNED BY patients.id;


--
-- Name: specialties; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE specialties (
    id integer NOT NULL,
    specialty character varying
);


ALTER TABLE specialties OWNER TO "Guest";

--
-- Name: specialties_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE specialties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE specialties_id_seq OWNER TO "Guest";

--
-- Name: specialties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE specialties_id_seq OWNED BY specialties.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY doctors ALTER COLUMN id SET DEFAULT nextval('doctors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY patients ALTER COLUMN id SET DEFAULT nextval('patients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY specialties ALTER COLUMN id SET DEFAULT nextval('specialties_id_seq'::regclass);


--
-- Data for Name: doctors; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY doctors (id, specialty_id, first_name, last_name) FROM stdin;
\.


--
-- Name: doctors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('doctors_id_seq', 1, false);


--
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY patients (id, first_name, last_name, dob, doctor_id) FROM stdin;
\.


--
-- Name: patients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('patients_id_seq', 1, false);


--
-- Data for Name: specialties; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY specialties (id, specialty) FROM stdin;
\.


--
-- Name: specialties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('specialties_id_seq', 1, false);


--
-- Name: doctors_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (id);


--
-- Name: patients_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (id);


--
-- Name: specialties_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY specialties
    ADD CONSTRAINT specialties_pkey PRIMARY KEY (id);


--
-- Name: doctors_specialty_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY doctors
    ADD CONSTRAINT doctors_specialty_id_fkey FOREIGN KEY (specialty_id) REFERENCES specialties(id);


--
-- Name: patients_doctor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY patients
    ADD CONSTRAINT patients_doctor_id_fkey FOREIGN KEY (doctor_id) REFERENCES doctors(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: epicodus
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM epicodus;
GRANT ALL ON SCHEMA public TO epicodus;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

