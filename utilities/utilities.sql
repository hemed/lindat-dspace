--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: license_definition; Type: TABLE; Schema: public; Owner: dspace; Tablespace: 
--

CREATE TABLE license_definition (
    license_id integer NOT NULL,
    name character varying(256) NOT NULL,
    definition character varying(256) NOT NULL,
    eperson_id integer NOT NULL,
    label_id integer NOT NULL,
    created_on timestamp without time zone DEFAULT now() NOT NULL,
    confirmation integer DEFAULT 0 NOT NULL,
    required_info character varying(64)
);


ALTER TABLE public.license_definition OWNER TO dspace;

--
-- Name: license_definition_license_id_seq; Type: SEQUENCE; Schema: public; Owner: dspace
--

CREATE SEQUENCE license_definition_license_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.license_definition_license_id_seq OWNER TO dspace;

--
-- Name: license_definition_license_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dspace
--

ALTER SEQUENCE license_definition_license_id_seq OWNED BY license_definition.license_id;


--
-- Name: license_definition_license_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('license_definition_license_id_seq', 32, true);


--
-- Name: license_file_download_statistic; Type: TABLE; Schema: public; Owner: dspace; Tablespace: 
--

CREATE TABLE license_file_download_statistic (
    transaction_id integer NOT NULL,
    eperson_id integer NOT NULL,
    bitstream_id integer NOT NULL,
    created_on timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.license_file_download_statistic OWNER TO dspace;

--
-- Name: license_file_download_statistic_transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: dspace
--

CREATE SEQUENCE license_file_download_statistic_transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.license_file_download_statistic_transaction_id_seq OWNER TO dspace;

--
-- Name: license_file_download_statistic_transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dspace
--

ALTER SEQUENCE license_file_download_statistic_transaction_id_seq OWNED BY license_file_download_statistic.transaction_id;


--
-- Name: license_file_download_statistic_transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('license_file_download_statistic_transaction_id_seq', 55132, true);


--
-- Name: license_label; Type: TABLE; Schema: public; Owner: dspace; Tablespace: 
--

CREATE TABLE license_label (
    label_id integer NOT NULL,
    label character varying(5) NOT NULL,
    title character varying(180) DEFAULT NULL::character varying,
    is_extended boolean DEFAULT false
);


ALTER TABLE public.license_label OWNER TO dspace;

--
-- Name: license_label_extended_mapping; Type: TABLE; Schema: public; Owner: dspace; Tablespace: 
--

CREATE TABLE license_label_extended_mapping (
    mapping_id integer NOT NULL,
    license_id integer NOT NULL,
    label_id integer NOT NULL
);


ALTER TABLE public.license_label_extended_mapping OWNER TO dspace;

--
-- Name: license_label_extended_mapping_mapping_id_seq; Type: SEQUENCE; Schema: public; Owner: dspace
--

CREATE SEQUENCE license_label_extended_mapping_mapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.license_label_extended_mapping_mapping_id_seq OWNER TO dspace;

--
-- Name: license_label_extended_mapping_mapping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dspace
--

ALTER SEQUENCE license_label_extended_mapping_mapping_id_seq OWNED BY license_label_extended_mapping.mapping_id;


--
-- Name: license_label_extended_mapping_mapping_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('license_label_extended_mapping_mapping_id_seq', 991137, true);


--
-- Name: license_label_label_id_seq; Type: SEQUENCE; Schema: public; Owner: dspace
--

CREATE SEQUENCE license_label_label_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.license_label_label_id_seq OWNER TO dspace;

--
-- Name: license_label_label_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dspace
--

ALTER SEQUENCE license_label_label_id_seq OWNED BY license_label.label_id;


--
-- Name: license_label_label_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('license_label_label_id_seq', 19, true);


--
-- Name: license_resource_mapping; Type: TABLE; Schema: public; Owner: dspace; Tablespace: 
--

CREATE TABLE license_resource_mapping (
    mapping_id integer NOT NULL,
    bitstream_id integer NOT NULL,
    license_id integer NOT NULL,
    active boolean DEFAULT true NOT NULL
);


ALTER TABLE public.license_resource_mapping OWNER TO dspace;

--
-- Name: license_resource_mapping_mapping_id_seq; Type: SEQUENCE; Schema: public; Owner: dspace
--

CREATE SEQUENCE license_resource_mapping_mapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.license_resource_mapping_mapping_id_seq OWNER TO dspace;

--
-- Name: license_resource_mapping_mapping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dspace
--

ALTER SEQUENCE license_resource_mapping_mapping_id_seq OWNED BY license_resource_mapping.mapping_id;


--
-- Name: license_resource_mapping_mapping_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('license_resource_mapping_mapping_id_seq', 1382, true);


--
-- Name: license_resource_user_allowance; Type: TABLE; Schema: public; Owner: dspace; Tablespace: 
--

CREATE TABLE license_resource_user_allowance (
    transaction_id integer NOT NULL,
    eperson_id integer NOT NULL,
    mapping_id integer NOT NULL,
    created_on timestamp without time zone DEFAULT now() NOT NULL,
    token character(32)
);


ALTER TABLE public.license_resource_user_allowance OWNER TO dspace;

--
-- Name: license_resource_user_allowance_transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: dspace
--

CREATE SEQUENCE license_resource_user_allowance_transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.license_resource_user_allowance_transaction_id_seq OWNER TO dspace;

--
-- Name: license_resource_user_allowance_transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dspace
--

ALTER SEQUENCE license_resource_user_allowance_transaction_id_seq OWNED BY license_resource_user_allowance.transaction_id;


--
-- Name: license_resource_user_allowance_transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('license_resource_user_allowance_transaction_id_seq', 241, true);


--
-- Name: organization; Type: TABLE; Schema: public; Owner: dspace; Tablespace: 
--

CREATE TABLE organization (
    organization_id integer NOT NULL,
    name character varying(256) NOT NULL
);


ALTER TABLE public.organization OWNER TO dspace;

--
-- Name: organization_organization_id_seq_1; Type: SEQUENCE; Schema: public; Owner: dspace
--

CREATE SEQUENCE organization_organization_id_seq_1
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.organization_organization_id_seq_1 OWNER TO dspace;

--
-- Name: organization_organization_id_seq_1; Type: SEQUENCE OWNED BY; Schema: public; Owner: dspace
--

ALTER SEQUENCE organization_organization_id_seq_1 OWNED BY organization.organization_id;


--
-- Name: organization_organization_id_seq_1; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('organization_organization_id_seq_1', 1, false);


--
-- Name: piwik_report; Type: TABLE; Schema: public; Owner: dspace; Tablespace: 
--

CREATE TABLE piwik_report (
    report_id integer NOT NULL,
    eperson_id integer NOT NULL,
    item_id integer NOT NULL
);


ALTER TABLE public.piwik_report OWNER TO dspace;

--
-- Name: piwik_report_report_id_seq; Type: SEQUENCE; Schema: public; Owner: dspace
--

CREATE SEQUENCE piwik_report_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.piwik_report_report_id_seq OWNER TO dspace;

--
-- Name: piwik_report_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dspace
--

ALTER SEQUENCE piwik_report_report_id_seq OWNED BY piwik_report.report_id;


--
-- Name: piwik_report_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('piwik_report_report_id_seq', 18, true);


--
-- Name: shibboleth_attribute_mapping; Type: TABLE; Schema: public; Owner: dspace; Tablespace: 
--

CREATE TABLE shibboleth_attribute_mapping (
    mapping_id integer NOT NULL,
    organization_id integer NOT NULL,
    source_name character varying NOT NULL,
    target_name character varying NOT NULL
);


ALTER TABLE public.shibboleth_attribute_mapping OWNER TO dspace;

--
-- Name: shibboleth_attribute_mapping_mapping_id_seq; Type: SEQUENCE; Schema: public; Owner: dspace
--

CREATE SEQUENCE shibboleth_attribute_mapping_mapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.shibboleth_attribute_mapping_mapping_id_seq OWNER TO dspace;

--
-- Name: shibboleth_attribute_mapping_mapping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dspace
--

ALTER SEQUENCE shibboleth_attribute_mapping_mapping_id_seq OWNED BY shibboleth_attribute_mapping.mapping_id;


--
-- Name: shibboleth_attribute_mapping_mapping_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('shibboleth_attribute_mapping_mapping_id_seq', 1, true);


--
-- Name: user_metadata; Type: TABLE; Schema: public; Owner: dspace; Tablespace: 
--

CREATE TABLE user_metadata (
    user_metadata_id integer NOT NULL,
    eperson_id integer NOT NULL,
    metadata_key character varying(64) NOT NULL,
    metadata_value character varying(256) NOT NULL,
    transaction_id integer
);


ALTER TABLE public.user_metadata OWNER TO dspace;

--
-- Name: user_metadata_user_metadata_id_seq; Type: SEQUENCE; Schema: public; Owner: dspace
--

CREATE SEQUENCE user_metadata_user_metadata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.user_metadata_user_metadata_id_seq OWNER TO dspace;

--
-- Name: user_metadata_user_metadata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dspace
--

ALTER SEQUENCE user_metadata_user_metadata_id_seq OWNED BY user_metadata.user_metadata_id;


--
-- Name: user_metadata_user_metadata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dspace
--

SELECT pg_catalog.setval('user_metadata_user_metadata_id_seq', 68, true);


--
-- Name: user_registration; Type: TABLE; Schema: public; Owner: dspace; Tablespace: 
--

CREATE TABLE user_registration (
    eperson_id integer NOT NULL,
    email character varying(256) NOT NULL,
    organization character varying(256) NOT NULL,
    confirmation boolean DEFAULT true NOT NULL
);


ALTER TABLE public.user_registration OWNER TO dspace;

--
-- Name: verification_token; Type: TABLE; Schema: public; Owner: dspace; Tablespace: 
--

CREATE TABLE verification_token (
    eperson_id integer NOT NULL,
    token character varying(48) NOT NULL,
    email character varying(64) NOT NULL
);


ALTER TABLE public.verification_token OWNER TO dspace;

--
-- Name: license_id; Type: DEFAULT; Schema: public; Owner: dspace
--

ALTER TABLE ONLY license_definition ALTER COLUMN license_id SET DEFAULT nextval('license_definition_license_id_seq'::regclass);


--
-- Name: transaction_id; Type: DEFAULT; Schema: public; Owner: dspace
--

ALTER TABLE ONLY license_file_download_statistic ALTER COLUMN transaction_id SET DEFAULT nextval('license_file_download_statistic_transaction_id_seq'::regclass);


--
-- Name: label_id; Type: DEFAULT; Schema: public; Owner: dspace
--

ALTER TABLE ONLY license_label ALTER COLUMN label_id SET DEFAULT nextval('license_label_label_id_seq'::regclass);


--
-- Name: mapping_id; Type: DEFAULT; Schema: public; Owner: dspace
--

ALTER TABLE ONLY license_label_extended_mapping ALTER COLUMN mapping_id SET DEFAULT nextval('license_label_extended_mapping_mapping_id_seq'::regclass);


--
-- Name: mapping_id; Type: DEFAULT; Schema: public; Owner: dspace
--

ALTER TABLE ONLY license_resource_mapping ALTER COLUMN mapping_id SET DEFAULT nextval('license_resource_mapping_mapping_id_seq'::regclass);


--
-- Name: transaction_id; Type: DEFAULT; Schema: public; Owner: dspace
--

ALTER TABLE ONLY license_resource_user_allowance ALTER COLUMN transaction_id SET DEFAULT nextval('license_resource_user_allowance_transaction_id_seq'::regclass);


--
-- Name: organization_id; Type: DEFAULT; Schema: public; Owner: dspace
--

ALTER TABLE ONLY organization ALTER COLUMN organization_id SET DEFAULT nextval('organization_organization_id_seq_1'::regclass);


--
-- Name: report_id; Type: DEFAULT; Schema: public; Owner: dspace
--

ALTER TABLE ONLY piwik_report ALTER COLUMN report_id SET DEFAULT nextval('piwik_report_report_id_seq'::regclass);


--
-- Name: mapping_id; Type: DEFAULT; Schema: public; Owner: dspace
--

ALTER TABLE ONLY shibboleth_attribute_mapping ALTER COLUMN mapping_id SET DEFAULT nextval('shibboleth_attribute_mapping_mapping_id_seq'::regclass);


--
-- Name: user_metadata_id; Type: DEFAULT; Schema: public; Owner: dspace
--

ALTER TABLE ONLY user_metadata ALTER COLUMN user_metadata_id SET DEFAULT nextval('user_metadata_user_metadata_id_seq'::regclass);

--
-- Data for Name: user_registration; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY user_registration (eperson_id, email, organization, confirmation) FROM stdin;
0	anonymous	anonymous	t
1	administrator	administrator	t
\.

--
-- Data for Name: license_definition; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY license_definition (license_id, name, definition, eperson_id, label_id, created_on, confirmation, required_info) FROM stdin;
16	GNU General Public Licence, version 3	http://opensource.org/licenses/GPL-3.0	1	1	2013-02-27 18:54:59.103704	0	\N
3	GNU General Public License, version 2	http://www.gnu.org/licenses/gpl-2.0.html	1	1	2012-09-27 05:39:47.271105	0	\N
11	The MIT License (MIT)	http://opensource.org/licenses/mit-license.php	1	1	2012-09-27 05:50:45.861588	0	\N
18	Artistic License 2.0	http://opensource.org/licenses/Artistic-2.0	1	1	2013-02-27 19:05:28.923843	0	\N
17	Artistic License (Perl) 1.0	http://opensource.org/licenses/Artistic-Perl-1.0	1	1	2013-02-27 19:03:46.95784	0	\N
4	Attribution-NonCommercial-NoDerivs 3.0 Unported (CC BY-NC-ND 3.0)	http://creativecommons.org/licenses/by-nc-nd/3.0/	1	1	2011-12-14 21:32:21.586806	0	\N
15	BSD 2-Clause "Simplified" or "FreeBSD" license	http://opensource.org/licenses/BSD-2-Clause	1	1	2013-02-01 15:07:52.605509	0	\N
14	BSD 3-Clause "New" or "Revised" license	http://opensource.org/licenses/BSD-3-Clause	1	1	2013-02-01 15:06:57.567966	0	\N
1	Attribution-NonCommercial 3.0 Unported (CC BY-NC 3.0)	http://creativecommons.org/licenses/by-nc/3.0/	1	1	2011-12-14 21:29:38.719044	0	\N
2	Attribution-NonCommercial-ShareAlike 3.0 Unported (CC BY-NC-SA 3.0)	http://creativecommons.org/licenses/by-nc-sa/3.0/	1	1	2011-12-14 21:30:29.776313	0	\N
5	Attribution-NoDerivs 3.0 Unported (CC BY-ND 3.0)	http://creativecommons.org/licenses/by-nd/3.0/	1	1	2011-12-14 21:32:39.21528	0	\N
6	Attribution-ShareAlike 3.0 Unported (CC BY-SA 3.0)	http://creativecommons.org/licenses/by-sa/3.0/	1	1	2011-12-14 21:33:12.100304	0	\N
8	Creative Commons - Attribution 3.0 Unported (CC BY 3.0)	http://creativecommons.org/licenses/by/3.0/	1	1	2011-12-14 23:05:10.936108	0	\N
22	PDTSL	https://lindat.mff.cuni.cz/repository/xmlui/page/licence-pdtsl	1	3	2014-04-08 00:33:18.849529	2	SEND_TOKEN, NAME, ADDRESS, COUNTRY, EXTRA_EMAIL
23	HamleDT 1.0  Licence Agreement	https://lindat.mff.cuni.cz/repository/xmlui/page/licence-hamledt	1	3	2014-04-14 10:23:38.307371	2	SEND_TOKEN, NAME, ADDRESS, COUNTRY, EXTRA_EMAIL
27	HamleDT 2.0 Licence Agreement	https://lindat.mff.cuni.cz/repository/xmlui/page/licence-hamledt-2.0	1	2	2014-05-26 14:22:30.637637	0	\N
21	Czech National Corpus (Shuffled Corpus Data)	https://lindat.mff.cuni.cz/repository/xmlui/page/license-cnc	1	2	2013-12-13 14:37:19.412474	1	\N
19	CC-BY-NC-SA + LDC99T42	https://lindat.mff.cuni.cz/repository/xmlui/page/license-pcedt2	1	3	2013-03-28 14:56:42.948628	1	\N
7	PDT 2.0 License	https://lindat.mff.cuni.cz/repository/xmlui/page/license-pdt2	1	2	2011-12-14 21:38:22.407755	1	\N
12	CC0-No Rights Reserved	http://creativecommons.org/publicdomain/zero/1.0/	1	1	2012-10-01 17:16:47.863708	0	\N
20	Apache License 2.0	http://opensource.org/licenses/Apache-2.0	1	1	2013-08-13 18:04:21.606801	0	\N
\.


--
-- Data for Name: license_label; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY license_label (label_id, label, title, is_extended) FROM stdin;
1	PUB	Publicly Available	f
2	ACA	Academic Use	f
3	RES	Restricted Use	f
5	BY	Attribution Required	t
6	SA	Share Alike	t
7	NC	Noncommercial	t
10	ReD	Redeposit Modified	t
8	ND	No Derivative Works	t
9	Inf	Inform Before Use	t
4	CC	Distributed under Creative Commons	t
11	ZERO	No Copyright	t
12	GPLv3	GNU General Public License, version 3.0	t
13	GPLv2	GNU General Public License, version 2.0	t
14	BSD	BSD	t
15	MIT	The MIT License	t
18	OSI	The Open Source Initiative 	t
\.


--
-- Data for Name: organization; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY organization (organization_id, name) FROM stdin;
1	https://cas.cuni.cz/idp/shibboleth
2	https://idp2.ics.muni.cz/idp/shibboleth
3	https://shib.zcu.cz/idp/shibboleth
0	default
\.


--
-- Data for Name: shibboleth_attribute_mapping; Type: TABLE DATA; Schema: public; Owner: dspace
--

COPY shibboleth_attribute_mapping (mapping_id, organization_id, source_name, target_name) FROM stdin;
1	1	user_id	mail
2	1	shibboleth_user_id	persistent-id
3	1	user_fname	givenName
4	1	user_lname	sn
5	2	user_id	eppn
6	2	shibboleth_user_id	eppn
7	2	user_lname	cn
8	3	user_id	mail
9	3	shibboleth_user_id	eppn
10	3	user_fname	givenName
11	3	user_lname	sn
12	0	user_id	mail
13	0	shibboleth_user_id	eppn
14	0	user_fname	givenName
15	0	user_lname	sn
\.


--
-- Name: license_definition_pkey; Type: CONSTRAINT; Schema: public; Owner: dspace; Tablespace: 
--

ALTER TABLE ONLY license_definition
    ADD CONSTRAINT license_definition_pkey PRIMARY KEY (license_id);


--
-- Name: license_file_download_statistic_pkey; Type: CONSTRAINT; Schema: public; Owner: dspace; Tablespace: 
--

ALTER TABLE ONLY license_file_download_statistic
    ADD CONSTRAINT license_file_download_statistic_pkey PRIMARY KEY (transaction_id);


--
-- Name: license_label_extended_mapping_pkey; Type: CONSTRAINT; Schema: public; Owner: dspace; Tablespace: 
--

ALTER TABLE ONLY license_label_extended_mapping
    ADD CONSTRAINT license_label_extended_mapping_pkey PRIMARY KEY (mapping_id);


--
-- Name: license_label_pkey; Type: CONSTRAINT; Schema: public; Owner: dspace; Tablespace: 
--

ALTER TABLE ONLY license_label
    ADD CONSTRAINT license_label_pkey PRIMARY KEY (label_id);


--
-- Name: license_resource_mapping_pkey; Type: CONSTRAINT; Schema: public; Owner: dspace; Tablespace: 
--

ALTER TABLE ONLY license_resource_mapping
    ADD CONSTRAINT license_resource_mapping_pkey PRIMARY KEY (mapping_id);


--
-- Name: license_resource_user_allowance_pkey; Type: CONSTRAINT; Schema: public; Owner: dspace; Tablespace: 
--

ALTER TABLE ONLY license_resource_user_allowance
    ADD CONSTRAINT license_resource_user_allowance_pkey PRIMARY KEY (transaction_id);


--
-- Name: organization_id; Type: CONSTRAINT; Schema: public; Owner: dspace; Tablespace: 
--

ALTER TABLE ONLY organization
    ADD CONSTRAINT organization_id PRIMARY KEY (organization_id);


--
-- Name: piwik_report_pkey; Type: CONSTRAINT; Schema: public; Owner: dspace; Tablespace: 
--

ALTER TABLE ONLY piwik_report
    ADD CONSTRAINT piwik_report_pkey PRIMARY KEY (report_id);


--
-- Name: shibboleth_attribute_mapping_pkey; Type: CONSTRAINT; Schema: public; Owner: dspace; Tablespace: 
--

ALTER TABLE ONLY shibboleth_attribute_mapping
    ADD CONSTRAINT shibboleth_attribute_mapping_pkey PRIMARY KEY (mapping_id);


--
-- Name: user_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: dspace; Tablespace: 
--

ALTER TABLE ONLY user_metadata
    ADD CONSTRAINT user_metadata_pkey PRIMARY KEY (user_metadata_id);


--
-- Name: user_registration_pkey; Type: CONSTRAINT; Schema: public; Owner: dspace; Tablespace: 
--

ALTER TABLE ONLY user_registration
    ADD CONSTRAINT user_registration_pkey PRIMARY KEY (eperson_id);


--
-- Name: verification_token_email_key; Type: CONSTRAINT; Schema: public; Owner: dspace; Tablespace: 
--

ALTER TABLE ONLY verification_token
    ADD CONSTRAINT verification_token_email_key UNIQUE (email);


--
-- Name: verification_token_eperson_id_key; Type: CONSTRAINT; Schema: public; Owner: dspace; Tablespace: 
--

ALTER TABLE ONLY verification_token
    ADD CONSTRAINT verification_token_eperson_id_key UNIQUE (eperson_id);


--
-- Name: verification_token_pkey; Type: CONSTRAINT; Schema: public; Owner: dspace; Tablespace: 
--

ALTER TABLE ONLY verification_token
    ADD CONSTRAINT verification_token_pkey PRIMARY KEY (token);


--
-- Name: license_definition_license_id_key; Type: INDEX; Schema: public; Owner: dspace; Tablespace: 
--

CREATE UNIQUE INDEX license_definition_license_id_key ON license_definition USING btree (name);


--
-- Name: piwik_report_eperson_id_item_id_key; Type: INDEX; Schema: public; Owner: dspace; Tablespace: 
--

CREATE UNIQUE INDEX piwik_report_eperson_id_item_id_key ON piwik_report USING btree (eperson_id, item_id);


--
-- Name: license_definition_license_label_extended_mapping_fk; Type: FK CONSTRAINT; Schema: public; Owner: dspace
--

ALTER TABLE ONLY license_label_extended_mapping
    ADD CONSTRAINT license_definition_license_label_extended_mapping_fk FOREIGN KEY (license_id) REFERENCES license_definition(license_id) ON DELETE CASCADE;


--
-- Name: license_definition_license_resource_mapping_fk; Type: FK CONSTRAINT; Schema: public; Owner: dspace
--

ALTER TABLE ONLY license_resource_mapping
    ADD CONSTRAINT license_definition_license_resource_mapping_fk FOREIGN KEY (license_id) REFERENCES license_definition(license_id) ON DELETE CASCADE;


--
-- Name: license_label_license_definition_fk; Type: FK CONSTRAINT; Schema: public; Owner: dspace
--

ALTER TABLE ONLY license_definition
    ADD CONSTRAINT license_label_license_definition_fk FOREIGN KEY (label_id) REFERENCES license_label(label_id);


--
-- Name: license_label_license_label_extended_mapping_fk; Type: FK CONSTRAINT; Schema: public; Owner: dspace
--

ALTER TABLE ONLY license_label_extended_mapping
    ADD CONSTRAINT license_label_license_label_extended_mapping_fk FOREIGN KEY (label_id) REFERENCES license_label(label_id) ON DELETE CASCADE;


--
-- Name: license_resource_mapping_license_resource_user_allowance_fk; Type: FK CONSTRAINT; Schema: public; Owner: dspace
--

ALTER TABLE ONLY license_resource_user_allowance
    ADD CONSTRAINT license_resource_mapping_license_resource_user_allowance_fk FOREIGN KEY (mapping_id) REFERENCES license_resource_mapping(mapping_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: license_resource_user_allowance_user_metadata_fk; Type: FK CONSTRAINT; Schema: public; Owner: dspace
--

ALTER TABLE ONLY user_metadata
    ADD CONSTRAINT license_resource_user_allowance_user_metadata_fk FOREIGN KEY (transaction_id) REFERENCES license_resource_user_allowance(transaction_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: organization_shibboleth_attribute_mapping_fk; Type: FK CONSTRAINT; Schema: public; Owner: dspace
--

ALTER TABLE ONLY shibboleth_attribute_mapping
    ADD CONSTRAINT organization_shibboleth_attribute_mapping_fk FOREIGN KEY (organization_id) REFERENCES organization(organization_id);


--
-- Name: user_registration_license_definition_fk; Type: FK CONSTRAINT; Schema: public; Owner: dspace
--

ALTER TABLE ONLY license_definition
    ADD CONSTRAINT user_registration_license_definition_fk FOREIGN KEY (eperson_id) REFERENCES user_registration(eperson_id);


--
-- Name: user_registration_license_file_download_statistic_fk; Type: FK CONSTRAINT; Schema: public; Owner: dspace
--

ALTER TABLE ONLY license_file_download_statistic
    ADD CONSTRAINT user_registration_license_file_download_statistic_fk FOREIGN KEY (eperson_id) REFERENCES user_registration(eperson_id);


--
-- Name: user_registration_license_resource_user_allowance_fk; Type: FK CONSTRAINT; Schema: public; Owner: dspace
--

ALTER TABLE ONLY license_resource_user_allowance
    ADD CONSTRAINT user_registration_license_resource_user_allowance_fk FOREIGN KEY (eperson_id) REFERENCES user_registration(eperson_id);


--
-- Name: user_registration_user_metadata_fk; Type: FK CONSTRAINT; Schema: public; Owner: dspace
--

ALTER TABLE ONLY user_metadata
    ADD CONSTRAINT user_registration_user_metadata_fk FOREIGN KEY (eperson_id) REFERENCES user_registration(eperson_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


