--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

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
-- Name: accounts_account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_account (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    phone_number character varying(50) NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_admin boolean NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    is_superadmin boolean NOT NULL
);


ALTER TABLE public.accounts_account OWNER TO postgres;

--
-- Name: accounts_account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_account_id_seq OWNER TO postgres;

--
-- Name: accounts_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_account_id_seq OWNED BY public.accounts_account.id;


--
-- Name: accounts_userprofile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_userprofile (
    id bigint NOT NULL,
    address_line_1 character varying(100) NOT NULL,
    address_line_2 character varying(100) NOT NULL,
    profile_picture character varying(100) NOT NULL,
    city character varying(20) NOT NULL,
    state character varying(20) NOT NULL,
    country character varying(20) NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.accounts_userprofile OWNER TO postgres;

--
-- Name: accounts_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_userprofile_id_seq OWNER TO postgres;

--
-- Name: accounts_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_userprofile_id_seq OWNED BY public.accounts_userprofile.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: carts_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carts_cart (
    id bigint NOT NULL,
    cart_id character varying(250) NOT NULL,
    date_added date NOT NULL
);


ALTER TABLE public.carts_cart OWNER TO postgres;

--
-- Name: carts_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carts_cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carts_cart_id_seq OWNER TO postgres;

--
-- Name: carts_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carts_cart_id_seq OWNED BY public.carts_cart.id;


--
-- Name: carts_cartitem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carts_cartitem (
    id bigint NOT NULL,
    quantity integer NOT NULL,
    is_active boolean NOT NULL,
    cart_id bigint,
    product_id bigint NOT NULL,
    user_id bigint
);


ALTER TABLE public.carts_cartitem OWNER TO postgres;

--
-- Name: carts_cartitem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carts_cartitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carts_cartitem_id_seq OWNER TO postgres;

--
-- Name: carts_cartitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carts_cartitem_id_seq OWNED BY public.carts_cartitem.id;


--
-- Name: carts_cartitem_variations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carts_cartitem_variations (
    id bigint NOT NULL,
    cartitem_id bigint NOT NULL,
    variation_id bigint NOT NULL
);


ALTER TABLE public.carts_cartitem_variations OWNER TO postgres;

--
-- Name: carts_cartitem_variations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carts_cartitem_variations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carts_cartitem_variations_id_seq OWNER TO postgres;

--
-- Name: carts_cartitem_variations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carts_cartitem_variations_id_seq OWNED BY public.carts_cartitem_variations.id;


--
-- Name: category_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category_category (
    id bigint NOT NULL,
    category_name character varying(50) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(250) NOT NULL,
    cat_image character varying(100) NOT NULL,
    level integer NOT NULL,
    lft integer NOT NULL,
    parent_id bigint,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    CONSTRAINT category_category_level_check CHECK ((level >= 0)),
    CONSTRAINT category_category_lft_check CHECK ((lft >= 0)),
    CONSTRAINT category_category_rght_check CHECK ((rght >= 0)),
    CONSTRAINT category_category_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.category_category OWNER TO postgres;

--
-- Name: category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_category_id_seq OWNER TO postgres;

--
-- Name: category_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_category_id_seq OWNED BY public.category_category.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: orders_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders_order (
    id bigint NOT NULL,
    order_number character varying(20) NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    phone character varying(15) NOT NULL,
    email character varying(50) NOT NULL,
    address_line_1 character varying(50) NOT NULL,
    address_line_2 character varying(50) NOT NULL,
    country character varying(50) NOT NULL,
    state character varying(50) NOT NULL,
    city character varying(50) NOT NULL,
    order_note character varying(100) NOT NULL,
    order_total double precision NOT NULL,
    tax double precision NOT NULL,
    status character varying(30) NOT NULL,
    ip character varying(20) NOT NULL,
    is_ordered boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id bigint
);


ALTER TABLE public.orders_order OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_order_id_seq OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders_order.id;


--
-- Name: orders_orderproduct; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders_orderproduct (
    id bigint NOT NULL,
    quantity integer NOT NULL,
    product_price double precision NOT NULL,
    ordered boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    order_id bigint NOT NULL,
    product_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.orders_orderproduct OWNER TO postgres;

--
-- Name: orders_orderproduct_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_orderproduct_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_orderproduct_id_seq OWNER TO postgres;

--
-- Name: orders_orderproduct_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_orderproduct_id_seq OWNED BY public.orders_orderproduct.id;


--
-- Name: orders_orderproduct_variations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders_orderproduct_variations (
    id bigint NOT NULL,
    orderproduct_id bigint NOT NULL,
    variation_id bigint NOT NULL
);


ALTER TABLE public.orders_orderproduct_variations OWNER TO postgres;

--
-- Name: orders_orderproduct_variations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_orderproduct_variations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_orderproduct_variations_id_seq OWNER TO postgres;

--
-- Name: orders_orderproduct_variations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_orderproduct_variations_id_seq OWNED BY public.orders_orderproduct_variations.id;


--
-- Name: orders_payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders_payment (
    id bigint NOT NULL,
    payment_id character varying(100) NOT NULL,
    payment_method character varying(100) NOT NULL,
    amount_paid character varying(100) NOT NULL,
    status character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.orders_payment OWNER TO postgres;

--
-- Name: orders_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_payment_id_seq OWNER TO postgres;

--
-- Name: orders_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_payment_id_seq OWNED BY public.orders_payment.id;


--
-- Name: store_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_product (
    id bigint NOT NULL,
    product_name character varying(200) NOT NULL,
    slug character varying(200) NOT NULL,
    description text NOT NULL,
    price integer NOT NULL,
    images character varying(100) NOT NULL,
    stock integer NOT NULL,
    is_available boolean NOT NULL,
    created_date timestamp with time zone NOT NULL,
    modified_date timestamp with time zone NOT NULL,
    category_id bigint NOT NULL,
    big_description text NOT NULL
);


ALTER TABLE public.store_product OWNER TO postgres;

--
-- Name: store_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.store_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_product_id_seq OWNER TO postgres;

--
-- Name: store_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.store_product_id_seq OWNED BY public.store_product.id;


--
-- Name: store_productgallery; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_productgallery (
    id bigint NOT NULL,
    image character varying(255) NOT NULL,
    product_id bigint NOT NULL
);


ALTER TABLE public.store_productgallery OWNER TO postgres;

--
-- Name: store_productgallery_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.store_productgallery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_productgallery_id_seq OWNER TO postgres;

--
-- Name: store_productgallery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.store_productgallery_id_seq OWNED BY public.store_productgallery.id;


--
-- Name: store_reviewrating; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_reviewrating (
    id bigint NOT NULL,
    subject character varying(100) NOT NULL,
    review text NOT NULL,
    rating double precision NOT NULL,
    ip character varying(20) NOT NULL,
    status boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    product_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.store_reviewrating OWNER TO postgres;

--
-- Name: store_reviewrating_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.store_reviewrating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_reviewrating_id_seq OWNER TO postgres;

--
-- Name: store_reviewrating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.store_reviewrating_id_seq OWNED BY public.store_reviewrating.id;


--
-- Name: store_variation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store_variation (
    id bigint NOT NULL,
    variation_category character varying(100) NOT NULL,
    variation_value character varying(100) NOT NULL,
    is_active boolean NOT NULL,
    created_date timestamp with time zone NOT NULL,
    product_id bigint NOT NULL
);


ALTER TABLE public.store_variation OWNER TO postgres;

--
-- Name: store_variation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.store_variation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_variation_id_seq OWNER TO postgres;

--
-- Name: store_variation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.store_variation_id_seq OWNED BY public.store_variation.id;


--
-- Name: accounts_account id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_account ALTER COLUMN id SET DEFAULT nextval('public.accounts_account_id_seq'::regclass);


--
-- Name: accounts_userprofile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userprofile ALTER COLUMN id SET DEFAULT nextval('public.accounts_userprofile_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: carts_cart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts_cart ALTER COLUMN id SET DEFAULT nextval('public.carts_cart_id_seq'::regclass);


--
-- Name: carts_cartitem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts_cartitem ALTER COLUMN id SET DEFAULT nextval('public.carts_cartitem_id_seq'::regclass);


--
-- Name: carts_cartitem_variations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts_cartitem_variations ALTER COLUMN id SET DEFAULT nextval('public.carts_cartitem_variations_id_seq'::regclass);


--
-- Name: category_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_category ALTER COLUMN id SET DEFAULT nextval('public.category_category_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: orders_order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_order ALTER COLUMN id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- Name: orders_orderproduct id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_orderproduct ALTER COLUMN id SET DEFAULT nextval('public.orders_orderproduct_id_seq'::regclass);


--
-- Name: orders_orderproduct_variations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_orderproduct_variations ALTER COLUMN id SET DEFAULT nextval('public.orders_orderproduct_variations_id_seq'::regclass);


--
-- Name: orders_payment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_payment ALTER COLUMN id SET DEFAULT nextval('public.orders_payment_id_seq'::regclass);


--
-- Name: store_product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_product ALTER COLUMN id SET DEFAULT nextval('public.store_product_id_seq'::regclass);


--
-- Name: store_productgallery id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_productgallery ALTER COLUMN id SET DEFAULT nextval('public.store_productgallery_id_seq'::regclass);


--
-- Name: store_reviewrating id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_reviewrating ALTER COLUMN id SET DEFAULT nextval('public.store_reviewrating_id_seq'::regclass);


--
-- Name: store_variation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_variation ALTER COLUMN id SET DEFAULT nextval('public.store_variation_id_seq'::regclass);


--
-- Data for Name: accounts_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_account (id, password, first_name, last_name, username, email, phone_number, date_joined, last_login, is_admin, is_staff, is_active, is_superadmin) FROM stdin;
1	pbkdf2_sha256$390000$l6ecaphLWtHlcPRVY9RWT2$ezy7CIn+09eT97iop4J/rp2h0yMrAVr8w2+N5KjaIXw=	Igor	Korotkevitch	iko	i_korotkevitch@mail.ru		2022-09-12 13:47:50.416759+03	2022-10-03 10:31:50.884136+03	t	t	t	t
2	pbkdf2_sha256$390000$IeuvVALGJQXq28ZtVMoVi8$JVEsBHZwi0+FXWHtIr/gEXBCbZU5uFYNkMQuiIi5nuw=	Игорь	Короткевич	i.korotkevitch	i.korotkevitch@gmail.com	80297351867	2022-09-18 18:17:46.663134+03	2022-10-03 18:33:10.474252+03	f	f	t	f
3	pbkdf2_sha256$390000$B2FkSUNDMLOuYNP5aagxu7$4KxtbKiSOidmJdyxHvFys128fIb5Zea5G/iD/D58qMo=	Игорь	Короткевич	info	info@iko-studio.com	80297351867	2022-09-19 13:31:15.175748+03	2022-09-19 13:40:51.477419+03	f	f	t	f
\.


--
-- Data for Name: accounts_userprofile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_userprofile (id, address_line_1, address_line_2, profile_picture, city, state, country, user_id) FROM stdin;
1			userprofile/Igor_400_K7TUBy0.jpg				2
2			default/default-user.png				3
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
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
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add Категория	6	add_category
22	Can change Категория	6	change_category
23	Can delete Категория	6	delete_category
24	Can view Категория	6	view_category
25	Can add account	7	add_account
26	Can change account	7	change_account
27	Can delete account	7	delete_account
28	Can view account	7	view_account
29	Can add user profile	8	add_userprofile
30	Can change user profile	8	change_userprofile
31	Can delete user profile	8	delete_userprofile
32	Can view user profile	8	view_userprofile
33	Can add product	9	add_product
34	Can change product	9	change_product
35	Can delete product	9	delete_product
36	Can view product	9	view_product
37	Can add variation	10	add_variation
38	Can change variation	10	change_variation
39	Can delete variation	10	delete_variation
40	Can view variation	10	view_variation
41	Can add review rating	11	add_reviewrating
42	Can change review rating	11	change_reviewrating
43	Can delete review rating	11	delete_reviewrating
44	Can view review rating	11	view_reviewrating
45	Can add productgallery	12	add_productgallery
46	Can change productgallery	12	change_productgallery
47	Can delete productgallery	12	delete_productgallery
48	Can view productgallery	12	view_productgallery
49	Can add cart	13	add_cart
50	Can change cart	13	change_cart
51	Can delete cart	13	delete_cart
52	Can view cart	13	view_cart
53	Can add cart item	14	add_cartitem
54	Can change cart item	14	change_cartitem
55	Can delete cart item	14	delete_cartitem
56	Can view cart item	14	view_cartitem
57	Can add order	15	add_order
58	Can change order	15	change_order
59	Can delete order	15	delete_order
60	Can view order	15	view_order
61	Can add payment	16	add_payment
62	Can change payment	16	change_payment
63	Can delete payment	16	delete_payment
64	Can view payment	16	view_payment
65	Can add order product	17	add_orderproduct
66	Can change order product	17	change_orderproduct
67	Can delete order product	17	delete_orderproduct
68	Can view order product	17	view_orderproduct
\.


--
-- Data for Name: carts_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carts_cart (id, cart_id, date_added) FROM stdin;
1	2r9rmujv85x0bz8jx3htwo29wxlp10it	2022-09-14
2	cpq78r14a2gnjgfxfy9w77gl17bx9b4l	2022-09-15
3	xqa90ozi9cagw718d1nb5g4cvsf9r5wk	2022-09-15
4	n8tks5r7i8rfbqnjllai8bo09fprjvsd	2022-09-15
5	bx144vjur4ty5l8f1dokud4ioq9do6x8	2022-09-16
6	lg1iegc8pgf7ommyqc6ey90mfhy9f6uf	2022-09-17
7	lbh7ierfycqis5o8rvfexb8v5iu9hd7c	2022-09-18
8	a8au8y5ulgl7byxcdpupbuvbnaabaik0	2022-09-18
9	jy5ah10hijqy97tc648u8a3jmxayieh4	2022-10-02
10	k296jiy67zgfu7nhppe5uyfu4kztll38	2022-10-03
\.


--
-- Data for Name: carts_cartitem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carts_cartitem (id, quantity, is_active, cart_id, product_id, user_id) FROM stdin;
62	2	t	9	16	\N
\.


--
-- Data for Name: carts_cartitem_variations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carts_cartitem_variations (id, cartitem_id, variation_id) FROM stdin;
123	62	13
124	62	14
\.


--
-- Data for Name: category_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category_category (id, category_name, slug, description, cat_image, level, lft, parent_id, rght, tree_id) FROM stdin;
11	Шапочки	shapochki	Шапочки для новорожденных	photos/categories/sha-01.jpg	0	1	\N	2	8
9	Ползунки	polzunki	Ползунки для малыша можно использовать дома, в роддоме или на прогулке.	photos/categories/pol-01.jpg	0	1	\N	2	7
8	Бортики в кроватку	bortiki-v-krovatku	Бортики в кроватку - это надежный защитный барьер для ребенка от ударов о прутья кроватки.	photos/categories/bort-01.jpg	0	1	\N	2	4
12	Пледы детские	pledy-detskie	Пледы детские в кроватку, коляску	photos/categories/ple-01.jpg	0	1	\N	2	6
10	Комбинезоны	kombinezony	Какой комбинезон для новорожденного лучше купить. Опытные родители знают, что зимние или демисезонные комбинезоны лучше брать немного на вырост.	photos/categories/kom-01.jpg	0	1	\N	2	5
7	Конверты на выписку	konverty-na-vypisku	Выписка из роддома — событие всегда торжественное и волнительное.  Сделайте его красивым!	photos/categories/01-removebg-preview.png	0	1	\N	2	2
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-09-12 15:31:32.435621+03	1	Обувь спортивная	1	[{"added": {}}]	6	1
2	2022-09-12 15:32:43.005358+03	1	Кеды	1	[{"added": {}}]	9	1
3	2022-09-12 15:33:25.221112+03	1	Кеды	2	[{"added": {"name": "productgallery", "object": "\\u041a\\u0435\\u0434\\u044b"}}, {"added": {"name": "productgallery", "object": "\\u041a\\u0435\\u0434\\u044b"}}, {"added": {"name": "productgallery", "object": "\\u041a\\u0435\\u0434\\u044b"}}]	9	1
4	2022-09-12 15:51:55.316681+03	2	Одежда зимняя	1	[{"added": {}}]	6	1
5	2022-09-12 15:53:22.192702+03	2	Куртка с капюшоном	1	[{"added": {}}, {"added": {"name": "productgallery", "object": "\\u041a\\u0443\\u0440\\u0442\\u043a\\u0430 \\u0441 \\u043a\\u0430\\u043f\\u044e\\u0448\\u043e\\u043d\\u043e\\u043c"}}]	9	1
6	2022-09-12 15:54:38.408522+03	3	Одежда летняя	1	[{"added": {}}]	6	1
7	2022-09-12 15:55:20.413207+03	4	Шорты	1	[{"added": {}}]	6	1
8	2022-09-12 16:54:20.405741+03	3	Шорты джинсовые	1	[{"added": {}}, {"added": {"name": "productgallery", "object": "\\u0428\\u043e\\u0440\\u0442\\u044b \\u0434\\u0436\\u0438\\u043d\\u0441\\u043e\\u0432\\u044b\\u0435"}}]	9	1
9	2022-09-12 16:57:48.515048+03	3	Шорты джинсовые	2	[]	9	1
10	2022-09-12 19:31:11.632458+03	4	Поло	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u041f\\u043e\\u043b\\u043e"}}]	9	1
11	2022-09-12 19:54:56.252346+03	1	Обувь спортивная	2	[{"changed": {"fields": ["\\u041a\\u0440\\u0430\\u0442\\u043a\\u043e \\u043e \\u043a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u0438"]}}]	6	1
12	2022-09-13 08:26:33.06615+03	5	Шорты 2	1	[{"added": {}}]	9	1
13	2022-09-13 08:26:52.963651+03	5	Шорты 2	2	[{"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u0428\\u043e\\u0440\\u0442\\u044b 2"}}]	9	1
14	2022-09-13 15:54:21.965406+03	6	Шорты 3	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u0428\\u043e\\u0440\\u0442\\u044b 3"}}]	9	1
15	2022-09-13 15:56:06.215415+03	7	Шорты 4	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u0428\\u043e\\u0440\\u0442\\u044b 4"}}]	9	1
16	2022-09-13 15:57:11.264295+03	8	Шорты 5	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u0428\\u043e\\u0440\\u0442\\u044b 5"}}]	9	1
17	2022-09-13 16:00:30.475707+03	9	Шорты 6	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u0428\\u043e\\u0440\\u0442\\u044b 6"}}]	9	1
18	2022-09-13 16:01:39.211802+03	6	Шорты 3	2	[{"changed": {"fields": ["\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435"]}}]	9	1
19	2022-09-13 16:02:03.141704+03	7	Шорты 4	2	[{"changed": {"fields": ["\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435"]}}]	9	1
20	2022-09-13 16:02:32.029054+03	8	Шорты 5	2	[{"changed": {"fields": ["\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435"]}}]	9	1
21	2022-09-13 16:03:29.092499+03	9	Шорты 6	2	[]	9	1
22	2022-09-13 16:03:59.747606+03	3	Шорты 1	2	[{"changed": {"fields": ["\\u0422\\u043e\\u0432\\u0430\\u0440", "\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435"]}}]	9	1
23	2022-09-13 17:23:24.277173+03	4	Шорты	2	[{"changed": {"fields": ["\\u041a\\u0440\\u0430\\u0442\\u043a\\u043e \\u043e \\u043a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u0438"]}}]	6	1
24	2022-09-14 10:52:27.057826+03	3	Шорты 1	2	[{"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u0428\\u043e\\u0440\\u0442\\u044b 1"}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u0428\\u043e\\u0440\\u0442\\u044b 1"}}]	9	1
25	2022-09-14 12:35:02.092095+03	1	Кеды	2	[{"changed": {"fields": ["\\u041f\\u043e\\u0434\\u0440\\u043e\\u0431\\u043d\\u043e\\u0435 \\u043e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435"]}}]	9	1
26	2022-09-14 21:07:09.51809+03	1	Цвет: синий	1	[{"added": {}}]	10	1
27	2022-09-14 21:07:44.913802+03	2	Размер: 42	1	[{"added": {}}]	10	1
28	2022-09-15 10:33:43.492854+03	3	Цвет: хаки	1	[{"added": {}}]	10	1
29	2022-09-15 10:34:20.325061+03	4	Размер: 48 - 50	1	[{"added": {}}]	10	1
30	2022-09-16 22:07:52.060698+03	5	Куртка с капюшоном	3		17	1
31	2022-09-16 22:07:52.108388+03	3	Куртка с капюшоном	3		17	1
32	2022-09-16 22:09:02.041268+03	1	Куртка с капюшоном	3		17	1
33	2022-09-16 22:11:18.702986+03	6	Кеды	3		17	1
34	2022-09-16 22:11:18.708999+03	4	Кеды	3		17	1
35	2022-09-16 22:11:18.713865+03	2	Кеды	3		17	1
36	2022-09-16 22:14:36.658976+03	9	Куртка с капюшоном	2	[{"changed": {"fields": ["Ordered"]}}]	17	1
37	2022-09-16 22:17:02.625961+03	8	Кеды	2	[{"changed": {"fields": ["Ordered"]}}]	17	1
38	2022-09-16 22:17:22.028426+03	9	Куртка с капюшоном	2	[{"changed": {"fields": ["Ordered"]}}]	17	1
39	2022-09-16 22:32:32.932688+03	9	Куртка с капюшоном	2	[{"changed": {"fields": ["Ordered"]}}]	17	1
40	2022-09-16 22:33:13.050276+03	7	Куртка с капюшоном	2	[{"changed": {"fields": ["Ordered"]}}]	17	1
41	2022-09-17 08:04:15.711233+03	10	Кеды	2	[{"changed": {"fields": ["Ordered"]}}]	17	1
42	2022-09-17 18:56:51.379592+03	10	Кеды	2	[{"changed": {"fields": ["Ordered"]}}]	17	1
43	2022-09-19 08:24:23.506149+03	10	Сумка-портфель	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u0421\\u0443\\u043c\\u043a\\u0430-\\u043f\\u043e\\u0440\\u0442\\u0444\\u0435\\u043b\\u044c"}}]	9	1
44	2022-09-19 08:25:56.270202+03	5	Галантерея	1	[{"added": {}}]	6	1
45	2022-09-19 08:26:31.75247+03	10	Сумка-портфель	2	[{"changed": {"fields": ["\\u041a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u044f"]}}]	9	1
46	2022-09-19 09:22:27.950741+03	11	Наушники	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u041d\\u0430\\u0443\\u0448\\u043d\\u0438\\u043a\\u0438"}}]	9	1
47	2022-09-19 09:23:28.577649+03	6	Электроника	1	[{"added": {}}]	6	1
48	2022-09-19 09:24:00.480233+03	11	Наушники	2	[{"changed": {"fields": ["\\u041a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u044f"]}}]	9	1
49	2022-09-19 09:25:44.397358+03	5	Цвет: черный	1	[{"added": {}}]	10	1
50	2022-09-19 09:26:17.331719+03	6	Размер: стандарт	1	[{"added": {}}]	10	1
51	2022-09-19 09:26:51.564489+03	7	Цвет: голубой	1	[{"added": {}}]	10	1
52	2022-09-19 09:27:22.294794+03	8	Размер: 30 * 60 см.	1	[{"added": {}}]	10	1
53	2022-09-19 09:31:34.099868+03	12	Радиоприемник	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u0420\\u0430\\u0434\\u0438\\u043e\\u043f\\u0440\\u0438\\u0435\\u043c\\u043d\\u0438\\u043a"}}]	9	1
97	2022-09-22 09:47:51.768262+03	28	Размер: 30 * 30 см.	1	[{"added": {}}]	10	1
54	2022-09-19 09:33:14.418526+03	13	Часы с радио	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u0427\\u0430\\u0441\\u044b \\u0441 \\u0440\\u0430\\u0434\\u0438\\u043e"}}]	9	1
55	2022-09-19 10:02:44.910363+03	23	Игорь	2	[{"changed": {"fields": ["Is ordered"]}}]	15	1
56	2022-09-19 10:07:17.64453+03	23	Игорь	2	[{"changed": {"fields": ["Status"]}}]	15	1
57	2022-09-19 19:39:08.167267+03	7	Конверты на выписку	1	[{"added": {}}]	6	1
58	2022-09-19 19:45:36.852312+03	14	Одеяло-конверт (арт. Конв-01)	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u041e\\u0434\\u0435\\u044f\\u043b\\u043e-\\u043a\\u043e\\u043d\\u0432\\u0435\\u0440\\u0442 (\\u0430\\u0440\\u0442. \\u041a\\u043e\\u043d\\u0432-01)"}}]	9	1
59	2022-09-19 19:48:43.167956+03	14	Одеяло-конверт с коронами	2	[{"changed": {"fields": ["\\u0422\\u043e\\u0432\\u0430\\u0440", "Slug"]}}]	9	1
60	2022-09-19 19:52:05.955791+03	9	Цвет: сине-белый	1	[{"added": {}}]	10	1
61	2022-09-19 19:56:39.680902+03	10	Размер: 96 * 96 см.	1	[{"added": {}}]	10	1
62	2022-09-19 20:09:16.718336+03	15	Одеяло-конверт "Звездочет"	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u041e\\u0434\\u0435\\u044f\\u043b\\u043e-\\u043a\\u043e\\u043d\\u0432\\u0435\\u0440\\u0442 \\"\\u0417\\u0432\\u0435\\u0437\\u0434\\u043e\\u0447\\u0435\\u0442\\""}}]	9	1
63	2022-09-19 20:11:27.446557+03	11	Цвет: разноцветное	1	[{"added": {}}]	10	1
64	2022-09-19 20:11:59.210207+03	12	Размер: 96 * 96 см.	1	[{"added": {}}]	10	1
65	2022-09-19 20:17:21.59359+03	16	Меховой конверт "Медвежонок"	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u041c\\u0435\\u0445\\u043e\\u0432\\u043e\\u0439 \\u043a\\u043e\\u043d\\u0432\\u0435\\u0440\\u0442 \\"\\u041c\\u0435\\u0434\\u0432\\u0435\\u0436\\u043e\\u043d\\u043e\\u043a\\""}}]	9	1
66	2022-09-19 20:18:14.954569+03	13	Цвет: белый	1	[{"added": {}}]	10	1
67	2022-09-19 20:18:37.164011+03	14	Размер: 96 * 96 см.	1	[{"added": {}}]	10	1
68	2022-09-19 20:22:26.671956+03	17	Одеяло-конверт "Royal"	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u041e\\u0434\\u0435\\u044f\\u043b\\u043e-\\u043a\\u043e\\u043d\\u0432\\u0435\\u0440\\u0442 \\"Royal\\""}}]	9	1
69	2022-09-19 20:23:18.840349+03	15	Цвет: бело-голубой	1	[{"added": {}}]	10	1
70	2022-09-19 20:23:48.392134+03	16	Размер: 96 * 96 см.	1	[{"added": {}}]	10	1
71	2022-09-19 20:27:45.748773+03	18	Одеяло-конверт "Джентельмен"	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u041e\\u0434\\u0435\\u044f\\u043b\\u043e-\\u043a\\u043e\\u043d\\u0432\\u0435\\u0440\\u0442 \\"\\u0414\\u0436\\u0435\\u043d\\u0442\\u0435\\u043b\\u044c\\u043c\\u0435\\u043d\\""}}]	9	1
72	2022-09-19 20:28:43.039839+03	17	Цвет: бело-синий	1	[{"added": {}}]	10	1
73	2022-09-19 20:29:47.816885+03	18	Размер: 96 * 96 см.	1	[{"added": {}}]	10	1
74	2022-09-20 08:13:38.421199+03	19	Меховой конверт "Нежность"	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u041c\\u0435\\u0445\\u043e\\u0432\\u043e\\u0439 \\u043a\\u043e\\u043d\\u0432\\u0435\\u0440\\u0442 \\"\\u041d\\u0435\\u0436\\u043d\\u043e\\u0441\\u0442\\u044c\\""}}]	9	1
75	2022-09-20 08:18:17.134411+03	19	Цвет: бело-розовый	1	[{"added": {}}]	10	1
76	2022-09-20 08:25:13.219152+03	20	Размер: 0 - 6 мес.	1	[{"added": {}}]	10	1
77	2022-09-20 08:25:48.909891+03	14	Размер: 0 - 6 мес.	2	[{"changed": {"fields": ["Variation value"]}}]	10	1
78	2022-09-20 08:29:52.331173+03	20	Меховой конверт "Мореход"	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u041c\\u0435\\u0445\\u043e\\u0432\\u043e\\u0439 \\u043a\\u043e\\u043d\\u0432\\u0435\\u0440\\u0442 \\"\\u041c\\u043e\\u0440\\u0435\\u0445\\u043e\\u0434\\""}}]	9	1
79	2022-09-20 08:30:36.601467+03	21	Цвет: бело-синий	1	[{"added": {}}]	10	1
80	2022-09-20 08:31:00.120975+03	22	Размер: 0 - 6 мес.	1	[{"added": {}}]	10	1
81	2022-09-20 08:34:51.513702+03	21	Меховой конверт "Птичка"	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u041c\\u0435\\u0445\\u043e\\u0432\\u043e\\u0439 \\u043a\\u043e\\u043d\\u0432\\u0435\\u0440\\u0442 \\"\\u041f\\u0442\\u0438\\u0447\\u043a\\u0430\\""}}]	9	1
82	2022-09-20 08:37:56.465824+03	21	Меховой конверт "Птичка"	2	[{"changed": {"fields": ["\\u041f\\u043e\\u0434\\u0440\\u043e\\u0431\\u043d\\u043e\\u0435 \\u043e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435"]}}]	9	1
83	2022-09-20 08:38:24.225051+03	20	Меховой конверт "Мореход"	2	[{"changed": {"fields": ["\\u041f\\u043e\\u0434\\u0440\\u043e\\u0431\\u043d\\u043e\\u0435 \\u043e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435"]}}]	9	1
84	2022-09-20 08:38:55.593033+03	19	Меховой конверт "Нежность"	2	[{"changed": {"fields": ["\\u041f\\u043e\\u0434\\u0440\\u043e\\u0431\\u043d\\u043e\\u0435 \\u043e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435"]}}]	9	1
85	2022-09-20 08:40:23.076055+03	16	Меховой конверт "Медвежонок"	2	[{"changed": {"fields": ["\\u041f\\u043e\\u0434\\u0440\\u043e\\u0431\\u043d\\u043e\\u0435 \\u043e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435"]}}]	9	1
86	2022-09-20 08:41:29.262372+03	22	Размер: 70 * 40 см.	2	[{"changed": {"fields": ["Variation value"]}}]	10	1
87	2022-09-20 08:41:53.038763+03	20	Размер: 70 * 40 см.	2	[{"changed": {"fields": ["Variation value"]}}]	10	1
88	2022-09-20 08:42:42.325068+03	14	Размер: 70 * 40 см.	2	[{"changed": {"fields": ["Variation value"]}}]	10	1
89	2022-09-20 08:43:37.332479+03	23	Цвет: разноцветный	1	[{"added": {}}]	10	1
90	2022-09-20 08:44:03.195659+03	24	Размер: 70 * 40 см.	1	[{"added": {}}]	10	1
91	2022-09-22 08:39:29.923478+03	8	Бортики в кроватку	1	[{"added": {}}]	6	1
92	2022-09-22 08:44:38.159952+03	22	Бортики в кроватку "Звездочки"	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u0411\\u043e\\u0440\\u0442\\u0438\\u043a\\u0438 \\u0432 \\u043a\\u0440\\u043e\\u0432\\u0430\\u0442\\u043a\\u0443 \\"\\u0417\\u0432\\u0435\\u0437\\u0434\\u043e\\u0447\\u043a\\u0438\\""}}]	9	1
93	2022-09-22 08:47:43.25889+03	25	Цвет: рисунок - звездочки	1	[{"added": {}}]	10	1
94	2022-09-22 08:48:41.348308+03	26	Размер: 50 * 30 см.	1	[{"added": {}}]	10	1
95	2022-09-22 09:46:19.595422+03	23	Комплект в кроватку из 13 предметов	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u041a\\u043e\\u043c\\u043f\\u043b\\u0435\\u043a\\u0442 \\u0432 \\u043a\\u0440\\u043e\\u0432\\u0430\\u0442\\u043a\\u0443 \\u0438\\u0437 13 \\u043f\\u0440\\u0435\\u0434\\u043c\\u0435\\u0442\\u043e\\u0432"}}]	9	1
96	2022-09-22 09:47:14.808399+03	27	Цвет: бело-серый	1	[{"added": {}}]	10	1
98	2022-09-22 09:53:41.631881+03	24	Комплект бортиков "Мишка"	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u041a\\u043e\\u043c\\u043f\\u043b\\u0435\\u043a\\u0442 \\u0431\\u043e\\u0440\\u0442\\u0438\\u043a\\u043e\\u0432 \\"\\u041c\\u0438\\u0448\\u043a\\u0430\\""}}]	9	1
99	2022-09-22 09:55:00.745664+03	29	Цвет: бело-коричневый	1	[{"added": {}}]	10	1
100	2022-09-22 09:55:30.894845+03	30	Размер: 30 * 30 см.	1	[{"added": {}}]	10	1
101	2022-09-22 10:06:41.999638+03	25	Бортики с одеялом "Крошка Енот"	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u0411\\u043e\\u0440\\u0442\\u0438\\u043a\\u0438 \\u0441 \\u043e\\u0434\\u0435\\u044f\\u043b\\u043e\\u043c \\"\\u041a\\u0440\\u043e\\u0448\\u043a\\u0430 \\u0415\\u043d\\u043e\\u0442\\""}}]	9	1
102	2022-09-22 10:08:22.413859+03	31	Цвет: разноцветные	1	[{"added": {}}]	10	1
103	2022-09-22 10:08:53.658061+03	32	Размер: 30 * 30 см.	1	[{"added": {}}]	10	1
104	2022-09-22 10:27:47.000746+03	26	Бортики с одеялом "Звездочет"	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u0411\\u043e\\u0440\\u0442\\u0438\\u043a\\u0438 \\u0441 \\u043e\\u0434\\u0435\\u044f\\u043b\\u043e\\u043c \\"\\u0417\\u0432\\u0435\\u0437\\u0434\\u043e\\u0447\\u0435\\u0442\\""}}]	9	1
105	2022-09-22 10:28:43.704017+03	33	Цвет: бело-коричневый	1	[{"added": {}}]	10	1
106	2022-09-22 10:29:08.044114+03	34	Размер: 30 * 30 см.	1	[{"added": {}}]	10	1
107	2022-09-22 10:36:44.555936+03	27	Бортики в кроватку "Солнышко"	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u0411\\u043e\\u0440\\u0442\\u0438\\u043a\\u0438 \\u0432 \\u043a\\u0440\\u043e\\u0432\\u0430\\u0442\\u043a\\u0443 \\"\\u0421\\u043e\\u043b\\u043d\\u044b\\u0448\\u043a\\u043e\\""}}]	9	1
108	2022-09-22 10:37:44.226737+03	35	Цвет: голубой, коричневый	1	[{"added": {}}]	10	1
109	2022-09-22 10:38:07.108579+03	36	Размер: 30 * 30 см.	1	[{"added": {}}]	10	1
110	2022-09-22 10:43:40.285426+03	28	Бортики в кроватку "Лисичка"	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u0411\\u043e\\u0440\\u0442\\u0438\\u043a\\u0438 \\u0432 \\u043a\\u0440\\u043e\\u0432\\u0430\\u0442\\u043a\\u0443 \\"\\u041b\\u0438\\u0441\\u0438\\u0447\\u043a\\u0430\\""}}]	9	1
111	2022-09-22 10:44:40.378178+03	37	Цвет: разноцветные	1	[{"added": {}}]	10	1
112	2022-09-22 10:45:02.402633+03	38	Размер: 30 * 30 см.	1	[{"added": {}}]	10	1
113	2022-09-24 08:11:48.978534+03	5	Галантерея	3		6	1
114	2022-09-24 08:11:49.173519+03	1	Обувь спортивная	3		6	1
115	2022-09-24 08:11:49.236521+03	2	Одежда зимняя	3		6	1
116	2022-09-24 08:11:49.30253+03	3	Одежда летняя	3		6	1
117	2022-09-24 08:11:49.343521+03	4	Шорты	3		6	1
118	2022-09-24 08:11:49.388572+03	6	Электроника	3		6	1
119	2022-09-25 10:08:44.03854+03	25	Игорь	2	[{"changed": {"fields": ["Is ordered"]}}, {"changed": {"name": "order product", "object": "\\u0411\\u043e\\u0440\\u0442\\u0438\\u043a\\u0438 \\u0432 \\u043a\\u0440\\u043e\\u0432\\u0430\\u0442\\u043a\\u0443 \\"\\u041b\\u0438\\u0441\\u0438\\u0447\\u043a\\u0430\\"", "fields": ["Ordered"]}}, {"changed": {"name": "order product", "object": "\\u041e\\u0434\\u0435\\u044f\\u043b\\u043e-\\u043a\\u043e\\u043d\\u0432\\u0435\\u0440\\u0442 \\"\\u0414\\u0436\\u0435\\u043d\\u0442\\u0435\\u043b\\u044c\\u043c\\u0435\\u043d\\"", "fields": ["Ordered"]}}]	15	1
120	2022-09-25 11:06:51.925119+03	28	Игорь	2	[{"changed": {"fields": ["Is ordered"]}}, {"changed": {"name": "order product", "object": "\\u0411\\u043e\\u0440\\u0442\\u0438\\u043a\\u0438 \\u0441 \\u043e\\u0434\\u0435\\u044f\\u043b\\u043e\\u043c \\"\\u041a\\u0440\\u043e\\u0448\\u043a\\u0430 \\u0415\\u043d\\u043e\\u0442\\"", "fields": ["Ordered"]}}]	15	1
121	2022-09-25 17:39:00.310308+03	32	Бортики с одеялом "Крошка Енот"	2	[{"changed": {"fields": ["Ordered"]}}]	17	1
122	2022-09-25 17:39:23.642143+03	30	Бортики с одеялом "Крошка Енот"	2	[{"changed": {"fields": ["Ordered"]}}]	17	1
123	2022-09-25 17:39:46.841307+03	29	Бортики с одеялом "Крошка Енот"	2	[{"changed": {"fields": ["Ordered"]}}]	17	1
124	2022-09-25 17:49:30.210492+03	26	Одеяло-конверт "Звездочет"	2	[{"changed": {"fields": ["Ordered"]}}]	17	1
125	2022-09-25 18:04:46.078345+03	28	Одеяло-конверт "Джентельмен"	2	[{"changed": {"fields": ["Quantity"]}}]	17	1
126	2022-09-25 18:05:22.650594+03	26	Одеяло-конверт "Звездочет"	2	[{"changed": {"fields": ["Quantity"]}}]	17	1
127	2022-09-25 18:09:03.913046+03	26	Одеяло-конверт "Звездочет"	2	[{"changed": {"fields": ["Quantity"]}}]	17	1
128	2022-09-25 18:11:06.494111+03	30	Игорь	3		15	1
129	2022-09-25 18:11:06.499096+03	29	Игорь	3		15	1
130	2022-09-25 18:11:06.503084+03	28	Игорь	3		15	1
131	2022-09-25 18:11:06.506126+03	27	Игорь	3		15	1
132	2022-09-25 18:11:06.509109+03	26	Игорь	3		15	1
133	2022-09-25 18:11:06.513092+03	25	Игорь	3		15	1
134	2022-09-25 18:11:06.516113+03	24	Игорь	3		15	1
135	2022-09-25 18:11:06.519097+03	23	Игорь	3		15	1
136	2022-09-25 18:11:06.522114+03	22	Игорь	3		15	1
137	2022-09-25 18:11:06.525128+03	21	Игорь	3		15	1
138	2022-09-25 18:11:06.529009+03	20	Игорь	3		15	1
139	2022-09-25 18:11:06.531999+03	19	Игорь	3		15	1
140	2022-09-25 18:11:06.53501+03	18	Игорь	3		15	1
141	2022-09-25 18:11:06.53811+03	17	Игорь	3		15	1
142	2022-09-25 18:11:06.541028+03	16	Игорь	3		15	1
143	2022-09-25 18:11:06.54511+03	15	Игорь	3		15	1
144	2022-09-25 18:11:06.548116+03	14	Игорь	3		15	1
145	2022-09-25 18:11:06.55111+03	13	Игорь	3		15	1
146	2022-09-25 18:11:06.554122+03	12	Игорь	3		15	1
147	2022-09-25 18:11:06.557126+03	11	Игорь	3		15	1
148	2022-09-25 18:11:06.559122+03	10	Игорь	3		15	1
149	2022-09-25 18:11:06.563+03	9	Игорь	3		15	1
150	2022-09-25 18:11:06.566004+03	8	Игорь	3		15	1
151	2022-09-25 18:11:06.570968+03	7	Игорь	3		15	1
152	2022-09-25 18:11:06.575005+03	6	Игорь	3		15	1
153	2022-09-25 18:11:06.578985+03	5	Игорь	3		15	1
154	2022-09-25 18:11:06.582104+03	4	Игорь	3		15	1
155	2022-09-25 18:11:06.585106+03	3	Игорь	3		15	1
156	2022-09-25 18:11:06.588105+03	2	IKO-STUDIO	3		15	1
157	2022-09-25 18:11:06.591129+03	1	Игорь	3		15	1
158	2022-09-25 18:17:35.744163+03	31	Игорь	2	[{"changed": {"fields": ["Is ordered"]}}]	15	1
208	2022-09-27 13:44:35.730432+03	74	Цвет: шалфей	1	[{"added": {}}]	10	1
209	2022-09-27 13:45:09.766562+03	75	Размер: 50 (50-56)	1	[{"added": {}}]	10	1
159	2022-09-25 18:18:06.876638+03	31	Игорь	2	[{"changed": {"name": "order product", "object": "\\u0411\\u043e\\u0440\\u0442\\u0438\\u043a\\u0438 \\u0432 \\u043a\\u0440\\u043e\\u0432\\u0430\\u0442\\u043a\\u0443 \\"\\u0417\\u0432\\u0435\\u0437\\u0434\\u043e\\u0447\\u043a\\u0438\\"", "fields": ["Ordered"]}}]	15	1
160	2022-09-25 18:20:02.542457+03	32	Игорь	2	[{"changed": {"fields": ["Is ordered"]}}, {"changed": {"name": "order product", "object": "\\u041c\\u0435\\u0445\\u043e\\u0432\\u043e\\u0439 \\u043a\\u043e\\u043d\\u0432\\u0435\\u0440\\u0442 \\"\\u041f\\u0442\\u0438\\u0447\\u043a\\u0430\\"", "fields": ["Ordered"]}}]	15	1
161	2022-09-25 18:21:28.136559+03	33	Игорь	2	[{"changed": {"fields": ["Is ordered"]}}, {"changed": {"name": "order product", "object": "\\u041c\\u0435\\u0445\\u043e\\u0432\\u043e\\u0439 \\u043a\\u043e\\u043d\\u0432\\u0435\\u0440\\u0442 \\"\\u041c\\u0435\\u0434\\u0432\\u0435\\u0436\\u043e\\u043d\\u043e\\u043a\\"", "fields": ["Ordered"]}}]	15	1
162	2022-09-25 18:53:54.592806+03	34	Игорь	2	[{"changed": {"fields": ["Is ordered"]}}, {"changed": {"name": "order product", "object": "\\u041c\\u0435\\u0445\\u043e\\u0432\\u043e\\u0439 \\u043a\\u043e\\u043d\\u0432\\u0435\\u0440\\u0442 \\"\\u041d\\u0435\\u0436\\u043d\\u043e\\u0441\\u0442\\u044c\\"", "fields": ["Ordered"]}}]	15	1
163	2022-09-26 20:12:49.533627+03	9	Ползунки	1	[{"added": {}}]	6	1
164	2022-09-26 20:16:14.005282+03	29	Ползунки для новорожденных, комплект	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u041f\\u043e\\u043b\\u0437\\u0443\\u043d\\u043a\\u0438 \\u0434\\u043b\\u044f \\u043d\\u043e\\u0432\\u043e\\u0440\\u043e\\u0436\\u0434\\u0435\\u043d\\u043d\\u044b\\u0445, \\u043a\\u043e\\u043c\\u043f\\u043b\\u0435\\u043a\\u0442"}}]	9	1
165	2022-09-26 20:18:48.954109+03	29	Ползунки для новорожденных	2	[{"changed": {"fields": ["\\u0422\\u043e\\u0432\\u0430\\u0440", "Slug"]}}]	9	1
166	2022-09-26 20:22:48.257448+03	39	Цвет: топленое молоко, полынь	1	[{"added": {}}]	10	1
167	2022-09-26 20:23:35.362339+03	40	Размер: 50 (50-56)	1	[{"added": {}}]	10	1
168	2022-09-26 20:24:10.14248+03	41	Размер: 56 (56-62)	1	[{"added": {}}]	10	1
169	2022-09-26 20:24:48.295096+03	42	Размер: 62 (62-68)	1	[{"added": {}}]	10	1
170	2022-09-26 20:25:22.125074+03	43	Размер: 68 (68-74)	1	[{"added": {}}]	10	1
171	2022-09-26 20:25:52.6621+03	44	Размер: 74 (74-80)	1	[{"added": {}}]	10	1
172	2022-09-26 20:32:18.620888+03	30	Ползунки (комплект)	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u041f\\u043e\\u043b\\u0437\\u0443\\u043d\\u043a\\u0438 (\\u043a\\u043e\\u043c\\u043f\\u043b\\u0435\\u043a\\u0442)"}}]	9	1
173	2022-09-26 20:33:25.821498+03	45	Цвет: коричневый	1	[{"added": {}}]	10	1
174	2022-09-26 20:33:59.934937+03	46	Размер: 50 (50-56)	1	[{"added": {}}]	10	1
175	2022-09-26 20:34:25.230521+03	47	Размер: 56 (56-62)	1	[{"added": {}}]	10	1
176	2022-09-26 20:34:58.953901+03	48	Размер: 62 (62-68)	1	[{"added": {}}]	10	1
177	2022-09-26 20:35:22.141636+03	49	Размер: 68 (68-74)	1	[{"added": {}}]	10	1
178	2022-09-26 20:35:48.309878+03	50	Размер: 74 (74-80)	1	[{"added": {}}]	10	1
179	2022-09-26 22:28:15.88271+03	31	Комплект ползунков 5 шт.	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u041a\\u043e\\u043c\\u043f\\u043b\\u0435\\u043a\\u0442 \\u043f\\u043e\\u043b\\u0437\\u0443\\u043d\\u043a\\u043e\\u0432 5 \\u0448\\u0442."}}]	9	1
180	2022-09-26 22:29:38.062857+03	51	Цвета: розовый, бирюзовый, желтый, оранжевый, зеленый	1	[{"added": {}}]	10	1
181	2022-09-26 22:31:03.885358+03	52	Размер: 38 (50-56)	1	[{"added": {}}]	10	1
182	2022-09-26 22:31:53.966502+03	53	Размер: 40 (56-62)	1	[{"added": {}}]	10	1
183	2022-09-26 22:32:28.088883+03	54	Размер: 44 (62-68)	1	[{"added": {}}]	10	1
184	2022-09-26 22:33:12.905258+03	55	Размер: 48 (68-74)	1	[{"added": {}}]	10	1
185	2022-09-27 08:13:22.267218+03	32	Ползунки с мягким поясом	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u041f\\u043e\\u043b\\u0437\\u0443\\u043d\\u043a\\u0438 \\u0441 \\u043c\\u044f\\u0433\\u043a\\u0438\\u043c \\u043f\\u043e\\u044f\\u0441\\u043e\\u043c"}}]	9	1
186	2022-09-27 08:14:41.495395+03	56	Цвет: белый, лайм	1	[{"added": {}}]	10	1
187	2022-09-27 08:15:19.608718+03	57	Размер: 62 (62-68)	1	[{"added": {}}]	10	1
188	2022-09-27 08:15:43.589234+03	58	Размер: 68 (68-74)	1	[{"added": {}}]	10	1
189	2022-09-27 08:16:06.314811+03	59	Размер: 74 (74-80)	1	[{"added": {}}]	10	1
190	2022-09-27 08:28:40.905962+03	33	Набор ползунков 2 шт.	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u041d\\u0430\\u0431\\u043e\\u0440 \\u043f\\u043e\\u043b\\u0437\\u0443\\u043d\\u043a\\u043e\\u0432 2 \\u0448\\u0442."}}]	9	1
191	2022-09-27 08:30:14.046322+03	60	Цвет: бежевый	1	[{"added": {}}]	10	1
192	2022-09-27 08:30:52.275597+03	61	Размер: 56 (56-62)	1	[{"added": {}}]	10	1
193	2022-09-27 08:31:17.060746+03	62	Размер: 62 (62-68)	1	[{"added": {}}]	10	1
194	2022-09-27 08:31:41.009221+03	63	Размер: 68 (68-74)	1	[{"added": {}}]	10	1
195	2022-09-27 08:40:21.205099+03	34	Ползунки "Мажорик"	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u041f\\u043e\\u043b\\u0437\\u0443\\u043d\\u043a\\u0438 \\"\\u041c\\u0430\\u0436\\u043e\\u0440\\u0438\\u043a\\""}}]	9	1
196	2022-09-27 08:41:03.104082+03	64	Цвет: голубой, зеленый, желтый	1	[{"added": {}}]	10	1
197	2022-09-27 08:41:27.006897+03	65	Размер: 56 (56-62)	1	[{"added": {}}]	10	1
198	2022-09-27 08:41:51.591354+03	66	Размер: 62 (62-68)	1	[{"added": {}}]	10	1
199	2022-09-27 08:42:15.831516+03	67	Размер: 68 (68-74)	1	[{"added": {}}]	10	1
200	2022-09-27 13:33:31.606808+03	35	Набор ползунков из 2 шт.	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u041d\\u0430\\u0431\\u043e\\u0440 \\u043f\\u043e\\u043b\\u0437\\u0443\\u043d\\u043a\\u043e\\u0432 \\u0438\\u0437 2 \\u0448\\u0442."}}]	9	1
201	2022-09-27 13:34:32.116092+03	68	Цвет: светло-бежевый	1	[{"added": {}}]	10	1
202	2022-09-27 13:34:58.561712+03	69	Размер: 50 (50-56)	1	[{"added": {}}]	10	1
203	2022-09-27 13:35:25.591887+03	70	Размер: 56 (56-62)	1	[{"added": {}}]	10	1
204	2022-09-27 13:36:07.060124+03	71	Размер: 62 (62-68)	1	[{"added": {}}]	10	1
205	2022-09-27 13:36:55.503936+03	72	Размер: 68 (68-74)	1	[{"added": {}}]	10	1
206	2022-09-27 13:37:28.822626+03	73	Размер: 74 (74-80)	1	[{"added": {}}]	10	1
207	2022-09-27 13:43:41.56078+03	36	Ползунки цвета шалфей	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u041f\\u043e\\u043b\\u0437\\u0443\\u043d\\u043a\\u0438 \\u0446\\u0432\\u0435\\u0442\\u0430 \\u0448\\u0430\\u043b\\u0444\\u0435\\u0439"}}]	9	1
210	2022-09-27 13:45:36.587443+03	76	Размер: 56 (56-62)	1	[{"added": {}}]	10	1
211	2022-09-27 13:46:00.180056+03	77	Размер: 62 (62-68)	1	[{"added": {}}]	10	1
212	2022-09-27 13:46:34.062672+03	78	Размер: 68 (68-74)	1	[{"added": {}}]	10	1
213	2022-09-27 13:46:58.503117+03	79	Размер: 74 (74-80)	1	[{"added": {}}]	10	1
214	2022-09-27 17:55:00.76164+03	10	Комбинезоны	1	[{"added": {}}]	6	1
215	2022-09-27 18:05:23.144418+03	10	Комбинезоны	2	[{"changed": {"fields": ["tree_id"]}}]	6	1
216	2022-09-27 18:05:41.096405+03	9	Ползунки	2	[{"changed": {"fields": ["tree_id"]}}]	6	1
217	2022-09-27 18:05:57.363317+03	7	Конверты на выписку	2	[{"changed": {"fields": ["tree_id"]}}]	6	1
218	2022-09-27 18:09:13.901403+03	37	Комбинезон-трансформер	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u041a\\u043e\\u043c\\u0431\\u0438\\u043d\\u0435\\u0437\\u043e\\u043d-\\u0442\\u0440\\u0430\\u043d\\u0441\\u0444\\u043e\\u0440\\u043c\\u0435\\u0440"}}]	9	1
219	2022-09-27 18:11:03.561489+03	80	Цвет: синий	1	[{"added": {}}]	10	1
220	2022-09-27 18:11:26.319287+03	81	Размер: 62 (62-68)	1	[{"added": {}}]	10	1
221	2022-09-27 18:12:23.526499+03	82	Размер: 68 (68-74)	1	[{"added": {}}]	10	1
222	2022-09-27 18:13:16.406706+03	83	Размер: 74 (74-80)	1	[{"added": {}}]	10	1
223	2022-09-27 18:13:59.405899+03	84	Размер: 80 (80-86)	1	[{"added": {}}]	10	1
224	2022-09-27 18:16:15.464292+03	37	Игорь	2	[{"changed": {"name": "order product", "object": "\\u041a\\u043e\\u043c\\u0431\\u0438\\u043d\\u0435\\u0437\\u043e\\u043d-\\u0442\\u0440\\u0430\\u043d\\u0441\\u0444\\u043e\\u0440\\u043c\\u0435\\u0440", "fields": ["Ordered"]}}]	15	1
225	2022-09-27 18:17:19.265952+03	37	Игорь	2	[{"changed": {"fields": ["Is ordered"]}}]	15	1
226	2022-09-27 18:24:19.74173+03	38	Комбинезон для малыша	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u041a\\u043e\\u043c\\u0431\\u0438\\u043d\\u0435\\u0437\\u043e\\u043d \\u0434\\u043b\\u044f \\u043c\\u0430\\u043b\\u044b\\u0448\\u0430"}}]	9	1
227	2022-09-27 18:25:10.967352+03	85	Цвет: темно-синий	1	[{"added": {}}]	10	1
228	2022-09-27 18:26:33.656657+03	86	Размер: 68 (68-74)	1	[{"added": {}}]	10	1
229	2022-09-27 18:26:53.719658+03	87	Размер: 74 (74-80)	1	[{"added": {}}]	10	1
230	2022-09-27 18:27:27.734225+03	88	Размер: 80 (80-86)	1	[{"added": {}}]	10	1
231	2022-09-27 20:36:29.537849+03	39	Комбинезон "Плюшевый мишка"	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u041a\\u043e\\u043c\\u0431\\u0438\\u043d\\u0435\\u0437\\u043e\\u043d \\"\\u041f\\u043b\\u044e\\u0448\\u0435\\u0432\\u044b\\u0439 \\u043c\\u0438\\u0448\\u043a\\u0430\\""}}]	9	1
232	2022-09-27 20:37:17.73791+03	89	Цвет: каштановый	1	[{"added": {}}]	10	1
233	2022-09-27 20:37:49.213037+03	90	Размер: 50 (50-56)	1	[{"added": {}}]	10	1
234	2022-09-27 20:38:12.268154+03	91	Размер: 56 (56-62)	1	[{"added": {}}]	10	1
235	2022-09-27 20:38:44.594152+03	92	Размер: 62 (62-68)	1	[{"added": {}}]	10	1
236	2022-09-27 20:39:25.03793+03	93	Размер: 68 (68-74)	1	[{"added": {}}]	10	1
237	2022-09-27 20:39:45.169895+03	94	Размер: 74 (74-80)	1	[{"added": {}}]	10	1
238	2022-09-27 20:46:11.499711+03	40	Комбинезон-трансформер с ушками	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u041a\\u043e\\u043c\\u0431\\u0438\\u043d\\u0435\\u0437\\u043e\\u043d-\\u0442\\u0440\\u0430\\u043d\\u0441\\u0444\\u043e\\u0440\\u043c\\u0435\\u0440 \\u0441 \\u0443\\u0448\\u043a\\u0430\\u043c\\u0438"}}]	9	1
239	2022-09-27 20:48:30.590269+03	95	Цвет: бежевый	1	[{"added": {}}]	10	1
240	2022-09-27 20:48:49.826022+03	96	Размер: 62 (62-68)	1	[{"added": {}}]	10	1
241	2022-09-27 20:49:08.036827+03	97	Размер: 68 (68-74)	1	[{"added": {}}]	10	1
242	2022-09-27 20:49:29.05199+03	98	Размер: 74 (74-80)	1	[{"added": {}}]	10	1
243	2022-09-29 13:39:48.039106+03	41	Комбинезон для малыша "Мишка"	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u041a\\u043e\\u043c\\u0431\\u0438\\u043d\\u0435\\u0437\\u043e\\u043d \\u0434\\u043b\\u044f \\u043c\\u0430\\u043b\\u044b\\u0448\\u0430 \\"\\u041c\\u0438\\u0448\\u043a\\u0430\\""}}]	9	1
244	2022-09-29 13:40:55.630681+03	99	Цвет: розовая пудра	1	[{"added": {}}]	10	1
245	2022-09-29 13:41:15.598117+03	100	Размер: 56 (56-62)	1	[{"added": {}}]	10	1
246	2022-09-29 13:41:37.281001+03	101	Размер: 62 (62-68)	1	[{"added": {}}]	10	1
247	2022-09-29 13:41:54.971158+03	102	Размер: 68 (68-74)	1	[{"added": {}}]	10	1
248	2022-09-29 13:42:26.992058+03	103	Размер: 74 (74-80)	1	[{"added": {}}]	10	1
249	2022-09-29 14:39:55.251956+03	42	Комбинезон утепленный	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u041a\\u043e\\u043c\\u0431\\u0438\\u043d\\u0435\\u0437\\u043e\\u043d \\u0443\\u0442\\u0435\\u043f\\u043b\\u0435\\u043d\\u043d\\u044b\\u0439"}}]	9	1
250	2022-09-29 14:40:31.637102+03	104	Размер: 56 (56-62)	1	[{"added": {}}]	10	1
251	2022-09-29 14:40:49.748922+03	105	Размер: 62 (62-68)	1	[{"added": {}}]	10	1
252	2022-09-29 14:41:11.531676+03	106	Размер: 68 (68-74)	1	[{"added": {}}]	10	1
253	2022-09-29 14:41:30.601577+03	107	Цвет: розовый	1	[{"added": {}}]	10	1
254	2022-09-29 14:49:47.545614+03	43	Комбинезон для новорожденных утепленный	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u041a\\u043e\\u043c\\u0431\\u0438\\u043d\\u0435\\u0437\\u043e\\u043d \\u0434\\u043b\\u044f \\u043d\\u043e\\u0432\\u043e\\u0440\\u043e\\u0436\\u0434\\u0435\\u043d\\u043d\\u044b\\u0445 \\u0443\\u0442\\u0435\\u043f\\u043b\\u0435\\u043d\\u043d\\u044b\\u0439"}}]	9	1
255	2022-09-29 14:50:32.035727+03	108	Цвет: черно-зеленый	1	[{"added": {}}]	10	1
256	2022-09-29 14:51:11.492251+03	43	Комбинезон для новорожденных утепл.	2	[{"changed": {"fields": ["\\u0422\\u043e\\u0432\\u0430\\u0440"]}}]	9	1
257	2022-09-29 14:51:23.584008+03	109	Размер: 56 (56-62)	1	[{"added": {}}]	10	1
258	2022-09-29 14:51:42.669399+03	110	Размер: 62 (62-68)	1	[{"added": {}}]	10	1
259	2022-09-29 14:52:00.871685+03	111	Размер: 68 (68-74)	1	[{"added": {}}]	10	1
260	2022-09-29 14:53:54.49963+03	43	Комбинезон для новорожденных	2	[{"changed": {"fields": ["\\u0422\\u043e\\u0432\\u0430\\u0440"]}}]	9	1
261	2022-09-29 14:54:02.301779+03	111	Размер: 68 (68-74)	2	[]	10	1
262	2022-09-29 14:59:31.167831+03	44	Весенний комбинезон	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u0412\\u0435\\u0441\\u0435\\u043d\\u043d\\u0438\\u0439 \\u043a\\u043e\\u043c\\u0431\\u0438\\u043d\\u0435\\u0437\\u043e\\u043d"}}]	9	1
263	2022-09-29 15:00:22.635125+03	112	Цвет: сиреневый меланж	1	[{"added": {}}]	10	1
264	2022-09-29 15:00:40.509786+03	113	Размер: 56 (56-62)	1	[{"added": {}}]	10	1
265	2022-09-29 15:00:58.734296+03	114	Размер: 62 (62-68)	1	[{"added": {}}]	10	1
266	2022-09-29 15:01:20.233169+03	115	Размер: 68 (68-74)	1	[{"added": {}}]	10	1
267	2022-09-30 12:37:49.167716+03	11	Шапочки	1	[{"added": {}}]	6	1
268	2022-09-30 12:41:22.317958+03	45	Шапочка "Pure Love BEAR"	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u0428\\u0430\\u043f\\u043e\\u0447\\u043a\\u0430 \\"Pure Love BEAR\\""}}]	9	1
269	2022-09-30 12:43:33.564771+03	116	Цвет: песочный	1	[{"added": {}}]	10	1
270	2022-09-30 12:44:09.059515+03	117	Размер: 40 (40-42)	1	[{"added": {}}]	10	1
271	2022-09-30 12:44:49.09785+03	118	Размер: 42 (42-44)	1	[{"added": {}}]	10	1
272	2022-09-30 12:45:19.967446+03	119	Размер: 44 (44-46)	1	[{"added": {}}]	10	1
273	2022-09-30 12:45:48.49357+03	120	Размер: 46 (46-48)	1	[{"added": {}}]	10	1
274	2022-09-30 12:55:16.842528+03	46	Шапочка с мишкой	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u0428\\u0430\\u043f\\u043e\\u0447\\u043a\\u0430 \\u0441 \\u043c\\u0438\\u0448\\u043a\\u043e\\u0439"}}]	9	1
275	2022-09-30 12:55:57.983519+03	121	Цвет: серый	1	[{"added": {}}]	10	1
276	2022-09-30 12:56:35.729857+03	122	Размер: 38 (38-40)	1	[{"added": {}}]	10	1
277	2022-09-30 12:57:02.187882+03	123	Размер: 40 (40-42)	1	[{"added": {}}]	10	1
278	2022-09-30 13:05:16.727608+03	47	Шапка для малыша	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u0428\\u0430\\u043f\\u043a\\u0430 \\u0434\\u043b\\u044f \\u043c\\u0430\\u043b\\u044b\\u0448\\u0430"}}]	9	1
279	2022-09-30 13:06:07.837034+03	124	Цвет: молочный	1	[{"added": {}}]	10	1
280	2022-09-30 13:06:55.947196+03	125	Размер: 38 (38-40)	1	[{"added": {}}]	10	1
281	2022-09-30 13:07:33.95424+03	126	Размер: 42 (42-44)	1	[{"added": {}}]	10	1
282	2022-09-30 13:55:34.057155+03	48	Шапка хлопковая для малыша	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u0428\\u0430\\u043f\\u043a\\u0430 \\u0445\\u043b\\u043e\\u043f\\u043a\\u043e\\u0432\\u0430\\u044f \\u0434\\u043b\\u044f \\u043c\\u0430\\u043b\\u044b\\u0448\\u0430"}}]	9	1
283	2022-09-30 13:56:31.488695+03	127	Цвет: молочный	1	[{"added": {}}]	10	1
284	2022-09-30 13:57:01.999151+03	128	Размер: 40 (40-42)	1	[{"added": {}}]	10	1
285	2022-09-30 13:57:27.499209+03	129	Размер: 42 (42-44)	1	[{"added": {}}]	10	1
286	2022-09-30 14:03:28.305583+03	49	Шапка детская флисовая	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u0428\\u0430\\u043f\\u043a\\u0430 \\u0434\\u0435\\u0442\\u0441\\u043a\\u0430\\u044f \\u0444\\u043b\\u0438\\u0441\\u043e\\u0432\\u0430\\u044f"}}]	9	1
287	2022-09-30 14:04:16.143779+03	130	Цвет: серый	1	[{"added": {}}]	10	1
288	2022-09-30 14:04:45.641965+03	131	Размер: 38 (38-40)	1	[{"added": {}}]	10	1
289	2022-09-30 14:05:09.483813+03	132	Размер: 40 (40-42)	1	[{"added": {}}]	10	1
290	2022-09-30 14:05:35.434048+03	133	Размер: 42 (42-44)	1	[{"added": {}}]	10	1
291	2022-09-30 14:05:58.877053+03	134	Размер: 44 (44-46)	1	[{"added": {}}]	10	1
292	2022-09-30 14:11:42.129349+03	50	Детский вязаный чепчик	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u0414\\u0435\\u0442\\u0441\\u043a\\u0438\\u0439 \\u0432\\u044f\\u0437\\u0430\\u043d\\u044b\\u0439 \\u0447\\u0435\\u043f\\u0447\\u0438\\u043a"}}]	9	1
293	2022-09-30 14:13:06.653824+03	135	Цвет: молочный	1	[{"added": {}}]	10	1
294	2022-09-30 14:13:41.547501+03	136	Размер: 40 (40-42)	1	[{"added": {}}]	10	1
295	2022-09-30 14:14:15.81841+03	137	Размер: 42 (42-44)	1	[{"added": {}}]	10	1
296	2022-09-30 14:39:27.92988+03	51	Шапка детская на завязках	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u0428\\u0430\\u043f\\u043a\\u0430 \\u0434\\u0435\\u0442\\u0441\\u043a\\u0430\\u044f \\u043d\\u0430 \\u0437\\u0430\\u0432\\u044f\\u0437\\u043a\\u0430\\u0445"}}]	9	1
297	2022-09-30 14:40:11.172899+03	138	Цвет: светло-розовый	1	[{"added": {}}]	10	1
298	2022-09-30 14:40:44.951701+03	139	Размер: 38 (38-40)	1	[{"added": {}}]	10	1
299	2022-09-30 14:41:12.180721+03	140	Размер: 40 (40-42)	1	[{"added": {}}]	10	1
300	2022-09-30 14:41:38.074512+03	141	Размер: 42 (42-44)	1	[{"added": {}}]	10	1
301	2022-09-30 14:49:10.627855+03	52	Шапочка детская Мишка	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u0428\\u0430\\u043f\\u043e\\u0447\\u043a\\u0430 \\u0434\\u0435\\u0442\\u0441\\u043a\\u0430\\u044f \\u041c\\u0438\\u0448\\u043a\\u0430"}}]	9	1
302	2022-09-30 14:49:46.086607+03	142	Цвет: серый меланж	1	[{"added": {}}]	10	1
303	2022-09-30 14:50:11.366124+03	143	Размер: 42 (42-44)	1	[{"added": {}}]	10	1
304	2022-09-30 14:50:34.600402+03	144	Размер: 44 (44-46)	1	[{"added": {}}]	10	1
305	2022-09-30 14:50:58.550304+03	145	Размер: 46 (46-48)	1	[{"added": {}}]	10	1
306	2022-09-30 16:18:11.378089+03	12	Пледы детские	1	[{"added": {}}]	6	1
307	2022-09-30 16:18:43.154485+03	7	Конверты на выписку	2	[{"changed": {"fields": ["tree_id"]}}]	6	1
308	2022-09-30 16:19:03.924261+03	8	Бортики в кроватку	2	[{"changed": {"fields": ["tree_id"]}}]	6	1
309	2022-09-30 16:21:13.288144+03	53	Плед детский вязаный	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u041f\\u043b\\u0435\\u0434 \\u0434\\u0435\\u0442\\u0441\\u043a\\u0438\\u0439 \\u0432\\u044f\\u0437\\u0430\\u043d\\u044b\\u0439"}}]	9	1
310	2022-09-30 16:21:56.985867+03	146	Цвет: пудровый	1	[{"added": {}}]	10	1
311	2022-09-30 16:22:42.11354+03	147	Размер: 90*110 см.	1	[{"added": {}}]	10	1
312	2022-09-30 19:16:22.110255+03	54	Плед для новорожденного	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u041f\\u043b\\u0435\\u0434 \\u0434\\u043b\\u044f \\u043d\\u043e\\u0432\\u043e\\u0440\\u043e\\u0436\\u0434\\u0435\\u043d\\u043d\\u043e\\u0433\\u043e"}}]	9	1
313	2022-09-30 19:16:53.611078+03	148	Цвет: белый	1	[{"added": {}}]	10	1
314	2022-09-30 19:17:21.956941+03	149	Размер: 90*110 см.	1	[{"added": {}}]	10	1
315	2022-09-30 19:25:53.979585+03	55	Детский плед, одеяло, покрывало	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u0414\\u0435\\u0442\\u0441\\u043a\\u0438\\u0439 \\u043f\\u043b\\u0435\\u0434, \\u043e\\u0434\\u0435\\u044f\\u043b\\u043e, \\u043f\\u043e\\u043a\\u0440\\u044b\\u0432\\u0430\\u043b\\u043e"}}]	9	1
316	2022-09-30 19:26:41.86322+03	150	Цвет: васильковый	1	[{"added": {}}]	10	1
317	2022-09-30 19:27:12.520326+03	151	Размер: 90*110 см.	1	[{"added": {}}]	10	1
318	2022-09-30 19:41:43.064593+03	56	Плед детский хлопковый	1	[{"added": {}}, {"added": {"name": "\\u0413\\u0430\\u043b\\u0435\\u0440\\u0435\\u044f", "object": "\\u041f\\u043b\\u0435\\u0434 \\u0434\\u0435\\u0442\\u0441\\u043a\\u0438\\u0439 \\u0445\\u043b\\u043e\\u043f\\u043a\\u043e\\u0432\\u044b\\u0439"}}]	9	1
319	2022-09-30 19:42:18.90251+03	152	Цвет: розовый	1	[{"added": {}}]	10	1
320	2022-09-30 19:42:32.937228+03	153	Размер: 90	1	[{"added": {}}]	10	1
321	2022-09-30 19:42:57.871736+03	153	Размер: 90*110 см.	2	[{"changed": {"fields": ["Variation value"]}}]	10	1
322	2022-10-01 20:22:19.950871+03	7	Конверты на выписку	2	[{"changed": {"fields": ["\\u041a\\u0440\\u0430\\u0442\\u043a\\u043e \\u043e \\u043a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u0438"]}}]	6	1
323	2022-10-01 20:24:19.047108+03	7	Конверты на выписку	2	[{"changed": {"fields": ["\\u041a\\u0440\\u0430\\u0442\\u043a\\u043e \\u043e \\u043a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u0438"]}}]	6	1
324	2022-10-01 20:33:50.242738+03	8	Бортики в кроватку	2	[{"changed": {"fields": ["\\u041a\\u0440\\u0430\\u0442\\u043a\\u043e \\u043e \\u043a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u0438"]}}]	6	1
325	2022-10-01 20:34:46.233931+03	8	Бортики в кроватку	2	[{"changed": {"fields": ["\\u041a\\u0440\\u0430\\u0442\\u043a\\u043e \\u043e \\u043a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u0438"]}}]	6	1
326	2022-10-01 20:36:45.436343+03	10	Комбинезоны	2	[{"changed": {"fields": ["parent", "lft", "rght", "tree_id", "level"]}}]	6	1
327	2022-10-01 20:37:10.686862+03	10	Комбинезоны	2	[{"changed": {"fields": ["parent", "lft", "rght", "level"]}}]	6	1
328	2022-10-01 20:37:30.13677+03	10	Комбинезоны	2	[{"changed": {"fields": ["parent", "lft", "rght", "tree_id", "level"]}}]	6	1
329	2022-10-01 20:38:31.919195+03	10	Комбинезоны	2	[{"changed": {"fields": ["parent", "lft", "rght", "tree_id", "level"]}}]	6	1
330	2022-10-01 20:38:49.633505+03	10	Комбинезоны	2	[{"changed": {"fields": ["tree_id"]}}]	6	1
331	2022-10-01 21:49:57.79492+03	10	Комбинезоны	2	[{"changed": {"fields": ["\\u041a\\u0440\\u0430\\u0442\\u043a\\u043e \\u043e \\u043a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u0438"]}}]	6	1
332	2022-10-03 10:33:12.533088+03	41	Игорь	2	[{"changed": {"fields": ["Is ordered"]}}, {"changed": {"name": "order product", "object": "\\u041c\\u0435\\u0445\\u043e\\u0432\\u043e\\u0439 \\u043a\\u043e\\u043d\\u0432\\u0435\\u0440\\u0442 \\"\\u041d\\u0435\\u0436\\u043d\\u043e\\u0441\\u0442\\u044c\\"", "fields": ["Ordered"]}}]	15	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	category	category
7	accounts	account
8	accounts	userprofile
9	store	product
10	store	variation
11	store	reviewrating
12	store	productgallery
13	carts	cart
14	carts	cartitem
15	orders	order
16	orders	payment
17	orders	orderproduct
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	accounts	0001_initial	2022-09-12 13:33:21.348275+03
2	contenttypes	0001_initial	2022-09-12 13:33:21.413372+03
3	admin	0001_initial	2022-09-12 13:33:21.614015+03
4	admin	0002_logentry_remove_auto_add	2022-09-12 13:33:21.627014+03
5	admin	0003_logentry_add_action_flag_choices	2022-09-12 13:33:21.640105+03
6	contenttypes	0002_remove_content_type_name	2022-09-12 13:33:21.669028+03
7	auth	0001_initial	2022-09-12 13:33:22.093759+03
8	auth	0002_alter_permission_name_max_length	2022-09-12 13:33:22.111789+03
9	auth	0003_alter_user_email_max_length	2022-09-12 13:33:22.126769+03
10	auth	0004_alter_user_username_opts	2022-09-12 13:33:22.14176+03
11	auth	0005_alter_user_last_login_null	2022-09-12 13:33:22.155914+03
12	auth	0006_require_contenttypes_0002	2022-09-12 13:33:22.160856+03
13	auth	0007_alter_validators_add_error_messages	2022-09-12 13:33:22.17387+03
14	auth	0008_alter_user_username_max_length	2022-09-12 13:33:22.18879+03
15	auth	0009_alter_user_last_name_max_length	2022-09-12 13:33:22.202767+03
16	auth	0010_alter_group_name_max_length	2022-09-12 13:33:22.233912+03
17	auth	0011_update_proxy_permissions	2022-09-12 13:33:22.253772+03
18	auth	0012_alter_user_first_name_max_length	2022-09-12 13:33:22.266904+03
19	category	0001_initial	2022-09-12 13:33:22.450914+03
20	category	0002_auto_20210907_1431	2022-09-12 13:33:22.459296+03
21	category	0003_category_cat_slider	2022-09-12 13:33:22.473283+03
22	category	0004_auto_20220809_1303	2022-09-12 13:33:22.4863+03
23	category	0005_auto_20220809_1344	2022-09-12 13:33:22.715848+03
24	category	0006_auto_20220811_0812	2022-09-12 13:33:22.835627+03
25	category	0007_remove_category_cat_details	2022-09-12 13:33:22.845629+03
26	category	0008_alter_category_id	2022-09-12 13:33:23.350558+03
27	store	0001_initial	2022-09-12 13:33:24.071065+03
28	carts	0001_initial	2022-09-12 13:33:24.17543+03
29	carts	0002_initial	2022-09-12 13:33:24.553022+03
30	orders	0001_initial	2022-09-12 13:33:24.891448+03
31	orders	0002_initial	2022-09-12 13:33:25.260077+03
32	sessions	0001_initial	2022-09-12 13:33:25.487775+03
33	store	0002_alter_product_product_name	2022-09-12 16:03:43.334431+03
34	store	0003_auto_20220914_1226	2022-09-14 12:26:32.454085+03
35	category	0009_alter_category_description	2022-10-01 20:21:47.230386+03
36	orders	0003_alter_order_order_note	2022-10-01 20:21:47.334658+03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
45uszft4kz5hp99030f5yq4jh0fm7zeb	e30:1oZ5yl:mDFiKazPvwIBiGDpwMzXlyzUMh07saJ74TAZc7WwQS8	2022-09-30 10:41:39.294966+03
lf6ypz8wu28g70c9ybvi3taa4qqvwu09	e30:1oZ5zz:nPFwyI9XZngdJq44vY-U6gd8lFF1uKi83O7Kvu_NqpA	2022-09-30 10:42:55.761812+03
0avoyddvrx50e4j6gy65gzks5jtza6jl	e30:1oZ60j:4bn383nkktWPdmV-8CtDXWrmLjTPwPaNq9qeBEmNj4I	2022-09-30 10:43:41.584905+03
c8oxdjpky0tnc5opxjqzvc43cf8hkbz8	e30:1oZ60t:jVGJKDhoxqzwXTLrnhzQ1p5wjwrdWb0S3CLo9rBurUM	2022-09-30 10:43:51.005466+03
sqpdvo7jyxozjbqvye36fjpq6bxvkbcp	e30:1oZ61J:At1OublzH4jamkaAXS_CGgfKiDun4Q4ETA598LnCMZw	2022-09-30 10:44:17.145029+03
j6c3xhg8xrqv51041kvrsoi67o9n0god	e30:1oZ62X:Gr7pKMneK6w5QrZcIi43oqkjiTrFjFNBRs2vt-wzat8	2022-09-30 10:45:33.118584+03
prys5f46oh6kj69udbzwg8q864vojz05	e30:1oZ63T:UK6aynXdJ0vSCha_6c4HOnPBm5Uh_Rjtvb61WE62CBo	2022-09-30 10:46:31.504428+03
uvco8wtlv2qkkg7m9g6663voxplgjlvl	e30:1oZGZF:9IRTAE5lEXoT-uplkUdfkuTnTMEUTc7MOESCyoTrbhI	2022-09-30 22:00:01.282822+03
11vd8wxeedte4ppk3xjdh7fsunxwwvj3	e30:1oZGbW:QjCD43iGvfDwUd9Fqi5iPMc4mDmuGimeG9X6nLjtB7Q	2022-09-30 22:02:22.752494+03
2tskgpzuowsfq05di5npryttob45jo6h	.eJxVjDsOwyAQBe9CHSE-AbMu0-cMaPFCTD4QGVxFuXtiyY3bNzPvw3yLreVafC65-55fsXV8vT0bpbXaSG1Ac6OtVfLEPK599muLi8_ERibZYQs4PWLZAN2x3CqfaulLDnxT-E4bv1aKz8vuHg5mbPO_dkYFkbSz6EBGk1BoJ8UAFLSJKUgLQGqIwQJNApQ4J9JCkYRBoKOE7PsDvl9Fyw:1oZvsP:Z_rhFgTEb_a_2UNyTgfVF0MlDjtSk5e80G639-IVIUs	2022-10-02 18:06:33.815718+03
23gaf295sen2bzol3hv742tadfbaxg0g	.eJxVjDsOwyAQBe9CHSGzLD-X6XMGBF4ck8Q4MriKcvfEkhu3b2beh_maas1L8bnk5lueU21hfnvWC63RCnDYcamUdQIuzIetTX6rafWZWM-AnbYYhmcqO6BHKPeFD0tpa458V_hBK78tlF7Xwz0dTKFO_9pBDCRNAIFj0kZjJ8GgAaXHIRCik-hQkzPaUCeiQJCdJSsUkBmlU-z7A9zDRLs:1ofNtc:TwwranBbIAiVft2Qif2etgPWYM3-rnSM_nmtNP-ntUI	2022-10-17 19:02:20.652867+03
7o85vqcr0u2sqlme5cgrlavo9p0lsuyc	.eJxVjjsOwyAQRO9CHSFjMAsu0-cMaIF1TD4QGVxFuXtsyY3beW9G82WuUq2pZJdyaq6lN9WG749jo9BaCrCD6rgVAAIuzOHaZrdWWlyKbGSCnTKP4Ul5B_GB-V54KLktyfNd4Qet_FYiva6HexqYsc5bm1CaHgVMhjRFZXD7YKOPZqJByx61ML22YAJAZ4MgFaJUCkmC8kYGYr8_3JVGEw:1oYWyT:MVMLJA0pn3JFrAUH6UbNzZyR5qQuN7OayFFNWVSpEBM	2022-09-28 21:19:01.054691+03
vgjlvrzu71v58tzvtdsk4fydrgh2cr6w	e30:1oaDUW:kYW4vFEFWXYygb9mG_b5fnWOMe_7bpkJgzRbTmwgtEs	2022-10-03 12:55:04.213625+03
vsccuw76othxnxwvm7oqbrv0ondx9euj	eyJfc2Vzc2lvbl9pbml0X3RpbWVzdGFtcF8iOjE2NjUxNjYwNjIuNDI5NzE4M30:1ogrl8:3oJGUcJ6drUtWa0vT3_btBENeK6WnGZakgAHAPbvXb0	2022-10-21 21:07:42.76272+03
8nzezat7vzsaotod82euchi3qc2q7ani	.eJxVjjkOwyAURO9CHSF2sMv0OQP6wHdMFogMrqLcPbbkxu28N6P5Et-wtVyLzyV33_MbW4f3x5ORGyO5VEprypTRnIkL8bD22a8NF58TGQknpyxAfGLZQXpAuVcaa-lLDnRX6EEbvdWEr-vhngZmaPPWRpBOALeTQ4NJOdCKDSkkN6E2UoDhTpjBumgtGyJHFdN2FFBaFZyMSH5__r9GMQ:1oYLFH:VU-6Ym3GB_qpRoJOL5rgmhcAVhiwsukHz8k5i1T2cc4	2022-09-28 08:47:35.181618+03
jzg3kiulsndzsnfllcqprs5kf7tb0d5s	e30:1oYKVj:kqdtw29gxgb8adfUHzDpLn_1Kw8Ok_7zpFveLXqiMz8	2022-09-28 08:00:31.808124+03
ml3m62thue4yhccmww67d0pfvrsmkgy6	eyJfc2Vzc2lvbl9pbml0X3RpbWVzdGFtcF8iOjE2NjMxMzc4OTMuODY1ODI5Mn0:1oYM8k:uFo2WymmkLzvW0jGCsK-FwYNiuJgRWZmze-uNv7A59s	2022-09-28 09:44:54.963234+03
\.


--
-- Data for Name: orders_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders_order (id, order_number, first_name, last_name, phone, email, address_line_1, address_line_2, country, state, city, order_note, order_total, tax, status, ip, is_ordered, created_at, updated_at, user_id) FROM stdin;
40	2022100340	Игорь	Короткевич	80297351867	i_korotkevitch@mail.ru	Шилова	16000	Беларусь	Гомельская область	г. Гомель		70	0	Новый	127.0.0.1	f	2022-10-03 10:28:11.780834+03	2022-10-03 10:28:11.860721+03	1
31	2022092531	Игорь	Короткевич	80297351867	i_korotkevitch@mail.ru	Шилова	16000	Беларусь	Гомельская область	г. Гомель		210	0	Новый	127.0.0.1	t	2022-09-25 18:16:38.562273+03	2022-09-25 18:18:06.858635+03	1
41	2022100341	Игорь	Короткевич	80297351867	i_korotkevitch@mail.ru	Шилова	16000	Беларусь	Гомельская область	г. Гомель		90	0	Новый	127.0.0.1	t	2022-10-03 10:30:45.169396+03	2022-10-03 10:33:12.513053+03	2
32	2022092532	Игорь	Короткевич	80297351867	i_korotkevitch@mail.ru	Шилова	16000	Беларусь	Гомельская область	г. Гомель		180	0	Новый	127.0.0.1	t	2022-09-25 18:19:22.663537+03	2022-09-25 18:20:02.523464+03	1
33	2022092533	Игорь	Короткевич	80297351867	i_korotkevitch@mail.ru	Шилова	16000	Беларусь	Гомельская область	г. Гомель		90	0	Новый	127.0.0.1	t	2022-09-25 18:20:58.274115+03	2022-09-25 18:21:28.116677+03	1
42	2022100342	Игорь	Короткевич	80297351867	i.korotkevitch@gmail.com	Шилова	16000	Беларусь	Гомельская область	г. Гомель	Срочно!	70	0	Новый	127.0.0.1	f	2022-10-03 18:32:41.015467+03	2022-10-03 18:32:41.02056+03	2
34	2022092534	Игорь	Короткевич	80297351867	i_korotkevitch@mail.ru	Шилова	16000	Беларусь	Гомельская область	г. Гомель		180	0	Новый	127.0.0.1	t	2022-09-25 18:53:22.328687+03	2022-09-25 18:53:54.570809+03	1
35	2022092635	Игорь	Короткевич	80297351867	i_korotkevitch@mail.ru	Шилова	16000	Беларусь	Гомельская область	г. Гомель		24	0	Новый	127.0.0.1	f	2022-09-26 20:26:40.461104+03	2022-09-26 20:26:40.557109+03	1
36	2022092736	Игорь	Короткевич	80297351867	i_korotkevitch@mail.ru	Шилова	16000	Беларусь	Гомельская область	г. Гомель		21	0	Новый	127.0.0.1	f	2022-09-27 13:48:12.892959+03	2022-09-27 13:48:12.990328+03	1
37	2022092737	Игорь	Короткевич	80297351867	i_korotkevitch@mail.ru	Шилова	16000	Беларусь	Гомельская область	г. Гомель		348	0	Новый	127.0.0.1	t	2022-09-27 18:14:46.744777+03	2022-09-27 18:17:19.261065+03	1
38	2022092738	Игорь	Короткевич	80297351867	i_korotkevitch@mail.ru	Шилова	16000	Беларусь	Гомельская область	г. Гомель		700	0	Новый	127.0.0.1	f	2022-09-27 20:50:38.611151+03	2022-09-27 20:50:38.616218+03	1
39	2022093039	Игорь	Короткевич	80297351867	i_korotkevitch@mail.ru	Шилова	16000	Беларусь	Гомельская область	г. Гомель		92	0	Новый	127.0.0.1	f	2022-09-30 14:52:26.647365+03	2022-09-30 14:52:26.740339+03	1
\.


--
-- Data for Name: orders_orderproduct; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders_orderproduct (id, quantity, product_price, ordered, created_at, updated_at, order_id, product_id, user_id) FROM stdin;
34	3	70	t	2022-09-25 18:16:38.577251+03	2022-09-25 18:18:06.862639+03	31	22	1
35	2	90	t	2022-09-25 18:19:22.68466+03	2022-09-25 18:20:02.527437+03	32	21	1
36	1	90	t	2022-09-25 18:20:58.286982+03	2022-09-25 18:21:28.121685+03	33	16	1
37	2	90	t	2022-09-25 18:53:22.342559+03	2022-09-25 18:53:54.575807+03	34	19	1
38	1	24	f	2022-09-26 20:26:40.575035+03	2022-09-26 20:26:40.705676+03	35	29	1
39	1	21	f	2022-09-27 13:48:13.000331+03	2022-09-27 13:48:13.093168+03	36	36	1
40	1	348	t	2022-09-27 18:14:46.799756+03	2022-09-27 18:16:15.449248+03	37	37	1
41	2	350	f	2022-09-27 20:50:38.625151+03	2022-09-27 20:50:38.652141+03	38	40	1
42	1	25	f	2022-09-30 14:52:26.77734+03	2022-09-30 14:52:26.886093+03	39	45	1
43	1	10	f	2022-09-30 14:52:26.913806+03	2022-09-30 14:52:26.933659+03	39	48	1
44	1	20	f	2022-09-30 14:52:26.943708+03	2022-09-30 14:52:26.964649+03	39	50	1
45	1	23	f	2022-09-30 14:52:26.975783+03	2022-09-30 14:52:26.995726+03	39	51	1
46	1	14	f	2022-09-30 14:52:27.006783+03	2022-09-30 14:52:27.026673+03	39	52	1
47	1	70	f	2022-10-03 10:28:11.886841+03	2022-10-03 10:28:11.989948+03	40	28	1
48	1	90	t	2022-10-03 10:30:45.182394+03	2022-10-03 10:33:12.518155+03	41	19	2
49	1	70	f	2022-10-03 18:32:41.028533+03	2022-10-03 18:32:41.070459+03	42	22	2
\.


--
-- Data for Name: orders_orderproduct_variations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders_orderproduct_variations (id, orderproduct_id, variation_id) FROM stdin;
67	34	25
68	34	26
69	35	24
70	35	23
71	36	13
72	36	14
73	37	19
74	37	20
75	38	44
76	38	39
77	39	74
78	39	79
79	40	80
80	40	84
81	41	97
82	41	95
83	42	120
84	42	116
85	43	129
86	43	127
87	44	136
88	44	135
89	45	138
90	45	141
91	46	145
92	46	142
93	47	37
94	47	38
95	48	19
96	48	20
97	49	25
98	49	26
\.


--
-- Data for Name: orders_payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders_payment (id, payment_id, payment_method, amount_paid, status, created_at, user_id) FROM stdin;
\.


--
-- Data for Name: store_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_product (id, product_name, slug, description, price, images, stock, is_available, created_date, modified_date, category_id, big_description) FROM stdin;
18	Одеяло-конверт "Джентельмен"	odeyalo-konvert-dzhentelmen	Демисезонное одеяло-конверт	50	photos/products/konv-05.jpg	91	t	2022-09-19 20:27:45.737652+03	2022-09-25 18:08:03.398034+03	7	Демисезонное одеяло-конверт на выписку из польского хлопка и утеплителя 100 г/м.кв. Трансформируется в одеяло для использования в коляске или кроватке.
21	Меховой конверт "Птичка"	mehovoj-konvert-ptichka	Зимний меховой конверт на овчине.	90	photos/products/konv-08.jpg	98	t	2022-09-20 08:34:51.500711+03	2022-09-25 18:19:22.717649+03	7	Конверт на выписку для малышей с ушками очень тёплый, и уютный. Верх конверта состоит из ветро-водонепроницаемой плащевой ткани дюспо . Внутри утеплитель нового поколения ShelterKids - 250 гр/м. Подклад выполнен из меха на трикотажной основе с 70% шерсти овцы. Отворот конверта крепится на кнопки, при необходимости их можно раскрыть и еще больше укрыть ребенка. В таком конверте Ваш малыш будет чувствовать себя тепло и уютно. Рекомендуемый температурный режим от -25 до 0 градусов.
14	Одеяло-конверт с коронами	odeyalo-konvert-s-koronami	Демисезонное одеяло-конверт на выписку из роддома.	50	photos/products/konv-01.jpg	100	t	2022-09-19 19:45:36.759203+03	2022-09-19 19:48:43.163913+03	7	Демисезонное одеяло-конверт на выписку из польского хлопка и утеплителя 100 г/кв.м. Трансформируется в одеяло для использования в коляске или кроватке.
15	Одеяло-конверт "Звездочет"	odeyalo-konvert-zvezdochet	Демисезонное одеяло-конверт.	40	photos/products/konv-02.jpg	99	t	2022-09-19 20:09:16.707292+03	2022-09-19 20:12:46.662985+03	7	Двустороннее демисезонное одеяло-конверт универсальной расцветки. Ткань хлопок с утеплителем.
17	Одеяло-конверт "Royal"	odeyalo-konvert-royal	Демисезонное одеяло-конверт на выписку.	50	photos/products/konv-04.jpg	100	t	2022-09-19 20:22:26.661868+03	2022-09-19 20:22:26.661868+03	7	Демисезонное одеяло-конверт на выписку из польского хлопка и утеплителя плотностью 100 г/м.кв. Трансформируется в одеяло для использования в коляске или кроватке.
20	Меховой конверт "Мореход"	mehovoj-konvert-morehod	Зимний меховой конверт на овчине.	90	photos/products/konv-07.jpg	100	t	2022-09-20 08:29:52.320038+03	2022-09-20 08:38:24.184976+03	7	Конверт на выписку для малышей с ушками очень тёплый, и уютный. Верх конверта состоит из ветро-водонепроницаемой плащевой ткани дюспо . Внутри утеплитель нового поколения ShelterKids - 250 гр/м. Подклад выполнен из меха на трикотажной основе с 70% шерсти овцы. Отворот конверта крепится на кнопки, при необходимости их можно раскрыть и еще больше укрыть ребенка. В таком конверте Ваш малыш будет чувствовать себя тепло и уютно. Рекомендуемый температурный режим от -25 до 0 градусов.
23	Комплект в кроватку из 13 предметов	komplekt-v-krovatku-iz-13-predmetov	Комплект в кроватку из 13 предметов поможет малышу крепко спать в кроватке.	60	photos/products/bort-02.jpg	100	t	2022-09-22 09:46:19.559428+03	2022-09-22 09:46:19.559428+03	8	Комплект в кроватку из 13 предметов поможет малышу крепко спать в кроватке. Бортики подушечками для детской кровати защитят ручки и ножки от случайных ударов о кроватку.
24	Комплект бортиков "Мишка"	komplekt-bortikov-mishka	Комплект бортиков в детскую кроватку из 17 предметов	140	photos/products/bort-03.jpg	100	t	2022-09-22 09:53:41.62175+03	2022-09-22 09:53:41.62175+03	8	Комплект бортиков в детскую кроватку обеспечит комфорт и безопасность малыша с рождения. Мягкие подушки бортики с милыми картинками украсят детскую кроватку и надежно защитят малыша от травм и ушибов.
26	Бортики с одеялом "Звездочет"	bortiki-s-odeyalom-zvezdochet	Комплект в кроватку из 13 предметов "Звездочет"	60	photos/products/bort-05.jpg	100	t	2022-09-22 10:27:46.98774+03	2022-09-22 10:27:46.98774+03	8	Комплект в кроватку из 13 предметов поможет малышу крепко спать в кроватке. Бортики подушечками для детской кровати защитят ручки и ножки от случайных ударов о кроватку. Младенец не будет перегреваться и потеть во время сна, т. к. бортики для новорожденных и одеяло сшиты из натурального 100% хлопка и гипоаллергенного наполнителя. Детские цвета, рисунки и картинки подобран так, что бортики подойдут и мальчику, и девочке. Наполнитель вшит в наволочку и будет держать форму при частых стирках.
27	Бортики в кроватку "Солнышко"	bortiki-v-krovatku-solnyshko	Комплект в кроватку из 13 предметов, включая одеяльце.	65	photos/products/bort-06.jpg	100	t	2022-09-22 10:36:44.520816+03	2022-09-22 10:36:44.520816+03	8	В комплекте для кроватки новорожденного ребенка: защитные бортики-подушки на завязках 30х30см - 12 шт и цельнокройное одеяло - 75х100см. Подойдёт для прямоугольной, круглой и овальной кроватки. Бортики-подушечки в кроватку с милыми картинками станут отличным подарком на рождение или выписку из роддома.
25	Бортики с одеялом "Крошка Енот"	bortiki-s-odeyalom-kroshka-enot	Бортики с одеялом "Крошка Енот" из 13 предметов.	65	photos/products/bort-04.jpg	84	t	2022-09-22 10:06:41.947273+03	2022-09-25 11:20:21.58022+03	8	Комплект в кроватку из 13 предметов поможет малышу крепко спать в кроватке. Бортики подушечками для детской кровати защитят ручки и ножки от случайных ударов о кроватку. Младенец не будет перегреваться и потеть во время сна, т. к. бортики для новорожденных и одеяло сшиты из натурального 100% хлопка и гипоаллергенного наполнителя.
16	Меховой конверт "Медвежонок"	mehovoj-konvert-medvezhonok	Зимний меховой конверт на овчине.	90	photos/products/konv-03.jpg	99	t	2022-09-19 20:17:21.582575+03	2022-09-25 18:20:58.317981+03	7	Конверт на выписку для малышей с ушками очень тёплый и уютный. Верх конверта состоит из ветро-водонепроницаемой плащевой ткани дюспо . Внутри утеплитель нового поколения ShelterKids - 250 гр/м. Подклад выполнен из меха на трикотажной основе с 70% шерсти овцы. Отворот конверта крепится на кнопки, при необходимости их можно раскрыть и еще больше укрыть ребенка. В таком конверте Ваш малыш будет чувствовать себя тепло и уютно. Рекомендуемый температурный режим от -25 до 0 градусов.
44	Весенний комбинезон	vesennij-kombinezon	Утеплённый комбинезон для малыша на молнии предназначен для прогулок малышей в весенний период.	121	photos/products/kom-08.jpg	100	t	2022-09-29 14:59:31.156822+03	2022-09-29 14:59:31.156822+03	10	Утеплённый комбинезон для малыша на молнии от Анастасии Чепуриной предназначен для прогулок малышей в весенний период из мембраны 0 до +12, а из дюспо от +5 до +15. Он хорошо сохраняет тепло в любую погоду, защищает малыша от ветра, дождя и снега. Тёплый комбинезон изготовлен снаружи из износостойкой, водоотталкивающей курточной ткани, мембраны.
29	Ползунки для новорожденных	polzunki-dlya-novorozhdennyh	Комплект ползунков для новорожденных малышей: мальчика или девочки. Набор из 2-х штук.	24	photos/products/pol-01.jpg	99	t	2022-09-26 20:16:13.863326+03	2022-09-26 20:26:40.711829+03	9	Комплект ползунков для новорожденных малышей: мальчика или девочки. Набор из 2-х штук. Ползунки - это штанишки для малыша с носочками. Мягкое, немного эластичное полотно средней плотности высшего качества "пенье" на 100% состоит из хлопка. Пояс выполнен в виде широкой манжеты с добавлением 5% эластана для стабильности и эластичности. Размеры 50, 56 и 62 выполнены швами наружу, а размеры 68 и 74 - внутрь. Ползунки рассчитаны на новорожденного, 1 месяц, 3 месяца, 6 и 9 месяцев. Ползунки для малыша можно использовать дома, в роддоме или на прогулке. Это часть костюма для младенца в дополнение к боди, полукомбинезону или кофточке.
30	Ползунки (комплект)	polzunki-komplekt	Комплект ползунков для новорожденных малышей: мальчика или девочки. Набор из 2-х штук.	21	photos/products/pol-02.jpg	100	t	2022-09-26 20:32:18.571375+03	2022-09-26 20:32:18.571375+03	9	Комплект ползунков для новорожденных малышей: мальчика или девочки. Набор из 2-х штук. Ползунки - это штанишки для малыша с носочками. Мягкое, немного эластичное полотно средней плотности высшего качества "пенье" на 100% состоит из хлопка. Пояс выполнен в виде широкой манжеты с добавлением 5% эластана для стабильности и эластичности. Размеры 50, 56 и 62 выполнены швами наружу, а размеры 68 и 74 - внутрь. Ползунки рассчитаны на новорожденного, 1 месяц, 3 месяца, 6 и 9 месяцев. Ползунки для малыша можно использовать дома, в роддоме или на прогулке. Это часть костюма для младенца в дополнение к боди, полукомбинезону или кофточке.
31	Комплект ползунков 5 шт.	komplekt-polzunkov-5-sht	Домашний повседневный набор ползунков 5 шт.	25	photos/products/pol-03.jpg	100	t	2022-09-26 22:28:15.869299+03	2022-09-26 22:28:15.869299+03	9	Домашний повседневный набор ползунков 5 шт. В комплект входят цвета: розовый, бирюзовый, желтый, оранжевый, зеленый.
32	Ползунки с мягким поясом	polzunki-s-myagkim-poyasom	Комплект: ползунки для новорожденных 3 штуки.	31	photos/products/pol-04.jpg	100	t	2022-09-27 08:13:22.170883+03	2022-09-27 08:13:22.170883+03	9	Комплект: ползунки для новорожденных 3 штуки. Фабрика Бамбук шьет детские вещи из кулирки. Кулирное полотно состоит на 100% из хлопка, пропускает воздух и не мнется, создает комфорт ребенку. Важно правильно подобрать размер детских ползунков: снимите мерки, как на рисунке, выбирайте размер из таблицы по самой большой мерке. Ползунки для младенцев мальчиков и девочек комфортно носить как домашнюю одежду и как пижаму. Подходят в любое время года : осень, лето, весна, зима. Штанишки детские с "высокой" талией, так необходимой для подгузников, широкий пояс и манжеты из мягкой эластичной рибаны с лайкрой. Ползунки не сваливаются с ребенка и не давят, при этом кожа "дышит" и не возникает потнички.
33	Набор ползунков 2 шт.	nabor-polzunkov-2-sht	Набор/комплект ползунков для новорожденных и малышей из двух штук от производителя детского трикотажа "АРТЕМКА".	23	photos/products/pol-05.jpg	100	t	2022-09-27 08:28:40.893829+03	2022-09-27 08:28:40.893829+03	9	Набор/комплект ползунков для новорожденных и малышей из двух штук от производителя детского трикотажа "АРТЕМКА". Наши ползунки изготовлены из трикотажа премиум качества из 100% хлопка, приятные на ощупь! Широкая эластичная безопасная резинка не передавливает животик новорожденного, прекрасно прикрывает спинку, дарит ощущение комфорта нежной коже малыша. На ползунках имеется ластовица, которая обеспечивает свободу движениям малыша! Ползунки с закрытой ножкой отлично подойдут для выписки, в роддом, для прогулки в качестве поддевы, для повседневной носки или в качестве подарка малышу!
34	Ползунки "Мажорик"	polzunki-mazhorik	Комплект ползунков для малышей Мажорик изготовлен из мягкого трикотажного полотна, 100% хлопок.	21	photos/products/pol-06.jpg	100	t	2022-09-27 08:40:21.189962+03	2022-09-27 08:40:21.189962+03	9	Комплект ползунков для малышей Мажорик изготовлен из мягкого трикотажного полотна, 100% хлопок. Ползунки для новорожденных - это самая нужная одежда для малыша! Ползунки трикотажные можно надевать на подгузник или без него. Натуральная ткань ползунков не раздражает нежную кожу детей. Для пошива детского белья мы используем гипоаллергенное дышащее трикотажное полотно. В поясе вставлена мягкая резиночка, которая не пережимает детский животик. Стирать белье для малышей рекомендуем в стиральной машине при температуре 30 градусов стиральными средствами для детского белья. Ползунки Мажорик могут заменить штанишки и колготки для малышей. Если вы ищете Ползунки для девочки или ползунки для мальчика - наши ползунки для новорожденных подходят всем! В комплекте 5 штук детских штанишек/ползунков.
35	Набор ползунков из 2 шт.	nabor-polzunkov-iz-2-sht	Комплект ползунков для новорожденных, набор из 2-х штук.	21	photos/products/pol-07.jpg	100	t	2022-09-27 13:33:31.540678+03	2022-09-27 13:33:31.540678+03	9	Комплект ползунков для новорожденных, набор из 2-х штук. Ползунки - это штанишки для малыша с носочками. Мягкое, немного эластичное полотно средней плотности высшего качества "пенье" на 100% состоит из хлопка. Пояс выполнен в виде широкой манжеты с добавлением 5% эластана для стабильности и эластичности.
36	Ползунки цвета шалфей	polzunki-cveta-shalfej	Комплект ползунков для новорожденных, набор из 2-х штук.	21	photos/products/pol-08.jpg	99	t	2022-09-27 13:43:41.513331+03	2022-09-27 13:48:13.100204+03	9	Комплект ползунков для новорожденных, набор из 2-х штук. Ползунки - это штанишки для малыша с носочками. Мягкое, немного эластичное полотно средней плотности высшего качества "пенье" на 100% состоит из хлопка. Пояс выполнен в виде широкой манжеты с добавлением 5% эластана для стабильности и эластичности. Размеры 50, 56 и 62 выполнены швами наружу, а размеры 68 и 74 - внутрь.
28	Бортики в кроватку "Лисичка"	bortiki-v-krovatku-lisichka	Бортики в кроватку "Лисичка" из 12 подушечек и одеяльца.	70	photos/products/bort-07.jpg	96	t	2022-09-22 10:43:40.273409+03	2022-10-03 10:28:11.996915+03	8	Бортики подушечками для детской кровати защитят ручки и ножки от случайных ударов о кроватку. Младенец не будет перегреваться и потеть во время сна, т. к. бортики для новорожденных и одеяло сшиты из натурального 100% хлопка и гипоаллергенного наполнителя. Детские цвета, рисунки и картинки подобран так, что бортики подойдут и мальчику, и девочке. Наполнитель вшит в наволочку и будет держать форму при частых стирках. Натуральная ткань сохранит цвет и мягкость. В комплекте для кроватки новорожденного ребенка: защитные бортики-подушки на завязках 30х30см - 12 шт и цельнокройное одеяло - 75х100см. Подойдёт для прямоугольной, круглой и овальной кроватки.
37	Комбинезон-трансформер	kombinezon-transformer	Зимний комбинезон-трансформер пуховый для малышей от ArctiLine.	348	photos/products/kom-01.jpg	99	t	2022-09-27 18:09:13.857407+03	2022-09-27 18:14:46.867823+03	10	Зимний комбинезон-трансформер пуховый для малышей от ArctiLine. Утеплен натуральным элитным пухом, который прошел сертификацию RDS (80%пух,20%перо),легкий,теплый(от -5 до -35 градусов).В качестве подкладки использовался комфортный для малышей материал-кулирная гладь (100% хлопок).В зависимости от возраста ребенка,Вы можете выбрать,каким образом использовать модель:как комбинезон или конверт.Внутренняя часть капюшона,отвороты по низу ручек и ножек выполнены из мягкого велюрового меха.На груди кармашек.Фронтальные молнии и молния между ножек закрыты ветрозащитными планками с изнаночной стороны.По краю капюшона эластичная резинка для плотного прилегания к лицу и защиты от ветра и снега.Для комфортной посадки по бокам на уровне талии комбинезона, расположена эластичная резинка.В комплекте несъемные резиновые штрипки, которые надеваются поверх обуви и позволяют не задираться штанине. Имеются световозвращающие элементы.
38	Комбинезон для малыша	kombinezon-dlya-malysha	Зимний комбинезон-трансформер пуховый с поясом для малышей Марио.	485	photos/products/kom-02.jpg	100	t	2022-09-27 18:24:19.72961+03	2022-09-27 18:24:19.72961+03	10	Зимний комбинезон-трансформер пуховый с поясом для малышей Марио. Утеплен натуральным элитным пухом, который прошел сертификацию RDS (80 % пух, 20 % перо), очень легкий и теплый (от -5 до -35 градусов). Комбинезон с натуральной опушкой из меха финского енота. В качестве подкладки использовался комфортный для малышей материал - кулирная гладь (100% хлопок). В зависимости от возраста ребенка, Вы можете выбрать, каким образом использовать модель: как комбинезон или конверт. По низу ножек планка, которая застегивается на пуговицы, для фиксации изделия в виде конверта. По низу ножек и ручек теплые отвороты. По краю капюшона эластичная резинка для плотного прилегания к лицу и защиты от ветра и снега. Декоративные ушки защищают от прикосновений меха опушки к лицу ребенка. В комплекте несъемные резиновые штрипки, которые надеваются поверх обуви и позволяют не задираться штанине. Имеются световозвращающие элементы.
39	Комбинезон "Плюшевый мишка"	kombinezon-plyushevyj-mishka	Этот стильный комбинезон для малышей и новорожденных с капюшоном выполнен из велсофта и имеет подкладку из 100% хлопка.	60	photos/products/kom-03.jpg	100	t	2022-09-27 20:36:29.526755+03	2022-09-27 20:36:29.526755+03	10	Этот стильный комбинезон для малышей и новорожденных с капюшоном выполнен из велсофта и имеет подкладку из 100% хлопка. Подкладка из 100% хлопка позволяет одевать комбинезон сразу на тельце малыша без дополнительного нижнего белья. Веселая аппликация и ушки "Мишки" на капюшоне придают изделию особенно забавный вид. Вы можете использовать его как прогулочный комбинезон на теплую весну и лето, как поддеву под верхнюю одежду, а также для похода в гости. Размеры 50, 56, 62 68 и 74 идут с рукавичками. Размеры 80 и 86 идут с открытыми ножками и без рукавичек. Подходит как мальчикам, так и девочкам. Можно носить как самостоятельную одежду, подходит на лето, весну, зиму, осень, демисезонный.
40	Комбинезон-трансформер с ушками	kombinezon-transformer-s-ushkami	Зимний комбинезон-трансформер пуховый для малышей от ArctiLine.	350	photos/products/kom-04.jpg	98	t	2022-09-27 20:46:11.487686+03	2022-09-27 20:50:38.658154+03	10	Зимний комбинезон-трансформер пуховый для малышей от ArctiLine. Утеплен натуральным элитным пухом, который прошел сертификацию RDS (80%пух,20%перо),легкий,теплый(от -5 до -35 градусов).В качестве подкладки использовался комфортный для малышей материал-кулирная гладь (100% хлопок).В зависимости от возраста ребенка,Вы можете выбрать,каким образом использовать модель:как комбинезон или конверт.Внутренняя часть капюшона,отвороты по низу ручек и ножек выполнены из мягкого велюрового меха.На груди кармашек.Фронтальные молнии и молния между ножек закрыты ветрозащитными планками с изнаночной стороны.По краю капюшона эластичная резинка для плотного прилегания к лицу и защиты от ветра и снега.Для комфортной посадки по бокам на уровне талии комбинезона, расположена эластичная резинка.В комплекте несъемные резиновые штрипки, которые надеваются поверх обуви и позволяют не задираться штанине. Имеются световозвращающие элементы.
41	Комбинезон для малыша "Мишка"	kombinezon-dlya-malysha-mishka	Комбинезон для малыша и новорожденного Мишка.	81	photos/products/kom-05.jpg	100	t	2022-09-29 13:39:47.798118+03	2022-09-29 13:39:47.798118+03	10	Комбинезон для малыша и новорожденного Мишка. Всеми любимая модель комбинезона с ушками представлена в 11 цветах. Комбинезон на уютном начесе можно носить самостоятельно при t 15-22 С. Удобно одевать с курточкой, жилеткой, а так же как флисовую поддеву под осенний, демисезонный, зимний комбинезон. На капюшоне хлопковая подкладка. Для безопасности установлен стоп для молнии. Размер 56 прекрасно подойдет как костюм для новорожденного или комбинезон на выписку в роддом. Возрастная группа 56-68 ножка закрыта. Возрастная группа 74-86 ножка открыта под носок/ботинки. Подойдет домашний комбинезон для мальчиков и для девочек от 0 месяцев до 1 года. Продается ОДИН КОМБИНЕЗОН! Все остальное представлено как варианты детских комплектов для новорожденных.
42	Комбинезон утепленный	kombinezon-uteplennyj	Утеплённый комбинезон для малыша на молнии от Анастасии Чепуриной.	121	photos/products/kom-06.jpg	100	t	2022-09-29 14:39:55.239975+03	2022-09-29 14:39:55.239975+03	10	Утеплённый комбинезон для малыша на молнии от Анастасии Чепуриной предназначен для прогулок малышей в весенний, период из мембраны 0 до +12, а из дюспо от +5 до +15. Он хорошо сохраняет тепло в любую погоду, защищает малыша от ветра, дождя и снега. Тёплый комбинезон изготовлен снаружи из износостойкой, водоотталкивающей курточной ткани, мембраны.
43	Комбинезон для новорожденных	kombinezon-dlya-novorozhdennyh-uteplennyj	Утеплённый комбинезон для малыша на молнии.	121	photos/products/kom-07.jpg	100	t	2022-09-29 14:49:47.438225+03	2022-09-29 14:53:54.493646+03	10	Утеплённый комбинезон для малыша на молнии от Анастасии Чепуриной предназначен для прогулок малышей в весенний, период из мембраны 0 до +12, а из дюспо от +5 до +15. Он хорошо сохраняет тепло в любую погоду, защищает малыша от ветра, дождя и снега. Тёплый комбинезон изготовлен снаружи из износостойкой, водоотталкивающей курточной ткани, мембраны.
46	Шапочка с мишкой	shapochka-s-mishkoj	Забавная зимняя шапка для малышей с двумя небольшими помпонами на макушке.	30	photos/products/sha-02.jpg	100	t	2022-09-30 12:55:16.803668+03	2022-09-30 12:55:16.803668+03	11	Забавная зимняя шапка для малышей с двумя небольшими помпонами на макушке. Шапка продается без снуда! Шапочка идеально подходит на выписку для новорожденного ребенка для выписки из роддома. Не сползает на глаза и позволяет комфортно проводить время на прогулке. Верхний слой связан полушерстяной пряжи, нижний слой выкроен из хлопкового полотна и полностью пришит. Внутри утеплитель. Спереди лейбл-мишка. Аккуратные завязки без узлов и наконечников. Представленные размеры подойдут на малыша от 0 до 1 года. Подойдет на температуру до -25 градусов (с капюшоном). Размер равен окружность головы в см.
47	Шапка для малыша	shapka-dlya-malysha	Модная, ДВОЙНАЯ трикотажная шапочка незаменима в прохладное межсезонье и в качестве первого слоя под теплый капюшон зимой.	22	photos/products/sha-03.jpg	100	t	2022-09-30 13:05:16.714473+03	2022-09-30 13:05:16.714473+03	11	Модная, ДВОЙНАЯ трикотажная шапочка незаменима в прохладное межсезонье и в качестве первого слоя под теплый капюшон зимой. Хлопок премиум качества с небольшим добавлением лайкры обеспечивает хорошую растяжимость и прилегание к голове. Высокий двойной манжет закрывает швы в области прилегания головы к подушке и надежно защищает ушки от ветра. Шапочка рассчитана от +18 до + 8 в качестве верхнего слоя и на более низкие температуры под капюшон в качестве нижнего слоя.
49	Шапка детская флисовая	shapka-detskaya-flisovaya	Шапка детская с ушками демисезонная флисовая для мальчика и девочки "Винни".	36	photos/products/sha-05.jpg	100	t	2022-09-30 14:03:28.292457+03	2022-09-30 14:03:28.293473+03	11	Шапка детская с ушками демисезонная флисовая для мальчика и девочки "Винни". Шапки для малышей выполнены из мягкого флиса с хлопковой подкладкой. Многие любят шапочки с ушками и завязками, они милые и хорошо прилегают к личику, защищая малыша от ветра. Детская флисовая шапочка для новорожденного и детей до 5 лет незаменимая вещь в гардеробе малышей. Широкая цветовая линейка позволит выбрать шапочку для малыша на любой вкус. Шапки для мальчиков демисезон с завязками синего и серого цвета подойдут практически к любому комбинезону для мальчика. Шапка на завязках для девочки молочного, розового, серого цвета будет прекрасно смотрится с весенней одеждой для девочки.
48	Шапка хлопковая для малыша	shapka-hlopkovaya-dlya-malysha	Комплект трикотажных шапочек с отворотом разного цветового оформления в стиле одной коллекции.	10	photos/products/sha-04.jpg	99	t	2022-09-30 13:55:34.045157+03	2022-09-30 14:52:26.939741+03	11	Комплект трикотажных шапочек с отворотом разного цветового оформления в стиле одной коллекции. Используется для роддома, в качестве летнего головного убора и для надевания под более теплую шапочку. Трикотаж интерлок высшего качества пенье - хлопок 100%.В упаковке - 2 штуки одного размера.
19	Меховой конверт "Нежность"	mehovoj-konvert-nezhnost	Зимний меховой конверт на овчине	90	photos/products/konv-06.jpg	97	t	2022-09-20 08:13:38.3692+03	2022-10-03 10:30:45.216164+03	7	Конверт на выписку для малышей с ушками очень тёплый, и уютный. Верх конверта состоит из ветро-водонепроницаемой плащевой ткани дюспо . Внутри утеплитель нового поколения ShelterKids - 250 гр/м. Подклад выполнен из меха на трикотажной основе с 70% шерсти овцы. Отворот конверта крепится на кнопки, при необходимости их можно раскрыть и еще больше укрыть ребенка. В таком конверте Ваш малыш будет чувствовать себя тепло и уютно. Рекомендуемый температурный режим от -25 до 0 градусов.
45	Шапочка "Pure Love BEAR"	shapochka-pure-love-bear	Шапочки Amarobaby Pure Love зарекомендовали себя отличной посадкой на голову малыша.	25	photos/products/sha-01.jpg	99	t	2022-09-30 12:41:22.166291+03	2022-09-30 14:52:26.892238+03	11	Шапочки Amarobaby Pure Love зарекомендовали себя отличной посадкой на голову малыша. Удобные завязки и дополнительные изгибы на ушках позволяют шапочке плотно зафиксироваться в правильном положении на голове ребенка. Верхний слой выполнен из качественной полухлопковой пряжи в универсальных цветах, которые подойдут к любой верхней одежде. В комплекте с шапочкой можно приобрести шарфик-снуд для полного комплекта.Шапка утеплена натуральным мягким слоем трикотажа из 100% хлопка. Благодаря натуральному внутреннему слою, шапочка обладает отличной терморегуляцией, хорошо дышит и защитит от продувания ветром. Шапочки рассчитаны на демисезон от +8 градусов, но также будут незаменимы для маленьких детей в холодные ветреные дни лета. Подойдут и мальчикам, и девочкам.
51	Шапка детская на завязках	shapka-detskaya-na-zavyazkah	Лучшее решение для зимы - теплая вязаная шапка на завязках с помпоном из искусственного меха, которая не только защитит от прохлады и ветра, но и красиво завершит стильный образ Вашего ребенка.	23	photos/products/sha-07.jpg	99	t	2022-09-30 14:39:27.91888+03	2022-09-30 14:52:27.002647+03	11	Лучшее решение для зимы - теплая вязаная шапка на завязках с помпоном из искусственного меха, которая не только защитит от прохлады и ветра, но и красиво завершит стильный образ Вашего ребенка. Шапка детская для малышей станет отличным вариантом на выписку. Данная модель с утеплителем из синтепона, хорошо подойдет как на зиму, так и на осень. Мягкое и теплое полотно сохранит первоначальную форму даже после долгой носки. Гипоаллергенный материал подходит детям с чувствительной кожей и для новорожденных. Головной убор идеален также для прогулок и активного отдыха на свежем воздухе. Вязаная шапочка для детей от бренда РусБубон станет чудесным подарком на Новый год, 8 Марта, День Рождения и любой другой праздник!
52	Шапочка детская Мишка	shapochka-detskaya-mishka	Шапочка для новорожденных выполнена из высококачественного велюра с подкладом из 100% хлопка.	14	photos/products/sha-08.jpg	99	t	2022-09-30 14:49:10.610859+03	2022-09-30 14:52:27.032783+03	11	Шапочка для новорожденных выполнена из высококачественного велюра с подкладом из 100% хлопка. Утягивающая мягкая резиночка плотно обхватывает голову малыша за счет чего шапочка не съезжает, когда малыш вертится. Подходит на весну и осень.
50	Детский вязаный чепчик	detskij-vyazanyj-chepchik	Вязаный шерстяной чепчик обеспечивает комфорт малыша на повседневных прогулках весной, зимой, осенью и прохладным летом.	20	photos/products/sha-06.jpg	99	t	2022-09-30 14:11:42.118245+03	2022-09-30 14:52:26.971662+03	11	Вязаный шерстяной чепчик обеспечивает комфорт малыша на повседневных прогулках весной, зимой, осенью и прохладным летом. Сделан швами наружу. Глубокая посадка закроет лобик и защитит ушки. Отлично подходит как поддева под капюшон утепленного зимнего комбинезона или конверта и будет теплее, чем флисовый. Послужит и как теплая одежда для дома. Демисезонная шапочка для новорожденных из смеси натуральной овечьей шерсти и акрила легко составит набор с комбинезоном и пинетками, будет хорошим подарком в роддом на выписку, крещение или на день рождения младенца. Чепчик на завязках для девочек и мальчиков сочетает в себе несколько узоров: классическую жемчужную вязку и вертикальные косы. Детские вещи должны быть гипоаллергенны и соответствовать требованиям гигиены. Вязаная одежда Уси-Пуси имеет все сертификаты соответствия.
53	Плед детский вязаный	pled-detskij-vyazanyj	Детский вязаный трикотажный плед из хлопка связан специально для самых маленьких ценителей комфорта.	35	photos/products/ple-01.jpg	100	t	2022-09-30 16:21:13.252028+03	2022-09-30 16:21:13.252028+03	12	Детский вязаный трикотажный плед из хлопка связан специально для самых маленьких ценителей комфорта!!! Для новорожденного плед-конверт будет необходим с первых дней. Универсальность натурального пледа позволяет использовать его, как вязаное одеяло, покрывало для детской кроватки, укрывать им малыша в коляске. Подберите красивую ленту и стильный конверт для выписки из роддома готов!!!Если плед расстелить на полу, малыш сможет на нем играть, как на коврике. Его можно взять с собой на дачу и на природу, на пикник. Красивая упаковка подойдет для использования детского пледа в качестве подарка. Плед прост в уходе, выдержит максимальное количество стирок. Размер детского вязаного пледа 90/110 см.
54	Плед для новорожденного	pled-dlya-novorozhdennogo	Уютный нежный плед для вашего мальчика или девочки.	35	photos/products/ple-02.jpg	100	t	2022-09-30 19:16:22.080291+03	2022-09-30 19:16:22.080291+03	12	Уютный нежный плед для вашего мальчика или девочки.
55	Детский плед, одеяло, покрывало	detskij-pled-odeyalo-pokryvalo	Плед для новорожденного и детский плед конверт из хлопка, связан специально для самых маленьких ценителей комфорта.	37	photos/products/ple-03.jpg	100	t	2022-09-30 19:25:53.968466+03	2022-09-30 19:25:53.968466+03	12	Плед для новорожденного и детский плед конверт из хлопка, связан специально для самых маленьких ценителей комфорта!!! Размер покрывала для малыша 90х110 см. Конверт для новорожденного получиться, если подобрать красивую ленту и стильная вещь для выписки из роддома новорожденного готов!!! Универсальность пледа позволяет использовать его, как вязаное одеяло, покрывало для детской кроватки, укрывать им малыша в коляске. Если плед расстелить на полу, ребенок сможет на нем играть, как на коврике. Хлопковый пледик можно взять с собой на дачу и на природу, на пикник, машину. Красивая упаковка подойдет для использования детского покрывала в качестве подарка для мальчика, для девочки.
56	Плед детский хлопковый	pled-detskij-hlopkoviy	Плед для новорожденного и детский плед конверт из хлопка.	32	photos/products/ple-04.jpg	100	t	2022-09-30 19:41:43.022985+03	2022-09-30 19:41:43.022985+03	12	Плед для новорожденного и детский плед конверт из хлопка, связан специально для самых маленьких ценителей комфорта!!! Размер покрывала для малыша 90х110 см. Конверт для новорожденного получиться, если подобрать красивую ленту и стильная вещь для выписки из роддома новорожденного готов!!!Универсальность пледа позволяет использовать его, как вязаное одеяло, покрывало для детской кроватки, укрывать им малыша в коляске. Если плед расстелить на полу, ребенок сможет на нем играть, как на коврике. Хлопковый пледик можно взять с собой на дачу и на природу, на пикник, машину. Красивая упаковка подойдет для использования детского покрывала в качестве подарка для мальчика, для девочки.
22	Бортики в кроватку "Звездочки"	bortiki-v-krovatku-zvezdochki	Мягкие бортики в кроватку для девочки и мальчика.	70	photos/products/bort-01.jpg	96	t	2022-09-22 08:44:38.072793+03	2022-10-03 18:32:41.077534+03	8	Мягкие бортики в кроватку для девочки и мальчика - это надежный защитный барьер для ребенка от ударов о прутья кроватки.
\.


--
-- Data for Name: store_productgallery; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_productgallery (id, image, product_id) FROM stdin;
18	store/products/konv-01.jpg	14
19	store/products/konv-02.jpg	15
20	store/products/konv-03.jpg	16
21	store/products/konv-04.jpg	17
22	store/products/konv-05.jpg	18
23	store/products/konv-06.jpg	19
24	store/products/konv-07.jpg	20
25	store/products/konv-08.jpg	21
26	store/products/bort-01.jpg	22
27	store/products/bort-02.jpg	23
28	store/products/bort-03.jpg	24
29	store/products/bort-04.jpg	25
30	store/products/bort-05.jpg	26
31	store/products/bort-06.jpg	27
32	store/products/bort-07.jpg	28
33	store/products/pol-01.jpg	29
34	store/products/pol-02.jpg	30
35	store/products/pol-03.jpg	31
36	store/products/pol-04.jpg	32
37	store/products/pol-05.jpg	33
38	store/products/pol-06.jpg	34
39	store/products/pol-07.jpg	35
40	store/products/pol-08.jpg	36
41	store/products/kom-01.jpg	37
42	store/products/kom-02.jpg	38
43	store/products/kom-03.jpg	39
44	store/products/kom-04.jpg	40
45	store/products/kom-05.jpg	41
46	store/products/kom-06.jpg	42
47	store/products/kom-07.jpg	43
48	store/products/kom-08.jpg	44
49	store/products/sha-01.jpg	45
50	store/products/sha-02.jpg	46
51	store/products/sha-03.jpg	47
52	store/products/sha-04.jpg	48
53	store/products/sha-05.jpg	49
54	store/products/sha-06.jpg	50
55	store/products/sha-07.jpg	51
56	store/products/sha-08.jpg	52
57	store/products/ple-01.jpg	53
58	store/products/ple-02.jpg	54
59	store/products/ple-03.jpg	55
60	store/products/ple-04.jpg	56
\.


--
-- Data for Name: store_reviewrating; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_reviewrating (id, subject, review, rating, ip, status, created_at, updated_at, product_id, user_id) FROM stdin;
\.


--
-- Data for Name: store_variation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store_variation (id, variation_category, variation_value, is_active, created_date, product_id) FROM stdin;
9	color	Цвет: сине-белый	t	2022-09-19 19:52:05.918505+03	14
10	size	Размер: 96 * 96 см.	t	2022-09-19 19:56:39.6509+03	14
11	color	Цвет: разноцветное	t	2022-09-19 20:11:27.411551+03	15
12	size	Размер: 96 * 96 см.	t	2022-09-19 20:11:59.205346+03	15
13	color	Цвет: белый	t	2022-09-19 20:18:14.950667+03	16
15	color	Цвет: бело-голубой	t	2022-09-19 20:23:18.836219+03	17
16	size	Размер: 96 * 96 см.	t	2022-09-19 20:23:48.388119+03	17
17	color	Цвет: бело-синий	t	2022-09-19 20:28:43.034958+03	18
18	size	Размер: 96 * 96 см.	t	2022-09-19 20:29:47.812903+03	18
19	color	Цвет: бело-розовый	t	2022-09-20 08:18:17.122407+03	19
80	color	Цвет: синий	t	2022-09-27 18:11:03.527488+03	37
21	color	Цвет: бело-синий	t	2022-09-20 08:30:36.597465+03	20
22	size	Размер: 70 * 40 см.	t	2022-09-20 08:41:29.258251+03	20
20	size	Размер: 70 * 40 см.	t	2022-09-20 08:41:53.034709+03	19
14	size	Размер: 70 * 40 см.	t	2022-09-20 08:42:42.322066+03	16
23	color	Цвет: разноцветный	t	2022-09-20 08:43:37.328483+03	21
24	size	Размер: 70 * 40 см.	t	2022-09-20 08:44:03.191786+03	21
25	color	Цвет: рисунок - звездочки	t	2022-09-22 08:47:43.25389+03	22
26	size	Размер: 50 * 30 см.	t	2022-09-22 08:48:41.344289+03	22
27	color	Цвет: бело-серый	t	2022-09-22 09:47:14.769257+03	23
28	size	Размер: 30 * 30 см.	t	2022-09-22 09:47:51.764372+03	23
29	color	Цвет: бело-коричневый	t	2022-09-22 09:55:00.741671+03	24
30	size	Размер: 30 * 30 см.	t	2022-09-22 09:55:30.88984+03	24
31	color	Цвет: разноцветные	t	2022-09-22 10:08:22.409005+03	25
32	size	Размер: 30 * 30 см.	t	2022-09-22 10:08:53.655063+03	25
33	color	Цвет: бело-коричневый	t	2022-09-22 10:28:43.700024+03	26
34	size	Размер: 30 * 30 см.	t	2022-09-22 10:29:08.040146+03	26
35	color	Цвет: голубой, коричневый	t	2022-09-22 10:37:44.222765+03	27
36	size	Размер: 30 * 30 см.	t	2022-09-22 10:38:07.104576+03	27
37	color	Цвет: разноцветные	t	2022-09-22 10:44:40.374069+03	28
38	size	Размер: 30 * 30 см.	t	2022-09-22 10:45:02.399619+03	28
39	color	Цвет: топленое молоко, полынь	t	2022-09-26 20:22:48.25233+03	29
40	size	Размер: 50 (50-56)	t	2022-09-26 20:23:35.358341+03	29
41	size	Размер: 56 (56-62)	t	2022-09-26 20:24:10.13957+03	29
42	size	Размер: 62 (62-68)	t	2022-09-26 20:24:48.275091+03	29
43	size	Размер: 68 (68-74)	t	2022-09-26 20:25:22.121074+03	29
44	size	Размер: 74 (74-80)	t	2022-09-26 20:25:52.658098+03	29
45	color	Цвет: коричневый	t	2022-09-26 20:33:25.773497+03	30
46	size	Размер: 50 (50-56)	t	2022-09-26 20:33:59.929939+03	30
47	size	Размер: 56 (56-62)	t	2022-09-26 20:34:25.226522+03	30
48	size	Размер: 62 (62-68)	t	2022-09-26 20:34:58.949769+03	30
49	size	Размер: 68 (68-74)	t	2022-09-26 20:35:22.137671+03	30
50	size	Размер: 74 (74-80)	t	2022-09-26 20:35:48.305821+03	30
51	color	Цвета: розовый, бирюзовый, желтый, оранжевый, зеленый	t	2022-09-26 22:29:38.058706+03	31
52	size	Размер: 38 (50-56)	t	2022-09-26 22:31:03.881345+03	31
53	size	Размер: 40 (56-62)	t	2022-09-26 22:31:53.962504+03	31
54	size	Размер: 44 (62-68)	t	2022-09-26 22:32:28.08488+03	31
55	size	Размер: 48 (68-74)	t	2022-09-26 22:33:12.901128+03	31
56	color	Цвет: белый, лайм	t	2022-09-27 08:14:41.479365+03	32
57	size	Размер: 62 (62-68)	t	2022-09-27 08:15:19.597613+03	32
58	size	Размер: 68 (68-74)	t	2022-09-27 08:15:43.585252+03	32
59	size	Размер: 74 (74-80)	t	2022-09-27 08:16:06.310804+03	32
60	color	Цвет: бежевый	t	2022-09-27 08:30:14.042325+03	33
61	size	Размер: 56 (56-62)	t	2022-09-27 08:30:52.271595+03	33
62	size	Размер: 62 (62-68)	t	2022-09-27 08:31:17.056745+03	33
63	size	Размер: 68 (68-74)	t	2022-09-27 08:31:41.005207+03	33
64	color	Цвет: голубой, зеленый, желтый	t	2022-09-27 08:41:03.100086+03	34
65	size	Размер: 56 (56-62)	t	2022-09-27 08:41:27.002894+03	34
66	size	Размер: 62 (62-68)	t	2022-09-27 08:41:51.587658+03	34
67	size	Размер: 68 (68-74)	t	2022-09-27 08:42:15.827423+03	34
68	color	Цвет: светло-бежевый	t	2022-09-27 13:34:32.080071+03	35
69	size	Размер: 50 (50-56)	t	2022-09-27 13:34:58.515305+03	35
70	size	Размер: 56 (56-62)	t	2022-09-27 13:35:25.587838+03	35
71	size	Размер: 62 (62-68)	t	2022-09-27 13:36:07.056122+03	35
72	size	Размер: 68 (68-74)	t	2022-09-27 13:36:55.500002+03	35
73	size	Размер: 74 (74-80)	t	2022-09-27 13:37:28.819531+03	35
74	color	Цвет: шалфей	t	2022-09-27 13:44:35.726418+03	36
75	size	Размер: 50 (50-56)	t	2022-09-27 13:45:09.761716+03	36
76	size	Размер: 56 (56-62)	t	2022-09-27 13:45:36.583343+03	36
77	size	Размер: 62 (62-68)	t	2022-09-27 13:46:00.176045+03	36
78	size	Размер: 68 (68-74)	t	2022-09-27 13:46:34.058672+03	36
79	size	Размер: 74 (74-80)	t	2022-09-27 13:46:58.465127+03	36
81	size	Размер: 62 (62-68)	t	2022-09-27 18:11:26.315288+03	37
82	size	Размер: 68 (68-74)	t	2022-09-27 18:12:23.521608+03	37
83	size	Размер: 74 (74-80)	t	2022-09-27 18:13:16.402706+03	37
84	size	Размер: 80 (80-86)	t	2022-09-27 18:13:59.401772+03	37
85	color	Цвет: темно-синий	t	2022-09-27 18:25:10.962353+03	38
86	size	Размер: 68 (68-74)	t	2022-09-27 18:26:33.652756+03	38
87	size	Размер: 74 (74-80)	t	2022-09-27 18:26:53.715521+03	38
88	size	Размер: 80 (80-86)	t	2022-09-27 18:27:27.730104+03	38
89	color	Цвет: каштановый	t	2022-09-27 20:37:17.733921+03	39
90	size	Размер: 50 (50-56)	t	2022-09-27 20:37:49.209022+03	39
91	size	Размер: 56 (56-62)	t	2022-09-27 20:38:12.264133+03	39
92	size	Размер: 62 (62-68)	t	2022-09-27 20:38:44.590166+03	39
93	size	Размер: 68 (68-74)	t	2022-09-27 20:39:25.033957+03	39
94	size	Размер: 74 (74-80)	t	2022-09-27 20:39:45.111898+03	39
95	color	Цвет: бежевый	t	2022-09-27 20:48:30.585111+03	40
96	size	Размер: 62 (62-68)	t	2022-09-27 20:48:49.821151+03	40
97	size	Размер: 68 (68-74)	t	2022-09-27 20:49:08.030825+03	40
98	size	Размер: 74 (74-80)	t	2022-09-27 20:49:29.047991+03	40
99	color	Цвет: розовая пудра	t	2022-09-29 13:40:55.60467+03	41
100	size	Размер: 56 (56-62)	t	2022-09-29 13:41:15.593119+03	41
101	size	Размер: 62 (62-68)	t	2022-09-29 13:41:37.275988+03	41
102	size	Размер: 68 (68-74)	t	2022-09-29 13:41:54.967159+03	41
103	size	Размер: 74 (74-80)	t	2022-09-29 13:42:26.949082+03	41
104	size	Размер: 56 (56-62)	t	2022-09-29 14:40:31.632183+03	42
105	size	Размер: 62 (62-68)	t	2022-09-29 14:40:49.744924+03	42
106	size	Размер: 68 (68-74)	t	2022-09-29 14:41:11.526807+03	42
107	color	Цвет: розовый	t	2022-09-29 14:41:30.597584+03	42
108	color	Цвет: черно-зеленый	t	2022-09-29 14:50:32.031726+03	43
109	size	Размер: 56 (56-62)	t	2022-09-29 14:51:23.57888+03	43
110	size	Размер: 62 (62-68)	t	2022-09-29 14:51:42.622401+03	43
111	size	Размер: 68 (68-74)	t	2022-09-29 14:54:02.28078+03	43
112	color	Цвет: сиреневый меланж	t	2022-09-29 15:00:22.631131+03	44
113	size	Размер: 56 (56-62)	t	2022-09-29 15:00:40.50577+03	44
114	size	Размер: 62 (62-68)	t	2022-09-29 15:00:58.730294+03	44
115	size	Размер: 68 (68-74)	t	2022-09-29 15:01:20.229164+03	44
116	color	Цвет: песочный	t	2022-09-30 12:43:33.551772+03	45
117	size	Размер: 40 (40-42)	t	2022-09-30 12:44:09.05458+03	45
118	size	Размер: 42 (42-44)	t	2022-09-30 12:44:49.093832+03	45
119	size	Размер: 44 (44-46)	t	2022-09-30 12:45:19.963451+03	45
120	size	Размер: 46 (46-48)	t	2022-09-30 12:45:48.489579+03	45
121	color	Цвет: серый	t	2022-09-30 12:55:57.979405+03	46
122	size	Размер: 38 (38-40)	t	2022-09-30 12:56:35.724976+03	46
123	size	Размер: 40 (40-42)	t	2022-09-30 12:57:02.183805+03	46
124	color	Цвет: молочный	t	2022-09-30 13:06:07.83215+03	47
125	size	Размер: 38 (38-40)	t	2022-09-30 13:06:55.942179+03	47
126	size	Размер: 42 (42-44)	t	2022-09-30 13:07:33.950452+03	47
127	color	Цвет: молочный	t	2022-09-30 13:56:31.471697+03	48
128	size	Размер: 40 (40-42)	t	2022-09-30 13:57:01.99426+03	48
129	size	Размер: 42 (42-44)	t	2022-09-30 13:57:27.494304+03	48
130	color	Цвет: серый	t	2022-09-30 14:04:16.139784+03	49
131	size	Размер: 38 (38-40)	t	2022-09-30 14:04:45.637965+03	49
132	size	Размер: 40 (40-42)	t	2022-09-30 14:05:09.477902+03	49
133	size	Размер: 42 (42-44)	t	2022-09-30 14:05:35.429174+03	49
134	size	Размер: 44 (44-46)	t	2022-09-30 14:05:58.873087+03	49
135	color	Цвет: молочный	t	2022-09-30 14:13:06.647814+03	50
136	size	Размер: 40 (40-42)	t	2022-09-30 14:13:41.543515+03	50
137	size	Размер: 42 (42-44)	t	2022-09-30 14:14:15.814409+03	50
138	color	Цвет: светло-розовый	t	2022-09-30 14:40:11.168773+03	51
139	size	Размер: 38 (38-40)	t	2022-09-30 14:40:44.946791+03	51
140	size	Размер: 40 (40-42)	t	2022-09-30 14:41:12.175837+03	51
141	size	Размер: 42 (42-44)	t	2022-09-30 14:41:38.068561+03	51
142	color	Цвет: серый меланж	t	2022-09-30 14:49:46.082518+03	52
143	size	Размер: 42 (42-44)	t	2022-09-30 14:50:11.362014+03	52
144	size	Размер: 44 (44-46)	t	2022-09-30 14:50:34.595401+03	52
145	size	Размер: 46 (46-48)	t	2022-09-30 14:50:58.546191+03	52
146	color	Цвет: пудровый	t	2022-09-30 16:21:56.981828+03	53
147	size	Размер: 90*110 см.	t	2022-09-30 16:22:42.10454+03	53
148	color	Цвет: белый	t	2022-09-30 19:16:53.6071+03	54
149	size	Размер: 90*110 см.	t	2022-09-30 19:17:21.952802+03	54
150	color	Цвет: васильковый	t	2022-09-30 19:26:41.859193+03	55
151	size	Размер: 90*110 см.	t	2022-09-30 19:27:12.516328+03	55
152	color	Цвет: розовый	t	2022-09-30 19:42:18.898509+03	56
153	size	Размер: 90*110 см.	t	2022-09-30 19:42:57.805752+03	56
\.


--
-- Name: accounts_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_account_id_seq', 3, true);


--
-- Name: accounts_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_userprofile_id_seq', 2, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 68, true);


--
-- Name: carts_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carts_cart_id_seq', 10, true);


--
-- Name: carts_cartitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carts_cartitem_id_seq', 65, true);


--
-- Name: carts_cartitem_variations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carts_cartitem_variations_id_seq', 130, true);


--
-- Name: category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_category_id_seq', 12, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 332, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 17, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 36, true);


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 42, true);


--
-- Name: orders_orderproduct_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_orderproduct_id_seq', 49, true);


--
-- Name: orders_orderproduct_variations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_orderproduct_variations_id_seq', 98, true);


--
-- Name: orders_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_payment_id_seq', 1, false);


--
-- Name: store_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_product_id_seq', 56, true);


--
-- Name: store_productgallery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_productgallery_id_seq', 60, true);


--
-- Name: store_reviewrating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_reviewrating_id_seq', 1, false);


--
-- Name: store_variation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_variation_id_seq', 153, true);


--
-- Name: accounts_account accounts_account_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_account
    ADD CONSTRAINT accounts_account_email_key UNIQUE (email);


--
-- Name: accounts_account accounts_account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_account
    ADD CONSTRAINT accounts_account_pkey PRIMARY KEY (id);


--
-- Name: accounts_account accounts_account_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_account
    ADD CONSTRAINT accounts_account_username_key UNIQUE (username);


--
-- Name: accounts_userprofile accounts_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_pkey PRIMARY KEY (id);


--
-- Name: accounts_userprofile accounts_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: carts_cart carts_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts_cart
    ADD CONSTRAINT carts_cart_pkey PRIMARY KEY (id);


--
-- Name: carts_cartitem carts_cartitem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts_cartitem
    ADD CONSTRAINT carts_cartitem_pkey PRIMARY KEY (id);


--
-- Name: carts_cartitem_variations carts_cartitem_variation_cartitem_id_variation_id_5f8efaf5_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts_cartitem_variations
    ADD CONSTRAINT carts_cartitem_variation_cartitem_id_variation_id_5f8efaf5_uniq UNIQUE (cartitem_id, variation_id);


--
-- Name: carts_cartitem_variations carts_cartitem_variations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts_cartitem_variations
    ADD CONSTRAINT carts_cartitem_variations_pkey PRIMARY KEY (id);


--
-- Name: category_category category_category_category_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_category
    ADD CONSTRAINT category_category_category_name_key UNIQUE (category_name);


--
-- Name: category_category category_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_category
    ADD CONSTRAINT category_category_pkey PRIMARY KEY (id);


--
-- Name: category_category category_category_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_category
    ADD CONSTRAINT category_category_slug_key UNIQUE (slug);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: orders_order orders_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_order
    ADD CONSTRAINT orders_order_pkey PRIMARY KEY (id);


--
-- Name: orders_orderproduct orders_orderproduct_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_orderproduct
    ADD CONSTRAINT orders_orderproduct_pkey PRIMARY KEY (id);


--
-- Name: orders_orderproduct_variations orders_orderproduct_vari_orderproduct_id_variatio_8c028ee7_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_orderproduct_variations
    ADD CONSTRAINT orders_orderproduct_vari_orderproduct_id_variatio_8c028ee7_uniq UNIQUE (orderproduct_id, variation_id);


--
-- Name: orders_orderproduct_variations orders_orderproduct_variations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_orderproduct_variations
    ADD CONSTRAINT orders_orderproduct_variations_pkey PRIMARY KEY (id);


--
-- Name: orders_payment orders_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_payment
    ADD CONSTRAINT orders_payment_pkey PRIMARY KEY (id);


--
-- Name: store_product store_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_product
    ADD CONSTRAINT store_product_pkey PRIMARY KEY (id);


--
-- Name: store_product store_product_product_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_product
    ADD CONSTRAINT store_product_product_name_key UNIQUE (product_name);


--
-- Name: store_product store_product_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_product
    ADD CONSTRAINT store_product_slug_key UNIQUE (slug);


--
-- Name: store_productgallery store_productgallery_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_productgallery
    ADD CONSTRAINT store_productgallery_pkey PRIMARY KEY (id);


--
-- Name: store_reviewrating store_reviewrating_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_reviewrating
    ADD CONSTRAINT store_reviewrating_pkey PRIMARY KEY (id);


--
-- Name: store_variation store_variation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_variation
    ADD CONSTRAINT store_variation_pkey PRIMARY KEY (id);


--
-- Name: accounts_account_email_348850e2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_account_email_348850e2_like ON public.accounts_account USING btree (email varchar_pattern_ops);


--
-- Name: accounts_account_username_b5f69a28_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_account_username_b5f69a28_like ON public.accounts_account USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: carts_cartitem_cart_id_9cb0a756; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX carts_cartitem_cart_id_9cb0a756 ON public.carts_cartitem USING btree (cart_id);


--
-- Name: carts_cartitem_product_id_acd010e4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX carts_cartitem_product_id_acd010e4 ON public.carts_cartitem USING btree (product_id);


--
-- Name: carts_cartitem_user_id_4d21e0d9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX carts_cartitem_user_id_4d21e0d9 ON public.carts_cartitem USING btree (user_id);


--
-- Name: carts_cartitem_variations_cartitem_id_8be23372; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX carts_cartitem_variations_cartitem_id_8be23372 ON public.carts_cartitem_variations USING btree (cartitem_id);


--
-- Name: carts_cartitem_variations_variation_id_ef9f9ee3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX carts_cartitem_variations_variation_id_ef9f9ee3 ON public.carts_cartitem_variations USING btree (variation_id);


--
-- Name: category_category_category_name_1aa3ee61_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX category_category_category_name_1aa3ee61_like ON public.category_category USING btree (category_name varchar_pattern_ops);


--
-- Name: category_category_parent_id_bce0763d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX category_category_parent_id_bce0763d ON public.category_category USING btree (parent_id);


--
-- Name: category_category_slug_4f83d5f6_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX category_category_slug_4f83d5f6_like ON public.category_category USING btree (slug varchar_pattern_ops);


--
-- Name: category_category_tree_id_ced84b43; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX category_category_tree_id_ced84b43 ON public.category_category USING btree (tree_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: orders_order_user_id_e9b59eb1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_order_user_id_e9b59eb1 ON public.orders_order USING btree (user_id);


--
-- Name: orders_orderproduct_order_id_5022a3e2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_orderproduct_order_id_5022a3e2 ON public.orders_orderproduct USING btree (order_id);


--
-- Name: orders_orderproduct_product_id_4d6ac024; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_orderproduct_product_id_4d6ac024 ON public.orders_orderproduct USING btree (product_id);


--
-- Name: orders_orderproduct_user_id_1e7a7ab7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_orderproduct_user_id_1e7a7ab7 ON public.orders_orderproduct USING btree (user_id);


--
-- Name: orders_orderproduct_variations_orderproduct_id_0f116a3b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_orderproduct_variations_orderproduct_id_0f116a3b ON public.orders_orderproduct_variations USING btree (orderproduct_id);


--
-- Name: orders_orderproduct_variations_variation_id_5dfd0e51; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_orderproduct_variations_variation_id_5dfd0e51 ON public.orders_orderproduct_variations USING btree (variation_id);


--
-- Name: orders_payment_user_id_cfa9f321; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_payment_user_id_cfa9f321 ON public.orders_payment USING btree (user_id);


--
-- Name: store_product_category_id_574bae65; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX store_product_category_id_574bae65 ON public.store_product USING btree (category_id);


--
-- Name: store_product_product_name_9d4b879d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX store_product_product_name_9d4b879d_like ON public.store_product USING btree (product_name varchar_pattern_ops);


--
-- Name: store_product_slug_6de8ee4b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX store_product_slug_6de8ee4b_like ON public.store_product USING btree (slug varchar_pattern_ops);


--
-- Name: store_productgallery_product_id_f2821a49; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX store_productgallery_product_id_f2821a49 ON public.store_productgallery USING btree (product_id);


--
-- Name: store_reviewrating_product_id_2e1974d6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX store_reviewrating_product_id_2e1974d6 ON public.store_reviewrating USING btree (product_id);


--
-- Name: store_reviewrating_user_id_da0ed849; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX store_reviewrating_user_id_da0ed849 ON public.store_reviewrating USING btree (user_id);


--
-- Name: store_variation_product_id_e4f08cbc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX store_variation_product_id_e4f08cbc ON public.store_variation USING btree (product_id);


--
-- Name: accounts_userprofile accounts_userprofile_user_id_92240672_fk_accounts_account_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_user_id_92240672_fk_accounts_account_id FOREIGN KEY (user_id) REFERENCES public.accounts_account(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: carts_cartitem carts_cartitem_cart_id_9cb0a756_fk_carts_cart_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts_cartitem
    ADD CONSTRAINT carts_cartitem_cart_id_9cb0a756_fk_carts_cart_id FOREIGN KEY (cart_id) REFERENCES public.carts_cart(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: carts_cartitem carts_cartitem_product_id_acd010e4_fk_store_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts_cartitem
    ADD CONSTRAINT carts_cartitem_product_id_acd010e4_fk_store_product_id FOREIGN KEY (product_id) REFERENCES public.store_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: carts_cartitem carts_cartitem_user_id_4d21e0d9_fk_accounts_account_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts_cartitem
    ADD CONSTRAINT carts_cartitem_user_id_4d21e0d9_fk_accounts_account_id FOREIGN KEY (user_id) REFERENCES public.accounts_account(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: carts_cartitem_variations carts_cartitem_varia_cartitem_id_8be23372_fk_carts_car; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts_cartitem_variations
    ADD CONSTRAINT carts_cartitem_varia_cartitem_id_8be23372_fk_carts_car FOREIGN KEY (cartitem_id) REFERENCES public.carts_cartitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: carts_cartitem_variations carts_cartitem_varia_variation_id_ef9f9ee3_fk_store_var; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts_cartitem_variations
    ADD CONSTRAINT carts_cartitem_varia_variation_id_ef9f9ee3_fk_store_var FOREIGN KEY (variation_id) REFERENCES public.store_variation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: category_category category_category_parent_id_bce0763d_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category_category
    ADD CONSTRAINT category_category_parent_id_bce0763d_fk FOREIGN KEY (parent_id) REFERENCES public.category_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_accounts_account_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_accounts_account_id FOREIGN KEY (user_id) REFERENCES public.accounts_account(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_order orders_order_user_id_e9b59eb1_fk_accounts_account_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_order
    ADD CONSTRAINT orders_order_user_id_e9b59eb1_fk_accounts_account_id FOREIGN KEY (user_id) REFERENCES public.accounts_account(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_orderproduct_variations orders_orderproduct__orderproduct_id_0f116a3b_fk_orders_or; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_orderproduct_variations
    ADD CONSTRAINT orders_orderproduct__orderproduct_id_0f116a3b_fk_orders_or FOREIGN KEY (orderproduct_id) REFERENCES public.orders_orderproduct(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_orderproduct_variations orders_orderproduct__variation_id_5dfd0e51_fk_store_var; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_orderproduct_variations
    ADD CONSTRAINT orders_orderproduct__variation_id_5dfd0e51_fk_store_var FOREIGN KEY (variation_id) REFERENCES public.store_variation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_orderproduct orders_orderproduct_order_id_5022a3e2_fk_orders_order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_orderproduct
    ADD CONSTRAINT orders_orderproduct_order_id_5022a3e2_fk_orders_order_id FOREIGN KEY (order_id) REFERENCES public.orders_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_orderproduct orders_orderproduct_product_id_4d6ac024_fk_store_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_orderproduct
    ADD CONSTRAINT orders_orderproduct_product_id_4d6ac024_fk_store_product_id FOREIGN KEY (product_id) REFERENCES public.store_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_orderproduct orders_orderproduct_user_id_1e7a7ab7_fk_accounts_account_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_orderproduct
    ADD CONSTRAINT orders_orderproduct_user_id_1e7a7ab7_fk_accounts_account_id FOREIGN KEY (user_id) REFERENCES public.accounts_account(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_payment orders_payment_user_id_cfa9f321_fk_accounts_account_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_payment
    ADD CONSTRAINT orders_payment_user_id_cfa9f321_fk_accounts_account_id FOREIGN KEY (user_id) REFERENCES public.accounts_account(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_product store_product_category_id_574bae65_fk_category_category_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_product
    ADD CONSTRAINT store_product_category_id_574bae65_fk_category_category_id FOREIGN KEY (category_id) REFERENCES public.category_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_productgallery store_productgallery_product_id_f2821a49_fk_store_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_productgallery
    ADD CONSTRAINT store_productgallery_product_id_f2821a49_fk_store_product_id FOREIGN KEY (product_id) REFERENCES public.store_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_reviewrating store_reviewrating_product_id_2e1974d6_fk_store_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_reviewrating
    ADD CONSTRAINT store_reviewrating_product_id_2e1974d6_fk_store_product_id FOREIGN KEY (product_id) REFERENCES public.store_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_reviewrating store_reviewrating_user_id_da0ed849_fk_accounts_account_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_reviewrating
    ADD CONSTRAINT store_reviewrating_user_id_da0ed849_fk_accounts_account_id FOREIGN KEY (user_id) REFERENCES public.accounts_account(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: store_variation store_variation_product_id_e4f08cbc_fk_store_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store_variation
    ADD CONSTRAINT store_variation_product_id_e4f08cbc_fk_store_product_id FOREIGN KEY (product_id) REFERENCES public.store_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

