--
-- PostgreSQL database dump
--

\restrict JcEkak4x4g4wJp6iR8HYihJBWMcdi2ow3pYz9qpbJEbtvJ9zxKoiEUACW3W6BQx

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-01-26 16:02:24

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
-- TOC entry 230 (class 1259 OID 24894)
-- Name: accommodation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accommodation (
    accommodation_id integer NOT NULL,
    booking_id integer NOT NULL,
    name character varying(100) NOT NULL,
    location character varying(100) NOT NULL,
    room_type character varying(50) NOT NULL,
    price_per_night numeric(10,2) NOT NULL
);


ALTER TABLE public.accommodation OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 24893)
-- Name: accommodation_accommodation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accommodation_accommodation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.accommodation_accommodation_id_seq OWNER TO postgres;

--
-- TOC entry 5107 (class 0 OID 0)
-- Dependencies: 229
-- Name: accommodation_accommodation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accommodation_accommodation_id_seq OWNED BY public.accommodation.accommodation_id;


--
-- TOC entry 226 (class 1259 OID 24858)
-- Name: booking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking (
    booking_id integer NOT NULL,
    customer_id integer NOT NULL,
    booking_date date NOT NULL,
    booking_status character varying(30) NOT NULL,
    total_cost numeric(10,2) NOT NULL
);


ALTER TABLE public.booking OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 24857)
-- Name: booking_booking_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_booking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.booking_booking_id_seq OWNER TO postgres;

--
-- TOC entry 5108 (class 0 OID 0)
-- Dependencies: 225
-- Name: booking_booking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_booking_id_seq OWNED BY public.booking.booking_id;


--
-- TOC entry 235 (class 1259 OID 24939)
-- Name: booking_service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking_service (
    booking_id integer NOT NULL,
    service_id integer NOT NULL
);


ALTER TABLE public.booking_service OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 24838)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    customer_id integer NOT NULL,
    user_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    loyalty_points integer DEFAULT 0
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24837)
-- Name: customer_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_customer_id_seq OWNER TO postgres;

--
-- TOC entry 5109 (class 0 OID 0)
-- Dependencies: 223
-- Name: customer_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_customer_id_seq OWNED BY public.customer.customer_id;


--
-- TOC entry 228 (class 1259 OID 24875)
-- Name: flight; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flight (
    flight_id integer NOT NULL,
    booking_id integer NOT NULL,
    airline character varying(100) NOT NULL,
    departure character varying(100) NOT NULL,
    destination character varying(100) NOT NULL,
    seat_class character varying(20) NOT NULL,
    price numeric(10,2) NOT NULL
);


ALTER TABLE public.flight OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 24874)
-- Name: flight_flight_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.flight_flight_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.flight_flight_id_seq OWNER TO postgres;

--
-- TOC entry 5110 (class 0 OID 0)
-- Dependencies: 227
-- Name: flight_flight_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.flight_flight_id_seq OWNED BY public.flight.flight_id;


--
-- TOC entry 234 (class 1259 OID 24930)
-- Name: optional_service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.optional_service (
    service_id integer NOT NULL,
    service_name character varying(100) NOT NULL,
    service_price numeric(10,2) NOT NULL
);


ALTER TABLE public.optional_service OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 24929)
-- Name: optional_service_service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.optional_service_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.optional_service_service_id_seq OWNER TO postgres;

--
-- TOC entry 5111 (class 0 OID 0)
-- Dependencies: 233
-- Name: optional_service_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.optional_service_service_id_seq OWNED BY public.optional_service.service_id;


--
-- TOC entry 232 (class 1259 OID 24912)
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    payment_id integer NOT NULL,
    booking_id integer NOT NULL,
    payment_method character varying(50) NOT NULL,
    payment_date date NOT NULL,
    amount numeric(10,2) NOT NULL,
    payment_status character varying(30) NOT NULL
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 24911)
-- Name: payment_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payment_payment_id_seq OWNER TO postgres;

--
-- TOC entry 5112 (class 0 OID 0)
-- Dependencies: 231
-- Name: payment_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_payment_id_seq OWNED BY public.payment.payment_id;


--
-- TOC entry 220 (class 1259 OID 24806)
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    role_id integer NOT NULL,
    role_name character varying(50) NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24805)
-- Name: role_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.role_role_id_seq OWNER TO postgres;

--
-- TOC entry 5113 (class 0 OID 0)
-- Dependencies: 219
-- Name: role_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_role_id_seq OWNED BY public.role.role_id;


--
-- TOC entry 222 (class 1259 OID 24817)
-- Name: user_account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_account (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.user_account OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24816)
-- Name: user_account_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_account_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_account_user_id_seq OWNER TO postgres;

--
-- TOC entry 5114 (class 0 OID 0)
-- Dependencies: 221
-- Name: user_account_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_account_user_id_seq OWNED BY public.user_account.user_id;


--
-- TOC entry 4901 (class 2604 OID 24897)
-- Name: accommodation accommodation_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accommodation ALTER COLUMN accommodation_id SET DEFAULT nextval('public.accommodation_accommodation_id_seq'::regclass);


--
-- TOC entry 4899 (class 2604 OID 24861)
-- Name: booking booking_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking ALTER COLUMN booking_id SET DEFAULT nextval('public.booking_booking_id_seq'::regclass);


--
-- TOC entry 4897 (class 2604 OID 24841)
-- Name: customer customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN customer_id SET DEFAULT nextval('public.customer_customer_id_seq'::regclass);


--
-- TOC entry 4900 (class 2604 OID 24878)
-- Name: flight flight_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flight ALTER COLUMN flight_id SET DEFAULT nextval('public.flight_flight_id_seq'::regclass);


--
-- TOC entry 4903 (class 2604 OID 24933)
-- Name: optional_service service_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.optional_service ALTER COLUMN service_id SET DEFAULT nextval('public.optional_service_service_id_seq'::regclass);


--
-- TOC entry 4902 (class 2604 OID 24915)
-- Name: payment payment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment ALTER COLUMN payment_id SET DEFAULT nextval('public.payment_payment_id_seq'::regclass);


--
-- TOC entry 4895 (class 2604 OID 24809)
-- Name: role role_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN role_id SET DEFAULT nextval('public.role_role_id_seq'::regclass);


--
-- TOC entry 4896 (class 2604 OID 24820)
-- Name: user_account user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account ALTER COLUMN user_id SET DEFAULT nextval('public.user_account_user_id_seq'::regclass);


-- Completed on 2026-01-26 16:02:24

--
-- PostgreSQL database dump complete
--

\unrestrict JcEkak4x4g4wJp6iR8HYihJBWMcdi2ow3pYz9qpbJEbtvJ9zxKoiEUACW3W6BQx

