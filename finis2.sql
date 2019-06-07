--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

-- Started on 2019-06-07 16:16:24 -03

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
-- TOC entry 3169 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 211 (class 1259 OID 18891)
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
-- TOC entry 210 (class 1259 OID 18889)
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
-- TOC entry 3170 (class 0 OID 0)
-- Dependencies: 210
-- Name: accounts_novasenha_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tcc_user
--

ALTER SEQUENCE public.accounts_novasenha_id_seq OWNED BY public.accounts_novasenha.id;


--
-- TOC entry 213 (class 1259 OID 18901)
-- Name: accounts_perfil; Type: TABLE; Schema: public; Owner: tcc_user
--

CREATE TABLE public.accounts_perfil (
    id integer NOT NULL,
    descricao character varying(100) NOT NULL,
    nivel_acesso character varying(6) NOT NULL
);


ALTER TABLE public.accounts_perfil OWNER TO tcc_user;

--
-- TOC entry 212 (class 1259 OID 18899)
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
-- TOC entry 3171 (class 0 OID 0)
-- Dependencies: 212
-- Name: accounts_perfil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tcc_user
--

ALTER SEQUENCE public.accounts_perfil_id_seq OWNED BY public.accounts_perfil.id;


--
-- TOC entry 215 (class 1259 OID 18911)
-- Name: accounts_titulo; Type: TABLE; Schema: public; Owner: tcc_user
--

CREATE TABLE public.accounts_titulo (
    id integer NOT NULL,
    descricao character varying(100) NOT NULL
);


ALTER TABLE public.accounts_titulo OWNER TO tcc_user;

--
-- TOC entry 214 (class 1259 OID 18909)
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
-- TOC entry 3172 (class 0 OID 0)
-- Dependencies: 214
-- Name: accounts_titulo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tcc_user
--

ALTER SEQUENCE public.accounts_titulo_id_seq OWNED BY public.accounts_titulo.id;


--
-- TOC entry 207 (class 1259 OID 18870)
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
-- TOC entry 209 (class 1259 OID 18883)
-- Name: accounts_usuario_groups; Type: TABLE; Schema: public; Owner: tcc_user
--

CREATE TABLE public.accounts_usuario_groups (
    id integer NOT NULL,
    usuario_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.accounts_usuario_groups OWNER TO tcc_user;

--
-- TOC entry 208 (class 1259 OID 18881)
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
-- TOC entry 3173 (class 0 OID 0)
-- Dependencies: 208
-- Name: accounts_usuario_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tcc_user
--

ALTER SEQUENCE public.accounts_usuario_groups_id_seq OWNED BY public.accounts_usuario_groups.id;


--
-- TOC entry 206 (class 1259 OID 18868)
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
-- TOC entry 3174 (class 0 OID 0)
-- Dependencies: 206
-- Name: accounts_usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tcc_user
--

ALTER SEQUENCE public.accounts_usuario_id_seq OWNED BY public.accounts_usuario.id;


--
-- TOC entry 217 (class 1259 OID 18921)
-- Name: accounts_usuario_user_permissions; Type: TABLE; Schema: public; Owner: tcc_user
--

CREATE TABLE public.accounts_usuario_user_permissions (
    id integer NOT NULL,
    usuario_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.accounts_usuario_user_permissions OWNER TO tcc_user;

--
-- TOC entry 216 (class 1259 OID 18919)
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
-- TOC entry 3175 (class 0 OID 0)
-- Dependencies: 216
-- Name: accounts_usuario_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tcc_user
--

ALTER SEQUENCE public.accounts_usuario_user_permissions_id_seq OWNED BY public.accounts_usuario_user_permissions.id;


--
-- TOC entry 203 (class 1259 OID 18829)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: tcc_user
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO tcc_user;

--
-- TOC entry 202 (class 1259 OID 18827)
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
-- TOC entry 3176 (class 0 OID 0)
-- Dependencies: 202
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tcc_user
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 205 (class 1259 OID 18839)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: tcc_user
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO tcc_user;

--
-- TOC entry 204 (class 1259 OID 18837)
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
-- TOC entry 3177 (class 0 OID 0)
-- Dependencies: 204
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tcc_user
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 201 (class 1259 OID 18821)
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
-- TOC entry 200 (class 1259 OID 18819)
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
-- TOC entry 3178 (class 0 OID 0)
-- Dependencies: 200
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tcc_user
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 219 (class 1259 OID 18979)
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
-- TOC entry 218 (class 1259 OID 18977)
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
-- TOC entry 3179 (class 0 OID 0)
-- Dependencies: 218
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tcc_user
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 199 (class 1259 OID 18811)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: tcc_user
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO tcc_user;

--
-- TOC entry 198 (class 1259 OID 18809)
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
-- TOC entry 3180 (class 0 OID 0)
-- Dependencies: 198
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tcc_user
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 197 (class 1259 OID 18800)
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
-- TOC entry 196 (class 1259 OID 18798)
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
-- TOC entry 3181 (class 0 OID 0)
-- Dependencies: 196
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tcc_user
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 228 (class 1259 OID 19105)
-- Name: django_session; Type: TABLE; Schema: public; Owner: tcc_user
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO tcc_user;

--
-- TOC entry 227 (class 1259 OID 19059)
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
-- TOC entry 226 (class 1259 OID 19057)
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
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 226
-- Name: mensagem_emailparticipacaobanca_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tcc_user
--

ALTER SEQUENCE public.mensagem_emailparticipacaobanca_id_seq OWNED BY public.mensagem_emailparticipacaobanca.id;


--
-- TOC entry 221 (class 1259 OID 19004)
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
-- TOC entry 220 (class 1259 OID 19002)
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
-- TOC entry 3183 (class 0 OID 0)
-- Dependencies: 220
-- Name: trabalhos_bancatrabalho_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tcc_user
--

ALTER SEQUENCE public.trabalhos_bancatrabalho_id_seq OWNED BY public.trabalhos_bancatrabalho.id;


--
-- TOC entry 223 (class 1259 OID 19012)
-- Name: trabalhos_defesatrabalho; Type: TABLE; Schema: public; Owner: tcc_user
--

CREATE TABLE public.trabalhos_defesatrabalho (
    id integer NOT NULL,
    local character varying(250) NOT NULL,
    data date NOT NULL,
    hora time without time zone NOT NULL,
    ano integer NOT NULL,
    semestre integer NOT NULL,
    periodo character varying(250) NOT NULL,
    status character varying(30) NOT NULL,
    trabalho_id integer NOT NULL
);


ALTER TABLE public.trabalhos_defesatrabalho OWNER TO tcc_user;

--
-- TOC entry 222 (class 1259 OID 19010)
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
-- TOC entry 3184 (class 0 OID 0)
-- Dependencies: 222
-- Name: trabalhos_defesatrabalho_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tcc_user
--

ALTER SEQUENCE public.trabalhos_defesatrabalho_id_seq OWNED BY public.trabalhos_defesatrabalho.id;


--
-- TOC entry 225 (class 1259 OID 19023)
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
-- TOC entry 224 (class 1259 OID 19021)
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
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 224
-- Name: trabalhos_trabalhos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tcc_user
--

ALTER SEQUENCE public.trabalhos_trabalhos_id_seq OWNED BY public.trabalhos_trabalhos.id;


--
-- TOC entry 2895 (class 2604 OID 18894)
-- Name: accounts_novasenha id; Type: DEFAULT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_novasenha ALTER COLUMN id SET DEFAULT nextval('public.accounts_novasenha_id_seq'::regclass);


--
-- TOC entry 2896 (class 2604 OID 18904)
-- Name: accounts_perfil id; Type: DEFAULT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_perfil ALTER COLUMN id SET DEFAULT nextval('public.accounts_perfil_id_seq'::regclass);


--
-- TOC entry 2897 (class 2604 OID 18914)
-- Name: accounts_titulo id; Type: DEFAULT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_titulo ALTER COLUMN id SET DEFAULT nextval('public.accounts_titulo_id_seq'::regclass);


--
-- TOC entry 2893 (class 2604 OID 18873)
-- Name: accounts_usuario id; Type: DEFAULT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_usuario ALTER COLUMN id SET DEFAULT nextval('public.accounts_usuario_id_seq'::regclass);


--
-- TOC entry 2894 (class 2604 OID 18886)
-- Name: accounts_usuario_groups id; Type: DEFAULT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_usuario_groups ALTER COLUMN id SET DEFAULT nextval('public.accounts_usuario_groups_id_seq'::regclass);


--
-- TOC entry 2898 (class 2604 OID 18924)
-- Name: accounts_usuario_user_permissions id; Type: DEFAULT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_usuario_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.accounts_usuario_user_permissions_id_seq'::regclass);


--
-- TOC entry 2891 (class 2604 OID 18832)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 2892 (class 2604 OID 18842)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2890 (class 2604 OID 18824)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 2899 (class 2604 OID 18982)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 2889 (class 2604 OID 18814)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 2888 (class 2604 OID 18803)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 2904 (class 2604 OID 19062)
-- Name: mensagem_emailparticipacaobanca id; Type: DEFAULT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.mensagem_emailparticipacaobanca ALTER COLUMN id SET DEFAULT nextval('public.mensagem_emailparticipacaobanca_id_seq'::regclass);


--
-- TOC entry 2901 (class 2604 OID 19007)
-- Name: trabalhos_bancatrabalho id; Type: DEFAULT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.trabalhos_bancatrabalho ALTER COLUMN id SET DEFAULT nextval('public.trabalhos_bancatrabalho_id_seq'::regclass);


--
-- TOC entry 2902 (class 2604 OID 19015)
-- Name: trabalhos_defesatrabalho id; Type: DEFAULT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.trabalhos_defesatrabalho ALTER COLUMN id SET DEFAULT nextval('public.trabalhos_defesatrabalho_id_seq'::regclass);


--
-- TOC entry 2903 (class 2604 OID 19026)
-- Name: trabalhos_trabalhos id; Type: DEFAULT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.trabalhos_trabalhos ALTER COLUMN id SET DEFAULT nextval('public.trabalhos_trabalhos_id_seq'::regclass);


--
-- TOC entry 3144 (class 0 OID 18891)
-- Dependencies: 211
-- Data for Name: accounts_novasenha; Type: TABLE DATA; Schema: public; Owner: tcc_user
--

COPY public.accounts_novasenha (id, key, created_at, confirmed, user_id) FROM stdin;
\.


--
-- TOC entry 3146 (class 0 OID 18901)
-- Dependencies: 213
-- Data for Name: accounts_perfil; Type: TABLE DATA; Schema: public; Owner: tcc_user
--

COPY public.accounts_perfil (id, descricao, nivel_acesso) FROM stdin;
1	Coordenador	1
2	Professor	1
\.


--
-- TOC entry 3148 (class 0 OID 18911)
-- Dependencies: 215
-- Data for Name: accounts_titulo; Type: TABLE DATA; Schema: public; Owner: tcc_user
--

COPY public.accounts_titulo (id, descricao) FROM stdin;
1	Doutorado
2	Graduação
3	Mestrado
\.


--
-- TOC entry 3140 (class 0 OID 18870)
-- Dependencies: 207
-- Data for Name: accounts_usuario; Type: TABLE DATA; Schema: public; Owner: tcc_user
--

COPY public.accounts_usuario (id, password, last_login, is_superuser, username, name, is_active, is_staff, date_joined, perfil_id, titulo_id) FROM stdin;
1	pbkdf2_sha256$36000$OeC1sMSWQwZ4$jmVM7a1KDiKffK+5FPG073qUdkhKCYVLONIL+IMcpHY=	2019-06-07 15:31:03.930187-03	f	dcarvaioo@gmail.com	Daniel	t	f	2019-06-07 14:50:06.312681-03	2	2
2	pbkdf2_sha256$36000$uUHc9UW8WFx3$NoF6mCIC65VuFjh5MD4PVhFTchygpL7LDqQfycwB6gQ=	2019-06-07 15:50:12.106683-03	f	tiagodoriap@gmail.com	Tiago	t	f	2019-06-07 15:22:43.300794-03	1	3
\.


--
-- TOC entry 3142 (class 0 OID 18883)
-- Dependencies: 209
-- Data for Name: accounts_usuario_groups; Type: TABLE DATA; Schema: public; Owner: tcc_user
--

COPY public.accounts_usuario_groups (id, usuario_id, group_id) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 18921)
-- Dependencies: 217
-- Data for Name: accounts_usuario_user_permissions; Type: TABLE DATA; Schema: public; Owner: tcc_user
--

COPY public.accounts_usuario_user_permissions (id, usuario_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3136 (class 0 OID 18829)
-- Dependencies: 203
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: tcc_user
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 18839)
-- Dependencies: 205
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: tcc_user
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 18821)
-- Dependencies: 201
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: tcc_user
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 18979)
-- Dependencies: 219
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: tcc_user
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 18811)
-- Dependencies: 199
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: tcc_user
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 18800)
-- Dependencies: 197
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: tcc_user
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-06-07 14:38:06.539-03
2	contenttypes	0002_remove_content_type_name	2019-06-07 14:38:06.580938-03
3	auth	0001_initial	2019-06-07 14:38:07.08351-03
4	auth	0002_alter_permission_name_max_length	2019-06-07 14:38:07.124963-03
5	auth	0003_alter_user_email_max_length	2019-06-07 14:38:07.148648-03
6	auth	0004_alter_user_username_opts	2019-06-07 14:38:07.165946-03
7	auth	0005_alter_user_last_login_null	2019-06-07 14:38:07.187142-03
8	auth	0006_require_contenttypes_0002	2019-06-07 14:38:07.204299-03
9	auth	0007_alter_validators_add_error_messages	2019-06-07 14:38:07.231607-03
10	auth	0008_alter_user_username_max_length	2019-06-07 14:38:07.254562-03
11	accounts	0001_initial	2019-06-07 14:38:08.469777-03
12	admin	0001_initial	2019-06-07 14:38:08.768924-03
13	admin	0002_logentry_remove_auto_add	2019-06-07 14:38:08.865268-03
14	trabalhos	0001_initial	2019-06-07 14:38:09.457066-03
15	mensagem	0001_initial	2019-06-07 14:38:09.777734-03
16	mensagem	0002_auto_20181019_0120	2019-06-07 14:38:10.090882-03
17	mensagem	0003_auto_20181019_0123	2019-06-07 14:38:10.18337-03
18	mensagem	0004_auto_20181019_0125	2019-06-07 14:38:10.455033-03
19	mensagem	0005_auto_20181019_0139	2019-06-07 14:38:10.513841-03
20	mensagem	0006_auto_20181019_0141	2019-06-07 14:38:10.549953-03
21	mensagem	0007_auto_20181019_0150	2019-06-07 14:38:10.594135-03
22	mensagem	0008_auto_20181019_0153	2019-06-07 14:38:10.627506-03
23	sessions	0001_initial	2019-06-07 14:38:10.830504-03
\.


--
-- TOC entry 3161 (class 0 OID 19105)
-- Dependencies: 228
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: tcc_user
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
ebl9iivaf31kcn0zzobyud98sg11navn	ODI3ODBiYTA0NjhkNTUyM2QwYWQ3NDQxYjdiMWY1ZWIxNWJmMjk2Yjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NTRmY2I4OWEyMWZhN2JjOWMzMzFjNDJiN2QyYjU5Y2VhMmNiZDY2In0=	2019-06-21 15:50:12.141897-03
\.


--
-- TOC entry 3160 (class 0 OID 19059)
-- Dependencies: 227
-- Data for Name: mensagem_emailparticipacaobanca; Type: TABLE DATA; Schema: public; Owner: tcc_user
--

COPY public.mensagem_emailparticipacaobanca (id, key, visualizada, tipo, destinatario_id, remetente_id, trabalho_id) FROM stdin;
1	8984f07f2ebc89218bce851f92368078170ef9e108486eab1a9e9fdf	\N	convite de participação	2	1	2
\.


--
-- TOC entry 3154 (class 0 OID 19004)
-- Dependencies: 221
-- Data for Name: trabalhos_bancatrabalho; Type: TABLE DATA; Schema: public; Owner: tcc_user
--

COPY public.trabalhos_bancatrabalho (id, status, trabalho_id, usuario_id) FROM stdin;
1	aceito_pelo_orientador	1	1
2	aceito_pelo_orientador	2	1
3	aceito_pelo_orientador	3	1
4	aceito_pelo_orientador	4	1
5	pendentes_de_resposta	2	2
6	aceito_pelo_orientador	5	1
\.


--
-- TOC entry 3156 (class 0 OID 19012)
-- Dependencies: 223
-- Data for Name: trabalhos_defesatrabalho; Type: TABLE DATA; Schema: public; Owner: tcc_user
--

COPY public.trabalhos_defesatrabalho (id, local, data, hora, ano, semestre, periodo, status, trabalho_id) FROM stdin;
1	Instituo de Matemática	2019-05-29	16:00:00	2019	1	2019.1	agendado	1
2	Fisica	2019-06-28	10:00:00	2019	2	2019.2	agendado	2
3	PAF I	2019-07-12	12:00:00	2019	2	2019.2	agendado	3
4	Lab IM	2019-06-03	14:30:00	2019	2	2019.2	agendado	4
\.


--
-- TOC entry 3158 (class 0 OID 19023)
-- Dependencies: 225
-- Data for Name: trabalhos_trabalhos; Type: TABLE DATA; Schema: public; Owner: tcc_user
--

COPY public.trabalhos_trabalhos (id, titulo, keywords, autor, co_orientador, resumo, pdf_trabalho, created_at, updated_at, orientador_id) FROM stdin;
1	Titulo 1	abxc;ab;	Autor 1	Professor 1	abc	/media/Tiago_D%C3%B3ria_Paiva_da_Concei%C3%A7%C3%A3o.pdf	2019-06-07 15:19:34.379755-03	2019-06-07 15:19:34.379789-03	1
2	Titulo 2	palavra;	Autor 2	Professor 2	resumo	/media/Pratica%2001%20-%20Servi%C3%A7o%20de%20arquivos%20distribu%C3%ADdos_5wuqQmR.pdf	2019-06-07 15:31:52.927178-03	2019-06-07 15:31:52.927197-03	1
3	Titulo 3	;teste;teste2;teste3;	autor 3	Professor 3	Resumo 3	/media/finis-gerenciador-semi(1)_CaEiHeO.pdf	2019-06-07 15:32:43.039563-03	2019-06-07 15:32:43.039584-03	1
4	Titulo 4	teste;	Autor 4	Professor 4	Resumo	/media/finis-gerenciador-semi_E0QHU8k.pdf	2019-06-07 15:33:13.697034-03	2019-06-07 15:33:13.697057-03	1
5	Titulo 5		Autor 5	Professor 5	Resumo	/media/finis-gerenciador-semi(1)_4anul0t.pdf	2019-06-07 15:48:40.581473-03	2019-06-07 15:48:40.581527-03	1
\.


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 210
-- Name: accounts_novasenha_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tcc_user
--

SELECT pg_catalog.setval('public.accounts_novasenha_id_seq', 1, false);


--
-- TOC entry 3187 (class 0 OID 0)
-- Dependencies: 212
-- Name: accounts_perfil_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tcc_user
--

SELECT pg_catalog.setval('public.accounts_perfil_id_seq', 1, false);


--
-- TOC entry 3188 (class 0 OID 0)
-- Dependencies: 214
-- Name: accounts_titulo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tcc_user
--

SELECT pg_catalog.setval('public.accounts_titulo_id_seq', 1, false);


--
-- TOC entry 3189 (class 0 OID 0)
-- Dependencies: 208
-- Name: accounts_usuario_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tcc_user
--

SELECT pg_catalog.setval('public.accounts_usuario_groups_id_seq', 1, false);


--
-- TOC entry 3190 (class 0 OID 0)
-- Dependencies: 206
-- Name: accounts_usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tcc_user
--

SELECT pg_catalog.setval('public.accounts_usuario_id_seq', 2, true);


--
-- TOC entry 3191 (class 0 OID 0)
-- Dependencies: 216
-- Name: accounts_usuario_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tcc_user
--

SELECT pg_catalog.setval('public.accounts_usuario_user_permissions_id_seq', 1, false);


--
-- TOC entry 3192 (class 0 OID 0)
-- Dependencies: 202
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tcc_user
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 3193 (class 0 OID 0)
-- Dependencies: 204
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tcc_user
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3194 (class 0 OID 0)
-- Dependencies: 200
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tcc_user
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 1, false);


--
-- TOC entry 3195 (class 0 OID 0)
-- Dependencies: 218
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tcc_user
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- TOC entry 3196 (class 0 OID 0)
-- Dependencies: 198
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tcc_user
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 1, false);


--
-- TOC entry 3197 (class 0 OID 0)
-- Dependencies: 196
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tcc_user
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 23, true);


--
-- TOC entry 3198 (class 0 OID 0)
-- Dependencies: 226
-- Name: mensagem_emailparticipacaobanca_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tcc_user
--

SELECT pg_catalog.setval('public.mensagem_emailparticipacaobanca_id_seq', 1, true);


--
-- TOC entry 3199 (class 0 OID 0)
-- Dependencies: 220
-- Name: trabalhos_bancatrabalho_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tcc_user
--

SELECT pg_catalog.setval('public.trabalhos_bancatrabalho_id_seq', 6, true);


--
-- TOC entry 3200 (class 0 OID 0)
-- Dependencies: 222
-- Name: trabalhos_defesatrabalho_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tcc_user
--

SELECT pg_catalog.setval('public.trabalhos_defesatrabalho_id_seq', 4, true);


--
-- TOC entry 3201 (class 0 OID 0)
-- Dependencies: 224
-- Name: trabalhos_trabalhos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tcc_user
--

SELECT pg_catalog.setval('public.trabalhos_trabalhos_id_seq', 5, true);


--
-- TOC entry 2942 (class 2606 OID 18898)
-- Name: accounts_novasenha accounts_novasenha_key_key; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_novasenha
    ADD CONSTRAINT accounts_novasenha_key_key UNIQUE (key);


--
-- TOC entry 2944 (class 2606 OID 18896)
-- Name: accounts_novasenha accounts_novasenha_pkey; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_novasenha
    ADD CONSTRAINT accounts_novasenha_pkey PRIMARY KEY (id);


--
-- TOC entry 2948 (class 2606 OID 18908)
-- Name: accounts_perfil accounts_perfil_descricao_key; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_perfil
    ADD CONSTRAINT accounts_perfil_descricao_key UNIQUE (descricao);


--
-- TOC entry 2950 (class 2606 OID 18906)
-- Name: accounts_perfil accounts_perfil_pkey; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_perfil
    ADD CONSTRAINT accounts_perfil_pkey PRIMARY KEY (id);


--
-- TOC entry 2953 (class 2606 OID 18918)
-- Name: accounts_titulo accounts_titulo_descricao_key; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_titulo
    ADD CONSTRAINT accounts_titulo_descricao_key UNIQUE (descricao);


--
-- TOC entry 2955 (class 2606 OID 18916)
-- Name: accounts_titulo accounts_titulo_pkey; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_titulo
    ADD CONSTRAINT accounts_titulo_pkey PRIMARY KEY (id);


--
-- TOC entry 2936 (class 2606 OID 18888)
-- Name: accounts_usuario_groups accounts_usuario_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_usuario_groups
    ADD CONSTRAINT accounts_usuario_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2939 (class 2606 OID 18939)
-- Name: accounts_usuario_groups accounts_usuario_groups_usuario_id_group_id_90f476d3_uniq; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_usuario_groups
    ADD CONSTRAINT accounts_usuario_groups_usuario_id_group_id_90f476d3_uniq UNIQUE (usuario_id, group_id);


--
-- TOC entry 2929 (class 2606 OID 18878)
-- Name: accounts_usuario accounts_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_usuario
    ADD CONSTRAINT accounts_usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 2957 (class 2606 OID 18974)
-- Name: accounts_usuario_user_permissions accounts_usuario_user_pe_usuario_id_permission_id_0065a2ce_uniq; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_usuario_user_permissions
    ADD CONSTRAINT accounts_usuario_user_pe_usuario_id_permission_id_0065a2ce_uniq UNIQUE (usuario_id, permission_id);


--
-- TOC entry 2960 (class 2606 OID 18926)
-- Name: accounts_usuario_user_permissions accounts_usuario_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_usuario_user_permissions
    ADD CONSTRAINT accounts_usuario_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2933 (class 2606 OID 18880)
-- Name: accounts_usuario accounts_usuario_username_key; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_usuario
    ADD CONSTRAINT accounts_usuario_username_key UNIQUE (username);


--
-- TOC entry 2918 (class 2606 OID 18836)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2923 (class 2606 OID 18865)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2926 (class 2606 OID 18844)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2920 (class 2606 OID 18834)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2913 (class 2606 OID 18851)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2915 (class 2606 OID 18826)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2964 (class 2606 OID 18988)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2908 (class 2606 OID 18818)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2910 (class 2606 OID 18816)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2906 (class 2606 OID 18808)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2987 (class 2606 OID 19112)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2980 (class 2606 OID 19066)
-- Name: mensagem_emailparticipacaobanca mensagem_emailparticipacaobanca_key_key; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.mensagem_emailparticipacaobanca
    ADD CONSTRAINT mensagem_emailparticipacaobanca_key_key UNIQUE (key);


--
-- TOC entry 2982 (class 2606 OID 19064)
-- Name: mensagem_emailparticipacaobanca mensagem_emailparticipacaobanca_pkey; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.mensagem_emailparticipacaobanca
    ADD CONSTRAINT mensagem_emailparticipacaobanca_pkey PRIMARY KEY (id);


--
-- TOC entry 2967 (class 2606 OID 19009)
-- Name: trabalhos_bancatrabalho trabalhos_bancatrabalho_pkey; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.trabalhos_bancatrabalho
    ADD CONSTRAINT trabalhos_bancatrabalho_pkey PRIMARY KEY (id);


--
-- TOC entry 2971 (class 2606 OID 19020)
-- Name: trabalhos_defesatrabalho trabalhos_defesatrabalho_pkey; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.trabalhos_defesatrabalho
    ADD CONSTRAINT trabalhos_defesatrabalho_pkey PRIMARY KEY (id);


--
-- TOC entry 2973 (class 2606 OID 19033)
-- Name: trabalhos_defesatrabalho trabalhos_defesatrabalho_trabalho_id_key; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.trabalhos_defesatrabalho
    ADD CONSTRAINT trabalhos_defesatrabalho_trabalho_id_key UNIQUE (trabalho_id);


--
-- TOC entry 2976 (class 2606 OID 19031)
-- Name: trabalhos_trabalhos trabalhos_trabalhos_pkey; Type: CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.trabalhos_trabalhos
    ADD CONSTRAINT trabalhos_trabalhos_pkey PRIMARY KEY (id);


--
-- TOC entry 2940 (class 1259 OID 18947)
-- Name: accounts_novasenha_key_9834b4bd_like; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX accounts_novasenha_key_9834b4bd_like ON public.accounts_novasenha USING btree (key varchar_pattern_ops);


--
-- TOC entry 2945 (class 1259 OID 18948)
-- Name: accounts_novasenha_user_id_3b922c73; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX accounts_novasenha_user_id_3b922c73 ON public.accounts_novasenha USING btree (user_id);


--
-- TOC entry 2946 (class 1259 OID 18949)
-- Name: accounts_perfil_descricao_e6617f1b_like; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX accounts_perfil_descricao_e6617f1b_like ON public.accounts_perfil USING btree (descricao varchar_pattern_ops);


--
-- TOC entry 2951 (class 1259 OID 18950)
-- Name: accounts_titulo_descricao_bae28331_like; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX accounts_titulo_descricao_bae28331_like ON public.accounts_titulo USING btree (descricao varchar_pattern_ops);


--
-- TOC entry 2934 (class 1259 OID 18941)
-- Name: accounts_usuario_groups_group_id_81d91a41; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX accounts_usuario_groups_group_id_81d91a41 ON public.accounts_usuario_groups USING btree (group_id);


--
-- TOC entry 2937 (class 1259 OID 18940)
-- Name: accounts_usuario_groups_usuario_id_8eb16911; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX accounts_usuario_groups_usuario_id_8eb16911 ON public.accounts_usuario_groups USING btree (usuario_id);


--
-- TOC entry 2927 (class 1259 OID 18951)
-- Name: accounts_usuario_perfil_id_e9959ae0; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX accounts_usuario_perfil_id_e9959ae0 ON public.accounts_usuario USING btree (perfil_id);


--
-- TOC entry 2930 (class 1259 OID 18957)
-- Name: accounts_usuario_titulo_id_decd18bd; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX accounts_usuario_titulo_id_decd18bd ON public.accounts_usuario USING btree (titulo_id);


--
-- TOC entry 2958 (class 1259 OID 18976)
-- Name: accounts_usuario_user_permissions_permission_id_3de42c14; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX accounts_usuario_user_permissions_permission_id_3de42c14 ON public.accounts_usuario_user_permissions USING btree (permission_id);


--
-- TOC entry 2961 (class 1259 OID 18975)
-- Name: accounts_usuario_user_permissions_usuario_id_d048ad71; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX accounts_usuario_user_permissions_usuario_id_d048ad71 ON public.accounts_usuario_user_permissions USING btree (usuario_id);


--
-- TOC entry 2931 (class 1259 OID 18927)
-- Name: accounts_usuario_username_c366c69f_like; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX accounts_usuario_username_c366c69f_like ON public.accounts_usuario USING btree (username varchar_pattern_ops);


--
-- TOC entry 2916 (class 1259 OID 18853)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2921 (class 1259 OID 18866)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 2924 (class 1259 OID 18867)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2911 (class 1259 OID 18852)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 2962 (class 1259 OID 18999)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 2965 (class 1259 OID 19000)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 2985 (class 1259 OID 19114)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 2988 (class 1259 OID 19113)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2977 (class 1259 OID 19083)
-- Name: mensagem_emailparticipacaobanca_destinatario_id_536457f9; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX mensagem_emailparticipacaobanca_destinatario_id_536457f9 ON public.mensagem_emailparticipacaobanca USING btree (destinatario_id);


--
-- TOC entry 2978 (class 1259 OID 19082)
-- Name: mensagem_emailparticipacaobanca_key_7add2ac3_like; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX mensagem_emailparticipacaobanca_key_7add2ac3_like ON public.mensagem_emailparticipacaobanca USING btree (key varchar_pattern_ops);


--
-- TOC entry 2983 (class 1259 OID 19084)
-- Name: mensagem_emailparticipacaobanca_remetente_id_8b24bfb3; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX mensagem_emailparticipacaobanca_remetente_id_8b24bfb3 ON public.mensagem_emailparticipacaobanca USING btree (remetente_id);


--
-- TOC entry 2984 (class 1259 OID 19085)
-- Name: mensagem_emailparticipacaobanca_trabalho_id_0b4c691b; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX mensagem_emailparticipacaobanca_trabalho_id_0b4c691b ON public.mensagem_emailparticipacaobanca USING btree (trabalho_id);


--
-- TOC entry 2968 (class 1259 OID 19045)
-- Name: trabalhos_bancatrabalho_trabalho_id_082df32a; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX trabalhos_bancatrabalho_trabalho_id_082df32a ON public.trabalhos_bancatrabalho USING btree (trabalho_id);


--
-- TOC entry 2969 (class 1259 OID 19051)
-- Name: trabalhos_bancatrabalho_usuario_id_6363c77a; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX trabalhos_bancatrabalho_usuario_id_6363c77a ON public.trabalhos_bancatrabalho USING btree (usuario_id);


--
-- TOC entry 2974 (class 1259 OID 19039)
-- Name: trabalhos_trabalhos_orientador_id_5b4d9b24; Type: INDEX; Schema: public; Owner: tcc_user
--

CREATE INDEX trabalhos_trabalhos_orientador_id_5b4d9b24 ON public.trabalhos_trabalhos USING btree (orientador_id);


--
-- TOC entry 2996 (class 2606 OID 18942)
-- Name: accounts_novasenha accounts_novasenha_user_id_3b922c73_fk_accounts_usuario_id; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_novasenha
    ADD CONSTRAINT accounts_novasenha_user_id_3b922c73_fk_accounts_usuario_id FOREIGN KEY (user_id) REFERENCES public.accounts_usuario(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2994 (class 2606 OID 18928)
-- Name: accounts_usuario_groups accounts_usuario_gro_usuario_id_8eb16911_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_usuario_groups
    ADD CONSTRAINT accounts_usuario_gro_usuario_id_8eb16911_fk_accounts_ FOREIGN KEY (usuario_id) REFERENCES public.accounts_usuario(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2995 (class 2606 OID 18933)
-- Name: accounts_usuario_groups accounts_usuario_groups_group_id_81d91a41_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_usuario_groups
    ADD CONSTRAINT accounts_usuario_groups_group_id_81d91a41_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2992 (class 2606 OID 18952)
-- Name: accounts_usuario accounts_usuario_perfil_id_e9959ae0_fk_accounts_perfil_id; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_usuario
    ADD CONSTRAINT accounts_usuario_perfil_id_e9959ae0_fk_accounts_perfil_id FOREIGN KEY (perfil_id) REFERENCES public.accounts_perfil(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2993 (class 2606 OID 18958)
-- Name: accounts_usuario accounts_usuario_titulo_id_decd18bd_fk_accounts_titulo_id; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_usuario
    ADD CONSTRAINT accounts_usuario_titulo_id_decd18bd_fk_accounts_titulo_id FOREIGN KEY (titulo_id) REFERENCES public.accounts_titulo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2998 (class 2606 OID 18968)
-- Name: accounts_usuario_user_permissions accounts_usuario_use_permission_id_3de42c14_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_usuario_user_permissions
    ADD CONSTRAINT accounts_usuario_use_permission_id_3de42c14_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2997 (class 2606 OID 18963)
-- Name: accounts_usuario_user_permissions accounts_usuario_use_usuario_id_d048ad71_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.accounts_usuario_user_permissions
    ADD CONSTRAINT accounts_usuario_use_usuario_id_d048ad71_fk_accounts_ FOREIGN KEY (usuario_id) REFERENCES public.accounts_usuario(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2991 (class 2606 OID 18859)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2990 (class 2606 OID 18854)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2989 (class 2606 OID 18845)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2999 (class 2606 OID 18989)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3000 (class 2606 OID 18994)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_accounts_usuario_id; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_accounts_usuario_id FOREIGN KEY (user_id) REFERENCES public.accounts_usuario(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3005 (class 2606 OID 19067)
-- Name: mensagem_emailparticipacaobanca mensagem_emailpartic_destinatario_id_536457f9_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.mensagem_emailparticipacaobanca
    ADD CONSTRAINT mensagem_emailpartic_destinatario_id_536457f9_fk_accounts_ FOREIGN KEY (destinatario_id) REFERENCES public.accounts_usuario(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3006 (class 2606 OID 19072)
-- Name: mensagem_emailparticipacaobanca mensagem_emailpartic_remetente_id_8b24bfb3_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.mensagem_emailparticipacaobanca
    ADD CONSTRAINT mensagem_emailpartic_remetente_id_8b24bfb3_fk_accounts_ FOREIGN KEY (remetente_id) REFERENCES public.accounts_usuario(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3007 (class 2606 OID 19077)
-- Name: mensagem_emailparticipacaobanca mensagem_emailpartic_trabalho_id_0b4c691b_fk_trabalhos; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.mensagem_emailparticipacaobanca
    ADD CONSTRAINT mensagem_emailpartic_trabalho_id_0b4c691b_fk_trabalhos FOREIGN KEY (trabalho_id) REFERENCES public.trabalhos_trabalhos(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3001 (class 2606 OID 19046)
-- Name: trabalhos_bancatrabalho trabalhos_bancatraba_trabalho_id_082df32a_fk_trabalhos; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.trabalhos_bancatrabalho
    ADD CONSTRAINT trabalhos_bancatraba_trabalho_id_082df32a_fk_trabalhos FOREIGN KEY (trabalho_id) REFERENCES public.trabalhos_trabalhos(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3002 (class 2606 OID 19052)
-- Name: trabalhos_bancatrabalho trabalhos_bancatraba_usuario_id_6363c77a_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.trabalhos_bancatrabalho
    ADD CONSTRAINT trabalhos_bancatraba_usuario_id_6363c77a_fk_accounts_ FOREIGN KEY (usuario_id) REFERENCES public.accounts_usuario(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3003 (class 2606 OID 19040)
-- Name: trabalhos_defesatrabalho trabalhos_defesatrab_trabalho_id_fc968fd3_fk_trabalhos; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.trabalhos_defesatrabalho
    ADD CONSTRAINT trabalhos_defesatrab_trabalho_id_fc968fd3_fk_trabalhos FOREIGN KEY (trabalho_id) REFERENCES public.trabalhos_trabalhos(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3004 (class 2606 OID 19034)
-- Name: trabalhos_trabalhos trabalhos_trabalhos_orientador_id_5b4d9b24_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: tcc_user
--

ALTER TABLE ONLY public.trabalhos_trabalhos
    ADD CONSTRAINT trabalhos_trabalhos_orientador_id_5b4d9b24_fk_accounts_ FOREIGN KEY (orientador_id) REFERENCES public.accounts_usuario(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2019-06-07 16:16:24 -03

--
-- PostgreSQL database dump complete
--

