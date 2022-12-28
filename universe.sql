--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30),
    galaxy_id integer NOT NULL,
    age integer NOT NULL,
    distance integer,
    radius numeric,
    description text,
    spherical boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(30),
    moon_id integer NOT NULL,
    age integer,
    distance integer,
    radius numeric,
    description text,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: moon_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_planet (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(30),
    moon_planet_id integer NOT NULL
);


ALTER TABLE public.moon_planet OWNER TO freecodecamp;

--
-- Name: moon_planet_moon_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_planet_moon_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_planet_moon_planet_id_seq OWNER TO freecodecamp;

--
-- Name: moon_planet_moon_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_planet_moon_planet_id_seq OWNED BY public.moon_planet.moon_planet_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(30),
    planet_id integer NOT NULL,
    age integer,
    distance integer,
    radius numeric,
    description text,
    has_life boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(30),
    star_id integer NOT NULL,
    age integer,
    distance integer,
    radius numeric,
    description text,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: moon_planet moon_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet ALTER COLUMN moon_planet_id SET DEFAULT nextval('public.moon_planet_moon_planet_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('galaxy_1', 1, 1, 1, 1, 'galaxy_1', true);
INSERT INTO public.galaxy VALUES ('gal_2', 2, 2, 2, 2, 'gal_2', false);
INSERT INTO public.galaxy VALUES ('gal_3', 3, 3, 3, 3, 'gal_3', true);
INSERT INTO public.galaxy VALUES ('gal_4', 4, 4, 4, 4, 'gal_4', false);
INSERT INTO public.galaxy VALUES ('gal_5', 5, 5, 5, 5, 'gal_5', true);
INSERT INTO public.galaxy VALUES ('gal_6', 6, 6, 6, 6, 'gal_6', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('moon_1', 1, 1, 1, 1, 'moon_1', 1);
INSERT INTO public.moon VALUES ('moon_2', 2, 2, 2, 2, 'moon_2', 2);
INSERT INTO public.moon VALUES ('moon_3', 3, 3, 3, 3, 'moon_3', 3);
INSERT INTO public.moon VALUES ('moon_4', 4, 4, 4, 4, 'moon_4', 4);
INSERT INTO public.moon VALUES ('moon_5', 5, 5, 5, 5, 'moon_5', 5);
INSERT INTO public.moon VALUES ('moon_6', 6, 6, 6, 6, 'moon_6', 1);
INSERT INTO public.moon VALUES ('moon_7', 7, 7, 7, 7, 'moon_7', 2);
INSERT INTO public.moon VALUES ('moon_8', 8, 8, 8, 8, 'moon_8', 3);
INSERT INTO public.moon VALUES ('moon_9', 9, 9, 9, 9, 'moon_9', 4);
INSERT INTO public.moon VALUES ('moon_10', 10, 10, 10, 10, 'moon_10', 5);
INSERT INTO public.moon VALUES ('moon_11', 11, 11, 11, 11, 'moon_11', 1);
INSERT INTO public.moon VALUES ('moon_12', 12, 12, 12, 12, 'moon_12', 2);
INSERT INTO public.moon VALUES ('moon_13', 13, 13, 13, 13, 'moon_13', 3);
INSERT INTO public.moon VALUES ('moon_14', 14, 14, 14, 14, 'moon_14', 4);
INSERT INTO public.moon VALUES ('moon_15', 15, 15, 15, 15, 'moon_15', 5);
INSERT INTO public.moon VALUES ('moon_16', 16, 16, 16, 16, 'moon_16', 1);
INSERT INTO public.moon VALUES ('moon_17', 17, 17, 17, 17, 'moon_17', 2);
INSERT INTO public.moon VALUES ('moon_18', 18, 18, 18, 18, 'moon_18', 3);
INSERT INTO public.moon VALUES ('moon_19', 19, 19, 19, 19, 'moon_19', 4);
INSERT INTO public.moon VALUES ('moon_20', 20, 20, 20, 20, 'moon_20', 5);


--
-- Data for Name: moon_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_planet VALUES (1, 1, 'moon_plan_1', 1);
INSERT INTO public.moon_planet VALUES (2, 2, 'moon_plan_2', 2);
INSERT INTO public.moon_planet VALUES (3, 3, 'moon_plan_3', 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('plan_1', 1, 1, 1, 1, 'plan_1', true, 1);
INSERT INTO public.planet VALUES ('plan_2', 2, 2, 2, 2, 'plan_2', false, 2);
INSERT INTO public.planet VALUES ('plan_3', 3, 3, 3, 3, 'plan_3', true, 3);
INSERT INTO public.planet VALUES ('plan_4', 4, 4, 4, 4, 'plan_4', false, 4);
INSERT INTO public.planet VALUES ('plan_5', 5, 5, 5, 5, 'plan_5', true, 5);
INSERT INTO public.planet VALUES ('plan_6', 6, 6, 6, 6, 'plan_6', false, 6);
INSERT INTO public.planet VALUES ('plan_7', 7, 7, 7, 7, 'plan_7', true, 1);
INSERT INTO public.planet VALUES ('plan_8', 8, 8, 8, 8, 'plan_8', false, 2);
INSERT INTO public.planet VALUES ('plan_9', 9, 9, 9, 9, 'plan_9', true, 3);
INSERT INTO public.planet VALUES ('plan_10', 10, 10, 10, 10, 'plan_10', false, 4);
INSERT INTO public.planet VALUES ('plan_11', 11, 11, 11, 11, 'plan_11', true, 5);
INSERT INTO public.planet VALUES ('plan_12', 12, 12, 12, 12, 'plan_12', false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('star_1', 1, 1, 1, 1, 'star_1', 1);
INSERT INTO public.star VALUES ('star_2', 2, 2, 2, 2, 'star_2', 2);
INSERT INTO public.star VALUES ('star_3', 3, 3, 3, 3, 'star_3', 3);
INSERT INTO public.star VALUES ('star_4', 4, 4, 4, 4, 'star_4', 4);
INSERT INTO public.star VALUES ('star_5', 5, 5, 5, 5, 'star_5', 5);
INSERT INTO public.star VALUES ('star_6', 6, 6, 6, 6, 'star_6', 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: moon_planet_moon_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_planet_moon_planet_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 39, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_age_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_age_key UNIQUE (age);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_age_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_age_key UNIQUE (age);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon_planet moon_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet
    ADD CONSTRAINT moon_planet_name_key UNIQUE (name);


--
-- Name: moon_planet moon_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet
    ADD CONSTRAINT moon_planet_pkey PRIMARY KEY (moon_planet_id);


--
-- Name: planet planet_age_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_age_key UNIQUE (age);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_age_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_age_key UNIQUE (age);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

