PGDMP      1        	        |         	   dashboard    10.21    16.0 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    215030 	   dashboard    DATABASE     }   CREATE DATABASE dashboard WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE dashboard;
                postgres    false            �           0    0    DATABASE dashboard    ACL     ,   GRANT ALL ON DATABASE dashboard TO adminka;
                   postgres    false    3030                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            �           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    6            �            1259    215034    adonis_schema    TABLE     �   CREATE TABLE public.adonis_schema (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    batch integer NOT NULL,
    migration_time timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
 !   DROP TABLE public.adonis_schema;
       public            adminka    false    6            �            1259    215032    adonis_schema_id_seq    SEQUENCE     �   CREATE SEQUENCE public.adonis_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.adonis_schema_id_seq;
       public          adminka    false    197    6            �           0    0    adonis_schema_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.adonis_schema_id_seq OWNED BY public.adonis_schema.id;
          public          adminka    false    196            �            1259    215041    adonis_schema_versions    TABLE     M   CREATE TABLE public.adonis_schema_versions (
    version integer NOT NULL
);
 *   DROP TABLE public.adonis_schema_versions;
       public            adminka    false    6            �            1259    215101 
   api_tokens    TABLE     r  CREATE TABLE public.api_tokens (
    id integer NOT NULL,
    user_id integer,
    name character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    expires_at timestamp with time zone,
    created_at timestamp with time zone NOT NULL,
    code character varying(255),
    hash_token character varying(255)
);
    DROP TABLE public.api_tokens;
       public            adminka    false    6            �            1259    215099    api_tokens_id_seq    SEQUENCE     �   CREATE SEQUENCE public.api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.api_tokens_id_seq;
       public          adminka    false    206    6            �           0    0    api_tokens_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.api_tokens_id_seq OWNED BY public.api_tokens.id;
          public          adminka    false    205            �            1259    215349    bonus_operations    TABLE       CREATE TABLE public.bonus_operations (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    amount real NOT NULL,
    type character varying(255) NOT NULL,
    user_id integer,
    from_user integer
);
 $   DROP TABLE public.bonus_operations;
       public            adminka    false    6            �            1259    215347    bonus_operations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.bonus_operations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.bonus_operations_id_seq;
       public          adminka    false    6    226            �           0    0    bonus_operations_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.bonus_operations_id_seq OWNED BY public.bonus_operations.id;
          public          adminka    false    225            �            1259    215119 	   exchanges    TABLE     �  CREATE TABLE public.exchanges (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(516) NOT NULL,
    inputs json DEFAULT '[]'::json,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    status text DEFAULT 'active'::text,
    tag character varying(100) DEFAULT '_'::character varying NOT NULL,
    rest character varying(255) DEFAULT 'http'::character varying NOT NULL,
    ws character varying(255) DEFAULT 'ws'::character varying NOT NULL,
    type character varying(100),
    CONSTRAINT exchanges_status_check CHECK ((status = ANY (ARRAY['active'::text, 'disabled'::text])))
);
    DROP TABLE public.exchanges;
       public            adminka    false    6            �            1259    215117    exchanges_id_seq    SEQUENCE     �   CREATE SEQUENCE public.exchanges_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.exchanges_id_seq;
       public          adminka    false    6    208            �           0    0    exchanges_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.exchanges_id_seq OWNED BY public.exchanges.id;
          public          adminka    false    207            �            1259    215312    notifications    TABLE     �   CREATE TABLE public.notifications (
    id integer NOT NULL,
    text character varying(255),
    is_read boolean DEFAULT false,
    user_id integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    bot_id integer
);
 !   DROP TABLE public.notifications;
       public            adminka    false    6            �            1259    215310    notifications_id_seq    SEQUENCE     �   CREATE SEQUENCE public.notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.notifications_id_seq;
       public          adminka    false    224    6            �           0    0    notifications_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;
          public          adminka    false    223            �            1259    215219    oper_statuses    TABLE     �  CREATE TABLE public.oper_statuses (
    id integer NOT NULL,
    user_id integer,
    user_data_id integer,
    status text DEFAULT 'loading'::text,
    last_index integer DEFAULT 0,
    start_date bigint DEFAULT '0'::bigint,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT oper_statuses_status_check CHECK ((status = ANY (ARRAY['loading'::text, 'finished'::text])))
);
 !   DROP TABLE public.oper_statuses;
       public            adminka    false    6            �            1259    215217    oper_statuses_id_seq    SEQUENCE     �   CREATE SEQUENCE public.oper_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.oper_statuses_id_seq;
       public          adminka    false    6    216            �           0    0    oper_statuses_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.oper_statuses_id_seq OWNED BY public.oper_statuses.id;
          public          adminka    false    215            �            1259    215162    operations_users    TABLE     g  CREATE TABLE public.operations_users (
    id integer NOT NULL,
    user_id integer,
    data_id integer,
    symbol character varying(32) NOT NULL,
    data json DEFAULT '[]'::json,
    size integer DEFAULT 0 NOT NULL,
    last_order_id bigint DEFAULT '0'::bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);
 $   DROP TABLE public.operations_users;
       public            adminka    false    6            �            1259    215160    operations_users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.operations_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.operations_users_id_seq;
       public          adminka    false    6    212            �           0    0    operations_users_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.operations_users_id_seq OWNED BY public.operations_users.id;
          public          adminka    false    211            �            1259    215244    payments    TABLE     /  CREATE TABLE public.payments (
    id integer NOT NULL,
    user_id integer,
    tariff_id integer,
    is_test boolean DEFAULT true,
    amount real,
    currency character varying(255),
    status character varying(255),
    invoice_id character varying(255),
    data json DEFAULT '{}'::json,
    paid_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    errors json DEFAULT '{}'::json,
    paid_with_bonuses boolean,
    type character varying(255) DEFAULT 'cryptocloud'::character varying
);
    DROP TABLE public.payments;
       public            adminka    false    6            �            1259    215242    payments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.payments_id_seq;
       public          adminka    false    218    6            �           0    0    payments_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;
          public          adminka    false    217            �            1259    215058    roles    TABLE     �   CREATE TABLE public.roles (
    id integer NOT NULL,
    title character varying(32) NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);
    DROP TABLE public.roles;
       public            adminka    false    6            �            1259    215056    roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public          adminka    false    6    202            �           0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
          public          adminka    false    201            �            1259    215046    tariffs    TABLE     �  CREATE TABLE public.tariffs (
    id integer NOT NULL,
    price integer DEFAULT 0 NOT NULL,
    duration integer DEFAULT 0 NOT NULL,
    title character varying(32) NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    reseller_count integer,
    investment_count integer,
    rebalancer_count integer,
    reinvest boolean,
    annual boolean,
    max_fund real,
    sortouter_count integer
);
    DROP TABLE public.tariffs;
       public            adminka    false    6            �            1259    215044    tariffs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tariffs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.tariffs_id_seq;
       public          adminka    false    200    6            �           0    0    tariffs_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.tariffs_id_seq OWNED BY public.tariffs.id;
          public          adminka    false    199            �            1259    215188 	   user_bots    TABLE     %  CREATE TABLE public.user_bots (
    id integer NOT NULL,
    user_id integer,
    bot_id integer DEFAULT 0 NOT NULL,
    exchange_id integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    user_data_id integer
);
    DROP TABLE public.user_bots;
       public            adminka    false    6            �            1259    215186    user_bots_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_bots_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.user_bots_id_seq;
       public          adminka    false    6    214            �           0    0    user_bots_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.user_bots_id_seq OWNED BY public.user_bots.id;
          public          adminka    false    213            �            1259    215140 	   user_data    TABLE       CREATE TABLE public.user_data (
    id integer NOT NULL,
    user_id integer,
    exchange_id integer,
    inputs json DEFAULT '[]'::json,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone
);
    DROP TABLE public.user_data;
       public            adminka    false    6            �            1259    215138    user_data_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.user_data_id_seq;
       public          adminka    false    6    210            �           0    0    user_data_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.user_data_id_seq OWNED BY public.user_data.id;
          public          adminka    false    209            �            1259    215275    user_multi_bots    TABLE     +  CREATE TABLE public.user_multi_bots (
    id integer NOT NULL,
    user_id integer,
    bot_id integer DEFAULT 0 NOT NULL,
    exchange_id integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone,
    user_data_id integer
);
 #   DROP TABLE public.user_multi_bots;
       public            adminka    false    6            �            1259    215273    user_multi_bots_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_multi_bots_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.user_multi_bots_id_seq;
       public          adminka    false    6    220            �           0    0    user_multi_bots_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.user_multi_bots_id_seq OWNED BY public.user_multi_bots.id;
          public          adminka    false    219            �            1259    215068    users    TABLE     p  CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    password character varying(180) NOT NULL,
    tariff_id integer DEFAULT 1,
    role_id integer DEFAULT 1,
    ref_code character varying(16),
    parent_id integer,
    remember_me_token character varying(255),
    verified boolean DEFAULT false,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name character varying(255),
    tariff_start_at timestamp with time zone,
    tariff_end_at timestamp with time zone,
    referral_code character varying(255),
    referrer character varying(255),
    bonus_balance real,
    telegram_id character varying(255),
    telegram_code character varying(255),
    send_unimportant_notifications boolean DEFAULT true,
    second_level_referral boolean DEFAULT false,
    locale character varying(255)
);
    DROP TABLE public.users;
       public            adminka    false    6            �            1259    215066    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          adminka    false    204    6            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          adminka    false    203            �            1259    215299    withdraw_requests    TABLE       CREATE TABLE public.withdraw_requests (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    user_id integer,
    amount real,
    wallet character varying(255),
    status character varying(100)
);
 %   DROP TABLE public.withdraw_requests;
       public            adminka    false    6            �            1259    215297    withdraw_requests_id_seq    SEQUENCE     �   CREATE SEQUENCE public.withdraw_requests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.withdraw_requests_id_seq;
       public          adminka    false    222    6            �           0    0    withdraw_requests_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.withdraw_requests_id_seq OWNED BY public.withdraw_requests.id;
          public          adminka    false    221            �
           2604    215037    adonis_schema id    DEFAULT     t   ALTER TABLE ONLY public.adonis_schema ALTER COLUMN id SET DEFAULT nextval('public.adonis_schema_id_seq'::regclass);
 ?   ALTER TABLE public.adonis_schema ALTER COLUMN id DROP DEFAULT;
       public          adminka    false    197    196    197            �
           2604    215104    api_tokens id    DEFAULT     n   ALTER TABLE ONLY public.api_tokens ALTER COLUMN id SET DEFAULT nextval('public.api_tokens_id_seq'::regclass);
 <   ALTER TABLE public.api_tokens ALTER COLUMN id DROP DEFAULT;
       public          adminka    false    205    206    206            �
           2604    215352    bonus_operations id    DEFAULT     z   ALTER TABLE ONLY public.bonus_operations ALTER COLUMN id SET DEFAULT nextval('public.bonus_operations_id_seq'::regclass);
 B   ALTER TABLE public.bonus_operations ALTER COLUMN id DROP DEFAULT;
       public          adminka    false    226    225    226            �
           2604    215122    exchanges id    DEFAULT     l   ALTER TABLE ONLY public.exchanges ALTER COLUMN id SET DEFAULT nextval('public.exchanges_id_seq'::regclass);
 ;   ALTER TABLE public.exchanges ALTER COLUMN id DROP DEFAULT;
       public          adminka    false    207    208    208            �
           2604    215315    notifications id    DEFAULT     t   ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);
 ?   ALTER TABLE public.notifications ALTER COLUMN id DROP DEFAULT;
       public          adminka    false    223    224    224            �
           2604    215222    oper_statuses id    DEFAULT     t   ALTER TABLE ONLY public.oper_statuses ALTER COLUMN id SET DEFAULT nextval('public.oper_statuses_id_seq'::regclass);
 ?   ALTER TABLE public.oper_statuses ALTER COLUMN id DROP DEFAULT;
       public          adminka    false    216    215    216            �
           2604    215165    operations_users id    DEFAULT     z   ALTER TABLE ONLY public.operations_users ALTER COLUMN id SET DEFAULT nextval('public.operations_users_id_seq'::regclass);
 B   ALTER TABLE public.operations_users ALTER COLUMN id DROP DEFAULT;
       public          adminka    false    212    211    212            �
           2604    215247    payments id    DEFAULT     j   ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);
 :   ALTER TABLE public.payments ALTER COLUMN id DROP DEFAULT;
       public          adminka    false    217    218    218            �
           2604    215061    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public          adminka    false    201    202    202            �
           2604    215049 
   tariffs id    DEFAULT     h   ALTER TABLE ONLY public.tariffs ALTER COLUMN id SET DEFAULT nextval('public.tariffs_id_seq'::regclass);
 9   ALTER TABLE public.tariffs ALTER COLUMN id DROP DEFAULT;
       public          adminka    false    200    199    200            �
           2604    215191    user_bots id    DEFAULT     l   ALTER TABLE ONLY public.user_bots ALTER COLUMN id SET DEFAULT nextval('public.user_bots_id_seq'::regclass);
 ;   ALTER TABLE public.user_bots ALTER COLUMN id DROP DEFAULT;
       public          adminka    false    213    214    214            �
           2604    215143    user_data id    DEFAULT     l   ALTER TABLE ONLY public.user_data ALTER COLUMN id SET DEFAULT nextval('public.user_data_id_seq'::regclass);
 ;   ALTER TABLE public.user_data ALTER COLUMN id DROP DEFAULT;
       public          adminka    false    209    210    210            �
           2604    215278    user_multi_bots id    DEFAULT     x   ALTER TABLE ONLY public.user_multi_bots ALTER COLUMN id SET DEFAULT nextval('public.user_multi_bots_id_seq'::regclass);
 A   ALTER TABLE public.user_multi_bots ALTER COLUMN id DROP DEFAULT;
       public          adminka    false    219    220    220            �
           2604    215071    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          adminka    false    203    204    204            �
           2604    215302    withdraw_requests id    DEFAULT     |   ALTER TABLE ONLY public.withdraw_requests ALTER COLUMN id SET DEFAULT nextval('public.withdraw_requests_id_seq'::regclass);
 C   ALTER TABLE public.withdraw_requests ALTER COLUMN id DROP DEFAULT;
       public          adminka    false    221    222    222            �          0    215034    adonis_schema 
   TABLE DATA           H   COPY public.adonis_schema (id, name, batch, migration_time) FROM stdin;
    public          adminka    false    197   ��       �          0    215041    adonis_schema_versions 
   TABLE DATA           9   COPY public.adonis_schema_versions (version) FROM stdin;
    public          adminka    false    198   2�       �          0    215101 
   api_tokens 
   TABLE DATA           n   COPY public.api_tokens (id, user_id, name, type, token, expires_at, created_at, code, hash_token) FROM stdin;
    public          adminka    false    206   Q�       �          0    215349    bonus_operations 
   TABLE DATA           h   COPY public.bonus_operations (id, created_at, updated_at, amount, type, user_id, from_user) FROM stdin;
    public          adminka    false    226   $�       �          0    215119 	   exchanges 
   TABLE DATA           p   COPY public.exchanges (id, name, icon, inputs, created_at, updated_at, status, tag, rest, ws, type) FROM stdin;
    public          adminka    false    208   A�       �          0    215312    notifications 
   TABLE DATA           c   COPY public.notifications (id, text, is_read, user_id, created_at, updated_at, bot_id) FROM stdin;
    public          adminka    false    224   ��       �          0    215219    oper_statuses 
   TABLE DATA           z   COPY public.oper_statuses (id, user_id, user_data_id, status, last_index, start_date, created_at, updated_at) FROM stdin;
    public          adminka    false    216   ��       �          0    215162    operations_users 
   TABLE DATA           {   COPY public.operations_users (id, user_id, data_id, symbol, data, size, last_order_id, created_at, updated_at) FROM stdin;
    public          adminka    false    212   ��       �          0    215244    payments 
   TABLE DATA           �   COPY public.payments (id, user_id, tariff_id, is_test, amount, currency, status, invoice_id, data, paid_at, created_at, updated_at, errors, paid_with_bonuses, type) FROM stdin;
    public          adminka    false    218   �       �          0    215058    roles 
   TABLE DATA           B   COPY public.roles (id, title, created_at, updated_at) FROM stdin;
    public          adminka    false    202   �       �          0    215046    tariffs 
   TABLE DATA           �   COPY public.tariffs (id, price, duration, title, created_at, updated_at, reseller_count, investment_count, rebalancer_count, reinvest, annual, max_fund, sortouter_count) FROM stdin;
    public          adminka    false    200   q�       �          0    215188 	   user_bots 
   TABLE DATA           w   COPY public.user_bots (id, user_id, bot_id, exchange_id, created_at, updated_at, deleted_at, user_data_id) FROM stdin;
    public          adminka    false    214   8�       �          0    215140 	   user_data 
   TABLE DATA           i   COPY public.user_data (id, user_id, exchange_id, inputs, created_at, updated_at, deleted_at) FROM stdin;
    public          adminka    false    210   ��       �          0    215275    user_multi_bots 
   TABLE DATA           }   COPY public.user_multi_bots (id, user_id, bot_id, exchange_id, created_at, updated_at, deleted_at, user_data_id) FROM stdin;
    public          adminka    false    220   ��       �          0    215068    users 
   TABLE DATA           ;  COPY public.users (id, email, password, tariff_id, role_id, ref_code, parent_id, remember_me_token, verified, created_at, updated_at, name, tariff_start_at, tariff_end_at, referral_code, referrer, bonus_balance, telegram_id, telegram_code, send_unimportant_notifications, second_level_referral, locale) FROM stdin;
    public          adminka    false    204   ��       �          0    215299    withdraw_requests 
   TABLE DATA           h   COPY public.withdraw_requests (id, created_at, updated_at, user_id, amount, wallet, status) FROM stdin;
    public          adminka    false    222   ��       �           0    0    adonis_schema_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.adonis_schema_id_seq', 36, true);
          public          adminka    false    196            �           0    0    api_tokens_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.api_tokens_id_seq', 18, true);
          public          adminka    false    205            �           0    0    bonus_operations_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.bonus_operations_id_seq', 1, false);
          public          adminka    false    225            �           0    0    exchanges_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.exchanges_id_seq', 4, true);
          public          adminka    false    207            �           0    0    notifications_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.notifications_id_seq', 1, false);
          public          adminka    false    223            �           0    0    oper_statuses_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.oper_statuses_id_seq', 1, false);
          public          adminka    false    215            �           0    0    operations_users_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.operations_users_id_seq', 1, false);
          public          adminka    false    211            �           0    0    payments_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.payments_id_seq', 1, false);
          public          adminka    false    217            �           0    0    roles_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.roles_id_seq', 2, true);
          public          adminka    false    201            �           0    0    tariffs_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.tariffs_id_seq', 1, false);
          public          adminka    false    199            �           0    0    user_bots_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.user_bots_id_seq', 2, true);
          public          adminka    false    213            �           0    0    user_data_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.user_data_id_seq', 2, true);
          public          adminka    false    209            �           0    0    user_multi_bots_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.user_multi_bots_id_seq', 1, false);
          public          adminka    false    219            �           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 3, true);
          public          adminka    false    203            �           0    0    withdraw_requests_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.withdraw_requests_id_seq', 1, false);
          public          adminka    false    221            �
           2606    215040     adonis_schema adonis_schema_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.adonis_schema
    ADD CONSTRAINT adonis_schema_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.adonis_schema DROP CONSTRAINT adonis_schema_pkey;
       public            adminka    false    197                       2606    215109    api_tokens api_tokens_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.api_tokens
    ADD CONSTRAINT api_tokens_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.api_tokens DROP CONSTRAINT api_tokens_pkey;
       public            adminka    false    206            
           2606    215116 "   api_tokens api_tokens_token_unique 
   CONSTRAINT     ^   ALTER TABLE ONLY public.api_tokens
    ADD CONSTRAINT api_tokens_token_unique UNIQUE (token);
 L   ALTER TABLE ONLY public.api_tokens DROP CONSTRAINT api_tokens_token_unique;
       public            adminka    false    206            "           2606    215354 &   bonus_operations bonus_operations_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.bonus_operations
    ADD CONSTRAINT bonus_operations_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.bonus_operations DROP CONSTRAINT bonus_operations_pkey;
       public            adminka    false    226                       2606    215128    exchanges exchanges_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.exchanges
    ADD CONSTRAINT exchanges_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.exchanges DROP CONSTRAINT exchanges_pkey;
       public            adminka    false    208                       2606    215216    exchanges exchanges_tag_unique 
   CONSTRAINT     X   ALTER TABLE ONLY public.exchanges
    ADD CONSTRAINT exchanges_tag_unique UNIQUE (tag);
 H   ALTER TABLE ONLY public.exchanges DROP CONSTRAINT exchanges_tag_unique;
       public            adminka    false    208                        2606    215318     notifications notifications_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_pkey;
       public            adminka    false    224                       2606    215231     oper_statuses oper_statuses_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.oper_statuses
    ADD CONSTRAINT oper_statuses_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.oper_statuses DROP CONSTRAINT oper_statuses_pkey;
       public            adminka    false    216                       2606    215173 &   operations_users operations_users_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.operations_users
    ADD CONSTRAINT operations_users_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.operations_users DROP CONSTRAINT operations_users_pkey;
       public            adminka    false    212                       2606    215185 ?   operations_users operations_users_user_id_data_id_symbol_unique 
   CONSTRAINT     �   ALTER TABLE ONLY public.operations_users
    ADD CONSTRAINT operations_users_user_id_data_id_symbol_unique UNIQUE (user_id, data_id, symbol);
 i   ALTER TABLE ONLY public.operations_users DROP CONSTRAINT operations_users_user_id_data_id_symbol_unique;
       public            adminka    false    212    212    212                       2606    215254    payments payments_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.payments DROP CONSTRAINT payments_pkey;
       public            adminka    false    218            �
           2606    215063    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            adminka    false    202                        2606    215065    roles roles_title_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_title_unique UNIQUE (title);
 B   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_title_unique;
       public            adminka    false    202            �
           2606    215053    tariffs tariffs_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.tariffs
    ADD CONSTRAINT tariffs_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.tariffs DROP CONSTRAINT tariffs_pkey;
       public            adminka    false    200                       2606    215194    user_bots user_bots_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.user_bots
    ADD CONSTRAINT user_bots_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.user_bots DROP CONSTRAINT user_bots_pkey;
       public            adminka    false    214                       2606    215149    user_data user_data_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.user_data
    ADD CONSTRAINT user_data_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.user_data DROP CONSTRAINT user_data_pkey;
       public            adminka    false    210                       2606    215281 $   user_multi_bots user_multi_bots_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.user_multi_bots
    ADD CONSTRAINT user_multi_bots_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.user_multi_bots DROP CONSTRAINT user_multi_bots_pkey;
       public            adminka    false    220                       2606    215081    users users_email_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_unique;
       public            adminka    false    204                       2606    215079    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            adminka    false    204                       2606    215093    users users_ref_code_unique 
   CONSTRAINT     Z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_ref_code_unique UNIQUE (ref_code);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_ref_code_unique;
       public            adminka    false    204                       2606    215304 (   withdraw_requests withdraw_requests_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.withdraw_requests
    ADD CONSTRAINT withdraw_requests_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.withdraw_requests DROP CONSTRAINT withdraw_requests_pkey;
       public            adminka    false    222            &           2606    215110 %   api_tokens api_tokens_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.api_tokens
    ADD CONSTRAINT api_tokens_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.api_tokens DROP CONSTRAINT api_tokens_user_id_foreign;
       public          adminka    false    206    204    2820            7           2606    215370 3   bonus_operations bonus_operations_from_user_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.bonus_operations
    ADD CONSTRAINT bonus_operations_from_user_foreign FOREIGN KEY (from_user) REFERENCES public.users(id);
 ]   ALTER TABLE ONLY public.bonus_operations DROP CONSTRAINT bonus_operations_from_user_foreign;
       public          adminka    false    2820    226    204            8           2606    215355 1   bonus_operations bonus_operations_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.bonus_operations
    ADD CONSTRAINT bonus_operations_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);
 [   ALTER TABLE ONLY public.bonus_operations DROP CONSTRAINT bonus_operations_user_id_foreign;
       public          adminka    false    226    2820    204            6           2606    215319 +   notifications notifications_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);
 U   ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_user_id_foreign;
       public          adminka    false    204    224    2820            .           2606    215237 0   oper_statuses oper_statuses_user_data_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.oper_statuses
    ADD CONSTRAINT oper_statuses_user_data_id_foreign FOREIGN KEY (user_data_id) REFERENCES public.user_data(id);
 Z   ALTER TABLE ONLY public.oper_statuses DROP CONSTRAINT oper_statuses_user_data_id_foreign;
       public          adminka    false    2832    210    216            /           2606    215232 +   oper_statuses oper_statuses_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.oper_statuses
    ADD CONSTRAINT oper_statuses_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);
 U   ALTER TABLE ONLY public.oper_statuses DROP CONSTRAINT oper_statuses_user_id_foreign;
       public          adminka    false    204    216    2820            )           2606    215179 1   operations_users operations_users_data_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.operations_users
    ADD CONSTRAINT operations_users_data_id_foreign FOREIGN KEY (data_id) REFERENCES public.user_data(id);
 [   ALTER TABLE ONLY public.operations_users DROP CONSTRAINT operations_users_data_id_foreign;
       public          adminka    false    2832    210    212            *           2606    215174 1   operations_users operations_users_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.operations_users
    ADD CONSTRAINT operations_users_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);
 [   ALTER TABLE ONLY public.operations_users DROP CONSTRAINT operations_users_user_id_foreign;
       public          adminka    false    212    204    2820            0           2606    215260 #   payments payments_tariff_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_tariff_id_foreign FOREIGN KEY (tariff_id) REFERENCES public.tariffs(id);
 M   ALTER TABLE ONLY public.payments DROP CONSTRAINT payments_tariff_id_foreign;
       public          adminka    false    2812    218    200            1           2606    215255 !   payments payments_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);
 K   ALTER TABLE ONLY public.payments DROP CONSTRAINT payments_user_id_foreign;
       public          adminka    false    218    2820    204            +           2606    215200 '   user_bots user_bots_exchange_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_bots
    ADD CONSTRAINT user_bots_exchange_id_foreign FOREIGN KEY (exchange_id) REFERENCES public.exchanges(id);
 Q   ALTER TABLE ONLY public.user_bots DROP CONSTRAINT user_bots_exchange_id_foreign;
       public          adminka    false    2828    208    214            ,           2606    215292 (   user_bots user_bots_user_data_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_bots
    ADD CONSTRAINT user_bots_user_data_id_foreign FOREIGN KEY (user_data_id) REFERENCES public.user_data(id);
 R   ALTER TABLE ONLY public.user_bots DROP CONSTRAINT user_bots_user_data_id_foreign;
       public          adminka    false    2832    210    214            -           2606    215195 #   user_bots user_bots_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_bots
    ADD CONSTRAINT user_bots_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);
 M   ALTER TABLE ONLY public.user_bots DROP CONSTRAINT user_bots_user_id_foreign;
       public          adminka    false    2820    214    204            '           2606    215155 '   user_data user_data_exchange_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_data
    ADD CONSTRAINT user_data_exchange_id_foreign FOREIGN KEY (exchange_id) REFERENCES public.exchanges(id);
 Q   ALTER TABLE ONLY public.user_data DROP CONSTRAINT user_data_exchange_id_foreign;
       public          adminka    false    210    2828    208            (           2606    215150 #   user_data user_data_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_data
    ADD CONSTRAINT user_data_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);
 M   ALTER TABLE ONLY public.user_data DROP CONSTRAINT user_data_user_id_foreign;
       public          adminka    false    2820    204    210            2           2606    215287 3   user_multi_bots user_multi_bots_exchange_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_multi_bots
    ADD CONSTRAINT user_multi_bots_exchange_id_foreign FOREIGN KEY (exchange_id) REFERENCES public.exchanges(id);
 ]   ALTER TABLE ONLY public.user_multi_bots DROP CONSTRAINT user_multi_bots_exchange_id_foreign;
       public          adminka    false    2828    220    208            3           2606    215324 4   user_multi_bots user_multi_bots_user_data_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_multi_bots
    ADD CONSTRAINT user_multi_bots_user_data_id_foreign FOREIGN KEY (user_data_id) REFERENCES public.user_data(id);
 ^   ALTER TABLE ONLY public.user_multi_bots DROP CONSTRAINT user_multi_bots_user_data_id_foreign;
       public          adminka    false    2832    220    210            4           2606    215282 /   user_multi_bots user_multi_bots_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_multi_bots
    ADD CONSTRAINT user_multi_bots_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);
 Y   ALTER TABLE ONLY public.user_multi_bots DROP CONSTRAINT user_multi_bots_user_id_foreign;
       public          adminka    false    220    2820    204            #           2606    215094    users users_parent_id_foreign    FK CONSTRAINT     ~   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_parent_id_foreign FOREIGN KEY (parent_id) REFERENCES public.users(id);
 G   ALTER TABLE ONLY public.users DROP CONSTRAINT users_parent_id_foreign;
       public          adminka    false    204    204    2820            $           2606    215087    users users_role_id_foreign    FK CONSTRAINT     z   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_role_id_foreign;
       public          adminka    false    2814    204    202            %           2606    215082    users users_tariff_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_tariff_id_foreign FOREIGN KEY (tariff_id) REFERENCES public.tariffs(id);
 G   ALTER TABLE ONLY public.users DROP CONSTRAINT users_tariff_id_foreign;
       public          adminka    false    2812    204    200            5           2606    215305 3   withdraw_requests withdraw_requests_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.withdraw_requests
    ADD CONSTRAINT withdraw_requests_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);
 ]   ALTER TABLE ONLY public.withdraw_requests DROP CONSTRAINT withdraw_requests_user_id_foreign;
       public          adminka    false    2820    204    222            �   �  x����r�6�������z�?�ȳtF���DSYr%�����N�t
;ז?�� ��C���ۥ�v��v��q�1`���ج����<`@��+��OO,;�A��#�b��4�4t�)$�D�H�@�����.)�p9�$RD
Jд�Y�����	�eÉ���1fĦ��i�g��1 A�fti�*H��~.��>�J'�	��'R�k��<�J����4l�Y���]�٘�QH7�z��
�ɾ�G�>�-�\��Nrf���Ҽ�����\z�>��_g�IYI�XܼXe���E�fY�մ�Y�t
��d$n<��N�芪I����h�پ���y����� R��aR$�h�"����;4���n8XX�X��H�Po�̎A,���[�j��t��X)',`/e΁���=����T3k)���Q�C)��l�O�b&��x1�`WH1�K��=u�h�$XN�^-�vn"�50u�ԶzXD5���C��$I�꘹;����<�e|�E�
m������ѯ/&�E�-��=�o!��A/�VM-��J�������}�k+�f\�zqU�%$!E��㺟ݽ�g|&�l�����	�V��u��./��G[��4nP1�m7���~_�6?r=�Q"� )���2
n�1��Y�nT)e	�W��j��YXl�Vϻ	�����S��jS�~>���K�@X����!��-�h*���<�k;�q���Y�En�ISҨ��L��M>�r��j�ɍ��3���Z�����QS��}r#k�=D2]u�O��������;�D{K.u��=��=�j��tz��wq�&N��NA"+W�0�����7,j;�M!b
f��6��c����˺�����'IOv��H������7���      �      x�3����� a �      �   �  x�}�IsbI���+t�YF���� �X�a��I�˯����K���J�C|��{�͵���oJ����f𲎛��.s^seP�;���>	�e0�$|4��`��	Q��@)	1���!�W+G	��o@A�Ȥb�!*��<��f�ƫ�\Z�T�����ޅB��;o�NϪr�P����!��qp��--�^i�
u���+ R�>Zp�X�QK1@��Ԁ�R��Fq�!*#	�+A���$m/n()2R$,CƏ���ሪ"��1�� ˵�Yw���o�e�l��a{��M�!��qu���7z�^�2�羰�]��<�4�n��
�%�%C�*��� �B� ����3�$��)��K��R�)b���eQ�Lr�'�T��Of��"�:fkҟPtC�K�:i�_ՠ�|��ګe�O�J�l�a//��͠�����a��?��
���;�"3�J��8é� �8Q�G��)x��h��Y�� @F@��h���`r�R�o�{�F�g���ep��:��F����'���i����s+<�]H��;�S�:���
X2�S��
���YОJ&⬒&8�Y�����kat��pB�&x e��	V*c
~�	.r�n6�6O�Jj?{��z��s��/�J��8����ʅR�0���u�UY+v{|�4�.��<�+dZEK<W���Q�ZYe🥠D�� ���4 Ii�&1�rQj�݋B9ˤ��B���d��T����A){�qK/��K���Vzc�~�h��޾�OdS�Toq��y��Q��_�.��{�\A��`�� �E��ȩ�dD��c�����c�T������=?�#?�r���h?G$J?FBrA�.�9����	�V�j�j�n���J�V���z˓zI?j��dC�c��a�z-ۅM�@pydQIy�A�4"I �p���Lm#�"0���Ea2E��s$�g�I Z=���ɰ��о������ɑ�4��;8��mӟ֞F������a4����y�����c6���pa�I� 1�/��^���HVZ�$� 1�[�.r���n�}$ `g���䯑��h�p�d١���JmT��Tu67��c��5l��eH���%OeN�υ�Ő�R{�\�z��BF�!�Y�9�&��a�S/�p)etX�(�7�y���J���
�h�%#7X�{�d���2"��Ѻ?��l����D�f\�w}�؜�;�]�ۖH!Uf#3%�ʦ�a�~�>]���)�Z�Qԃ��'-`+# nS�>R-
�Q��|]BP�|0�$��`�������G�/m�=쏲i��]cqK�z[>���m�J�I�Aˏ���ޡ��t]�����L+1׎���A8C���&P���T�2P�̕�͔�$$Z1����/�i��ܝ����4�E�#�e������M�&�lI8v���~�U]�^�WZ��?����f�����R)A���ɫ)�*�]=C��s�v��<�R8Bd��\��W�y���J{�1��ik��E�?�����2���I�]�h>�Z���bU�_��kd��T��z�-��]�~0a��K�u�HZ?ظ�v�a�"xL	��l��V���2��H!ѡ8<E�<ţ ������?�i>��(�;��2�iGŴF�y�jYf�������/�O1�f�偼U����^������~fȢ�|��V:�uo���+�����/�      �      x������ � �      �   Z  x���Ko�@���WX^x�¼��*�6m�<7IB�0��y�H�������ċd�s�e�|g�EƮ�Xƅ1պPC �R�$��"�-��@�,
�$�e�ȃ��`�)y��mu���2��ް�
�I�{o{	D�;'G�Y��~��Q��B?.��-*bۄ�D^9C��`�Vv��Ro��E��Z�kY#�8Z�K�Rk�fܪV�U憱�@M�ݣ��x�r����X3�Je��"�YT2��@,�٬�0�x����
|��� "N(��s"�g�K�Q���8�qQ΀�,>���d+W�q��M���	��XK%�l��y����<��1dUe���U)Q�I-ne�oc}��j"�}�X��'��|������?;���\V���'Gnqj]�;%��a޹��o*�H=y��d���9$PB�8���0l��B����*�7�f��>�����UQD^9c��9�����{,v��ѬG᤯��$��f��,�{a���$�f�-��61W���Z�(]
�>�AM���؋W�=����S����V�%s���LiǍ�r��x�y-!g;������*���au:�?ٮg      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   B   x�3�L��L�+�4202�50�5�T04�21�21�3�0�60�#�eę�����C�n� )�=... 7N      �   �   x����
�0�s���F�&��уG��2d���[�`C3������)Y�p�^�k��k��Ĕ84��;�ZhA a���|�)�����ATsj9[XZ��E=OeP�sj�rV�0%x;���W���A�O|VM^����m�g�MZ��Q�"��W~W�$�
�Ib"i���G�6Ƙ7agq�      �   N   x�3�4�4b##]C]#3CS+S3+cs=sms|R1~��\@͜ƨFZYX���$e7"F��� ���      �   &  x�}��n�@F��f�U�0�:h���L��.���Vp(6�{��j�������rl��~�"�D@�.5�t ��e1dc�ΓYY��dM���'���zא��>�m���*�w�1�qV��w-���:���-/�pU��q`�������J��kӦ�������qQW����L,CT�e�]�>�:�dy� ����a�6�uu�� QDr/Z<	w���&t4�i�2������������)��,|nRN��Oʭ��T�4︊a�g�uE��.j:�=����%g�EO�o5	}�      �      x������ � �      �   �  x�}�[o�@���_��ߐ��z��"a�M�hC��T��ŋ_��4J�$J*���Hg�7�(5�0J��C]�E�$�V��[�Vy���
Jվ�8�TW�,#�-U��V_E���k���p�կ�8� l���bbCd#�G�#�#� #q	J���������M���fUm�wG;������$�B���2J̥ZZ�j}��or�c�ʦl�Uжt&���3���TzX8���H���^�0hO?�����'��� ��vg�@QM�Od�[yQ�/u��!W�b<�LB#�jQ������G�%�Y�X0[��]��F���Y�M1W��I��;=���d_���No��zם���A�P��;lC�Ggf�a� ��2QY��.9���,C��Yl'F6I#n�(��8u1��b�f/Eo�^����*      �      x������ � �     