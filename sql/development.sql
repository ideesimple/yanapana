--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: spree_activators; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_activators (
    id integer NOT NULL,
    description character varying(255),
    expires_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    starts_at timestamp without time zone,
    name character varying(255),
    event_name character varying(255),
    type character varying(255),
    usage_limit integer,
    match_policy character varying(255) DEFAULT 'all'::character varying,
    code character varying(255),
    advertise boolean DEFAULT false,
    path character varying(255)
);


ALTER TABLE public.spree_activators OWNER TO postgres;

--
-- Name: spree_activators_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_activators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_activators_id_seq OWNER TO postgres;

--
-- Name: spree_activators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_activators_id_seq OWNED BY spree_activators.id;


--
-- Name: spree_addresses; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_addresses (
    id integer NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    address1 character varying(255),
    address2 character varying(255),
    city character varying(255),
    zipcode character varying(255),
    phone character varying(255),
    state_name character varying(255),
    alternative_phone character varying(255),
    state_id integer,
    country_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    company character varying(255)
);


ALTER TABLE public.spree_addresses OWNER TO postgres;

--
-- Name: spree_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_addresses_id_seq OWNER TO postgres;

--
-- Name: spree_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_addresses_id_seq OWNED BY spree_addresses.id;


--
-- Name: spree_adjustments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_adjustments (
    id integer NOT NULL,
    source_id integer,
    amount numeric(8,2) DEFAULT NULL::numeric,
    label character varying(255),
    source_type character varying(255),
    adjustable_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    mandatory boolean,
    locked boolean,
    originator_id integer,
    originator_type character varying(255),
    eligible boolean DEFAULT true,
    adjustable_type character varying(255)
);


ALTER TABLE public.spree_adjustments OWNER TO postgres;

--
-- Name: spree_adjustments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_adjustments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_adjustments_id_seq OWNER TO postgres;

--
-- Name: spree_adjustments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_adjustments_id_seq OWNED BY spree_adjustments.id;


--
-- Name: spree_artists; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_artists (
    id integer NOT NULL,
    name character varying(255),
    last_name character varying(255),
    address text,
    date_of_birth date,
    type_art character varying(255),
    webpage character varying(255),
    portfolio character varying(255),
    link_twitter character varying(255),
    link_facebook character varying(255),
    email character varying(255),
    telephone character varying(255),
    place text,
    sex character varying(255),
    reason text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    photo_file_name character varying(255),
    photo_content_type character varying(255),
    photo_file_size integer,
    photo_updated_at timestamp without time zone,
    state character varying(255),
    city character varying(255),
    zip character varying(255)
);


ALTER TABLE public.spree_artists OWNER TO postgres;

--
-- Name: spree_artists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_artists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_artists_id_seq OWNER TO postgres;

--
-- Name: spree_artists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_artists_id_seq OWNED BY spree_artists.id;


--
-- Name: spree_assets; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_assets (
    id integer NOT NULL,
    viewable_id integer,
    attachment_width integer,
    attachment_height integer,
    attachment_file_size integer,
    "position" integer,
    viewable_type character varying(50),
    attachment_content_type character varying(255),
    attachment_file_name character varying(255),
    type character varying(75),
    attachment_updated_at timestamp without time zone,
    alt text
);


ALTER TABLE public.spree_assets OWNER TO postgres;

--
-- Name: spree_assets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_assets_id_seq OWNER TO postgres;

--
-- Name: spree_assets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_assets_id_seq OWNED BY spree_assets.id;


--
-- Name: spree_calculators; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_calculators (
    id integer NOT NULL,
    type character varying(255),
    calculable_id integer NOT NULL,
    calculable_type character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_calculators OWNER TO postgres;

--
-- Name: spree_calculators_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_calculators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_calculators_id_seq OWNER TO postgres;

--
-- Name: spree_calculators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_calculators_id_seq OWNED BY spree_calculators.id;


--
-- Name: spree_causes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_causes (
    id integer NOT NULL,
    title character varying(255),
    description text,
    goal_facebook integer,
    goal_twitter integer,
    goal_money numeric,
    link_facebook character varying(255),
    link_twitter character varying(255),
    photo_file_name character varying(255),
    photo_content_type character varying(255),
    photo_file_size integer,
    photo_updated_at timestamp without time zone,
    video text,
    link_pinterest character varying(255),
    status boolean,
    number_goal integer,
    artist_id integer,
    organization_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    date_start timestamp without time zone,
    date_finish timestamp without time zone,
    inspiration text,
    sharephoto_file_name character varying(255),
    sharephoto_content_type character varying(255),
    sharephoto_file_size integer,
    sharephoto_updated_at timestamp without time zone,
    titleshare character varying(255),
    time_zone character varying(255)
);


ALTER TABLE public.spree_causes OWNER TO postgres;

--
-- Name: spree_causes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_causes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_causes_id_seq OWNER TO postgres;

--
-- Name: spree_causes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_causes_id_seq OWNED BY spree_causes.id;


--
-- Name: spree_configurations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_configurations (
    id integer NOT NULL,
    name character varying(255),
    type character varying(50),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_configurations OWNER TO postgres;

--
-- Name: spree_configurations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_configurations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_configurations_id_seq OWNER TO postgres;

--
-- Name: spree_configurations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_configurations_id_seq OWNED BY spree_configurations.id;


--
-- Name: spree_countries; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_countries (
    id integer NOT NULL,
    iso_name character varying(255),
    iso character varying(255),
    iso3 character varying(255),
    name character varying(255),
    numcode integer
);


ALTER TABLE public.spree_countries OWNER TO postgres;

--
-- Name: spree_countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_countries_id_seq OWNER TO postgres;

--
-- Name: spree_countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_countries_id_seq OWNED BY spree_countries.id;


--
-- Name: spree_credit_cards; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_credit_cards (
    id integer NOT NULL,
    month character varying(255),
    year character varying(255),
    cc_type character varying(255),
    last_digits character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    start_month character varying(255),
    start_year character varying(255),
    issue_number character varying(255),
    address_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    gateway_customer_profile_id character varying(255),
    gateway_payment_profile_id character varying(255)
);


ALTER TABLE public.spree_credit_cards OWNER TO postgres;

--
-- Name: spree_credit_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_credit_cards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_credit_cards_id_seq OWNER TO postgres;

--
-- Name: spree_credit_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_credit_cards_id_seq OWNED BY spree_credit_cards.id;


--
-- Name: spree_faqs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_faqs (
    id integer NOT NULL,
    question character varying(255),
    answer text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "position" integer
);


ALTER TABLE public.spree_faqs OWNER TO postgres;

--
-- Name: spree_faqs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_faqs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_faqs_id_seq OWNER TO postgres;

--
-- Name: spree_faqs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_faqs_id_seq OWNED BY spree_faqs.id;


--
-- Name: spree_gateways; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_gateways (
    id integer NOT NULL,
    type character varying(255),
    name character varying(255),
    description text,
    active boolean DEFAULT true,
    environment character varying(255) DEFAULT 'development'::character varying,
    server character varying(255) DEFAULT 'test'::character varying,
    test_mode boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_gateways OWNER TO postgres;

--
-- Name: spree_gateways_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_gateways_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_gateways_id_seq OWNER TO postgres;

--
-- Name: spree_gateways_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_gateways_id_seq OWNED BY spree_gateways.id;


--
-- Name: spree_inventory_units; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_inventory_units (
    id integer NOT NULL,
    lock_version integer DEFAULT 0,
    state character varying(255),
    variant_id integer,
    order_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    shipment_id integer,
    return_authorization_id integer
);


ALTER TABLE public.spree_inventory_units OWNER TO postgres;

--
-- Name: spree_inventory_units_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_inventory_units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_inventory_units_id_seq OWNER TO postgres;

--
-- Name: spree_inventory_units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_inventory_units_id_seq OWNED BY spree_inventory_units.id;


--
-- Name: spree_line_items; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_line_items (
    id integer NOT NULL,
    order_id integer,
    variant_id integer,
    quantity integer NOT NULL,
    price numeric(8,2) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_line_items OWNER TO postgres;

--
-- Name: spree_line_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_line_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_line_items_id_seq OWNER TO postgres;

--
-- Name: spree_line_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_line_items_id_seq OWNED BY spree_line_items.id;


--
-- Name: spree_log_entries; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_log_entries (
    id integer NOT NULL,
    source_id integer,
    source_type character varying(255),
    details text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_log_entries OWNER TO postgres;

--
-- Name: spree_log_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_log_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_log_entries_id_seq OWNER TO postgres;

--
-- Name: spree_log_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_log_entries_id_seq OWNED BY spree_log_entries.id;


--
-- Name: spree_mail_methods; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_mail_methods (
    id integer NOT NULL,
    environment character varying(255),
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_mail_methods OWNER TO postgres;

--
-- Name: spree_mail_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_mail_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_mail_methods_id_seq OWNER TO postgres;

--
-- Name: spree_mail_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_mail_methods_id_seq OWNED BY spree_mail_methods.id;


--
-- Name: spree_option_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_option_types (
    id integer NOT NULL,
    name character varying(100),
    presentation character varying(100),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "position" integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.spree_option_types OWNER TO postgres;

--
-- Name: spree_option_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_option_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_option_types_id_seq OWNER TO postgres;

--
-- Name: spree_option_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_option_types_id_seq OWNED BY spree_option_types.id;


--
-- Name: spree_option_types_prototypes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_option_types_prototypes (
    prototype_id integer,
    option_type_id integer
);


ALTER TABLE public.spree_option_types_prototypes OWNER TO postgres;

--
-- Name: spree_option_values; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_option_values (
    id integer NOT NULL,
    "position" integer,
    name character varying(255),
    presentation character varying(255),
    option_type_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    chest character varying(255),
    waist character varying(255),
    lenght character varying(255)
);


ALTER TABLE public.spree_option_values OWNER TO postgres;

--
-- Name: spree_option_values_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_option_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_option_values_id_seq OWNER TO postgres;

--
-- Name: spree_option_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_option_values_id_seq OWNED BY spree_option_values.id;


--
-- Name: spree_option_values_variants; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_option_values_variants (
    variant_id integer,
    option_value_id integer
);


ALTER TABLE public.spree_option_values_variants OWNER TO postgres;

--
-- Name: spree_orders; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_orders (
    id integer NOT NULL,
    number character varying(15),
    item_total numeric(8,2) DEFAULT 0.0 NOT NULL,
    total numeric(8,2) DEFAULT 0.0 NOT NULL,
    state character varying(255),
    adjustment_total numeric(8,2) DEFAULT 0.0 NOT NULL,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    completed_at timestamp without time zone,
    bill_address_id integer,
    ship_address_id integer,
    payment_total numeric(8,2) DEFAULT 0.0,
    shipping_method_id integer,
    shipment_state character varying(255),
    payment_state character varying(255),
    email character varying(255),
    special_instructions text
);


ALTER TABLE public.spree_orders OWNER TO postgres;

--
-- Name: spree_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_orders_id_seq OWNER TO postgres;

--
-- Name: spree_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_orders_id_seq OWNED BY spree_orders.id;


--
-- Name: spree_organizations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_organizations (
    id integer NOT NULL,
    name character varying(255),
    description text,
    country character varying(255),
    contact character varying(255),
    email character varying(255),
    phonenumber character varying(255),
    link_twitter character varying(255),
    link_facebook character varying(255),
    video text,
    webpage character varying(255),
    contact_name character varying(255),
    contact_number character varying(255),
    exemption_number character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    photo_file_name character varying(255),
    photo_content_type character varying(255),
    photo_file_size integer,
    photo_updated_at timestamp without time zone,
    address text,
    state character varying(255),
    city character varying(255),
    zip character varying(255)
);


ALTER TABLE public.spree_organizations OWNER TO postgres;

--
-- Name: spree_organizations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_organizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_organizations_id_seq OWNER TO postgres;

--
-- Name: spree_organizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_organizations_id_seq OWNED BY spree_organizations.id;


--
-- Name: spree_payment_methods; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_payment_methods (
    id integer NOT NULL,
    type character varying(255),
    name character varying(255),
    description text,
    active boolean DEFAULT true,
    environment character varying(255) DEFAULT 'development'::character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone,
    display_on character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.spree_payment_methods OWNER TO postgres;

--
-- Name: spree_payment_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_payment_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_payment_methods_id_seq OWNER TO postgres;

--
-- Name: spree_payment_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_payment_methods_id_seq OWNED BY spree_payment_methods.id;


--
-- Name: spree_payments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_payments (
    id integer NOT NULL,
    amount numeric(8,2) DEFAULT 0.0 NOT NULL,
    order_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    source_id integer,
    source_type character varying(255),
    payment_method_id integer,
    state character varying(255),
    response_code character varying(255),
    avs_response character varying(255)
);


ALTER TABLE public.spree_payments OWNER TO postgres;

--
-- Name: spree_payments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_payments_id_seq OWNER TO postgres;

--
-- Name: spree_payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_payments_id_seq OWNED BY spree_payments.id;


--
-- Name: spree_paypal_accounts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_paypal_accounts (
    id integer NOT NULL,
    email character varying(255),
    payer_id character varying(255),
    payer_country character varying(255),
    payer_status character varying(255)
);


ALTER TABLE public.spree_paypal_accounts OWNER TO postgres;

--
-- Name: spree_paypal_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_paypal_accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_paypal_accounts_id_seq OWNER TO postgres;

--
-- Name: spree_paypal_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_paypal_accounts_id_seq OWNED BY spree_paypal_accounts.id;


--
-- Name: spree_pending_promotions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_pending_promotions (
    id integer NOT NULL,
    user_id integer,
    promotion_id integer
);


ALTER TABLE public.spree_pending_promotions OWNER TO postgres;

--
-- Name: spree_pending_promotions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_pending_promotions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_pending_promotions_id_seq OWNER TO postgres;

--
-- Name: spree_pending_promotions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_pending_promotions_id_seq OWNED BY spree_pending_promotions.id;


--
-- Name: spree_preferences; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_preferences (
    id integer NOT NULL,
    name character varying(255),
    owner_id integer,
    owner_type character varying(255),
    value text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    key character varying(255),
    value_type character varying(255)
);


ALTER TABLE public.spree_preferences OWNER TO postgres;

--
-- Name: spree_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_preferences_id_seq OWNER TO postgres;

--
-- Name: spree_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_preferences_id_seq OWNED BY spree_preferences.id;


--
-- Name: spree_product_option_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_product_option_types (
    id integer NOT NULL,
    "position" integer,
    product_id integer,
    option_type_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_product_option_types OWNER TO postgres;

--
-- Name: spree_product_option_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_product_option_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_product_option_types_id_seq OWNER TO postgres;

--
-- Name: spree_product_option_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_product_option_types_id_seq OWNED BY spree_product_option_types.id;


--
-- Name: spree_product_properties; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_product_properties (
    id integer NOT NULL,
    value character varying(255),
    product_id integer,
    property_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_product_properties OWNER TO postgres;

--
-- Name: spree_product_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_product_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_product_properties_id_seq OWNER TO postgres;

--
-- Name: spree_product_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_product_properties_id_seq OWNED BY spree_product_properties.id;


--
-- Name: spree_products; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_products (
    id integer NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    description text,
    available_on timestamp without time zone,
    deleted_at timestamp without time zone,
    permalink character varying(255),
    meta_description character varying(255),
    meta_keywords character varying(255),
    tax_category_id integer,
    shipping_category_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    count_on_hand integer DEFAULT 0,
    cause_id integer,
    inspiration_behind text
);


ALTER TABLE public.spree_products OWNER TO postgres;

--
-- Name: spree_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_products_id_seq OWNER TO postgres;

--
-- Name: spree_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_products_id_seq OWNED BY spree_products.id;


--
-- Name: spree_products_promotion_rules; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_products_promotion_rules (
    product_id integer,
    promotion_rule_id integer
);


ALTER TABLE public.spree_products_promotion_rules OWNER TO postgres;

--
-- Name: spree_products_taxons; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_products_taxons (
    product_id integer,
    taxon_id integer
);


ALTER TABLE public.spree_products_taxons OWNER TO postgres;

--
-- Name: spree_promotion_action_line_items; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_promotion_action_line_items (
    id integer NOT NULL,
    promotion_action_id integer,
    variant_id integer,
    quantity integer DEFAULT 1
);


ALTER TABLE public.spree_promotion_action_line_items OWNER TO postgres;

--
-- Name: spree_promotion_action_line_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_promotion_action_line_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_promotion_action_line_items_id_seq OWNER TO postgres;

--
-- Name: spree_promotion_action_line_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_promotion_action_line_items_id_seq OWNED BY spree_promotion_action_line_items.id;


--
-- Name: spree_promotion_actions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_promotion_actions (
    id integer NOT NULL,
    activator_id integer,
    "position" integer,
    type character varying(255)
);


ALTER TABLE public.spree_promotion_actions OWNER TO postgres;

--
-- Name: spree_promotion_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_promotion_actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_promotion_actions_id_seq OWNER TO postgres;

--
-- Name: spree_promotion_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_promotion_actions_id_seq OWNED BY spree_promotion_actions.id;


--
-- Name: spree_promotion_rules; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_promotion_rules (
    id integer NOT NULL,
    activator_id integer,
    user_id integer,
    product_group_id integer,
    type character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_promotion_rules OWNER TO postgres;

--
-- Name: spree_promotion_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_promotion_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_promotion_rules_id_seq OWNER TO postgres;

--
-- Name: spree_promotion_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_promotion_rules_id_seq OWNED BY spree_promotion_rules.id;


--
-- Name: spree_promotion_rules_users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_promotion_rules_users (
    user_id integer,
    promotion_rule_id integer
);


ALTER TABLE public.spree_promotion_rules_users OWNER TO postgres;

--
-- Name: spree_properties; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_properties (
    id integer NOT NULL,
    name character varying(255),
    presentation character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_properties OWNER TO postgres;

--
-- Name: spree_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_properties_id_seq OWNER TO postgres;

--
-- Name: spree_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_properties_id_seq OWNED BY spree_properties.id;


--
-- Name: spree_properties_prototypes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_properties_prototypes (
    prototype_id integer,
    property_id integer
);


ALTER TABLE public.spree_properties_prototypes OWNER TO postgres;

--
-- Name: spree_prototypes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_prototypes (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_prototypes OWNER TO postgres;

--
-- Name: spree_prototypes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_prototypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_prototypes_id_seq OWNER TO postgres;

--
-- Name: spree_prototypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_prototypes_id_seq OWNED BY spree_prototypes.id;


--
-- Name: spree_return_authorizations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_return_authorizations (
    id integer NOT NULL,
    number character varying(255),
    state character varying(255),
    amount numeric(8,2) DEFAULT 0.0 NOT NULL,
    order_id integer,
    reason text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_return_authorizations OWNER TO postgres;

--
-- Name: spree_return_authorizations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_return_authorizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_return_authorizations_id_seq OWNER TO postgres;

--
-- Name: spree_return_authorizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_return_authorizations_id_seq OWNED BY spree_return_authorizations.id;


--
-- Name: spree_roles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_roles (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.spree_roles OWNER TO postgres;

--
-- Name: spree_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_roles_id_seq OWNER TO postgres;

--
-- Name: spree_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_roles_id_seq OWNED BY spree_roles.id;


--
-- Name: spree_roles_users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_roles_users (
    role_id integer,
    user_id integer
);


ALTER TABLE public.spree_roles_users OWNER TO postgres;

--
-- Name: spree_shipments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_shipments (
    id integer NOT NULL,
    tracking character varying(255),
    number character varying(255),
    cost numeric(8,2),
    shipped_at timestamp without time zone,
    order_id integer,
    shipping_method_id integer,
    address_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    state character varying(255)
);


ALTER TABLE public.spree_shipments OWNER TO postgres;

--
-- Name: spree_shipments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_shipments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_shipments_id_seq OWNER TO postgres;

--
-- Name: spree_shipments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_shipments_id_seq OWNED BY spree_shipments.id;


--
-- Name: spree_shipping_categories; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_shipping_categories (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_shipping_categories OWNER TO postgres;

--
-- Name: spree_shipping_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_shipping_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_shipping_categories_id_seq OWNER TO postgres;

--
-- Name: spree_shipping_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_shipping_categories_id_seq OWNED BY spree_shipping_categories.id;


--
-- Name: spree_shipping_methods; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_shipping_methods (
    id integer NOT NULL,
    name character varying(255),
    zone_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    display_on character varying(255) DEFAULT NULL::character varying,
    shipping_category_id integer,
    match_none boolean,
    match_all boolean,
    match_one boolean,
    deleted_at timestamp without time zone
);


ALTER TABLE public.spree_shipping_methods OWNER TO postgres;

--
-- Name: spree_shipping_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_shipping_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_shipping_methods_id_seq OWNER TO postgres;

--
-- Name: spree_shipping_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_shipping_methods_id_seq OWNED BY spree_shipping_methods.id;


--
-- Name: spree_skrill_transactions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_skrill_transactions (
    id integer NOT NULL,
    email character varying(255),
    amount double precision,
    currency character varying(255),
    transaction_id integer,
    customer_id integer,
    payment_type character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_skrill_transactions OWNER TO postgres;

--
-- Name: spree_skrill_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_skrill_transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_skrill_transactions_id_seq OWNER TO postgres;

--
-- Name: spree_skrill_transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_skrill_transactions_id_seq OWNED BY spree_skrill_transactions.id;


--
-- Name: spree_state_changes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_state_changes (
    id integer NOT NULL,
    name character varying(255),
    previous_state character varying(255),
    stateful_id integer,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    stateful_type character varying(255),
    next_state character varying(255)
);


ALTER TABLE public.spree_state_changes OWNER TO postgres;

--
-- Name: spree_state_changes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_state_changes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_state_changes_id_seq OWNER TO postgres;

--
-- Name: spree_state_changes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_state_changes_id_seq OWNED BY spree_state_changes.id;


--
-- Name: spree_states; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_states (
    id integer NOT NULL,
    name character varying(255),
    abbr character varying(255),
    country_id integer
);


ALTER TABLE public.spree_states OWNER TO postgres;

--
-- Name: spree_states_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_states_id_seq OWNER TO postgres;

--
-- Name: spree_states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_states_id_seq OWNED BY spree_states.id;


--
-- Name: spree_tax_categories; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_tax_categories (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    is_default boolean DEFAULT false,
    deleted_at timestamp without time zone
);


ALTER TABLE public.spree_tax_categories OWNER TO postgres;

--
-- Name: spree_tax_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_tax_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_tax_categories_id_seq OWNER TO postgres;

--
-- Name: spree_tax_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_tax_categories_id_seq OWNED BY spree_tax_categories.id;


--
-- Name: spree_tax_rates; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_tax_rates (
    id integer NOT NULL,
    amount numeric(8,5),
    zone_id integer,
    tax_category_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    included_in_price boolean DEFAULT false,
    name character varying(255),
    show_rate_in_label boolean DEFAULT true
);


ALTER TABLE public.spree_tax_rates OWNER TO postgres;

--
-- Name: spree_tax_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_tax_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_tax_rates_id_seq OWNER TO postgres;

--
-- Name: spree_tax_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_tax_rates_id_seq OWNED BY spree_tax_rates.id;


--
-- Name: spree_taxonomies; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_taxonomies (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_taxonomies OWNER TO postgres;

--
-- Name: spree_taxonomies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_taxonomies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_taxonomies_id_seq OWNER TO postgres;

--
-- Name: spree_taxonomies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_taxonomies_id_seq OWNED BY spree_taxonomies.id;


--
-- Name: spree_taxons; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_taxons (
    id integer NOT NULL,
    parent_id integer,
    "position" integer DEFAULT 0,
    name character varying(255) NOT NULL,
    permalink character varying(255),
    taxonomy_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    lft integer,
    rgt integer,
    icon_file_name character varying(255),
    icon_content_type character varying(255),
    icon_file_size integer,
    icon_updated_at timestamp without time zone,
    description text
);


ALTER TABLE public.spree_taxons OWNER TO postgres;

--
-- Name: spree_taxons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_taxons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_taxons_id_seq OWNER TO postgres;

--
-- Name: spree_taxons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_taxons_id_seq OWNED BY spree_taxons.id;


--
-- Name: spree_teams; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_teams (
    id integer NOT NULL,
    fullname character varying(255),
    jobp character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    photo_file_name character varying(255),
    photo_content_type character varying(255),
    photo_file_size integer,
    photo_updated_at timestamp without time zone
);


ALTER TABLE public.spree_teams OWNER TO postgres;

--
-- Name: spree_teams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_teams_id_seq OWNER TO postgres;

--
-- Name: spree_teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_teams_id_seq OWNED BY spree_teams.id;


--
-- Name: spree_tokenized_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_tokenized_permissions (
    id integer NOT NULL,
    permissable_id integer,
    permissable_type character varying(255),
    token character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_tokenized_permissions OWNER TO postgres;

--
-- Name: spree_tokenized_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_tokenized_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_tokenized_permissions_id_seq OWNER TO postgres;

--
-- Name: spree_tokenized_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_tokenized_permissions_id_seq OWNED BY spree_tokenized_permissions.id;


--
-- Name: spree_trackers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_trackers (
    id integer NOT NULL,
    environment character varying(255),
    analytics_id character varying(255),
    active boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_trackers OWNER TO postgres;

--
-- Name: spree_trackers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_trackers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_trackers_id_seq OWNER TO postgres;

--
-- Name: spree_trackers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_trackers_id_seq OWNED BY spree_trackers.id;


--
-- Name: spree_users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_users (
    id integer NOT NULL,
    encrypted_password character varying(255) DEFAULT NULL::character varying,
    password_salt character varying(255) DEFAULT NULL::character varying,
    email character varying(255),
    remember_token character varying(255),
    persistence_token character varying(255),
    reset_password_token character varying(255),
    perishable_token character varying(255),
    sign_in_count integer DEFAULT 0 NOT NULL,
    failed_attempts integer DEFAULT 0 NOT NULL,
    last_request_at timestamp without time zone,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    login character varying(255) DEFAULT NULL::character varying,
    ship_address_id integer,
    bill_address_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    spree_api_key character varying(48),
    authentication_token character varying(255),
    unlock_token character varying(255),
    locked_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    reset_password_sent_at timestamp without time zone,
    isartist boolean,
    invitation_token character varying(60),
    invitation_sent_at timestamp without time zone,
    invitation_accepted_at timestamp without time zone,
    invitation_limit integer,
    invited_by_id integer,
    invited_by_type character varying(255)
);


ALTER TABLE public.spree_users OWNER TO postgres;

--
-- Name: spree_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_users_id_seq OWNER TO postgres;

--
-- Name: spree_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_users_id_seq OWNED BY spree_users.id;


--
-- Name: spree_variants; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_variants (
    id integer NOT NULL,
    sku character varying(255) DEFAULT ''::character varying NOT NULL,
    price numeric(8,2) NOT NULL,
    weight numeric(8,2),
    height numeric(8,2),
    width numeric(8,2),
    depth numeric(8,2),
    deleted_at timestamp without time zone,
    is_master boolean DEFAULT false,
    product_id integer,
    count_on_hand integer DEFAULT 0,
    cost_price numeric(8,2) DEFAULT NULL::numeric,
    "position" integer,
    lock_version integer DEFAULT 0
);


ALTER TABLE public.spree_variants OWNER TO postgres;

--
-- Name: spree_variants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_variants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_variants_id_seq OWNER TO postgres;

--
-- Name: spree_variants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_variants_id_seq OWNED BY spree_variants.id;


--
-- Name: spree_zone_members; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_zone_members (
    id integer NOT NULL,
    zoneable_id integer,
    zoneable_type character varying(255),
    zone_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_zone_members OWNER TO postgres;

--
-- Name: spree_zone_members_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_zone_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_zone_members_id_seq OWNER TO postgres;

--
-- Name: spree_zone_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_zone_members_id_seq OWNED BY spree_zone_members.id;


--
-- Name: spree_zones; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spree_zones (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    default_tax boolean DEFAULT false,
    zone_members_count integer DEFAULT 0
);


ALTER TABLE public.spree_zones OWNER TO postgres;

--
-- Name: spree_zones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spree_zones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_zones_id_seq OWNER TO postgres;

--
-- Name: spree_zones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spree_zones_id_seq OWNED BY spree_zones.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_activators ALTER COLUMN id SET DEFAULT nextval('spree_activators_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_addresses ALTER COLUMN id SET DEFAULT nextval('spree_addresses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_adjustments ALTER COLUMN id SET DEFAULT nextval('spree_adjustments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_artists ALTER COLUMN id SET DEFAULT nextval('spree_artists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_assets ALTER COLUMN id SET DEFAULT nextval('spree_assets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_calculators ALTER COLUMN id SET DEFAULT nextval('spree_calculators_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_causes ALTER COLUMN id SET DEFAULT nextval('spree_causes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_configurations ALTER COLUMN id SET DEFAULT nextval('spree_configurations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_countries ALTER COLUMN id SET DEFAULT nextval('spree_countries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_credit_cards ALTER COLUMN id SET DEFAULT nextval('spree_credit_cards_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_faqs ALTER COLUMN id SET DEFAULT nextval('spree_faqs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_gateways ALTER COLUMN id SET DEFAULT nextval('spree_gateways_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_inventory_units ALTER COLUMN id SET DEFAULT nextval('spree_inventory_units_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_line_items ALTER COLUMN id SET DEFAULT nextval('spree_line_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_log_entries ALTER COLUMN id SET DEFAULT nextval('spree_log_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_mail_methods ALTER COLUMN id SET DEFAULT nextval('spree_mail_methods_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_option_types ALTER COLUMN id SET DEFAULT nextval('spree_option_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_option_values ALTER COLUMN id SET DEFAULT nextval('spree_option_values_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_orders ALTER COLUMN id SET DEFAULT nextval('spree_orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_organizations ALTER COLUMN id SET DEFAULT nextval('spree_organizations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_payment_methods ALTER COLUMN id SET DEFAULT nextval('spree_payment_methods_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_payments ALTER COLUMN id SET DEFAULT nextval('spree_payments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_paypal_accounts ALTER COLUMN id SET DEFAULT nextval('spree_paypal_accounts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_pending_promotions ALTER COLUMN id SET DEFAULT nextval('spree_pending_promotions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_preferences ALTER COLUMN id SET DEFAULT nextval('spree_preferences_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_product_option_types ALTER COLUMN id SET DEFAULT nextval('spree_product_option_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_product_properties ALTER COLUMN id SET DEFAULT nextval('spree_product_properties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_products ALTER COLUMN id SET DEFAULT nextval('spree_products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_promotion_action_line_items ALTER COLUMN id SET DEFAULT nextval('spree_promotion_action_line_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_promotion_actions ALTER COLUMN id SET DEFAULT nextval('spree_promotion_actions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_promotion_rules ALTER COLUMN id SET DEFAULT nextval('spree_promotion_rules_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_properties ALTER COLUMN id SET DEFAULT nextval('spree_properties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_prototypes ALTER COLUMN id SET DEFAULT nextval('spree_prototypes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_return_authorizations ALTER COLUMN id SET DEFAULT nextval('spree_return_authorizations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_roles ALTER COLUMN id SET DEFAULT nextval('spree_roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_shipments ALTER COLUMN id SET DEFAULT nextval('spree_shipments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_shipping_categories ALTER COLUMN id SET DEFAULT nextval('spree_shipping_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_shipping_methods ALTER COLUMN id SET DEFAULT nextval('spree_shipping_methods_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_skrill_transactions ALTER COLUMN id SET DEFAULT nextval('spree_skrill_transactions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_state_changes ALTER COLUMN id SET DEFAULT nextval('spree_state_changes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_states ALTER COLUMN id SET DEFAULT nextval('spree_states_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_tax_categories ALTER COLUMN id SET DEFAULT nextval('spree_tax_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_tax_rates ALTER COLUMN id SET DEFAULT nextval('spree_tax_rates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_taxonomies ALTER COLUMN id SET DEFAULT nextval('spree_taxonomies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_taxons ALTER COLUMN id SET DEFAULT nextval('spree_taxons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_teams ALTER COLUMN id SET DEFAULT nextval('spree_teams_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_tokenized_permissions ALTER COLUMN id SET DEFAULT nextval('spree_tokenized_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_trackers ALTER COLUMN id SET DEFAULT nextval('spree_trackers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_users ALTER COLUMN id SET DEFAULT nextval('spree_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_variants ALTER COLUMN id SET DEFAULT nextval('spree_variants_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_zone_members ALTER COLUMN id SET DEFAULT nextval('spree_zone_members_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spree_zones ALTER COLUMN id SET DEFAULT nextval('spree_zones_id_seq'::regclass);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schema_migrations (version) FROM stdin;
20121122181145
20121122181146
20121122181147
20121122181148
20121122181149
20121122181150
20121122181151
20121122181152
20121122181153
20121122181154
20121122181155
20121122181156
20121122181157
20121122181158
20121122181159
20121122181160
20121122181161
20121122181162
20121122181163
20121122181164
20121122181165
20121122181166
20121122181167
20121122181168
20121122181169
20121122181170
20121122181171
20121122181172
20121122181173
20121122181174
20121122181175
20121122181176
20121122181177
20121122181178
20121122181179
20121122181180
20121122181181
20121122181182
20121122181183
20121122181184
20121122181185
20121122181186
20121122181187
20121122181188
20121122181189
20121122181190
20121122181191
20121122181192
20121122181193
20121122181194
20121122181195
20121122181196
20121122181197
20121122181198
20121122181199
20121122181200
20121122181201
20121122181202
20121122181203
20121122181204
20121122181205
20121122181206
20121122181207
20121122181208
20121122181209
20121122181210
20121122181211
20121122181212
20121122181213
20121122181214
20121122181215
20121122181216
20121122181217
20121122181218
20121122181219
20121122181220
20121122181221
20121122181222
20121122181223
20121122181224
20121122181225
20121122181226
20121122181227
20121122181228
20121122181229
20121122181230
20121122181231
20121122181232
20121122181233
20121122181234
20121122181235
20121122181236
20121122181237
20121122181238
20121122181239
20121122181240
20121122181241
20121122181242
20121122181243
20121122181244
20121122181245
20121122181246
20121122181247
20121122181248
20121122181249
20121122181250
20121122181251
20121122181252
20121122181253
20121122181254
20121122181255
20121122181256
20121122181257
20121122181258
20121122181259
20121122181260
20121122181261
20121122181262
20121122181263
20121122181264
20121122181265
20121122181266
20121122181267
20121122181268
20121122181269
20121122181270
20121122181271
20121122181272
20121128183930
20121130202643
20121204170049
20121205164722
20121205224443
20121210224801
20121220164341
20130115213116
20130204180317
20130204183415
20130204183622
20130212221233
20130228205649
20130307054950
20130312224614
20130312231738
20130312232048
20130410201129
20130410224002
20130417210336
20130422192750
20130422192751
20130425160943
20130426174627
20130428180049
\.


--
-- Data for Name: spree_activators; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_activators (id, description, expires_at, created_at, updated_at, starts_at, name, event_name, type, usage_limit, match_policy, code, advertise, path) FROM stdin;
\.


--
-- Name: spree_activators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_activators_id_seq', 1, false);


--
-- Data for Name: spree_addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_addresses (id, firstname, lastname, address1, address2, city, zipcode, phone, state_name, alternative_phone, state_id, country_id, created_at, updated_at, company) FROM stdin;
51	Rob	Lara	Roble#1701	melchor muzquiz#25	Houston	77002		\N	\N	525212995	214	2013-06-26 17:44:19.77959	2013-06-26 17:44:19.77959	\N
52	Rob	Lara	Roble#1701	melchor muzquiz#25	Houston	77002		\N	\N	525212995	214	2013-06-26 17:44:19.850674	2013-06-26 17:44:19.850674	\N
53	rlara	lara	roble#1703	melchor muzquiz#2535	Houston	77002		\N	\N	525212995	214	2013-07-16 21:15:09.092228	2013-07-16 21:15:09.092228	\N
54	rlara	lara	roble#1703	melchor muzquiz#2535	Houston	77002		\N	\N	525212995	214	2013-07-16 21:15:09.164697	2013-07-16 21:15:09.164697	\N
1	Roberto	Lara	roble#1703	12	monterrey	85001	88333333	\N	\N	948208802	214	2013-01-31 19:40:57.100538	2013-01-31 19:48:00.986841	\N
2	Roberto	Lara	roble#2000	12	monterrey	85001	88333333	\N	\N	948208802	214	2013-01-31 19:40:57.142402	2013-01-31 19:48:00.989319	\N
3	Roberto	enrique	roble#1703	12	m	85001	88333333	\N	\N	948208802	214	2013-01-31 22:40:23.050446	2013-01-31 22:40:23.050446	\N
4	Roberto	enrique	roble#1703	12	m	85001	88333333	\N	\N	948208802	214	2013-01-31 22:40:23.054629	2013-01-31 22:40:23.054629	\N
5	Roberto	Lara	roble#1703	12	monterrey	85001	88333333	\N	\N	948208802	214	2013-02-01 18:54:04.552701	2013-02-01 18:54:04.552701	\N
6	Roberto	Lara	roble#1703	12	monterrey	85001	88333333	\N	\N	948208802	214	2013-02-01 18:54:04.557991	2013-02-01 18:54:04.557991	\N
7	Roberto	Lara	roble#1703	1234	monterrey	85001	88333333	\N	\N	948208802	214	2013-02-01 21:14:33.98454	2013-02-01 21:14:33.98454	\N
8	Roberto	Lara	roble#1703	1234	monterrey	85001	88333333	\N	\N	948208802	214	2013-02-01 21:14:33.987213	2013-02-01 21:14:33.987213	\N
9	Roberto	Lara	roble#1703	1234	monterrey	85001	88333333	\N	\N	948208802	214	2013-02-01 23:05:41.667719	2013-02-01 23:05:41.667719	\N
10	Roberto	Lara	roble#1703	1234	monterrey	85001	88333333	\N	\N	948208802	214	2013-02-01 23:05:41.673395	2013-02-01 23:05:41.673395	\N
11	Roberto	Lara	roble#1703	1234	monterrey	85001	88333333	\N	\N	948208802	214	2013-02-04 03:18:50.776538	2013-02-04 03:18:50.776538	\N
12	Roberto	Lara	roble#1703	1234	monterrey	85001	88333333	\N	\N	948208802	214	2013-02-04 03:18:50.780985	2013-02-04 03:18:50.780985	\N
13	Roberto	Lara	roble#1703		monterrey	92274	88333333	\N	\N	276110813	214	2013-02-06 22:31:49.998304	2013-02-06 22:31:49.998304	\N
14	Roberto	Lara	roble#1703		monterrey	92274	88333333	\N	\N	276110813	214	2013-02-06 22:31:50.073978	2013-02-06 22:31:50.073978	\N
15	Roberto	Lara	roble#1703	123	Houston	85001		nuevo leon	\N	\N	195	2013-02-13 00:42:11.074979	2013-02-13 11:44:44.997329	\N
16	Roberto	Lara	roble#1703	123	Houston	85001		nuevo leon	\N	\N	195	2013-02-13 00:42:11.144659	2013-02-13 11:44:44.999448	\N
17	Roberto	Lara	Roble #1703	123	monterrey	64480	833372-95	\N	\N	948208802	214	2013-03-12 21:14:32.506033	2013-03-12 21:14:50.137889	\N
18	Roberto	Lara	Roble #1703	123	monterrey	64480	833372-95	\N	\N	948208802	214	2013-03-12 21:14:32.674922	2013-03-12 21:14:50.141637	\N
19	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	214	2013-03-13 00:23:49.315617	2013-03-13 00:23:49.315617	\N
20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	214	2013-03-13 00:23:49.320378	2013-03-13 00:23:49.320378	\N
21	Roberto	Lara	Roble #1703	123	Houston	77001	833372-95	\N	\N	525212995	214	2013-03-13 18:22:47.917654	2013-03-15 19:09:34.19452	\N
22	Roberto	Lara	Roble #1703	123	Houston	77001	833372-95	\N	\N	525212995	214	2013-03-13 18:22:47.923087	2013-03-15 19:09:34.277976	\N
23	roberto2805	Lara	825 E. Rundberg Ln.	345	Houston	77001	833372-95	\N	\N	525212995	214	2013-03-15 21:10:24.572816	2013-03-15 21:54:21.015425	\N
24	roberto2805	Lara	825 E. Rundberg Ln.	345	Houston	77001	833372-95	\N	\N	525212995	214	2013-03-15 21:10:24.577311	2013-03-15 21:54:21.018998	\N
25	Roberto	Lara	825 E. Rundberg Ln.	345	Houston	77001	833372-95	\N	\N	525212995	214	2013-03-27 17:03:51.806668	2013-03-27 17:03:51.806668	\N
26	Roberto	Lara	825 E. Rundberg Ln.	345	Houston	77001	833372-95	\N	\N	525212995	214	2013-03-27 17:03:51.853506	2013-03-27 17:03:51.853506	\N
27	Roberto	Lara	825 E. Rundberg Ln.	345	Houston	77001	833372-95	\N	\N	525212995	214	2013-03-27 21:42:33.051186	2013-03-27 21:42:33.051186	\N
28	Roberto	Lara	825 E. Rundberg Ln.	345	Houston	77001	833372-95	\N	\N	525212995	214	2013-03-27 21:42:33.0551	2013-03-27 21:42:33.0551	\N
29	Roberto	Lara	825 E. Rundberg Ln.	345	Houston	77001	833372-95	\N	\N	525212995	214	2013-03-27 21:46:49.929956	2013-03-27 21:46:49.929956	\N
30	Roberto	Lara	825 E. Rundberg Ln.	345	Houston	77001	833372-95	\N	\N	525212995	214	2013-03-27 21:51:29.355718	2013-03-27 21:51:29.355718	\N
31	roberto2805	Lara	520 Texas St	123	Houston	77002		\N	\N	525212995	214	2013-04-22 19:10:57.076238	2013-04-22 19:10:57.076238	\N
32	roberto2805	Lara	520 Texas St	123	Houston	77002		\N	\N	525212995	214	2013-04-22 19:10:57.239754	2013-04-22 19:10:57.239754	\N
33	Enrique	Lara	520 Texas St	123	Houston	77002	(not given)	\N	\N	525212995	214	2013-04-22 19:57:07.232929	2013-04-22 19:57:07.232929	\N
34	Roberto	Lar	520 Texas St	123	Houston	77002		\N	\N	525212995	214	2013-04-22 21:08:44.560761	2013-04-22 21:08:44.560761	\N
35	Roberto	Lar	520 Texas St	123	Houston	77002		\N	\N	525212995	214	2013-04-22 21:08:44.56398	2013-04-22 21:08:44.56398	\N
36	Roberto	Lara	520 Texas St	345	Houston	77002	(713) 574-1101	\N	\N	525212995	214	2013-04-22 22:09:14.278844	2013-04-22 22:09:14.278844	\N
37	Roberto	Lara	520 Texas St	345	Houston	77002	(713) 574-1101	\N	\N	525212995	214	2013-04-22 22:09:14.282126	2013-04-22 22:09:14.282126	\N
38	Enrique	Lara	1 Main St		San jose	95131	408-852-5754	\N	\N	276110813	214	2013-04-23 02:27:48.621254	2013-04-23 02:27:48.621254	\N
39	Enrique	Lara	1 Main St		San jose	95131	408-852-5754	\N	\N	276110813	214	2013-04-23 02:27:48.624222	2013-04-23 02:27:48.624222	\N
40	Roberto	Lara	roble#1703	12	Houston	77001	88333333	\N	\N	525212995	214	2013-05-09 19:55:52.328248	2013-05-09 19:55:52.328248	\N
42	Banwire	Test Card	roble#1703	12	Houston	77001	88333333	\N	\N	525212995	214	2013-05-09 19:59:52.388508	2013-05-09 19:59:52.388508	\N
41	Banwire	Test Card	roble#1703	12	Houston	77001	88333333	\N	\N	525212995	214	2013-05-09 19:55:52.395461	2013-05-09 19:59:52.393487	\N
43	Banwire	Test Card	350 Pine St. Beaumon	1234	Houston	77001	88333333	\N	\N	525212995	214	2013-05-09 20:14:38.312393	2013-05-09 20:14:38.312393	\N
44	Banwire	Test Card	350 Pine St. Beaumon	1234	Houston	77001	88333333	\N	\N	525212995	214	2013-05-09 20:14:38.316127	2013-05-09 20:14:38.316127	\N
45	Banwire	Test Card	roble#1703	1234	Houston	77001	88333333	\N	\N	525212995	214	2013-05-09 20:34:48.262155	2013-05-09 20:34:48.262155	\N
46	Banwire	Test Card	roble#1703	1234	Houston	77001	88333333	\N	\N	525212995	214	2013-05-09 20:34:48.265055	2013-05-09 20:34:48.265055	\N
47	Gil	Tovar	talleres	123	Houston	64480		\N	\N	525212995	214	2013-05-29 21:57:25.238624	2013-05-29 21:57:25.238624	\N
48	Gil	Tovar	talleres	123	Houston	64480		\N	\N	525212995	214	2013-05-29 21:57:25.337655	2013-05-29 21:57:25.337655	\N
49	Gil	Tovar	Roble	1703	Houston	77002		\N	\N	525212995	214	2013-05-29 22:26:54.585096	2013-05-29 22:26:54.585096	\N
50	Gil	Tovar	Roble	1703	Houston	77002		\N	\N	525212995	214	2013-05-29 22:26:54.587585	2013-05-29 22:26:54.587585	\N
56	aa	adead	eadead	aeda	Houston	77002		\N	\N	525212995	214	2013-07-17 06:29:54.993899	2013-07-17 06:29:54.993899	\N
55	aa	adead	eadead	aeda	Houston	77002		\N	\N	525212995	214	2013-07-17 06:29:54.988671	2013-07-17 06:55:05.962354	\N
\.


--
-- Name: spree_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_addresses_id_seq', 56, true);


--
-- Data for Name: spree_adjustments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_adjustments (id, source_id, amount, label, source_type, adjustable_id, created_at, updated_at, mandatory, locked, originator_id, originator_type, eligible, adjustable_type) FROM stdin;
6	6	0.00	Shipping	Spree::Shipment	7	2013-02-04 03:19:00.090699	2013-02-04 03:19:00.090699	t	t	1	Spree::ShippingMethod	t	Spree::Order
3	3	0.00	Shipping	Spree::Shipment	4	2013-02-01 18:54:09.731871	2013-02-01 18:54:09.731871	t	t	1	Spree::ShippingMethod	t	Spree::Order
12	12	1.45	Shipping	Spree::Shipment	18	2013-03-12 21:14:50.59783	2013-03-12 21:14:50.59783	t	\N	1	Spree::ShippingMethod	t	Spree::Order
5	5	0.00	Shipping	Spree::Shipment	6	2013-02-01 23:06:05.818586	2013-02-01 23:06:05.818586	t	t	1	Spree::ShippingMethod	t	Spree::Order
1	1	0.00	Shipping	Spree::Shipment	2	2013-01-31 19:55:23.768026	2013-01-31 19:55:23.768026	t	t	1	Spree::ShippingMethod	t	Spree::Order
26	24	5.99	Shipping	Spree::Shipment	43	2013-05-29 21:57:31.259253	2013-05-29 21:57:31.259253	t	\N	1	Spree::ShippingMethod	t	Spree::Order
24	22	5.99	Shipping	Spree::Shipment	38	2013-05-09 20:14:43.39801	2013-05-09 20:14:43.39801	t	t	1	Spree::ShippingMethod	t	Spree::Order
7	7	0.00	Shipping	Spree::Shipment	9	2013-02-06 22:32:01.803634	2013-02-06 22:32:01.803634	t	t	1	Spree::ShippingMethod	t	Spree::Order
30	28	5.99	Shipping	Spree::Shipment	49	2013-07-17 06:29:55.684739	2013-07-17 06:29:55.684739	t	\N	1	Spree::ShippingMethod	t	Spree::Order
4	4	0.00	Shipping	Spree::Shipment	5	2013-02-01 21:14:55.114901	2013-02-01 21:14:55.114901	t	t	1	Spree::ShippingMethod	t	Spree::Order
11	11	4.80	Shipping	Spree::Shipment	10	2013-02-13 17:32:55.903786	2013-02-13 17:32:55.903786	t	t	1	Spree::ShippingMethod	t	Spree::Order
15	15	4.35	Shipping	Spree::Shipment	29	2013-03-27 17:03:56.944956	2013-03-27 17:03:56.944956	t	\N	1	Spree::ShippingMethod	t	Spree::Order
18	17	1.74	Shipping	Spree::Shipment	33	2013-04-22 19:11:01.510605	2013-04-22 19:11:01.510605	t	t	1	Spree::ShippingMethod	t	Spree::Order
2	2	0.00	Shipping	Spree::Shipment	3	2013-01-31 22:40:31.874886	2013-01-31 22:40:31.874886	t	t	1	Spree::ShippingMethod	t	Spree::Order
25	23	5.99	Shipping	Spree::Shipment	39	2013-05-09 20:34:51.754078	2013-05-09 20:34:51.754078	t	t	1	Spree::ShippingMethod	t	Spree::Order
27	25	5.99	Shipping	Spree::Shipment	44	2013-05-29 22:27:00.043507	2013-05-29 22:27:00.043507	t	\N	1	Spree::ShippingMethod	t	Spree::Order
23	21	5.99	Shipping	Spree::Shipment	37	2013-05-09 19:55:58.214027	2013-05-09 19:55:58.214027	t	t	1	Spree::ShippingMethod	t	Spree::Order
13	13	3.95	Shipping	Spree::Shipment	20	2013-03-15 19:09:38.866725	2013-03-15 19:09:38.866725	t	\N	1	Spree::ShippingMethod	t	Spree::Order
28	26	5.99	Shipping	Spree::Shipment	47	2013-06-26 17:44:20.902513	2013-06-26 17:44:20.902513	t	\N	1	Spree::ShippingMethod	t	Spree::Order
\.


--
-- Name: spree_adjustments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_adjustments_id_seq', 30, true);


--
-- Data for Name: spree_artists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_artists (id, name, last_name, address, date_of_birth, type_art, webpage, portfolio, link_twitter, link_facebook, email, telephone, place, sex, reason, created_at, updated_at, photo_file_name, photo_content_type, photo_file_size, photo_updated_at, state, city, zip) FROM stdin;
76	margarita	arizpe	roble#123	1991-03-27	abstract	www.9gag.com	www.9gag.com	www.twitter.com	www.facebook.com	rele_91@hotmail.com	83337295	130	female	dbdbdsndfn sdn sdnsd hsyjujyukgihlzseg<<sseg esg gs< dg sg	2013-03-27 23:19:44.012851	2013-03-27 23:19:44.012851	about-us_collaborator4.jpg	image/jpeg	440602	2013-03-27 23:19:42.992339	nuevo leon	monterrey	64480
94	arnoldo	arizpe	roble#123	1930-04-02		www.9gag.com				acolin@incaztech.com	59383337295	57	male	acvsvravs	2013-04-02 06:45:21.285395	2013-04-02 06:45:21.285395	about-us_collaborator6.jpg	image/jpeg	49186	2013-04-02 06:45:20.794617	nuevo leon	monterrey	64480
74	Roberto	Lara	roble#123	1930-03-23	eijiod	www.incaztech.com	http://pinterest.com/	https://twitter.com/roberto_laraesp	http://www.facebook.com/roberto.lara91?ref=tn_tnmn	roberto.laraesp@gmail.com	83337295	130	male	daaxxex	2013-03-23 19:15:14.35843	2013-04-02 17:43:41.785944	about-us_collaborator2.jpg	image/jpeg	65413	2013-03-23 19:15:13.540119	nuevo leon	monterrey	64480
72	gil	Lara	roble#1212	1930-03-07	sḱsḱq	www.boletia.com		https://twitter.com/roberto_laraesp	http://www.facebook.com/Fxmobiledj?fref=ts	rlara@incaztech.com	83337295	130	male	iggougonyguygoy	2013-03-09 18:04:34.71767	2013-04-02 17:45:14.287226	hair.jpg	image/jpeg	13618	2013-03-09 18:04:33.759284	nuevo leon	monterrey	64480
\.


--
-- Name: spree_artists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_artists_id_seq', 94, true);


--
-- Data for Name: spree_assets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_assets (id, viewable_id, attachment_width, attachment_height, attachment_file_size, "position", viewable_type, attachment_content_type, attachment_file_name, type, attachment_updated_at, alt) FROM stdin;
1	1	2000	2667	201710	1	Spree::Variant	image/jpeg	tshirtbig.jpg	Spree::Image	2013-01-29 02:08:19.323608	
4	9	1021	1200	57421	1	Spree::Variant	image/jpeg	playeras.jpg	Spree::Image	2013-01-30 22:08:11.021576	
3	8	1021	1200	57421	1	Spree::Variant	image/jpeg	playeras.jpg	Spree::Image	2013-02-15 20:59:00.052315	
6	6	1021	1200	57421	1	Spree::Variant	image/jpeg	playeras.jpg	Spree::Image	2013-02-15 20:59:53.077795	
7	13	1021	1200	57421	1	Spree::Variant	image/jpeg	playeras.jpg	Spree::Image	2013-02-15 21:03:57.6229	
5	10	335	335	19004	1	Spree::Variant	image/jpeg	playera.jpg	Spree::Image	2013-02-15 21:04:44.105483	
8	15	1200	1090	109694	1	Spree::Variant	image/jpeg	poleraimg.jpg	Spree::Image	2013-02-22 18:34:22.116554	
9	15	600	500	74771	2	Spree::Variant	image/jpeg	polera2.jpg	Spree::Image	2013-02-22 18:34:41.288146	
10	18	1200	1090	109694	1	Spree::Variant	image/jpeg	poleraimg.jpg	Spree::Image	2013-03-04 20:12:56.951091	
11	18	600	500	75222	2	Spree::Variant	image/jpeg	polera1.jpg	Spree::Image	2013-03-05 17:44:14.431368	
12	21	1200	1090	109694	1	Spree::Variant	image/jpeg	poleraimg.jpg	Spree::Image	2013-03-14 22:24:51.399035	
13	21	600	500	75222	2	Spree::Variant	image/jpeg	polera1.jpg	Spree::Image	2013-03-14 22:24:53.568105	
14	23	1021	1200	57421	1	Spree::Variant	image/jpeg	playeras.jpg	Spree::Image	2013-04-01 19:18:47.070336	
15	27	1021	1200	57421	1	Spree::Variant	image/jpeg	playeras.jpg	Spree::Image	2013-04-01 20:47:57.529694	
16	28	82	82	20464	1	Spree::Variant	image/jpeg	cart1.jpg	Spree::Image	2013-04-01 21:08:44.998547	
17	32	1021	1200	57421	1	Spree::Variant	image/jpeg	playeras.jpg	Spree::Image	2013-04-19 19:58:46.739045	
\.


--
-- Name: spree_assets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_assets_id_seq', 18, true);


--
-- Data for Name: spree_calculators; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_calculators (id, type, calculable_id, calculable_type, created_at, updated_at) FROM stdin;
3	Spree::Calculator::FlatRate	1	Spree::ShippingMethod	2013-05-06 21:11:45.318736	2013-05-06 21:11:45.318736
4	Spree::Calculator::FlatRate	2	Spree::ShippingMethod	2013-05-06 21:13:10.44122	2013-05-06 21:13:10.44122
\.


--
-- Name: spree_calculators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_calculators_id_seq', 4, true);


--
-- Data for Name: spree_causes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_causes (id, title, description, goal_facebook, goal_twitter, goal_money, link_facebook, link_twitter, photo_file_name, photo_content_type, photo_file_size, photo_updated_at, video, link_pinterest, status, number_goal, artist_id, organization_id, created_at, updated_at, date_start, date_finish, inspiration, sharephoto_file_name, sharephoto_content_type, sharephoto_file_size, sharephoto_updated_at, titleshare, time_zone) FROM stdin;
1	Somaly	Etiam ut sem a felis imperdiet convallis a sit amet mi. Donec nec ligula orci, at luctus felis. Proin sit amet pellentesque ipsum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet leo ac tortor pharetra elementum. Etiam orci nisi, sodales a bibendum placerat, rhoncus eget elit. Nam placerat sollicitudin urna quis vestibulum. Suspendisse vitae lectus sem. In consectetur, magna eu pretium accumsan, odio justo pharetra risus, vitae pellentesque magna sapien id dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse consequat semper metus sit amet dignissim. Aenean nunc neque, facilisis vel rutrum id, dignissim id orci.	800	1000	2000.0	http://www.facebook.com/boletia?fref=ts		solidaridad-con-haiti.jpg	image/jpeg	75585	2013-01-25 06:56:19.499428	XepKe6zIV_w		f	1	94	1	2013-01-25 06:56:19.688074	2013-04-29 21:14:08.522651	2013-04-05 00:02:00	2013-04-07 00:00:00	Aenean eget orci id ligula consectetur pretium. Mauris ac mollis eros. Donec mollis nibh eget ipsum tempor non ultrices risus egestas. Integer ullamcorper ultrices eros, non feugiat sapien tempor nec. Sed luctus scelerisque dapibus. Vivamus rutrum sagittis eros, vel vulputate ante lacinia dignissim. Vestibulum eu augue lectus, ut adipiscing nulla. Mauris a eros at nisl consequat dapibus quis vel tortor. Integer eu leo augue, nec iaculis quam. Suspendisse sit amet turpis lacus	\N	\N	\N	\N		American Samoa
9	Day without lights	lñscjsñdhv sdu fhhfshfshfksdjsdhcjdscn ygyg giug iug aonaedna doia diad aj a ckaj	399	233	344.0			ruby-on-rails.jpg	image/jpeg	241504	2013-04-10 21:53:34.401332	LWlmVW3xWM4		\N	1	\N	1	2013-04-10 21:53:35.391368	2013-04-29 20:18:05.843311	2013-04-28 11:01:00	2013-04-29 20:19:00	seocjsojcś¢jśe cjéieshccaseihcpah cup cpuhcueagdg ap cs	polera1.jpg	image/jpeg	75222	2013-04-10 21:53:35.127149		Stockholm
8	Ejemplo Causa semana 1 ejempl ejemmplo ejemplo ejemplo ejemplo	Proin euismod, augue eu commodo euismod, eros metus adipiscing neque, commodo accumsan arcu quam non tortor.<br/>\r\nPellentesque sit amet ligula in nulla dapibus ultrice	100	100	100.0			servicio_2_2.jpg	image/jpeg	111906	2013-03-04 17:58:03.066296			t	1	72	1	2013-03-04 17:58:03.265492	2013-08-05 17:22:11.74654	2013-08-04 20:19:00	2013-08-20 11:01:00	Vestibulum tempus dui sed diam mollis ac euismod ligula posuere. Maecenas at orci eu felis tempus molestie. Proin massa mi, tempus non rutrum at, mattis at enim.	polera1.jpg	image/jpeg	75222	2013-04-15 22:06:57.791146	Stop this silent killer! Fund emergency brain surgergy for babies in Uganda.	Stockholm
\.


--
-- Name: spree_causes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_causes_id_seq', 9, true);


--
-- Data for Name: spree_configurations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_configurations (id, name, type, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_configurations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_configurations_id_seq', 1, false);


--
-- Data for Name: spree_countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_countries (id, iso_name, iso, iso3, name, numcode) FROM stdin;
39	CHAD	TD	TCD	Chad	148
65	FAROE ISLANDS	FO	FRO	Faroe Islands	234
92	INDIA	IN	IND	India	356
146	NICARAGUA	NI	NIC	Nicaragua	558
172	SAINT LUCIA	LC	LCA	Saint Lucia	662
66	FIJI	FJ	FJI	Fiji	242
93	INDONESIA	ID	IDN	Indonesia	360
147	NIGER	NE	NER	Niger	562
173	SAINT PIERRE AND MIQUELON	PM	SPM	Saint Pierre and Miquelon	666
67	FINLAND	FI	FIN	Finland	246
148	NIGERIA	NG	NGA	Nigeria	566
174	SAINT VINCENT AND THE GRENADINES	VC	VCT	Saint Vincent and the Grenadines	670
68	FRANCE	FR	FRA	France	250
94	IRAN, ISLAMIC REPUBLIC OF	IR	IRN	Iran, Islamic Republic of	364
149	NIUE	NU	NIU	Niue	570
175	SAMOA	WS	WSM	Samoa	882
69	FRENCH GUIANA	GF	GUF	French Guiana	254
95	IRAQ	IQ	IRQ	Iraq	368
176	SAN MARINO	SM	SMR	San Marino	674
96	IRELAND	IE	IRL	Ireland	372
177	SAO TOME AND PRINCIPE	ST	STP	Sao Tome and Principe	678
97	ISRAEL	IL	ISR	Israel	376
178	SAUDI ARABIA	SA	SAU	Saudi Arabia	682
98	ITALY	IT	ITA	Italy	380
179	SENEGAL	SN	SEN	Senegal	686
99	JAMAICA	JM	JAM	Jamaica	388
100	JAPAN	JP	JPN	Japan	392
101	JORDAN	JO	JOR	Jordan	400
20	BELGIUM	BE	BEL	Belgium	56
21	BELIZE	BZ	BLZ	Belize	84
102	KAZAKHSTAN	KZ	KAZ	Kazakhstan	398
210	UGANDA	UG	UGA	Uganda	800
22	BENIN	BJ	BEN	Benin	204
103	KENYA	KE	KEN	Kenya	404
211	UKRAINE	UA	UKR	Ukraine	804
23	BERMUDA	BM	BMU	Bermuda	60
104	KIRIBATI	KI	KIR	Kiribati	296
130	MEXICO	MX	MEX	Mexico	484
212	UNITED ARAB EMIRATES	AE	ARE	United Arab Emirates	784
24	BHUTAN	BT	BTN	Bhutan	64
50	CUBA	CU	CUB	Cuba	192
105	KOREA, DEMOCRATIC PEOPLE'S REPUBLIC OF	KP	PRK	North Korea	408
131	MICRONESIA, FEDERATED STATES OF	FM	FSM	Micronesia, Federated States of	583
213	UNITED KINGDOM	GB	GBR	United Kingdom	826
25	BOLIVIA	BO	BOL	Bolivia	68
51	CYPRUS	CY	CYP	Cyprus	196
106	KOREA, REPUBLIC OF	KR	KOR	South Korea	410
132	MOLDOVA, REPUBLIC OF	MD	MDA	Moldova, Republic of	498
214	UNITED STATES	US	USA	United States	840
26	BOSNIA AND HERZEGOVINA	BA	BIH	Bosnia and Herzegovina	70
52	CZECH REPUBLIC	CZ	CZE	Czech Republic	203
107	KUWAIT	KW	KWT	Kuwait	414
133	MONACO	MC	MCO	Monaco	492
215	URUGUAY	UY	URY	Uruguay	858
27	BOTSWANA	BW	BWA	Botswana	72
53	DENMARK	DK	DNK	Denmark	208
80	GUADELOUPE	GP	GLP	Guadeloupe	312
108	KYRGYZSTAN	KG	KGZ	Kyrgyzstan	417
134	MONGOLIA	MN	MNG	Mongolia	496
160	PHILIPPINES	PH	PHL	Philippines	608
28	BRAZIL	BR	BRA	Brazil	76
54	DJIBOUTI	DJ	DJI	Djibouti	262
81	GUAM	GU	GUM	Guam	316
109	LAO PEOPLE'S DEMOCRATIC REPUBLIC	LA	LAO	Lao People's Democratic Republic	418
135	MONTSERRAT	MS	MSR	Montserrat	500
161	PITCAIRN	PN	PCN	Pitcairn	612
216	UZBEKISTAN	UZ	UZB	Uzbekistan	860
29	BRUNEI DARUSSALAM	BN	BRN	Brunei Darussalam	96
55	DOMINICA	DM	DMA	Dominica	212
82	GUATEMALA	GT	GTM	Guatemala	320
136	MOROCCO	MA	MAR	Morocco	504
162	POLAND	PL	POL	Poland	616
217	VANUATU	VU	VUT	Vanuatu	548
56	DOMINICAN REPUBLIC	DO	DOM	Dominican Republic	214
137	MOZAMBIQUE	MZ	MOZ	Mozambique	508
163	PORTUGAL	PT	PRT	Portugal	620
190	SUDAN	SD	SDN	Sudan	736
218	VENEZUELA	VE	VEN	Venezuela	862
57	ECUADOR	EC	ECU	Ecuador	218
83	GUINEA	GN	GIN	Guinea	324
138	MYANMAR	MM	MMR	Myanmar	104
164	PUERTO RICO	PR	PRI	Puerto Rico	630
191	SURINAME	SR	SUR	Suriname	740
219	VIET NAM	VN	VNM	Viet Nam	704
58	EGYPT	EG	EGY	Egypt	818
84	GUINEA-BISSAU	GW	GNB	Guinea-Bissau	624
139	NAMIBIA	NA	NAM	Namibia	516
165	QATAR	QA	QAT	Qatar	634
192	SVALBARD AND JAN MAYEN	SJ	SJM	Svalbard and Jan Mayen	744
59	EL SALVADOR	SV	SLV	El Salvador	222
85	GUYANA	GY	GUY	Guyana	328
166	REUNION	RE	REU	Reunion	638
86	HAITI	HT	HTI	Haiti	332
167	ROMANIA	RO	ROM	Romania	642
193	SWAZILAND	SZ	SWZ	Swaziland	748
87	HOLY SEE (VATICAN CITY STATE)	VA	VAT	Holy See (Vatican City State)	336
168	RUSSIAN FEDERATION	RU	RUS	Russian Federation	643
194	SWEDEN	SE	SWE	Sweden	752
88	HONDURAS	HN	HND	Honduras	340
169	RWANDA	RW	RWA	Rwanda	646
195	SWITZERLAND	CH	CHE	Switzerland	756
89	HONG KONG	HK	HKG	Hong Kong	344
196	SYRIAN ARAB REPUBLIC	SY	SYR	Syrian Arab Republic	760
197	TAIWAN, PROVINCE OF CHINA	TW	TWN	Taiwan	158
198	TAJIKISTAN	TJ	TJK	Tajikistan	762
199	TANZANIA, UNITED REPUBLIC OF	TZ	TZA	Tanzania, United Republic of	834
10	ARMENIA	AM	ARM	Armenia	51
11	ARUBA	AW	ABW	Aruba	533
12	AUSTRALIA	AU	AUS	Australia	36
200	THAILAND	TH	THA	Thailand	764
13	AUSTRIA	AT	AUT	Austria	40
120	MADAGASCAR	MG	MDG	Madagascar	450
201	TOGO	TG	TGO	Togo	768
14	AZERBAIJAN	AZ	AZE	Azerbaijan	31
40	CHILE	CL	CHL	Chile	152
121	MALAWI	MW	MWI	Malawi	454
202	TOKELAU	TK	TKL	Tokelau	772
15	BAHAMAS	BS	BHS	Bahamas	44
41	CHINA	CN	CHN	China	156
122	MALAYSIA	MY	MYS	Malaysia	458
203	TONGA	TO	TON	Tonga	776
16	BAHRAIN	BH	BHR	Bahrain	48
42	COLOMBIA	CO	COL	Colombia	170
123	MALDIVES	MV	MDV	Maldives	462
204	TRINIDAD AND TOBAGO	TT	TTO	Trinidad and Tobago	780
17	BANGLADESH	BD	BGD	Bangladesh	50
43	COMOROS	KM	COM	Comoros	174
70	FRENCH POLYNESIA	PF	PYF	French Polynesia	258
124	MALI	ML	MLI	Mali	466
150	NORFOLK ISLAND	NF	NFK	Norfolk Island	574
205	TUNISIA	TN	TUN	Tunisia	788
18	BARBADOS	BB	BRB	Barbados	52
44	CONGO	CG	COG	Congo	178
71	GABON	GA	GAB	Gabon	266
125	MALTA	MT	MLT	Malta	470
151	NORTHERN MARIANA ISLANDS	MP	MNP	Northern Mariana Islands	580
206	TURKEY	TR	TUR	Turkey	792
45	CONGO, THE DEMOCRATIC REPUBLIC OF THE	CD	COD	Congo, the Democratic Republic of the	180
126	MARSHALL ISLANDS	MH	MHL	Marshall Islands	584
152	NORWAY	NO	NOR	Norway	578
207	TURKMENISTAN	TM	TKM	Turkmenistan	795
19	BELARUS	BY	BLR	Belarus	112
46	COOK ISLANDS	CK	COK	Cook Islands	184
72	GAMBIA	GM	GMB	Gambia	270
127	MARTINIQUE	MQ	MTQ	Martinique	474
153	OMAN	OM	OMN	Oman	512
180	SEYCHELLES	SC	SYC	Seychelles	690
208	TURKS AND CAICOS ISLANDS	TC	TCA	Turks and Caicos Islands	796
73	GEORGIA	GE	GEO	Georgia	268
128	MAURITANIA	MR	MRT	Mauritania	478
154	PAKISTAN	PK	PAK	Pakistan	586
181	SIERRA LEONE	SL	SLE	Sierra Leone	694
209	TUVALU	TV	TUV	Tuvalu	798
47	COSTA RICA	CR	CRI	Costa Rica	188
74	GERMANY	DE	DEU	Germany	276
129	MAURITIUS	MU	MUS	Mauritius	480
155	PALAU	PW	PLW	Palau	585
48	COTE D'IVOIRE	CI	CIV	Cote D'Ivoire	384
156	PANAMA	PA	PAN	Panama	591
182	SINGAPORE	SG	SGP	Singapore	702
49	CROATIA	HR	HRV	Croatia	191
75	GHANA	GH	GHA	Ghana	288
157	PAPUA NEW GUINEA	PG	PNG	Papua New Guinea	598
183	SLOVAKIA	SK	SVK	Slovakia	703
76	GIBRALTAR	GI	GIB	Gibraltar	292
158	PARAGUAY	PY	PRY	Paraguay	600
184	SLOVENIA	SI	SVN	Slovenia	705
77	GREECE	GR	GRC	Greece	300
159	PERU	PE	PER	Peru	604
185	SOLOMON ISLANDS	SB	SLB	Solomon Islands	90
78	GREENLAND	GL	GRL	Greenland	304
186	SOMALIA	SO	SOM	Somalia	706
79	GRENADA	GD	GRD	Grenada	308
187	SOUTH AFRICA	ZA	ZAF	South Africa	710
188	SPAIN	ES	ESP	Spain	724
189	SRI LANKA	LK	LKA	Sri Lanka	144
1	AFGHANISTAN	AF	AFG	Afghanistan	4
2	ALBANIA	AL	ALB	Albania	8
3	ALGERIA	DZ	DZA	Algeria	12
110	LATVIA	LV	LVA	Latvia	428
4	AMERICAN SAMOA	AS	ASM	American Samoa	16
30	BULGARIA	BG	BGR	Bulgaria	100
111	LEBANON	LB	LBN	Lebanon	422
5	ANDORRA	AD	AND	Andorra	20
31	BURKINA FASO	BF	BFA	Burkina Faso	854
112	LESOTHO	LS	LSO	Lesotho	426
6	ANGOLA	AO	AGO	Angola	24
32	BURUNDI	BI	BDI	Burundi	108
113	LIBERIA	LR	LBR	Liberia	430
220	VIRGIN ISLANDS, BRITISH	VG	VGB	Virgin Islands, British	92
7	ANGUILLA	AI	AIA	Anguilla	660
33	CAMBODIA	KH	KHM	Cambodia	116
60	EQUATORIAL GUINEA	GQ	GNQ	Equatorial Guinea	226
114	LIBYAN ARAB JAMAHIRIYA	LY	LBY	Libyan Arab Jamahiriya	434
140	NAURU	NR	NRU	Nauru	520
221	VIRGIN ISLANDS, U.S.	VI	VIR	Virgin Islands, U.S.	850
8	ANTIGUA AND BARBUDA	AG	ATG	Antigua and Barbuda	28
34	CAMEROON	CM	CMR	Cameroon	120
115	LIECHTENSTEIN	LI	LIE	Liechtenstein	438
141	NEPAL	NP	NPL	Nepal	524
222	WALLIS AND FUTUNA	WF	WLF	Wallis and Futuna	876
223	WESTERN SAHARA	EH	ESH	Western Sahara	732
9	ARGENTINA	AR	ARG	Argentina	32
35	CANADA	CA	CAN	Canada	124
61	ERITREA	ER	ERI	Eritrea	232
116	LITHUANIA	LT	LTU	Lithuania	440
142	NETHERLANDS	NL	NLD	Netherlands	528
224	YEMEN	YE	YEM	Yemen	887
36	CAPE VERDE	CV	CPV	Cape Verde	132
62	ESTONIA	EE	EST	Estonia	233
117	LUXEMBOURG	LU	LUX	Luxembourg	442
143	NETHERLANDS ANTILLES	AN	ANT	Netherlands Antilles	530
170	SAINT HELENA	SH	SHN	Saint Helena	654
225	ZAMBIA	ZM	ZMB	Zambia	894
37	CAYMAN ISLANDS	KY	CYM	Cayman Islands	136
63	ETHIOPIA	ET	ETH	Ethiopia	231
90	HUNGARY	HU	HUN	Hungary	348
118	MACAO	MO	MAC	Macao	446
144	NEW CALEDONIA	NC	NCL	New Caledonia	540
226	ZIMBABWE	ZW	ZWE	Zimbabwe	716
38	CENTRAL AFRICAN REPUBLIC	CF	CAF	Central African Republic	140
64	FALKLAND ISLANDS (MALVINAS)	FK	FLK	Falkland Islands (Malvinas)	238
91	ICELAND	IS	ISL	Iceland	352
119	MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF	MK	MKD	Macedonia	807
145	NEW ZEALAND	NZ	NZL	New Zealand	554
171	SAINT KITTS AND NEVIS	KN	KNA	Saint Kitts and Nevis	659
998	\N	RS	SRB	Serbia	999
\.


--
-- Name: spree_countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_countries_id_seq', 999, false);


--
-- Data for Name: spree_credit_cards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_credit_cards (id, month, year, cc_type, last_digits, first_name, last_name, start_month, start_year, issue_number, address_id, created_at, updated_at, gateway_customer_profile_id, gateway_payment_profile_id) FROM stdin;
1	12	2017	visa	1849	Roberto	Lara	\N	\N	\N	\N	2013-01-31 19:57:05.084388	2013-01-31 19:57:05.084388	\N	\N
2	12	2017	visa	1849	Roberto	Lara	\N	\N	\N	\N	2013-01-31 19:58:21.848516	2013-01-31 19:58:21.848516	\N	\N
3	12	2017	\N	1849	Roberto	enrique	\N	\N	\N	\N	2013-02-01 18:26:36.361597	2013-02-01 18:26:36.361597	\N	\N
4	12	2017	\N	1849	Roberto	Lara	\N	\N	\N	\N	2013-02-01 18:54:41.278982	2013-02-01 18:54:41.278982	\N	\N
5	12	2017	\N	1849	Roberto	Lara	\N	\N	\N	\N	2013-02-01 21:26:41.041577	2013-02-01 21:26:41.041577	\N	\N
6	12	2017	\N	1849	Roberto	Lara	\N	\N	\N	\N	2013-02-01 21:30:17.367271	2013-02-01 21:30:17.367271	\N	\N
7	12	2017	visa	1849	Roberto	Lara	\N	\N	\N	\N	2013-02-01 23:06:49.064409	2013-02-01 23:06:49.064409	\N	\N
8	12	2017	visa	1849	Roberto	Lara	\N	\N	\N	\N	2013-02-02 02:39:15.896002	2013-02-02 02:39:15.896002	\N	\N
9	12	2017	visa	1849	Roberto	Lara	\N	\N	\N	\N	2013-02-02 02:53:46.157261	2013-02-02 02:53:46.157261	\N	\N
10	12	2017	visa	1849	Roberto	Lara	\N	\N	\N	\N	2013-02-02 02:57:20.815139	2013-02-02 02:57:20.815139	\N	\N
11	12	2017	visa	8031	Roberto	Lara	\N	\N	\N	\N	2013-02-02 03:15:52.97766	2013-02-02 03:15:52.97766	\N	\N
12	2	2013	visa	1111	Roberto	Lara	\N	\N	\N	\N	2013-02-02 17:54:39.560326	2013-02-02 17:54:39.560326	\N	\N
13	12	2017	visa	8031	Roberto	Lara	\N	\N	\N	\N	2013-02-02 18:12:30.49776	2013-02-02 18:12:30.49776	\N	\N
14	12	2017	visa	1849	Roberto	Lara	\N	\N	\N	\N	2013-02-06 22:27:55.207242	2013-02-06 22:27:55.207242	\N	\N
15	12	2017	visa	1849	Roberto	Lara	\N	\N	\N	\N	2013-02-06 22:32:20.757928	2013-02-06 22:32:20.757928	\N	\N
16	12	2017	visa	1849	Roberto	Lara	\N	\N	\N	\N	2013-02-13 17:33:20.912402	2013-02-13 17:33:20.912402	\N	\N
17	3	2018	visa	0990	Roberto	Lara	\N	\N	\N	\N	2013-03-15 19:11:21.837489	2013-03-15 19:11:21.837489	\N	\N
18	3	2013	visa	0990	Roberto	Lara	\N	\N	\N	\N	2013-03-15 19:12:09.435039	2013-03-15 19:12:09.435039	\N	\N
19	3	2018	visa	0990	Roberto	Lara	\N	\N	\N	\N	2013-03-15 19:13:00.580479	2013-03-15 19:13:00.580479	\N	\N
20	3	2015	discover	2886	Roberto	Lara	\N	\N	\N	\N	2013-03-15 19:13:58.145067	2013-03-15 19:13:58.145067	\N	\N
21	3	2018	visa	3315	Roberto	Lara	\N	\N	\N	\N	2013-03-15 21:35:24.687226	2013-03-15 21:35:24.687226	\N	\N
22	3	2018	visa	3315	Roberto	Lara	\N	\N	\N	\N	2013-03-15 21:35:35.614224	2013-03-15 21:35:35.614224	\N	\N
23	3	2018	visa	3315	Roberto	Lara	\N	\N	\N	\N	2013-03-15 21:45:05.247964	2013-03-15 21:45:05.247964	\N	\N
24	3	2013	visa	3315	Roberto	Lara	\N	\N	\N	\N	2013-03-15 21:47:50.713002	2013-03-15 21:47:50.713002	\N	\N
25	3	2018	visa	3315	Roberto	Lara	\N	\N	\N	\N	2013-03-15 21:48:02.500695	2013-03-15 21:48:02.500695	\N	\N
26	3	2013	visa	3315	roberto2805	Lara	\N	\N	\N	\N	2013-03-15 21:54:35.391428	2013-03-15 21:54:35.391428	\N	\N
27	3	2018	visa	3315	roberto2805	Lara	\N	\N	\N	\N	2013-03-15 21:56:07.518202	2013-03-15 21:56:07.518202	\N	\N
28	3	2018	visa	3315	roberto2805	Lara	\N	\N	\N	\N	2013-03-15 21:58:43.487264	2013-03-15 21:58:43.487264	\N	\N
29	3	2018	visa	3315	roberto2805	Lara	\N	\N	\N	\N	2013-03-15 22:04:40.083889	2013-03-15 22:04:40.083889	\N	\N
30	3	2018	visa	3315	roberto2805	Lara	\N	\N	\N	\N	2013-03-15 22:10:52.742699	2013-03-15 22:10:52.742699	\N	\N
31	3	2018	visa	3315	roberto2805	Lara	\N	\N	\N	\N	2013-03-15 22:13:39.048195	2013-03-15 22:13:39.048195	\N	\N
32	3	2018	visa	3315	roberto2805	Lara	\N	\N	\N	\N	2013-03-15 22:15:24.469647	2013-03-15 22:15:24.469647	\N	\N
33	4	2018	\N	4977	Roberto	Lar	\N	\N	\N	\N	2013-04-22 21:09:43.467176	2013-04-22 21:09:43.467176	\N	\N
34	4	2018	\N	4977	Roberto	Lar	\N	\N	\N	\N	2013-04-22 21:10:25.412988	2013-04-22 21:10:25.412988	\N	\N
35	4	2018	\N	0345	Roberto	Lara	\N	\N	\N	\N	2013-04-22 22:10:08.029811	2013-04-22 22:10:08.029811	\N	\N
36	4	2018	\N	0345	Roberto	Lara	\N	\N	\N	\N	2013-04-22 22:28:20.664405	2013-04-22 22:28:20.664405	\N	\N
37	4	2018	\N	0345	Roberto	Lara	\N	\N	\N	\N	2013-04-22 22:33:09.53848	2013-04-22 22:33:09.53848	\N	\N
38	4	2018	\N	0345	Roberto	Lara	\N	\N	\N	\N	2013-04-22 22:33:42.057489	2013-04-22 22:33:42.057489	\N	\N
39	4	2018	master	1132	Enrique	Lara	\N	\N	\N	\N	2013-04-23 02:29:14.616898	2013-04-23 02:29:14.616898	\N	\N
40	4	2018	master	1132	Enrique	Lara	\N	\N	\N	\N	2013-05-06 22:38:19.908798	2013-05-06 22:38:19.908798	\N	\N
41	3	2017	master	9999	Roberto	Lara	\N	\N	\N	\N	2013-05-09 19:56:53.308341	2013-05-09 19:56:53.308341	\N	\N
42	3	2017	master	9999	Banwire	Test Card	\N	\N	\N	\N	2013-05-09 20:00:55.965602	2013-05-09 20:00:55.965602	\N	\N
43	3	2017	master	9999	Banwire	Test Card	\N	\N	\N	\N	2013-05-09 20:15:13.787693	2013-05-09 20:15:13.787693	\N	\N
44	3	2017	master	9999	Banwire	Test Card	\N	\N	\N	\N	2013-05-09 20:35:26.194405	2013-05-09 20:35:26.194405	\N	\N
\.


--
-- Name: spree_credit_cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_credit_cards_id_seq', 44, true);


--
-- Data for Name: spree_faqs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_faqs (id, question, answer, created_at, updated_at, "position") FROM stdin;
1	SECURE PAYMENT	The 21st century calls for knowledge workers who can effectively utilize the vast array of information that resides on the internet and who are capable of processing the information collaboratively with others. </br>\r\n</br>\r\n&quot Bob Wolf, of The Boston Consulting Group, and a researcher on the use of Diigo is much more than a simple web annotation or social bookmarking service &quot -- it is a new kind of online research and collaborative research tool that integrates tags and folders, highlighting and clipping, sticky notes, and group-based collaboration, enabling a whole new process of online knowledge management, learning, and teaching in the information age.	2013-03-13 18:31:47.952586	2013-05-03 19:22:34.608354	2
3	SHIPPING	The 21st century calls for knowledge workers who can effectively utilize the vast array of information that resides on the internet and who are capable of processing the information collaboratively with others. Bob Wolf, of The Boston Consulting Group, and a researcher on the use of internet in public education recently commented: "We believe that Web2.0 technologies will define and be defined by the skill requirements of the 21st century workforce. It is time to understand whether models have emerged for using these tools that are superior to traditional classroom teaching alone and what are the best approaches for the practitioner to implement them." In the education setting, we all know that project-based learning is an effective way to teach students and cultivate their skills of finding, organizing, synthesizing, and presenting information, as well as the social skills of working in groups, all of which are necessary in the knowledge-based economy. Among the web 2.0 technologies, Diigo is a great tool for this kind of exploratory and collaborative learning. Diigo is an effective tool for teaching as well. Diigo's features allow teachers to highlight critical features within text and images and write comments directly on the web pages, to collect and organize series of web pages and web sites into coherent and thematic sets, and to facilitate online conversations within the context of the materials themselves. Diigo also allows teachers to collaborate and share resources among themselves. Diigo is much more than a simple web annotation or social bookmarking service -- it is a new kind of online research and collaborative research tool that integrates tags and folders, highlighting and clipping, sticky notes, and group-based collaboration, enabling a whole new process of online knowledge management, learning, and teaching in the information age. 	2013-03-13 20:49:20.587434	2013-03-13 20:49:20.587434	1
2	ORDER TRACKING	The 21st century calls for knowledge workers who can effectively utilize the vast array of information that resides on the internet and who are capable of processing the information collaboratively with others. Bob Wolf, of The Boston Consulting Group, and a researcher on the use of internet in public education recently commented: "We believe that Web2.0 technologies will define and be defined by the skill requirements of the 21st century workforce. It is time to understand whether models have emerged for using these tools that are superior to traditional classroom teaching alone and what are the best approaches for the practitioner to implement them." In the education setting, we all know that project-based learning is an effective way to teach students and cultivate their skills of finding, organizing, synthesizing, and presenting information, as well as the social skills of working in groups, all of which are necessary in the knowledge-based economy. Among the web 2.0 technologies, Diigo is a great tool for this kind of exploratory and collaborative learning. Diigo is an effective tool for teaching as well. Diigo's features allow teachers to highlight critical features within text and images and write comments directly on the web pages, to collect and organize series of web pages and web sites into coherent and thematic sets, and to facilitate online conversations within the context of the materials themselves. Diigo also allows teachers to collaborate and share resources among themselves. Diigo is much more than a simple web annotation or social bookmarking service -- it is a new kind of online research and collaborative research tool that integrates tags and folders, highlighting and clipping, sticky notes, and group-based collaboration, enabling a whole new process of online knowledge management, learning, and teaching in the information age. 	2013-03-13 20:46:06.681878	2013-03-13 20:47:51.782956	3
\.


--
-- Name: spree_faqs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_faqs_id_seq', 4, true);


--
-- Data for Name: spree_gateways; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_gateways (id, type, name, description, active, environment, server, test_mode, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_gateways_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_gateways_id_seq', 1, false);


--
-- Data for Name: spree_inventory_units; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_inventory_units (id, lock_version, state, variant_id, order_id, created_at, updated_at, shipment_id, return_authorization_id) FROM stdin;
1	0	sold	11	2	2013-01-31 19:58:29.279662	2013-01-31 19:58:29.279662	1	\N
2	0	backordered	11	2	2013-01-31 19:58:29.351069	2013-01-31 19:58:29.351069	1	\N
3	0	backordered	11	3	2013-02-01 18:26:45.005621	2013-02-01 18:26:45.005621	2	\N
4	0	sold	7	3	2013-02-01 18:26:45.032532	2013-02-01 18:26:45.032532	2	\N
5	0	sold	12	4	2013-02-01 18:54:48.640116	2013-02-01 18:54:48.640116	3	\N
6	0	sold	12	5	2013-02-01 21:30:25.533915	2013-02-01 21:30:25.533915	4	\N
7	0	sold	12	6	2013-02-02 18:12:40.954309	2013-02-02 18:12:40.954309	5	\N
8	0	sold	12	7	2013-02-06 22:28:04.610223	2013-02-06 22:28:04.610223	6	\N
9	0	sold	12	9	2013-02-06 22:32:28.170383	2013-02-06 22:32:28.170383	7	\N
10	0	sold	12	10	2013-02-13 17:33:30.934736	2013-02-13 17:33:30.934736	11	\N
11	0	sold	14	10	2013-02-13 17:33:31.033294	2013-02-13 17:33:31.033294	11	\N
12	0	sold	14	10	2013-02-13 17:33:31.038681	2013-02-13 17:33:31.038681	11	\N
13	0	sold	14	10	2013-02-13 17:33:31.043322	2013-02-13 17:33:31.043322	11	\N
14	0	sold	14	10	2013-02-13 17:33:31.048328	2013-02-13 17:33:31.048328	11	\N
19	1	shipped	22	39	2013-05-09 20:35:27.876244	2013-05-13 15:56:49.829705	23	\N
18	1	shipped	22	38	2013-05-09 20:15:15.46285	2013-05-13 18:53:38.995288	22	\N
17	1	shipped	19	38	2013-05-09 20:15:15.434578	2013-05-13 18:53:39.007049	22	\N
16	1	shipped	19	37	2013-05-09 20:00:57.806635	2013-05-13 18:58:26.823353	21	\N
15	1	shipped	22	33	2013-04-22 19:57:10.709293	2013-05-13 19:12:39.503624	17	\N
\.


--
-- Name: spree_inventory_units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_inventory_units_id_seq', 19, true);


--
-- Data for Name: spree_line_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_line_items (id, order_id, variant_id, quantity, price, created_at, updated_at) FROM stdin;
105	32	19	2	29.00	2013-04-22 19:05:05.13774	2013-04-22 19:05:40.241158
106	32	20	1	50.00	2013-04-22 19:05:40.329059	2013-04-22 19:05:40.329059
107	33	22	1	29.00	2013-04-22 19:06:20.619012	2013-04-22 19:06:20.619012
34	2	11	2	20.00	2013-01-31 19:30:39.842944	2013-01-31 19:44:53.378181
37	3	11	1	20.00	2013-01-31 22:35:35.91273	2013-01-31 22:35:35.91273
38	3	7	1	45.00	2013-01-31 22:39:33.040916	2013-01-31 23:19:20.941667
39	4	12	1	20.00	2013-02-01 18:53:00.866234	2013-02-01 18:53:00.866234
40	5	12	1	20.00	2013-02-01 21:13:42.037556	2013-02-01 21:13:42.037556
41	6	12	1	20.00	2013-02-01 22:39:45.066229	2013-02-01 22:39:45.066229
121	37	19	1	29.00	2013-05-09 19:54:43.862633	2013-05-09 19:54:43.862633
122	38	19	1	29.00	2013-05-09 20:10:13.265832	2013-05-09 20:10:13.265832
123	38	22	1	29.00	2013-05-09 20:10:16.079285	2013-05-09 20:10:16.079285
50	7	12	1	20.00	2013-02-06 22:23:53.767508	2013-02-06 22:23:53.767508
124	39	22	1	29.00	2013-05-09 20:33:56.449078	2013-05-09 20:33:56.449078
51	9	12	1	20.00	2013-02-06 22:31:08.462781	2013-02-06 22:31:08.462781
68	14	12	2	20.00	2013-02-11 19:26:18.008198	2013-02-11 19:27:46.27763
73	10	12	1	20.00	2013-02-12 23:09:37.991898	2013-02-12 23:09:37.991898
74	10	14	4	19.00	2013-02-13 05:18:34.486384	2013-02-13 05:22:48.784754
81	17	20	1	50.00	2013-03-05 20:07:21.192221	2013-03-05 20:07:21.192221
80	17	19	2	29.00	2013-03-05 20:07:17.724265	2013-03-05 20:07:25.387898
82	18	19	1	29.00	2013-03-12 21:11:54.448802	2013-03-12 21:11:54.448802
86	20	20	1	50.00	2013-03-13 00:46:22.778497	2013-03-13 00:46:22.778497
87	20	19	1	29.00	2013-03-13 18:22:47.096589	2013-03-13 18:22:47.096589
88	21	20	3	50.00	2013-03-13 19:09:30.768167	2013-03-13 20:06:46.384045
89	21	19	1	29.00	2013-03-13 20:06:46.588113	2013-03-13 20:06:46.588113
91	27	22	1	29.00	2013-03-21 23:49:49.160679	2013-03-21 23:49:49.160679
92	27	19	1	29.00	2013-03-22 04:12:58.331117	2013-03-22 04:12:58.331117
93	28	20	1	50.00	2013-03-25 05:42:03.63829	2013-03-25 05:42:03.63829
94	28	19	1	29.00	2013-03-25 06:22:49.904455	2013-03-25 06:22:49.904455
95	28	22	1	29.00	2013-03-25 06:22:54.348631	2013-03-25 06:22:54.348631
96	29	22	3	29.00	2013-03-26 05:44:45.683261	2013-03-26 05:48:24.276715
142	42	19	1	29.00	2013-05-15 19:21:12.903227	2013-05-15 19:21:12.903227
143	43	19	1	29.00	2013-05-29 21:53:12.529927	2013-05-29 21:53:12.529927
144	43	20	1	50.00	2013-05-29 22:00:04.973021	2013-05-29 22:00:04.973021
145	44	19	1	29.00	2013-05-29 22:25:51.677203	2013-05-29 22:25:51.677203
147	46	19	1	29.00	2013-06-25 20:37:22.201971	2013-06-25 20:37:22.201971
148	47	19	1	29.00	2013-06-26 15:11:27.149637	2013-06-26 15:11:27.149637
158	48	19	1	29.00	2013-07-16 21:49:48.459081	2013-07-16 21:49:48.459081
159	49	19	1	29.00	2013-07-16 23:26:25.199752	2013-07-16 23:26:25.199752
157	49	20	1	50.00	2013-07-16 21:48:56.107043	2013-07-17 06:52:24.428758
\.


--
-- Name: spree_line_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_line_items_id_seq', 159, true);


--
-- Data for Name: spree_log_entries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_log_entries (id, source_id, source_type, details, created_at, updated_at) FROM stdin;
2	2	Spree::Payment	--- !ruby/object:ActiveMerchant::Billing::Response\nparams:\n  timestamp: '2013-01-31T19:58:28Z'\n  ack: Success\n  correlation_id: a5e346d89cc4f\n  version: '72'\n  build: '4137385'\n  amount: '40.00'\n  amount_currency_id: USD\n  avs_code: X\n  cvv2_code: M\n  transaction_id: 83S213185V151752B\n  Timestamp: '2013-01-31T19:58:28Z'\n  Ack: Success\n  CorrelationID: a5e346d89cc4f\n  Version: '72'\n  Build: '4137385'\n  Amount: '40.00'\n  AVSCode: X\n  CVV2Code: M\n  TransactionID: 83S213185V151752B\nmessage: Success\nsuccess: true\ntest: true\nauthorization: 83S213185V151752B\nfraud_review: false\navs_result:\n  code: X\n  message: Street address and 9-digit postal code match.\n  street_match: Y\n  postal_match: Y\ncvv_result:\n  code: M\n  message: Match\n	2013-01-31 19:58:29.043561	2013-01-31 19:58:29.043561
3	3	Spree::Payment	--- !ruby/object:ActiveMerchant::Billing::Response\nparams:\n  timestamp: '2013-02-01T18:26:44Z'\n  ack: SuccessWithWarning\n  correlation_id: 68c8737d8d65d\n  version: '72'\n  build: '5060305'\n  amount: '65.00'\n  amount_currency_id: USD\n  avs_code: X\n  cvv2_code: M\n  transaction_id: 0JL96345307231044\n  message: This transaction was approved. However, the Card Security Code provided\n    had too few, too many, or invalid character types but, as per your account option\n    settings, was not required in the approval process.\n  error_codes: '10571'\n  Timestamp: '2013-02-01T18:26:44Z'\n  Ack: SuccessWithWarning\n  CorrelationID: 68c8737d8d65d\n  Errors:\n    ShortMessage: Transaction approved but with invalid CSC format.\n    LongMessage: This transaction was approved. However, the Card Security Code provided\n      had too few, too many, or invalid character types but, as per your account option\n      settings, was not required in the approval process.\n    ErrorCode: '10571'\n    SeverityCode: Warning\n    ErrorParameters:\n      Value: '0000'\n  Version: '72'\n  Build: '5060305'\n  Amount: '65.00'\n  AVSCode: X\n  CVV2Code: M\n  TransactionID: 0JL96345307231044\nmessage: This transaction was approved. However, the Card Security Code provided had\n  too few, too many, or invalid character types but, as per your account option settings,\n  was not required in the approval process.\nsuccess: true\ntest: true\nauthorization: 0JL96345307231044\nfraud_review: false\navs_result:\n  code: X\n  message: Street address and 9-digit postal code match.\n  street_match: Y\n  postal_match: Y\ncvv_result:\n  code: M\n  message: Match\n	2013-02-01 18:26:44.788675	2013-02-01 18:26:44.788675
4	4	Spree::Payment	--- !ruby/object:ActiveMerchant::Billing::Response\nparams:\n  timestamp: '2013-02-01T18:54:48Z'\n  ack: SuccessWithWarning\n  correlation_id: 9b49491a661d8\n  version: '72'\n  build: '5060305'\n  amount: '20.00'\n  amount_currency_id: USD\n  avs_code: X\n  cvv2_code: M\n  transaction_id: 76G017139C203594K\n  message: This transaction was approved. However, the Card Security Code provided\n    had too few, too many, or invalid character types but, as per your account option\n    settings, was not required in the approval process.\n  error_codes: '10571'\n  Timestamp: '2013-02-01T18:54:48Z'\n  Ack: SuccessWithWarning\n  CorrelationID: 9b49491a661d8\n  Errors:\n    ShortMessage: Transaction approved but with invalid CSC format.\n    LongMessage: This transaction was approved. However, the Card Security Code provided\n      had too few, too many, or invalid character types but, as per your account option\n      settings, was not required in the approval process.\n    ErrorCode: '10571'\n    SeverityCode: Warning\n    ErrorParameters:\n      Value: '0000'\n  Version: '72'\n  Build: '5060305'\n  Amount: '20.00'\n  AVSCode: X\n  CVV2Code: M\n  TransactionID: 76G017139C203594K\nmessage: This transaction was approved. However, the Card Security Code provided had\n  too few, too many, or invalid character types but, as per your account option settings,\n  was not required in the approval process.\nsuccess: true\ntest: true\nauthorization: 76G017139C203594K\nfraud_review: false\navs_result:\n  code: X\n  message: Street address and 9-digit postal code match.\n  street_match: Y\n  postal_match: Y\ncvv_result:\n  code: M\n  message: Match\n	2013-02-01 18:54:48.409542	2013-02-01 18:54:48.409542
5	6	Spree::Payment	--- !ruby/object:ActiveMerchant::Billing::Response\nparams:\n  timestamp: '2013-02-01T21:30:25Z'\n  ack: SuccessWithWarning\n  correlation_id: 9db594bf28fdc\n  version: '72'\n  build: '5060305'\n  amount: '20.00'\n  amount_currency_id: USD\n  avs_code: X\n  cvv2_code: M\n  transaction_id: 0VH270695Y797815M\n  message: This transaction was approved. However, the Card Security Code provided\n    had too few, too many, or invalid character types but, as per your account option\n    settings, was not required in the approval process.\n  error_codes: '10571'\n  Timestamp: '2013-02-01T21:30:25Z'\n  Ack: SuccessWithWarning\n  CorrelationID: 9db594bf28fdc\n  Errors:\n    ShortMessage: Transaction approved but with invalid CSC format.\n    LongMessage: This transaction was approved. However, the Card Security Code provided\n      had too few, too many, or invalid character types but, as per your account option\n      settings, was not required in the approval process.\n    ErrorCode: '10571'\n    SeverityCode: Warning\n    ErrorParameters:\n      Value: '0000'\n  Version: '72'\n  Build: '5060305'\n  Amount: '20.00'\n  AVSCode: X\n  CVV2Code: M\n  TransactionID: 0VH270695Y797815M\nmessage: This transaction was approved. However, the Card Security Code provided had\n  too few, too many, or invalid character types but, as per your account option settings,\n  was not required in the approval process.\nsuccess: true\ntest: true\nauthorization: 0VH270695Y797815M\nfraud_review: false\navs_result:\n  code: X\n  message: Street address and 9-digit postal code match.\n  street_match: Y\n  postal_match: Y\ncvv_result:\n  code: M\n  message: Match\n	2013-02-01 21:30:25.373753	2013-02-01 21:30:25.373753
15	13	Spree::Payment	--- !ruby/object:ActiveMerchant::Billing::Response\nparams:\n  timestamp: '2013-02-02T18:12:40Z'\n  ack: SuccessWithWarning\n  correlation_id: 533dbc5667cfe\n  version: '72'\n  build: '5060305'\n  amount: '20.00'\n  amount_currency_id: USD\n  avs_code: X\n  cvv2_code: M\n  transaction_id: 6SB80000GX081552V\n  message: This transaction was approved. However, the Card Security Code provided\n    had too few, too many, or invalid character types but, as per your account option\n    settings, was not required in the approval process.\n  error_codes: '10571'\n  Timestamp: '2013-02-02T18:12:40Z'\n  Ack: SuccessWithWarning\n  CorrelationID: 533dbc5667cfe\n  Errors:\n    ShortMessage: Transaction approved but with invalid CSC format.\n    LongMessage: This transaction was approved. However, the Card Security Code provided\n      had too few, too many, or invalid character types but, as per your account option\n      settings, was not required in the approval process.\n    ErrorCode: '10571'\n    SeverityCode: Warning\n    ErrorParameters:\n      Value: '0000'\n  Version: '72'\n  Build: '5060305'\n  Amount: '20.00'\n  AVSCode: X\n  CVV2Code: M\n  TransactionID: 6SB80000GX081552V\nmessage: This transaction was approved. However, the Card Security Code provided had\n  too few, too many, or invalid character types but, as per your account option settings,\n  was not required in the approval process.\nsuccess: true\ntest: true\nauthorization: 6SB80000GX081552V\nfraud_review: false\navs_result:\n  code: X\n  message: Street address and 9-digit postal code match.\n  street_match: Y\n  postal_match: Y\ncvv_result:\n  code: M\n  message: Match\n	2013-02-02 18:12:40.76031	2013-02-02 18:12:40.76031
16	14	Spree::Payment	--- !ruby/object:ActiveMerchant::Billing::Response\nparams:\n  timestamp: '2013-02-06T22:28:03Z'\n  ack: SuccessWithWarning\n  correlation_id: fff101774c9f3\n  version: '72'\n  build: '5060305'\n  amount: '20.00'\n  amount_currency_id: USD\n  avs_code: X\n  cvv2_code: M\n  transaction_id: 3UU280427M014474P\n  message: This transaction was approved. However, the Card Security Code provided\n    had too few, too many, or invalid character types but, as per your account option\n    settings, was not required in the approval process.\n  error_codes: '10571'\n  Timestamp: '2013-02-06T22:28:03Z'\n  Ack: SuccessWithWarning\n  CorrelationID: fff101774c9f3\n  Errors:\n    ShortMessage: Transaction approved but with invalid CSC format.\n    LongMessage: This transaction was approved. However, the Card Security Code provided\n      had too few, too many, or invalid character types but, as per your account option\n      settings, was not required in the approval process.\n    ErrorCode: '10571'\n    SeverityCode: Warning\n    ErrorParameters:\n      Value: '0000'\n  Version: '72'\n  Build: '5060305'\n  Amount: '20.00'\n  AVSCode: X\n  CVV2Code: M\n  TransactionID: 3UU280427M014474P\nmessage: This transaction was approved. However, the Card Security Code provided had\n  too few, too many, or invalid character types but, as per your account option settings,\n  was not required in the approval process.\nsuccess: true\ntest: true\nauthorization: 3UU280427M014474P\nfraud_review: false\navs_result:\n  code: X\n  message: Street address and 9-digit postal code match.\n  street_match: Y\n  postal_match: Y\ncvv_result:\n  code: M\n  message: Match\n	2013-02-06 22:28:04.144703	2013-02-06 22:28:04.144703
17	15	Spree::Payment	--- !ruby/object:ActiveMerchant::Billing::Response\nparams:\n  timestamp: '2013-02-06T22:32:27Z'\n  ack: SuccessWithWarning\n  correlation_id: 94fcac878afe3\n  version: '72'\n  build: '5060305'\n  amount: '20.00'\n  amount_currency_id: USD\n  avs_code: X\n  cvv2_code: M\n  transaction_id: 7WD218095P6783817\n  message: This transaction was approved. However, the Card Security Code provided\n    had too few, too many, or invalid character types but, as per your account option\n    settings, was not required in the approval process.\n  error_codes: '10571'\n  Timestamp: '2013-02-06T22:32:27Z'\n  Ack: SuccessWithWarning\n  CorrelationID: 94fcac878afe3\n  Errors:\n    ShortMessage: Transaction approved but with invalid CSC format.\n    LongMessage: This transaction was approved. However, the Card Security Code provided\n      had too few, too many, or invalid character types but, as per your account option\n      settings, was not required in the approval process.\n    ErrorCode: '10571'\n    SeverityCode: Warning\n    ErrorParameters:\n      Value: '0000'\n  Version: '72'\n  Build: '5060305'\n  Amount: '20.00'\n  AVSCode: X\n  CVV2Code: M\n  TransactionID: 7WD218095P6783817\nmessage: This transaction was approved. However, the Card Security Code provided had\n  too few, too many, or invalid character types but, as per your account option settings,\n  was not required in the approval process.\nsuccess: true\ntest: true\nauthorization: 7WD218095P6783817\nfraud_review: false\navs_result:\n  code: X\n  message: Street address and 9-digit postal code match.\n  street_match: Y\n  postal_match: Y\ncvv_result:\n  code: M\n  message: Match\n	2013-02-06 22:32:27.932483	2013-02-06 22:32:27.932483
18	16	Spree::Payment	--- !ruby/object:ActiveMerchant::Billing::Response\nparams:\n  timestamp: '2013-02-13T17:33:30Z'\n  ack: SuccessWithWarning\n  correlation_id: 7b0bd3b6f1465\n  version: '72'\n  build: '5060305'\n  amount: '100.80'\n  amount_currency_id: USD\n  avs_code: X\n  cvv2_code: M\n  transaction_id: 4BD39361PX0690922\n  message: This transaction was approved. However, the Card Security Code provided\n    had too few, too many, or invalid character types but, as per your account option\n    settings, was not required in the approval process.\n  error_codes: '10571'\n  Timestamp: '2013-02-13T17:33:30Z'\n  Ack: SuccessWithWarning\n  CorrelationID: 7b0bd3b6f1465\n  Errors:\n    ShortMessage: Transaction approved but with invalid CSC format.\n    LongMessage: This transaction was approved. However, the Card Security Code provided\n      had too few, too many, or invalid character types but, as per your account option\n      settings, was not required in the approval process.\n    ErrorCode: '10571'\n    SeverityCode: Warning\n    ErrorParameters:\n      Value: '0000'\n  Version: '72'\n  Build: '5060305'\n  Amount: '100.80'\n  AVSCode: X\n  CVV2Code: M\n  TransactionID: 4BD39361PX0690922\nmessage: This transaction was approved. However, the Card Security Code provided had\n  too few, too many, or invalid character types but, as per your account option settings,\n  was not required in the approval process.\nsuccess: true\ntest: true\nauthorization: 4BD39361PX0690922\nfraud_review: false\navs_result:\n  code: X\n  message: Street address and 9-digit postal code match.\n  street_match: Y\n  postal_match: Y\ncvv_result:\n  code: M\n  message: Match\n	2013-02-13 17:33:30.581564	2013-02-13 17:33:30.581564
46	55	Spree::Payment	--- !ruby/object:ActiveMerchant::Billing::Response\nparams:\n  user: desarrollo\n  order_id: '20130509154145'\n  referencia: R716705288\n  date: 09-05-2013 15:41:45\n  card: '9999'\n  response: ok\n  code_auth: test12345\n  id: 6922\n  monto: 34.99\n  client: Banwire Test Card\nmessage: \nsuccess: true\ntest: true\nauthorization: test12345\nfraud_review: \navs_result:\n  code: \n  message: \n  street_match: \n  postal_match: \ncvv_result:\n  code: \n  message: \n	2013-05-09 20:35:27.594733	2013-05-09 20:35:27.594733
35	42	Spree::Payment	--- !ruby/object:ActiveMerchant::Billing::PaypalExpressResponse\nparams:\n  timestamp: '2013-04-22T19:57:09Z'\n  ack: Success\n  correlation_id: 910bf799d09dc\n  version: '72'\n  build: '5715372'\n  token: EC-9R3907110P948223X\n  transaction_id: 16011125KS013612T\n  parent_transaction_id: \n  receipt_id: \n  transaction_type: cart\n  payment_type: instant\n  payment_date: '2013-04-22T19:57:09Z'\n  gross_amount: '30.74'\n  gross_amount_currency_id: USD\n  fee_amount: '1.19'\n  fee_amount_currency_id: USD\n  tax_amount: '0.00'\n  tax_amount_currency_id: USD\n  exchange_rate: \n  payment_status: Completed\n  pending_reason: none\n  reason_code: none\n  protection_eligibility: Eligible\n  protection_eligibility_type: ItemNotReceivedEligible,UnauthorizedPaymentEligible\n  secure_merchant_account_id: 8ZWZX5SC8J62J\n  success_page_redirect_requested: 'false'\n  Token: EC-9R3907110P948223X\n  PaymentInfo:\n    TransactionID: 16011125KS013612T\n    ParentTransactionID: \n    ReceiptID: \n    TransactionType: cart\n    PaymentType: instant\n    PaymentDate: '2013-04-22T19:57:09Z'\n    GrossAmount: '30.74'\n    FeeAmount: '1.19'\n    TaxAmount: '0.00'\n    ExchangeRate: \n    PaymentStatus: Completed\n    PendingReason: none\n    ReasonCode: none\n    ProtectionEligibility: Eligible\n    ProtectionEligibilityType: ItemNotReceivedEligible,UnauthorizedPaymentEligible\n    SellerDetails:\n      SecureMerchantAccountID: 8ZWZX5SC8J62J\n  SuccessPageRedirectRequested: 'false'\nmessage: Success\nsuccess: true\ntest: true\nauthorization: 16011125KS013612T\nfraud_review: false\navs_result:\n  code: \n  message: \n  street_match: \n  postal_match: \ncvv_result:\n  code: \n  message: \n	2013-04-22 19:57:10.113055	2013-04-22 19:57:10.113055
44	53	Spree::Payment	--- !ruby/object:ActiveMerchant::Billing::Response\nparams:\n  user: desarrollo\n  order_id: '20130509150715'\n  referencia: R604054887\n  date: 09-05-2013 15:07:15\n  card: '9999'\n  response: ok\n  code_auth: test12345\n  id: 1964\n  monto: 34.99\n  client: Banwire Test Card\nmessage: \nsuccess: true\ntest: true\nauthorization: test12345\nfraud_review: \navs_result:\n  code: \n  message: \n  street_match: \n  postal_match: \ncvv_result:\n  code: \n  message: \n	2013-05-09 20:00:57.261048	2013-05-09 20:00:57.261048
45	54	Spree::Payment	--- !ruby/object:ActiveMerchant::Billing::Response\nparams:\n  user: desarrollo\n  order_id: '20130509152133'\n  referencia: R645154241\n  date: 09-05-2013 15:21:33\n  card: '9999'\n  response: ok\n  code_auth: test12345\n  id: 5710\n  monto: 63.99\n  client: Banwire Test Card\nmessage: \nsuccess: true\ntest: true\nauthorization: test12345\nfraud_review: \navs_result:\n  code: \n  message: \n  street_match: \n  postal_match: \ncvv_result:\n  code: \n  message: \n	2013-05-09 20:15:15.180477	2013-05-09 20:15:15.180477
\.


--
-- Name: spree_log_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_log_entries_id_seq', 46, true);


--
-- Data for Name: spree_mail_methods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_mail_methods (id, environment, active, created_at, updated_at) FROM stdin;
2	development	t	2013-05-09 20:21:15.447232	2013-05-09 20:21:15.447232
\.


--
-- Name: spree_mail_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_mail_methods_id_seq', 2, true);


--
-- Data for Name: spree_option_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_option_types (id, name, presentation, created_at, updated_at, "position") FROM stdin;
1	tshirt_size	Size	2013-01-25 06:58:45.349642	2013-01-25 06:58:45.349642	1
2	playera-normal-hombre	playera-normal-hombre	2013-04-01 18:33:19.77983	2013-04-17 22:18:45.014684	2
\.


--
-- Name: spree_option_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_option_types_id_seq', 4, true);


--
-- Data for Name: spree_option_types_prototypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_option_types_prototypes (prototype_id, option_type_id) FROM stdin;
2	2
\.


--
-- Data for Name: spree_option_values; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_option_values (id, "position", name, presentation, option_type_id, created_at, updated_at, chest, waist, lenght) FROM stdin;
1	1	Small	S	1	2013-01-25 06:58:59.912457	2013-01-25 06:58:59.912457	\N	\N	\N
2	2	Medium	M	1	2013-01-25 06:59:55.928682	2013-01-25 06:59:55.928682	\N	\N	\N
3	3	Large	L	1	2013-01-25 06:59:55.932542	2013-01-25 06:59:55.932542	\N	\N	\N
4	1	small-details	small	2	2013-04-17 22:13:05.024662	2013-04-17 22:13:05.024662	32.5"	32.5"	32.5"
5	2	medium-details	medium	2	2013-04-17 22:13:05.100728	2013-04-17 22:13:05.100728	34.5"	34.5"	34.5"
6	3	large-details	large	2	2013-04-19 20:36:52.803149	2013-04-19 20:36:52.803149	36.5"	36.5"	36.5"
\.


--
-- Name: spree_option_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_option_values_id_seq', 6, true);


--
-- Data for Name: spree_option_values_variants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_option_values_variants (variant_id, option_value_id) FROM stdin;
2	1
3	1
4	2
5	3
7	1
11	1
12	2
14	1
16	1
17	2
19	1
20	2
22	1
24	1
25	2
26	3
29	1
30	2
31	3
\.


--
-- Data for Name: spree_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_orders (id, number, item_total, total, state, adjustment_total, user_id, created_at, updated_at, completed_at, bill_address_id, ship_address_id, payment_total, shipping_method_id, shipment_state, payment_state, email, special_instructions) FROM stdin;
10	R532724411	96.00	100.80	complete	4.80	1	2013-02-07 18:17:57.604438	2013-02-13 17:33:30.822933	2013-02-13 17:33:30.822933	15	16	0.00	1	pending	balance_due	spree@example.com	\N
18	R015334004	29.00	30.45	canceled	1.45	\N	2013-03-12 21:11:19.32235	2013-03-15 22:28:39.678083	2013-03-12 21:14:50.270001	17	18	0.00	1	pending	balance_due	rele_91@hotmail.com	\N
23	R271281070	0.00	0.00	cart	0.00	\N	2013-03-21 23:41:13.172795	2013-03-21 23:41:13.172795	\N	\N	\N	0.00	\N	\N	\N	\N	\N
24	R328857720	0.00	0.00	cart	0.00	\N	2013-03-21 23:41:43.323256	2013-03-21 23:41:43.323256	\N	\N	\N	0.00	\N	\N	\N	\N	\N
6	R871657880	20.00	20.00	complete	0.00	1	2013-02-01 22:39:45.010199	2013-02-02 18:12:40.88087	2013-02-02 18:12:40.88087	9	10	0.00	1	pending	balance_due	spree@example.com	\N
25	R563764615	0.00	0.00	cart	0.00	\N	2013-03-21 23:41:47.74948	2013-03-21 23:41:47.74948	\N	\N	\N	0.00	\N	\N	\N	\N	\N
26	R576580487	0.00	0.00	cart	0.00	\N	2013-03-21 23:44:16.714207	2013-03-21 23:44:16.714207	\N	\N	\N	0.00	\N	\N	\N	\N	\N
7	R286606482	20.00	20.00	complete	0.00	1	2013-02-02 20:53:01.42391	2013-02-06 22:28:04.450323	2013-02-06 22:28:04.450323	11	12	0.00	1	pending	balance_due	spree@example.com	\N
14	R427330035	40.00	40.00	address	0.00	\N	2013-02-08 19:26:35.5083	2013-02-11 22:01:27.06332	\N	\N	\N	0.00	\N	\N	balance_due	rlara@incaztech.com	\N
27	R866377564	58.00	58.00	cart	0.00	\N	2013-03-21 23:49:48.869266	2013-03-21 23:49:48.869266	\N	\N	\N	0.00	\N	\N	balance_due	\N	\N
11	R564543635	0.00	0.00	cart	0.00	\N	2013-02-07 22:06:39.470246	2013-02-07 22:06:39.470246	\N	\N	\N	0.00	\N	\N	\N	\N	\N
12	R815870018	0.00	0.00	cart	0.00	\N	2013-02-07 22:06:42.182448	2013-02-07 22:06:42.182448	\N	\N	\N	0.00	\N	\N	\N	\N	\N
13	R420576706	0.00	0.00	cart	0.00	\N	2013-02-07 22:06:49.768785	2013-02-07 22:06:49.768785	\N	\N	\N	0.00	\N	\N	\N	\N	\N
5	R013455051	20.00	20.00	complete	0.00	1	2013-02-01 21:13:15.127045	2013-02-01 21:30:25.481717	2013-02-01 21:30:25.481717	7	8	0.00	1	pending	balance_due	spree@example.com	\N
21	R837724320	179.00	179.00	cart	0.00	\N	2013-03-13 19:09:30.684091	2013-03-13 19:09:30.684091	\N	\N	\N	0.00	\N	\N	balance_due	\N	\N
3	R432054880	65.00	65.00	complete	0.00	1	2013-01-31 21:53:39.510065	2013-02-01 18:26:45.098971	2013-02-01 18:26:44.864284	3	4	0.00	1	backorder	balance_due	spree@example.com	\N
37	R604054887	29.00	34.99	complete	5.99	\N	2013-05-09 19:54:43.249134	2013-05-09 20:00:57.937604	2013-05-09 20:00:57.722187	42	41	34.99	1	shipped	paid	rlara@incaztech.com	\N
17	R874475681	108.00	108.00	cart	0.00	6	2013-03-05 20:07:17.39902	2013-03-05 20:07:17.39902	\N	\N	\N	0.00	\N	\N	balance_due	jarizpe@workforce.com.mx	\N
9	R051522616	20.00	20.00	complete	0.00	1	2013-02-06 22:30:31.80493	2013-02-06 22:32:28.131939	2013-02-06 22:32:28.131939	13	14	0.00	1	pending	balance_due	spree@example.com	\N
43	R511326170	79.00	84.99	payment	5.99	\N	2013-05-29 21:53:11.879558	2013-05-29 21:57:30.960417	\N	47	48	0.00	1	pending	balance_due	rele_91@hotmail.com	\N
28	R813715722	108.00	108.00	address	0.00	\N	2013-03-25 05:42:03.130559	2013-03-25 06:38:41.978996	\N	\N	\N	0.00	\N	\N	balance_due	rele_91@hotmail.com	\N
2	R788037477	40.00	40.00	complete	0.00	1	2013-01-30 17:54:39.064829	2013-01-31 19:58:29.414275	2013-01-31 19:58:29.218518	1	2	0.00	1	backorder	balance_due	spree@example.com	\N
33	R637746617	29.00	30.74	complete	1.74	2	2013-04-22 19:06:20.521831	2013-04-22 19:57:10.932859	2013-04-22 19:57:10.558787	31	33	30.74	1	shipped	paid	spree@example.com	\N
4	R752335082	20.00	20.00	complete	0.00	1	2013-02-01 18:51:37.769762	2013-02-01 18:54:48.587208	2013-02-01 18:54:48.587208	5	6	0.00	1	pending	balance_due	spree@example.com	\N
8	R472067143	0.00	0.00	cart	0.00	\N	2013-02-05 20:43:44.603367	2013-02-05 20:55:01.439035	\N	\N	\N	0.00	\N	\N	paid	\N	\N
49	R736550752	79.00	84.99	payment	5.99	2	2013-07-16 23:26:24.918783	2013-07-17 06:55:12.665449	\N	55	56	0.00	1	pending	balance_due	spree@example.com	\N
44	R822032877	29.00	34.99	payment	5.99	\N	2013-05-29 22:25:51.578393	2013-05-29 22:31:57.298413	\N	49	50	0.00	1	pending	balance_due	robertoprueba@gmail.com	\N
29	R243177434	87.00	91.35	payment	4.35	39	2013-03-26 05:44:45.274301	2013-03-27 17:03:56.671991	\N	25	26	0.00	1	pending	balance_due	roberto.laraesp@gmail.com	\N
20	R162678338	79.00	82.95	payment	3.95	4	2013-03-13 00:46:22.463101	2013-03-15 19:09:38.460289	\N	21	22	0.00	1	pending	balance_due	rlara@incaztech.com	\N
32	R550428532	108.00	108.00	cart	0.00	\N	2013-04-22 19:05:04.863602	2013-04-22 19:05:04.863602	\N	\N	\N	0.00	\N	\N	balance_due	\N	\N
31	R222850122	0.00	0.00	cart	0.00	\N	2013-04-02 20:39:40.923445	2013-04-02 20:39:40.923445	\N	\N	\N	0.00	\N	\N	\N	\N	\N
46	R033088702	29.00	29.00	address	0.00	\N	2013-06-25 20:37:21.46997	2013-06-25 20:37:44.493731	\N	\N	\N	0.00	\N	\N	balance_due	rele_91@hotmail.com	\N
42	R023756577	29.00	29.00	address	0.00	\N	2013-05-15 19:21:12.135738	2013-05-15 19:22:12.514564	\N	\N	\N	0.00	\N	\N	balance_due	gtovar@incaztech.com	\N
48	R803577764	29.00	29.00	address	0.00	\N	2013-07-16 21:49:48.006323	2013-07-16 21:50:12.630878	\N	\N	\N	0.00	\N	\N	balance_due	rele_91@hotmail.com	\N
39	R716705288	29.00	34.99	complete	5.99	\N	2013-05-09 20:33:56.374503	2013-05-09 20:35:27.918578	2013-05-09 20:35:27.850534	45	46	34.99	1	shipped	paid	rlara@incaztech.com	\N
38	R645154241	58.00	63.99	complete	5.99	\N	2013-05-09 20:10:12.896048	2013-05-09 20:15:15.508836	2013-05-09 20:15:15.379089	43	44	63.99	1	shipped	paid	rlara@incaztech.com	\N
47	R533780386	29.00	34.99	delivery	5.99	\N	2013-06-26 15:11:26.494829	2013-06-26 17:44:20.091459	\N	51	52	0.00	\N	pending	balance_due	rele_91@hotmail.com	\N
\.


--
-- Name: spree_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_orders_id_seq', 49, true);


--
-- Data for Name: spree_organizations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_organizations (id, name, description, country, contact, email, phonenumber, link_twitter, link_facebook, video, webpage, contact_name, contact_number, exemption_number, created_at, updated_at, photo_file_name, photo_content_type, photo_file_size, photo_updated_at, address, state, city, zip) FROM stdin;
2	Yanapana	Pellentesque rutrum laoreet ligula vel fringilla. Nullam orci nisi, aliquam quis laoreet quis, commodo at risus. Duis non nisi lectus. Aenean nec enim nunc. Nam eu dolor mi, viverra fermentum lectus. Maecenas id orci id dui porttitor bibendum sed id dolor. Vivamus blandit dignissim est, nec rhoncus odio tristique non. Etiam elementum gravida sem vitae mollis. 	Mexico	Colin	acolin@incaztech.com	\N			\N	www.incaztech.com	Arnoldo	8278247	2323131	2013-02-13 20:19:06.044429	2013-02-25 21:36:30.05063	apple.jpeg	image/jpeg	3238	2013-02-25 21:36:29.305292	ervrspos#23	nuevo leon	monterrey	643630
1	Incaztech	Etiam ut sem a felis imperdiet convallis a sit amet mi. Donec nec ligula orci, at luctus felis. Proin sit amet pellentesque ipsum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet leo ac tortor pharetra elementum. Etiam orci nisi, sodales a bibendum placerat, rhoncus eget elit. Nam placerat sollicitudin urna quis vestibulum. Suspendisse vitae lectus sem. In consectetur, magna eu pretium accumsan, odio justo pharetra risus, vitae pellentesque magna sapien id dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse consequat semper metus sit amet dignissim. Aenean nunc neque, facilisis vel rutrum id, dignissim id orci.	United States	acolin@incaztech.com	rlara@incaztech.com	\N	https://twitter.com/roberto_laraesp	https://www.facebook.com/incaztechFB?ref=ts&fref=ts	\N	http://www.incaztech.com	Arnoldo colin	83337295	123233	2013-01-25 06:52:24.876615	2013-04-02 17:27:03.45359	incaztech.png	image/png	954	2013-01-31 18:37:10.190364	Melchor Muzquiz #2225	Texas	Houston	93298
\.


--
-- Name: spree_organizations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_organizations_id_seq', 2, true);


--
-- Data for Name: spree_payment_methods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_payment_methods (id, type, name, description, active, environment, created_at, updated_at, deleted_at, display_on) FROM stdin;
1	Spree::Gateway::PayPal	Paypal		t	development	2013-01-31 19:50:14.137949	2013-03-15 21:22:52.242834	2013-03-15 21:22:52.242834	
4	Spree::Gateway::Banwire	PruebaMail		t	development	2013-05-09 19:53:32.107714	2013-05-09 19:53:32.107714	\N	
3	Spree::BillingIntegration::PaypalExpress	Paypal		t	development	2013-04-22 18:59:29.624023	2013-07-17 06:52:51.690346	\N	
2	Spree::Gateway::PayPal	Credit Card		t	development	2013-03-15 21:23:05.706278	2013-07-17 06:54:30.370675	\N	
\.


--
-- Name: spree_payment_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_payment_methods_id_seq', 4, true);


--
-- Data for Name: spree_payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_payments (id, amount, order_id, created_at, updated_at, source_id, source_type, payment_method_id, state, response_code, avs_response) FROM stdin;
2	40.00	2	2013-01-31 19:58:21.850859	2013-01-31 19:58:29.047074	2	Spree::CreditCard	1	pending	83S213185V151752B	X
3	65.00	3	2013-02-01 18:26:36.365136	2013-02-01 18:26:44.794134	3	Spree::CreditCard	1	pending	0JL96345307231044	X
4	20.00	4	2013-02-01 18:54:41.283516	2013-02-01 18:54:48.416258	4	Spree::CreditCard	1	pending	76G017139C203594K	X
6	20.00	5	2013-02-01 21:30:17.369176	2013-02-01 21:30:25.377505	6	Spree::CreditCard	1	pending	0VH270695Y797815M	X
53	34.99	37	2013-05-09 20:00:55.968341	2013-05-09 20:00:57.366551	42	Spree::CreditCard	4	completed	test12345	\N
54	63.99	38	2013-05-09 20:15:13.791822	2013-05-09 20:15:15.185601	43	Spree::CreditCard	4	completed	test12345	\N
55	34.99	39	2013-05-09 20:35:26.197146	2013-05-09 20:35:27.642888	44	Spree::CreditCard	4	completed	test12345	\N
13	20.00	6	2013-02-02 18:12:30.500717	2013-02-02 18:12:40.764264	13	Spree::CreditCard	1	pending	6SB80000GX081552V	X
14	20.00	7	2013-02-06 22:27:55.265004	2013-02-06 22:28:04.266689	14	Spree::CreditCard	1	pending	3UU280427M014474P	X
15	20.00	9	2013-02-06 22:32:20.760028	2013-02-06 22:32:27.937496	15	Spree::CreditCard	1	pending	7WD218095P6783817	X
16	100.80	10	2013-02-13 17:33:20.958105	2013-02-13 17:33:30.671339	16	Spree::CreditCard	1	pending	4BD39361PX0690922	X
20	82.95	20	2013-03-15 19:13:58.1479	2013-03-15 19:13:58.1479	20	Spree::CreditCard	1	checkout	\N	\N
42	30.74	33	2013-04-22 19:57:09.777633	2013-04-22 19:57:10.262072	1	Spree::PaypalAccount	3	completed	16011125KS013612T	\N
\.


--
-- Name: spree_payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_payments_id_seq', 57, true);


--
-- Data for Name: spree_paypal_accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_paypal_accounts (id, email, payer_id, payer_country, payer_status) FROM stdin;
1	robertoprueba@gmail.com	UGKHN4EEKURVQ	US	verified
\.


--
-- Name: spree_paypal_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_paypal_accounts_id_seq', 1, true);


--
-- Data for Name: spree_pending_promotions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_pending_promotions (id, user_id, promotion_id) FROM stdin;
\.


--
-- Name: spree_pending_promotions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_pending_promotions_id_seq', 1, false);


--
-- Data for Name: spree_preferences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_preferences (id, name, owner_id, owner_type, value, created_at, updated_at, key, value_type) FROM stdin;
12	\N	\N	\N	gtovar-facilitator_api1.incaztech.com	2013-01-31 19:54:31.677581	2013-03-12 21:38:30.175432	spree/gateway/pay_pal/login/1	string
13	\N	\N	\N	1363122605	2013-01-31 19:54:31.715726	2013-03-12 21:38:30.180235	spree/gateway/pay_pal/password/1	string
11	\N	\N	\N		2013-01-25 21:11:09.552871	2013-04-15 22:05:32.35719	spree/app_configuration/s3_protocol	string
14	\N	\N	\N	AXIBMI95vcPjXpkwe1VtJ1IEE9FHAk6pi1E90k9gkyn1RCFZ8mdkn.Gm	2013-01-31 19:54:31.722504	2013-03-12 21:38:30.183801	spree/gateway/pay_pal/signature/1	string
15	\N	\N	\N		2013-01-31 19:54:31.730071	2013-03-12 21:38:30.188339	spree/gateway/pay_pal/currency_code/1	string
16	\N	\N	\N	test	2013-01-31 19:54:31.737284	2013-03-12 21:38:30.192579	spree/gateway/pay_pal/server/1	string
17	\N	\N	\N	t	2013-01-31 19:54:31.744078	2013-03-12 21:38:30.19672	spree/gateway/pay_pal/test_mode/1	boolean
33	\N	\N	\N	roberto.laraesp-facilitator_api1.gmail.com	2013-03-15 21:28:47.03278	2013-07-17 06:54:30.347157	spree/gateway/pay_pal/login/2	string
34	\N	\N	\N	1366478163	2013-03-15 21:28:47.165524	2013-07-17 06:54:30.352419	spree/gateway/pay_pal/password/2	string
52	\N	\N	\N	917332791	2013-04-22 19:02:19.696869	2013-05-29 22:13:11.579649	spree/billing_integration/paypal_express/password/3	password
35	\N	\N	\N	Az8SbDdxn507udkPT2ziNRdrN4xoAxzCNbgIdse8aPu-0UObYUJVDx1T	2013-03-15 21:28:47.171318	2013-07-17 06:54:30.356533	spree/gateway/pay_pal/signature/2	string
41	\N	\N	\N	spree, demo	2013-03-15 22:15:09.624071	2013-04-22 19:54:06.427416	spree/app_configuration/default_meta_keywords	string
64	\N	\N	\N	t	2013-05-09 19:54:05.600116	2013-05-09 19:54:05.600116	spree/gateway/banwire/test_mode/4	boolean
53	\N	\N	\N	Az8SbDdxn507udkPT2ziNRdrN4xoAxzCNbgIdse8aPu-0UObYUJVDx1T	2013-04-22 19:02:19.705	2013-07-17 06:52:51.65687	spree/billing_integration/paypal_express/signature/3	string
36	\N	\N	\N	USD	2013-03-15 21:28:47.176772	2013-07-17 06:54:30.36054	spree/gateway/pay_pal/currency_code/2	string
18	\N	\N	\N	t	2013-02-07 20:40:05.401231	2013-02-07 20:42:44.672449	spree/app_configuration/show_zero_stock_products	boolean
19	\N	\N	\N	f	2013-02-07 20:40:05.590574	2013-02-07 20:42:44.703768	spree/app_configuration/allow_backorders	boolean
37	\N	\N	\N	test	2013-03-15 21:28:47.183384	2013-07-17 06:54:30.364201	spree/gateway/pay_pal/server/2	string
38	\N	\N	\N	t	2013-03-15 21:28:47.190228	2013-07-17 06:54:30.367845	spree/gateway/pay_pal/test_mode/2	boolean
1	\N	\N	\N	Yanapana	2013-01-25 06:35:23.78603	2013-08-13 21:59:08.293832	spree/app_configuration/site_name	string
39	\N	\N	\N	t	2013-03-15 21:45:56.163259	2013-08-13 21:59:08.390759	spree/app_configuration/auto_capture	boolean
2	\N	\N	\N	yanapana.png	2013-01-25 06:35:23.879841	2013-08-13 21:59:08.42133	spree/app_configuration/logo	string
42	\N	\N	\N	Spree demo site	2013-03-15 22:15:09.642177	2013-04-22 19:54:06.443026	spree/app_configuration/default_meta_description	string
43	\N	\N	\N	 demo.spreecommerce.com	2013-03-15 22:15:09.66015	2013-04-22 19:54:06.476293	spree/app_configuration/site_url	string
44	\N	\N	\N	t	2013-03-15 22:15:09.673747	2013-04-22 19:54:06.50694	spree/app_configuration/allow_ssl_in_production	boolean
45	\N	\N	\N	t	2013-03-15 22:15:09.750561	2013-04-22 19:54:06.53013	spree/app_configuration/allow_ssl_in_staging	boolean
46	\N	\N	\N	f	2013-03-15 22:15:09.795278	2013-04-22 19:54:06.561865	spree/app_configuration/allow_ssl_in_development_and_test	boolean
3	\N	\N	\N	{"mini":"48x48>","small":"85x85>","product":"306x407!","large":"600x600>","org":"95x63!","prodsize":"360x480!","share_photo":"200x200!"}	2013-01-25 21:11:09.126775	2013-04-15 22:05:31.603723	spree/app_configuration/attachment_styles	string
4	\N	\N	\N	:rails_root/public/spree/products/:id/:style/:basename.:extension	2013-01-25 21:11:09.209814	2013-04-15 22:05:31.675602	spree/app_configuration/attachment_path	string
5	\N	\N	\N	/spree/products/:id/:style/:basename.:extension	2013-01-25 21:11:09.275386	2013-04-15 22:05:31.786364	spree/app_configuration/attachment_default_url	string
6	\N	\N	\N	product	2013-01-25 21:11:09.317583	2013-04-15 22:05:31.859576	spree/app_configuration/attachment_default_style	string
7	\N	\N	\N	f	2013-01-25 21:11:09.377352	2013-04-15 22:05:31.90831	spree/app_configuration/use_s3	boolean
8	\N	\N	\N		2013-01-25 21:11:09.419979	2013-04-15 22:05:32.233362	spree/app_configuration/s3_access_key	string
9	\N	\N	\N		2013-01-25 21:11:09.462934	2013-04-15 22:05:32.273321	spree/app_configuration/s3_secret	string
10	\N	\N	\N		2013-01-25 21:11:09.507902	2013-04-15 22:05:32.305197	spree/app_configuration/s3_bucket	string
47	\N	\N	\N	t	2013-03-15 22:15:09.849157	2013-04-22 19:54:06.598049	spree/app_configuration/check_for_spree_alerts	boolean
48	\N	\N	\N	t	2013-03-15 22:15:10.044013	2013-04-22 19:54:06.61988	spree/app_configuration/display_currency	boolean
49	\N	\N	\N	USD	2013-03-15 22:15:10.172033	2013-04-22 19:54:06.644614	spree/app_configuration/currency	string
60	\N	\N	\N	5.99	2013-05-06 21:12:01.475195	2013-05-06 21:12:24.67316	spree/calculator/flat_rate/amount/3	decimal
40	\N	\N	\N		2013-03-15 22:15:09.560707	2013-04-22 19:54:06.273056	spree/app_configuration/default_seo_title	string
62	\N	\N	\N	desarrollo	2013-05-09 19:54:05.515897	2013-05-09 19:54:05.515897	spree/gateway/banwire/login/4	string
61	\N	\N	\N	8.99	2013-05-06 21:13:19.615241	2013-05-06 21:13:19.615241	spree/calculator/flat_rate/amount/4	decimal
63	\N	\N	\N	test	2013-05-09 19:54:05.589287	2013-05-09 19:54:05.589287	spree/gateway/banwire/server/4	string
65	\N	\N	\N	t	2013-05-09 20:21:15.493751	2013-05-09 20:32:54.412682	spree/mail_method/enable_mail_delivery/2	boolean
66	\N	\N	\N	no-reply@example.com	2013-05-09 20:21:15.501684	2013-05-09 20:32:54.416417	spree/mail_method/mails_from/2	string
67	\N	\N	\N	spree@example.com	2013-05-09 20:21:15.50819	2013-05-09 20:32:54.420894	spree/mail_method/mail_bcc/2	string
68	\N	\N	\N		2013-05-09 20:21:15.514524	2013-05-09 20:32:54.424393	spree/mail_method/intercept_email/2	string
69	\N	\N	\N	localhost	2013-05-09 20:21:15.609246	2013-05-09 20:32:54.427649	spree/mail_method/mail_domain/2	string
70	\N	\N	\N	localhost	2013-05-09 20:21:15.615819	2013-05-09 20:32:54.430834	spree/mail_method/mail_host/2	string
54	\N	\N	\N	f	2013-04-22 19:02:19.710259	2013-07-17 06:52:51.663856	spree/billing_integration/paypal_express/review/3	boolean
55	\N	\N	\N	f	2013-04-22 19:02:19.71549	2013-07-17 06:52:51.66997	spree/billing_integration/paypal_express/no_shipping/3	boolean
50	\N	\N	\N	USD	2013-04-22 19:02:19.50302	2013-07-17 06:52:51.577895	spree/billing_integration/paypal_express/currency/3	string
51	\N	\N	\N	roberto.laraesp-facilitator_api1.gmail.com	2013-04-22 19:02:19.687698	2013-07-17 06:52:51.583471	spree/billing_integration/paypal_express/login/3	string
56	\N	\N	\N	f	2013-04-22 19:02:19.724243	2013-07-17 06:52:51.674932	spree/billing_integration/paypal_express/cart_checkout/3	boolean
57	\N	\N	\N	f	2013-04-22 19:02:19.730607	2013-07-17 06:52:51.678771	spree/billing_integration/paypal_express/allow_guest_checkout/3	boolean
58	\N	\N	\N	test	2013-04-22 19:02:19.736395	2013-07-17 06:52:51.682853	spree/billing_integration/paypal_express/server/3	string
71	\N	\N	\N	1025	2013-05-09 20:21:15.622445	2013-05-09 20:32:54.434143	spree/mail_method/mail_port/2	integer
72	\N	\N	\N	None	2013-05-09 20:21:15.63325	2013-05-09 20:32:54.438702	spree/mail_method/secure_connection_type/2	string
73	\N	\N	\N	none	2013-05-09 20:21:15.640078	2013-05-09 20:32:54.442474	spree/mail_method/mail_auth_type/2	string
74	\N	\N	\N	spree@example.com	2013-05-09 20:21:15.646296	2013-05-09 20:32:54.447419	spree/mail_method/smtp_username/2	string
75	\N	\N	\N	spree123	2013-05-09 20:21:15.653036	2013-05-09 20:32:54.454093	spree/mail_method/smtp_password/2	string
76	\N	\N	\N	prueba de yanapana aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa	2013-07-04 22:04:08.382686	2013-07-04 22:05:24.450034	spree/app_configuration/text_home	string
59	\N	\N	\N	t	2013-04-22 19:02:19.742296	2013-07-17 06:52:51.687297	spree/billing_integration/paypal_express/test_mode/3	boolean
\.


--
-- Name: spree_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_preferences_id_seq', 76, true);


--
-- Data for Name: spree_product_option_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_product_option_types (id, "position", product_id, option_type_id, created_at, updated_at) FROM stdin;
1	1	1	1	2013-01-25 07:02:16.542708	2013-01-25 07:02:16.542708
2	1	2	1	2013-01-29 22:44:21.975974	2013-01-29 22:44:21.975974
3	1	3	1	2013-01-31 01:10:12.159198	2013-01-31 01:10:12.159198
4	1	6	1	2013-02-13 02:27:03.518971	2013-02-13 02:27:03.518971
5	1	7	1	2013-02-13 02:31:56.829118	2013-02-13 02:31:56.829118
6	1	8	1	2013-03-04 20:16:18.902028	2013-03-04 20:16:18.902028
7	1	9	1	2013-03-14 22:24:55.046497	2013-03-14 22:24:55.046497
8	1	10	1	2013-04-01 19:13:38.536824	2013-04-01 19:13:38.536824
9	1	11	1	2013-04-01 20:47:59.236877	2013-04-01 20:47:59.236877
10	1	12	1	2013-04-01 20:49:17.494199	2013-04-01 20:49:17.494199
11	1	5	1	2013-04-15 21:05:53.840001	2013-04-15 21:05:53.840001
12	2	8	2	2013-04-17 22:19:09.941025	2013-04-17 22:19:09.941025
13	1	13	2	2013-04-19 19:57:40.772795	2013-04-19 19:57:40.772795
\.


--
-- Name: spree_product_option_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_product_option_types_id_seq', 13, true);


--
-- Data for Name: spree_product_properties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_product_properties (id, value, product_id, property_id, created_at, updated_at) FROM stdin;
13	50% Polyester 25% Cotton 25% Rayon - Extremely soft, comfortable, and Slouchy. Fashionable fit and true to size.	10	7	2013-04-01 19:13:38.317907	2013-04-01 19:16:26.874634
14	50% Polyester 25% Cotton 25% Rayon - Extremely soft, comfortable, and Slouchy. Fashionable fit and true to size.	11	7	2013-04-01 20:47:59.239742	2013-04-01 20:47:59.239742
19	Womans Dolman	12	13	2013-04-01 20:49:17.482998	2013-04-01 21:07:15.769418
18	Tri-Blend	12	12	2013-04-01 20:49:17.481013	2013-04-01 21:07:15.771653
17	Waterbased	12	11	2013-04-01 20:49:17.478819	2013-04-01 21:07:15.773632
16	Wash Cold, Dry Low	12	10	2013-04-01 20:49:17.47581	2013-04-01 21:07:15.775409
15	50% Polyester 25% Cotton 25% Rayon - Extremely soft, comfortable, and Slouchy. Fashionable fit and true to size.	12	7	2013-04-01 20:49:17.472879	2013-04-01 21:07:15.777568
\.


--
-- Name: spree_product_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_product_properties_id_seq', 19, true);


--
-- Data for Name: spree_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_products (id, name, description, available_on, deleted_at, permalink, meta_description, meta_keywords, tax_category_id, shipping_category_id, created_at, updated_at, count_on_hand, cause_id, inspiration_behind) FROM stdin;
13	Probando Prototype2	\N	2013-04-12 05:00:00	\N	probando-prototype2	\N	\N	\N	\N	2013-04-19 19:57:40.506646	2013-04-19 19:57:40.877695	0	8	\N
2	Camiseta		2013-01-21 06:00:00	\N	camiseta			\N	\N	2013-01-29 22:44:07.581356	2013-02-17 18:58:22.623524	0	1	\N
7	PlayeraPopeye	Donec pretium viverra odio, eget vestibulum nibh pretium ut. Duis pretium metus ut quam accumsan luctus. Curabitur id purus in tortor eleifend venenatis nec a lacus. Sed et tortor ante. Morbi dictum commodo quam, vel imperdiet diam egestas non. Cras pharetra est justo. Phasellus lobortis neque elit, at bibendum tellus. Morbi non eros nulla. Integer euismod aliquet rutrum. Vivamus ante neque, adipiscing non pellentesque ac, ultricies ut nisi. Vestibulum est nunc, sodales non viverra et, bibendum vitae turpis.	2013-01-21 06:00:00	\N	playerapopeye			\N	\N	2013-02-13 02:31:13.923995	2013-02-13 02:32:41.787469	0	1	Morbi in mi ut nulla consequat placerat vel ac neque. Cras congue, ante ac varius suscipit, neque justo euismod felis, quis aliquam nulla lorem a nulla. Cras risus diam, congue tincidunt lacinia vitae, rhoncus quis urna. Sed vel consectetur nisi. In ante quam, mattis ac luctus ac, condimentum a veli
3	Camiseta3		2013-01-21 06:00:00	\N	camiseta3			\N	\N	2013-01-30 22:04:18.903671	2013-02-13 17:33:30.839424	2	1	Ut ullamcorper suscipit sem, sed convallis ante aliquam sit amet. Nulla eget purus sit amet elit hendrerit imperdiet. Praesent tristique nisi arcu, ut mattis nibh. Suspendisse cursus magna at metus ullamcorper ultricies. Nullam vitae fringilla sem. Integer congue erat ac magna facilisis feugiat. Duis rutrum odio id erat rutrum non fermentum lacus tincidunt. Maecenas erat mi, fringilla eget condimentum ultrices, varius at nunc. Fusce ac nisi nibh. 
6	Polera		2013-01-21 06:00:00	\N	polera-1			\N	\N	2013-02-13 02:20:03.880326	2013-02-13 17:33:31.009138	0	1	 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec semper odio vel enim ultrices tristique. Nunc a mauris sapien. Aliquam luctus, erat eget imperdiet commodo, erat elit rhoncus mauris, sit amet sodales tellus erat at massa. Morbi id nulla metus. Duis sit amet sem accumsan est sollicitudin adipiscing in fermentum arcu. Phasellus non ligula magna. Vivamus posuere accumsan pretium. Donec ante urna, laoreet quis lacinia sit amet, ultrices ut nisi.\r\n\r\n
9	COPY OF PlayeraPopeyeII		2013-03-11 06:00:00	\N	playerapopeyeii-1			\N	\N	2013-03-14 22:24:54.967638	2013-05-09 20:35:27.86314	0	8	
8	PlayeraPopeyeII	Robertooooooooooooooooooo<br/>\r\naaaaaaaaaaaaaaaaaaaaaaaaaa	2013-07-11 20:19:00	\N	playerapopeyeii			\N	\N	2013-03-04 20:06:07.424994	2013-07-16 19:26:42.102464	4	8	
4	Playera6	\N	2013-01-21 06:00:00	2013-01-30 22:50:49.880259	playera6	\N	\N	\N	\N	2013-01-30 22:07:01.979931	2013-01-30 22:07:01.992393	0	1	\N
1	Polera-Somaly		2013-01-21 06:00:00	2013-01-30 22:50:54.080791	polera-somaly			\N	\N	2013-01-25 06:57:03.38927	2013-01-29 22:32:36.293211	15	1	\N
11	COPY OF Probando Prototype	\N	2013-03-11 06:00:00	2013-04-01 20:48:30.279805	probando-prototype-1	\N	\N	\N	\N	2013-04-01 20:47:59.231637	2013-04-01 20:47:59.31521	0	8	\N
12	PlayeraDePrueba	\N	2013-03-11 06:00:00	\N	playeradeprueba	\N	\N	\N	\N	2013-04-01 20:49:17.458508	2013-04-01 20:49:17.548565	0	8	\N
5	NuevaP		2013-03-29 06:00:00	\N	nuevap			\N	\N	2013-01-30 22:51:13.567529	2013-04-15 21:05:54.021772	0	1	
10	Probando Prototype	\N	2013-03-11 06:00:00	2013-04-19 19:56:38.940921	probando-prototype	\N	\N	\N	\N	2013-04-01 19:13:38.113414	2013-04-01 19:17:24.573115	0	8	\N
\.


--
-- Name: spree_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_products_id_seq', 13, true);


--
-- Data for Name: spree_products_promotion_rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_products_promotion_rules (product_id, promotion_rule_id) FROM stdin;
\.


--
-- Data for Name: spree_products_taxons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_products_taxons (product_id, taxon_id) FROM stdin;
\.


--
-- Data for Name: spree_promotion_action_line_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_promotion_action_line_items (id, promotion_action_id, variant_id, quantity) FROM stdin;
\.


--
-- Name: spree_promotion_action_line_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_promotion_action_line_items_id_seq', 1, false);


--
-- Data for Name: spree_promotion_actions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_promotion_actions (id, activator_id, "position", type) FROM stdin;
\.


--
-- Name: spree_promotion_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_promotion_actions_id_seq', 1, false);


--
-- Data for Name: spree_promotion_rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_promotion_rules (id, activator_id, user_id, product_group_id, type, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_promotion_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_promotion_rules_id_seq', 1, false);


--
-- Data for Name: spree_promotion_rules_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_promotion_rules_users (user_id, promotion_rule_id) FROM stdin;
\.


--
-- Data for Name: spree_properties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_properties (id, name, presentation, created_at, updated_at) FROM stdin;
7	Product Info	Product Info	2013-04-01 19:11:41.088169	2013-04-01 19:11:41.088169
10	Care Instructions	Care Instructions	2013-04-01 20:45:58.443484	2013-04-01 20:45:58.443484
11	Ink	Ink	2013-04-01 20:46:14.784024	2013-04-01 20:46:14.784024
12	shirt_fabric	Fabric	2013-04-01 20:46:37.397726	2013-04-01 20:46:37.397726
13	Shirt_cut	Shirt Cut	2013-04-01 20:46:49.299654	2013-04-01 20:46:49.299654
14	Small-Chest	Small-Chest	2013-04-14 18:07:46.643068	2013-04-15 16:35:24.238434
15	Medium-Chest	Medium-Chest	2013-04-14 18:08:14.356234	2013-04-15 16:35:43.129346
16	Large-Chest	Large-Chest	2013-04-14 18:12:16.906754	2013-04-15 16:35:57.715372
17	Small-Waist	Small-Waist	2013-04-14 18:12:53.903756	2013-04-15 16:45:38.74997
18	Medium-Waist	Medium-Waist	2013-04-14 18:13:34.9578	2013-04-15 16:45:56.415332
19	Large-Waist	Large-Waist	2013-04-14 18:14:18.77925	2013-04-15 16:46:17.815762
\.


--
-- Name: spree_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_properties_id_seq', 19, true);


--
-- Data for Name: spree_properties_prototypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_properties_prototypes (prototype_id, property_id) FROM stdin;
\.


--
-- Data for Name: spree_prototypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_prototypes (id, name, created_at, updated_at) FROM stdin;
2	Medidas-Hombre	2013-04-14 18:15:55.178055	2013-04-17 22:28:29.837117
\.


--
-- Name: spree_prototypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_prototypes_id_seq', 2, true);


--
-- Data for Name: spree_return_authorizations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_return_authorizations (id, number, state, amount, order_id, reason, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_return_authorizations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_return_authorizations_id_seq', 1, false);


--
-- Data for Name: spree_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_roles (id, name) FROM stdin;
930089099	admin
770229923	user
\.


--
-- Name: spree_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_roles_id_seq', 930089100, false);


--
-- Data for Name: spree_roles_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_roles_users (role_id, user_id) FROM stdin;
930089099	1
930089099	1
930089099	2
930089099	2
\.


--
-- Data for Name: spree_shipments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_shipments (id, tracking, number, cost, shipped_at, order_id, shipping_method_id, address_id, created_at, updated_at, state) FROM stdin;
25	\N	H85581606704	\N	\N	44	1	50	2013-05-29 22:27:00.032142	2013-05-29 22:27:00.032142	pending
26	\N	H14187702035	\N	\N	47	1	52	2013-06-26 17:44:20.545836	2013-06-26 17:44:20.545836	pending
7	\N	H22316318010	\N	\N	9	1	14	2013-02-06 22:32:01.774464	2013-02-06 22:32:01.774464	pending
1	\N	H70734132104	\N	\N	2	1	2	2013-01-31 19:55:23.597493	2013-01-31 19:55:23.597493	pending
2	\N	H34427686703	\N	\N	3	1	4	2013-01-31 22:40:31.838256	2013-01-31 22:40:31.838256	pending
23	H86308278574	H86308278574	\N	2013-05-13 15:56:50.792723	39	1	46	2013-05-09 20:34:51.746061	2013-05-13 15:56:50.792723	shipped
3	\N	H72133708664	\N	\N	4	1	6	2013-02-01 18:54:09.600643	2013-02-01 18:54:09.600643	pending
5	\N	H02746116778	\N	\N	6	1	10	2013-02-01 23:06:05.783755	2013-02-01 23:06:05.783755	pending
22	123456789	H70741015635	\N	2013-05-13 18:53:39.343662	38	1	44	2013-05-09 20:14:43.273646	2013-05-13 18:53:39.343662	shipped
4	\N	H73634117328	\N	\N	5	1	8	2013-02-01 21:14:55.104889	2013-02-01 21:14:55.104889	pending
11	\N	H70350447418	\N	\N	10	1	16	2013-02-13 17:32:55.816547	2013-02-13 17:32:55.816547	pending
21	987654321	H78354676068	\N	2013-05-13 18:58:27.031549	37	1	41	2013-05-09 19:55:58.034299	2013-05-13 18:58:27.031549	shipped
6	\N	H70838103153	\N	\N	7	1	12	2013-02-04 03:18:59.970389	2013-02-04 03:18:59.970389	pending
12		H31368585877	\N	\N	18	1	18	2013-03-12 21:14:50.497101	2013-03-12 21:17:24.738942	pending
15	\N	H37654130371	\N	\N	29	1	26	2013-03-27 17:03:56.81438	2013-03-27 17:03:56.81438	pending
17	ABCDEFGXXXX	H01324404728	\N	2013-05-13 19:12:39.779664	33	1	32	2013-04-22 19:11:01.4525	2013-05-13 19:12:39.779664	shipped
13	\N	H04443486704	\N	\N	20	1	22	2013-03-15 19:09:38.617058	2013-03-15 19:09:38.617058	pending
24	\N	H30274813726	\N	\N	43	1	48	2013-05-29 21:57:31.054583	2013-05-29 21:57:31.054583	pending
28	\N	H50246662144	\N	\N	49	1	56	2013-07-17 06:29:55.559838	2013-07-17 06:29:55.559838	pending
\.


--
-- Name: spree_shipments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_shipments_id_seq', 28, true);


--
-- Data for Name: spree_shipping_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_shipping_categories (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_shipping_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_shipping_categories_id_seq', 1, false);


--
-- Data for Name: spree_shipping_methods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_shipping_methods (id, name, zone_id, created_at, updated_at, display_on, shipping_category_id, match_none, match_all, match_one, deleted_at) FROM stdin;
1	USPS	2	2013-01-31 19:40:47.508451	2013-03-27 21:59:26.85036		\N	f	f	f	\N
2	USPS_All	3	2013-01-31 19:47:35.474987	2013-03-27 21:59:59.956198		\N	f	f	f	\N
\.


--
-- Name: spree_shipping_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_shipping_methods_id_seq', 2, true);


--
-- Data for Name: spree_skrill_transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_skrill_transactions (id, email, amount, currency, transaction_id, customer_id, payment_type, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_skrill_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_skrill_transactions_id_seq', 1, false);


--
-- Data for Name: spree_state_changes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_state_changes (id, name, previous_state, stateful_id, user_id, created_at, updated_at, stateful_type, next_state) FROM stdin;
1	payment	balance_due	1	1	2013-01-25 20:59:15.496911	2013-01-25 20:59:15.496911	Spree::Order	paid
2	payment	balance_due	1	1	2013-01-25 20:59:15.600488	2013-01-25 20:59:15.600488	Spree::Order	paid
3	payment	paid	1	1	2013-01-25 21:03:18.815286	2013-01-25 21:03:18.815286	Spree::Order	balance_due
4	payment	balance_due	1	1	2013-01-25 21:05:06.198314	2013-01-25 21:05:06.198314	Spree::Order	paid
5	payment	balance_due	1	1	2013-01-25 21:05:06.275531	2013-01-25 21:05:06.275531	Spree::Order	paid
6	payment	paid	1	1	2013-01-25 21:05:44.884264	2013-01-25 21:05:44.884264	Spree::Order	balance_due
7	payment	balance_due	1	1	2013-01-25 21:17:16.08876	2013-01-25 21:17:16.08876	Spree::Order	paid
8	payment	balance_due	1	1	2013-01-25 21:17:16.170394	2013-01-25 21:17:16.170394	Spree::Order	paid
9	payment	paid	1	1	2013-01-25 21:18:58.638116	2013-01-25 21:18:58.638116	Spree::Order	balance_due
10	payment	balance_due	1	1	2013-01-25 23:15:17.291736	2013-01-25 23:15:17.291736	Spree::Order	paid
11	payment	balance_due	1	1	2013-01-25 23:15:17.492812	2013-01-25 23:15:17.492812	Spree::Order	paid
12	payment	paid	1	1	2013-01-25 23:15:27.908236	2013-01-25 23:15:27.908236	Spree::Order	balance_due
13	payment	balance_due	1	1	2013-01-25 23:20:22.002222	2013-01-25 23:20:22.002222	Spree::Order	paid
14	payment	balance_due	1	1	2013-01-25 23:20:22.106505	2013-01-25 23:20:22.106505	Spree::Order	paid
15	payment	paid	1	1	2013-01-25 23:20:32.942924	2013-01-25 23:20:32.942924	Spree::Order	balance_due
16	payment	balance_due	1	1	2013-01-27 18:13:19.370468	2013-01-27 18:13:19.370468	Spree::Order	paid
17	payment	balance_due	1	1	2013-01-27 18:13:19.56952	2013-01-27 18:13:19.56952	Spree::Order	paid
18	payment	paid	1	1	2013-01-27 18:13:37.413797	2013-01-27 18:13:37.413797	Spree::Order	balance_due
19	payment	balance_due	1	1	2013-01-28 05:11:49.534566	2013-01-28 05:11:49.534566	Spree::Order	paid
20	payment	balance_due	1	1	2013-01-28 05:11:49.669784	2013-01-28 05:11:49.669784	Spree::Order	paid
21	payment	paid	1	1	2013-01-28 05:12:06.215348	2013-01-28 05:12:06.215348	Spree::Order	balance_due
22	payment	balance_due	1	1	2013-01-28 05:13:53.85274	2013-01-28 05:13:53.85274	Spree::Order	paid
23	payment	balance_due	1	1	2013-01-28 05:13:53.938106	2013-01-28 05:13:53.938106	Spree::Order	paid
24	payment	paid	1	1	2013-01-28 05:14:10.981038	2013-01-28 05:14:10.981038	Spree::Order	balance_due
25	payment	balance_due	1	1	2013-01-28 05:16:05.049889	2013-01-28 05:16:05.049889	Spree::Order	paid
26	payment	balance_due	1	1	2013-01-28 05:16:05.13173	2013-01-28 05:16:05.13173	Spree::Order	paid
27	payment	paid	1	1	2013-01-28 05:22:43.940939	2013-01-28 05:22:43.940939	Spree::Order	balance_due
28	payment	balance_due	1	1	2013-01-28 05:24:44.363007	2013-01-28 05:24:44.363007	Spree::Order	paid
29	payment	balance_due	1	1	2013-01-28 05:24:44.467464	2013-01-28 05:24:44.467464	Spree::Order	paid
30	payment	paid	1	1	2013-01-28 05:24:56.376696	2013-01-28 05:24:56.376696	Spree::Order	balance_due
31	payment	balance_due	1	1	2013-01-28 05:44:33.811254	2013-01-28 05:44:33.811254	Spree::Order	paid
32	payment	balance_due	1	1	2013-01-28 05:44:33.895593	2013-01-28 05:44:33.895593	Spree::Order	paid
33	payment	paid	1	1	2013-01-28 05:44:44.417809	2013-01-28 05:44:44.417809	Spree::Order	balance_due
34	payment	balance_due	1	1	2013-01-28 05:45:20.957073	2013-01-28 05:45:20.957073	Spree::Order	paid
35	payment	balance_due	1	1	2013-01-28 05:45:21.031811	2013-01-28 05:45:21.031811	Spree::Order	paid
36	payment	paid	1	1	2013-01-28 05:45:37.61307	2013-01-28 05:45:37.61307	Spree::Order	balance_due
37	payment	balance_due	1	1	2013-01-28 05:54:41.017573	2013-01-28 05:54:41.017573	Spree::Order	paid
38	payment	balance_due	1	1	2013-01-28 05:54:41.09937	2013-01-28 05:54:41.09937	Spree::Order	paid
39	payment	paid	1	1	2013-01-28 05:55:21.815487	2013-01-28 05:55:21.815487	Spree::Order	balance_due
40	payment	balance_due	1	1	2013-01-28 05:55:28.581691	2013-01-28 05:55:28.581691	Spree::Order	paid
41	payment	balance_due	1	1	2013-01-28 05:55:28.677624	2013-01-28 05:55:28.677624	Spree::Order	paid
42	payment	paid	1	1	2013-01-28 19:45:58.59927	2013-01-28 19:45:58.59927	Spree::Order	balance_due
43	payment	balance_due	1	1	2013-01-28 20:03:18.022346	2013-01-28 20:03:18.022346	Spree::Order	paid
44	payment	balance_due	1	1	2013-01-28 20:03:18.225224	2013-01-28 20:03:18.225224	Spree::Order	paid
45	payment	paid	1	1	2013-01-28 20:03:29.683259	2013-01-28 20:03:29.683259	Spree::Order	balance_due
46	payment	balance_due	1	1	2013-01-29 20:13:34.051857	2013-01-29 20:13:34.051857	Spree::Order	paid
47	payment	balance_due	1	1	2013-01-29 20:13:34.174747	2013-01-29 20:13:34.174747	Spree::Order	paid
48	payment	paid	1	1	2013-01-29 20:15:20.811697	2013-01-29 20:15:20.811697	Spree::Order	balance_due
50	shipment	pending	2	1	2013-01-31 19:58:29.38909	2013-01-31 19:58:29.38909	Spree::Order	backorder
51	order	cart	2	1	2013-01-31 19:58:29.974429	2013-01-31 19:58:29.974429	Spree::Order	complete
52	shipment	pending	3	1	2013-02-01 18:26:45.081775	2013-02-01 18:26:45.081775	Spree::Order	backorder
53	order	cart	3	1	2013-02-01 18:26:45.612513	2013-02-01 18:26:45.612513	Spree::Order	complete
54	order	cart	4	1	2013-02-01 18:54:49.179066	2013-02-01 18:54:49.179066	Spree::Order	complete
55	order	cart	5	1	2013-02-01 21:30:25.64299	2013-02-01 21:30:25.64299	Spree::Order	complete
65	order	cart	6	1	2013-02-02 18:12:41.225612	2013-02-02 18:12:41.225612	Spree::Order	complete
66	payment	balance_due	7	1	2013-02-05 20:08:19.333729	2013-02-05 20:08:19.333729	Spree::Order	paid
67	payment	balance_due	7	1	2013-02-05 20:08:19.79484	2013-02-05 20:08:19.79484	Spree::Order	paid
68	payment	paid	7	1	2013-02-05 20:09:11.091378	2013-02-05 20:09:11.091378	Spree::Order	balance_due
69	payment	balance_due	7	1	2013-02-05 20:09:29.081552	2013-02-05 20:09:29.081552	Spree::Order	paid
70	payment	balance_due	7	1	2013-02-05 20:09:29.191469	2013-02-05 20:09:29.191469	Spree::Order	paid
71	payment	paid	7	1	2013-02-05 20:16:09.95409	2013-02-05 20:16:09.95409	Spree::Order	balance_due
72	payment	balance_due	7	1	2013-02-05 20:16:44.261284	2013-02-05 20:16:44.261284	Spree::Order	paid
73	payment	balance_due	7	1	2013-02-05 20:16:44.433769	2013-02-05 20:16:44.433769	Spree::Order	paid
74	payment	paid	7	1	2013-02-05 20:18:00.927182	2013-02-05 20:18:00.927182	Spree::Order	balance_due
75	payment	balance_due	8	\N	2013-02-05 20:47:54.019781	2013-02-05 20:47:54.019781	Spree::Order	paid
76	payment	balance_due	8	\N	2013-02-05 20:47:54.100535	2013-02-05 20:47:54.100535	Spree::Order	paid
77	payment	paid	8	\N	2013-02-05 20:51:07.937624	2013-02-05 20:51:07.937624	Spree::Order	balance_due
78	payment	balance_due	8	\N	2013-02-05 20:53:13.314832	2013-02-05 20:53:13.314832	Spree::Order	paid
79	payment	balance_due	8	\N	2013-02-05 20:53:13.408748	2013-02-05 20:53:13.408748	Spree::Order	paid
80	payment	paid	8	\N	2013-02-05 20:53:35.853058	2013-02-05 20:53:35.853058	Spree::Order	balance_due
81	payment	balance_due	8	\N	2013-02-05 20:55:01.476278	2013-02-05 20:55:01.476278	Spree::Order	paid
82	payment	balance_due	8	\N	2013-02-05 20:55:01.60115	2013-02-05 20:55:01.60115	Spree::Order	paid
83	payment	balance_due	7	1	2013-02-05 20:56:31.381855	2013-02-05 20:56:31.381855	Spree::Order	paid
84	payment	balance_due	7	1	2013-02-05 20:56:31.489867	2013-02-05 20:56:31.489867	Spree::Order	paid
85	payment	paid	7	1	2013-02-06 22:23:54.277943	2013-02-06 22:23:54.277943	Spree::Order	balance_due
86	order	cart	7	1	2013-02-06 22:28:05.241405	2013-02-06 22:28:05.241405	Spree::Order	complete
87	order	cart	9	1	2013-02-06 22:32:28.294981	2013-02-06 22:32:28.294981	Spree::Order	complete
88	payment	balance_due	10	1	2013-02-07 20:06:58.942784	2013-02-07 20:06:58.942784	Spree::Order	paid
89	payment	balance_due	10	1	2013-02-07 20:06:59.127419	2013-02-07 20:06:59.127419	Spree::Order	paid
90	payment	paid	10	1	2013-02-07 20:07:14.701555	2013-02-07 20:07:14.701555	Spree::Order	balance_due
91	payment	balance_due	10	1	2013-02-07 22:10:22.147809	2013-02-07 22:10:22.147809	Spree::Order	paid
92	payment	balance_due	10	1	2013-02-07 22:10:22.256378	2013-02-07 22:10:22.256378	Spree::Order	paid
93	payment	paid	10	1	2013-02-07 22:11:03.423374	2013-02-07 22:11:03.423374	Spree::Order	balance_due
94	payment	balance_due	14	\N	2013-02-11 17:57:51.637751	2013-02-11 17:57:51.637751	Spree::Order	paid
95	payment	balance_due	14	\N	2013-02-11 17:57:51.874606	2013-02-11 17:57:51.874606	Spree::Order	paid
96	payment	paid	14	\N	2013-02-11 17:58:23.639539	2013-02-11 17:58:23.639539	Spree::Order	balance_due
97	payment	balance_due	14	\N	2013-02-11 18:17:24.721799	2013-02-11 18:17:24.721799	Spree::Order	paid
98	payment	balance_due	14	\N	2013-02-11 18:17:24.917608	2013-02-11 18:17:24.917608	Spree::Order	paid
99	payment	paid	14	\N	2013-02-11 18:17:35.605571	2013-02-11 18:17:35.605571	Spree::Order	balance_due
100	payment	balance_due	14	\N	2013-02-11 18:17:46.112594	2013-02-11 18:17:46.112594	Spree::Order	paid
101	payment	balance_due	14	\N	2013-02-11 18:17:46.208552	2013-02-11 18:17:46.208552	Spree::Order	paid
102	payment	paid	14	\N	2013-02-11 18:18:02.434263	2013-02-11 18:18:02.434263	Spree::Order	balance_due
103	payment	balance_due	14	\N	2013-02-11 18:55:49.537666	2013-02-11 18:55:49.537666	Spree::Order	paid
104	payment	balance_due	14	\N	2013-02-11 18:55:49.629429	2013-02-11 18:55:49.629429	Spree::Order	paid
105	payment	paid	14	\N	2013-02-11 19:05:47.770413	2013-02-11 19:05:47.770413	Spree::Order	balance_due
106	payment	balance_due	14	\N	2013-02-11 19:25:59.545945	2013-02-11 19:25:59.545945	Spree::Order	paid
107	payment	balance_due	14	\N	2013-02-11 19:25:59.735216	2013-02-11 19:25:59.735216	Spree::Order	paid
108	payment	paid	14	\N	2013-02-11 19:26:18.041815	2013-02-11 19:26:18.041815	Spree::Order	balance_due
109	payment	balance_due	10	1	2013-02-12 06:09:49.546418	2013-02-12 06:09:49.546418	Spree::Order	paid
110	payment	balance_due	10	1	2013-02-12 06:09:49.760262	2013-02-12 06:09:49.760262	Spree::Order	paid
111	payment	paid	10	1	2013-02-12 06:10:00.664728	2013-02-12 06:10:00.664728	Spree::Order	balance_due
112	payment	balance_due	10	1	2013-02-12 23:02:56.382521	2013-02-12 23:02:56.382521	Spree::Order	paid
113	payment	balance_due	10	1	2013-02-12 23:02:56.463555	2013-02-12 23:02:56.463555	Spree::Order	paid
114	payment	paid	10	1	2013-02-12 23:03:14.110803	2013-02-12 23:03:14.110803	Spree::Order	balance_due
115	order	cart	10	1	2013-02-13 17:33:31.696913	2013-02-13 17:33:31.696913	Spree::Order	complete
116	payment	balance_due	15	1	2013-02-16 15:26:56.113155	2013-02-16 15:26:56.113155	Spree::Order	paid
117	payment	balance_due	15	1	2013-02-16 15:26:56.264513	2013-02-16 15:26:56.264513	Spree::Order	paid
118	payment	paid	15	1	2013-02-16 16:38:07.786732	2013-02-16 16:38:07.786732	Spree::Order	balance_due
135	payment	balance_due	33	2	2013-04-22 19:57:10.334784	2013-04-22 19:57:10.334784	Spree::Order	paid
136	payment	balance_due	33	2	2013-04-22 19:57:10.830519	2013-04-22 19:57:10.830519	Spree::Order	paid
137	shipment	pending	33	2	2013-04-22 19:57:10.87832	2013-04-22 19:57:10.87832	Spree::Order	ready
138	order	cart	33	2	2013-04-22 19:57:11.633387	2013-04-22 19:57:11.633387	Spree::Order	complete
147	payment	balance_due	37	\N	2013-05-09 20:00:57.535042	2013-05-09 20:00:57.535042	Spree::Order	paid
148	payment	balance_due	37	\N	2013-05-09 20:00:57.905797	2013-05-09 20:00:57.905797	Spree::Order	paid
149	shipment	pending	37	\N	2013-05-09 20:00:57.923734	2013-05-09 20:00:57.923734	Spree::Order	ready
150	order	cart	37	\N	2013-05-09 20:00:58.594331	2013-05-09 20:00:58.594331	Spree::Order	complete
151	payment	balance_due	38	\N	2013-05-09 20:15:15.305077	2013-05-09 20:15:15.305077	Spree::Order	paid
152	payment	balance_due	38	\N	2013-05-09 20:15:15.467533	2013-05-09 20:15:15.467533	Spree::Order	paid
153	shipment	pending	38	\N	2013-05-09 20:15:15.48778	2013-05-09 20:15:15.48778	Spree::Order	ready
154	order	cart	38	\N	2013-05-09 20:15:16.080211	2013-05-09 20:15:16.080211	Spree::Order	complete
155	payment	balance_due	39	\N	2013-05-09 20:35:27.667487	2013-05-09 20:35:27.667487	Spree::Order	paid
156	payment	balance_due	39	\N	2013-05-09 20:35:27.882032	2013-05-09 20:35:27.882032	Spree::Order	paid
157	shipment	pending	39	\N	2013-05-09 20:35:27.9021	2013-05-09 20:35:27.9021	Spree::Order	ready
158	order	cart	39	\N	2013-05-09 20:35:28.119349	2013-05-09 20:35:28.119349	Spree::Order	complete
159	shipment	ready	39	\N	2013-05-13 15:56:49.602554	2013-05-13 15:56:49.602554	Spree::Order	shipped
160	shipment	ready	39	\N	2013-05-13 15:56:49.723137	2013-05-13 15:56:49.723137	Spree::Order	shipped
161	shipment	ready	38	\N	2013-05-13 18:53:38.90983	2013-05-13 18:53:38.90983	Spree::Order	shipped
162	shipment	ready	38	\N	2013-05-13 18:53:38.955511	2013-05-13 18:53:38.955511	Spree::Order	shipped
163	shipment	ready	37	\N	2013-05-13 18:58:26.749244	2013-05-13 18:58:26.749244	Spree::Order	shipped
164	shipment	ready	37	\N	2013-05-13 18:58:26.794944	2013-05-13 18:58:26.794944	Spree::Order	shipped
165	shipment	ready	33	2	2013-05-13 19:12:39.420649	2013-05-13 19:12:39.420649	Spree::Order	shipped
166	shipment	ready	33	2	2013-05-13 19:12:39.476089	2013-05-13 19:12:39.476089	Spree::Order	shipped
\.


--
-- Name: spree_state_changes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_state_changes_id_seq', 166, true);


--
-- Data for Name: spree_states; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_states (id, name, abbr, country_id) FROM stdin;
931624400	Michigan	MI	214
615306087	South Dakota	SD	214
414569975	Washington	WA	214
103680699	Wisconsin	WI	214
948208802	Arizona	AZ	214
625629523	Illinois	IL	214
426832442	New Hampshire	NH	214
177087202	North Carolina	NC	214
969722173	Kansas	KS	214
653576146	Missouri	MO	214
471470972	Arkansas	AR	214
179539703	Nevada	NV	214
6764998	District of Columbia	DC	214
982433740	Idaho	ID	214
673350891	Nebraska	NE	214
471711976	Pennsylvania	PA	214
199950338	Hawaii	HI	214
17199670	Utah	UT	214
989115415	Vermont	VT	214
721598219	Delaware	DE	214
474001862	Rhode Island	RI	214
248548169	Oklahoma	OK	214
37199952	Louisiana	LA	214
999156632	Montana	MT	214
726305632	Tennessee	TN	214
480368357	Maryland	MD	214
267271847	Florida	FL	214
41111624	Virginia	VA	214
1032288924	Minnesota	MN	214
750950030	New Jersey	NJ	214
485193526	Ohio	OH	214
276110813	California	CA	214
51943165	North Dakota	ND	214
1055056709	Maine	ME	214
769938586	Indiana	IN	214
525212995	Texas	TX	214
298914262	Oregon	OR	214
66390489	Wyoming	WY	214
1061493585	Alabama	AL	214
825306985	Iowa	IA	214
532363768	Mississippi	MS	214
308473843	Kentucky	KY	214
69729944	New Mexico	NM	214
876916760	Georgia	GA	214
536031023	Colorado	CO	214
385551075	Massachusetts	MA	214
69870734	Connecticut	CT	214
889445952	New York	NY	214
597434151	South Carolina	SC	214
403740659	Alaska	AK	214
91367981	West Virginia	WV	214
\.


--
-- Name: spree_states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_states_id_seq', 1061493586, false);


--
-- Data for Name: spree_tax_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_tax_categories (id, name, description, created_at, updated_at, is_default, deleted_at) FROM stdin;
1	IVA	product + iva	2013-05-06 20:54:49.36406	2013-05-06 20:54:49.36406	f	\N
2	Sin IVA	product sin iva	2013-05-06 20:59:09.838103	2013-05-06 20:59:19.431658	t	\N
\.


--
-- Name: spree_tax_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_tax_categories_id_seq', 2, true);


--
-- Data for Name: spree_tax_rates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_tax_rates (id, amount, zone_id, tax_category_id, created_at, updated_at, included_in_price, name, show_rate_in_label) FROM stdin;
\.


--
-- Name: spree_tax_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_tax_rates_id_seq', 1, false);


--
-- Data for Name: spree_taxonomies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_taxonomies (id, name, created_at, updated_at) FROM stdin;
1	T1	2013-03-04 20:24:57.882208	2013-03-04 20:24:57.882208
\.


--
-- Name: spree_taxonomies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_taxonomies_id_seq', 1, true);


--
-- Data for Name: spree_taxons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_taxons (id, parent_id, "position", name, permalink, taxonomy_id, created_at, updated_at, lft, rgt, icon_file_name, icon_content_type, icon_file_size, icon_updated_at, description) FROM stdin;
1	\N	0	T1	t1	1	2013-03-04 20:24:57.975776	2013-03-04 20:24:57.975776	1	2	\N	\N	\N	\N	\N
\.


--
-- Name: spree_taxons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_taxons_id_seq', 1, true);


--
-- Data for Name: spree_teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_teams (id, fullname, jobp, created_at, updated_at, photo_file_name, photo_content_type, photo_file_size, photo_updated_at) FROM stdin;
2	HECTOR TITO A.	Co-Founder & Business Developer	2013-03-13 21:17:51.863316	2013-03-13 21:17:51.863316	about-us_collaborator1.jpg	image/jpeg	39720	2013-03-13 21:17:51.37656
3	Leo G. 	Head of Production	2013-03-13 21:29:54.679808	2013-03-13 21:29:54.679808	about-us_collaborator2.jpg	image/jpeg	65413	2013-03-13 21:29:54.093509
4	Alfredo C.	Creative Marketing Director	2013-03-13 21:30:30.129978	2013-03-13 21:30:30.129978	about-us_collaborator3.jpg	image/jpeg	59745	2013-03-13 21:30:29.613798
5	Karen O.	Communications Consultant	2013-03-13 21:31:58.143064	2013-03-13 21:31:58.143064	about-us_collaborator4.jpg	image/jpeg	440602	2013-03-13 21:31:57.293064
6	Ana N.	Fashion Consultant	2013-03-13 21:32:33.1247	2013-03-13 21:32:33.1247	about-us_collaborator5.jpg	image/jpeg	49311	2013-03-13 21:32:32.64174
\.


--
-- Name: spree_teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_teams_id_seq', 6, true);


--
-- Data for Name: spree_tokenized_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_tokenized_permissions (id, permissable_id, permissable_type, token, created_at, updated_at) FROM stdin;
1	1	Spree::Order	aadffa89eaf96777	2013-01-25 07:15:08.227761	2013-01-25 07:15:08.227761
2	2	Spree::Order	8b5a78cffd2ed5c4	2013-01-30 17:54:39.315869	2013-01-30 17:54:39.315869
3	3	Spree::Order	c9679c29dbce6a89	2013-01-31 21:53:39.62363	2013-01-31 21:53:39.62363
4	4	Spree::Order	127e06a0a1ee28e8	2013-02-01 18:51:37.816181	2013-02-01 18:51:37.816181
5	5	Spree::Order	b8a73351b3ed84a2	2013-02-01 21:13:15.132013	2013-02-01 21:13:15.132013
6	6	Spree::Order	644a0091b82317d3	2013-02-01 22:39:45.0154	2013-02-01 22:39:45.0154
7	7	Spree::Order	f1d4840cfc3f9a27	2013-02-02 20:53:01.451559	2013-02-02 20:53:01.451559
8	8	Spree::Order	cfae178790929d36	2013-02-05 20:43:44.778047	2013-02-05 20:43:44.778047
9	9	Spree::Order	82bc984da9557241	2013-02-06 22:30:32.12904	2013-02-06 22:30:32.12904
10	10	Spree::Order	5989f0d2769b90c4	2013-02-07 18:17:57.609694	2013-02-07 18:17:57.609694
11	11	Spree::Order	1cae9473f44e9458	2013-02-07 22:06:39.475323	2013-02-07 22:06:39.475323
12	12	Spree::Order	713ed33eb04875f3	2013-02-07 22:06:42.187243	2013-02-07 22:06:42.187243
13	13	Spree::Order	3ad0a7f421a508c8	2013-02-07 22:06:49.773009	2013-02-07 22:06:49.773009
14	14	Spree::Order	6b936037847af63b	2013-02-08 19:26:35.629968	2013-02-08 19:26:35.629968
15	15	Spree::Order	ed7eae4020e175d0	2013-02-13 21:10:49.473001	2013-02-13 21:10:49.473001
16	16	Spree::Order	52f0cc8625ae87c6	2013-03-05 19:04:29.040506	2013-03-05 19:04:29.040506
17	17	Spree::Order	0620637fd012a9f9	2013-03-05 20:07:17.435576	2013-03-05 20:07:17.435576
18	18	Spree::Order	98b567e55b26aa03	2013-03-12 21:11:19.428422	2013-03-12 21:11:19.428422
19	19	Spree::Order	80b121a6dbebbd7d	2013-03-12 23:50:24.282052	2013-03-12 23:50:24.282052
20	20	Spree::Order	107f2b65e1d693ad	2013-03-13 00:46:22.500042	2013-03-13 00:46:22.500042
21	21	Spree::Order	f3e07489c9eac557	2013-03-13 19:09:30.692836	2013-03-13 19:09:30.692836
22	22	Spree::Order	9c57121ca5db1777	2013-03-15 21:03:14.970398	2013-03-15 21:03:14.970398
23	23	Spree::Order	9b7db0122190ae5e	2013-03-21 23:41:13.429243	2013-03-21 23:41:13.429243
24	24	Spree::Order	9561cbf204fc1ee2	2013-03-21 23:41:43.329511	2013-03-21 23:41:43.329511
25	25	Spree::Order	81e0eda06a591db6	2013-03-21 23:41:47.755122	2013-03-21 23:41:47.755122
26	26	Spree::Order	53799e7a08cde1a3	2013-03-21 23:44:16.718649	2013-03-21 23:44:16.718649
27	27	Spree::Order	625c16554bc03d68	2013-03-21 23:49:48.879177	2013-03-21 23:49:48.879177
28	28	Spree::Order	0f8cd33559b97729	2013-03-25 05:42:03.233761	2013-03-25 05:42:03.233761
29	29	Spree::Order	bd2ef3b0f3ebc874	2013-03-26 05:44:45.348957	2013-03-26 05:44:45.348957
30	30	Spree::Order	0513e9b31338aef4	2013-03-27 21:30:12.867327	2013-03-27 21:30:12.867327
31	31	Spree::Order	b0fec7523fca3b3b	2013-04-02 20:39:41.124688	2013-04-02 20:39:41.124688
32	32	Spree::Order	4bef10f09ef2563c	2013-04-22 19:05:05.009707	2013-04-22 19:05:05.009707
33	33	Spree::Order	8f38678f028958c7	2013-04-22 19:06:20.529361	2013-04-22 19:06:20.529361
34	34	Spree::Order	c6893fa84521347f	2013-04-22 21:07:15.422085	2013-04-22 21:07:15.422085
35	35	Spree::Order	dea5f9b1e02aa0c7	2013-04-22 22:06:47.538808	2013-04-22 22:06:47.538808
36	36	Spree::Order	3432f137551999f7	2013-04-23 02:24:58.64207	2013-04-23 02:24:58.64207
37	37	Spree::Order	432eafd02ab301dd	2013-05-09 19:54:43.40681	2013-05-09 19:54:43.40681
38	38	Spree::Order	4924e386b6131669	2013-05-09 20:10:12.931441	2013-05-09 20:10:12.931441
39	39	Spree::Order	6e57f72958703f6f	2013-05-09 20:33:56.382912	2013-05-09 20:33:56.382912
40	40	Spree::Order	0653913669deef00	2013-05-09 21:32:55.3819	2013-05-09 21:32:55.3819
41	41	Spree::Order	4ace4329b9936e34	2013-05-14 20:41:41.41699	2013-05-14 20:41:41.41699
42	42	Spree::Order	a072194f0b9a046c	2013-05-15 19:21:12.312917	2013-05-15 19:21:12.312917
43	43	Spree::Order	c0ad1a53eca39072	2013-05-29 21:53:12.140527	2013-05-29 21:53:12.140527
44	44	Spree::Order	17662c08afbe740b	2013-05-29 22:25:51.587084	2013-05-29 22:25:51.587084
45	45	Spree::Order	699f0d196969d802	2013-05-31 17:45:39.956749	2013-05-31 17:45:39.956749
46	46	Spree::Order	420e2261f625d925	2013-06-25 20:37:21.702249	2013-06-25 20:37:21.702249
47	47	Spree::Order	3675bb8457e104d2	2013-06-26 15:11:26.702483	2013-06-26 15:11:26.702483
48	48	Spree::Order	939d109c86f16394	2013-07-16 21:49:48.198693	2013-07-16 21:49:48.198693
49	49	Spree::Order	e8d978d6c317cdcb	2013-07-16 23:26:24.92579	2013-07-16 23:26:24.92579
\.


--
-- Name: spree_tokenized_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_tokenized_permissions_id_seq', 49, true);


--
-- Data for Name: spree_trackers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_trackers (id, environment, analytics_id, active, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_trackers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_trackers_id_seq', 1, false);


--
-- Data for Name: spree_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_users (id, encrypted_password, password_salt, email, remember_token, persistence_token, reset_password_token, perishable_token, sign_in_count, failed_attempts, last_request_at, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, login, ship_address_id, bill_address_id, created_at, updated_at, spree_api_key, authentication_token, unlock_token, locked_at, remember_created_at, reset_password_sent_at, isartist, invitation_token, invitation_sent_at, invitation_accepted_at, invitation_limit, invited_by_id, invited_by_type) FROM stdin;
4	bce132e9b1bb0dd1d9eaa1cef878e9b435022d86933622f55c8a9eff4f2e35c79bc1ac284eb0b822fde08d7266f99558e9dbef7ca8f30b6525e22126732a4603	3qCT868j2eGamcUc4irE	rlara@incaztech.com	\N	\N	\N	\N	14	0	\N	2013-03-15 22:34:14.411309	2013-03-15 19:06:23.877157	127.0.0.1	127.0.0.1	rlara@incaztech.com	\N	\N	2013-03-05 19:04:28.73982	2013-03-15 22:34:14.418068	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
41	1cb802fa6a4de1d560019d2a94b2cf83e281bee34808cb2cedca3bfdd4457f9471f6c2a3023bd15f0571f3685e8363724d388542919b8c74fc71ad750770b94b	57SPGTqzY3s6gBmxqvfJ	rele_91@hotmail.com	\N	\N	\N	\N	1	0	\N	2013-03-27 23:24:11.367404	2013-03-27 23:24:11.367404	127.0.0.1	127.0.0.1	rele_91@hotmail.com	\N	\N	2013-03-27 23:19:44.136613	2013-03-27 23:24:11.373146	\N	\N	\N	\N	\N	\N	\N	\N	2013-03-27 23:19:44.130903	2013-03-27 23:24:11.317508	\N	\N	\N
59	5b6d6543a17e4adbef37c8537d485f2021ebdced65a478f4ae035bfaa52a0210e3a660fa8cf98c7ba7ef8a5977477ab7d330dd2b051ddb6a213227f26ece917b	RjEHGczhdqAqYDuYyjzy	acolin@incaztech.com	\N	\N	\N	\N	1	0	\N	2013-04-02 06:46:11.044592	2013-04-02 06:46:11.044592	127.0.0.1	127.0.0.1	acolin@incaztech.com	\N	\N	2013-04-02 06:45:21.300986	2013-04-02 06:46:11.054311	\N	\N	\N	\N	\N	\N	\N	\N	2013-04-02 06:45:21.295956	2013-04-02 06:46:11.005135	\N	\N	\N
2	9634eda050bd9f475ad0d2e1ff524229678639d1ff059cedd5051df0e203d406fba805f74b7796b59c21484a8469d047179e4fd38d3b1bb293abedcfb6e9f33a	NFnUU4tedePvm6sz8xhs	spree@example.com	\N	\N	O6pQ1cv5mzqeWzlpGLiO	\N	81	0	\N	2013-08-13 19:57:38.263233	2013-08-05 17:21:14.272319	127.0.0.1	127.0.0.1	spree@example.com	\N	\N	2013-03-04 19:45:22.396757	2013-08-13 19:57:38.301516	\N	\N	\N	\N	\N	2013-03-07 23:53:57.541933	\N	\N	\N	\N	\N	\N	\N
39	fd183270e080ede6a212d3fcd8d21822a6adff2df9091882a00de49d81a66136fcc37884e34aacf696538aa599eec56f1d764a9fc3c12d18e6ffd11f79466d87	wqJmX3vFMZAnfQRhmXVJ	roberto.laraesp@gmail.com	\N	\N	\N	\N	3	0	\N	2013-08-13 20:45:20.300956	2013-03-25 17:47:28.699689	127.0.0.1	127.0.0.1	roberto.laraesp@gmail.com	\N	\N	2013-03-23 19:15:14.504022	2013-08-13 20:45:20.30641	\N	\N	\N	\N	\N	\N	\N	\N	2013-03-23 19:15:14.496438	2013-03-23 21:23:58.584909	\N	\N	\N
\.


--
-- Name: spree_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_users_id_seq', 59, true);


--
-- Data for Name: spree_variants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_variants (id, sku, price, weight, height, width, depth, deleted_at, is_master, product_id, count_on_hand, cost_price, "position", lock_version) FROM stdin;
3	P123-m	40.00	\N	\N	\N	\N	2013-01-25 07:03:24.360471	f	1	5	\N	\N	1
22	AAAAA	29.00	\N	\N	\N	\N	\N	f	9	0	\N	\N	3
6	Ca-0101	45.00	\N	\N	\N	\N	\N	t	2	0	\N	\N	1
8	C124	20.00	\N	\N	\N	\N	\N	t	3	0	\N	\N	1
5	P123-l	40.00	\N	\N	\N	\N	2013-01-30 22:50:54.106879	f	1	5	\N	\N	0
4	P123-m	30.00	\N	\N	\N	\N	2013-01-30 22:50:54.106879	f	1	5	\N	\N	1
2	P123-s	40.00	\N	\N	\N	\N	2013-01-30 22:50:54.106879	f	1	5	\N	\N	0
1	P000	40.00	\N	\N	\N	\N	2013-01-30 22:50:54.106879	t	1	0	\N	\N	1
7	Ca-0101S	45.00	\N	\N	\N	\N	\N	f	2	0	\N	\N	1
11	00000	20.00	\N	\N	\N	\N	\N	f	3	0	\N	\N	3
13	P0101	19.00	120.00	90.00	30.00	\N	\N	t	6	0	\N	\N	2
15	P30247	15.00	\N	\N	\N	\N	\N	t	7	0	\N	\N	1
16	99999	15.00	\N	\N	\N	\N	\N	f	7	8	\N	\N	0
12	11111	20.00	\N	\N	\N	\N	\N	f	3	1	\N	\N	9
14	P1212	19.00	120.00	90.00	30.00	\N	\N	f	6	1	\N	\N	1
17	1244	45.00	\N	\N	\N	\N	\N	f	2	1	\N	\N	1
18	PLP123	29.00	\N	\N	\N	\N	\N	t	8	0	\N	\N	1
20	123345	50.00	\N	\N	\N	\N	\N	f	8	3	\N	\N	0
21	COPY OF PLP123	29.00	\N	\N	\N	\N	\N	t	9	0	\N	\N	1
27	COPY OF sadscd	15.00	\N	\N	\N	\N	2013-04-01 20:48:30.292207	t	11	0	\N	\N	1
29		15.00	\N	\N	\N	\N	\N	f	12	0	\N	\N	0
30		15.00	\N	\N	\N	\N	\N	f	12	0	\N	\N	0
31		15.00	\N	\N	\N	\N	\N	f	12	0	\N	\N	0
9	B1234364	25.00	\N	\N	\N	\N	2013-01-30 22:50:49.906736	t	4	0	\N	\N	1
10	D124314	45.00	\N	\N	\N	\N	\N	t	5	0	\N	\N	1
28	A54654654	15.00	\N	\N	\N	\N	\N	t	12	0	\N	\N	1
26		15.00	\N	\N	\N	\N	2013-04-19 19:56:39.027323	f	10	5	\N	\N	1
25		15.00	\N	\N	\N	\N	2013-04-19 19:56:39.027323	f	10	5	\N	\N	1
24		15.00	\N	\N	\N	\N	2013-04-19 19:56:39.027323	f	10	5	\N	\N	1
23	sadscd	15.00	\N	\N	\N	\N	2013-04-19 19:56:39.027323	t	10	0	\N	\N	1
32	ZWJLa-12	35.00	\N	\N	\N	\N	\N	t	13	0	\N	\N	1
19	PS123	29.00	10.00	15.00	20.00	2.00	\N	f	8	1	\N	\N	3
\.


--
-- Name: spree_variants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_variants_id_seq', 32, true);


--
-- Data for Name: spree_zone_members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_zone_members (id, zoneable_id, zoneable_type, zone_id, created_at, updated_at) FROM stdin;
195044517	214	Spree::Country	2	2009-06-04 17:22:41	2009-06-04 17:22:41
1017582644	35	Spree::Country	2	2009-06-04 17:22:41	2009-06-04 17:22:41
1017582645	195	Spree::Country	3	2013-02-13 01:21:07.346618	2013-02-13 01:21:07.346618
1017582646	1	Spree::Country	3	2013-02-13 01:21:07.383068	2013-02-13 01:21:07.383068
1017582647	1	Spree::Country	3	2013-02-13 01:21:07.390598	2013-02-13 01:21:07.390598
1017582648	74	Spree::Country	3	2013-02-13 01:21:07.398334	2013-02-13 01:21:07.398334
1017582649	1	Spree::Country	3	2013-02-13 01:21:07.40601	2013-02-13 01:21:07.40601
1017582650	68	Spree::Country	3	2013-02-13 01:21:07.414244	2013-02-13 01:21:07.414244
1017582651	98	Spree::Country	3	2013-02-13 01:21:07.421358	2013-02-13 01:21:07.421358
\.


--
-- Name: spree_zone_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_zone_members_id_seq', 1017582652, true);


--
-- Data for Name: spree_zones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spree_zones (id, name, description, created_at, updated_at, default_tax, zone_members_count) FROM stdin;
2	North America	USA + Canada	2009-06-04 17:22:41	2013-05-06 21:00:22.256702	t	0
3	International	Out of United States	2013-02-13 01:21:07.322026	2013-03-27 22:01:30.735137	f	7
\.


--
-- Name: spree_zones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('spree_zones_id_seq', 3, true);


--
-- Name: activators_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_activators
    ADD CONSTRAINT activators_pkey PRIMARY KEY (id);


--
-- Name: addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: adjustments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_adjustments
    ADD CONSTRAINT adjustments_pkey PRIMARY KEY (id);


--
-- Name: assets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_assets
    ADD CONSTRAINT assets_pkey PRIMARY KEY (id);


--
-- Name: calculators_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_calculators
    ADD CONSTRAINT calculators_pkey PRIMARY KEY (id);


--
-- Name: configurations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_configurations
    ADD CONSTRAINT configurations_pkey PRIMARY KEY (id);


--
-- Name: countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: creditcards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_credit_cards
    ADD CONSTRAINT creditcards_pkey PRIMARY KEY (id);


--
-- Name: gateways_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_gateways
    ADD CONSTRAINT gateways_pkey PRIMARY KEY (id);


--
-- Name: inventory_units_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_inventory_units
    ADD CONSTRAINT inventory_units_pkey PRIMARY KEY (id);


--
-- Name: line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_line_items
    ADD CONSTRAINT line_items_pkey PRIMARY KEY (id);


--
-- Name: log_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_log_entries
    ADD CONSTRAINT log_entries_pkey PRIMARY KEY (id);


--
-- Name: mail_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_mail_methods
    ADD CONSTRAINT mail_methods_pkey PRIMARY KEY (id);


--
-- Name: option_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_option_types
    ADD CONSTRAINT option_types_pkey PRIMARY KEY (id);


--
-- Name: option_values_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_option_values
    ADD CONSTRAINT option_values_pkey PRIMARY KEY (id);


--
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY (id);


--
-- Name: payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: paypal_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_paypal_accounts
    ADD CONSTRAINT paypal_accounts_pkey PRIMARY KEY (id);


--
-- Name: preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_preferences
    ADD CONSTRAINT preferences_pkey PRIMARY KEY (id);


--
-- Name: product_option_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_product_option_types
    ADD CONSTRAINT product_option_types_pkey PRIMARY KEY (id);


--
-- Name: product_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_product_properties
    ADD CONSTRAINT product_properties_pkey PRIMARY KEY (id);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: promotion_action_line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_promotion_action_line_items
    ADD CONSTRAINT promotion_action_line_items_pkey PRIMARY KEY (id);


--
-- Name: promotion_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_promotion_actions
    ADD CONSTRAINT promotion_actions_pkey PRIMARY KEY (id);


--
-- Name: promotion_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_promotion_rules
    ADD CONSTRAINT promotion_rules_pkey PRIMARY KEY (id);


--
-- Name: properties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (id);


--
-- Name: prototypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_prototypes
    ADD CONSTRAINT prototypes_pkey PRIMARY KEY (id);


--
-- Name: return_authorizations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_return_authorizations
    ADD CONSTRAINT return_authorizations_pkey PRIMARY KEY (id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: shipments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_shipments
    ADD CONSTRAINT shipments_pkey PRIMARY KEY (id);


--
-- Name: shipping_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_shipping_categories
    ADD CONSTRAINT shipping_categories_pkey PRIMARY KEY (id);


--
-- Name: shipping_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_shipping_methods
    ADD CONSTRAINT shipping_methods_pkey PRIMARY KEY (id);


--
-- Name: spree_artists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_artists
    ADD CONSTRAINT spree_artists_pkey PRIMARY KEY (id);


--
-- Name: spree_causes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_causes
    ADD CONSTRAINT spree_causes_pkey PRIMARY KEY (id);


--
-- Name: spree_faqs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_faqs
    ADD CONSTRAINT spree_faqs_pkey PRIMARY KEY (id);


--
-- Name: spree_organizations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_organizations
    ADD CONSTRAINT spree_organizations_pkey PRIMARY KEY (id);


--
-- Name: spree_pending_promotions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_pending_promotions
    ADD CONSTRAINT spree_pending_promotions_pkey PRIMARY KEY (id);


--
-- Name: spree_skrill_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_skrill_transactions
    ADD CONSTRAINT spree_skrill_transactions_pkey PRIMARY KEY (id);


--
-- Name: spree_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_teams
    ADD CONSTRAINT spree_teams_pkey PRIMARY KEY (id);


--
-- Name: spree_tokenized_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_tokenized_permissions
    ADD CONSTRAINT spree_tokenized_permissions_pkey PRIMARY KEY (id);


--
-- Name: state_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_state_changes
    ADD CONSTRAINT state_events_pkey PRIMARY KEY (id);


--
-- Name: states_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- Name: tax_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_tax_categories
    ADD CONSTRAINT tax_categories_pkey PRIMARY KEY (id);


--
-- Name: tax_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_tax_rates
    ADD CONSTRAINT tax_rates_pkey PRIMARY KEY (id);


--
-- Name: taxonomies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_taxonomies
    ADD CONSTRAINT taxonomies_pkey PRIMARY KEY (id);


--
-- Name: taxons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_taxons
    ADD CONSTRAINT taxons_pkey PRIMARY KEY (id);


--
-- Name: trackers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_trackers
    ADD CONSTRAINT trackers_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: variants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_variants
    ADD CONSTRAINT variants_pkey PRIMARY KEY (id);


--
-- Name: zone_members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_zone_members
    ADD CONSTRAINT zone_members_pkey PRIMARY KEY (id);


--
-- Name: zones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spree_zones
    ADD CONSTRAINT zones_pkey PRIMARY KEY (id);


--
-- Name: email_idx_unique; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX email_idx_unique ON spree_users USING btree (email);


--
-- Name: index_addresses_on_firstname; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_addresses_on_firstname ON spree_addresses USING btree (firstname);


--
-- Name: index_addresses_on_lastname; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_addresses_on_lastname ON spree_addresses USING btree (lastname);


--
-- Name: index_adjustments_on_order_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_adjustments_on_order_id ON spree_adjustments USING btree (adjustable_id);


--
-- Name: index_assets_on_viewable_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_assets_on_viewable_id ON spree_assets USING btree (viewable_id);


--
-- Name: index_assets_on_viewable_type_and_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_assets_on_viewable_type_and_type ON spree_assets USING btree (viewable_type, type);


--
-- Name: index_inventory_units_on_order_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_inventory_units_on_order_id ON spree_inventory_units USING btree (order_id);


--
-- Name: index_inventory_units_on_shipment_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_inventory_units_on_shipment_id ON spree_inventory_units USING btree (shipment_id);


--
-- Name: index_inventory_units_on_variant_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_inventory_units_on_variant_id ON spree_inventory_units USING btree (variant_id);


--
-- Name: index_option_values_variants_on_variant_id_and_option_value_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_option_values_variants_on_variant_id_and_option_value_id ON spree_option_values_variants USING btree (variant_id, option_value_id);


--
-- Name: index_product_properties_on_product_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_product_properties_on_product_id ON spree_product_properties USING btree (product_id);


--
-- Name: index_products_promotion_rules_on_product_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_products_promotion_rules_on_product_id ON spree_products_promotion_rules USING btree (product_id);


--
-- Name: index_products_promotion_rules_on_promotion_rule_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_products_promotion_rules_on_promotion_rule_id ON spree_products_promotion_rules USING btree (promotion_rule_id);


--
-- Name: index_promotion_rules_on_product_group_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_promotion_rules_on_product_group_id ON spree_promotion_rules USING btree (product_group_id);


--
-- Name: index_promotion_rules_on_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_promotion_rules_on_user_id ON spree_promotion_rules USING btree (user_id);


--
-- Name: index_promotion_rules_users_on_promotion_rule_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_promotion_rules_users_on_promotion_rule_id ON spree_promotion_rules_users USING btree (promotion_rule_id);


--
-- Name: index_promotion_rules_users_on_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_promotion_rules_users_on_user_id ON spree_promotion_rules_users USING btree (user_id);


--
-- Name: index_shipments_on_number; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_shipments_on_number ON spree_shipments USING btree (number);


--
-- Name: index_spree_causes_on_artist_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_causes_on_artist_id ON spree_causes USING btree (artist_id);


--
-- Name: index_spree_causes_on_organization_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_causes_on_organization_id ON spree_causes USING btree (organization_id);


--
-- Name: index_spree_configurations_on_name_and_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_configurations_on_name_and_type ON spree_configurations USING btree (name, type);


--
-- Name: index_spree_line_items_on_order_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_line_items_on_order_id ON spree_line_items USING btree (order_id);


--
-- Name: index_spree_line_items_on_variant_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_line_items_on_variant_id ON spree_line_items USING btree (variant_id);


--
-- Name: index_spree_option_values_variants_on_variant_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_option_values_variants_on_variant_id ON spree_option_values_variants USING btree (variant_id);


--
-- Name: index_spree_orders_on_number; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_orders_on_number ON spree_orders USING btree (number);


--
-- Name: index_spree_pending_promotions_on_promotion_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_pending_promotions_on_promotion_id ON spree_pending_promotions USING btree (promotion_id);


--
-- Name: index_spree_pending_promotions_on_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_pending_promotions_on_user_id ON spree_pending_promotions USING btree (user_id);


--
-- Name: index_spree_preferences_on_key; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_spree_preferences_on_key ON spree_preferences USING btree (key);


--
-- Name: index_spree_products_on_available_on; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_products_on_available_on ON spree_products USING btree (available_on);


--
-- Name: index_spree_products_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_products_on_deleted_at ON spree_products USING btree (deleted_at);


--
-- Name: index_spree_products_on_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_products_on_name ON spree_products USING btree (name);


--
-- Name: index_spree_products_on_permalink; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_products_on_permalink ON spree_products USING btree (permalink);


--
-- Name: index_spree_products_taxons_on_product_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_products_taxons_on_product_id ON spree_products_taxons USING btree (product_id);


--
-- Name: index_spree_products_taxons_on_taxon_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_products_taxons_on_taxon_id ON spree_products_taxons USING btree (taxon_id);


--
-- Name: index_spree_roles_users_on_role_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_roles_users_on_role_id ON spree_roles_users USING btree (role_id);


--
-- Name: index_spree_roles_users_on_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_roles_users_on_user_id ON spree_roles_users USING btree (user_id);


--
-- Name: index_spree_variants_on_product_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_spree_variants_on_product_id ON spree_variants USING btree (product_id);


--
-- Name: index_taxons_on_parent_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_taxons_on_parent_id ON spree_taxons USING btree (parent_id);


--
-- Name: index_taxons_on_permalink; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_taxons_on_permalink ON spree_taxons USING btree (permalink);


--
-- Name: index_taxons_on_taxonomy_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_taxons_on_taxonomy_id ON spree_taxons USING btree (taxonomy_id);


--
-- Name: index_tokenized_name_and_type; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_tokenized_name_and_type ON spree_tokenized_permissions USING btree (permissable_id, permissable_type);


--
-- Name: index_users_on_persistence_token; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_users_on_persistence_token ON spree_users USING btree (persistence_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


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

