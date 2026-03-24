--
-- PostgreSQL database dump
--

\restrict Sh8yh669RTXUmd9EQqiqBAxzc6bVI1nFdl5NlXNS506P6fzj4aPCncp7EBHNauR

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-03-24 13:19:47

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 221 (class 1259 OID 16568)
-- Name: po_import; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.po_import (
    vendor_item_code character varying(50),
    twm_item_code character varying(50),
    item_name character varying(255),
    package_type character varying(50),
    order_cost numeric(10,2),
    sellable_packs integer
);


ALTER TABLE public.po_import OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16479)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    vendor_item_code text NOT NULL,
    item_name text,
    package_type text NOT NULL,
    order_cost numeric,
    sellable_packs integer,
    retail_price numeric,
    qd_family character varying(50),
    qd_cases integer,
    sku text
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16554)
-- Name: pricing; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.pricing AS
 SELECT vendor_item_code,
    item_name,
    package_type,
    order_cost,
    retail_price,
    sellable_packs,
    round(((100)::numeric - (((order_cost / (sellable_packs)::numeric) / retail_price) * (100)::numeric)), 2) AS margin_percent,
    qd_family,
    qd_cases,
        CASE
            WHEN (retail_price IS NULL) THEN 'Missing Price'::text
            ELSE 'OK'::text
        END AS margin_status
   FROM public.products;


ALTER VIEW public.pricing OWNER TO postgres;

--
-- TOC entry 5014 (class 0 OID 16568)
-- Dependencies: 221
-- Data for Name: po_import; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.po_import (vendor_item_code, twm_item_code, item_name, package_type, order_cost, sellable_packs) FROM stdin;
59104	221985122	10 Barrel Crush Variety Pack	12c-12p	35.38	2
59185	144807355	10 Barrel Pub Beer	12c-18p	11.40	1
770464	242909175	Barton Naturals Vodka	1.75L	51.90	6
135532	2126258304	BeatBox Cherry Limeade	500ml	26.40	12
135516	2126247579	Beatbox Cranberry Dreams	500ml	26.40	12
135513	346227500	Beatbox Mango	500ml	26.40	12
135530	2126253726	Beatbox Orange Blast	500ml	26.40	12
135534	2126258569	BeatBox Peach Hard Tea	500ml	26.40	12
135502	228846500	Beatbox Pink Lemonade	500ml	26.40	12
135514	346093500	BeatBox Variety Pack	500ml-6p	27.30	2
135541	2126261637	BeatBox Watermelon Lemonade	500ml	26.40	12
288370	90126	Beck's NA	12nr-6p	32.40	4
351076	102244122	Big Sky Moose Drool Brown	12c-12p	32.25	2
303117	7116126	Breckenridge Avalanche Amber Ale	12nr-6p	31.22	4
303115	7116121	Breckenridge Avalanche Amber Ale	12c-6p	31.22	4
303237	7116131	Breckenridge Avalanche Amber Ale	12c-15p	28.78	2
303334	274891131	Breckenridge Good Company	12c-15p	28.78	2
303352	337412122	Breckenridge Juice Drop	12c-12p	28.78	2
303285	232318121	Breckenridge Mountain Beach	12c-6p	33.97	4
303007	203683131	Breckenridge Sampler	12c-15p	28.78	2
52043	46871121	Bud Light Chelada	12c-6p	37.95	4
54218	106668119	Bud Light Lime American Lager Beer	12c-18L	17.60	1
53802	341841122	Bud Light NEXT Zero Carbs Lager	12c-12p	24.00	2
56108	120472135	Bud Light Platinum Lager	12nr-18L	17.60	1
78016	234124122	Budweiser Zero Non-Alcoholic Lager	12c-12p	26.00	2
770287	137788751	Buffalo Trace Bourbon Cream	750ml	231.00	12
59693	133220122	Elysian Space Dust IPA	12c-12p	34.60	2
771010	192632050	Fireball Cinnamon Wsky Party Bkt	50-20gft	82.14	6
59986	2126217406	Golden Road California Classics Vr	12c-12p	30.05	2
59923	178270121	Golden Road Mango Cart	12c-6p	30.05	4
604008	342773122	Goose Island Beer Hug Mixed Pack	12c-12p	30.05	2
603847	89608131	Goose Island IPA	12c-15p	30.05	2
738030	123839182	Kona Big Wave Premium Beer	12c-18L	18.40	1
731036	36429126	Kona Longboard Island Lager	12nr-6p	32.30	4
303662	2126222263	Launch Pad Piggyback Rides Hazy	16c-4p	72.00	6
303667	2126222252	Launch Pad Strawberry Moon Blonde	16c-4p	60.00	6
770365	97251750	Linie Aquavit	750ml	257.88	12
70276	10252126	Michelob Amber Bock	12nr-6p	30.75	4
96276	94151126	Michelob ULTRA Light Lager	12nr-6p	30.75	4
96218	94151119	Michelob ULTRA Light Lager	12c-18L	17.60	1
96308	94151135	Michelob ULTRA Light Lager	12nr-18L	17.60	1
96251	94151245	Michelob ULTRA Light Lager	25c-15L	34.55	15
96602	1127	Michelob ULTRA Pure Gold Organic	12nr-12p	29.55	2
67408	2126216390	NUTRL Classic Vodka Lemonade	12c-4p	35.00	6
67409	2126219569	NUTRL Orange Vodka Hard Seltzer	12c-4p	35.00	6
67400	237111355	NUTRL Pineapple Vodka Hard Seltzer	12c-4p	35.00	6
79246	92122	O'Doul's NA	12c-12p	23.60	2
79036	92126	O'Doul's NA	12nr-6p	27.15	4
771099	150729100	Paul Masson Brandy VS	100ml	47.52	48
772215	229904200	Sazerac 6 Yr Rye Whiskey	200ml	93.60	24
329247	15868131	Shock Top Belgian White Ale	12c-15p	29.25	2
67450	2126263094	Skimmers Original Vodka Iced Tea	12c-4p	35.00	6
752640	183450375	Soonhari Apple Soju	375ml	70.00	24
752642	2126216401	SoonHari Grape Soju	375ml	70.00	24
289353	177126	Spaten Lager	12nr-6p	33.05	4
290130	242093608	Stella Artois 0.0	11nr-6p	33.05	2
310027	334479122	SweetWater IPA Variety Pack	12c-12p	28.50	2
770699	96970175	Taaka Vodka	1.75L	39.59	6
772002	2126258147	Traveller Whiskey	50ml	159.19	120
771701	2126240127	Traveller Whiskey	750ml	355.44	12
303934	2126222535	Trve Tunnel of Trees	16c-4p	77.00	6
\.


--
-- TOC entry 5013 (class 0 OID 16479)
-- Dependencies: 219
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (vendor_item_code, item_name, package_type, order_cost, sellable_packs, retail_price, qd_family, qd_cases, sku) FROM stdin;
105279	90+ Cellars Lot 50 Prosecco	750ml	93.96	12	\N	\N	\N	\N
105279.0	90+ Cellars Lot 50 Prosecco	750ml	93.96	12	\N	\N	\N	\N
105928	Kate Arnold Pinot Noir Willamette	750ml	200.04	12	\N	\N	\N	\N
11030	Budweiser American Lager	12c-30p	21.2	1	\N	\N	\N	\N
11036	Budweiser American Lager	12nr-6p	27.7	4	\N	\N	\N	\N
11036.0	Budweiser American Lager	12nr-6p	27.7	4	\N	\N	\N	\N
11063.0	Budweiser American Lager	16al-8p	31.7	3	\N	\N	\N	\N
11168	Budweiser American Lager	12c-24l	20.45	1	\N	\N	\N	\N
11168.0	Budweiser American Lager	12c-24l	19.65	1	\N	\N	\N	\N
11246	Budweiser American Lager	12c-12p	22.3	2	\N	\N	\N	\N
11246.0	Budweiser American Lager	12c-12p	22.3	2	\N	\N	\N	\N
11349	Budweiser American Lager	12nr-24l	20.45	1	\N	\N	\N	\N
11349.0	Budweiser American Lager	12nr-24l	19.65	1	\N	\N	\N	\N
11360	Budweiser American Lager	12nr-12p	22.3	2	\N	\N	\N	\N
11360.0	Budweiser American Lager	12nr-12p	22.3	2	\N	\N	\N	\N
11747	Budweiser American Lager	25c-15l	33.5	15	\N	\N	\N	\N
11747.0	Budweiser American Lager	25c-15l	33.5	15	\N	\N	\N	\N
15030.0	Natural Light American Beer	12c-30p	15.55	1	\N	\N	\N	\N
213707	Clubtails Cocktail Party Pack	12c-12p	28.5	2	\N	\N	\N	\N
214114	Loverboy Spritz Variety Pack	12c-8p	54.0	3	\N	\N	\N	\N
214114.0	Loverboy Spritz Variety Pack	12c-8p	54.0	3	\N	\N	\N	\N
214115	Loverboy Vacay Vibes Variety	12c-8p	33.6	3	\N	\N	\N	\N
214115.0	Loverboy Vacay Vibes Variety	12c-8p	33.6	3	\N	\N	\N	\N
214116	LoverBoy Cool Classics Variety	12c-8p	33.6	3	\N	\N	\N	\N
214116.0	LoverBoy Cool Classics Variety	12c-8p	33.6	3	\N	\N	\N	\N
214206.0	Incline Cider Essential VP	12c-12p	33.74	2	\N	\N	\N	\N
214219.0	Incline Cider Fuji's Dry Apple	12c-6p	35.86	4	\N	\N	\N	\N
214221	Incline Cider Imp Red Raspberry	12c-6p	41.96	4	\N	\N	\N	\N
22168.0	Budweiser Select American Light	12c-24l	19.65	1	\N	\N	\N	\N
27030.0	Natural Ice American Beer	12c-30p	15.55	1	\N	\N	\N	\N
278473	Ritas Lime-A-Rita Marg	7.5c-12p	15.0	2	\N	\N	\N	\N
287065	Buzzballz Biggies Chocolate	1.75l	43.2	3	16.99	BuzzBallz Biggies 	50	\N
287066	Buzzballz Biggies Tequila Rita	1.75l	43.2	3	16.99	BuzzBallz Biggies 	50	\N
106509	Gruvi N/A Variety Pack	12c-12p	36.0	2	\N	Gruvi	20	\N
106510	Gruvi N/A Dry Secco	10nr-4p	53.95	6	\N	Gruvi	20	\N
106510.0	Gruvi N/A Dry Secco	10nr-4p	53.95	6	\N	Gruvi	20	\N
135552.0	Beatbox Strawberry Kiwi	500ml	37.6	12	3.29	BeatBox	50	\N
135502	Beatbox Pink Lemonade	500ml	26.4	12	3.29	BeatBox	50	\N
135513	Beatbox Mango	500ml	26.4	12	3.29	BeatBox	50	\N
135516	Beatbox Cranberry Dreams	500ml	26.4	12	3.29	BeatBox	50	\N
135530	Beatbox Orange Blast	500ml	26.4	12	3.29	BeatBox	50	\N
135532	BeatBox Cherry Limeade	500ml	26.4	12	3.29	BeatBox	50	\N
135534	BeatBox Peach Hard Tea	500ml	26.4	12	3.29	BeatBox	50	\N
287141	Buzzballz Biggies Ber Cher Lim	1.75l	43.2	3	16.99	BuzzBallz Biggies 	50	\N
287174	Buzzballz Biggies Pink Lemsqueezy	1.75l	43.2	3	16.99	BuzzBallz Biggies 	50	\N
303007	Breckenridge Sampler	12c-15p	28.78	2	16.49	Breck Larger	20	\N
303237	Breckenridge Avalanche Amber Ale	12c-15p	28.78	2	16.49	Breck Larger	20	\N
303352	Breckenridge Juice Drop	12c-12p	28.78	2	17.99	Breck Larger	20	\N
288100	Rolling Rock	12c-18l	11.4	1	\N	\N	\N	\N
288100.0	Rolling Rock	12c-18l	11.4	1	\N	\N	\N	\N
288105	Rolling Rock	12nr-12p	22.1	2	\N	\N	\N	\N
303334	Breckenridge Good Company	12c-15p	28.78	2	18.99	Breck Larger	20	\N
106511	Gruvi N/A Bubbly Rose	10nr-4p	53.95	6	\N	Gruvi	20	\N
106511.0	Gruvi N/A Bubbly Rose	10nr-4p	53.95	6	\N	Gruvi	20	\N
106512.0	Gruvi N/A Red Blend	8c-4p	75.0	6	\N	Gruvi	20	\N
135548.0	Big Sipz Warheads Atomic Apple	200ml	63.71	24	2.99	BuzzBallz	300	\N
287067	Buzzballz Peachballz	200ml	52.0	24	2.99	BuzzBallz	300	\N
287068	Buzzballz Chocolate Tease	200ml	52.0	24	2.99	BuzzBallz	300	\N
135514	BeatBox Variety Pack	500ml-6p	27.3	2	17.49	BeatBox	50	\N
287069	Buzzballz Lotta Colada	200ml	52.0	24	2.99	BuzzBallz	300	\N
287071	Buzzballz Watermelon Smash	200ml	52.0	24	2.99	BuzzBallz	300	\N
287074	Buzzballz Chili Mango Cocktail	200ml	52.0	24	2.99	BuzzBallz	300	\N
303934	Trve Tunnel of Trees	16c-4p	77.0	6	\N	\N	\N	\N
106506	Gruvi N/A Golden Lager	12c-6p	33.95	4	10.99	Gruvi	20	\N
106506.0	Gruvi N/A Golden Lager	12c-6p	33.95	4	10.99	Gruvi	20	\N
106507.0	Gruvi N/A Juicy Dayz IPA	12c-6p	33.95	4	10.99	Gruvi	20	\N
287076	Buzzballz Cran Blaster	200ml	52.0	24	2.99	BuzzBallz	300	\N
287078	Buzzballz Horchata	200ml	52.0	24	2.99	BuzzBallz	300	\N
287079	Buzzballz Tequila Rita	200ml	52.0	24	2.99	BuzzBallz	300	\N
287080	Buzzballz Hazelnut Latte	200ml	52.0	24	2.99	BuzzBallz	300	\N
303662	Launch Pad Piggyback Rides Hazy	16c-4p	72.0	6	\N	\N	\N	\N
303667	Launch Pad Strawberry Moon Blonde	16c-4p	60.0	6	\N	\N	\N	\N
310027	SweetWater IPA Variety Pack	12c-12p	28.5	2	\N	\N	\N	\N
329247	Shock Top Belgian White Ale	12c-15p	29.25	2	\N	\N	\N	\N
351076	Big Sky Moose Drool Brown	12c-12p	32.25	2	\N	\N	\N	\N
52043	Bud Light Chelada	12c-6p	37.95	4	\N	\N	\N	\N
53802	Bud Light NEXT Zero Carbs Lager	12c-12p	24.0	2	\N	\N	\N	\N
54218	Bud Light Lime American Lager Beer	12c-18l	17.6	1	\N	\N	\N	\N
56108	Bud Light Platinum Lager	12nr-18l	17.6	1	\N	\N	\N	\N
59104	10 Barrel Crush Variety Pack	12c-12p	35.38	2	\N	\N	\N	\N
59185	10 Barrel Pub Beer	12c-18p	11.4	1	\N	\N	\N	\N
59693	Elysian Space Dust IPA	12c-12p	34.6	2	\N	\N	\N	\N
59923	Golden Road Mango Cart	12c-6p	30.05	4	\N	\N	\N	\N
59986	Golden Road California Classics Vr	12c-12p	30.05	2	\N	\N	\N	\N
603847	Goose Island IPA	12c-15p	30.05	2	\N	\N	\N	\N
604008	Goose Island Beer Hug Mixed Pack	12c-12p	30.05	2	\N	\N	\N	\N
67400	NUTRL Pineapple Vodka Hard Seltzer	12c-4p	35.0	6	\N	\N	\N	\N
67408	NUTRL Classic Vodka Lemonade	12c-4p	35.0	6	\N	\N	\N	\N
67409	NUTRL Orange Vodka Hard Seltzer	12c-4p	35.0	6	\N	\N	\N	\N
67450	Skimmers Original Vodka Iced Tea	12c-4p	35.0	6	\N	\N	\N	\N
70276	Michelob Amber Bock	12nr-6p	30.75	4	\N	\N	\N	\N
731036	Kona Longboard Island Lager	12nr-6p	32.3	4	\N	\N	\N	\N
738030	Kona Big Wave Premium Beer	12c-18l	18.4	1	\N	\N	\N	\N
752640	Soonhari Apple Soju	375ml	70.0	24	\N	\N	\N	\N
752642	SoonHari Grape Soju	375ml	70.0	24	\N	\N	\N	\N
770287	Buffalo Trace Bourbon Cream	750ml	231.0	12	\N	\N	\N	\N
770365	Linie Aquavit	750ml	257.88	12	\N	\N	\N	\N
770464	Barton Naturals Vodka	1.75l	51.9	6	\N	\N	\N	\N
770699	Taaka Vodka	1.75l	39.59	6	\N	\N	\N	\N
771010	Fireball Cinnamon Wsky Party Bkt	50-20gft	82.14	6	\N	\N	\N	\N
771099	Paul Masson Brandy VS	100ml	47.52	48	\N	\N	\N	\N
771701	Traveller Whiskey	750ml	355.44	12	\N	\N	\N	\N
772002	Traveller Whiskey	50ml	159.19	120	\N	\N	\N	\N
135541	BeatBox Watermelon Lemonade	500ml	26.4	12	3.29	BeatBox	50	\N
772215	Sazerac 6 Yr Rye Whiskey	200ml	93.6	24	2.99	BuzzBallz	300	\N
303402	Breckenridge Juicy Oasis	12c-6p	34.43	4	10.99	Breck 6s	5	\N
303402.0	Breckenridge Juicy Oasis	12c-6p	34.43	4	10.99	Breck 6s	5	\N
303413	Breckenridge Juicy Oasis Tanger	12c-6p	34.43	4	9.99	Breck 6s	5	\N
303115	Breckenridge Avalanche Amber Ale	12c-6p	31.22	4	9.99	Breck 6s	5	\N
303117	Breckenridge Avalanche Amber Ale	12nr-6p	31.22	4	9.99	Breck 6s	5	\N
303285	Breckenridge Mountain Beach	12c-6p	33.97	4	9.99	Breck 6s	5	\N
303294	Breckenridge Palisade Peach Wheat	12nr-6p	31.22	4	9.99	Breck 6s	5	\N
303294.0	Breckenridge Palisade Peach Wheat	12nr-6p	31.22	4	9.99	Breck 6s	5	\N
303406	Breckenridge Ridge Runner	12c-6p	31.22	4	9.99	Breck 6s	5	\N
303406.0	Breckenridge Ridge Runner	12c-6p	31.22	4	9.99	Breck 6s	5	\N
751549	Cutwater Vodka White Russian	12c-4p	46.0	6	9.99	Cutwater	200	\N
751549.0	Cutwater Vodka White Russian	12c-4p	46.0	6	9.99	Cutwater	200	\N
751564	Cutwater Mango Margarita	12c-4p	46.0	6	9.99	Cutwater	200	\N
751564.0	Cutwater Mango Margarita	12c-4p	46.0	6	9.99	Cutwater	200	\N
751566	Cutwater Tequila Strawberry Marg	12c-4p	46.0	6	9.99	Cutwater	200	\N
751566.0	Cutwater Tequila Strawberry Marg	12c-4p	46.0	6	9.99	Cutwater	200	\N
751567	Cutwater Peach Margarita Cocktail	12c-4p	46.0	6	9.99	Cutwater	200	\N
751570	Cutwater Vodka Transfusion Pack	12c-4p	46.0	6	9.99	Cutwater	200	\N
751571	Cutwater Pina Colada Cocktail	12c-4p	46.0	6	9.99	Cutwater	200	\N
751578	Cutwater Tequila Pineapple Marg	12c-4p	46.0	6	9.99	Cutwater	200	\N
752095	Cutwater Long Island Iced Tea	12c-4p	46.0	6	9.99	Cutwater	200	\N
7522277	Cutwater Whiskey Sour	12c-4p	46.0	6	9.99	Cutwater	200	\N
752233	Cutwater Espresso	12c-4p	46.0	6	9.99	Cutwater	200	\N
752233.0	Cutwater Espresso	12c-4p	46.0	6	9.99	Cutwater	200	\N
752276	Cutwater Lemon Drop Martini	12c-4p	46.0	6	9.99	Cutwater	200	\N
752276.0	Cutwater Lemon Drop Martini	12c-4p	46.0	6	9.99	Cutwater	200	\N
752420	Cutwater Vod Pepper White Russian	12c-4p	59.43	6	9.99	Cutwater	200	\N
752654	Cutwater Gin Collins	12c-4p	46.0	6	9.99	Cutwater	200	\N
752654.0	Cutwater Gin Collins	12c-4p	46.0	6	9.99	Cutwater	200	\N
751517.0	Cutwater Tiki Rum Mai Tai	12c-4p	46.0	6	9.99	Cutwater	200	\N
87118.0	Happy Dad Hard Peach Tea	12c-12p	30.0	2	15.99	Happy Dad	50	\N
287082	Buzzballz Espresso Martini	200ml	52.0	24	2.99	BuzzBallz	300	\N
287143	Buzzballz Berry Cherry Limeade	200ml	52.0	24	2.99	BuzzBallz	300	\N
303024	Breckenridge Vanilla Porter	12nr-6p	31.22	4	9.99	Breck 6s	5	\N
303024.0	Breckenridge Vanilla Porter	12nr-6p	31.22	4	9.99	Breck 6s	5	\N
288370	Beck's NA	12nr-6p	32.4	4	\N	\N	\N	\N
289353	Spaten Lager	12nr-6p	33.05	4	\N	\N	\N	\N
288105.0	Rolling Rock	12nr-12p	22.1	2	\N	\N	\N	\N
288362	Boddingtons Pub Ale	16c-4p	43.76	6	\N	\N	\N	\N
288362.0	Boddingtons Pub Ale	16c-4p	43.76	6	\N	\N	\N	\N
288370.0	Beck's NA	12nr-6p	32.4	4	\N	\N	\N	\N
288373	Beck's	12nr-12p	26.65	2	\N	\N	\N	\N
288373.0	Beck's	12nr-12p	26.65	2	\N	\N	\N	\N
288374	Beck's	12nr-6p	30.05	4	\N	\N	\N	\N
288542	Estrella Jalisco	12c-12p	24.85	2	\N	\N	\N	\N
288542.0	Estrella Jalisco	12c-12p	24.85	2	\N	\N	\N	\N
288544	Estrella Jalisco	12nr-12p	24.85	2	\N	\N	\N	\N
288544.0	Estrella Jalisco	12nr-12p	24.85	2	\N	\N	\N	\N
288552	Estrella Jalisco	12nr-24l	19.2	1	\N	\N	\N	\N
288552.0	Estrella Jalisco	12nr-24l	19.2	1	\N	\N	\N	\N
289313.0	Spaten Franziskaner Hefe-Weisse	12nr-6p	33.05	4	\N	\N	\N	\N
289353.0	Spaten Lager	12nr-6p	33.05	4	\N	\N	\N	\N
289371	Hoegaarden Witbier Blanche	11nr-6p	33.05	2	\N	\N	\N	\N
289371.0	Hoegaarden Witbier Blanche	11nr-6p	33.05	2	\N	\N	\N	\N
289380	Leffe Blonde	11nr-6p	33.05	2	\N	\N	\N	\N
289380.0	Leffe Blonde	11nr-6p	33.05	2	\N	\N	\N	\N
303115.0	Breckenridge Avalanche Amber Ale	12c-6p	31.22	4	9.99	Breck 6s	5	\N
290105	Stella Artois Premium Lager Beer	11nr-6p	33.05	2	\N	\N	\N	\N
290105.0	Stella Artois Premium Lager Beer	11nr-6p	33.05	2	\N	\N	\N	\N
290107	Stella Artois Premium Lager Beer	11nr-18l	21.55	1	\N	\N	\N	\N
290122	Stella Artois Premium Lager Beer	25c-15l	39.8	15	\N	\N	\N	\N
290122.0	Stella Artois Premium Lager Beer	25c-15l	39.8	15	\N	\N	\N	\N
290124	Stella Artois Premium Lager Beer	12c-12p	24.0	2	\N	\N	\N	\N
290124.0	Stella Artois Premium Lager Beer	12c-12p	24.0	2	\N	\N	\N	\N
290130.0	Stella Artois 0.0	11nr-6p	33.05	2	\N	\N	\N	\N
290131.0	Stella Artois 0.0	12c-12p	29.3	2	\N	\N	\N	\N
301386	Four Peaks Kilt Lifter	12nr-6p	37.9	4	\N	\N	\N	\N
301386.0	Four Peaks Kilt Lifter	12nr-6p	36.9	4	\N	\N	\N	\N
303117.0	Breckenridge Avalanche Amber Ale	12nr-6p	31.22	4	9.99	Breck 6s	5	\N
303007.0	Breckenridge Sampler	12c-15p	28.78	2	16.49	Breck Larger	20	\N
303237.0	Breckenridge Avalanche Amber Ale	12c-15p	28.78	2	16.49	Breck Larger	20	\N
303136	Breckenridge Hoppy Variety Pack	12c-12p	27.98	2	17.99	Breck Larger	20	\N
303136.0	Breckenridge Hoppy Variety Pack	12c-12p	28.78	2	17.99	Breck Larger	20	\N
290130	Stella Artois 0.0	11nr-6p	33.05	2	\N	\N	\N	\N
303334.0	Breckenridge Good Company	12c-15p	28.78	2	18.99	Breck Larger	20	\N
303352.0	Breckenridge Juice Drop	12c-12p	28.78	2	17.99	Breck Larger	20	\N
303389	Breckenridge Palisade Peach Wheat	12c-12p	27.98	2	15.99	Breck Larger	20	\N
290123	Stella Artois Premium Lager Beer	12c-24l	22.29	1	23.99	Stella 24	100	\N
290123.0	Stella Artois Premium Lager Beer	12c-24l	22.29	1	23.99	Stella 24	100	\N
287163	Buzzballz Grapes Gone Wild	200ml	52.0	24	2.99	BuzzBallz	300	\N
287175	Buzzballz Pink Lemonsqueezy	200ml	52.0	24	2.99	BuzzBallz	300	\N
303389.0	Breckenridge Palisade Peach Wheat	12c-12p	28.78	2	15.99	Breck Larger	20	\N
303385	Breckenridge Funslinger	12c-12p	20.5	2	12.99	Breck Larger	20	\N
290101	Stella Artois Premium Lager Beer	11nr-24l	22.29	1	22.59	Stella 24	100	\N
303501	Station 26 303 Lager	12c-6p	32.0	4	\N	Station 26	25	\N
303501.0	Station 26 303 Lager	12c-6p	32.0	4	\N	Station 26	25	\N
303504.0	Station 26 Bang Bang Double IPA	12c-6p	43.0	4	\N	Station 26	25	\N
303509	Station 26 Juicy Banger IPA	12c-6p	37.5	4	\N	Station 26	25	\N
303509.0	Station 26 Juicy Banger IPA	12c-6p	37.5	4	\N	Station 26	25	\N
303513	Station 26 N/A Tangerine Cream	12c-6p	35.0	4	\N	Station 26	25	\N
303513.0	Station 26 N/A Tangerine Cream	12c-6p	35.0	4	\N	Station 26	25	\N
303516	Station 26 Mixed Twelver	12c-12p	30.5	2	\N	Station 26	25	\N
303516.0	Station 26 Mixed Twelver	12c-12p	30.5	2	\N	Station 26	25	\N
303524	Station 26 Tangerine Cream Ale	12c-6p	32.0	4	\N	Station 26	25	\N
303524.0	Station 26 Tangerine Cream Ale	12c-6p	32.0	4	\N	Station 26	25	\N
303650.0	Launch Pad Afternoon Delight	16c-4p	60.0	6	\N	\N	\N	\N
303659	Launch Pad Galactic Vaquero	16c-4p	60.0	6	\N	\N	\N	\N
303659.0	Launch Pad Galactic Vaquero	16c-4p	60.0	6	\N	\N	\N	\N
303662.0	Launch Pad Piggyback Rides Hazy	16c-4p	72.0	6	\N	\N	\N	\N
303667.0	Launch Pad Strawberry Moon Blonde	16c-4p	60.0	6	\N	\N	\N	\N
303714	New Image Coriolis Effect	12c-6p	43.0	4	\N	\N	\N	\N
303714.0	New Image Coriolis Effect	12c-6p	43.0	4	\N	\N	\N	\N
303744.0	New Image IPA	12c-6p	37.5	4	\N	\N	\N	\N
303751.0	New Image Moped	12c-6p	32.0	4	\N	\N	\N	\N
303900	Trve Bloodaxe	16c-4p	69.0	6	\N	\N	\N	\N
303900.0	Trve Bloodaxe	16c-4p	69.0	6	\N	\N	\N	\N
303921	Trve Siren	16c-4p	67.0	6	\N	\N	\N	\N
303921.0	Trve Siren	16c-4p	67.0	6	\N	\N	\N	\N
303924	Trve Skullseeker	16c-4p	50.0	6	\N	\N	\N	\N
303924.0	Trve Skullseeker	16c-4p	50.0	6	\N	\N	\N	\N
303934.0	Trve Tunnel of Trees	16c-4p	77.0	6	\N	\N	\N	\N
310000.0	SweetWater 420 Pale Ale	12c-6p	29.95	4	\N	\N	\N	\N
310027.0	SweetWater IPA Variety Pack	12c-12p	28.5	2	\N	\N	\N	\N
311105	Woodchuck Amber Draft Cider	12c-6p	33.0	4	\N	\N	\N	\N
311105.0	Woodchuck Amber Draft Cider	12c-6p	33.0	4	\N	\N	\N	\N
311106	Woodchuck Bubbly Pearsecco	12c-6p	33.0	4	\N	\N	\N	\N
311106.0	Woodchuck Bubbly Pearsecco	12c-6p	33.0	4	\N	\N	\N	\N
311108	Woodchuck Blueberry	12c-6p	33.0	4	\N	\N	\N	\N
311110	Woodchuck Variety Pack	12c-12p	30.0	2	\N	\N	\N	\N
311110.0	Woodchuck Variety Pack	12c-12p	30.0	2	\N	\N	\N	\N
329247.0	Shock Top Belgian White Ale	12c-15p	29.25	2	\N	\N	\N	\N
329360	Shock Top Belgian White Ale	12nr-12p	29.25	2	\N	\N	\N	\N
329360.0	Shock Top Belgian White Ale	12nr-12p	29.25	2	\N	\N	\N	\N
351075	Big Sky Moose Drool Brown	12c-6p	33.85	4	\N	\N	\N	\N
351075.0	Big Sky Moose Drool Brown	12c-6p	33.85	4	\N	\N	\N	\N
351076.0	Big Sky Moose Drool Brown	12c-12p	32.25	2	\N	\N	\N	\N
351079.0	Big Sky Huck It	12c-6p	35.35	4	\N	\N	\N	\N
46100	Michelob Ultra Signature Seltzer V	12c-12p	32.0	2	\N	\N	\N	\N
46100.0	Michelob Ultra Signature Seltzer V	12c-12p	32.0	2	\N	\N	\N	\N
46143	Michelob Ultra Infsns Lm Prck Ccts	12c-12p	29.55	2	\N	\N	\N	\N
46143.0	Michelob Ultra Infsns Lm Prck Ccts	12c-12p	29.55	2	\N	\N	\N	\N
46173	Michelob Ultra Infsns Lm Prck Ccts	12nr-12p	29.55	2	\N	\N	\N	\N
46173.0	Michelob Ultra Infsns Lm Prck Ccts	12nr-12p	29.55	2	\N	\N	\N	\N
46177	Michelob Ultra Infsns Lm Prck Ccts	12nr-6p	34.8	4	\N	\N	\N	\N
46177.0	Michelob Ultra Infsns Lm Prck Ccts	12nr-6p	34.8	4	\N	\N	\N	\N
49036	Landshark Lager	12nr-6p	30.75	4	\N	\N	\N	\N
49360	Landshark Lager	12nr-12p	25.6	2	\N	\N	\N	\N
49360.0	Landshark Lager	12nr-12p	24.0	2	\N	\N	\N	\N
52043.0	Bud Light Chelada	12c-6p	37.95	4	\N	\N	\N	\N
52044	Bud Light Chelada	16c-4p	43.76	6	\N	\N	\N	\N
52044.0	Bud Light Chelada	16c-4p	43.76	6	\N	\N	\N	\N
52253.0	Bud Light Chelada Tajin Chile Limo	25c-15l	34.55	15	\N	\N	\N	\N
53030	Bud Light American Lager Beer	12c-30p	21.2	1	\N	\N	\N	\N
53030.0	Bud Light American Lager Beer	12c-30p	21.2	1	\N	\N	\N	\N
53036	Bud Light American Lager Beer	12nr-6p	27.7	4	\N	\N	\N	\N
53036.0	Bud Light American Lager Beer	12nr-6p	27.7	4	\N	\N	\N	\N
53043	Bud Light American Lager Beer	16c-6p	31.85	4	\N	\N	\N	\N
53048	Bud Light American Lager Beer	16c-18l	20.0	1	\N	\N	\N	\N
53168	Bud Light American Lager Beer	12c-24l	19.65	1	\N	\N	\N	\N
53168.0	Bud Light American Lager Beer	12c-24l	19.65	1	\N	\N	\N	\N
53193	Bud Light American Lager Beer	25c-15l	33.5	15	\N	\N	\N	\N
53193.0	Bud Light American Lager Beer	25c-15l	33.5	15	\N	\N	\N	\N
53246	Bud Light American Lager Beer	12c-12p	22.3	2	\N	\N	\N	\N
53246.0	Bud Light American Lager Beer	12c-12p	22.3	2	\N	\N	\N	\N
53248	Bud Light American Lager Beer 7oz	7.5c-12p	12.2	2	\N	\N	\N	\N
53248.0	Bud Light American Lager Beer 7oz	7.5c-12p	12.2	2	\N	\N	\N	\N
53349	Bud Light American Lager Beer	12nr-24l	20.45	1	\N	\N	\N	\N
53349.0	Bud Light American Lager Beer	12nr-24l	19.65	1	\N	\N	\N	\N
53360	Bud Light American Lager Beer	12nr-12p	22.3	2	\N	\N	\N	\N
53360.0	Bud Light American Lager Beer	12nr-12p	22.3	2	\N	\N	\N	\N
53802.0	Bud Light NEXT Zero Carbs Lager	12c-12p	24.0	2	\N	\N	\N	\N
54218.0	Bud Light Lime American Lager Beer	12c-18l	17.6	1	\N	\N	\N	\N
54246	Bud Light Lime American Lager Beer	12c-12p	24.0	2	\N	\N	\N	\N
54246.0	Bud Light Lime American Lager Beer	12c-12p	24.0	2	\N	\N	\N	\N
54308	Bud Light Lime American Lager Beer	12nr-18l	17.6	1	\N	\N	\N	\N
54308.0	Bud Light Lime American Lager Beer	12nr-18l	17.6	1	\N	\N	\N	\N
54360.0	Bud Light Lime American Lager Beer	12nr-12p	24.0	2	\N	\N	\N	\N
55508	Ritas Strawber-Rita Margarita	7.5c-12p	15.0	2	\N	\N	\N	\N
55508.0	Ritas Strawber-Rita Margarita	7.5c-12p	15.0	2	\N	\N	\N	\N
56108.0	Bud Light Platinum Lager	12nr-18l	17.6	1	\N	\N	\N	\N
56136	Bud Light Platinum Lager	12nr-6p	30.75	4	\N	\N	\N	\N
56146	Bud Light Platinum Lager	12c-12p	24.0	2	\N	\N	\N	\N
56146.0	Bud Light Platinum Lager	12c-12p	24.0	2	\N	\N	\N	\N
56160.0	Bud Light Platinum Lager	12nr-12p	24.0	2	\N	\N	\N	\N
56275.0	Bud Light Seltzer Flavor Burst Var	12c-24p	25.75	1	\N	\N	\N	\N
59045	10 Barrel Cucumber Sour Crush	12c-6p	36.9	4	\N	\N	\N	\N
59045.0	10 Barrel Cucumber Sour Crush	12c-6p	36.9	4	\N	\N	\N	\N
59104.0	10 Barrel Crush Variety Pack	12c-12p	35.38	2	\N	\N	\N	\N
59185.0	10 Barrel Pub Beer	12c-18p	11.4	1	\N	\N	\N	\N
59664	Elysian Space Dust IPA	12nr-6p	36.9	4	\N	\N	\N	\N
59664.0	Elysian Space Dust IPA	12nr-6p	36.9	4	\N	\N	\N	\N
59693.0	Elysian Space Dust IPA	12c-12p	34.6	2	\N	\N	\N	\N
59767	Elysian Space Dust	19c-15l	32.45	15	\N	\N	\N	\N
59767.0	Elysian Space Dust	19c-15l	32.45	15	\N	\N	\N	\N
59788	Elysian Space Dust Variety Pack	12c-12p	34.6	2	\N	\N	\N	\N
59788.0	Elysian Space Dust Variety Pack	12c-12p	34.6	2	\N	\N	\N	\N
59790	Elysian Non-Alcoholic Easy Dust	12c-6p	34.4	4	\N	\N	\N	\N
59790.0	Elysian Non-Alcoholic Easy Dust	12c-6p	34.4	4	\N	\N	\N	\N
59923.0	Golden Road Mango Cart	12c-6p	30.05	4	\N	\N	\N	\N
59982	Golden Road Mango Cart Non-Alc	12c-6p	34.33	4	\N	\N	\N	\N
59982.0	Golden Road Mango Cart Non-Alc	12c-6p	33.08	4	\N	\N	\N	\N
59986.0	Golden Road California Classics Vr	12c-12p	30.05	2	\N	\N	\N	\N
59987	Golden Road Mango Cart	12c-12p	30.05	2	\N	\N	\N	\N
59987.0	Golden Road Mango Cart	12c-12p	30.05	2	\N	\N	\N	\N
603142	Goose Island Tropical Beer Hug	19c-15l	32.45	15	\N	\N	\N	\N
603142.0	Goose Island Tropical Beer Hug	19c-15l	32.45	15	\N	\N	\N	\N
603847.0	Goose Island IPA	12c-15p	30.05	2	\N	\N	\N	\N
604006	Goose Island Hazy Beer Hug	12c-6p	30.05	4	\N	\N	\N	\N
604008.0	Goose Island Beer Hug Mixed Pack	12c-12p	30.05	2	\N	\N	\N	\N
604009	Goose Island Hazy Beer Hug	12c-12p	30.05	2	\N	\N	\N	\N
61030.0	Busch American Lager Beer	12c-30p	15.55	1	\N	\N	\N	\N
67246	Busch NA	12c-12p	22.1	2	\N	\N	\N	\N
67246.0	Busch NA	12c-12p	22.1	2	\N	\N	\N	\N
67400.0	NUTRL Pineapple Vodka Hard Seltzer	12c-4p	35.0	6	\N	\N	\N	\N
67402.0	NUTRL Watermel Vodka Hard Seltzer	12c-4p	35.0	6	\N	\N	\N	\N
67404	NUTRL Vodka Cranberry Variety Pack	12c-8p	35.0	3	\N	\N	\N	\N
67407	NUTRL Classic Vodka Cranberry	12c-4p	35.0	6	\N	\N	\N	\N
67407.0	NUTRL Classic Vodka Cranberry	12c-4p	35.0	6	\N	\N	\N	\N
67408.0	NUTRL Classic Vodka Lemonade	12c-4p	35.0	6	\N	\N	\N	\N
67409.0	NUTRL Orange Vodka Hard Seltzer	12c-4p	35.0	6	\N	\N	\N	\N
67412	NUTRL Black Cherry Vod Seltzer	12c-4p	35.0	6	\N	\N	\N	\N
67416	NUTRL Watermel Vodka Hard Seltzer	720ml	38.92	12	\N	\N	\N	\N
67416.0	NUTRL Watermel Vodka Hard Seltzer	720ml	38.92	12	\N	\N	\N	\N
67417	NUTRL Lime Vodka Hard Seltzer	12c-4p	35.0	6	\N	\N	\N	\N
67417.0	NUTRL Lime Vodka Hard Seltzer	12c-4p	35.0	6	\N	\N	\N	\N
67418.0	NUTRL Strawberry Hard Seltzer	12c-4p	35.0	6	\N	\N	\N	\N
67421	NUTRL Vodka Real Fruit Juice VP	12c-12p	30.0	2	\N	\N	\N	\N
67421.0	NUTRL Vodka Real Fruit Juice VP	12c-12p	30.0	2	\N	\N	\N	\N
67422.0	Nutrl Peach Vodka Hard Seltzer	12c-4p	52.55	6	\N	\N	\N	\N
67423.0	Nutrl Fruit Variety Pack 2	12c-8p	50.7	3	\N	\N	\N	\N
67455	Skimmers Vodka Iced Tea VP	12c-8p	35.0	3	\N	\N	\N	\N
70276.0	Michelob Amber Bock	12nr-6p	30.75	4	\N	\N	\N	\N
70389	Michelob Amber Bock	12nr-12p	24.0	2	\N	\N	\N	\N
70389.0	Michelob Amber Bock	12nr-12p	24.0	2	\N	\N	\N	\N
731036.0	Kona Longboard Island Lager	12nr-6p	32.3	4	\N	\N	\N	\N
731062.0	Kona Longboard Island Lager	12c-12p	29.25	2	\N	\N	\N	\N
732088	Kona Wave Rider Variety Pack	12c-12p	29.25	2	\N	\N	\N	\N
732088.0	Kona Wave Rider Variety Pack	12c-12p	29.25	2	\N	\N	\N	\N
732098	Kona Big Wave Premium Beer	25c-15l	36.7	15	\N	\N	\N	\N
738030.0	Kona Big Wave Premium Beer	12c-18l	18.4	1	\N	\N	\N	\N
738032	Kona Big Wave Premium Beer	12nr-12p	29.25	2	\N	\N	\N	\N
738032.0	Kona Big Wave Premium Beer	12nr-12p	29.25	2	\N	\N	\N	\N
738034	Kona Big Wave Premium Beer	12c-6p	32.3	4	\N	\N	\N	\N
738035	Kona Big Wave Premium Beer	12c-12p	29.25	2	\N	\N	\N	\N
738035.0	Kona Big Wave Premium Beer	12c-12p	29.25	2	\N	\N	\N	\N
738036	Kona Big Wave Premium Beer	12nr-6p	32.3	4	\N	\N	\N	\N
738036.0	Kona Big Wave Premium Beer	12nr-6p	32.3	4	\N	\N	\N	\N
75001	Cutwater Chocolate Espresso	12c-4p	46.0	6	9.99	Cutwater	200	\N
75001.0	Cutwater Chocolate Espresso	12c-4p	46.0	6	9.99	Cutwater	200	\N
751504	Cutwater Spicy Bloody Mary	12c-4p	46.0	6	9.99	Cutwater	200	\N
751508	Cutwater Vodka Mule	12c-4p	46.0	6	9.99	Cutwater	200	\N
751508.0	Cutwater Vodka Mule	12c-4p	46.0	6	9.99	Cutwater	200	\N
751513	Cutwater Tequila Grapefruit Paloma	12c-4p	46.0	6	9.99	Cutwater	200	\N
751514	Cutwater Tequila Lime Margarita	12c-4p	46.0	6	9.99	Cutwater	200	\N
751514.0	Cutwater Tequila Lime Margarita	12c-4p	46.0	6	9.99	Cutwater	200	\N
751517	Cutwater Tiki Rum Mai Tai	12c-4p	46.0	6	9.99	Cutwater	200	\N
751705.0	Natural Light Strwbrry Lmnde Vodka	50ml	56.42	120	\N	\N	\N	\N
752243	Surfside Iced Tea Variety Pack	12c-8p	39.98	3	\N	\N	\N	\N
752243.0	Surfside Iced Tea Variety Pack	12c-8p	39.98	3	\N	\N	\N	\N
752244.0	Surfside Vodka Iced Tea	12c-4p	38.53	6	\N	\N	\N	\N
752245.0	Surfside Vodka Lemonade	12c-4p	38.53	6	\N	\N	\N	\N
752246	Surfside Vodka Iced Tea & Lemonade	12c-4p	38.53	6	\N	\N	\N	\N
752247	Surfside Vodka Peach Tea	12c-4p	38.53	6	\N	\N	\N	\N
752247.0	Surfside Vodka Peach Tea	12c-4p	38.53	6	\N	\N	\N	\N
752306	Good Boy JD Vod Iced Tea & Lemon	12c-4p	48.83	6	\N	\N	\N	\N
752308	Good Boy Vodka Seltzer Variety	12c-8p	44.42	3	\N	\N	\N	\N
752308.0	Good Boy Vodka Seltzer Variety	12c-8p	44.42	3	\N	\N	\N	\N
752309	Good Boy John Daly Variety	12c-8p	44.42	3	\N	\N	\N	\N
752309.0	Good Boy John Daly Variety	12c-8p	44.42	3	\N	\N	\N	\N
752359	Surfside Vodka Lemonade Variety	12c-8p	39.98	3	\N	\N	\N	\N
752359.0	Surfside Vodka Lemonade Variety	12c-8p	39.98	3	\N	\N	\N	\N
752431	Stateside Vodka Soda Variety Pack	12c-8p	39.98	3	\N	\N	\N	\N
752471.0	Surfside Green Tea and Vodka	12c-4p	38.53	6	\N	\N	\N	\N
752637	Soonhari Peach Soju	375ml	70.0	24	\N	\N	\N	\N
752637.0	Soonhari Peach Soju	375ml	70.0	24	\N	\N	\N	\N
752638	Soonhari Strawberry Soju	375ml	70.0	24	\N	\N	\N	\N
752638.0	Soonhari Strawberry Soju	375ml	70.0	24	\N	\N	\N	\N
752639	Soonhari Apple Mango Soju	375ml	70.0	24	\N	\N	\N	\N
752639.0	Soonhari Apple Mango Soju	375ml	70.0	24	\N	\N	\N	\N
752640.0	Soonhari Apple Soju	375ml	70.0	24	\N	\N	\N	\N
752642.0	SoonHari Grape Soju	375ml	70.0	24	\N	\N	\N	\N
752645	Soonhari Yuzu Citrus Soju	375ml	70.0	24	\N	\N	\N	\N
752645.0	Soonhari Yuzu Citrus Soju	375ml	70.0	24	\N	\N	\N	\N
752678	Surfside Green Tea & Vodka Variety	12c-8p	39.98	3	\N	\N	\N	\N
752678.0	Surfside Green Tea & Vodka Variety	12c-8p	39.98	3	\N	\N	\N	\N
752716	Surfside Vodka Raspberry Tea	12c-4p	38.53	6	\N	\N	\N	\N
752716.0	Surfside Vodka Raspberry Tea	12c-4p	38.53	6	\N	\N	\N	\N
752733	Soonhari Lychee Soju	375ml	70.0	24	\N	\N	\N	\N
752734	Soonhari Plum Soju	375ml	70.0	24	\N	\N	\N	\N
752734.0	Soonhari Plum Soju	375ml	70.0	24	\N	\N	\N	\N
752739	Good Boy Vodka Lemonade VP	12c-8p	44.42	3	\N	\N	\N	\N
752840	Carbliss Vodka Black Raspberry	12c-4p	45.0	6	\N	\N	\N	\N
752841	Carbliss Vodka Pineapple	12c-4p	45.0	6	\N	\N	\N	\N
752842	Carbliss Vodka Cranberry	12c-4p	45.0	6	\N	\N	\N	\N
752843	Carbliss Vodka Lemon Lime	12c-4p	45.0	6	\N	\N	\N	\N
752844	Carbliss Peach	12c-4p	45.0	6	\N	\N	\N	\N
752845	Carbliss Vodka Black Cherry	12c-4p	45.0	6	\N	\N	\N	\N
752846	Carbliss Mango	12c-4p	45.0	6	\N	\N	\N	\N
752847	Carbliss Watermelon	12c-4p	45.0	6	\N	\N	\N	\N
752848.0	Carbliss Strawberry Margarita	12c-4p	55.9	6	\N	\N	\N	\N
752849.0	Carbliss Margarita	12c-4p	55.9	6	\N	\N	\N	\N
752887	Surfside Lemonade Variety Pack	12c-18p	26.1	1	\N	\N	\N	\N
752887.0	Surfside Lemonade Variety Pack	12c-18p	26.1	1	\N	\N	\N	\N
753028	Surfside Half & Half Variety Pack	12c-8p	39.98	3	\N	\N	\N	\N
753077	Surfside Blueberry Lemonade	12c-4p	53.29	6	\N	\N	\N	\N
770022.0	Myers's Dark	750ml	213.31	12	\N	\N	\N	\N
770040	Southern Comfort Original 70 Proof	1.75l	95.74	6	\N	\N	\N	\N
770040.0	Southern Comfort Original 70 Proof	1.75l	95.74	6	\N	\N	\N	\N
770123	Caravella Limoncello	750ml	84.42	12	\N	\N	\N	\N
770125	Sazerac 6 Yr Rye Whiskey	750ml	115.68	12	\N	\N	\N	\N
770153.0	San Matias Gran Reserva Tequila	750ml	278.4	12	\N	\N	\N	\N
770154.0	Egri Bikaver Bull's Blood	750ml	85.68	12	\N	\N	\N	\N
770156	Glenfarclas 12 Yr	750ml	368.95	12	\N	\N	\N	\N
770158.0	Pirassununga 51 Cachaca	1l	196.68	12	\N	\N	\N	\N
770190.0	Platinum Vodka 7X PET	750ml	96.24	12	\N	\N	\N	\N
770203.0	R&R Canadian Reserve	1.75l	102.6	6	\N	\N	\N	\N
770209	Margaritaville Skinny Margarita	1.75l	48.84	6	\N	\N	\N	\N
770209.0	Margaritaville Skinny Margarita	1.75l	48.84	6	\N	\N	\N	\N
770222	Margaritaville Gold Tequila	1.75l	105.54	6	\N	\N	\N	\N
770224	Margaritaville Silver Tequila	1.75l	105.54	6	\N	\N	\N	\N
770244.0	Ryan's Creme	1.75l	81.55	6	\N	\N	\N	\N
770271	Di Amore Amaretto	1.75l	108.6	6	\N	\N	\N	\N
770271.0	Di Amore Amaretto	1.75l	108.6	6	\N	\N	\N	\N
770276.0	Platinum Vodka 7X Traveler	100ml	63.68	48	\N	\N	\N	\N
751518	Cutwater Whiskey Mule	12c-4p	59.43	6	9.99	Cutwater	200	\N
770280	Gran Gala	750ml	168.95	12	\N	\N	\N	\N
770287.0	Buffalo Trace Bourbon Cream	750ml	231.0	12	\N	\N	\N	\N
770320	Gran Gala	1.75l	143.77	6	\N	\N	\N	\N
770320.0	Gran Gala	1.75l	143.77	6	\N	\N	\N	\N
770322	Rey Sol Tequila Extra Anejo	750ml	888.88	12	\N	\N	\N	\N
770329	Legendre Herbsaint	750ml	166.62	12	\N	\N	\N	\N
770345	Monte Alban Reposado	1.75l	100.76	6	\N	\N	\N	\N
770347	Ten High Sour Mash Brbn Whiskey	1.75l	62.34	6	\N	\N	\N	\N
770347.0	Ten High Sour Mash Brbn Whiskey	1.75l	62.34	6	\N	\N	\N	\N
770349	Black Magic Black Spiced Rum	1.75l	81.54	6	\N	\N	\N	\N
770349.0	Black Magic Black Spiced Rum	1.75l	81.54	6	\N	\N	\N	\N
770351	Wheatley Vodka	750ml	203.76	12	\N	\N	\N	\N
770361	Tuaca	750ml	186.64	12	\N	\N	\N	\N
770363	Tuaca	1.75l	175.92	6	\N	\N	\N	\N
770365.0	Linie Aquavit	750ml	257.88	12	\N	\N	\N	\N
770397	WL Weller Special Reserve	1.75l	222.18	6	\N	\N	\N	\N
770411.0	Mr Boston Peppermint Schnapps	100ml	32.16	48	\N	\N	\N	\N
770426.0	Platinum Vodka 7X Traveler	375ml	95.13	24	\N	\N	\N	\N
770439	Fleischmann's Gin	1.75l	70.99	6	\N	\N	\N	\N
770439.0	Fleischmann's Gin	1.75l	70.99	6	\N	\N	\N	\N
770464.0	Barton Naturals Vodka	1.75l	51.9	6	\N	\N	\N	\N
770471	Kentucky Gentleman	1.75l	57.53	6	\N	\N	\N	\N
770471.0	Kentucky Gentleman	1.75l	57.53	6	\N	\N	\N	\N
770482.0	99 Mangoes	50ml	81.6	120	\N	\N	\N	\N
770492	Taaka Gin	1.75l	49.25	6	\N	\N	\N	\N
770578	Rain Vodka	1.75l	105.54	6	\N	\N	\N	\N
770629.0	99 Brand Variety Pack	50-10gft	81.6	12	\N	\N	\N	\N
770637	Myers's Dark	1l	347.88	12	\N	\N	\N	\N
770669	Barton Vodka	1.75l	44.64	6	\N	\N	\N	\N
770669.0	Barton Vodka	1.75l	44.64	6	\N	\N	\N	\N
770690	Yukon Jack Fire	50ml	67.2	120	\N	\N	\N	\N
770699.0	Taaka Vodka	1.75l	39.59	6	\N	\N	\N	\N
770733	Stirrings Triple Sec Liqueur	750ml	88.78	12	\N	\N	\N	\N
770741	Paul Masson Brandy Grd Amber Apple	750ml	64.99	12	\N	\N	\N	\N
770752	Southern Comfort Black 80 PET	100ml	32.16	48	\N	\N	\N	\N
770769	Seagram's VO Canadian Whiskey	1.75l	102.12	6	\N	\N	\N	\N
770780.0	Parrot Bay Coconut 90	1.75l	110.04	6	\N	\N	\N	\N
770781	99 Fruit Party Pack	50ml10gf	81.6	12	\N	\N	\N	\N
770781.0	99 Fruit Party Pack	50ml10gf	81.6	12	\N	\N	\N	\N
770810	Seagram's VO Canadian Whiskey	750ml	168.96	12	\N	\N	\N	\N
770832	Grind Espresso Shot	750ml	151.08	12	\N	\N	\N	\N
770832.0	Grind Espresso Shot	750ml	151.08	12	\N	\N	\N	\N
770838.0	Skol Vodka Plastic	750ml	62.16	12	\N	\N	\N	\N
770839	Skol Vodka	375ml	58.56	24	\N	\N	\N	\N
770894	Taaka Vodka	750ml	51.01	12	\N	\N	\N	\N
770897.0	Taaka Vodka	100ml	26.63	48	\N	\N	\N	\N
770904.0	Di Amore Amaretto	750ml	97.69	12	\N	\N	\N	\N
770962.0	Skol Vodka	1.75l	43.16	6	\N	\N	\N	\N
770964.0	99 Apples	50ml	81.6	120	\N	\N	\N	\N
770967	99 Watermelons	50ml	81.6	120	\N	\N	\N	\N
770987.0	99 Pineapple	50ml	81.6	120	\N	\N	\N	\N
770989.0	99 Grapes Schnapps	50ml	81.6	120	\N	\N	\N	\N
770994.0	Fireball Cinnamon Whisky PET	1.75l	133.5	6	\N	\N	\N	\N
771008	Fireball Cinnamon Whisky 4pk	50ml-4gf	82.2	30	\N	\N	\N	\N
771008.0	Fireball Cinnamon Whisky 4pk	50ml-4gf	82.2	30	\N	\N	\N	\N
771009	Fireball Cinnamon Whisky	50ml	82.2	120	\N	\N	\N	\N
771009.0	Fireball Cinnamon Whisky	50ml	82.2	120	\N	\N	\N	\N
771010.0	Fireball Cinnamon Wsky Party Bkt	50-20gft	82.14	6	\N	\N	\N	\N
771014	Fireball Cinnamon Whisky	100ml	64.0	48	\N	\N	\N	\N
771015	Fireball Cinnamon Whisky	50-10gft	82.2	12	\N	\N	\N	\N
771015.0	Fireball Cinnamon Whisky	50-10gft	82.2	12	\N	\N	\N	\N
771017.0	Fireball Cinnamon Whisky	375ml	103.75	24	\N	\N	\N	\N
771019	Fireball Cinnamon Whisky	100-6gft	64.0	20	\N	\N	\N	\N
771026	Fireball Cinnamon Whisky	50ml-6gf	82.2	20	\N	\N	\N	\N
771026.0	Fireball Cinnamon Whisky	50ml-6gf	82.2	20	\N	\N	\N	\N
771093	Paul Masson Brandy Grd Amber VS	1.75l	81.56	6	\N	\N	\N	\N
771109	Fireball Cinnamon Whisky	1.75l	133.5	6	\N	\N	\N	\N
771109.0	Fireball Cinnamon Whisky	1.75l	133.5	6	\N	\N	\N	\N
771133.0	Corazon Anejo Tequila	750ml	119.94	12	\N	\N	\N	\N
771134.0	Corazon Blanco Tequila	750ml	97.68	12	\N	\N	\N	\N
771135.0	Corazon Reposado Tequila	750ml	106.62	12	\N	\N	\N	\N
771149.0	Myers's Dark	1.75l	195.6	6	\N	\N	\N	\N
771202.0	99 Assorted Flavor Party Bucket	50-20gft	81.6	6	\N	\N	\N	\N
771425	Fireball Seasonal Party Pack Gft	50ml15gf	82.16	12	\N	\N	\N	\N
771523	Siete Leguas Anejo Tequila	700ml	288.84	6	\N	\N	\N	\N
771599	Aalborg Jubilaeums Akavit	750ml	115.5	12	\N	\N	\N	\N
771599.0	Aalborg Jubilaeums Akavit	750ml	115.5	12	\N	\N	\N	\N
771653	Sazerac 6 Yr Rye Whiskey	1.75l	244.74	6	\N	\N	\N	\N
771810	HDW Century Vodka	750ml	444.42	12	\N	\N	\N	\N
771837	Dr McGillicuddy's Root Beer	50ml	39.6	120	\N	\N	\N	\N
771837.0	Dr McGillicuddy's Root Beer	50ml	39.6	120	\N	\N	\N	\N
771882	99 Strawberry	100ml	61.5	48	\N	\N	\N	\N
771882.0	99 Strawberry	100ml	61.5	48	\N	\N	\N	\N
772161	Linie Aquavit	700ml	257.88	6	\N	\N	\N	\N
772282	Sazerac 6 Year Rye 100 Proof	1l	168.37	12	\N	\N	\N	\N
771031	Fireball Cinnamon Whisky	200ml	120.0	24	2.99	BuzzBallz	300	\N
772312.0	Fireball Blazin Apple Whisky	50-10gft	82.2	12	\N	\N	\N	\N
772313	Fireball Blazin Apple Whisky	50ml	82.2	120	\N	\N	\N	\N
772313.0	Fireball Blazin Apple Whisky	50ml	82.2	120	\N	\N	\N	\N
772400	Margaritaville Silver Tequila 10pk	50-10gft	81.6	12	\N	\N	\N	\N
772400.0	Margaritaville Silver Tequila 10pk	50-10gft	81.6	12	\N	\N	\N	\N
78016.0	Budweiser Zero Non-Alcoholic Lager	12c-12p	26.0	2	\N	\N	\N	\N
79246.0	O'Doul's NA	12c-12p	23.6	2	\N	\N	\N	\N
827200.0	Biolyte Citrus	16oz	28.2	12	\N	\N	\N	\N
846508.0	Arizona Hard Green Tea	12c-12p	27.0	2	\N	\N	\N	\N
846514.0	Arizona Hard Juice Variety	12c-12p	27.0	2	\N	\N	\N	\N
86030.0	Busch Light American Lager Beer	12c-30p	15.55	1	\N	\N	\N	\N
86218	Busch Light American Lager Beer	12c-18l	11.4	1	\N	\N	\N	\N
86218.0	Busch Light American Lager Beer	12c-18l	11.4	1	\N	\N	\N	\N
86246.0	Busch Light American Lager Beer	12c-12p	15.0	2	\N	\N	\N	\N
86360	Busch Light American Lager Beer	12nr-12p	15.0	2	\N	\N	\N	\N
86360.0	Busch Light American Lager Beer	12nr-12p	15.0	2	\N	\N	\N	\N
86941	Busch Light American Lager Beer	16c-8p	18.45	3	\N	\N	\N	\N
86941.0	Busch Light American Lager Beer	16c-8p	18.45	3	\N	\N	\N	\N
303273	Breckenridge Juice Drop	12c-6p	31.22	4	9.99	Breck 6s	5	\N
930920	Higher Realm THC 1.75mg Orange	12c-4p	72.0	6	\N	\N	\N	\N
930920.0	Higher Realm THC 1.75mg Orange	12c-4p	72.0	6	\N	\N	\N	\N
930921	Higher Realm THC 1.75mg Blueberry	12c-4p	72.0	6	\N	\N	\N	\N
930921.0	Higher Realm THC 1.75mg Blueberry	12c-4p	72.0	6	\N	\N	\N	\N
930922	Higher Realm THC 1.75mg Lemon Lime	12c-4p	72.0	6	\N	\N	\N	\N
930922.0	Higher Realm THC 1.75mg Lemon Lime	12c-4p	72.0	6	\N	\N	\N	\N
96166	Michelob ULTRA Light Lager	16al-12p	28.69	2	\N	\N	\N	\N
96166.0	Michelob ULTRA Light Lager	16al-12p	28.69	2	\N	\N	\N	\N
96168	Michelob ULTRA	12c-24l	21.6	1	\N	\N	\N	\N
96168.0	Michelob ULTRA Light Lager	12c-24l	20.8	1	\N	\N	\N	\N
96218.0	Michelob ULTRA Light Lager	12c-18l	17.6	1	\N	\N	\N	\N
96246	Michelob ULTRA Light Lager	12c-12p	24.0	2	\N	\N	\N	\N
96246.0	Michelob ULTRA Light Lager	12c-12p	24.0	2	\N	\N	\N	\N
96251.0	Michelob ULTRA Light Lager	25c-15l	34.55	15	\N	\N	\N	\N
96276.0	Michelob ULTRA Light Lager	12nr-6p	30.75	4	\N	\N	\N	\N
96278	Michelob ULTRA Zero Non-Alcoholic	12c-12p	24.8	2	\N	\N	\N	\N
96278.0	Michelob ULTRA Zero Non-Alcoholic	12c-12p	24.0	2	\N	\N	\N	\N
96279	Michelob ULTRA Zero Non-Alcoholic	12nr-6p	31.6	4	\N	\N	\N	\N
96279.0	Michelob ULTRA Zero Non-Alcoholic	12nr-6p	31.6	4	\N	\N	\N	\N
96281.0	Michelob Ultra Zero Lime N/A	12nr-6p	31.6	4	\N	\N	\N	\N
96308.0	Michelob ULTRA Light Lager	12nr-18l	17.6	1	\N	\N	\N	\N
96389	Michelob ULTRA	12nr-12p	24.8	2	\N	\N	\N	\N
96389.0	Michelob ULTRA Light Lager	12nr-12p	24.0	2	\N	\N	\N	\N
96405	Michelob ULTRA Light Lager	7.5c-12p	13.8	2	\N	\N	\N	\N
96405.0	Michelob ULTRA Light Lager	7.5c-12p	13.8	2	\N	\N	\N	\N
96479	Michelob ULTRA	12nr-24l	21.6	1	\N	\N	\N	\N
96479.0	Michelob ULTRA Light Lager	12nr-24l	20.8	1	\N	\N	\N	\N
96602.0	Michelob ULTRA Pure Gold Organic	12nr-12p	29.55	2	\N	\N	\N	\N
96603	Michelob ULTRA Pure Gold Organic	12c-12p	29.55	2	\N	\N	\N	\N
96603.0	Michelob ULTRA Pure Gold Organic	12c-12p	29.55	2	\N	\N	\N	\N
96604	Michelob ULTRA Pure Gold Organic	12nr-6p	34.8	4	\N	\N	\N	\N
nan	Egri Bikaver Bull's Blood	750ml	85.68	12	\N	\N	\N	\N
87100.0	Happy Dad Hard Seltzer Variety	12c-12p	26.14	2	17.99	Happy Dad	50	\N
87118	Happy Dad Hard Peach Tea	12c-12p	30.0	2	15.99	Happy Dad	50	\N
772314	Fireball Blazin Apple Whisky	200ml	120.0	24	2.99	BuzzBallz	300	\N
290101.0	Stella Artois Premium Lager Beer	11nr-24l	22.29	1	22.59	Stella 24	100	\N
303273.0	Breckenridge Juice Drop	12c-6p	31.22	4	9.99	Breck 6s	5	\N
78016	Budweiser Zero Non-Alcoholic Lager	12c-12p	26.0	2	\N	\N	\N	\N
79036	O'Doul's NA	12nr-6p	27.15	4	\N	\N	\N	\N
79246	O'Doul's NA	12c-12p	23.6	2	\N	\N	\N	\N
96218	Michelob ULTRA Light Lager	12c-18l	17.6	1	\N	\N	\N	\N
96251	Michelob ULTRA Light Lager	25c-15l	34.55	15	\N	\N	\N	\N
96276	Michelob ULTRA Light Lager	12nr-6p	30.75	4	\N	\N	\N	\N
96308	Michelob ULTRA Light Lager	12nr-18l	17.6	1	\N	\N	\N	\N
96602	Michelob ULTRA Pure Gold Organic	12nr-12p	29.55	2	\N	\N	\N	\N
nan	Gruvi N/A Mocha Nitro Stout	12c-6p	33.95	4	\N	Gruvi	20	\N
87101	Happy Dad Hard Seltzer Fruit Punch	12c-12p	26.14	2	17.99	Happy Dad	50	\N
87101.0	Happy Dad Hard Seltzer Fruit Punch	12c-12p	26.14	2	17.99	Happy Dad	50	\N
87103	Happy Dad Hard Seltzer Grape	12c-12p	26.14	2	17.99	Happy Dad	50	\N
87103.0	Happy Dad Hard Seltzer Grape	12c-12p	26.14	2	17.99	Happy Dad	50	\N
87106	Happy Dad Hard Tea Variety Pack	12c-12p	26.14	2	17.99	Happy Dad	50	\N
87106.0	Happy Dad Hard Tea Variety Pack	12c-12p	26.14	2	17.99	Happy Dad	50	\N
87107	Happy Dad Hard Tea Half & Half	12c-12p	26.14	2	17.99	Happy Dad	50	\N
87107.0	Happy Dad Hard Tea Half & Half	12c-12p	30.0	2	17.99	Happy Dad	50	\N
\.


--
-- TOC entry 4864 (class 2606 OID 16487)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (vendor_item_code, package_type);


-- Completed on 2026-03-24 13:19:47

--
-- PostgreSQL database dump complete
--

\unrestrict Sh8yh669RTXUmd9EQqiqBAxzc6bVI1nFdl5NlXNS506P6fzj4aPCncp7EBHNauR

