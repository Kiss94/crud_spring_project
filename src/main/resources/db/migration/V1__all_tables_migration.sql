--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6
-- Dumped by pg_dump version 10.6

-- Started on 2019-11-03 16:58:23

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2895 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 2 (class 3079 OID 24928)
-- Name: pgstattuple; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS pgstattuple WITH SCHEMA public;


--
-- TOC entry 2896 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pgstattuple; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgstattuple IS 'show tuple-level statistics';


--
-- TOC entry 231 (class 1255 OID 24938)
-- Name: log_goal_statistic_inserts(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.log_goal_statistic_inserts() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN 
INSERT INTO insert_logs (insert_date, references_table_name, desctription) VALUES
(current_timestamp, 'matche_lineups', CONCAT('goal_id', new.goal_id, ';',
											 'match_id = ', new.match_id, ';',
											 'player_id = ', new.player_id, ';',
											 'minute_of_goal = ', new.minute_of_goal, ';'
											)
);
RETURN NEW;
END; 
$$;


ALTER FUNCTION public.log_goal_statistic_inserts() OWNER TO postgres;

--
-- TOC entry 232 (class 1255 OID 24939)
-- Name: log_match_inserts(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.log_match_inserts() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN 
INSERT INTO insert_logs (insert_date, references_table_name, desctription) VALUES
(current_timestamp, 'matches', CONCAT('match_id = ', new.match_id, ';',
									  'date = ', new.date, ';',
									  'stadium = ', new.stadium, ';',
									  'team_one_id = ', new.team_one_id, ';', 
									 'team_two_id = ', new.team_two_id, ';',
									 'team_one_score = ', new.team_one_score, ';',
									 'team_two_score = ', new.team_two_score, ';'));
RETURN NEW;
END; 
$$;


ALTER FUNCTION public.log_match_inserts() OWNER TO postgres;

--
-- TOC entry 233 (class 1255 OID 24940)
-- Name: log_match_lineup_inserts(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.log_match_lineup_inserts() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN 
INSERT INTO insert_logs (insert_date, references_table_name, desctription) VALUES
(current_timestamp, 'matche_lineups', CONCAT('match_id = ', new.match_id, ';',
									  'team_id = ', new.team_id, ';', 
									 'player_id = ', new.player_id, ';'
											)
);
RETURN NEW;
END; 
$$;


ALTER FUNCTION public.log_match_lineup_inserts() OWNER TO postgres;

--
-- TOC entry 234 (class 1255 OID 24941)
-- Name: log_player_inserts(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.log_player_inserts() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN 
INSERT INTO insert_logs (insert_date, references_table_name, desctription) VALUES
(current_timestamp, 'players', CONCAT('player_id = ',new.player_id,';','name = ', new.name,';', 'surname = ', new.surname,';','player_number = ', new.player_number,';','team_id = ', new.team_id));
RETURN NEW;
END; 
$$;


ALTER FUNCTION public.log_player_inserts() OWNER TO postgres;

--
-- TOC entry 235 (class 1255 OID 24942)
-- Name: log_team_inserts(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.log_team_inserts() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN 
INSERT INTO insert_logs (insert_date, references_table_name, desctription) VALUES
(current_timestamp, 'teams', CONCAT('team_id = ', new.team_id, ';', 'name = ', new.name, ';', 'country = ', new.country, ';'));
RETURN NEW;
END; 
$$;


ALTER FUNCTION public.log_team_inserts() OWNER TO postgres;

--
-- TOC entry 236 (class 1255 OID 24943)
-- Name: match4player4stadium(integer, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.match4player4stadium(player integer, stad character varying) RETURNS integer
    LANGUAGE sql
    AS $$
							   select ml.match_id
							   from match_lineups ml
							   join matches m on m.match_id = ml.match_id
							   where ml.player_id = player and m.stadium = LOWER(stad)
							   $$;


ALTER FUNCTION public.match4player4stadium(player integer, stad character varying) OWNER TO postgres;

--
-- TOC entry 237 (class 1255 OID 24944)
-- Name: match4player4stadium2(integer, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.match4player4stadium2(player integer, stad character varying) RETURNS SETOF integer
    LANGUAGE plpgsql
    AS $$
BEGIN
Select ml.match_id
from match_lineups ml
join matches m on m.match_id = ml.match_id
where ml.player_id = player and m.stadium = LOWER(stad);
END; $$;


ALTER FUNCTION public.match4player4stadium2(player integer, stad character varying) OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 24945)
-- Name: goal_statistics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.goal_statistics (
    goal_id integer NOT NULL,
    match_id integer,
    player_id integer,
    minute_of_goal integer
);


ALTER TABLE public.goal_statistics OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 24948)
-- Name: goal_statistics_goal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.goal_statistics_goal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.goal_statistics_goal_id_seq OWNER TO postgres;

--
-- TOC entry 2897 (class 0 OID 0)
-- Dependencies: 198
-- Name: goal_statistics_goal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.goal_statistics_goal_id_seq OWNED BY public.goal_statistics.goal_id;


--
-- TOC entry 199 (class 1259 OID 24950)
-- Name: insert_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.insert_logs (
    log_id integer NOT NULL,
    insert_date timestamp with time zone,
    references_table_name character varying(50),
    desctription character varying(1000)
);


ALTER TABLE public.insert_logs OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 24956)
-- Name: insert_logs_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.insert_logs_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.insert_logs_log_id_seq OWNER TO postgres;

--
-- TOC entry 2898 (class 0 OID 0)
-- Dependencies: 200
-- Name: insert_logs_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.insert_logs_log_id_seq OWNED BY public.insert_logs.log_id;


--
-- TOC entry 201 (class 1259 OID 24958)
-- Name: match_lineups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.match_lineups (
    match_id integer NOT NULL,
    team_id integer,
    player_id integer NOT NULL
);


ALTER TABLE public.match_lineups OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 24961)
-- Name: matches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.matches (
    match_id integer NOT NULL,
    date date,
    stadium character varying(50),
    team_one_id integer,
    team_two_id integer,
    team_one_score integer,
    team_two_score integer
);


ALTER TABLE public.matches OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 24964)
-- Name: match_match_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.match_match_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.match_match_id_seq OWNER TO postgres;

--
-- TOC entry 2899 (class 0 OID 0)
-- Dependencies: 203
-- Name: match_match_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.match_match_id_seq OWNED BY public.matches.match_id;


--
-- TOC entry 204 (class 1259 OID 24966)
-- Name: players; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.players (
    player_id integer NOT NULL,
    name character varying(50),
    surname character varying(50),
    player_number integer,
    team_id integer
);


ALTER TABLE public.players OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 24969)
-- Name: player_player_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.player_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_player_id_seq OWNER TO postgres;

--
-- TOC entry 2900 (class 0 OID 0)
-- Dependencies: 205
-- Name: player_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.player_player_id_seq OWNED BY public.players.player_id;


--
-- TOC entry 206 (class 1259 OID 24971)
-- Name: player_statistic; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.player_statistic AS
SELECT
    NULL::integer AS player_id,
    NULL::character varying(50) AS name,
    NULL::bigint AS played_games,
    NULL::bigint AS wins,
    NULL::bigint AS lost,
    NULL::bigint AS tie;


ALTER TABLE public.player_statistic OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 24975)
-- Name: team_statistic; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.team_statistic AS
SELECT
    NULL::integer AS team,
    NULL::bigint AS win,
    NULL::bigint AS lost,
    NULL::bigint AS tie,
    NULL::bigint AS score;


ALTER TABLE public.team_statistic OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 24979)
-- Name: teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50),
    country character varying(50)
);


ALTER TABLE public.teams OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 24982)
-- Name: team_team_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.team_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_team_id_seq OWNER TO postgres;

--
-- TOC entry 2901 (class 0 OID 0)
-- Dependencies: 209
-- Name: team_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.team_team_id_seq OWNED BY public.teams.team_id;


--
-- TOC entry 2724 (class 2604 OID 24984)
-- Name: goal_statistics goal_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goal_statistics ALTER COLUMN goal_id SET DEFAULT nextval('public.goal_statistics_goal_id_seq'::regclass);


--
-- TOC entry 2725 (class 2604 OID 24985)
-- Name: insert_logs log_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insert_logs ALTER COLUMN log_id SET DEFAULT nextval('public.insert_logs_log_id_seq'::regclass);


--
-- TOC entry 2726 (class 2604 OID 24986)
-- Name: matches match_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matches ALTER COLUMN match_id SET DEFAULT nextval('public.match_match_id_seq'::regclass);


--
-- TOC entry 2727 (class 2604 OID 24987)
-- Name: players player_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players ALTER COLUMN player_id SET DEFAULT nextval('public.player_player_id_seq'::regclass);


--
-- TOC entry 2728 (class 2604 OID 24988)
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.team_team_id_seq'::regclass);


--
-- TOC entry 2877 (class 0 OID 24945)
-- Dependencies: 197
-- Data for Name: goal_statistics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.goal_statistics (goal_id, match_id, player_id, minute_of_goal) FROM stdin;
1	1	7	10
2	1	11	65
3	1	15	23
4	1	18	49
5	1	19	88
6	2	7	12
7	2	11	67
8	2	10	82
9	2	20	59
\.


--
-- TOC entry 2879 (class 0 OID 24950)
-- Dependencies: 199
-- Data for Name: insert_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.insert_logs (log_id, insert_date, references_table_name, desctription) FROM stdin;
2	2019-10-02 13:49:10.099854+06	players	39
3	2019-10-02 13:59:07.687752+06	players	new.player_id \\; new.player_name \\; new.player_surname \\; new.player_number \\; new.team_id
4	2019-10-02 14:06:42.543927+06	players	43;PPOPO;QWEWEQ;415;5
5	2019-10-02 14:20:39.379107+06	players	player_id = 44;name = PPOPO;surname = QWEWEQ;player_number = 415;team_id = 5
6	2019-10-02 14:24:01.497537+06	teams	team_id = 6;name = PARA;country = ASDF;
7	2019-10-02 14:41:47.884148+06	matches	match_id = 4;date = 2019-05-20;stadium = asdert;team_one_id = 1;team_two_id = 2;team_one_score = 1;team_two_score = 3;
8	2019-10-02 14:43:49.004816+06	matche_lineups	match_id = 4;team_id = 1;player_id = 31;
9	2019-10-09 19:20:51.920882+06	matches	match_id = 5;date = 2019-06-01;stadium = old traford;team_one_id = 2;team_two_id = 1;team_one_score = 2;team_two_score = 0;
10	2019-10-09 19:21:44.009446+06	matche_lineups	match_id = 5;team_id = 1;player_id = 2;
\.


--
-- TOC entry 2881 (class 0 OID 24958)
-- Dependencies: 201
-- Data for Name: match_lineups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.match_lineups (match_id, team_id, player_id) FROM stdin;
1	1	1
1	1	2
1	1	3
1	1	4
1	1	5
1	1	6
1	1	7
1	1	8
1	1	9
1	1	10
1	1	11
1	2	12
1	2	13
1	2	14
1	2	15
1	2	16
1	2	17
1	2	18
1	2	19
1	2	20
1	2	21
1	2	22
2	1	25
2	1	2
2	1	3
2	1	4
2	1	5
2	1	6
2	1	7
2	1	8
2	1	9
2	1	10
2	1	11
2	2	12
2	2	13
2	2	14
2	2	15
2	2	30
2	2	17
2	2	18
2	2	19
2	2	20
2	2	21
2	2	22
4	1	31
\.


--
-- TOC entry 2882 (class 0 OID 24961)
-- Dependencies: 202
-- Data for Name: matches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.matches (match_id, date, stadium, team_one_id, team_two_id, team_one_score, team_two_score) FROM stdin;
1	2019-02-10	santiago bernabeu	1	2	2	3
2	2019-03-02	old traford	1	2	3	1
3	2019-04-01	qwerty	1	2	1	1
4	2019-05-20	asdert	1	2	1	3
\.


--
-- TOC entry 2884 (class 0 OID 24966)
-- Dependencies: 204
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.players (player_id, name, surname, player_number, team_id) FROM stdin;
1	David	De Gea	1	1
2	Chris	Smalling	12	1
3	Phil	Jones	4	1
5	Juan	Mata	8	1
6	Jesse	Lingard	14	1
7	Ashley	Young	18	1
8	Alexis	Sanchez	7	1
9	Marcus	Rashford	10	1
10	Diogo	Dalot	20	1
11	Luke	Shaw	23	1
12	Thibaut	Courtois	13	2
13	Danial	Carvajal Ramos	2	2
14	Elder	Militao	3	2
15	Sergio	Ramos	4	2
16	Raphael	Varane	5	2
18	Eden	Hazard	7	2
19	Toni	Kroos	8	2
20	Kazim	Benzema	9	2
21	Luka	Modric	10	2
22	Gareth	Bale	11	2
4	Paul	Pogba	6	1
17	Marcelo	Viera	12	2
25	Aaron	Wan-Bissaka	29	1
26	Axel	Tuanzebe	38	1
27	Nemanja	Matic	31	1
28	Brahim	Diaz	21	2
29	Ferland	Mendy	23	2
30	Alphonse	Areola	1	2
31	ASD	QWE	2	6
\.


--
-- TOC entry 2886 (class 0 OID 24979)
-- Dependencies: 208
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teams (team_id, name, country) FROM stdin;
1	Manchester United	England
2	Real Madrid	Spain
3	Juventus	Italy
4	Bayern Munich	Germany
5	Kairat	Kazakhstan
6	PARA	ASDF
\.


--
-- TOC entry 2902 (class 0 OID 0)
-- Dependencies: 198
-- Name: goal_statistics_goal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.goal_statistics_goal_id_seq', 9, true);


--
-- TOC entry 2903 (class 0 OID 0)
-- Dependencies: 200
-- Name: insert_logs_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.insert_logs_log_id_seq', 10, true);


--
-- TOC entry 2904 (class 0 OID 0)
-- Dependencies: 203
-- Name: match_match_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.match_match_id_seq', 5, true);


--
-- TOC entry 2905 (class 0 OID 0)
-- Dependencies: 205
-- Name: player_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.player_player_id_seq', 44, true);


--
-- TOC entry 2906 (class 0 OID 0)
-- Dependencies: 209
-- Name: team_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.team_team_id_seq', 6, true);


--
-- TOC entry 2730 (class 2606 OID 24990)
-- Name: goal_statistics goal_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goal_statistics
    ADD CONSTRAINT goal_statistics_pkey PRIMARY KEY (goal_id);


--
-- TOC entry 2732 (class 2606 OID 24992)
-- Name: match_lineups match_lineup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match_lineups
    ADD CONSTRAINT match_lineup_pkey PRIMARY KEY (match_id, player_id);


--
-- TOC entry 2734 (class 2606 OID 24994)
-- Name: matches match_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT match_pkey PRIMARY KEY (match_id);


--
-- TOC entry 2736 (class 2606 OID 24996)
-- Name: players player_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT player_pkey PRIMARY KEY (player_id);


--
-- TOC entry 2738 (class 2606 OID 24998)
-- Name: teams team_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT team_pkey PRIMARY KEY (team_id);


--
-- TOC entry 2875 (class 2618 OID 24974)
-- Name: player_statistic _RETURN; Type: RULE; Schema: public; Owner: postgres
--

CREATE OR REPLACE VIEW public.player_statistic AS
 SELECT p.player_id,
    p.name,
    count(ml.player_id) AS played_games,
    count(t.winner) AS wins,
    count(t.losser) AS lost,
    count(t.tie) AS tie
   FROM ((public.players p
     LEFT JOIN public.match_lineups ml ON ((ml.player_id = p.player_id)))
     LEFT JOIN ( SELECT matches.match_id,
                CASE
                    WHEN (matches.team_one_score > matches.team_two_score) THEN matches.team_one_id
                    ELSE NULL::integer
                END AS winner,
                CASE
                    WHEN (matches.team_one_score < matches.team_two_score) THEN matches.team_two_id
                    ELSE NULL::integer
                END AS losser,
                CASE
                    WHEN (matches.team_one_score = matches.team_two_score) THEN 'TIE'::text
                    ELSE NULL::text
                END AS tie
           FROM public.matches) t ON ((ml.match_id = t.match_id)))
  GROUP BY p.player_id;


--
-- TOC entry 2876 (class 2618 OID 24978)
-- Name: team_statistic _RETURN; Type: RULE; Schema: public; Owner: postgres
--

CREATE OR REPLACE VIEW public.team_statistic AS
 SELECT f.team,
    f.win,
    f.lost,
    f.tie,
    f.score
   FROM ( SELECT t.team_one_id AS team,
            sum(
                CASE
                    WHEN (t.team_one_id = t.winner_id) THEN 1
                    ELSE 0
                END) AS win,
            sum(
                CASE
                    WHEN (t.team_one_id = t.loser_id) THEN 1
                    ELSE 0
                END) AS lost,
            sum(
                CASE
                    WHEN (t.winner_id = 0) THEN 1
                    WHEN (t.loser_id = 0) THEN 1
                    ELSE 0
                END) AS tie,
            sum(t.score) AS score
           FROM ( SELECT matches.match_id,
                    matches.team_one_id,
                    matches.team_two_id,
                        CASE
                            WHEN (matches.team_one_score > matches.team_two_score) THEN matches.team_one_id
                            WHEN (matches.team_one_score = matches.team_two_score) THEN 0
                            ELSE matches.team_two_id
                        END AS winner_id,
                        CASE
                            WHEN (matches.team_one_score > matches.team_two_score) THEN matches.team_two_id
                            WHEN (matches.team_one_score = matches.team_two_score) THEN 0
                            ELSE matches.team_one_id
                        END AS loser_id,
                    matches.team_one_score AS score
                   FROM public.matches
                  GROUP BY matches.match_id,
                        CASE
                            WHEN (matches.team_one_score > matches.team_two_score) THEN matches.team_one_id
                            WHEN (matches.team_one_score = matches.team_two_score) THEN 0
                            ELSE matches.team_two_id
                        END,
                        CASE
                            WHEN (matches.team_one_score > matches.team_two_score) THEN matches.team_two_id
                            WHEN (matches.team_one_score = matches.team_two_score) THEN 0
                            ELSE matches.team_one_id
                        END) t
          GROUP BY t.team_one_id
        UNION ALL
         SELECT n.team_two_id AS team,
            sum(
                CASE
                    WHEN (n.team_two_id = n.winner_id) THEN 1
                    ELSE 0
                END) AS win,
            sum(
                CASE
                    WHEN (n.team_two_id = n.loser_id) THEN 1
                    ELSE 0
                END) AS lost,
            sum(
                CASE
                    WHEN ((n.winner_id = 0) AND (n.loser_id = 0)) THEN 1
                    ELSE 0
                END) AS tie,
            sum(n.score) AS score
           FROM ( SELECT matches.match_id,
                    matches.team_one_id,
                    matches.team_two_id,
                        CASE
                            WHEN (matches.team_one_score > matches.team_two_score) THEN matches.team_one_id
                            WHEN (matches.team_one_score = matches.team_two_score) THEN 0
                            ELSE matches.team_two_id
                        END AS winner_id,
                        CASE
                            WHEN (matches.team_one_score > matches.team_two_score) THEN matches.team_two_id
                            WHEN (matches.team_one_score = matches.team_two_score) THEN 0
                            ELSE matches.team_one_id
                        END AS loser_id,
                    matches.team_two_score AS score
                   FROM public.matches
                  GROUP BY matches.match_id,
                        CASE
                            WHEN (matches.team_one_score > matches.team_two_score) THEN matches.team_one_id
                            WHEN (matches.team_one_score = matches.team_two_score) THEN 0
                            ELSE matches.team_two_id
                        END,
                        CASE
                            WHEN (matches.team_one_score > matches.team_two_score) THEN matches.team_two_id
                            WHEN (matches.team_one_score = matches.team_two_score) THEN 0
                            ELSE matches.team_one_id
                        END) n
          GROUP BY n.team_two_id) f
  GROUP BY f.team, f.win, f.lost, f.tie, f.score;


--
-- TOC entry 2749 (class 2620 OID 25001)
-- Name: goal_statistics insert_goal_statistic_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER insert_goal_statistic_trigger AFTER INSERT ON public.goal_statistics FOR EACH ROW EXECUTE PROCEDURE public.log_goal_statistic_inserts();


--
-- TOC entry 2750 (class 2620 OID 25002)
-- Name: match_lineups insert_match_lineup_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER insert_match_lineup_trigger AFTER INSERT ON public.match_lineups FOR EACH ROW EXECUTE PROCEDURE public.log_match_lineup_inserts();


--
-- TOC entry 2751 (class 2620 OID 25003)
-- Name: matches insert_match_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER insert_match_trigger AFTER INSERT ON public.matches FOR EACH ROW EXECUTE PROCEDURE public.log_match_inserts();


--
-- TOC entry 2752 (class 2620 OID 25004)
-- Name: players insert_player_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER insert_player_trigger AFTER INSERT ON public.players FOR EACH ROW EXECUTE PROCEDURE public.log_player_inserts();


--
-- TOC entry 2753 (class 2620 OID 25005)
-- Name: teams insert_team_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER insert_team_trigger AFTER INSERT ON public.teams FOR EACH ROW EXECUTE PROCEDURE public.log_team_inserts();


--
-- TOC entry 2739 (class 2606 OID 25006)
-- Name: goal_statistics goal_statistics_match_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goal_statistics
    ADD CONSTRAINT goal_statistics_match_id_fkey FOREIGN KEY (match_id) REFERENCES public.matches(match_id);


--
-- TOC entry 2740 (class 2606 OID 25011)
-- Name: goal_statistics goal_statistics_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goal_statistics
    ADD CONSTRAINT goal_statistics_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(player_id);


--
-- TOC entry 2741 (class 2606 OID 25016)
-- Name: match_lineups match_lineup_match_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match_lineups
    ADD CONSTRAINT match_lineup_match_id_fkey FOREIGN KEY (match_id) REFERENCES public.matches(match_id);


--
-- TOC entry 2742 (class 2606 OID 25021)
-- Name: match_lineups match_lineup_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match_lineups
    ADD CONSTRAINT match_lineup_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(player_id);


--
-- TOC entry 2743 (class 2606 OID 25026)
-- Name: match_lineups match_lineup_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match_lineups
    ADD CONSTRAINT match_lineup_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(team_id);


--
-- TOC entry 2744 (class 2606 OID 25031)
-- Name: matches match_team_one_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT match_team_one_id_fkey FOREIGN KEY (team_one_id) REFERENCES public.teams(team_id);


--
-- TOC entry 2745 (class 2606 OID 25036)
-- Name: matches match_team_two_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT match_team_two_id_fkey FOREIGN KEY (team_two_id) REFERENCES public.teams(team_id);


--
-- TOC entry 2748 (class 2606 OID 25041)
-- Name: players player_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT player_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(team_id);


--
-- TOC entry 2746 (class 2606 OID 25046)
-- Name: matches team_one_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT team_one_id FOREIGN KEY (team_one_id) REFERENCES public.teams(team_id);


--
-- TOC entry 2747 (class 2606 OID 25051)
-- Name: matches team_two_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT team_two_id FOREIGN KEY (team_two_id) REFERENCES public.teams(team_id);


-- Completed on 2019-11-03 16:58:24

--
-- PostgreSQL database dump complete
--

