--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

-- Started on 2019-05-22 11:12:36 -03

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
-- TOC entry 1 (class 3079 OID 13043)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3168 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 211 (class 1259 OID 17627)
-- Name: accounts_novasenha; Type: TABLE; Schema: public; Owner: tcc_user
--

CREATE TABLE public.accounts_novasenha (
    id integer NOT NULL,
    key character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    confirmed boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.accounts_novasenha OWNER TO tcc_user;

--
-- TOC entry 210 (class 1259 OID 17625)
-- Name: accounts_novasenha_id_seq; Type: SEQUENCE; Schema: public; Owner: tcc_user
--

CREATE SEQUENCE public.accounts_novasenha_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_novasenha_id_seq OWNER TO tcc_user;

--
-- TOC entry 3169 (class 0 OID 0)
-- Dependencies: 210
-- Name: accounts_novasenha_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tcc_user
--

ALTER SEQUENCE public.accounts_novasenha_id_seq OWNED BY public.accounts_novasenha.id;


--
-- TOC entry 213 (class 1259 OID 17637)
-- Name: accounts_perfil; Type: TABLE; Schema: public; Owner: tcc_user
--

CREATE TABLE public.accounts_perfil (
    id integer NOT NULL,
    descricao character varying(100) NOT NULL,
    nivel_acesso character varying(6) NOT NULL
);


ALTER TABLE public.accounts_perfil OWNER TO tcc_user;

--
-- TOC entry 212 (class 1259 OID 17635)
-- Name: accounts_perfil_id_seq; Type: SEQUENCE; Schema: public; Owner: tcc_user
--

CREATE SEQUENCE public.accounts_perfil_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_perfil_id_seq OWNER TO tcc_user;

--
-- TOC entry 3170 (class 0 OID 0)
-- Dependencies: 212
-- Name: accounts_perfil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tcc_user
--

ALTER SEQUENCE public.accounts_perfil_id_seq OWNED BY public.accounts_perfil.id;


--
-- TOC entry 215 (class 1259 OID 17647)
-- Name: accounts_titulo; Type: TABLE; Schema: public; Owner: tcc_user
--

CREATE TABLE public.accounts_titulo (
    id integer NOT NULL,
    descricao character varying(100) NOT NULL
);


ALTER TABLE public.accounts_titulo OWNER TO tcc_user;

--
-- TOC entry 214 (class 1259 OID 17645)
-- Name: accounts_titulo_id_seq; Type: SEQUENCE; Schema: public; Owner: tcc_user
--

CREATE SEQUENCE public.accounts_titulo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_titulo_id_seq OWNER TO tcc_user;

--
-- TOC entry 3171 (class 0 OID 0)
-- Dependencies: 214
-- Name: accounts_titulo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tcc_user
--

ALTER SEQUENCE public.accounts_titulo_id_seq OWNED BY public.accounts_titulo.id;


--
-- TOC entry 207 (class 1259 OID 17606)
-- Name: accounts_usuario; Type: TABLE; Schema: public; Owner: tcc_user
--

CREATE TABLE public.accounts_usuario (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(254) NOT NULL,
    name character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    is_staff boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    perfil_id integer NOT NULL,
    titulo_id integer NOT NULL
);


ALTER TABLE public.accounts_usuario OWNER TO tcc_user;

--
-- TOC entry 209 (class 1259 OID 17619)
-- Name: accounts_usuario_groups; Type: TABLE; Schema: public; Owner: tcc_user
--

CREATE TABLE public.accounts_usuario_groups (
    id integer NOT NULL,
    usuario_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.accounts_usuario_groups OWNER TO tcc_user;

--
-- TOC entry 208 (class 1259 OID 17617)
-- Name: accounts_usuario_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: tcc_user
--

CREATE SEQUENCE public.accounts_usuario_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_usuario_groups_id_seq OWNER TO tcc_user;

--
-- TOC entry 3172 (class 0 OID 0)
-- Dependencies: 208
-- Name: accounts_usuario_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tcc_user
--

ALTER SEQUENCE public.accounts_usuario_groups_id_seq OWNED BY public.accounts_usuario_groups.id;


--
-- TOC entry 206 (class 1259 OID 17604)
-- Name: accounts_usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: tcc_user
--

CREATE SEQUENCE public.accounts_usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_usuario_id_seq OWNER TO tcc_user;

--
-- TOC entry 3173 (class 0 OID 0)
-- Dependencies: 206
-- Name: accounts_usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tcc_user
--

ALTER SEQUENCE public.accounts_usuario_id_seq OWNED BY public.accounts_usuario.id;


--
-- TOC entry 217 (class 1259 OID 17657)
-- Name: accounts_usuario_user_permissions; Type: TABLE; Schema: public; Owner: tcc_user
--

CREATE TABLE public.accounts_usuario_user_permissions (
    id integer NOT NULL,
    usuario_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.accounts_usuario_user_permissions OWNER TO tcc_user;

--
-- TOC entry 216 (class 1259 OID 17655)
-- Name: accounts_usuario_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: tcc_user
--

CREATE SEQUENCE public.accounts_usuario_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_usuario_user_permissions_id_seq OWNER TO tcc_user;

--
-- TOC entry 3174 (class 0 OID 0)
-- Dependencies: 216
-- Name: accounts_usuario_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tcc_user
--

ALTER SEQUENCE public.accounts_usuario_user_permissions_id_seq OWNED BY public.accounts_usuario_user_permissions.id;


--
-- TOC entry 203 (class 1259 OID 17565)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: tcc_user
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO tcc_user;

--
-- TOC entry 202 (class 1259 OID 17563)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: tcc_user
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO tcc_user;

--
-- TOC entry 3175 (class 0 OID 0)
-- Dependencies: 202
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tcc_user
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 205 (class 1259 OID 17575)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: tcc_user
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO tcc_user;

--
-- TOC entry 204 (class 1259 OID 17573)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: tcc_user
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO tcc_user;

--
-- TOC entry 3176 (class 0 OID 0)
-- Dependencies: 204
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tcc_user
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 201 (class 1259 OID 17557)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: tcc_user
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO tcc_user;

--
-- TOC entry 200 (class 1259 OID 17555)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: tcc_user
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO tcc_user;

--
-- TOC entry 3177 (class 0 OID 0)
-- Dependencies: 200
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tcc_user
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 219 (class 1259 OID 17715)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: tcc_user
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


ALTER TABLE public.django_admin_log OWNER TO tcc_user;

--
-- TOC entry 218 (class 1259 OID 17713)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: tcc_user
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO tcc_user;

--
-- TOC entry 3178 (class 0 OID 0)
-- Dependencies: 218
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tcc_user
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 199 (class 1259 OID 17547)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: tcc_user
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO tcc_user;

--
-- TOC entry 198 (class 1259 OID 17545)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: tcc_user
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO tcc_user;

--
-- TOC entry 3179 (class 0 OID 0)
-- Dependencies: 198
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tcc_user
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 197 (class 1259 OID 17536)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: tcc_user
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO tcc_user;

--
-- TOC entry 196 (class 1259 OID 17534)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: tcc_user
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO tcc_user;

--
-- TOC entry 3180 (class 0 OID 0)
-- Dependencies: 196
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tcc_user
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 228 (class 1259 OID 17838)
-- Name: django_session; Type: TABLE; Schema: public; Owner: tcc_user
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO tcc_user;

--
-- TOC entry 227 (class 1259 OID 17792)
-- Name: mensagem_emailparticipacaobanca; Type: TABLE; Schema: public; Owner: tcc_user
--

CREATE TABLE public.mensagem_emailparticipacaobanca (
    id integer NOT NULL,
    key character varying(100) NOT NULL,
    visualizada date,
    tipo character varying(30) NOT NULL,
    destinatario_id integer NOT NULL,
    remetente_id integer NOT NULL,
    trabalho_id integer NOT NULL
);


ALTER TABLE public.mensagem_emailparticipacaobanca OWNER TO tcc_user;

--
-- TOC entry 226 (class 1259 OID 17790)
-- Name: mensagem_emailparticipacaobanca_id_seq; Type: SEQUENCE; Schema: public; Owner: tcc_user
--

CREATE SEQUENCE public.mensagem_emailparticipacaobanca_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mensagem_emailparticipacaobanca_id_seq OWNER TO tcc_user;

--
-- TOC entry 3181 (class 0 OID 0)
-- Dependencies: 226
-- Name: mensagem_emailparticipacaobanca_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tcc_user
--

ALTER SEQUENCE public.mensagem_emailparticipacaobanca_id_seq OWNED BY public.mensagem_emailparticipacaobanca.id;


--
-- TOC entry 221 (class 1259 OID 17740)
-- Name: trabalhos_bancatrabalho; Type: TABLE; Schema: public; Owner: tcc_user
--

CREATE TABLE public.trabalhos_bancatrabalho (
    id integer NOT NULL,
    status character varying(30) NOT NULL,
    trabalho_id integer NOT NULL,
    usuario_id integer NOT NULL
);


ALTER TABLE public.trabalhos_bancatrabalho OWNER TO tcc_user;

--
-- TOC entry 220 (class 1259 OID 17738)
-- Name: trabalhos_bancatrabalho_id_seq; Type: SEQUENCE; Schema: public; Owner: tcc_user
--

CREATE SEQUENCE public.trabalhos_bancatrabalho_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trabalhos_bancatrabalho_id_seq OWNER TO tcc_user;

--
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 220
-- Name: trabalhos_bancatrabalho_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tcc_user
--

ALTER SEQUENCE public.trabalhos_bancatrabalho_id_seq OWNED BY public.trabalhos_bancatrabalho.id;


--
-- TOC entry 223 (class 1259 OID 17748)
-- Name: trabalhos_defesatrabalho; Type: TABLE; Schema: public; Owner: tcc_user
--

CREATE TABLE public.trabalhos_defesatrabalho (
    id integer NOT NULL,
    local character varying(250) NOT NULL,
    data date NOT NULL,
    hora time without time zone NOT NULL,
    periodo character varying(10) NOT NULL,
    status character varying(30) NOT NULL,
    trabalho_id integer NOT NULL
);


ALTER TABLE public.trabalhos_defesatrabalho OWNER TO tcc_user;

--
-- TOC entry 222 (class 1259 OID 17746)
-- Name: trabalhos_defesatrabalho_id_seq; Type: SEQUENCE; Schema: public; Owner: tcc_user
--

CREATE SEQUENCE public.trabalhos_defesatrabalho_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trabalhos_defesatrabalho_id_seq OWNER TO tcc_user;

--
-- TOC entry 3183 (class 0 OID 0)
-- Dependencies: 222
-- Name: trabalhos_defesatrabalho_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tcc_user
--

ALTER SEQUENCE public.trabalhos_defesatrabalho_id_seq OWNED BY public.trabalhos_defesatrabalho.id;


--
-- TOC entry 225 (class 1259 OID 17756)
-- Name: trabalhos_trabalhos; Type: TABLE; Schema: public; Owner: tcc_user
--

CREATE TABLE public.trabalhos_trabalhos (
    id integer NOT NULL,
    titulo character varying(250) NOT NULL,
    keywords character varying(150) NOT NULL,
    autor character varying(250) NOT NULL,
    co_orientador character varying(250) NOT NULL,
    resumo text NOT NULL,
    pdf_trabalho character varying(100),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    orientador_id integer NOT NULL
);


ALTER TABLE public.trabalhos_trabalhos OWNER TO tcc_user;

--
-- TOC entry 224 (class 1259 OID 17754)
-- Name: trabalhos_trabalhos_id_seq; Type: SEQUENCE; Schema: public; Owner: tcc_user
--

CREATE SEQUENCE public.trabalhos_trabalhos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trabalhos_trabalhos_id_seq OWNER TO tcc_user;

--
-- TOC entry 3184 (class 0 OID 0)
-- Dependencies: 224
-- Name: trabalhos_trabalhos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tcc_user
--

ALTER SEQUENCE public.trabalhos_trabalhos_id_seq OWNED BY public.trabalhos_trabalhos.id;


--
-- TOC entry 2894 (class 2604 OID 17630)
-- Name: accounts_novasenha id; Type: DEFAULT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_novasenha ALTER COLUMN id SET DEFAULT nextval('public.accounts_novasenha_id_seq'::regclass);


--
-- TOC entry 2895 (class 2604 OID 17640)
-- Name: accounts_perfil id; Type: DEFAULT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_perfil ALTER COLUMN id SET DEFAULT nextval('public.accounts_perfil_id_seq'::regclass);


--
-- TOC entry 2896 (class 2604 OID 17650)
-- Name: accounts_titulo id; Type: DEFAULT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_titulo ALTER COLUMN id SET DEFAULT nextval('public.accounts_titulo_id_seq'::regclass);


--
-- TOC entry 2892 (class 2604 OID 17609)
-- Name: accounts_usuario id; Type: DEFAULT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_usuario ALTER COLUMN id SET DEFAULT nextval('public.accounts_usuario_id_seq'::regclass);


--
-- TOC entry 2893 (class 2604 OID 17622)
-- Name: accounts_usuario_groups id; Type: DEFAULT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_usuario_groups ALTER COLUMN id SET DEFAULT nextval('public.accounts_usuario_groups_id_seq'::regclass);


--
-- TOC entry 2897 (class 2604 OID 17660)
-- Name: accounts_usuario_user_permissions id; Type: DEFAULT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_usuario_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.accounts_usuario_user_permissions_id_seq'::regclass);


--
-- TOC entry 2890 (class 2604 OID 17568)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 2891 (class 2604 OID 17578)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2889 (class 2604 OID 17560)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 2898 (class 2604 OID 17718)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 2888 (class 2604 OID 17550)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 2887 (class 2604 OID 17539)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 2903 (class 2604 OID 17795)
-- Name: mensagem_emailparticipacaobanca id; Type: DEFAULT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.mensagem_emailparticipacaobanca ALTER COLUMN id SET DEFAULT nextval('public.mensagem_emailparticipacaobanca_id_seq'::regclass);


--
-- TOC entry 2900 (class 2604 OID 17743)
-- Name: trabalhos_bancatrabalho id; Type: DEFAULT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.trabalhos_bancatrabalho ALTER COLUMN id SET DEFAULT nextval('public.trabalhos_bancatrabalho_id_seq'::regclass);


--
-- TOC entry 2901 (class 2604 OID 17751)
-- Name: trabalhos_defesatrabalho id; Type: DEFAULT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.trabalhos_defesatrabalho ALTER COLUMN id SET DEFAULT nextval('public.trabalhos_defesatrabalho_id_seq'::regclass);


--
-- TOC entry 2902 (class 2604 OID 17759)
-- Name: trabalhos_trabalhos id; Type: DEFAULT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.trabalhos_trabalhos ALTER COLUMN id SET DEFAULT nextval('public.trabalhos_trabalhos_id_seq'::regclass);


--
-- TOC entry 3143 (class 0 OID 17627)
-- Dependencies: 211
-- Data for Name: accounts_novasenha; Type: TABLE DATA; Schema: public; Owner: tcc_user
--

COPY public.accounts_novasenha (id, key, created_at, confirmed, user_id) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 17637)
-- Dependencies: 213
-- Data for Name: accounts_perfil; Type: TABLE DATA; Schema: public; Owner: tcc_user
--

COPY public.accounts_perfil (id, descricao, nivel_acesso) FROM stdin;
1	Professor	1
2	Coordenador	1
\.


--
-- TOC entry 3147 (class 0 OID 17647)
-- Dependencies: 215
-- Data for Name: accounts_titulo; Type: TABLE DATA; Schema: public; Owner: tcc_user
--

COPY public.accounts_titulo (id, descricao) FROM stdin;
1	Mestrado
\.


--
-- TOC entry 3139 (class 0 OID 17606)
-- Dependencies: 207
-- Data for Name: accounts_usuario; Type: TABLE DATA; Schema: public; Owner: tcc_user
--

COPY public.accounts_usuario (id, password, last_login, is_superuser, username, name, is_active, is_staff, date_joined, perfil_id, titulo_id) FROM stdin;
2	pbkdf2_sha256$36000$aZdCa2iK8JtA$ye96eLZyBK1onkRO+PQR9uhMt1J23Pxt01b5apqn/40=	\N	f	dcarvaioo@gmail.com	Doria	t	f	2019-05-22 10:37:48.36272-03	1	1
1	pbkdf2_sha256$36000$942xuhXa3YZP$Lix0aEvT3ApQbzGZ2kJdKKxhRWSHhu22wKBRRWAj2fk=	2019-05-22 10:39:30.483589-03	f	tiagodoriap@gmail.com	Tiago	t	f	2019-05-22 10:37:15.120744-03	2	1
\.


--
-- TOC entry 3141 (class 0 OID 17619)
-- Dependencies: 209
-- Data for Name: accounts_usuario_groups; Type: TABLE DATA; Schema: public; Owner: tcc_user
--

COPY public.accounts_usuario_groups (id, usuario_id, group_id) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 17657)
-- Dependencies: 217
-- Data for Name: accounts_usuario_user_permissions; Type: TABLE DATA; Schema: public; Owner: tcc_user
--

COPY public.accounts_usuario_user_permissions (id, usuario_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3135 (class 0 OID 17565)
-- Dependencies: 203
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: tcc_user
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 17575)
-- Dependencies: 205
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: tcc_user
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 17557)
-- Dependencies: 201
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: tcc_user
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 17715)
-- Dependencies: 219
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: tcc_user
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 17547)
-- Dependencies: 199
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: tcc_user
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
\.


--
-- TOC entry 3129 (class 0 OID 17536)
-- Dependencies: 197
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: tcc_user
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-05-22 10:34:32.18007-03
2	contenttypes	0002_remove_content_type_name	2019-05-22 10:34:32.221996-03
3	auth	0001_initial	2019-05-22 10:34:32.781043-03
4	auth	0002_alter_permission_name_max_length	2019-05-22 10:34:32.824676-03
5	auth	0003_alter_user_email_max_length	2019-05-22 10:34:32.853269-03
6	auth	0004_alter_user_username_opts	2019-05-22 10:34:32.874874-03
7	auth	0005_alter_user_last_login_null	2019-05-22 10:34:32.8943-03
8	auth	0006_require_contenttypes_0002	2019-05-22 10:34:32.899914-03
9	auth	0007_alter_validators_add_error_messages	2019-05-22 10:34:32.91646-03
10	auth	0008_alter_user_username_max_length	2019-05-22 10:34:32.927445-03
11	accounts	0001_initial	2019-05-22 10:34:34.05719-03
12	admin	0001_initial	2019-05-22 10:34:34.299825-03
13	admin	0002_logentry_remove_auto_add	2019-05-22 10:34:34.352756-03
14	trabalhos	0001_initial	2019-05-22 10:34:34.901028-03
15	mensagem	0001_initial	2019-05-22 10:34:35.222448-03
16	mensagem	0002_auto_20181019_0120	2019-05-22 10:34:35.544317-03
17	mensagem	0003_auto_20181019_0123	2019-05-22 10:34:35.642826-03
18	mensagem	0004_auto_20181019_0125	2019-05-22 10:34:35.920207-03
19	mensagem	0005_auto_20181019_0139	2019-05-22 10:34:35.965105-03
20	mensagem	0006_auto_20181019_0141	2019-05-22 10:34:35.993951-03
21	mensagem	0007_auto_20181019_0150	2019-05-22 10:34:36.026864-03
22	mensagem	0008_auto_20181019_0153	2019-05-22 10:34:36.060518-03
23	sessions	0001_initial	2019-05-22 10:34:36.26244-03
\.


--
-- TOC entry 3160 (class 0 OID 17838)
-- Dependencies: 228
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: tcc_user
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
x60ndmca105xpzdlpdd3mjvnunklh4o0	NTk5MDE2NjMyNTc3NGVkMTk4ODNjYTExNTIxMjk5MmMzM2NiMjliYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmM2JhNjM3YTVhNTA2MjI0YmFjODJjYmNmZmU4YmM3YjczNzM3MzhjIn0=	2019-06-05 10:39:30.516711-03
\.


--
-- TOC entry 3159 (class 0 OID 17792)
-- Dependencies: 227
-- Data for Name: mensagem_emailparticipacaobanca; Type: TABLE DATA; Schema: public; Owner: tcc_user
--

COPY public.mensagem_emailparticipacaobanca (id, key, visualizada, tipo, destinatario_id, remetente_id, trabalho_id) FROM stdin;
\.


--
-- TOC entry 3153 (class 0 OID 17740)
-- Dependencies: 221
-- Data for Name: trabalhos_bancatrabalho; Type: TABLE DATA; Schema: public; Owner: tcc_user
--

COPY public.trabalhos_bancatrabalho (id, status, trabalho_id, usuario_id) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 17748)
-- Dependencies: 223
-- Data for Name: trabalhos_defesatrabalho; Type: TABLE DATA; Schema: public; Owner: tcc_user
--

COPY public.trabalhos_defesatrabalho (id, local, data, hora, periodo, status, trabalho_id) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 17756)
-- Dependencies: 225
-- Data for Name: trabalhos_trabalhos; Type: TABLE DATA; Schema: public; Owner: tcc_user
--

COPY public.trabalhos_trabalhos (id, titulo, keywords, autor, co_orientador, resumo, pdf_trabalho, created_at, updated_at, orientador_id) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 210
-- Name: accounts_novasenha_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tcc_user
--

SELECT pg_catalog.setval('public.accounts_novasenha_id_seq', 1, false);


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 212
-- Name: accounts_perfil_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tcc_user
--

SELECT pg_catalog.setval('public.accounts_perfil_id_seq', 1, false);


--
-- TOC entry 3187 (class 0 OID 0)
-- Dependencies: 214
-- Name: accounts_titulo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tcc_user
--

SELECT pg_catalog.setval('public.accounts_titulo_id_seq', 1, false);


--
-- TOC entry 3188 (class 0 OID 0)
-- Dependencies: 208
-- Name: accounts_usuario_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tcc_user
--

SELECT pg_catalog.setval('public.accounts_usuario_groups_id_seq', 1, false);


--
-- TOC entry 3189 (class 0 OID 0)
-- Dependencies: 206
-- Name: accounts_usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tcc_user
--

SELECT pg_catalog.setval('public.accounts_usuario_id_seq', 2, true);


--
-- TOC entry 3190 (class 0 OID 0)
-- Dependencies: 216
-- Name: accounts_usuario_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tcc_user
--

SELECT pg_catalog.setval('public.accounts_usuario_user_permissions_id_seq', 1, false);


--
-- TOC entry 3191 (class 0 OID 0)
-- Dependencies: 202
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tcc_user
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 3192 (class 0 OID 0)
-- Dependencies: 204
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tcc_user
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3193 (class 0 OID 0)
-- Dependencies: 200
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tcc_user
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 1, false);


--
-- TOC entry 3194 (class 0 OID 0)
-- Dependencies: 218
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tcc_user
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- TOC entry 3195 (class 0 OID 0)
-- Dependencies: 198
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tcc_user
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 1, false);


--
-- TOC entry 3196 (class 0 OID 0)
-- Dependencies: 196
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tcc_user
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 23, true);


--
-- TOC entry 3197 (class 0 OID 0)
-- Dependencies: 226
-- Name: mensagem_emailparticipacaobanca_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tcc_user
--

SELECT pg_catalog.setval('public.mensagem_emailparticipacaobanca_id_seq', 1, false);


--
-- TOC entry 3198 (class 0 OID 0)
-- Dependencies: 220
-- Name: trabalhos_bancatrabalho_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tcc_user
--

SELECT pg_catalog.setval('public.trabalhos_bancatrabalho_id_seq', 1, false);


--
-- TOC entry 3199 (class 0 OID 0)
-- Dependencies: 222
-- Name: trabalhos_defesatrabalho_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tcc_user
--

SELECT pg_catalog.setval('public.trabalhos_defesatrabalho_id_seq', 1, false);


--
-- TOC entry 3200 (class 0 OID 0)
-- Dependencies: 224
-- Name: trabalhos_trabalhos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tcc_user
--

SELECT pg_catalog.setval('public.trabalhos_trabalhos_id_seq', 1, false);


--
-- TOC entry 2941 (class 2606 OID 17634)
-- Name: accounts_novasenha accounts_novasenha_key_key; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_novasenha
    ADD CONSTRAINT accounts_novasenha_key_key UNIQUE (key);


--
-- TOC entry 2943 (class 2606 OID 17632)
-- Name: accounts_novasenha accounts_novasenha_pkey; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_novasenha
    ADD CONSTRAINT accounts_novasenha_pkey PRIMARY KEY (id);


--
-- TOC entry 2947 (class 2606 OID 17644)
-- Name: accounts_perfil accounts_perfil_descricao_key; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_perfil
    ADD CONSTRAINT accounts_perfil_descricao_key UNIQUE (descricao);


--
-- TOC entry 2949 (class 2606 OID 17642)
-- Name: accounts_perfil accounts_perfil_pkey; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_perfil
    ADD CONSTRAINT accounts_perfil_pkey PRIMARY KEY (id);


--
-- TOC entry 2952 (class 2606 OID 17654)
-- Name: accounts_titulo accounts_titulo_descricao_key; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_titulo
    ADD CONSTRAINT accounts_titulo_descricao_key UNIQUE (descricao);


--
-- TOC entry 2954 (class 2606 OID 17652)
-- Name: accounts_titulo accounts_titulo_pkey; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_titulo
    ADD CONSTRAINT accounts_titulo_pkey PRIMARY KEY (id);


--
-- TOC entry 2935 (class 2606 OID 17624)
-- Name: accounts_usuario_groups accounts_usuario_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_usuario_groups
    ADD CONSTRAINT accounts_usuario_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2938 (class 2606 OID 17675)
-- Name: accounts_usuario_groups accounts_usuario_groups_usuario_id_group_id_90f476d3_uniq; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_usuario_groups
    ADD CONSTRAINT accounts_usuario_groups_usuario_id_group_id_90f476d3_uniq UNIQUE (usuario_id, group_id);


--
-- TOC entry 2928 (class 2606 OID 17614)
-- Name: accounts_usuario accounts_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_usuario
    ADD CONSTRAINT accounts_usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 2956 (class 2606 OID 17710)
-- Name: accounts_usuario_user_permissions accounts_usuario_user_pe_usuario_id_permission_id_0065a2ce_uniq; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_usuario_user_permissions
    ADD CONSTRAINT accounts_usuario_user_pe_usuario_id_permission_id_0065a2ce_uniq UNIQUE (usuario_id, permission_id);


--
-- TOC entry 2959 (class 2606 OID 17662)
-- Name: accounts_usuario_user_permissions accounts_usuario_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_usuario_user_permissions
    ADD CONSTRAINT accounts_usuario_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2932 (class 2606 OID 17616)
-- Name: accounts_usuario accounts_usuario_username_key; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_usuario
    ADD CONSTRAINT accounts_usuario_username_key UNIQUE (username);


--
-- TOC entry 2917 (class 2606 OID 17572)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2922 (class 2606 OID 17601)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2925 (class 2606 OID 17580)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2919 (class 2606 OID 17570)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2912 (class 2606 OID 17587)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2914 (class 2606 OID 17562)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2963 (class 2606 OID 17724)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2907 (class 2606 OID 17554)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2909 (class 2606 OID 17552)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2905 (class 2606 OID 17544)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2986 (class 2606 OID 17845)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2979 (class 2606 OID 17799)
-- Name: mensagem_emailparticipacaobanca mensagem_emailparticipacaobanca_key_key; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.mensagem_emailparticipacaobanca
    ADD CONSTRAINT mensagem_emailparticipacaobanca_key_key UNIQUE (key);


--
-- TOC entry 2981 (class 2606 OID 17797)
-- Name: mensagem_emailparticipacaobanca mensagem_emailparticipacaobanca_pkey; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.mensagem_emailparticipacaobanca
    ADD CONSTRAINT mensagem_emailparticipacaobanca_pkey PRIMARY KEY (id);


--
-- TOC entry 2966 (class 2606 OID 17745)
-- Name: trabalhos_bancatrabalho trabalhos_bancatrabalho_pkey; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.trabalhos_bancatrabalho
    ADD CONSTRAINT trabalhos_bancatrabalho_pkey PRIMARY KEY (id);


--
-- TOC entry 2970 (class 2606 OID 17753)
-- Name: trabalhos_defesatrabalho trabalhos_defesatrabalho_pkey; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.trabalhos_defesatrabalho
    ADD CONSTRAINT trabalhos_defesatrabalho_pkey PRIMARY KEY (id);


--
-- TOC entry 2972 (class 2606 OID 17766)
-- Name: trabalhos_defesatrabalho trabalhos_defesatrabalho_trabalho_id_key; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.trabalhos_defesatrabalho
    ADD CONSTRAINT trabalhos_defesatrabalho_trabalho_id_key UNIQUE (trabalho_id);


--
-- TOC entry 2975 (class 2606 OID 17764)
-- Name: trabalhos_trabalhos trabalhos_trabalhos_pkey; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.trabalhos_trabalhos
    ADD CONSTRAINT trabalhos_trabalhos_pkey PRIMARY KEY (id);


--
-- TOC entry 2939 (class 1259 OID 17683)
-- Name: accounts_novasenha_key_9834b4bd_like; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX accounts_novasenha_key_9834b4bd_like ON public.accounts_novasenha USING btree (key varchar_pattern_ops);


--
-- TOC entry 2944 (class 1259 OID 17684)
-- Name: accounts_novasenha_user_id_3b922c73; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX accounts_novasenha_user_id_3b922c73 ON public.accounts_novasenha USING btree (user_id);


--
-- TOC entry 2945 (class 1259 OID 17685)
-- Name: accounts_perfil_descricao_e6617f1b_like; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX accounts_perfil_descricao_e6617f1b_like ON public.accounts_perfil USING btree (descricao varchar_pattern_ops);


--
-- TOC entry 2950 (class 1259 OID 17686)
-- Name: accounts_titulo_descricao_bae28331_like; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX accounts_titulo_descricao_bae28331_like ON public.accounts_titulo USING btree (descricao varchar_pattern_ops);


--
-- TOC entry 2933 (class 1259 OID 17677)
-- Name: accounts_usuario_groups_group_id_81d91a41; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX accounts_usuario_groups_group_id_81d91a41 ON public.accounts_usuario_groups USING btree (group_id);


--
-- TOC entry 2936 (class 1259 OID 17676)
-- Name: accounts_usuario_groups_usuario_id_8eb16911; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX accounts_usuario_groups_usuario_id_8eb16911 ON public.accounts_usuario_groups USING btree (usuario_id);


--
-- TOC entry 2926 (class 1259 OID 17687)
-- Name: accounts_usuario_perfil_id_e9959ae0; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX accounts_usuario_perfil_id_e9959ae0 ON public.accounts_usuario USING btree (perfil_id);


--
-- TOC entry 2929 (class 1259 OID 17693)
-- Name: accounts_usuario_titulo_id_decd18bd; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX accounts_usuario_titulo_id_decd18bd ON public.accounts_usuario USING btree (titulo_id);


--
-- TOC entry 2957 (class 1259 OID 17712)
-- Name: accounts_usuario_user_permissions_permission_id_3de42c14; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX accounts_usuario_user_permissions_permission_id_3de42c14 ON public.accounts_usuario_user_permissions USING btree (permission_id);


--
-- TOC entry 2960 (class 1259 OID 17711)
-- Name: accounts_usuario_user_permissions_usuario_id_d048ad71; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX accounts_usuario_user_permissions_usuario_id_d048ad71 ON public.accounts_usuario_user_permissions USING btree (usuario_id);


--
-- TOC entry 2930 (class 1259 OID 17663)
-- Name: accounts_usuario_username_c366c69f_like; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX accounts_usuario_username_c366c69f_like ON public.accounts_usuario USING btree (username varchar_pattern_ops);


--
-- TOC entry 2915 (class 1259 OID 17589)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2920 (class 1259 OID 17602)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 2923 (class 1259 OID 17603)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2910 (class 1259 OID 17588)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 2961 (class 1259 OID 17735)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 2964 (class 1259 OID 17736)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 2984 (class 1259 OID 17847)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 2987 (class 1259 OID 17846)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2976 (class 1259 OID 17816)
-- Name: mensagem_emailparticipacaobanca_destinatario_id_536457f9; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX mensagem_emailparticipacaobanca_destinatario_id_536457f9 ON public.mensagem_emailparticipacaobanca USING btree (destinatario_id);


--
-- TOC entry 2977 (class 1259 OID 17815)
-- Name: mensagem_emailparticipacaobanca_key_7add2ac3_like; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX mensagem_emailparticipacaobanca_key_7add2ac3_like ON public.mensagem_emailparticipacaobanca USING btree (key varchar_pattern_ops);


--
-- TOC entry 2982 (class 1259 OID 17817)
-- Name: mensagem_emailparticipacaobanca_remetente_id_8b24bfb3; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX mensagem_emailparticipacaobanca_remetente_id_8b24bfb3 ON public.mensagem_emailparticipacaobanca USING btree (remetente_id);


--
-- TOC entry 2983 (class 1259 OID 17818)
-- Name: mensagem_emailparticipacaobanca_trabalho_id_0b4c691b; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX mensagem_emailparticipacaobanca_trabalho_id_0b4c691b ON public.mensagem_emailparticipacaobanca USING btree (trabalho_id);


--
-- TOC entry 2967 (class 1259 OID 17778)
-- Name: trabalhos_bancatrabalho_trabalho_id_082df32a; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX trabalhos_bancatrabalho_trabalho_id_082df32a ON public.trabalhos_bancatrabalho USING btree (trabalho_id);


--
-- TOC entry 2968 (class 1259 OID 17784)
-- Name: trabalhos_bancatrabalho_usuario_id_6363c77a; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX trabalhos_bancatrabalho_usuario_id_6363c77a ON public.trabalhos_bancatrabalho USING btree (usuario_id);


--
-- TOC entry 2973 (class 1259 OID 17772)
-- Name: trabalhos_trabalhos_orientador_id_5b4d9b24; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX trabalhos_trabalhos_orientador_id_5b4d9b24 ON public.trabalhos_trabalhos USING btree (orientador_id);


--
-- TOC entry 2995 (class 2606 OID 17678)
-- Name: accounts_novasenha accounts_novasenha_user_id_3b922c73_fk_accounts_usuario_id; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_novasenha
    ADD CONSTRAINT accounts_novasenha_user_id_3b922c73_fk_accounts_usuario_id FOREIGN KEY (user_id) REFERENCES public.accounts_usuario(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2993 (class 2606 OID 17664)
-- Name: accounts_usuario_groups accounts_usuario_gro_usuario_id_8eb16911_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_usuario_groups
    ADD CONSTRAINT accounts_usuario_gro_usuario_id_8eb16911_fk_accounts_ FOREIGN KEY (usuario_id) REFERENCES public.accounts_usuario(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2994 (class 2606 OID 17669)
-- Name: accounts_usuario_groups accounts_usuario_groups_group_id_81d91a41_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_usuario_groups
    ADD CONSTRAINT accounts_usuario_groups_group_id_81d91a41_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2991 (class 2606 OID 17688)
-- Name: accounts_usuario accounts_usuario_perfil_id_e9959ae0_fk_accounts_perfil_id; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_usuario
    ADD CONSTRAINT accounts_usuario_perfil_id_e9959ae0_fk_accounts_perfil_id FOREIGN KEY (perfil_id) REFERENCES public.accounts_perfil(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2992 (class 2606 OID 17694)
-- Name: accounts_usuario accounts_usuario_titulo_id_decd18bd_fk_accounts_titulo_id; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_usuario
    ADD CONSTRAINT accounts_usuario_titulo_id_decd18bd_fk_accounts_titulo_id FOREIGN KEY (titulo_id) REFERENCES public.accounts_titulo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2997 (class 2606 OID 17704)
-- Name: accounts_usuario_user_permissions accounts_usuario_use_permission_id_3de42c14_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_usuario_user_permissions
    ADD CONSTRAINT accounts_usuario_use_permission_id_3de42c14_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2996 (class 2606 OID 17699)
-- Name: accounts_usuario_user_permissions accounts_usuario_use_usuario_id_d048ad71_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_usuario_user_permissions
    ADD CONSTRAINT accounts_usuario_use_usuario_id_d048ad71_fk_accounts_ FOREIGN KEY (usuario_id) REFERENCES public.accounts_usuario(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2990 (class 2606 OID 17595)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2989 (class 2606 OID 17590)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2988 (class 2606 OID 17581)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2998 (class 2606 OID 17725)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2999 (class 2606 OID 17730)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_accounts_usuario_id; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_accounts_usuario_id FOREIGN KEY (user_id) REFERENCES public.accounts_usuario(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3004 (class 2606 OID 17800)
-- Name: mensagem_emailparticipacaobanca mensagem_emailpartic_destinatario_id_536457f9_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.mensagem_emailparticipacaobanca
    ADD CONSTRAINT mensagem_emailpartic_destinatario_id_536457f9_fk_accounts_ FOREIGN KEY (destinatario_id) REFERENCES public.accounts_usuario(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3005 (class 2606 OID 17805)
-- Name: mensagem_emailparticipacaobanca mensagem_emailpartic_remetente_id_8b24bfb3_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.mensagem_emailparticipacaobanca
    ADD CONSTRAINT mensagem_emailpartic_remetente_id_8b24bfb3_fk_accounts_ FOREIGN KEY (remetente_id) REFERENCES public.accounts_usuario(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3006 (class 2606 OID 17810)
-- Name: mensagem_emailparticipacaobanca mensagem_emailpartic_trabalho_id_0b4c691b_fk_trabalhos; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.mensagem_emailparticipacaobanca
    ADD CONSTRAINT mensagem_emailpartic_trabalho_id_0b4c691b_fk_trabalhos FOREIGN KEY (trabalho_id) REFERENCES public.trabalhos_trabalhos(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3000 (class 2606 OID 17779)
-- Name: trabalhos_bancatrabalho trabalhos_bancatraba_trabalho_id_082df32a_fk_trabalhos; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.trabalhos_bancatrabalho
    ADD CONSTRAINT trabalhos_bancatraba_trabalho_id_082df32a_fk_trabalhos FOREIGN KEY (trabalho_id) REFERENCES public.trabalhos_trabalhos(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3001 (class 2606 OID 17785)
-- Name: trabalhos_bancatrabalho trabalhos_bancatraba_usuario_id_6363c77a_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.trabalhos_bancatrabalho
    ADD CONSTRAINT trabalhos_bancatraba_usuario_id_6363c77a_fk_accounts_ FOREIGN KEY (usuario_id) REFERENCES public.accounts_usuario(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3002 (class 2606 OID 17773)
-- Name: trabalhos_defesatrabalho trabalhos_defesatrab_trabalho_id_fc968fd3_fk_trabalhos; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.trabalhos_defesatrabalho
    ADD CONSTRAINT trabalhos_defesatrab_trabalho_id_fc968fd3_fk_trabalhos FOREIGN KEY (trabalho_id) REFERENCES public.trabalhos_trabalhos(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3003 (class 2606 OID 17767)
-- Name: trabalhos_trabalhos trabalhos_trabalhos_orientador_id_5b4d9b24_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.trabalhos_trabalhos
    ADD CONSTRAINT trabalhos_trabalhos_orientador_id_5b4d9b24_fk_accounts_ FOREIGN KEY (orientador_id) REFERENCES public.accounts_usuario(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2019-05-22 11:12:36 -03

--
-- PostgreSQL database dump complete
--

