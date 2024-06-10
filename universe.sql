--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    galaxy_id integer NOT NULL,
    name character varying(50),
    mass integer,
    number_of_stars integer,
    angular_momentum numeric,
    is_visible boolean,
    is_habitable boolean,
    description text NOT NULL
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
-- Name: minor_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.minor_planet (
    minor_planet_id integer NOT NULL,
    name character varying(50),
    mass integer,
    number_of_satellites integer,
    distance_from_earth numeric,
    is_visible boolean,
    is_habitable boolean,
    description text NOT NULL
);


ALTER TABLE public.minor_planet OWNER TO freecodecamp;

--
-- Name: minor_planet_minor_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.minor_planet_minor_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.minor_planet_minor_planet_id_seq OWNER TO freecodecamp;

--
-- Name: minor_planet_minor_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.minor_planet_minor_planet_id_seq OWNED BY public.minor_planet.minor_planet_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50),
    mass integer,
    number_of_satellites integer,
    average_distance_from_earth numeric,
    planet_id integer,
    is_visible boolean,
    is_habitable boolean,
    description text NOT NULL
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50),
    mass integer,
    number_of_satellites integer,
    surface_gravity numeric,
    is_visible boolean,
    is_habitable boolean,
    star_id integer,
    description text NOT NULL
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
    star_id integer NOT NULL,
    name character varying(50),
    galaxy_id integer,
    mass integer,
    number_of_satellites integer,
    surface_temperature numeric,
    is_visible boolean,
    is_going_to_supernova boolean,
    description text NOT NULL
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
-- Name: minor_planet minor_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.minor_planet ALTER COLUMN minor_planet_id SET DEFAULT nextval('public.minor_planet_minor_planet_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', NULL, NULL, NULL, NULL, NULL, 'Our Galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', NULL, NULL, NULL, NULL, NULL, 'Closest Galaxy');
INSERT INTO public.galaxy VALUES (4, 'Alpha', NULL, NULL, NULL, NULL, NULL, 'the first');
INSERT INTO public.galaxy VALUES (5, 'Bravo', NULL, NULL, NULL, NULL, NULL, 'the second');
INSERT INTO public.galaxy VALUES (6, 'Charlie', NULL, NULL, NULL, NULL, NULL, 'the third');
INSERT INTO public.galaxy VALUES (7, 'Delta', NULL, NULL, NULL, NULL, NULL, 'the fourth');


--
-- Data for Name: minor_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.minor_planet VALUES (1, 'Ceres', NULL, NULL, NULL, NULL, NULL, 'The largest object in the asteroid belt between Mars and Jupiter.');
INSERT INTO public.minor_planet VALUES (2, 'Pallas', NULL, NULL, NULL, NULL, NULL, 'The second asteroid to have been discovered, and one of the largest.');
INSERT INTO public.minor_planet VALUES (3, 'Vesta', NULL, NULL, NULL, NULL, NULL, 'The brightest asteroid visible from Earth and the second-most-massive body in the asteroid belt.');
INSERT INTO public.minor_planet VALUES (4, 'Hygiea', NULL, NULL, NULL, NULL, NULL, 'The fourth-largest asteroid in the asteroid belt by volume and mass.');
INSERT INTO public.minor_planet VALUES (5, 'Eros', NULL, NULL, NULL, NULL, NULL, 'A near-Earth asteroid that is the second-largest near-Earth object.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', NULL, NULL, NULL, 1, NULL, NULL, 'The only natural satellite of Earth, also known as the Moon.');
INSERT INTO public.moon VALUES (2, 'Phobos', NULL, NULL, NULL, 1, NULL, NULL, 'A moon of Mars, the larger and closer of the two natural satellites.');
INSERT INTO public.moon VALUES (3, 'Deimos', NULL, NULL, NULL, 1, NULL, NULL, 'A moon of Mars, the smaller and more distant of the two natural satellites.');
INSERT INTO public.moon VALUES (4, 'Io', NULL, NULL, NULL, 1, NULL, NULL, 'The innermost of the four Galilean moons of Jupiter.');
INSERT INTO public.moon VALUES (5, 'Europa', NULL, NULL, NULL, 1, NULL, NULL, 'The smallest of the four Galilean moons orbiting Jupiter.');
INSERT INTO public.moon VALUES (6, 'Ganymede', NULL, NULL, NULL, 1, NULL, NULL, 'The largest moon in the Solar System, orbiting Jupiter.');
INSERT INTO public.moon VALUES (7, 'Callisto', NULL, NULL, NULL, 1, NULL, NULL, 'A large moon of Jupiter, the second-largest of the Galilean moons.');
INSERT INTO public.moon VALUES (8, 'Titan', NULL, NULL, NULL, 1, NULL, NULL, 'The largest moon of Saturn and the second-largest moon in the Solar System.');
INSERT INTO public.moon VALUES (9, 'Rhea', NULL, NULL, NULL, 1, NULL, NULL, 'The second-largest moon of Saturn.');
INSERT INTO public.moon VALUES (10, 'Iapetus', NULL, NULL, NULL, 1, NULL, NULL, 'A moon of Saturn, known for its distinctive two-tone coloration.');
INSERT INTO public.moon VALUES (11, 'Dione', NULL, NULL, NULL, 1, NULL, NULL, 'A moon of Saturn, the fourth-largest of its moons.');
INSERT INTO public.moon VALUES (12, 'Tethys', NULL, NULL, NULL, 1, NULL, NULL, 'A moon of Saturn, the fifth-largest of its moons.');
INSERT INTO public.moon VALUES (13, 'Enceladus', NULL, NULL, NULL, 1, NULL, NULL, 'A moon of Saturn, known for its geysers that eject water vapor and ice.');
INSERT INTO public.moon VALUES (14, 'Mimas', NULL, NULL, NULL, 1, NULL, NULL, 'A moon of Saturn, known for its large impact crater, Herschel.');
INSERT INTO public.moon VALUES (15, 'Hyperion', NULL, NULL, NULL, 1, NULL, NULL, 'A moon of Saturn, known for its irregular shape and chaotic rotation.');
INSERT INTO public.moon VALUES (16, 'Oberon', NULL, NULL, NULL, 1, NULL, NULL, 'A moon of Uranus, the second-largest of its moons.');
INSERT INTO public.moon VALUES (17, 'Titania', NULL, NULL, NULL, 1, NULL, NULL, 'The largest moon of Uranus.');
INSERT INTO public.moon VALUES (18, 'Umbriel', NULL, NULL, NULL, 1, NULL, NULL, 'A moon of Uranus, known for its dark surface.');
INSERT INTO public.moon VALUES (19, 'Ariel', NULL, NULL, NULL, 1, NULL, NULL, 'A moon of Uranus, the fourth-largest of its moons.');
INSERT INTO public.moon VALUES (20, 'Miranda', NULL, NULL, NULL, 1, NULL, NULL, 'A moon of Uranus, known for its extreme and varied terrain.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', NULL, NULL, NULL, NULL, NULL, 1, 'The smallest and innermost planet in the Solar System.');
INSERT INTO public.planet VALUES (2, 'Venus', NULL, NULL, NULL, NULL, NULL, 1, 'The second planet from the Sun, known for its thick, toxic atmosphere.');
INSERT INTO public.planet VALUES (3, 'Earth', NULL, NULL, NULL, NULL, NULL, 1, 'The third planet from the Sun and the only astronomical object known to harbor life.');
INSERT INTO public.planet VALUES (4, 'Mars', NULL, NULL, NULL, NULL, NULL, 1, 'The fourth planet from the Sun, often called the Red Planet.');
INSERT INTO public.planet VALUES (5, 'Jupiter', NULL, NULL, NULL, NULL, NULL, 1, 'The fifth planet from the Sun and the largest in the Solar System.');
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, NULL, NULL, NULL, NULL, 1, 'The sixth planet from the Sun, famous for its extensive ring system.');
INSERT INTO public.planet VALUES (7, 'Uranus', NULL, NULL, NULL, NULL, NULL, 1, 'The seventh planet from the Sun, known for its unique tilt.');
INSERT INTO public.planet VALUES (8, 'Neptune', NULL, NULL, NULL, NULL, NULL, 1, 'The eighth and farthest planet from the Sun in the Solar System.');
INSERT INTO public.planet VALUES (9, 'Pluto', NULL, NULL, NULL, NULL, NULL, 1, 'A dwarf planet in the Kuiper belt, originally classified as the ninth planet.');
INSERT INTO public.planet VALUES (10, 'Eris', NULL, NULL, NULL, NULL, NULL, 1, 'A dwarf planet and the second-largest known object in the Solar System beyond Neptune.');
INSERT INTO public.planet VALUES (11, 'Haumea', NULL, NULL, NULL, NULL, NULL, 1, 'A dwarf planet located beyond Neptune with a unique elongated shape.');
INSERT INTO public.planet VALUES (12, 'Makemake', NULL, NULL, NULL, NULL, NULL, 1, 'A dwarf planet and one of the largest known objects in the Kuiper belt.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Delta', 1, NULL, NULL, NULL, NULL, NULL, 'the fourth');
INSERT INTO public.star VALUES (2, 'Echo', 1, NULL, NULL, NULL, NULL, NULL, 'the fifth');
INSERT INTO public.star VALUES (3, 'Foxtrot', 1, NULL, NULL, NULL, NULL, NULL, 'the sixth');
INSERT INTO public.star VALUES (4, 'Gerald', 1, NULL, NULL, NULL, NULL, NULL, 'the seventh');
INSERT INTO public.star VALUES (5, 'Hotel', 1, NULL, NULL, NULL, NULL, NULL, 'the eighth');
INSERT INTO public.star VALUES (6, 'Sun', 1, NULL, NULL, NULL, NULL, NULL, 'the ninth');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: minor_planet_minor_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.minor_planet_minor_planet_id_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: minor_planet minor_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.minor_planet
    ADD CONSTRAINT minor_planet_pkey PRIMARY KEY (minor_planet_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: minor_planet unique_minor_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.minor_planet
    ADD CONSTRAINT unique_minor_planet_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

