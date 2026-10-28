--
-- PostgreSQL database dump
--

\restrict LheHiIaohhNnw13jsC8SsCpeI3XDecFwsQqsNjedyw8zUr1cmomRzQP1kR6IcMW

-- Dumped from database version 16.15
-- Dumped by pg_dump version 18.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: author; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.author (id, name) FROM stdin;
1	Lorenz Lind Jr.
2	Prof. Jon Koch
3	Jacky Beahan PhD
4	Bobbie Koelpin
5	Rita Schowalter
6	Harley Gaylord V
7	Miss Roxane Parker
8	Miss Francesca Harris
9	Savanna Borer PhD
10	Dr. Cade Streich PhD
11	Daron Stamm
12	Dr. Jarrell Sporer PhD
13	Dr. Malvina Ferry
14	Mr. Newton DuBuque PhD
15	Dr. Marjorie Boyle
\.


--
-- Data for Name: book; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.book (id, year, title) FROM stdin;
1	2017	Compatible 24hour model
2	2013	Function-based national securedline
3	1997	Monitored hybrid attitude
4	2010	Virtual fresh-thinking task-force
5	2010	Reverse-engineered value-added model
6	2025	Universal national complexity
7	1998	Self-enabling global neural-net
8	2015	Universal non-volatile opensystem
9	1993	Pre-emptive intermediate firmware
10	2001	Compatible non-volatile capacity
11	2019	Future-proofed fresh-thinking initiative
12	2007	Synergized content-based openarchitecture
13	1996	Monitored well-modulated functionalities
14	2012	Robust mission-critical framework
15	1998	Grass-roots tangible workforce
16	1991	Adaptive methodical utilisation
17	1993	Monitored 4thgeneration internetsolution
18	2003	Automated multi-state hub
19	2020	Public-key coherent project
20	1995	Centralized transitional hub
21	2010	Team-oriented upward-trending superstructure
22	2001	Cloned zerodefect productivity
23	2021	Enterprise-wide even-keeled initiative
24	2015	Organic interactive artificialintelligence
25	2021	Automated asynchronous infrastructure
26	2016	Programmable leadingedge definition
27	1998	Multi-tiered impactful archive
28	2024	Exclusive nextgeneration task-force
29	2003	Integrated neutral service-desk
30	2011	Synergized responsive opensystem
31	1993	Sharable contextually-based approach
32	2008	Balanced explicit encryption
33	2008	Configurable systemic hub
34	2023	Multi-layered client-server functionalities
35	2008	Enterprise-wide homogeneous intranet
36	2012	Decentralized 24/7 firmware
37	2015	Quality-focused full-range attitude
38	2007	Digitized client-server collaboration
39	2011	Re-engineered eco-centric systemengine
40	2012	Extended mobile info-mediaries
41	1994	Self-enabling eco-centric service-desk
42	2008	Fundamental optimal adapter
43	1995	Up-sized scalable moratorium
44	2006	Devolved modular parallelism
45	1993	Vision-oriented nextgeneration focusgroup
46	2007	Customer-focused intermediate info-mediaries
47	1999	Visionary zerotolerance algorithm
48	2021	Open-source solution-oriented protocol
49	2000	Function-based needs-based utilisation
50	2001	Up-sized tertiary protocol
\.


--
-- Data for Name: book_author; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.book_author (book_id, author_id) FROM stdin;
1	4
1	10
2	14
2	2
2	3
3	11
3	2
3	7
4	14
4	9
4	2
5	13
5	2
5	6
6	13
7	7
8	2
8	10
9	14
10	13
10	1
10	2
11	9
11	2
11	14
12	9
12	12
13	15
13	7
14	6
14	13
14	5
15	12
15	4
16	11
16	15
16	10
17	6
17	4
18	3
18	1
19	10
19	12
20	3
21	8
21	2
22	6
22	5
22	2
23	14
23	1
23	10
24	10
25	13
25	9
25	3
26	12
27	9
27	3
27	12
28	6
29	2
29	13
29	8
30	9
30	3
31	9
32	14
33	13
34	2
34	3
34	8
35	15
36	10
37	14
37	10
38	8
38	4
38	12
39	13
39	5
40	10
40	7
41	11
41	8
41	2
42	12
42	7
43	14
43	1
44	1
44	8
44	14
45	1
46	5
46	3
47	13
47	9
48	4
49	14
49	7
49	10
50	10
50	3
50	15
\.


--
-- Data for Name: store; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.store (id, name) FROM stdin;
1	Книжный магазин «AliceBlue»
2	Книжный магазин «GoldenRod»
3	Книжный магазин «Indigo»
4	Книжный магазин «Gainsboro»
5	Книжный магазин «LemonChiffon»
\.


--
-- Data for Name: book_store; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.book_store (book_id, store_id) FROM stdin;
1	5
2	4
3	5
3	4
3	3
3	1
4	4
4	5
4	2
5	4
5	5
6	1
6	5
7	3
8	1
8	4
8	2
9	1
9	2
9	4
9	3
10	3
10	2
11	3
11	1
12	4
12	3
13	4
13	3
13	2
13	5
14	5
14	1
14	2
14	3
15	1
15	5
16	5
16	2
17	2
18	2
18	5
19	3
19	1
19	4
20	2
20	5
20	1
20	3
21	2
22	1
23	4
23	2
24	2
24	3
24	5
25	3
25	2
26	5
26	2
26	3
27	4
27	3
27	2
28	3
28	2
28	4
29	2
30	1
31	5
31	4
32	5
32	3
33	5
33	2
34	1
35	1
35	3
35	5
35	2
36	1
36	5
37	3
37	5
37	2
37	1
38	5
38	3
38	4
39	5
39	3
40	3
40	2
41	2
41	1
42	1
42	3
43	2
43	3
43	1
43	5
44	5
44	3
44	1
44	2
45	1
45	2
45	4
46	4
46	3
47	2
48	5
48	2
48	4
49	1
49	5
49	4
49	2
50	4
50	5
50	3
\.


--
-- Data for Name: doctrine_migration_versions; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.doctrine_migration_versions (version, executed_at, execution_time) FROM stdin;
App\\Migrations\\Version20261027115033	2026-10-27 20:18:53	9
\.


--
-- Name: author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.author_id_seq', 15, true);


--
-- Name: book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.book_id_seq', 50, true);


--
-- Name: store_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.store_id_seq', 5, true);


--
-- PostgreSQL database dump complete
--

\unrestrict LheHiIaohhNnw13jsC8SsCpeI3XDecFwsQqsNjedyw8zUr1cmomRzQP1kR6IcMW

