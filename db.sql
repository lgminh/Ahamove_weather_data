--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.6
-- Dumped by pg_dump version 9.5.7

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: weather_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE weather_id_seq
    START WITH 30394
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE weather_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: weather; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE weather (
    id integer DEFAULT nextval('weather_id_seq'::regclass) NOT NULL,
    data jsonb,
    city_id text,
    date integer
);


ALTER TABLE weather OWNER TO postgres;

--
-- Data for Name: weather; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY weather (id, data, city_id, date) FROM stdin;
\.


--
-- Name: weather_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('weather_id_seq', 30394, false);


--
-- Name: weather_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY weather
    ADD CONSTRAINT weather_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: weather_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE weather_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE weather_id_seq FROM postgres;
GRANT ALL ON SEQUENCE weather_id_seq TO postgres;

--
-- Name: weather; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE weather FROM PUBLIC;
REVOKE ALL ON TABLE weather FROM postgres;
GRANT ALL ON TABLE weather TO postgres;


--
-- PostgreSQL database dump complete
--

