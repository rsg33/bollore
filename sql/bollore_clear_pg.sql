--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0 (Ubuntu 14.0-1.pgdg21.04+1)
-- Dumped by pg_dump version 14.0 (Ubuntu 14.0-1.pgdg21.04+1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: bollore
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO bollore;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: bollore
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO bollore;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bollore
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: bollore
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO bollore;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: bollore
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO bollore;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bollore
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: bollore
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO bollore;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: bollore
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO bollore;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bollore
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: bollore
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO bollore;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: bollore
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO bollore;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: bollore
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO bollore;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bollore
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: bollore
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO bollore;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bollore
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: bollore
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO bollore;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: bollore
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO bollore;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bollore
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: defects_bodies; Type: TABLE; Schema: public; Owner: bollore
--

CREATE TABLE public.defects_bodies (
    id bigint NOT NULL,
    body_number character varying(150) NOT NULL
);


ALTER TABLE public.defects_bodies OWNER TO bollore;

--
-- Name: defects_bodies_id_seq; Type: SEQUENCE; Schema: public; Owner: bollore
--

CREATE SEQUENCE public.defects_bodies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.defects_bodies_id_seq OWNER TO bollore;

--
-- Name: defects_bodies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bollore
--

ALTER SEQUENCE public.defects_bodies_id_seq OWNED BY public.defects_bodies.id;


--
-- Name: defects_comments; Type: TABLE; Schema: public; Owner: bollore
--

CREATE TABLE public.defects_comments (
    id bigint NOT NULL,
    comment text NOT NULL,
    published_at timestamp with time zone NOT NULL,
    author_id integer,
    defect_id bigint NOT NULL
);


ALTER TABLE public.defects_comments OWNER TO bollore;

--
-- Name: defects_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: bollore
--

CREATE SEQUENCE public.defects_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.defects_comments_id_seq OWNER TO bollore;

--
-- Name: defects_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bollore
--

ALTER SEQUENCE public.defects_comments_id_seq OWNED BY public.defects_comments.id;


--
-- Name: defects_defects; Type: TABLE; Schema: public; Owner: bollore
--

CREATE TABLE public.defects_defects (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    date_defect_detection date NOT NULL,
    term_up_to timestamp with time zone NOT NULL,
    number_of_inconsistencies integer NOT NULL,
    discrepancy_description text NOT NULL,
    body_number_id bigint NOT NULL,
    detail_id bigint,
    priority_id bigint NOT NULL,
    quality_controller_id integer,
    responsible_executor_id integer,
    status_id bigint NOT NULL,
    type_of_discrepancy_id bigint NOT NULL,
    workshop_id bigint NOT NULL,
    for_checking boolean NOT NULL
);


ALTER TABLE public.defects_defects OWNER TO bollore;

--
-- Name: defects_defects_id_seq; Type: SEQUENCE; Schema: public; Owner: bollore
--

CREATE SEQUENCE public.defects_defects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.defects_defects_id_seq OWNER TO bollore;

--
-- Name: defects_defects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bollore
--

ALTER SEQUENCE public.defects_defects_id_seq OWNED BY public.defects_defects.id;


--
-- Name: defects_details; Type: TABLE; Schema: public; Owner: bollore
--

CREATE TABLE public.defects_details (
    id bigint NOT NULL,
    article character varying(150),
    name character varying(150) NOT NULL
);


ALTER TABLE public.defects_details OWNER TO bollore;

--
-- Name: defects_details_id_seq; Type: SEQUENCE; Schema: public; Owner: bollore
--

CREATE SEQUENCE public.defects_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.defects_details_id_seq OWNER TO bollore;

--
-- Name: defects_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bollore
--

ALTER SEQUENCE public.defects_details_id_seq OWNED BY public.defects_details.id;


--
-- Name: defects_photodefects; Type: TABLE; Schema: public; Owner: bollore
--

CREATE TABLE public.defects_photodefects (
    id bigint NOT NULL,
    photo character varying(100) NOT NULL,
    uploaded_at timestamp with time zone NOT NULL,
    defect_id bigint NOT NULL
);


ALTER TABLE public.defects_photodefects OWNER TO bollore;

--
-- Name: defects_photodefects_id_seq; Type: SEQUENCE; Schema: public; Owner: bollore
--

CREATE SEQUENCE public.defects_photodefects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.defects_photodefects_id_seq OWNER TO bollore;

--
-- Name: defects_photodefects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bollore
--

ALTER SEQUENCE public.defects_photodefects_id_seq OWNED BY public.defects_photodefects.id;


--
-- Name: defects_priority; Type: TABLE; Schema: public; Owner: bollore
--

CREATE TABLE public.defects_priority (
    id bigint NOT NULL,
    priority_status character varying(150) NOT NULL
);


ALTER TABLE public.defects_priority OWNER TO bollore;

--
-- Name: defects_priority_id_seq; Type: SEQUENCE; Schema: public; Owner: bollore
--

CREATE SEQUENCE public.defects_priority_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.defects_priority_id_seq OWNER TO bollore;

--
-- Name: defects_priority_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bollore
--

ALTER SEQUENCE public.defects_priority_id_seq OWNED BY public.defects_priority.id;


--
-- Name: defects_probabilityestimate; Type: TABLE; Schema: public; Owner: bollore
--

CREATE TABLE public.defects_probabilityestimate (
    id bigint NOT NULL,
    score integer NOT NULL,
    description character varying(150) NOT NULL
);


ALTER TABLE public.defects_probabilityestimate OWNER TO bollore;

--
-- Name: defects_probabilityestimate_id_seq; Type: SEQUENCE; Schema: public; Owner: bollore
--

CREATE SEQUENCE public.defects_probabilityestimate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.defects_probabilityestimate_id_seq OWNER TO bollore;

--
-- Name: defects_probabilityestimate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bollore
--

ALTER SEQUENCE public.defects_probabilityestimate_id_seq OWNED BY public.defects_probabilityestimate.id;


--
-- Name: defects_scaleofconsequences; Type: TABLE; Schema: public; Owner: bollore
--

CREATE TABLE public.defects_scaleofconsequences (
    id bigint NOT NULL,
    score integer NOT NULL,
    description character varying(150) NOT NULL
);


ALTER TABLE public.defects_scaleofconsequences OWNER TO bollore;

--
-- Name: defects_scaleofconsequences_id_seq; Type: SEQUENCE; Schema: public; Owner: bollore
--

CREATE SEQUENCE public.defects_scaleofconsequences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.defects_scaleofconsequences_id_seq OWNER TO bollore;

--
-- Name: defects_scaleofconsequences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bollore
--

ALTER SEQUENCE public.defects_scaleofconsequences_id_seq OWNED BY public.defects_scaleofconsequences.id;


--
-- Name: defects_status; Type: TABLE; Schema: public; Owner: bollore
--

CREATE TABLE public.defects_status (
    id bigint NOT NULL,
    defect_status character varying(150) NOT NULL
);


ALTER TABLE public.defects_status OWNER TO bollore;

--
-- Name: defects_status_id_seq; Type: SEQUENCE; Schema: public; Owner: bollore
--

CREATE SEQUENCE public.defects_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.defects_status_id_seq OWNER TO bollore;

--
-- Name: defects_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bollore
--

ALTER SEQUENCE public.defects_status_id_seq OWNED BY public.defects_status.id;


--
-- Name: defects_typeofmismatch; Type: TABLE; Schema: public; Owner: bollore
--

CREATE TABLE public.defects_typeofmismatch (
    id bigint NOT NULL,
    mismatch character varying(150) NOT NULL,
    probability_estimate_id bigint NOT NULL,
    scale_consequences_id bigint NOT NULL
);


ALTER TABLE public.defects_typeofmismatch OWNER TO bollore;

--
-- Name: defects_typeofmismatch_id_seq; Type: SEQUENCE; Schema: public; Owner: bollore
--

CREATE SEQUENCE public.defects_typeofmismatch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.defects_typeofmismatch_id_seq OWNER TO bollore;

--
-- Name: defects_typeofmismatch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bollore
--

ALTER SEQUENCE public.defects_typeofmismatch_id_seq OWNED BY public.defects_typeofmismatch.id;


--
-- Name: defects_workshops; Type: TABLE; Schema: public; Owner: bollore
--

CREATE TABLE public.defects_workshops (
    id bigint NOT NULL,
    name_workshop character varying(150) NOT NULL,
    responsible_executor_id integer NOT NULL
);


ALTER TABLE public.defects_workshops OWNER TO bollore;

--
-- Name: defects_workshops_id_seq; Type: SEQUENCE; Schema: public; Owner: bollore
--

CREATE SEQUENCE public.defects_workshops_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.defects_workshops_id_seq OWNER TO bollore;

--
-- Name: defects_workshops_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bollore
--

ALTER SEQUENCE public.defects_workshops_id_seq OWNED BY public.defects_workshops.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: bollore
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO bollore;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: bollore
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO bollore;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bollore
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: bollore
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO bollore;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: bollore
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO bollore;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bollore
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: bollore
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO bollore;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: bollore
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO bollore;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bollore
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: bollore
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO bollore;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: defects_bodies id; Type: DEFAULT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_bodies ALTER COLUMN id SET DEFAULT nextval('public.defects_bodies_id_seq'::regclass);


--
-- Name: defects_comments id; Type: DEFAULT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_comments ALTER COLUMN id SET DEFAULT nextval('public.defects_comments_id_seq'::regclass);


--
-- Name: defects_defects id; Type: DEFAULT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_defects ALTER COLUMN id SET DEFAULT nextval('public.defects_defects_id_seq'::regclass);


--
-- Name: defects_details id; Type: DEFAULT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_details ALTER COLUMN id SET DEFAULT nextval('public.defects_details_id_seq'::regclass);


--
-- Name: defects_photodefects id; Type: DEFAULT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_photodefects ALTER COLUMN id SET DEFAULT nextval('public.defects_photodefects_id_seq'::regclass);


--
-- Name: defects_priority id; Type: DEFAULT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_priority ALTER COLUMN id SET DEFAULT nextval('public.defects_priority_id_seq'::regclass);


--
-- Name: defects_probabilityestimate id; Type: DEFAULT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_probabilityestimate ALTER COLUMN id SET DEFAULT nextval('public.defects_probabilityestimate_id_seq'::regclass);


--
-- Name: defects_scaleofconsequences id; Type: DEFAULT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_scaleofconsequences ALTER COLUMN id SET DEFAULT nextval('public.defects_scaleofconsequences_id_seq'::regclass);


--
-- Name: defects_status id; Type: DEFAULT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_status ALTER COLUMN id SET DEFAULT nextval('public.defects_status_id_seq'::regclass);


--
-- Name: defects_typeofmismatch id; Type: DEFAULT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_typeofmismatch ALTER COLUMN id SET DEFAULT nextval('public.defects_typeofmismatch_id_seq'::regclass);


--
-- Name: defects_workshops id; Type: DEFAULT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_workshops ALTER COLUMN id SET DEFAULT nextval('public.defects_workshops_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: bollore
--

COPY public.auth_group (id, name) FROM stdin;
1	Control Inspectors
2	Responsible Executors
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: bollore
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: bollore
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add номер кузова	7	add_bodies
26	Can change номер кузова	7	change_bodies
27	Can delete номер кузова	7	delete_bodies
28	Can view номер кузова	7	view_bodies
29	Can add дефект	8	add_defects
30	Can change дефект	8	change_defects
31	Can delete дефект	8	delete_defects
32	Can view дефект	8	view_defects
33	Can add деталь	9	add_details
34	Can change деталь	9	change_details
35	Can delete деталь	9	delete_details
36	Can view деталь	9	view_details
37	Can add приоритет дефекта	10	add_priority
38	Can change приоритет дефекта	10	change_priority
39	Can delete приоритет дефекта	10	delete_priority
40	Can view приоритет дефекта	10	view_priority
41	Can add оценка вероятности	11	add_probabilityestimate
42	Can change оценка вероятности	11	change_probabilityestimate
43	Can delete оценка вероятности	11	delete_probabilityestimate
44	Can view оценка вероятности	11	view_probabilityestimate
45	Can add масштаб последствий	12	add_scaleofconsequences
46	Can change масштаб последствий	12	change_scaleofconsequences
47	Can delete масштаб последствий	12	delete_scaleofconsequences
48	Can view масштаб последствий	12	view_scaleofconsequences
49	Can add статус дефекта	13	add_status
50	Can change статус дефекта	13	change_status
51	Can delete статус дефекта	13	delete_status
52	Can view статус дефекта	13	view_status
53	Can add цех	14	add_workshops
54	Can change цех	14	change_workshops
55	Can delete цех	14	delete_workshops
56	Can view цех	14	view_workshops
57	Can add тип несоответствия	15	add_typeofmismatch
58	Can change тип несоответствия	15	change_typeofmismatch
59	Can delete тип несоответствия	15	delete_typeofmismatch
60	Can view тип несоответствия	15	view_typeofmismatch
61	Can add фото	16	add_photodefects
62	Can change фото	16	change_photodefects
63	Can delete фото	16	delete_photodefects
64	Can view фото	16	view_photodefects
65	Can add комментарий	17	add_comments
66	Can change комментарий	17	change_comments
67	Can delete комментарий	17	delete_comments
68	Can view комментарий	17	view_comments
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: bollore
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
14	pbkdf2_sha256$260000$W87cBsSZhfC2TCTqmwgy07$o7vkcQN7KiTW4y+kSPXxpEE8/tC+7qWU4BNjddKW8rc=	\N	f	a.zaicev	Андрей	Зайцев	a.zaicev@bakulingroup.ru1	f	t	2021-10-03 13:14:14+03
3	pbkdf2_sha256$260000$CUqd9mnAcxcmpWKYv4yS16$YSbGSuJj1e+sJecRA+EY658fMk5/WHCDcCzbZt6WyAo=	\N	f	a.grigoriev	Андрей	Григорьев	a.grigoriev@bakulingroup.ru	f	t	2021-10-03 13:10:19+03
2	pbkdf2_sha256$260000$p7Zx7ZXcXj9xCxmoOw9x2z$aTxvRbDmyVNRBv9KPxGv02fiDiA/HDjx8aMTEzvy6ok=	\N	f	a.kuzovlev	Александр	Кузовлев	a.kuzovlev@bakulingroup.ru	f	t	2021-10-03 13:09:59+03
6	pbkdf2_sha256$260000$OyKJQdGknNyLhtoSEgX0j5$xdC1PkMkw8pG3DrE22wL1bwVMcBBvRXfzluc+lOB7G4=	\N	f	a.malysheva	Алина	Малышева	a.malysheva@bakulingroup.ru	f	t	2021-10-03 13:11:16+03
7	pbkdf2_sha256$260000$4gleWoEsBKgX1mBKabasem$5IpGgtS1FC6z3Tl4wb5IPNPNHa0AfdoYZsbqSqi93BM=	\N	f	a.shirokov	Александр	Широков	a.shirokov@bakulingroup.ru	f	t	2021-10-03 13:11:30+03
11	pbkdf2_sha256$260000$CZRBi9fh87LRrLAYJgxnX9$dRDR88FDn8DvJqMYESmtw7msBrnKMIoWR2MIQCMjQII=	\N	f	d.bichenok	Дмитрий	Быченок	d.bichenok@bakulingroup.ru1	f	t	2021-10-03 13:13:30+03
10	pbkdf2_sha256$260000$q096RAv27rLBu4358WzAE7$RlbflsnzkwRNlsCoXuxTCCMtmJZcuXWOAdGEK8YT8kg=	\N	f	i.gorshkova	Инна	Горшкова	i.gorshkova@bakulingroup.ru	f	t	2021-10-03 13:13:11+03
12	pbkdf2_sha256$260000$Q5qYSQMIUF1VXjTuWLc2wo$ymDWgZW4oLKJcXTyxkBSe13cAr+qCztnrMpJEeZP7DM=	\N	f	i.kulakova	Ирина	Кулакова	i.kulakova@bakulingroup.ru1	f	t	2021-10-03 13:13:44+03
5	pbkdf2_sha256$260000$lKwQ1JaKZCUIb9SMMXPAJW$uS7/H0hZZNKTlfoBrDdec2TDHEh4FBler02Ey+xUH2o=	\N	f	lsv	Сергей	Лобастов	s.lobastov@bakulingroup.ru	f	t	2021-10-03 13:10:59+03
4	pbkdf2_sha256$260000$D7W6AK15jc2D6BFjADVkvI$cElX7KaNL+pSWxzyfXkqAtDoZFxnKKuqlC7pZp2bE3w=	\N	f	novitskyv	Вадим	Новицкий	novitskyv@bakulingroup.ru	f	t	2021-10-03 13:10:45+03
13	pbkdf2_sha256$260000$wOFgfFPNXkFQPa23Kq6vvI$nosxp+NBD7TvdUJWctpgV/UkzfBiVOvQ8naospwXHeM=	\N	f	s.klachkov	Сергей	Клочков	s.klachkov@bakulingroup.ru1	f	t	2021-10-03 13:14:00+03
8	pbkdf2_sha256$260000$qxUfZ4j0e8WgI0xqW14B7w$CmdbADv5I4B0kpch9ioGzrUqzAVdUodUeZyUBN2vElQ=	\N	f	tnv	Наталья	Тарасова	n.tarasova@bakulingroup.ru	f	t	2021-10-03 13:12:34+03
9	pbkdf2_sha256$260000$sUDALbEQjpYuudV5RH7ayG$/+360lj/QDscA26eiVL7/zavtIzDrLwpCNRaQxEX4uo=	\N	f	y.pysina	Юлия	Пысина	y.pysina@bakulingroup.ru	f	t	2021-10-03 13:12:51+03
15	pbkdf2_sha256$260000$HouX1QyXHLbl7nEtnLGHXU$TP+bWn4Z7WVKvJwTnxS8Gk1NDpRhM4GYjn4aYKYh0DM=	\N	f	t.mirzaeva	Таисия	Мирзаева		f	t	2021-10-03 13:23:57+03
16	pbkdf2_sha256$260000$RXK7iTL8JQFV5uWCcgpc5p$4nDDuJepiJGayBhT3StR65fVe8XgRlqft5P51pqeSHo=	\N	f	e.tsvetkova	Евгения	Цветкова		f	t	2021-10-03 13:25:15+03
1	pbkdf2_sha256$260000$BpWmUZWTCJI7AbzGg7dc7Z$BDfOQeuiA+qS9ilc2p4QdOCZjnsK5HwYtg3Yt2CmJJg=	2021-10-03 12:29:44+03	t	rsg	Сергей	Рубцов	rsh81@ya.ru	t	t	2021-10-03 12:00:21+03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: bollore
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
1	14	2
2	6	1
3	11	2
4	10	1
5	12	2
6	13	2
7	9	1
8	15	1
9	16	1
10	1	1
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: bollore
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: defects_bodies; Type: TABLE DATA; Schema: public; Owner: bollore
--

COPY public.defects_bodies (id, body_number) FROM stdin;
1	00006
2	00007
3	00008
4	00009
5	00010
6	00011
7	00012
8	00013
9	00014
10	00015
11	00016
12	00017
13	00018
14	00019
15	00020
16	00021
17	00022
18	00023
19	00024
20	00025
21	00026
22	00027
23	00028
24	00029
25	00030
26	00031
27	00032
28	00033
29	00034
30	00035
31	00036
32	00037
33	00038
34	00039
35	00040
36	00041
37	00042
38	00043
39	00044
40	00045
41	00046
42	00047
43	00048
44	00049
45	00050
46	00051
47	00052
48	00053
49	00054
50	00055
51	00056
52	00057
53	00058
54	TS 34
55	TS 35
56	TS 36
57	TS 37
58	TS 38
59	TS 39
60	TS 40
61	TS 41
62	TS 42
63	TS 43
64	TS 44
65	TS 45
66	TS 46
67	TS 47
68	TS 48
69	TS 49
70	TS 50
71	TS 51
72	TS 52
73	TS 53
74	TS 54
75	TS 55
76	TS 56
77	TS 57
78	TS 58
79	TS 59
80	TS 60
81	TS 61
82	TS 62
83	TS 63
84	TS 64
85	TS 65
86	TS 66
87	TS 67
88	TS 68
89	TS 69
90	TS 70
91	TS 71
92	TS 72
93	TS 73
94	TS 74
95	TS 75
96	TS 76
97	TS 77
98	TS 78
99	TS 79
100	TS 80
101	TS 81
102	TS 82
103	TS 83
104	TS 84
105	TS 85
106	TS 86
107	TS 87
108	TS 88
109	TS 89
110	TS 90
111	TS 91
112	TS 92
113	TS 93
114	TS 94
115	TS 95
116	TS 96
117	TS 97
118	TS 98
\.


--
-- Data for Name: defects_comments; Type: TABLE DATA; Schema: public; Owner: bollore
--

COPY public.defects_comments (id, comment, published_at, author_id, defect_id) FROM stdin;
\.


--
-- Data for Name: defects_defects; Type: TABLE DATA; Schema: public; Owner: bollore
--

COPY public.defects_defects (id, created_at, date_defect_detection, term_up_to, number_of_inconsistencies, discrepancy_description, body_number_id, detail_id, priority_id, quality_controller_id, responsible_executor_id, status_id, type_of_discrepancy_id, workshop_id, for_checking) FROM stdin;
\.


--
-- Data for Name: defects_details; Type: TABLE DATA; Schema: public; Owner: bollore
--

COPY public.defects_details (id, article, name) FROM stdin;
1697	U159118AA	Уголок
1698	U152530AA	Накладка
1699	U156727AB	Кронштейн
1700	U156904AB	Раскос
1701	U152161AA	Заклепка резьбовая М10 шестигранная Rivelit AM10 HS13.1 IN1040
1702	U169398AA	Профиль
1703	U157062AB	Швеллер
1704	U160802AA	Уголок
1705	U158788AA	Швеллер
1706	U157011AA	Ребро
1707	U155098AB	Профиль в сборе
1708	U159339AA	Накладка
1709	U159751AA	Уголок
1710	U156455AA	Облицовка люка в сборе
1711	U158402AA	Раскос
1712	U152184AB	Кронштейн
1713	U160981AB	Раскос
1714	U148273AC	Профиль
1715	U155354AC	Профиль
1716	U150135AA	Раскос
1717	U150380AB	Профиль 50х50х3
1718	U155338AC	Стойка
1719	U159627AA	Раскос
1720	U179690AA	Пруток
1721	U157327AC	Профиль 40х40х3
1722	U160974AA	Раскос
1723	U155477AE	Облицовка
1724	U159304AA	Стойка
1725	U152667AB	Швеллер
1726	U159535AA	Профиль
1727	U152868AC	Кронштейн
1728	U165380AB	Короб в сборе
1729	U160470AB	Кронштейн в сборе
1730	U162746AA	Усиление
1731	U158898AC	Опора
1732	U158983AB	Пластина
1733	U159116AA	Кронштейн крепления АКБ в сборе
1734	U156485AA	Профиль
1735	U158572AA	Кронштейн
1736	U166019AA	Лист привязки труб каркаса кузова
1737	U152668AA	Заглушка
1738	U150912AA	Кронштейн в сборе
1739	U149838AH	Пол кабины водителя
1740	U156732AA	Кронштейн
1741	U159570AA	Раскос
1742	U156949AB	Уголок
1743	U168478AA	Швеллер
1744	U152246AA	Профиль
1745	U159282AA	Пластина
1746	U157617AC	Раскос
1747	U160303AA	Панель
1748	BMG-U164860AA-001	Ребро
1749	U152105AA	Кронштейн
1750	U151100AA	Накладка
1751	U157713AC	Профиль в сборе
1752	U156416AB	Швеллер левый
1753	U155512AD	Накладка
1754	U148266AA	Профиль
1755	U159898AD	Установка приварных элементов пола и подиума задней части
1756	U153987AA	Профиль
1757	U156684AA	Заглушка профиля порога
1758	U156853AB	Усиление крепления бачка
1759	U158386AA	Раскос в сборе
1760	U163215AA	Профиль в сборе
1761	U161090AA	Раскос
1762	U149291AB	Плита
1763	U168350AA	Кронштейн кондиционера кабины водителя в сборе
1764	U159705AB	Швеллер
1765	U159515AB	Профиль
1766	U158105AA	Раскос
1767	U159924AB	Косынка
1768	U160865AB	Ребро
1769	U181453AA	Швеллер
1770	U179711AA	Стойка в сборе
1771	U153054AA	Кронштейн в сборе
1772	U157856AB	Ребро
1773	U157131AA	Профиль горизонтальный
1774	U150745AA	Пластина
1775	U158174AC	Дно
1776	U152939AA	Раскос
1777	U158877AB	Профиль
1778	U157277AB	Кронштейн в сборе
1779	U154006AC	Патрубки в сборе
1780	U154678AA	Профиль
1781	U152820AA	Планка
1782	U154205AB	Профиль
1783	U159385AB	Кронштейн
1784	U154431AA	Накладка
1785	U150650AB	Швеллер опорный
1786	U160272AB	Накладка
1787	U152147AI	Каркас пола кабины водителя
1788	U159563AB	Швеллер
1789	U155872AD	Накладка в сборе
1790	U155586AA	Лист герметизации
1791	U154280AB	Ребро
1792	U154286AB	Ребро
1793	U159714AB	Швеллер
1794	U161076AA	Пластина
1795	U159548AA	Скоба
1796	U157795AA	Пластина опоры
1797	U155125AA	Пластина в сборе
1798	U156602AB	Профиль
1799	U155263AC	Заглушка в сборе
1800	U157684AB	Швеллер
1801	U155955AA	Раскос
1802	U155894AC	Накладка
1803	U165927AA	Панель герметизации
1804	U160945AB	Уголок
1805	U159989AG	Каркас задка
1806	U155076AA	Профиль усилительный
1807	U157612AB	Профиль
1808	U180940AB	Лист облицовки
1809	U167714AA	Кронштейн
1810	U160074AA	Накладка
1811	U156446AA	Профиль
1812	U159610AA	Раскос
1813	U151060AA	Раскос
1814	U160511AA	Стойка
1815	U155360AB	Уголок
1816	U152098AC	Профиль
1817	U158783AB	Заглушка
1818	U160601AC	Панель облицовки
1819	U159734AB	Профиль
1820	U157852AB	Профиль
1821	U159740AA	Кронштейн
1822	U158790AE	Стойка
1823	U158839AE	Стойка в сборе
1824	U155016AA	Кронштейн в сборе
1825	U160547AA	Раскос
1826	U151137AA	Кронштейн рамки радиатора
1827	U158951AA	Кронштейн
1828	U160806AC	Раскос
1829	U165042AA	Кронштейн крепления отопителя в сборе
1830	U159384AC	Кронштейн в сборе
1831	U157734AA	Дуга
1832	U152442AA	Лист герметизации
1833	U155278AB	Профиль в сборе
1834	U160089AA	Швеллер
1835	U155568AB	Профиль переходный
1836	U157986AA	Профиль в сборе
1837	U159657AA	Раскос в сборе
1838	U160506AA	Раскос
1839	U160761AB	Стенка
1840	U165151AA	Накладка в сборе
1841	U163239AA	Профиль в сборе
1842	U162967AA	Кронштейн
1843	U152747AA	Швеллер
1844	U152265AG	Каркас боковины левой
1845	U158157AB	Профиль
1846	U152391AD	Устройство буксировочное в сборе
1847	U152769AB	Платик
1848	U158979AB	Пластина
1849	U159729AB	Швеллер
1850	U149415AB	Профиль
1851	U150496AA	Заглушка
1852	U159991AF	Установка облицовки задка
1853	U150017AJ	Пол и подиум задней части
1854	U160872AB	Ребро
1855	U155111AA	Заглушка
1856	U157867AB	Раскос в сборе
1857	U164660AA	Кронштейн масляного контура
1858	U159990AA	Дуга
1859	U155408AB	Дуга
1860	U163802AA	Уголок
1861	U159259AB	Кронштейн
1862	U160800AA	Уголок
1863	U155297AB	Панель облицовки
1864	U155541AC	Профиль
1865	U155090AC	Панель облицовки
1866	U159139AA	Заглушка
1867	U114406AA	Шпилька опресcовочная М6х20
1868	U164354AB	Короб в сборе
1869	U162523AA	Кронштейн
1870	U156406AA	Швеллер
1871	U164464AB	Усиление
1872	U152202AB	Пруток
1873	U159054AA	Уголок
1874	U164618AA	Профиль пандуса
1875	U157189AB	Кронштейн в сборе
1876	U138627AA	Гайка приварная М5 DIN 929 M5 A2
1877	U158939AB	Стойка
1878	U157295AB	Уголок
1879	U169177AB	Бонка
1880	U158961AA	Дуга
1881	U156483AB	Профиль
1882	U155183AA	Профиль крепления настила пола
1883	U159220AA	Профиль
1884	U166692AA	Кронштейн
1885	U160363AA	Кронштейн в сборе
1886	U157997AA	Профиль в сборе
1887	U155975AB	Кронштейн в сборе
1888	U158407AA	Накладка
1889	U155413AA	Облицовка
1890	U160315AA	Раскос
1891	U154430AB	Накладка
1892	U161248AB	Облицовка
1893	U179742AA	Стойка в сборе
1894	U160229AB	Профиль
1895	U155097AB	Кронштейн модулятора
1896	U153057AA	Кронштейн
1897	U159702AB	Швеллер
1898	U158348AC	Стенка левая
1899	U155410AC	Стойка
1900	U163322AA	Стойка
1901	U157178AA	Уголок
1902	U148819AA	Профиль 40х40х3
1903	U157743AB	Накладка
1904	U155126AB	Кронштейн трубы
1905	U150055AB	Раскос
1906	U155970AA	Втулка
1907	U168397AA	Швеллер
1908	U157592AA	Профиль в сборе
1909	U158367AD	Профиль в сборе
1910	U162737AA	Усиление
1911	U155829AC	Облицовка правая
1912	U156730AA	Профиль
1913	U159797AB	Пластина
1914	U165358AA	Крышка короба
1915	U159135AA	Накладка
1916	U150581AB	Швеллер
1917	U162476AA	Пластина уплотнения
1918	U155152AE	Стойка
1919	U158563AB	Швеллер
1920	U157625AD	Накладка
1921	U156836AB	Раскос
1922	U152330AB	Лист опорный двери кабины водителя
1923	U164714AA	Кронштейн масляного контура в сборе
1924	U160535AB	Стойка в сборе
1925	U149623AC	Профиль
1926	U157726AC	Облицовка задняя
1927	U157848AA	Заглушка
1928	U159312AA	Стойка
1929	U179680AA	Пластина антенны
1930	U154667AB	Пластина
1931	U158256AB	Кронштейн
1932	U138142AA	Заклепка резьбовая М4 шестигранная Rivelit AM4 HS6 AZ0520
1933	U156202AG	Профиль
1934	U157060AA	Кронштейн
1935	U161243AA	Кронштейн
1936	U155494AA	Заглушка
1937	U156827AB	Профиль крепления бачка в сборе
1938	U159616AA	Раскос
1939	U152475AA	Накладка
1940	U161062AB	Накладка
1941	U179355AA	Заглушка
1942	U154355AA	Раскос
1943	U160489AB	Кронштейн
1944	U156517AA	Кронштейн
1945	U161117AB	Усиление
1946	U155474AC	Облицовка правая
1947	U159710AB	Швеллер
1948	U157750AC	Опора
1949	U160527AA	Дуга
1950	U157553AB	Косынка
1951	U161137AC	Пластина
1952	U160469AD	Кронштейн
1953	U154285AB	Ребро
1954	U155186AB	Накладка
1955	U161109AB	Уголок
1956	U158631AA	Заглушка
1957	U156900AB	Кронштейн в сборе
1958	U154032AB	Пластина
1959	U156809AC	Стойка
1960	U152670AA	Кронштейн в сборе
1961	U157198AB	Кронштейн
1962	U151067AB	Кронштейн в сборе
1963	U155169AB	Стойка
1964	U158605AC	Профиль в сборе
1965	U161372AC	Левая боковина
1966	U179736AA	Стойка
1967	U160172AA	Стойка
1968	U160429AA	Профиль
1969	U158473AA	Кронштейн
1970	U169148AA	Труба
1971	U161139-10AB	Косынка
1972	U155194AC	Заглушка
1973	U152080AB	Профиль
1974	U156964AB	Кронштейн в сборе
1975	U150996AA	Накладка
1976	U155991AD	Профиль в сборе
1977	U152149AJ	Приварные элементы пола водителя
1978	U158110AD	Профиль в сборе
1979	U160550AB	Швеллер
1980	U156329AB	Патрубок
1981	U158743AB	Кронштейн
1982	U155134AA	Уголок
1983	U156637AB	Стойка в сборе
1984	U155113AB	Накладка
1985	U151062AA	Опора сиденья в сборе
1986	U158380AA	Раскос
1987	U159929AA	Накладка
1988	U156469AB	Профиль
1989	U157166AA	Стойка
1990	U158801AB	Панель облицовки
1991	U150566AA	Накладка
1992	U158888AA	Профиль
1993	U156511AC	Профиль в сборе
1994	U157310AA	Профиль
1995	U152440AC	Кронштейн бачка омывателя в сборе
1996	U157037AB	Профиль
1997	U152114AA	Заклепка резьбовая М6 потайная шестигранная Rivelit AM6 HS9 AZ0530
1998	U163625AA	Косынка в сборе
1999	U150807AB	Кронштейн
2000	U150034AB	Вставка
2001	U149180AI	Каркас крыши в сборе
2002	U158430AD	Раскос в сборе
2003	U157038AC	Профиль в сборе
2004	U160269AA	Накладка
2005	U156478AA	Пластина в сборе
2006	U160449AA	Кронштейн в сборе
2007	U158543AA	Профиль 50х30х3
2008	U163214AA	Профиль в сборе
2009	U159659AC	Накладка
2010	U152279AI	Каркас модуля крепления задней подвески
2011	U157264AA	Кронштейн
2012	U165703AA	Накладка передней двери в сборе
2013	U150645AA	Пластина
2014	U150262AB	Профиль
2015	U157701AB	Швеллер
2016	U158717AD	Балка в сборе
2017	U158280AB	Профиль
2018	U160472AA	Кронштейн в сборе
2019	U157610AC	Стойка
2020	U158411AB	Профиль в сборе
2021	U160593AB	Профиль в сборе
2022	U152287AC	Облицовка
2023	U157561AA	Профиль
2024	U158370AB	Стойка
2025	U165407AA	Накладка передней двери
2026	U158779AC	Накладка
2027	U150616AA	Пластина
2028	U152258AA	Кронштейн
2029	U157126AB	Профиль опорный
2030	U157341AA	Раскос
2031	U154279AB	Ребро
2032	U156562AB	Кронштейн
2033	U155096AC	Профиль
2034	U161136AC	Стойка
2035	U157861AD	Облицовка в сборе
2036	U158111AA	Раскос в сборе
2037	U157415AB	Стойка
2038	U156569AD	Профиль в сборе
2039	U152816AC	Опора левая
2040	U157175AB	Кронштейн
2041	U158530AB	Пластина
2042	U159910AF	Каркас основания задка
2043	U150577AA	Накладка
2044	U162599AA	Усиление
2045	U158722AC	Стенка
2046	U160868AA	Панель
2047	U156719AA	Профиль
2048	U152379AC	Опора в сборе
2049	U160495AA	Раскос
2050	U159428AB	Швеллер в сборе
2051	U156851AA	Раскос
2052	U153856AD	Профиль в сборе
2053	U157065AC	Профиль в сборе
2054	U149171AG	Модуль крепления передней подвески
2055	U162940AA	Заклёпка резьбовая М5 Bollhoff 34377050025
2056	U163768AA	Пруток
2057	U169146AA	Труба
2058	U158372AA	Пластина
2059	U158736AB	Опора
2060	U158360AA	Накладка
2061	U160545AA	Профиль
2062	U159930AA	Швеллер
2063	U152527AA	Накладка
2064	U156492AA	Профиль
2065	U160534AA	Швеллер
2066	U149316AC	Профиль
2067	U159598AA	Раскос
2068	U165057AA	Заклепка резьбовая М10 шестигранная Rivelit AM10 HE13 AZ0540
2069	U180397AA	Швеллер
2070	U152372AB	Гайка квадратная М10
2071	U150225AA	Заглушка
2072	U164275AA	Обечайка
2073	U159881AD	Стойка
2074	U155666AB	Профиль
2075	U179738AA	Стойка
2076	U150844AE	Панель
2077	U160264AB	Кожух
2078	U163815AA	Ребро
2079	U150908AB	Кронштейн
2080	U152288AB	Короб правый
2081	U153058AA	Кронштейн в сборе
2082	U160533AB	Профиль
2083	U160006AA	Кронштейн в сборе
2084	U148954AA	Профиль
2085	U150792AC	Кронштейн
2086	U157808AB	Кронштейн в сборе
2087	U152095AA	Накладка
2088	U155265AC	Профиль в сборе
2089	U157652AA	Швеллер
2090	U158441AB	Кронштейн
2091	U152093AA	Панель герметизации
2092	U150370AA	Уголок крепления настила пола
2093	U156495AA	Профиль
2094	U157853-10AA	Профиль
2095	U152812AA	Опора
2096	U152499AD	Дуга в сборе
2097	U139169AA	Заклепка резьбовая М8 шестигранная Rivelit AM8 HS11 AZ0530
2098	U161056AA	Накладка
2099	U152974AA	Кронштейн
2100	U155756AB	Кожух в сборе
2101	U157346AB	Профиль
2102	U159727AB	Швеллер
2103	U155142AA	Стойка
2104	U152479AA	Накладка
2105	U152424AB	Опора двери кабины водителя в сборе
2106	U158533AA	Накладка
2107	U152443AB	Раскос
2108	U152178AA	Раскос
2109	U156214AA	Профиль
2110	U158378AA	Профиль 50х80х3
2111	U158112AA	Раскос в сборе
2112	U159524AA	Профиль
2113	U156953AB	Уголок
2114	U155151AE	Стойка
2115	U161123AB	Стойка в сборе
2116	U160544AA	Профиль
2117	U160135AA	Заглушка
2118	U158780AB	Профиль
2119	U157619AA	Кронштейн
2120	U154670AB	Кронштейн в сборе
2121	U155891AC	Опора
2122	U155371AC	Облицовка левая
2123	U154848AB	Профиль
2124	U155734AD	Профиль в сборе
2125	U157142AB	Кронштейн звукового сигнала
2126	U156749AC	Швеллер в сборе
2127	U156750AC	Раскос
2128	U160620AA	Косынка
2129	U166244AA	Опора поддомкратника в сборе
2130	U160387AB	Стойка в сборе
2131	U160064AA	Профиль
2132	U159851AD	Основание пола кабины водителя
2133	U156237AA	Облицовка пола
2134	U155476AC	Облицовка правая
2135	U158469AA	Кронштейн
2136	U161071-10AA	Решетка
2137	U154295AA	Швеллер
2138	U158315AB	Короб в сборе
2139	U155065AC	Опора в сборе
2140	U160133AA	Заглушка
2141	U152484AB	Накладка
2142	U164422AB	Усиление
2143	U159753AB	Профиль
2144	U149189AA	Профиль 50х50х3
2145	U158789AE	Профиль в сборе
2146	U155191AD	Профиль в сборе
2147	U155946AB	Профиль
2148	U155525AB	Накладка
2149	U158787AC	Профиль в сборе
2150	U157494AC	Балка в сборе
2151	U109871AA	Заклепка резъбовая М6 шестигранная Rivelit AM6 HS9 AZ3060
2152	U160754AC	Раскос
2153	U160782AC	Пластина
2154	U159422AA	Раскос в сборе
2155	U150594AA	Профиль
2156	U156868AA	Раскос
2157	U152811AA	Кронштейн в сборе
2158	U161229AC	Кронштейн
2159	U163754AA	Ребро
2160	U156807AB	Стойка
2161	U160034AA	Профиль
2162	U158190AB	Ребро
2163	U161419AB	Профиль
2164	U158578AB	Заглушка
2165	U158725AA	Уголок
2166	U156525AB	Профиль в сборе
2167	U159152AB	Профиль в сборе
2168	U160924AA	Уголок
2169	U149833AI	Каркас боковины левой в сборе
2170	U104307AA	Шпилька специальная М6х26
2171	U154864AA	Профиль
2172	U164391AB	Кронштейн рейсоуказателя в сборе
2173	U160071AA	Дуга
2174	U158976AC	Профиль
2175	U159196AC	Кронштейн в сборе
2176	U160733AA	Профиль
2177	U163495AA	Труба 50х2
2178	U156758AA	Профиль
2179	U158146AA	Раскос 20х40х2
2180	U156676AA	Кронштейн
2181	U161381AC	Опора левой подушки
2182	U164466AB	Пластина
2183	U156570AB	Втулка
2184	U158185AA	Швеллер
2185	U155334AB	Профиль опорный
2186	U161398AA	Короб рециркуляции
2187	U152417AA	Кронштейн жгута электрического
2188	U156999AB	Накладка
2189	U153050AA	Кронштейн
2190	U153994AB	Патрубок
2191	U156381AA	Стойка
2192	U155393AA	Раскос
2193	U164631AA	Профиль пандуса
2194	U149936AI	Каркас задка в сборе
2195	U156414AA	Профиль
2196	U156766AD	Облицовка
2197	U155123AA	Пластина в сборе
2198	U158734AB	Профиль
2199	U160524AA	Раскос
2200	U152396AB	Пластина в сборе
2201	U152270AG	Верхняя часть проема двери
2202	U152295AB	Раскос
2203	U155506AE	Накладка в сборе
2204	U168483AA	Швеллер
2205	U158782AB	Профиль
2206	U160787AD	Раскос в сборе
2207	U161045AA	Раскос
2208	U162216AA	Пруток
2209	U150831AF	Панель
2210	U149831AI	Каркас боковины правой в сборе
2211	U154690AB	Кронштейн
2212	U160504AA	Профиль
2213	U160759AA	Стойка
2214	U166245AA	Пластина опоры
2215	U157493AC	Стенка
2216	U158359AA	Накладка
2217	U158767AA	Раскос
2218	U156960AA	Швеллер
2219	U156867AA	Швеллер
2220	U154871AC	Профиль
2221	U165118AA	Панель герметизации
2222	U164372AA	Уголок рейсоуказателя
2223	U164644AA	Лист верхний
2224	U158836AC	Кронштейн опорный
2225	U160338-10AB	Кронштейн опорный
2226	U155340AB	Швеллер опорный
2227	U157491AA	Накладка
2228	U159578AA	Накладка
2229	U152506AH	Установка приварных элементов боковины правой
2230	U155503AA	Кронштейн в сборе
2231	U151138AA	Накладка
2232	U160576AA	Профиль
2233	U156849AA	Раскос
2234	U165356AA	Стенка короба
2235	U155048AB	Профиль
2236	U159577AC	Профиль усилительный крепления бачка ГУР в сборе
2237	U157438AC	Усиление
2238	U159550AB	Профиль крепления отопителя фронтального
2239	U160991AA	Профиль
2240	U148254AA	Профиль
2241	U160746AA	Дуга
2242	U160276AA	Панель
2243	U154641AA	Обечайка
2244	U160473AA	Кронштейн
2245	U159158AD	Стойка в сборе
2246	U158482AB	Уголок
2247	U160530AA	Швеллер
2248	U158172AA	Профиль
2249	U154847AA	Стойка
2250	U160347AA	Раскос
2251	U163748AA	Ребро
2252	U155102AC	Профиль в сборе
2253	U157218AA	Стойка 40х40х3
2254	U161058AA	Труба Ø30x2
2255	U101669AA	Гайка квадратная М8 DIN 557 A2
2256	U156915AA	Накладка
2257	U152375AA	Кожух гайки
2258	U159731AB	Швеллер
2259	U154297AB	Профиль 80х120х5
2260	U163872AA	Уголок в сборе
2261	U161120AA	Накладка
2262	U160191AA	Уголок
2263	U156906AB	Профиль
2264	U158758AC	Проушина
2265	U160496AA	Раскос
2266	U156841AA	Раскос
2267	U158956AC	Профиль
2268	U159420AA	Профиль
2269	U160093AA	Накладка
2270	U156799AA	Раскос
2271	U158099AC	Стойка
2272	U154668AA	Стойка
2273	U159589AB	Кронштейн
2274	U156752AB	Профиль в сборе
2275	U150898AA	Кронштейн
2276	U157565AA	Профиль
2277	U157324AA	Раскос
2278	U159536AA	Швеллер
2279	U166045AA	Лист накладки
2280	U150783AA	Втулка
2281	U164362AB	Кронштейн рейсоуказателя
2282	U158008AA	Профиль в сборе
2283	U152759AD	Короб внутренний
2284	U160751AA	Раскос в сборе
2285	U151131AB	Профиль
2286	U165708AA	Панель крепления передней двери в сборе
2287	U152410AA	Опора
2288	U159359AB	Кронштейн
2289	U157866AB	Раскос
2290	U156866AB	Кронштейн
2291	U163819AA	Ребро
2292	U165002AA	Кронштейн крепления отопителя
2293	U152366AA	Заглушка
2294	U156751AC	Раскос
2295	U164467AB	Обечайка
2296	U155892AC	Накладка
2297	U157372AC	Раскос
2298	U150633AB	Профиль в сборе
2299	U159274AA	Раскос
2300	U153960AC	Опора
2301	U159280AD	Кронштейн в сборе
2302	U160498AA	Кронштейн в сборе
2303	U155954AA	Раскос
2304	U159117AA	Кронштейн крепления АКБ
2305	U160349AA	Профиль
2306	U150835AA	Короб
2307	U159262AA	Стойка
2308	U149615AA	Профиль 50х80х3
2309	U149514AC	Дуга
2310	U160753AA	Скоба
2311	U158781AA	Профиль
2312	U155050AB	Профиль в сборе
2313	U152290AB	Раскос пола опорный
2314	U162547AC	Панель крепления передней двери
2315	U164316AA	Короб
2316	U152257AA	Пластина закладная
2317	U160066AA	Дуга
2318	U159197AA	Пластина
2319	U152106AA	Профиль усилительный кронштейна стеклоочистителя
2320	U158434AC	Раскос в сборе
2321	U161163AB	Кронштейн в сборе
2322	U155014AA	Стенка
2323	U158127AB	Профиль
2324	U159157AB	Проставка в сборе
2325	U152663AD	Профиль 80х50х3
2326	U180391AA	Швеллер
2327	U156808AA	Накладка
2328	U152364AA	Заглушка
2329	U155321AC	Профиль в сборе
2330	U156975AA	Раскос
2331	U157484AE	Ребро
2332	U156729AA	Профиль
2333	U163200AA	Косынка
2334	U155374AB	Стойка
2335	U165632AA	Панель крепления передней двери
2336	U157066AA	Кронштейн
2337	U158483AB	Стойка
2338	U157116AD	Профиль
2339	U155330AC	Профиль опорный
2340	U157869AB	Ребро
2341	U159560AA	Заглушка
2342	U162797AA	Кронштейн
2343	U150903AC	Профиль в сборе
2344	U158479AC	Стойка
2345	U168388AA	Швеллер
2346	U158723AC	Накладка верхняя
2347	U149977AB	Кронштейн
2348	U179728AA	Профиль
2349	U161238AB	Уголок
2350	U155087AD	Панель облицовки в сборе
2351	U156842AB	Профиль
2352	U156806AC	Профиль в сборе
2353	U106009AA	Шпилька специальная М10х35
2354	U157063AA	Накладка
2355	U158708AA	Профиль
2356	U158104AD	Профиль
2357	U154674AB	Кронштейн
2358	U157552AA	Профиль
2359	U152784AA	Швеллер
2360	U162550AA	Труба вентиляции
2361	U155727AD	Облицовка правая
2362	U155451AA	Накладка
2363	U155914AA	Профиль
2364	U155279AB	Профиль
2365	U159198AB	Кронштейн
2366	U150657AB	Швеллер опорный
2367	U158797AA	Кронштейн
2368	U161245AA	Накладка
2369	U161046AA	Заглушка
2370	U149434AA	Накладка
2371	U168806AA	Лист герметизации
2372	U151014AH	Модуль крепления задней подвески
2373	U155357AC	Лист герметизации
2374	U168481AA	Швеллер
2375	U157239AB	Швеллер
2376	U157392AB	Раскос
2377	U163213AA	Профиль в сборе
2378	U160720AB	Профиль
2379	U150856AB	Стойка
2380	U154003-20AB	Патрубок
2381	U158412AB	Накладка
2382	U153912AC	Опора
2383	U160866AB	Ребро
2384	U161446AD	Каркас задней части боковины правой
2385	U156468AB	Профиль
2386	U156466AB	Кронштейн
2387	U150814AA	Кронштейн
2388	U158889AA	Раскос
2389	U158680-10AA	Профиль
2390	U152495AI	Приварные элементы каркаса кузова
2391	U155286AA	Профиль
2392	U158139AC	Стойка в сборе
2393	U155058AB	Швеллер опорный
2394	U161004AB	Швеллер
2395	U150795AA	Накладка
2396	U161235AA	Кронштейн
2397	U163003AB	Установка идентификационной таблички кузова
2398	U150519AA	Накладка
2399	U155392AA	Раскос
2400	U160492AA	Профиль
2401	U158609AC	Профиль в сборе
2402	U150957AD	Профиль порога
2403	U160098AA	Накладка
2404	U157551AB	Стойка
2405	U149277AA	Профиль
2406	U155136AD	Стойка
2407	U154888AC	Профиль с втулками в сборе
2408	U154318AA	Профиль
2409	U166023AA	Опора герметизации накладки
2410	U149870AA	Профиль
2411	U158799AB	Панель облицовки
2412	U160341AA	Раскос
2413	U156169AA	Раскос
2414	U159567AA	Профиль
2415	U161047AA	Раскос
2416	U148949AC	Лонжерон 50х80х3
2417	U155314AB	Профиль в сборе
2418	BMG-U152443AB-002	Раскос
2419	U159268AA	Раскос
2420	U150419AA	Заглушка
2421	U158057AD	Накладка в сборе
2422	U155379AB	Профиль в сборе
2423	U160022AA	Швеллер
2424	U152472AA	Дуга
2425	U152100AC	Кронштейн бачка омывателя
2426	U161784AA	Кронштейн
2427	U159981AA	Накладка
2428	U160494AB	Ребро
2429	U154348AA	Накладка
2430	U157365AA	Раскос в сборе
2431	U159417AA	Раскос
2432	U159561AA	Швеллер
2433	U157388AA	Раскос
2434	U160625AA	Уголок
2435	U158015AC	Уголок
2436	U157330AA	Раскос
2437	U157058AB	Кронштейн в сборе
2438	U156698AB	Профиль усилительный
2439	U155144AA	Стойка
2440	U155641AA	Профиль
2441	U164860AA	Профиль в сборе
2442	U156988AA	Профиль
2443	U155912-10AB	Профиль
2444	U159917AB	Швеллер
2445	U157520AB	Уголок
2446	U159713AB	Швеллер
2447	U160250AB	Короб в сборе
2448	U157888AB	Швеллер
2449	U158373AB	Стойка
2450	U165366AB	Крышка короба
2451	U158791-10AB	Заглушка
2452	U160833AA	Профиль крепления отопителя фронтального
2453	U152408AA	Опора
2454	U163238AA	Заглушка
2455	U157336AA	Раскос
2456	U159142AA	Профиль
2457	U155957AB	Уголок
2458	U154350AA	Раскос
2459	U159675AA	Швеллер
2460	U155948AB	Стенка
2461	U160741AA	Профиль
2462	U151057AB	Кронштейн
2463	U162483AA	Пластина уплотнения
2464	U166024AA	Шпилька опрессовочная HFH М10х30
2465	U154335AA	Заглушка
2466	U164442AB	Обечайка
2467	U155124AA	Пластина
2468	U161350AA	Кронштейн
2469	U156993AC	Профиль
2470	U150951AB	Ребро
2471	U156979AA	Раскос
2472	U154677AB	Кронштейн в сборе
2473	U150026AA	Раскос опорный
2474	U149661AB	Швеллер
2475	U157139AA	Уголок
2476	U158957AC	Профиль
2477	U155187AD	Накладка
2478	U150343AB	Профиль
2479	U161132AB	Стойка
2480	U149203AC	Обечайка
2481	U159559AA	Швеллер
2482	U163782AA	Стенка
2483	U159342AA	Накладка в сборе
2484	U150781AA	Накладка
2485	U161022AA	Заглушка
2486	U157220AB	Профиль
2487	U150065AA	Кронштейн
2488	U150687AA	Профиль
2489	U150716AA	Заглушка
2490	BMG-U159989AD-001	Стойка
2491	U157604AA	Профиль
2492	U158480AB	Уголок
2493	U157015AA	Кронштейн в сборе
2494	U161417AD	Стойка в сборе
2495	U151048AA	Раскос
2496	U154154AC	Пластина
2497	U158470AA	Кронштейн в сборе
2498	U163296AA	Ребро
2499	U166246AA	Труба опоры
2500	U154740AA	Стойка
2501	U160279AA	Накладка
2502	U150634AB	Ребро
2503	U156989AA	Профиль в сборе
2504	U155768AC	Уголок
2505	U161122AA	Ребро
2506	U159163AA	Швеллер
2507	U154776AB	Короб в сборе
2508	U152346AA	Раскос
2509	U151053AB	Профиль
2510	U158014AB	Опора
2511	U161808AA	Кронштейн
2512	U155277AA	Раскос 50х50х3
2513	U149221AC	Профиль
2514	U168338-00AA	Кронштейн кондиционера кабины водителя в сборе
2515	U163202AA	Косынка
2516	U158958AC	Профиль в сборе
2517	BMG-U152443AB-001	Раскос
2518	U157288AB	Кронштейн крепления отопителя
2519	U155679AC	Кронштейн в сборе
2520	U157687AA	Накладка
2521	U166226AA	Накладка
2522	U159815AB	Профиль в сборе
2523	U156991AA	Заглушка
2524	U157870AA	Профиль в сборе
2525	U159442AA	Раскос в сборе
2526	U105785AA	Заклепка шестигранная вытяжная резьбовая М5 Rivelit AM5 HE7 AZ0530
2527	U159604AA	Раскос
2528	U159565AB	Профиль
2529	U169543AA	Стойка в сборе
2530	U158846AA	Шпилька приварная M6x20 ISO 13918
2531	U153809AA	Шайба
2532	U160920AA	Уголок
2533	U152073AB	Втулка
2534	U155389AA	Стойка
2535	U156693AA	Обечайка
2536	U153847AA	Труба Ø45
2537	U148818AB	Профиль
2538	U154859AB	Кронштейн в сборе
2539	U157172AA	Стойка в сборе
2540	U150709AA	Втулка
2541	U152074AA	Втулка
2542	U165307AA	Ребро накладки порога
2543	U159948AA	Накладка
2544	U157563AA	Профиль в сборе
2545	U153027AB	Лонжерон в сборе
2546	U159488AA	Ребро
2547	U158710AA	Профиль
2548	U160937AA	Стойка
2549	U158170AD	Стенка правая
2550	U158686AA	Профиль
2551	U106138AB	Заклепка резьбовая М6 шестигранная Rivelit AM6 HS9 AZ0530
2552	U151065AA	Гайка приварная М6 Emile Maurin 646076
2553	U101739AA	Заклепка резьбовая М8 шестигранная Rivelit AM8 HS11 AZ3060
2554	U157647AB	Стойка
2555	U158524AB	Стенка
2556	U155351AB	Кронштейн модулятора
2557	U160183AA	Профиль
2558	U149281AA	Профиль
2559	U158089AC	Стойка
2560	U155072AB	Заглушка
2561	U163661AA	Лист
2562	U159552AD	Облицовка
2563	U148265AA	Профиль
2564	U152248AB	Профиль усилительный крепления двери кабины водителя
2565	U158013AB	Опора
2566	U150515AA	Заглушка
2567	U155085AA	Заглушка
2568	U156744AC	Профиль
2569	U162422AA	Профиль модуля переднего в сборе
2570	U158542AB	Профиль
2571	U152192AA	Стойка
2572	U155150AF	Стойка в сборе
2573	U160950-10AB	Решетка
2574	U161057AA	Накладка
2575	U148349AB	Профиль усилительный крепления рулевого механизма
2576	U152524AB	Накладка
2577	U158786AA	Профиль в сборе
2578	U160996AB	Пластина
2579	U155285AA	Профиль 30х20х2
2580	U157132AA	Профиль опорный
2581	U159656AA	Профиль
2582	U156862AB	Кронштейн
2583	U158682AB	Профиль
2584	U148380AA	Профиль
2585	U157355AA	Раскос
2586	U155487AA	Швеллер
2587	U157050AA	Втулка
2588	U157271AA	Кронштейн
2589	U159358AC	Кронтейн в сборе
2590	U156695AA	Профиль
2591	U150145AA	Стойка
2592	U160347-10AA	Раскос
2593	U160362AA	Накладка
2594	U160353AA	Раскос
2595	U160836AA	Раскос
2596	U152244AA	Уголок
2597	U157481AB	Лонжерон
2598	U159153AA	Профиль в сборе
2599	U158129AA	Раскос
2600	U149605AA	Профиль
2601	U158732AB	Уголок
2602	U158701AA	Профиль
2603	U155806AD	Облицовка
2604	U156813AC	Усиление крепления бачка
2605	U151066AA	Гайка приварная М8 Emile Maurin 646078
2606	U161074-10AA	Решетка
2607	U168383AA	Швеллер
2608	U161082AA	Накладка в сборе
2609	U162888AA	Кронштейн камеры
2610	U163741AB	Кронштейн зарядного разъема
2611	U156350AA	Уголок
2612	U158555AA	Заглушка
2613	U152755AD	Опора левая
2614	U160603AA	Профиль
2615	U154972AB	Кронштейн
2616	U152395AA	Пластина крепления двери кабины водителя в сборе
2617	U152275AG	Верхняя часть проема двери
2618	U152151AA	Профиль
2619	U158079AC	Стойка
2620	U166761AA	Кронштейн поручня в сборе
2621	U104964AA	Заклепка резьбовая M4 Rivelit AM4 HS6 AZ2030
2622	U159320AA	Стойка
2623	U159629AA	Раскос
2624	U158733AD	Опора в сборе
2625	U161249AB	Облицовка
2626	U152357AC	Облицовка
2627	U159549AA	Профиль в сборе
2628	U160182AA	Профиль в сборе
2629	U154541AC	Кронштейн
2630	U156978AA	Раскос
2631	U153760AA	Профиль
2632	U152107AA	Кронштейн в сборе
2633	U158377AA	Заглушка
2634	U159680AA	Кронштейн в сборе
2635	U152446AA	Раскос
2636	U162153AB	Профиль в сборе
2637	U154860AB	Кронштейн
2638	U159091AA	Кронштейн крепления АКБ
2639	U158500AA	Кронштейн
2640	U169169AA	Дуга арки в сборе
2641	U158800AB	Панель облицовки
2642	U149841AI	Вставка каркаса основания средняя
2643	U165269AA	Проставка облицовки
2644	U156585AD	Патрубки
2645	U160239AA	Кожух
2646	U159813AD	Правая часть каркаса модуля крепления передней подвески
2647	U156741AC	Швеллер
2648	U160475AA	Профиль
2649	U156843AB	Профиль в сборе
2650	U152277AG	Верхняя часть проема двери
2651	U155185AB	Профиль крепления настила пола в сборе
2652	U157846AA	Стойка
2653	U155182AB	Профиль крепления настила пола в сборе
2654	U156764AC	Профиль
2655	U164647AA	Каркас пандуса в сборе
2656	U156661AD	Панель герметизации
2657	U160383AD	Стойка
2658	U152369AA	Заглушка
2659	U154283AB	Ребро
2660	U160946AB	Накладка
2661	U149313AB	Накладка
2662	BMG-U152667AB-001	Швеллер
2663	U157122AA	Косынка
2664	U156335AB	Втулка
2665	U160008AA	Кронштейн
2666	U156521AA	Уголок
2667	U162810AA	Профиль горизонтальный верхний
2668	U152388AD	Лонжерон в сборе
2669	U150893AA	Кронштейн
2670	U156694AB	Швеллер профиля порога
2671	U155661AB	Кронштейн
2672	U155184AA	Профиль крепления настила пола
2673	U158297AB	Швеллер
2674	U165911AB	Кронштейн патрубков отопления
2675	U157246AA	Профиль 40х40х3
2676	U155038AC	Панель облицовки
2677	U157873AA	Раскос в сборе
2678	U159332AA	Ребро
2679	U152851AG	Установка облицовки каркаса крыши
2680	U161145AB	Профиль в сборе
2681	U158566AD	Швеллер
2682	U160994AA	Профиль
2683	U158187AB	Швеллер
2684	U165987AB	Установка пластин для антенн
2685	U158875AA	Стойка
2686	U157512AB	Профиль
2687	U161423AA	Кронштейн модулятора
2688	U158362AC	Раскос в сборе
2689	U161055AB	Ребро
2690	U152118AA	Заклепка резьбовая М8 потайная шестигранная Rivelit AM8 HS11 AZ0530
2691	U161450AA	Кронштейн облицовки
2692	U157840AA	Стойка
2693	U161084AB	Накладка в сборе
2694	U154188AB	Профиль
2695	U156761AC	Облицовка
2696	U156461AB	Профиль в сборе
2697	U160564AA	Стойка
2698	U161447AE	Каркас передней части боковины правой
2699	U150012AB	Кронштейн
2700	U159596AB	Уголок
2701	U164290AA	Уголок крепления решетки
2702	U160784AD	Раскос в сборе
2703	U158303AA	Уголок
2704	U157714AC	Профиль
2705	U160185AA	Лонжерон
2706	U158071AB	Раскос
2707	U160513AC	Облицовка
2708	U158068AB	Дно
2709	U159474AB	Стойка в сборе
2710	U157514AD	Швеллер
2711	U155138AE	Стойка
2712	U156671AB	Кронштейн
2713	U155655AB	Кронштейн
2714	U149546AB	Лист нижний
2715	U162948AA	Кронштейн датчика уровня пола
2716	U150248AC	Профиль
2717	U158891AC	Опора
2718	U154356AB	Накладка
2719	U158630AA	Профиль 30х30х2
2720	U152490AA	Кронштейн
2721	U168338AA	Кронштейн кондиционера кабины водителя
2722	U158080AC	Стойка в сборе
2723	U161143AA	Швеллер
2724	U155283AA	Профиль 40х40х3
2725	U161093-10AA	Решетка
2726	U159000AA	Профиль
2727	U163744AA	Ребро
2728	U155414AC	Облицовка
2729	U150915AA	Кронштейн в сборе
2730	U158374AB	Стойка в сборе
2731	U160055AA	Уголок
2732	U156977AA	Раскос
2733	U155044AB	Панель облицовки
2734	U150260AB	Профиль
2735	U166693AA	Кронштейн
2736	U159051AA	Швеллер
2737	U152398AA	Заглушка
2738	U158759AC	Проушина
2739	U161101AA	Усиление
2740	U157706AB	Профиль
2741	U159281AC	Кронштейн
2742	U158100AC	Стойка в сборе
2743	U157845AB	Лист облицовки
2744	U155322AA	Профиль передний
2745	U156596AC	Стойка
2746	U160186AA	Лонжерон в сборе
2747	U157572AB	Раскос
2748	U160793AA	Швеллер
2749	U155117AA	Заглушка в сборе
2750	U158416AB	Стойка
2751	U163316AA	Заглушка
2752	U160382AB	Накладка
2753	U155729AA	Перегородка
2754	U160042AA	Профиль
2755	U154277AA	Кронштейн
2756	U152815AA	Короб правый
2757	U152745AA	Уголок
2758	U161241AA	Уголок
2759	U158477AF	Стойка в сборе
2760	U164680AA	Перегородка
2761	U160727AA	Профиль
2762	U155959AB	Раскос
2763	U158494AB	Кронштейн
2764	U157236AB	Кронштейн
2765	U150785AA	Бонка
2766	U152485AA	Кронштейн
2767	U154876AB	Профиль
2768	U152084AB	Стойка
2769	U161420AA	Профиль
2770	U159397AA	Раскос
2771	U157562AA	Накладка
2772	U164635AA	Опора пандуса
2773	U155411AA	Раскос
2774	U158570AA	Кронштейн в сборе
2775	U154003-10AB	Патрубок
2776	U156531AA	Профиль в сборе
2777	U157809AB	Кронштейн
2778	U156831AB	Профиль
2779	U159988AE	Установка приварных элементов задка
2780	U158115AF	Стойка в сборе
2781	U158760AB	Накладка
2782	U159642AB	Уголок
2783	U160894AB	Панель
2784	U160537AB	Стойка
2785	U152528AB	Профиль
2786	U158680AA	Профиль
2787	U107645AA	Шпилька опресcовочная М5х18
2788	U160444AB	Профиль
2789	U156832AB	Профиль
2790	U155758AB	Панель
2791	U157318AA	Профиль
2792	U155135AC	Стойка в сборе
2793	U156572AA	Патрубок
2794	U157248AA	Кронштейн
2795	U157127AA	Профиль
2796	U152870AC	Кронштейн в сборе
2797	U157133AA	Стойка
2798	U151043AB	Профиль
2799	U150592AA	Раскос
2800	U159518AB	Облицовка
2801	U156403AA	Швеллер
2802	U150897AC	Кронштейн
2803	U155364AD	Облицовка
2804	U161070AB	Кронштейн
2805	BMG-U164860AA-002	Ребро
2806	U154893AA	Втулка
2807	U165667AA	Накладка передней двери
2808	U158737AD	Швеллер
2809	U165734AA	Опора герметизации накладки
2810	U158693AA	Профиль
2811	U165150AA	Накладка в сборе
2812	U160466AD	Лист пола в сборе
2813	U180398AA	Швеллер
2814	U150911AA	Кронштейн
2815	U159092AA	Уголок
2816	U156755AD	Накладка
2817	U150631AB	Профиль 70х70х5
2818	U160049AA	Профиль
2819	U157374AD	Облицовка
2820	U152169AA	Раскос
2821	U160024AA	Лист
2822	U150793AA	Пластина
2823	U179359AA	Заглушка
2824	U150925AA	Опора сиденья
2825	U152433AB	Швеллер
2826	U160556AA	Ребро
2827	U158669AA	Дуга
2828	U155352AB	Кронштейн модулятора
2829	U160897-10AB	Кронштейн
2830	U157311AA	Профиль
2831	U160426AB	Профиль
2832	U165946AA	Колодка пандуса
2833	U156387AB	Профиль
2834	U160381AA	Накладка
2835	U150279AA	Профиль 30х30х2
2836	U159586AB	Пластина
2837	U160092AA	Заглушка
2838	U156156AC	Пластина
2839	U157454AD	Ребро
2840	U164638AA	Заглушка
2841	U179739AA	Стойка
2842	U160951AB	Накладка
2843	U156971AD	Профиль
2844	U162475AA	Накладка передней двери
2845	U160621AA	Уголок
2846	U163632AA	Профиль
2847	U156800AB	Раскос
2848	U163384AA	Усиление пола
2849	U158488AC	Стойка в сборе
2850	U152415AB	Пруток
2851	U159564AB	Профиль
2852	U154765AA	Кронштейн
2853	U159180AA	Накладка
2854	U155953AA	Профиль
2855	U160499AA	Кронштейн
2856	U157600AB	Пруток
2857	U158963AA	Пластина
2858	U152819AB	Профиль в сборе
2859	U166756AA	Кронштейн поручня в сборе
2860	U161110AA	Профиль
2861	U159614AB	Обечайка
2862	U157700AA	Накладка
2863	U156891AA	Заглушка
2864	U159089AA	Кронштейн крепления АКБ в сборе
2865	U159481AA	Стойка
2866	U163851AB	Лист уплотнения
2867	U163752AA	Ребро
2868	U160408AA	Усиление
2869	U157502AC	Лист нижний
2870	U156476AA	Пластина в сборе
2871	U153849AA	Труба Ø30x2
2872	U159593AB	Пластина
2873	U157067AC	Профиль
2874	U155099AE	Кронштейн датчиков
2875	U152376AB	Швеллер
2876	U163221AA	Профиль в сборе
2877	U158113AB	Стенка
2878	U158798AA	Панель облицовки
2879	U161013AB	Швеллер
2880	U160791AA	Швеллер
2881	U159620AA	Раскос
2882	U149981AB	Профиль
2883	U161391AC	Опора правой подушки
2884	U160526AA	Кронштейн в сборе
2885	U159628AA	Проставка
2886	BMG-U152667AB-002	Швеллер
2887	U156444AB	Кронштейн
2888	U158577AC	Профиль в сборе
2889	U161141AA	Швеллер
2890	U155320-10AC	Уголок
2891	U161436AE	Стойка задняя в сборе
2892	U158178AA	Уголок
2893	U159219AB	Накладка
2894	U154298AA	Профиль 80х120х5
2895	U160558AA	Швеллер
2896	U161060AA	Труба Ø45x1.5
2897	BMG-U155327AD-000	Cтойка передняя в сборе
2898	U155380AC	Профиль
2899	U160609AA	Скоба
2900	U161104-10AA	Решетка
2901	U152256AA	Кронштейн
2902	U156451AD	Кронштейн в сборе
2903	U160518AA	Кронштейн в сборе
2904	U160604AA	Профиль
2905	U157237AA	Накладка пола водителя
2906	U165370AA	Стенка короба
2907	U154863AA	Стойка крепления отопителя фронтального
2908	U156340AA	Патрубок
2909	U156664AA	Профиль
2910	U150054AA	Профиль
2911	U148381AD	Опора
2912	U163751AA	Пластина
2913	U159301AA	Профиль
2914	U157999AA	Профиль
2915	U155913AA	Стойка
2916	U160539AA	Швеллер
2917	U161154AA	Раскос
2918	U150569AA	Пластина
2919	U156850AB	Швеллер
2920	U159528AC	Облицовка
2921	U161119AA	Ребро
2922	U158784AA	Заглушка
2923	U159341AA	Кронштейн
2924	U155728AB	Обод
2925	U150689AC	Лист
2926	U158404AC	Профиль
2927	U162207AA	Пруток
2928	U158560AB	Накладка
2929	U150817AA	Кронштейн углового редуктора
2930	U150789AA	Пластина
2931	U156218AB	Раскос 20х40х2
2932	U164423AB	Пластина
2933	BMG-U155328AC-001	Cтойка передняя
2934	U148348AC	Лонжерон
2935	U150838AA	Уголок
2936	U149909AA	Профиль
2937	U156873AA	Раскос
2938	U155545AB	Профиль
2939	U155062AB	Накладка
2940	U155454AD	Стенка правая
2941	U159357AA	Швеллер
2942	U158740AB	Стенка
2943	U155504AA	Кронштейн в сборе
2944	U161237AA	Кронштейн в сборе
2945	U158006AA	Профиль в сборе
2946	U158143AA	Накладка
2947	U159527AA	Швеллер
2948	U158376AB	Стойка в сборе
2949	U156839AB	Раскос в сборе
2950	U160205AA	Косынка
2951	U155571AB	Облицовка
2952	U156880AB	Кронштейн
2953	U161144AA	Профиль в сборе
2954	U161492AA	Кронштейн терминала
2955	U152254AA	Пластина закладная
2956	U159909AB	Каркас перегородки
2957	U158995AA	Швеллер
2958	U149155AB	Профиль 50х50х3
2959	U150278AA	Профиль
2960	U154393AA	Швеллер
2961	U154760AA	Кронштейн
2962	U158838AF	Стойка в сборе
2963	U152541AA	Заглушка
2964	U155719AB	Уголок
2965	U150567AA	Накладка
2966	U160853AA	Шайба
2967	U158728AB	Стенка
2968	BMG-U161449AA-000	Cтойка передняя в сборе
2969	U152329AA	Профиль пола опорный
2970	U157105AC	Кронштейн
2971	U163422AA	Усиление пола
2972	U150705AA	Обечайка
2973	U152804AA	Планка
2974	U147827AA	Шпилька приварная M8x20 ISO 13918
2975	U159382AB	Кронштейн
2976	U155654AA	Профиль
2977	U160940-10AA	Заглушка
2978	U156522AC	Стойка в сборе
2979	U157000AA	Ребро
2980	U158697AA	Профиль
2981	U154353AA	Раскос
2982	U158681AA	Профиль
2983	U160036AA	Профиль
2984	U156718AA	Профиль
2985	U165680AA	Панель крепления двери
2986	U150887AB	Кожух
2987	U165355AA	Короб в сборе
2988	U160332AA	Профиль
2989	U160952AA	Ребро
2990	U168820AA	Пластина
2991	U156223AB	Раскос 20х40х2
2992	U159858AE	Верхняя часть пола водителя
2993	U156818AD	Накладка
2994	U158154AA	Раскос 20х40х2
2995	U156823AB	Усиление крепления бачка в сборе
2996	U158863AB	Профиль
2997	U156680AA	Уголок
2998	U155998AE	Накладка
2999	U150985AA	Раскос
3000	U181451AA	Швеллер
3001	U160428AA	Профиль
3002	U156938AB	Кронштейн
3003	U155296AA	Профиль 50х50х3
3004	U169172AA	Дуга в сборе
3005	U156905AB	Раскос
3006	U159896AE	Каркас пола заднего
3007	U161352AD	Каркас пола заднего в сборе
3008	U160256AA	Накладка
3009	U155489AA	Профиль
3010	U155804AC	Облицовка левая
3011	U160004AA	Кронштейн в сборе
3012	U168339AA	Кронштейн кондиционера кабины водителя
3013	U159440AA	Раскос в сборе
3014	U155865AB	Кронштейн огнетушителя
3015	U155810AB	Облицовка люка
3016	U158067AB	Раскос
3017	U150983AA	Стойка
3018	U156848AB	Раскос в сборе
3019	U159329AA	Раскос
3020	U148345AD	Профиль 80х120х5
3021	U154883AC	Втулка
3022	U165030AA	Профиль нижнего проема
3023	U156601-10AA	Накладка
3024	U158785-10AC	Профиль
3025	U156674AA	Пластина
3026	U163317AA	Профиль в сборе
3027	U155197AD	Профиль порога в сборе
3028	U152413AB	Стойка
3029	U160334AA	Профиль
3030	U155210AC	Накладка порога
3031	U155662AA	Кронштейн в сборе
3032	U161105AB	Уголок
3033	U161124AB	Накладка
3034	U152185AC	Накладка
3035	U157343AC	Профиль в сборе
3036	U157367AA	Раскос
3037	U160245AB	Кожух
3038	U158991AB	Проставка
3039	U156816AC	Накладка
3040	U159156AA	Кожух
3041	U152289AA	Раскос
3042	U156967AB	Уголок
3043	U150697AA	Накладка
3044	U159383AA	Пластина
3045	U150707AA	Обечайка в сборе
3046	U158495AB	Кронштейн в сборе
3047	U156910AB	Швеллер
3048	U160380AA	Раскос
3049	U158990AD	Патрубок
3050	U149954-10AB	Кронштейн
3051	U160664AB	Швеллер
3052	U164633AA	Кронштейн кабеля двигателя
3053	U158959AD	Профиль
3054	U159595AB	Уголок
3055	U158551AB	Опора
3056	U156555AB	Профиль
3057	U150408AA	Профиль
3058	U154240AB	Профиль
3059	U157594AA	Накладка
3060	U161366AE	Каркас боковины правой
3061	U159662AA	Кронштейн
3062	U157853AA	Профиль
3063	U152764AA	Раскос
3064	U149558-10AC	Лист передний
3065	U152091AA	Лист герметизации
3066	U152250AD	Опора крепления двери кабины водителя
3067	U157613AB	Профиль
3068	U168384AA	Швеллер
3069	U150922AA	Профиль
3070	U159597AA	Раскос
3071	U151111AD	Бонка
3072	U150767AA	Профиль
3073	U158299AC	Стенка
3074	U160171AA	Стойка в сборе
3075	U152315AA	Кронштейн
3076	U154723AB	Кронштейн
3077	U156409AB	Швеллер правый
3078	U150918AC	Профиль в сборе
3079	U158388AA	Кожух
3080	U161463AC	Облицовка стойки
3081	U148264AA	Профиль
3082	U157332AA	Заглушка
3083	U159164AA	Профиль
3084	U158269AB	Профиль
3085	U160617AA	Профиль
3086	U158977AD	Стойка
3087	U162455AA	Профиль модуля переднего в сборе
3088	U165010AA	Кронштейн крепления отопителя
3089	U159169AA	Накладка
3090	U160302AA	Раскос
3091	U155935AA	Профиль
3092	U154317AD	Кронштейн
3093	U157320AA	Раскос
3094	U152531AA	Накладка
3095	U152458AA	Шайба
3096	U154726AB	Накладка
3097	U163626AA	Косынка
3098	U160163AA	Уголок
3099	U152104AA	Профиль усилительный кронштейна стеклоочистителя
3100	U161078-10AA	Решетка
3101	U159645AA	Раскос
3102	U160645AA	Стойка
3103	U160456AA	Швеллер в сборе
3104	U155502AB	Профиль
3105	U158085AB	Раскос
3106	U158504AA	Кронштейн
3107	U160140AA	Накладка
3108	U157615AB	Профиль
3109	U166056AA	Кронштейн накладки в сборе
3110	U161097AA	Накладка
3111	U150703AA	Накладка
3112	U169500AA	Скоба
3113	U158347AA	Уголок
3114	U150185AA	Стойка
3115	U150033AA	Профиль опорный
3116	U160480AA	Профиль
3117	U159566AB	Профиль
3118	U165132AA	Накладка
3119	U160460AA	Швеллер
3120	U152671AA	Кронштейн
3121	U157807AA	Ребро
3122	U160889AA	Раскос
3123	U155481AB	Облицовка пола
3124	U156691AB	Профиль
3125	U152850AG	Каркас крыши
3126	U159905AC	Каркас подиума задней части
3127	U155178AF	Стойка
3128	U152627AA	Гайка приварная М10 Emile Maurin 6460710
3129	U160801AB	Профиль
3130	U155722AD	Облицовка левая
3131	U152813AA	Опора
3132	U155941AB	Профиль
3133	U157325AA	Профиль
3134	U151063AA	Заглушка
3135	U157371AC	Раскос в сборе
3136	U150830AG	Кожух в сборе
3137	U159814AD	Левая часть каркаса модуля крепления передней подвески
3138	U158713AC	Опора в сборе
3139	U149619AJ	Основание в сборе
3140	U158532AA	Профиль в сборе
3141	U156861AA	Профиль
3142	U156742AA	Ребро
3143	U154296AA	Профиль
3144	U157618AA	Пруток
3145	U150141AA	Раскос
3146	U156845AB	Раскос
3147	U152394AC	Опора крепления двери кабины водителя в сборе
3148	U158835AD	Кронштейн в сборе
3149	U156927AA	Швеллер
3150	U158371AA	Уголок
3151	U155313AB	Профиль
3152	U156955AA	Швеллер
3153	U155155AA	Профиль усилительный
3154	U159717AB	Швеллер
3155	U164957AA	Косынка соединения
3156	U155944AB	Стенка
3157	U164850AA	Ребро в сборе
3158	U154777AB	Короб
3159	U160830AA	Швеллер
3160	U159111AA	Кронштейн фиксации АКБ
3161	U161003AC	Площадка
3162	U164781AA	Стойка в сборе
3163	U152473AA	Заглушка
3164	U157710AA	Заглушка
3165	U159381AC	Кронштейн в сборе
3166	U161150AA	Накладка
3167	BMG-U164860AA-003	Ребро
3168	U160713AA	Скоба в сборе
3169	U164636AA	Кронштейн в сборе
3170	U150679AA	Профиль опорный центральный
3171	U156878AA	Накладка
3172	U155612AB	Профиль
3173	U157681AB	Профиль
3174	U152274AH	Каркас модуля крепления передней подвески
3175	U155037AD	Панель облицовки в сборе
3176	U160705AA	Профиль
3177	U150664AF	Установка облицовки переднего модуля
3178	U159730AB	Швеллер
3179	U160463AC	Лист пола
3180	U152428AA	Кронштейн
3181	U154367AB	Ребро
3182	U160443AB	Раскос
3183	U155051AA	Заглушка
3184	U150280AB	Профиль 50х80х3
3185	U157368AB	Профиль
3186	U161201AA	Уголок
3187	U156224AB	Раскос 20х40х2
3188	U162795AA	Накладка передней двери в сборе
3189	U152125-10AA	Заглушка
3190	U158481AD	Стойка в сборе
3191	U161370AB	Правая боковина
3192	U155920AB	Профиль
3193	U155378AB	Профиль в сборе
3194	U154857AB	Профиль крепления отопителя фронтального
3195	U161478AA	Кронштейн терминала
3196	U157984AA	Профиль
3197	U155921AD	Кронштейн
3198	U158753AA	Кронштейн
3199	U158188AC	Ребро
3200	U156814AC	Усиление крепления бачка в сборе
3201	U163475AC	Кронштейн
3202	U148185AG	Каркас кузова в сборе
3203	U151135AA	Накладка
3204	U150292AA	Раскос 20х40х2
3205	U157317AA	Раскос
3206	U155830AC	Облицовка
3207	U152526AA	Накладка
3208	U161018AA	Лист
3209	U157738AB	Опора
3210	U163293AA	Ребро
3211	U152539AB	Профиль в сборе
3212	U157686AA	Профиль в сборе
3213	U145912AA	Заклепка шестигранная вытяжная резьбовая М5 Bollhoff 343 41 050 055
3214	U155195AB	Обечайка
3215	U155013AA	Стенка
3216	U160344AA	Кронштейн
3217	U156003AA	Профиль передний в сборе
3218	U150332AB	Уголок
3219	U159769AA	Кронштейн
3220	U163747AC	Площадка в сборе
3221	U161085AA	Швеллер
3222	U149217AD	Дуга
3223	U156974AC	Раскос
3224	U159409AA	Лист
3225	U179712AA	Стойка в сборе
3226	U161396AB	Короб в сборе
3227	U152540AJ	Установка приварных элементов модуля заднего
3228	U156757AB	Профиль в сборе
3229	U156012AD	Кронштейн опорный в сборе
3230	U158300AC	Стенка
3231	U154769AA	Кронштейн в сборе
3232	U159256AB	Кронштейн в сборе
3233	N162219AE	Установка скоб
3234	U156801AB	Раскос в сборе
3235	U163190AA	Дуга
3236	U157009AB	Накладка
3237	U155815AD	Накладка
3238	U155192AC	Профиль
3239	U160943AB	Опора
3240	U156759AB	Швеллер в сборе
3241	U157485AC	Профиль в сборе
3242	U157354AA	Раскос в сборе
3243	U157699AB	Профиль в сборе
3244	U154704AE	Короб
3245	U159634AA	Заглушка
3246	U163225AA	Платик
3247	U160896AB	Кронштейн в сборе
3248	U155231AA	Косынка
3249	U156526AB	Профиль
3250	U150682AA	Стойка
3251	U155381AA	Заглушка в сборе
3252	U156805AD	Раскос
3253	U158270AA	Профиль в сборе
3254	U159182AA	Швеллер
3255	U152457AA	Шпилька М12х50
3256	U154486AA	Кронштейн
3257	U159624AA	Проставка
3258	U104749AA	Шпилька опресовочная М6х15
3259	U165149AC	Накладка  передней двери в сборе
3260	U157130AA	Стойка в сборе
3261	U156747AA	Облицовка
3262	BMG-U152514AD-001	Cтойка передняя
3263	U160998AA	Профиль
3264	U159531AA	Накладка
3265	U150839AA	Короб
3266	U159350AA	Кронштейн в сборе
3267	U155534AB	Уголок
3268	U150656AB	Швеллер опорный
3269	U152511AC	Профиль в сборе
3270	U154603AC	Кронштейн в сборе
3271	U158363AC	Раскос в сборе
3272	U155757AB	Панель
3273	U157703AA	Швеллер
3274	U149557-10AB	Лист передний
3275	U152445AA	Раскос
3276	U156720AA	Профиль
3277	U155095AD	Профиль в сборе
3278	U149426AA	Уголок
3279	U160832AA	Профиль крепления отопителя фронтального
3280	U160519AA	Кронштейн
3281	U150632AA	Швеллер
3282	U163072AB	Накладка
3283	U159344AA	Накладка в сборе
3284	U153026AA	Лонжерон
3285	U150708AA	Втулка
3286	U161242AB	Кронштейн в сборе
3287	U160091AA	Заглушка
3288	U157064AB	Кронштейн в сборе
3289	U156983AC	Кронштейн
3290	U157386AA	Раскос
3291	U156854AB	Профиль крепления бачка
3292	U159712AB	Швеллер
3293	U157804AB	Уголок
3294	U159728AB	Швеллер
3295	U149560AC	Уголок
3296	U157874AB	Швеллер
3297	U156844AB	Раскос
3298	U157544AA	Раскос 50х80х3
3299	U157593AA	Профиль
3300	U156191AB	Профиль
3301	U158879AB	Заглушка
3302	U156568AC	Профиль в сборе
3303	U157709AB	Заглушка
3304	U150810AB	Кронштейн
3305	U150901AC	Кронштейн в сборе
3306	U152538AC	Стойка
3307	U152951AA	Раскос
3308	U159170AA	Профиль в сборе
3309	U158151AA	Профиль
3310	U158675AA	Дуга
3311	U152474AH	Приварные элементы каркаса боковины левой
3312	U150766AC	Профиль в сборе
3313	U160929AA	Накладка
3314	U156168AB	Раскос
3315	U157227AC	Профиль 40х40х3
3316	U149290AB	Плита
3317	U159608AA	Пластина
3318	U156463AB	Профиль в сборе
3319	U152296-10AA	Кронштейн
3320	U157595AB	Дно
3321	U155339AC	Опора в сборе
3322	U104800AB	Идентификационная табличка кузова
3323	U155052AA	Заглушка
3324	U158311AC	Профиль
3325	U158997AB	Проставка
3326	U160005AA	Кронштейн
3327	U155496AA	Швеллер
3328	U150655AB	Швеллер опорный
3329	U155893AB	Кронштейн огнетушителя
3330	U155846AB	Профиль в сборе
3331	U157871AA	Профиль
3332	U152852AG	Установка приварных элементов каркаса крыши
3333	U160477AB	Лента хомута
3334	U150768AC	Кронштейн двигателя угловой левый в сборе
3335	U160095AF	Опора изоляции
3336	U152705AC	Кронштейн двигателя правый в сборе
3337	U173478AB	Рама маршрутоуказателя
3338	U161507AB	Панель в сборе
3339	U146795AB	Кронштейн пульта управления в сборе
3340	U158591AD	Панель
3341	U156830AB	Кронштейн левого профиля
3342	U166141AA	Лючок топливного бака в сборе
3343	U102842AD	Рама решетки радиатора в сборе
3344	U153041AC	Опора в сборе
3345	U163771AA	Кожух защитный
3346	U160930AB	Отсек водителя в сборе
3347	U148859AB	Швеллер в сборе
3348	U176035AA	Крышка маршрутоуказателя
3349	U156723AA	Кронштейн в сборе
3350	U160972AA	Кронштейн
3351	U153935AA	Опора в сборе
3352	U158606AD	Панель
3353	U161107AE	Желоб в сборе
3354	U164351AB	Кронштейн розетки в сборе
3355	U164393AC	Короб воздуховода
3356	U155029AC	Уголок в сборе
3357	U157319AA	Кронштейн
3358	U161805AB	Опорная стойка IT3
3359	U152689AC	Кронштейн двигателя левый в сборе
3360	U159701AC	Передний воздухозаборник
3361	U173919AA	Облицовка под маршрутоуказатель
3362	U164601AB	Опора в сборе
3363	U177438AA	Колодка задняя
3364	U156002AE	Крышка в сборе
3365	U157304AD	Кронштейн
3366	U156819AA	Кронштейн в сборе
3367	U153891AC	Кронштейн
3368	U156460AB	Лоток в сборе
3369	U173497AA	Рама маршрутоуказателя съемная
3370	U156144AA	Кронштейн
3371	U164582AA	Кронштейн радиоприемника в сборе
3372	U150742AC	Кронштейн двигателя правый в сборе
3373	U173677AA	Облицовка в сборе
3374	U157303AC	Кронштейн батареи
3375	U160689AA	Опора в сборе
3376	U156486AB	Крепление
3377	U177436AA	Лыжа задняя
3378	U156935AD	Кожух
3379	U111069AA	Профиль вертикальный боковой
3380	U163808AE	Кронштейн ZTS в сборе
3381	U156426AB	Панель
3382	U156932AK	Опора отопителя в сборе
3383	U159757AC	Планка
3384	U157791AC	Стойка в сборе
3385	U111282AA	Профиль вертикальный боковой
3386	U154401AB	Кронштейн дверной
3387	U157923AD	Планка для предупреждения врезания
3388	U160290AA	Каркас рамы в сборе
3389	U159764AB	Кронштейн в сборе
3390	U158517AA	Лоток батареи в сборе
3391	U167037-10AA	Лист люка
3392	U164538AA	Лоток коммуникаций в сборе
3393	U164543AA 	Крышка лотка
3394	 U155997AB	Крышка лотка
3395	U156887-10AB	 Кожух в сборе
3396	U153882AB	Кронштейн поддержки
3397	U154252AB	Кронштейн поддержки
3398	U154213AB	Кронштейн центральной крышки
3399	U154217AB	Кронштейн центральной крышки
\.


--
-- Data for Name: defects_photodefects; Type: TABLE DATA; Schema: public; Owner: bollore
--

COPY public.defects_photodefects (id, photo, uploaded_at, defect_id) FROM stdin;
\.


--
-- Data for Name: defects_priority; Type: TABLE DATA; Schema: public; Owner: bollore
--

COPY public.defects_priority (id, priority_status) FROM stdin;
1	Низкий
2	Средний
3	Высокий
4	Срочный
\.


--
-- Data for Name: defects_probabilityestimate; Type: TABLE DATA; Schema: public; Owner: bollore
--

COPY public.defects_probabilityestimate (id, score, description) FROM stdin;
1	1	Крайне маловероятно
2	2	Маловероятно
3	3	Возможно
5	5	Практически достоверно
4	4	Весьма вероятно
\.


--
-- Data for Name: defects_scaleofconsequences; Type: TABLE DATA; Schema: public; Owner: bollore
--

COPY public.defects_scaleofconsequences (id, score, description) FROM stdin;
1	1	Незначительный риск
2	2	Небольшой риск
3	3	Средний риск
4	4	Высокий риск
5	5	Крайне высокий риск
\.


--
-- Data for Name: defects_status; Type: TABLE DATA; Schema: public; Owner: bollore
--

COPY public.defects_status (id, defect_status) FROM stdin;
1	Обнаружен дефект
2	Дефект устранен
3	Дефект с допуском к производству
4	Брак
\.


--
-- Data for Name: defects_typeofmismatch; Type: TABLE DATA; Schema: public; Owner: bollore
--

COPY public.defects_typeofmismatch (id, mismatch, probability_estimate_id, scale_consequences_id) FROM stdin;
2	Деталь не соответствует КД	3	5
3	Деталь приварена не по КД	3	5
5	Не выдержан линейный размер	4	3
6	Не зачищен сварной шов	4	2
7	Несоответствие CF размера	4	5
8	Отсутствие детали, заклепки, гайки	4	5
9	Отсутствие сварного шва, лишний сварной шов	3	5
10	Приварена не та деталь	3	5
11	Сварочные дефекты	5	2
12	Крыша сверху. Дефекты ЛКП	3	3
13	Салон, боковины, основание. Непрокрасы	5	2
14	Основание. Недостаточная толщина антигравия	2	4
15	Пол сверху. Дефекты герметизации	2	3
1	Брызги от сварки	5	1
4	Механические повреждения на детали	3	4
\.


--
-- Data for Name: defects_workshops; Type: TABLE DATA; Schema: public; Owner: bollore
--

COPY public.defects_workshops (id, name_workshop, responsible_executor_id) FROM stdin;
1	Заготовительный цех	12
2	Кузовной цех	11
3	Цех окраски	14
4	Экспериментальный цех	13
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: bollore
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-10-03 12:30:13.35677+03	1	Крайне маловероятно - 1	1	[{"added": {}}]	11	1
2	2021-10-03 12:30:22.672116+03	2	Маловероятно - 2	1	[{"added": {}}]	11	1
3	2021-10-03 12:30:30.278398+03	3	Возможно - 3	1	[{"added": {}}]	11	1
4	2021-10-03 12:30:40.285157+03	4	Маловероятно - 4	1	[{"added": {}}]	11	1
5	2021-10-03 12:30:56.961567+03	5	Практически достоверно - 5	1	[{"added": {}}]	11	1
6	2021-10-03 12:31:09.240045+03	4	Весьма вероятно - 4	2	[{"changed": {"fields": ["\\u041e\\u0446\\u0435\\u043d\\u043a\\u0430"]}}]	11	1
7	2021-10-03 12:31:28.946653+03	1	Незначительный риск - 1	1	[{"added": {}}]	12	1
8	2021-10-03 12:31:35.6029+03	2	Небольшой риск - 2	1	[{"added": {}}]	12	1
9	2021-10-03 12:31:44.339757+03	3	Средний риск - 3	1	[{"added": {}}]	12	1
10	2021-10-03 12:31:52.990041+03	4	Высокий риск - 4	1	[{"added": {}}]	12	1
11	2021-10-03 12:32:02.8512+03	5	Крайне высокий риск - 5	1	[{"added": {}}]	12	1
12	2021-10-03 12:32:26.830065+03	1	Низкий	1	[{"added": {}}]	10	1
13	2021-10-03 12:32:31.370487+03	2	Средний	1	[{"added": {}}]	10	1
14	2021-10-03 12:32:36.031044+03	3	Высокий	1	[{"added": {}}]	10	1
15	2021-10-03 12:32:39.890031+03	4	Срочный	1	[{"added": {}}]	10	1
16	2021-10-03 12:32:59.73172+03	1	Обнаружен дефект	1	[{"added": {}}]	13	1
17	2021-10-03 12:33:05.161661+03	2	Дефект устранен	1	[{"added": {}}]	13	1
18	2021-10-03 12:33:11.988007+03	3	Дефект с допуском к производству	1	[{"added": {}}]	13	1
19	2021-10-03 12:33:16.645858+03	4	Брак	1	[{"added": {}}]	13	1
20	2021-10-03 12:40:59.364705+03	1	Брызги от сварки	1	[{"added": {}}]	15	1
21	2021-10-03 12:41:25.507901+03	2	Деталь не соответствует КД	1	[{"added": {}}]	15	1
22	2021-10-03 12:41:39.455651+03	3	Деталь приварена не по КД	1	[{"added": {}}]	15	1
23	2021-10-03 12:41:56.118446+03	4	Механические повреждения на детали	1	[{"added": {}}]	15	1
24	2021-10-03 12:42:12.536918+03	5	Не выдержан линейный размер	1	[{"added": {}}]	15	1
25	2021-10-03 12:42:27.329181+03	6	Не зачищен сварной шов	1	[{"added": {}}]	15	1
26	2021-10-03 12:44:49.88147+03	7	Несоответствие CF размера	1	[{"added": {}}]	15	1
27	2021-10-03 12:45:03.74233+03	8	Отсутствие детали, заклепки, гайки	1	[{"added": {}}]	15	1
28	2021-10-03 12:45:17.100776+03	9	Отсутствие сварного шва, лишний сварной шов	1	[{"added": {}}]	15	1
29	2021-10-03 12:45:30.818701+03	10	Приварена не та деталь	1	[{"added": {}}]	15	1
30	2021-10-03 12:45:42.085776+03	11	Сварочные дефекты	1	[{"added": {}}]	15	1
31	2021-10-03 12:45:53.402632+03	12	Крыша сверху. Дефекты ЛКП	1	[{"added": {}}]	15	1
32	2021-10-03 12:46:06.458+03	13	Салон, боковины, основание. Непрокрасы	1	[{"added": {}}]	15	1
33	2021-10-03 12:46:23.827957+03	14	Основание. Недостаточная толщина антигравия	1	[{"added": {}}]	15	1
34	2021-10-03 12:46:36.262928+03	15	Пол сверху. Дефекты герметизации	1	[{"added": {}}]	15	1
35	2021-10-03 12:46:41.796197+03	1	Брызги от сварки	2	[]	15	1
36	2021-10-03 12:46:46.77565+03	4	Механические повреждения на детали	2	[]	15	1
37	2021-10-03 12:47:40.220987+03	1	Control Inspectors	1	[{"added": {}}]	3	1
38	2021-10-03 12:47:48.541403+03	2	Responsible Executors	1	[{"added": {}}]	3	1
39	2021-10-03 13:09:59.158368+03	2	a.kuzovlev	1	[{"added": {}}]	4	1
40	2021-10-03 13:10:19.75973+03	3	a.grigoriev	1	[{"added": {}}]	4	1
41	2021-10-03 13:10:45.428066+03	4	novitskyv	1	[{"added": {}}]	4	1
42	2021-10-03 13:10:59.924308+03	5	lsv	1	[{"added": {}}]	4	1
43	2021-10-03 13:11:16.356196+03	6	a.malysheva	1	[{"added": {}}]	4	1
44	2021-10-03 13:11:30.670361+03	7	a.shirokov	1	[{"added": {}}]	4	1
45	2021-10-03 13:12:34.726766+03	8	tnv	1	[{"added": {}}]	4	1
46	2021-10-03 13:12:51.386099+03	9	y.pysina	1	[{"added": {}}]	4	1
47	2021-10-03 13:13:12.098324+03	10	i.gorshkova	1	[{"added": {}}]	4	1
48	2021-10-03 13:13:30.709928+03	11	d.bichenok	1	[{"added": {}}]	4	1
49	2021-10-03 13:13:44.842974+03	12	i.kulakova	1	[{"added": {}}]	4	1
50	2021-10-03 13:14:00.283131+03	13	s.klachkov	1	[{"added": {}}]	4	1
51	2021-10-03 13:14:14.438896+03	14	a.zaicev	1	[{"added": {}}]	4	1
52	2021-10-03 13:14:51.42449+03	14	a.zaicev	2	[{"changed": {"fields": ["First name", "Last name", "Email address", "Groups"]}}]	4	1
53	2021-10-03 13:15:20.735131+03	3	a.grigoriev	2	[{"changed": {"fields": ["First name", "Last name", "Email address"]}}]	4	1
54	2021-10-03 13:15:44.998278+03	2	a.kuzovlev	2	[{"changed": {"fields": ["First name", "Last name", "Email address"]}}]	4	1
55	2021-10-03 13:16:15.587714+03	6	a.malysheva	2	[{"changed": {"fields": ["First name", "Last name", "Email address", "Groups"]}}]	4	1
56	2021-10-03 13:16:40.890728+03	7	a.shirokov	2	[{"changed": {"fields": ["First name", "Last name", "Email address"]}}]	4	1
57	2021-10-03 13:17:10.376732+03	11	d.bichenok	2	[{"changed": {"fields": ["First name", "Last name", "Email address", "Groups"]}}]	4	1
58	2021-10-03 13:19:01.477591+03	10	i.gorshkova	2	[{"changed": {"fields": ["First name", "Last name", "Email address", "Groups"]}}]	4	1
59	2021-10-03 13:19:46.376868+03	12	i.kulakova	2	[{"changed": {"fields": ["First name", "Last name", "Email address", "Groups"]}}]	4	1
60	2021-10-03 13:20:19.817498+03	5	lsv	2	[{"changed": {"fields": ["First name", "Last name", "Email address"]}}]	4	1
61	2021-10-03 13:20:43.982567+03	4	novitskyv	2	[{"changed": {"fields": ["First name", "Last name", "Email address"]}}]	4	1
62	2021-10-03 13:21:27.970836+03	13	s.klachkov	2	[{"changed": {"fields": ["First name", "Last name", "Email address", "Groups"]}}]	4	1
63	2021-10-03 13:21:52.056446+03	8	tnv	2	[{"changed": {"fields": ["First name", "Last name", "Email address"]}}]	4	1
64	2021-10-03 13:22:17.918735+03	9	y.pysina	2	[{"changed": {"fields": ["First name", "Last name", "Email address", "Groups"]}}]	4	1
65	2021-10-03 13:23:57.473032+03	15	t.mirzaeva	1	[{"added": {}}]	4	1
66	2021-10-03 13:24:22.428613+03	15	t.mirzaeva	2	[{"changed": {"fields": ["First name", "Last name", "Groups"]}}]	4	1
67	2021-10-03 13:25:15.922139+03	16	e.tsvetkova	1	[{"added": {}}]	4	1
68	2021-10-03 13:25:28.868235+03	16	e.tsvetkova	2	[{"changed": {"fields": ["First name", "Last name", "Groups"]}}]	4	1
69	2021-10-03 13:27:04.691541+03	1	Заготовительный цех	1	[{"added": {}}]	14	1
70	2021-10-03 13:27:15.472384+03	2	Кузовной цех	1	[{"added": {}}]	14	1
71	2021-10-03 13:27:32.14188+03	3	Цех окраски	1	[{"added": {}}]	14	1
72	2021-10-03 13:27:50.096214+03	4	Экспериментальный цех	1	[{"added": {}}]	14	1
73	2021-10-03 13:30:01.726249+03	1	rsg	2	[{"changed": {"fields": ["Groups"]}}]	4	1
74	2021-10-03 13:50:13.582709+03	1	rsg	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: bollore
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	defects	bodies
8	defects	defects
9	defects	details
10	defects	priority
11	defects	probabilityestimate
12	defects	scaleofconsequences
13	defects	status
14	defects	workshops
15	defects	typeofmismatch
16	defects	photodefects
17	defects	comments
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: bollore
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-10-03 11:34:11.121426+03
2	auth	0001_initial	2021-10-03 11:34:11.167814+03
3	admin	0001_initial	2021-10-03 11:34:11.181379+03
4	admin	0002_logentry_remove_auto_add	2021-10-03 11:34:11.186824+03
5	admin	0003_logentry_add_action_flag_choices	2021-10-03 11:34:11.192348+03
6	contenttypes	0002_remove_content_type_name	2021-10-03 11:34:11.203891+03
7	auth	0002_alter_permission_name_max_length	2021-10-03 11:34:11.210716+03
8	auth	0003_alter_user_email_max_length	2021-10-03 11:34:11.216377+03
9	auth	0004_alter_user_username_opts	2021-10-03 11:34:11.221732+03
10	auth	0005_alter_user_last_login_null	2021-10-03 11:34:11.227285+03
11	auth	0006_require_contenttypes_0002	2021-10-03 11:34:11.228563+03
12	auth	0007_alter_validators_add_error_messages	2021-10-03 11:34:11.233977+03
13	auth	0008_alter_user_username_max_length	2021-10-03 11:34:11.24177+03
14	auth	0009_alter_user_last_name_max_length	2021-10-03 11:34:11.247844+03
15	auth	0010_alter_group_name_max_length	2021-10-03 11:34:11.254121+03
16	auth	0011_update_proxy_permissions	2021-10-03 11:34:11.260763+03
17	auth	0012_alter_user_first_name_max_length	2021-10-03 11:34:11.266423+03
18	defects	0001_initial	2021-10-03 11:34:11.407965+03
19	defects	0002_auto_20211003_1134	2021-10-03 11:34:11.464087+03
20	sessions	0001_initial	2021-10-03 11:34:11.472224+03
21	defects	0003_alter_probabilityestimate_options	2021-10-03 12:38:20.542009+03
22	defects	0004_alter_probabilityestimate_options	2021-10-03 12:39:14.021586+03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: bollore
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
o8gvkot6nswbxwjlzq96k4nwfmk0zc2w	.eJxVjDsOwjAQRO_iGllrsv5R0nMGy581DiBbipMKcXccKQU0U8x7M2_m_LYWt3Va3JzYhQl2-u2Cj0-qO0gPX--Nx1bXZQ58V_hBO7-1RK_r4f4dFN_LWEcFKUsUXucRgCFhMCBinsiqpKzMZ5vVQAQmBqtACgCJRhMa1JNkny_gqjcV:1mWxMI:CgpJa0QD4BE4fLNzPW2E6Ysi7D55XRfGTqwmKQfIgDI	2021-10-17 12:00:34.349075+03
udaumiww5b46xjkefuqyd24b1ts9kkd6	.eJxVjDsOwjAQRO_iGllrsv5R0nMGy581DiBbipMKcXccKQU0U8x7M2_m_LYWt3Va3JzYhQl2-u2Cj0-qO0gPX--Nx1bXZQ58V_hBO7-1RK_r4f4dFN_LWEcFKUsUXucRgCFhMCBinsiqpKzMZ5vVQAQmBqtACgCJRhMa1JNkny_gqjcV:1mWxoW:3h33gdafF3XWWnR_kKe4mscqYAD-Rvfg2XqmOoq0_R0	2021-10-17 12:29:44.287174+03
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bollore
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 2, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bollore
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bollore
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 68, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bollore
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 10, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bollore
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 16, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bollore
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: defects_bodies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bollore
--

SELECT pg_catalog.setval('public.defects_bodies_id_seq', 119, true);


--
-- Name: defects_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bollore
--

SELECT pg_catalog.setval('public.defects_comments_id_seq', 1, false);


--
-- Name: defects_defects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bollore
--

SELECT pg_catalog.setval('public.defects_defects_id_seq', 1, false);


--
-- Name: defects_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bollore
--

SELECT pg_catalog.setval('public.defects_details_id_seq', 3399, true);


--
-- Name: defects_photodefects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bollore
--

SELECT pg_catalog.setval('public.defects_photodefects_id_seq', 1, false);


--
-- Name: defects_priority_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bollore
--

SELECT pg_catalog.setval('public.defects_priority_id_seq', 4, true);


--
-- Name: defects_probabilityestimate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bollore
--

SELECT pg_catalog.setval('public.defects_probabilityestimate_id_seq', 5, true);


--
-- Name: defects_scaleofconsequences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bollore
--

SELECT pg_catalog.setval('public.defects_scaleofconsequences_id_seq', 5, true);


--
-- Name: defects_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bollore
--

SELECT pg_catalog.setval('public.defects_status_id_seq', 4, true);


--
-- Name: defects_typeofmismatch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bollore
--

SELECT pg_catalog.setval('public.defects_typeofmismatch_id_seq', 15, true);


--
-- Name: defects_workshops_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bollore
--

SELECT pg_catalog.setval('public.defects_workshops_id_seq', 4, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bollore
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 74, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bollore
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 17, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bollore
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 22, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: defects_bodies defects_bodies_body_number_key; Type: CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_bodies
    ADD CONSTRAINT defects_bodies_body_number_key UNIQUE (body_number);


--
-- Name: defects_bodies defects_bodies_pkey; Type: CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_bodies
    ADD CONSTRAINT defects_bodies_pkey PRIMARY KEY (id);


--
-- Name: defects_comments defects_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_comments
    ADD CONSTRAINT defects_comments_pkey PRIMARY KEY (id);


--
-- Name: defects_defects defects_defects_pkey; Type: CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_defects
    ADD CONSTRAINT defects_defects_pkey PRIMARY KEY (id);


--
-- Name: defects_details defects_details_article_key; Type: CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_details
    ADD CONSTRAINT defects_details_article_key UNIQUE (article);


--
-- Name: defects_details defects_details_pkey; Type: CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_details
    ADD CONSTRAINT defects_details_pkey PRIMARY KEY (id);


--
-- Name: defects_photodefects defects_photodefects_pkey; Type: CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_photodefects
    ADD CONSTRAINT defects_photodefects_pkey PRIMARY KEY (id);


--
-- Name: defects_priority defects_priority_pkey; Type: CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_priority
    ADD CONSTRAINT defects_priority_pkey PRIMARY KEY (id);


--
-- Name: defects_probabilityestimate defects_probabilityestimate_pkey; Type: CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_probabilityestimate
    ADD CONSTRAINT defects_probabilityestimate_pkey PRIMARY KEY (id);


--
-- Name: defects_scaleofconsequences defects_scaleofconsequences_pkey; Type: CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_scaleofconsequences
    ADD CONSTRAINT defects_scaleofconsequences_pkey PRIMARY KEY (id);


--
-- Name: defects_status defects_status_pkey; Type: CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_status
    ADD CONSTRAINT defects_status_pkey PRIMARY KEY (id);


--
-- Name: defects_typeofmismatch defects_typeofmismatch_pkey; Type: CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_typeofmismatch
    ADD CONSTRAINT defects_typeofmismatch_pkey PRIMARY KEY (id);


--
-- Name: defects_workshops defects_workshops_pkey; Type: CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_workshops
    ADD CONSTRAINT defects_workshops_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: bollore
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: bollore
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: bollore
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: bollore
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: bollore
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: bollore
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: bollore
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: bollore
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: bollore
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: defects_bodies_body_number_3780c17a_like; Type: INDEX; Schema: public; Owner: bollore
--

CREATE INDEX defects_bodies_body_number_3780c17a_like ON public.defects_bodies USING btree (body_number varchar_pattern_ops);


--
-- Name: defects_comments_author_id_c95467bb; Type: INDEX; Schema: public; Owner: bollore
--

CREATE INDEX defects_comments_author_id_c95467bb ON public.defects_comments USING btree (author_id);


--
-- Name: defects_comments_defect_id_b2ed1f68; Type: INDEX; Schema: public; Owner: bollore
--

CREATE INDEX defects_comments_defect_id_b2ed1f68 ON public.defects_comments USING btree (defect_id);


--
-- Name: defects_defects_body_number_id_acfa2b8b; Type: INDEX; Schema: public; Owner: bollore
--

CREATE INDEX defects_defects_body_number_id_acfa2b8b ON public.defects_defects USING btree (body_number_id);


--
-- Name: defects_defects_detail_id_4ce7820b; Type: INDEX; Schema: public; Owner: bollore
--

CREATE INDEX defects_defects_detail_id_4ce7820b ON public.defects_defects USING btree (detail_id);


--
-- Name: defects_defects_priority_id_7c57cbfc; Type: INDEX; Schema: public; Owner: bollore
--

CREATE INDEX defects_defects_priority_id_7c57cbfc ON public.defects_defects USING btree (priority_id);


--
-- Name: defects_defects_quality_controller_id_9c10eee9; Type: INDEX; Schema: public; Owner: bollore
--

CREATE INDEX defects_defects_quality_controller_id_9c10eee9 ON public.defects_defects USING btree (quality_controller_id);


--
-- Name: defects_defects_responsible_executor_id_75596e44; Type: INDEX; Schema: public; Owner: bollore
--

CREATE INDEX defects_defects_responsible_executor_id_75596e44 ON public.defects_defects USING btree (responsible_executor_id);


--
-- Name: defects_defects_status_id_75d4901f; Type: INDEX; Schema: public; Owner: bollore
--

CREATE INDEX defects_defects_status_id_75d4901f ON public.defects_defects USING btree (status_id);


--
-- Name: defects_defects_type_of_discrepancy_id_d40f5e18; Type: INDEX; Schema: public; Owner: bollore
--

CREATE INDEX defects_defects_type_of_discrepancy_id_d40f5e18 ON public.defects_defects USING btree (type_of_discrepancy_id);


--
-- Name: defects_defects_workshop_id_0a3c4502; Type: INDEX; Schema: public; Owner: bollore
--

CREATE INDEX defects_defects_workshop_id_0a3c4502 ON public.defects_defects USING btree (workshop_id);


--
-- Name: defects_details_article_22c4947a_like; Type: INDEX; Schema: public; Owner: bollore
--

CREATE INDEX defects_details_article_22c4947a_like ON public.defects_details USING btree (article varchar_pattern_ops);


--
-- Name: defects_photodefects_defect_id_7779b7dd; Type: INDEX; Schema: public; Owner: bollore
--

CREATE INDEX defects_photodefects_defect_id_7779b7dd ON public.defects_photodefects USING btree (defect_id);


--
-- Name: defects_typeofmismatch_probability_estimate_id_bca0bcae; Type: INDEX; Schema: public; Owner: bollore
--

CREATE INDEX defects_typeofmismatch_probability_estimate_id_bca0bcae ON public.defects_typeofmismatch USING btree (probability_estimate_id);


--
-- Name: defects_typeofmismatch_scale_consequences_id_5a0ed394; Type: INDEX; Schema: public; Owner: bollore
--

CREATE INDEX defects_typeofmismatch_scale_consequences_id_5a0ed394 ON public.defects_typeofmismatch USING btree (scale_consequences_id);


--
-- Name: defects_workshops_responsible_executor_id_55ca3f9d; Type: INDEX; Schema: public; Owner: bollore
--

CREATE INDEX defects_workshops_responsible_executor_id_55ca3f9d ON public.defects_workshops USING btree (responsible_executor_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: bollore
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: bollore
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: bollore
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: bollore
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: defects_comments defects_comments_author_id_c95467bb_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_comments
    ADD CONSTRAINT defects_comments_author_id_c95467bb_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: defects_comments defects_comments_defect_id_b2ed1f68_fk_defects_defects_id; Type: FK CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_comments
    ADD CONSTRAINT defects_comments_defect_id_b2ed1f68_fk_defects_defects_id FOREIGN KEY (defect_id) REFERENCES public.defects_defects(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: defects_defects defects_defects_body_number_id_acfa2b8b_fk_defects_bodies_id; Type: FK CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_defects
    ADD CONSTRAINT defects_defects_body_number_id_acfa2b8b_fk_defects_bodies_id FOREIGN KEY (body_number_id) REFERENCES public.defects_bodies(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: defects_defects defects_defects_detail_id_4ce7820b_fk_defects_details_id; Type: FK CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_defects
    ADD CONSTRAINT defects_defects_detail_id_4ce7820b_fk_defects_details_id FOREIGN KEY (detail_id) REFERENCES public.defects_details(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: defects_defects defects_defects_priority_id_7c57cbfc_fk_defects_priority_id; Type: FK CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_defects
    ADD CONSTRAINT defects_defects_priority_id_7c57cbfc_fk_defects_priority_id FOREIGN KEY (priority_id) REFERENCES public.defects_priority(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: defects_defects defects_defects_quality_controller_id_9c10eee9_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_defects
    ADD CONSTRAINT defects_defects_quality_controller_id_9c10eee9_fk_auth_user_id FOREIGN KEY (quality_controller_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: defects_defects defects_defects_responsible_executor_75596e44_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_defects
    ADD CONSTRAINT defects_defects_responsible_executor_75596e44_fk_auth_user FOREIGN KEY (responsible_executor_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: defects_defects defects_defects_status_id_75d4901f_fk_defects_status_id; Type: FK CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_defects
    ADD CONSTRAINT defects_defects_status_id_75d4901f_fk_defects_status_id FOREIGN KEY (status_id) REFERENCES public.defects_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: defects_defects defects_defects_type_of_discrepancy__d40f5e18_fk_defects_t; Type: FK CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_defects
    ADD CONSTRAINT defects_defects_type_of_discrepancy__d40f5e18_fk_defects_t FOREIGN KEY (type_of_discrepancy_id) REFERENCES public.defects_typeofmismatch(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: defects_defects defects_defects_workshop_id_0a3c4502_fk_defects_workshops_id; Type: FK CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_defects
    ADD CONSTRAINT defects_defects_workshop_id_0a3c4502_fk_defects_workshops_id FOREIGN KEY (workshop_id) REFERENCES public.defects_workshops(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: defects_photodefects defects_photodefects_defect_id_7779b7dd_fk_defects_defects_id; Type: FK CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_photodefects
    ADD CONSTRAINT defects_photodefects_defect_id_7779b7dd_fk_defects_defects_id FOREIGN KEY (defect_id) REFERENCES public.defects_defects(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: defects_typeofmismatch defects_typeofmismat_probability_estimate_bca0bcae_fk_defects_p; Type: FK CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_typeofmismatch
    ADD CONSTRAINT defects_typeofmismat_probability_estimate_bca0bcae_fk_defects_p FOREIGN KEY (probability_estimate_id) REFERENCES public.defects_probabilityestimate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: defects_typeofmismatch defects_typeofmismat_scale_consequences_i_5a0ed394_fk_defects_s; Type: FK CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_typeofmismatch
    ADD CONSTRAINT defects_typeofmismat_scale_consequences_i_5a0ed394_fk_defects_s FOREIGN KEY (scale_consequences_id) REFERENCES public.defects_scaleofconsequences(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: defects_workshops defects_workshops_responsible_executor_55ca3f9d_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.defects_workshops
    ADD CONSTRAINT defects_workshops_responsible_executor_55ca3f9d_fk_auth_user FOREIGN KEY (responsible_executor_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: bollore
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

