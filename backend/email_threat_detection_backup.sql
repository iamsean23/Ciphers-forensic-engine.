--
-- PostgreSQL database dump
--

\restrict behobIbsJbP3zvoWmwx5k2goexnIlFKOv6vVE83g3QU6wKM3yGZdSfwxur3Ccpe

-- Dumped from database version 18.6
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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ai_results; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ai_results (
    id integer NOT NULL,
    email_id integer NOT NULL,
    prediction character varying(100) NOT NULL,
    confidence_score double precision,
    explanation text,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ai_results OWNER TO postgres;

--
-- Name: ai_results_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ai_results_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_results_id_seq OWNER TO postgres;

--
-- Name: ai_results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ai_results_id_seq OWNED BY public.ai_results.id;


--
-- Name: domains; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.domains (
    id integer NOT NULL,
    url_id integer NOT NULL,
    domain_name character varying(255) NOT NULL,
    reputation character varying(100),
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.domains OWNER TO postgres;

--
-- Name: domains_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.domains_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.domains_id_seq OWNER TO postgres;

--
-- Name: domains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.domains_id_seq OWNED BY public.domains.id;


--
-- Name: email_headers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.email_headers (
    id integer NOT NULL,
    email_id integer NOT NULL,
    header_name character varying(255) NOT NULL,
    header_value text
);


ALTER TABLE public.email_headers OWNER TO postgres;

--
-- Name: email_headers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.email_headers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.email_headers_id_seq OWNER TO postgres;

--
-- Name: email_headers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.email_headers_id_seq OWNED BY public.email_headers.id;


--
-- Name: emails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emails (
    id integer NOT NULL,
    sender character varying(255) NOT NULL,
    recipient character varying(255) NOT NULL,
    subject character varying(500),
    body text,
    threat_level character varying(50),
    created_at timestamp with time zone DEFAULT now(),
    investigation_id integer
);


ALTER TABLE public.emails OWNER TO postgres;

--
-- Name: emails_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.emails_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.emails_id_seq OWNER TO postgres;

--
-- Name: emails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.emails_id_seq OWNED BY public.emails.id;


--
-- Name: evidence; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.evidence (
    id integer NOT NULL,
    investigation_id integer NOT NULL,
    evidence_type character varying(100) NOT NULL,
    description text,
    file_path character varying(500),
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.evidence OWNER TO postgres;

--
-- Name: evidence_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.evidence_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.evidence_id_seq OWNER TO postgres;

--
-- Name: evidence_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.evidence_id_seq OWNED BY public.evidence.id;


--
-- Name: investigations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.investigations (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    status character varying(50),
    user_id integer,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.investigations OWNER TO postgres;

--
-- Name: investigations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.investigations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.investigations_id_seq OWNER TO postgres;

--
-- Name: investigations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.investigations_id_seq OWNED BY public.investigations.id;


--
-- Name: ip_addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ip_addresses (
    id integer NOT NULL,
    email_id integer,
    ip_address character varying(50) NOT NULL,
    country character varying(100),
    city character varying(100),
    reputation character varying(100),
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.ip_addresses OWNER TO postgres;

--
-- Name: ip_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ip_addresses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ip_addresses_id_seq OWNER TO postgres;

--
-- Name: ip_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ip_addresses_id_seq OWNED BY public.ip_addresses.id;


--
-- Name: osint_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.osint_data (
    id integer NOT NULL,
    investigation_id integer NOT NULL,
    source character varying(255) NOT NULL,
    data text,
    collected_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.osint_data OWNER TO postgres;

--
-- Name: osint_data_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.osint_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.osint_data_id_seq OWNER TO postgres;

--
-- Name: osint_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.osint_data_id_seq OWNED BY public.osint_data.id;


--
-- Name: reports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reports (
    id integer NOT NULL,
    investigation_id integer NOT NULL,
    title character varying(255) NOT NULL,
    summary text,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.reports OWNER TO postgres;

--
-- Name: reports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reports_id_seq OWNER TO postgres;

--
-- Name: reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reports_id_seq OWNED BY public.reports.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    email_id integer NOT NULL,
    url text NOT NULL,
    risk_level character varying(50),
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.urls OWNER TO postgres;

--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.urls_id_seq OWNER TO postgres;

--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(255) NOT NULL,
    password_hash character varying(255),
    role character varying(50),
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: ai_results id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_results ALTER COLUMN id SET DEFAULT nextval('public.ai_results_id_seq'::regclass);


--
-- Name: domains id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.domains ALTER COLUMN id SET DEFAULT nextval('public.domains_id_seq'::regclass);


--
-- Name: email_headers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_headers ALTER COLUMN id SET DEFAULT nextval('public.email_headers_id_seq'::regclass);


--
-- Name: emails id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emails ALTER COLUMN id SET DEFAULT nextval('public.emails_id_seq'::regclass);


--
-- Name: evidence id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evidence ALTER COLUMN id SET DEFAULT nextval('public.evidence_id_seq'::regclass);


--
-- Name: investigations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investigations ALTER COLUMN id SET DEFAULT nextval('public.investigations_id_seq'::regclass);


--
-- Name: ip_addresses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ip_addresses ALTER COLUMN id SET DEFAULT nextval('public.ip_addresses_id_seq'::regclass);


--
-- Name: osint_data id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.osint_data ALTER COLUMN id SET DEFAULT nextval('public.osint_data_id_seq'::regclass);


--
-- Name: reports id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports ALTER COLUMN id SET DEFAULT nextval('public.reports_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ai_results; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ai_results (id, email_id, prediction, confidence_score, explanation, created_at) FROM stdin;
1	6	phishing	0.95	The email contains urgent language and requests account verification.	2026-09-03 16:38:23.021028+05:30
\.


--
-- Data for Name: domains; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.domains (id, url_id, domain_name, reputation, created_at) FROM stdin;
1	1	suspicious-example.com	suspicious	2026-09-03 16:29:03.69762+05:30
\.


--
-- Data for Name: email_headers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.email_headers (id, email_id, header_name, header_value) FROM stdin;
1	6	From	security@unknown.com
2	6	To	user@example.com
\.


--
-- Data for Name: emails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.emails (id, sender, recipient, subject, body, threat_level, created_at, investigation_id) FROM stdin;
1	test@example.com	user@example.com	Test Email	This is a test email.	safe	2026-08-30 15:16:40.416013+05:30	\N
2	security@unknown.com	user@example.com	URGENT! Verify your account immediately	Click here immediately to verify your password or your account will be suspended.	high risk	2026-08-30 15:27:26.080056+05:30	\N
3	friend@example.com	user@example.com	Hello	Hi, how are you? Let's meet tomorrow.	safe	2026-08-30 15:39:24.383493+05:30	\N
4	security@unknown.com	user@example.com	URGENT! Verify your account immediately	Click here immediately to verify your password or your account will be suspended.	critical risk	2026-08-30 15:40:30.746826+05:30	\N
5	security@unknown.com	user@example.com	URGENT! Verify your account immediately	Click here immediately to verify your password or your account will be suspended.	critical risk	2026-09-03 12:32:13.895826+05:30	\N
6	security@unknown.com	user@example.com	URGENT! Verify your account immediately	Click here immediately to verify your password or your account will be suspended.	critical risk	2026-09-03 16:13:19.898912+05:30	1
\.


--
-- Data for Name: evidence; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.evidence (id, investigation_id, evidence_type, description, file_path, created_at) FROM stdin;
1	1	Suspicious URL	URL found in the suspicious email and marked as high risk.	\N	2026-09-03 16:40:32.479458+05:30
\.


--
-- Data for Name: investigations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.investigations (id, title, description, status, user_id, created_at) FROM stdin;
1	Suspicious Email Investigation	Investigation of a suspicious email detected by the threat platform.	open	1	2026-09-03 16:03:13.333055+05:30
\.


--
-- Data for Name: ip_addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ip_addresses (id, email_id, ip_address, country, city, reputation, created_at) FROM stdin;
1	6	192.168.1.100	India	Delhi	suspicious	2026-09-03 16:33:46.327298+05:30
\.


--
-- Data for Name: osint_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.osint_data (id, investigation_id, source, data, collected_at) FROM stdin;
1	1	VirusTotal	Domain reputation check: suspicious	2026-09-03 16:36:34.500296+05:30
\.


--
-- Data for Name: reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reports (id, investigation_id, title, summary, created_at) FROM stdin;
1	1	Suspicious Email Investigation Report	The investigation found a suspicious email containing a high-risk URL and phishing indicators.	2026-09-03 16:42:27.496012+05:30
\.


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.urls (id, email_id, url, risk_level, created_at) FROM stdin;
1	6	http://suspicious-example.com/login	high risk	2026-09-03 16:25:41.65463+05:30
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password_hash, role, created_at) FROM stdin;
1	Test Analyst	analyst@example.com	\N	analyst	2026-09-03 16:00:53.932612+05:30
\.


--
-- Name: ai_results_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ai_results_id_seq', 1, true);


--
-- Name: domains_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.domains_id_seq', 1, true);


--
-- Name: email_headers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.email_headers_id_seq', 2, true);


--
-- Name: emails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.emails_id_seq', 6, true);


--
-- Name: evidence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.evidence_id_seq', 1, true);


--
-- Name: investigations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.investigations_id_seq', 1, true);


--
-- Name: ip_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ip_addresses_id_seq', 1, true);


--
-- Name: osint_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.osint_data_id_seq', 1, true);


--
-- Name: reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reports_id_seq', 1, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.urls_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: ai_results ai_results_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_results
    ADD CONSTRAINT ai_results_pkey PRIMARY KEY (id);


--
-- Name: domains domains_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.domains
    ADD CONSTRAINT domains_pkey PRIMARY KEY (id);


--
-- Name: email_headers email_headers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_headers
    ADD CONSTRAINT email_headers_pkey PRIMARY KEY (id);


--
-- Name: emails emails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emails
    ADD CONSTRAINT emails_pkey PRIMARY KEY (id);


--
-- Name: evidence evidence_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evidence
    ADD CONSTRAINT evidence_pkey PRIMARY KEY (id);


--
-- Name: investigations investigations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investigations
    ADD CONSTRAINT investigations_pkey PRIMARY KEY (id);


--
-- Name: ip_addresses ip_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ip_addresses
    ADD CONSTRAINT ip_addresses_pkey PRIMARY KEY (id);


--
-- Name: osint_data osint_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.osint_data
    ADD CONSTRAINT osint_data_pkey PRIMARY KEY (id);


--
-- Name: reports reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_pkey PRIMARY KEY (id);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: ix_ai_results_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_ai_results_id ON public.ai_results USING btree (id);


--
-- Name: ix_domains_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_domains_id ON public.domains USING btree (id);


--
-- Name: ix_email_headers_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_email_headers_id ON public.email_headers USING btree (id);


--
-- Name: ix_emails_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_emails_id ON public.emails USING btree (id);


--
-- Name: ix_evidence_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_evidence_id ON public.evidence USING btree (id);


--
-- Name: ix_investigations_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_investigations_id ON public.investigations USING btree (id);


--
-- Name: ix_ip_addresses_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_ip_addresses_id ON public.ip_addresses USING btree (id);


--
-- Name: ix_osint_data_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_osint_data_id ON public.osint_data USING btree (id);


--
-- Name: ix_reports_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_reports_id ON public.reports USING btree (id);


--
-- Name: ix_urls_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_urls_id ON public.urls USING btree (id);


--
-- Name: ix_users_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_users_id ON public.users USING btree (id);


--
-- Name: ai_results ai_results_email_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ai_results
    ADD CONSTRAINT ai_results_email_id_fkey FOREIGN KEY (email_id) REFERENCES public.emails(id);


--
-- Name: domains domains_url_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.domains
    ADD CONSTRAINT domains_url_id_fkey FOREIGN KEY (url_id) REFERENCES public.urls(id);


--
-- Name: email_headers email_headers_email_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_headers
    ADD CONSTRAINT email_headers_email_id_fkey FOREIGN KEY (email_id) REFERENCES public.emails(id);


--
-- Name: emails emails_investigation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emails
    ADD CONSTRAINT emails_investigation_id_fkey FOREIGN KEY (investigation_id) REFERENCES public.investigations(id);


--
-- Name: evidence evidence_investigation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evidence
    ADD CONSTRAINT evidence_investigation_id_fkey FOREIGN KEY (investigation_id) REFERENCES public.investigations(id);


--
-- Name: investigations investigations_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investigations
    ADD CONSTRAINT investigations_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: ip_addresses ip_addresses_email_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ip_addresses
    ADD CONSTRAINT ip_addresses_email_id_fkey FOREIGN KEY (email_id) REFERENCES public.emails(id);


--
-- Name: osint_data osint_data_investigation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.osint_data
    ADD CONSTRAINT osint_data_investigation_id_fkey FOREIGN KEY (investigation_id) REFERENCES public.investigations(id);


--
-- Name: reports reports_investigation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_investigation_id_fkey FOREIGN KEY (investigation_id) REFERENCES public.investigations(id);


--
-- Name: urls urls_email_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_email_id_fkey FOREIGN KEY (email_id) REFERENCES public.emails(id);


--
-- PostgreSQL database dump complete
--

\unrestrict behobIbsJbP3zvoWmwx5k2goexnIlFKOv6vVE83g3QU6wKM3yGZdSfwxur3Ccpe

