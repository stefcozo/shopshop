--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'SQL_ASCII';
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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO ubuntu;

--
-- Name: friendly_id_slugs; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE friendly_id_slugs (
    id integer NOT NULL,
    slug character varying NOT NULL,
    sluggable_id integer NOT NULL,
    sluggable_type character varying(50),
    scope character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.friendly_id_slugs OWNER TO ubuntu;

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendly_id_slugs_id_seq OWNER TO ubuntu;

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE friendly_id_slugs_id_seq OWNED BY friendly_id_slugs.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO ubuntu;

--
-- Name: spree_addresses; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_addresses (
    id integer NOT NULL,
    firstname character varying,
    lastname character varying,
    address1 character varying,
    address2 character varying,
    city character varying,
    zipcode character varying,
    phone character varying,
    state_name character varying,
    alternative_phone character varying,
    company character varying,
    state_id integer,
    country_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_addresses OWNER TO ubuntu;

--
-- Name: spree_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_addresses_id_seq OWNER TO ubuntu;

--
-- Name: spree_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_addresses_id_seq OWNED BY spree_addresses.id;


--
-- Name: spree_adjustment_reasons; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_adjustment_reasons (
    id integer NOT NULL,
    name character varying,
    code character varying,
    active boolean DEFAULT true,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_adjustment_reasons OWNER TO ubuntu;

--
-- Name: spree_adjustment_reasons_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_adjustment_reasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_adjustment_reasons_id_seq OWNER TO ubuntu;

--
-- Name: spree_adjustment_reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_adjustment_reasons_id_seq OWNED BY spree_adjustment_reasons.id;


--
-- Name: spree_adjustments; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_adjustments (
    id integer NOT NULL,
    source_type character varying,
    source_id integer,
    adjustable_type character varying,
    adjustable_id integer NOT NULL,
    amount numeric(10,2),
    label character varying,
    eligible boolean DEFAULT true,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    order_id integer NOT NULL,
    included boolean DEFAULT false,
    promotion_code_id integer,
    adjustment_reason_id integer,
    finalized boolean DEFAULT false NOT NULL,
    CONSTRAINT check_spree_adjustments_order_id CHECK ((((adjustable_type)::text <> 'Spree::Order'::text) OR (order_id = adjustable_id)))
);


ALTER TABLE public.spree_adjustments OWNER TO ubuntu;

--
-- Name: spree_adjustments_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_adjustments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_adjustments_id_seq OWNER TO ubuntu;

--
-- Name: spree_adjustments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_adjustments_id_seq OWNED BY spree_adjustments.id;


--
-- Name: spree_assets; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_assets (
    id integer NOT NULL,
    viewable_type character varying,
    viewable_id integer,
    attachment_width integer,
    attachment_height integer,
    attachment_file_size integer,
    "position" integer,
    attachment_content_type character varying,
    attachment_file_name character varying,
    type character varying(75),
    attachment_updated_at timestamp without time zone,
    alt text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_assets OWNER TO ubuntu;

--
-- Name: spree_assets_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_assets_id_seq OWNER TO ubuntu;

--
-- Name: spree_assets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_assets_id_seq OWNED BY spree_assets.id;


--
-- Name: spree_calculators; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_calculators (
    id integer NOT NULL,
    type character varying,
    calculable_type character varying,
    calculable_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    preferences text
);


ALTER TABLE public.spree_calculators OWNER TO ubuntu;

--
-- Name: spree_calculators_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_calculators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_calculators_id_seq OWNER TO ubuntu;

--
-- Name: spree_calculators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_calculators_id_seq OWNED BY spree_calculators.id;


--
-- Name: spree_cartons; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_cartons (
    id integer NOT NULL,
    number character varying,
    external_number character varying,
    stock_location_id integer,
    address_id integer,
    shipping_method_id integer,
    tracking character varying,
    shipped_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    imported_from_shipment_id integer
);


ALTER TABLE public.spree_cartons OWNER TO ubuntu;

--
-- Name: spree_cartons_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_cartons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_cartons_id_seq OWNER TO ubuntu;

--
-- Name: spree_cartons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_cartons_id_seq OWNED BY spree_cartons.id;


--
-- Name: spree_countries; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_countries (
    id integer NOT NULL,
    iso_name character varying,
    iso character varying,
    iso3 character varying,
    name character varying,
    numcode integer,
    states_required boolean DEFAULT false,
    updated_at timestamp without time zone,
    created_at timestamp without time zone
);


ALTER TABLE public.spree_countries OWNER TO ubuntu;

--
-- Name: spree_countries_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_countries_id_seq OWNER TO ubuntu;

--
-- Name: spree_countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_countries_id_seq OWNED BY spree_countries.id;


--
-- Name: spree_credit_cards; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_credit_cards (
    id integer NOT NULL,
    month character varying,
    year character varying,
    cc_type character varying,
    last_digits character varying,
    gateway_customer_profile_id character varying,
    gateway_payment_profile_id character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name character varying,
    user_id integer,
    payment_method_id integer,
    "default" boolean DEFAULT false NOT NULL,
    address_id integer
);


ALTER TABLE public.spree_credit_cards OWNER TO ubuntu;

--
-- Name: spree_credit_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_credit_cards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_credit_cards_id_seq OWNER TO ubuntu;

--
-- Name: spree_credit_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_credit_cards_id_seq OWNED BY spree_credit_cards.id;


--
-- Name: spree_customer_returns; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_customer_returns (
    id integer NOT NULL,
    number character varying,
    stock_location_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_customer_returns OWNER TO ubuntu;

--
-- Name: spree_customer_returns_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_customer_returns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_customer_returns_id_seq OWNER TO ubuntu;

--
-- Name: spree_customer_returns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_customer_returns_id_seq OWNED BY spree_customer_returns.id;


--
-- Name: spree_inventory_units; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_inventory_units (
    id integer NOT NULL,
    state character varying,
    variant_id integer,
    order_id integer,
    shipment_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    pending boolean DEFAULT true,
    line_item_id integer,
    carton_id integer
);


ALTER TABLE public.spree_inventory_units OWNER TO ubuntu;

--
-- Name: spree_inventory_units_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_inventory_units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_inventory_units_id_seq OWNER TO ubuntu;

--
-- Name: spree_inventory_units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_inventory_units_id_seq OWNED BY spree_inventory_units.id;


--
-- Name: spree_line_item_actions; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_line_item_actions (
    id integer NOT NULL,
    line_item_id integer NOT NULL,
    action_id integer NOT NULL,
    quantity integer DEFAULT 0,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_line_item_actions OWNER TO ubuntu;

--
-- Name: spree_line_item_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_line_item_actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_line_item_actions_id_seq OWNER TO ubuntu;

--
-- Name: spree_line_item_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_line_item_actions_id_seq OWNED BY spree_line_item_actions.id;


--
-- Name: spree_line_items; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_line_items (
    id integer NOT NULL,
    variant_id integer,
    order_id integer,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    cost_price numeric(10,2),
    tax_category_id integer,
    adjustment_total numeric(10,2) DEFAULT 0.0,
    additional_tax_total numeric(10,2) DEFAULT 0.0,
    promo_total numeric(10,2) DEFAULT 0.0,
    included_tax_total numeric(10,2) DEFAULT 0.0 NOT NULL
);


ALTER TABLE public.spree_line_items OWNER TO ubuntu;

--
-- Name: spree_line_items_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_line_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_line_items_id_seq OWNER TO ubuntu;

--
-- Name: spree_line_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_line_items_id_seq OWNED BY spree_line_items.id;


--
-- Name: spree_log_entries; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_log_entries (
    id integer NOT NULL,
    source_type character varying,
    source_id integer,
    details text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_log_entries OWNER TO ubuntu;

--
-- Name: spree_log_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_log_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_log_entries_id_seq OWNER TO ubuntu;

--
-- Name: spree_log_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_log_entries_id_seq OWNED BY spree_log_entries.id;


--
-- Name: spree_option_type_prototypes; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_option_type_prototypes (
    prototype_id integer,
    option_type_id integer,
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_option_type_prototypes OWNER TO ubuntu;

--
-- Name: spree_option_type_prototypes_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_option_type_prototypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_option_type_prototypes_id_seq OWNER TO ubuntu;

--
-- Name: spree_option_type_prototypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_option_type_prototypes_id_seq OWNED BY spree_option_type_prototypes.id;


--
-- Name: spree_option_type_translations; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_option_type_translations (
    id integer NOT NULL,
    spree_option_type_id integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    presentation character varying
);


ALTER TABLE public.spree_option_type_translations OWNER TO ubuntu;

--
-- Name: spree_option_type_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_option_type_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_option_type_translations_id_seq OWNER TO ubuntu;

--
-- Name: spree_option_type_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_option_type_translations_id_seq OWNED BY spree_option_type_translations.id;


--
-- Name: spree_option_types; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_option_types (
    id integer NOT NULL,
    name character varying(100),
    presentation character varying(100),
    "position" integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_option_types OWNER TO ubuntu;

--
-- Name: spree_option_types_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_option_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_option_types_id_seq OWNER TO ubuntu;

--
-- Name: spree_option_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_option_types_id_seq OWNED BY spree_option_types.id;


--
-- Name: spree_option_value_translations; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_option_value_translations (
    id integer NOT NULL,
    spree_option_value_id integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    presentation character varying
);


ALTER TABLE public.spree_option_value_translations OWNER TO ubuntu;

--
-- Name: spree_option_value_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_option_value_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_option_value_translations_id_seq OWNER TO ubuntu;

--
-- Name: spree_option_value_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_option_value_translations_id_seq OWNED BY spree_option_value_translations.id;


--
-- Name: spree_option_values; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_option_values (
    id integer NOT NULL,
    "position" integer,
    name character varying,
    presentation character varying,
    option_type_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_option_values OWNER TO ubuntu;

--
-- Name: spree_option_values_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_option_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_option_values_id_seq OWNER TO ubuntu;

--
-- Name: spree_option_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_option_values_id_seq OWNED BY spree_option_values.id;


--
-- Name: spree_option_values_variants; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_option_values_variants (
    variant_id integer,
    option_value_id integer,
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_option_values_variants OWNER TO ubuntu;

--
-- Name: spree_option_values_variants_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_option_values_variants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_option_values_variants_id_seq OWNER TO ubuntu;

--
-- Name: spree_option_values_variants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_option_values_variants_id_seq OWNED BY spree_option_values_variants.id;


--
-- Name: spree_order_mutexes; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_order_mutexes (
    id integer NOT NULL,
    order_id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.spree_order_mutexes OWNER TO ubuntu;

--
-- Name: spree_order_mutexes_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_order_mutexes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_order_mutexes_id_seq OWNER TO ubuntu;

--
-- Name: spree_order_mutexes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_order_mutexes_id_seq OWNED BY spree_order_mutexes.id;


--
-- Name: spree_order_stock_locations; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_order_stock_locations (
    id integer NOT NULL,
    order_id integer,
    variant_id integer,
    quantity integer,
    stock_location_id integer,
    shipment_fulfilled boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_order_stock_locations OWNER TO ubuntu;

--
-- Name: spree_order_stock_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_order_stock_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_order_stock_locations_id_seq OWNER TO ubuntu;

--
-- Name: spree_order_stock_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_order_stock_locations_id_seq OWNED BY spree_order_stock_locations.id;


--
-- Name: spree_orders; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_orders (
    id integer NOT NULL,
    number character varying(32),
    item_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    total numeric(10,2) DEFAULT 0.0 NOT NULL,
    state character varying,
    adjustment_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    user_id integer,
    completed_at timestamp without time zone,
    bill_address_id integer,
    ship_address_id integer,
    payment_total numeric(10,2) DEFAULT 0.0,
    shipment_state character varying,
    payment_state character varying,
    email character varying,
    special_instructions text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    currency character varying,
    last_ip_address character varying,
    created_by_id integer,
    shipment_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    additional_tax_total numeric(10,2) DEFAULT 0.0,
    promo_total numeric(10,2) DEFAULT 0.0,
    channel character varying DEFAULT 'spree'::character varying,
    included_tax_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    item_count integer DEFAULT 0,
    approver_id integer,
    approved_at timestamp without time zone,
    confirmation_delivered boolean DEFAULT false,
    guest_token character varying,
    canceled_at timestamp without time zone,
    canceler_id integer,
    store_id integer,
    approver_name character varying,
    frontend_viewable boolean DEFAULT true NOT NULL
);


ALTER TABLE public.spree_orders OWNER TO ubuntu;

--
-- Name: spree_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_orders_id_seq OWNER TO ubuntu;

--
-- Name: spree_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_orders_id_seq OWNED BY spree_orders.id;


--
-- Name: spree_orders_promotions; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_orders_promotions (
    order_id integer,
    promotion_id integer,
    promotion_code_id integer,
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_orders_promotions OWNER TO ubuntu;

--
-- Name: spree_orders_promotions_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_orders_promotions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_orders_promotions_id_seq OWNER TO ubuntu;

--
-- Name: spree_orders_promotions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_orders_promotions_id_seq OWNED BY spree_orders_promotions.id;


--
-- Name: spree_payment_capture_events; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_payment_capture_events (
    id integer NOT NULL,
    amount numeric(10,2) DEFAULT 0.0,
    payment_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_payment_capture_events OWNER TO ubuntu;

--
-- Name: spree_payment_capture_events_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_payment_capture_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_payment_capture_events_id_seq OWNER TO ubuntu;

--
-- Name: spree_payment_capture_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_payment_capture_events_id_seq OWNED BY spree_payment_capture_events.id;


--
-- Name: spree_payment_methods; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_payment_methods (
    id integer NOT NULL,
    type character varying,
    name character varying,
    description text,
    active boolean DEFAULT true,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    auto_capture boolean,
    preferences text,
    preference_source character varying,
    "position" integer DEFAULT 0,
    available_to_users boolean DEFAULT true,
    available_to_admin boolean DEFAULT true
);


ALTER TABLE public.spree_payment_methods OWNER TO ubuntu;

--
-- Name: spree_payment_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_payment_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_payment_methods_id_seq OWNER TO ubuntu;

--
-- Name: spree_payment_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_payment_methods_id_seq OWNED BY spree_payment_methods.id;


--
-- Name: spree_payments; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_payments (
    id integer NOT NULL,
    amount numeric(10,2) DEFAULT 0.0 NOT NULL,
    order_id integer,
    source_type character varying,
    source_id integer,
    payment_method_id integer,
    state character varying,
    response_code character varying,
    avs_response character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    number character varying,
    cvv_response_code character varying,
    cvv_response_message character varying
);


ALTER TABLE public.spree_payments OWNER TO ubuntu;

--
-- Name: spree_payments_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_payments_id_seq OWNER TO ubuntu;

--
-- Name: spree_payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_payments_id_seq OWNED BY spree_payments.id;


--
-- Name: spree_preferences; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_preferences (
    id integer NOT NULL,
    value text,
    key character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_preferences OWNER TO ubuntu;

--
-- Name: spree_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_preferences_id_seq OWNER TO ubuntu;

--
-- Name: spree_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_preferences_id_seq OWNED BY spree_preferences.id;


--
-- Name: spree_prices; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_prices (
    id integer NOT NULL,
    variant_id integer NOT NULL,
    amount numeric(10,2),
    currency character varying,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    country_iso character varying(2)
);


ALTER TABLE public.spree_prices OWNER TO ubuntu;

--
-- Name: spree_prices_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_prices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_prices_id_seq OWNER TO ubuntu;

--
-- Name: spree_prices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_prices_id_seq OWNED BY spree_prices.id;


--
-- Name: spree_product_option_types; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_product_option_types (
    id integer NOT NULL,
    "position" integer,
    product_id integer,
    option_type_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_product_option_types OWNER TO ubuntu;

--
-- Name: spree_product_option_types_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_product_option_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_product_option_types_id_seq OWNER TO ubuntu;

--
-- Name: spree_product_option_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_product_option_types_id_seq OWNED BY spree_product_option_types.id;


--
-- Name: spree_product_promotion_rules; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_product_promotion_rules (
    product_id integer,
    promotion_rule_id integer,
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_product_promotion_rules OWNER TO ubuntu;

--
-- Name: spree_product_promotion_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_product_promotion_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_product_promotion_rules_id_seq OWNER TO ubuntu;

--
-- Name: spree_product_promotion_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_product_promotion_rules_id_seq OWNED BY spree_product_promotion_rules.id;


--
-- Name: spree_product_properties; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_product_properties (
    id integer NOT NULL,
    value character varying,
    product_id integer,
    property_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    "position" integer DEFAULT 0
);


ALTER TABLE public.spree_product_properties OWNER TO ubuntu;

--
-- Name: spree_product_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_product_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_product_properties_id_seq OWNER TO ubuntu;

--
-- Name: spree_product_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_product_properties_id_seq OWNED BY spree_product_properties.id;


--
-- Name: spree_product_property_translations; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_product_property_translations (
    id integer NOT NULL,
    spree_product_property_id integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    value character varying
);


ALTER TABLE public.spree_product_property_translations OWNER TO ubuntu;

--
-- Name: spree_product_property_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_product_property_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_product_property_translations_id_seq OWNER TO ubuntu;

--
-- Name: spree_product_property_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_product_property_translations_id_seq OWNED BY spree_product_property_translations.id;


--
-- Name: spree_product_translations; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_product_translations (
    id integer NOT NULL,
    spree_product_id integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    description text,
    meta_description character varying,
    meta_keywords character varying,
    slug character varying,
    deleted_at timestamp without time zone
);


ALTER TABLE public.spree_product_translations OWNER TO ubuntu;

--
-- Name: spree_product_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_product_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_product_translations_id_seq OWNER TO ubuntu;

--
-- Name: spree_product_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_product_translations_id_seq OWNED BY spree_product_translations.id;


--
-- Name: spree_products; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_products (
    id integer NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    description text,
    available_on timestamp without time zone,
    deleted_at timestamp without time zone,
    slug character varying,
    meta_description text,
    meta_keywords character varying,
    tax_category_id integer,
    shipping_category_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    promotionable boolean DEFAULT true,
    meta_title character varying
);


ALTER TABLE public.spree_products OWNER TO ubuntu;

--
-- Name: spree_products_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_products_id_seq OWNER TO ubuntu;

--
-- Name: spree_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_products_id_seq OWNED BY spree_products.id;


--
-- Name: spree_products_taxons; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_products_taxons (
    product_id integer,
    taxon_id integer,
    id integer NOT NULL,
    "position" integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_products_taxons OWNER TO ubuntu;

--
-- Name: spree_products_taxons_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_products_taxons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_products_taxons_id_seq OWNER TO ubuntu;

--
-- Name: spree_products_taxons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_products_taxons_id_seq OWNED BY spree_products_taxons.id;


--
-- Name: spree_promotion_action_line_items; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_promotion_action_line_items (
    id integer NOT NULL,
    promotion_action_id integer,
    variant_id integer,
    quantity integer DEFAULT 1,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_promotion_action_line_items OWNER TO ubuntu;

--
-- Name: spree_promotion_action_line_items_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_promotion_action_line_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_promotion_action_line_items_id_seq OWNER TO ubuntu;

--
-- Name: spree_promotion_action_line_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_promotion_action_line_items_id_seq OWNED BY spree_promotion_action_line_items.id;


--
-- Name: spree_promotion_actions; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_promotion_actions (
    id integer NOT NULL,
    promotion_id integer,
    "position" integer,
    type character varying,
    deleted_at timestamp without time zone,
    preferences text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_promotion_actions OWNER TO ubuntu;

--
-- Name: spree_promotion_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_promotion_actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_promotion_actions_id_seq OWNER TO ubuntu;

--
-- Name: spree_promotion_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_promotion_actions_id_seq OWNED BY spree_promotion_actions.id;


--
-- Name: spree_promotion_categories; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_promotion_categories (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    code character varying
);


ALTER TABLE public.spree_promotion_categories OWNER TO ubuntu;

--
-- Name: spree_promotion_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_promotion_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_promotion_categories_id_seq OWNER TO ubuntu;

--
-- Name: spree_promotion_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_promotion_categories_id_seq OWNED BY spree_promotion_categories.id;


--
-- Name: spree_promotion_codes; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_promotion_codes (
    id integer NOT NULL,
    promotion_id integer NOT NULL,
    value character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_promotion_codes OWNER TO ubuntu;

--
-- Name: spree_promotion_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_promotion_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_promotion_codes_id_seq OWNER TO ubuntu;

--
-- Name: spree_promotion_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_promotion_codes_id_seq OWNED BY spree_promotion_codes.id;


--
-- Name: spree_promotion_rule_taxons; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_promotion_rule_taxons (
    id integer NOT NULL,
    taxon_id integer,
    promotion_rule_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_promotion_rule_taxons OWNER TO ubuntu;

--
-- Name: spree_promotion_rule_taxons_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_promotion_rule_taxons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_promotion_rule_taxons_id_seq OWNER TO ubuntu;

--
-- Name: spree_promotion_rule_taxons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_promotion_rule_taxons_id_seq OWNED BY spree_promotion_rule_taxons.id;


--
-- Name: spree_promotion_rules; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_promotion_rules (
    id integer NOT NULL,
    promotion_id integer,
    product_group_id integer,
    type character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    code character varying,
    preferences text
);


ALTER TABLE public.spree_promotion_rules OWNER TO ubuntu;

--
-- Name: spree_promotion_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_promotion_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_promotion_rules_id_seq OWNER TO ubuntu;

--
-- Name: spree_promotion_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_promotion_rules_id_seq OWNED BY spree_promotion_rules.id;


--
-- Name: spree_promotion_rules_users; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_promotion_rules_users (
    user_id integer,
    promotion_rule_id integer,
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_promotion_rules_users OWNER TO ubuntu;

--
-- Name: spree_promotion_rules_users_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_promotion_rules_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_promotion_rules_users_id_seq OWNER TO ubuntu;

--
-- Name: spree_promotion_rules_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_promotion_rules_users_id_seq OWNED BY spree_promotion_rules_users.id;


--
-- Name: spree_promotion_translations; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_promotion_translations (
    id integer NOT NULL,
    spree_promotion_id integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    description character varying
);


ALTER TABLE public.spree_promotion_translations OWNER TO ubuntu;

--
-- Name: spree_promotion_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_promotion_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_promotion_translations_id_seq OWNER TO ubuntu;

--
-- Name: spree_promotion_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_promotion_translations_id_seq OWNED BY spree_promotion_translations.id;


--
-- Name: spree_promotions; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_promotions (
    id integer NOT NULL,
    description character varying,
    expires_at timestamp without time zone,
    starts_at timestamp without time zone,
    name character varying,
    type character varying,
    usage_limit integer,
    match_policy character varying DEFAULT 'all'::character varying,
    code character varying,
    advertise boolean DEFAULT false,
    path character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    promotion_category_id integer,
    per_code_usage_limit integer,
    apply_automatically boolean DEFAULT false
);


ALTER TABLE public.spree_promotions OWNER TO ubuntu;

--
-- Name: spree_promotions_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_promotions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_promotions_id_seq OWNER TO ubuntu;

--
-- Name: spree_promotions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_promotions_id_seq OWNED BY spree_promotions.id;


--
-- Name: spree_properties; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_properties (
    id integer NOT NULL,
    name character varying,
    presentation character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_properties OWNER TO ubuntu;

--
-- Name: spree_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_properties_id_seq OWNER TO ubuntu;

--
-- Name: spree_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_properties_id_seq OWNED BY spree_properties.id;


--
-- Name: spree_property_prototypes; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_property_prototypes (
    prototype_id integer,
    property_id integer,
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_property_prototypes OWNER TO ubuntu;

--
-- Name: spree_property_prototypes_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_property_prototypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_property_prototypes_id_seq OWNER TO ubuntu;

--
-- Name: spree_property_prototypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_property_prototypes_id_seq OWNED BY spree_property_prototypes.id;


--
-- Name: spree_property_translations; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_property_translations (
    id integer NOT NULL,
    spree_property_id integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    presentation character varying
);


ALTER TABLE public.spree_property_translations OWNER TO ubuntu;

--
-- Name: spree_property_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_property_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_property_translations_id_seq OWNER TO ubuntu;

--
-- Name: spree_property_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_property_translations_id_seq OWNED BY spree_property_translations.id;


--
-- Name: spree_prototype_taxons; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_prototype_taxons (
    id integer NOT NULL,
    taxon_id integer,
    prototype_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_prototype_taxons OWNER TO ubuntu;

--
-- Name: spree_prototype_taxons_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_prototype_taxons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_prototype_taxons_id_seq OWNER TO ubuntu;

--
-- Name: spree_prototype_taxons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_prototype_taxons_id_seq OWNED BY spree_prototype_taxons.id;


--
-- Name: spree_prototypes; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_prototypes (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_prototypes OWNER TO ubuntu;

--
-- Name: spree_prototypes_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_prototypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_prototypes_id_seq OWNER TO ubuntu;

--
-- Name: spree_prototypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_prototypes_id_seq OWNED BY spree_prototypes.id;


--
-- Name: spree_refund_reasons; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_refund_reasons (
    id integer NOT NULL,
    name character varying,
    active boolean DEFAULT true,
    mutable boolean DEFAULT true,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    code character varying
);


ALTER TABLE public.spree_refund_reasons OWNER TO ubuntu;

--
-- Name: spree_refund_reasons_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_refund_reasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_refund_reasons_id_seq OWNER TO ubuntu;

--
-- Name: spree_refund_reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_refund_reasons_id_seq OWNED BY spree_refund_reasons.id;


--
-- Name: spree_refunds; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_refunds (
    id integer NOT NULL,
    payment_id integer,
    amount numeric(10,2) DEFAULT 0.0 NOT NULL,
    transaction_id character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    refund_reason_id integer,
    reimbursement_id integer
);


ALTER TABLE public.spree_refunds OWNER TO ubuntu;

--
-- Name: spree_refunds_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_refunds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_refunds_id_seq OWNER TO ubuntu;

--
-- Name: spree_refunds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_refunds_id_seq OWNED BY spree_refunds.id;


--
-- Name: spree_reimbursement_credits; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_reimbursement_credits (
    id integer NOT NULL,
    amount numeric(10,2) DEFAULT 0.0 NOT NULL,
    reimbursement_id integer,
    creditable_id integer,
    creditable_type character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_reimbursement_credits OWNER TO ubuntu;

--
-- Name: spree_reimbursement_credits_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_reimbursement_credits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_reimbursement_credits_id_seq OWNER TO ubuntu;

--
-- Name: spree_reimbursement_credits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_reimbursement_credits_id_seq OWNED BY spree_reimbursement_credits.id;


--
-- Name: spree_reimbursement_types; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_reimbursement_types (
    id integer NOT NULL,
    name character varying,
    active boolean DEFAULT true,
    mutable boolean DEFAULT true,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    type character varying
);


ALTER TABLE public.spree_reimbursement_types OWNER TO ubuntu;

--
-- Name: spree_reimbursement_types_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_reimbursement_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_reimbursement_types_id_seq OWNER TO ubuntu;

--
-- Name: spree_reimbursement_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_reimbursement_types_id_seq OWNED BY spree_reimbursement_types.id;


--
-- Name: spree_reimbursements; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_reimbursements (
    id integer NOT NULL,
    number character varying,
    reimbursement_status character varying,
    customer_return_id integer,
    order_id integer,
    total numeric(10,2),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_reimbursements OWNER TO ubuntu;

--
-- Name: spree_reimbursements_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_reimbursements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_reimbursements_id_seq OWNER TO ubuntu;

--
-- Name: spree_reimbursements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_reimbursements_id_seq OWNED BY spree_reimbursements.id;


--
-- Name: spree_return_authorizations; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_return_authorizations (
    id integer NOT NULL,
    number character varying,
    state character varying,
    order_id integer,
    memo text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    stock_location_id integer,
    return_reason_id integer
);


ALTER TABLE public.spree_return_authorizations OWNER TO ubuntu;

--
-- Name: spree_return_authorizations_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_return_authorizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_return_authorizations_id_seq OWNER TO ubuntu;

--
-- Name: spree_return_authorizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_return_authorizations_id_seq OWNED BY spree_return_authorizations.id;


--
-- Name: spree_return_items; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_return_items (
    id integer NOT NULL,
    return_authorization_id integer,
    inventory_unit_id integer,
    exchange_variant_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    amount numeric(12,4) DEFAULT 0.0 NOT NULL,
    included_tax_total numeric(12,4) DEFAULT 0.0 NOT NULL,
    additional_tax_total numeric(12,4) DEFAULT 0.0 NOT NULL,
    reception_status character varying,
    acceptance_status character varying,
    customer_return_id integer,
    reimbursement_id integer,
    exchange_inventory_unit_id integer,
    acceptance_status_errors text,
    preferred_reimbursement_type_id integer,
    override_reimbursement_type_id integer,
    resellable boolean DEFAULT true NOT NULL,
    return_reason_id integer
);


ALTER TABLE public.spree_return_items OWNER TO ubuntu;

--
-- Name: spree_return_items_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_return_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_return_items_id_seq OWNER TO ubuntu;

--
-- Name: spree_return_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_return_items_id_seq OWNED BY spree_return_items.id;


--
-- Name: spree_return_reasons; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_return_reasons (
    id integer NOT NULL,
    name character varying,
    active boolean DEFAULT true,
    mutable boolean DEFAULT true,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_return_reasons OWNER TO ubuntu;

--
-- Name: spree_return_reasons_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_return_reasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_return_reasons_id_seq OWNER TO ubuntu;

--
-- Name: spree_return_reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_return_reasons_id_seq OWNED BY spree_return_reasons.id;


--
-- Name: spree_roles; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_roles (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_roles OWNER TO ubuntu;

--
-- Name: spree_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_roles_id_seq OWNER TO ubuntu;

--
-- Name: spree_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_roles_id_seq OWNED BY spree_roles.id;


--
-- Name: spree_roles_users; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_roles_users (
    role_id integer,
    user_id integer,
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_roles_users OWNER TO ubuntu;

--
-- Name: spree_roles_users_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_roles_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_roles_users_id_seq OWNER TO ubuntu;

--
-- Name: spree_roles_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_roles_users_id_seq OWNED BY spree_roles_users.id;


--
-- Name: spree_shipments; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_shipments (
    id integer NOT NULL,
    tracking character varying,
    number character varying,
    cost numeric(10,2) DEFAULT 0.0,
    shipped_at timestamp without time zone,
    order_id integer,
    deprecated_address_id integer,
    state character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    stock_location_id integer,
    adjustment_total numeric(10,2) DEFAULT 0.0,
    additional_tax_total numeric(10,2) DEFAULT 0.0,
    promo_total numeric(10,2) DEFAULT 0.0,
    included_tax_total numeric(10,2) DEFAULT 0.0 NOT NULL
);


ALTER TABLE public.spree_shipments OWNER TO ubuntu;

--
-- Name: spree_shipments_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_shipments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_shipments_id_seq OWNER TO ubuntu;

--
-- Name: spree_shipments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_shipments_id_seq OWNED BY spree_shipments.id;


--
-- Name: spree_shipping_categories; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_shipping_categories (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_shipping_categories OWNER TO ubuntu;

--
-- Name: spree_shipping_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_shipping_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_shipping_categories_id_seq OWNER TO ubuntu;

--
-- Name: spree_shipping_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_shipping_categories_id_seq OWNED BY spree_shipping_categories.id;


--
-- Name: spree_shipping_method_categories; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_shipping_method_categories (
    id integer NOT NULL,
    shipping_method_id integer NOT NULL,
    shipping_category_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_shipping_method_categories OWNER TO ubuntu;

--
-- Name: spree_shipping_method_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_shipping_method_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_shipping_method_categories_id_seq OWNER TO ubuntu;

--
-- Name: spree_shipping_method_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_shipping_method_categories_id_seq OWNED BY spree_shipping_method_categories.id;


--
-- Name: spree_shipping_method_stock_locations; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_shipping_method_stock_locations (
    id integer NOT NULL,
    shipping_method_id integer,
    stock_location_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_shipping_method_stock_locations OWNER TO ubuntu;

--
-- Name: spree_shipping_method_stock_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_shipping_method_stock_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_shipping_method_stock_locations_id_seq OWNER TO ubuntu;

--
-- Name: spree_shipping_method_stock_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_shipping_method_stock_locations_id_seq OWNED BY spree_shipping_method_stock_locations.id;


--
-- Name: spree_shipping_method_translations; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_shipping_method_translations (
    id integer NOT NULL,
    spree_shipping_method_id integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying
);


ALTER TABLE public.spree_shipping_method_translations OWNER TO ubuntu;

--
-- Name: spree_shipping_method_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_shipping_method_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_shipping_method_translations_id_seq OWNER TO ubuntu;

--
-- Name: spree_shipping_method_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_shipping_method_translations_id_seq OWNED BY spree_shipping_method_translations.id;


--
-- Name: spree_shipping_method_zones; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_shipping_method_zones (
    shipping_method_id integer,
    zone_id integer,
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_shipping_method_zones OWNER TO ubuntu;

--
-- Name: spree_shipping_method_zones_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_shipping_method_zones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_shipping_method_zones_id_seq OWNER TO ubuntu;

--
-- Name: spree_shipping_method_zones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_shipping_method_zones_id_seq OWNED BY spree_shipping_method_zones.id;


--
-- Name: spree_shipping_methods; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_shipping_methods (
    id integer NOT NULL,
    name character varying,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    tracking_url character varying,
    admin_name character varying,
    tax_category_id integer,
    code character varying,
    available_to_all boolean DEFAULT true,
    carrier character varying,
    service_level character varying,
    available_to_users boolean DEFAULT true
);


ALTER TABLE public.spree_shipping_methods OWNER TO ubuntu;

--
-- Name: spree_shipping_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_shipping_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_shipping_methods_id_seq OWNER TO ubuntu;

--
-- Name: spree_shipping_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_shipping_methods_id_seq OWNED BY spree_shipping_methods.id;


--
-- Name: spree_shipping_rate_taxes; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_shipping_rate_taxes (
    id integer NOT NULL,
    amount numeric(8,2) DEFAULT 0.0 NOT NULL,
    tax_rate_id integer,
    shipping_rate_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_shipping_rate_taxes OWNER TO ubuntu;

--
-- Name: spree_shipping_rate_taxes_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_shipping_rate_taxes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_shipping_rate_taxes_id_seq OWNER TO ubuntu;

--
-- Name: spree_shipping_rate_taxes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_shipping_rate_taxes_id_seq OWNED BY spree_shipping_rate_taxes.id;


--
-- Name: spree_shipping_rates; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_shipping_rates (
    id integer NOT NULL,
    shipment_id integer,
    shipping_method_id integer,
    selected boolean DEFAULT false,
    cost numeric(8,2) DEFAULT 0,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    tax_rate_id integer
);


ALTER TABLE public.spree_shipping_rates OWNER TO ubuntu;

--
-- Name: spree_shipping_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_shipping_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_shipping_rates_id_seq OWNER TO ubuntu;

--
-- Name: spree_shipping_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_shipping_rates_id_seq OWNED BY spree_shipping_rates.id;


--
-- Name: spree_state_changes; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_state_changes (
    id integer NOT NULL,
    name character varying,
    previous_state character varying,
    stateful_id integer,
    user_id integer,
    stateful_type character varying,
    next_state character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_state_changes OWNER TO ubuntu;

--
-- Name: spree_state_changes_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_state_changes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_state_changes_id_seq OWNER TO ubuntu;

--
-- Name: spree_state_changes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_state_changes_id_seq OWNED BY spree_state_changes.id;


--
-- Name: spree_states; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_states (
    id integer NOT NULL,
    name character varying,
    abbr character varying,
    country_id integer,
    updated_at timestamp without time zone,
    created_at timestamp without time zone
);


ALTER TABLE public.spree_states OWNER TO ubuntu;

--
-- Name: spree_states_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_states_id_seq OWNER TO ubuntu;

--
-- Name: spree_states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_states_id_seq OWNED BY spree_states.id;


--
-- Name: spree_stock_items; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_stock_items (
    id integer NOT NULL,
    stock_location_id integer,
    variant_id integer,
    count_on_hand integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    backorderable boolean DEFAULT false,
    deleted_at timestamp without time zone
);


ALTER TABLE public.spree_stock_items OWNER TO ubuntu;

--
-- Name: spree_stock_items_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_stock_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_stock_items_id_seq OWNER TO ubuntu;

--
-- Name: spree_stock_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_stock_items_id_seq OWNED BY spree_stock_items.id;


--
-- Name: spree_stock_locations; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_stock_locations (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    "default" boolean DEFAULT false NOT NULL,
    address1 character varying,
    address2 character varying,
    city character varying,
    state_id integer,
    state_name character varying,
    country_id integer,
    zipcode character varying,
    phone character varying,
    active boolean DEFAULT true,
    backorderable_default boolean DEFAULT false,
    propagate_all_variants boolean DEFAULT true,
    admin_name character varying,
    "position" integer DEFAULT 0,
    restock_inventory boolean DEFAULT true NOT NULL,
    fulfillable boolean DEFAULT true NOT NULL,
    code character varying,
    check_stock_on_transfer boolean DEFAULT true
);


ALTER TABLE public.spree_stock_locations OWNER TO ubuntu;

--
-- Name: spree_stock_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_stock_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_stock_locations_id_seq OWNER TO ubuntu;

--
-- Name: spree_stock_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_stock_locations_id_seq OWNED BY spree_stock_locations.id;


--
-- Name: spree_stock_movements; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_stock_movements (
    id integer NOT NULL,
    stock_item_id integer,
    quantity integer DEFAULT 0,
    action character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    originator_type character varying,
    originator_id integer
);


ALTER TABLE public.spree_stock_movements OWNER TO ubuntu;

--
-- Name: spree_stock_movements_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_stock_movements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_stock_movements_id_seq OWNER TO ubuntu;

--
-- Name: spree_stock_movements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_stock_movements_id_seq OWNED BY spree_stock_movements.id;


--
-- Name: spree_stock_transfers; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_stock_transfers (
    id integer NOT NULL,
    description character varying,
    source_location_id integer,
    destination_location_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    number character varying,
    shipped_at timestamp without time zone,
    closed_at timestamp without time zone,
    tracking_number character varying,
    created_by_id integer,
    closed_by_id integer,
    finalized_at timestamp without time zone,
    finalized_by_id integer,
    deleted_at timestamp without time zone
);


ALTER TABLE public.spree_stock_transfers OWNER TO ubuntu;

--
-- Name: spree_stock_transfers_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_stock_transfers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_stock_transfers_id_seq OWNER TO ubuntu;

--
-- Name: spree_stock_transfers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_stock_transfers_id_seq OWNED BY spree_stock_transfers.id;


--
-- Name: spree_store_credit_categories; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_store_credit_categories (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_store_credit_categories OWNER TO ubuntu;

--
-- Name: spree_store_credit_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_store_credit_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_store_credit_categories_id_seq OWNER TO ubuntu;

--
-- Name: spree_store_credit_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_store_credit_categories_id_seq OWNED BY spree_store_credit_categories.id;


--
-- Name: spree_store_credit_events; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_store_credit_events (
    id integer NOT NULL,
    store_credit_id integer NOT NULL,
    action character varying NOT NULL,
    amount numeric(8,2),
    user_total_amount numeric(8,2) DEFAULT 0.0 NOT NULL,
    authorization_code character varying NOT NULL,
    deleted_at timestamp without time zone,
    originator_type character varying,
    originator_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    update_reason_id integer
);


ALTER TABLE public.spree_store_credit_events OWNER TO ubuntu;

--
-- Name: spree_store_credit_events_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_store_credit_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_store_credit_events_id_seq OWNER TO ubuntu;

--
-- Name: spree_store_credit_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_store_credit_events_id_seq OWNED BY spree_store_credit_events.id;


--
-- Name: spree_store_credit_types; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_store_credit_types (
    id integer NOT NULL,
    name character varying,
    priority integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_store_credit_types OWNER TO ubuntu;

--
-- Name: spree_store_credit_types_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_store_credit_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_store_credit_types_id_seq OWNER TO ubuntu;

--
-- Name: spree_store_credit_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_store_credit_types_id_seq OWNED BY spree_store_credit_types.id;


--
-- Name: spree_store_credit_update_reasons; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_store_credit_update_reasons (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_store_credit_update_reasons OWNER TO ubuntu;

--
-- Name: spree_store_credit_update_reasons_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_store_credit_update_reasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_store_credit_update_reasons_id_seq OWNER TO ubuntu;

--
-- Name: spree_store_credit_update_reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_store_credit_update_reasons_id_seq OWNED BY spree_store_credit_update_reasons.id;


--
-- Name: spree_store_credits; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_store_credits (
    id integer NOT NULL,
    user_id integer,
    category_id integer,
    created_by_id integer,
    amount numeric(8,2) DEFAULT 0.0 NOT NULL,
    amount_used numeric(8,2) DEFAULT 0.0 NOT NULL,
    amount_authorized numeric(8,2) DEFAULT 0.0 NOT NULL,
    currency character varying,
    memo text,
    spree_store_credits timestamp without time zone,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    type_id integer,
    invalidated_at timestamp without time zone
);


ALTER TABLE public.spree_store_credits OWNER TO ubuntu;

--
-- Name: spree_store_credits_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_store_credits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_store_credits_id_seq OWNER TO ubuntu;

--
-- Name: spree_store_credits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_store_credits_id_seq OWNED BY spree_store_credits.id;


--
-- Name: spree_store_payment_methods; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_store_payment_methods (
    id integer NOT NULL,
    store_id integer NOT NULL,
    payment_method_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_store_payment_methods OWNER TO ubuntu;

--
-- Name: spree_store_payment_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_store_payment_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_store_payment_methods_id_seq OWNER TO ubuntu;

--
-- Name: spree_store_payment_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_store_payment_methods_id_seq OWNED BY spree_store_payment_methods.id;


--
-- Name: spree_store_translations; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_store_translations (
    id integer NOT NULL,
    spree_store_id integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    meta_description text,
    meta_keywords text,
    seo_title character varying
);


ALTER TABLE public.spree_store_translations OWNER TO ubuntu;

--
-- Name: spree_store_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_store_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_store_translations_id_seq OWNER TO ubuntu;

--
-- Name: spree_store_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_store_translations_id_seq OWNED BY spree_store_translations.id;


--
-- Name: spree_stores; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_stores (
    id integer NOT NULL,
    name character varying,
    url character varying,
    meta_description text,
    meta_keywords text,
    seo_title character varying,
    mail_from_address character varying,
    default_currency character varying,
    code character varying,
    "default" boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    cart_tax_country_iso character varying
);


ALTER TABLE public.spree_stores OWNER TO ubuntu;

--
-- Name: spree_stores_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_stores_id_seq OWNER TO ubuntu;

--
-- Name: spree_stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_stores_id_seq OWNED BY spree_stores.id;


--
-- Name: spree_tax_categories; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_tax_categories (
    id integer NOT NULL,
    name character varying,
    description character varying,
    is_default boolean DEFAULT false,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    tax_code character varying
);


ALTER TABLE public.spree_tax_categories OWNER TO ubuntu;

--
-- Name: spree_tax_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_tax_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_tax_categories_id_seq OWNER TO ubuntu;

--
-- Name: spree_tax_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_tax_categories_id_seq OWNED BY spree_tax_categories.id;


--
-- Name: spree_tax_rates; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_tax_rates (
    id integer NOT NULL,
    amount numeric(8,5),
    zone_id integer,
    tax_category_id integer,
    included_in_price boolean DEFAULT false,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name character varying,
    show_rate_in_label boolean DEFAULT true,
    deleted_at timestamp without time zone
);


ALTER TABLE public.spree_tax_rates OWNER TO ubuntu;

--
-- Name: spree_tax_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_tax_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_tax_rates_id_seq OWNER TO ubuntu;

--
-- Name: spree_tax_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_tax_rates_id_seq OWNED BY spree_tax_rates.id;


--
-- Name: spree_taxon_translations; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_taxon_translations (
    id integer NOT NULL,
    spree_taxon_id integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    description text,
    meta_title character varying,
    meta_description character varying,
    meta_keywords character varying,
    permalink character varying
);


ALTER TABLE public.spree_taxon_translations OWNER TO ubuntu;

--
-- Name: spree_taxon_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_taxon_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_taxon_translations_id_seq OWNER TO ubuntu;

--
-- Name: spree_taxon_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_taxon_translations_id_seq OWNED BY spree_taxon_translations.id;


--
-- Name: spree_taxonomies; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_taxonomies (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    "position" integer DEFAULT 0
);


ALTER TABLE public.spree_taxonomies OWNER TO ubuntu;

--
-- Name: spree_taxonomies_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_taxonomies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_taxonomies_id_seq OWNER TO ubuntu;

--
-- Name: spree_taxonomies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_taxonomies_id_seq OWNED BY spree_taxonomies.id;


--
-- Name: spree_taxonomy_translations; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_taxonomy_translations (
    id integer NOT NULL,
    spree_taxonomy_id integer NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying
);


ALTER TABLE public.spree_taxonomy_translations OWNER TO ubuntu;

--
-- Name: spree_taxonomy_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_taxonomy_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_taxonomy_translations_id_seq OWNER TO ubuntu;

--
-- Name: spree_taxonomy_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_taxonomy_translations_id_seq OWNED BY spree_taxonomy_translations.id;


--
-- Name: spree_taxons; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_taxons (
    id integer NOT NULL,
    parent_id integer,
    "position" integer DEFAULT 0,
    name character varying,
    permalink character varying,
    taxonomy_id integer,
    lft integer,
    rgt integer,
    icon_file_name character varying,
    icon_content_type character varying,
    icon_file_size integer,
    icon_updated_at timestamp without time zone,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    meta_title character varying,
    meta_description character varying,
    meta_keywords character varying,
    depth integer
);


ALTER TABLE public.spree_taxons OWNER TO ubuntu;

--
-- Name: spree_taxons_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_taxons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_taxons_id_seq OWNER TO ubuntu;

--
-- Name: spree_taxons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_taxons_id_seq OWNED BY spree_taxons.id;


--
-- Name: spree_transfer_items; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_transfer_items (
    id integer NOT NULL,
    variant_id integer NOT NULL,
    stock_transfer_id integer NOT NULL,
    expected_quantity integer DEFAULT 0 NOT NULL,
    received_quantity integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.spree_transfer_items OWNER TO ubuntu;

--
-- Name: spree_transfer_items_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_transfer_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_transfer_items_id_seq OWNER TO ubuntu;

--
-- Name: spree_transfer_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_transfer_items_id_seq OWNED BY spree_transfer_items.id;


--
-- Name: spree_unit_cancels; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_unit_cancels (
    id integer NOT NULL,
    inventory_unit_id integer NOT NULL,
    reason character varying,
    created_by character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_unit_cancels OWNER TO ubuntu;

--
-- Name: spree_unit_cancels_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_unit_cancels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_unit_cancels_id_seq OWNER TO ubuntu;

--
-- Name: spree_unit_cancels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_unit_cancels_id_seq OWNED BY spree_unit_cancels.id;


--
-- Name: spree_user_addresses; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_user_addresses (
    id integer NOT NULL,
    user_id integer NOT NULL,
    address_id integer NOT NULL,
    "default" boolean DEFAULT false,
    archived boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_user_addresses OWNER TO ubuntu;

--
-- Name: spree_user_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_user_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_user_addresses_id_seq OWNER TO ubuntu;

--
-- Name: spree_user_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_user_addresses_id_seq OWNED BY spree_user_addresses.id;


--
-- Name: spree_user_stock_locations; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_user_stock_locations (
    id integer NOT NULL,
    user_id integer,
    stock_location_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_user_stock_locations OWNER TO ubuntu;

--
-- Name: spree_user_stock_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_user_stock_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_user_stock_locations_id_seq OWNER TO ubuntu;

--
-- Name: spree_user_stock_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_user_stock_locations_id_seq OWNED BY spree_user_stock_locations.id;


--
-- Name: spree_users; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_users (
    id integer NOT NULL,
    encrypted_password character varying(128),
    password_salt character varying(128),
    email character varying,
    remember_token character varying,
    persistence_token character varying,
    reset_password_token character varying,
    perishable_token character varying,
    sign_in_count integer DEFAULT 0 NOT NULL,
    failed_attempts integer DEFAULT 0 NOT NULL,
    last_request_at timestamp without time zone,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    login character varying,
    ship_address_id integer,
    bill_address_id integer,
    authentication_token character varying,
    unlock_token character varying,
    locked_at timestamp without time zone,
    reset_password_sent_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    spree_api_key character varying(48),
    remember_created_at timestamp without time zone,
    deleted_at timestamp without time zone,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone
);


ALTER TABLE public.spree_users OWNER TO ubuntu;

--
-- Name: spree_users_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_users_id_seq OWNER TO ubuntu;

--
-- Name: spree_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_users_id_seq OWNED BY spree_users.id;


--
-- Name: spree_variant_property_rule_conditions; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_variant_property_rule_conditions (
    id integer NOT NULL,
    option_value_id integer,
    variant_property_rule_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_variant_property_rule_conditions OWNER TO ubuntu;

--
-- Name: spree_variant_property_rule_conditions_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_variant_property_rule_conditions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_variant_property_rule_conditions_id_seq OWNER TO ubuntu;

--
-- Name: spree_variant_property_rule_conditions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_variant_property_rule_conditions_id_seq OWNED BY spree_variant_property_rule_conditions.id;


--
-- Name: spree_variant_property_rule_values; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_variant_property_rule_values (
    id integer NOT NULL,
    value text,
    "position" integer DEFAULT 0,
    property_id integer,
    variant_property_rule_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_variant_property_rule_values OWNER TO ubuntu;

--
-- Name: spree_variant_property_rule_values_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_variant_property_rule_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_variant_property_rule_values_id_seq OWNER TO ubuntu;

--
-- Name: spree_variant_property_rule_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_variant_property_rule_values_id_seq OWNED BY spree_variant_property_rule_values.id;


--
-- Name: spree_variant_property_rules; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_variant_property_rules (
    id integer NOT NULL,
    product_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_variant_property_rules OWNER TO ubuntu;

--
-- Name: spree_variant_property_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_variant_property_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_variant_property_rules_id_seq OWNER TO ubuntu;

--
-- Name: spree_variant_property_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_variant_property_rules_id_seq OWNED BY spree_variant_property_rules.id;


--
-- Name: spree_variants; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_variants (
    id integer NOT NULL,
    sku character varying DEFAULT ''::character varying NOT NULL,
    weight numeric(8,2) DEFAULT 0.0,
    height numeric(8,2),
    width numeric(8,2),
    depth numeric(8,2),
    deleted_at timestamp without time zone,
    is_master boolean DEFAULT false,
    product_id integer,
    cost_price numeric(10,2),
    "position" integer,
    cost_currency character varying,
    track_inventory boolean DEFAULT true,
    tax_category_id integer,
    updated_at timestamp without time zone,
    created_at timestamp without time zone
);


ALTER TABLE public.spree_variants OWNER TO ubuntu;

--
-- Name: spree_variants_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_variants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_variants_id_seq OWNER TO ubuntu;

--
-- Name: spree_variants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_variants_id_seq OWNED BY spree_variants.id;


--
-- Name: spree_zone_members; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_zone_members (
    id integer NOT NULL,
    zoneable_type character varying,
    zoneable_id integer,
    zone_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_zone_members OWNER TO ubuntu;

--
-- Name: spree_zone_members_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_zone_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_zone_members_id_seq OWNER TO ubuntu;

--
-- Name: spree_zone_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_zone_members_id_seq OWNED BY spree_zone_members.id;


--
-- Name: spree_zones; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE spree_zones (
    id integer NOT NULL,
    name character varying,
    description character varying,
    default_tax boolean DEFAULT false,
    zone_members_count integer DEFAULT 0,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_zones OWNER TO ubuntu;

--
-- Name: spree_zones_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE spree_zones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spree_zones_id_seq OWNER TO ubuntu;

--
-- Name: spree_zones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE spree_zones_id_seq OWNED BY spree_zones.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('friendly_id_slugs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_addresses ALTER COLUMN id SET DEFAULT nextval('spree_addresses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_adjustment_reasons ALTER COLUMN id SET DEFAULT nextval('spree_adjustment_reasons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_adjustments ALTER COLUMN id SET DEFAULT nextval('spree_adjustments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_assets ALTER COLUMN id SET DEFAULT nextval('spree_assets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_calculators ALTER COLUMN id SET DEFAULT nextval('spree_calculators_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_cartons ALTER COLUMN id SET DEFAULT nextval('spree_cartons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_countries ALTER COLUMN id SET DEFAULT nextval('spree_countries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_credit_cards ALTER COLUMN id SET DEFAULT nextval('spree_credit_cards_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_customer_returns ALTER COLUMN id SET DEFAULT nextval('spree_customer_returns_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_inventory_units ALTER COLUMN id SET DEFAULT nextval('spree_inventory_units_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_line_item_actions ALTER COLUMN id SET DEFAULT nextval('spree_line_item_actions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_line_items ALTER COLUMN id SET DEFAULT nextval('spree_line_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_log_entries ALTER COLUMN id SET DEFAULT nextval('spree_log_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_option_type_prototypes ALTER COLUMN id SET DEFAULT nextval('spree_option_type_prototypes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_option_type_translations ALTER COLUMN id SET DEFAULT nextval('spree_option_type_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_option_types ALTER COLUMN id SET DEFAULT nextval('spree_option_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_option_value_translations ALTER COLUMN id SET DEFAULT nextval('spree_option_value_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_option_values ALTER COLUMN id SET DEFAULT nextval('spree_option_values_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_option_values_variants ALTER COLUMN id SET DEFAULT nextval('spree_option_values_variants_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_order_mutexes ALTER COLUMN id SET DEFAULT nextval('spree_order_mutexes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_order_stock_locations ALTER COLUMN id SET DEFAULT nextval('spree_order_stock_locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_orders ALTER COLUMN id SET DEFAULT nextval('spree_orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_orders_promotions ALTER COLUMN id SET DEFAULT nextval('spree_orders_promotions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_payment_capture_events ALTER COLUMN id SET DEFAULT nextval('spree_payment_capture_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_payment_methods ALTER COLUMN id SET DEFAULT nextval('spree_payment_methods_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_payments ALTER COLUMN id SET DEFAULT nextval('spree_payments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_preferences ALTER COLUMN id SET DEFAULT nextval('spree_preferences_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_prices ALTER COLUMN id SET DEFAULT nextval('spree_prices_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_product_option_types ALTER COLUMN id SET DEFAULT nextval('spree_product_option_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_product_promotion_rules ALTER COLUMN id SET DEFAULT nextval('spree_product_promotion_rules_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_product_properties ALTER COLUMN id SET DEFAULT nextval('spree_product_properties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_product_property_translations ALTER COLUMN id SET DEFAULT nextval('spree_product_property_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_product_translations ALTER COLUMN id SET DEFAULT nextval('spree_product_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_products ALTER COLUMN id SET DEFAULT nextval('spree_products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_products_taxons ALTER COLUMN id SET DEFAULT nextval('spree_products_taxons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_promotion_action_line_items ALTER COLUMN id SET DEFAULT nextval('spree_promotion_action_line_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_promotion_actions ALTER COLUMN id SET DEFAULT nextval('spree_promotion_actions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_promotion_categories ALTER COLUMN id SET DEFAULT nextval('spree_promotion_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_promotion_codes ALTER COLUMN id SET DEFAULT nextval('spree_promotion_codes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_promotion_rule_taxons ALTER COLUMN id SET DEFAULT nextval('spree_promotion_rule_taxons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_promotion_rules ALTER COLUMN id SET DEFAULT nextval('spree_promotion_rules_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_promotion_rules_users ALTER COLUMN id SET DEFAULT nextval('spree_promotion_rules_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_promotion_translations ALTER COLUMN id SET DEFAULT nextval('spree_promotion_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_promotions ALTER COLUMN id SET DEFAULT nextval('spree_promotions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_properties ALTER COLUMN id SET DEFAULT nextval('spree_properties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_property_prototypes ALTER COLUMN id SET DEFAULT nextval('spree_property_prototypes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_property_translations ALTER COLUMN id SET DEFAULT nextval('spree_property_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_prototype_taxons ALTER COLUMN id SET DEFAULT nextval('spree_prototype_taxons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_prototypes ALTER COLUMN id SET DEFAULT nextval('spree_prototypes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_refund_reasons ALTER COLUMN id SET DEFAULT nextval('spree_refund_reasons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_refunds ALTER COLUMN id SET DEFAULT nextval('spree_refunds_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_reimbursement_credits ALTER COLUMN id SET DEFAULT nextval('spree_reimbursement_credits_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_reimbursement_types ALTER COLUMN id SET DEFAULT nextval('spree_reimbursement_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_reimbursements ALTER COLUMN id SET DEFAULT nextval('spree_reimbursements_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_return_authorizations ALTER COLUMN id SET DEFAULT nextval('spree_return_authorizations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_return_items ALTER COLUMN id SET DEFAULT nextval('spree_return_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_return_reasons ALTER COLUMN id SET DEFAULT nextval('spree_return_reasons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_roles ALTER COLUMN id SET DEFAULT nextval('spree_roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_roles_users ALTER COLUMN id SET DEFAULT nextval('spree_roles_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_shipments ALTER COLUMN id SET DEFAULT nextval('spree_shipments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_shipping_categories ALTER COLUMN id SET DEFAULT nextval('spree_shipping_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_shipping_method_categories ALTER COLUMN id SET DEFAULT nextval('spree_shipping_method_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_shipping_method_stock_locations ALTER COLUMN id SET DEFAULT nextval('spree_shipping_method_stock_locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_shipping_method_translations ALTER COLUMN id SET DEFAULT nextval('spree_shipping_method_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_shipping_method_zones ALTER COLUMN id SET DEFAULT nextval('spree_shipping_method_zones_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_shipping_methods ALTER COLUMN id SET DEFAULT nextval('spree_shipping_methods_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_shipping_rate_taxes ALTER COLUMN id SET DEFAULT nextval('spree_shipping_rate_taxes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_shipping_rates ALTER COLUMN id SET DEFAULT nextval('spree_shipping_rates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_state_changes ALTER COLUMN id SET DEFAULT nextval('spree_state_changes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_states ALTER COLUMN id SET DEFAULT nextval('spree_states_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_stock_items ALTER COLUMN id SET DEFAULT nextval('spree_stock_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_stock_locations ALTER COLUMN id SET DEFAULT nextval('spree_stock_locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_stock_movements ALTER COLUMN id SET DEFAULT nextval('spree_stock_movements_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_stock_transfers ALTER COLUMN id SET DEFAULT nextval('spree_stock_transfers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_store_credit_categories ALTER COLUMN id SET DEFAULT nextval('spree_store_credit_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_store_credit_events ALTER COLUMN id SET DEFAULT nextval('spree_store_credit_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_store_credit_types ALTER COLUMN id SET DEFAULT nextval('spree_store_credit_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_store_credit_update_reasons ALTER COLUMN id SET DEFAULT nextval('spree_store_credit_update_reasons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_store_credits ALTER COLUMN id SET DEFAULT nextval('spree_store_credits_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_store_payment_methods ALTER COLUMN id SET DEFAULT nextval('spree_store_payment_methods_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_store_translations ALTER COLUMN id SET DEFAULT nextval('spree_store_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_stores ALTER COLUMN id SET DEFAULT nextval('spree_stores_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_tax_categories ALTER COLUMN id SET DEFAULT nextval('spree_tax_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_tax_rates ALTER COLUMN id SET DEFAULT nextval('spree_tax_rates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_taxon_translations ALTER COLUMN id SET DEFAULT nextval('spree_taxon_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_taxonomies ALTER COLUMN id SET DEFAULT nextval('spree_taxonomies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_taxonomy_translations ALTER COLUMN id SET DEFAULT nextval('spree_taxonomy_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_taxons ALTER COLUMN id SET DEFAULT nextval('spree_taxons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_transfer_items ALTER COLUMN id SET DEFAULT nextval('spree_transfer_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_unit_cancels ALTER COLUMN id SET DEFAULT nextval('spree_unit_cancels_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_user_addresses ALTER COLUMN id SET DEFAULT nextval('spree_user_addresses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_user_stock_locations ALTER COLUMN id SET DEFAULT nextval('spree_user_stock_locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_users ALTER COLUMN id SET DEFAULT nextval('spree_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_variant_property_rule_conditions ALTER COLUMN id SET DEFAULT nextval('spree_variant_property_rule_conditions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_variant_property_rule_values ALTER COLUMN id SET DEFAULT nextval('spree_variant_property_rule_values_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_variant_property_rules ALTER COLUMN id SET DEFAULT nextval('spree_variant_property_rules_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_variants ALTER COLUMN id SET DEFAULT nextval('spree_variants_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_zone_members ALTER COLUMN id SET DEFAULT nextval('spree_zone_members_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_zones ALTER COLUMN id SET DEFAULT nextval('spree_zones_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2017-02-05 21:19:45.891061	2017-02-05 21:19:45.891061
\.


--
-- Data for Name: friendly_id_slugs; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY friendly_id_slugs (id, slug, sluggable_id, sluggable_type, scope, created_at, updated_at) FROM stdin;
1	ruby-on-rails-tote	1	Spree::Product	\N	2017-02-05 21:21:05.850696	2017-02-05 21:21:05.850696
2	ruby-on-rails-bag	2	Spree::Product	\N	2017-02-05 21:21:06.060078	2017-02-05 21:21:06.060078
3	ruby-on-rails-baseball-jersey	3	Spree::Product	\N	2017-02-05 21:21:06.16961	2017-02-05 21:21:06.16961
4	ruby-on-rails-jr-spaghetti	4	Spree::Product	\N	2017-02-05 21:21:06.293592	2017-02-05 21:21:06.293592
5	ruby-on-rails-ringer-t-shirt	5	Spree::Product	\N	2017-02-05 21:21:06.772654	2017-02-05 21:21:06.772654
6	ruby-baseball-jersey	6	Spree::Product	\N	2017-02-05 21:21:06.988286	2017-02-05 21:21:06.988286
8	ruby-on-rails-mug	8	Spree::Product	\N	2017-02-05 21:21:07.217026	2017-02-05 21:21:07.217026
9	ruby-on-rails-stein	9	Spree::Product	\N	2017-02-05 21:21:07.331984	2017-02-05 21:21:07.331984
17	in-lei	17	Spree::Product	\N	2017-02-17 18:29:28.34438	2017-02-17 18:29:28.34438
18	rub	18	Spree::Product	\N	2017-02-17 22:24:14.786475	2017-02-17 22:24:14.786475
\.


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('friendly_id_slugs_id_seq', 18, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY schema_migrations (version) FROM stdin;
20170205210315
20170205210316
20170205210317
20170205210318
20170205210319
20170205210320
20170205210321
20170205210322
20170205210323
20170205210324
20170205210325
20170205210326
20170205210327
20170205210328
20170205210329
20170205210330
20170205210331
20170205210332
20170205210333
20170205210334
20170205210335
20170205210336
20170205210337
20170205210338
20170205210339
20170205210340
20170205210341
20170205210342
20170205210343
20170205210344
20170205210345
20170205210346
20170205210347
20170205210348
20170205210349
20170205210350
20170205210351
20170205210352
20170205210353
20170205210354
20170205210355
20170205210356
20170205210357
20170205210358
20170205210359
20170205210360
20170205210361
20170205210362
20170205210363
20170205210364
20170205210365
20170205210366
20170205210367
20170205210368
20170205210369
20170205210370
20170205210371
20170205210372
20170205210373
20170205210374
20170205210375
20170205210376
20170205210377
20170205210378
20170205210379
20170205210380
20170205210381
20170205210382
20170205210383
20170205210384
20170205210385
20170205210386
20170205210387
20170205210388
20170205210389
20170205210390
20170205210391
20170205210392
20170205210393
20170205210394
20170205210395
20170205210396
20170205210397
20170205210398
20170205210399
20170205210400
20170205210401
20170205210402
20170205210403
20170205210404
20170205210405
20170205210406
20170205210407
20170205210408
20170205210409
20170205210410
20170205210411
20170205210412
20170205210413
20170205210414
20170205210415
20170205210416
20170205210417
20170205210418
20170205210419
20170205210420
20170205210421
20170205210422
20170205210423
20170205210424
20170205210425
20170205210426
20170205210427
20170205210428
20170205210429
20170205210430
20170205210431
20170205210432
20170205210433
20170205210434
20170205210435
20170205210436
20170205210437
20170205210438
20170205210439
20170205210440
20170205210441
20170205210442
20170205210443
20170205210444
20170205210445
20170205210446
20170205210447
20170205210448
20170205210449
20170205210450
20170205210451
20170205210452
20170205210453
20170205210454
20170205210455
20170205210456
20170205210457
20170205210458
20170205210459
20170205210460
20170205210461
20170205210462
20170205210463
20170205210464
20170205210465
20170205210466
20170205210467
20170205210468
20170205210469
20170205210470
20170205210471
20170205210472
20170205210473
20170205210474
20170205210475
20170205210476
20170205210477
20170205210478
20170205210479
20170205210480
20170205210481
20170205210482
20170205210483
20170205210484
20170205210485
20170205210486
20170205210487
20170205210488
20170205210489
20170205210490
20170205210491
20170205210492
20170205210493
20170205210494
20170205210495
20170205210496
20170205210497
20170205210498
20170205210499
20170205210500
20170205210501
20170205210502
20170205210503
20170205210504
20170205210505
20170205210506
20170205210507
20170205210508
20170205210509
20170205210510
20170205210511
20170205210512
20170205210513
20170205210514
20170205210515
20170205210516
20170205210517
20170205210518
20170205210519
20170205210520
20170205210521
20170205210522
20170205210523
20170205210524
20170205210525
20170205210526
20170205210527
20170205210528
20170205210529
20170205210530
20170205210531
20170205210532
20170205210533
20170205210534
20170205210535
20170205210536
20170205210537
20170205210538
20170205210539
20170205210540
20170205210541
20170205210542
20170205210543
20170205210544
20170205210545
20170205210546
20170205210547
20170205210548
20170205210549
20170205210550
20170205210551
20170205210552
20170205210553
20170205210554
20170205210555
20170205210556
20170205210557
20170205210558
20170205210559
20170205210560
20170205210561
20170205210562
20170205210563
20170205210564
20170205210565
20170205210566
20170205210567
20170205210568
20170205210569
20170205210570
20170205210571
20170205210572
20170205210573
20170205210574
20170205210575
20170205210576
20170205210577
20170205210578
20170205210579
20170205210580
20170205210581
20170205210582
20170205210583
20170205210584
20170205210585
20170205210586
20170205210587
20170205210588
20170205210589
20170205210590
20170205210591
20170205210592
20170205210593
20170205210594
20170205210595
20170205210596
20170205210597
20170205210598
20170205210599
20170205210600
20170205210601
20170205210602
20170205210603
20170205210604
20170205210605
20170205210606
20170205210607
20170205210608
20170205210609
20170205210610
20170205210611
20170205210612
20170205210613
20170205210614
20170205210615
20170205210616
20170205210617
20170205210618
20170205210619
20170205210620
20170205210621
20170205210622
20170205210623
20170205210624
20170205210625
20170216213948
20170217122018
20170217122019
20170217122020
20170217122021
20170217122022
20170217122023
20170217122024
20170217122025
20170217122026
20170217122027
\.


--
-- Data for Name: spree_addresses; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_addresses (id, firstname, lastname, address1, address2, city, zipcode, phone, state_name, alternative_phone, company, state_id, country_id, created_at, updated_at) FROM stdin;
1	Stuart	Stamm	3785 Shena Stravenue	Suite 945	Port Kendalside	16804	(280)818-9990	\N	\N	\N	3561	232	2017-02-05 21:21:22.716411	2017-02-05 21:21:22.716411
2	Leisha	Sawayn	849 Mayer Track	Suite 087	New Lolamouth	16804	439-377-2889	\N	\N	\N	3561	232	2017-02-05 21:21:22.733772	2017-02-05 21:21:22.733772
\.


--
-- Name: spree_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_addresses_id_seq', 2, true);


--
-- Data for Name: spree_adjustment_reasons; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_adjustment_reasons (id, name, code, active, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_adjustment_reasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_adjustment_reasons_id_seq', 1, false);


--
-- Data for Name: spree_adjustments; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_adjustments (id, source_type, source_id, adjustable_type, adjustable_id, amount, label, eligible, created_at, updated_at, order_id, included, promotion_code_id, adjustment_reason_id, finalized) FROM stdin;
2	Spree::TaxRate	\N	Spree::Shipment	1	0.25	North America 5.000%	t	2017-02-05 21:21:24.194866	2017-02-17 15:32:23.53264	1	f	\N	\N	t
1	Spree::TaxRate	\N	Spree::LineItem	1	0.80	North America 5.000%	t	2017-02-05 21:21:24.173713	2017-02-17 15:32:23.53264	1	f	\N	\N	t
\.


--
-- Name: spree_adjustments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_adjustments_id_seq', 4, true);


--
-- Data for Name: spree_assets; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_assets (id, viewable_type, viewable_id, attachment_width, attachment_height, attachment_file_size, "position", attachment_content_type, attachment_file_name, type, attachment_updated_at, alt, created_at, updated_at) FROM stdin;
1	Spree::Variant	10	240	240	44463	1	image/png	ror_baseball_jersey_red.png	Spree::Image	2017-02-05 21:21:12.170913	\N	2017-02-05 21:21:12.552892	2017-02-05 21:21:12.552892
2	Spree::Variant	10	240	240	36895	2	image/png	ror_baseball_jersey_back_red.png	Spree::Image	2017-02-05 21:21:12.604264	\N	2017-02-05 21:21:12.830444	2017-02-05 21:21:12.830444
3	Spree::Variant	11	240	240	46277	1	image/png	ror_baseball_jersey_blue.png	Spree::Image	2017-02-05 21:21:12.882003	\N	2017-02-05 21:21:13.123679	2017-02-05 21:21:13.123679
4	Spree::Variant	11	240	240	38424	2	image/png	ror_baseball_jersey_back_blue.png	Spree::Image	2017-02-05 21:21:13.170119	\N	2017-02-05 21:21:13.361173	2017-02-05 21:21:13.361173
5	Spree::Variant	12	240	240	45744	1	image/png	ror_baseball_jersey_green.png	Spree::Image	2017-02-05 21:21:13.409581	\N	2017-02-05 21:21:13.606708	2017-02-05 21:21:13.606708
6	Spree::Variant	12	240	240	39641	2	image/png	ror_baseball_jersey_back_green.png	Spree::Image	2017-02-05 21:21:13.646012	\N	2017-02-05 21:21:13.861774	2017-02-05 21:21:13.861774
7	Spree::Variant	13	240	240	44463	1	image/png	ror_baseball_jersey_red.png	Spree::Image	2017-02-05 21:21:13.931183	\N	2017-02-05 21:21:14.165061	2017-02-05 21:21:14.165061
8	Spree::Variant	13	240	240	36895	2	image/png	ror_baseball_jersey_back_red.png	Spree::Image	2017-02-05 21:21:14.20535	\N	2017-02-05 21:21:14.42179	2017-02-05 21:21:14.42179
9	Spree::Variant	14	240	240	46277	1	image/png	ror_baseball_jersey_blue.png	Spree::Image	2017-02-05 21:21:14.470154	\N	2017-02-05 21:21:14.688679	2017-02-05 21:21:14.688679
10	Spree::Variant	14	240	240	38424	2	image/png	ror_baseball_jersey_back_blue.png	Spree::Image	2017-02-05 21:21:14.732463	\N	2017-02-05 21:21:14.960374	2017-02-05 21:21:14.960374
11	Spree::Variant	15	240	240	45744	1	image/png	ror_baseball_jersey_green.png	Spree::Image	2017-02-05 21:21:15.010621	\N	2017-02-05 21:21:15.208987	2017-02-05 21:21:15.208987
12	Spree::Variant	15	240	240	39641	2	image/png	ror_baseball_jersey_back_green.png	Spree::Image	2017-02-05 21:21:15.253865	\N	2017-02-05 21:21:15.462821	2017-02-05 21:21:15.462821
13	Spree::Variant	16	240	240	44463	1	image/png	ror_baseball_jersey_red.png	Spree::Image	2017-02-05 21:21:15.522258	\N	2017-02-05 21:21:15.748565	2017-02-05 21:21:15.748565
14	Spree::Variant	16	240	240	36895	2	image/png	ror_baseball_jersey_back_red.png	Spree::Image	2017-02-05 21:21:15.789747	\N	2017-02-05 21:21:15.99367	2017-02-05 21:21:15.99367
15	Spree::Variant	17	240	240	46277	1	image/png	ror_baseball_jersey_blue.png	Spree::Image	2017-02-05 21:21:16.049383	\N	2017-02-05 21:21:16.298489	2017-02-05 21:21:16.298489
16	Spree::Variant	17	240	240	38424	2	image/png	ror_baseball_jersey_back_blue.png	Spree::Image	2017-02-05 21:21:16.349385	\N	2017-02-05 21:21:16.583132	2017-02-05 21:21:16.583132
17	Spree::Variant	18	240	240	45744	1	image/png	ror_baseball_jersey_green.png	Spree::Image	2017-02-05 21:21:16.633212	\N	2017-02-05 21:21:16.88937	2017-02-05 21:21:16.88937
18	Spree::Variant	18	240	240	39641	2	image/png	ror_baseball_jersey_back_green.png	Spree::Image	2017-02-05 21:21:16.932725	\N	2017-02-05 21:21:17.201031	2017-02-05 21:21:17.201031
19	Spree::Variant	19	240	240	45744	1	image/png	ror_baseball_jersey_green.png	Spree::Image	2017-02-05 21:21:17.252533	\N	2017-02-05 21:21:17.480418	2017-02-05 21:21:17.480418
20	Spree::Variant	19	240	240	39641	2	image/png	ror_baseball_jersey_back_green.png	Spree::Image	2017-02-05 21:21:17.521401	\N	2017-02-05 21:21:17.749829	2017-02-05 21:21:17.749829
21	Spree::Variant	1	360	360	31490	1	image/jpeg	ror_tote.jpeg	Spree::Image	2017-02-05 21:21:17.787589	\N	2017-02-05 21:21:18.063045	2017-02-05 21:21:18.063045
22	Spree::Variant	1	360	360	28620	2	image/jpeg	ror_tote_back.jpeg	Spree::Image	2017-02-05 21:21:18.100753	\N	2017-02-05 21:21:18.358253	2017-02-05 21:21:18.358253
23	Spree::Variant	2	360	360	28230	1	image/jpeg	ror_bag.jpeg	Spree::Image	2017-02-05 21:21:18.399682	\N	2017-02-05 21:21:18.715237	2017-02-05 21:21:18.715237
25	Spree::Variant	3	360	360	23490	2	image/jpeg	ror_baseball_back.jpeg	Spree::Image	2017-02-05 21:21:19.113873	\N	2017-02-05 21:21:19.377256	2017-02-05 21:21:19.377256
26	Spree::Variant	4	360	360	14083	1	image/jpeg	ror_jr_spaghetti.jpeg	Spree::Image	2017-02-05 21:21:19.434497	\N	2017-02-05 21:21:19.715036	2017-02-05 21:21:19.715036
27	Spree::Variant	8	360	360	20026	1	image/jpeg	ror_mug.jpeg	Spree::Image	2017-02-05 21:21:19.766779	\N	2017-02-05 21:21:19.983059	2017-02-05 21:21:19.983059
28	Spree::Variant	8	360	360	10929	2	image/jpeg	ror_mug_back.jpeg	Spree::Image	2017-02-05 21:21:20.06905	\N	2017-02-05 21:21:20.307662	2017-02-05 21:21:20.307662
29	Spree::Variant	5	360	360	18252	1	image/jpeg	ror_ringer.jpeg	Spree::Image	2017-02-05 21:21:20.34854	\N	2017-02-05 21:21:20.575822	2017-02-05 21:21:20.575822
30	Spree::Variant	5	360	360	13276	2	image/jpeg	ror_ringer_back.jpeg	Spree::Image	2017-02-05 21:21:20.663887	\N	2017-02-05 21:21:20.933029	2017-02-05 21:21:20.933029
31	Spree::Variant	9	360	360	20714	1	image/jpeg	ror_stein.jpeg	Spree::Image	2017-02-05 21:21:20.984645	\N	2017-02-05 21:21:21.22666	2017-02-05 21:21:21.22666
32	Spree::Variant	9	360	360	20619	2	image/jpeg	ror_stein_back.jpeg	Spree::Image	2017-02-05 21:21:21.290627	\N	2017-02-05 21:21:21.564063	2017-02-05 21:21:21.564063
35	Spree::Variant	6	400	250	24871	1	image/jpeg	intex-15-48-lg.jpg	Spree::Image	2017-02-13 20:03:59.853015	\N	2017-02-13 20:04:00.180669	2017-02-13 20:04:00.180669
24	Spree::Variant	3	499	367	28833	1	image/jpeg	64436.3.1.jpg	Spree::Image	2017-02-13 20:06:26.990977		2017-02-05 21:21:19.07512	2017-02-13 20:06:27.237112
\.


--
-- Name: spree_assets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_assets_id_seq', 35, true);


--
-- Data for Name: spree_calculators; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_calculators (id, type, calculable_type, calculable_id, created_at, updated_at, preferences) FROM stdin;
2	Spree::Calculator::Shipping::FlatRate	Spree::ShippingMethod	1	2017-02-05 21:21:05.041048	2017-02-05 21:21:05.360634	---\n:amount: 5\n:currency: USD\n
5	Spree::Calculator::Shipping::FlatRate	Spree::ShippingMethod	4	2017-02-05 21:21:05.063893	2017-02-05 21:21:05.383014	---\n:amount: 5\n:currency: USD\n
4	Spree::Calculator::Shipping::FlatRate	Spree::ShippingMethod	3	2017-02-05 21:21:05.057121	2017-02-05 21:21:05.400716	---\n:amount: 15\n:currency: USD\n
3	Spree::Calculator::Shipping::FlatRate	Spree::ShippingMethod	2	2017-02-05 21:21:05.049102	2017-02-05 21:21:05.421043	---\n:amount: 10\n:currency: USD\n
6	Spree::Calculator::Shipping::FlatRate	Spree::ShippingMethod	5	2017-02-05 21:21:05.069649	2017-02-05 21:21:05.438601	---\n:amount: 8\n:currency: EUR\n
7	Spree::Calculator::DefaultTax	Spree::TaxRate	2	2017-02-17 22:05:55.509913	2017-02-17 22:05:55.509913	\N
\.


--
-- Name: spree_calculators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_calculators_id_seq', 7, true);


--
-- Data for Name: spree_cartons; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_cartons (id, number, external_number, stock_location_id, address_id, shipping_method_id, tracking, shipped_at, created_at, updated_at, imported_from_shipment_id) FROM stdin;
\.


--
-- Name: spree_cartons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_cartons_id_seq', 1, false);


--
-- Data for Name: spree_countries; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_countries (id, iso_name, iso, iso3, name, numcode, states_required, updated_at, created_at) FROM stdin;
1	ANDORRA	AD	AND	Andorra	20	t	2017-02-05 21:20:02.282679	2017-02-05 21:20:02.282679
2	UNITED ARAB EMIRATES	AE	ARE	United Arab Emirates	784	t	2017-02-05 21:20:02.295598	2017-02-05 21:20:02.295598
3	AFGHANISTAN	AF	AFG	Afghanistan	4	t	2017-02-05 21:20:02.302564	2017-02-05 21:20:02.302564
4	ANTIGUA AND BARBUDA	AG	ATG	Antigua and Barbuda	28	t	2017-02-05 21:20:02.313029	2017-02-05 21:20:02.313029
5	ANGUILLA	AI	AIA	Anguilla	660	f	2017-02-05 21:20:02.319709	2017-02-05 21:20:02.319709
6	ALBANIA	AL	ALB	Albania	8	t	2017-02-05 21:20:02.328245	2017-02-05 21:20:02.328245
7	ARMENIA	AM	ARM	Armenia	51	t	2017-02-05 21:20:02.336233	2017-02-05 21:20:02.336233
8	ANGOLA	AO	AGO	Angola	24	t	2017-02-05 21:20:02.344565	2017-02-05 21:20:02.344565
9	ANTARCTICA	AQ	ATA	Antarctica	10	f	2017-02-05 21:20:02.349915	2017-02-05 21:20:02.349915
10	ARGENTINA	AR	ARG	Argentina	32	t	2017-02-05 21:20:02.357215	2017-02-05 21:20:02.357215
11	AMERICAN SAMOA	AS	ASM	American Samoa	16	f	2017-02-05 21:20:02.363384	2017-02-05 21:20:02.363384
12	AUSTRIA	AT	AUT	Austria	40	t	2017-02-05 21:20:02.370816	2017-02-05 21:20:02.370816
13	AUSTRALIA	AU	AUS	Australia	36	t	2017-02-05 21:20:02.377199	2017-02-05 21:20:02.377199
14	ARUBA	AW	ABW	Aruba	533	f	2017-02-05 21:20:02.381518	2017-02-05 21:20:02.381518
15	ÅLAND ISLANDS	AX	ALA	Åland Islands	248	f	2017-02-05 21:20:02.385459	2017-02-05 21:20:02.385459
16	AZERBAIJAN	AZ	AZE	Azerbaijan	31	t	2017-02-05 21:20:02.396927	2017-02-05 21:20:02.396927
17	BOSNIA AND HERZEGOVINA	BA	BIH	Bosnia and Herzegovina	70	t	2017-02-05 21:20:02.403369	2017-02-05 21:20:02.403369
18	BARBADOS	BB	BRB	Barbados	52	t	2017-02-05 21:20:02.420943	2017-02-05 21:20:02.420943
19	BANGLADESH	BD	BGD	Bangladesh	50	t	2017-02-05 21:20:02.426295	2017-02-05 21:20:02.426295
20	BELGIUM	BE	BEL	Belgium	56	t	2017-02-05 21:20:02.430806	2017-02-05 21:20:02.430806
21	BURKINA FASO	BF	BFA	Burkina Faso	854	t	2017-02-05 21:20:02.437062	2017-02-05 21:20:02.437062
22	BULGARIA	BG	BGR	Bulgaria	100	t	2017-02-05 21:20:02.443806	2017-02-05 21:20:02.443806
23	BAHRAIN	BH	BHR	Bahrain	48	t	2017-02-05 21:20:02.450964	2017-02-05 21:20:02.450964
24	BURUNDI	BI	BDI	Burundi	108	t	2017-02-05 21:20:02.457638	2017-02-05 21:20:02.457638
25	BENIN	BJ	BEN	Benin	204	t	2017-02-05 21:20:02.464521	2017-02-05 21:20:02.464521
26	SAINT BARTHéLEMY	BL	BLM	Saint Barthélemy	652	f	2017-02-05 21:20:02.469982	2017-02-05 21:20:02.469982
27	BERMUDA	BM	BMU	Bermuda	60	f	2017-02-05 21:20:02.476504	2017-02-05 21:20:02.476504
28	BRUNEI DARUSSALAM	BN	BRN	Brunei Darussalam	96	t	2017-02-05 21:20:02.483269	2017-02-05 21:20:02.483269
29	BOLIVIA, PLURINATIONAL STATE OF	BO	BOL	Bolivia, Plurinational State of	68	t	2017-02-05 21:20:02.489008	2017-02-05 21:20:02.489008
30	BONAIRE, SINT EUSTATIUS AND SABA	BQ	BES	Bonaire, Sint Eustatius and Saba	535	t	2017-02-05 21:20:02.495334	2017-02-05 21:20:02.495334
31	BRAZIL	BR	BRA	Brazil	76	t	2017-02-05 21:20:02.510477	2017-02-05 21:20:02.510477
32	BAHAMAS	BS	BHS	Bahamas	44	t	2017-02-05 21:20:02.51847	2017-02-05 21:20:02.51847
33	BHUTAN	BT	BTN	Bhutan	64	t	2017-02-05 21:20:02.528881	2017-02-05 21:20:02.528881
34	BOUVET ISLAND	BV	BVT	Bouvet Island	74	f	2017-02-05 21:20:02.534729	2017-02-05 21:20:02.534729
35	BOTSWANA	BW	BWA	Botswana	72	t	2017-02-05 21:20:02.54096	2017-02-05 21:20:02.54096
36	BELARUS	BY	BLR	Belarus	112	t	2017-02-05 21:20:02.547941	2017-02-05 21:20:02.547941
37	BELIZE	BZ	BLZ	Belize	84	t	2017-02-05 21:20:02.555398	2017-02-05 21:20:02.555398
38	CANADA	CA	CAN	Canada	124	t	2017-02-05 21:20:02.564317	2017-02-05 21:20:02.564317
39	COCOS (KEELING) ISLANDS	CC	CCK	Cocos (Keeling) Islands	166	f	2017-02-05 21:20:02.568678	2017-02-05 21:20:02.568678
40	CONGO, THE DEMOCRATIC REPUBLIC OF THE	CD	COD	Congo, The Democratic Republic of the	180	t	2017-02-05 21:20:02.5743	2017-02-05 21:20:02.5743
41	CENTRAL AFRICAN REPUBLIC	CF	CAF	Central African Republic	140	t	2017-02-05 21:20:02.581114	2017-02-05 21:20:02.581114
42	CONGO	CG	COG	Congo	178	t	2017-02-05 21:20:02.588625	2017-02-05 21:20:02.588625
43	SWITZERLAND	CH	CHE	Switzerland	756	t	2017-02-05 21:20:02.596969	2017-02-05 21:20:02.596969
44	CôTE D'IVOIRE	CI	CIV	Côte d'Ivoire	384	t	2017-02-05 21:20:02.604509	2017-02-05 21:20:02.604509
45	COOK ISLANDS	CK	COK	Cook Islands	184	f	2017-02-05 21:20:02.609751	2017-02-05 21:20:02.609751
46	CHILE	CL	CHL	Chile	152	t	2017-02-05 21:20:02.615555	2017-02-05 21:20:02.615555
47	CAMEROON	CM	CMR	Cameroon	120	t	2017-02-05 21:20:02.621802	2017-02-05 21:20:02.621802
48	CHINA	CN	CHN	China	156	t	2017-02-05 21:20:02.628906	2017-02-05 21:20:02.628906
49	COLOMBIA	CO	COL	Colombia	170	t	2017-02-05 21:20:02.635002	2017-02-05 21:20:02.635002
50	COSTA RICA	CR	CRI	Costa Rica	188	t	2017-02-05 21:20:02.63974	2017-02-05 21:20:02.63974
51	CUBA	CU	CUB	Cuba	192	t	2017-02-05 21:20:02.644968	2017-02-05 21:20:02.644968
52	CAPE VERDE	CV	CPV	Cape Verde	132	t	2017-02-05 21:20:02.649695	2017-02-05 21:20:02.649695
53	CURAçAO	CW	CUW	Curaçao	531	f	2017-02-05 21:20:02.654384	2017-02-05 21:20:02.654384
54	CHRISTMAS ISLAND	CX	CXR	Christmas Island	162	f	2017-02-05 21:20:02.65874	2017-02-05 21:20:02.65874
55	CYPRUS	CY	CYP	Cyprus	196	t	2017-02-05 21:20:02.664289	2017-02-05 21:20:02.664289
56	CZECH REPUBLIC	CZ	CZE	Czech Republic	203	t	2017-02-05 21:20:02.671679	2017-02-05 21:20:02.671679
57	GERMANY	DE	DEU	Germany	276	t	2017-02-05 21:20:02.679946	2017-02-05 21:20:02.679946
58	DJIBOUTI	DJ	DJI	Djibouti	262	t	2017-02-05 21:20:02.687489	2017-02-05 21:20:02.687489
59	DENMARK	DK	DNK	Denmark	208	t	2017-02-05 21:20:02.695674	2017-02-05 21:20:02.695674
60	DOMINICA	DM	DMA	Dominica	212	t	2017-02-05 21:20:02.705921	2017-02-05 21:20:02.705921
61	DOMINICAN REPUBLIC	DO	DOM	Dominican Republic	214	t	2017-02-05 21:20:02.726699	2017-02-05 21:20:02.726699
62	ALGERIA	DZ	DZA	Algeria	12	t	2017-02-05 21:20:02.75577	2017-02-05 21:20:02.75577
63	ECUADOR	EC	ECU	Ecuador	218	t	2017-02-05 21:20:02.782102	2017-02-05 21:20:02.782102
64	ESTONIA	EE	EST	Estonia	233	t	2017-02-05 21:20:02.805808	2017-02-05 21:20:02.805808
65	EGYPT	EG	EGY	Egypt	818	t	2017-02-05 21:20:02.825376	2017-02-05 21:20:02.825376
66	WESTERN SAHARA	EH	ESH	Western Sahara	732	f	2017-02-05 21:20:02.841171	2017-02-05 21:20:02.841171
67	ERITREA	ER	ERI	Eritrea	232	t	2017-02-05 21:20:02.861981	2017-02-05 21:20:02.861981
68	SPAIN	ES	ESP	Spain	724	t	2017-02-05 21:20:02.8884	2017-02-05 21:20:02.8884
69	ETHIOPIA	ET	ETH	Ethiopia	231	t	2017-02-05 21:20:02.914171	2017-02-05 21:20:02.914171
70	FINLAND	FI	FIN	Finland	246	t	2017-02-05 21:20:02.945601	2017-02-05 21:20:02.945601
71	FIJI	FJ	FJI	Fiji	242	t	2017-02-05 21:20:02.971779	2017-02-05 21:20:02.971779
72	FALKLAND ISLANDS (MALVINAS)	FK	FLK	Falkland Islands (Malvinas)	238	f	2017-02-05 21:20:02.978967	2017-02-05 21:20:02.978967
73	MICRONESIA, FEDERATED STATES OF	FM	FSM	Micronesia, Federated States of	583	t	2017-02-05 21:20:02.99028	2017-02-05 21:20:02.99028
74	FAROE ISLANDS	FO	FRO	Faroe Islands	234	f	2017-02-05 21:20:02.995135	2017-02-05 21:20:02.995135
75	FRANCE	FR	FRA	France	250	t	2017-02-05 21:20:03.003643	2017-02-05 21:20:03.003643
76	GABON	GA	GAB	Gabon	266	t	2017-02-05 21:20:03.009926	2017-02-05 21:20:03.009926
77	UNITED KINGDOM	GB	GBR	United Kingdom	826	t	2017-02-05 21:20:03.029871	2017-02-05 21:20:03.029871
78	GRENADA	GD	GRD	Grenada	308	t	2017-02-05 21:20:03.034024	2017-02-05 21:20:03.034024
79	GEORGIA	GE	GEO	Georgia	268	t	2017-02-05 21:20:03.037912	2017-02-05 21:20:03.037912
80	FRENCH GUIANA	GF	GUF	French Guiana	254	f	2017-02-05 21:20:03.044272	2017-02-05 21:20:03.044272
81	GUERNSEY	GG	GGY	Guernsey	831	f	2017-02-05 21:20:03.049419	2017-02-05 21:20:03.049419
82	GHANA	GH	GHA	Ghana	288	t	2017-02-05 21:20:03.056819	2017-02-05 21:20:03.056819
83	GIBRALTAR	GI	GIB	Gibraltar	292	f	2017-02-05 21:20:03.062563	2017-02-05 21:20:03.062563
84	GREENLAND	GL	GRL	Greenland	304	t	2017-02-05 21:20:03.069903	2017-02-05 21:20:03.069903
85	GAMBIA	GM	GMB	Gambia	270	t	2017-02-05 21:20:03.077396	2017-02-05 21:20:03.077396
86	GUINEA	GN	GIN	Guinea	324	t	2017-02-05 21:20:03.084897	2017-02-05 21:20:03.084897
87	GUADELOUPE	GP	GLP	Guadeloupe	312	f	2017-02-05 21:20:03.090432	2017-02-05 21:20:03.090432
88	EQUATORIAL GUINEA	GQ	GNQ	Equatorial Guinea	226	t	2017-02-05 21:20:03.09686	2017-02-05 21:20:03.09686
89	GREECE	GR	GRC	Greece	300	t	2017-02-05 21:20:03.103291	2017-02-05 21:20:03.103291
90	SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS	GS	SGS	South Georgia and the South Sandwich Islands	239	f	2017-02-05 21:20:03.107903	2017-02-05 21:20:03.107903
91	GUATEMALA	GT	GTM	Guatemala	320	t	2017-02-05 21:20:03.115899	2017-02-05 21:20:03.115899
92	GUAM	GU	GUM	Guam	316	f	2017-02-05 21:20:03.121253	2017-02-05 21:20:03.121253
93	GUINEA-BISSAU	GW	GNB	Guinea-Bissau	624	t	2017-02-05 21:20:03.162453	2017-02-05 21:20:03.162453
94	GUYANA	GY	GUY	Guyana	328	t	2017-02-05 21:20:03.170572	2017-02-05 21:20:03.170572
95	HONG KONG	HK	HKG	Hong Kong	344	f	2017-02-05 21:20:03.176738	2017-02-05 21:20:03.176738
96	HEARD ISLAND AND MCDONALD ISLANDS	HM	HMD	Heard Island and McDonald Islands	334	f	2017-02-05 21:20:03.182159	2017-02-05 21:20:03.182159
97	HONDURAS	HN	HND	Honduras	340	t	2017-02-05 21:20:03.188076	2017-02-05 21:20:03.188076
98	CROATIA	HR	HRV	Croatia	191	t	2017-02-05 21:20:03.195237	2017-02-05 21:20:03.195237
99	HAITI	HT	HTI	Haiti	332	t	2017-02-05 21:20:03.201126	2017-02-05 21:20:03.201126
100	HUNGARY	HU	HUN	Hungary	348	t	2017-02-05 21:20:03.21037	2017-02-05 21:20:03.21037
101	INDONESIA	ID	IDN	Indonesia	360	t	2017-02-05 21:20:03.216785	2017-02-05 21:20:03.216785
102	IRELAND	IE	IRL	Ireland	372	t	2017-02-05 21:20:03.225186	2017-02-05 21:20:03.225186
103	ISRAEL	IL	ISR	Israel	376	t	2017-02-05 21:20:03.231063	2017-02-05 21:20:03.231063
104	ISLE OF MAN	IM	IMN	Isle of Man	833	f	2017-02-05 21:20:03.235053	2017-02-05 21:20:03.235053
105	INDIA	IN	IND	India	356	t	2017-02-05 21:20:03.241306	2017-02-05 21:20:03.241306
106	BRITISH INDIAN OCEAN TERRITORY	IO	IOT	British Indian Ocean Territory	86	f	2017-02-05 21:20:03.245819	2017-02-05 21:20:03.245819
107	IRAQ	IQ	IRQ	Iraq	368	t	2017-02-05 21:20:03.254344	2017-02-05 21:20:03.254344
108	IRAN, ISLAMIC REPUBLIC OF	IR	IRN	Iran, Islamic Republic of	364	t	2017-02-05 21:20:03.264574	2017-02-05 21:20:03.264574
109	ICELAND	IS	ISL	Iceland	352	t	2017-02-05 21:20:03.273195	2017-02-05 21:20:03.273195
110	ITALY	IT	ITA	Italy	380	t	2017-02-05 21:20:03.281856	2017-02-05 21:20:03.281856
111	JERSEY	JE	JEY	Jersey	832	f	2017-02-05 21:20:03.288845	2017-02-05 21:20:03.288845
112	JAMAICA	JM	JAM	Jamaica	388	t	2017-02-05 21:20:03.299098	2017-02-05 21:20:03.299098
113	JORDAN	JO	JOR	Jordan	400	t	2017-02-05 21:20:03.308567	2017-02-05 21:20:03.308567
114	JAPAN	JP	JPN	Japan	392	t	2017-02-05 21:20:03.319102	2017-02-05 21:20:03.319102
115	KENYA	KE	KEN	Kenya	404	t	2017-02-05 21:20:03.327296	2017-02-05 21:20:03.327296
116	KYRGYZSTAN	KG	KGZ	Kyrgyzstan	417	t	2017-02-05 21:20:03.333946	2017-02-05 21:20:03.333946
117	CAMBODIA	KH	KHM	Cambodia	116	t	2017-02-05 21:20:03.340083	2017-02-05 21:20:03.340083
118	KIRIBATI	KI	KIR	Kiribati	296	t	2017-02-05 21:20:03.346367	2017-02-05 21:20:03.346367
119	COMOROS	KM	COM	Comoros	174	t	2017-02-05 21:20:03.353201	2017-02-05 21:20:03.353201
120	SAINT KITTS AND NEVIS	KN	KNA	Saint Kitts and Nevis	659	t	2017-02-05 21:20:03.360544	2017-02-05 21:20:03.360544
121	KOREA, DEMOCRATIC PEOPLE'S REPUBLIC OF	KP	PRK	Korea, Democratic People's Republic of	408	t	2017-02-05 21:20:03.36962	2017-02-05 21:20:03.36962
122	KOREA, REPUBLIC OF	KR	KOR	Korea, Republic of	410	t	2017-02-05 21:20:03.377339	2017-02-05 21:20:03.377339
123	KUWAIT	KW	KWT	Kuwait	414	t	2017-02-05 21:20:03.383676	2017-02-05 21:20:03.383676
124	CAYMAN ISLANDS	KY	CYM	Cayman Islands	136	f	2017-02-05 21:20:03.388155	2017-02-05 21:20:03.388155
125	KAZAKHSTAN	KZ	KAZ	Kazakhstan	398	t	2017-02-05 21:20:03.393883	2017-02-05 21:20:03.393883
126	LAO PEOPLE'S DEMOCRATIC REPUBLIC	LA	LAO	Lao People's Democratic Republic	418	t	2017-02-05 21:20:03.39944	2017-02-05 21:20:03.39944
127	LEBANON	LB	LBN	Lebanon	422	t	2017-02-05 21:20:03.40558	2017-02-05 21:20:03.40558
128	SAINT LUCIA	LC	LCA	Saint Lucia	662	f	2017-02-05 21:20:03.410564	2017-02-05 21:20:03.410564
129	LIECHTENSTEIN	LI	LIE	Liechtenstein	438	t	2017-02-05 21:20:03.416307	2017-02-05 21:20:03.416307
130	SRI LANKA	LK	LKA	Sri Lanka	144	t	2017-02-05 21:20:03.421667	2017-02-05 21:20:03.421667
131	LIBERIA	LR	LBR	Liberia	430	t	2017-02-05 21:20:03.427145	2017-02-05 21:20:03.427145
132	LESOTHO	LS	LSO	Lesotho	426	t	2017-02-05 21:20:03.432275	2017-02-05 21:20:03.432275
133	LITHUANIA	LT	LTU	Lithuania	440	t	2017-02-05 21:20:03.437243	2017-02-05 21:20:03.437243
134	LUXEMBOURG	LU	LUX	Luxembourg	442	t	2017-02-05 21:20:03.441682	2017-02-05 21:20:03.441682
135	LATVIA	LV	LVA	Latvia	428	t	2017-02-05 21:20:03.454998	2017-02-05 21:20:03.454998
136	LIBYA	LY	LBY	Libya	434	t	2017-02-05 21:20:03.463641	2017-02-05 21:20:03.463641
137	MOROCCO	MA	MAR	Morocco	504	t	2017-02-05 21:20:03.469774	2017-02-05 21:20:03.469774
138	MONACO	MC	MCO	Monaco	492	t	2017-02-05 21:20:03.475382	2017-02-05 21:20:03.475382
139	MOLDOVA, REPUBLIC OF	MD	MDA	Moldova, Republic of	498	t	2017-02-05 21:20:03.485763	2017-02-05 21:20:03.485763
140	MONTENEGRO	ME	MNE	Montenegro	499	t	2017-02-05 21:20:03.495388	2017-02-05 21:20:03.495388
141	SAINT MARTIN (FRENCH PART)	MF	MAF	Saint Martin (French part)	663	f	2017-02-05 21:20:03.503791	2017-02-05 21:20:03.503791
142	MADAGASCAR	MG	MDG	Madagascar	450	t	2017-02-05 21:20:03.524635	2017-02-05 21:20:03.524635
143	MARSHALL ISLANDS	MH	MHL	Marshall Islands	584	t	2017-02-05 21:20:03.532214	2017-02-05 21:20:03.532214
144	MACEDONIA, REPUBLIC OF	MK	MKD	Macedonia, Republic of	807	t	2017-02-05 21:20:03.542666	2017-02-05 21:20:03.542666
145	MALI	ML	MLI	Mali	466	t	2017-02-05 21:20:03.548648	2017-02-05 21:20:03.548648
146	MYANMAR	MM	MMR	Myanmar	104	t	2017-02-05 21:20:03.559751	2017-02-05 21:20:03.559751
147	MONGOLIA	MN	MNG	Mongolia	496	t	2017-02-05 21:20:03.567922	2017-02-05 21:20:03.567922
148	MACAO	MO	MAC	Macao	446	f	2017-02-05 21:20:03.574033	2017-02-05 21:20:03.574033
149	NORTHERN MARIANA ISLANDS	MP	MNP	Northern Mariana Islands	580	f	2017-02-05 21:20:03.578969	2017-02-05 21:20:03.578969
150	MARTINIQUE	MQ	MTQ	Martinique	474	f	2017-02-05 21:20:03.584364	2017-02-05 21:20:03.584364
151	MAURITANIA	MR	MRT	Mauritania	478	t	2017-02-05 21:20:03.592474	2017-02-05 21:20:03.592474
152	MONTSERRAT	MS	MSR	Montserrat	500	f	2017-02-05 21:20:03.597356	2017-02-05 21:20:03.597356
153	MALTA	MT	MLT	Malta	470	t	2017-02-05 21:20:03.608788	2017-02-05 21:20:03.608788
154	MAURITIUS	MU	MUS	Mauritius	480	t	2017-02-05 21:20:03.617304	2017-02-05 21:20:03.617304
155	MALDIVES	MV	MDV	Maldives	462	t	2017-02-05 21:20:03.625125	2017-02-05 21:20:03.625125
156	MALAWI	MW	MWI	Malawi	454	t	2017-02-05 21:20:03.630987	2017-02-05 21:20:03.630987
157	MEXICO	MX	MEX	Mexico	484	t	2017-02-05 21:20:03.639143	2017-02-05 21:20:03.639143
158	MALAYSIA	MY	MYS	Malaysia	458	t	2017-02-05 21:20:03.64737	2017-02-05 21:20:03.64737
159	MOZAMBIQUE	MZ	MOZ	Mozambique	508	t	2017-02-05 21:20:03.655037	2017-02-05 21:20:03.655037
160	NAMIBIA	NA	NAM	Namibia	516	t	2017-02-05 21:20:03.663244	2017-02-05 21:20:03.663244
161	NEW CALEDONIA	NC	NCL	New Caledonia	540	f	2017-02-05 21:20:03.669851	2017-02-05 21:20:03.669851
162	NIGER	NE	NER	Niger	562	t	2017-02-05 21:20:03.677985	2017-02-05 21:20:03.677985
163	NORFOLK ISLAND	NF	NFK	Norfolk Island	574	f	2017-02-05 21:20:03.684273	2017-02-05 21:20:03.684273
164	NIGERIA	NG	NGA	Nigeria	566	t	2017-02-05 21:20:03.694285	2017-02-05 21:20:03.694285
165	NICARAGUA	NI	NIC	Nicaragua	558	t	2017-02-05 21:20:03.703022	2017-02-05 21:20:03.703022
166	NETHERLANDS	NL	NLD	Netherlands	528	t	2017-02-05 21:20:03.711278	2017-02-05 21:20:03.711278
167	NORWAY	NO	NOR	Norway	578	t	2017-02-05 21:20:03.721779	2017-02-05 21:20:03.721779
168	NEPAL	NP	NPL	Nepal	524	t	2017-02-05 21:20:03.740665	2017-02-05 21:20:03.740665
169	NAURU	NR	NRU	Nauru	520	t	2017-02-05 21:20:03.761432	2017-02-05 21:20:03.761432
170	NIUE	NU	NIU	Niue	570	f	2017-02-05 21:20:03.782423	2017-02-05 21:20:03.782423
171	NEW ZEALAND	NZ	NZL	New Zealand	554	t	2017-02-05 21:20:03.802747	2017-02-05 21:20:03.802747
172	OMAN	OM	OMN	Oman	512	t	2017-02-05 21:20:03.820627	2017-02-05 21:20:03.820627
173	PANAMA	PA	PAN	Panama	591	t	2017-02-05 21:20:03.83859	2017-02-05 21:20:03.83859
174	PERU	PE	PER	Peru	604	t	2017-02-05 21:20:03.870468	2017-02-05 21:20:03.870468
175	FRENCH POLYNESIA	PF	PYF	French Polynesia	258	f	2017-02-05 21:20:03.895465	2017-02-05 21:20:03.895465
176	PAPUA NEW GUINEA	PG	PNG	Papua New Guinea	598	t	2017-02-05 21:20:03.925529	2017-02-05 21:20:03.925529
177	PHILIPPINES	PH	PHL	Philippines	608	t	2017-02-05 21:20:03.942114	2017-02-05 21:20:03.942114
178	PAKISTAN	PK	PAK	Pakistan	586	t	2017-02-05 21:20:03.952869	2017-02-05 21:20:03.952869
179	POLAND	PL	POL	Poland	616	t	2017-02-05 21:20:03.963984	2017-02-05 21:20:03.963984
180	SAINT PIERRE AND MIQUELON	PM	SPM	Saint Pierre and Miquelon	666	f	2017-02-05 21:20:03.969104	2017-02-05 21:20:03.969104
181	PITCAIRN	PN	PCN	Pitcairn	612	f	2017-02-05 21:20:03.974256	2017-02-05 21:20:03.974256
182	PALESTINE, STATE OF	PS	PSE	Palestine, State of	275	t	2017-02-05 21:20:03.981491	2017-02-05 21:20:03.981491
183	PORTUGAL	PT	PRT	Portugal	620	t	2017-02-05 21:20:03.991384	2017-02-05 21:20:03.991384
184	PALAU	PW	PLW	Palau	585	t	2017-02-05 21:20:04.000623	2017-02-05 21:20:04.000623
185	PARAGUAY	PY	PRY	Paraguay	600	t	2017-02-05 21:20:04.007713	2017-02-05 21:20:04.007713
186	QATAR	QA	QAT	Qatar	634	t	2017-02-05 21:20:04.014263	2017-02-05 21:20:04.014263
187	RéUNION	RE	REU	Réunion	638	f	2017-02-05 21:20:04.018158	2017-02-05 21:20:04.018158
188	ROMANIA	RO	ROU	Romania	642	t	2017-02-05 21:20:04.024037	2017-02-05 21:20:04.024037
189	SERBIA	RS	SRB	Serbia	688	t	2017-02-05 21:20:04.028217	2017-02-05 21:20:04.028217
190	RUSSIAN FEDERATION	RU	RUS	Russian Federation	643	t	2017-02-05 21:20:04.0347	2017-02-05 21:20:04.0347
191	RWANDA	RW	RWA	Rwanda	646	t	2017-02-05 21:20:04.038492	2017-02-05 21:20:04.038492
192	SAUDI ARABIA	SA	SAU	Saudi Arabia	682	t	2017-02-05 21:20:04.043245	2017-02-05 21:20:04.043245
193	SOLOMON ISLANDS	SB	SLB	Solomon Islands	90	t	2017-02-05 21:20:04.048792	2017-02-05 21:20:04.048792
194	SEYCHELLES	SC	SYC	Seychelles	690	t	2017-02-05 21:20:04.057985	2017-02-05 21:20:04.057985
195	SUDAN	SD	SDN	Sudan	729	t	2017-02-05 21:20:04.067054	2017-02-05 21:20:04.067054
196	SWEDEN	SE	SWE	Sweden	752	t	2017-02-05 21:20:04.077499	2017-02-05 21:20:04.077499
197	SINGAPORE	SG	SGP	Singapore	534	t	2017-02-05 21:20:04.087293	2017-02-05 21:20:04.087293
198	SAINT HELENA, ASCENSION AND TRISTAN DA CUNHA	SH	SHN	Saint Helena, Ascension and Tristan da Cunha	654	t	2017-02-05 21:20:04.095325	2017-02-05 21:20:04.095325
199	SLOVENIA	SI	SVN	Slovenia	705	t	2017-02-05 21:20:04.123128	2017-02-05 21:20:04.123128
200	SVALBARD AND JAN MAYEN	SJ	SJM	Svalbard and Jan Mayen	744	f	2017-02-05 21:20:04.130426	2017-02-05 21:20:04.130426
201	SLOVAKIA	SK	SVK	Slovakia	703	t	2017-02-05 21:20:04.138615	2017-02-05 21:20:04.138615
202	SIERRA LEONE	SL	SLE	Sierra Leone	694	t	2017-02-05 21:20:04.14637	2017-02-05 21:20:04.14637
203	SAN MARINO	SM	SMR	San Marino	674	t	2017-02-05 21:20:04.155437	2017-02-05 21:20:04.155437
204	SENEGAL	SN	SEN	Senegal	686	t	2017-02-05 21:20:04.162594	2017-02-05 21:20:04.162594
205	SOMALIA	SO	SOM	Somalia	706	t	2017-02-05 21:20:04.172132	2017-02-05 21:20:04.172132
206	SURINAME	SR	SUR	Suriname	740	t	2017-02-05 21:20:04.177955	2017-02-05 21:20:04.177955
207	SOUTH SUDAN	SS	SSD	South Sudan	728	t	2017-02-05 21:20:04.185044	2017-02-05 21:20:04.185044
208	SAO TOME AND PRINCIPE	ST	STP	Sao Tome and Principe	678	t	2017-02-05 21:20:04.19145	2017-02-05 21:20:04.19145
209	EL SALVADOR	SV	SLV	El Salvador	222	t	2017-02-05 21:20:04.199288	2017-02-05 21:20:04.199288
210	SINT MAARTEN (DUTCH PART)	SX	SXM	Sint Maarten (Dutch part)	534	f	2017-02-05 21:20:04.204716	2017-02-05 21:20:04.204716
211	SYRIAN ARAB REPUBLIC	SY	SYR	Syrian Arab Republic	760	t	2017-02-05 21:20:04.212055	2017-02-05 21:20:04.212055
212	SWAZILAND	SZ	SWZ	Swaziland	748	t	2017-02-05 21:20:04.217605	2017-02-05 21:20:04.217605
213	TURKS AND CAICOS ISLANDS	TC	TCA	Turks and Caicos Islands	796	f	2017-02-05 21:20:04.222903	2017-02-05 21:20:04.222903
214	CHAD	TD	TCD	Chad	148	t	2017-02-05 21:20:04.231966	2017-02-05 21:20:04.231966
215	FRENCH SOUTHERN TERRITORIES	TF	ATF	French Southern Territories	260	f	2017-02-05 21:20:04.239514	2017-02-05 21:20:04.239514
216	TOGO	TG	TGO	Togo	768	t	2017-02-05 21:20:04.245913	2017-02-05 21:20:04.245913
217	THAILAND	TH	THA	Thailand	764	t	2017-02-05 21:20:04.257928	2017-02-05 21:20:04.257928
218	TAJIKISTAN	TJ	TJK	Tajikistan	762	t	2017-02-05 21:20:04.264686	2017-02-05 21:20:04.264686
219	TOKELAU	TK	TKL	Tokelau	772	f	2017-02-05 21:20:04.270288	2017-02-05 21:20:04.270288
220	TIMOR-LESTE	TL	TLS	Timor-Leste	626	t	2017-02-05 21:20:04.27819	2017-02-05 21:20:04.27819
221	TURKMENISTAN	TM	TKM	Turkmenistan	795	t	2017-02-05 21:20:04.284715	2017-02-05 21:20:04.284715
222	TUNISIA	TN	TUN	Tunisia	788	t	2017-02-05 21:20:04.293513	2017-02-05 21:20:04.293513
223	TONGA	TO	TON	Tonga	776	t	2017-02-05 21:20:04.303087	2017-02-05 21:20:04.303087
224	TURKEY	TR	TUR	Turkey	792	t	2017-02-05 21:20:04.317651	2017-02-05 21:20:04.317651
225	TRINIDAD AND TOBAGO	TT	TTO	Trinidad and Tobago	780	t	2017-02-05 21:20:04.324262	2017-02-05 21:20:04.324262
226	TUVALU	TV	TUV	Tuvalu	798	t	2017-02-05 21:20:04.33157	2017-02-05 21:20:04.33157
227	TAIWAN	TW	TWN	Taiwan	158	t	2017-02-05 21:20:04.341356	2017-02-05 21:20:04.341356
228	TANZANIA, UNITED REPUBLIC OF	TZ	TZA	Tanzania, United Republic of	834	t	2017-02-05 21:20:04.351147	2017-02-05 21:20:04.351147
229	UKRAINE	UA	UKR	Ukraine	804	t	2017-02-05 21:20:04.360763	2017-02-05 21:20:04.360763
230	UGANDA	UG	UGA	Uganda	800	t	2017-02-05 21:20:04.368215	2017-02-05 21:20:04.368215
231	UNITED STATES MINOR OUTLYING ISLANDS	UM	UMI	United States Minor Outlying Islands	581	t	2017-02-05 21:20:04.380183	2017-02-05 21:20:04.380183
232	UNITED STATES	US	USA	United States	840	t	2017-02-05 21:20:04.398074	2017-02-05 21:20:04.398074
233	URUGUAY	UY	URY	Uruguay	858	t	2017-02-05 21:20:04.408782	2017-02-05 21:20:04.408782
234	UZBEKISTAN	UZ	UZB	Uzbekistan	860	t	2017-02-05 21:20:04.419077	2017-02-05 21:20:04.419077
235	HOLY SEE (VATICAN CITY STATE)	VA	VAT	Holy See (Vatican City State)	336	f	2017-02-05 21:20:04.425862	2017-02-05 21:20:04.425862
236	SAINT VINCENT AND THE GRENADINES	VC	VCT	Saint Vincent and the Grenadines	670	t	2017-02-05 21:20:04.43297	2017-02-05 21:20:04.43297
237	VENEZUELA, BOLIVARIAN REPUBLIC OF	VE	VEN	Venezuela, Bolivarian Republic of	862	t	2017-02-05 21:20:04.439965	2017-02-05 21:20:04.439965
238	VIRGIN ISLANDS, BRITISH	VG	VGB	Virgin Islands, British	92	f	2017-02-05 21:20:04.444567	2017-02-05 21:20:04.444567
239	VIRGIN ISLANDS, U.S.	VI	VIR	Virgin Islands, U.S.	850	f	2017-02-05 21:20:04.449943	2017-02-05 21:20:04.449943
240	VIETNAM	VN	VNM	Vietnam	704	t	2017-02-05 21:20:04.45917	2017-02-05 21:20:04.45917
241	VANUATU	VU	VUT	Vanuatu	548	t	2017-02-05 21:20:04.464406	2017-02-05 21:20:04.464406
242	WALLIS AND FUTUNA	WF	WLF	Wallis and Futuna	876	f	2017-02-05 21:20:04.468858	2017-02-05 21:20:04.468858
243	SAMOA	WS	WSM	Samoa	882	t	2017-02-05 21:20:04.47403	2017-02-05 21:20:04.47403
244	YEMEN	YE	YEM	Yemen	887	t	2017-02-05 21:20:04.480772	2017-02-05 21:20:04.480772
245	MAYOTTE	YT	MYT	Mayotte	175	f	2017-02-05 21:20:04.484761	2017-02-05 21:20:04.484761
246	SOUTH AFRICA	ZA	ZAF	South Africa	710	t	2017-02-05 21:20:04.489713	2017-02-05 21:20:04.489713
247	ZAMBIA	ZM	ZMB	Zambia	894	t	2017-02-05 21:20:04.494263	2017-02-05 21:20:04.494263
248	ZIMBABWE	ZW	ZWE	Zimbabwe	716	t	2017-02-05 21:20:04.499563	2017-02-05 21:20:04.499563
\.


--
-- Name: spree_countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_countries_id_seq', 248, true);


--
-- Data for Name: spree_credit_cards; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_credit_cards (id, month, year, cc_type, last_digits, gateway_customer_profile_id, gateway_payment_profile_id, created_at, updated_at, name, user_id, payment_method_id, "default", address_id) FROM stdin;
1	12	2019	visa	1111	BGS-1234	\N	2017-02-05 21:21:28.220106	2017-02-05 21:21:28.220106	Sean Schofield	\N	\N	f	\N
\.


--
-- Name: spree_credit_cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_credit_cards_id_seq', 1, true);


--
-- Data for Name: spree_customer_returns; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_customer_returns (id, number, stock_location_id, created_at, updated_at) FROM stdin;
1	CR084566678	1	2017-02-05 21:21:28.83592	2017-02-05 21:21:28.903292
\.


--
-- Name: spree_customer_returns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_customer_returns_id_seq', 1, true);


--
-- Data for Name: spree_inventory_units; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_inventory_units (id, state, variant_id, order_id, shipment_id, created_at, updated_at, pending, line_item_id, carton_id) FROM stdin;
1	on_hand	1	1	1	2017-02-05 21:21:23.971354	2017-02-05 21:21:24.689497	f	1	\N
\.


--
-- Name: spree_inventory_units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_inventory_units_id_seq', 2, true);


--
-- Data for Name: spree_line_item_actions; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_line_item_actions (id, line_item_id, action_id, quantity, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_line_item_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_line_item_actions_id_seq', 1, false);


--
-- Data for Name: spree_line_items; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_line_items (id, variant_id, order_id, quantity, price, created_at, updated_at, cost_price, tax_category_id, adjustment_total, additional_tax_total, promo_total, included_tax_total) FROM stdin;
1	1	1	1	15.99	2017-02-05 21:21:23.301437	2017-02-05 21:21:24.573228	17.00	1	0.80	0.80	0.00	0.00
\.


--
-- Name: spree_line_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_line_items_id_seq', 29, true);


--
-- Data for Name: spree_log_entries; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_log_entries (id, source_type, source_id, details, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_log_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_log_entries_id_seq', 1, false);


--
-- Data for Name: spree_option_type_prototypes; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_option_type_prototypes (prototype_id, option_type_id, id, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_option_type_prototypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_option_type_prototypes_id_seq', 1, false);


--
-- Data for Name: spree_option_type_translations; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_option_type_translations (id, spree_option_type_id, locale, created_at, updated_at, name, presentation) FROM stdin;
1	1	en	2017-02-17 12:20:29.683455	2017-02-17 12:20:29.683455	tshirt-size	Size
2	2	en	2017-02-17 12:20:29.688396	2017-02-17 12:20:29.688396	tshirt-color	Color
\.


--
-- Name: spree_option_type_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_option_type_translations_id_seq', 2, true);


--
-- Data for Name: spree_option_types; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_option_types (id, name, presentation, "position", created_at, updated_at) FROM stdin;
1	tshirt-size	Size	1	2017-02-05 21:21:08.513472	2017-02-05 21:21:08.513472
2	tshirt-color	Color	2	2017-02-05 21:21:08.550677	2017-02-05 21:21:08.550677
\.


--
-- Name: spree_option_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_option_types_id_seq', 2, true);


--
-- Data for Name: spree_option_value_translations; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_option_value_translations (id, spree_option_value_id, locale, created_at, updated_at, name, presentation) FROM stdin;
1	1	en	2017-02-17 12:20:30.162214	2017-02-17 12:20:30.162214	Small	S
2	2	en	2017-02-17 12:20:30.168107	2017-02-17 12:20:30.168107	Medium	M
3	3	en	2017-02-17 12:20:30.173046	2017-02-17 12:20:30.173046	Large	L
4	4	en	2017-02-17 12:20:30.17848	2017-02-17 12:20:30.17848	Extra Large	XL
5	5	en	2017-02-17 12:20:30.18475	2017-02-17 12:20:30.18475	Red	Red
6	6	en	2017-02-17 12:20:30.191015	2017-02-17 12:20:30.191015	Green	Green
7	7	en	2017-02-17 12:20:30.197385	2017-02-17 12:20:30.197385	Blue	Blue
\.


--
-- Name: spree_option_value_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_option_value_translations_id_seq', 7, true);


--
-- Data for Name: spree_option_values; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_option_values (id, "position", name, presentation, option_type_id, created_at, updated_at) FROM stdin;
1	1	Small	S	1	2017-02-05 21:21:08.609091	2017-02-05 21:21:08.615922
2	2	Medium	M	1	2017-02-05 21:21:08.644823	2017-02-05 21:21:08.648385
3	3	Large	L	1	2017-02-05 21:21:08.663912	2017-02-05 21:21:08.668446
4	4	Extra Large	XL	1	2017-02-05 21:21:08.686474	2017-02-05 21:21:08.691434
5	1	Red	Red	2	2017-02-05 21:21:08.709634	2017-02-05 21:21:08.713328
6	2	Green	Green	2	2017-02-05 21:21:08.729473	2017-02-05 21:21:08.733848
7	3	Blue	Blue	2	2017-02-05 21:21:08.748115	2017-02-05 21:21:08.751593
\.


--
-- Name: spree_option_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_option_values_id_seq', 7, true);


--
-- Data for Name: spree_option_values_variants; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_option_values_variants (variant_id, option_value_id, id, created_at, updated_at) FROM stdin;
10	1	1	2017-02-05 21:21:10.077884	2017-02-05 21:21:10.077884
10	5	2	2017-02-05 21:21:10.080238	2017-02-05 21:21:10.080238
11	1	3	2017-02-05 21:21:10.157896	2017-02-05 21:21:10.157896
11	7	4	2017-02-05 21:21:10.159802	2017-02-05 21:21:10.159802
12	1	5	2017-02-05 21:21:10.221088	2017-02-05 21:21:10.221088
12	6	6	2017-02-05 21:21:10.222592	2017-02-05 21:21:10.222592
13	2	7	2017-02-05 21:21:10.294443	2017-02-05 21:21:10.294443
13	5	8	2017-02-05 21:21:10.29606	2017-02-05 21:21:10.29606
14	2	9	2017-02-05 21:21:10.365751	2017-02-05 21:21:10.365751
14	7	10	2017-02-05 21:21:10.367684	2017-02-05 21:21:10.367684
15	2	11	2017-02-05 21:21:10.429397	2017-02-05 21:21:10.429397
15	6	12	2017-02-05 21:21:10.431049	2017-02-05 21:21:10.431049
16	3	13	2017-02-05 21:21:10.500502	2017-02-05 21:21:10.500502
16	5	14	2017-02-05 21:21:10.502451	2017-02-05 21:21:10.502451
17	3	15	2017-02-05 21:21:10.580655	2017-02-05 21:21:10.580655
17	7	16	2017-02-05 21:21:10.583126	2017-02-05 21:21:10.583126
18	3	17	2017-02-05 21:21:10.653014	2017-02-05 21:21:10.653014
18	6	18	2017-02-05 21:21:10.654633	2017-02-05 21:21:10.654633
19	4	19	2017-02-05 21:21:10.723791	2017-02-05 21:21:10.723791
19	6	20	2017-02-05 21:21:10.725839	2017-02-05 21:21:10.725839
\.


--
-- Name: spree_option_values_variants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_option_values_variants_id_seq', 20, true);


--
-- Data for Name: spree_order_mutexes; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_order_mutexes (id, order_id, created_at) FROM stdin;
\.


--
-- Name: spree_order_mutexes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_order_mutexes_id_seq', 37, true);


--
-- Data for Name: spree_order_stock_locations; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_order_stock_locations (id, order_id, variant_id, quantity, stock_location_id, shipment_fulfilled, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_order_stock_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_order_stock_locations_id_seq', 1, false);


--
-- Data for Name: spree_orders; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_orders (id, number, item_total, total, state, adjustment_total, user_id, completed_at, bill_address_id, ship_address_id, payment_total, shipment_state, payment_state, email, special_instructions, created_at, updated_at, currency, last_ip_address, created_by_id, shipment_total, additional_tax_total, promo_total, channel, included_tax_total, item_count, approver_id, approved_at, confirmation_delivered, guest_token, canceled_at, canceler_id, store_id, approver_name, frontend_viewable) FROM stdin;
1	R123456789	15.99	22.04	complete	1.05	\N	2017-02-05 21:21:24.732431	2	1	0.00	pending	balance_due	spree@example.com	\N	2017-02-05 21:21:23.127237	2017-02-05 21:21:28.473431	USD	\N	\N	5.00	1.05	0.00	spree	0.00	1	\N	\N	t	A3RPOpHNJLpfHnBteLHCSg	\N	\N	1	\N	t
3	R052984255	0.00	0.00	cart	0.00	\N	\N	\N	\N	0.00	\N	\N	\N	\N	2017-02-05 21:32:40.212143	2017-02-05 21:32:40.270462	USD	\N	1	0.00	0.00	0.00	spree	0.00	0	\N	\N	f	FM5Phtc0r6ENWQc9a3yLew	\N	\N	1	\N	f
2	R987654321	0.00	0.00	complete	0.00	\N	2017-02-05 21:21:27.814452	2	1	0.00	\N	paid	spree@example.com	\N	2017-02-05 21:21:23.171742	2017-02-06 19:02:43.723194	USD	\N	\N	0.00	0.00	0.00	spree	0.00	0	\N	\N	t	W4qITKx6fczFpWYlDc5i0A	\N	\N	1	\N	t
6	R603635615	0.00	0.00	cart	0.00	1	\N	\N	\N	0.00	\N	\N	admin@example.com	\N	2017-02-18 10:18:20.277064	2017-02-18 15:28:57.457668	MDL	10.240.1.4	1	0.00	0.00	0.00	spree	0.00	0	\N	\N	f	sHEkc7KEWV63z4wBle9hCQ	\N	\N	1	\N	t
5	R360796656	0.00	0.00	cart	0.00	\N	\N	\N	\N	0.00	\N	\N	\N	\N	2017-02-17 12:55:08.385009	2017-02-17 12:55:08.421836	MDL	\N	1	0.00	0.00	0.00	spree	0.00	0	\N	\N	f	1Iqiah89bLn1tsrQfeViiw	\N	\N	1	\N	f
\.


--
-- Name: spree_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_orders_id_seq', 6, true);


--
-- Data for Name: spree_orders_promotions; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_orders_promotions (order_id, promotion_id, promotion_code_id, id, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_orders_promotions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_orders_promotions_id_seq', 1, false);


--
-- Data for Name: spree_payment_capture_events; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_payment_capture_events (id, amount, payment_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_payment_capture_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_payment_capture_events_id_seq', 1, false);


--
-- Data for Name: spree_payment_methods; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_payment_methods (id, type, name, description, active, deleted_at, created_at, updated_at, auto_capture, preferences, preference_source, "position", available_to_users, available_to_admin) FROM stdin;
1	Spree::PaymentMethod::StoreCredit	Store Credit	Store Credit	t	\N	2017-02-05 21:19:43.783367	2017-02-05 21:19:43.783367	\N	\N	\N	0	f	f
2	Spree::Gateway::Bogus	Credit Card	Bogus payment gateway	t	\N	2017-02-05 21:21:04.640853	2017-02-05 21:21:04.640853	\N	---\n:server: test\n:test_mode: true\n	\N	1	t	t
3	Spree::PaymentMethod::Check	Check	Pay by check.	t	\N	2017-02-05 21:21:04.713343	2017-02-05 21:21:04.713343	\N	\N	\N	2	t	t
\.


--
-- Name: spree_payment_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_payment_methods_id_seq', 3, true);


--
-- Data for Name: spree_payments; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_payments (id, amount, order_id, source_type, source_id, payment_method_id, state, response_code, avs_response, created_at, updated_at, number, cvv_response_code, cvv_response_message) FROM stdin;
1	0.00	1	\N	\N	3	checkout	\N	\N	2017-02-05 21:21:23.417099	2017-02-05 21:21:23.417099	CQEV8PSA	\N	\N
2	0.00	2	\N	\N	3	checkout	\N	\N	2017-02-05 21:21:24.839507	2017-02-05 21:21:24.839507	XP7ZASFX	\N	\N
3	29.39	2	Spree::CreditCard	1	2	pending	12345	\N	2017-02-05 21:21:28.312671	2017-02-05 21:21:28.312671	NG5GLVDF	\N	\N
4	22.04	1	Spree::CreditCard	1	2	pending	12345	\N	2017-02-05 21:21:28.469086	2017-02-05 21:21:28.469086	S6Q37KMV	\N	\N
\.


--
-- Name: spree_payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_payments_id_seq', 4, true);


--
-- Data for Name: spree_preferences; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_preferences (id, value, key, created_at, updated_at) FROM stdin;
1	---\n- :ro\n- :ru\n	solidus_i18n/configuration/available_locales	2017-02-16 21:46:22.207087	2017-02-16 21:46:22.207087
2	---\n- :ro\n- :ru\n	solidus_globalize/configuration/supported_locales	2017-02-17 12:39:27.413552	2017-02-17 12:39:27.413552
\.


--
-- Name: spree_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_preferences_id_seq', 2, true);


--
-- Data for Name: spree_prices; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_prices (id, variant_id, amount, currency, deleted_at, created_at, updated_at, country_iso) FROM stdin;
1	1	15.99	USD	\N	2017-02-05 21:21:05.707344	2017-02-05 21:21:05.707344	\N
2	1	14.00	EUR	\N	2017-02-05 21:21:05.969395	2017-02-05 21:21:05.969395	\N
3	2	22.99	USD	\N	2017-02-05 21:21:06.024941	2017-02-05 21:21:06.024941	\N
4	2	19.00	EUR	\N	2017-02-05 21:21:06.100699	2017-02-05 21:21:06.100699	\N
6	3	16.00	EUR	\N	2017-02-05 21:21:06.213655	2017-02-05 21:21:06.213655	\N
7	4	19.99	USD	\N	2017-02-05 21:21:06.26333	2017-02-05 21:21:06.26333	\N
8	4	16.00	EUR	\N	2017-02-05 21:21:06.331178	2017-02-05 21:21:06.331178	\N
9	5	19.99	USD	\N	2017-02-05 21:21:06.734991	2017-02-05 21:21:06.734991	\N
10	5	16.00	EUR	\N	2017-02-05 21:21:06.875285	2017-02-05 21:21:06.875285	\N
12	6	16.00	EUR	\N	2017-02-05 21:21:07.029777	2017-02-05 21:21:07.029777	\N
15	8	13.99	USD	\N	2017-02-05 21:21:07.195314	2017-02-05 21:21:07.195314	\N
16	8	12.00	EUR	\N	2017-02-05 21:21:07.256343	2017-02-05 21:21:07.256343	\N
17	9	16.99	USD	\N	2017-02-05 21:21:07.303236	2017-02-05 21:21:07.303236	\N
18	9	14.00	EUR	\N	2017-02-05 21:21:07.370285	2017-02-05 21:21:07.370285	\N
19	10	19.99	USD	\N	2017-02-05 21:21:10.074487	2017-02-05 21:21:10.074487	\N
20	11	19.99	USD	\N	2017-02-05 21:21:10.154969	2017-02-05 21:21:10.154969	\N
21	12	19.99	USD	\N	2017-02-05 21:21:10.217758	2017-02-05 21:21:10.217758	\N
22	13	19.99	USD	\N	2017-02-05 21:21:10.291443	2017-02-05 21:21:10.291443	\N
23	14	19.99	USD	\N	2017-02-05 21:21:10.3611	2017-02-05 21:21:10.3611	\N
24	15	19.99	USD	\N	2017-02-05 21:21:10.426408	2017-02-05 21:21:10.426408	\N
25	16	19.99	USD	\N	2017-02-05 21:21:10.497077	2017-02-05 21:21:10.497077	\N
26	17	19.99	USD	\N	2017-02-05 21:21:10.576673	2017-02-05 21:21:10.576673	\N
27	18	19.99	USD	\N	2017-02-05 21:21:10.64955	2017-02-05 21:21:10.64955	\N
28	19	19.99	USD	\N	2017-02-05 21:21:10.719899	2017-02-05 21:21:10.719899	\N
29	20	10.00	USD	2017-02-06 18:16:54.506672	2017-02-06 18:14:58.147037	2017-02-06 18:14:58.147037	\N
30	21	10.00	USD	2017-02-13 20:02:32.037987	2017-02-06 19:12:26.374706	2017-02-06 19:12:26.374706	\N
13	7	19.99	USD	2017-02-13 20:02:36.178028	2017-02-05 21:21:07.080698	2017-02-05 21:21:07.080698	\N
14	7	16.00	EUR	2017-02-13 20:02:36.230277	2017-02-05 21:21:07.149801	2017-02-05 21:21:07.149801	\N
31	6	20.00	MDL	\N	2017-02-16 21:13:35.771767	2017-02-16 21:13:35.771767	\N
32	3	20.00	MDL	\N	2017-02-16 21:13:55.689955	2017-02-16 21:13:55.689955	\N
33	4	211.00	MDL	\N	2017-02-16 21:14:19.865408	2017-02-16 21:14:19.865408	\N
34	8	20.00	MDL	\N	2017-02-16 21:14:46.473572	2017-02-16 21:14:46.473572	\N
36	5	30.00	MDL	\N	2017-02-16 21:15:52.077549	2017-02-16 21:15:52.077549	\N
35	22	11.00	MDL	2017-02-16 21:16:05.295922	2017-02-16 21:15:15.892397	2017-02-16 21:15:15.892397	\N
37	9	30.00	MDL	\N	2017-02-16 21:16:14.259966	2017-02-16 21:16:14.259966	\N
38	23	19.00	MDL	2017-02-17 12:39:56.990752	2017-02-17 12:25:46.720893	2017-02-17 12:25:46.720893	\N
39	24	1.00	MDL	2017-02-17 14:33:26.89755	2017-02-17 12:55:30.105271	2017-02-17 12:55:30.105271	\N
40	25	123.00	MDL	2017-02-17 14:33:30.685359	2017-02-17 13:31:08.345427	2017-02-17 13:31:08.345427	\N
41	26	12.00	MDL	2017-02-17 15:38:39.348743	2017-02-17 15:35:50.765149	2017-02-17 15:35:50.765149	\N
11	6	19.99	USD	2017-02-17 15:38:56.350964	2017-02-05 21:21:06.938604	2017-02-05 21:21:06.938604	\N
5	3	19.99	USD	2017-02-17 18:38:58.095016	2017-02-05 21:21:06.143274	2017-02-05 21:21:06.143274	\N
42	27	100.00	MDL	\N	2017-02-17 18:29:28.267277	2017-02-17 22:08:56.731674	\N
43	28	12.00	RUB	\N	2017-02-17 22:24:14.707789	2017-02-17 22:24:14.707789	\N
\.


--
-- Name: spree_prices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_prices_id_seq', 43, true);


--
-- Data for Name: spree_product_option_types; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_product_option_types (id, "position", product_id, option_type_id, created_at, updated_at) FROM stdin;
1	1	3	1	2017-02-05 21:21:08.809209	2017-02-05 21:21:08.809209
2	2	3	2	2017-02-05 21:21:08.824831	2017-02-05 21:21:08.824831
\.


--
-- Name: spree_product_option_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_product_option_types_id_seq', 3, true);


--
-- Data for Name: spree_product_promotion_rules; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_product_promotion_rules (product_id, promotion_rule_id, id, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_product_promotion_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_product_promotion_rules_id_seq', 1, false);


--
-- Data for Name: spree_product_properties; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_product_properties (id, value, product_id, property_id, created_at, updated_at, "position") FROM stdin;
1	Wilson	3	1	2017-02-05 21:21:08.945504	2017-02-05 21:21:08.945504	1
2	Wannabe Sports	3	2	2017-02-05 21:21:08.977987	2017-02-05 21:21:08.977987	2
3	JK1002	3	3	2017-02-05 21:21:09.020369	2017-02-05 21:21:09.020369	3
4	Baseball Jersey	3	4	2017-02-05 21:21:09.058492	2017-02-05 21:21:09.058492	4
5	Long	3	5	2017-02-05 21:21:09.091363	2017-02-05 21:21:09.091363	5
6	100% cotton	3	6	2017-02-05 21:21:09.118972	2017-02-05 21:21:09.118972	6
7	Loose	3	7	2017-02-05 21:21:09.150367	2017-02-05 21:21:09.150367	7
8	Men's	3	8	2017-02-05 21:21:09.183088	2017-02-05 21:21:09.183088	8
9	Jerseys	4	1	2017-02-05 21:21:09.215622	2017-02-05 21:21:09.215622	1
10	Resiliance	4	2	2017-02-05 21:21:09.250209	2017-02-05 21:21:09.250209	2
11	TL174	4	3	2017-02-05 21:21:09.284631	2017-02-05 21:21:09.284631	3
12	Jr. Spaghetti T	4	4	2017-02-05 21:21:09.31089	2017-02-05 21:21:09.31089	4
13	None	4	5	2017-02-05 21:21:09.336026	2017-02-05 21:21:09.336026	5
14	90% Cotton, 10% Nylon	4	6	2017-02-05 21:21:09.361775	2017-02-05 21:21:09.361775	6
15	Form	4	7	2017-02-05 21:21:09.391107	2017-02-05 21:21:09.391107	7
16	Women's	4	8	2017-02-05 21:21:09.421614	2017-02-05 21:21:09.421614	8
17	Jerseys	5	1	2017-02-05 21:21:09.459006	2017-02-05 21:21:09.459006	1
18	Conditioned	5	2	2017-02-05 21:21:09.489051	2017-02-05 21:21:09.489051	2
19	TL9002	5	3	2017-02-05 21:21:09.520932	2017-02-05 21:21:09.520932	3
20	Ringer T	5	4	2017-02-05 21:21:09.555489	2017-02-05 21:21:09.555489	4
21	Short	5	5	2017-02-05 21:21:09.58409	2017-02-05 21:21:09.58409	5
22	100% Vellum	5	6	2017-02-05 21:21:09.614457	2017-02-05 21:21:09.614457	6
23	Loose	5	7	2017-02-05 21:21:09.639761	2017-02-05 21:21:09.639761	7
24	Men's	5	8	2017-02-05 21:21:09.66803	2017-02-05 21:21:09.66803	8
25	Tote	1	9	2017-02-05 21:21:09.702199	2017-02-05 21:21:09.702199	1
26	15" x 18" x 6"	1	10	2017-02-05 21:21:09.735406	2017-02-05 21:21:09.735406	2
27	Canvas	1	11	2017-02-05 21:21:09.767613	2017-02-05 21:21:09.767613	3
28	Messenger	2	9	2017-02-05 21:21:09.804247	2017-02-05 21:21:09.804247	1
29	14 1/2" x 12" x 5"	2	10	2017-02-05 21:21:09.836835	2017-02-05 21:21:09.836835	2
30	600 Denier Polyester	2	11	2017-02-05 21:21:09.866193	2017-02-05 21:21:09.866193	3
31	Mug	8	9	2017-02-05 21:21:09.898228	2017-02-05 21:21:09.898228	1
32	4.5" tall, 3.25" dia.	8	10	2017-02-05 21:21:09.924732	2017-02-05 21:21:09.924732	2
33	Stein	9	9	2017-02-05 21:21:09.957103	2017-02-05 21:21:09.957103	1
34	6.75" tall, 3.75" dia. base, 3" dia. rim	9	10	2017-02-05 21:21:09.982093	2017-02-05 21:21:09.982093	2
\.


--
-- Name: spree_product_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_product_properties_id_seq', 34, true);


--
-- Data for Name: spree_product_property_translations; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_product_property_translations (id, spree_product_property_id, locale, created_at, updated_at, value) FROM stdin;
1	1	en	2017-02-17 12:20:30.31309	2017-02-17 12:20:30.31309	Wilson
2	2	en	2017-02-17 12:20:30.318195	2017-02-17 12:20:30.318195	Wannabe Sports
3	3	en	2017-02-17 12:20:30.322117	2017-02-17 12:20:30.322117	JK1002
4	4	en	2017-02-17 12:20:30.325968	2017-02-17 12:20:30.325968	Baseball Jersey
5	5	en	2017-02-17 12:20:30.329877	2017-02-17 12:20:30.329877	Long
6	6	en	2017-02-17 12:20:30.333887	2017-02-17 12:20:30.333887	100% cotton
7	7	en	2017-02-17 12:20:30.337597	2017-02-17 12:20:30.337597	Loose
8	8	en	2017-02-17 12:20:30.341511	2017-02-17 12:20:30.341511	Men's
9	9	en	2017-02-17 12:20:30.344977	2017-02-17 12:20:30.344977	Jerseys
10	10	en	2017-02-17 12:20:30.348401	2017-02-17 12:20:30.348401	Resiliance
11	11	en	2017-02-17 12:20:30.352032	2017-02-17 12:20:30.352032	TL174
12	12	en	2017-02-17 12:20:30.355752	2017-02-17 12:20:30.355752	Jr. Spaghetti T
13	13	en	2017-02-17 12:20:30.359294	2017-02-17 12:20:30.359294	None
14	14	en	2017-02-17 12:20:30.363035	2017-02-17 12:20:30.363035	90% Cotton, 10% Nylon
15	15	en	2017-02-17 12:20:30.36657	2017-02-17 12:20:30.36657	Form
16	16	en	2017-02-17 12:20:30.369906	2017-02-17 12:20:30.369906	Women's
17	17	en	2017-02-17 12:20:30.373374	2017-02-17 12:20:30.373374	Jerseys
18	18	en	2017-02-17 12:20:30.37661	2017-02-17 12:20:30.37661	Conditioned
19	19	en	2017-02-17 12:20:30.380143	2017-02-17 12:20:30.380143	TL9002
20	20	en	2017-02-17 12:20:30.384203	2017-02-17 12:20:30.384203	Ringer T
21	21	en	2017-02-17 12:20:30.387887	2017-02-17 12:20:30.387887	Short
22	22	en	2017-02-17 12:20:30.391727	2017-02-17 12:20:30.391727	100% Vellum
23	23	en	2017-02-17 12:20:30.395314	2017-02-17 12:20:30.395314	Loose
24	24	en	2017-02-17 12:20:30.399369	2017-02-17 12:20:30.399369	Men's
25	25	en	2017-02-17 12:20:30.403108	2017-02-17 12:20:30.403108	Tote
26	26	en	2017-02-17 12:20:30.407019	2017-02-17 12:20:30.407019	15" x 18" x 6"
27	27	en	2017-02-17 12:20:30.41091	2017-02-17 12:20:30.41091	Canvas
28	28	en	2017-02-17 12:20:30.414806	2017-02-17 12:20:30.414806	Messenger
29	29	en	2017-02-17 12:20:30.418707	2017-02-17 12:20:30.418707	14 1/2" x 12" x 5"
30	30	en	2017-02-17 12:20:30.422715	2017-02-17 12:20:30.422715	600 Denier Polyester
31	31	en	2017-02-17 12:20:30.426461	2017-02-17 12:20:30.426461	Mug
32	32	en	2017-02-17 12:20:30.430319	2017-02-17 12:20:30.430319	4.5" tall, 3.25" dia.
33	33	en	2017-02-17 12:20:30.434202	2017-02-17 12:20:30.434202	Stein
34	34	en	2017-02-17 12:20:30.437955	2017-02-17 12:20:30.437955	6.75" tall, 3.75" dia. base, 3" dia. rim
\.


--
-- Name: spree_product_property_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_product_property_translations_id_seq', 34, true);


--
-- Data for Name: spree_product_translations; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_product_translations (id, spree_product_id, locale, created_at, updated_at, name, description, meta_description, meta_keywords, slug, deleted_at) FROM stdin;
1	3	en	2017-02-17 12:20:29.551612	2017-02-17 12:20:30.06313	MAtras Gri	Ut labore aut voluptatibus ducimus et asperiores ullam. Numquam voluptates sunt qui et voluptatibus quia. Laudantium dolores culpa modi fuga sed et sit omnis. Reiciendis quia tempore architecto in quam aliquid optio. Quos ipsum eos hic assumenda enim vitae provident molestiae.			ruby-on-rails-baseball-jersey	\N
2	4	en	2017-02-17 12:20:29.557153	2017-02-17 12:20:30.068933	Ruby on Rails Jr. Spaghetti	Ut labore aut voluptatibus ducimus et asperiores ullam. Numquam voluptates sunt qui et voluptatibus quia. Laudantium dolores culpa modi fuga sed et sit omnis. Reiciendis quia tempore architecto in quam aliquid optio. Quos ipsum eos hic assumenda enim vitae provident molestiae.			ruby-on-rails-jr-spaghetti	\N
3	5	en	2017-02-17 12:20:29.561072	2017-02-17 12:20:30.072612	Ruby on Rails Ringer T-Shirt	Ut labore aut voluptatibus ducimus et asperiores ullam. Numquam voluptates sunt qui et voluptatibus quia. Laudantium dolores culpa modi fuga sed et sit omnis. Reiciendis quia tempore architecto in quam aliquid optio. Quos ipsum eos hic assumenda enim vitae provident molestiae.			ruby-on-rails-ringer-t-shirt	\N
4	6	en	2017-02-17 12:20:29.564865	2017-02-17 12:20:30.076374	Bazin Intex	Ut labore aut voluptatibus ducimus et asperiores ullam. Numquam voluptates sunt qui et voluptatibus quia. Laudantium dolores culpa modi fuga sed et sit omnis. Reiciendis quia tempore architecto in quam aliquid optio. Quos ipsum eos hic assumenda enim vitae provident molestiae.			ruby-baseball-jersey	\N
5	8	en	2017-02-17 12:20:29.56913	2017-02-17 12:20:30.080138	Ruby on Rails Mug	Ut labore aut voluptatibus ducimus et asperiores ullam. Numquam voluptates sunt qui et voluptatibus quia. Laudantium dolores culpa modi fuga sed et sit omnis. Reiciendis quia tempore architecto in quam aliquid optio. Quos ipsum eos hic assumenda enim vitae provident molestiae.			ruby-on-rails-mug	\N
6	9	en	2017-02-17 12:20:29.573134	2017-02-17 12:20:30.083934	Ruby on Rails Stein	Ut labore aut voluptatibus ducimus et asperiores ullam. Numquam voluptates sunt qui et voluptatibus quia. Laudantium dolores culpa modi fuga sed et sit omnis. Reiciendis quia tempore architecto in quam aliquid optio. Quos ipsum eos hic assumenda enim vitae provident molestiae.			ruby-on-rails-stein	\N
7	13	en	2017-02-17 12:25:46.806675	2017-02-17 12:39:57.067821	Jora	\N	\N	\N	1487335197_jora	2017-02-17 12:39:57.062365
8	14	en	2017-02-17 12:55:30.160566	2017-02-17 12:55:30.160566	translation test	\N	\N	\N	translation-test	\N
9	15	en	2017-02-17 13:31:08.44343	2017-02-17 13:31:08.44343	sdfsdf	\N	\N	\N	sdfsdf	\N
\.


--
-- Name: spree_product_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_product_translations_id_seq', 9, true);


--
-- Data for Name: spree_products; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_products (id, name, description, available_on, deleted_at, slug, meta_description, meta_keywords, tax_category_id, shipping_category_id, created_at, updated_at, promotionable, meta_title) FROM stdin;
7	Apache Baseball Jersey	Ut labore aut voluptatibus ducimus et asperiores ullam. Numquam voluptates sunt qui et voluptatibus quia. Laudantium dolores culpa modi fuga sed et sit omnis. Reiciendis quia tempore architecto in quam aliquid optio. Quos ipsum eos hic assumenda enim vitae provident molestiae.	2017-02-05 21:21:05.455376	2017-02-13 20:02:36.241854	1487016156_apache-baseball-jersey	\N	\N	1	1	2017-02-05 21:21:07.074966	2017-02-13 20:02:36.2468	t	\N
4	Ruby on Rails Jr. Spaghetti	Ut labore aut voluptatibus ducimus et asperiores ullam. Numquam voluptates sunt qui et voluptatibus quia. Laudantium dolores culpa modi fuga sed et sit omnis. Reiciendis quia tempore architecto in quam aliquid optio. Quos ipsum eos hic assumenda enim vitae provident molestiae.	2017-02-05 00:00:00	\N	ruby-on-rails-jr-spaghetti			1	1	2017-02-05 21:21:06.257829	2017-02-16 21:14:19.878411	t	
10	New shit	sfsdfsdfsdfdf	2017-02-06 00:00:00	2017-02-06 18:16:54.526883	1486405014_new-shit	sdfsdf	sdfsdf	1	1	2017-02-06 18:14:58.038907	2017-02-06 18:16:54.458697	t	sdfsdf
12	dasdasd	\N	\N	2017-02-16 21:16:05.33224	1487279765_dasdasd	\N	\N	\N	1	2017-02-16 21:15:15.628897	2017-02-16 21:16:05.336064	t	\N
8	Ruby on Rails Mug	Ut labore aut voluptatibus ducimus et asperiores ullam. Numquam voluptates sunt qui et voluptatibus quia. Laudantium dolores culpa modi fuga sed et sit omnis. Reiciendis quia tempore architecto in quam aliquid optio. Quos ipsum eos hic assumenda enim vitae provident molestiae.	2017-02-05 00:00:00	\N	ruby-on-rails-mug			\N	1	2017-02-05 21:21:07.189914	2017-02-16 21:14:46.490484	t	
1	Ruby on Rails Tote	Ut labore aut voluptatibus ducimus et asperiores ullam. Numquam voluptates sunt qui et voluptatibus quia. Laudantium dolores culpa modi fuga sed et sit omnis. Reiciendis quia tempore architecto in quam aliquid optio. Quos ipsum eos hic assumenda enim vitae provident molestiae.	2017-02-05 21:21:05.455376	2017-02-06 19:18:15.053306	ruby-on-rails-tote	\N	\N	1	1	2017-02-05 21:21:05.695618	2017-02-05 21:21:24.688188	t	\N
2	Ruby on Rails Bag	Ut labore aut voluptatibus ducimus et asperiores ullam. Numquam voluptates sunt qui et voluptatibus quia. Laudantium dolores culpa modi fuga sed et sit omnis. Reiciendis quia tempore architecto in quam aliquid optio. Quos ipsum eos hic assumenda enim vitae provident molestiae.	2017-02-05 21:21:05.455376	2017-02-06 19:22:16.407064	ruby-on-rails-bag	\N	\N	1	1	2017-02-05 21:21:06.017205	2017-02-06 19:02:43.534949	t	\N
11	jora prod	\N	2017-02-06 00:00:00	2017-02-13 20:02:32.098721	1487016152_jora-prod	\N	\N	1	1	2017-02-06 19:12:26.32901	2017-02-13 20:02:32.104124	t	\N
5	Ruby on Rails Ringer T-Shirt	Ut labore aut voluptatibus ducimus et asperiores ullam. Numquam voluptates sunt qui et voluptatibus quia. Laudantium dolores culpa modi fuga sed et sit omnis. Reiciendis quia tempore architecto in quam aliquid optio. Quos ipsum eos hic assumenda enim vitae provident molestiae.	2017-02-05 00:00:00	\N	ruby-on-rails-ringer-t-shirt			1	1	2017-02-05 21:21:06.558802	2017-02-16 21:15:52.092572	t	
9	Ruby on Rails Stein	Ut labore aut voluptatibus ducimus et asperiores ullam. Numquam voluptates sunt qui et voluptatibus quia. Laudantium dolores culpa modi fuga sed et sit omnis. Reiciendis quia tempore architecto in quam aliquid optio. Quos ipsum eos hic assumenda enim vitae provident molestiae.	2017-02-05 00:00:00	\N	ruby-on-rails-stein			\N	1	2017-02-05 21:21:07.297128	2017-02-16 21:16:14.279611	t	
13		\N	\N	2017-02-17 12:39:57.072	\N	\N	\N	\N	1	2017-02-17 12:25:46.705351	2017-02-17 12:39:57.082105	t	\N
14		\N	\N	2017-02-17 14:33:27.241665	1487342007_	\N	\N	\N	1	2017-02-17 12:55:30.091695	2017-02-17 14:33:27.253481	t	\N
15		\N	\N	2017-02-17 14:33:30.723532	1487342010_	\N	\N	\N	1	2017-02-17 13:31:08.331679	2017-02-17 14:33:30.729616	t	\N
16	sfdsf		2017-02-17 00:00:00	2017-02-17 15:38:39.383873	1487345919_sfdsf			\N	1	2017-02-17 15:35:50.736607	2017-02-17 15:38:39.394641	t	
6	Bazin Intex	Ut labore aut voluptatibus ducimus et asperiores ullam. Numquam voluptates sunt qui et voluptatibus quia. Laudantium dolores culpa modi fuga sed et sit omnis. Reiciendis quia tempore architecto in quam aliquid optio. Quos ipsum eos hic assumenda enim vitae provident molestiae.	2017-02-05 00:00:00	\N	ruby-baseball-jersey			\N	1	2017-02-05 21:21:06.932298	2017-02-17 15:38:56.445451	t	
3	MAtras Gri	Ut labore aut voluptatibus ducimus et asperiores ullam. Numquam voluptates sunt qui et voluptatibus quia. Laudantium dolores culpa modi fuga sed et sit omnis. Reiciendis quia tempore architecto in quam aliquid optio. Quos ipsum eos hic assumenda enim vitae provident molestiae.	2017-02-05 00:00:00	\N	ruby-on-rails-baseball-jersey			1	1	2017-02-05 21:21:06.137995	2017-02-17 18:38:58.24779	t	
17	in lei		\N	\N	in-lei			2	1	2017-02-17 18:29:28.251193	2017-02-17 22:08:56.749054	t	
18	rub		2017-02-18 00:00:00	\N	rub			2	1	2017-02-17 22:24:14.689249	2017-02-17 22:24:23.508562	t	
\.


--
-- Name: spree_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_products_id_seq', 18, true);


--
-- Data for Name: spree_products_taxons; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_products_taxons (product_id, taxon_id, id, "position", created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_products_taxons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_products_taxons_id_seq', 21, true);


--
-- Data for Name: spree_promotion_action_line_items; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_promotion_action_line_items (id, promotion_action_id, variant_id, quantity, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_promotion_action_line_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_promotion_action_line_items_id_seq', 1, false);


--
-- Data for Name: spree_promotion_actions; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_promotion_actions (id, promotion_id, "position", type, deleted_at, preferences, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_promotion_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_promotion_actions_id_seq', 1, false);


--
-- Data for Name: spree_promotion_categories; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_promotion_categories (id, name, created_at, updated_at, code) FROM stdin;
\.


--
-- Name: spree_promotion_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_promotion_categories_id_seq', 1, false);


--
-- Data for Name: spree_promotion_codes; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_promotion_codes (id, promotion_id, value, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_promotion_codes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_promotion_codes_id_seq', 1, false);


--
-- Data for Name: spree_promotion_rule_taxons; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_promotion_rule_taxons (id, taxon_id, promotion_rule_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_promotion_rule_taxons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_promotion_rule_taxons_id_seq', 1, false);


--
-- Data for Name: spree_promotion_rules; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_promotion_rules (id, promotion_id, product_group_id, type, created_at, updated_at, code, preferences) FROM stdin;
\.


--
-- Name: spree_promotion_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_promotion_rules_id_seq', 1, false);


--
-- Data for Name: spree_promotion_rules_users; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_promotion_rules_users (user_id, promotion_rule_id, id, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_promotion_rules_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_promotion_rules_users_id_seq', 1, false);


--
-- Data for Name: spree_promotion_translations; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_promotion_translations (id, spree_promotion_id, locale, created_at, updated_at, name, description) FROM stdin;
\.


--
-- Name: spree_promotion_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_promotion_translations_id_seq', 1, false);


--
-- Data for Name: spree_promotions; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_promotions (id, description, expires_at, starts_at, name, type, usage_limit, match_policy, code, advertise, path, created_at, updated_at, promotion_category_id, per_code_usage_limit, apply_automatically) FROM stdin;
\.


--
-- Name: spree_promotions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_promotions_id_seq', 1, false);


--
-- Data for Name: spree_properties; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_properties (id, name, presentation, created_at, updated_at) FROM stdin;
1	Manufacturer	Manufacturer	2017-02-05 21:21:08.880553	2017-02-05 21:21:08.880553
2	Brand	Brand	2017-02-05 21:21:08.971768	2017-02-05 21:21:08.971768
3	Model	Model	2017-02-05 21:21:09.011787	2017-02-05 21:21:09.011787
4	Shirt Type	Shirt Type	2017-02-05 21:21:09.046688	2017-02-05 21:21:09.046688
5	Sleeve Type	Sleeve Type	2017-02-05 21:21:09.084962	2017-02-05 21:21:09.084962
6	Made from	Made from	2017-02-05 21:21:09.113144	2017-02-05 21:21:09.113144
7	Fit	Fit	2017-02-05 21:21:09.142784	2017-02-05 21:21:09.142784
8	Gender	Gender	2017-02-05 21:21:09.176015	2017-02-05 21:21:09.176015
9	Type	Type	2017-02-05 21:21:09.69359	2017-02-05 21:21:09.69359
10	Size	Size	2017-02-05 21:21:09.728306	2017-02-05 21:21:09.728306
11	Material	Material	2017-02-05 21:21:09.759352	2017-02-05 21:21:09.759352
\.


--
-- Name: spree_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_properties_id_seq', 11, true);


--
-- Data for Name: spree_property_prototypes; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_property_prototypes (prototype_id, property_id, id, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_property_prototypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_property_prototypes_id_seq', 1, false);


--
-- Data for Name: spree_property_translations; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_property_translations (id, spree_property_id, locale, created_at, updated_at, name, presentation) FROM stdin;
1	1	en	2017-02-17 12:20:29.752374	2017-02-17 12:20:29.752374	Manufacturer	Manufacturer
2	2	en	2017-02-17 12:20:29.756613	2017-02-17 12:20:29.756613	Brand	Brand
3	3	en	2017-02-17 12:20:29.759595	2017-02-17 12:20:29.759595	Model	Model
4	4	en	2017-02-17 12:20:29.763037	2017-02-17 12:20:29.763037	Shirt Type	Shirt Type
5	5	en	2017-02-17 12:20:29.766384	2017-02-17 12:20:29.766384	Sleeve Type	Sleeve Type
6	6	en	2017-02-17 12:20:29.769518	2017-02-17 12:20:29.769518	Made from	Made from
7	7	en	2017-02-17 12:20:29.774112	2017-02-17 12:20:29.774112	Fit	Fit
8	8	en	2017-02-17 12:20:29.779755	2017-02-17 12:20:29.779755	Gender	Gender
9	9	en	2017-02-17 12:20:29.785041	2017-02-17 12:20:29.785041	Type	Type
10	10	en	2017-02-17 12:20:29.789099	2017-02-17 12:20:29.789099	Size	Size
11	11	en	2017-02-17 12:20:29.793921	2017-02-17 12:20:29.793921	Material	Material
\.


--
-- Name: spree_property_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_property_translations_id_seq', 11, true);


--
-- Data for Name: spree_prototype_taxons; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_prototype_taxons (id, taxon_id, prototype_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_prototype_taxons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_prototype_taxons_id_seq', 1, false);


--
-- Data for Name: spree_prototypes; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_prototypes (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_prototypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_prototypes_id_seq', 1, false);


--
-- Data for Name: spree_refund_reasons; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_refund_reasons (id, name, active, mutable, created_at, updated_at, code) FROM stdin;
1	Return processing	t	f	2017-02-05 21:19:41.415142	2017-02-05 21:19:41.415142	\N
\.


--
-- Name: spree_refund_reasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_refund_reasons_id_seq', 1, true);


--
-- Data for Name: spree_refunds; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_refunds (id, payment_id, amount, transaction_id, created_at, updated_at, refund_reason_id, reimbursement_id) FROM stdin;
\.


--
-- Name: spree_refunds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_refunds_id_seq', 1, false);


--
-- Data for Name: spree_reimbursement_credits; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_reimbursement_credits (id, amount, reimbursement_id, creditable_id, creditable_type, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_reimbursement_credits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_reimbursement_credits_id_seq', 1, false);


--
-- Data for Name: spree_reimbursement_types; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_reimbursement_types (id, name, active, mutable, created_at, updated_at, type) FROM stdin;
1	original	t	t	2017-02-05 21:19:41.811079	2017-02-05 21:19:41.918234	Spree::ReimbursementType::OriginalPayment
2	Store Credit	t	t	2017-02-05 21:19:43.882882	2017-02-05 21:19:43.882882	Spree::ReimbursementType::StoreCredit
\.


--
-- Name: spree_reimbursement_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_reimbursement_types_id_seq', 2, true);


--
-- Data for Name: spree_reimbursements; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_reimbursements (id, number, reimbursement_status, customer_return_id, order_id, total, created_at, updated_at) FROM stdin;
1	RI201352203	pending	1	2	\N	2017-02-05 21:21:28.887455	2017-02-05 21:21:28.887455
\.


--
-- Name: spree_reimbursements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_reimbursements_id_seq', 1, true);


--
-- Data for Name: spree_return_authorizations; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_return_authorizations (id, number, state, order_id, memo, created_at, updated_at, stock_location_id, return_reason_id) FROM stdin;
\.


--
-- Name: spree_return_authorizations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_return_authorizations_id_seq', 1, false);


--
-- Data for Name: spree_return_items; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_return_items (id, return_authorization_id, inventory_unit_id, exchange_variant_id, created_at, updated_at, amount, included_tax_total, additional_tax_total, reception_status, acceptance_status, customer_return_id, reimbursement_id, exchange_inventory_unit_id, acceptance_status_errors, preferred_reimbursement_type_id, override_reimbursement_type_id, resellable, return_reason_id) FROM stdin;
\.


--
-- Name: spree_return_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_return_items_id_seq', 1, true);


--
-- Data for Name: spree_return_reasons; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_return_reasons (id, name, active, mutable, created_at, updated_at) FROM stdin;
1	Better price available	t	t	2017-02-05 21:19:41.141475	2017-02-05 21:19:41.141475
2	Missed estimated delivery date	t	t	2017-02-05 21:19:41.146603	2017-02-05 21:19:41.146603
3	Missing parts or accessories	t	t	2017-02-05 21:19:41.149201	2017-02-05 21:19:41.149201
4	Damaged/Defective	t	t	2017-02-05 21:19:41.151401	2017-02-05 21:19:41.151401
5	Different from what was ordered	t	t	2017-02-05 21:19:41.15415	2017-02-05 21:19:41.15415
6	Different from description	t	t	2017-02-05 21:19:41.157529	2017-02-05 21:19:41.157529
7	No longer needed/wanted	t	t	2017-02-05 21:19:41.161428	2017-02-05 21:19:41.161428
8	Accidental order	t	t	2017-02-05 21:19:41.164448	2017-02-05 21:19:41.164448
9	Unauthorized purchase	t	t	2017-02-05 21:19:41.167182	2017-02-05 21:19:41.167182
\.


--
-- Name: spree_return_reasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_return_reasons_id_seq', 9, true);


--
-- Data for Name: spree_roles; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_roles (id, name, created_at, updated_at) FROM stdin;
1	admin	2017-02-05 21:20:04.585523	2017-02-05 21:20:04.585523
\.


--
-- Name: spree_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_roles_id_seq', 1, true);


--
-- Data for Name: spree_roles_users; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_roles_users (role_id, user_id, id, created_at, updated_at) FROM stdin;
1	1	1	2017-02-05 21:20:55.704836	2017-02-05 21:20:55.704836
\.


--
-- Name: spree_roles_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_roles_users_id_seq', 1, true);


--
-- Data for Name: spree_shipments; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_shipments (id, tracking, number, cost, shipped_at, order_id, deprecated_address_id, state, created_at, updated_at, stock_location_id, adjustment_total, additional_tax_total, promo_total, included_tax_total) FROM stdin;
1	\N	H58756820585	5.00	\N	1	\N	pending	2017-02-05 21:21:23.967511	2017-02-05 21:21:24.602207	1	0.25	0.25	0.00	0.00
\.


--
-- Name: spree_shipments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_shipments_id_seq', 2, true);


--
-- Data for Name: spree_shipping_categories; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_shipping_categories (id, name, created_at, updated_at) FROM stdin;
1	Default	2017-02-05 21:19:38.008525	2017-02-05 21:19:38.008525
\.


--
-- Name: spree_shipping_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_shipping_categories_id_seq', 1, true);


--
-- Data for Name: spree_shipping_method_categories; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_shipping_method_categories (id, shipping_method_id, shipping_category_id, created_at, updated_at) FROM stdin;
1	1	1	2017-02-05 21:21:05.181812	2017-02-05 21:21:05.181812
2	2	1	2017-02-05 21:21:05.251913	2017-02-05 21:21:05.251913
3	3	1	2017-02-05 21:21:05.278667	2017-02-05 21:21:05.278667
4	4	1	2017-02-05 21:21:05.30674	2017-02-05 21:21:05.30674
5	5	1	2017-02-05 21:21:05.336868	2017-02-05 21:21:05.336868
\.


--
-- Name: spree_shipping_method_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_shipping_method_categories_id_seq', 5, true);


--
-- Data for Name: spree_shipping_method_stock_locations; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_shipping_method_stock_locations (id, shipping_method_id, stock_location_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_shipping_method_stock_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_shipping_method_stock_locations_id_seq', 1, false);


--
-- Data for Name: spree_shipping_method_translations; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_shipping_method_translations (id, spree_shipping_method_id, locale, created_at, updated_at, name) FROM stdin;
1	1	en	2017-02-17 12:20:30.679023	2017-02-17 12:20:30.679023	UPS Ground (USD)
2	2	en	2017-02-17 12:20:30.68637	2017-02-17 12:20:30.68637	UPS Two Day (USD)
3	3	en	2017-02-17 12:20:30.693762	2017-02-17 12:20:30.693762	UPS One Day (USD)
4	4	en	2017-02-17 12:20:30.701269	2017-02-17 12:20:30.701269	UPS Ground (EU)
5	5	en	2017-02-17 12:20:30.707457	2017-02-17 12:20:30.707457	UPS Ground (EUR)
\.


--
-- Name: spree_shipping_method_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_shipping_method_translations_id_seq', 5, true);


--
-- Data for Name: spree_shipping_method_zones; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_shipping_method_zones (shipping_method_id, zone_id, id, created_at, updated_at) FROM stdin;
1	2	1	2017-02-05 21:21:05.186752	2017-02-05 21:21:05.186752
2	2	2	2017-02-05 21:21:05.255027	2017-02-05 21:21:05.255027
3	2	3	2017-02-05 21:21:05.282355	2017-02-05 21:21:05.282355
4	1	4	2017-02-05 21:21:05.309653	2017-02-05 21:21:05.309653
5	1	5	2017-02-05 21:21:05.339638	2017-02-05 21:21:05.339638
\.


--
-- Name: spree_shipping_method_zones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_shipping_method_zones_id_seq', 5, true);


--
-- Data for Name: spree_shipping_methods; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_shipping_methods (id, name, deleted_at, created_at, updated_at, tracking_url, admin_name, tax_category_id, code, available_to_all, carrier, service_level, available_to_users) FROM stdin;
1	UPS Ground (USD)	\N	2017-02-05 21:21:05.17618	2017-02-05 21:21:05.17618	\N	\N	1	\N	t	\N	\N	t
2	UPS Two Day (USD)	\N	2017-02-05 21:21:05.245655	2017-02-05 21:21:05.245655	\N	\N	1	\N	t	\N	\N	t
3	UPS One Day (USD)	\N	2017-02-05 21:21:05.273982	2017-02-05 21:21:05.273982	\N	\N	1	\N	t	\N	\N	t
4	UPS Ground (EU)	\N	2017-02-05 21:21:05.300935	2017-02-05 21:21:05.300935	\N	\N	1	\N	t	\N	\N	t
5	UPS Ground (EUR)	\N	2017-02-05 21:21:05.331982	2017-02-05 21:21:05.331982	\N	\N	1	\N	t	\N	\N	t
\.


--
-- Name: spree_shipping_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_shipping_methods_id_seq', 5, true);


--
-- Data for Name: spree_shipping_rate_taxes; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_shipping_rate_taxes (id, amount, tax_rate_id, shipping_rate_id, created_at, updated_at) FROM stdin;
1	0.25	1	1	2017-02-05 21:21:23.977279	2017-02-05 21:21:23.977279
2	0.50	1	2	2017-02-05 21:21:23.981644	2017-02-05 21:21:23.981644
3	0.75	1	3	2017-02-05 21:21:23.985381	2017-02-05 21:21:23.985381
\.


--
-- Name: spree_shipping_rate_taxes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_shipping_rate_taxes_id_seq', 6, true);


--
-- Data for Name: spree_shipping_rates; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_shipping_rates (id, shipment_id, shipping_method_id, selected, cost, created_at, updated_at, tax_rate_id) FROM stdin;
1	1	1	t	5.00	2017-02-05 21:21:23.974626	2017-02-05 21:21:23.974626	\N
2	1	2	f	10.00	2017-02-05 21:21:23.980064	2017-02-05 21:21:23.980064	\N
3	1	3	f	15.00	2017-02-05 21:21:23.983656	2017-02-05 21:21:23.983656	\N
\.


--
-- Name: spree_shipping_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_shipping_rates_id_seq', 6, true);


--
-- Data for Name: spree_state_changes; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_state_changes (id, name, previous_state, stateful_id, user_id, stateful_type, next_state, created_at, updated_at) FROM stdin;
1	order	cart	1	\N	Spree::Order	address	2017-02-05 21:21:23.547637	2017-02-05 21:21:23.547637
2	order	address	1	\N	Spree::Order	delivery	2017-02-05 21:21:24.035406	2017-02-05 21:21:24.035406
3	order	delivery	1	\N	Spree::Order	payment	2017-02-05 21:21:24.397471	2017-02-05 21:21:24.397471
4	order	payment	1	\N	Spree::Order	confirm	2017-02-05 21:21:24.445282	2017-02-05 21:21:24.445282
5	order	confirm	1	\N	Spree::Order	complete	2017-02-05 21:21:24.535748	2017-02-05 21:21:24.535748
6	payment	\N	1	\N	Spree::Order	balance_due	2017-02-05 21:21:24.636247	2017-02-05 21:21:24.636247
7	shipment	\N	1	\N	Spree::Order	pending	2017-02-05 21:21:24.71354	2017-02-05 21:21:24.71354
8	order	cart	2	\N	Spree::Order	address	2017-02-05 21:21:25.051049	2017-02-05 21:21:25.051049
9	order	address	2	\N	Spree::Order	delivery	2017-02-05 21:21:27.087387	2017-02-05 21:21:27.087387
10	order	delivery	2	\N	Spree::Order	payment	2017-02-05 21:21:27.553451	2017-02-05 21:21:27.553451
11	order	payment	2	\N	Spree::Order	confirm	2017-02-05 21:21:27.602664	2017-02-05 21:21:27.602664
12	order	confirm	2	\N	Spree::Order	complete	2017-02-05 21:21:27.654239	2017-02-05 21:21:27.654239
13	payment	\N	2	\N	Spree::Order	balance_due	2017-02-05 21:21:27.723899	2017-02-05 21:21:27.723899
14	shipment	\N	2	\N	Spree::Order	pending	2017-02-05 21:21:27.796759	2017-02-05 21:21:27.796759
15	payment	balance_due	2	\N	Spree::Order	paid	2017-02-06 19:02:43.706199	2017-02-06 19:02:43.706199
16	shipment	pending	2	\N	Spree::Order	\N	2017-02-06 19:02:43.72019	2017-02-06 19:02:43.72019
17	order	cart	4	1	Spree::Order	address	2017-02-17 19:29:18.447198	2017-02-17 19:29:18.447198
18	order	cart	6	\N	Spree::Order	address	2017-02-18 10:19:11.062562	2017-02-18 10:19:11.062562
19	order	cart	6	\N	Spree::Order	address	2017-02-18 10:19:21.472281	2017-02-18 10:19:21.472281
20	order	cart	6	\N	Spree::Order	address	2017-02-18 10:20:05.282139	2017-02-18 10:20:05.282139
21	order	cart	6	\N	Spree::Order	address	2017-02-18 10:27:53.414832	2017-02-18 10:27:53.414832
\.


--
-- Name: spree_state_changes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_state_changes_id_seq', 21, true);


--
-- Data for Name: spree_states; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_states (id, name, abbr, country_id, updated_at, created_at) FROM stdin;
1	Canillo	02	1	2017-02-05 21:20:04.803155	2017-02-05 21:20:04.803155
2	Encamp	03	1	2017-02-05 21:20:04.834473	2017-02-05 21:20:04.834473
3	La Massana	04	1	2017-02-05 21:20:04.852983	2017-02-05 21:20:04.852983
4	Ordino	05	1	2017-02-05 21:20:04.871891	2017-02-05 21:20:04.871891
5	Sant Julià de Lòria	06	1	2017-02-05 21:20:04.900046	2017-02-05 21:20:04.900046
6	Andorra la Vella	07	1	2017-02-05 21:20:04.918538	2017-02-05 21:20:04.918538
7	Escaldes-Engordany	08	1	2017-02-05 21:20:04.926566	2017-02-05 21:20:04.926566
8	'Ajmān	AJ	2	2017-02-05 21:20:04.933151	2017-02-05 21:20:04.933151
9	Abū Ȥaby [Abu Dhabi]	AZ	2	2017-02-05 21:20:04.939991	2017-02-05 21:20:04.939991
10	Dubayy	DU	2	2017-02-05 21:20:04.944755	2017-02-05 21:20:04.944755
11	Al Fujayrah	FU	2	2017-02-05 21:20:04.950063	2017-02-05 21:20:04.950063
12	Ra’s al Khaymah	RK	2	2017-02-05 21:20:04.955389	2017-02-05 21:20:04.955389
13	Ash Shāriqah	SH	2	2017-02-05 21:20:04.960541	2017-02-05 21:20:04.960541
14	Umm al Qaywayn	UQ	2	2017-02-05 21:20:04.96605	2017-02-05 21:20:04.96605
15	Balkh	BAL	3	2017-02-05 21:20:04.972436	2017-02-05 21:20:04.972436
16	Bāmyān	BAM	3	2017-02-05 21:20:04.977855	2017-02-05 21:20:04.977855
17	Bādghīs	BDG	3	2017-02-05 21:20:04.98393	2017-02-05 21:20:04.98393
18	Badakhshān	BDS	3	2017-02-05 21:20:04.989439	2017-02-05 21:20:04.989439
19	Baghlān	BGL	3	2017-02-05 21:20:04.994688	2017-02-05 21:20:04.994688
20	Dāykundī	DAY	3	2017-02-05 21:20:05.000791	2017-02-05 21:20:05.000791
21	Farāh	FRA	3	2017-02-05 21:20:05.007007	2017-02-05 21:20:05.007007
22	Fāryāb	FYB	3	2017-02-05 21:20:05.011576	2017-02-05 21:20:05.011576
23	Ghaznī	GHA	3	2017-02-05 21:20:05.016315	2017-02-05 21:20:05.016315
24	Ghōr	GHO	3	2017-02-05 21:20:05.021077	2017-02-05 21:20:05.021077
25	Helmand	HEL	3	2017-02-05 21:20:05.026205	2017-02-05 21:20:05.026205
26	Herāt	HER	3	2017-02-05 21:20:05.032173	2017-02-05 21:20:05.032173
27	Jowzjān	JOW	3	2017-02-05 21:20:05.038229	2017-02-05 21:20:05.038229
28	Kābul	KAB	3	2017-02-05 21:20:05.048088	2017-02-05 21:20:05.048088
29	Kandahār	KAN	3	2017-02-05 21:20:05.058778	2017-02-05 21:20:05.058778
30	Kāpīsā	KAP	3	2017-02-05 21:20:05.068554	2017-02-05 21:20:05.068554
31	Kunduz	KDZ	3	2017-02-05 21:20:05.078437	2017-02-05 21:20:05.078437
32	Khōst	KHO	3	2017-02-05 21:20:05.087916	2017-02-05 21:20:05.087916
33	Kunar	KNR	3	2017-02-05 21:20:05.099005	2017-02-05 21:20:05.099005
34	Laghmān	LAG	3	2017-02-05 21:20:05.111163	2017-02-05 21:20:05.111163
35	Lōgar	LOG	3	2017-02-05 21:20:05.121301	2017-02-05 21:20:05.121301
36	Nangarhār	NAN	3	2017-02-05 21:20:05.130042	2017-02-05 21:20:05.130042
37	Nīmrōz	NIM	3	2017-02-05 21:20:05.13986	2017-02-05 21:20:05.13986
38	Nūristān	NUR	3	2017-02-05 21:20:05.149499	2017-02-05 21:20:05.149499
39	Panjshayr	PAN	3	2017-02-05 21:20:05.159103	2017-02-05 21:20:05.159103
40	Parwān	PAR	3	2017-02-05 21:20:05.167958	2017-02-05 21:20:05.167958
41	Paktiyā	PIA	3	2017-02-05 21:20:05.173606	2017-02-05 21:20:05.173606
42	Paktīkā	PKA	3	2017-02-05 21:20:05.179942	2017-02-05 21:20:05.179942
43	Samangān	SAM	3	2017-02-05 21:20:05.188037	2017-02-05 21:20:05.188037
44	Sar-e Pul	SAR	3	2017-02-05 21:20:05.197454	2017-02-05 21:20:05.197454
45	Takhār	TAK	3	2017-02-05 21:20:05.206916	2017-02-05 21:20:05.206916
46	Uruzgān	URU	3	2017-02-05 21:20:05.214344	2017-02-05 21:20:05.214344
47	Wardak	WAR	3	2017-02-05 21:20:05.223016	2017-02-05 21:20:05.223016
48	Zābul	ZAB	3	2017-02-05 21:20:05.231991	2017-02-05 21:20:05.231991
49	Saint George	03	4	2017-02-05 21:20:05.241675	2017-02-05 21:20:05.241675
50	Saint John	04	4	2017-02-05 21:20:05.250137	2017-02-05 21:20:05.250137
51	Saint Mary	05	4	2017-02-05 21:20:05.257977	2017-02-05 21:20:05.257977
52	Saint Paul	06	4	2017-02-05 21:20:05.265722	2017-02-05 21:20:05.265722
53	Saint Peter	07	4	2017-02-05 21:20:05.275068	2017-02-05 21:20:05.275068
54	Saint Philip	08	4	2017-02-05 21:20:05.284817	2017-02-05 21:20:05.284817
55	Barbuda	10	4	2017-02-05 21:20:05.294068	2017-02-05 21:20:05.294068
56	Redonda	11	4	2017-02-05 21:20:05.303468	2017-02-05 21:20:05.303468
57	Berat	01	6	2017-02-05 21:20:05.317752	2017-02-05 21:20:05.317752
58	Durrës	02	6	2017-02-05 21:20:05.328027	2017-02-05 21:20:05.328027
59	Elbasan	03	6	2017-02-05 21:20:05.337686	2017-02-05 21:20:05.337686
60	Fier	04	6	2017-02-05 21:20:05.344251	2017-02-05 21:20:05.344251
61	Gjirokastër	05	6	2017-02-05 21:20:05.350998	2017-02-05 21:20:05.350998
62	Korçë	06	6	2017-02-05 21:20:05.358357	2017-02-05 21:20:05.358357
63	Kukës	07	6	2017-02-05 21:20:05.366905	2017-02-05 21:20:05.366905
64	Lezhë	08	6	2017-02-05 21:20:05.373343	2017-02-05 21:20:05.373343
65	Dibër	09	6	2017-02-05 21:20:05.381145	2017-02-05 21:20:05.381145
66	Shkodër	10	6	2017-02-05 21:20:05.391584	2017-02-05 21:20:05.391584
67	Tiranë	11	6	2017-02-05 21:20:05.40349	2017-02-05 21:20:05.40349
68	Vlorë	12	6	2017-02-05 21:20:05.414092	2017-02-05 21:20:05.414092
69	Aragacotn	AG	7	2017-02-05 21:20:05.424169	2017-02-05 21:20:05.424169
70	Ararat	AR	7	2017-02-05 21:20:05.433832	2017-02-05 21:20:05.433832
71	Armavir	AV	7	2017-02-05 21:20:05.443707	2017-02-05 21:20:05.443707
72	Erevan	ER	7	2017-02-05 21:20:05.453948	2017-02-05 21:20:05.453948
73	Gegarkunik'	GR	7	2017-02-05 21:20:05.46418	2017-02-05 21:20:05.46418
74	Kotayk'	KT	7	2017-02-05 21:20:05.475166	2017-02-05 21:20:05.475166
75	Lory	LO	7	2017-02-05 21:20:05.485518	2017-02-05 21:20:05.485518
76	Sirak	SH	7	2017-02-05 21:20:05.495557	2017-02-05 21:20:05.495557
77	Syunik'	SU	7	2017-02-05 21:20:05.505506	2017-02-05 21:20:05.505506
78	Tavus	TV	7	2017-02-05 21:20:05.515034	2017-02-05 21:20:05.515034
79	Vayoc Jor	VD	7	2017-02-05 21:20:05.525373	2017-02-05 21:20:05.525373
80	Bengo	BGO	8	2017-02-05 21:20:05.536831	2017-02-05 21:20:05.536831
81	Benguela	BGU	8	2017-02-05 21:20:05.546646	2017-02-05 21:20:05.546646
82	Bié	BIE	8	2017-02-05 21:20:05.565156	2017-02-05 21:20:05.565156
83	Cabinda	CAB	8	2017-02-05 21:20:05.586321	2017-02-05 21:20:05.586321
84	Cuando-Cubango	CCU	8	2017-02-05 21:20:05.605205	2017-02-05 21:20:05.605205
85	Cunene	CNN	8	2017-02-05 21:20:05.620095	2017-02-05 21:20:05.620095
86	Cuanza Norte	CNO	8	2017-02-05 21:20:05.636811	2017-02-05 21:20:05.636811
87	Cuanza Sul	CUS	8	2017-02-05 21:20:05.660382	2017-02-05 21:20:05.660382
88	Huambo	HUA	8	2017-02-05 21:20:05.696619	2017-02-05 21:20:05.696619
89	Huíla	HUI	8	2017-02-05 21:20:05.748452	2017-02-05 21:20:05.748452
90	Lunda Norte	LNO	8	2017-02-05 21:20:05.778256	2017-02-05 21:20:05.778256
91	Lunda Sul	LSU	8	2017-02-05 21:20:05.801381	2017-02-05 21:20:05.801381
92	Luanda	LUA	8	2017-02-05 21:20:05.817289	2017-02-05 21:20:05.817289
93	Malange	MAL	8	2017-02-05 21:20:05.823199	2017-02-05 21:20:05.823199
94	Moxico	MOX	8	2017-02-05 21:20:05.827636	2017-02-05 21:20:05.827636
95	Namibe	NAM	8	2017-02-05 21:20:05.833395	2017-02-05 21:20:05.833395
96	Uíge	UIG	8	2017-02-05 21:20:05.838426	2017-02-05 21:20:05.838426
97	Zaire	ZAI	8	2017-02-05 21:20:05.843232	2017-02-05 21:20:05.843232
98	Salta	A	10	2017-02-05 21:20:05.848685	2017-02-05 21:20:05.848685
99	Buenos Aires	B	10	2017-02-05 21:20:05.853799	2017-02-05 21:20:05.853799
100	Ciudad Autónoma de Buenos Aires	C	10	2017-02-05 21:20:05.85803	2017-02-05 21:20:05.85803
101	San Luis	D	10	2017-02-05 21:20:05.862331	2017-02-05 21:20:05.862331
102	Entre Rios	E	10	2017-02-05 21:20:05.867311	2017-02-05 21:20:05.867311
103	Santiago del Estero	G	10	2017-02-05 21:20:05.871938	2017-02-05 21:20:05.871938
104	Chaco	H	10	2017-02-05 21:20:05.876464	2017-02-05 21:20:05.876464
105	San Juan	J	10	2017-02-05 21:20:05.880772	2017-02-05 21:20:05.880772
106	Catamarca	K	10	2017-02-05 21:20:05.885145	2017-02-05 21:20:05.885145
107	La Pampa	L	10	2017-02-05 21:20:05.889761	2017-02-05 21:20:05.889761
108	Mendoza	M	10	2017-02-05 21:20:05.898315	2017-02-05 21:20:05.898315
109	Misiones	N	10	2017-02-05 21:20:05.904514	2017-02-05 21:20:05.904514
110	Formosa	P	10	2017-02-05 21:20:05.909858	2017-02-05 21:20:05.909858
111	Neuquen	Q	10	2017-02-05 21:20:05.915826	2017-02-05 21:20:05.915826
112	Rio Negro	R	10	2017-02-05 21:20:05.921846	2017-02-05 21:20:05.921846
113	Santa Fe	S	10	2017-02-05 21:20:05.929228	2017-02-05 21:20:05.929228
114	Tucuman	T	10	2017-02-05 21:20:05.936739	2017-02-05 21:20:05.936739
115	Chubut	U	10	2017-02-05 21:20:05.943126	2017-02-05 21:20:05.943126
116	Tierra del Fuego	V	10	2017-02-05 21:20:05.950848	2017-02-05 21:20:05.950848
117	Corrientes	W	10	2017-02-05 21:20:05.960744	2017-02-05 21:20:05.960744
118	Cordoba	X	10	2017-02-05 21:20:05.971021	2017-02-05 21:20:05.971021
119	Jujuy	Y	10	2017-02-05 21:20:05.98005	2017-02-05 21:20:05.98005
120	Santa Cruz	Z	10	2017-02-05 21:20:05.988265	2017-02-05 21:20:05.988265
121	La Rioja	F	10	2017-02-05 21:20:05.996179	2017-02-05 21:20:05.996179
122	Burgenland	1	12	2017-02-05 21:20:06.004744	2017-02-05 21:20:06.004744
123	Kärnten	2	12	2017-02-05 21:20:06.014199	2017-02-05 21:20:06.014199
124	Niederösterreich	3	12	2017-02-05 21:20:06.021722	2017-02-05 21:20:06.021722
125	Oberösterreich	4	12	2017-02-05 21:20:06.029964	2017-02-05 21:20:06.029964
126	Salzburg	5	12	2017-02-05 21:20:06.037902	2017-02-05 21:20:06.037902
127	Steiermark	6	12	2017-02-05 21:20:06.050241	2017-02-05 21:20:06.050241
128	Tirol	7	12	2017-02-05 21:20:06.060936	2017-02-05 21:20:06.060936
129	Vorarlberg	8	12	2017-02-05 21:20:06.070502	2017-02-05 21:20:06.070502
130	Wien	9	12	2017-02-05 21:20:06.080621	2017-02-05 21:20:06.080621
131	Australian Capital Territory	ACT	13	2017-02-05 21:20:06.090611	2017-02-05 21:20:06.090611
132	New South Wales	NSW	13	2017-02-05 21:20:06.099164	2017-02-05 21:20:06.099164
133	Northern Territory	NT	13	2017-02-05 21:20:06.108808	2017-02-05 21:20:06.108808
134	Queensland	QLD	13	2017-02-05 21:20:06.119637	2017-02-05 21:20:06.119637
135	South Australia	SA	13	2017-02-05 21:20:06.128364	2017-02-05 21:20:06.128364
136	Tasmania	TAS	13	2017-02-05 21:20:06.139084	2017-02-05 21:20:06.139084
137	Victoria	VIC	13	2017-02-05 21:20:06.149185	2017-02-05 21:20:06.149185
138	Western Australia	WA	13	2017-02-05 21:20:06.158566	2017-02-05 21:20:06.158566
139	Abşeron	ABS	16	2017-02-05 21:20:06.167335	2017-02-05 21:20:06.167335
140	Ağstafa	AGA	16	2017-02-05 21:20:06.17564	2017-02-05 21:20:06.17564
141	Ağcabədi	AGC	16	2017-02-05 21:20:06.182123	2017-02-05 21:20:06.182123
142	Ağdam	AGM	16	2017-02-05 21:20:06.189219	2017-02-05 21:20:06.189219
143	Ağdaş	AGS	16	2017-02-05 21:20:06.196231	2017-02-05 21:20:06.196231
144	Ağsu	AGU	16	2017-02-05 21:20:06.210113	2017-02-05 21:20:06.210113
145	Astara	AST	16	2017-02-05 21:20:06.216395	2017-02-05 21:20:06.216395
146	Bakı	BA	16	2017-02-05 21:20:06.224765	2017-02-05 21:20:06.224765
147	Balakən	BAL	16	2017-02-05 21:20:06.230967	2017-02-05 21:20:06.230967
148	Bərdə	BAR	16	2017-02-05 21:20:06.237319	2017-02-05 21:20:06.237319
149	Beyləqan	BEY	16	2017-02-05 21:20:06.244889	2017-02-05 21:20:06.244889
150	Biləsuvar	BIL	16	2017-02-05 21:20:06.254074	2017-02-05 21:20:06.254074
151	Cəbrayıl	CAB	16	2017-02-05 21:20:06.264799	2017-02-05 21:20:06.264799
152	Cəlilabab	CAL	16	2017-02-05 21:20:06.274425	2017-02-05 21:20:06.274425
153	Daşkəsən	DAS	16	2017-02-05 21:20:06.284509	2017-02-05 21:20:06.284509
154	Füzuli	FUZ	16	2017-02-05 21:20:06.292957	2017-02-05 21:20:06.292957
155	Gəncə	GA	16	2017-02-05 21:20:06.302284	2017-02-05 21:20:06.302284
156	Gədəbəy	GAD	16	2017-02-05 21:20:06.312485	2017-02-05 21:20:06.312485
157	Goranboy	GOR	16	2017-02-05 21:20:06.323931	2017-02-05 21:20:06.323931
158	Göyçay	GOY	16	2017-02-05 21:20:06.33619	2017-02-05 21:20:06.33619
159	Göygöl	GYG	16	2017-02-05 21:20:06.348007	2017-02-05 21:20:06.348007
160	Hacıqabul	HAC	16	2017-02-05 21:20:06.35929	2017-02-05 21:20:06.35929
161	İmişli	IMI	16	2017-02-05 21:20:06.381455	2017-02-05 21:20:06.381455
162	İsmayıllı	ISM	16	2017-02-05 21:20:06.391097	2017-02-05 21:20:06.391097
163	Kəlbəcər	KAL	16	2017-02-05 21:20:06.399065	2017-02-05 21:20:06.399065
164	Kürdəmir	KUR	16	2017-02-05 21:20:06.406761	2017-02-05 21:20:06.406761
165	Lənkəran	LA	16	2017-02-05 21:20:06.414516	2017-02-05 21:20:06.414516
166	Laçın	LAC	16	2017-02-05 21:20:06.422087	2017-02-05 21:20:06.422087
167	Lənkəran	LAN	16	2017-02-05 21:20:06.429711	2017-02-05 21:20:06.429711
168	Lerik	LER	16	2017-02-05 21:20:06.438652	2017-02-05 21:20:06.438652
169	Masallı	MAS	16	2017-02-05 21:20:06.449769	2017-02-05 21:20:06.449769
170	Mingəçevir	MI	16	2017-02-05 21:20:06.458471	2017-02-05 21:20:06.458471
171	Naftalan	NA	16	2017-02-05 21:20:06.467541	2017-02-05 21:20:06.467541
172	Neftçala	NEF	16	2017-02-05 21:20:06.476022	2017-02-05 21:20:06.476022
173	Naxçıvan	NX	16	2017-02-05 21:20:06.484286	2017-02-05 21:20:06.484286
174	Oğuz	OGU	16	2017-02-05 21:20:06.493295	2017-02-05 21:20:06.493295
175	Qəbələ	QAB	16	2017-02-05 21:20:06.501794	2017-02-05 21:20:06.501794
176	Qax	QAX	16	2017-02-05 21:20:06.50999	2017-02-05 21:20:06.50999
177	Qazax	QAZ	16	2017-02-05 21:20:06.517898	2017-02-05 21:20:06.517898
178	Quba	QBA	16	2017-02-05 21:20:06.52629	2017-02-05 21:20:06.52629
179	Qubadlı	QBI	16	2017-02-05 21:20:06.535577	2017-02-05 21:20:06.535577
180	Qobustan	QOB	16	2017-02-05 21:20:06.544414	2017-02-05 21:20:06.544414
181	Qusar	QUS	16	2017-02-05 21:20:06.553719	2017-02-05 21:20:06.553719
182	Şəki	SA	16	2017-02-05 21:20:06.562703	2017-02-05 21:20:06.562703
183	Sabirabad	SAB	16	2017-02-05 21:20:06.570794	2017-02-05 21:20:06.570794
184	Şəki	SAK	16	2017-02-05 21:20:06.579872	2017-02-05 21:20:06.579872
185	Salyan	SAL	16	2017-02-05 21:20:06.589012	2017-02-05 21:20:06.589012
186	Saatlı	SAT	16	2017-02-05 21:20:06.597761	2017-02-05 21:20:06.597761
187	Şabran	SBN	16	2017-02-05 21:20:06.605482	2017-02-05 21:20:06.605482
188	Siyəzən	SIY	16	2017-02-05 21:20:06.614198	2017-02-05 21:20:06.614198
189	Şəmkir	SKR	16	2017-02-05 21:20:06.623243	2017-02-05 21:20:06.623243
190	Sumqayıt	SM	16	2017-02-05 21:20:06.638683	2017-02-05 21:20:06.638683
191	Şamaxı	SMI	16	2017-02-05 21:20:06.648746	2017-02-05 21:20:06.648746
192	Samux	SMX	16	2017-02-05 21:20:06.662323	2017-02-05 21:20:06.662323
193	Şirvan	SR	16	2017-02-05 21:20:06.690715	2017-02-05 21:20:06.690715
194	Şuşa	SUS	16	2017-02-05 21:20:06.723425	2017-02-05 21:20:06.723425
195	Tərtər	TAR	16	2017-02-05 21:20:06.755113	2017-02-05 21:20:06.755113
196	Tovuz	TOV	16	2017-02-05 21:20:06.791081	2017-02-05 21:20:06.791081
197	Ucar	UCA	16	2017-02-05 21:20:06.83481	2017-02-05 21:20:06.83481
198	Xankəndi	XA	16	2017-02-05 21:20:06.890123	2017-02-05 21:20:06.890123
199	Xaçmaz	XAC	16	2017-02-05 21:20:06.913658	2017-02-05 21:20:06.913658
200	Xocalı	XCI	16	2017-02-05 21:20:06.938476	2017-02-05 21:20:06.938476
201	Xızı	XIZ	16	2017-02-05 21:20:06.978555	2017-02-05 21:20:06.978555
202	Xocavənd	XVD	16	2017-02-05 21:20:07.000537	2017-02-05 21:20:07.000537
203	Yardımlı	YAR	16	2017-02-05 21:20:07.008535	2017-02-05 21:20:07.008535
204	Yevlax	YE	16	2017-02-05 21:20:07.015468	2017-02-05 21:20:07.015468
205	Yevlax	YEV	16	2017-02-05 21:20:07.02301	2017-02-05 21:20:07.02301
206	Zəngilan	ZAN	16	2017-02-05 21:20:07.030338	2017-02-05 21:20:07.030338
207	Zaqatala	ZAQ	16	2017-02-05 21:20:07.037082	2017-02-05 21:20:07.037082
208	Zərdab	ZAR	16	2017-02-05 21:20:07.044891	2017-02-05 21:20:07.044891
209	Federacija Bosne i Hercegovine	BIH	17	2017-02-05 21:20:07.063061	2017-02-05 21:20:07.063061
210	Brčko distrikt	BRC	17	2017-02-05 21:20:07.072087	2017-02-05 21:20:07.072087
211	Republika Srpska	SRP	17	2017-02-05 21:20:07.081008	2017-02-05 21:20:07.081008
212	Christ Church	01	18	2017-02-05 21:20:07.090252	2017-02-05 21:20:07.090252
213	Saint Andrew	02	18	2017-02-05 21:20:07.099265	2017-02-05 21:20:07.099265
214	Saint George	03	18	2017-02-05 21:20:07.10782	2017-02-05 21:20:07.10782
215	Saint James	04	18	2017-02-05 21:20:07.115725	2017-02-05 21:20:07.115725
216	Saint John	05	18	2017-02-05 21:20:07.123974	2017-02-05 21:20:07.123974
217	Saint Joseph	06	18	2017-02-05 21:20:07.132657	2017-02-05 21:20:07.132657
218	Saint Lucy	07	18	2017-02-05 21:20:07.141665	2017-02-05 21:20:07.141665
219	Saint Michael	08	18	2017-02-05 21:20:07.153267	2017-02-05 21:20:07.153267
220	Saint Peter	09	18	2017-02-05 21:20:07.163905	2017-02-05 21:20:07.163905
221	Saint Philip	10	18	2017-02-05 21:20:07.172697	2017-02-05 21:20:07.172697
222	Saint Thomas	11	18	2017-02-05 21:20:07.181187	2017-02-05 21:20:07.181187
223	Barisal	A	19	2017-02-05 21:20:07.189933	2017-02-05 21:20:07.189933
224	Chittagong	B	19	2017-02-05 21:20:07.198753	2017-02-05 21:20:07.198753
225	Dhaka	C	19	2017-02-05 21:20:07.207882	2017-02-05 21:20:07.207882
226	Khulna	D	19	2017-02-05 21:20:07.214464	2017-02-05 21:20:07.214464
227	Rajshahi	E	19	2017-02-05 21:20:07.221638	2017-02-05 21:20:07.221638
228	Rangpur	F	19	2017-02-05 21:20:07.228637	2017-02-05 21:20:07.228637
229	Sylhet	G	19	2017-02-05 21:20:07.236926	2017-02-05 21:20:07.236926
230	Bruxelles-Capitale, Région de;Brussels Hoofdstedelijk Gewest	BRU	20	2017-02-05 21:20:07.246286	2017-02-05 21:20:07.246286
231	Vlaams Gewest	VLG	20	2017-02-05 21:20:07.266001	2017-02-05 21:20:07.266001
232	wallonne, Région	WAL	20	2017-02-05 21:20:07.275577	2017-02-05 21:20:07.275577
233	Boucle du Mouhoun	01	21	2017-02-05 21:20:07.286583	2017-02-05 21:20:07.286583
234	Cascades	02	21	2017-02-05 21:20:07.298684	2017-02-05 21:20:07.298684
235	Centre	03	21	2017-02-05 21:20:07.307847	2017-02-05 21:20:07.307847
236	Centre-Est	04	21	2017-02-05 21:20:07.31555	2017-02-05 21:20:07.31555
237	Centre-Nord	05	21	2017-02-05 21:20:07.328285	2017-02-05 21:20:07.328285
238	Centre-Ouest	06	21	2017-02-05 21:20:07.336137	2017-02-05 21:20:07.336137
239	Centre-Sud	07	21	2017-02-05 21:20:07.345556	2017-02-05 21:20:07.345556
240	Est	08	21	2017-02-05 21:20:07.355104	2017-02-05 21:20:07.355104
241	Hauts-Bassins	09	21	2017-02-05 21:20:07.363907	2017-02-05 21:20:07.363907
242	Nord	10	21	2017-02-05 21:20:07.373431	2017-02-05 21:20:07.373431
243	Plateau-Central	11	21	2017-02-05 21:20:07.381916	2017-02-05 21:20:07.381916
244	Sahel	12	21	2017-02-05 21:20:07.389345	2017-02-05 21:20:07.389345
245	Sud-Ouest	13	21	2017-02-05 21:20:07.398753	2017-02-05 21:20:07.398753
246	Blagoevgrad	01	22	2017-02-05 21:20:07.40926	2017-02-05 21:20:07.40926
247	Burgas	02	22	2017-02-05 21:20:07.418159	2017-02-05 21:20:07.418159
248	Varna	03	22	2017-02-05 21:20:07.431039	2017-02-05 21:20:07.431039
249	Veliko Tarnovo	04	22	2017-02-05 21:20:07.438312	2017-02-05 21:20:07.438312
250	Vidin	05	22	2017-02-05 21:20:07.445725	2017-02-05 21:20:07.445725
251	Vratsa	06	22	2017-02-05 21:20:07.453865	2017-02-05 21:20:07.453865
252	Gabrovo	07	22	2017-02-05 21:20:07.462565	2017-02-05 21:20:07.462565
253	Dobrich	08	22	2017-02-05 21:20:07.471413	2017-02-05 21:20:07.471413
254	Kardzhali	09	22	2017-02-05 21:20:07.486654	2017-02-05 21:20:07.486654
255	Kyustendil	10	22	2017-02-05 21:20:07.496632	2017-02-05 21:20:07.496632
256	Lovech	11	22	2017-02-05 21:20:07.506461	2017-02-05 21:20:07.506461
257	Montana	12	22	2017-02-05 21:20:07.515213	2017-02-05 21:20:07.515213
258	Pazardzhik	13	22	2017-02-05 21:20:07.524032	2017-02-05 21:20:07.524032
259	Pernik	14	22	2017-02-05 21:20:07.532706	2017-02-05 21:20:07.532706
260	Pleven	15	22	2017-02-05 21:20:07.541135	2017-02-05 21:20:07.541135
261	Plovdiv	16	22	2017-02-05 21:20:07.549885	2017-02-05 21:20:07.549885
262	Razgrad	17	22	2017-02-05 21:20:07.558569	2017-02-05 21:20:07.558569
263	Ruse	18	22	2017-02-05 21:20:07.573197	2017-02-05 21:20:07.573197
264	Silistra	19	22	2017-02-05 21:20:07.594109	2017-02-05 21:20:07.594109
265	Sliven	20	22	2017-02-05 21:20:07.605059	2017-02-05 21:20:07.605059
266	Smolyan	21	22	2017-02-05 21:20:07.617178	2017-02-05 21:20:07.617178
267	Sofia-Grad	22	22	2017-02-05 21:20:07.631424	2017-02-05 21:20:07.631424
268	Sofia	23	22	2017-02-05 21:20:07.654699	2017-02-05 21:20:07.654699
269	Stara Zagora	24	22	2017-02-05 21:20:07.673771	2017-02-05 21:20:07.673771
270	Targovishte	25	22	2017-02-05 21:20:07.711399	2017-02-05 21:20:07.711399
271	Haskovo	26	22	2017-02-05 21:20:07.742944	2017-02-05 21:20:07.742944
272	Shumen	27	22	2017-02-05 21:20:07.774477	2017-02-05 21:20:07.774477
273	Yambol	28	22	2017-02-05 21:20:07.804739	2017-02-05 21:20:07.804739
274	Al Manāmah (Al ‘Āşimah)	13	23	2017-02-05 21:20:07.857695	2017-02-05 21:20:07.857695
275	Al Janūbīyah	14	23	2017-02-05 21:20:07.906413	2017-02-05 21:20:07.906413
276	Al Muḩarraq	15	23	2017-02-05 21:20:07.958254	2017-02-05 21:20:07.958254
277	Al Wusţá	16	23	2017-02-05 21:20:08.004727	2017-02-05 21:20:08.004727
278	Ash Shamālīyah	17	23	2017-02-05 21:20:08.018568	2017-02-05 21:20:08.018568
279	Bubanza	BB	24	2017-02-05 21:20:08.038644	2017-02-05 21:20:08.038644
280	Bujumbura Rural	BL	24	2017-02-05 21:20:08.05724	2017-02-05 21:20:08.05724
281	Bujumbura Mairie	BM	24	2017-02-05 21:20:08.082381	2017-02-05 21:20:08.082381
282	Bururi	BR	24	2017-02-05 21:20:08.091817	2017-02-05 21:20:08.091817
283	Cankuzo	CA	24	2017-02-05 21:20:08.100579	2017-02-05 21:20:08.100579
284	Cibitoke	CI	24	2017-02-05 21:20:08.109746	2017-02-05 21:20:08.109746
285	Gitega	GI	24	2017-02-05 21:20:08.119038	2017-02-05 21:20:08.119038
286	Kirundo	KI	24	2017-02-05 21:20:08.128357	2017-02-05 21:20:08.128357
287	Karuzi	KR	24	2017-02-05 21:20:08.140022	2017-02-05 21:20:08.140022
288	Kayanza	KY	24	2017-02-05 21:20:08.156161	2017-02-05 21:20:08.156161
289	Makamba	MA	24	2017-02-05 21:20:08.173762	2017-02-05 21:20:08.173762
290	Muramvya	MU	24	2017-02-05 21:20:08.193549	2017-02-05 21:20:08.193549
291	Mwaro	MW	24	2017-02-05 21:20:08.216603	2017-02-05 21:20:08.216603
292	Ngozi	NG	24	2017-02-05 21:20:08.229528	2017-02-05 21:20:08.229528
293	Rutana	RT	24	2017-02-05 21:20:08.240423	2017-02-05 21:20:08.240423
294	Ruyigi	RY	24	2017-02-05 21:20:08.250674	2017-02-05 21:20:08.250674
295	Atakora	AK	25	2017-02-05 21:20:08.260769	2017-02-05 21:20:08.260769
296	Alibori	AL	25	2017-02-05 21:20:08.269739	2017-02-05 21:20:08.269739
297	Atlantique	AQ	25	2017-02-05 21:20:08.280622	2017-02-05 21:20:08.280622
298	Borgou	BO	25	2017-02-05 21:20:08.293048	2017-02-05 21:20:08.293048
299	Collines	CO	25	2017-02-05 21:20:08.302593	2017-02-05 21:20:08.302593
300	Donga	DO	25	2017-02-05 21:20:08.312202	2017-02-05 21:20:08.312202
301	Kouffo	KO	25	2017-02-05 21:20:08.320422	2017-02-05 21:20:08.320422
302	Littoral	LI	25	2017-02-05 21:20:08.328776	2017-02-05 21:20:08.328776
303	Mono	MO	25	2017-02-05 21:20:08.339722	2017-02-05 21:20:08.339722
304	Ouémé	OU	25	2017-02-05 21:20:08.350479	2017-02-05 21:20:08.350479
305	Plateau	PL	25	2017-02-05 21:20:08.361025	2017-02-05 21:20:08.361025
306	Zou	ZO	25	2017-02-05 21:20:08.371641	2017-02-05 21:20:08.371641
307	Belait	BE	28	2017-02-05 21:20:08.382345	2017-02-05 21:20:08.382345
308	Brunei-Muara	BM	28	2017-02-05 21:20:08.39271	2017-02-05 21:20:08.39271
309	Temburong	TE	28	2017-02-05 21:20:08.402421	2017-02-05 21:20:08.402421
310	Tutong	TU	28	2017-02-05 21:20:08.412965	2017-02-05 21:20:08.412965
311	El Beni	B	29	2017-02-05 21:20:08.424149	2017-02-05 21:20:08.424149
312	Cochabamba	C	29	2017-02-05 21:20:08.435488	2017-02-05 21:20:08.435488
313	Chuquisaca	H	29	2017-02-05 21:20:08.44677	2017-02-05 21:20:08.44677
314	La Paz	L	29	2017-02-05 21:20:08.45833	2017-02-05 21:20:08.45833
315	Pando	N	29	2017-02-05 21:20:08.46935	2017-02-05 21:20:08.46935
316	Oruro	O	29	2017-02-05 21:20:08.485182	2017-02-05 21:20:08.485182
317	Potosí	P	29	2017-02-05 21:20:08.49317	2017-02-05 21:20:08.49317
318	Santa Cruz	S	29	2017-02-05 21:20:08.501309	2017-02-05 21:20:08.501309
319	Tarija	T	29	2017-02-05 21:20:08.508961	2017-02-05 21:20:08.508961
320	Bonaire	BO	30	2017-02-05 21:20:08.514918	2017-02-05 21:20:08.514918
321	Saba	SA	30	2017-02-05 21:20:08.522013	2017-02-05 21:20:08.522013
322	Sint Eustatius	SE	30	2017-02-05 21:20:08.529839	2017-02-05 21:20:08.529839
323	Acre	AC	31	2017-02-05 21:20:08.546268	2017-02-05 21:20:08.546268
324	Alagoas	AL	31	2017-02-05 21:20:08.575868	2017-02-05 21:20:08.575868
325	Amazonas	AM	31	2017-02-05 21:20:08.596438	2017-02-05 21:20:08.596438
326	Amapá	AP	31	2017-02-05 21:20:08.613976	2017-02-05 21:20:08.613976
327	Bahia	BA	31	2017-02-05 21:20:08.638771	2017-02-05 21:20:08.638771
328	Ceará	CE	31	2017-02-05 21:20:08.655569	2017-02-05 21:20:08.655569
329	Distrito Federal	DF	31	2017-02-05 21:20:08.673017	2017-02-05 21:20:08.673017
330	Espírito Santo	ES	31	2017-02-05 21:20:08.692266	2017-02-05 21:20:08.692266
331	Fernando de Noronha	FN	31	2017-02-05 21:20:08.708825	2017-02-05 21:20:08.708825
332	Goiás	GO	31	2017-02-05 21:20:08.728017	2017-02-05 21:20:08.728017
333	Maranhão	MA	31	2017-02-05 21:20:08.748918	2017-02-05 21:20:08.748918
334	Minas Gerais	MG	31	2017-02-05 21:20:08.768385	2017-02-05 21:20:08.768385
335	Mato Grosso do Sul	MS	31	2017-02-05 21:20:08.789427	2017-02-05 21:20:08.789427
336	Mato Grosso	MT	31	2017-02-05 21:20:08.807106	2017-02-05 21:20:08.807106
337	Pará	PA	31	2017-02-05 21:20:08.827549	2017-02-05 21:20:08.827549
338	Paraíba	PB	31	2017-02-05 21:20:08.855951	2017-02-05 21:20:08.855951
339	Pernambuco	PE	31	2017-02-05 21:20:08.877151	2017-02-05 21:20:08.877151
340	Piauí	PI	31	2017-02-05 21:20:08.8987	2017-02-05 21:20:08.8987
341	Paraná	PR	31	2017-02-05 21:20:08.915454	2017-02-05 21:20:08.915454
342	Rio de Janeiro	RJ	31	2017-02-05 21:20:08.922285	2017-02-05 21:20:08.922285
343	Rio Grande do Norte	RN	31	2017-02-05 21:20:08.93229	2017-02-05 21:20:08.93229
344	Rondônia	RO	31	2017-02-05 21:20:08.93996	2017-02-05 21:20:08.93996
345	Roraima	RR	31	2017-02-05 21:20:08.94719	2017-02-05 21:20:08.94719
346	Rio Grande do Sul	RS	31	2017-02-05 21:20:08.954978	2017-02-05 21:20:08.954978
347	Santa Catarina	SC	31	2017-02-05 21:20:08.961755	2017-02-05 21:20:08.961755
348	Sergipe	SE	31	2017-02-05 21:20:08.968826	2017-02-05 21:20:08.968826
349	São Paulo	SP	31	2017-02-05 21:20:08.976519	2017-02-05 21:20:08.976519
350	Tocantins	TO	31	2017-02-05 21:20:08.984987	2017-02-05 21:20:08.984987
351	Acklins	AK	32	2017-02-05 21:20:08.996163	2017-02-05 21:20:08.996163
352	Bimini	BI	32	2017-02-05 21:20:09.005634	2017-02-05 21:20:09.005634
353	Black Point	BP	32	2017-02-05 21:20:09.014792	2017-02-05 21:20:09.014792
354	Berry Islands	BY	32	2017-02-05 21:20:09.021717	2017-02-05 21:20:09.021717
355	Central Eleuthera	CE	32	2017-02-05 21:20:09.043975	2017-02-05 21:20:09.043975
356	Cat Island	CI	32	2017-02-05 21:20:09.055075	2017-02-05 21:20:09.055075
357	Crooked Island and Long Cay	CK	32	2017-02-05 21:20:09.064458	2017-02-05 21:20:09.064458
358	Central Abaco	CO	32	2017-02-05 21:20:09.073816	2017-02-05 21:20:09.073816
359	Central Andros	CS	32	2017-02-05 21:20:09.082345	2017-02-05 21:20:09.082345
360	East Grand Bahama	EG	32	2017-02-05 21:20:09.090815	2017-02-05 21:20:09.090815
361	Exuma	EX	32	2017-02-05 21:20:09.098195	2017-02-05 21:20:09.098195
362	City of Freeport	FP	32	2017-02-05 21:20:09.108682	2017-02-05 21:20:09.108682
363	Grand Cay	GC	32	2017-02-05 21:20:09.119615	2017-02-05 21:20:09.119615
364	Harbour Island	HI	32	2017-02-05 21:20:09.130311	2017-02-05 21:20:09.130311
365	Hope Town	HT	32	2017-02-05 21:20:09.14173	2017-02-05 21:20:09.14173
366	Inagua	IN	32	2017-02-05 21:20:09.155895	2017-02-05 21:20:09.155895
367	Long Island	LI	32	2017-02-05 21:20:09.166525	2017-02-05 21:20:09.166525
368	Mangrove Cay	MC	32	2017-02-05 21:20:09.176835	2017-02-05 21:20:09.176835
369	Mayaguana	MG	32	2017-02-05 21:20:09.186908	2017-02-05 21:20:09.186908
370	Moore's Island	MI	32	2017-02-05 21:20:09.19672	2017-02-05 21:20:09.19672
371	North Eleuthera	NE	32	2017-02-05 21:20:09.207734	2017-02-05 21:20:09.207734
372	North Abaco	NO	32	2017-02-05 21:20:09.219015	2017-02-05 21:20:09.219015
373	North Andros	NS	32	2017-02-05 21:20:09.230325	2017-02-05 21:20:09.230325
374	Rum Cay	RC	32	2017-02-05 21:20:09.240416	2017-02-05 21:20:09.240416
375	Ragged Island	RI	32	2017-02-05 21:20:09.250361	2017-02-05 21:20:09.250361
376	South Andros	SA	32	2017-02-05 21:20:09.259969	2017-02-05 21:20:09.259969
377	South Eleuthera	SE	32	2017-02-05 21:20:09.270509	2017-02-05 21:20:09.270509
378	South Abaco	SO	32	2017-02-05 21:20:09.28156	2017-02-05 21:20:09.28156
379	San Salvador	SS	32	2017-02-05 21:20:09.291508	2017-02-05 21:20:09.291508
380	Spanish Wells	SW	32	2017-02-05 21:20:09.3003	2017-02-05 21:20:09.3003
381	West Grand Bahama	WG	32	2017-02-05 21:20:09.308899	2017-02-05 21:20:09.308899
382	Paro	11	33	2017-02-05 21:20:09.318348	2017-02-05 21:20:09.318348
383	Chhukha	12	33	2017-02-05 21:20:09.327478	2017-02-05 21:20:09.327478
384	Ha	13	33	2017-02-05 21:20:09.336491	2017-02-05 21:20:09.336491
385	Samtee	14	33	2017-02-05 21:20:09.342751	2017-02-05 21:20:09.342751
386	Thimphu	15	33	2017-02-05 21:20:09.352686	2017-02-05 21:20:09.352686
387	Tsirang	21	33	2017-02-05 21:20:09.363402	2017-02-05 21:20:09.363402
388	Dagana	22	33	2017-02-05 21:20:09.373208	2017-02-05 21:20:09.373208
389	Punakha	23	33	2017-02-05 21:20:09.382086	2017-02-05 21:20:09.382086
390	Wangdue Phodrang	24	33	2017-02-05 21:20:09.393343	2017-02-05 21:20:09.393343
391	Sarpang	31	33	2017-02-05 21:20:09.404839	2017-02-05 21:20:09.404839
392	Trongsa	32	33	2017-02-05 21:20:09.415978	2017-02-05 21:20:09.415978
393	Bumthang	33	33	2017-02-05 21:20:09.426612	2017-02-05 21:20:09.426612
394	Zhemgang	34	33	2017-02-05 21:20:09.43441	2017-02-05 21:20:09.43441
395	Trashigang	41	33	2017-02-05 21:20:09.442267	2017-02-05 21:20:09.442267
396	Monggar	42	33	2017-02-05 21:20:09.452625	2017-02-05 21:20:09.452625
397	Pemagatshel	43	33	2017-02-05 21:20:09.469643	2017-02-05 21:20:09.469643
398	Lhuentse	44	33	2017-02-05 21:20:09.481351	2017-02-05 21:20:09.481351
399	Samdrup Jongkha	45	33	2017-02-05 21:20:09.492356	2017-02-05 21:20:09.492356
400	Gasa	GA	33	2017-02-05 21:20:09.504071	2017-02-05 21:20:09.504071
401	Trashi Yangtse	TY	33	2017-02-05 21:20:09.524269	2017-02-05 21:20:09.524269
402	Central	CE	35	2017-02-05 21:20:09.557367	2017-02-05 21:20:09.557367
403	Ghanzi	GH	35	2017-02-05 21:20:09.590621	2017-02-05 21:20:09.590621
404	Kgalagadi	KG	35	2017-02-05 21:20:09.62513	2017-02-05 21:20:09.62513
405	Kgatleng	KL	35	2017-02-05 21:20:09.666786	2017-02-05 21:20:09.666786
406	Kweneng	KW	35	2017-02-05 21:20:09.703602	2017-02-05 21:20:09.703602
407	North-East	NE	35	2017-02-05 21:20:09.736879	2017-02-05 21:20:09.736879
408	North-West	NW	35	2017-02-05 21:20:09.765913	2017-02-05 21:20:09.765913
409	South-East	SE	35	2017-02-05 21:20:09.775042	2017-02-05 21:20:09.775042
410	Southern	SO	35	2017-02-05 21:20:09.781839	2017-02-05 21:20:09.781839
411	Brèsckaja voblasc'	BR	36	2017-02-05 21:20:09.788856	2017-02-05 21:20:09.788856
412	Horad Minsk	HM	36	2017-02-05 21:20:09.796774	2017-02-05 21:20:09.796774
413	Homel'skaja voblasc'	HO	36	2017-02-05 21:20:09.803553	2017-02-05 21:20:09.803553
414	Hrodzenskaja voblasc'	HR	36	2017-02-05 21:20:09.810717	2017-02-05 21:20:09.810717
415	Mahilëuskaja voblasc'	MA	36	2017-02-05 21:20:09.818043	2017-02-05 21:20:09.818043
416	Minskaja voblasc'	MI	36	2017-02-05 21:20:09.824436	2017-02-05 21:20:09.824436
417	Vicebskaja voblasc'	VI	36	2017-02-05 21:20:09.833425	2017-02-05 21:20:09.833425
418	Belize	BZ	37	2017-02-05 21:20:09.844083	2017-02-05 21:20:09.844083
419	Cayo	CY	37	2017-02-05 21:20:09.851341	2017-02-05 21:20:09.851341
420	Corozal	CZL	37	2017-02-05 21:20:09.858316	2017-02-05 21:20:09.858316
421	Orange Walk	OW	37	2017-02-05 21:20:09.865297	2017-02-05 21:20:09.865297
422	Stann Creek	SC	37	2017-02-05 21:20:09.87177	2017-02-05 21:20:09.87177
423	Toledo	TOL	37	2017-02-05 21:20:09.878172	2017-02-05 21:20:09.878172
424	Alberta	AB	38	2017-02-05 21:20:09.886177	2017-02-05 21:20:09.886177
425	British Columbia	BC	38	2017-02-05 21:20:09.893203	2017-02-05 21:20:09.893203
426	Manitoba	MB	38	2017-02-05 21:20:09.900982	2017-02-05 21:20:09.900982
427	New Brunswick	NB	38	2017-02-05 21:20:09.908763	2017-02-05 21:20:09.908763
428	Newfoundland and Labrador	NL	38	2017-02-05 21:20:09.915328	2017-02-05 21:20:09.915328
429	Nova Scotia	NS	38	2017-02-05 21:20:09.921804	2017-02-05 21:20:09.921804
430	Northwest Territories	NT	38	2017-02-05 21:20:09.930345	2017-02-05 21:20:09.930345
431	Nunavut	NU	38	2017-02-05 21:20:09.938335	2017-02-05 21:20:09.938335
432	Ontario	ON	38	2017-02-05 21:20:09.945296	2017-02-05 21:20:09.945296
433	Prince Edward Island	PE	38	2017-02-05 21:20:09.95188	2017-02-05 21:20:09.95188
434	Quebec	QC	38	2017-02-05 21:20:09.958601	2017-02-05 21:20:09.958601
435	Saskatchewan	SK	38	2017-02-05 21:20:09.965885	2017-02-05 21:20:09.965885
436	Yukon Territory	YT	38	2017-02-05 21:20:09.974809	2017-02-05 21:20:09.974809
437	Bas-Congo	BC	40	2017-02-05 21:20:09.983129	2017-02-05 21:20:09.983129
438	Bandundu	BN	40	2017-02-05 21:20:09.991011	2017-02-05 21:20:09.991011
439	Équateur	EQ	40	2017-02-05 21:20:09.99949	2017-02-05 21:20:09.99949
440	Katanga	KA	40	2017-02-05 21:20:10.007914	2017-02-05 21:20:10.007914
441	Kasai-Oriental	KE	40	2017-02-05 21:20:10.016293	2017-02-05 21:20:10.016293
442	Kinshasa	KN	40	2017-02-05 21:20:10.02253	2017-02-05 21:20:10.02253
443	Kasai-Occidental	KW	40	2017-02-05 21:20:10.031282	2017-02-05 21:20:10.031282
444	Maniema	MA	40	2017-02-05 21:20:10.043928	2017-02-05 21:20:10.043928
445	Nord-Kivu	NK	40	2017-02-05 21:20:10.054293	2017-02-05 21:20:10.054293
446	Orientale	OR	40	2017-02-05 21:20:10.062524	2017-02-05 21:20:10.062524
447	Sud-Kivu	SK	40	2017-02-05 21:20:10.06907	2017-02-05 21:20:10.06907
448	Ouham	AC	41	2017-02-05 21:20:10.079611	2017-02-05 21:20:10.079611
449	Bamingui-Bangoran	BB	41	2017-02-05 21:20:10.089996	2017-02-05 21:20:10.089996
450	Bangui	BGF	41	2017-02-05 21:20:10.100423	2017-02-05 21:20:10.100423
451	Basse-Kotto	BK	41	2017-02-05 21:20:10.109843	2017-02-05 21:20:10.109843
452	Haute-Kotto	HK	41	2017-02-05 21:20:10.118172	2017-02-05 21:20:10.118172
453	Haut-Mbomou	HM	41	2017-02-05 21:20:10.126306	2017-02-05 21:20:10.126306
454	Haute-Sangha / Mambéré-Kadéï	HS	41	2017-02-05 21:20:10.134737	2017-02-05 21:20:10.134737
455	Gribingui	KB	41	2017-02-05 21:20:10.145435	2017-02-05 21:20:10.145435
456	Kémo-Gribingui	KG	41	2017-02-05 21:20:10.155609	2017-02-05 21:20:10.155609
457	Lobaye	LB	41	2017-02-05 21:20:10.165716	2017-02-05 21:20:10.165716
458	Mbomou	MB	41	2017-02-05 21:20:10.175717	2017-02-05 21:20:10.175717
459	Ombella-M'poko	MP	41	2017-02-05 21:20:10.184818	2017-02-05 21:20:10.184818
460	Nana-Mambéré	NM	41	2017-02-05 21:20:10.194046	2017-02-05 21:20:10.194046
461	Ouham-Pendé	OP	41	2017-02-05 21:20:10.203385	2017-02-05 21:20:10.203385
462	Sangha	SE	41	2017-02-05 21:20:10.213108	2017-02-05 21:20:10.213108
463	Ouaka	UK	41	2017-02-05 21:20:10.223156	2017-02-05 21:20:10.223156
464	Vakaga	VK	41	2017-02-05 21:20:10.236338	2017-02-05 21:20:10.236338
465	Bouenza	11	42	2017-02-05 21:20:10.247787	2017-02-05 21:20:10.247787
466	Pool	12	42	2017-02-05 21:20:10.257852	2017-02-05 21:20:10.257852
467	Sangha	13	42	2017-02-05 21:20:10.267324	2017-02-05 21:20:10.267324
468	Plateaux	14	42	2017-02-05 21:20:10.276123	2017-02-05 21:20:10.276123
469	Cuvette-Ouest	15	42	2017-02-05 21:20:10.285318	2017-02-05 21:20:10.285318
470	Lékoumou	2	42	2017-02-05 21:20:10.295149	2017-02-05 21:20:10.295149
471	Kouilou	5	42	2017-02-05 21:20:10.304015	2017-02-05 21:20:10.304015
472	Likouala	7	42	2017-02-05 21:20:10.312062	2017-02-05 21:20:10.312062
473	Cuvette	8	42	2017-02-05 21:20:10.319951	2017-02-05 21:20:10.319951
474	Niari	9	42	2017-02-05 21:20:10.326774	2017-02-05 21:20:10.326774
475	Brazzaville	BZV	42	2017-02-05 21:20:10.334247	2017-02-05 21:20:10.334247
476	Aargau	AG	43	2017-02-05 21:20:10.343667	2017-02-05 21:20:10.343667
477	Appenzell Innerrhoden	AI	43	2017-02-05 21:20:10.353449	2017-02-05 21:20:10.353449
478	Appenzell Ausserrhoden	AR	43	2017-02-05 21:20:10.364019	2017-02-05 21:20:10.364019
479	Bern	BE	43	2017-02-05 21:20:10.374479	2017-02-05 21:20:10.374479
480	Basel-Landschaft	BL	43	2017-02-05 21:20:10.385182	2017-02-05 21:20:10.385182
481	Basel-Stadt	BS	43	2017-02-05 21:20:10.395499	2017-02-05 21:20:10.395499
482	Fribourg	FR	43	2017-02-05 21:20:10.404048	2017-02-05 21:20:10.404048
483	Genève	GE	43	2017-02-05 21:20:10.412706	2017-02-05 21:20:10.412706
484	Glarus	GL	43	2017-02-05 21:20:10.421486	2017-02-05 21:20:10.421486
485	Graubünden	GR	43	2017-02-05 21:20:10.429169	2017-02-05 21:20:10.429169
486	Jura	JU	43	2017-02-05 21:20:10.435723	2017-02-05 21:20:10.435723
487	Luzern	LU	43	2017-02-05 21:20:10.445405	2017-02-05 21:20:10.445405
488	Neuchâtel	NE	43	2017-02-05 21:20:10.455472	2017-02-05 21:20:10.455472
489	Nidwalden	NW	43	2017-02-05 21:20:10.467028	2017-02-05 21:20:10.467028
490	Obwalden	OW	43	2017-02-05 21:20:10.477434	2017-02-05 21:20:10.477434
491	Sankt Gallen	SG	43	2017-02-05 21:20:10.48506	2017-02-05 21:20:10.48506
492	Schaffhausen	SH	43	2017-02-05 21:20:10.492763	2017-02-05 21:20:10.492763
493	Solothurn	SO	43	2017-02-05 21:20:10.501181	2017-02-05 21:20:10.501181
494	Schwyz	SZ	43	2017-02-05 21:20:10.508912	2017-02-05 21:20:10.508912
495	Thurgau	TG	43	2017-02-05 21:20:10.51684	2017-02-05 21:20:10.51684
496	Ticino	TI	43	2017-02-05 21:20:10.525413	2017-02-05 21:20:10.525413
497	Uri	UR	43	2017-02-05 21:20:10.534139	2017-02-05 21:20:10.534139
498	Vaud	VD	43	2017-02-05 21:20:10.541979	2017-02-05 21:20:10.541979
499	Valais	VS	43	2017-02-05 21:20:10.552651	2017-02-05 21:20:10.552651
500	Zug	ZG	43	2017-02-05 21:20:10.56221	2017-02-05 21:20:10.56221
501	Zürich	ZH	43	2017-02-05 21:20:10.572155	2017-02-05 21:20:10.572155
502	Lagunes (Région des)	01	44	2017-02-05 21:20:10.581735	2017-02-05 21:20:10.581735
503	Haut-Sassandra (Région du)	02	44	2017-02-05 21:20:10.590719	2017-02-05 21:20:10.590719
504	Savanes (Région des)	03	44	2017-02-05 21:20:10.618763	2017-02-05 21:20:10.618763
505	Vallée du Bandama (Région de la)	04	44	2017-02-05 21:20:10.646297	2017-02-05 21:20:10.646297
506	Moyen-Comoé (Région du)	05	44	2017-02-05 21:20:10.667816	2017-02-05 21:20:10.667816
507	18 Montagnes (Région des)	06	44	2017-02-05 21:20:10.69423	2017-02-05 21:20:10.69423
508	Lacs (Région des)	07	44	2017-02-05 21:20:10.723673	2017-02-05 21:20:10.723673
509	Zanzan (Région du)	08	44	2017-02-05 21:20:10.746315	2017-02-05 21:20:10.746315
510	Bas-Sassandra (Région du)	09	44	2017-02-05 21:20:10.765402	2017-02-05 21:20:10.765402
511	Denguélé (Région du)	10	44	2017-02-05 21:20:10.784407	2017-02-05 21:20:10.784407
512	Nzi-Comoé (Région)	11	44	2017-02-05 21:20:10.80991	2017-02-05 21:20:10.80991
513	Marahoué (Région de la)	12	44	2017-02-05 21:20:10.8169	2017-02-05 21:20:10.8169
514	Sud-Comoé (Région du)	13	44	2017-02-05 21:20:10.822563	2017-02-05 21:20:10.822563
515	Worodouqou (Région du)	14	44	2017-02-05 21:20:10.829024	2017-02-05 21:20:10.829024
516	Sud-Bandama (Région du)	15	44	2017-02-05 21:20:10.834538	2017-02-05 21:20:10.834538
517	Agnébi (Région de l')	16	44	2017-02-05 21:20:10.840066	2017-02-05 21:20:10.840066
518	Bafing (Région du)	17	44	2017-02-05 21:20:10.845184	2017-02-05 21:20:10.845184
519	Fromager (Région du)	18	44	2017-02-05 21:20:10.851842	2017-02-05 21:20:10.851842
520	Moyen-Cavally (Région du)	19	44	2017-02-05 21:20:10.858843	2017-02-05 21:20:10.858843
521	Aisén del General Carlos Ibáñez del Campo	AI	46	2017-02-05 21:20:10.865864	2017-02-05 21:20:10.865864
522	Antofagasta	AN	46	2017-02-05 21:20:10.873231	2017-02-05 21:20:10.873231
523	Arica y Parinacota	AP	46	2017-02-05 21:20:10.880074	2017-02-05 21:20:10.880074
524	Araucanía	AR	46	2017-02-05 21:20:10.886557	2017-02-05 21:20:10.886557
525	Atacama	AT	46	2017-02-05 21:20:10.89365	2017-02-05 21:20:10.89365
526	Bío-Bío	BI	46	2017-02-05 21:20:10.900692	2017-02-05 21:20:10.900692
527	Coquimbo	CO	46	2017-02-05 21:20:10.908055	2017-02-05 21:20:10.908055
528	Libertador General Bernardo O'Higgins	LI	46	2017-02-05 21:20:10.915963	2017-02-05 21:20:10.915963
529	Los Lagos	LL	46	2017-02-05 21:20:10.923679	2017-02-05 21:20:10.923679
530	Los Ríos	LR	46	2017-02-05 21:20:10.93081	2017-02-05 21:20:10.93081
531	Magallanes y Antártica Chilena	MA	46	2017-02-05 21:20:10.938269	2017-02-05 21:20:10.938269
532	Maule	ML	46	2017-02-05 21:20:10.944765	2017-02-05 21:20:10.944765
533	Región Metropolitana de Santiago	RM	46	2017-02-05 21:20:10.953029	2017-02-05 21:20:10.953029
534	Tarapacá	TA	46	2017-02-05 21:20:10.960638	2017-02-05 21:20:10.960638
535	Valparaíso	VS	46	2017-02-05 21:20:10.97141	2017-02-05 21:20:10.97141
536	Adamaoua	AD	47	2017-02-05 21:20:10.97941	2017-02-05 21:20:10.97941
537	Centre	CE	47	2017-02-05 21:20:10.984888	2017-02-05 21:20:10.984888
538	Far North	EN	47	2017-02-05 21:20:10.99006	2017-02-05 21:20:10.99006
539	East	ES	47	2017-02-05 21:20:10.998125	2017-02-05 21:20:10.998125
540	Littoral	LT	47	2017-02-05 21:20:11.005249	2017-02-05 21:20:11.005249
541	North	NO	47	2017-02-05 21:20:11.014153	2017-02-05 21:20:11.014153
542	North-West (Cameroon)	NW	47	2017-02-05 21:20:11.021225	2017-02-05 21:20:11.021225
543	West	OU	47	2017-02-05 21:20:11.028743	2017-02-05 21:20:11.028743
544	South	SU	47	2017-02-05 21:20:11.035488	2017-02-05 21:20:11.035488
545	South-West	SW	47	2017-02-05 21:20:11.041598	2017-02-05 21:20:11.041598
546	Beijing	11	48	2017-02-05 21:20:11.048133	2017-02-05 21:20:11.048133
547	Tianjin	12	48	2017-02-05 21:20:11.057412	2017-02-05 21:20:11.057412
548	Hebei	13	48	2017-02-05 21:20:11.066551	2017-02-05 21:20:11.066551
549	Shanxi	14	48	2017-02-05 21:20:11.077461	2017-02-05 21:20:11.077461
550	Nei Mongol	15	48	2017-02-05 21:20:11.089247	2017-02-05 21:20:11.089247
551	Liaoning	21	48	2017-02-05 21:20:11.098291	2017-02-05 21:20:11.098291
552	Jilin	22	48	2017-02-05 21:20:11.10545	2017-02-05 21:20:11.10545
553	Heilongjiang	23	48	2017-02-05 21:20:11.114606	2017-02-05 21:20:11.114606
554	Shanghai	31	48	2017-02-05 21:20:11.125469	2017-02-05 21:20:11.125469
555	Jiangsu	32	48	2017-02-05 21:20:11.13468	2017-02-05 21:20:11.13468
556	Zhejiang	33	48	2017-02-05 21:20:11.143793	2017-02-05 21:20:11.143793
557	Anhui	34	48	2017-02-05 21:20:11.153708	2017-02-05 21:20:11.153708
558	Fujian	35	48	2017-02-05 21:20:11.164489	2017-02-05 21:20:11.164489
559	Jiangxi	36	48	2017-02-05 21:20:11.17231	2017-02-05 21:20:11.17231
560	Shandong	37	48	2017-02-05 21:20:11.178964	2017-02-05 21:20:11.178964
561	Henan	41	48	2017-02-05 21:20:11.185493	2017-02-05 21:20:11.185493
562	Hubei	42	48	2017-02-05 21:20:11.195704	2017-02-05 21:20:11.195704
563	Hunan	43	48	2017-02-05 21:20:11.204616	2017-02-05 21:20:11.204616
564	Guangdong	44	48	2017-02-05 21:20:11.216378	2017-02-05 21:20:11.216378
565	Guangxi	45	48	2017-02-05 21:20:11.22474	2017-02-05 21:20:11.22474
566	Hainan	46	48	2017-02-05 21:20:11.23317	2017-02-05 21:20:11.23317
567	Chongqing	50	48	2017-02-05 21:20:11.242352	2017-02-05 21:20:11.242352
568	Sichuan	51	48	2017-02-05 21:20:11.255309	2017-02-05 21:20:11.255309
569	Guizhou	52	48	2017-02-05 21:20:11.268192	2017-02-05 21:20:11.268192
570	Yunnan	53	48	2017-02-05 21:20:11.277171	2017-02-05 21:20:11.277171
571	Xizang	54	48	2017-02-05 21:20:11.288529	2017-02-05 21:20:11.288529
572	Shaanxi	61	48	2017-02-05 21:20:11.301016	2017-02-05 21:20:11.301016
573	Gansu	62	48	2017-02-05 21:20:11.310131	2017-02-05 21:20:11.310131
574	Qinghai	63	48	2017-02-05 21:20:11.318234	2017-02-05 21:20:11.318234
575	Ningxia	64	48	2017-02-05 21:20:11.32618	2017-02-05 21:20:11.32618
576	Xinjiang	65	48	2017-02-05 21:20:11.333538	2017-02-05 21:20:11.333538
577	Taiwan	71	48	2017-02-05 21:20:11.343545	2017-02-05 21:20:11.343545
578	Xianggang (Hong-Kong)	91	48	2017-02-05 21:20:11.354228	2017-02-05 21:20:11.354228
579	Aomen (Macau)	92	48	2017-02-05 21:20:11.360843	2017-02-05 21:20:11.360843
580	Amazonas	AMA	49	2017-02-05 21:20:11.369558	2017-02-05 21:20:11.369558
581	Antioquia	ANT	49	2017-02-05 21:20:11.379392	2017-02-05 21:20:11.379392
582	Arauca	ARA	49	2017-02-05 21:20:11.387822	2017-02-05 21:20:11.387822
583	Atlántico	ATL	49	2017-02-05 21:20:11.395934	2017-02-05 21:20:11.395934
584	Bolívar	BOL	49	2017-02-05 21:20:11.404775	2017-02-05 21:20:11.404775
585	Boyacá	BOY	49	2017-02-05 21:20:11.414476	2017-02-05 21:20:11.414476
586	Caldas	CAL	49	2017-02-05 21:20:11.426403	2017-02-05 21:20:11.426403
587	Caquetá	CAQ	49	2017-02-05 21:20:11.436911	2017-02-05 21:20:11.436911
588	Casanare	CAS	49	2017-02-05 21:20:11.445139	2017-02-05 21:20:11.445139
589	Cauca	CAU	49	2017-02-05 21:20:11.453129	2017-02-05 21:20:11.453129
590	Cesar	CES	49	2017-02-05 21:20:11.462195	2017-02-05 21:20:11.462195
591	Chocó	CHO	49	2017-02-05 21:20:11.471139	2017-02-05 21:20:11.471139
592	Córdoba	COR	49	2017-02-05 21:20:11.479938	2017-02-05 21:20:11.479938
593	Cundinamarca	CUN	49	2017-02-05 21:20:11.491278	2017-02-05 21:20:11.491278
594	Distrito Capital de Bogotá	DC	49	2017-02-05 21:20:11.500652	2017-02-05 21:20:11.500652
595	Guainía	GUA	49	2017-02-05 21:20:11.510343	2017-02-05 21:20:11.510343
596	Guaviare	GUV	49	2017-02-05 21:20:11.518776	2017-02-05 21:20:11.518776
597	Huila	HUI	49	2017-02-05 21:20:11.527431	2017-02-05 21:20:11.527431
598	La Guajira	LAG	49	2017-02-05 21:20:11.537215	2017-02-05 21:20:11.537215
599	Magdalena	MAG	49	2017-02-05 21:20:11.545504	2017-02-05 21:20:11.545504
600	Meta	MET	49	2017-02-05 21:20:11.555567	2017-02-05 21:20:11.555567
601	Nariño	NAR	49	2017-02-05 21:20:11.562284	2017-02-05 21:20:11.562284
602	Norte de Santander	NSA	49	2017-02-05 21:20:11.569168	2017-02-05 21:20:11.569168
603	Putumayo	PUT	49	2017-02-05 21:20:11.584937	2017-02-05 21:20:11.584937
604	Quindío	QUI	49	2017-02-05 21:20:11.601208	2017-02-05 21:20:11.601208
605	Risaralda	RIS	49	2017-02-05 21:20:11.621373	2017-02-05 21:20:11.621373
606	Santander	SAN	49	2017-02-05 21:20:11.65201	2017-02-05 21:20:11.65201
607	San Andrés, Providencia y Santa Catalina	SAP	49	2017-02-05 21:20:11.670675	2017-02-05 21:20:11.670675
608	Sucre	SUC	49	2017-02-05 21:20:11.690012	2017-02-05 21:20:11.690012
609	Tolima	TOL	49	2017-02-05 21:20:11.715993	2017-02-05 21:20:11.715993
610	Valle del Cauca	VAC	49	2017-02-05 21:20:11.740322	2017-02-05 21:20:11.740322
611	Vaupés	VAU	49	2017-02-05 21:20:11.752193	2017-02-05 21:20:11.752193
612	Vichada	VID	49	2017-02-05 21:20:11.759148	2017-02-05 21:20:11.759148
613	Alajuela	A	50	2017-02-05 21:20:11.764994	2017-02-05 21:20:11.764994
614	Cartago	C	50	2017-02-05 21:20:11.772039	2017-02-05 21:20:11.772039
615	Guanacaste	G	50	2017-02-05 21:20:11.779477	2017-02-05 21:20:11.779477
616	Heredia	H	50	2017-02-05 21:20:11.787029	2017-02-05 21:20:11.787029
617	Limón	L	50	2017-02-05 21:20:11.794461	2017-02-05 21:20:11.794461
618	Puntarenas	P	50	2017-02-05 21:20:11.801098	2017-02-05 21:20:11.801098
619	San José	SJ	50	2017-02-05 21:20:11.80733	2017-02-05 21:20:11.80733
620	Pinar del Rio	01	51	2017-02-05 21:20:11.812893	2017-02-05 21:20:11.812893
621	La Habana	02	51	2017-02-05 21:20:11.818014	2017-02-05 21:20:11.818014
622	Ciudad de La Habana	03	51	2017-02-05 21:20:11.823544	2017-02-05 21:20:11.823544
623	Matanzas	04	51	2017-02-05 21:20:11.829455	2017-02-05 21:20:11.829455
624	Villa Clara	05	51	2017-02-05 21:20:11.834694	2017-02-05 21:20:11.834694
625	Cienfuegos	06	51	2017-02-05 21:20:11.84121	2017-02-05 21:20:11.84121
626	Sancti Spíritus	07	51	2017-02-05 21:20:11.846786	2017-02-05 21:20:11.846786
627	Ciego de Ávila	08	51	2017-02-05 21:20:11.85229	2017-02-05 21:20:11.85229
628	Camagüey	09	51	2017-02-05 21:20:11.858082	2017-02-05 21:20:11.858082
629	Las Tunas	10	51	2017-02-05 21:20:11.864431	2017-02-05 21:20:11.864431
630	Holguín	11	51	2017-02-05 21:20:11.870018	2017-02-05 21:20:11.870018
631	Granma	12	51	2017-02-05 21:20:11.875361	2017-02-05 21:20:11.875361
632	Santiago de Cuba	13	51	2017-02-05 21:20:11.881091	2017-02-05 21:20:11.881091
633	Guantánamo	14	51	2017-02-05 21:20:11.886477	2017-02-05 21:20:11.886477
634	Isla de la Juventud	99	51	2017-02-05 21:20:11.891457	2017-02-05 21:20:11.891457
635	Ilhas de Barlavento	B	52	2017-02-05 21:20:11.896304	2017-02-05 21:20:11.896304
636	Ilhas de Sotavento	S	52	2017-02-05 21:20:11.902275	2017-02-05 21:20:11.902275
637	Lefkosía	01	55	2017-02-05 21:20:11.909221	2017-02-05 21:20:11.909221
638	Lemesós	02	55	2017-02-05 21:20:11.915692	2017-02-05 21:20:11.915692
639	Lárnaka	03	55	2017-02-05 21:20:11.92239	2017-02-05 21:20:11.92239
640	Ammóchostos	04	55	2017-02-05 21:20:11.929067	2017-02-05 21:20:11.929067
641	Páfos	05	55	2017-02-05 21:20:11.934239	2017-02-05 21:20:11.934239
642	Kerýneia	06	55	2017-02-05 21:20:11.939038	2017-02-05 21:20:11.939038
643	Jihočeský kraj	JC	56	2017-02-05 21:20:11.94422	2017-02-05 21:20:11.94422
644	Jihomoravský kraj	JM	56	2017-02-05 21:20:11.949241	2017-02-05 21:20:11.949241
645	Karlovarský kraj	KA	56	2017-02-05 21:20:11.955479	2017-02-05 21:20:11.955479
646	Královéhradecký kraj	KR	56	2017-02-05 21:20:11.96175	2017-02-05 21:20:11.96175
647	Liberecký kraj	LI	56	2017-02-05 21:20:11.969342	2017-02-05 21:20:11.969342
648	Moravskoslezský kraj	MO	56	2017-02-05 21:20:11.975992	2017-02-05 21:20:11.975992
649	Olomoucký kraj	OL	56	2017-02-05 21:20:11.982358	2017-02-05 21:20:11.982358
650	Pardubický kraj	PA	56	2017-02-05 21:20:11.989186	2017-02-05 21:20:11.989186
651	Plzeňský kraj	PL	56	2017-02-05 21:20:11.995526	2017-02-05 21:20:11.995526
652	Praha, hlavní město	PR	56	2017-02-05 21:20:12.004057	2017-02-05 21:20:12.004057
653	Středočeský kraj	ST	56	2017-02-05 21:20:12.01078	2017-02-05 21:20:12.01078
654	Ústecký kraj	US	56	2017-02-05 21:20:12.017698	2017-02-05 21:20:12.017698
655	Vysočina	VY	56	2017-02-05 21:20:12.024752	2017-02-05 21:20:12.024752
656	Zlínský kraj	ZL	56	2017-02-05 21:20:12.031411	2017-02-05 21:20:12.031411
657	Brandenburg	BB	57	2017-02-05 21:20:12.038716	2017-02-05 21:20:12.038716
658	Berlin	BE	57	2017-02-05 21:20:12.047349	2017-02-05 21:20:12.047349
659	Baden-Württemberg	BW	57	2017-02-05 21:20:12.057811	2017-02-05 21:20:12.057811
660	Bayern	BY	57	2017-02-05 21:20:12.067667	2017-02-05 21:20:12.067667
661	Bremen	HB	57	2017-02-05 21:20:12.076315	2017-02-05 21:20:12.076315
662	Hessen	HE	57	2017-02-05 21:20:12.086388	2017-02-05 21:20:12.086388
663	Hamburg	HH	57	2017-02-05 21:20:12.097095	2017-02-05 21:20:12.097095
664	Mecklenburg-Vorpommern	MV	57	2017-02-05 21:20:12.107625	2017-02-05 21:20:12.107625
665	Niedersachsen	NI	57	2017-02-05 21:20:12.116552	2017-02-05 21:20:12.116552
666	Nordrhein-Westfalen	NW	57	2017-02-05 21:20:12.126162	2017-02-05 21:20:12.126162
667	Rheinland-Pfalz	RP	57	2017-02-05 21:20:12.136149	2017-02-05 21:20:12.136149
668	Schleswig-Holstein	SH	57	2017-02-05 21:20:12.147324	2017-02-05 21:20:12.147324
669	Saarland	SL	57	2017-02-05 21:20:12.158593	2017-02-05 21:20:12.158593
670	Sachsen	SN	57	2017-02-05 21:20:12.168624	2017-02-05 21:20:12.168624
671	Sachsen-Anhalt	ST	57	2017-02-05 21:20:12.174909	2017-02-05 21:20:12.174909
672	Thüringen	TH	57	2017-02-05 21:20:12.180906	2017-02-05 21:20:12.180906
673	Arta	AR	58	2017-02-05 21:20:12.188234	2017-02-05 21:20:12.188234
674	Ali Sabieh	AS	58	2017-02-05 21:20:12.197157	2017-02-05 21:20:12.197157
675	Dikhil	DI	58	2017-02-05 21:20:12.204996	2017-02-05 21:20:12.204996
676	Djibouti	DJ	58	2017-02-05 21:20:12.212982	2017-02-05 21:20:12.212982
677	Obock	OB	58	2017-02-05 21:20:12.221542	2017-02-05 21:20:12.221542
678	Tadjourah	TA	58	2017-02-05 21:20:12.228812	2017-02-05 21:20:12.228812
679	Nordjylland	81	59	2017-02-05 21:20:12.235648	2017-02-05 21:20:12.235648
680	Midtjylland	82	59	2017-02-05 21:20:12.244126	2017-02-05 21:20:12.244126
681	Syddanmark	83	59	2017-02-05 21:20:12.25304	2017-02-05 21:20:12.25304
682	Hovedstaden	84	59	2017-02-05 21:20:12.263302	2017-02-05 21:20:12.263302
683	Sjælland	85	59	2017-02-05 21:20:12.273304	2017-02-05 21:20:12.273304
684	Saint Peter	01	60	2017-02-05 21:20:12.284208	2017-02-05 21:20:12.284208
685	Saint Andrew	02	60	2017-02-05 21:20:12.293477	2017-02-05 21:20:12.293477
686	Saint David	03	60	2017-02-05 21:20:12.30256	2017-02-05 21:20:12.30256
687	Saint George	04	60	2017-02-05 21:20:12.312003	2017-02-05 21:20:12.312003
688	Saint John	05	60	2017-02-05 21:20:12.320379	2017-02-05 21:20:12.320379
689	Saint Joseph	06	60	2017-02-05 21:20:12.329038	2017-02-05 21:20:12.329038
690	Saint Luke	07	60	2017-02-05 21:20:12.336813	2017-02-05 21:20:12.336813
691	Saint Mark	08	60	2017-02-05 21:20:12.346434	2017-02-05 21:20:12.346434
692	Saint Patrick	09	60	2017-02-05 21:20:12.355557	2017-02-05 21:20:12.355557
693	Saint Paul	10	60	2017-02-05 21:20:12.366036	2017-02-05 21:20:12.366036
694	Distrito Nacional (Santo Domingo)	01	61	2017-02-05 21:20:12.374184	2017-02-05 21:20:12.374184
695	Azua	02	61	2017-02-05 21:20:12.380415	2017-02-05 21:20:12.380415
696	Bahoruco	03	61	2017-02-05 21:20:12.389276	2017-02-05 21:20:12.389276
697	Barahona	04	61	2017-02-05 21:20:12.398318	2017-02-05 21:20:12.398318
698	Dajabón	05	61	2017-02-05 21:20:12.404499	2017-02-05 21:20:12.404499
699	Duarte	06	61	2017-02-05 21:20:12.412634	2017-02-05 21:20:12.412634
700	La Estrelleta [Elías Piña]	07	61	2017-02-05 21:20:12.420192	2017-02-05 21:20:12.420192
701	El Seybo [El Seibo]	08	61	2017-02-05 21:20:12.428519	2017-02-05 21:20:12.428519
702	Espaillat	09	61	2017-02-05 21:20:12.435505	2017-02-05 21:20:12.435505
703	Independencia	10	61	2017-02-05 21:20:12.445166	2017-02-05 21:20:12.445166
704	La Altagracia	11	61	2017-02-05 21:20:12.455561	2017-02-05 21:20:12.455561
705	La Romana	12	61	2017-02-05 21:20:12.466366	2017-02-05 21:20:12.466366
706	La Vega	13	61	2017-02-05 21:20:12.477645	2017-02-05 21:20:12.477645
707	María Trinidad Sánchez	14	61	2017-02-05 21:20:12.48829	2017-02-05 21:20:12.48829
708	Monte Cristi	15	61	2017-02-05 21:20:12.498641	2017-02-05 21:20:12.498641
709	Pedernales	16	61	2017-02-05 21:20:12.509247	2017-02-05 21:20:12.509247
710	Peravia	17	61	2017-02-05 21:20:12.518679	2017-02-05 21:20:12.518679
711	Puerto Plata	18	61	2017-02-05 21:20:12.52501	2017-02-05 21:20:12.52501
712	Salcedo	19	61	2017-02-05 21:20:12.530852	2017-02-05 21:20:12.530852
713	Samaná	20	61	2017-02-05 21:20:12.538451	2017-02-05 21:20:12.538451
714	San Cristóbal	21	61	2017-02-05 21:20:12.546037	2017-02-05 21:20:12.546037
715	San Juan	22	61	2017-02-05 21:20:12.554642	2017-02-05 21:20:12.554642
716	San Pedro de Macorís	23	61	2017-02-05 21:20:12.563302	2017-02-05 21:20:12.563302
717	Sánchez Ramírez	24	61	2017-02-05 21:20:12.57287	2017-02-05 21:20:12.57287
718	Santiago	25	61	2017-02-05 21:20:12.59487	2017-02-05 21:20:12.59487
719	Santiago Rodríguez	26	61	2017-02-05 21:20:12.624545	2017-02-05 21:20:12.624545
720	Valverde	27	61	2017-02-05 21:20:12.654135	2017-02-05 21:20:12.654135
721	Monseñor Nouel	28	61	2017-02-05 21:20:12.686278	2017-02-05 21:20:12.686278
722	Monte Plata	29	61	2017-02-05 21:20:12.716255	2017-02-05 21:20:12.716255
723	Hato Mayor	30	61	2017-02-05 21:20:12.753427	2017-02-05 21:20:12.753427
724	Adrar	01	62	2017-02-05 21:20:12.777877	2017-02-05 21:20:12.777877
725	Chlef	02	62	2017-02-05 21:20:12.802288	2017-02-05 21:20:12.802288
726	Laghouat	03	62	2017-02-05 21:20:12.834044	2017-02-05 21:20:12.834044
727	Oum el Bouaghi	04	62	2017-02-05 21:20:12.862228	2017-02-05 21:20:12.862228
728	Batna	05	62	2017-02-05 21:20:12.877086	2017-02-05 21:20:12.877086
729	Béjaïa	06	62	2017-02-05 21:20:12.883965	2017-02-05 21:20:12.883965
730	Biskra	07	62	2017-02-05 21:20:12.890594	2017-02-05 21:20:12.890594
731	Béchar	08	62	2017-02-05 21:20:12.897307	2017-02-05 21:20:12.897307
732	Blida	09	62	2017-02-05 21:20:12.904492	2017-02-05 21:20:12.904492
733	Bouira	10	62	2017-02-05 21:20:12.911212	2017-02-05 21:20:12.911212
734	Tamanghasset	11	62	2017-02-05 21:20:12.917705	2017-02-05 21:20:12.917705
735	Tébessa	12	62	2017-02-05 21:20:12.923459	2017-02-05 21:20:12.923459
736	Tlemcen	13	62	2017-02-05 21:20:12.927968	2017-02-05 21:20:12.927968
737	Tiaret	14	62	2017-02-05 21:20:12.933449	2017-02-05 21:20:12.933449
738	Tizi Ouzou	15	62	2017-02-05 21:20:12.939345	2017-02-05 21:20:12.939345
739	Alger	16	62	2017-02-05 21:20:12.945012	2017-02-05 21:20:12.945012
740	Djelfa	17	62	2017-02-05 21:20:12.951358	2017-02-05 21:20:12.951358
741	Jijel	18	62	2017-02-05 21:20:12.956947	2017-02-05 21:20:12.956947
742	Sétif	19	62	2017-02-05 21:20:12.962812	2017-02-05 21:20:12.962812
743	Saïda	20	62	2017-02-05 21:20:12.968129	2017-02-05 21:20:12.968129
744	Skikda	21	62	2017-02-05 21:20:12.973223	2017-02-05 21:20:12.973223
745	Sidi Bel Abbès	22	62	2017-02-05 21:20:12.978572	2017-02-05 21:20:12.978572
746	Annaba	23	62	2017-02-05 21:20:12.984815	2017-02-05 21:20:12.984815
747	Guelma	24	62	2017-02-05 21:20:12.990856	2017-02-05 21:20:12.990856
748	Constantine	25	62	2017-02-05 21:20:12.996793	2017-02-05 21:20:12.996793
749	Médéa	26	62	2017-02-05 21:20:13.002087	2017-02-05 21:20:13.002087
750	Mostaganem	27	62	2017-02-05 21:20:13.006742	2017-02-05 21:20:13.006742
751	Msila	28	62	2017-02-05 21:20:13.011982	2017-02-05 21:20:13.011982
752	Mascara	29	62	2017-02-05 21:20:13.017231	2017-02-05 21:20:13.017231
753	Ouargla	30	62	2017-02-05 21:20:13.022378	2017-02-05 21:20:13.022378
754	Oran	31	62	2017-02-05 21:20:13.026703	2017-02-05 21:20:13.026703
755	El Bayadh	32	62	2017-02-05 21:20:13.031129	2017-02-05 21:20:13.031129
756	Illizi	33	62	2017-02-05 21:20:13.035513	2017-02-05 21:20:13.035513
757	Bordj Bou Arréridj	34	62	2017-02-05 21:20:13.041008	2017-02-05 21:20:13.041008
758	Boumerdès	35	62	2017-02-05 21:20:13.04808	2017-02-05 21:20:13.04808
759	El Tarf	36	62	2017-02-05 21:20:13.055189	2017-02-05 21:20:13.055189
760	Tindouf	37	62	2017-02-05 21:20:13.061938	2017-02-05 21:20:13.061938
761	Tissemsilt	38	62	2017-02-05 21:20:13.068644	2017-02-05 21:20:13.068644
762	El Oued	39	62	2017-02-05 21:20:13.075066	2017-02-05 21:20:13.075066
763	Khenchela	40	62	2017-02-05 21:20:13.081311	2017-02-05 21:20:13.081311
764	Souk Ahras	41	62	2017-02-05 21:20:13.088543	2017-02-05 21:20:13.088543
765	Tipaza	42	62	2017-02-05 21:20:13.09471	2017-02-05 21:20:13.09471
766	Mila	43	62	2017-02-05 21:20:13.101202	2017-02-05 21:20:13.101202
767	Aïn Defla	44	62	2017-02-05 21:20:13.108151	2017-02-05 21:20:13.108151
768	Naama	45	62	2017-02-05 21:20:13.115969	2017-02-05 21:20:13.115969
769	Aïn Témouchent	46	62	2017-02-05 21:20:13.124559	2017-02-05 21:20:13.124559
770	Ghardaïa	47	62	2017-02-05 21:20:13.132008	2017-02-05 21:20:13.132008
771	Relizane	48	62	2017-02-05 21:20:13.139492	2017-02-05 21:20:13.139492
772	Azuay	A	63	2017-02-05 21:20:13.145726	2017-02-05 21:20:13.145726
773	Bolívar	B	63	2017-02-05 21:20:13.156055	2017-02-05 21:20:13.156055
774	Carchi	C	63	2017-02-05 21:20:13.166405	2017-02-05 21:20:13.166405
775	Orellana	D	63	2017-02-05 21:20:13.175416	2017-02-05 21:20:13.175416
776	Esmeraldas	E	63	2017-02-05 21:20:13.18326	2017-02-05 21:20:13.18326
777	Cañar	F	63	2017-02-05 21:20:13.188969	2017-02-05 21:20:13.188969
778	Guayas	G	63	2017-02-05 21:20:13.19599	2017-02-05 21:20:13.19599
779	Chimborazo	H	63	2017-02-05 21:20:13.204876	2017-02-05 21:20:13.204876
780	Imbabura	I	63	2017-02-05 21:20:13.215745	2017-02-05 21:20:13.215745
781	Loja	L	63	2017-02-05 21:20:13.225236	2017-02-05 21:20:13.225236
782	Manabí	M	63	2017-02-05 21:20:13.23547	2017-02-05 21:20:13.23547
783	Napo	N	63	2017-02-05 21:20:13.244433	2017-02-05 21:20:13.244433
784	El Oro	O	63	2017-02-05 21:20:13.255162	2017-02-05 21:20:13.255162
785	Pichincha	P	63	2017-02-05 21:20:13.263813	2017-02-05 21:20:13.263813
786	Los Ríos	R	63	2017-02-05 21:20:13.272984	2017-02-05 21:20:13.272984
787	Morona-Santiago	S	63	2017-02-05 21:20:13.281433	2017-02-05 21:20:13.281433
788	Santo Domingo de los Tsáchilas	SD	63	2017-02-05 21:20:13.288724	2017-02-05 21:20:13.288724
789	Santa Elena	SE	63	2017-02-05 21:20:13.296609	2017-02-05 21:20:13.296609
790	Tungurahua	T	63	2017-02-05 21:20:13.306756	2017-02-05 21:20:13.306756
791	Sucumbíos	U	63	2017-02-05 21:20:13.313574	2017-02-05 21:20:13.313574
792	Galápagos	W	63	2017-02-05 21:20:13.321966	2017-02-05 21:20:13.321966
793	Cotopaxi	X	63	2017-02-05 21:20:13.333155	2017-02-05 21:20:13.333155
794	Pastaza	Y	63	2017-02-05 21:20:13.34359	2017-02-05 21:20:13.34359
795	Zamora-Chinchipe	Z	63	2017-02-05 21:20:13.353865	2017-02-05 21:20:13.353865
796	Harjumaa	37	64	2017-02-05 21:20:13.364477	2017-02-05 21:20:13.364477
797	Hiiumaa	39	64	2017-02-05 21:20:13.374316	2017-02-05 21:20:13.374316
798	Ida-Virumaa	44	64	2017-02-05 21:20:13.384708	2017-02-05 21:20:13.384708
799	Jõgevamaa	49	64	2017-02-05 21:20:13.394519	2017-02-05 21:20:13.394519
800	Järvamaa	51	64	2017-02-05 21:20:13.403732	2017-02-05 21:20:13.403732
801	Läänemaa	57	64	2017-02-05 21:20:13.411906	2017-02-05 21:20:13.411906
802	Lääne-Virumaa	59	64	2017-02-05 21:20:13.419659	2017-02-05 21:20:13.419659
803	Põlvamaa	65	64	2017-02-05 21:20:13.428065	2017-02-05 21:20:13.428065
804	Pärnumaa	67	64	2017-02-05 21:20:13.436548	2017-02-05 21:20:13.436548
805	Raplamaa	70	64	2017-02-05 21:20:13.444896	2017-02-05 21:20:13.444896
806	Saaremaa	74	64	2017-02-05 21:20:13.453528	2017-02-05 21:20:13.453528
807	Tartumaa	78	64	2017-02-05 21:20:13.461501	2017-02-05 21:20:13.461501
808	Valgamaa	82	64	2017-02-05 21:20:13.471305	2017-02-05 21:20:13.471305
809	Viljandimaa	84	64	2017-02-05 21:20:13.480653	2017-02-05 21:20:13.480653
810	Võrumaa	86	64	2017-02-05 21:20:13.48996	2017-02-05 21:20:13.48996
811	Al Iskandarīyah	ALX	65	2017-02-05 21:20:13.499612	2017-02-05 21:20:13.499612
812	Aswān	ASN	65	2017-02-05 21:20:13.507402	2017-02-05 21:20:13.507402
813	Asyūt	AST	65	2017-02-05 21:20:13.513673	2017-02-05 21:20:13.513673
814	Al Bahr al Ahmar	BA	65	2017-02-05 21:20:13.522629	2017-02-05 21:20:13.522629
815	Al Buhayrah	BH	65	2017-02-05 21:20:13.529892	2017-02-05 21:20:13.529892
816	Banī Suwayf	BNS	65	2017-02-05 21:20:13.537566	2017-02-05 21:20:13.537566
817	Al Qāhirah	C	65	2017-02-05 21:20:13.546409	2017-02-05 21:20:13.546409
818	Ad Daqahlīyah	DK	65	2017-02-05 21:20:13.553605	2017-02-05 21:20:13.553605
819	Dumyāt	DT	65	2017-02-05 21:20:13.562059	2017-02-05 21:20:13.562059
820	Al Fayyūm	FYM	65	2017-02-05 21:20:13.569417	2017-02-05 21:20:13.569417
821	Al Gharbīyah	GH	65	2017-02-05 21:20:13.596706	2017-02-05 21:20:13.596706
822	Al Jīzah	GZ	65	2017-02-05 21:20:13.630955	2017-02-05 21:20:13.630955
823	Ḩulwān	HU	65	2017-02-05 21:20:13.6713	2017-02-05 21:20:13.6713
824	Al Ismā`īlīyah	IS	65	2017-02-05 21:20:13.698367	2017-02-05 21:20:13.698367
825	Janūb Sīnā'	JS	65	2017-02-05 21:20:13.731156	2017-02-05 21:20:13.731156
826	Al Qalyūbīyah	KB	65	2017-02-05 21:20:13.757304	2017-02-05 21:20:13.757304
827	Kafr ash Shaykh	KFS	65	2017-02-05 21:20:13.781861	2017-02-05 21:20:13.781861
828	Qinā	KN	65	2017-02-05 21:20:13.814616	2017-02-05 21:20:13.814616
829	Al Minyā	MN	65	2017-02-05 21:20:13.843825	2017-02-05 21:20:13.843825
830	Al Minūfīyah	MNF	65	2017-02-05 21:20:13.872965	2017-02-05 21:20:13.872965
831	Matrūh	MT	65	2017-02-05 21:20:13.880563	2017-02-05 21:20:13.880563
832	Būr Sa`īd	PTS	65	2017-02-05 21:20:13.887243	2017-02-05 21:20:13.887243
833	Sūhāj	SHG	65	2017-02-05 21:20:13.894224	2017-02-05 21:20:13.894224
834	Ash Sharqīyah	SHR	65	2017-02-05 21:20:13.899949	2017-02-05 21:20:13.899949
835	Shamal Sīnā'	SIN	65	2017-02-05 21:20:13.906422	2017-02-05 21:20:13.906422
836	As Sādis min Uktūbar	SU	65	2017-02-05 21:20:13.912774	2017-02-05 21:20:13.912774
837	As Suways	SUZ	65	2017-02-05 21:20:13.917194	2017-02-05 21:20:13.917194
838	Al Wādī al Jadīd	WAD	65	2017-02-05 21:20:13.922066	2017-02-05 21:20:13.922066
839	Ansabā	AN	67	2017-02-05 21:20:13.927476	2017-02-05 21:20:13.927476
840	Janūbī al Baḩrī al Aḩmar	DK	67	2017-02-05 21:20:13.934189	2017-02-05 21:20:13.934189
841	Al Janūbī	DU	67	2017-02-05 21:20:13.941212	2017-02-05 21:20:13.941212
842	Qāsh-Barkah	GB	67	2017-02-05 21:20:13.948198	2017-02-05 21:20:13.948198
843	Al Awsaţ	MA	67	2017-02-05 21:20:13.953656	2017-02-05 21:20:13.953656
844	Shimālī al Baḩrī al Aḩmar	SK	67	2017-02-05 21:20:13.958682	2017-02-05 21:20:13.958682
845	Andalucía	AN	68	2017-02-05 21:20:13.964297	2017-02-05 21:20:13.964297
846	Aragón	AR	68	2017-02-05 21:20:13.969391	2017-02-05 21:20:13.969391
847	Asturias, Principado de	AS	68	2017-02-05 21:20:13.975287	2017-02-05 21:20:13.975287
848	Cantabria	CB	68	2017-02-05 21:20:13.980467	2017-02-05 21:20:13.980467
849	Ceuta	CE	68	2017-02-05 21:20:13.984852	2017-02-05 21:20:13.984852
850	Castilla y León	CL	68	2017-02-05 21:20:13.990014	2017-02-05 21:20:13.990014
851	Castilla-La Mancha	CM	68	2017-02-05 21:20:13.99534	2017-02-05 21:20:13.99534
852	Canarias	CN	68	2017-02-05 21:20:13.999835	2017-02-05 21:20:13.999835
853	Catalunya	CT	68	2017-02-05 21:20:14.004878	2017-02-05 21:20:14.004878
854	Extremadura	EX	68	2017-02-05 21:20:14.010752	2017-02-05 21:20:14.010752
855	Galicia	GA	68	2017-02-05 21:20:14.016255	2017-02-05 21:20:14.016255
856	Illes Balears	IB	68	2017-02-05 21:20:14.021066	2017-02-05 21:20:14.021066
857	Murcia, Región de	MC	68	2017-02-05 21:20:14.025654	2017-02-05 21:20:14.025654
858	Madrid, Comunidad de	MD	68	2017-02-05 21:20:14.029911	2017-02-05 21:20:14.029911
859	Melilla	ML	68	2017-02-05 21:20:14.034907	2017-02-05 21:20:14.034907
860	Navarra, Comunidad Foral de / Nafarroako Foru Komunitatea	NC	68	2017-02-05 21:20:14.039404	2017-02-05 21:20:14.039404
861	País Vasco / Euskal Herria	PV	68	2017-02-05 21:20:14.044812	2017-02-05 21:20:14.044812
862	La Rioja	RI	68	2017-02-05 21:20:14.064246	2017-02-05 21:20:14.064246
863	Valenciana, Comunidad / Valenciana, Comunitat 	VC	68	2017-02-05 21:20:14.071549	2017-02-05 21:20:14.071549
864	Ādīs Ābeba	AA	69	2017-02-05 21:20:14.080862	2017-02-05 21:20:14.080862
865	Āfar	AF	69	2017-02-05 21:20:14.090147	2017-02-05 21:20:14.090147
866	Āmara	AM	69	2017-02-05 21:20:14.105253	2017-02-05 21:20:14.105253
867	Bīnshangul Gumuz	BE	69	2017-02-05 21:20:14.116058	2017-02-05 21:20:14.116058
868	Dirē Dawa	DD	69	2017-02-05 21:20:14.126649	2017-02-05 21:20:14.126649
869	Gambēla Hizboch	GA	69	2017-02-05 21:20:14.135574	2017-02-05 21:20:14.135574
870	Hārerī Hizb	HA	69	2017-02-05 21:20:14.143792	2017-02-05 21:20:14.143792
871	Oromīya	OR	69	2017-02-05 21:20:14.151449	2017-02-05 21:20:14.151449
872	YeDebub Bihēroch Bihēreseboch na Hizboch	SN	69	2017-02-05 21:20:14.15826	2017-02-05 21:20:14.15826
873	Sumalē	SO	69	2017-02-05 21:20:14.165907	2017-02-05 21:20:14.165907
874	Tigray	TI	69	2017-02-05 21:20:14.174378	2017-02-05 21:20:14.174378
875	Ahvenanmaan maakunta	01	70	2017-02-05 21:20:14.184168	2017-02-05 21:20:14.184168
876	Etelä-Karjala	02	70	2017-02-05 21:20:14.195805	2017-02-05 21:20:14.195805
877	Etelä-Pohjanmaa	03	70	2017-02-05 21:20:14.204712	2017-02-05 21:20:14.204712
878	Etelä-Savo	04	70	2017-02-05 21:20:14.212391	2017-02-05 21:20:14.212391
879	Kainuu	05	70	2017-02-05 21:20:14.218553	2017-02-05 21:20:14.218553
880	Kanta-Häme	06	70	2017-02-05 21:20:14.225097	2017-02-05 21:20:14.225097
881	Keski-Pohjanmaa	07	70	2017-02-05 21:20:14.232762	2017-02-05 21:20:14.232762
882	Keski-Suomi	08	70	2017-02-05 21:20:14.240251	2017-02-05 21:20:14.240251
883	Kymenlaakso	09	70	2017-02-05 21:20:14.246355	2017-02-05 21:20:14.246355
884	Lappi	10	70	2017-02-05 21:20:14.252424	2017-02-05 21:20:14.252424
885	Pirkanmaa	11	70	2017-02-05 21:20:14.258445	2017-02-05 21:20:14.258445
886	Pohjanmaa	12	70	2017-02-05 21:20:14.264685	2017-02-05 21:20:14.264685
887	Pohjois-Karjala	13	70	2017-02-05 21:20:14.271142	2017-02-05 21:20:14.271142
888	Pohjois-Pohjanmaa	14	70	2017-02-05 21:20:14.276821	2017-02-05 21:20:14.276821
889	Pohjois-Savo	15	70	2017-02-05 21:20:14.282229	2017-02-05 21:20:14.282229
890	Päijät-Häme	16	70	2017-02-05 21:20:14.287631	2017-02-05 21:20:14.287631
891	Satakunta	17	70	2017-02-05 21:20:14.2926	2017-02-05 21:20:14.2926
892	Uusimaa	18	70	2017-02-05 21:20:14.2986	2017-02-05 21:20:14.2986
893	Varsinais-Suomi	19	70	2017-02-05 21:20:14.305946	2017-02-05 21:20:14.305946
894	Central	C	71	2017-02-05 21:20:14.313512	2017-02-05 21:20:14.313512
895	Eastern	E	71	2017-02-05 21:20:14.32166	2017-02-05 21:20:14.32166
896	Northern	N	71	2017-02-05 21:20:14.32692	2017-02-05 21:20:14.32692
897	Rotuma	R	71	2017-02-05 21:20:14.332197	2017-02-05 21:20:14.332197
898	Western	W	71	2017-02-05 21:20:14.337182	2017-02-05 21:20:14.337182
899	Kosrae	KSA	73	2017-02-05 21:20:14.34298	2017-02-05 21:20:14.34298
900	Pohnpei	PNI	73	2017-02-05 21:20:14.347911	2017-02-05 21:20:14.347911
901	Chuuk	TRK	73	2017-02-05 21:20:14.354409	2017-02-05 21:20:14.354409
902	Yap	YAP	73	2017-02-05 21:20:14.359969	2017-02-05 21:20:14.359969
903	Alsace	A	75	2017-02-05 21:20:14.366685	2017-02-05 21:20:14.366685
904	Aquitaine	B	75	2017-02-05 21:20:14.373518	2017-02-05 21:20:14.373518
905	Saint-Barthélemy	BL	75	2017-02-05 21:20:14.380223	2017-02-05 21:20:14.380223
906	Auvergne	C	75	2017-02-05 21:20:14.385179	2017-02-05 21:20:14.385179
907	Clipperton	CP	75	2017-02-05 21:20:14.390511	2017-02-05 21:20:14.390511
908	Bourgogne	D	75	2017-02-05 21:20:14.396712	2017-02-05 21:20:14.396712
909	Bretagne	E	75	2017-02-05 21:20:14.401702	2017-02-05 21:20:14.401702
910	Centre	F	75	2017-02-05 21:20:14.406666	2017-02-05 21:20:14.406666
911	Champagne-Ardenne	G	75	2017-02-05 21:20:14.4129	2017-02-05 21:20:14.4129
912	Guyane	GF	75	2017-02-05 21:20:14.417747	2017-02-05 21:20:14.417747
913	Guadeloupe	GP	75	2017-02-05 21:20:14.422433	2017-02-05 21:20:14.422433
914	Corse	H	75	2017-02-05 21:20:14.427294	2017-02-05 21:20:14.427294
915	Franche-Comté	I	75	2017-02-05 21:20:14.432462	2017-02-05 21:20:14.432462
916	Île-de-France	J	75	2017-02-05 21:20:14.440242	2017-02-05 21:20:14.440242
917	Languedoc-Roussillon	K	75	2017-02-05 21:20:14.44613	2017-02-05 21:20:14.44613
918	Limousin	L	75	2017-02-05 21:20:14.452462	2017-02-05 21:20:14.452462
919	Lorraine	M	75	2017-02-05 21:20:14.457826	2017-02-05 21:20:14.457826
920	Saint-Martin	MF	75	2017-02-05 21:20:14.463445	2017-02-05 21:20:14.463445
921	Martinique	MQ	75	2017-02-05 21:20:14.469542	2017-02-05 21:20:14.469542
922	Midi-Pyrénées	N	75	2017-02-05 21:20:14.477722	2017-02-05 21:20:14.477722
923	Nouvelle-Calédonie	NC	75	2017-02-05 21:20:14.485766	2017-02-05 21:20:14.485766
924	Nord-Pas-de-Calais	O	75	2017-02-05 21:20:14.493293	2017-02-05 21:20:14.493293
925	Basse-Normandie	P	75	2017-02-05 21:20:14.499973	2017-02-05 21:20:14.499973
926	Polynésie française	PF	75	2017-02-05 21:20:14.505628	2017-02-05 21:20:14.505628
927	Saint-Pierre-et-Miquelon	PM	75	2017-02-05 21:20:14.511256	2017-02-05 21:20:14.511256
928	Haute-Normandie	Q	75	2017-02-05 21:20:14.516531	2017-02-05 21:20:14.516531
929	Pays de la Loire	R	75	2017-02-05 21:20:14.522018	2017-02-05 21:20:14.522018
930	La Réunion	RE	75	2017-02-05 21:20:14.527723	2017-02-05 21:20:14.527723
931	Picardie	S	75	2017-02-05 21:20:14.533291	2017-02-05 21:20:14.533291
932	Poitou-Charentes	T	75	2017-02-05 21:20:14.539245	2017-02-05 21:20:14.539245
933	Terres australes françaises	TF	75	2017-02-05 21:20:14.559578	2017-02-05 21:20:14.559578
934	Provence-Alpes-Côte d'Azur	U	75	2017-02-05 21:20:14.582466	2017-02-05 21:20:14.582466
935	Rhône-Alpes	V	75	2017-02-05 21:20:14.609584	2017-02-05 21:20:14.609584
936	Wallis-et-Futuna	WF	75	2017-02-05 21:20:14.62994	2017-02-05 21:20:14.62994
937	Mayotte	YT	75	2017-02-05 21:20:14.65043	2017-02-05 21:20:14.65043
938	Estuaire	1	76	2017-02-05 21:20:14.668317	2017-02-05 21:20:14.668317
939	Haut-Ogooué	2	76	2017-02-05 21:20:14.686013	2017-02-05 21:20:14.686013
940	Moyen-Ogooué	3	76	2017-02-05 21:20:14.708525	2017-02-05 21:20:14.708525
941	Ngounié	4	76	2017-02-05 21:20:14.737225	2017-02-05 21:20:14.737225
942	Nyanga	5	76	2017-02-05 21:20:14.766635	2017-02-05 21:20:14.766635
943	Ogooué-Ivindo	6	76	2017-02-05 21:20:14.787293	2017-02-05 21:20:14.787293
944	Ogooué-Lolo	7	76	2017-02-05 21:20:14.809299	2017-02-05 21:20:14.809299
945	Ogooué-Maritime	8	76	2017-02-05 21:20:14.833728	2017-02-05 21:20:14.833728
946	Woleu-Ntem	9	76	2017-02-05 21:20:14.851198	2017-02-05 21:20:14.851198
947	Aberdeenshire	ABD	77	2017-02-05 21:20:14.857881	2017-02-05 21:20:14.857881
948	Aberdeen City	ABE	77	2017-02-05 21:20:14.862701	2017-02-05 21:20:14.862701
949	Argyll and Bute	AGB	77	2017-02-05 21:20:14.86845	2017-02-05 21:20:14.86845
950	Isle of Anglesey;Sir Ynys Môn	AGY	77	2017-02-05 21:20:14.874256	2017-02-05 21:20:14.874256
951	Angus	ANS	77	2017-02-05 21:20:14.880526	2017-02-05 21:20:14.880526
952	Antrim	ANT	77	2017-02-05 21:20:14.887038	2017-02-05 21:20:14.887038
953	Ards	ARD	77	2017-02-05 21:20:14.892362	2017-02-05 21:20:14.892362
954	Armagh	ARM	77	2017-02-05 21:20:14.898353	2017-02-05 21:20:14.898353
955	Bath and North East Somerset	BAS	77	2017-02-05 21:20:14.905513	2017-02-05 21:20:14.905513
956	Blackburn with Darwen	BBD	77	2017-02-05 21:20:14.913662	2017-02-05 21:20:14.913662
957	Bedford	BDF	77	2017-02-05 21:20:14.921354	2017-02-05 21:20:14.921354
958	Barking and Dagenham	BDG	77	2017-02-05 21:20:14.927644	2017-02-05 21:20:14.927644
959	Brent	BEN	77	2017-02-05 21:20:14.934407	2017-02-05 21:20:14.934407
960	Bexley	BEX	77	2017-02-05 21:20:14.940395	2017-02-05 21:20:14.940395
961	Belfast	BFS	77	2017-02-05 21:20:14.94661	2017-02-05 21:20:14.94661
962	Bridgend;Pen-y-bont ar Ogwr	BGE	77	2017-02-05 21:20:14.951879	2017-02-05 21:20:14.951879
963	Blaenau Gwent	BGW	77	2017-02-05 21:20:14.957171	2017-02-05 21:20:14.957171
964	Birmingham	BIR	77	2017-02-05 21:20:14.962746	2017-02-05 21:20:14.962746
965	Buckinghamshire	BKM	77	2017-02-05 21:20:14.968766	2017-02-05 21:20:14.968766
966	Ballymena	BLA	77	2017-02-05 21:20:14.97462	2017-02-05 21:20:14.97462
967	Ballymoney	BLY	77	2017-02-05 21:20:14.981302	2017-02-05 21:20:14.981302
968	Bournemouth	BMH	77	2017-02-05 21:20:14.987881	2017-02-05 21:20:14.987881
969	Banbridge	BNB	77	2017-02-05 21:20:14.9938	2017-02-05 21:20:14.9938
970	Barnet	BNE	77	2017-02-05 21:20:14.99963	2017-02-05 21:20:14.99963
971	Brighton and Hove	BNH	77	2017-02-05 21:20:15.00451	2017-02-05 21:20:15.00451
972	Barnsley	BNS	77	2017-02-05 21:20:15.010127	2017-02-05 21:20:15.010127
973	Bolton	BOL	77	2017-02-05 21:20:15.015465	2017-02-05 21:20:15.015465
974	Blackpool	BPL	77	2017-02-05 21:20:15.02006	2017-02-05 21:20:15.02006
975	Bracknell Forest	BRC	77	2017-02-05 21:20:15.02432	2017-02-05 21:20:15.02432
976	Bradford	BRD	77	2017-02-05 21:20:15.02863	2017-02-05 21:20:15.02863
977	Bromley	BRY	77	2017-02-05 21:20:15.033223	2017-02-05 21:20:15.033223
978	Bristol, City of	BST	77	2017-02-05 21:20:15.037807	2017-02-05 21:20:15.037807
979	Bury	BUR	77	2017-02-05 21:20:15.045069	2017-02-05 21:20:15.045069
980	Cambridgeshire	CAM	77	2017-02-05 21:20:15.053755	2017-02-05 21:20:15.053755
981	Caerphilly;Caerffili	CAY	77	2017-02-05 21:20:15.062264	2017-02-05 21:20:15.062264
982	Central Bedfordshire	CBF	77	2017-02-05 21:20:15.07017	2017-02-05 21:20:15.07017
983	Ceredigion;Sir Ceredigion	CGN	77	2017-02-05 21:20:15.077113	2017-02-05 21:20:15.077113
984	Craigavon	CGV	77	2017-02-05 21:20:15.085633	2017-02-05 21:20:15.085633
985	Cheshire East	CHE	77	2017-02-05 21:20:15.094334	2017-02-05 21:20:15.094334
986	Cheshire West and Chester	CHW	77	2017-02-05 21:20:15.102898	2017-02-05 21:20:15.102898
987	Carrickfergus	CKF	77	2017-02-05 21:20:15.111651	2017-02-05 21:20:15.111651
988	Cookstown	CKT	77	2017-02-05 21:20:15.120846	2017-02-05 21:20:15.120846
989	Calderdale	CLD	77	2017-02-05 21:20:15.127428	2017-02-05 21:20:15.127428
990	Clackmannanshire	CLK	77	2017-02-05 21:20:15.133112	2017-02-05 21:20:15.133112
991	Coleraine	CLR	77	2017-02-05 21:20:15.138778	2017-02-05 21:20:15.138778
992	Cumbria	CMA	77	2017-02-05 21:20:15.14537	2017-02-05 21:20:15.14537
993	Camden	CMD	77	2017-02-05 21:20:15.153559	2017-02-05 21:20:15.153559
994	Carmarthenshire;Sir Gaerfyrddin	CMN	77	2017-02-05 21:20:15.159633	2017-02-05 21:20:15.159633
995	Cornwall	CON	77	2017-02-05 21:20:15.165851	2017-02-05 21:20:15.165851
996	Coventry	COV	77	2017-02-05 21:20:15.173488	2017-02-05 21:20:15.173488
997	Cardiff;Caerdydd	CRF	77	2017-02-05 21:20:15.180406	2017-02-05 21:20:15.180406
998	Croydon	CRY	77	2017-02-05 21:20:15.186634	2017-02-05 21:20:15.186634
999	Castlereagh	CSR	77	2017-02-05 21:20:15.194395	2017-02-05 21:20:15.194395
1000	Conwy	CWY	77	2017-02-05 21:20:15.201892	2017-02-05 21:20:15.201892
1001	Darlington	DAL	77	2017-02-05 21:20:15.208386	2017-02-05 21:20:15.208386
1002	Derbyshire	DBY	77	2017-02-05 21:20:15.21411	2017-02-05 21:20:15.21411
1003	Denbighshire;Sir Ddinbych	DEN	77	2017-02-05 21:20:15.220577	2017-02-05 21:20:15.220577
1004	Derby	DER	77	2017-02-05 21:20:15.227314	2017-02-05 21:20:15.227314
1005	Devon	DEV	77	2017-02-05 21:20:15.234378	2017-02-05 21:20:15.234378
1006	Dungannon and South Tyrone	DGN	77	2017-02-05 21:20:15.242196	2017-02-05 21:20:15.242196
1007	Dumfries and Galloway	DGY	77	2017-02-05 21:20:15.250206	2017-02-05 21:20:15.250206
1008	Doncaster	DNC	77	2017-02-05 21:20:15.259744	2017-02-05 21:20:15.259744
1009	Dundee City	DND	77	2017-02-05 21:20:15.2693	2017-02-05 21:20:15.2693
1010	Dorset	DOR	77	2017-02-05 21:20:15.277898	2017-02-05 21:20:15.277898
1011	Down	DOW	77	2017-02-05 21:20:15.288442	2017-02-05 21:20:15.288442
1012	Derry	DRY	77	2017-02-05 21:20:15.299924	2017-02-05 21:20:15.299924
1013	Dudley	DUD	77	2017-02-05 21:20:15.312489	2017-02-05 21:20:15.312489
1014	Durham, County	DUR	77	2017-02-05 21:20:15.322018	2017-02-05 21:20:15.322018
1015	Ealing	EAL	77	2017-02-05 21:20:15.331249	2017-02-05 21:20:15.331249
1016	England and Wales	EAW	77	2017-02-05 21:20:15.341325	2017-02-05 21:20:15.341325
1017	East Ayrshire	EAY	77	2017-02-05 21:20:15.350194	2017-02-05 21:20:15.350194
1018	Edinburgh, City of	EDH	77	2017-02-05 21:20:15.358802	2017-02-05 21:20:15.358802
1019	East Dunbartonshire	EDU	77	2017-02-05 21:20:15.36734	2017-02-05 21:20:15.36734
1020	East Lothian	ELN	77	2017-02-05 21:20:15.37619	2017-02-05 21:20:15.37619
1021	Eilean Siar	ELS	77	2017-02-05 21:20:15.384248	2017-02-05 21:20:15.384248
1022	Enfield	ENF	77	2017-02-05 21:20:15.392838	2017-02-05 21:20:15.392838
1023	England	ENG	77	2017-02-05 21:20:15.401884	2017-02-05 21:20:15.401884
1024	East Renfrewshire	ERW	77	2017-02-05 21:20:15.409484	2017-02-05 21:20:15.409484
1025	East Riding of Yorkshire	ERY	77	2017-02-05 21:20:15.417833	2017-02-05 21:20:15.417833
1026	Essex	ESS	77	2017-02-05 21:20:15.426478	2017-02-05 21:20:15.426478
1027	East Sussex	ESX	77	2017-02-05 21:20:15.433458	2017-02-05 21:20:15.433458
1028	Falkirk	FAL	77	2017-02-05 21:20:15.439602	2017-02-05 21:20:15.439602
1029	Fermanagh	FER	77	2017-02-05 21:20:15.448816	2017-02-05 21:20:15.448816
1030	Fife	FIF	77	2017-02-05 21:20:15.458387	2017-02-05 21:20:15.458387
1031	Flintshire;Sir y Fflint	FLN	77	2017-02-05 21:20:15.467488	2017-02-05 21:20:15.467488
1032	Gateshead	GAT	77	2017-02-05 21:20:15.475432	2017-02-05 21:20:15.475432
1033	Great Britain	GBN	77	2017-02-05 21:20:15.486623	2017-02-05 21:20:15.486623
1034	Glasgow City	GLG	77	2017-02-05 21:20:15.495969	2017-02-05 21:20:15.495969
1035	Gloucestershire	GLS	77	2017-02-05 21:20:15.505407	2017-02-05 21:20:15.505407
1036	Greenwich	GRE	77	2017-02-05 21:20:15.513436	2017-02-05 21:20:15.513436
1037	Gwynedd	GWN	77	2017-02-05 21:20:15.52221	2017-02-05 21:20:15.52221
1038	Halton	HAL	77	2017-02-05 21:20:15.532042	2017-02-05 21:20:15.532042
1039	Hampshire	HAM	77	2017-02-05 21:20:15.541837	2017-02-05 21:20:15.541837
1040	Havering	HAV	77	2017-02-05 21:20:15.551114	2017-02-05 21:20:15.551114
1041	Hackney	HCK	77	2017-02-05 21:20:15.559476	2017-02-05 21:20:15.559476
1042	Herefordshire	HEF	77	2017-02-05 21:20:15.569375	2017-02-05 21:20:15.569375
1043	Hillingdon	HIL	77	2017-02-05 21:20:15.576346	2017-02-05 21:20:15.576346
1044	Highland	HLD	77	2017-02-05 21:20:15.583199	2017-02-05 21:20:15.583199
1045	Hammersmith and Fulham	HMF	77	2017-02-05 21:20:15.594397	2017-02-05 21:20:15.594397
1046	Hounslow	HNS	77	2017-02-05 21:20:15.615624	2017-02-05 21:20:15.615624
1047	Hartlepool	HPL	77	2017-02-05 21:20:15.645033	2017-02-05 21:20:15.645033
1048	Hertfordshire	HRT	77	2017-02-05 21:20:15.665382	2017-02-05 21:20:15.665382
1049	Harrow	HRW	77	2017-02-05 21:20:15.685156	2017-02-05 21:20:15.685156
1050	Haringey	HRY	77	2017-02-05 21:20:15.715254	2017-02-05 21:20:15.715254
1051	Isle of Wight	IOW	77	2017-02-05 21:20:15.747517	2017-02-05 21:20:15.747517
1052	Islington	ISL	77	2017-02-05 21:20:15.781528	2017-02-05 21:20:15.781528
1053	Inverclyde	IVC	77	2017-02-05 21:20:15.792792	2017-02-05 21:20:15.792792
1054	Kensington and Chelsea	KEC	77	2017-02-05 21:20:15.798271	2017-02-05 21:20:15.798271
1055	Kent	KEN	77	2017-02-05 21:20:15.805696	2017-02-05 21:20:15.805696
1056	Kingston upon Hull	KHL	77	2017-02-05 21:20:15.810729	2017-02-05 21:20:15.810729
1057	Kirklees	KIR	77	2017-02-05 21:20:15.815939	2017-02-05 21:20:15.815939
1058	Kingston upon Thames	KTT	77	2017-02-05 21:20:15.820357	2017-02-05 21:20:15.820357
1059	Knowsley	KWL	77	2017-02-05 21:20:15.826039	2017-02-05 21:20:15.826039
1060	Lancashire	LAN	77	2017-02-05 21:20:15.833278	2017-02-05 21:20:15.833278
1061	Lambeth	LBH	77	2017-02-05 21:20:15.840498	2017-02-05 21:20:15.840498
1062	Leicester	LCE	77	2017-02-05 21:20:15.845925	2017-02-05 21:20:15.845925
1063	Leeds	LDS	77	2017-02-05 21:20:15.851095	2017-02-05 21:20:15.851095
1064	Leicestershire	LEC	77	2017-02-05 21:20:15.857117	2017-02-05 21:20:15.857117
1065	Lewisham	LEW	77	2017-02-05 21:20:15.8644	2017-02-05 21:20:15.8644
1066	Lincolnshire	LIN	77	2017-02-05 21:20:15.871539	2017-02-05 21:20:15.871539
1067	Liverpool	LIV	77	2017-02-05 21:20:15.876521	2017-02-05 21:20:15.876521
1068	Limavady	LMV	77	2017-02-05 21:20:15.882695	2017-02-05 21:20:15.882695
1069	London, City of	LND	77	2017-02-05 21:20:15.887413	2017-02-05 21:20:15.887413
1070	Larne	LRN	77	2017-02-05 21:20:15.891932	2017-02-05 21:20:15.891932
1071	Lisburn	LSB	77	2017-02-05 21:20:15.896633	2017-02-05 21:20:15.896633
1072	Luton	LUT	77	2017-02-05 21:20:15.902707	2017-02-05 21:20:15.902707
1073	Manchester	MAN	77	2017-02-05 21:20:15.910782	2017-02-05 21:20:15.910782
1074	Middlesbrough	MDB	77	2017-02-05 21:20:15.917041	2017-02-05 21:20:15.917041
1075	Medway	MDW	77	2017-02-05 21:20:15.923611	2017-02-05 21:20:15.923611
1076	Magherafelt	MFT	77	2017-02-05 21:20:15.929366	2017-02-05 21:20:15.929366
1077	Milton Keynes	MIK	77	2017-02-05 21:20:15.934023	2017-02-05 21:20:15.934023
1078	Midlothian	MLN	77	2017-02-05 21:20:15.938755	2017-02-05 21:20:15.938755
1079	Monmouthshire;Sir Fynwy	MON	77	2017-02-05 21:20:15.945068	2017-02-05 21:20:15.945068
1080	Merton	MRT	77	2017-02-05 21:20:15.94978	2017-02-05 21:20:15.94978
1081	Moray	MRY	77	2017-02-05 21:20:15.954488	2017-02-05 21:20:15.954488
1082	Merthyr Tydfil;Merthyr Tudful	MTY	77	2017-02-05 21:20:15.959637	2017-02-05 21:20:15.959637
1083	Moyle	MYL	77	2017-02-05 21:20:15.966722	2017-02-05 21:20:15.966722
1084	North Ayrshire	NAY	77	2017-02-05 21:20:15.973336	2017-02-05 21:20:15.973336
1085	Northumberland	NBL	77	2017-02-05 21:20:15.980942	2017-02-05 21:20:15.980942
1086	North Down	NDN	77	2017-02-05 21:20:15.986911	2017-02-05 21:20:15.986911
1087	North East Lincolnshire	NEL	77	2017-02-05 21:20:15.992444	2017-02-05 21:20:15.992444
1088	Newcastle upon Tyne	NET	77	2017-02-05 21:20:15.997094	2017-02-05 21:20:15.997094
1089	Norfolk	NFK	77	2017-02-05 21:20:16.002056	2017-02-05 21:20:16.002056
1090	Nottingham	NGM	77	2017-02-05 21:20:16.006386	2017-02-05 21:20:16.006386
1091	Northern Ireland	NIR	77	2017-02-05 21:20:16.010764	2017-02-05 21:20:16.010764
1092	North Lanarkshire	NLK	77	2017-02-05 21:20:16.01517	2017-02-05 21:20:16.01517
1093	North Lincolnshire	NLN	77	2017-02-05 21:20:16.01966	2017-02-05 21:20:16.01966
1094	North Somerset	NSM	77	2017-02-05 21:20:16.024647	2017-02-05 21:20:16.024647
1095	Newtownabbey	NTA	77	2017-02-05 21:20:16.030468	2017-02-05 21:20:16.030468
1096	Northamptonshire	NTH	77	2017-02-05 21:20:16.036345	2017-02-05 21:20:16.036345
1097	Neath Port Talbot;Castell-nedd Port Talbot	NTL	77	2017-02-05 21:20:16.041138	2017-02-05 21:20:16.041138
1098	Nottinghamshire	NTT	77	2017-02-05 21:20:16.04784	2017-02-05 21:20:16.04784
1099	North Tyneside	NTY	77	2017-02-05 21:20:16.05599	2017-02-05 21:20:16.05599
1100	Newham	NWM	77	2017-02-05 21:20:16.064488	2017-02-05 21:20:16.064488
1101	Newport;Casnewydd	NWP	77	2017-02-05 21:20:16.072422	2017-02-05 21:20:16.072422
1102	North Yorkshire	NYK	77	2017-02-05 21:20:16.080082	2017-02-05 21:20:16.080082
1103	Newry and Mourne	NYM	77	2017-02-05 21:20:16.086996	2017-02-05 21:20:16.086996
1104	Oldham	OLD	77	2017-02-05 21:20:16.092943	2017-02-05 21:20:16.092943
1105	Omagh	OMH	77	2017-02-05 21:20:16.099029	2017-02-05 21:20:16.099029
1106	Orkney Islands	ORK	77	2017-02-05 21:20:16.107373	2017-02-05 21:20:16.107373
1107	Oxfordshire	OXF	77	2017-02-05 21:20:16.118036	2017-02-05 21:20:16.118036
1108	Pembrokeshire;Sir Benfro	PEM	77	2017-02-05 21:20:16.126485	2017-02-05 21:20:16.126485
1109	Perth and Kinross	PKN	77	2017-02-05 21:20:16.13263	2017-02-05 21:20:16.13263
1110	Plymouth	PLY	77	2017-02-05 21:20:16.138428	2017-02-05 21:20:16.138428
1111	Poole	POL	77	2017-02-05 21:20:16.143906	2017-02-05 21:20:16.143906
1112	Portsmouth	POR	77	2017-02-05 21:20:16.149669	2017-02-05 21:20:16.149669
1113	Powys	POW	77	2017-02-05 21:20:16.156622	2017-02-05 21:20:16.156622
1114	Peterborough	PTE	77	2017-02-05 21:20:16.164959	2017-02-05 21:20:16.164959
1115	Redcar and Cleveland	RCC	77	2017-02-05 21:20:16.174711	2017-02-05 21:20:16.174711
1116	Rochdale	RCH	77	2017-02-05 21:20:16.182699	2017-02-05 21:20:16.182699
1117	Rhondda, Cynon, Taff;Rhondda, Cynon,Taf	RCT	77	2017-02-05 21:20:16.189202	2017-02-05 21:20:16.189202
1118	Redbridge	RDB	77	2017-02-05 21:20:16.195622	2017-02-05 21:20:16.195622
1119	Reading	RDG	77	2017-02-05 21:20:16.201767	2017-02-05 21:20:16.201767
1120	Renfrewshire	RFW	77	2017-02-05 21:20:16.210011	2017-02-05 21:20:16.210011
1121	Richmond upon Thames	RIC	77	2017-02-05 21:20:16.218035	2017-02-05 21:20:16.218035
1122	Rotherham	ROT	77	2017-02-05 21:20:16.226466	2017-02-05 21:20:16.226466
1123	Rutland	RUT	77	2017-02-05 21:20:16.233754	2017-02-05 21:20:16.233754
1124	Sandwell	SAW	77	2017-02-05 21:20:16.241034	2017-02-05 21:20:16.241034
1125	South Ayrshire	SAY	77	2017-02-05 21:20:16.249154	2017-02-05 21:20:16.249154
1126	Scottish Borders, The	SCB	77	2017-02-05 21:20:16.258964	2017-02-05 21:20:16.258964
1127	Scotland	SCT	77	2017-02-05 21:20:16.265209	2017-02-05 21:20:16.265209
1128	Suffolk	SFK	77	2017-02-05 21:20:16.273022	2017-02-05 21:20:16.273022
1129	Sefton	SFT	77	2017-02-05 21:20:16.282123	2017-02-05 21:20:16.282123
1130	South Gloucestershire	SGC	77	2017-02-05 21:20:16.290849	2017-02-05 21:20:16.290849
1131	Sheffield	SHF	77	2017-02-05 21:20:16.297462	2017-02-05 21:20:16.297462
1132	St. Helens	SHN	77	2017-02-05 21:20:16.304659	2017-02-05 21:20:16.304659
1133	Shropshire	SHR	77	2017-02-05 21:20:16.311432	2017-02-05 21:20:16.311432
1134	Stockport	SKP	77	2017-02-05 21:20:16.317403	2017-02-05 21:20:16.317403
1135	Salford	SLF	77	2017-02-05 21:20:16.322677	2017-02-05 21:20:16.322677
1136	Slough	SLG	77	2017-02-05 21:20:16.328267	2017-02-05 21:20:16.328267
1137	South Lanarkshire	SLK	77	2017-02-05 21:20:16.335588	2017-02-05 21:20:16.335588
1138	Sunderland	SND	77	2017-02-05 21:20:16.341042	2017-02-05 21:20:16.341042
1139	Solihull	SOL	77	2017-02-05 21:20:16.346291	2017-02-05 21:20:16.346291
1140	Somerset	SOM	77	2017-02-05 21:20:16.3525	2017-02-05 21:20:16.3525
1141	Southend-on-Sea	SOS	77	2017-02-05 21:20:16.35948	2017-02-05 21:20:16.35948
1142	Surrey	SRY	77	2017-02-05 21:20:16.365644	2017-02-05 21:20:16.365644
1143	Strabane	STB	77	2017-02-05 21:20:16.371312	2017-02-05 21:20:16.371312
1144	Stoke-on-Trent	STE	77	2017-02-05 21:20:16.376234	2017-02-05 21:20:16.376234
1145	Stirling	STG	77	2017-02-05 21:20:16.381757	2017-02-05 21:20:16.381757
1146	Southampton	STH	77	2017-02-05 21:20:16.389973	2017-02-05 21:20:16.389973
1147	Sutton	STN	77	2017-02-05 21:20:16.397425	2017-02-05 21:20:16.397425
1148	Staffordshire	STS	77	2017-02-05 21:20:16.405583	2017-02-05 21:20:16.405583
1149	Stockton-on-Tees	STT	77	2017-02-05 21:20:16.41438	2017-02-05 21:20:16.41438
1150	South Tyneside	STY	77	2017-02-05 21:20:16.424219	2017-02-05 21:20:16.424219
1151	Swansea;Abertawe	SWA	77	2017-02-05 21:20:16.43058	2017-02-05 21:20:16.43058
1152	Swindon	SWD	77	2017-02-05 21:20:16.437474	2017-02-05 21:20:16.437474
1153	Southwark	SWK	77	2017-02-05 21:20:16.444269	2017-02-05 21:20:16.444269
1154	Tameside	TAM	77	2017-02-05 21:20:16.449948	2017-02-05 21:20:16.449948
1155	Telford and Wrekin	TFW	77	2017-02-05 21:20:16.456706	2017-02-05 21:20:16.456706
1156	Thurrock	THR	77	2017-02-05 21:20:16.462439	2017-02-05 21:20:16.462439
1157	Torbay	TOB	77	2017-02-05 21:20:16.469317	2017-02-05 21:20:16.469317
1158	Torfaen;Tor-faen	TOF	77	2017-02-05 21:20:16.475785	2017-02-05 21:20:16.475785
1159	Trafford	TRF	77	2017-02-05 21:20:16.48104	2017-02-05 21:20:16.48104
1160	Tower Hamlets	TWH	77	2017-02-05 21:20:16.488128	2017-02-05 21:20:16.488128
1161	United Kingdom	UKM	77	2017-02-05 21:20:16.493644	2017-02-05 21:20:16.493644
1162	Vale of Glamorgan, The;Bro Morgannwg	VGL	77	2017-02-05 21:20:16.499512	2017-02-05 21:20:16.499512
1163	Warwickshire	WAR	77	2017-02-05 21:20:16.506139	2017-02-05 21:20:16.506139
1164	West Berkshire	WBK	77	2017-02-05 21:20:16.513939	2017-02-05 21:20:16.513939
1165	West Dunbartonshire	WDU	77	2017-02-05 21:20:16.521596	2017-02-05 21:20:16.521596
1166	Waltham Forest	WFT	77	2017-02-05 21:20:16.528836	2017-02-05 21:20:16.528836
1167	Wigan	WGN	77	2017-02-05 21:20:16.534523	2017-02-05 21:20:16.534523
1168	Wakefield	WKF	77	2017-02-05 21:20:16.539804	2017-02-05 21:20:16.539804
1169	Walsall	WLL	77	2017-02-05 21:20:16.544971	2017-02-05 21:20:16.544971
1170	West Lothian	WLN	77	2017-02-05 21:20:16.550199	2017-02-05 21:20:16.550199
1171	Wales	WLS	77	2017-02-05 21:20:16.556773	2017-02-05 21:20:16.556773
1172	Wolverhampton	WLV	77	2017-02-05 21:20:16.564331	2017-02-05 21:20:16.564331
1173	Wandsworth	WND	77	2017-02-05 21:20:16.570191	2017-02-05 21:20:16.570191
1174	Windsor and Maidenhead	WNM	77	2017-02-05 21:20:16.576487	2017-02-05 21:20:16.576487
1175	Wokingham	WOK	77	2017-02-05 21:20:16.582293	2017-02-05 21:20:16.582293
1176	Worcestershire	WOR	77	2017-02-05 21:20:16.588319	2017-02-05 21:20:16.588319
1177	Wirral	WRL	77	2017-02-05 21:20:16.595775	2017-02-05 21:20:16.595775
1178	Warrington	WRT	77	2017-02-05 21:20:16.603729	2017-02-05 21:20:16.603729
1179	Wrexham;Wrecsam	WRX	77	2017-02-05 21:20:16.612315	2017-02-05 21:20:16.612315
1180	Westminster	WSM	77	2017-02-05 21:20:16.62152	2017-02-05 21:20:16.62152
1181	West Sussex	WSX	77	2017-02-05 21:20:16.647658	2017-02-05 21:20:16.647658
1182	York	YOR	77	2017-02-05 21:20:16.683089	2017-02-05 21:20:16.683089
1183	Shetland Islands	ZET	77	2017-02-05 21:20:16.705176	2017-02-05 21:20:16.705176
1184	Wiltshire	WIL	77	2017-02-05 21:20:16.727035	2017-02-05 21:20:16.727035
1185	Saint Andrew	01	78	2017-02-05 21:20:16.745828	2017-02-05 21:20:16.745828
1186	Saint David	02	78	2017-02-05 21:20:16.763068	2017-02-05 21:20:16.763068
1187	Saint George	03	78	2017-02-05 21:20:16.784393	2017-02-05 21:20:16.784393
1188	Saint John	04	78	2017-02-05 21:20:16.801769	2017-02-05 21:20:16.801769
1189	Saint Mark	05	78	2017-02-05 21:20:16.80741	2017-02-05 21:20:16.80741
1190	Saint Patrick	06	78	2017-02-05 21:20:16.812664	2017-02-05 21:20:16.812664
1191	Southern Grenadine Islands	10	78	2017-02-05 21:20:16.818281	2017-02-05 21:20:16.818281
1192	Abkhazia	AB	79	2017-02-05 21:20:16.823965	2017-02-05 21:20:16.823965
1193	Ajaria	AJ	79	2017-02-05 21:20:16.82997	2017-02-05 21:20:16.82997
1194	Guria	GU	79	2017-02-05 21:20:16.83521	2017-02-05 21:20:16.83521
1195	Imeret’i	IM	79	2017-02-05 21:20:16.840546	2017-02-05 21:20:16.840546
1196	Kakhet’i	KA	79	2017-02-05 21:20:16.845387	2017-02-05 21:20:16.845387
1197	K’vemo K’art’li	KK	79	2017-02-05 21:20:16.850852	2017-02-05 21:20:16.850852
1198	Mts’khet’a-Mt’ianet’i	MM	79	2017-02-05 21:20:16.856756	2017-02-05 21:20:16.856756
1199	Racha-Lech’khumi-K’vemo Svanet’i	RL	79	2017-02-05 21:20:16.862957	2017-02-05 21:20:16.862957
1200	Samts’khe-Javakhet’i	SJ	79	2017-02-05 21:20:16.868708	2017-02-05 21:20:16.868708
1201	Shida K’art’li	SK	79	2017-02-05 21:20:16.874729	2017-02-05 21:20:16.874729
1202	Samegrelo-Zemo Svanet’i	SZ	79	2017-02-05 21:20:16.880257	2017-02-05 21:20:16.880257
1203	T’bilisi	TB	79	2017-02-05 21:20:16.885537	2017-02-05 21:20:16.885537
1204	Greater Accra	AA	82	2017-02-05 21:20:16.89073	2017-02-05 21:20:16.89073
1205	Ashanti	AH	82	2017-02-05 21:20:16.895873	2017-02-05 21:20:16.895873
1206	Brong-Ahafo	BA	82	2017-02-05 21:20:16.901452	2017-02-05 21:20:16.901452
1207	Central	CP	82	2017-02-05 21:20:16.906722	2017-02-05 21:20:16.906722
1208	Eastern	EP	82	2017-02-05 21:20:16.912496	2017-02-05 21:20:16.912496
1209	Northern	NP	82	2017-02-05 21:20:16.918143	2017-02-05 21:20:16.918143
1210	Volta	TV	82	2017-02-05 21:20:16.923471	2017-02-05 21:20:16.923471
1211	Upper East	UE	82	2017-02-05 21:20:16.9294	2017-02-05 21:20:16.9294
1212	Upper West	UW	82	2017-02-05 21:20:16.933674	2017-02-05 21:20:16.933674
1213	Western	WP	82	2017-02-05 21:20:16.946914	2017-02-05 21:20:16.946914
1214	Kommune Kujalleq	KU	84	2017-02-05 21:20:16.952755	2017-02-05 21:20:16.952755
1215	Qaasuitsup Kommunia	QA	84	2017-02-05 21:20:16.957902	2017-02-05 21:20:16.957902
1216	Qeqqata Kommunia	QE	84	2017-02-05 21:20:16.96541	2017-02-05 21:20:16.96541
1217	Kommuneqarfik Sermersooq	SM	84	2017-02-05 21:20:16.97305	2017-02-05 21:20:16.97305
1218	Banjul	B	85	2017-02-05 21:20:16.979948	2017-02-05 21:20:16.979948
1219	Lower River	L	85	2017-02-05 21:20:16.986719	2017-02-05 21:20:16.986719
1220	Central River	M	85	2017-02-05 21:20:16.993495	2017-02-05 21:20:16.993495
1221	North Bank	N	85	2017-02-05 21:20:17.00197	2017-02-05 21:20:17.00197
1222	Upper River	U	85	2017-02-05 21:20:17.007006	2017-02-05 21:20:17.007006
1223	Western	W	85	2017-02-05 21:20:17.012346	2017-02-05 21:20:17.012346
1224	Boké	B	86	2017-02-05 21:20:17.017412	2017-02-05 21:20:17.017412
1225	Conakry	C	86	2017-02-05 21:20:17.022129	2017-02-05 21:20:17.022129
1226	Kindia	D	86	2017-02-05 21:20:17.027872	2017-02-05 21:20:17.027872
1227	Faranah	F	86	2017-02-05 21:20:17.035719	2017-02-05 21:20:17.035719
1228	Kankan	K	86	2017-02-05 21:20:17.043085	2017-02-05 21:20:17.043085
1229	Labé	L	86	2017-02-05 21:20:17.052817	2017-02-05 21:20:17.052817
1230	Mamou	M	86	2017-02-05 21:20:17.060873	2017-02-05 21:20:17.060873
1231	Nzérékoré	N	86	2017-02-05 21:20:17.068261	2017-02-05 21:20:17.068261
1232	Región Continental	C	88	2017-02-05 21:20:17.076907	2017-02-05 21:20:17.076907
1233	Región Insular	I	88	2017-02-05 21:20:17.085196	2017-02-05 21:20:17.085196
1234	Agio Oros	69	89	2017-02-05 21:20:17.092846	2017-02-05 21:20:17.092846
1235	Anatoliki Makedonia kai Thraki	A	89	2017-02-05 21:20:17.098388	2017-02-05 21:20:17.098388
1236	Kentriki Makedonia	B	89	2017-02-05 21:20:17.104989	2017-02-05 21:20:17.104989
1237	Dytiki Makedonia	C	89	2017-02-05 21:20:17.110212	2017-02-05 21:20:17.110212
1238	Ipeiros	D	89	2017-02-05 21:20:17.116721	2017-02-05 21:20:17.116721
1239	Thessalia	E	89	2017-02-05 21:20:17.122757	2017-02-05 21:20:17.122757
1240	Ionia Nisia	F	89	2017-02-05 21:20:17.129118	2017-02-05 21:20:17.129118
1241	Dytiki Ellada	G	89	2017-02-05 21:20:17.135672	2017-02-05 21:20:17.135672
1242	Sterea Ellada	H	89	2017-02-05 21:20:17.141877	2017-02-05 21:20:17.141877
1243	Attiki	I	89	2017-02-05 21:20:17.149705	2017-02-05 21:20:17.149705
1244	Peloponnisos	J	89	2017-02-05 21:20:17.158386	2017-02-05 21:20:17.158386
1245	Voreio Aigaio	K	89	2017-02-05 21:20:17.166101	2017-02-05 21:20:17.166101
1246	Notio Aigaio	L	89	2017-02-05 21:20:17.173844	2017-02-05 21:20:17.173844
1247	Kriti	M	89	2017-02-05 21:20:17.181403	2017-02-05 21:20:17.181403
1248	Alta Verapaz	AV	91	2017-02-05 21:20:17.190062	2017-02-05 21:20:17.190062
1249	Baja Verapaz	BV	91	2017-02-05 21:20:17.197215	2017-02-05 21:20:17.197215
1250	Chimaltenango	CM	91	2017-02-05 21:20:17.206959	2017-02-05 21:20:17.206959
1251	Chiquimula	CQ	91	2017-02-05 21:20:17.215523	2017-02-05 21:20:17.215523
1252	Escuintla	ES	91	2017-02-05 21:20:17.222982	2017-02-05 21:20:17.222982
1253	Guatemala	GU	91	2017-02-05 21:20:17.2311	2017-02-05 21:20:17.2311
1254	Huehuetenango	HU	91	2017-02-05 21:20:17.239507	2017-02-05 21:20:17.239507
1255	Izabal	IZ	91	2017-02-05 21:20:17.247068	2017-02-05 21:20:17.247068
1256	Jalapa	JA	91	2017-02-05 21:20:17.253584	2017-02-05 21:20:17.253584
1257	Jutiapa	JU	91	2017-02-05 21:20:17.260227	2017-02-05 21:20:17.260227
1258	Petén	PE	91	2017-02-05 21:20:17.266718	2017-02-05 21:20:17.266718
1259	El Progreso	PR	91	2017-02-05 21:20:17.274592	2017-02-05 21:20:17.274592
1260	Quiché	QC	91	2017-02-05 21:20:17.282129	2017-02-05 21:20:17.282129
1261	Quetzaltenango	QZ	91	2017-02-05 21:20:17.28872	2017-02-05 21:20:17.28872
1262	Retalhuleu	RE	91	2017-02-05 21:20:17.296508	2017-02-05 21:20:17.296508
1263	Sacatepéquez	SA	91	2017-02-05 21:20:17.30238	2017-02-05 21:20:17.30238
1264	San Marcos	SM	91	2017-02-05 21:20:17.310606	2017-02-05 21:20:17.310606
1265	Sololá	SO	91	2017-02-05 21:20:17.318666	2017-02-05 21:20:17.318666
1266	Santa Rosa	SR	91	2017-02-05 21:20:17.32585	2017-02-05 21:20:17.32585
1267	Suchitepéquez	SU	91	2017-02-05 21:20:17.333383	2017-02-05 21:20:17.333383
1268	Totonicapán	TO	91	2017-02-05 21:20:17.339519	2017-02-05 21:20:17.339519
1269	Zacapa	ZA	91	2017-02-05 21:20:17.345866	2017-02-05 21:20:17.345866
1270	Bissau	BS	93	2017-02-05 21:20:17.35362	2017-02-05 21:20:17.35362
1271	Leste	L	93	2017-02-05 21:20:17.363804	2017-02-05 21:20:17.363804
1272	Norte	N	93	2017-02-05 21:20:17.37269	2017-02-05 21:20:17.37269
1273	Sul	S	93	2017-02-05 21:20:17.380462	2017-02-05 21:20:17.380462
1274	Barima-Waini	BA	94	2017-02-05 21:20:17.388749	2017-02-05 21:20:17.388749
1275	Cuyuni-Mazaruni	CU	94	2017-02-05 21:20:17.395186	2017-02-05 21:20:17.395186
1276	Demerara-Mahaica	DE	94	2017-02-05 21:20:17.400972	2017-02-05 21:20:17.400972
1277	East Berbice-Corentyne	EB	94	2017-02-05 21:20:17.406718	2017-02-05 21:20:17.406718
1278	Essequibo Islands-West Demerara	ES	94	2017-02-05 21:20:17.413612	2017-02-05 21:20:17.413612
1279	Mahaica-Berbice	MA	94	2017-02-05 21:20:17.420463	2017-02-05 21:20:17.420463
1280	Pomeroon-Supenaam	PM	94	2017-02-05 21:20:17.42721	2017-02-05 21:20:17.42721
1281	Potaro-Siparuni	PT	94	2017-02-05 21:20:17.433768	2017-02-05 21:20:17.433768
1282	Upper Demerara-Berbice	UD	94	2017-02-05 21:20:17.440431	2017-02-05 21:20:17.440431
1283	Upper Takutu-Upper Essequibo	UT	94	2017-02-05 21:20:17.44606	2017-02-05 21:20:17.44606
1284	Atlántida	AT	97	2017-02-05 21:20:17.45344	2017-02-05 21:20:17.45344
1285	Choluteca	CH	97	2017-02-05 21:20:17.459974	2017-02-05 21:20:17.459974
1286	Colón	CL	97	2017-02-05 21:20:17.467435	2017-02-05 21:20:17.467435
1287	Comayagua	CM	97	2017-02-05 21:20:17.474818	2017-02-05 21:20:17.474818
1288	Copán	CP	97	2017-02-05 21:20:17.482053	2017-02-05 21:20:17.482053
1289	Cortés	CR	97	2017-02-05 21:20:17.487549	2017-02-05 21:20:17.487549
1290	El Paraíso	EP	97	2017-02-05 21:20:17.492783	2017-02-05 21:20:17.492783
1291	Francisco Morazán	FM	97	2017-02-05 21:20:17.497544	2017-02-05 21:20:17.497544
1292	Gracias a Dios	GD	97	2017-02-05 21:20:17.503822	2017-02-05 21:20:17.503822
1293	Islas de la Bahía	IB	97	2017-02-05 21:20:17.509746	2017-02-05 21:20:17.509746
1294	Intibucá	IN	97	2017-02-05 21:20:17.517207	2017-02-05 21:20:17.517207
1295	Lempira	LE	97	2017-02-05 21:20:17.522431	2017-02-05 21:20:17.522431
1296	La Paz	LP	97	2017-02-05 21:20:17.52796	2017-02-05 21:20:17.52796
1297	Ocotepeque	OC	97	2017-02-05 21:20:17.533413	2017-02-05 21:20:17.533413
1298	Olancho	OL	97	2017-02-05 21:20:17.538357	2017-02-05 21:20:17.538357
1299	Santa Bárbara	SB	97	2017-02-05 21:20:17.543567	2017-02-05 21:20:17.543567
1300	Valle	VA	97	2017-02-05 21:20:17.550094	2017-02-05 21:20:17.550094
1301	Yoro	YO	97	2017-02-05 21:20:17.556879	2017-02-05 21:20:17.556879
1302	Zagrebačka županija	01	98	2017-02-05 21:20:17.563893	2017-02-05 21:20:17.563893
1303	Krapinsko-zagorska županija	02	98	2017-02-05 21:20:17.57179	2017-02-05 21:20:17.57179
1304	Sisačko-moslavačka županija	03	98	2017-02-05 21:20:17.579287	2017-02-05 21:20:17.579287
1305	Karlovačka županija	04	98	2017-02-05 21:20:17.587191	2017-02-05 21:20:17.587191
1306	Varaždinska županija	05	98	2017-02-05 21:20:17.594652	2017-02-05 21:20:17.594652
1307	Koprivničko-križevačka županija	06	98	2017-02-05 21:20:17.60299	2017-02-05 21:20:17.60299
1308	Bjelovarsko-bilogorska županija	07	98	2017-02-05 21:20:17.609003	2017-02-05 21:20:17.609003
1309	Primorsko-goranska županija	08	98	2017-02-05 21:20:17.615209	2017-02-05 21:20:17.615209
1310	Ličko-senjska županija	09	98	2017-02-05 21:20:17.621326	2017-02-05 21:20:17.621326
1311	Virovitičko-podravska županija	10	98	2017-02-05 21:20:17.62715	2017-02-05 21:20:17.62715
1312	Požeško-slavonska županija	11	98	2017-02-05 21:20:17.633649	2017-02-05 21:20:17.633649
1313	Brodsko-posavska županija	12	98	2017-02-05 21:20:17.639954	2017-02-05 21:20:17.639954
1314	Zadarska županija	13	98	2017-02-05 21:20:17.64545	2017-02-05 21:20:17.64545
1315	Osječko-baranjska županija	14	98	2017-02-05 21:20:17.653326	2017-02-05 21:20:17.653326
1316	Šibensko-kninska županija	15	98	2017-02-05 21:20:17.661363	2017-02-05 21:20:17.661363
1317	Vukovarsko-srijemska županija	16	98	2017-02-05 21:20:17.669945	2017-02-05 21:20:17.669945
1318	Splitsko-dalmatinska županija	17	98	2017-02-05 21:20:17.679094	2017-02-05 21:20:17.679094
1319	Istarska županija	18	98	2017-02-05 21:20:17.686776	2017-02-05 21:20:17.686776
1320	Dubrovačko-neretvanska županija	19	98	2017-02-05 21:20:17.692696	2017-02-05 21:20:17.692696
1321	Međimurska županija	20	98	2017-02-05 21:20:17.699093	2017-02-05 21:20:17.699093
1322	Grad Zagreb	21	98	2017-02-05 21:20:17.705421	2017-02-05 21:20:17.705421
1323	Artibonite	AR	99	2017-02-05 21:20:17.712131	2017-02-05 21:20:17.712131
1324	Centre	CE	99	2017-02-05 21:20:17.718576	2017-02-05 21:20:17.718576
1325	Grande-Anse	GA	99	2017-02-05 21:20:17.724845	2017-02-05 21:20:17.724845
1326	Nord	ND	99	2017-02-05 21:20:17.738166	2017-02-05 21:20:17.738166
1327	Nord-Est	NE	99	2017-02-05 21:20:17.753068	2017-02-05 21:20:17.753068
1328	Nord-Ouest	NO	99	2017-02-05 21:20:17.767707	2017-02-05 21:20:17.767707
1329	Ouest	OU	99	2017-02-05 21:20:17.782795	2017-02-05 21:20:17.782795
1330	Sud	SD	99	2017-02-05 21:20:17.801662	2017-02-05 21:20:17.801662
1331	Sud-Est	SE	99	2017-02-05 21:20:17.815936	2017-02-05 21:20:17.815936
1332	Baranya	BA	100	2017-02-05 21:20:17.833717	2017-02-05 21:20:17.833717
1333	Békéscsaba	BC	100	2017-02-05 21:20:17.841117	2017-02-05 21:20:17.841117
1334	Békés	BE	100	2017-02-05 21:20:17.846952	2017-02-05 21:20:17.846952
1335	Bács-Kiskun	BK	100	2017-02-05 21:20:17.85203	2017-02-05 21:20:17.85203
1336	Budapest	BU	100	2017-02-05 21:20:17.856894	2017-02-05 21:20:17.856894
1337	Borsod-Abaúj-Zemplén	BZ	100	2017-02-05 21:20:17.86196	2017-02-05 21:20:17.86196
1338	Csongrád	CS	100	2017-02-05 21:20:17.866151	2017-02-05 21:20:17.866151
1339	Debrecen	DE	100	2017-02-05 21:20:17.870558	2017-02-05 21:20:17.870558
1340	Dunaújváros	DU	100	2017-02-05 21:20:17.874887	2017-02-05 21:20:17.874887
1341	Eger	EG	100	2017-02-05 21:20:17.879156	2017-02-05 21:20:17.879156
1342	Érd	ER	100	2017-02-05 21:20:17.883179	2017-02-05 21:20:17.883179
1343	Fejér	FE	100	2017-02-05 21:20:17.887353	2017-02-05 21:20:17.887353
1344	Győr-Moson-Sopron	GS	100	2017-02-05 21:20:17.891604	2017-02-05 21:20:17.891604
1345	Győr	GY	100	2017-02-05 21:20:17.896026	2017-02-05 21:20:17.896026
1346	Hajdú-Bihar	HB	100	2017-02-05 21:20:17.900268	2017-02-05 21:20:17.900268
1347	Heves	HE	100	2017-02-05 21:20:17.905519	2017-02-05 21:20:17.905519
1348	Hódmezővásárhely	HV	100	2017-02-05 21:20:17.910266	2017-02-05 21:20:17.910266
1349	Jász-Nagykun-Szolnok	JN	100	2017-02-05 21:20:17.915696	2017-02-05 21:20:17.915696
1350	Komárom-Esztergom	KE	100	2017-02-05 21:20:17.922098	2017-02-05 21:20:17.922098
1351	Kecskemét	KM	100	2017-02-05 21:20:17.928185	2017-02-05 21:20:17.928185
1352	Kaposvár	KV	100	2017-02-05 21:20:17.933706	2017-02-05 21:20:17.933706
1353	Miskolc	MI	100	2017-02-05 21:20:17.939224	2017-02-05 21:20:17.939224
1354	Nagykanizsa	NK	100	2017-02-05 21:20:17.944216	2017-02-05 21:20:17.944216
1355	Nógrád	NO	100	2017-02-05 21:20:17.948531	2017-02-05 21:20:17.948531
1356	Nyíregyháza	NY	100	2017-02-05 21:20:17.953087	2017-02-05 21:20:17.953087
1357	Pest	PE	100	2017-02-05 21:20:17.958687	2017-02-05 21:20:17.958687
1358	Pécs	PS	100	2017-02-05 21:20:17.963049	2017-02-05 21:20:17.963049
1359	Szeged	SD	100	2017-02-05 21:20:17.967492	2017-02-05 21:20:17.967492
1360	Székesfehérvár	SF	100	2017-02-05 21:20:17.971841	2017-02-05 21:20:17.971841
1361	Szombathely	SH	100	2017-02-05 21:20:17.97621	2017-02-05 21:20:17.97621
1362	Szolnok	SK	100	2017-02-05 21:20:17.980598	2017-02-05 21:20:17.980598
1363	Sopron	SN	100	2017-02-05 21:20:17.984879	2017-02-05 21:20:17.984879
1364	Somogy	SO	100	2017-02-05 21:20:17.989113	2017-02-05 21:20:17.989113
1365	Szekszárd	SS	100	2017-02-05 21:20:17.99337	2017-02-05 21:20:17.99337
1366	Salgótarján	ST	100	2017-02-05 21:20:17.997688	2017-02-05 21:20:17.997688
1367	Szabolcs-Szatmár-Bereg	SZ	100	2017-02-05 21:20:18.001931	2017-02-05 21:20:18.001931
1368	Tatabánya	TB	100	2017-02-05 21:20:18.006229	2017-02-05 21:20:18.006229
1369	Tolna	TO	100	2017-02-05 21:20:18.010533	2017-02-05 21:20:18.010533
1370	Vas	VA	100	2017-02-05 21:20:18.015877	2017-02-05 21:20:18.015877
1371	Veszprém (county)	VE	100	2017-02-05 21:20:18.021206	2017-02-05 21:20:18.021206
1372	Veszprém	VM	100	2017-02-05 21:20:18.026179	2017-02-05 21:20:18.026179
1373	Zala	ZA	100	2017-02-05 21:20:18.030552	2017-02-05 21:20:18.030552
1374	Zalaegerszeg	ZE	100	2017-02-05 21:20:18.034621	2017-02-05 21:20:18.034621
1375	Papua	IJ	101	2017-02-05 21:20:18.042233	2017-02-05 21:20:18.042233
1376	Jawa	JW	101	2017-02-05 21:20:18.049413	2017-02-05 21:20:18.049413
1377	Kalimantan	KA	101	2017-02-05 21:20:18.055269	2017-02-05 21:20:18.055269
1378	Maluku	ML	101	2017-02-05 21:20:18.061666	2017-02-05 21:20:18.061666
1379	Nusa Tenggara	NU	101	2017-02-05 21:20:18.067512	2017-02-05 21:20:18.067512
1380	Sulawesi	SL	101	2017-02-05 21:20:18.072978	2017-02-05 21:20:18.072978
1381	Sumatera	SM	101	2017-02-05 21:20:18.078342	2017-02-05 21:20:18.078342
1382	Connacht	C	102	2017-02-05 21:20:18.084121	2017-02-05 21:20:18.084121
1383	Leinster	L	102	2017-02-05 21:20:18.090463	2017-02-05 21:20:18.090463
1384	Munster	M	102	2017-02-05 21:20:18.095667	2017-02-05 21:20:18.095667
1385	Ulster	U	102	2017-02-05 21:20:18.101163	2017-02-05 21:20:18.101163
1386	HaDarom	D	103	2017-02-05 21:20:18.107725	2017-02-05 21:20:18.107725
1387	Hefa	HA	103	2017-02-05 21:20:18.113799	2017-02-05 21:20:18.113799
1388	Yerushalayim Al Quds	JM	103	2017-02-05 21:20:18.120335	2017-02-05 21:20:18.120335
1389	HaMerkaz	M	103	2017-02-05 21:20:18.125867	2017-02-05 21:20:18.125867
1390	Tel-Aviv	TA	103	2017-02-05 21:20:18.130812	2017-02-05 21:20:18.130812
1391	HaZafon	Z	103	2017-02-05 21:20:18.136314	2017-02-05 21:20:18.136314
1392	Andaman and Nicobar Islands	AN	105	2017-02-05 21:20:18.141898	2017-02-05 21:20:18.141898
1393	Andhra Pradesh	AP	105	2017-02-05 21:20:18.147527	2017-02-05 21:20:18.147527
1394	Arunachal Pradesh	AR	105	2017-02-05 21:20:18.154264	2017-02-05 21:20:18.154264
1395	Assam	AS	105	2017-02-05 21:20:18.161273	2017-02-05 21:20:18.161273
1396	Bihar	BR	105	2017-02-05 21:20:18.167849	2017-02-05 21:20:18.167849
1397	Chandigarh	CH	105	2017-02-05 21:20:18.174546	2017-02-05 21:20:18.174546
1398	Chhattisgarh	CT	105	2017-02-05 21:20:18.180379	2017-02-05 21:20:18.180379
1399	Damen and Diu	DD	105	2017-02-05 21:20:18.187402	2017-02-05 21:20:18.187402
1400	Delhi	DL	105	2017-02-05 21:20:18.194495	2017-02-05 21:20:18.194495
1401	Dadra and Nagar Haveli	DN	105	2017-02-05 21:20:18.202011	2017-02-05 21:20:18.202011
1402	Goa	GA	105	2017-02-05 21:20:18.208364	2017-02-05 21:20:18.208364
1403	Gujarat	GJ	105	2017-02-05 21:20:18.213872	2017-02-05 21:20:18.213872
1404	Himachal Pradesh	HP	105	2017-02-05 21:20:18.219205	2017-02-05 21:20:18.219205
1405	Haryana	HR	105	2017-02-05 21:20:18.224498	2017-02-05 21:20:18.224498
1406	Jharkhand	JH	105	2017-02-05 21:20:18.229627	2017-02-05 21:20:18.229627
1407	Jammu and Kashmir	JK	105	2017-02-05 21:20:18.235153	2017-02-05 21:20:18.235153
1408	Karnataka	KA	105	2017-02-05 21:20:18.240853	2017-02-05 21:20:18.240853
1409	Kerala	KL	105	2017-02-05 21:20:18.246425	2017-02-05 21:20:18.246425
1410	Lakshadweep	LD	105	2017-02-05 21:20:18.252257	2017-02-05 21:20:18.252257
1411	Maharashtra	MH	105	2017-02-05 21:20:18.257777	2017-02-05 21:20:18.257777
1412	Meghalaya	ML	105	2017-02-05 21:20:18.263432	2017-02-05 21:20:18.263432
1413	Manipur	MN	105	2017-02-05 21:20:18.26905	2017-02-05 21:20:18.26905
1414	Madhya Pradesh	MP	105	2017-02-05 21:20:18.274505	2017-02-05 21:20:18.274505
1415	Mizoram	MZ	105	2017-02-05 21:20:18.279604	2017-02-05 21:20:18.279604
1416	Nagaland	NL	105	2017-02-05 21:20:18.285624	2017-02-05 21:20:18.285624
1417	Orissa	OR	105	2017-02-05 21:20:18.292333	2017-02-05 21:20:18.292333
1418	Punjab	PB	105	2017-02-05 21:20:18.298265	2017-02-05 21:20:18.298265
1419	Puducherry	PY	105	2017-02-05 21:20:18.303557	2017-02-05 21:20:18.303557
1420	Rajasthan	RJ	105	2017-02-05 21:20:18.310017	2017-02-05 21:20:18.310017
1421	Sikkim	SK	105	2017-02-05 21:20:18.316518	2017-02-05 21:20:18.316518
1422	Tamil Nadu	TN	105	2017-02-05 21:20:18.321541	2017-02-05 21:20:18.321541
1423	Tripura	TR	105	2017-02-05 21:20:18.326918	2017-02-05 21:20:18.326918
1424	Uttar Pradesh	UP	105	2017-02-05 21:20:18.332404	2017-02-05 21:20:18.332404
1425	Uttarakhand	UT	105	2017-02-05 21:20:18.337471	2017-02-05 21:20:18.337471
1426	West Bengal	WB	105	2017-02-05 21:20:18.342799	2017-02-05 21:20:18.342799
1427	Al Anbar	AN	107	2017-02-05 21:20:18.349144	2017-02-05 21:20:18.349144
1428	Arbil	AR	107	2017-02-05 21:20:18.354735	2017-02-05 21:20:18.354735
1429	Al Basrah	BA	107	2017-02-05 21:20:18.360016	2017-02-05 21:20:18.360016
1430	Babil	BB	107	2017-02-05 21:20:18.364758	2017-02-05 21:20:18.364758
1431	Baghdad	BG	107	2017-02-05 21:20:18.369655	2017-02-05 21:20:18.369655
1432	Dahuk	DA	107	2017-02-05 21:20:18.375434	2017-02-05 21:20:18.375434
1433	Diyala	DI	107	2017-02-05 21:20:18.381113	2017-02-05 21:20:18.381113
1434	Dhi Qar	DQ	107	2017-02-05 21:20:18.386798	2017-02-05 21:20:18.386798
1435	Karbala'	KA	107	2017-02-05 21:20:18.392415	2017-02-05 21:20:18.392415
1436	Maysan	MA	107	2017-02-05 21:20:18.397321	2017-02-05 21:20:18.397321
1437	Al Muthanna	MU	107	2017-02-05 21:20:18.401976	2017-02-05 21:20:18.401976
1438	An Najef	NA	107	2017-02-05 21:20:18.407258	2017-02-05 21:20:18.407258
1439	Ninawa	NI	107	2017-02-05 21:20:18.412896	2017-02-05 21:20:18.412896
1440	Al Qadisiyah	QA	107	2017-02-05 21:20:18.418885	2017-02-05 21:20:18.418885
1441	Salah ad Din	SD	107	2017-02-05 21:20:18.424364	2017-02-05 21:20:18.424364
1442	As Sulaymaniyah	SW	107	2017-02-05 21:20:18.429444	2017-02-05 21:20:18.429444
1443	At Ta'mim	TS	107	2017-02-05 21:20:18.434499	2017-02-05 21:20:18.434499
1444	Wasit	WA	107	2017-02-05 21:20:18.439925	2017-02-05 21:20:18.439925
1445	Āzarbāyjān-e Sharqī	01	108	2017-02-05 21:20:18.445526	2017-02-05 21:20:18.445526
1446	Āzarbāyjān-e Gharbī	02	108	2017-02-05 21:20:18.451309	2017-02-05 21:20:18.451309
1447	Ardabīl	03	108	2017-02-05 21:20:18.457171	2017-02-05 21:20:18.457171
1448	Eşfahān	04	108	2017-02-05 21:20:18.462909	2017-02-05 21:20:18.462909
1449	Īlām	05	108	2017-02-05 21:20:18.468552	2017-02-05 21:20:18.468552
1450	Būshehr	06	108	2017-02-05 21:20:18.47479	2017-02-05 21:20:18.47479
1451	Tehrān	07	108	2017-02-05 21:20:18.481283	2017-02-05 21:20:18.481283
1452	Chahār Mahāll va Bakhtīārī	08	108	2017-02-05 21:20:18.487389	2017-02-05 21:20:18.487389
1453	Khūzestān	10	108	2017-02-05 21:20:18.493202	2017-02-05 21:20:18.493202
1454	Zanjān	11	108	2017-02-05 21:20:18.498148	2017-02-05 21:20:18.498148
1455	Semnān	12	108	2017-02-05 21:20:18.50361	2017-02-05 21:20:18.50361
1456	Sīstān va Balūchestān	13	108	2017-02-05 21:20:18.510583	2017-02-05 21:20:18.510583
1457	Fārs	14	108	2017-02-05 21:20:18.517899	2017-02-05 21:20:18.517899
1458	Kermān	15	108	2017-02-05 21:20:18.524014	2017-02-05 21:20:18.524014
1459	Kordestān	16	108	2017-02-05 21:20:18.529065	2017-02-05 21:20:18.529065
1460	Kermānshāh	17	108	2017-02-05 21:20:18.53391	2017-02-05 21:20:18.53391
1461	Kohgīlūyeh va Būyer Ahmad	18	108	2017-02-05 21:20:18.552188	2017-02-05 21:20:18.552188
1462	Gīlān	19	108	2017-02-05 21:20:18.569039	2017-02-05 21:20:18.569039
1463	Lorestān	20	108	2017-02-05 21:20:18.585798	2017-02-05 21:20:18.585798
1464	Māzandarān	21	108	2017-02-05 21:20:18.600566	2017-02-05 21:20:18.600566
1465	Markazī	22	108	2017-02-05 21:20:18.615015	2017-02-05 21:20:18.615015
1466	Hormozgān	23	108	2017-02-05 21:20:18.630179	2017-02-05 21:20:18.630179
1467	Hamadān	24	108	2017-02-05 21:20:18.644731	2017-02-05 21:20:18.644731
1468	Yazd	25	108	2017-02-05 21:20:18.659767	2017-02-05 21:20:18.659767
1469	Qom	26	108	2017-02-05 21:20:18.667925	2017-02-05 21:20:18.667925
1470	Golestān	27	108	2017-02-05 21:20:18.672534	2017-02-05 21:20:18.672534
1471	Qazvīn	28	108	2017-02-05 21:20:18.678376	2017-02-05 21:20:18.678376
1472	Khorāsān-e Janūbī	29	108	2017-02-05 21:20:18.683029	2017-02-05 21:20:18.683029
1473	Khorāsān-e Razavī	30	108	2017-02-05 21:20:18.687569	2017-02-05 21:20:18.687569
1474	Khorāsān-e Shemālī	31	108	2017-02-05 21:20:18.692179	2017-02-05 21:20:18.692179
1475	Reykjavík	0	109	2017-02-05 21:20:18.697822	2017-02-05 21:20:18.697822
1476	Höfuðborgarsvæðið	1	109	2017-02-05 21:20:18.70425	2017-02-05 21:20:18.70425
1477	Suðurnes	2	109	2017-02-05 21:20:18.710145	2017-02-05 21:20:18.710145
1478	Vesturland	3	109	2017-02-05 21:20:18.715313	2017-02-05 21:20:18.715313
1479	Vestfirðir	4	109	2017-02-05 21:20:18.720166	2017-02-05 21:20:18.720166
1480	Norðurland vestra	5	109	2017-02-05 21:20:18.726381	2017-02-05 21:20:18.726381
1481	Norðurland eystra	6	109	2017-02-05 21:20:18.731514	2017-02-05 21:20:18.731514
1482	Austurland	7	109	2017-02-05 21:20:18.736446	2017-02-05 21:20:18.736446
1483	Suðurland	8	109	2017-02-05 21:20:18.741325	2017-02-05 21:20:18.741325
1484	Piemonte	21	110	2017-02-05 21:20:18.746979	2017-02-05 21:20:18.746979
1485	Valle d'Aosta	23	110	2017-02-05 21:20:18.75233	2017-02-05 21:20:18.75233
1486	Lombardia	25	110	2017-02-05 21:20:18.757426	2017-02-05 21:20:18.757426
1487	Trentino-Alto Adige	32	110	2017-02-05 21:20:18.762163	2017-02-05 21:20:18.762163
1488	Veneto	34	110	2017-02-05 21:20:18.766621	2017-02-05 21:20:18.766621
1489	Friuli-Venezia Giulia	36	110	2017-02-05 21:20:18.771316	2017-02-05 21:20:18.771316
1490	Liguria	42	110	2017-02-05 21:20:18.775914	2017-02-05 21:20:18.775914
1491	Emilia-Romagna	45	110	2017-02-05 21:20:18.780651	2017-02-05 21:20:18.780651
1492	Toscana	52	110	2017-02-05 21:20:18.785133	2017-02-05 21:20:18.785133
1493	Umbria	55	110	2017-02-05 21:20:18.789666	2017-02-05 21:20:18.789666
1494	Marche	57	110	2017-02-05 21:20:18.794084	2017-02-05 21:20:18.794084
1495	Lazio	62	110	2017-02-05 21:20:18.798405	2017-02-05 21:20:18.798405
1496	Abruzzo	65	110	2017-02-05 21:20:18.803266	2017-02-05 21:20:18.803266
1497	Molise	67	110	2017-02-05 21:20:18.808257	2017-02-05 21:20:18.808257
1498	Campania	72	110	2017-02-05 21:20:18.81327	2017-02-05 21:20:18.81327
1499	Puglia	75	110	2017-02-05 21:20:18.817828	2017-02-05 21:20:18.817828
1500	Basilicata	77	110	2017-02-05 21:20:18.822378	2017-02-05 21:20:18.822378
1501	Calabria	78	110	2017-02-05 21:20:18.82682	2017-02-05 21:20:18.82682
1502	Sicilia	82	110	2017-02-05 21:20:18.831266	2017-02-05 21:20:18.831266
1503	Sardegna	88	110	2017-02-05 21:20:18.835701	2017-02-05 21:20:18.835701
1504	Kingston	01	112	2017-02-05 21:20:18.84031	2017-02-05 21:20:18.84031
1505	Saint Andrew	02	112	2017-02-05 21:20:18.844635	2017-02-05 21:20:18.844635
1506	Saint Thomas	03	112	2017-02-05 21:20:18.849226	2017-02-05 21:20:18.849226
1507	Portland	04	112	2017-02-05 21:20:18.853805	2017-02-05 21:20:18.853805
1508	Saint Mary	05	112	2017-02-05 21:20:18.858309	2017-02-05 21:20:18.858309
1509	Saint Ann	06	112	2017-02-05 21:20:18.863531	2017-02-05 21:20:18.863531
1510	Trelawny	07	112	2017-02-05 21:20:18.868055	2017-02-05 21:20:18.868055
1511	Saint James	08	112	2017-02-05 21:20:18.872781	2017-02-05 21:20:18.872781
1512	Hanover	09	112	2017-02-05 21:20:18.877088	2017-02-05 21:20:18.877088
1513	Westmoreland	10	112	2017-02-05 21:20:18.883246	2017-02-05 21:20:18.883246
1514	Saint Elizabeth	11	112	2017-02-05 21:20:18.888936	2017-02-05 21:20:18.888936
1515	Manchester	12	112	2017-02-05 21:20:18.895327	2017-02-05 21:20:18.895327
1516	Clarendon	13	112	2017-02-05 21:20:18.902094	2017-02-05 21:20:18.902094
1517	Saint Catherine	14	112	2017-02-05 21:20:18.907937	2017-02-05 21:20:18.907937
1518	‘Ajlūn	AJ	113	2017-02-05 21:20:18.912671	2017-02-05 21:20:18.912671
1519	‘Ammān (Al ‘Aşimah)	AM	113	2017-02-05 21:20:18.917539	2017-02-05 21:20:18.917539
1520	Al ‘Aqabah	AQ	113	2017-02-05 21:20:18.922126	2017-02-05 21:20:18.922126
1521	Aţ Ţafīlah	AT	113	2017-02-05 21:20:18.926401	2017-02-05 21:20:18.926401
1522	Az Zarqā'	AZ	113	2017-02-05 21:20:18.931348	2017-02-05 21:20:18.931348
1523	Al Balqā'	BA	113	2017-02-05 21:20:18.935887	2017-02-05 21:20:18.935887
1524	Irbid	IR	113	2017-02-05 21:20:18.940275	2017-02-05 21:20:18.940275
1525	Jarash	JA	113	2017-02-05 21:20:18.945015	2017-02-05 21:20:18.945015
1526	Al Karak	KA	113	2017-02-05 21:20:18.949467	2017-02-05 21:20:18.949467
1527	Al Mafraq	MA	113	2017-02-05 21:20:18.953742	2017-02-05 21:20:18.953742
1528	Mādabā	MD	113	2017-02-05 21:20:18.958984	2017-02-05 21:20:18.958984
1529	Ma‘ān	MN	113	2017-02-05 21:20:18.964325	2017-02-05 21:20:18.964325
1530	Hokkaido	01	114	2017-02-05 21:20:18.971673	2017-02-05 21:20:18.971673
1531	Aomori	02	114	2017-02-05 21:20:18.978216	2017-02-05 21:20:18.978216
1532	Iwate	03	114	2017-02-05 21:20:18.985158	2017-02-05 21:20:18.985158
1533	Miyagi	04	114	2017-02-05 21:20:18.99002	2017-02-05 21:20:18.99002
1534	Akita	05	114	2017-02-05 21:20:18.994393	2017-02-05 21:20:18.994393
1535	Yamagata	06	114	2017-02-05 21:20:18.999417	2017-02-05 21:20:18.999417
1536	Fukushima	07	114	2017-02-05 21:20:19.003724	2017-02-05 21:20:19.003724
1537	Ibaraki	08	114	2017-02-05 21:20:19.008644	2017-02-05 21:20:19.008644
1538	Tochigi	09	114	2017-02-05 21:20:19.013292	2017-02-05 21:20:19.013292
1539	Gunma	10	114	2017-02-05 21:20:19.017808	2017-02-05 21:20:19.017808
1540	Saitama	11	114	2017-02-05 21:20:19.022204	2017-02-05 21:20:19.022204
1541	Chiba	12	114	2017-02-05 21:20:19.026397	2017-02-05 21:20:19.026397
1542	Tokyo	13	114	2017-02-05 21:20:19.030745	2017-02-05 21:20:19.030745
1543	Kanagawa	14	114	2017-02-05 21:20:19.035808	2017-02-05 21:20:19.035808
1544	Niigata	15	114	2017-02-05 21:20:19.041897	2017-02-05 21:20:19.041897
1545	Toyama	16	114	2017-02-05 21:20:19.048407	2017-02-05 21:20:19.048407
1546	Ishikawa	17	114	2017-02-05 21:20:19.054776	2017-02-05 21:20:19.054776
1547	Fukui	18	114	2017-02-05 21:20:19.061496	2017-02-05 21:20:19.061496
1548	Yamanashi	19	114	2017-02-05 21:20:19.069084	2017-02-05 21:20:19.069084
1549	Nagano	20	114	2017-02-05 21:20:19.076465	2017-02-05 21:20:19.076465
1550	Gifu	21	114	2017-02-05 21:20:19.083095	2017-02-05 21:20:19.083095
1551	Shizuoka	22	114	2017-02-05 21:20:19.088651	2017-02-05 21:20:19.088651
1552	Aichi	23	114	2017-02-05 21:20:19.095157	2017-02-05 21:20:19.095157
1553	Mie	24	114	2017-02-05 21:20:19.102492	2017-02-05 21:20:19.102492
1554	Shiga	25	114	2017-02-05 21:20:19.109187	2017-02-05 21:20:19.109187
1555	Kyoto	26	114	2017-02-05 21:20:19.118021	2017-02-05 21:20:19.118021
1556	Osaka	27	114	2017-02-05 21:20:19.125858	2017-02-05 21:20:19.125858
1557	Hyogo	28	114	2017-02-05 21:20:19.133794	2017-02-05 21:20:19.133794
1558	Nara	29	114	2017-02-05 21:20:19.140173	2017-02-05 21:20:19.140173
1559	Wakayama	30	114	2017-02-05 21:20:19.14714	2017-02-05 21:20:19.14714
1560	Tottori	31	114	2017-02-05 21:20:19.154304	2017-02-05 21:20:19.154304
1561	Shimane	32	114	2017-02-05 21:20:19.159855	2017-02-05 21:20:19.159855
1562	Okayama	33	114	2017-02-05 21:20:19.178297	2017-02-05 21:20:19.178297
1563	Hiroshima	34	114	2017-02-05 21:20:19.185384	2017-02-05 21:20:19.185384
1564	Yamaguchi	35	114	2017-02-05 21:20:19.192508	2017-02-05 21:20:19.192508
1565	Tokushima	36	114	2017-02-05 21:20:19.199312	2017-02-05 21:20:19.199312
1566	Kagawa	37	114	2017-02-05 21:20:19.206532	2017-02-05 21:20:19.206532
1567	Ehime	38	114	2017-02-05 21:20:19.214644	2017-02-05 21:20:19.214644
1568	Kochi	39	114	2017-02-05 21:20:19.223909	2017-02-05 21:20:19.223909
1569	Fukuoka	40	114	2017-02-05 21:20:19.23234	2017-02-05 21:20:19.23234
1570	Saga	41	114	2017-02-05 21:20:19.240297	2017-02-05 21:20:19.240297
1571	Nagasaki	42	114	2017-02-05 21:20:19.247533	2017-02-05 21:20:19.247533
1572	Kumamoto	43	114	2017-02-05 21:20:19.254937	2017-02-05 21:20:19.254937
1573	Oita	44	114	2017-02-05 21:20:19.262179	2017-02-05 21:20:19.262179
1574	Miyazaki	45	114	2017-02-05 21:20:19.271714	2017-02-05 21:20:19.271714
1575	Kagoshima	46	114	2017-02-05 21:20:19.281075	2017-02-05 21:20:19.281075
1576	Okinawa	47	114	2017-02-05 21:20:19.289825	2017-02-05 21:20:19.289825
1577	Nairobi Municipality	110	115	2017-02-05 21:20:19.299328	2017-02-05 21:20:19.299328
1578	Central	200	115	2017-02-05 21:20:19.30853	2017-02-05 21:20:19.30853
1579	Coast	300	115	2017-02-05 21:20:19.31586	2017-02-05 21:20:19.31586
1580	Eastern	400	115	2017-02-05 21:20:19.323444	2017-02-05 21:20:19.323444
1581	North-Eastern Kaskazini Mashariki	500	115	2017-02-05 21:20:19.332626	2017-02-05 21:20:19.332626
1582	Rift Valley	700	115	2017-02-05 21:20:19.341313	2017-02-05 21:20:19.341313
1583	Western Magharibi	800	115	2017-02-05 21:20:19.350279	2017-02-05 21:20:19.350279
1584	Batken	B	116	2017-02-05 21:20:19.359238	2017-02-05 21:20:19.359238
1585	Chü	C	116	2017-02-05 21:20:19.366458	2017-02-05 21:20:19.366458
1586	Bishkek	GB	116	2017-02-05 21:20:19.374019	2017-02-05 21:20:19.374019
1587	Jalal-Abad	J	116	2017-02-05 21:20:19.380857	2017-02-05 21:20:19.380857
1588	Naryn	N	116	2017-02-05 21:20:19.388044	2017-02-05 21:20:19.388044
1589	Osh	O	116	2017-02-05 21:20:19.394503	2017-02-05 21:20:19.394503
1590	Talas	T	116	2017-02-05 21:20:19.401687	2017-02-05 21:20:19.401687
1591	Ysyk-Köl	Y	116	2017-02-05 21:20:19.410176	2017-02-05 21:20:19.410176
1592	Banteay Mean Chey	1	117	2017-02-05 21:20:19.418795	2017-02-05 21:20:19.418795
1593	Krachoh	10	117	2017-02-05 21:20:19.425272	2017-02-05 21:20:19.425272
1594	Mondol Kiri	11	117	2017-02-05 21:20:19.434019	2017-02-05 21:20:19.434019
1595	Phnom Penh	12	117	2017-02-05 21:20:19.43974	2017-02-05 21:20:19.43974
1596	Preah Vihear	13	117	2017-02-05 21:20:19.445484	2017-02-05 21:20:19.445484
1597	Prey Veaeng	14	117	2017-02-05 21:20:19.452316	2017-02-05 21:20:19.452316
1598	Pousaat	15	117	2017-02-05 21:20:19.458147	2017-02-05 21:20:19.458147
1599	Rotanak Kiri	16	117	2017-02-05 21:20:19.46513	2017-02-05 21:20:19.46513
1600	Siem Reab	17	117	2017-02-05 21:20:19.473017	2017-02-05 21:20:19.473017
1601	Krong Preah Sihanouk	18	117	2017-02-05 21:20:19.480191	2017-02-05 21:20:19.480191
1602	Stueng Traeng	19	117	2017-02-05 21:20:19.488043	2017-02-05 21:20:19.488043
1603	Battambang	2	117	2017-02-05 21:20:19.495196	2017-02-05 21:20:19.495196
1604	Svaay Rieng	20	117	2017-02-05 21:20:19.503133	2017-02-05 21:20:19.503133
1605	Taakaev	21	117	2017-02-05 21:20:19.509002	2017-02-05 21:20:19.509002
1606	Otdar Mean Chey	22	117	2017-02-05 21:20:19.514083	2017-02-05 21:20:19.514083
1607	Krong Kaeb	23	117	2017-02-05 21:20:19.520027	2017-02-05 21:20:19.520027
1608	Krong Pailin	24	117	2017-02-05 21:20:19.526848	2017-02-05 21:20:19.526848
1609	Kampong Cham	3	117	2017-02-05 21:20:19.532279	2017-02-05 21:20:19.532279
1610	Kampong Chhnang	4	117	2017-02-05 21:20:19.537869	2017-02-05 21:20:19.537869
1611	Kampong Speu	5	117	2017-02-05 21:20:19.545488	2017-02-05 21:20:19.545488
1612	Kampong Thom	6	117	2017-02-05 21:20:19.551463	2017-02-05 21:20:19.551463
1613	Kampot	7	117	2017-02-05 21:20:19.55684	2017-02-05 21:20:19.55684
1614	Kandal	8	117	2017-02-05 21:20:19.562422	2017-02-05 21:20:19.562422
1615	Kach Kong	9	117	2017-02-05 21:20:19.567806	2017-02-05 21:20:19.567806
1616	Gilbert Islands	G	118	2017-02-05 21:20:19.574819	2017-02-05 21:20:19.574819
1617	Line Islands	L	118	2017-02-05 21:20:19.58237	2017-02-05 21:20:19.58237
1618	Phoenix Islands	P	118	2017-02-05 21:20:19.605335	2017-02-05 21:20:19.605335
1619	Andjouân (Anjwān)	A	119	2017-02-05 21:20:19.624275	2017-02-05 21:20:19.624275
1620	Andjazîdja (Anjazījah)	G	119	2017-02-05 21:20:19.638378	2017-02-05 21:20:19.638378
1621	Moûhîlî (Mūhīlī)	M	119	2017-02-05 21:20:19.658198	2017-02-05 21:20:19.658198
1622	Saint Kitts	K	120	2017-02-05 21:20:19.686667	2017-02-05 21:20:19.686667
1623	Nevis	N	120	2017-02-05 21:20:19.702574	2017-02-05 21:20:19.702574
1624	P’yŏngyang	01	121	2017-02-05 21:20:19.714082	2017-02-05 21:20:19.714082
1625	P’yŏngan-namdo	02	121	2017-02-05 21:20:19.727314	2017-02-05 21:20:19.727314
1626	P’yŏngan-bukto	03	121	2017-02-05 21:20:19.738361	2017-02-05 21:20:19.738361
1627	Chagang-do	04	121	2017-02-05 21:20:19.74762	2017-02-05 21:20:19.74762
1628	Hwanghae-namdo	05	121	2017-02-05 21:20:19.756454	2017-02-05 21:20:19.756454
1629	Hwanghae-bukto	06	121	2017-02-05 21:20:19.764842	2017-02-05 21:20:19.764842
1630	Kangwŏn-do	07	121	2017-02-05 21:20:19.774485	2017-02-05 21:20:19.774485
1631	Hamgyŏng-namdo	08	121	2017-02-05 21:20:19.785364	2017-02-05 21:20:19.785364
1632	Hamgyŏng-bukto	09	121	2017-02-05 21:20:19.797461	2017-02-05 21:20:19.797461
1633	Yanggang-do	10	121	2017-02-05 21:20:19.808077	2017-02-05 21:20:19.808077
1634	Nasŏn (Najin-Sŏnbong)	13	121	2017-02-05 21:20:19.819275	2017-02-05 21:20:19.819275
1635	Seoul Teugbyeolsi	11	122	2017-02-05 21:20:19.82849	2017-02-05 21:20:19.82849
1636	Busan Gwang'yeogsi	26	122	2017-02-05 21:20:19.839893	2017-02-05 21:20:19.839893
1637	Daegu Gwang'yeogsi	27	122	2017-02-05 21:20:19.850373	2017-02-05 21:20:19.850373
1638	Incheon Gwang'yeogsi	28	122	2017-02-05 21:20:19.860379	2017-02-05 21:20:19.860379
1639	Gwangju Gwang'yeogsi	29	122	2017-02-05 21:20:19.872855	2017-02-05 21:20:19.872855
1640	Daejeon Gwang'yeogsi	30	122	2017-02-05 21:20:19.885559	2017-02-05 21:20:19.885559
1641	Ulsan Gwang'yeogsi	31	122	2017-02-05 21:20:19.898081	2017-02-05 21:20:19.898081
1642	Gyeonggido	41	122	2017-02-05 21:20:19.910701	2017-02-05 21:20:19.910701
1643	Gang'weondo	42	122	2017-02-05 21:20:19.92184	2017-02-05 21:20:19.92184
1644	Chungcheongbukdo	43	122	2017-02-05 21:20:19.934469	2017-02-05 21:20:19.934469
1645	Chungcheongnamdo	44	122	2017-02-05 21:20:19.94541	2017-02-05 21:20:19.94541
1646	Jeonrabukdo	45	122	2017-02-05 21:20:19.958263	2017-02-05 21:20:19.958263
1647	Jeonranamdo	46	122	2017-02-05 21:20:19.968034	2017-02-05 21:20:19.968034
1648	Gyeongsangbukdo	47	122	2017-02-05 21:20:19.97791	2017-02-05 21:20:19.97791
1649	Gyeongsangnamdo	48	122	2017-02-05 21:20:19.985937	2017-02-05 21:20:19.985937
1650	Jejudo	49	122	2017-02-05 21:20:19.995479	2017-02-05 21:20:19.995479
1651	Al Ahmadi	AH	123	2017-02-05 21:20:20.009798	2017-02-05 21:20:20.009798
1652	Al Farwānīyah	FA	123	2017-02-05 21:20:20.019357	2017-02-05 21:20:20.019357
1653	Hawallī	HA	123	2017-02-05 21:20:20.026996	2017-02-05 21:20:20.026996
1654	Al Jahrrā’	JA	123	2017-02-05 21:20:20.032618	2017-02-05 21:20:20.032618
1655	Al Kuwayt (Al ‘Āşimah)	KU	123	2017-02-05 21:20:20.038794	2017-02-05 21:20:20.038794
1656	Mubārak al Kabīr	MU	123	2017-02-05 21:20:20.04759	2017-02-05 21:20:20.04759
1657	Aqmola oblysy	AKM	125	2017-02-05 21:20:20.056572	2017-02-05 21:20:20.056572
1658	Aqtöbe oblysy	AKT	125	2017-02-05 21:20:20.065032	2017-02-05 21:20:20.065032
1659	Almaty	ALA	125	2017-02-05 21:20:20.073925	2017-02-05 21:20:20.073925
1660	Almaty oblysy	ALM	125	2017-02-05 21:20:20.083286	2017-02-05 21:20:20.083286
1661	Astana	AST	125	2017-02-05 21:20:20.091117	2017-02-05 21:20:20.091117
1662	Atyraū oblysy	ATY	125	2017-02-05 21:20:20.097506	2017-02-05 21:20:20.097506
1663	Qaraghandy oblysy	KAR	125	2017-02-05 21:20:20.104176	2017-02-05 21:20:20.104176
1664	Qostanay oblysy	KUS	125	2017-02-05 21:20:20.111085	2017-02-05 21:20:20.111085
1665	Qyzylorda oblysy	KZY	125	2017-02-05 21:20:20.118158	2017-02-05 21:20:20.118158
1666	Mangghystaū oblysy	MAN	125	2017-02-05 21:20:20.126006	2017-02-05 21:20:20.126006
1667	Pavlodar oblysy	PAV	125	2017-02-05 21:20:20.132273	2017-02-05 21:20:20.132273
1668	Soltüstik Quzaqstan oblysy	SEV	125	2017-02-05 21:20:20.137871	2017-02-05 21:20:20.137871
1669	Shyghys Qazaqstan oblysy	VOS	125	2017-02-05 21:20:20.144325	2017-02-05 21:20:20.144325
1670	Ongtüstik Qazaqstan oblysy	YUZ	125	2017-02-05 21:20:20.150364	2017-02-05 21:20:20.150364
1671	Batys Quzaqstan oblysy	ZAP	125	2017-02-05 21:20:20.157529	2017-02-05 21:20:20.157529
1672	Zhambyl oblysy	ZHA	125	2017-02-05 21:20:20.162588	2017-02-05 21:20:20.162588
1673	Attapu	AT	126	2017-02-05 21:20:20.169288	2017-02-05 21:20:20.169288
1674	Bokèo	BK	126	2017-02-05 21:20:20.177083	2017-02-05 21:20:20.177083
1675	Bolikhamxai	BL	126	2017-02-05 21:20:20.1841	2017-02-05 21:20:20.1841
1676	Champasak	CH	126	2017-02-05 21:20:20.19043	2017-02-05 21:20:20.19043
1677	Houaphan	HO	126	2017-02-05 21:20:20.195933	2017-02-05 21:20:20.195933
1678	Khammouan	KH	126	2017-02-05 21:20:20.202255	2017-02-05 21:20:20.202255
1679	Louang Namtha	LM	126	2017-02-05 21:20:20.207572	2017-02-05 21:20:20.207572
1680	Louangphabang	LP	126	2017-02-05 21:20:20.21368	2017-02-05 21:20:20.21368
1681	Oudômxai	OU	126	2017-02-05 21:20:20.219794	2017-02-05 21:20:20.219794
1682	Phôngsali	PH	126	2017-02-05 21:20:20.225619	2017-02-05 21:20:20.225619
1683	Salavan	SL	126	2017-02-05 21:20:20.231397	2017-02-05 21:20:20.231397
1684	Savannakhét	SV	126	2017-02-05 21:20:20.237046	2017-02-05 21:20:20.237046
1685	Vientiane	VI	126	2017-02-05 21:20:20.245311	2017-02-05 21:20:20.245311
1686	Vientiane	VT	126	2017-02-05 21:20:20.254297	2017-02-05 21:20:20.254297
1687	Xaignabouli	XA	126	2017-02-05 21:20:20.264316	2017-02-05 21:20:20.264316
1688	Xékong	XE	126	2017-02-05 21:20:20.273952	2017-02-05 21:20:20.273952
1689	Xiangkhoang	XI	126	2017-02-05 21:20:20.282588	2017-02-05 21:20:20.282588
1690	Xiasômboun	XN	126	2017-02-05 21:20:20.288759	2017-02-05 21:20:20.288759
1691	Aakkâr	AK	127	2017-02-05 21:20:20.294665	2017-02-05 21:20:20.294665
1692	Liban-Nord	AS	127	2017-02-05 21:20:20.300624	2017-02-05 21:20:20.300624
1693	Beyrouth	BA	127	2017-02-05 21:20:20.307161	2017-02-05 21:20:20.307161
1694	Baalbek-Hermel	BH	127	2017-02-05 21:20:20.313914	2017-02-05 21:20:20.313914
1695	Béqaa	BI	127	2017-02-05 21:20:20.319715	2017-02-05 21:20:20.319715
1696	Liban-Sud	JA	127	2017-02-05 21:20:20.32552	2017-02-05 21:20:20.32552
1697	Mont-Liban	JL	127	2017-02-05 21:20:20.331632	2017-02-05 21:20:20.331632
1698	Nabatîyé	NA	127	2017-02-05 21:20:20.337379	2017-02-05 21:20:20.337379
1699	Balzers	01	129	2017-02-05 21:20:20.342981	2017-02-05 21:20:20.342981
1700	Eschen	02	129	2017-02-05 21:20:20.348964	2017-02-05 21:20:20.348964
1701	Gamprin	03	129	2017-02-05 21:20:20.355976	2017-02-05 21:20:20.355976
1702	Mauren	04	129	2017-02-05 21:20:20.362691	2017-02-05 21:20:20.362691
1703	Planken	05	129	2017-02-05 21:20:20.368923	2017-02-05 21:20:20.368923
1704	Ruggell	06	129	2017-02-05 21:20:20.376125	2017-02-05 21:20:20.376125
1705	Schaan	07	129	2017-02-05 21:20:20.383656	2017-02-05 21:20:20.383656
1706	Schellenberg	08	129	2017-02-05 21:20:20.39113	2017-02-05 21:20:20.39113
1707	Triesen	09	129	2017-02-05 21:20:20.397313	2017-02-05 21:20:20.397313
1708	Triesenberg	10	129	2017-02-05 21:20:20.4041	2017-02-05 21:20:20.4041
1709	Vaduz	11	129	2017-02-05 21:20:20.410876	2017-02-05 21:20:20.410876
1710	Basnāhira paḷāta	1	130	2017-02-05 21:20:20.417317	2017-02-05 21:20:20.417317
1711	Madhyama paḷāta	2	130	2017-02-05 21:20:20.423508	2017-02-05 21:20:20.423508
1712	Dakuṇu paḷāta	3	130	2017-02-05 21:20:20.429509	2017-02-05 21:20:20.429509
1713	Uturu paḷāta	4	130	2017-02-05 21:20:20.435308	2017-02-05 21:20:20.435308
1714	Næ̆gĕnahira paḷāta	5	130	2017-02-05 21:20:20.440894	2017-02-05 21:20:20.440894
1715	Vayamba paḷāta	6	130	2017-02-05 21:20:20.450904	2017-02-05 21:20:20.450904
1716	Uturumæ̆da paḷāta	7	130	2017-02-05 21:20:20.459065	2017-02-05 21:20:20.459065
1717	Ūva paḷāta	8	130	2017-02-05 21:20:20.469223	2017-02-05 21:20:20.469223
1718	Sabaragamuva paḷāta	9	130	2017-02-05 21:20:20.478282	2017-02-05 21:20:20.478282
1719	Bong	BG	131	2017-02-05 21:20:20.486286	2017-02-05 21:20:20.486286
1720	Bomi	BM	131	2017-02-05 21:20:20.494131	2017-02-05 21:20:20.494131
1721	Grand Cape Mount	CM	131	2017-02-05 21:20:20.499885	2017-02-05 21:20:20.499885
1722	Grand Bassa	GB	131	2017-02-05 21:20:20.505888	2017-02-05 21:20:20.505888
1723	Grand Gedeh	GG	131	2017-02-05 21:20:20.513065	2017-02-05 21:20:20.513065
1724	Grand Kru	GK	131	2017-02-05 21:20:20.51868	2017-02-05 21:20:20.51868
1725	Lofa	LO	131	2017-02-05 21:20:20.524115	2017-02-05 21:20:20.524115
1726	Margibi	MG	131	2017-02-05 21:20:20.52932	2017-02-05 21:20:20.52932
1727	Montserrado	MO	131	2017-02-05 21:20:20.535027	2017-02-05 21:20:20.535027
1728	Maryland	MY	131	2017-02-05 21:20:20.540367	2017-02-05 21:20:20.540367
1729	Nimba	NI	131	2017-02-05 21:20:20.546087	2017-02-05 21:20:20.546087
1730	Rivercess	RI	131	2017-02-05 21:20:20.552747	2017-02-05 21:20:20.552747
1731	Sinoe	SI	131	2017-02-05 21:20:20.558283	2017-02-05 21:20:20.558283
1732	Maseru	A	132	2017-02-05 21:20:20.564813	2017-02-05 21:20:20.564813
1733	Butha-Buthe	B	132	2017-02-05 21:20:20.572839	2017-02-05 21:20:20.572839
1734	Leribe	C	132	2017-02-05 21:20:20.581792	2017-02-05 21:20:20.581792
1735	Berea	D	132	2017-02-05 21:20:20.594096	2017-02-05 21:20:20.594096
1736	Mafeteng	E	132	2017-02-05 21:20:20.603589	2017-02-05 21:20:20.603589
1737	Mohale's Hoek	F	132	2017-02-05 21:20:20.614606	2017-02-05 21:20:20.614606
1738	Quthing	G	132	2017-02-05 21:20:20.628526	2017-02-05 21:20:20.628526
1739	Qacha's Nek	H	132	2017-02-05 21:20:20.637307	2017-02-05 21:20:20.637307
1740	Mokhotlong	J	132	2017-02-05 21:20:20.647927	2017-02-05 21:20:20.647927
1741	Thaba-Tseka	K	132	2017-02-05 21:20:20.657141	2017-02-05 21:20:20.657141
1742	Alytaus Apskritis	AL	133	2017-02-05 21:20:20.672733	2017-02-05 21:20:20.672733
1743	Klaipėdos Apskritis	KL	133	2017-02-05 21:20:20.686161	2017-02-05 21:20:20.686161
1744	Kauno Apskritis	KU	133	2017-02-05 21:20:20.696863	2017-02-05 21:20:20.696863
1745	Marijampolės Apskritis	MR	133	2017-02-05 21:20:20.705841	2017-02-05 21:20:20.705841
1746	Panevėžio Apskritis	PN	133	2017-02-05 21:20:20.71542	2017-02-05 21:20:20.71542
1747	Šiaulių Apskritis	SA	133	2017-02-05 21:20:20.725846	2017-02-05 21:20:20.725846
1748	Tauragés Apskritis	TA	133	2017-02-05 21:20:20.733747	2017-02-05 21:20:20.733747
1749	Telšių Apskritis	TE	133	2017-02-05 21:20:20.741444	2017-02-05 21:20:20.741444
1750	Utenos Apskritis	UT	133	2017-02-05 21:20:20.751012	2017-02-05 21:20:20.751012
1751	Vilniaus Apskritis	VL	133	2017-02-05 21:20:20.762408	2017-02-05 21:20:20.762408
1752	Diekirch	D	134	2017-02-05 21:20:20.776359	2017-02-05 21:20:20.776359
1753	Grevenmacher	G	134	2017-02-05 21:20:20.789059	2017-02-05 21:20:20.789059
1754	Luxembourg	L	134	2017-02-05 21:20:20.802632	2017-02-05 21:20:20.802632
1755	Aglonas novads	001	135	2017-02-05 21:20:20.814496	2017-02-05 21:20:20.814496
1756	Aizkraukles novads	002	135	2017-02-05 21:20:20.823538	2017-02-05 21:20:20.823538
1757	Aizputes novads	003	135	2017-02-05 21:20:20.832778	2017-02-05 21:20:20.832778
1758	Aknīstes novads	004	135	2017-02-05 21:20:20.846535	2017-02-05 21:20:20.846535
1759	Alojas novads	005	135	2017-02-05 21:20:20.855445	2017-02-05 21:20:20.855445
1760	Alsungas novads	006	135	2017-02-05 21:20:20.863854	2017-02-05 21:20:20.863854
1761	Alūksnes novads	007	135	2017-02-05 21:20:20.872449	2017-02-05 21:20:20.872449
1762	Amatas novads	008	135	2017-02-05 21:20:20.880503	2017-02-05 21:20:20.880503
1763	Apes novads	009	135	2017-02-05 21:20:20.891181	2017-02-05 21:20:20.891181
1764	Auces novads	010	135	2017-02-05 21:20:20.900346	2017-02-05 21:20:20.900346
1765	Ādažu novads	011	135	2017-02-05 21:20:20.908468	2017-02-05 21:20:20.908468
1766	Babītes novads	012	135	2017-02-05 21:20:20.916647	2017-02-05 21:20:20.916647
1767	Baldones novads	013	135	2017-02-05 21:20:20.925535	2017-02-05 21:20:20.925535
1768	Baltinavas novads	014	135	2017-02-05 21:20:20.933633	2017-02-05 21:20:20.933633
1769	Balvu novads	015	135	2017-02-05 21:20:20.941949	2017-02-05 21:20:20.941949
1770	Bauskas novads	016	135	2017-02-05 21:20:20.949888	2017-02-05 21:20:20.949888
1771	Beverīnas novads	017	135	2017-02-05 21:20:20.958304	2017-02-05 21:20:20.958304
1772	Brocēnu novads	018	135	2017-02-05 21:20:20.97346	2017-02-05 21:20:20.97346
1773	Burtnieku novads	019	135	2017-02-05 21:20:20.988282	2017-02-05 21:20:20.988282
1774	Carnikavas novads	020	135	2017-02-05 21:20:21.003958	2017-02-05 21:20:21.003958
1775	Cesvaines novads	021	135	2017-02-05 21:20:21.021151	2017-02-05 21:20:21.021151
1776	Cēsu novads	022	135	2017-02-05 21:20:21.031597	2017-02-05 21:20:21.031597
1777	Ciblas novads	023	135	2017-02-05 21:20:21.039596	2017-02-05 21:20:21.039596
1778	Dagdas novads	024	135	2017-02-05 21:20:21.047742	2017-02-05 21:20:21.047742
1779	Daugavpils novads	025	135	2017-02-05 21:20:21.058213	2017-02-05 21:20:21.058213
1780	Dobeles novads	026	135	2017-02-05 21:20:21.066425	2017-02-05 21:20:21.066425
1781	Dundagas novads	027	135	2017-02-05 21:20:21.075584	2017-02-05 21:20:21.075584
1782	Durbes novads	028	135	2017-02-05 21:20:21.083799	2017-02-05 21:20:21.083799
1783	Engures novads	029	135	2017-02-05 21:20:21.093272	2017-02-05 21:20:21.093272
1784	Ērgļu novads	030	135	2017-02-05 21:20:21.104848	2017-02-05 21:20:21.104848
1785	Garkalnes novads	031	135	2017-02-05 21:20:21.114536	2017-02-05 21:20:21.114536
1786	Grobiņas novads	032	135	2017-02-05 21:20:21.121968	2017-02-05 21:20:21.121968
1787	Gulbenes novads	033	135	2017-02-05 21:20:21.129684	2017-02-05 21:20:21.129684
1788	Iecavas novads	034	135	2017-02-05 21:20:21.135922	2017-02-05 21:20:21.135922
1789	Ikšķiles novads	035	135	2017-02-05 21:20:21.141833	2017-02-05 21:20:21.141833
1790	Ilūkstes novads	036	135	2017-02-05 21:20:21.149694	2017-02-05 21:20:21.149694
1791	Inčukalna novads	037	135	2017-02-05 21:20:21.156427	2017-02-05 21:20:21.156427
1792	Jaunjelgavas novads	038	135	2017-02-05 21:20:21.167652	2017-02-05 21:20:21.167652
1793	Jaunpiebalgas novads	039	135	2017-02-05 21:20:21.176514	2017-02-05 21:20:21.176514
1794	Jaunpils novads	040	135	2017-02-05 21:20:21.18492	2017-02-05 21:20:21.18492
1795	Jelgavas novads	041	135	2017-02-05 21:20:21.191302	2017-02-05 21:20:21.191302
1796	Jēkabpils novads	042	135	2017-02-05 21:20:21.197092	2017-02-05 21:20:21.197092
1797	Kandavas novads	043	135	2017-02-05 21:20:21.203145	2017-02-05 21:20:21.203145
1798	Kārsavas novads	044	135	2017-02-05 21:20:21.209127	2017-02-05 21:20:21.209127
1799	Kocēnu novads	045	135	2017-02-05 21:20:21.215933	2017-02-05 21:20:21.215933
1800	Kokneses novads	046	135	2017-02-05 21:20:21.222958	2017-02-05 21:20:21.222958
1801	Krāslavas novads	047	135	2017-02-05 21:20:21.229221	2017-02-05 21:20:21.229221
1802	Krimuldas novads	048	135	2017-02-05 21:20:21.235502	2017-02-05 21:20:21.235502
1803	Krustpils novads	049	135	2017-02-05 21:20:21.241825	2017-02-05 21:20:21.241825
1804	Kuldīgas novads	050	135	2017-02-05 21:20:21.248135	2017-02-05 21:20:21.248135
1805	Ķeguma novads	051	135	2017-02-05 21:20:21.254472	2017-02-05 21:20:21.254472
1806	Ķekavas novads	052	135	2017-02-05 21:20:21.260819	2017-02-05 21:20:21.260819
1807	Lielvārdes novads	053	135	2017-02-05 21:20:21.267661	2017-02-05 21:20:21.267661
1808	Limbažu novads	054	135	2017-02-05 21:20:21.273934	2017-02-05 21:20:21.273934
1809	Līgatnes novads	055	135	2017-02-05 21:20:21.280145	2017-02-05 21:20:21.280145
1810	Līvānu novads	056	135	2017-02-05 21:20:21.285805	2017-02-05 21:20:21.285805
1811	Lubānas novads	057	135	2017-02-05 21:20:21.291861	2017-02-05 21:20:21.291861
1812	Ludzas novads	058	135	2017-02-05 21:20:21.297961	2017-02-05 21:20:21.297961
1813	Madonas novads	059	135	2017-02-05 21:20:21.303939	2017-02-05 21:20:21.303939
1814	Mazsalacas novads	060	135	2017-02-05 21:20:21.310021	2017-02-05 21:20:21.310021
1815	Mālpils novads	061	135	2017-02-05 21:20:21.315882	2017-02-05 21:20:21.315882
1816	Mārupes novads	062	135	2017-02-05 21:20:21.320974	2017-02-05 21:20:21.320974
1817	Mērsraga novads	063	135	2017-02-05 21:20:21.326508	2017-02-05 21:20:21.326508
1818	Naukšēnu novads	064	135	2017-02-05 21:20:21.331929	2017-02-05 21:20:21.331929
1819	Neretas novads	065	135	2017-02-05 21:20:21.336921	2017-02-05 21:20:21.336921
1820	Nīcas novads	066	135	2017-02-05 21:20:21.343507	2017-02-05 21:20:21.343507
1821	Ogres novads	067	135	2017-02-05 21:20:21.351964	2017-02-05 21:20:21.351964
1822	Olaines novads	068	135	2017-02-05 21:20:21.361931	2017-02-05 21:20:21.361931
1823	Ozolnieku novads	069	135	2017-02-05 21:20:21.36995	2017-02-05 21:20:21.36995
1824	Pārgaujas novads	070	135	2017-02-05 21:20:21.376372	2017-02-05 21:20:21.376372
1825	Pāvilostas novads	071	135	2017-02-05 21:20:21.382544	2017-02-05 21:20:21.382544
1826	Pļaviņu novads	072	135	2017-02-05 21:20:21.391204	2017-02-05 21:20:21.391204
1827	Preiļu novads	073	135	2017-02-05 21:20:21.398052	2017-02-05 21:20:21.398052
1828	Priekules novads	074	135	2017-02-05 21:20:21.404271	2017-02-05 21:20:21.404271
1829	Priekuļu novads	075	135	2017-02-05 21:20:21.409863	2017-02-05 21:20:21.409863
1830	Raunas novads	076	135	2017-02-05 21:20:21.417217	2017-02-05 21:20:21.417217
1943	Drochia	DR	139	2017-02-05 21:20:22.297057	2017-02-05 21:20:22.297057
1831	Rēzeknes novads	077	135	2017-02-05 21:20:21.423676	2017-02-05 21:20:21.423676
1832	Riebiņu novads	078	135	2017-02-05 21:20:21.429929	2017-02-05 21:20:21.429929
1833	Rojas novads	079	135	2017-02-05 21:20:21.436469	2017-02-05 21:20:21.436469
1834	Ropažu novads	080	135	2017-02-05 21:20:21.444633	2017-02-05 21:20:21.444633
1835	Rucavas novads	081	135	2017-02-05 21:20:21.452787	2017-02-05 21:20:21.452787
1836	Rugāju novads	082	135	2017-02-05 21:20:21.460971	2017-02-05 21:20:21.460971
1837	Rundāles novads	083	135	2017-02-05 21:20:21.469036	2017-02-05 21:20:21.469036
1838	Rūjienas novads	084	135	2017-02-05 21:20:21.477358	2017-02-05 21:20:21.477358
1839	Salas novads	085	135	2017-02-05 21:20:21.485032	2017-02-05 21:20:21.485032
1840	Salacgrīvas novads	086	135	2017-02-05 21:20:21.493231	2017-02-05 21:20:21.493231
1841	Salaspils novads	087	135	2017-02-05 21:20:21.499033	2017-02-05 21:20:21.499033
1842	Saldus novads	088	135	2017-02-05 21:20:21.504879	2017-02-05 21:20:21.504879
1843	Saulkrastu novads	089	135	2017-02-05 21:20:21.511572	2017-02-05 21:20:21.511572
1844	Sējas novads	090	135	2017-02-05 21:20:21.517552	2017-02-05 21:20:21.517552
1845	Siguldas novads	091	135	2017-02-05 21:20:21.523103	2017-02-05 21:20:21.523103
1846	Skrīveru novads	092	135	2017-02-05 21:20:21.529694	2017-02-05 21:20:21.529694
1847	Skrundas novads	093	135	2017-02-05 21:20:21.535322	2017-02-05 21:20:21.535322
1848	Smiltenes novads	094	135	2017-02-05 21:20:21.540875	2017-02-05 21:20:21.540875
1849	Stopiņu novads	095	135	2017-02-05 21:20:21.546451	2017-02-05 21:20:21.546451
1850	Strenču novads	096	135	2017-02-05 21:20:21.552344	2017-02-05 21:20:21.552344
1851	Talsu novads	097	135	2017-02-05 21:20:21.557702	2017-02-05 21:20:21.557702
1852	Tērvetes novads	098	135	2017-02-05 21:20:21.563261	2017-02-05 21:20:21.563261
1853	Tukuma novads	099	135	2017-02-05 21:20:21.568794	2017-02-05 21:20:21.568794
1854	Vaiņodes novads	100	135	2017-02-05 21:20:21.574048	2017-02-05 21:20:21.574048
1855	Valkas novads	101	135	2017-02-05 21:20:21.57943	2017-02-05 21:20:21.57943
1856	Varakļānu novads	102	135	2017-02-05 21:20:21.585151	2017-02-05 21:20:21.585151
1857	Vārkavas novads	103	135	2017-02-05 21:20:21.590817	2017-02-05 21:20:21.590817
1858	Vecpiebalgas novads	104	135	2017-02-05 21:20:21.5964	2017-02-05 21:20:21.5964
1859	Vecumnieku novads	105	135	2017-02-05 21:20:21.601808	2017-02-05 21:20:21.601808
1860	Ventspils novads	106	135	2017-02-05 21:20:21.607552	2017-02-05 21:20:21.607552
1861	Viesītes novads	107	135	2017-02-05 21:20:21.615077	2017-02-05 21:20:21.615077
1862	Viļakas novads	108	135	2017-02-05 21:20:21.623037	2017-02-05 21:20:21.623037
1863	Viļānu novads	109	135	2017-02-05 21:20:21.629007	2017-02-05 21:20:21.629007
1864	Zilupes novads	110	135	2017-02-05 21:20:21.635324	2017-02-05 21:20:21.635324
1865	Daugavpils	DGV	135	2017-02-05 21:20:21.641067	2017-02-05 21:20:21.641067
1866	Jelgava	JEL	135	2017-02-05 21:20:21.646729	2017-02-05 21:20:21.646729
1867	Jēkabpils	JKB	135	2017-02-05 21:20:21.653893	2017-02-05 21:20:21.653893
1868	Jūrmala	JUR	135	2017-02-05 21:20:21.661188	2017-02-05 21:20:21.661188
1869	Liepāja	LPX	135	2017-02-05 21:20:21.668302	2017-02-05 21:20:21.668302
1870	Rēzekne	REZ	135	2017-02-05 21:20:21.675016	2017-02-05 21:20:21.675016
1871	Rīga	RIX	135	2017-02-05 21:20:21.681984	2017-02-05 21:20:21.681984
1872	Ventspils	VEN	135	2017-02-05 21:20:21.689731	2017-02-05 21:20:21.689731
1873	Valmiera	VMR	135	2017-02-05 21:20:21.697307	2017-02-05 21:20:21.697307
1874	Banghāzī	BA	136	2017-02-05 21:20:21.705458	2017-02-05 21:20:21.705458
1875	Al Buţnān	BU	136	2017-02-05 21:20:21.713018	2017-02-05 21:20:21.713018
1876	Darnah	DR	136	2017-02-05 21:20:21.72025	2017-02-05 21:20:21.72025
1877	Ghāt	GT	136	2017-02-05 21:20:21.726885	2017-02-05 21:20:21.726885
1878	Al Jabal al Akhḑar	JA	136	2017-02-05 21:20:21.733102	2017-02-05 21:20:21.733102
1879	Jaghbūb	JB	136	2017-02-05 21:20:21.738743	2017-02-05 21:20:21.738743
1880	Al Jabal al Gharbī	JG	136	2017-02-05 21:20:21.74432	2017-02-05 21:20:21.74432
1881	Al Jifārah	JI	136	2017-02-05 21:20:21.750526	2017-02-05 21:20:21.750526
1882	Al Jufrah	JU	136	2017-02-05 21:20:21.756617	2017-02-05 21:20:21.756617
1883	Al Kufrah	KF	136	2017-02-05 21:20:21.762891	2017-02-05 21:20:21.762891
1884	Al Marqab	MB	136	2017-02-05 21:20:21.770795	2017-02-05 21:20:21.770795
1885	Mişrātah	MI	136	2017-02-05 21:20:21.779656	2017-02-05 21:20:21.779656
1886	Al Marj	MJ	136	2017-02-05 21:20:21.787312	2017-02-05 21:20:21.787312
1887	Murzuq	MQ	136	2017-02-05 21:20:21.794915	2017-02-05 21:20:21.794915
1888	Nālūt	NL	136	2017-02-05 21:20:21.803463	2017-02-05 21:20:21.803463
1889	An Nuqaţ al Khams	NQ	136	2017-02-05 21:20:21.814753	2017-02-05 21:20:21.814753
1890	Sabhā	SB	136	2017-02-05 21:20:21.82183	2017-02-05 21:20:21.82183
1891	Surt	SR	136	2017-02-05 21:20:21.832233	2017-02-05 21:20:21.832233
1892	Ţarābulus	TB	136	2017-02-05 21:20:21.840829	2017-02-05 21:20:21.840829
1893	Al Wāḩāt	WA	136	2017-02-05 21:20:21.849073	2017-02-05 21:20:21.849073
1894	Wādī al Ḩayāt	WD	136	2017-02-05 21:20:21.857754	2017-02-05 21:20:21.857754
1895	Wādī ash Shāţiʾ	WS	136	2017-02-05 21:20:21.865795	2017-02-05 21:20:21.865795
1896	Az Zāwiyah	ZA	136	2017-02-05 21:20:21.874028	2017-02-05 21:20:21.874028
1897	Tanger-Tétouan	01	137	2017-02-05 21:20:21.88205	2017-02-05 21:20:21.88205
1898	Gharb-Chrarda-Beni Hssen	02	137	2017-02-05 21:20:21.889009	2017-02-05 21:20:21.889009
1899	Taza-Al Hoceima-Taounate	03	137	2017-02-05 21:20:21.896166	2017-02-05 21:20:21.896166
1900	L'Oriental	04	137	2017-02-05 21:20:21.903158	2017-02-05 21:20:21.903158
1901	Fès-Boulemane	05	137	2017-02-05 21:20:21.911344	2017-02-05 21:20:21.911344
1902	Meknès-Tafilalet	06	137	2017-02-05 21:20:21.919907	2017-02-05 21:20:21.919907
1903	Rabat-Salé-Zemmour-Zaer	07	137	2017-02-05 21:20:21.928246	2017-02-05 21:20:21.928246
1904	Grand Casablanca	08	137	2017-02-05 21:20:21.936441	2017-02-05 21:20:21.936441
1905	Chaouia-Ouardigha	09	137	2017-02-05 21:20:21.948525	2017-02-05 21:20:21.948525
1906	Doukhala-Abda	10	137	2017-02-05 21:20:21.960145	2017-02-05 21:20:21.960145
1907	Marrakech-Tensift-Al Haouz	11	137	2017-02-05 21:20:21.971687	2017-02-05 21:20:21.971687
1908	Tadla-Azilal	12	137	2017-02-05 21:20:21.983987	2017-02-05 21:20:21.983987
1909	Sous-Massa-Draa	13	137	2017-02-05 21:20:21.993497	2017-02-05 21:20:21.993497
1910	Guelmim-Es Smara	14	137	2017-02-05 21:20:22.003806	2017-02-05 21:20:22.003806
1911	Laâyoune-Boujdour-Sakia el Hamra	15	137	2017-02-05 21:20:22.031428	2017-02-05 21:20:22.031428
1912	Oued ed Dahab-Lagouira	16	137	2017-02-05 21:20:22.040193	2017-02-05 21:20:22.040193
1913	La Colle	CL	138	2017-02-05 21:20:22.049967	2017-02-05 21:20:22.049967
1914	La Condamine	CO	138	2017-02-05 21:20:22.058722	2017-02-05 21:20:22.058722
1915	Fontvieille	FO	138	2017-02-05 21:20:22.068082	2017-02-05 21:20:22.068082
1916	La Gare	GA	138	2017-02-05 21:20:22.076766	2017-02-05 21:20:22.076766
1917	Jardin Exotique	JE	138	2017-02-05 21:20:22.08623	2017-02-05 21:20:22.08623
1918	Larvotto	LA	138	2017-02-05 21:20:22.095185	2017-02-05 21:20:22.095185
1919	Malbousquet	MA	138	2017-02-05 21:20:22.104144	2017-02-05 21:20:22.104144
1920	Monte-Carlo	MC	138	2017-02-05 21:20:22.113027	2017-02-05 21:20:22.113027
1921	Moneghetti	MG	138	2017-02-05 21:20:22.121424	2017-02-05 21:20:22.121424
1922	Monaco-Ville	MO	138	2017-02-05 21:20:22.133212	2017-02-05 21:20:22.133212
1923	Moulins	MU	138	2017-02-05 21:20:22.142685	2017-02-05 21:20:22.142685
1924	Port-Hercule	PH	138	2017-02-05 21:20:22.152112	2017-02-05 21:20:22.152112
1925	Sainte-Dévote	SD	138	2017-02-05 21:20:22.15983	2017-02-05 21:20:22.15983
1926	La Source	SO	138	2017-02-05 21:20:22.167448	2017-02-05 21:20:22.167448
1927	Spélugues	SP	138	2017-02-05 21:20:22.174745	2017-02-05 21:20:22.174745
1928	Saint-Roman	SR	138	2017-02-05 21:20:22.182609	2017-02-05 21:20:22.182609
1929	Vallon de la Rousse	VR	138	2017-02-05 21:20:22.191115	2017-02-05 21:20:22.191115
1930	Anenii Noi	AN	139	2017-02-05 21:20:22.199383	2017-02-05 21:20:22.199383
1931	Bălți	BA	139	2017-02-05 21:20:22.206936	2017-02-05 21:20:22.206936
1932	Tighina	BD	139	2017-02-05 21:20:22.216231	2017-02-05 21:20:22.216231
1933	Briceni	BR	139	2017-02-05 21:20:22.223639	2017-02-05 21:20:22.223639
1934	Basarabeasca	BS	139	2017-02-05 21:20:22.230634	2017-02-05 21:20:22.230634
1935	Cahul	CA	139	2017-02-05 21:20:22.238439	2017-02-05 21:20:22.238439
1936	Călărași	CL	139	2017-02-05 21:20:22.247416	2017-02-05 21:20:22.247416
1937	Cimișlia	CM	139	2017-02-05 21:20:22.257948	2017-02-05 21:20:22.257948
1938	Criuleni	CR	139	2017-02-05 21:20:22.265676	2017-02-05 21:20:22.265676
1939	Căușeni	CS	139	2017-02-05 21:20:22.272906	2017-02-05 21:20:22.272906
1940	Cantemir	CT	139	2017-02-05 21:20:22.279418	2017-02-05 21:20:22.279418
1941	Chișinău	CU	139	2017-02-05 21:20:22.285739	2017-02-05 21:20:22.285739
1942	Dondușeni	DO	139	2017-02-05 21:20:22.291304	2017-02-05 21:20:22.291304
1944	Dubăsari	DU	139	2017-02-05 21:20:22.303089	2017-02-05 21:20:22.303089
1945	Edineț	ED	139	2017-02-05 21:20:22.309691	2017-02-05 21:20:22.309691
1946	Fălești	FA	139	2017-02-05 21:20:22.31694	2017-02-05 21:20:22.31694
1947	Florești	FL	139	2017-02-05 21:20:22.32235	2017-02-05 21:20:22.32235
1948	Găgăuzia, Unitatea teritorială autonomă	GA	139	2017-02-05 21:20:22.327974	2017-02-05 21:20:22.327974
1949	Glodeni	GL	139	2017-02-05 21:20:22.333279	2017-02-05 21:20:22.333279
1950	Hîncești	HI	139	2017-02-05 21:20:22.338585	2017-02-05 21:20:22.338585
1951	Ialoveni	IA	139	2017-02-05 21:20:22.343869	2017-02-05 21:20:22.343869
1952	Leova	LE	139	2017-02-05 21:20:22.349052	2017-02-05 21:20:22.349052
1953	Nisporeni	NI	139	2017-02-05 21:20:22.354166	2017-02-05 21:20:22.354166
1954	Ocnița	OC	139	2017-02-05 21:20:22.359413	2017-02-05 21:20:22.359413
1955	Orhei	OR	139	2017-02-05 21:20:22.36484	2017-02-05 21:20:22.36484
1956	Rezina	RE	139	2017-02-05 21:20:22.370375	2017-02-05 21:20:22.370375
1957	Rîșcani	RI	139	2017-02-05 21:20:22.375568	2017-02-05 21:20:22.375568
1958	Șoldănești	SD	139	2017-02-05 21:20:22.381689	2017-02-05 21:20:22.381689
1959	Sîngerei	SI	139	2017-02-05 21:20:22.387269	2017-02-05 21:20:22.387269
1960	Stînga Nistrului, unitatea teritorială din	SN	139	2017-02-05 21:20:22.394142	2017-02-05 21:20:22.394142
1961	Soroca	SO	139	2017-02-05 21:20:22.401948	2017-02-05 21:20:22.401948
1962	Strășeni	ST	139	2017-02-05 21:20:22.408745	2017-02-05 21:20:22.408745
1963	Ștefan Vodă	SV	139	2017-02-05 21:20:22.415888	2017-02-05 21:20:22.415888
1964	Taraclia	TA	139	2017-02-05 21:20:22.422932	2017-02-05 21:20:22.422932
1965	Telenești	TE	139	2017-02-05 21:20:22.42978	2017-02-05 21:20:22.42978
1966	Ungheni	UN	139	2017-02-05 21:20:22.436452	2017-02-05 21:20:22.436452
1967	Andrijevica	01	140	2017-02-05 21:20:22.44291	2017-02-05 21:20:22.44291
1968	Bar	02	140	2017-02-05 21:20:22.448433	2017-02-05 21:20:22.448433
1969	Berane	03	140	2017-02-05 21:20:22.45581	2017-02-05 21:20:22.45581
1970	Bijelo Polje	04	140	2017-02-05 21:20:22.463414	2017-02-05 21:20:22.463414
1971	Budva	05	140	2017-02-05 21:20:22.471111	2017-02-05 21:20:22.471111
1972	Cetinje	06	140	2017-02-05 21:20:22.479627	2017-02-05 21:20:22.479627
1973	Danilovgrad	07	140	2017-02-05 21:20:22.486705	2017-02-05 21:20:22.486705
1974	Herceg-Novi	08	140	2017-02-05 21:20:22.493511	2017-02-05 21:20:22.493511
1975	Kolašin	09	140	2017-02-05 21:20:22.500109	2017-02-05 21:20:22.500109
1976	Kotor	10	140	2017-02-05 21:20:22.506584	2017-02-05 21:20:22.506584
1977	Mojkovac	11	140	2017-02-05 21:20:22.513768	2017-02-05 21:20:22.513768
1978	Nikšić	12	140	2017-02-05 21:20:22.521793	2017-02-05 21:20:22.521793
1979	Plav	13	140	2017-02-05 21:20:22.528784	2017-02-05 21:20:22.528784
1980	Pljevlja	14	140	2017-02-05 21:20:22.534352	2017-02-05 21:20:22.534352
1981	Plužine	15	140	2017-02-05 21:20:22.539621	2017-02-05 21:20:22.539621
1982	Podgorica	16	140	2017-02-05 21:20:22.544642	2017-02-05 21:20:22.544642
1983	Rožaje	17	140	2017-02-05 21:20:22.549972	2017-02-05 21:20:22.549972
1984	Šavnik	18	140	2017-02-05 21:20:22.554927	2017-02-05 21:20:22.554927
1985	Tivat	19	140	2017-02-05 21:20:22.56025	2017-02-05 21:20:22.56025
1986	Ulcinj	20	140	2017-02-05 21:20:22.565017	2017-02-05 21:20:22.565017
1987	Žabljak	21	140	2017-02-05 21:20:22.570222	2017-02-05 21:20:22.570222
1988	Toamasina	A	142	2017-02-05 21:20:22.575491	2017-02-05 21:20:22.575491
1989	Antsiranana	D	142	2017-02-05 21:20:22.580651	2017-02-05 21:20:22.580651
1990	Fianarantsoa	F	142	2017-02-05 21:20:22.586246	2017-02-05 21:20:22.586246
1991	Mahajanga	M	142	2017-02-05 21:20:22.591044	2017-02-05 21:20:22.591044
1992	Antananarivo	T	142	2017-02-05 21:20:22.596597	2017-02-05 21:20:22.596597
1993	Toliara	U	142	2017-02-05 21:20:22.602524	2017-02-05 21:20:22.602524
1994	Ralik chain	L	143	2017-02-05 21:20:22.608811	2017-02-05 21:20:22.608811
1995	Ratak chain	T	143	2017-02-05 21:20:22.61569	2017-02-05 21:20:22.61569
1996	Aerodrom	01	144	2017-02-05 21:20:22.622571	2017-02-05 21:20:22.622571
1997	Aračinovo	02	144	2017-02-05 21:20:22.628527	2017-02-05 21:20:22.628527
1998	Berovo	03	144	2017-02-05 21:20:22.633483	2017-02-05 21:20:22.633483
1999	Bitola	04	144	2017-02-05 21:20:22.6389	2017-02-05 21:20:22.6389
2000	Bogdanci	05	144	2017-02-05 21:20:22.644309	2017-02-05 21:20:22.644309
2001	Bogovinje	06	144	2017-02-05 21:20:22.650334	2017-02-05 21:20:22.650334
2002	Bosilovo	07	144	2017-02-05 21:20:22.656619	2017-02-05 21:20:22.656619
2003	Brvenica	08	144	2017-02-05 21:20:22.663319	2017-02-05 21:20:22.663319
2004	Butel	09	144	2017-02-05 21:20:22.669216	2017-02-05 21:20:22.669216
2005	Valandovo	10	144	2017-02-05 21:20:22.675554	2017-02-05 21:20:22.675554
2006	Vasilevo	11	144	2017-02-05 21:20:22.681746	2017-02-05 21:20:22.681746
2007	Vevčani	12	144	2017-02-05 21:20:22.689078	2017-02-05 21:20:22.689078
2008	Veles	13	144	2017-02-05 21:20:22.695619	2017-02-05 21:20:22.695619
2009	Vinica	14	144	2017-02-05 21:20:22.703953	2017-02-05 21:20:22.703953
2010	Vraneštica	15	144	2017-02-05 21:20:22.717699	2017-02-05 21:20:22.717699
2011	Vrapčište	16	144	2017-02-05 21:20:22.724919	2017-02-05 21:20:22.724919
2012	Gazi Baba	17	144	2017-02-05 21:20:22.731334	2017-02-05 21:20:22.731334
2013	Gevgelija	18	144	2017-02-05 21:20:22.7388	2017-02-05 21:20:22.7388
2014	Gostivar	19	144	2017-02-05 21:20:22.745965	2017-02-05 21:20:22.745965
2015	Gradsko	20	144	2017-02-05 21:20:22.75316	2017-02-05 21:20:22.75316
2016	Debar	21	144	2017-02-05 21:20:22.76012	2017-02-05 21:20:22.76012
2017	Debarca	22	144	2017-02-05 21:20:22.765474	2017-02-05 21:20:22.765474
2018	Delčevo	23	144	2017-02-05 21:20:22.77047	2017-02-05 21:20:22.77047
2019	Demir Kapija	24	144	2017-02-05 21:20:22.776268	2017-02-05 21:20:22.776268
2020	Demir Hisar	25	144	2017-02-05 21:20:22.783063	2017-02-05 21:20:22.783063
2021	Dojran	26	144	2017-02-05 21:20:22.790151	2017-02-05 21:20:22.790151
2022	Dolneni	27	144	2017-02-05 21:20:22.795797	2017-02-05 21:20:22.795797
2023	Drugovo	28	144	2017-02-05 21:20:22.800918	2017-02-05 21:20:22.800918
2024	Gjorče Petrov	29	144	2017-02-05 21:20:22.805854	2017-02-05 21:20:22.805854
2025	Želino	30	144	2017-02-05 21:20:22.811142	2017-02-05 21:20:22.811142
2026	Zajas	31	144	2017-02-05 21:20:22.81644	2017-02-05 21:20:22.81644
2027	Zelenikovo	32	144	2017-02-05 21:20:22.822314	2017-02-05 21:20:22.822314
2028	Zrnovci	33	144	2017-02-05 21:20:22.827608	2017-02-05 21:20:22.827608
2029	Ilinden	34	144	2017-02-05 21:20:22.833976	2017-02-05 21:20:22.833976
2030	Jegunovce	35	144	2017-02-05 21:20:22.839506	2017-02-05 21:20:22.839506
2031	Kavadarci	36	144	2017-02-05 21:20:22.844556	2017-02-05 21:20:22.844556
2032	Karbinci	37	144	2017-02-05 21:20:22.849799	2017-02-05 21:20:22.849799
2033	Karpoš	38	144	2017-02-05 21:20:22.855075	2017-02-05 21:20:22.855075
2034	Kisela Voda	39	144	2017-02-05 21:20:22.861925	2017-02-05 21:20:22.861925
2035	Kičevo	40	144	2017-02-05 21:20:22.867851	2017-02-05 21:20:22.867851
2036	Konče	41	144	2017-02-05 21:20:22.873182	2017-02-05 21:20:22.873182
2037	Kočani	42	144	2017-02-05 21:20:22.878576	2017-02-05 21:20:22.878576
2038	Kratovo	43	144	2017-02-05 21:20:22.883848	2017-02-05 21:20:22.883848
2039	Kriva Palanka	44	144	2017-02-05 21:20:22.889346	2017-02-05 21:20:22.889346
2040	Krivogaštani	45	144	2017-02-05 21:20:22.894534	2017-02-05 21:20:22.894534
2041	Kruševo	46	144	2017-02-05 21:20:22.899933	2017-02-05 21:20:22.899933
2042	Kumanovo	47	144	2017-02-05 21:20:22.905474	2017-02-05 21:20:22.905474
2043	Lipkovo	48	144	2017-02-05 21:20:22.911959	2017-02-05 21:20:22.911959
2044	Lozovo	49	144	2017-02-05 21:20:22.919001	2017-02-05 21:20:22.919001
2045	Mavrovo-i-Rostuša	50	144	2017-02-05 21:20:22.924432	2017-02-05 21:20:22.924432
2046	Makedonska Kamenica	51	144	2017-02-05 21:20:22.931337	2017-02-05 21:20:22.931337
2047	Makedonski Brod	52	144	2017-02-05 21:20:22.938222	2017-02-05 21:20:22.938222
2048	Mogila	53	144	2017-02-05 21:20:22.945772	2017-02-05 21:20:22.945772
2049	Negotino	54	144	2017-02-05 21:20:22.954194	2017-02-05 21:20:22.954194
2050	Novaci	55	144	2017-02-05 21:20:22.962083	2017-02-05 21:20:22.962083
2051	Novo Selo	56	144	2017-02-05 21:20:22.969436	2017-02-05 21:20:22.969436
2052	Oslomej	57	144	2017-02-05 21:20:22.977044	2017-02-05 21:20:22.977044
2053	Ohrid	58	144	2017-02-05 21:20:22.985391	2017-02-05 21:20:22.985391
2054	Petrovec	59	144	2017-02-05 21:20:22.994012	2017-02-05 21:20:22.994012
2055	Pehčevo	60	144	2017-02-05 21:20:23.002101	2017-02-05 21:20:23.002101
2056	Plasnica	61	144	2017-02-05 21:20:23.009865	2017-02-05 21:20:23.009865
2057	Prilep	62	144	2017-02-05 21:20:23.020758	2017-02-05 21:20:23.020758
2058	Probištip	63	144	2017-02-05 21:20:23.032038	2017-02-05 21:20:23.032038
2059	Radoviš	64	144	2017-02-05 21:20:23.042636	2017-02-05 21:20:23.042636
2060	Rankovce	65	144	2017-02-05 21:20:23.051422	2017-02-05 21:20:23.051422
2061	Resen	66	144	2017-02-05 21:20:23.059498	2017-02-05 21:20:23.059498
2062	Rosoman	67	144	2017-02-05 21:20:23.066957	2017-02-05 21:20:23.066957
2063	Saraj	68	144	2017-02-05 21:20:23.078051	2017-02-05 21:20:23.078051
2064	Sveti Nikole	69	144	2017-02-05 21:20:23.08637	2017-02-05 21:20:23.08637
2065	Sopište	70	144	2017-02-05 21:20:23.095853	2017-02-05 21:20:23.095853
2066	Staro Nagoričane	71	144	2017-02-05 21:20:23.105351	2017-02-05 21:20:23.105351
2067	Struga	72	144	2017-02-05 21:20:23.116461	2017-02-05 21:20:23.116461
2068	Strumica	73	144	2017-02-05 21:20:23.125395	2017-02-05 21:20:23.125395
2069	Studeničani	74	144	2017-02-05 21:20:23.133721	2017-02-05 21:20:23.133721
2070	Tearce	75	144	2017-02-05 21:20:23.141408	2017-02-05 21:20:23.141408
2071	Tetovo	76	144	2017-02-05 21:20:23.149814	2017-02-05 21:20:23.149814
2072	Centar	77	144	2017-02-05 21:20:23.157647	2017-02-05 21:20:23.157647
2073	Centar Župa	78	144	2017-02-05 21:20:23.164484	2017-02-05 21:20:23.164484
2074	Čair	79	144	2017-02-05 21:20:23.17242	2017-02-05 21:20:23.17242
2075	Čaška	80	144	2017-02-05 21:20:23.179256	2017-02-05 21:20:23.179256
2076	Češinovo-Obleševo	81	144	2017-02-05 21:20:23.186597	2017-02-05 21:20:23.186597
2077	Čučer Sandevo	82	144	2017-02-05 21:20:23.195862	2017-02-05 21:20:23.195862
2078	Štip	83	144	2017-02-05 21:20:23.204768	2017-02-05 21:20:23.204768
2079	Šuto Orizari	84	144	2017-02-05 21:20:23.214468	2017-02-05 21:20:23.214468
2080	Kayes	1	145	2017-02-05 21:20:23.223728	2017-02-05 21:20:23.223728
2081	Koulikoro	2	145	2017-02-05 21:20:23.23534	2017-02-05 21:20:23.23534
2082	Sikasso	3	145	2017-02-05 21:20:23.246275	2017-02-05 21:20:23.246275
2083	Ségou	4	145	2017-02-05 21:20:23.257645	2017-02-05 21:20:23.257645
2084	Mopti	5	145	2017-02-05 21:20:23.270879	2017-02-05 21:20:23.270879
2085	Tombouctou	6	145	2017-02-05 21:20:23.284026	2017-02-05 21:20:23.284026
2086	Gao	7	145	2017-02-05 21:20:23.296043	2017-02-05 21:20:23.296043
2087	Kidal	8	145	2017-02-05 21:20:23.305314	2017-02-05 21:20:23.305314
2088	Bamako	BK0	145	2017-02-05 21:20:23.317583	2017-02-05 21:20:23.317583
2089	Sagaing	01	146	2017-02-05 21:20:23.328892	2017-02-05 21:20:23.328892
2090	Bago	02	146	2017-02-05 21:20:23.338456	2017-02-05 21:20:23.338456
2091	Magway	03	146	2017-02-05 21:20:23.345878	2017-02-05 21:20:23.345878
2092	Mandalay	04	146	2017-02-05 21:20:23.354292	2017-02-05 21:20:23.354292
2093	Tanintharyi	05	146	2017-02-05 21:20:23.36428	2017-02-05 21:20:23.36428
2094	Yangon	06	146	2017-02-05 21:20:23.374189	2017-02-05 21:20:23.374189
2095	Ayeyarwady	07	146	2017-02-05 21:20:23.385014	2017-02-05 21:20:23.385014
2096	Kachin	11	146	2017-02-05 21:20:23.393547	2017-02-05 21:20:23.393547
2097	Kayah	12	146	2017-02-05 21:20:23.40114	2017-02-05 21:20:23.40114
2098	Kayin	13	146	2017-02-05 21:20:23.409472	2017-02-05 21:20:23.409472
2099	Chin	14	146	2017-02-05 21:20:23.417411	2017-02-05 21:20:23.417411
2100	Mon	15	146	2017-02-05 21:20:23.425651	2017-02-05 21:20:23.425651
2101	Rakhine	16	146	2017-02-05 21:20:23.434722	2017-02-05 21:20:23.434722
2102	Shan	17	146	2017-02-05 21:20:23.444259	2017-02-05 21:20:23.444259
2103	Orhon	035	147	2017-02-05 21:20:23.455726	2017-02-05 21:20:23.455726
2104	Darhan uul	037	147	2017-02-05 21:20:23.464231	2017-02-05 21:20:23.464231
2105	Hentiy	039	147	2017-02-05 21:20:23.474256	2017-02-05 21:20:23.474256
2106	Hövsgöl	041	147	2017-02-05 21:20:23.482291	2017-02-05 21:20:23.482291
2107	Hovd	043	147	2017-02-05 21:20:23.488657	2017-02-05 21:20:23.488657
2108	Uvs	046	147	2017-02-05 21:20:23.494227	2017-02-05 21:20:23.494227
2109	Töv	047	147	2017-02-05 21:20:23.501506	2017-02-05 21:20:23.501506
2110	Selenge	049	147	2017-02-05 21:20:23.508989	2017-02-05 21:20:23.508989
2111	Sühbaatar	051	147	2017-02-05 21:20:23.515162	2017-02-05 21:20:23.515162
2112	Ömnögovi	053	147	2017-02-05 21:20:23.520696	2017-02-05 21:20:23.520696
2113	Övörhangay	055	147	2017-02-05 21:20:23.526171	2017-02-05 21:20:23.526171
2114	Dzavhan	057	147	2017-02-05 21:20:23.531799	2017-02-05 21:20:23.531799
2115	Dundgovi	059	147	2017-02-05 21:20:23.537913	2017-02-05 21:20:23.537913
2116	Dornod	061	147	2017-02-05 21:20:23.546681	2017-02-05 21:20:23.546681
2117	Dornogovi	063	147	2017-02-05 21:20:23.554214	2017-02-05 21:20:23.554214
2118	Govi-Sumber	064	147	2017-02-05 21:20:23.561254	2017-02-05 21:20:23.561254
2119	Govi-Altay	065	147	2017-02-05 21:20:23.567958	2017-02-05 21:20:23.567958
2120	Bulgan	067	147	2017-02-05 21:20:23.576057	2017-02-05 21:20:23.576057
2121	Bayanhongor	069	147	2017-02-05 21:20:23.58568	2017-02-05 21:20:23.58568
2122	Bayan-Ölgiy	071	147	2017-02-05 21:20:23.594814	2017-02-05 21:20:23.594814
2123	Arhangay	073	147	2017-02-05 21:20:23.604118	2017-02-05 21:20:23.604118
2124	Ulanbaatar	1	147	2017-02-05 21:20:23.613868	2017-02-05 21:20:23.613868
2125	Hodh ech Chargui	01	151	2017-02-05 21:20:23.625871	2017-02-05 21:20:23.625871
2126	Hodh el Charbi	02	151	2017-02-05 21:20:23.636237	2017-02-05 21:20:23.636237
2127	Assaba	03	151	2017-02-05 21:20:23.64603	2017-02-05 21:20:23.64603
2128	Gorgol	04	151	2017-02-05 21:20:23.65558	2017-02-05 21:20:23.65558
2129	Brakna	05	151	2017-02-05 21:20:23.667802	2017-02-05 21:20:23.667802
2130	Trarza	06	151	2017-02-05 21:20:23.679599	2017-02-05 21:20:23.679599
2131	Adrar	07	151	2017-02-05 21:20:23.689523	2017-02-05 21:20:23.689523
2132	Dakhlet Nouadhibou	08	151	2017-02-05 21:20:23.69561	2017-02-05 21:20:23.69561
2133	Tagant	09	151	2017-02-05 21:20:23.705097	2017-02-05 21:20:23.705097
2134	Guidimaka	10	151	2017-02-05 21:20:23.711833	2017-02-05 21:20:23.711833
2135	Tiris Zemmour	11	151	2017-02-05 21:20:23.71972	2017-02-05 21:20:23.71972
2136	Inchiri	12	151	2017-02-05 21:20:23.728239	2017-02-05 21:20:23.728239
2137	Nouakchott	NKC	151	2017-02-05 21:20:23.734795	2017-02-05 21:20:23.734795
2138	Attard	01	153	2017-02-05 21:20:23.741073	2017-02-05 21:20:23.741073
2139	Balzan	02	153	2017-02-05 21:20:23.748644	2017-02-05 21:20:23.748644
2140	Birgu	03	153	2017-02-05 21:20:23.757117	2017-02-05 21:20:23.757117
2141	Birkirkara	04	153	2017-02-05 21:20:23.765576	2017-02-05 21:20:23.765576
2142	Birżebbuġa	05	153	2017-02-05 21:20:23.773217	2017-02-05 21:20:23.773217
2143	Bormla	06	153	2017-02-05 21:20:23.781345	2017-02-05 21:20:23.781345
2144	Dingli	07	153	2017-02-05 21:20:23.790008	2017-02-05 21:20:23.790008
2145	Fgura	08	153	2017-02-05 21:20:23.798017	2017-02-05 21:20:23.798017
2146	Floriana	09	153	2017-02-05 21:20:23.807229	2017-02-05 21:20:23.807229
2147	Fontana	10	153	2017-02-05 21:20:23.822351	2017-02-05 21:20:23.822351
2148	Gudja	11	153	2017-02-05 21:20:23.831179	2017-02-05 21:20:23.831179
2149	Gżira	12	153	2017-02-05 21:20:23.837962	2017-02-05 21:20:23.837962
2150	Għajnsielem	13	153	2017-02-05 21:20:23.844181	2017-02-05 21:20:23.844181
2151	Għarb	14	153	2017-02-05 21:20:23.851472	2017-02-05 21:20:23.851472
2152	Għargħur	15	153	2017-02-05 21:20:23.859562	2017-02-05 21:20:23.859562
2153	Għasri	16	153	2017-02-05 21:20:23.867269	2017-02-05 21:20:23.867269
2154	Għaxaq	17	153	2017-02-05 21:20:23.875679	2017-02-05 21:20:23.875679
2155	Ħamrun	18	153	2017-02-05 21:20:23.884943	2017-02-05 21:20:23.884943
2156	Iklin	19	153	2017-02-05 21:20:23.893581	2017-02-05 21:20:23.893581
2157	Isla	20	153	2017-02-05 21:20:23.902109	2017-02-05 21:20:23.902109
2158	Kalkara	21	153	2017-02-05 21:20:23.911968	2017-02-05 21:20:23.911968
2159	Kerċem	22	153	2017-02-05 21:20:23.920014	2017-02-05 21:20:23.920014
2160	Kirkop	23	153	2017-02-05 21:20:23.927596	2017-02-05 21:20:23.927596
2161	Lija	24	153	2017-02-05 21:20:23.934913	2017-02-05 21:20:23.934913
2162	Luqa	25	153	2017-02-05 21:20:23.942214	2017-02-05 21:20:23.942214
2163	Marsa	26	153	2017-02-05 21:20:23.95078	2017-02-05 21:20:23.95078
2164	Marsaskala	27	153	2017-02-05 21:20:23.959066	2017-02-05 21:20:23.959066
2165	Marsaxlokk	28	153	2017-02-05 21:20:23.966477	2017-02-05 21:20:23.966477
2166	Mdina	29	153	2017-02-05 21:20:23.973406	2017-02-05 21:20:23.973406
2167	Mellieħa	30	153	2017-02-05 21:20:23.980583	2017-02-05 21:20:23.980583
2168	Mġarr	31	153	2017-02-05 21:20:23.988975	2017-02-05 21:20:23.988975
2169	Mosta	32	153	2017-02-05 21:20:23.996923	2017-02-05 21:20:23.996923
2170	Mqabba	33	153	2017-02-05 21:20:24.005897	2017-02-05 21:20:24.005897
2171	Msida	34	153	2017-02-05 21:20:24.01824	2017-02-05 21:20:24.01824
2172	Mtarfa	35	153	2017-02-05 21:20:24.026686	2017-02-05 21:20:24.026686
2173	Munxar	36	153	2017-02-05 21:20:24.033898	2017-02-05 21:20:24.033898
2174	Nadur	37	153	2017-02-05 21:20:24.040432	2017-02-05 21:20:24.040432
2175	Naxxar	38	153	2017-02-05 21:20:24.048111	2017-02-05 21:20:24.048111
2176	Paola	39	153	2017-02-05 21:20:24.053777	2017-02-05 21:20:24.053777
2177	Pembroke	40	153	2017-02-05 21:20:24.060098	2017-02-05 21:20:24.060098
2178	Pietà	41	153	2017-02-05 21:20:24.068525	2017-02-05 21:20:24.068525
2179	Qala	42	153	2017-02-05 21:20:24.078544	2017-02-05 21:20:24.078544
2180	Qormi	43	153	2017-02-05 21:20:24.086743	2017-02-05 21:20:24.086743
2181	Qrendi	44	153	2017-02-05 21:20:24.095003	2017-02-05 21:20:24.095003
2182	Rabat Għawdex	45	153	2017-02-05 21:20:24.102901	2017-02-05 21:20:24.102901
2183	Rabat Malta	46	153	2017-02-05 21:20:24.111816	2017-02-05 21:20:24.111816
2184	Safi	47	153	2017-02-05 21:20:24.120388	2017-02-05 21:20:24.120388
2185	San Ġiljan	48	153	2017-02-05 21:20:24.12695	2017-02-05 21:20:24.12695
2186	San Ġwann	49	153	2017-02-05 21:20:24.133058	2017-02-05 21:20:24.133058
2187	San Lawrenz	50	153	2017-02-05 21:20:24.141617	2017-02-05 21:20:24.141617
2188	San Pawl il-Baħar	51	153	2017-02-05 21:20:24.148986	2017-02-05 21:20:24.148986
2189	Sannat	52	153	2017-02-05 21:20:24.15677	2017-02-05 21:20:24.15677
2190	Santa Luċija	53	153	2017-02-05 21:20:24.163183	2017-02-05 21:20:24.163183
2191	Santa Venera	54	153	2017-02-05 21:20:24.168431	2017-02-05 21:20:24.168431
2192	Siġġiewi	55	153	2017-02-05 21:20:24.173722	2017-02-05 21:20:24.173722
2193	Sliema	56	153	2017-02-05 21:20:24.179797	2017-02-05 21:20:24.179797
2194	Swieqi	57	153	2017-02-05 21:20:24.191421	2017-02-05 21:20:24.191421
2195	Ta’ Xbiex	58	153	2017-02-05 21:20:24.207132	2017-02-05 21:20:24.207132
2196	Tarxien	59	153	2017-02-05 21:20:24.223078	2017-02-05 21:20:24.223078
2197	Valletta	60	153	2017-02-05 21:20:24.239006	2017-02-05 21:20:24.239006
2198	Xagħra	61	153	2017-02-05 21:20:24.254656	2017-02-05 21:20:24.254656
2199	Xewkija	62	153	2017-02-05 21:20:24.269643	2017-02-05 21:20:24.269643
2200	Xgħajra	63	153	2017-02-05 21:20:24.28488	2017-02-05 21:20:24.28488
2201	Żabbar	64	153	2017-02-05 21:20:24.29858	2017-02-05 21:20:24.29858
2202	Żebbuġ Għawdex	65	153	2017-02-05 21:20:24.307329	2017-02-05 21:20:24.307329
2203	Żebbuġ Malta	66	153	2017-02-05 21:20:24.31587	2017-02-05 21:20:24.31587
2204	Żejtun	67	153	2017-02-05 21:20:24.324001	2017-02-05 21:20:24.324001
2205	Żurrieq	68	153	2017-02-05 21:20:24.332575	2017-02-05 21:20:24.332575
2206	Agalega Islands	AG	154	2017-02-05 21:20:24.340896	2017-02-05 21:20:24.340896
2207	Black River	BL	154	2017-02-05 21:20:24.348565	2017-02-05 21:20:24.348565
2208	Beau Bassin-Rose Hill	BR	154	2017-02-05 21:20:24.35873	2017-02-05 21:20:24.35873
2209	Cargados Carajos Shoals	CC	154	2017-02-05 21:20:24.368769	2017-02-05 21:20:24.368769
2210	Curepipe	CU	154	2017-02-05 21:20:24.382805	2017-02-05 21:20:24.382805
2211	Flacq	FL	154	2017-02-05 21:20:24.39665	2017-02-05 21:20:24.39665
2212	Grand Port	GP	154	2017-02-05 21:20:24.409514	2017-02-05 21:20:24.409514
2213	Moka	MO	154	2017-02-05 21:20:24.422223	2017-02-05 21:20:24.422223
2214	Pamplemousses	PA	154	2017-02-05 21:20:24.436167	2017-02-05 21:20:24.436167
2215	Port Louis	PL	154	2017-02-05 21:20:24.450214	2017-02-05 21:20:24.450214
2216	Port Louis	PU	154	2017-02-05 21:20:24.463802	2017-02-05 21:20:24.463802
2217	Plaines Wilhems	PW	154	2017-02-05 21:20:24.477511	2017-02-05 21:20:24.477511
2218	Quatre Bornes	QB	154	2017-02-05 21:20:24.492312	2017-02-05 21:20:24.492312
2219	Rodrigues Island	RO	154	2017-02-05 21:20:24.503204	2017-02-05 21:20:24.503204
2220	Rivière du Rempart	RP	154	2017-02-05 21:20:24.513192	2017-02-05 21:20:24.513192
2221	Savanne	SA	154	2017-02-05 21:20:24.524099	2017-02-05 21:20:24.524099
2222	Vacoas-Phoenix	VP	154	2017-02-05 21:20:24.536415	2017-02-05 21:20:24.536415
2223	Central	CE	155	2017-02-05 21:20:24.549396	2017-02-05 21:20:24.549396
2224	Male	MLE	155	2017-02-05 21:20:24.561313	2017-02-05 21:20:24.561313
2225	North Central	NC	155	2017-02-05 21:20:24.574632	2017-02-05 21:20:24.574632
2226	North	NO	155	2017-02-05 21:20:24.588394	2017-02-05 21:20:24.588394
2227	South Central	SC	155	2017-02-05 21:20:24.597022	2017-02-05 21:20:24.597022
2228	South	SU	155	2017-02-05 21:20:24.604263	2017-02-05 21:20:24.604263
2229	Upper North	UN	155	2017-02-05 21:20:24.614667	2017-02-05 21:20:24.614667
2230	Upper South	US	155	2017-02-05 21:20:24.627764	2017-02-05 21:20:24.627764
2231	Central Region	C	156	2017-02-05 21:20:24.641375	2017-02-05 21:20:24.641375
2232	Northern Region	N	156	2017-02-05 21:20:24.657717	2017-02-05 21:20:24.657717
2233	Southern Region	S	156	2017-02-05 21:20:24.67646	2017-02-05 21:20:24.67646
2234	Aguascalientes	AGU	157	2017-02-05 21:20:24.692039	2017-02-05 21:20:24.692039
2235	Baja California	BCN	157	2017-02-05 21:20:24.705342	2017-02-05 21:20:24.705342
2236	Baja California Sur	BCS	157	2017-02-05 21:20:24.721825	2017-02-05 21:20:24.721825
2237	Campeche	CAM	157	2017-02-05 21:20:24.735709	2017-02-05 21:20:24.735709
2238	Chihuahua	CHH	157	2017-02-05 21:20:24.745502	2017-02-05 21:20:24.745502
2239	Chiapas	CHP	157	2017-02-05 21:20:24.758381	2017-02-05 21:20:24.758381
2240	Coahuila	COA	157	2017-02-05 21:20:24.768969	2017-02-05 21:20:24.768969
2241	Colima	COL	157	2017-02-05 21:20:24.779574	2017-02-05 21:20:24.779574
2242	Distrito Federal	DIF	157	2017-02-05 21:20:24.78797	2017-02-05 21:20:24.78797
2243	Durango	DUR	157	2017-02-05 21:20:24.795511	2017-02-05 21:20:24.795511
2244	Guerrero	GRO	157	2017-02-05 21:20:24.803578	2017-02-05 21:20:24.803578
2245	Guanajuato	GUA	157	2017-02-05 21:20:24.812708	2017-02-05 21:20:24.812708
2246	Hidalgo	HID	157	2017-02-05 21:20:24.823883	2017-02-05 21:20:24.823883
2247	Jalisco	JAL	157	2017-02-05 21:20:24.832485	2017-02-05 21:20:24.832485
2248	México	MEX	157	2017-02-05 21:20:24.84041	2017-02-05 21:20:24.84041
2249	Michoacán	MIC	157	2017-02-05 21:20:24.8494	2017-02-05 21:20:24.8494
2250	Morelos	MOR	157	2017-02-05 21:20:24.858453	2017-02-05 21:20:24.858453
2251	Nayarit	NAY	157	2017-02-05 21:20:24.867463	2017-02-05 21:20:24.867463
2252	Nuevo León	NLE	157	2017-02-05 21:20:24.876534	2017-02-05 21:20:24.876534
2253	Oaxaca	OAX	157	2017-02-05 21:20:24.885092	2017-02-05 21:20:24.885092
2254	Puebla	PUE	157	2017-02-05 21:20:24.893234	2017-02-05 21:20:24.893234
2255	Querétaro	QUE	157	2017-02-05 21:20:24.899161	2017-02-05 21:20:24.899161
2256	Quintana Roo	ROO	157	2017-02-05 21:20:24.90481	2017-02-05 21:20:24.90481
2257	Sinaloa	SIN	157	2017-02-05 21:20:24.91038	2017-02-05 21:20:24.91038
2258	San Luis Potosí	SLP	157	2017-02-05 21:20:24.916406	2017-02-05 21:20:24.916406
2259	Sonora	SON	157	2017-02-05 21:20:24.924499	2017-02-05 21:20:24.924499
2260	Tabasco	TAB	157	2017-02-05 21:20:24.946404	2017-02-05 21:20:24.946404
2261	Tamaulipas	TAM	157	2017-02-05 21:20:24.954414	2017-02-05 21:20:24.954414
2262	Tlaxcala	TLA	157	2017-02-05 21:20:24.963682	2017-02-05 21:20:24.963682
2263	Veracruz	VER	157	2017-02-05 21:20:24.971582	2017-02-05 21:20:24.971582
2264	Yucatán	YUC	157	2017-02-05 21:20:24.979142	2017-02-05 21:20:24.979142
2265	Zacatecas	ZAC	157	2017-02-05 21:20:24.989023	2017-02-05 21:20:24.989023
2266	Johor	01	158	2017-02-05 21:20:25.00246	2017-02-05 21:20:25.00246
2267	Kedah	02	158	2017-02-05 21:20:25.013865	2017-02-05 21:20:25.013865
2268	Kelantan	03	158	2017-02-05 21:20:25.029248	2017-02-05 21:20:25.029248
2269	Melaka	04	158	2017-02-05 21:20:25.040971	2017-02-05 21:20:25.040971
2270	Negeri Sembilan	05	158	2017-02-05 21:20:25.052455	2017-02-05 21:20:25.052455
2271	Pahang	06	158	2017-02-05 21:20:25.067371	2017-02-05 21:20:25.067371
2272	Pulau Pinang	07	158	2017-02-05 21:20:25.077741	2017-02-05 21:20:25.077741
2273	Perak	08	158	2017-02-05 21:20:25.090156	2017-02-05 21:20:25.090156
2274	Perlis	09	158	2017-02-05 21:20:25.09832	2017-02-05 21:20:25.09832
2275	Selangor	10	158	2017-02-05 21:20:25.105497	2017-02-05 21:20:25.105497
2276	Terengganu	11	158	2017-02-05 21:20:25.111807	2017-02-05 21:20:25.111807
2277	Sabah	12	158	2017-02-05 21:20:25.120475	2017-02-05 21:20:25.120475
2278	Sarawak	13	158	2017-02-05 21:20:25.127519	2017-02-05 21:20:25.127519
2279	Wilayah Persekutuan Kuala Lumpur	14	158	2017-02-05 21:20:25.133741	2017-02-05 21:20:25.133741
2280	Wilayah Persekutuan Labuan	15	158	2017-02-05 21:20:25.14214	2017-02-05 21:20:25.14214
2281	Wilayah Persekutuan Putrajaya	16	158	2017-02-05 21:20:25.153877	2017-02-05 21:20:25.153877
2282	Niassa	A	159	2017-02-05 21:20:25.162612	2017-02-05 21:20:25.162612
2283	Manica	B	159	2017-02-05 21:20:25.170383	2017-02-05 21:20:25.170383
2284	Gaza	G	159	2017-02-05 21:20:25.178585	2017-02-05 21:20:25.178585
2285	Inhambane	I	159	2017-02-05 21:20:25.1864	2017-02-05 21:20:25.1864
2286	Maputo	L	159	2017-02-05 21:20:25.193895	2017-02-05 21:20:25.193895
2287	Maputo (city)	MPM	159	2017-02-05 21:20:25.201216	2017-02-05 21:20:25.201216
2288	Numpula	N	159	2017-02-05 21:20:25.209377	2017-02-05 21:20:25.209377
2289	Cabo Delgado	P	159	2017-02-05 21:20:25.218801	2017-02-05 21:20:25.218801
2290	Zambezia	Q	159	2017-02-05 21:20:25.227642	2017-02-05 21:20:25.227642
2291	Sofala	S	159	2017-02-05 21:20:25.234684	2017-02-05 21:20:25.234684
2292	Tete	T	159	2017-02-05 21:20:25.240405	2017-02-05 21:20:25.240405
2293	Caprivi	CA	160	2017-02-05 21:20:25.24807	2017-02-05 21:20:25.24807
2294	Erongo	ER	160	2017-02-05 21:20:25.256203	2017-02-05 21:20:25.256203
2295	Hardap	HA	160	2017-02-05 21:20:25.265309	2017-02-05 21:20:25.265309
2296	Karas	KA	160	2017-02-05 21:20:25.271949	2017-02-05 21:20:25.271949
2297	Khomas	KH	160	2017-02-05 21:20:25.280013	2017-02-05 21:20:25.280013
2298	Kunene	KU	160	2017-02-05 21:20:25.287834	2017-02-05 21:20:25.287834
2299	Otjozondjupa	OD	160	2017-02-05 21:20:25.293703	2017-02-05 21:20:25.293703
2300	Omaheke	OH	160	2017-02-05 21:20:25.301721	2017-02-05 21:20:25.301721
2301	Okavango	OK	160	2017-02-05 21:20:25.314167	2017-02-05 21:20:25.314167
2302	Oshana	ON	160	2017-02-05 21:20:25.324977	2017-02-05 21:20:25.324977
2303	Omusati	OS	160	2017-02-05 21:20:25.335971	2017-02-05 21:20:25.335971
2304	Oshikoto	OT	160	2017-02-05 21:20:25.34487	2017-02-05 21:20:25.34487
2305	Ohangwena	OW	160	2017-02-05 21:20:25.354266	2017-02-05 21:20:25.354266
2306	Agadez	1	162	2017-02-05 21:20:25.364566	2017-02-05 21:20:25.364566
2307	Diffa	2	162	2017-02-05 21:20:25.376302	2017-02-05 21:20:25.376302
2308	Dosso	3	162	2017-02-05 21:20:25.388153	2017-02-05 21:20:25.388153
2309	Maradi	4	162	2017-02-05 21:20:25.400423	2017-02-05 21:20:25.400423
2310	Tahoua	5	162	2017-02-05 21:20:25.412613	2017-02-05 21:20:25.412613
2311	Tillabéri	6	162	2017-02-05 21:20:25.424533	2017-02-05 21:20:25.424533
2312	Zinder	7	162	2017-02-05 21:20:25.435044	2017-02-05 21:20:25.435044
2313	Niamey	8	162	2017-02-05 21:20:25.446531	2017-02-05 21:20:25.446531
2314	Abia	AB	164	2017-02-05 21:20:25.457523	2017-02-05 21:20:25.457523
2315	Adamawa	AD	164	2017-02-05 21:20:25.466855	2017-02-05 21:20:25.466855
2316	Akwa Ibom	AK	164	2017-02-05 21:20:25.473747	2017-02-05 21:20:25.473747
2317	Anambra	AN	164	2017-02-05 21:20:25.482687	2017-02-05 21:20:25.482687
2318	Bauchi	BA	164	2017-02-05 21:20:25.493897	2017-02-05 21:20:25.493897
2319	Benue	BE	164	2017-02-05 21:20:25.500703	2017-02-05 21:20:25.500703
2320	Borno	BO	164	2017-02-05 21:20:25.508136	2017-02-05 21:20:25.508136
2321	Bayelsa	BY	164	2017-02-05 21:20:25.514967	2017-02-05 21:20:25.514967
2322	Cross River	CR	164	2017-02-05 21:20:25.523246	2017-02-05 21:20:25.523246
2323	Delta	DE	164	2017-02-05 21:20:25.530076	2017-02-05 21:20:25.530076
2324	Ebonyi	EB	164	2017-02-05 21:20:25.537416	2017-02-05 21:20:25.537416
2325	Edo	ED	164	2017-02-05 21:20:25.54538	2017-02-05 21:20:25.54538
2326	Ekiti	EK	164	2017-02-05 21:20:25.552218	2017-02-05 21:20:25.552218
2327	Enugu	EN	164	2017-02-05 21:20:25.558995	2017-02-05 21:20:25.558995
2328	Abuja Capital Territory	FC	164	2017-02-05 21:20:25.565699	2017-02-05 21:20:25.565699
2329	Gombe	GO	164	2017-02-05 21:20:25.572909	2017-02-05 21:20:25.572909
2330	Imo	IM	164	2017-02-05 21:20:25.580613	2017-02-05 21:20:25.580613
2331	Jigawa	JI	164	2017-02-05 21:20:25.587722	2017-02-05 21:20:25.587722
2332	Kaduna	KD	164	2017-02-05 21:20:25.594452	2017-02-05 21:20:25.594452
2333	Kebbi	KE	164	2017-02-05 21:20:25.603982	2017-02-05 21:20:25.603982
2334	Kano	KN	164	2017-02-05 21:20:25.612202	2017-02-05 21:20:25.612202
2335	Kogi	KO	164	2017-02-05 21:20:25.61956	2017-02-05 21:20:25.61956
2336	Katsina	KT	164	2017-02-05 21:20:25.62877	2017-02-05 21:20:25.62877
2337	Kwara	KW	164	2017-02-05 21:20:25.636184	2017-02-05 21:20:25.636184
2338	Lagos	LA	164	2017-02-05 21:20:25.643303	2017-02-05 21:20:25.643303
2339	Nassarawa	NA	164	2017-02-05 21:20:25.652342	2017-02-05 21:20:25.652342
2340	Niger	NI	164	2017-02-05 21:20:25.662369	2017-02-05 21:20:25.662369
2341	Ogun	OG	164	2017-02-05 21:20:25.6732	2017-02-05 21:20:25.6732
2342	Ondo	ON	164	2017-02-05 21:20:25.681672	2017-02-05 21:20:25.681672
2343	Osun	OS	164	2017-02-05 21:20:25.692356	2017-02-05 21:20:25.692356
2344	Oyo	OY	164	2017-02-05 21:20:25.701782	2017-02-05 21:20:25.701782
2345	Plateau	PL	164	2017-02-05 21:20:25.713243	2017-02-05 21:20:25.713243
2346	Rivers	RI	164	2017-02-05 21:20:25.724722	2017-02-05 21:20:25.724722
2347	Sokoto	SO	164	2017-02-05 21:20:25.736476	2017-02-05 21:20:25.736476
2348	Taraba	TA	164	2017-02-05 21:20:25.74837	2017-02-05 21:20:25.74837
2349	Yobe	YO	164	2017-02-05 21:20:25.75972	2017-02-05 21:20:25.75972
2350	Zamfara	ZA	164	2017-02-05 21:20:25.770346	2017-02-05 21:20:25.770346
2351	Atlántico Norte	AN	165	2017-02-05 21:20:25.781897	2017-02-05 21:20:25.781897
2352	Atlántico Sur	AS	165	2017-02-05 21:20:25.791648	2017-02-05 21:20:25.791648
2353	Boaco	BO	165	2017-02-05 21:20:25.801109	2017-02-05 21:20:25.801109
2354	Carazo	CA	165	2017-02-05 21:20:25.810482	2017-02-05 21:20:25.810482
2355	Chinandega	CI	165	2017-02-05 21:20:25.820285	2017-02-05 21:20:25.820285
2356	Chontales	CO	165	2017-02-05 21:20:25.829862	2017-02-05 21:20:25.829862
2357	Estelí	ES	165	2017-02-05 21:20:25.839527	2017-02-05 21:20:25.839527
2358	Granada	GR	165	2017-02-05 21:20:25.846377	2017-02-05 21:20:25.846377
2359	Jinotega	JI	165	2017-02-05 21:20:25.855558	2017-02-05 21:20:25.855558
2360	León	LE	165	2017-02-05 21:20:25.863799	2017-02-05 21:20:25.863799
2361	Madriz	MD	165	2017-02-05 21:20:25.870157	2017-02-05 21:20:25.870157
2362	Managua	MN	165	2017-02-05 21:20:25.876379	2017-02-05 21:20:25.876379
2363	Masaya	MS	165	2017-02-05 21:20:25.882687	2017-02-05 21:20:25.882687
2364	Matagalpa	MT	165	2017-02-05 21:20:25.888721	2017-02-05 21:20:25.888721
2365	Nueva Segovia	NS	165	2017-02-05 21:20:25.896557	2017-02-05 21:20:25.896557
2366	Rivas	RI	165	2017-02-05 21:20:25.90411	2017-02-05 21:20:25.90411
2367	Río San Juan	SJ	165	2017-02-05 21:20:25.911774	2017-02-05 21:20:25.911774
2368	Aruba	AW	166	2017-02-05 21:20:25.922751	2017-02-05 21:20:25.922751
2369	Bonaire	BQ1	166	2017-02-05 21:20:25.930336	2017-02-05 21:20:25.930336
2370	Saba	BQ2	166	2017-02-05 21:20:25.937531	2017-02-05 21:20:25.937531
2371	Sint Eustatius	BQ3	166	2017-02-05 21:20:25.944813	2017-02-05 21:20:25.944813
2372	Curaçao	CW	166	2017-02-05 21:20:25.952578	2017-02-05 21:20:25.952578
2373	Drenthe	DR	166	2017-02-05 21:20:25.959055	2017-02-05 21:20:25.959055
2374	Flevoland	FL	166	2017-02-05 21:20:25.965453	2017-02-05 21:20:25.965453
2375	Friesland	FR	166	2017-02-05 21:20:25.971185	2017-02-05 21:20:25.971185
2376	Gelderland	GE	166	2017-02-05 21:20:25.977974	2017-02-05 21:20:25.977974
2377	Groningen	GR	166	2017-02-05 21:20:25.984813	2017-02-05 21:20:25.984813
2378	Limburg	LI	166	2017-02-05 21:20:25.990755	2017-02-05 21:20:25.990755
2379	Noord-Brabant	NB	166	2017-02-05 21:20:25.996894	2017-02-05 21:20:25.996894
2380	Noord-Holland	NH	166	2017-02-05 21:20:26.003754	2017-02-05 21:20:26.003754
2381	Overijssel	OV	166	2017-02-05 21:20:26.009368	2017-02-05 21:20:26.009368
2382	Sint Maarten	SX	166	2017-02-05 21:20:26.015815	2017-02-05 21:20:26.015815
2383	Utrecht	UT	166	2017-02-05 21:20:26.02243	2017-02-05 21:20:26.02243
2384	Zeeland	ZE	166	2017-02-05 21:20:26.028776	2017-02-05 21:20:26.028776
2385	Zuid-Holland	ZH	166	2017-02-05 21:20:26.034585	2017-02-05 21:20:26.034585
2386	Østfold	01	167	2017-02-05 21:20:26.041578	2017-02-05 21:20:26.041578
2387	Akershus	02	167	2017-02-05 21:20:26.047092	2017-02-05 21:20:26.047092
2388	Oslo	03	167	2017-02-05 21:20:26.052626	2017-02-05 21:20:26.052626
2389	Hedmark	04	167	2017-02-05 21:20:26.060039	2017-02-05 21:20:26.060039
2390	Oppland	05	167	2017-02-05 21:20:26.068737	2017-02-05 21:20:26.068737
2391	Buskerud	06	167	2017-02-05 21:20:26.078809	2017-02-05 21:20:26.078809
2392	Vestfold	07	167	2017-02-05 21:20:26.088855	2017-02-05 21:20:26.088855
2393	Telemark	08	167	2017-02-05 21:20:26.098044	2017-02-05 21:20:26.098044
2394	Aust-Agder	09	167	2017-02-05 21:20:26.106793	2017-02-05 21:20:26.106793
2395	Vest-Agder	10	167	2017-02-05 21:20:26.113016	2017-02-05 21:20:26.113016
2396	Rogaland	11	167	2017-02-05 21:20:26.118546	2017-02-05 21:20:26.118546
2397	Hordaland	12	167	2017-02-05 21:20:26.124745	2017-02-05 21:20:26.124745
2398	Sogn og Fjordane	14	167	2017-02-05 21:20:26.131024	2017-02-05 21:20:26.131024
2399	Møre og Romsdal	15	167	2017-02-05 21:20:26.137018	2017-02-05 21:20:26.137018
2400	Sør-Trøndelag	16	167	2017-02-05 21:20:26.14524	2017-02-05 21:20:26.14524
2401	Nord-Trøndelag	17	167	2017-02-05 21:20:26.155128	2017-02-05 21:20:26.155128
2402	Nordland	18	167	2017-02-05 21:20:26.164458	2017-02-05 21:20:26.164458
2403	Troms	19	167	2017-02-05 21:20:26.173384	2017-02-05 21:20:26.173384
2404	Finnmark	20	167	2017-02-05 21:20:26.183038	2017-02-05 21:20:26.183038
2405	Svalbard (Arctic Region)	21	167	2017-02-05 21:20:26.192513	2017-02-05 21:20:26.192513
2406	Jan Mayen (Arctic Region)	22	167	2017-02-05 21:20:26.201922	2017-02-05 21:20:26.201922
2407	Madhyamanchal	1	168	2017-02-05 21:20:26.210877	2017-02-05 21:20:26.210877
2408	Madhya Pashchimanchal	2	168	2017-02-05 21:20:26.220571	2017-02-05 21:20:26.220571
2409	Pashchimanchal	3	168	2017-02-05 21:20:26.227579	2017-02-05 21:20:26.227579
2410	Purwanchal	4	168	2017-02-05 21:20:26.23417	2017-02-05 21:20:26.23417
2411	Sudur Pashchimanchal	5	168	2017-02-05 21:20:26.242161	2017-02-05 21:20:26.242161
2412	Aiwo	01	169	2017-02-05 21:20:26.250956	2017-02-05 21:20:26.250956
2413	Anabar	02	169	2017-02-05 21:20:26.261819	2017-02-05 21:20:26.261819
2414	Anetan	03	169	2017-02-05 21:20:26.273579	2017-02-05 21:20:26.273579
2415	Anibare	04	169	2017-02-05 21:20:26.287071	2017-02-05 21:20:26.287071
2416	Baiti	05	169	2017-02-05 21:20:26.300557	2017-02-05 21:20:26.300557
2417	Boe	06	169	2017-02-05 21:20:26.311232	2017-02-05 21:20:26.311232
2418	Buada	07	169	2017-02-05 21:20:26.324019	2017-02-05 21:20:26.324019
2419	Denigomodu	08	169	2017-02-05 21:20:26.339076	2017-02-05 21:20:26.339076
2420	Ewa	09	169	2017-02-05 21:20:26.352908	2017-02-05 21:20:26.352908
2421	Ijuw	10	169	2017-02-05 21:20:26.361258	2017-02-05 21:20:26.361258
2422	Meneng	11	169	2017-02-05 21:20:26.369284	2017-02-05 21:20:26.369284
2423	Nibok	12	169	2017-02-05 21:20:26.377878	2017-02-05 21:20:26.377878
2424	Uaboe	13	169	2017-02-05 21:20:26.385748	2017-02-05 21:20:26.385748
2425	Yaren	14	169	2017-02-05 21:20:26.39469	2017-02-05 21:20:26.39469
2426	Chatham Islands Territory	CIT	171	2017-02-05 21:20:26.404797	2017-02-05 21:20:26.404797
2427	North Island	N	171	2017-02-05 21:20:26.415937	2017-02-05 21:20:26.415937
2428	South Island	S	171	2017-02-05 21:20:26.426488	2017-02-05 21:20:26.426488
2429	Al Bāţinah	BA	172	2017-02-05 21:20:26.438754	2017-02-05 21:20:26.438754
2430	Al Buraymī	BU	172	2017-02-05 21:20:26.449428	2017-02-05 21:20:26.449428
2431	Ad Dākhilīya	DA	172	2017-02-05 21:20:26.459548	2017-02-05 21:20:26.459548
2432	Masqaţ	MA	172	2017-02-05 21:20:26.471434	2017-02-05 21:20:26.471434
2433	Musandam	MU	172	2017-02-05 21:20:26.482745	2017-02-05 21:20:26.482745
2434	Ash Sharqīyah	SH	172	2017-02-05 21:20:26.49441	2017-02-05 21:20:26.49441
2435	Al Wusţá	WU	172	2017-02-05 21:20:26.506271	2017-02-05 21:20:26.506271
2436	Az̧ Z̧āhirah	ZA	172	2017-02-05 21:20:26.516978	2017-02-05 21:20:26.516978
2437	Z̧ufār	ZU	172	2017-02-05 21:20:26.526368	2017-02-05 21:20:26.526368
2438	Bocas del Toro	1	173	2017-02-05 21:20:26.53506	2017-02-05 21:20:26.53506
2439	Coclé	2	173	2017-02-05 21:20:26.548675	2017-02-05 21:20:26.548675
2440	Colón	3	173	2017-02-05 21:20:26.566153	2017-02-05 21:20:26.566153
2441	Chiriquí	4	173	2017-02-05 21:20:26.5768	2017-02-05 21:20:26.5768
2442	Darién	5	173	2017-02-05 21:20:26.585542	2017-02-05 21:20:26.585542
2443	Herrera	6	173	2017-02-05 21:20:26.599344	2017-02-05 21:20:26.599344
2444	Los Santos	7	173	2017-02-05 21:20:26.613883	2017-02-05 21:20:26.613883
2445	Panamá	8	173	2017-02-05 21:20:26.62315	2017-02-05 21:20:26.62315
2446	Veraguas	9	173	2017-02-05 21:20:26.633336	2017-02-05 21:20:26.633336
2447	Emberá	EM	173	2017-02-05 21:20:26.648496	2017-02-05 21:20:26.648496
2448	Kuna Yala	KY	173	2017-02-05 21:20:26.661061	2017-02-05 21:20:26.661061
2449	Ngöbe-Buglé	NB	173	2017-02-05 21:20:26.67534	2017-02-05 21:20:26.67534
2450	Amazonas	AMA	174	2017-02-05 21:20:26.693348	2017-02-05 21:20:26.693348
2451	Ancash	ANC	174	2017-02-05 21:20:26.709823	2017-02-05 21:20:26.709823
2452	Apurímac	APU	174	2017-02-05 21:20:26.728811	2017-02-05 21:20:26.728811
2453	Arequipa	ARE	174	2017-02-05 21:20:26.741833	2017-02-05 21:20:26.741833
2454	Ayacucho	AYA	174	2017-02-05 21:20:26.755028	2017-02-05 21:20:26.755028
2455	Cajamarca	CAJ	174	2017-02-05 21:20:26.76886	2017-02-05 21:20:26.76886
2456	El Callao	CAL	174	2017-02-05 21:20:26.780567	2017-02-05 21:20:26.780567
2457	Cusco [Cuzco]	CUS	174	2017-02-05 21:20:26.789124	2017-02-05 21:20:26.789124
2458	Huánuco	HUC	174	2017-02-05 21:20:26.798147	2017-02-05 21:20:26.798147
2459	Huancavelica	HUV	174	2017-02-05 21:20:26.80552	2017-02-05 21:20:26.80552
2460	Ica	ICA	174	2017-02-05 21:20:26.816805	2017-02-05 21:20:26.816805
2461	Junín	JUN	174	2017-02-05 21:20:26.827787	2017-02-05 21:20:26.827787
2462	La Libertad	LAL	174	2017-02-05 21:20:26.835522	2017-02-05 21:20:26.835522
2463	Lambayeque	LAM	174	2017-02-05 21:20:26.846515	2017-02-05 21:20:26.846515
2464	Lima	LIM	174	2017-02-05 21:20:26.858498	2017-02-05 21:20:26.858498
2465	Municipalidad Metropolitana de Lima	LMA	174	2017-02-05 21:20:26.87051	2017-02-05 21:20:26.87051
2466	Loreto	LOR	174	2017-02-05 21:20:26.880506	2017-02-05 21:20:26.880506
2467	Madre de Dios	MDD	174	2017-02-05 21:20:26.887968	2017-02-05 21:20:26.887968
2468	Moquegua	MOQ	174	2017-02-05 21:20:26.895718	2017-02-05 21:20:26.895718
2469	Pasco	PAS	174	2017-02-05 21:20:26.9038	2017-02-05 21:20:26.9038
2470	Piura	PIU	174	2017-02-05 21:20:26.924194	2017-02-05 21:20:26.924194
2471	Puno	PUN	174	2017-02-05 21:20:26.93241	2017-02-05 21:20:26.93241
2472	San Martín	SAM	174	2017-02-05 21:20:26.94027	2017-02-05 21:20:26.94027
2473	Tacna	TAC	174	2017-02-05 21:20:26.951009	2017-02-05 21:20:26.951009
2474	Tumbes	TUM	174	2017-02-05 21:20:26.959855	2017-02-05 21:20:26.959855
2475	Ucayali	UCA	174	2017-02-05 21:20:26.967301	2017-02-05 21:20:26.967301
2476	Chimbu	CPK	176	2017-02-05 21:20:26.975217	2017-02-05 21:20:26.975217
2477	Central	CPM	176	2017-02-05 21:20:26.983837	2017-02-05 21:20:26.983837
2478	East New Britain	EBR	176	2017-02-05 21:20:26.991459	2017-02-05 21:20:26.991459
2479	Eastern Highlands	EHG	176	2017-02-05 21:20:26.997329	2017-02-05 21:20:26.997329
2480	Enga	EPW	176	2017-02-05 21:20:27.004035	2017-02-05 21:20:27.004035
2481	East Sepik	ESW	176	2017-02-05 21:20:27.010566	2017-02-05 21:20:27.010566
2482	Gulf	GPK	176	2017-02-05 21:20:27.017063	2017-02-05 21:20:27.017063
2483	Milne Bay	MBA	176	2017-02-05 21:20:27.024522	2017-02-05 21:20:27.024522
2484	Morobe	MPL	176	2017-02-05 21:20:27.031607	2017-02-05 21:20:27.031607
2485	Madang	MPM	176	2017-02-05 21:20:27.037339	2017-02-05 21:20:27.037339
2486	Manus	MRL	176	2017-02-05 21:20:27.042953	2017-02-05 21:20:27.042953
2487	National Capital District (Port Moresby)	NCD	176	2017-02-05 21:20:27.048421	2017-02-05 21:20:27.048421
2488	New Ireland	NIK	176	2017-02-05 21:20:27.053947	2017-02-05 21:20:27.053947
2489	Northern	NPP	176	2017-02-05 21:20:27.06202	2017-02-05 21:20:27.06202
2490	Bougainville	NSB	176	2017-02-05 21:20:27.072967	2017-02-05 21:20:27.072967
2491	Sandaun	SAN	176	2017-02-05 21:20:27.079359	2017-02-05 21:20:27.079359
2492	Southern Highlands	SHM	176	2017-02-05 21:20:27.086386	2017-02-05 21:20:27.086386
2493	West New Britain	WBK	176	2017-02-05 21:20:27.093683	2017-02-05 21:20:27.093683
2494	Western Highlands	WHM	176	2017-02-05 21:20:27.101321	2017-02-05 21:20:27.101321
2495	Western	WPD	176	2017-02-05 21:20:27.108092	2017-02-05 21:20:27.108092
2496	National Capital Region	00	177	2017-02-05 21:20:27.116905	2017-02-05 21:20:27.116905
2497	Ilocos (Region I)	01	177	2017-02-05 21:20:27.126468	2017-02-05 21:20:27.126468
2498	Cagayan Valley (Region II)	02	177	2017-02-05 21:20:27.135125	2017-02-05 21:20:27.135125
2499	Central Luzon (Region III)	03	177	2017-02-05 21:20:27.143771	2017-02-05 21:20:27.143771
2500	Bicol (Region V)	05	177	2017-02-05 21:20:27.153497	2017-02-05 21:20:27.153497
2501	Western Visayas (Region VI)	06	177	2017-02-05 21:20:27.163933	2017-02-05 21:20:27.163933
2502	Central Visayas (Region VII)	07	177	2017-02-05 21:20:27.173988	2017-02-05 21:20:27.173988
2503	Eastern Visayas (Region VIII)	08	177	2017-02-05 21:20:27.18564	2017-02-05 21:20:27.18564
2504	Zamboanga Peninsula (Region IX)	09	177	2017-02-05 21:20:27.196161	2017-02-05 21:20:27.196161
2505	Northern Mindanao (Region X)	10	177	2017-02-05 21:20:27.206228	2017-02-05 21:20:27.206228
2506	Davao (Region XI)	11	177	2017-02-05 21:20:27.217127	2017-02-05 21:20:27.217127
2507	Soccsksargen (Region XII)	12	177	2017-02-05 21:20:27.230006	2017-02-05 21:20:27.230006
2508	Caraga (Region XIII)	13	177	2017-02-05 21:20:27.240209	2017-02-05 21:20:27.240209
2509	Autonomous Region in Muslim Mindanao (ARMM)	14	177	2017-02-05 21:20:27.251036	2017-02-05 21:20:27.251036
2510	Cordillera Administrative Region (CAR)	15	177	2017-02-05 21:20:27.264179	2017-02-05 21:20:27.264179
2511	CALABARZON (Region IV-A)	40	177	2017-02-05 21:20:27.276166	2017-02-05 21:20:27.276166
2512	MIMAROPA (Region IV-B)	41	177	2017-02-05 21:20:27.287769	2017-02-05 21:20:27.287769
2513	Balochistan	BA	178	2017-02-05 21:20:27.300338	2017-02-05 21:20:27.300338
2514	Gilgit-Baltistan	GB	178	2017-02-05 21:20:27.311254	2017-02-05 21:20:27.311254
2515	Islamabad	IS	178	2017-02-05 21:20:27.323098	2017-02-05 21:20:27.323098
2516	Azad Kashmir	JK	178	2017-02-05 21:20:27.333293	2017-02-05 21:20:27.333293
2517	Khyber Pakhtunkhwa	KP	178	2017-02-05 21:20:27.346147	2017-02-05 21:20:27.346147
2518	Punjab	PB	178	2017-02-05 21:20:27.358548	2017-02-05 21:20:27.358548
2519	Sindh	SD	178	2017-02-05 21:20:27.37076	2017-02-05 21:20:27.37076
2520	Federally Administered Tribal Areas	TA	178	2017-02-05 21:20:27.382551	2017-02-05 21:20:27.382551
2521	Dolnośląskie	DS	179	2017-02-05 21:20:27.395801	2017-02-05 21:20:27.395801
2522	Kujawsko-pomorskie	KP	179	2017-02-05 21:20:27.408825	2017-02-05 21:20:27.408825
2523	Lubuskie	LB	179	2017-02-05 21:20:27.421774	2017-02-05 21:20:27.421774
2524	Łódzkie	LD	179	2017-02-05 21:20:27.433236	2017-02-05 21:20:27.433236
2525	Lubelskie	LU	179	2017-02-05 21:20:27.445877	2017-02-05 21:20:27.445877
2526	Małopolskie	MA	179	2017-02-05 21:20:27.458138	2017-02-05 21:20:27.458138
2527	Mazowieckie	MZ	179	2017-02-05 21:20:27.469299	2017-02-05 21:20:27.469299
2528	Opolskie	OP	179	2017-02-05 21:20:27.481569	2017-02-05 21:20:27.481569
2529	Podlaskie	PD	179	2017-02-05 21:20:27.493191	2017-02-05 21:20:27.493191
2530	Podkarpackie	PK	179	2017-02-05 21:20:27.504762	2017-02-05 21:20:27.504762
2531	Pomorskie	PM	179	2017-02-05 21:20:27.514712	2017-02-05 21:20:27.514712
2532	Świętokrzyskie	SK	179	2017-02-05 21:20:27.526068	2017-02-05 21:20:27.526068
2533	Śląskie	SL	179	2017-02-05 21:20:27.535551	2017-02-05 21:20:27.535551
2534	Warmińsko-mazurskie	WN	179	2017-02-05 21:20:27.544075	2017-02-05 21:20:27.544075
2535	Wielkopolskie	WP	179	2017-02-05 21:20:27.554455	2017-02-05 21:20:27.554455
2536	Zachodniopomorskie	ZP	179	2017-02-05 21:20:27.565645	2017-02-05 21:20:27.565645
2537	Bethlehem	BTH	182	2017-02-05 21:20:27.576439	2017-02-05 21:20:27.576439
2538	Deir El Balah	DEB	182	2017-02-05 21:20:27.586729	2017-02-05 21:20:27.586729
2539	Gaza	GZA	182	2017-02-05 21:20:27.602185	2017-02-05 21:20:27.602185
2540	Hebron	HBN	182	2017-02-05 21:20:27.609634	2017-02-05 21:20:27.609634
2541	Jerusalem	JEM	182	2017-02-05 21:20:27.618813	2017-02-05 21:20:27.618813
2542	Jenin	JEN	182	2017-02-05 21:20:27.627848	2017-02-05 21:20:27.627848
2543	Jericho - Al Aghwar	JRH	182	2017-02-05 21:20:27.635508	2017-02-05 21:20:27.635508
2544	Khan Yunis	KYS	182	2017-02-05 21:20:27.644068	2017-02-05 21:20:27.644068
2545	Nablus	NBS	182	2017-02-05 21:20:27.650559	2017-02-05 21:20:27.650559
2546	North Gaza	NGZ	182	2017-02-05 21:20:27.656728	2017-02-05 21:20:27.656728
2547	Qalqilya	QQA	182	2017-02-05 21:20:27.665375	2017-02-05 21:20:27.665375
2548	Ramallah	RBH	182	2017-02-05 21:20:27.675744	2017-02-05 21:20:27.675744
2549	Rafah	RFH	182	2017-02-05 21:20:27.688707	2017-02-05 21:20:27.688707
2550	Salfit	SLT	182	2017-02-05 21:20:27.700639	2017-02-05 21:20:27.700639
2551	Tubas	TBS	182	2017-02-05 21:20:27.711127	2017-02-05 21:20:27.711127
2552	Tulkarm	TKM	182	2017-02-05 21:20:27.719277	2017-02-05 21:20:27.719277
2553	Aveiro	01	183	2017-02-05 21:20:27.728972	2017-02-05 21:20:27.728972
2554	Beja	02	183	2017-02-05 21:20:27.737058	2017-02-05 21:20:27.737058
2555	Braga	03	183	2017-02-05 21:20:27.744851	2017-02-05 21:20:27.744851
2556	Bragança	04	183	2017-02-05 21:20:27.752601	2017-02-05 21:20:27.752601
2557	Castelo Branco	05	183	2017-02-05 21:20:27.762815	2017-02-05 21:20:27.762815
2558	Coimbra	06	183	2017-02-05 21:20:27.773427	2017-02-05 21:20:27.773427
2559	Évora	07	183	2017-02-05 21:20:27.784022	2017-02-05 21:20:27.784022
2560	Faro	08	183	2017-02-05 21:20:27.794463	2017-02-05 21:20:27.794463
2561	Guarda	09	183	2017-02-05 21:20:27.803177	2017-02-05 21:20:27.803177
2562	Leiria	10	183	2017-02-05 21:20:27.810342	2017-02-05 21:20:27.810342
2563	Lisboa	11	183	2017-02-05 21:20:27.818166	2017-02-05 21:20:27.818166
2564	Portalegre	12	183	2017-02-05 21:20:27.82677	2017-02-05 21:20:27.82677
2565	Porto	13	183	2017-02-05 21:20:27.837968	2017-02-05 21:20:27.837968
2566	Santarém	14	183	2017-02-05 21:20:27.846338	2017-02-05 21:20:27.846338
2567	Setúbal	15	183	2017-02-05 21:20:27.860983	2017-02-05 21:20:27.860983
2568	Viana do Castelo	16	183	2017-02-05 21:20:27.875105	2017-02-05 21:20:27.875105
2569	Vila Real	17	183	2017-02-05 21:20:27.88785	2017-02-05 21:20:27.88785
2570	Viseu	18	183	2017-02-05 21:20:27.898492	2017-02-05 21:20:27.898492
2571	Região Autónoma dos Açores	20	183	2017-02-05 21:20:27.908332	2017-02-05 21:20:27.908332
2572	Região Autónoma da Madeira	30	183	2017-02-05 21:20:27.918735	2017-02-05 21:20:27.918735
2573	Aimeliik	002	184	2017-02-05 21:20:27.927553	2017-02-05 21:20:27.927553
2574	Airai	004	184	2017-02-05 21:20:27.936118	2017-02-05 21:20:27.936118
2575	Angaur	010	184	2017-02-05 21:20:27.944398	2017-02-05 21:20:27.944398
2576	Hatobohei	050	184	2017-02-05 21:20:27.957938	2017-02-05 21:20:27.957938
2577	Kayangel	100	184	2017-02-05 21:20:27.969871	2017-02-05 21:20:27.969871
2578	Koror	150	184	2017-02-05 21:20:27.979069	2017-02-05 21:20:27.979069
2579	Melekeok	212	184	2017-02-05 21:20:27.987166	2017-02-05 21:20:27.987166
2580	Ngaraard	214	184	2017-02-05 21:20:27.998102	2017-02-05 21:20:27.998102
2581	Ngarchelong	218	184	2017-02-05 21:20:28.007199	2017-02-05 21:20:28.007199
2582	Ngardmau	222	184	2017-02-05 21:20:28.01754	2017-02-05 21:20:28.01754
2583	Ngatpang	224	184	2017-02-05 21:20:28.027764	2017-02-05 21:20:28.027764
2584	Ngchesar	226	184	2017-02-05 21:20:28.040061	2017-02-05 21:20:28.040061
2585	Ngeremlengui	227	184	2017-02-05 21:20:28.050952	2017-02-05 21:20:28.050952
2586	Ngiwal	228	184	2017-02-05 21:20:28.062068	2017-02-05 21:20:28.062068
2587	Peleliu	350	184	2017-02-05 21:20:28.073533	2017-02-05 21:20:28.073533
2588	Sonsorol	370	184	2017-02-05 21:20:28.084987	2017-02-05 21:20:28.084987
2589	Concepción	1	185	2017-02-05 21:20:28.095738	2017-02-05 21:20:28.095738
2590	Alto Paraná	10	185	2017-02-05 21:20:28.105867	2017-02-05 21:20:28.105867
2591	Central	11	185	2017-02-05 21:20:28.115978	2017-02-05 21:20:28.115978
2592	Ñeembucú	12	185	2017-02-05 21:20:28.128122	2017-02-05 21:20:28.128122
2593	Amambay	13	185	2017-02-05 21:20:28.139275	2017-02-05 21:20:28.139275
2594	Canindeyú	14	185	2017-02-05 21:20:28.147093	2017-02-05 21:20:28.147093
2595	Presidente Hayes	15	185	2017-02-05 21:20:28.15602	2017-02-05 21:20:28.15602
2596	Alto Paraguay	16	185	2017-02-05 21:20:28.161736	2017-02-05 21:20:28.161736
2597	Boquerón	19	185	2017-02-05 21:20:28.166452	2017-02-05 21:20:28.166452
2598	San Pedro	2	185	2017-02-05 21:20:28.172339	2017-02-05 21:20:28.172339
2599	Cordillera	3	185	2017-02-05 21:20:28.177869	2017-02-05 21:20:28.177869
2600	Guairá	4	185	2017-02-05 21:20:28.183353	2017-02-05 21:20:28.183353
2601	Caaguazú	5	185	2017-02-05 21:20:28.189161	2017-02-05 21:20:28.189161
2602	Caazapá	6	185	2017-02-05 21:20:28.195435	2017-02-05 21:20:28.195435
2603	Itapúa	7	185	2017-02-05 21:20:28.201606	2017-02-05 21:20:28.201606
2604	Misiones	8	185	2017-02-05 21:20:28.207342	2017-02-05 21:20:28.207342
2605	Paraguarí	9	185	2017-02-05 21:20:28.213265	2017-02-05 21:20:28.213265
2606	Asunción	ASU	185	2017-02-05 21:20:28.219522	2017-02-05 21:20:28.219522
2607	Ad Dawhah	DA	186	2017-02-05 21:20:28.24109	2017-02-05 21:20:28.24109
2608	Al Khawr wa adh Dhakhīrah	KH	186	2017-02-05 21:20:28.248871	2017-02-05 21:20:28.248871
2609	Ash Shamal	MS	186	2017-02-05 21:20:28.256318	2017-02-05 21:20:28.256318
2610	Ar Rayyan	RA	186	2017-02-05 21:20:28.264259	2017-02-05 21:20:28.264259
2611	Umm Salal	US	186	2017-02-05 21:20:28.272875	2017-02-05 21:20:28.272875
2612	Al Wakrah	WA	186	2017-02-05 21:20:28.280548	2017-02-05 21:20:28.280548
2613	Az̧ Z̧a‘āyin	ZA	186	2017-02-05 21:20:28.289116	2017-02-05 21:20:28.289116
2614	Alba	AB	188	2017-02-05 21:20:28.297782	2017-02-05 21:20:28.297782
2615	Argeș	AG	188	2017-02-05 21:20:28.304773	2017-02-05 21:20:28.304773
2616	Arad	AR	188	2017-02-05 21:20:28.311047	2017-02-05 21:20:28.311047
2617	București	B	188	2017-02-05 21:20:28.317436	2017-02-05 21:20:28.317436
2618	Bacău	BC	188	2017-02-05 21:20:28.323623	2017-02-05 21:20:28.323623
2619	Bihor	BH	188	2017-02-05 21:20:28.331143	2017-02-05 21:20:28.331143
2620	Bistrița-Năsăud	BN	188	2017-02-05 21:20:28.338117	2017-02-05 21:20:28.338117
2621	Brăila	BR	188	2017-02-05 21:20:28.34607	2017-02-05 21:20:28.34607
2622	Botoșani	BT	188	2017-02-05 21:20:28.356831	2017-02-05 21:20:28.356831
2623	Brașov	BV	188	2017-02-05 21:20:28.368108	2017-02-05 21:20:28.368108
2624	Buzău	BZ	188	2017-02-05 21:20:28.376426	2017-02-05 21:20:28.376426
2625	Cluj	CJ	188	2017-02-05 21:20:28.385809	2017-02-05 21:20:28.385809
2626	Călărași	CL	188	2017-02-05 21:20:28.395696	2017-02-05 21:20:28.395696
2627	Caraș-Severin	CS	188	2017-02-05 21:20:28.405725	2017-02-05 21:20:28.405725
2628	Constanța	CT	188	2017-02-05 21:20:28.414572	2017-02-05 21:20:28.414572
2629	Covasna	CV	188	2017-02-05 21:20:28.424444	2017-02-05 21:20:28.424444
2630	Dâmbovița	DB	188	2017-02-05 21:20:28.437515	2017-02-05 21:20:28.437515
2631	Dolj	DJ	188	2017-02-05 21:20:28.452335	2017-02-05 21:20:28.452335
2632	Gorj	GJ	188	2017-02-05 21:20:28.466683	2017-02-05 21:20:28.466683
2633	Galați	GL	188	2017-02-05 21:20:28.480862	2017-02-05 21:20:28.480862
2634	Giurgiu	GR	188	2017-02-05 21:20:28.494742	2017-02-05 21:20:28.494742
2635	Hunedoara	HD	188	2017-02-05 21:20:28.50931	2017-02-05 21:20:28.50931
2636	Harghita	HR	188	2017-02-05 21:20:28.522103	2017-02-05 21:20:28.522103
2637	Ilfov	IF	188	2017-02-05 21:20:28.53302	2017-02-05 21:20:28.53302
2638	Ialomița	IL	188	2017-02-05 21:20:28.546147	2017-02-05 21:20:28.546147
2639	Iași	IS	188	2017-02-05 21:20:28.557221	2017-02-05 21:20:28.557221
2640	Mehedinți	MH	188	2017-02-05 21:20:28.569981	2017-02-05 21:20:28.569981
2641	Maramureș	MM	188	2017-02-05 21:20:28.583149	2017-02-05 21:20:28.583149
2642	Mureș	MS	188	2017-02-05 21:20:28.594548	2017-02-05 21:20:28.594548
2643	Neamț	NT	188	2017-02-05 21:20:28.605769	2017-02-05 21:20:28.605769
2644	Olt	OT	188	2017-02-05 21:20:28.621139	2017-02-05 21:20:28.621139
2645	Prahova	PH	188	2017-02-05 21:20:28.634316	2017-02-05 21:20:28.634316
2646	Sibiu	SB	188	2017-02-05 21:20:28.647509	2017-02-05 21:20:28.647509
2647	Sălaj	SJ	188	2017-02-05 21:20:28.661344	2017-02-05 21:20:28.661344
2648	Satu Mare	SM	188	2017-02-05 21:20:28.676811	2017-02-05 21:20:28.676811
2649	Suceava	SV	188	2017-02-05 21:20:28.692762	2017-02-05 21:20:28.692762
2650	Tulcea	TL	188	2017-02-05 21:20:28.702963	2017-02-05 21:20:28.702963
2651	Timiș	TM	188	2017-02-05 21:20:28.71636	2017-02-05 21:20:28.71636
2652	Teleorman	TR	188	2017-02-05 21:20:28.73358	2017-02-05 21:20:28.73358
2653	Vâlcea	VL	188	2017-02-05 21:20:28.743924	2017-02-05 21:20:28.743924
2654	Vrancea	VN	188	2017-02-05 21:20:28.75847	2017-02-05 21:20:28.75847
2655	Vaslui	VS	188	2017-02-05 21:20:28.775052	2017-02-05 21:20:28.775052
2656	Beograd	00	189	2017-02-05 21:20:28.787626	2017-02-05 21:20:28.787626
2657	Mačvanski okrug	08	189	2017-02-05 21:20:28.796158	2017-02-05 21:20:28.796158
2658	Kolubarski okrug	09	189	2017-02-05 21:20:28.805012	2017-02-05 21:20:28.805012
2659	Podunavski okrug	10	189	2017-02-05 21:20:28.813439	2017-02-05 21:20:28.813439
2660	Braničevski okrug	11	189	2017-02-05 21:20:28.821026	2017-02-05 21:20:28.821026
2661	Šumadijski okrug	12	189	2017-02-05 21:20:28.828401	2017-02-05 21:20:28.828401
2662	Pomoravski okrug	13	189	2017-02-05 21:20:28.836281	2017-02-05 21:20:28.836281
2663	Borski okrug	14	189	2017-02-05 21:20:28.843871	2017-02-05 21:20:28.843871
2664	Zaječarski okrug	15	189	2017-02-05 21:20:28.852974	2017-02-05 21:20:28.852974
2665	Zlatiborski okrug	16	189	2017-02-05 21:20:28.862351	2017-02-05 21:20:28.862351
2666	Moravički okrug	17	189	2017-02-05 21:20:28.87127	2017-02-05 21:20:28.87127
2667	Raški okrug	18	189	2017-02-05 21:20:28.879419	2017-02-05 21:20:28.879419
2668	Rasinski okrug	19	189	2017-02-05 21:20:28.887682	2017-02-05 21:20:28.887682
2669	Nišavski okrug	20	189	2017-02-05 21:20:28.896316	2017-02-05 21:20:28.896316
2670	Toplički okrug	21	189	2017-02-05 21:20:28.902489	2017-02-05 21:20:28.902489
2671	Pirotski okrug	22	189	2017-02-05 21:20:28.907262	2017-02-05 21:20:28.907262
2672	Jablanički okrug	23	189	2017-02-05 21:20:28.913209	2017-02-05 21:20:28.913209
2673	Pčinjski okrug	24	189	2017-02-05 21:20:28.918386	2017-02-05 21:20:28.918386
2674	Kosovo-Metohija	KM	189	2017-02-05 21:20:28.923391	2017-02-05 21:20:28.923391
2675	Vojvodina	VO	189	2017-02-05 21:20:28.928016	2017-02-05 21:20:28.928016
2676	Adygeya, Respublika	AD	190	2017-02-05 21:20:28.934015	2017-02-05 21:20:28.934015
2677	Altay, Respublika	AL	190	2017-02-05 21:20:28.939239	2017-02-05 21:20:28.939239
2678	Altayskiy kray	ALT	190	2017-02-05 21:20:28.943856	2017-02-05 21:20:28.943856
2679	Amurskaya oblast'	AMU	190	2017-02-05 21:20:28.949551	2017-02-05 21:20:28.949551
2680	Arkhangel'skaya oblast'	ARK	190	2017-02-05 21:20:28.956371	2017-02-05 21:20:28.956371
2681	Astrakhanskaya oblast'	AST	190	2017-02-05 21:20:28.962078	2017-02-05 21:20:28.962078
2682	Bashkortostan, Respublika	BA	190	2017-02-05 21:20:28.967944	2017-02-05 21:20:28.967944
2683	Belgorodskaya oblast'	BEL	190	2017-02-05 21:20:28.974474	2017-02-05 21:20:28.974474
2684	Bryanskaya oblast'	BRY	190	2017-02-05 21:20:28.981995	2017-02-05 21:20:28.981995
2685	Buryatiya, Respublika	BU	190	2017-02-05 21:20:28.988853	2017-02-05 21:20:28.988853
2686	Chechenskaya Respublika	CE	190	2017-02-05 21:20:28.995074	2017-02-05 21:20:28.995074
2687	Chelyabinskaya oblast'	CHE	190	2017-02-05 21:20:29.001394	2017-02-05 21:20:29.001394
2688	Chukotskiy avtonomnyy okrug	CHU	190	2017-02-05 21:20:29.007688	2017-02-05 21:20:29.007688
2689	Chuvashskaya Respublika	CU	190	2017-02-05 21:20:29.013068	2017-02-05 21:20:29.013068
2690	Dagestan, Respublika	DA	190	2017-02-05 21:20:29.019486	2017-02-05 21:20:29.019486
2691	Respublika Ingushetiya	IN	190	2017-02-05 21:20:29.027025	2017-02-05 21:20:29.027025
2692	Irkutiskaya oblast'	IRK	190	2017-02-05 21:20:29.035249	2017-02-05 21:20:29.035249
2693	Ivanovskaya oblast'	IVA	190	2017-02-05 21:20:29.044665	2017-02-05 21:20:29.044665
2694	Kamchatskiy kray	KAM	190	2017-02-05 21:20:29.056053	2017-02-05 21:20:29.056053
2695	Kabardino-Balkarskaya Respublika	KB	190	2017-02-05 21:20:29.067396	2017-02-05 21:20:29.067396
2696	Karachayevo-Cherkesskaya Respublika	KC	190	2017-02-05 21:20:29.079027	2017-02-05 21:20:29.079027
2697	Krasnodarskiy kray	KDA	190	2017-02-05 21:20:29.089224	2017-02-05 21:20:29.089224
2698	Kemerovskaya oblast'	KEM	190	2017-02-05 21:20:29.097912	2017-02-05 21:20:29.097912
2699	Kaliningradskaya oblast'	KGD	190	2017-02-05 21:20:29.105244	2017-02-05 21:20:29.105244
2700	Kurganskaya oblast'	KGN	190	2017-02-05 21:20:29.110917	2017-02-05 21:20:29.110917
2701	Khabarovskiy kray	KHA	190	2017-02-05 21:20:29.116607	2017-02-05 21:20:29.116607
2702	Khanty-Mansiysky avtonomnyy okrug-Yugra	KHM	190	2017-02-05 21:20:29.12224	2017-02-05 21:20:29.12224
2703	Kirovskaya oblast'	KIR	190	2017-02-05 21:20:29.127845	2017-02-05 21:20:29.127845
2704	Khakasiya, Respublika	KK	190	2017-02-05 21:20:29.133384	2017-02-05 21:20:29.133384
2705	Kalmykiya, Respublika	KL	190	2017-02-05 21:20:29.138997	2017-02-05 21:20:29.138997
2706	Kaluzhskaya oblast'	KLU	190	2017-02-05 21:20:29.145037	2017-02-05 21:20:29.145037
2707	Komi, Respublika	KO	190	2017-02-05 21:20:29.151765	2017-02-05 21:20:29.151765
2708	Kostromskaya oblast'	KOS	190	2017-02-05 21:20:29.157413	2017-02-05 21:20:29.157413
2709	Kareliya, Respublika	KR	190	2017-02-05 21:20:29.16307	2017-02-05 21:20:29.16307
2710	Kurskaya oblast'	KRS	190	2017-02-05 21:20:29.169215	2017-02-05 21:20:29.169215
2711	Krasnoyarskiy kray	KYA	190	2017-02-05 21:20:29.175251	2017-02-05 21:20:29.175251
2712	Leningradskaya oblast'	LEN	190	2017-02-05 21:20:29.182675	2017-02-05 21:20:29.182675
2713	Lipetskaya oblast'	LIP	190	2017-02-05 21:20:29.190626	2017-02-05 21:20:29.190626
2714	Magadanskaya oblast'	MAG	190	2017-02-05 21:20:29.200001	2017-02-05 21:20:29.200001
2715	Mariy El, Respublika	ME	190	2017-02-05 21:20:29.206696	2017-02-05 21:20:29.206696
2716	Mordoviya, Respublika	MO	190	2017-02-05 21:20:29.212808	2017-02-05 21:20:29.212808
2717	Moskovskaya oblast'	MOS	190	2017-02-05 21:20:29.219254	2017-02-05 21:20:29.219254
2718	Moskva	MOW	190	2017-02-05 21:20:29.225273	2017-02-05 21:20:29.225273
2719	Murmanskaya oblast'	MUR	190	2017-02-05 21:20:29.231809	2017-02-05 21:20:29.231809
2720	Nenetskiy avtonomnyy okrug	NEN	190	2017-02-05 21:20:29.237854	2017-02-05 21:20:29.237854
2721	Novgorodskaya oblast'	NGR	190	2017-02-05 21:20:29.243343	2017-02-05 21:20:29.243343
2722	Nizhegorodskaya oblast'	NIZ	190	2017-02-05 21:20:29.249142	2017-02-05 21:20:29.249142
2723	Novosibirskaya oblast'	NVS	190	2017-02-05 21:20:29.257412	2017-02-05 21:20:29.257412
2724	Omskaya oblast'	OMS	190	2017-02-05 21:20:29.264004	2017-02-05 21:20:29.264004
2725	Orenburgskaya oblast'	ORE	190	2017-02-05 21:20:29.271299	2017-02-05 21:20:29.271299
2726	Orlovskaya oblast'	ORL	190	2017-02-05 21:20:29.279423	2017-02-05 21:20:29.279423
2727	Permskiy kray	PER	190	2017-02-05 21:20:29.28878	2017-02-05 21:20:29.28878
2728	Penzenskaya oblast'	PNZ	190	2017-02-05 21:20:29.297763	2017-02-05 21:20:29.297763
2729	Primorskiy kray	PRI	190	2017-02-05 21:20:29.306965	2017-02-05 21:20:29.306965
2730	Pskovskaya oblast'	PSK	190	2017-02-05 21:20:29.316283	2017-02-05 21:20:29.316283
2731	Rostovskaya oblast'	ROS	190	2017-02-05 21:20:29.324568	2017-02-05 21:20:29.324568
2732	Ryazanskaya oblast'	RYA	190	2017-02-05 21:20:29.330954	2017-02-05 21:20:29.330954
2733	Sakha, Respublika [Yakutiya]	SA	190	2017-02-05 21:20:29.33795	2017-02-05 21:20:29.33795
2734	Sakhalinskaya oblast'	SAK	190	2017-02-05 21:20:29.345291	2017-02-05 21:20:29.345291
2735	Samaraskaya oblast'	SAM	190	2017-02-05 21:20:29.352459	2017-02-05 21:20:29.352459
2736	Saratovskaya oblast'	SAR	190	2017-02-05 21:20:29.359514	2017-02-05 21:20:29.359514
2737	Severnaya Osetiya-Alaniya, Respublika	SE	190	2017-02-05 21:20:29.365442	2017-02-05 21:20:29.365442
2738	Smolenskaya oblast'	SMO	190	2017-02-05 21:20:29.371639	2017-02-05 21:20:29.371639
2739	Sankt-Peterburg	SPE	190	2017-02-05 21:20:29.378244	2017-02-05 21:20:29.378244
2740	Stavropol'skiy kray	STA	190	2017-02-05 21:20:29.38488	2017-02-05 21:20:29.38488
2741	Sverdlovskaya oblast'	SVE	190	2017-02-05 21:20:29.393483	2017-02-05 21:20:29.393483
2742	Tatarstan, Respublika	TA	190	2017-02-05 21:20:29.402005	2017-02-05 21:20:29.402005
2743	Tambovskaya oblast'	TAM	190	2017-02-05 21:20:29.408324	2017-02-05 21:20:29.408324
2744	Tomskaya oblast'	TOM	190	2017-02-05 21:20:29.413639	2017-02-05 21:20:29.413639
2745	Tul'skaya oblast'	TUL	190	2017-02-05 21:20:29.419231	2017-02-05 21:20:29.419231
2746	Tverskaya oblast'	TVE	190	2017-02-05 21:20:29.425913	2017-02-05 21:20:29.425913
2747	Tyva, Respublika [Tuva]	TY	190	2017-02-05 21:20:29.432652	2017-02-05 21:20:29.432652
2748	Tyumenskaya oblast'	TYU	190	2017-02-05 21:20:29.438159	2017-02-05 21:20:29.438159
2749	Udmurtskaya Respublika	UD	190	2017-02-05 21:20:29.444485	2017-02-05 21:20:29.444485
2750	Ul'yanovskaya oblast'	ULY	190	2017-02-05 21:20:29.451674	2017-02-05 21:20:29.451674
2751	Volgogradskaya oblast'	VGG	190	2017-02-05 21:20:29.458181	2017-02-05 21:20:29.458181
2752	Vladimirskaya oblast'	VLA	190	2017-02-05 21:20:29.464077	2017-02-05 21:20:29.464077
2753	Vologodskaya oblast'	VLG	190	2017-02-05 21:20:29.473319	2017-02-05 21:20:29.473319
2754	Voronezhskaya oblast'	VOR	190	2017-02-05 21:20:29.483596	2017-02-05 21:20:29.483596
2755	Yamalo-Nenetskiy avtonomnyy okrug	YAN	190	2017-02-05 21:20:29.495723	2017-02-05 21:20:29.495723
2756	Yaroslavskaya oblast'	YAR	190	2017-02-05 21:20:29.510001	2017-02-05 21:20:29.510001
2757	Yevreyskaya avtonomnaya oblast'	YEV	190	2017-02-05 21:20:29.522531	2017-02-05 21:20:29.522531
2758	Zabajkal'skij kraj	ZAB	190	2017-02-05 21:20:29.532931	2017-02-05 21:20:29.532931
2759	Ville de Kigali	01	191	2017-02-05 21:20:29.545788	2017-02-05 21:20:29.545788
2760	Est	02	191	2017-02-05 21:20:29.560093	2017-02-05 21:20:29.560093
2761	Nord	03	191	2017-02-05 21:20:29.572041	2017-02-05 21:20:29.572041
2762	Ouest	04	191	2017-02-05 21:20:29.585683	2017-02-05 21:20:29.585683
2763	Sud	05	191	2017-02-05 21:20:29.597463	2017-02-05 21:20:29.597463
2764	Ar Riyāḍ	01	192	2017-02-05 21:20:29.611461	2017-02-05 21:20:29.611461
2765	Makkah	02	192	2017-02-05 21:20:29.619799	2017-02-05 21:20:29.619799
2766	Al Madīnah	03	192	2017-02-05 21:20:29.628656	2017-02-05 21:20:29.628656
2767	Ash Sharqīyah	04	192	2017-02-05 21:20:29.643367	2017-02-05 21:20:29.643367
2768	Al Qaşīm	05	192	2017-02-05 21:20:29.65429	2017-02-05 21:20:29.65429
2769	Ḥā'il	06	192	2017-02-05 21:20:29.664205	2017-02-05 21:20:29.664205
2770	Tabūk	07	192	2017-02-05 21:20:29.675753	2017-02-05 21:20:29.675753
2771	Al Ḥudūd ash Shamāliyah	08	192	2017-02-05 21:20:29.6907	2017-02-05 21:20:29.6907
2772	Jīzan	09	192	2017-02-05 21:20:29.703952	2017-02-05 21:20:29.703952
2773	Najrān	10	192	2017-02-05 21:20:29.71813	2017-02-05 21:20:29.71813
2774	Al Bāhah	11	192	2017-02-05 21:20:29.731018	2017-02-05 21:20:29.731018
2775	Al Jawf	12	192	2017-02-05 21:20:29.743189	2017-02-05 21:20:29.743189
2776	`Asīr	14	192	2017-02-05 21:20:29.754223	2017-02-05 21:20:29.754223
2777	Central	CE	193	2017-02-05 21:20:29.769678	2017-02-05 21:20:29.769678
2778	Choiseul	CH	193	2017-02-05 21:20:29.782251	2017-02-05 21:20:29.782251
2779	Capital Territory (Honiara)	CT	193	2017-02-05 21:20:29.791825	2017-02-05 21:20:29.791825
2780	Guadalcanal	GU	193	2017-02-05 21:20:29.802394	2017-02-05 21:20:29.802394
2781	Isabel	IS	193	2017-02-05 21:20:29.815831	2017-02-05 21:20:29.815831
2782	Makira	MK	193	2017-02-05 21:20:29.826149	2017-02-05 21:20:29.826149
2783	Malaita	ML	193	2017-02-05 21:20:29.83625	2017-02-05 21:20:29.83625
2784	Rennell and Bellona	RB	193	2017-02-05 21:20:29.846962	2017-02-05 21:20:29.846962
2785	Temotu	TE	193	2017-02-05 21:20:29.858296	2017-02-05 21:20:29.858296
2786	Western	WE	193	2017-02-05 21:20:29.868125	2017-02-05 21:20:29.868125
2787	Anse aux Pins	01	194	2017-02-05 21:20:29.878328	2017-02-05 21:20:29.878328
2788	Anse Boileau	02	194	2017-02-05 21:20:29.891182	2017-02-05 21:20:29.891182
2789	Anse Etoile	03	194	2017-02-05 21:20:29.90233	2017-02-05 21:20:29.90233
2790	Anse Louis	04	194	2017-02-05 21:20:29.910394	2017-02-05 21:20:29.910394
2791	Anse Royale	05	194	2017-02-05 21:20:29.922212	2017-02-05 21:20:29.922212
2792	Baie Lazare	06	194	2017-02-05 21:20:29.933127	2017-02-05 21:20:29.933127
2793	Baie Sainte Anne	07	194	2017-02-05 21:20:29.945448	2017-02-05 21:20:29.945448
2794	Beau Vallon	08	194	2017-02-05 21:20:29.952743	2017-02-05 21:20:29.952743
2795	Bel Air	09	194	2017-02-05 21:20:29.959956	2017-02-05 21:20:29.959956
2796	Bel Ombre	10	194	2017-02-05 21:20:29.965027	2017-02-05 21:20:29.965027
2797	Cascade	11	194	2017-02-05 21:20:29.969843	2017-02-05 21:20:29.969843
2798	Glacis	12	194	2017-02-05 21:20:29.974508	2017-02-05 21:20:29.974508
2799	Grand Anse Mahe	13	194	2017-02-05 21:20:29.981536	2017-02-05 21:20:29.981536
2800	Grand Anse Praslin	14	194	2017-02-05 21:20:29.98687	2017-02-05 21:20:29.98687
2801	La Digue	15	194	2017-02-05 21:20:29.991865	2017-02-05 21:20:29.991865
2802	English River	16	194	2017-02-05 21:20:29.996427	2017-02-05 21:20:29.996427
2803	Mont Buxton	17	194	2017-02-05 21:20:30.002637	2017-02-05 21:20:30.002637
2804	Mont Fleuri	18	194	2017-02-05 21:20:30.009475	2017-02-05 21:20:30.009475
2805	Plaisance	19	194	2017-02-05 21:20:30.016248	2017-02-05 21:20:30.016248
2806	Pointe Larue	20	194	2017-02-05 21:20:30.022538	2017-02-05 21:20:30.022538
2807	Port Glaud	21	194	2017-02-05 21:20:30.028288	2017-02-05 21:20:30.028288
2808	Saint Louis	22	194	2017-02-05 21:20:30.034108	2017-02-05 21:20:30.034108
2809	Takamaka	23	194	2017-02-05 21:20:30.039174	2017-02-05 21:20:30.039174
2810	Les Mamelles	24	194	2017-02-05 21:20:30.044976	2017-02-05 21:20:30.044976
2811	Roche Caiman	25	194	2017-02-05 21:20:30.052706	2017-02-05 21:20:30.052706
2812	Zalingei	DC	195	2017-02-05 21:20:30.060499	2017-02-05 21:20:30.060499
2813	Sharq Dārfūr	DE	195	2017-02-05 21:20:30.066738	2017-02-05 21:20:30.066738
2814	Shamāl Dārfūr	DN	195	2017-02-05 21:20:30.072214	2017-02-05 21:20:30.072214
2815	Janūb Dārfūr	DS	195	2017-02-05 21:20:30.077621	2017-02-05 21:20:30.077621
2816	Gharb Dārfūr	DW	195	2017-02-05 21:20:30.083603	2017-02-05 21:20:30.083603
2817	Al Qaḑārif	GD	195	2017-02-05 21:20:30.090348	2017-02-05 21:20:30.090348
2818	Al Jazīrah	GZ	195	2017-02-05 21:20:30.097421	2017-02-05 21:20:30.097421
2819	Kassalā	KA	195	2017-02-05 21:20:30.105987	2017-02-05 21:20:30.105987
2820	Al Kharţūm	KH	195	2017-02-05 21:20:30.11146	2017-02-05 21:20:30.11146
2821	Shamāl Kurdufān	KN	195	2017-02-05 21:20:30.117816	2017-02-05 21:20:30.117816
2822	Janūb Kurdufān	KS	195	2017-02-05 21:20:30.124381	2017-02-05 21:20:30.124381
2823	An Nīl al Azraq	NB	195	2017-02-05 21:20:30.131835	2017-02-05 21:20:30.131835
2824	Ash Shamālīyah	NO	195	2017-02-05 21:20:30.140475	2017-02-05 21:20:30.140475
2825	An Nīl	NR	195	2017-02-05 21:20:30.149373	2017-02-05 21:20:30.149373
2826	An Nīl al Abyaḑ	NW	195	2017-02-05 21:20:30.156733	2017-02-05 21:20:30.156733
2827	Al Baḩr al Aḩmar	RS	195	2017-02-05 21:20:30.166557	2017-02-05 21:20:30.166557
2828	Sinnār	SI	195	2017-02-05 21:20:30.176999	2017-02-05 21:20:30.176999
2829	Stockholms län	AB	196	2017-02-05 21:20:30.189269	2017-02-05 21:20:30.189269
2830	Västerbottens län	AC	196	2017-02-05 21:20:30.204696	2017-02-05 21:20:30.204696
2831	Norrbottens län	BD	196	2017-02-05 21:20:30.221851	2017-02-05 21:20:30.221851
2832	Uppsala län	C	196	2017-02-05 21:20:30.235142	2017-02-05 21:20:30.235142
2833	Södermanlands län	D	196	2017-02-05 21:20:30.245677	2017-02-05 21:20:30.245677
2834	Östergötlands län	E	196	2017-02-05 21:20:30.256984	2017-02-05 21:20:30.256984
2835	Jönköpings län	F	196	2017-02-05 21:20:30.26818	2017-02-05 21:20:30.26818
2836	Kronobergs län	G	196	2017-02-05 21:20:30.27725	2017-02-05 21:20:30.27725
2837	Kalmar län	H	196	2017-02-05 21:20:30.285036	2017-02-05 21:20:30.285036
2838	Gotlands län	I	196	2017-02-05 21:20:30.294686	2017-02-05 21:20:30.294686
2839	Blekinge län	K	196	2017-02-05 21:20:30.306346	2017-02-05 21:20:30.306346
2840	Skåne län	M	196	2017-02-05 21:20:30.316666	2017-02-05 21:20:30.316666
2841	Hallands län	N	196	2017-02-05 21:20:30.326753	2017-02-05 21:20:30.326753
2842	Västra Götalands län	O	196	2017-02-05 21:20:30.33562	2017-02-05 21:20:30.33562
2843	Värmlands län	S	196	2017-02-05 21:20:30.340592	2017-02-05 21:20:30.340592
2844	Örebro län	T	196	2017-02-05 21:20:30.345686	2017-02-05 21:20:30.345686
2845	Västmanlands län	U	196	2017-02-05 21:20:30.350173	2017-02-05 21:20:30.350173
2846	Dalarnas län	W	196	2017-02-05 21:20:30.355215	2017-02-05 21:20:30.355215
2847	Gävleborgs län	X	196	2017-02-05 21:20:30.359625	2017-02-05 21:20:30.359625
2848	Västernorrlands län	Y	196	2017-02-05 21:20:30.364244	2017-02-05 21:20:30.364244
2849	Jämtlands län	Z	196	2017-02-05 21:20:30.368812	2017-02-05 21:20:30.368812
2850	Central Singapore	01	197	2017-02-05 21:20:30.373849	2017-02-05 21:20:30.373849
2851	North East	02	197	2017-02-05 21:20:30.378214	2017-02-05 21:20:30.378214
2852	North West	03	197	2017-02-05 21:20:30.382705	2017-02-05 21:20:30.382705
2853	South East	04	197	2017-02-05 21:20:30.389537	2017-02-05 21:20:30.389537
2854	South West	05	197	2017-02-05 21:20:30.396941	2017-02-05 21:20:30.396941
2855	Ascension	AC	198	2017-02-05 21:20:30.403258	2017-02-05 21:20:30.403258
2856	Saint Helena	HL	198	2017-02-05 21:20:30.409451	2017-02-05 21:20:30.409451
2857	Tristan da Cunha	TA	198	2017-02-05 21:20:30.416573	2017-02-05 21:20:30.416573
2858	Ajdovščina	001	199	2017-02-05 21:20:30.424165	2017-02-05 21:20:30.424165
2859	Beltinci	002	199	2017-02-05 21:20:30.429904	2017-02-05 21:20:30.429904
2860	Bled	003	199	2017-02-05 21:20:30.436013	2017-02-05 21:20:30.436013
2861	Bohinj	004	199	2017-02-05 21:20:30.440797	2017-02-05 21:20:30.440797
2862	Borovnica	005	199	2017-02-05 21:20:30.44554	2017-02-05 21:20:30.44554
2863	Bovec	006	199	2017-02-05 21:20:30.45193	2017-02-05 21:20:30.45193
2864	Brda	007	199	2017-02-05 21:20:30.457685	2017-02-05 21:20:30.457685
2865	Brezovica	008	199	2017-02-05 21:20:30.463678	2017-02-05 21:20:30.463678
2866	Brežice	009	199	2017-02-05 21:20:30.470361	2017-02-05 21:20:30.470361
2867	Tišina	010	199	2017-02-05 21:20:30.47694	2017-02-05 21:20:30.47694
2868	Celje	011	199	2017-02-05 21:20:30.484568	2017-02-05 21:20:30.484568
2869	Cerklje na Gorenjskem	012	199	2017-02-05 21:20:30.491341	2017-02-05 21:20:30.491341
2870	Cerknica	013	199	2017-02-05 21:20:30.497147	2017-02-05 21:20:30.497147
2871	Cerkno	014	199	2017-02-05 21:20:30.504014	2017-02-05 21:20:30.504014
2872	Črenšovci	015	199	2017-02-05 21:20:30.51049	2017-02-05 21:20:30.51049
2873	Črna na Koroškem	016	199	2017-02-05 21:20:30.515039	2017-02-05 21:20:30.515039
2874	Črnomelj	017	199	2017-02-05 21:20:30.519752	2017-02-05 21:20:30.519752
2875	Destrnik	018	199	2017-02-05 21:20:30.524291	2017-02-05 21:20:30.524291
2876	Divača	019	199	2017-02-05 21:20:30.528908	2017-02-05 21:20:30.528908
2877	Dobrepolje	020	199	2017-02-05 21:20:30.533563	2017-02-05 21:20:30.533563
2878	Dobrova-Polhov Gradec	021	199	2017-02-05 21:20:30.538882	2017-02-05 21:20:30.538882
2879	Dol pri Ljubljani	022	199	2017-02-05 21:20:30.543755	2017-02-05 21:20:30.543755
2880	Domžale	023	199	2017-02-05 21:20:30.548653	2017-02-05 21:20:30.548653
2881	Dornava	024	199	2017-02-05 21:20:30.553764	2017-02-05 21:20:30.553764
2882	Dravograd	025	199	2017-02-05 21:20:30.558986	2017-02-05 21:20:30.558986
2883	Duplek	026	199	2017-02-05 21:20:30.564476	2017-02-05 21:20:30.564476
2884	Gorenja vas-Poljane	027	199	2017-02-05 21:20:30.57036	2017-02-05 21:20:30.57036
2885	Gorišnica	028	199	2017-02-05 21:20:30.574761	2017-02-05 21:20:30.574761
2886	Gornja Radgona	029	199	2017-02-05 21:20:30.578946	2017-02-05 21:20:30.578946
2887	Gornji Grad	030	199	2017-02-05 21:20:30.583152	2017-02-05 21:20:30.583152
2888	Gornji Petrovci	031	199	2017-02-05 21:20:30.587197	2017-02-05 21:20:30.587197
2889	Grosuplje	032	199	2017-02-05 21:20:30.591215	2017-02-05 21:20:30.591215
2890	Šalovci	033	199	2017-02-05 21:20:30.595327	2017-02-05 21:20:30.595327
2891	Hrastnik	034	199	2017-02-05 21:20:30.599212	2017-02-05 21:20:30.599212
2892	Hrpelje-Kozina	035	199	2017-02-05 21:20:30.603152	2017-02-05 21:20:30.603152
2893	Idrija	036	199	2017-02-05 21:20:30.607313	2017-02-05 21:20:30.607313
2894	Ig	037	199	2017-02-05 21:20:30.612254	2017-02-05 21:20:30.612254
2895	Ilirska Bistrica	038	199	2017-02-05 21:20:30.619279	2017-02-05 21:20:30.619279
2896	Ivančna Gorica	039	199	2017-02-05 21:20:30.625128	2017-02-05 21:20:30.625128
2897	Izola/Isola	040	199	2017-02-05 21:20:30.629875	2017-02-05 21:20:30.629875
2898	Jesenice	041	199	2017-02-05 21:20:30.634624	2017-02-05 21:20:30.634624
2899	Juršinci	042	199	2017-02-05 21:20:30.639363	2017-02-05 21:20:30.639363
2900	Kamnik	043	199	2017-02-05 21:20:30.644396	2017-02-05 21:20:30.644396
2901	Kanal	044	199	2017-02-05 21:20:30.650235	2017-02-05 21:20:30.650235
2902	Kidričevo	045	199	2017-02-05 21:20:30.656443	2017-02-05 21:20:30.656443
2903	Kobarid	046	199	2017-02-05 21:20:30.661106	2017-02-05 21:20:30.661106
2904	Kobilje	047	199	2017-02-05 21:20:30.667013	2017-02-05 21:20:30.667013
2905	Kočevje	048	199	2017-02-05 21:20:30.673875	2017-02-05 21:20:30.673875
2906	Komen	049	199	2017-02-05 21:20:30.679976	2017-02-05 21:20:30.679976
2907	Koper/Capodistria	050	199	2017-02-05 21:20:30.686669	2017-02-05 21:20:30.686669
2908	Kozje	051	199	2017-02-05 21:20:30.693881	2017-02-05 21:20:30.693881
2909	Kranj	052	199	2017-02-05 21:20:30.700796	2017-02-05 21:20:30.700796
2910	Kranjska Gora	053	199	2017-02-05 21:20:30.707201	2017-02-05 21:20:30.707201
2911	Krško	054	199	2017-02-05 21:20:30.712911	2017-02-05 21:20:30.712911
2912	Kungota	055	199	2017-02-05 21:20:30.7187	2017-02-05 21:20:30.7187
2913	Kuzma	056	199	2017-02-05 21:20:30.725371	2017-02-05 21:20:30.725371
2914	Laško	057	199	2017-02-05 21:20:30.732592	2017-02-05 21:20:30.732592
2915	Lenart	058	199	2017-02-05 21:20:30.738446	2017-02-05 21:20:30.738446
2916	Lendava/Lendva	059	199	2017-02-05 21:20:30.745006	2017-02-05 21:20:30.745006
2917	Litija	060	199	2017-02-05 21:20:30.749768	2017-02-05 21:20:30.749768
2918	Ljubljana	061	199	2017-02-05 21:20:30.754624	2017-02-05 21:20:30.754624
2919	Ljubno	062	199	2017-02-05 21:20:30.759386	2017-02-05 21:20:30.759386
2920	Ljutomer	063	199	2017-02-05 21:20:30.763833	2017-02-05 21:20:30.763833
2921	Logatec	064	199	2017-02-05 21:20:30.768878	2017-02-05 21:20:30.768878
2922	Loška dolina	065	199	2017-02-05 21:20:30.773916	2017-02-05 21:20:30.773916
2923	Loški Potok	066	199	2017-02-05 21:20:30.778536	2017-02-05 21:20:30.778536
2924	Luče	067	199	2017-02-05 21:20:30.783096	2017-02-05 21:20:30.783096
2925	Lukovica	068	199	2017-02-05 21:20:30.787785	2017-02-05 21:20:30.787785
2926	Majšperk	069	199	2017-02-05 21:20:30.793317	2017-02-05 21:20:30.793317
2927	Maribor	070	199	2017-02-05 21:20:30.800102	2017-02-05 21:20:30.800102
2928	Medvode	071	199	2017-02-05 21:20:30.807085	2017-02-05 21:20:30.807085
2929	Mengeš	072	199	2017-02-05 21:20:30.813822	2017-02-05 21:20:30.813822
2930	Metlika	073	199	2017-02-05 21:20:30.824698	2017-02-05 21:20:30.824698
2931	Mežica	074	199	2017-02-05 21:20:30.832374	2017-02-05 21:20:30.832374
2932	Miren-Kostanjevica	075	199	2017-02-05 21:20:30.838415	2017-02-05 21:20:30.838415
2933	Mislinja	076	199	2017-02-05 21:20:30.843238	2017-02-05 21:20:30.843238
2934	Moravče	077	199	2017-02-05 21:20:30.848477	2017-02-05 21:20:30.848477
2935	Moravske Toplice	078	199	2017-02-05 21:20:30.853128	2017-02-05 21:20:30.853128
2936	Mozirje	079	199	2017-02-05 21:20:30.858539	2017-02-05 21:20:30.858539
2937	Murska Sobota	080	199	2017-02-05 21:20:30.864531	2017-02-05 21:20:30.864531
2938	Muta	081	199	2017-02-05 21:20:30.87049	2017-02-05 21:20:30.87049
2939	Naklo	082	199	2017-02-05 21:20:30.87634	2017-02-05 21:20:30.87634
2940	Nazarje	083	199	2017-02-05 21:20:30.881917	2017-02-05 21:20:30.881917
2941	Nova Gorica	084	199	2017-02-05 21:20:30.887529	2017-02-05 21:20:30.887529
2942	Novo mesto	085	199	2017-02-05 21:20:30.89186	2017-02-05 21:20:30.89186
2943	Odranci	086	199	2017-02-05 21:20:30.896269	2017-02-05 21:20:30.896269
2944	Ormož	087	199	2017-02-05 21:20:30.901815	2017-02-05 21:20:30.901815
2945	Osilnica	088	199	2017-02-05 21:20:30.907459	2017-02-05 21:20:30.907459
2946	Pesnica	089	199	2017-02-05 21:20:30.913244	2017-02-05 21:20:30.913244
2947	Piran/Pirano	090	199	2017-02-05 21:20:30.917822	2017-02-05 21:20:30.917822
2948	Pivka	091	199	2017-02-05 21:20:30.921986	2017-02-05 21:20:30.921986
2949	Podčetrtek	092	199	2017-02-05 21:20:30.926029	2017-02-05 21:20:30.926029
2950	Podvelka	093	199	2017-02-05 21:20:30.930454	2017-02-05 21:20:30.930454
2951	Postojna	094	199	2017-02-05 21:20:30.93543	2017-02-05 21:20:30.93543
2952	Preddvor	095	199	2017-02-05 21:20:30.939487	2017-02-05 21:20:30.939487
2953	Ptuj	096	199	2017-02-05 21:20:30.943311	2017-02-05 21:20:30.943311
2954	Puconci	097	199	2017-02-05 21:20:30.947845	2017-02-05 21:20:30.947845
2955	Rače-Fram	098	199	2017-02-05 21:20:30.951776	2017-02-05 21:20:30.951776
2956	Radeče	099	199	2017-02-05 21:20:30.965114	2017-02-05 21:20:30.965114
2957	Radenci	100	199	2017-02-05 21:20:30.969288	2017-02-05 21:20:30.969288
2958	Radlje ob Dravi	101	199	2017-02-05 21:20:30.973807	2017-02-05 21:20:30.973807
2959	Radovljica	102	199	2017-02-05 21:20:30.97979	2017-02-05 21:20:30.97979
2960	Ravne na Koroškem	103	199	2017-02-05 21:20:30.98396	2017-02-05 21:20:30.98396
2961	Ribnica	104	199	2017-02-05 21:20:30.988497	2017-02-05 21:20:30.988497
2962	Rogašovci	105	199	2017-02-05 21:20:30.994538	2017-02-05 21:20:30.994538
2963	Rogaška Slatina	106	199	2017-02-05 21:20:31.000288	2017-02-05 21:20:31.000288
2964	Rogatec	107	199	2017-02-05 21:20:31.006381	2017-02-05 21:20:31.006381
2965	Ruše	108	199	2017-02-05 21:20:31.012957	2017-02-05 21:20:31.012957
2966	Semič	109	199	2017-02-05 21:20:31.018194	2017-02-05 21:20:31.018194
2967	Sevnica	110	199	2017-02-05 21:20:31.022476	2017-02-05 21:20:31.022476
2968	Sežana	111	199	2017-02-05 21:20:31.027625	2017-02-05 21:20:31.027625
2969	Slovenj Gradec	112	199	2017-02-05 21:20:31.033273	2017-02-05 21:20:31.033273
2970	Slovenska Bistrica	113	199	2017-02-05 21:20:31.038038	2017-02-05 21:20:31.038038
2971	Slovenske Konjice	114	199	2017-02-05 21:20:31.043951	2017-02-05 21:20:31.043951
2972	Starče	115	199	2017-02-05 21:20:31.051285	2017-02-05 21:20:31.051285
2973	Sveti Jurij	116	199	2017-02-05 21:20:31.058497	2017-02-05 21:20:31.058497
2974	Šenčur	117	199	2017-02-05 21:20:31.062912	2017-02-05 21:20:31.062912
2975	Šentilj	118	199	2017-02-05 21:20:31.067326	2017-02-05 21:20:31.067326
2976	Šentjernej	119	199	2017-02-05 21:20:31.073255	2017-02-05 21:20:31.073255
2977	Šentjur	120	199	2017-02-05 21:20:31.07772	2017-02-05 21:20:31.07772
2978	Škocjan	121	199	2017-02-05 21:20:31.082325	2017-02-05 21:20:31.082325
2979	Škofja Loka	122	199	2017-02-05 21:20:31.087618	2017-02-05 21:20:31.087618
2980	Škofljica	123	199	2017-02-05 21:20:31.092065	2017-02-05 21:20:31.092065
2981	Šmarje pri Jelšah	124	199	2017-02-05 21:20:31.097728	2017-02-05 21:20:31.097728
2982	Šmartno ob Paki	125	199	2017-02-05 21:20:31.104359	2017-02-05 21:20:31.104359
2983	Šoštanj	126	199	2017-02-05 21:20:31.108731	2017-02-05 21:20:31.108731
2984	Štore	127	199	2017-02-05 21:20:31.113193	2017-02-05 21:20:31.113193
2985	Tolmin	128	199	2017-02-05 21:20:31.117485	2017-02-05 21:20:31.117485
2986	Trbovlje	129	199	2017-02-05 21:20:31.121914	2017-02-05 21:20:31.121914
2987	Trebnje	130	199	2017-02-05 21:20:31.126332	2017-02-05 21:20:31.126332
2988	Tržič	131	199	2017-02-05 21:20:31.130604	2017-02-05 21:20:31.130604
2989	Turnišče	132	199	2017-02-05 21:20:31.134926	2017-02-05 21:20:31.134926
2990	Velenje	133	199	2017-02-05 21:20:31.139114	2017-02-05 21:20:31.139114
2991	Velike Lašče	134	199	2017-02-05 21:20:31.143237	2017-02-05 21:20:31.143237
2992	Videm	135	199	2017-02-05 21:20:31.147457	2017-02-05 21:20:31.147457
2993	Vipava	136	199	2017-02-05 21:20:31.151616	2017-02-05 21:20:31.151616
2994	Vitanje	137	199	2017-02-05 21:20:31.155759	2017-02-05 21:20:31.155759
2995	Vodice	138	199	2017-02-05 21:20:31.160078	2017-02-05 21:20:31.160078
2996	Vojnik	139	199	2017-02-05 21:20:31.164359	2017-02-05 21:20:31.164359
2997	Vrhnika	140	199	2017-02-05 21:20:31.1684	2017-02-05 21:20:31.1684
2998	Vuzenica	141	199	2017-02-05 21:20:31.172616	2017-02-05 21:20:31.172616
2999	Zagorje ob Savi	142	199	2017-02-05 21:20:31.176861	2017-02-05 21:20:31.176861
3000	Zavrč	143	199	2017-02-05 21:20:31.181319	2017-02-05 21:20:31.181319
3001	Zreče	144	199	2017-02-05 21:20:31.185629	2017-02-05 21:20:31.185629
3002	Železniki	146	199	2017-02-05 21:20:31.190221	2017-02-05 21:20:31.190221
3003	Žiri	147	199	2017-02-05 21:20:31.194209	2017-02-05 21:20:31.194209
3004	Benedikt	148	199	2017-02-05 21:20:31.198261	2017-02-05 21:20:31.198261
3005	Bistrica ob Sotli	149	199	2017-02-05 21:20:31.203151	2017-02-05 21:20:31.203151
3006	Bloke	150	199	2017-02-05 21:20:31.208307	2017-02-05 21:20:31.208307
3007	Braslovče	151	199	2017-02-05 21:20:31.212823	2017-02-05 21:20:31.212823
3008	Cankova	152	199	2017-02-05 21:20:31.217799	2017-02-05 21:20:31.217799
3009	Cerkvenjak	153	199	2017-02-05 21:20:31.222321	2017-02-05 21:20:31.222321
3010	Dobje	154	199	2017-02-05 21:20:31.22654	2017-02-05 21:20:31.22654
3011	Dobrna	155	199	2017-02-05 21:20:31.231094	2017-02-05 21:20:31.231094
3012	Dobrovnik/Dobronak	156	199	2017-02-05 21:20:31.236114	2017-02-05 21:20:31.236114
3013	Dolenjske Toplice	157	199	2017-02-05 21:20:31.241984	2017-02-05 21:20:31.241984
3014	Grad	158	199	2017-02-05 21:20:31.246664	2017-02-05 21:20:31.246664
3015	Hajdina	159	199	2017-02-05 21:20:31.250793	2017-02-05 21:20:31.250793
3016	Hoče-Slivnica	160	199	2017-02-05 21:20:31.255199	2017-02-05 21:20:31.255199
3017	Hodoš/Hodos	161	199	2017-02-05 21:20:31.260741	2017-02-05 21:20:31.260741
3018	Horjul	162	199	2017-02-05 21:20:31.267245	2017-02-05 21:20:31.267245
3019	Jezersko	163	199	2017-02-05 21:20:31.274142	2017-02-05 21:20:31.274142
3020	Komenda	164	199	2017-02-05 21:20:31.281579	2017-02-05 21:20:31.281579
3021	Kostel	165	199	2017-02-05 21:20:31.28887	2017-02-05 21:20:31.28887
3022	Križevci	166	199	2017-02-05 21:20:31.295783	2017-02-05 21:20:31.295783
3023	Lovrenc na Pohorju	167	199	2017-02-05 21:20:31.302599	2017-02-05 21:20:31.302599
3024	Markovci	168	199	2017-02-05 21:20:31.308397	2017-02-05 21:20:31.308397
3025	Miklavž na Dravskem polju	169	199	2017-02-05 21:20:31.312685	2017-02-05 21:20:31.312685
3026	Mirna Peč	170	199	2017-02-05 21:20:31.31702	2017-02-05 21:20:31.31702
3027	Oplotnica	171	199	2017-02-05 21:20:31.322293	2017-02-05 21:20:31.322293
3028	Podlehnik	172	199	2017-02-05 21:20:31.327625	2017-02-05 21:20:31.327625
3029	Polzela	173	199	2017-02-05 21:20:31.33353	2017-02-05 21:20:31.33353
3030	Prebold	174	199	2017-02-05 21:20:31.339122	2017-02-05 21:20:31.339122
3031	Prevalje	175	199	2017-02-05 21:20:31.343391	2017-02-05 21:20:31.343391
3032	Razkrižje	176	199	2017-02-05 21:20:31.348353	2017-02-05 21:20:31.348353
3033	Ribnica na Pohorju	177	199	2017-02-05 21:20:31.355147	2017-02-05 21:20:31.355147
3034	Selnica ob Dravi	178	199	2017-02-05 21:20:31.361843	2017-02-05 21:20:31.361843
3035	Sodražica	179	199	2017-02-05 21:20:31.367804	2017-02-05 21:20:31.367804
3036	Solčava	180	199	2017-02-05 21:20:31.373122	2017-02-05 21:20:31.373122
3037	Sveta Ana	181	199	2017-02-05 21:20:31.379614	2017-02-05 21:20:31.379614
3038	Sveta Andraž v Slovenskih Goricah	182	199	2017-02-05 21:20:31.384988	2017-02-05 21:20:31.384988
3039	Šempeter-Vrtojba	183	199	2017-02-05 21:20:31.390301	2017-02-05 21:20:31.390301
3040	Tabor	184	199	2017-02-05 21:20:31.397166	2017-02-05 21:20:31.397166
3041	Trnovska vas	185	199	2017-02-05 21:20:31.405084	2017-02-05 21:20:31.405084
3042	Trzin	186	199	2017-02-05 21:20:31.411564	2017-02-05 21:20:31.411564
3043	Velika Polana	187	199	2017-02-05 21:20:31.416758	2017-02-05 21:20:31.416758
3044	Veržej	188	199	2017-02-05 21:20:31.422446	2017-02-05 21:20:31.422446
3045	Vransko	189	199	2017-02-05 21:20:31.428996	2017-02-05 21:20:31.428996
3046	Žalec	190	199	2017-02-05 21:20:31.436129	2017-02-05 21:20:31.436129
3047	Žetale	191	199	2017-02-05 21:20:31.443012	2017-02-05 21:20:31.443012
3048	Žirovnica	192	199	2017-02-05 21:20:31.450439	2017-02-05 21:20:31.450439
3049	Žužemberk	193	199	2017-02-05 21:20:31.455676	2017-02-05 21:20:31.455676
3050	Šmartno pri Litiji	194	199	2017-02-05 21:20:31.459742	2017-02-05 21:20:31.459742
3051	Apače	195	199	2017-02-05 21:20:31.464217	2017-02-05 21:20:31.464217
3052	Cirkulane	196	199	2017-02-05 21:20:31.470271	2017-02-05 21:20:31.470271
3053	Kosanjevica na Krki	197	199	2017-02-05 21:20:31.476661	2017-02-05 21:20:31.476661
3054	Makole	198	199	2017-02-05 21:20:31.483238	2017-02-05 21:20:31.483238
3055	Mokronog-Trebelno	199	199	2017-02-05 21:20:31.490221	2017-02-05 21:20:31.490221
3056	Poljčane	200	199	2017-02-05 21:20:31.49666	2017-02-05 21:20:31.49666
3057	Renče-Vogrsko	201	199	2017-02-05 21:20:31.502852	2017-02-05 21:20:31.502852
3058	Središče ob Dravi	202	199	2017-02-05 21:20:31.508929	2017-02-05 21:20:31.508929
3059	Straža	203	199	2017-02-05 21:20:31.514627	2017-02-05 21:20:31.514627
3060	Sveta Trojica v Slovenskih Goricah	204	199	2017-02-05 21:20:31.519112	2017-02-05 21:20:31.519112
3061	Sveti Tomaž	205	199	2017-02-05 21:20:31.52402	2017-02-05 21:20:31.52402
3062	Šmarjeske Topliče	206	199	2017-02-05 21:20:31.529915	2017-02-05 21:20:31.529915
3063	Gorje	207	199	2017-02-05 21:20:31.534187	2017-02-05 21:20:31.534187
3064	Log-Dragomer	208	199	2017-02-05 21:20:31.538426	2017-02-05 21:20:31.538426
3065	Rečica ob Savinji	209	199	2017-02-05 21:20:31.542436	2017-02-05 21:20:31.542436
3066	Sveti Jurij v Slovenskih Goricah	210	199	2017-02-05 21:20:31.546359	2017-02-05 21:20:31.546359
3067	Šentrupert	211	199	2017-02-05 21:20:31.552613	2017-02-05 21:20:31.552613
3068	Banskobystrický kraj	BC	201	2017-02-05 21:20:31.55839	2017-02-05 21:20:31.55839
3069	Bratislavský kraj	BL	201	2017-02-05 21:20:31.562812	2017-02-05 21:20:31.562812
3070	Košický kraj	KI	201	2017-02-05 21:20:31.569377	2017-02-05 21:20:31.569377
3071	Nitriansky kraj	NI	201	2017-02-05 21:20:31.57664	2017-02-05 21:20:31.57664
3072	Prešovský kraj	PV	201	2017-02-05 21:20:31.584236	2017-02-05 21:20:31.584236
3073	Trnavský kraj	TA	201	2017-02-05 21:20:31.591475	2017-02-05 21:20:31.591475
3074	Trenčiansky kraj	TC	201	2017-02-05 21:20:31.598636	2017-02-05 21:20:31.598636
3075	Žilinský kraj	ZI	201	2017-02-05 21:20:31.604867	2017-02-05 21:20:31.604867
3076	Eastern	E	202	2017-02-05 21:20:31.611537	2017-02-05 21:20:31.611537
3077	Northern	N	202	2017-02-05 21:20:31.61878	2017-02-05 21:20:31.61878
3078	Southern (Sierra Leone)	S	202	2017-02-05 21:20:31.623697	2017-02-05 21:20:31.623697
3079	Western Area (Freetown)	W	202	2017-02-05 21:20:31.627898	2017-02-05 21:20:31.627898
3080	Acquaviva	01	203	2017-02-05 21:20:31.635135	2017-02-05 21:20:31.635135
3081	Chiesanuova	02	203	2017-02-05 21:20:31.642583	2017-02-05 21:20:31.642583
3082	Domagnano	03	203	2017-02-05 21:20:31.649929	2017-02-05 21:20:31.649929
3083	Faetano	04	203	2017-02-05 21:20:31.656697	2017-02-05 21:20:31.656697
3084	Fiorentino	05	203	2017-02-05 21:20:31.662722	2017-02-05 21:20:31.662722
3085	Borgo Maggiore	06	203	2017-02-05 21:20:31.66882	2017-02-05 21:20:31.66882
3086	San Marino	07	203	2017-02-05 21:20:31.674889	2017-02-05 21:20:31.674889
3087	Montegiardino	08	203	2017-02-05 21:20:31.682135	2017-02-05 21:20:31.682135
3088	Serravalle	09	203	2017-02-05 21:20:31.690648	2017-02-05 21:20:31.690648
3089	Diourbel	DB	204	2017-02-05 21:20:31.698073	2017-02-05 21:20:31.698073
3090	Dakar	DK	204	2017-02-05 21:20:31.704602	2017-02-05 21:20:31.704602
3091	Fatick	FK	204	2017-02-05 21:20:31.708871	2017-02-05 21:20:31.708871
3092	Kaffrine	KA	204	2017-02-05 21:20:31.713084	2017-02-05 21:20:31.713084
3093	Kolda	KD	204	2017-02-05 21:20:31.717268	2017-02-05 21:20:31.717268
3094	Kédougou	KE	204	2017-02-05 21:20:31.722731	2017-02-05 21:20:31.722731
3095	Kaolack	KL	204	2017-02-05 21:20:31.728716	2017-02-05 21:20:31.728716
3096	Louga	LG	204	2017-02-05 21:20:31.7348	2017-02-05 21:20:31.7348
3097	Matam	MT	204	2017-02-05 21:20:31.739742	2017-02-05 21:20:31.739742
3098	Sédhiou	SE	204	2017-02-05 21:20:31.744215	2017-02-05 21:20:31.744215
3099	Saint-Louis	SL	204	2017-02-05 21:20:31.750152	2017-02-05 21:20:31.750152
3100	Tambacounda	TC	204	2017-02-05 21:20:31.755969	2017-02-05 21:20:31.755969
3101	Thiès	TH	204	2017-02-05 21:20:31.760749	2017-02-05 21:20:31.760749
3102	Ziguinchor	ZG	204	2017-02-05 21:20:31.76498	2017-02-05 21:20:31.76498
3103	Awdal	AW	205	2017-02-05 21:20:31.770713	2017-02-05 21:20:31.770713
3104	Bakool	BK	205	2017-02-05 21:20:31.77839	2017-02-05 21:20:31.77839
3105	Banaadir	BN	205	2017-02-05 21:20:31.785162	2017-02-05 21:20:31.785162
3106	Bari	BR	205	2017-02-05 21:20:31.791848	2017-02-05 21:20:31.791848
3107	Bay	BY	205	2017-02-05 21:20:31.799059	2017-02-05 21:20:31.799059
3108	Galguduud	GA	205	2017-02-05 21:20:31.805919	2017-02-05 21:20:31.805919
3109	Gedo	GE	205	2017-02-05 21:20:31.81252	2017-02-05 21:20:31.81252
3110	Hiirsan	HI	205	2017-02-05 21:20:31.818532	2017-02-05 21:20:31.818532
3111	Jubbada Dhexe	JD	205	2017-02-05 21:20:31.824641	2017-02-05 21:20:31.824641
3112	Jubbada Hoose	JH	205	2017-02-05 21:20:31.831664	2017-02-05 21:20:31.831664
3113	Mudug	MU	205	2017-02-05 21:20:31.8382	2017-02-05 21:20:31.8382
3114	Nugaal	NU	205	2017-02-05 21:20:31.844435	2017-02-05 21:20:31.844435
3115	Saneag	SA	205	2017-02-05 21:20:31.849042	2017-02-05 21:20:31.849042
3116	Shabeellaha Dhexe	SD	205	2017-02-05 21:20:31.853814	2017-02-05 21:20:31.853814
3117	Shabeellaha Hoose	SH	205	2017-02-05 21:20:31.858231	2017-02-05 21:20:31.858231
3118	Sool	SO	205	2017-02-05 21:20:31.862436	2017-02-05 21:20:31.862436
3119	Togdheer	TO	205	2017-02-05 21:20:31.872858	2017-02-05 21:20:31.872858
3120	Woqooyi Galbeed	WO	205	2017-02-05 21:20:31.880748	2017-02-05 21:20:31.880748
3121	Brokopondo	BR	206	2017-02-05 21:20:31.88874	2017-02-05 21:20:31.88874
3122	Commewijne	CM	206	2017-02-05 21:20:31.8941	2017-02-05 21:20:31.8941
3123	Coronie	CR	206	2017-02-05 21:20:31.898982	2017-02-05 21:20:31.898982
3124	Marowijne	MA	206	2017-02-05 21:20:31.905162	2017-02-05 21:20:31.905162
3125	Nickerie	NI	206	2017-02-05 21:20:31.910244	2017-02-05 21:20:31.910244
3126	Paramaribo	PM	206	2017-02-05 21:20:31.916877	2017-02-05 21:20:31.916877
3127	Para	PR	206	2017-02-05 21:20:31.923233	2017-02-05 21:20:31.923233
3128	Saramacca	SA	206	2017-02-05 21:20:31.928	2017-02-05 21:20:31.928
3129	Sipaliwini	SI	206	2017-02-05 21:20:31.933065	2017-02-05 21:20:31.933065
3130	Wanica	WA	206	2017-02-05 21:20:31.937703	2017-02-05 21:20:31.937703
3131	Northern Bahr el-Ghazal	BN	207	2017-02-05 21:20:31.942296	2017-02-05 21:20:31.942296
3132	Western Bahr el-Ghazal	BW	207	2017-02-05 21:20:31.946797	2017-02-05 21:20:31.946797
3133	Central Equatoria	EC	207	2017-02-05 21:20:31.953175	2017-02-05 21:20:31.953175
3134	Eastern Equatoria	EE8	207	2017-02-05 21:20:31.958098	2017-02-05 21:20:31.958098
3135	Western Equatoria	EW	207	2017-02-05 21:20:31.962309	2017-02-05 21:20:31.962309
3136	Jonglei	JG	207	2017-02-05 21:20:31.967201	2017-02-05 21:20:31.967201
3137	Lakes	LK	207	2017-02-05 21:20:31.971782	2017-02-05 21:20:31.971782
3138	Upper Nile	NU	207	2017-02-05 21:20:31.977923	2017-02-05 21:20:31.977923
3139	Unity	UY	207	2017-02-05 21:20:31.985145	2017-02-05 21:20:31.985145
3140	Warrap	WR	207	2017-02-05 21:20:31.989688	2017-02-05 21:20:31.989688
3141	Príncipe	P	208	2017-02-05 21:20:31.995345	2017-02-05 21:20:31.995345
3142	São Tomé	S	208	2017-02-05 21:20:32.002546	2017-02-05 21:20:32.002546
3143	Ahuachapán	AH	209	2017-02-05 21:20:32.011755	2017-02-05 21:20:32.011755
3144	Cabañas	CA	209	2017-02-05 21:20:32.021128	2017-02-05 21:20:32.021128
3145	Chalatenango	CH	209	2017-02-05 21:20:32.029304	2017-02-05 21:20:32.029304
3146	Cuscatlán	CU	209	2017-02-05 21:20:32.036448	2017-02-05 21:20:32.036448
3147	La Libertad	LI	209	2017-02-05 21:20:32.04139	2017-02-05 21:20:32.04139
3148	Morazán	MO	209	2017-02-05 21:20:32.048698	2017-02-05 21:20:32.048698
3149	La Paz	PA	209	2017-02-05 21:20:32.059282	2017-02-05 21:20:32.059282
3150	Santa Ana	SA	209	2017-02-05 21:20:32.076257	2017-02-05 21:20:32.076257
3151	San Miguel	SM	209	2017-02-05 21:20:32.085933	2017-02-05 21:20:32.085933
3152	Sonsonate	SO	209	2017-02-05 21:20:32.09341	2017-02-05 21:20:32.09341
3153	San Salvador	SS	209	2017-02-05 21:20:32.101201	2017-02-05 21:20:32.101201
3154	San Vicente	SV	209	2017-02-05 21:20:32.108765	2017-02-05 21:20:32.108765
3155	La Unión	UN	209	2017-02-05 21:20:32.116243	2017-02-05 21:20:32.116243
3156	Usulután	US	209	2017-02-05 21:20:32.121491	2017-02-05 21:20:32.121491
3157	Dimashq	DI	211	2017-02-05 21:20:32.127538	2017-02-05 21:20:32.127538
3158	Dar'a	DR	211	2017-02-05 21:20:32.13422	2017-02-05 21:20:32.13422
3159	Dayr az Zawr	DY	211	2017-02-05 21:20:32.140411	2017-02-05 21:20:32.140411
3160	Al Hasakah	HA	211	2017-02-05 21:20:32.145465	2017-02-05 21:20:32.145465
3161	Homs	HI	211	2017-02-05 21:20:32.152126	2017-02-05 21:20:32.152126
3162	Halab	HL	211	2017-02-05 21:20:32.160007	2017-02-05 21:20:32.160007
3163	Hamah	HM	211	2017-02-05 21:20:32.167997	2017-02-05 21:20:32.167997
3164	Idlib	ID	211	2017-02-05 21:20:32.175628	2017-02-05 21:20:32.175628
3165	Al Ladhiqiyah	LA	211	2017-02-05 21:20:32.183509	2017-02-05 21:20:32.183509
3166	Al Qunaytirah	QU	211	2017-02-05 21:20:32.190358	2017-02-05 21:20:32.190358
3167	Ar Raqqah	RA	211	2017-02-05 21:20:32.197758	2017-02-05 21:20:32.197758
3168	Rif Dimashq	RD	211	2017-02-05 21:20:32.204923	2017-02-05 21:20:32.204923
3169	As Suwayda'	SU	211	2017-02-05 21:20:32.211817	2017-02-05 21:20:32.211817
3170	Tartus	TA	211	2017-02-05 21:20:32.21778	2017-02-05 21:20:32.21778
3171	Hhohho	HH	212	2017-02-05 21:20:32.224328	2017-02-05 21:20:32.224328
3172	Lubombo	LU	212	2017-02-05 21:20:32.230564	2017-02-05 21:20:32.230564
3173	Manzini	MA	212	2017-02-05 21:20:32.237323	2017-02-05 21:20:32.237323
3174	Shiselweni	SH	212	2017-02-05 21:20:32.2441	2017-02-05 21:20:32.2441
3175	Al Baṭḩah	BA	214	2017-02-05 21:20:32.252543	2017-02-05 21:20:32.252543
3176	Baḩr al Ghazāl	BG	214	2017-02-05 21:20:32.260352	2017-02-05 21:20:32.260352
3177	Būrkū	BO	214	2017-02-05 21:20:32.268427	2017-02-05 21:20:32.268427
3178	Shārī Bāqirmī	CB	214	2017-02-05 21:20:32.276812	2017-02-05 21:20:32.276812
3179	Innīdī	EN	214	2017-02-05 21:20:32.284259	2017-02-05 21:20:32.284259
3180	Qīrā	GR	214	2017-02-05 21:20:32.290275	2017-02-05 21:20:32.290275
3181	Ḥajjar Lamīs	HL	214	2017-02-05 21:20:32.295167	2017-02-05 21:20:32.295167
3182	Kānim	KA	214	2017-02-05 21:20:32.299661	2017-02-05 21:20:32.299661
3183	Al Buḩayrah	LC	214	2017-02-05 21:20:32.305271	2017-02-05 21:20:32.305271
3184	Lūqūn al Gharbī	LO	214	2017-02-05 21:20:32.310289	2017-02-05 21:20:32.310289
3185	Lūqūn ash Sharqī	LR	214	2017-02-05 21:20:32.315207	2017-02-05 21:20:32.315207
3186	Māndūl	MA	214	2017-02-05 21:20:32.319855	2017-02-05 21:20:32.319855
3187	Shārī al Awsaṭ	MC	214	2017-02-05 21:20:32.325764	2017-02-05 21:20:32.325764
3188	Māyū Kībbī ash Sharqī	ME	214	2017-02-05 21:20:32.331202	2017-02-05 21:20:32.331202
3189	Māyū Kībbī al Gharbī	MO	214	2017-02-05 21:20:32.336271	2017-02-05 21:20:32.336271
3190	Madīnat Injamīnā	ND	214	2017-02-05 21:20:32.340631	2017-02-05 21:20:32.340631
3191	Waddāy	OD	214	2017-02-05 21:20:32.345253	2017-02-05 21:20:32.345253
3192	Salāmāt	SA	214	2017-02-05 21:20:32.351264	2017-02-05 21:20:32.351264
3193	Sīlā	SI	214	2017-02-05 21:20:32.358043	2017-02-05 21:20:32.358043
3194	Tānjilī	TA	214	2017-02-05 21:20:32.363154	2017-02-05 21:20:32.363154
3195	Tibastī	TI	214	2017-02-05 21:20:32.370043	2017-02-05 21:20:32.370043
3196	Wādī Fīrā	WF	214	2017-02-05 21:20:32.375349	2017-02-05 21:20:32.375349
3197	Région du Centre	C	216	2017-02-05 21:20:32.381	2017-02-05 21:20:32.381
3198	Région de la Kara	K	216	2017-02-05 21:20:32.385372	2017-02-05 21:20:32.385372
3199	Région Maritime	M	216	2017-02-05 21:20:32.390074	2017-02-05 21:20:32.390074
3200	Région des Plateaux	P	216	2017-02-05 21:20:32.397047	2017-02-05 21:20:32.397047
3201	Région des Savannes	S	216	2017-02-05 21:20:32.40342	2017-02-05 21:20:32.40342
3202	Krung Thep Maha Nakhon Bangkok	10	217	2017-02-05 21:20:32.40952	2017-02-05 21:20:32.40952
3203	Samut Prakan	11	217	2017-02-05 21:20:32.416194	2017-02-05 21:20:32.416194
3204	Nonthaburi	12	217	2017-02-05 21:20:32.421071	2017-02-05 21:20:32.421071
3205	Pathum Thani	13	217	2017-02-05 21:20:32.425965	2017-02-05 21:20:32.425965
3206	Phra Nakhon Si Ayutthaya	14	217	2017-02-05 21:20:32.430479	2017-02-05 21:20:32.430479
3207	Ang Thong	15	217	2017-02-05 21:20:32.436322	2017-02-05 21:20:32.436322
3208	Lop Buri	16	217	2017-02-05 21:20:32.440813	2017-02-05 21:20:32.440813
3209	Sing Buri	17	217	2017-02-05 21:20:32.445128	2017-02-05 21:20:32.445128
3210	Chai Nat	18	217	2017-02-05 21:20:32.450532	2017-02-05 21:20:32.450532
3211	Saraburi	19	217	2017-02-05 21:20:32.455405	2017-02-05 21:20:32.455405
3212	Chon Buri	20	217	2017-02-05 21:20:32.459934	2017-02-05 21:20:32.459934
3213	Rayong	21	217	2017-02-05 21:20:32.46431	2017-02-05 21:20:32.46431
3214	Chanthaburi	22	217	2017-02-05 21:20:32.468732	2017-02-05 21:20:32.468732
3215	Trat	23	217	2017-02-05 21:20:32.473171	2017-02-05 21:20:32.473171
3216	Chachoengsao	24	217	2017-02-05 21:20:32.478129	2017-02-05 21:20:32.478129
3217	Prachin Buri	25	217	2017-02-05 21:20:32.483137	2017-02-05 21:20:32.483137
3218	Nakhon Nayok	26	217	2017-02-05 21:20:32.487395	2017-02-05 21:20:32.487395
3219	Sa Kaeo	27	217	2017-02-05 21:20:32.491675	2017-02-05 21:20:32.491675
3220	Nakhon Ratchasima	30	217	2017-02-05 21:20:32.496059	2017-02-05 21:20:32.496059
3221	Buri Ram	31	217	2017-02-05 21:20:32.500498	2017-02-05 21:20:32.500498
3222	Surin	32	217	2017-02-05 21:20:32.504725	2017-02-05 21:20:32.504725
3223	Si Sa Ket	33	217	2017-02-05 21:20:32.50932	2017-02-05 21:20:32.50932
3224	Ubon Ratchathani	34	217	2017-02-05 21:20:32.515723	2017-02-05 21:20:32.515723
3225	Yasothon	35	217	2017-02-05 21:20:32.521819	2017-02-05 21:20:32.521819
3226	Chaiyaphum	36	217	2017-02-05 21:20:32.528347	2017-02-05 21:20:32.528347
3227	Amnat Charoen	37	217	2017-02-05 21:20:32.535093	2017-02-05 21:20:32.535093
3228	Nong Bua Lam Phu	39	217	2017-02-05 21:20:32.540629	2017-02-05 21:20:32.540629
3229	Khon Kaen	40	217	2017-02-05 21:20:32.54584	2017-02-05 21:20:32.54584
3230	Udon Thani	41	217	2017-02-05 21:20:32.55066	2017-02-05 21:20:32.55066
3231	Loei	42	217	2017-02-05 21:20:32.555456	2017-02-05 21:20:32.555456
3232	Nong Khai	43	217	2017-02-05 21:20:32.560709	2017-02-05 21:20:32.560709
3233	Maha Sarakham	44	217	2017-02-05 21:20:32.565394	2017-02-05 21:20:32.565394
3234	Roi Et	45	217	2017-02-05 21:20:32.571237	2017-02-05 21:20:32.571237
3235	Kalasin	46	217	2017-02-05 21:20:32.57565	2017-02-05 21:20:32.57565
3236	Sakon Nakhon	47	217	2017-02-05 21:20:32.581388	2017-02-05 21:20:32.581388
3237	Nakhon Phanom	48	217	2017-02-05 21:20:32.585648	2017-02-05 21:20:32.585648
3238	Mukdahan	49	217	2017-02-05 21:20:32.589842	2017-02-05 21:20:32.589842
3239	Chiang Mai	50	217	2017-02-05 21:20:32.593848	2017-02-05 21:20:32.593848
3240	Lamphun	51	217	2017-02-05 21:20:32.598023	2017-02-05 21:20:32.598023
3241	Lampang	52	217	2017-02-05 21:20:32.603463	2017-02-05 21:20:32.603463
3242	Uttaradit	53	217	2017-02-05 21:20:32.609213	2017-02-05 21:20:32.609213
3243	Phrae	54	217	2017-02-05 21:20:32.61326	2017-02-05 21:20:32.61326
3244	Nan	55	217	2017-02-05 21:20:32.617364	2017-02-05 21:20:32.617364
3245	Phayao	56	217	2017-02-05 21:20:32.622718	2017-02-05 21:20:32.622718
3246	Chiang Rai	57	217	2017-02-05 21:20:32.628718	2017-02-05 21:20:32.628718
3247	Mae Hong Son	58	217	2017-02-05 21:20:32.635382	2017-02-05 21:20:32.635382
3248	Nakhon Sawan	60	217	2017-02-05 21:20:32.641065	2017-02-05 21:20:32.641065
3249	Uthai Thani	61	217	2017-02-05 21:20:32.646556	2017-02-05 21:20:32.646556
3250	Kamphaeng Phet	62	217	2017-02-05 21:20:32.650907	2017-02-05 21:20:32.650907
3251	Tak	63	217	2017-02-05 21:20:32.656024	2017-02-05 21:20:32.656024
3252	Sukhothai	64	217	2017-02-05 21:20:32.662205	2017-02-05 21:20:32.662205
3253	Phitsanulok	65	217	2017-02-05 21:20:32.66809	2017-02-05 21:20:32.66809
3254	Phichit	66	217	2017-02-05 21:20:32.672639	2017-02-05 21:20:32.672639
3255	Phetchabun	67	217	2017-02-05 21:20:32.677411	2017-02-05 21:20:32.677411
3256	Ratchaburi	70	217	2017-02-05 21:20:32.682433	2017-02-05 21:20:32.682433
3257	Kanchanaburi	71	217	2017-02-05 21:20:32.687694	2017-02-05 21:20:32.687694
3258	Suphan Buri	72	217	2017-02-05 21:20:32.692592	2017-02-05 21:20:32.692592
3259	Nakhon Pathom	73	217	2017-02-05 21:20:32.697928	2017-02-05 21:20:32.697928
3260	Samut Sakhon	74	217	2017-02-05 21:20:32.702974	2017-02-05 21:20:32.702974
3261	Samut Songkhram	75	217	2017-02-05 21:20:32.707287	2017-02-05 21:20:32.707287
3262	Phetchaburi	76	217	2017-02-05 21:20:32.711675	2017-02-05 21:20:32.711675
3263	Prachuap Khiri Khan	77	217	2017-02-05 21:20:32.7165	2017-02-05 21:20:32.7165
3264	Nakhon Si Thammarat	80	217	2017-02-05 21:20:32.722743	2017-02-05 21:20:32.722743
3265	Krabi	81	217	2017-02-05 21:20:32.72957	2017-02-05 21:20:32.72957
3266	Phangnga	82	217	2017-02-05 21:20:32.734766	2017-02-05 21:20:32.734766
3267	Phuket	83	217	2017-02-05 21:20:32.739518	2017-02-05 21:20:32.739518
3268	Surat Thani	84	217	2017-02-05 21:20:32.7454	2017-02-05 21:20:32.7454
3269	Ranong	85	217	2017-02-05 21:20:32.750871	2017-02-05 21:20:32.750871
3270	Chumphon	86	217	2017-02-05 21:20:32.756124	2017-02-05 21:20:32.756124
3271	Songkhla	90	217	2017-02-05 21:20:32.760823	2017-02-05 21:20:32.760823
3272	Satun	91	217	2017-02-05 21:20:32.765902	2017-02-05 21:20:32.765902
3273	Trang	92	217	2017-02-05 21:20:32.770795	2017-02-05 21:20:32.770795
3274	Phatthalung	93	217	2017-02-05 21:20:32.775737	2017-02-05 21:20:32.775737
3275	Pattani	94	217	2017-02-05 21:20:32.780445	2017-02-05 21:20:32.780445
3276	Yala	95	217	2017-02-05 21:20:32.784765	2017-02-05 21:20:32.784765
3277	Narathiwat	96	217	2017-02-05 21:20:32.789115	2017-02-05 21:20:32.789115
3278	Phatthaya	S	217	2017-02-05 21:20:32.793845	2017-02-05 21:20:32.793845
3279	Gorno-Badakhshan	GB	218	2017-02-05 21:20:32.798731	2017-02-05 21:20:32.798731
3280	Khatlon	KT	218	2017-02-05 21:20:32.803304	2017-02-05 21:20:32.803304
3281	Sughd	SU	218	2017-02-05 21:20:32.807366	2017-02-05 21:20:32.807366
3282	Aileu	AL	220	2017-02-05 21:20:32.81176	2017-02-05 21:20:32.81176
3283	Ainaro	AN	220	2017-02-05 21:20:32.815935	2017-02-05 21:20:32.815935
3284	Baucau	BA	220	2017-02-05 21:20:32.819973	2017-02-05 21:20:32.819973
3285	Bobonaro	BO	220	2017-02-05 21:20:32.823975	2017-02-05 21:20:32.823975
3286	Cova Lima	CO	220	2017-02-05 21:20:32.827977	2017-02-05 21:20:32.827977
3287	Díli	DI	220	2017-02-05 21:20:32.832097	2017-02-05 21:20:32.832097
3288	Ermera	ER	220	2017-02-05 21:20:32.836172	2017-02-05 21:20:32.836172
3289	Lautem	LA	220	2017-02-05 21:20:32.840434	2017-02-05 21:20:32.840434
3290	Liquiça	LI	220	2017-02-05 21:20:32.844433	2017-02-05 21:20:32.844433
3291	Manufahi	MF	220	2017-02-05 21:20:32.848519	2017-02-05 21:20:32.848519
3292	Manatuto	MT	220	2017-02-05 21:20:32.852562	2017-02-05 21:20:32.852562
3293	Oecussi	OE	220	2017-02-05 21:20:32.856696	2017-02-05 21:20:32.856696
3294	Viqueque	VI	220	2017-02-05 21:20:32.860701	2017-02-05 21:20:32.860701
3295	Ahal	A	221	2017-02-05 21:20:32.865027	2017-02-05 21:20:32.865027
3296	Balkan	B	221	2017-02-05 21:20:32.869	2017-02-05 21:20:32.869
3297	Daşoguz	D	221	2017-02-05 21:20:32.872975	2017-02-05 21:20:32.872975
3298	Lebap	L	221	2017-02-05 21:20:32.878159	2017-02-05 21:20:32.878159
3299	Mary	M	221	2017-02-05 21:20:32.88233	2017-02-05 21:20:32.88233
3300	Aşgabat	S	221	2017-02-05 21:20:32.886491	2017-02-05 21:20:32.886491
3301	Tunis	11	222	2017-02-05 21:20:32.890995	2017-02-05 21:20:32.890995
3302	Ariana	12	222	2017-02-05 21:20:32.904768	2017-02-05 21:20:32.904768
3303	Ben Arous	13	222	2017-02-05 21:20:32.909948	2017-02-05 21:20:32.909948
3304	La Manouba	14	222	2017-02-05 21:20:32.914482	2017-02-05 21:20:32.914482
3305	Nabeul	21	222	2017-02-05 21:20:32.919545	2017-02-05 21:20:32.919545
3306	Zaghouan	22	222	2017-02-05 21:20:32.925067	2017-02-05 21:20:32.925067
3307	Bizerte	23	222	2017-02-05 21:20:32.92989	2017-02-05 21:20:32.92989
3308	Béja	31	222	2017-02-05 21:20:32.93621	2017-02-05 21:20:32.93621
3309	Jendouba	32	222	2017-02-05 21:20:32.942296	2017-02-05 21:20:32.942296
3310	Le Kef	33	222	2017-02-05 21:20:32.946936	2017-02-05 21:20:32.946936
3311	Siliana	34	222	2017-02-05 21:20:32.951483	2017-02-05 21:20:32.951483
3312	Kairouan	41	222	2017-02-05 21:20:32.957476	2017-02-05 21:20:32.957476
3313	Kasserine	42	222	2017-02-05 21:20:32.963747	2017-02-05 21:20:32.963747
3314	Sidi Bouzid	43	222	2017-02-05 21:20:32.971339	2017-02-05 21:20:32.971339
3315	Sousse	51	222	2017-02-05 21:20:32.975745	2017-02-05 21:20:32.975745
3316	Monastir	52	222	2017-02-05 21:20:32.981858	2017-02-05 21:20:32.981858
3317	Mahdia	53	222	2017-02-05 21:20:32.988356	2017-02-05 21:20:32.988356
3318	Sfax	61	222	2017-02-05 21:20:32.992885	2017-02-05 21:20:32.992885
3319	Gafsa	71	222	2017-02-05 21:20:32.997949	2017-02-05 21:20:32.997949
3320	Tozeur	72	222	2017-02-05 21:20:33.002281	2017-02-05 21:20:33.002281
3321	Kebili	73	222	2017-02-05 21:20:33.007151	2017-02-05 21:20:33.007151
3322	Gabès	81	222	2017-02-05 21:20:33.012134	2017-02-05 21:20:33.012134
3323	Medenine	82	222	2017-02-05 21:20:33.017844	2017-02-05 21:20:33.017844
3324	Tataouine	83	222	2017-02-05 21:20:33.023904	2017-02-05 21:20:33.023904
3325	'Eua	01	223	2017-02-05 21:20:33.029802	2017-02-05 21:20:33.029802
3326	Ha'apai	02	223	2017-02-05 21:20:33.03659	2017-02-05 21:20:33.03659
3327	Niuas	03	223	2017-02-05 21:20:33.044015	2017-02-05 21:20:33.044015
3328	Tongatapu	04	223	2017-02-05 21:20:33.051517	2017-02-05 21:20:33.051517
3329	Vava'u	05	223	2017-02-05 21:20:33.056831	2017-02-05 21:20:33.056831
3330	Adana	01	224	2017-02-05 21:20:33.062336	2017-02-05 21:20:33.062336
3331	Adıyaman	02	224	2017-02-05 21:20:33.066744	2017-02-05 21:20:33.066744
3332	Afyonkarahisar	03	224	2017-02-05 21:20:33.071334	2017-02-05 21:20:33.071334
3333	Ağrı	04	224	2017-02-05 21:20:33.075757	2017-02-05 21:20:33.075757
3334	Amasya	05	224	2017-02-05 21:20:33.08017	2017-02-05 21:20:33.08017
3335	Ankara	06	224	2017-02-05 21:20:33.086782	2017-02-05 21:20:33.086782
3336	Antalya	07	224	2017-02-05 21:20:33.093299	2017-02-05 21:20:33.093299
3337	Artvin	08	224	2017-02-05 21:20:33.098644	2017-02-05 21:20:33.098644
3338	Aydın	09	224	2017-02-05 21:20:33.104275	2017-02-05 21:20:33.104275
3339	Balıkesir	10	224	2017-02-05 21:20:33.109738	2017-02-05 21:20:33.109738
3340	Bilecik	11	224	2017-02-05 21:20:33.114777	2017-02-05 21:20:33.114777
3341	Bingöl	12	224	2017-02-05 21:20:33.118988	2017-02-05 21:20:33.118988
3342	Bitlis	13	224	2017-02-05 21:20:33.123585	2017-02-05 21:20:33.123585
3343	Bolu	14	224	2017-02-05 21:20:33.129102	2017-02-05 21:20:33.129102
3344	Burdur	15	224	2017-02-05 21:20:33.133091	2017-02-05 21:20:33.133091
3345	Bursa	16	224	2017-02-05 21:20:33.139035	2017-02-05 21:20:33.139035
3346	Çanakkale	17	224	2017-02-05 21:20:33.143023	2017-02-05 21:20:33.143023
3347	Çankırı	18	224	2017-02-05 21:20:33.146915	2017-02-05 21:20:33.146915
3348	Çorum	19	224	2017-02-05 21:20:33.151193	2017-02-05 21:20:33.151193
3349	Denizli	20	224	2017-02-05 21:20:33.155472	2017-02-05 21:20:33.155472
3350	Diyarbakır	21	224	2017-02-05 21:20:33.159535	2017-02-05 21:20:33.159535
3351	Edirne	22	224	2017-02-05 21:20:33.164243	2017-02-05 21:20:33.164243
3352	Elazığ	23	224	2017-02-05 21:20:33.168645	2017-02-05 21:20:33.168645
3353	Erzincan	24	224	2017-02-05 21:20:33.173048	2017-02-05 21:20:33.173048
3354	Erzurum	25	224	2017-02-05 21:20:33.177307	2017-02-05 21:20:33.177307
3355	Eskişehir	26	224	2017-02-05 21:20:33.182234	2017-02-05 21:20:33.182234
3356	Gaziantep	27	224	2017-02-05 21:20:33.186981	2017-02-05 21:20:33.186981
3357	Giresun	28	224	2017-02-05 21:20:33.191425	2017-02-05 21:20:33.191425
3358	Gümüşhane	29	224	2017-02-05 21:20:33.196189	2017-02-05 21:20:33.196189
3359	Hakkâri	30	224	2017-02-05 21:20:33.200662	2017-02-05 21:20:33.200662
3360	Hatay	31	224	2017-02-05 21:20:33.204907	2017-02-05 21:20:33.204907
3361	Isparta	32	224	2017-02-05 21:20:33.20906	2017-02-05 21:20:33.20906
3362	Mersin	33	224	2017-02-05 21:20:33.213148	2017-02-05 21:20:33.213148
3363	İstanbul	34	224	2017-02-05 21:20:33.217283	2017-02-05 21:20:33.217283
3364	İzmir	35	224	2017-02-05 21:20:33.221713	2017-02-05 21:20:33.221713
3365	Kars	36	224	2017-02-05 21:20:33.226041	2017-02-05 21:20:33.226041
3366	Kastamonu	37	224	2017-02-05 21:20:33.230186	2017-02-05 21:20:33.230186
3367	Kayseri	38	224	2017-02-05 21:20:33.236418	2017-02-05 21:20:33.236418
3368	Kırklareli	39	224	2017-02-05 21:20:33.241591	2017-02-05 21:20:33.241591
3369	Kırşehir	40	224	2017-02-05 21:20:33.245672	2017-02-05 21:20:33.245672
3370	Kocaeli	41	224	2017-02-05 21:20:33.250922	2017-02-05 21:20:33.250922
3371	Konya	42	224	2017-02-05 21:20:33.256398	2017-02-05 21:20:33.256398
3372	Kütahya	43	224	2017-02-05 21:20:33.261153	2017-02-05 21:20:33.261153
3373	Malatya	44	224	2017-02-05 21:20:33.265456	2017-02-05 21:20:33.265456
3374	Manisa	45	224	2017-02-05 21:20:33.27009	2017-02-05 21:20:33.27009
3375	Kahramanmaraş	46	224	2017-02-05 21:20:33.275053	2017-02-05 21:20:33.275053
3376	Mardin	47	224	2017-02-05 21:20:33.280993	2017-02-05 21:20:33.280993
3377	Muğla	48	224	2017-02-05 21:20:33.287992	2017-02-05 21:20:33.287992
3378	Muş	49	224	2017-02-05 21:20:33.294284	2017-02-05 21:20:33.294284
3379	Nevşehir	50	224	2017-02-05 21:20:33.300867	2017-02-05 21:20:33.300867
3380	Niğde	51	224	2017-02-05 21:20:33.308149	2017-02-05 21:20:33.308149
3381	Ordu	52	224	2017-02-05 21:20:33.315789	2017-02-05 21:20:33.315789
3382	Rize	53	224	2017-02-05 21:20:33.323704	2017-02-05 21:20:33.323704
3383	Sakarya	54	224	2017-02-05 21:20:33.33151	2017-02-05 21:20:33.33151
3384	Samsun	55	224	2017-02-05 21:20:33.337664	2017-02-05 21:20:33.337664
3385	Siirt	56	224	2017-02-05 21:20:33.343095	2017-02-05 21:20:33.343095
3386	Sinop	57	224	2017-02-05 21:20:33.348181	2017-02-05 21:20:33.348181
3387	Sivas	58	224	2017-02-05 21:20:33.353039	2017-02-05 21:20:33.353039
3388	Tekirdağ	59	224	2017-02-05 21:20:33.358198	2017-02-05 21:20:33.358198
3389	Tokat	60	224	2017-02-05 21:20:33.364023	2017-02-05 21:20:33.364023
3390	Trabzon	61	224	2017-02-05 21:20:33.370492	2017-02-05 21:20:33.370492
3391	Tunceli	62	224	2017-02-05 21:20:33.376886	2017-02-05 21:20:33.376886
3392	Şanlıurfa	63	224	2017-02-05 21:20:33.383968	2017-02-05 21:20:33.383968
3393	Uşak	64	224	2017-02-05 21:20:33.391765	2017-02-05 21:20:33.391765
3394	Van	65	224	2017-02-05 21:20:33.398795	2017-02-05 21:20:33.398795
3395	Yozgat	66	224	2017-02-05 21:20:33.40719	2017-02-05 21:20:33.40719
3396	Zonguldak	67	224	2017-02-05 21:20:33.415124	2017-02-05 21:20:33.415124
3397	Aksaray	68	224	2017-02-05 21:20:33.422128	2017-02-05 21:20:33.422128
3398	Bayburt	69	224	2017-02-05 21:20:33.42916	2017-02-05 21:20:33.42916
3399	Karaman	70	224	2017-02-05 21:20:33.437514	2017-02-05 21:20:33.437514
3400	Kırıkkale	71	224	2017-02-05 21:20:33.444101	2017-02-05 21:20:33.444101
3401	Batman	72	224	2017-02-05 21:20:33.450896	2017-02-05 21:20:33.450896
3402	Şırnak	73	224	2017-02-05 21:20:33.458047	2017-02-05 21:20:33.458047
3403	Bartın	74	224	2017-02-05 21:20:33.464244	2017-02-05 21:20:33.464244
3404	Ardahan	75	224	2017-02-05 21:20:33.468564	2017-02-05 21:20:33.468564
3405	Iğdır	76	224	2017-02-05 21:20:33.472777	2017-02-05 21:20:33.472777
3406	Yalova	77	224	2017-02-05 21:20:33.479617	2017-02-05 21:20:33.479617
3407	Karabük	78	224	2017-02-05 21:20:33.487436	2017-02-05 21:20:33.487436
3408	Kilis	79	224	2017-02-05 21:20:33.494594	2017-02-05 21:20:33.494594
3409	Osmaniye	80	224	2017-02-05 21:20:33.503901	2017-02-05 21:20:33.503901
3410	Düzce	81	224	2017-02-05 21:20:33.509267	2017-02-05 21:20:33.509267
3411	Arima	ARI	225	2017-02-05 21:20:33.514117	2017-02-05 21:20:33.514117
3412	Chaguanas	CHA	225	2017-02-05 21:20:33.519104	2017-02-05 21:20:33.519104
3413	Couva-Tabaquite-Talparo	CTT	225	2017-02-05 21:20:33.523424	2017-02-05 21:20:33.523424
3414	Diego Martin	DMN	225	2017-02-05 21:20:33.52842	2017-02-05 21:20:33.52842
3415	Eastern Tobago	ETO	225	2017-02-05 21:20:33.533768	2017-02-05 21:20:33.533768
3416	Penal-Debe	PED	225	2017-02-05 21:20:33.539636	2017-02-05 21:20:33.539636
3417	Port of Spain	POS	225	2017-02-05 21:20:33.546711	2017-02-05 21:20:33.546711
3418	Princes Town	PRT	225	2017-02-05 21:20:33.55369	2017-02-05 21:20:33.55369
3419	Point Fortin	PTF	225	2017-02-05 21:20:33.560423	2017-02-05 21:20:33.560423
3420	Rio Claro-Mayaro	RCM	225	2017-02-05 21:20:33.565228	2017-02-05 21:20:33.565228
3421	San Fernando	SFO	225	2017-02-05 21:20:33.569924	2017-02-05 21:20:33.569924
3422	Sangre Grande	SGE	225	2017-02-05 21:20:33.575623	2017-02-05 21:20:33.575623
3423	Siparia	SIP	225	2017-02-05 21:20:33.581187	2017-02-05 21:20:33.581187
3424	San Juan-Laventille	SJL	225	2017-02-05 21:20:33.58789	2017-02-05 21:20:33.58789
3425	Tunapuna-Piarco	TUP	225	2017-02-05 21:20:33.594656	2017-02-05 21:20:33.594656
3426	Western Tobago	WTO	225	2017-02-05 21:20:33.601666	2017-02-05 21:20:33.601666
3427	Funafuti	FUN	226	2017-02-05 21:20:33.60781	2017-02-05 21:20:33.60781
3428	Niutao	NIT	226	2017-02-05 21:20:33.611918	2017-02-05 21:20:33.611918
3429	Nukufetau	NKF	226	2017-02-05 21:20:33.616019	2017-02-05 21:20:33.616019
3430	Nukulaelae	NKL	226	2017-02-05 21:20:33.620151	2017-02-05 21:20:33.620151
3431	Nanumea	NMA	226	2017-02-05 21:20:33.624736	2017-02-05 21:20:33.624736
3432	Nanumanga	NMG	226	2017-02-05 21:20:33.630817	2017-02-05 21:20:33.630817
3433	Nui	NUI	226	2017-02-05 21:20:33.636065	2017-02-05 21:20:33.636065
3434	Vaitupu	VAI	226	2017-02-05 21:20:33.640905	2017-02-05 21:20:33.640905
3435	Changhua	CHA	227	2017-02-05 21:20:33.646906	2017-02-05 21:20:33.646906
3436	Chiay City	CYI	227	2017-02-05 21:20:33.653561	2017-02-05 21:20:33.653561
3437	Chiayi	CYQ	227	2017-02-05 21:20:33.659827	2017-02-05 21:20:33.659827
3438	Hsinchu	HSQ	227	2017-02-05 21:20:33.667244	2017-02-05 21:20:33.667244
3439	Hsinchui City	HSZ	227	2017-02-05 21:20:33.673404	2017-02-05 21:20:33.673404
3440	Hualien	HUA	227	2017-02-05 21:20:33.680264	2017-02-05 21:20:33.680264
3441	Ilan	ILA	227	2017-02-05 21:20:33.687197	2017-02-05 21:20:33.687197
3442	Keelung City	KEE	227	2017-02-05 21:20:33.694233	2017-02-05 21:20:33.694233
3443	Kaohsiung City	KHH	227	2017-02-05 21:20:33.701333	2017-02-05 21:20:33.701333
3444	Kaohsiung	KHQ	227	2017-02-05 21:20:33.708609	2017-02-05 21:20:33.708609
3445	Miaoli	MIA	227	2017-02-05 21:20:33.716074	2017-02-05 21:20:33.716074
3446	Nantou	NAN	227	2017-02-05 21:20:33.723174	2017-02-05 21:20:33.723174
3447	Penghu	PEN	227	2017-02-05 21:20:33.730084	2017-02-05 21:20:33.730084
3448	Pingtung	PIF	227	2017-02-05 21:20:33.737278	2017-02-05 21:20:33.737278
3449	Taoyuan	TAO	227	2017-02-05 21:20:33.742238	2017-02-05 21:20:33.742238
3450	Tainan City	TNN	227	2017-02-05 21:20:33.746648	2017-02-05 21:20:33.746648
3451	Tainan	TNQ	227	2017-02-05 21:20:33.750871	2017-02-05 21:20:33.750871
3452	Taipei City	TPE	227	2017-02-05 21:20:33.755082	2017-02-05 21:20:33.755082
3453	Taipei	TPQ	227	2017-02-05 21:20:33.760281	2017-02-05 21:20:33.760281
3454	Taitung	TTT	227	2017-02-05 21:20:33.764548	2017-02-05 21:20:33.764548
3455	Taichung City	TXG	227	2017-02-05 21:20:33.768975	2017-02-05 21:20:33.768975
3456	Taichung	TXQ	227	2017-02-05 21:20:33.773729	2017-02-05 21:20:33.773729
3457	Yunlin	YUN	227	2017-02-05 21:20:33.779067	2017-02-05 21:20:33.779067
3458	Arusha	01	228	2017-02-05 21:20:33.783754	2017-02-05 21:20:33.783754
3459	Dar-es-Salaam	02	228	2017-02-05 21:20:33.787797	2017-02-05 21:20:33.787797
3460	Dodoma	03	228	2017-02-05 21:20:33.792139	2017-02-05 21:20:33.792139
3461	Iringa	04	228	2017-02-05 21:20:33.796325	2017-02-05 21:20:33.796325
3462	Kagera	05	228	2017-02-05 21:20:33.802041	2017-02-05 21:20:33.802041
3463	Kaskazini Pemba	06	228	2017-02-05 21:20:33.807955	2017-02-05 21:20:33.807955
3464	Kaskazini Unguja	07	228	2017-02-05 21:20:33.812098	2017-02-05 21:20:33.812098
3465	Kigoma	08	228	2017-02-05 21:20:33.816252	2017-02-05 21:20:33.816252
3466	Kilimanjaro	09	228	2017-02-05 21:20:33.820943	2017-02-05 21:20:33.820943
3467	Kusini Pemba	10	228	2017-02-05 21:20:33.82604	2017-02-05 21:20:33.82604
3468	Kusini Unguja	11	228	2017-02-05 21:20:33.830597	2017-02-05 21:20:33.830597
3469	Lindi	12	228	2017-02-05 21:20:33.83541	2017-02-05 21:20:33.83541
3470	Mara	13	228	2017-02-05 21:20:33.839772	2017-02-05 21:20:33.839772
3471	Mbeya	14	228	2017-02-05 21:20:33.844372	2017-02-05 21:20:33.844372
3472	Mjini Magharibi	15	228	2017-02-05 21:20:33.849274	2017-02-05 21:20:33.849274
3473	Morogoro	16	228	2017-02-05 21:20:33.854641	2017-02-05 21:20:33.854641
3474	Mtwara	17	228	2017-02-05 21:20:33.859584	2017-02-05 21:20:33.859584
3475	Mwanza	18	228	2017-02-05 21:20:33.86568	2017-02-05 21:20:33.86568
3476	Pwani	19	228	2017-02-05 21:20:33.871419	2017-02-05 21:20:33.871419
3477	Rukwa	20	228	2017-02-05 21:20:33.877766	2017-02-05 21:20:33.877766
3478	Ruvuma	21	228	2017-02-05 21:20:33.883531	2017-02-05 21:20:33.883531
3479	Shinyanga	22	228	2017-02-05 21:20:33.887961	2017-02-05 21:20:33.887961
3480	Singida	23	228	2017-02-05 21:20:33.892125	2017-02-05 21:20:33.892125
3481	Tabora	24	228	2017-02-05 21:20:33.896451	2017-02-05 21:20:33.896451
3482	Tanga	25	228	2017-02-05 21:20:33.900719	2017-02-05 21:20:33.900719
3483	Manyara	26	228	2017-02-05 21:20:33.904741	2017-02-05 21:20:33.904741
3484	Vinnyts'ka Oblast'	05	229	2017-02-05 21:20:33.90943	2017-02-05 21:20:33.90943
3485	Volyns'ka Oblast'	07	229	2017-02-05 21:20:33.913725	2017-02-05 21:20:33.913725
3486	Luhans'ka Oblast'	09	229	2017-02-05 21:20:33.919199	2017-02-05 21:20:33.919199
3487	Dnipropetrovs'ka Oblast'	12	229	2017-02-05 21:20:33.924157	2017-02-05 21:20:33.924157
3488	Donets'ka Oblast'	14	229	2017-02-05 21:20:33.928349	2017-02-05 21:20:33.928349
3489	Zhytomyrs'ka Oblast'	18	229	2017-02-05 21:20:33.933579	2017-02-05 21:20:33.933579
3490	Zakarpats'ka Oblast'	21	229	2017-02-05 21:20:33.939688	2017-02-05 21:20:33.939688
3491	Zaporiz'ka Oblast'	23	229	2017-02-05 21:20:33.944914	2017-02-05 21:20:33.944914
3492	Ivano-Frankivs'ka Oblast'	26	229	2017-02-05 21:20:33.949422	2017-02-05 21:20:33.949422
3493	Kyïvs'ka mis'ka rada	30	229	2017-02-05 21:20:33.954287	2017-02-05 21:20:33.954287
3494	Kyïvs'ka Oblast'	32	229	2017-02-05 21:20:33.958508	2017-02-05 21:20:33.958508
3495	Kirovohrads'ka Oblast'	35	229	2017-02-05 21:20:33.962787	2017-02-05 21:20:33.962787
3496	Sevastopol	40	229	2017-02-05 21:20:33.967146	2017-02-05 21:20:33.967146
3497	Respublika Krym	43	229	2017-02-05 21:20:33.971525	2017-02-05 21:20:33.971525
3498	L'vivs'ka Oblast'	46	229	2017-02-05 21:20:33.976233	2017-02-05 21:20:33.976233
3499	Mykolaïvs'ka Oblast'	48	229	2017-02-05 21:20:33.980739	2017-02-05 21:20:33.980739
3500	Odes'ka Oblast'	51	229	2017-02-05 21:20:33.985299	2017-02-05 21:20:33.985299
3501	Poltavs'ka Oblast'	53	229	2017-02-05 21:20:33.989602	2017-02-05 21:20:33.989602
3502	Rivnens'ka Oblast'	56	229	2017-02-05 21:20:33.994226	2017-02-05 21:20:33.994226
3503	Sums 'ka Oblast'	59	229	2017-02-05 21:20:33.998779	2017-02-05 21:20:33.998779
3504	Ternopil's'ka Oblast'	61	229	2017-02-05 21:20:34.003148	2017-02-05 21:20:34.003148
3505	Kharkivs'ka Oblast'	63	229	2017-02-05 21:20:34.007345	2017-02-05 21:20:34.007345
3506	Khersons'ka Oblast'	65	229	2017-02-05 21:20:34.011501	2017-02-05 21:20:34.011501
3507	Khmel'nyts'ka Oblast'	68	229	2017-02-05 21:20:34.015771	2017-02-05 21:20:34.015771
3508	Cherkas'ka Oblast'	71	229	2017-02-05 21:20:34.020061	2017-02-05 21:20:34.020061
3509	Chernihivs'ka Oblast'	74	229	2017-02-05 21:20:34.024275	2017-02-05 21:20:34.024275
3510	Chernivets'ka Oblast'	77	229	2017-02-05 21:20:34.029002	2017-02-05 21:20:34.029002
3511	Central	C	230	2017-02-05 21:20:34.035633	2017-02-05 21:20:34.035633
3512	Eastern	E	230	2017-02-05 21:20:34.040107	2017-02-05 21:20:34.040107
3513	Northern	N	230	2017-02-05 21:20:34.045807	2017-02-05 21:20:34.045807
3514	Western	W	230	2017-02-05 21:20:34.052039	2017-02-05 21:20:34.052039
3515	Johnston Atoll	67	231	2017-02-05 21:20:34.059317	2017-02-05 21:20:34.059317
3516	Midway Islands	71	231	2017-02-05 21:20:34.066093	2017-02-05 21:20:34.066093
3517	Navassa Island	76	231	2017-02-05 21:20:34.072788	2017-02-05 21:20:34.072788
3518	Wake Island	79	231	2017-02-05 21:20:34.07965	2017-02-05 21:20:34.07965
3519	Baker Island	81	231	2017-02-05 21:20:34.086463	2017-02-05 21:20:34.086463
3520	Howland Island	84	231	2017-02-05 21:20:34.093285	2017-02-05 21:20:34.093285
3521	Jarvis Island	86	231	2017-02-05 21:20:34.099951	2017-02-05 21:20:34.099951
3522	Kingman Reef	89	231	2017-02-05 21:20:34.105564	2017-02-05 21:20:34.105564
3523	Palmyra Atoll	95	231	2017-02-05 21:20:34.11031	2017-02-05 21:20:34.11031
3524	Alaska	AK	232	2017-02-05 21:20:34.115379	2017-02-05 21:20:34.115379
3525	Alabama	AL	232	2017-02-05 21:20:34.120292	2017-02-05 21:20:34.120292
3526	Arkansas	AR	232	2017-02-05 21:20:34.126929	2017-02-05 21:20:34.126929
3527	American Samoa	AS	232	2017-02-05 21:20:34.132806	2017-02-05 21:20:34.132806
3528	Arizona	AZ	232	2017-02-05 21:20:34.136861	2017-02-05 21:20:34.136861
3529	California	CA	232	2017-02-05 21:20:34.141506	2017-02-05 21:20:34.141506
3530	Colorado	CO	232	2017-02-05 21:20:34.14569	2017-02-05 21:20:34.14569
3531	Connecticut	CT	232	2017-02-05 21:20:34.150017	2017-02-05 21:20:34.150017
3532	District of Columbia	DC	232	2017-02-05 21:20:34.155255	2017-02-05 21:20:34.155255
3533	Delaware	DE	232	2017-02-05 21:20:34.160192	2017-02-05 21:20:34.160192
3534	Florida	FL	232	2017-02-05 21:20:34.164348	2017-02-05 21:20:34.164348
3535	Georgia	GA	232	2017-02-05 21:20:34.168727	2017-02-05 21:20:34.168727
3536	Guam	GU	232	2017-02-05 21:20:34.173376	2017-02-05 21:20:34.173376
3537	Hawaii	HI	232	2017-02-05 21:20:34.178201	2017-02-05 21:20:34.178201
3538	Iowa	IA	232	2017-02-05 21:20:34.182566	2017-02-05 21:20:34.182566
3539	Idaho	ID	232	2017-02-05 21:20:34.186596	2017-02-05 21:20:34.186596
3540	Illinois	IL	232	2017-02-05 21:20:34.191359	2017-02-05 21:20:34.191359
3541	Indiana	IN	232	2017-02-05 21:20:34.196302	2017-02-05 21:20:34.196302
3542	Kansas	KS	232	2017-02-05 21:20:34.200393	2017-02-05 21:20:34.200393
3543	Kentucky	KY	232	2017-02-05 21:20:34.205661	2017-02-05 21:20:34.205661
3544	Louisiana	LA	232	2017-02-05 21:20:34.211085	2017-02-05 21:20:34.211085
3545	Massachusetts	MA	232	2017-02-05 21:20:34.216347	2017-02-05 21:20:34.216347
3546	Maryland	MD	232	2017-02-05 21:20:34.221015	2017-02-05 21:20:34.221015
3547	Maine	ME	232	2017-02-05 21:20:34.225927	2017-02-05 21:20:34.225927
3548	Michigan	MI	232	2017-02-05 21:20:34.230323	2017-02-05 21:20:34.230323
3549	Minnesota	MN	232	2017-02-05 21:20:34.23515	2017-02-05 21:20:34.23515
3550	Missouri	MO	232	2017-02-05 21:20:34.240153	2017-02-05 21:20:34.240153
3551	Northern Mariana Islands	MP	232	2017-02-05 21:20:34.244436	2017-02-05 21:20:34.244436
3552	Mississippi	MS	232	2017-02-05 21:20:34.249102	2017-02-05 21:20:34.249102
3553	Montana	MT	232	2017-02-05 21:20:34.254633	2017-02-05 21:20:34.254633
3554	North Carolina	NC	232	2017-02-05 21:20:34.259033	2017-02-05 21:20:34.259033
3555	North Dakota	ND	232	2017-02-05 21:20:34.263286	2017-02-05 21:20:34.263286
3556	Nebraska	NE	232	2017-02-05 21:20:34.267525	2017-02-05 21:20:34.267525
3557	New Hampshire	NH	232	2017-02-05 21:20:34.271826	2017-02-05 21:20:34.271826
3558	New Jersey	NJ	232	2017-02-05 21:20:34.276055	2017-02-05 21:20:34.276055
3559	New Mexico	NM	232	2017-02-05 21:20:34.280411	2017-02-05 21:20:34.280411
3560	Nevada	NV	232	2017-02-05 21:20:34.284731	2017-02-05 21:20:34.284731
3561	New York	NY	232	2017-02-05 21:20:34.2889	2017-02-05 21:20:34.2889
3562	Ohio	OH	232	2017-02-05 21:20:34.293313	2017-02-05 21:20:34.293313
3563	Oklahoma	OK	232	2017-02-05 21:20:34.297607	2017-02-05 21:20:34.297607
3564	Oregon	OR	232	2017-02-05 21:20:34.301853	2017-02-05 21:20:34.301853
3565	Pennsylvania	PA	232	2017-02-05 21:20:34.307283	2017-02-05 21:20:34.307283
3566	Puerto Rico	PR	232	2017-02-05 21:20:34.312142	2017-02-05 21:20:34.312142
3567	Rhode Island	RI	232	2017-02-05 21:20:34.317003	2017-02-05 21:20:34.317003
3568	South Carolina	SC	232	2017-02-05 21:20:34.321837	2017-02-05 21:20:34.321837
3569	South Dakota	SD	232	2017-02-05 21:20:34.326964	2017-02-05 21:20:34.326964
3570	Tennessee	TN	232	2017-02-05 21:20:34.331101	2017-02-05 21:20:34.331101
3571	Texas	TX	232	2017-02-05 21:20:34.335076	2017-02-05 21:20:34.335076
3572	United States Minor Outlying Islands	UM	232	2017-02-05 21:20:34.339674	2017-02-05 21:20:34.339674
3573	Utah	UT	232	2017-02-05 21:20:34.34394	2017-02-05 21:20:34.34394
3574	Virginia	VA	232	2017-02-05 21:20:34.348231	2017-02-05 21:20:34.348231
3575	Virgin Islands	VI	232	2017-02-05 21:20:34.352373	2017-02-05 21:20:34.352373
3576	Vermont	VT	232	2017-02-05 21:20:34.356607	2017-02-05 21:20:34.356607
3577	Washington	WA	232	2017-02-05 21:20:34.360703	2017-02-05 21:20:34.360703
3578	Wisconsin	WI	232	2017-02-05 21:20:34.364632	2017-02-05 21:20:34.364632
3579	West Virginia	WV	232	2017-02-05 21:20:34.368641	2017-02-05 21:20:34.368641
3580	Wyoming	WY	232	2017-02-05 21:20:34.372542	2017-02-05 21:20:34.372542
3581	Armed Forces Americas (except Canada)	AA	232	2017-02-05 21:20:34.376506	2017-02-05 21:20:34.376506
3582	Armed Forces Africa, Canada, Europe, Middle East	AE	232	2017-02-05 21:20:34.380417	2017-02-05 21:20:34.380417
3583	Armed Forces Pacific	AP	232	2017-02-05 21:20:34.384379	2017-02-05 21:20:34.384379
3584	Artigas	AR	233	2017-02-05 21:20:34.388667	2017-02-05 21:20:34.388667
3585	Canelones	CA	233	2017-02-05 21:20:34.392693	2017-02-05 21:20:34.392693
3586	Cerro Largo	CL	233	2017-02-05 21:20:34.396664	2017-02-05 21:20:34.396664
3587	Colonia	CO	233	2017-02-05 21:20:34.400567	2017-02-05 21:20:34.400567
3588	Durazno	DU	233	2017-02-05 21:20:34.404624	2017-02-05 21:20:34.404624
3589	Florida	FD	233	2017-02-05 21:20:34.40872	2017-02-05 21:20:34.40872
3590	Flores	FS	233	2017-02-05 21:20:34.414009	2017-02-05 21:20:34.414009
3591	Lavalleja	LA	233	2017-02-05 21:20:34.418086	2017-02-05 21:20:34.418086
3592	Maldonado	MA	233	2017-02-05 21:20:34.422052	2017-02-05 21:20:34.422052
3593	Montevideo	MO	233	2017-02-05 21:20:34.425939	2017-02-05 21:20:34.425939
3594	Paysandú	PA	233	2017-02-05 21:20:34.429915	2017-02-05 21:20:34.429915
3595	Río Negro	RN	233	2017-02-05 21:20:34.435835	2017-02-05 21:20:34.435835
3596	Rocha	RO	233	2017-02-05 21:20:34.440179	2017-02-05 21:20:34.440179
3597	Rivera	RV	233	2017-02-05 21:20:34.444096	2017-02-05 21:20:34.444096
3598	Salto	SA	233	2017-02-05 21:20:34.449187	2017-02-05 21:20:34.449187
3599	San José	SJ	233	2017-02-05 21:20:34.453671	2017-02-05 21:20:34.453671
3600	Soriano	SO	233	2017-02-05 21:20:34.459491	2017-02-05 21:20:34.459491
3601	Tacuarembó	TA	233	2017-02-05 21:20:34.465584	2017-02-05 21:20:34.465584
3602	Treinta y Tres	TT	233	2017-02-05 21:20:34.471704	2017-02-05 21:20:34.471704
3603	Andijon	AN	234	2017-02-05 21:20:34.477942	2017-02-05 21:20:34.477942
3604	Buxoro	BU	234	2017-02-05 21:20:34.483913	2017-02-05 21:20:34.483913
3605	Farg'ona	FA	234	2017-02-05 21:20:34.489906	2017-02-05 21:20:34.489906
3606	Jizzax	JI	234	2017-02-05 21:20:34.495906	2017-02-05 21:20:34.495906
3607	Namangan	NG	234	2017-02-05 21:20:34.501914	2017-02-05 21:20:34.501914
3608	Navoiy	NW	234	2017-02-05 21:20:34.508821	2017-02-05 21:20:34.508821
3609	Qashqadaryo	QA	234	2017-02-05 21:20:34.514199	2017-02-05 21:20:34.514199
3610	Qoraqalpog'iston Respublikasi	QR	234	2017-02-05 21:20:34.521108	2017-02-05 21:20:34.521108
3611	Samarqand	SA	234	2017-02-05 21:20:34.526331	2017-02-05 21:20:34.526331
3612	Sirdaryo	SI	234	2017-02-05 21:20:34.530784	2017-02-05 21:20:34.530784
3613	Surxondaryo	SU	234	2017-02-05 21:20:34.535185	2017-02-05 21:20:34.535185
3614	Toshkent	TK	234	2017-02-05 21:20:34.540336	2017-02-05 21:20:34.540336
3615	Toshkent	TO	234	2017-02-05 21:20:34.544699	2017-02-05 21:20:34.544699
3616	Xorazm	XO	234	2017-02-05 21:20:34.550421	2017-02-05 21:20:34.550421
3617	Charlotte	01	236	2017-02-05 21:20:34.557949	2017-02-05 21:20:34.557949
3618	Saint Andrew	02	236	2017-02-05 21:20:34.562952	2017-02-05 21:20:34.562952
3619	Saint David	03	236	2017-02-05 21:20:34.567473	2017-02-05 21:20:34.567473
3620	Saint George	04	236	2017-02-05 21:20:34.572859	2017-02-05 21:20:34.572859
3621	Saint Patrick	05	236	2017-02-05 21:20:34.577605	2017-02-05 21:20:34.577605
3622	Grenadines	06	236	2017-02-05 21:20:34.582364	2017-02-05 21:20:34.582364
3623	Distrito Federal	A	237	2017-02-05 21:20:34.587185	2017-02-05 21:20:34.587185
3624	Anzoátegui	B	237	2017-02-05 21:20:34.591616	2017-02-05 21:20:34.591616
3625	Apure	C	237	2017-02-05 21:20:34.595984	2017-02-05 21:20:34.595984
3626	Aragua	D	237	2017-02-05 21:20:34.600236	2017-02-05 21:20:34.600236
3627	Barinas	E	237	2017-02-05 21:20:34.604712	2017-02-05 21:20:34.604712
3628	Bolívar	F	237	2017-02-05 21:20:34.609785	2017-02-05 21:20:34.609785
3629	Carabobo	G	237	2017-02-05 21:20:34.615763	2017-02-05 21:20:34.615763
3630	Cojedes	H	237	2017-02-05 21:20:34.622033	2017-02-05 21:20:34.622033
3631	Falcón	I	237	2017-02-05 21:20:34.62722	2017-02-05 21:20:34.62722
3632	Guárico	J	237	2017-02-05 21:20:34.632078	2017-02-05 21:20:34.632078
3633	Lara	K	237	2017-02-05 21:20:34.638945	2017-02-05 21:20:34.638945
3634	Mérida	L	237	2017-02-05 21:20:34.643772	2017-02-05 21:20:34.643772
3635	Miranda	M	237	2017-02-05 21:20:34.64759	2017-02-05 21:20:34.64759
3636	Monagas	N	237	2017-02-05 21:20:34.651631	2017-02-05 21:20:34.651631
3637	Nueva Esparta	O	237	2017-02-05 21:20:34.655721	2017-02-05 21:20:34.655721
3638	Portuguesa	P	237	2017-02-05 21:20:34.659835	2017-02-05 21:20:34.659835
3639	Sucre	R	237	2017-02-05 21:20:34.664022	2017-02-05 21:20:34.664022
3640	Táchira	S	237	2017-02-05 21:20:34.668104	2017-02-05 21:20:34.668104
3641	Trujillo	T	237	2017-02-05 21:20:34.67228	2017-02-05 21:20:34.67228
3642	Yaracuy	U	237	2017-02-05 21:20:34.676299	2017-02-05 21:20:34.676299
3643	Zulia	V	237	2017-02-05 21:20:34.680835	2017-02-05 21:20:34.680835
3644	Dependencias Federales	W	237	2017-02-05 21:20:34.685391	2017-02-05 21:20:34.685391
3645	Vargas	X	237	2017-02-05 21:20:34.689551	2017-02-05 21:20:34.689551
3646	Delta Amacuro	Y	237	2017-02-05 21:20:34.69434	2017-02-05 21:20:34.69434
3647	Amazonas	Z	237	2017-02-05 21:20:34.699023	2017-02-05 21:20:34.699023
3648	Lai Châu	01	240	2017-02-05 21:20:34.703545	2017-02-05 21:20:34.703545
3649	Lào Cai	02	240	2017-02-05 21:20:34.707859	2017-02-05 21:20:34.707859
3650	Hà Giang	03	240	2017-02-05 21:20:34.72193	2017-02-05 21:20:34.72193
3651	Cao Bằng	04	240	2017-02-05 21:20:34.726329	2017-02-05 21:20:34.726329
3652	Sơn La	05	240	2017-02-05 21:20:34.730792	2017-02-05 21:20:34.730792
3653	Yên Bái	06	240	2017-02-05 21:20:34.735322	2017-02-05 21:20:34.735322
3654	Tuyên Quang	07	240	2017-02-05 21:20:34.740537	2017-02-05 21:20:34.740537
3655	Lạng Sơn	09	240	2017-02-05 21:20:34.745342	2017-02-05 21:20:34.745342
3656	Quảng Ninh	13	240	2017-02-05 21:20:34.749955	2017-02-05 21:20:34.749955
3657	Hoà Bình	14	240	2017-02-05 21:20:34.75542	2017-02-05 21:20:34.75542
3658	Hà Tây	15	240	2017-02-05 21:20:34.760679	2017-02-05 21:20:34.760679
3659	Ninh Bình	18	240	2017-02-05 21:20:34.766297	2017-02-05 21:20:34.766297
3660	Thái Bình	20	240	2017-02-05 21:20:34.77169	2017-02-05 21:20:34.77169
3661	Thanh Hóa	21	240	2017-02-05 21:20:34.776745	2017-02-05 21:20:34.776745
3662	Nghệ An	22	240	2017-02-05 21:20:34.782632	2017-02-05 21:20:34.782632
3663	Hà Tỉnh	23	240	2017-02-05 21:20:34.788101	2017-02-05 21:20:34.788101
3664	Quảng Bình	24	240	2017-02-05 21:20:34.793258	2017-02-05 21:20:34.793258
3665	Quảng Trị	25	240	2017-02-05 21:20:34.798648	2017-02-05 21:20:34.798648
3666	Thừa Thiên-Huế	26	240	2017-02-05 21:20:34.804084	2017-02-05 21:20:34.804084
3667	Quảng Nam	27	240	2017-02-05 21:20:34.808978	2017-02-05 21:20:34.808978
3668	Kon Tum	28	240	2017-02-05 21:20:34.814716	2017-02-05 21:20:34.814716
3669	Quảng Ngãi	29	240	2017-02-05 21:20:34.818935	2017-02-05 21:20:34.818935
3670	Gia Lai	30	240	2017-02-05 21:20:34.823668	2017-02-05 21:20:34.823668
3671	Bình Định	31	240	2017-02-05 21:20:34.827807	2017-02-05 21:20:34.827807
3672	Phú Yên	32	240	2017-02-05 21:20:34.831781	2017-02-05 21:20:34.831781
3673	Đắc Lắk	33	240	2017-02-05 21:20:34.835888	2017-02-05 21:20:34.835888
3674	Khánh Hòa	34	240	2017-02-05 21:20:34.84069	2017-02-05 21:20:34.84069
3675	Lâm Đồng	35	240	2017-02-05 21:20:34.845339	2017-02-05 21:20:34.845339
3676	Ninh Thuận	36	240	2017-02-05 21:20:34.849708	2017-02-05 21:20:34.849708
3677	Tây Ninh	37	240	2017-02-05 21:20:34.853968	2017-02-05 21:20:34.853968
3678	Đồng Nai	39	240	2017-02-05 21:20:34.858983	2017-02-05 21:20:34.858983
3679	Bình Thuận	40	240	2017-02-05 21:20:34.863445	2017-02-05 21:20:34.863445
3680	Long An	41	240	2017-02-05 21:20:34.869134	2017-02-05 21:20:34.869134
3681	Bà Rịa-Vũng Tàu	43	240	2017-02-05 21:20:34.873719	2017-02-05 21:20:34.873719
3682	An Giang	44	240	2017-02-05 21:20:34.879345	2017-02-05 21:20:34.879345
3683	Đồng Tháp	45	240	2017-02-05 21:20:34.884578	2017-02-05 21:20:34.884578
3684	Tiền Giang	46	240	2017-02-05 21:20:34.888845	2017-02-05 21:20:34.888845
3685	Kiên Giang	47	240	2017-02-05 21:20:34.893142	2017-02-05 21:20:34.893142
3686	Vĩnh Long	49	240	2017-02-05 21:20:34.897753	2017-02-05 21:20:34.897753
3687	Bến Tre	50	240	2017-02-05 21:20:34.902339	2017-02-05 21:20:34.902339
3688	Trà Vinh	51	240	2017-02-05 21:20:34.907902	2017-02-05 21:20:34.907902
3689	Sóc Trăng	52	240	2017-02-05 21:20:34.912351	2017-02-05 21:20:34.912351
3690	Bắc Kạn	53	240	2017-02-05 21:20:34.916793	2017-02-05 21:20:34.916793
3691	Bắc Giang	54	240	2017-02-05 21:20:34.921847	2017-02-05 21:20:34.921847
3692	Bạc Liêu	55	240	2017-02-05 21:20:34.927504	2017-02-05 21:20:34.927504
3693	Bắc Ninh	56	240	2017-02-05 21:20:34.932511	2017-02-05 21:20:34.932511
3694	Bình Dương	57	240	2017-02-05 21:20:34.936723	2017-02-05 21:20:34.936723
3695	Bình Phước	58	240	2017-02-05 21:20:34.941873	2017-02-05 21:20:34.941873
3696	Cà Mau	59	240	2017-02-05 21:20:34.94789	2017-02-05 21:20:34.94789
3697	Hải Duong	61	240	2017-02-05 21:20:34.954483	2017-02-05 21:20:34.954483
3698	Hà Nam	63	240	2017-02-05 21:20:34.959517	2017-02-05 21:20:34.959517
3699	Hưng Yên	66	240	2017-02-05 21:20:34.964855	2017-02-05 21:20:34.964855
3700	Nam Định	67	240	2017-02-05 21:20:34.970225	2017-02-05 21:20:34.970225
3701	Phú Thọ	68	240	2017-02-05 21:20:34.974917	2017-02-05 21:20:34.974917
3702	Thái Nguyên	69	240	2017-02-05 21:20:34.981128	2017-02-05 21:20:34.981128
3703	Vĩnh Phúc	70	240	2017-02-05 21:20:34.987484	2017-02-05 21:20:34.987484
3704	Điện Biên	71	240	2017-02-05 21:20:34.993099	2017-02-05 21:20:34.993099
3705	Đắk Nông	72	240	2017-02-05 21:20:34.999254	2017-02-05 21:20:34.999254
3706	Hậu Giang	73	240	2017-02-05 21:20:35.005556	2017-02-05 21:20:35.005556
3707	Cần Thơ	CT	240	2017-02-05 21:20:35.011484	2017-02-05 21:20:35.011484
3708	Đà Nẵng	DN	240	2017-02-05 21:20:35.018063	2017-02-05 21:20:35.018063
3709	Hà Nội	HN	240	2017-02-05 21:20:35.023037	2017-02-05 21:20:35.023037
3710	Hải Phòng	HP	240	2017-02-05 21:20:35.029583	2017-02-05 21:20:35.029583
3711	Hồ Chí Minh [Sài Gòn]	SG	240	2017-02-05 21:20:35.035012	2017-02-05 21:20:35.035012
3712	Malampa	MAP	241	2017-02-05 21:20:35.041073	2017-02-05 21:20:35.041073
3713	Pénama	PAM	241	2017-02-05 21:20:35.048063	2017-02-05 21:20:35.048063
3714	Sanma	SAM	241	2017-02-05 21:20:35.054929	2017-02-05 21:20:35.054929
3715	Shéfa	SEE	241	2017-02-05 21:20:35.060855	2017-02-05 21:20:35.060855
3716	Taféa	TAE	241	2017-02-05 21:20:35.065222	2017-02-05 21:20:35.065222
3717	Torba	TOB	241	2017-02-05 21:20:35.071516	2017-02-05 21:20:35.071516
3718	A'ana	AA	243	2017-02-05 21:20:35.078098	2017-02-05 21:20:35.078098
3719	Aiga-i-le-Tai	AL	243	2017-02-05 21:20:35.082814	2017-02-05 21:20:35.082814
3720	Atua	AT	243	2017-02-05 21:20:35.087369	2017-02-05 21:20:35.087369
3721	Fa'asaleleaga	FA	243	2017-02-05 21:20:35.092037	2017-02-05 21:20:35.092037
3722	Gaga'emauga	GE	243	2017-02-05 21:20:35.096867	2017-02-05 21:20:35.096867
3723	Gagaifomauga	GI	243	2017-02-05 21:20:35.101668	2017-02-05 21:20:35.101668
3724	Palauli	PA	243	2017-02-05 21:20:35.107099	2017-02-05 21:20:35.107099
3725	Satupa'itea	SA	243	2017-02-05 21:20:35.111314	2017-02-05 21:20:35.111314
3726	Tuamasaga	TU	243	2017-02-05 21:20:35.115548	2017-02-05 21:20:35.115548
3727	Va'a-o-Fonoti	VF	243	2017-02-05 21:20:35.119599	2017-02-05 21:20:35.119599
3728	Vaisigano	VS	243	2017-02-05 21:20:35.124093	2017-02-05 21:20:35.124093
3729	Abyān	AB	244	2017-02-05 21:20:35.129838	2017-02-05 21:20:35.129838
3730	'Adan	AD	244	2017-02-05 21:20:35.135389	2017-02-05 21:20:35.135389
3731	'Amrān	AM	244	2017-02-05 21:20:35.140654	2017-02-05 21:20:35.140654
3732	Al Bayḑā'	BA	244	2017-02-05 21:20:35.145121	2017-02-05 21:20:35.145121
3733	Aḑ Ḑāli‘	DA	244	2017-02-05 21:20:35.149911	2017-02-05 21:20:35.149911
3734	Dhamār	DH	244	2017-02-05 21:20:35.154286	2017-02-05 21:20:35.154286
3735	Ḩaḑramawt	HD	244	2017-02-05 21:20:35.159461	2017-02-05 21:20:35.159461
3736	Ḩajjah	HJ	244	2017-02-05 21:20:35.164943	2017-02-05 21:20:35.164943
3737	Ibb	IB	244	2017-02-05 21:20:35.17046	2017-02-05 21:20:35.17046
3738	Al Jawf	JA	244	2017-02-05 21:20:35.175252	2017-02-05 21:20:35.175252
3739	Laḩij	LA	244	2017-02-05 21:20:35.179762	2017-02-05 21:20:35.179762
3740	Ma'rib	MA	244	2017-02-05 21:20:35.184147	2017-02-05 21:20:35.184147
3741	Al Mahrah	MR	244	2017-02-05 21:20:35.188533	2017-02-05 21:20:35.188533
3742	Al Ḩudaydah	MU	244	2017-02-05 21:20:35.192776	2017-02-05 21:20:35.192776
3743	Al Maḩwīt	MW	244	2017-02-05 21:20:35.196964	2017-02-05 21:20:35.196964
3744	Raymah	RA	244	2017-02-05 21:20:35.201165	2017-02-05 21:20:35.201165
3745	Şa'dah	SD	244	2017-02-05 21:20:35.205439	2017-02-05 21:20:35.205439
3746	Shabwah	SH	244	2017-02-05 21:20:35.209905	2017-02-05 21:20:35.209905
3747	Şan'ā'	SN	244	2017-02-05 21:20:35.214314	2017-02-05 21:20:35.214314
3748	Tā'izz	TA	244	2017-02-05 21:20:35.218669	2017-02-05 21:20:35.218669
3749	Eastern Cape	EC	246	2017-02-05 21:20:35.223728	2017-02-05 21:20:35.223728
3750	Free State	FS	246	2017-02-05 21:20:35.227931	2017-02-05 21:20:35.227931
3751	Gauteng	GP	246	2017-02-05 21:20:35.232302	2017-02-05 21:20:35.232302
3752	Limpopo	LP	246	2017-02-05 21:20:35.237762	2017-02-05 21:20:35.237762
3753	Mpumalanga	MP	246	2017-02-05 21:20:35.244042	2017-02-05 21:20:35.244042
3754	Northern Cape	NC	246	2017-02-05 21:20:35.248428	2017-02-05 21:20:35.248428
3755	North-West (South Africa)	NW	246	2017-02-05 21:20:35.25372	2017-02-05 21:20:35.25372
3756	Western Cape	WC	246	2017-02-05 21:20:35.257933	2017-02-05 21:20:35.257933
3757	Kwazulu-Natal	ZN	246	2017-02-05 21:20:35.262149	2017-02-05 21:20:35.262149
3758	Western	01	247	2017-02-05 21:20:35.266638	2017-02-05 21:20:35.266638
3759	Central	02	247	2017-02-05 21:20:35.270715	2017-02-05 21:20:35.270715
3760	Eastern	03	247	2017-02-05 21:20:35.274808	2017-02-05 21:20:35.274808
3761	Luapula	04	247	2017-02-05 21:20:35.279164	2017-02-05 21:20:35.279164
3762	Northern	05	247	2017-02-05 21:20:35.283695	2017-02-05 21:20:35.283695
3763	North-Western	06	247	2017-02-05 21:20:35.289948	2017-02-05 21:20:35.289948
3764	Southern (Zambia)	07	247	2017-02-05 21:20:35.295786	2017-02-05 21:20:35.295786
3765	Copperbelt	08	247	2017-02-05 21:20:35.300481	2017-02-05 21:20:35.300481
3766	Lusaka	09	247	2017-02-05 21:20:35.305129	2017-02-05 21:20:35.305129
3767	Bulawayo	BU	248	2017-02-05 21:20:35.31001	2017-02-05 21:20:35.31001
3768	Harare	HA	248	2017-02-05 21:20:35.314655	2017-02-05 21:20:35.314655
3769	Manicaland	MA	248	2017-02-05 21:20:35.318784	2017-02-05 21:20:35.318784
3770	Mashonaland Central	MC	248	2017-02-05 21:20:35.322996	2017-02-05 21:20:35.322996
3771	Mashonaland East	ME	248	2017-02-05 21:20:35.327285	2017-02-05 21:20:35.327285
3772	Midlands	MI	248	2017-02-05 21:20:35.331665	2017-02-05 21:20:35.331665
3773	Matabeleland North	MN	248	2017-02-05 21:20:35.335751	2017-02-05 21:20:35.335751
3774	Matabeleland South	MS	248	2017-02-05 21:20:35.340372	2017-02-05 21:20:35.340372
3775	Masvingo	MV	248	2017-02-05 21:20:35.344751	2017-02-05 21:20:35.344751
3776	Mashonaland West	MW	248	2017-02-05 21:20:35.349143	2017-02-05 21:20:35.349143
\.


--
-- Name: spree_states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_states_id_seq', 3776, true);


--
-- Data for Name: spree_stock_items; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_stock_items (id, stock_location_id, variant_id, count_on_hand, created_at, updated_at, backorderable, deleted_at) FROM stdin;
19	1	19	10	2017-02-05 21:21:10.742193	2017-02-05 21:21:11.239291	t	\N
3	1	3	10	2017-02-05 21:21:06.152897	2017-02-05 21:21:11.282321	t	\N
4	1	4	10	2017-02-05 21:21:06.27313	2017-02-05 21:21:11.410582	t	\N
8	1	8	10	2017-02-05 21:21:07.203753	2017-02-05 21:21:11.450002	t	\N
5	1	5	10	2017-02-05 21:21:06.750571	2017-02-05 21:21:11.491191	t	\N
9	1	9	10	2017-02-05 21:21:07.314628	2017-02-05 21:21:11.53917	t	\N
6	1	6	10	2017-02-05 21:21:06.948264	2017-02-05 21:21:11.61754	t	\N
10	1	10	10	2017-02-05 21:21:10.097776	2017-02-05 21:21:11.66195	t	\N
11	1	11	10	2017-02-05 21:21:10.174623	2017-02-05 21:21:11.705574	t	\N
12	1	12	10	2017-02-05 21:21:10.239559	2017-02-05 21:21:11.754239	t	\N
13	1	13	10	2017-02-05 21:21:10.312869	2017-02-05 21:21:11.79893	t	\N
14	1	14	10	2017-02-05 21:21:10.38371	2017-02-05 21:21:11.844477	t	\N
15	1	15	10	2017-02-05 21:21:10.446625	2017-02-05 21:21:11.892457	t	\N
16	1	16	10	2017-02-05 21:21:10.520624	2017-02-05 21:21:11.935122	t	\N
17	1	17	10	2017-02-05 21:21:10.600652	2017-02-05 21:21:11.975844	t	\N
18	1	18	10	2017-02-05 21:21:10.672247	2017-02-05 21:21:12.027728	t	\N
1	1	1	9	2017-02-05 21:21:05.810067	2017-02-05 21:21:24.678547	t	\N
20	1	20	0	2017-02-06 18:14:58.889222	2017-02-06 18:14:58.889222	t	2017-02-06 18:16:54.51499
2	1	2	10	2017-02-05 21:21:06.036224	2017-02-06 19:02:43.520216	t	\N
21	1	21	0	2017-02-06 19:12:26.413273	2017-02-06 19:12:26.413273	t	2017-02-13 20:02:32.078605
7	1	7	10	2017-02-05 21:21:07.091078	2017-02-05 21:21:11.578094	t	2017-02-13 20:02:36.191307
22	1	22	0	2017-02-16 21:15:20.287644	2017-02-16 21:15:20.287644	t	2017-02-16 21:16:05.305743
23	1	23	0	2017-02-17 12:25:46.791164	2017-02-17 12:25:46.791164	t	2017-02-17 12:39:57.02504
24	1	24	0	2017-02-17 12:55:30.146199	2017-02-17 12:55:30.146199	t	2017-02-17 14:33:27.209375
25	1	25	0	2017-02-17 13:31:08.42182	2017-02-17 13:31:08.42182	t	2017-02-17 14:33:30.701135
26	1	26	0	2017-02-17 15:35:50.921063	2017-02-17 15:35:50.921063	t	2017-02-17 15:38:39.367115
27	1	27	0	2017-02-17 18:29:28.313636	2017-02-17 18:29:28.313636	t	\N
28	1	28	0	2017-02-17 22:24:14.761593	2017-02-17 22:24:14.761593	t	\N
\.


--
-- Name: spree_stock_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_stock_items_id_seq', 28, true);


--
-- Data for Name: spree_stock_locations; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_stock_locations (id, name, created_at, updated_at, "default", address1, address2, city, state_id, state_name, country_id, zipcode, phone, active, backorderable_default, propagate_all_variants, admin_name, "position", restock_inventory, fulfillable, code, check_stock_on_transfer) FROM stdin;
1	default	2017-02-05 21:19:35.889614	2017-02-05 21:19:35.889614	f	\N	\N	\N	\N	\N	\N	\N	\N	t	t	t	\N	0	t	t	\N	t
\.


--
-- Name: spree_stock_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_stock_locations_id_seq', 1, true);


--
-- Data for Name: spree_stock_movements; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_stock_movements (id, stock_item_id, quantity, action, created_at, updated_at, originator_type, originator_id) FROM stdin;
1	19	10	\N	2017-02-05 21:21:11.14398	2017-02-05 21:21:11.14398	\N	\N
2	3	10	\N	2017-02-05 21:21:11.266547	2017-02-05 21:21:11.266547	\N	\N
3	1	10	\N	2017-02-05 21:21:11.307571	2017-02-05 21:21:11.307571	\N	\N
4	2	10	\N	2017-02-05 21:21:11.350225	2017-02-05 21:21:11.350225	\N	\N
5	4	10	\N	2017-02-05 21:21:11.391732	2017-02-05 21:21:11.391732	\N	\N
6	8	10	\N	2017-02-05 21:21:11.434133	2017-02-05 21:21:11.434133	\N	\N
7	5	10	\N	2017-02-05 21:21:11.473653	2017-02-05 21:21:11.473653	\N	\N
8	9	10	\N	2017-02-05 21:21:11.522584	2017-02-05 21:21:11.522584	\N	\N
9	7	10	\N	2017-02-05 21:21:11.56299	2017-02-05 21:21:11.56299	\N	\N
10	6	10	\N	2017-02-05 21:21:11.602067	2017-02-05 21:21:11.602067	\N	\N
11	10	10	\N	2017-02-05 21:21:11.644435	2017-02-05 21:21:11.644435	\N	\N
12	11	10	\N	2017-02-05 21:21:11.689256	2017-02-05 21:21:11.689256	\N	\N
13	12	10	\N	2017-02-05 21:21:11.736213	2017-02-05 21:21:11.736213	\N	\N
14	13	10	\N	2017-02-05 21:21:11.778859	2017-02-05 21:21:11.778859	\N	\N
15	14	10	\N	2017-02-05 21:21:11.825056	2017-02-05 21:21:11.825056	\N	\N
16	15	10	\N	2017-02-05 21:21:11.872573	2017-02-05 21:21:11.872573	\N	\N
17	16	10	\N	2017-02-05 21:21:11.91966	2017-02-05 21:21:11.91966	\N	\N
18	17	10	\N	2017-02-05 21:21:11.95966	2017-02-05 21:21:11.95966	\N	\N
19	18	10	\N	2017-02-05 21:21:12.00646	2017-02-05 21:21:12.00646	\N	\N
20	1	-1	\N	2017-02-05 21:21:24.664341	2017-02-05 21:21:24.664341	Spree::Shipment	1
21	2	-1	\N	2017-02-05 21:21:27.744088	2017-02-05 21:21:27.744088	Spree::Shipment	2
22	2	1	\N	2017-02-06 19:02:43.468199	2017-02-06 19:02:43.468199	Spree::Shipment	2
\.


--
-- Name: spree_stock_movements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_stock_movements_id_seq', 22, true);


--
-- Data for Name: spree_stock_transfers; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_stock_transfers (id, description, source_location_id, destination_location_id, created_at, updated_at, number, shipped_at, closed_at, tracking_number, created_by_id, closed_by_id, finalized_at, finalized_by_id, deleted_at) FROM stdin;
\.


--
-- Name: spree_stock_transfers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_stock_transfers_id_seq', 1, false);


--
-- Data for Name: spree_store_credit_categories; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_store_credit_categories (id, name, created_at, updated_at) FROM stdin;
1	Default	2017-02-05 21:19:43.687977	2017-02-05 21:19:43.687977
2	Gift Card	2017-02-05 21:20:35.593369	2017-02-05 21:20:35.593369
\.


--
-- Name: spree_store_credit_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_store_credit_categories_id_seq', 2, true);


--
-- Data for Name: spree_store_credit_events; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_store_credit_events (id, store_credit_id, action, amount, user_total_amount, authorization_code, deleted_at, originator_type, originator_id, created_at, updated_at, update_reason_id) FROM stdin;
\.


--
-- Name: spree_store_credit_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_store_credit_events_id_seq', 1, false);


--
-- Data for Name: spree_store_credit_types; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_store_credit_types (id, name, priority, created_at, updated_at) FROM stdin;
1	Expiring	1	2017-02-05 21:19:43.844105	2017-02-05 21:19:43.844105
2	Non-expiring	2	2017-02-05 21:19:43.850771	2017-02-05 21:19:43.850771
\.


--
-- Name: spree_store_credit_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_store_credit_types_id_seq', 2, true);


--
-- Data for Name: spree_store_credit_update_reasons; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_store_credit_update_reasons (id, name, created_at, updated_at) FROM stdin;
1	Credit Given In Error	2017-02-05 21:19:44.548632	2017-02-05 21:19:44.548632
\.


--
-- Name: spree_store_credit_update_reasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_store_credit_update_reasons_id_seq', 1, true);


--
-- Data for Name: spree_store_credits; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_store_credits (id, user_id, category_id, created_by_id, amount, amount_used, amount_authorized, currency, memo, spree_store_credits, deleted_at, created_at, updated_at, type_id, invalidated_at) FROM stdin;
\.


--
-- Name: spree_store_credits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_store_credits_id_seq', 1, false);


--
-- Data for Name: spree_store_payment_methods; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_store_payment_methods (id, store_id, payment_method_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_store_payment_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_store_payment_methods_id_seq', 1, false);


--
-- Data for Name: spree_store_translations; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_store_translations (id, spree_store_id, locale, created_at, updated_at, name, meta_description, meta_keywords, seo_title) FROM stdin;
1	1	en	2017-02-17 12:20:30.567319	2017-02-17 12:20:30.567319	Sample Store			
2	2	en	2017-02-17 12:20:30.572808	2017-02-17 12:20:30.572808	Sample Store	\N	\N	\N
\.


--
-- Name: spree_store_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_store_translations_id_seq', 2, true);


--
-- Data for Name: spree_stores; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_stores (id, name, url, meta_description, meta_keywords, seo_title, mail_from_address, default_currency, code, "default", created_at, updated_at, cart_tax_country_iso) FROM stdin;
2	Sample Store	solidus.example.com	\N	\N	\N	store@example.com	\N	sample-store	f	2017-02-05 21:21:22.848711	2017-02-05 21:21:22.848711	\N
1	Sample Store	example.com				store@example.com	\N	spree	t	2017-02-05 21:19:39.757715	2017-02-16 20:31:53.640776	
\.


--
-- Name: spree_stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_stores_id_seq', 2, true);


--
-- Data for Name: spree_tax_categories; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_tax_categories (id, name, description, is_default, deleted_at, created_at, updated_at, tax_code) FROM stdin;
1	Default	\N	f	2017-02-17 15:32:31.840233	2017-02-05 21:21:04.75147	2017-02-05 21:21:04.75147	\N
2	Moldova		t	\N	2017-02-17 22:05:08.646404	2017-02-17 22:05:08.646404	1
\.


--
-- Name: spree_tax_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_tax_categories_id_seq', 2, true);


--
-- Data for Name: spree_tax_rates; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_tax_rates (id, amount, zone_id, tax_category_id, included_in_price, created_at, updated_at, name, show_rate_in_label, deleted_at) FROM stdin;
1	0.05000	2	1	f	2017-02-05 21:21:04.952825	2017-02-05 21:21:04.952825	North America	t	2017-02-17 15:32:23.560327
2	0.00000	1	2	f	2017-02-17 22:05:55.436862	2017-02-17 22:05:55.436862	0	t	\N
\.


--
-- Name: spree_tax_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_tax_rates_id_seq', 2, true);


--
-- Data for Name: spree_taxon_translations; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_taxon_translations (id, spree_taxon_id, locale, created_at, updated_at, name, description, meta_title, meta_description, meta_keywords, permalink) FROM stdin;
1	1	en	2017-02-17 12:20:29.950827	2017-02-17 12:20:29.950827	Categories	\N	\N	\N	\N	categories
2	2	en	2017-02-17 12:20:29.958081	2017-02-17 12:20:29.958081	Brand	\N	\N	\N	\N	brand
3	3	en	2017-02-17 12:20:29.962344	2017-02-17 12:20:29.962344	Bags	\N	\N	\N	\N	categories/bags
4	4	en	2017-02-17 12:20:29.967331	2017-02-17 12:20:29.967331	Mugs	\N	\N	\N	\N	categories/mugs
5	5	en	2017-02-17 12:20:29.97348	2017-02-17 12:20:29.97348	Clothing	\N	\N	\N	\N	categories/clothing
6	6	en	2017-02-17 12:20:29.978887	2017-02-17 12:20:29.978887	Shirts	\N	\N	\N	\N	categories/clothing/shirts
7	7	en	2017-02-17 12:20:29.984247	2017-02-17 12:20:29.984247	T-Shirts	\N	\N	\N	\N	categories/clothing/t-shirts
8	8	en	2017-02-17 12:20:29.98987	2017-02-17 12:20:29.98987	Ruby	\N	\N	\N	\N	brand/ruby
9	9	en	2017-02-17 12:20:29.995397	2017-02-17 12:20:29.995397	Apache	\N	\N	\N	\N	brand/apache
10	10	en	2017-02-17 12:20:30.001004	2017-02-17 12:20:30.001004	Rails	\N	\N	\N	\N	brand/rails
\.


--
-- Name: spree_taxon_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_taxon_translations_id_seq', 10, true);


--
-- Data for Name: spree_taxonomies; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_taxonomies (id, name, created_at, updated_at, "position") FROM stdin;
\.


--
-- Name: spree_taxonomies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_taxonomies_id_seq', 4, true);


--
-- Data for Name: spree_taxonomy_translations; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_taxonomy_translations (id, spree_taxonomy_id, locale, created_at, updated_at, name) FROM stdin;
1	1	en	2017-02-17 12:20:29.855157	2017-02-17 12:20:29.855157	Categories
2	2	en	2017-02-17 12:20:29.860181	2017-02-17 12:20:29.860181	Brand
\.


--
-- Name: spree_taxonomy_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_taxonomy_translations_id_seq', 2, true);


--
-- Data for Name: spree_taxons; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_taxons (id, parent_id, "position", name, permalink, taxonomy_id, lft, rgt, icon_file_name, icon_content_type, icon_file_size, icon_updated_at, description, created_at, updated_at, meta_title, meta_description, meta_keywords, depth) FROM stdin;
\.


--
-- Name: spree_taxons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_taxons_id_seq', 17, true);


--
-- Data for Name: spree_transfer_items; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_transfer_items (id, variant_id, stock_transfer_id, expected_quantity, received_quantity, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Name: spree_transfer_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_transfer_items_id_seq', 1, false);


--
-- Data for Name: spree_unit_cancels; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_unit_cancels (id, inventory_unit_id, reason, created_by, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_unit_cancels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_unit_cancels_id_seq', 1, false);


--
-- Data for Name: spree_user_addresses; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_user_addresses (id, user_id, address_id, "default", archived, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_user_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_user_addresses_id_seq', 1, false);


--
-- Data for Name: spree_user_stock_locations; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_user_stock_locations (id, user_id, stock_location_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_user_stock_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_user_stock_locations_id_seq', 1, false);


--
-- Data for Name: spree_users; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_users (id, encrypted_password, password_salt, email, remember_token, persistence_token, reset_password_token, perishable_token, sign_in_count, failed_attempts, last_request_at, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, login, ship_address_id, bill_address_id, authentication_token, unlock_token, locked_at, reset_password_sent_at, created_at, updated_at, spree_api_key, remember_created_at, deleted_at, confirmation_token, confirmed_at, confirmation_sent_at) FROM stdin;
1	a0a34712f8a6ea601666b1b0d7d15266515d23b68a13eb4b185b00d5641643789cb1380acbca0ee3bccbd415c6ad1872fb25b7656129da2f0d18cd0151c771ee	fs-qUhiD2tHiM9RqMBpV	admin@example.com	\N	\N	\N	\N	10	0	\N	2017-02-20 10:54:40.599544	2017-02-19 22:13:08.401688	10.240.0.16	10.240.0.225	admin@example.com	\N	\N	\N	\N	\N	\N	2017-02-05 21:20:55.666278	2017-02-20 10:54:40.643766	9cf4bfab2e337dc6ce81a37a3b07462cc22b1f936820c3e0	\N	\N	\N	\N	\N
\.


--
-- Name: spree_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_users_id_seq', 1, true);


--
-- Data for Name: spree_variant_property_rule_conditions; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_variant_property_rule_conditions (id, option_value_id, variant_property_rule_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_variant_property_rule_conditions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_variant_property_rule_conditions_id_seq', 1, false);


--
-- Data for Name: spree_variant_property_rule_values; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_variant_property_rule_values (id, value, "position", property_id, variant_property_rule_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_variant_property_rule_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_variant_property_rule_values_id_seq', 1, false);


--
-- Data for Name: spree_variant_property_rules; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_variant_property_rules (id, product_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: spree_variant_property_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_variant_property_rules_id_seq', 1, false);


--
-- Data for Name: spree_variants; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_variants (id, sku, weight, height, width, depth, deleted_at, is_master, product_id, cost_price, "position", cost_currency, track_inventory, tax_category_id, updated_at, created_at) FROM stdin;
24		0.00	\N	\N	\N	2017-02-17 14:33:27.224768	t	14	\N	1	MDL	t	\N	2017-02-17 14:33:26.904617	2017-02-17 12:55:30.096895
25		0.00	\N	\N	\N	2017-02-17 14:33:30.7185	t	15	\N	1	MDL	t	\N	2017-02-17 14:33:30.688727	2017-02-17 13:31:08.3383
1	ROR-00011	0.00	\N	\N	\N	\N	t	1	17.00	1	USD	t	\N	2017-02-05 21:21:24.681721	2017-02-05 21:21:05.6995
26		0.00	\N	\N	\N	2017-02-17 15:38:39.37581	t	16	10.00	1	MDL	t	\N	2017-02-17 15:38:39.352017	2017-02-17 15:35:50.748107
6	RUB-00001	0.00	\N	\N	\N	\N	t	6	17.00	1	Lei	t	\N	2017-02-17 15:38:56.440699	2017-02-05 21:21:06.934982
20	1231231231	0.00	\N	\N	\N	2017-02-06 18:16:54.523283	t	10	\N	1	USD	t	\N	2017-02-06 18:16:54.508133	2017-02-06 18:14:58.107724
2	ROR-00012	0.00	\N	\N	\N	\N	t	2	21.00	1	USD	t	\N	2017-02-06 19:02:43.529727	2017-02-05 21:21:06.020259
3	ROR-001	0.00	\N	\N	\N	\N	t	3	17.00	1	MDL	t	\N	2017-02-17 18:38:58.24134	2017-02-05 21:21:06.140119
27		0.00	\N	\N	\N	\N	t	17	8.00	1	MDL	t	\N	2017-02-17 22:08:56.738908	2017-02-17 18:29:28.257727
21	123123	0.00	\N	\N	\N	2017-02-13 20:02:32.093218	t	11	\N	1	USD	t	\N	2017-02-13 20:02:32.039962	2017-02-06 19:12:26.350489
7	APC-00001	0.00	\N	\N	\N	2017-02-13 20:02:36.237378	t	7	17.00	1	USD	t	\N	2017-02-13 20:02:36.232194	2017-02-05 21:21:07.077456
28		0.00	\N	\N	\N	\N	t	18	\N	1	RUB	t	\N	2017-02-17 22:24:14.710588	2017-02-17 22:24:14.699169
10	ROR-00001	0.00	\N	\N	\N	\N	f	3	17.00	3	USD	t	\N	2017-02-05 21:21:12.840157	2017-02-05 21:21:10.069496
11	ROR-00002	0.00	\N	\N	\N	\N	f	3	17.00	5	USD	t	\N	2017-02-05 21:21:13.369719	2017-02-05 21:21:10.15138
4	ROR-00013	0.00	\N	\N	\N	\N	t	4	20.00	1	MDL	t	\N	2017-02-16 21:14:19.866764	2017-02-05 21:21:06.259862
12	ROR-00003	0.00	\N	\N	\N	\N	f	3	17.00	7	USD	t	\N	2017-02-05 21:21:13.87019	2017-02-05 21:21:10.213879
8	ROR-00014	0.00	\N	\N	\N	\N	t	8	11.00	1	MDL	t	\N	2017-02-16 21:14:46.47536	2017-02-05 21:21:07.192074
13	ROR-00004	0.00	\N	\N	\N	\N	f	3	17.00	9	USD	t	\N	2017-02-05 21:21:14.430102	2017-02-05 21:21:10.287575
14	ROR-00005	0.00	\N	\N	\N	\N	f	3	17.00	11	USD	t	\N	2017-02-05 21:21:14.969287	2017-02-05 21:21:10.355432
15	ROR-00006	0.00	\N	\N	\N	\N	f	3	17.00	13	USD	t	\N	2017-02-05 21:21:15.473095	2017-02-05 21:21:10.422879
16	ROR-00007	0.00	\N	\N	\N	\N	f	3	17.00	15	USD	t	\N	2017-02-05 21:21:16.006177	2017-02-05 21:21:10.493113
17	ROR-00008	0.00	\N	\N	\N	\N	f	3	17.00	17	USD	t	\N	2017-02-05 21:21:16.59185	2017-02-05 21:21:10.571544
18	ROR-00009	0.00	\N	\N	\N	\N	f	3	17.00	19	USD	t	\N	2017-02-05 21:21:17.209244	2017-02-05 21:21:10.645529
5	ROR-00015	0.00	\N	\N	\N	\N	t	5	17.00	1	MDL	t	\N	2017-02-16 21:15:52.079445	2017-02-05 21:21:06.714977
19	ROR-00010	0.00	\N	\N	\N	\N	f	3	17.00	21	USD	t	\N	2017-02-05 21:21:17.758478	2017-02-05 21:21:10.715582
22		0.00	\N	\N	\N	2017-02-16 21:16:05.317305	t	12	\N	1	MDL	t	\N	2017-02-16 21:16:05.297132	2017-02-16 21:15:15.788387
9	ROR-00016	0.00	\N	\N	\N	\N	t	9	15.00	1	USD	t	\N	2017-02-16 21:16:14.26244	2017-02-05 21:21:07.299632
23		0.00	\N	\N	\N	2017-02-17 12:39:57.052594	t	13	\N	1	MDL	t	\N	2017-02-17 12:39:56.993903	2017-02-17 12:25:46.711537
\.


--
-- Name: spree_variants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_variants_id_seq', 28, true);


--
-- Data for Name: spree_zone_members; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_zone_members (id, zoneable_type, zoneable_id, zone_id, created_at, updated_at) FROM stdin;
1	Spree::Country	179	1	2017-02-05 21:20:35.722871	2017-02-05 21:20:35.722871
2	Spree::Country	70	1	2017-02-05 21:20:35.750873	2017-02-05 21:20:35.750873
3	Spree::Country	183	1	2017-02-05 21:20:35.761023	2017-02-05 21:20:35.761023
4	Spree::Country	188	1	2017-02-05 21:20:35.768556	2017-02-05 21:20:35.768556
5	Spree::Country	57	1	2017-02-05 21:20:35.775774	2017-02-05 21:20:35.775774
6	Spree::Country	75	1	2017-02-05 21:20:35.783299	2017-02-05 21:20:35.783299
7	Spree::Country	201	1	2017-02-05 21:20:35.790989	2017-02-05 21:20:35.790989
8	Spree::Country	100	1	2017-02-05 21:20:35.798529	2017-02-05 21:20:35.798529
9	Spree::Country	199	1	2017-02-05 21:20:35.807153	2017-02-05 21:20:35.807153
10	Spree::Country	102	1	2017-02-05 21:20:35.814905	2017-02-05 21:20:35.814905
11	Spree::Country	12	1	2017-02-05 21:20:35.822097	2017-02-05 21:20:35.822097
12	Spree::Country	68	1	2017-02-05 21:20:35.829554	2017-02-05 21:20:35.829554
13	Spree::Country	110	1	2017-02-05 21:20:35.837686	2017-02-05 21:20:35.837686
14	Spree::Country	20	1	2017-02-05 21:20:35.849559	2017-02-05 21:20:35.849559
15	Spree::Country	196	1	2017-02-05 21:20:35.858901	2017-02-05 21:20:35.858901
16	Spree::Country	135	1	2017-02-05 21:20:35.868053	2017-02-05 21:20:35.868053
17	Spree::Country	22	1	2017-02-05 21:20:35.878018	2017-02-05 21:20:35.878018
18	Spree::Country	77	1	2017-02-05 21:20:35.88785	2017-02-05 21:20:35.88785
19	Spree::Country	133	1	2017-02-05 21:20:35.896815	2017-02-05 21:20:35.896815
20	Spree::Country	55	1	2017-02-05 21:20:35.904138	2017-02-05 21:20:35.904138
21	Spree::Country	134	1	2017-02-05 21:20:35.911602	2017-02-05 21:20:35.911602
22	Spree::Country	153	1	2017-02-05 21:20:35.919081	2017-02-05 21:20:35.919081
23	Spree::Country	59	1	2017-02-05 21:20:35.926988	2017-02-05 21:20:35.926988
24	Spree::Country	166	1	2017-02-05 21:20:35.935115	2017-02-05 21:20:35.935115
25	Spree::Country	64	1	2017-02-05 21:20:35.942989	2017-02-05 21:20:35.942989
26	Spree::Country	98	1	2017-02-05 21:20:35.950508	2017-02-05 21:20:35.950508
27	Spree::Country	56	1	2017-02-05 21:20:35.957817	2017-02-05 21:20:35.957817
28	Spree::Country	89	1	2017-02-05 21:20:35.966474	2017-02-05 21:20:35.966474
29	Spree::Country	232	2	2017-02-05 21:20:35.979217	2017-02-05 21:20:35.979217
30	Spree::Country	38	2	2017-02-05 21:20:35.990038	2017-02-05 21:20:35.990038
\.


--
-- Name: spree_zone_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_zone_members_id_seq', 30, true);


--
-- Data for Name: spree_zones; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY spree_zones (id, name, description, default_tax, zone_members_count, created_at, updated_at) FROM stdin;
1	EU_VAT	Countries that make up the EU VAT zone.	f	28	2017-02-05 21:20:35.66334	2017-02-05 21:20:35.66334
2	North America	USA + Canada	f	2	2017-02-05 21:20:35.696542	2017-02-05 21:20:35.696542
\.


--
-- Name: spree_zones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('spree_zones_id_seq', 2, true);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: friendly_id_slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: spree_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_addresses
    ADD CONSTRAINT spree_addresses_pkey PRIMARY KEY (id);


--
-- Name: spree_adjustment_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_adjustment_reasons
    ADD CONSTRAINT spree_adjustment_reasons_pkey PRIMARY KEY (id);


--
-- Name: spree_adjustments_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_adjustments
    ADD CONSTRAINT spree_adjustments_pkey PRIMARY KEY (id);


--
-- Name: spree_assets_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_assets
    ADD CONSTRAINT spree_assets_pkey PRIMARY KEY (id);


--
-- Name: spree_calculators_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_calculators
    ADD CONSTRAINT spree_calculators_pkey PRIMARY KEY (id);


--
-- Name: spree_cartons_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_cartons
    ADD CONSTRAINT spree_cartons_pkey PRIMARY KEY (id);


--
-- Name: spree_countries_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_countries
    ADD CONSTRAINT spree_countries_pkey PRIMARY KEY (id);


--
-- Name: spree_credit_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_credit_cards
    ADD CONSTRAINT spree_credit_cards_pkey PRIMARY KEY (id);


--
-- Name: spree_customer_returns_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_customer_returns
    ADD CONSTRAINT spree_customer_returns_pkey PRIMARY KEY (id);


--
-- Name: spree_inventory_units_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_inventory_units
    ADD CONSTRAINT spree_inventory_units_pkey PRIMARY KEY (id);


--
-- Name: spree_line_item_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_line_item_actions
    ADD CONSTRAINT spree_line_item_actions_pkey PRIMARY KEY (id);


--
-- Name: spree_line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_line_items
    ADD CONSTRAINT spree_line_items_pkey PRIMARY KEY (id);


--
-- Name: spree_log_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_log_entries
    ADD CONSTRAINT spree_log_entries_pkey PRIMARY KEY (id);


--
-- Name: spree_option_type_prototypes_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_option_type_prototypes
    ADD CONSTRAINT spree_option_type_prototypes_pkey PRIMARY KEY (id);


--
-- Name: spree_option_type_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_option_type_translations
    ADD CONSTRAINT spree_option_type_translations_pkey PRIMARY KEY (id);


--
-- Name: spree_option_types_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_option_types
    ADD CONSTRAINT spree_option_types_pkey PRIMARY KEY (id);


--
-- Name: spree_option_value_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_option_value_translations
    ADD CONSTRAINT spree_option_value_translations_pkey PRIMARY KEY (id);


--
-- Name: spree_option_values_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_option_values
    ADD CONSTRAINT spree_option_values_pkey PRIMARY KEY (id);


--
-- Name: spree_option_values_variants_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_option_values_variants
    ADD CONSTRAINT spree_option_values_variants_pkey PRIMARY KEY (id);


--
-- Name: spree_order_mutexes_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_order_mutexes
    ADD CONSTRAINT spree_order_mutexes_pkey PRIMARY KEY (id);


--
-- Name: spree_order_stock_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_order_stock_locations
    ADD CONSTRAINT spree_order_stock_locations_pkey PRIMARY KEY (id);


--
-- Name: spree_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_orders
    ADD CONSTRAINT spree_orders_pkey PRIMARY KEY (id);


--
-- Name: spree_orders_promotions_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_orders_promotions
    ADD CONSTRAINT spree_orders_promotions_pkey PRIMARY KEY (id);


--
-- Name: spree_payment_capture_events_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_payment_capture_events
    ADD CONSTRAINT spree_payment_capture_events_pkey PRIMARY KEY (id);


--
-- Name: spree_payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_payment_methods
    ADD CONSTRAINT spree_payment_methods_pkey PRIMARY KEY (id);


--
-- Name: spree_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_payments
    ADD CONSTRAINT spree_payments_pkey PRIMARY KEY (id);


--
-- Name: spree_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_preferences
    ADD CONSTRAINT spree_preferences_pkey PRIMARY KEY (id);


--
-- Name: spree_prices_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_prices
    ADD CONSTRAINT spree_prices_pkey PRIMARY KEY (id);


--
-- Name: spree_product_option_types_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_product_option_types
    ADD CONSTRAINT spree_product_option_types_pkey PRIMARY KEY (id);


--
-- Name: spree_product_promotion_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_product_promotion_rules
    ADD CONSTRAINT spree_product_promotion_rules_pkey PRIMARY KEY (id);


--
-- Name: spree_product_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_product_properties
    ADD CONSTRAINT spree_product_properties_pkey PRIMARY KEY (id);


--
-- Name: spree_product_property_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_product_property_translations
    ADD CONSTRAINT spree_product_property_translations_pkey PRIMARY KEY (id);


--
-- Name: spree_product_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_product_translations
    ADD CONSTRAINT spree_product_translations_pkey PRIMARY KEY (id);


--
-- Name: spree_products_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_products
    ADD CONSTRAINT spree_products_pkey PRIMARY KEY (id);


--
-- Name: spree_products_taxons_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_products_taxons
    ADD CONSTRAINT spree_products_taxons_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_action_line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_promotion_action_line_items
    ADD CONSTRAINT spree_promotion_action_line_items_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_promotion_actions
    ADD CONSTRAINT spree_promotion_actions_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_promotion_categories
    ADD CONSTRAINT spree_promotion_categories_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_promotion_codes
    ADD CONSTRAINT spree_promotion_codes_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_rule_taxons_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_promotion_rule_taxons
    ADD CONSTRAINT spree_promotion_rule_taxons_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_promotion_rules
    ADD CONSTRAINT spree_promotion_rules_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_rules_users_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_promotion_rules_users
    ADD CONSTRAINT spree_promotion_rules_users_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_promotion_translations
    ADD CONSTRAINT spree_promotion_translations_pkey PRIMARY KEY (id);


--
-- Name: spree_promotions_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_promotions
    ADD CONSTRAINT spree_promotions_pkey PRIMARY KEY (id);


--
-- Name: spree_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_properties
    ADD CONSTRAINT spree_properties_pkey PRIMARY KEY (id);


--
-- Name: spree_property_prototypes_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_property_prototypes
    ADD CONSTRAINT spree_property_prototypes_pkey PRIMARY KEY (id);


--
-- Name: spree_property_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_property_translations
    ADD CONSTRAINT spree_property_translations_pkey PRIMARY KEY (id);


--
-- Name: spree_prototype_taxons_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_prototype_taxons
    ADD CONSTRAINT spree_prototype_taxons_pkey PRIMARY KEY (id);


--
-- Name: spree_prototypes_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_prototypes
    ADD CONSTRAINT spree_prototypes_pkey PRIMARY KEY (id);


--
-- Name: spree_refund_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_refund_reasons
    ADD CONSTRAINT spree_refund_reasons_pkey PRIMARY KEY (id);


--
-- Name: spree_refunds_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_refunds
    ADD CONSTRAINT spree_refunds_pkey PRIMARY KEY (id);


--
-- Name: spree_reimbursement_credits_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_reimbursement_credits
    ADD CONSTRAINT spree_reimbursement_credits_pkey PRIMARY KEY (id);


--
-- Name: spree_reimbursement_types_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_reimbursement_types
    ADD CONSTRAINT spree_reimbursement_types_pkey PRIMARY KEY (id);


--
-- Name: spree_reimbursements_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_reimbursements
    ADD CONSTRAINT spree_reimbursements_pkey PRIMARY KEY (id);


--
-- Name: spree_return_authorizations_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_return_authorizations
    ADD CONSTRAINT spree_return_authorizations_pkey PRIMARY KEY (id);


--
-- Name: spree_return_items_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_return_items
    ADD CONSTRAINT spree_return_items_pkey PRIMARY KEY (id);


--
-- Name: spree_return_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_return_reasons
    ADD CONSTRAINT spree_return_reasons_pkey PRIMARY KEY (id);


--
-- Name: spree_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_roles
    ADD CONSTRAINT spree_roles_pkey PRIMARY KEY (id);


--
-- Name: spree_roles_users_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_roles_users
    ADD CONSTRAINT spree_roles_users_pkey PRIMARY KEY (id);


--
-- Name: spree_shipments_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_shipments
    ADD CONSTRAINT spree_shipments_pkey PRIMARY KEY (id);


--
-- Name: spree_shipping_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_shipping_categories
    ADD CONSTRAINT spree_shipping_categories_pkey PRIMARY KEY (id);


--
-- Name: spree_shipping_method_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_shipping_method_categories
    ADD CONSTRAINT spree_shipping_method_categories_pkey PRIMARY KEY (id);


--
-- Name: spree_shipping_method_stock_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_shipping_method_stock_locations
    ADD CONSTRAINT spree_shipping_method_stock_locations_pkey PRIMARY KEY (id);


--
-- Name: spree_shipping_method_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_shipping_method_translations
    ADD CONSTRAINT spree_shipping_method_translations_pkey PRIMARY KEY (id);


--
-- Name: spree_shipping_method_zones_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_shipping_method_zones
    ADD CONSTRAINT spree_shipping_method_zones_pkey PRIMARY KEY (id);


--
-- Name: spree_shipping_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_shipping_methods
    ADD CONSTRAINT spree_shipping_methods_pkey PRIMARY KEY (id);


--
-- Name: spree_shipping_rate_taxes_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_shipping_rate_taxes
    ADD CONSTRAINT spree_shipping_rate_taxes_pkey PRIMARY KEY (id);


--
-- Name: spree_shipping_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_shipping_rates
    ADD CONSTRAINT spree_shipping_rates_pkey PRIMARY KEY (id);


--
-- Name: spree_state_changes_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_state_changes
    ADD CONSTRAINT spree_state_changes_pkey PRIMARY KEY (id);


--
-- Name: spree_states_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_states
    ADD CONSTRAINT spree_states_pkey PRIMARY KEY (id);


--
-- Name: spree_stock_items_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_stock_items
    ADD CONSTRAINT spree_stock_items_pkey PRIMARY KEY (id);


--
-- Name: spree_stock_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_stock_locations
    ADD CONSTRAINT spree_stock_locations_pkey PRIMARY KEY (id);


--
-- Name: spree_stock_movements_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_stock_movements
    ADD CONSTRAINT spree_stock_movements_pkey PRIMARY KEY (id);


--
-- Name: spree_stock_transfers_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_stock_transfers
    ADD CONSTRAINT spree_stock_transfers_pkey PRIMARY KEY (id);


--
-- Name: spree_store_credit_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_store_credit_categories
    ADD CONSTRAINT spree_store_credit_categories_pkey PRIMARY KEY (id);


--
-- Name: spree_store_credit_events_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_store_credit_events
    ADD CONSTRAINT spree_store_credit_events_pkey PRIMARY KEY (id);


--
-- Name: spree_store_credit_types_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_store_credit_types
    ADD CONSTRAINT spree_store_credit_types_pkey PRIMARY KEY (id);


--
-- Name: spree_store_credit_update_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_store_credit_update_reasons
    ADD CONSTRAINT spree_store_credit_update_reasons_pkey PRIMARY KEY (id);


--
-- Name: spree_store_credits_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_store_credits
    ADD CONSTRAINT spree_store_credits_pkey PRIMARY KEY (id);


--
-- Name: spree_store_payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_store_payment_methods
    ADD CONSTRAINT spree_store_payment_methods_pkey PRIMARY KEY (id);


--
-- Name: spree_store_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_store_translations
    ADD CONSTRAINT spree_store_translations_pkey PRIMARY KEY (id);


--
-- Name: spree_stores_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_stores
    ADD CONSTRAINT spree_stores_pkey PRIMARY KEY (id);


--
-- Name: spree_tax_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_tax_categories
    ADD CONSTRAINT spree_tax_categories_pkey PRIMARY KEY (id);


--
-- Name: spree_tax_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_tax_rates
    ADD CONSTRAINT spree_tax_rates_pkey PRIMARY KEY (id);


--
-- Name: spree_taxon_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_taxon_translations
    ADD CONSTRAINT spree_taxon_translations_pkey PRIMARY KEY (id);


--
-- Name: spree_taxonomies_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_taxonomies
    ADD CONSTRAINT spree_taxonomies_pkey PRIMARY KEY (id);


--
-- Name: spree_taxonomy_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_taxonomy_translations
    ADD CONSTRAINT spree_taxonomy_translations_pkey PRIMARY KEY (id);


--
-- Name: spree_taxons_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_taxons
    ADD CONSTRAINT spree_taxons_pkey PRIMARY KEY (id);


--
-- Name: spree_transfer_items_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_transfer_items
    ADD CONSTRAINT spree_transfer_items_pkey PRIMARY KEY (id);


--
-- Name: spree_unit_cancels_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_unit_cancels
    ADD CONSTRAINT spree_unit_cancels_pkey PRIMARY KEY (id);


--
-- Name: spree_user_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_user_addresses
    ADD CONSTRAINT spree_user_addresses_pkey PRIMARY KEY (id);


--
-- Name: spree_user_stock_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_user_stock_locations
    ADD CONSTRAINT spree_user_stock_locations_pkey PRIMARY KEY (id);


--
-- Name: spree_users_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_users
    ADD CONSTRAINT spree_users_pkey PRIMARY KEY (id);


--
-- Name: spree_variant_property_rule_conditions_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_variant_property_rule_conditions
    ADD CONSTRAINT spree_variant_property_rule_conditions_pkey PRIMARY KEY (id);


--
-- Name: spree_variant_property_rule_values_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_variant_property_rule_values
    ADD CONSTRAINT spree_variant_property_rule_values_pkey PRIMARY KEY (id);


--
-- Name: spree_variant_property_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_variant_property_rules
    ADD CONSTRAINT spree_variant_property_rules_pkey PRIMARY KEY (id);


--
-- Name: spree_variants_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_variants
    ADD CONSTRAINT spree_variants_pkey PRIMARY KEY (id);


--
-- Name: spree_zone_members_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_zone_members
    ADD CONSTRAINT spree_zone_members_pkey PRIMARY KEY (id);


--
-- Name: spree_zones_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY spree_zones
    ADD CONSTRAINT spree_zones_pkey PRIMARY KEY (id);


--
-- Name: email_idx_unique; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE UNIQUE INDEX email_idx_unique ON spree_users USING btree (email);


--
-- Name: index_0968f57fbd8fb9f31050820cbb66109a266c516a; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_0968f57fbd8fb9f31050820cbb66109a266c516a ON spree_product_property_translations USING btree (spree_product_property_id);


--
-- Name: index_addresses_on_firstname; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_addresses_on_firstname ON spree_addresses USING btree (firstname);


--
-- Name: index_addresses_on_lastname; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_addresses_on_lastname ON spree_addresses USING btree (lastname);


--
-- Name: index_adjustments_on_order_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_adjustments_on_order_id ON spree_adjustments USING btree (adjustable_id);


--
-- Name: index_assets_on_viewable_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_assets_on_viewable_id ON spree_assets USING btree (viewable_id);


--
-- Name: index_assets_on_viewable_type_and_type; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_assets_on_viewable_type_and_type ON spree_assets USING btree (viewable_type, type);


--
-- Name: index_c713dce023452222dbb97ceedfc9eddb4f02a87f; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_c713dce023452222dbb97ceedfc9eddb4f02a87f ON spree_shipping_method_translations USING btree (spree_shipping_method_id);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON friendly_id_slugs USING btree (slug, sluggable_type);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope ON friendly_id_slugs USING btree (slug, sluggable_type, scope);


--
-- Name: index_friendly_id_slugs_on_sluggable_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_id ON friendly_id_slugs USING btree (sluggable_id);


--
-- Name: index_friendly_id_slugs_on_sluggable_type; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_type ON friendly_id_slugs USING btree (sluggable_type);


--
-- Name: index_inventory_units_on_order_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_inventory_units_on_order_id ON spree_inventory_units USING btree (order_id);


--
-- Name: index_inventory_units_on_shipment_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_inventory_units_on_shipment_id ON spree_inventory_units USING btree (shipment_id);


--
-- Name: index_inventory_units_on_variant_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_inventory_units_on_variant_id ON spree_inventory_units USING btree (variant_id);


--
-- Name: index_option_values_variants_on_variant_id_and_option_value_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_option_values_variants_on_variant_id_and_option_value_id ON spree_option_values_variants USING btree (variant_id, option_value_id);


--
-- Name: index_product_properties_on_product_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_product_properties_on_product_id ON spree_product_properties USING btree (product_id);


--
-- Name: index_products_promotion_rules_on_product_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_products_promotion_rules_on_product_id ON spree_product_promotion_rules USING btree (product_id);


--
-- Name: index_products_promotion_rules_on_promotion_rule_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_products_promotion_rules_on_promotion_rule_id ON spree_product_promotion_rules USING btree (promotion_rule_id);


--
-- Name: index_promotion_rules_on_product_group_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_promotion_rules_on_product_group_id ON spree_promotion_rules USING btree (product_group_id);


--
-- Name: index_promotion_rules_users_on_promotion_rule_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_promotion_rules_users_on_promotion_rule_id ON spree_promotion_rules_users USING btree (promotion_rule_id);


--
-- Name: index_promotion_rules_users_on_user_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_promotion_rules_users_on_user_id ON spree_promotion_rules_users USING btree (user_id);


--
-- Name: index_refunds_on_refund_reason_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_refunds_on_refund_reason_id ON spree_refunds USING btree (refund_reason_id);


--
-- Name: index_return_authorizations_on_return_authorization_reason_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_return_authorizations_on_return_authorization_reason_id ON spree_return_authorizations USING btree (return_reason_id);


--
-- Name: index_return_items_on_customer_return_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_return_items_on_customer_return_id ON spree_return_items USING btree (customer_return_id);


--
-- Name: index_shipments_on_number; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_shipments_on_number ON spree_shipments USING btree (number);


--
-- Name: index_spree_addresses_on_country_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_addresses_on_country_id ON spree_addresses USING btree (country_id);


--
-- Name: index_spree_addresses_on_state_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_addresses_on_state_id ON spree_addresses USING btree (state_id);


--
-- Name: index_spree_adjustment_reasons_on_active; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_adjustment_reasons_on_active ON spree_adjustment_reasons USING btree (active);


--
-- Name: index_spree_adjustment_reasons_on_code; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_adjustment_reasons_on_code ON spree_adjustment_reasons USING btree (code);


--
-- Name: index_spree_adjustments_on_adjustable_id_and_adjustable_type; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_adjustments_on_adjustable_id_and_adjustable_type ON spree_adjustments USING btree (adjustable_id, adjustable_type);


--
-- Name: index_spree_adjustments_on_eligible; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_adjustments_on_eligible ON spree_adjustments USING btree (eligible);


--
-- Name: index_spree_adjustments_on_order_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_adjustments_on_order_id ON spree_adjustments USING btree (order_id);


--
-- Name: index_spree_adjustments_on_promotion_code_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_adjustments_on_promotion_code_id ON spree_adjustments USING btree (promotion_code_id);


--
-- Name: index_spree_adjustments_on_source_id_and_source_type; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_adjustments_on_source_id_and_source_type ON spree_adjustments USING btree (source_id, source_type);


--
-- Name: index_spree_calculators_on_calculable_id_and_calculable_type; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_calculators_on_calculable_id_and_calculable_type ON spree_calculators USING btree (calculable_id, calculable_type);


--
-- Name: index_spree_calculators_on_id_and_type; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_calculators_on_id_and_type ON spree_calculators USING btree (id, type);


--
-- Name: index_spree_cartons_on_external_number; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_cartons_on_external_number ON spree_cartons USING btree (external_number);


--
-- Name: index_spree_cartons_on_imported_from_shipment_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE UNIQUE INDEX index_spree_cartons_on_imported_from_shipment_id ON spree_cartons USING btree (imported_from_shipment_id);


--
-- Name: index_spree_cartons_on_number; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE UNIQUE INDEX index_spree_cartons_on_number ON spree_cartons USING btree (number);


--
-- Name: index_spree_cartons_on_stock_location_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_cartons_on_stock_location_id ON spree_cartons USING btree (stock_location_id);


--
-- Name: index_spree_countries_on_iso; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_countries_on_iso ON spree_countries USING btree (iso);


--
-- Name: index_spree_credit_cards_on_payment_method_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_credit_cards_on_payment_method_id ON spree_credit_cards USING btree (payment_method_id);


--
-- Name: index_spree_credit_cards_on_user_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_credit_cards_on_user_id ON spree_credit_cards USING btree (user_id);


--
-- Name: index_spree_inventory_units_on_carton_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_inventory_units_on_carton_id ON spree_inventory_units USING btree (carton_id);


--
-- Name: index_spree_inventory_units_on_line_item_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_inventory_units_on_line_item_id ON spree_inventory_units USING btree (line_item_id);


--
-- Name: index_spree_line_item_actions_on_action_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_line_item_actions_on_action_id ON spree_line_item_actions USING btree (action_id);


--
-- Name: index_spree_line_item_actions_on_line_item_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_line_item_actions_on_line_item_id ON spree_line_item_actions USING btree (line_item_id);


--
-- Name: index_spree_line_items_on_order_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_line_items_on_order_id ON spree_line_items USING btree (order_id);


--
-- Name: index_spree_line_items_on_variant_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_line_items_on_variant_id ON spree_line_items USING btree (variant_id);


--
-- Name: index_spree_log_entries_on_source_id_and_source_type; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_log_entries_on_source_id_and_source_type ON spree_log_entries USING btree (source_id, source_type);


--
-- Name: index_spree_option_type_translations_on_locale; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_option_type_translations_on_locale ON spree_option_type_translations USING btree (locale);


--
-- Name: index_spree_option_type_translations_on_spree_option_type_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_option_type_translations_on_spree_option_type_id ON spree_option_type_translations USING btree (spree_option_type_id);


--
-- Name: index_spree_option_types_on_position; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_option_types_on_position ON spree_option_types USING btree ("position");


--
-- Name: index_spree_option_value_translations_on_locale; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_option_value_translations_on_locale ON spree_option_value_translations USING btree (locale);


--
-- Name: index_spree_option_value_translations_on_spree_option_value_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_option_value_translations_on_spree_option_value_id ON spree_option_value_translations USING btree (spree_option_value_id);


--
-- Name: index_spree_option_values_on_option_type_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_option_values_on_option_type_id ON spree_option_values USING btree (option_type_id);


--
-- Name: index_spree_option_values_on_position; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_option_values_on_position ON spree_option_values USING btree ("position");


--
-- Name: index_spree_option_values_variants_on_variant_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_option_values_variants_on_variant_id ON spree_option_values_variants USING btree (variant_id);


--
-- Name: index_spree_order_mutexes_on_order_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE UNIQUE INDEX index_spree_order_mutexes_on_order_id ON spree_order_mutexes USING btree (order_id);


--
-- Name: index_spree_orders_on_approver_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_orders_on_approver_id ON spree_orders USING btree (approver_id);


--
-- Name: index_spree_orders_on_bill_address_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_orders_on_bill_address_id ON spree_orders USING btree (bill_address_id);


--
-- Name: index_spree_orders_on_completed_at; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_orders_on_completed_at ON spree_orders USING btree (completed_at);


--
-- Name: index_spree_orders_on_created_by_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_orders_on_created_by_id ON spree_orders USING btree (created_by_id);


--
-- Name: index_spree_orders_on_guest_token; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_orders_on_guest_token ON spree_orders USING btree (guest_token);


--
-- Name: index_spree_orders_on_number; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_orders_on_number ON spree_orders USING btree (number);


--
-- Name: index_spree_orders_on_ship_address_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_orders_on_ship_address_id ON spree_orders USING btree (ship_address_id);


--
-- Name: index_spree_orders_on_user_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_orders_on_user_id ON spree_orders USING btree (user_id);


--
-- Name: index_spree_orders_on_user_id_and_created_by_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_orders_on_user_id_and_created_by_id ON spree_orders USING btree (user_id, created_by_id);


--
-- Name: index_spree_orders_promotions_on_order_id_and_promotion_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_orders_promotions_on_order_id_and_promotion_id ON spree_orders_promotions USING btree (order_id, promotion_id);


--
-- Name: index_spree_orders_promotions_on_promotion_code_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_orders_promotions_on_promotion_code_id ON spree_orders_promotions USING btree (promotion_code_id);


--
-- Name: index_spree_payment_capture_events_on_payment_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_payment_capture_events_on_payment_id ON spree_payment_capture_events USING btree (payment_id);


--
-- Name: index_spree_payment_methods_on_id_and_type; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_payment_methods_on_id_and_type ON spree_payment_methods USING btree (id, type);


--
-- Name: index_spree_payments_on_order_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_payments_on_order_id ON spree_payments USING btree (order_id);


--
-- Name: index_spree_payments_on_payment_method_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_payments_on_payment_method_id ON spree_payments USING btree (payment_method_id);


--
-- Name: index_spree_payments_on_source_id_and_source_type; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_payments_on_source_id_and_source_type ON spree_payments USING btree (source_id, source_type);


--
-- Name: index_spree_preferences_on_key; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE UNIQUE INDEX index_spree_preferences_on_key ON spree_preferences USING btree (key);


--
-- Name: index_spree_prices_on_country_iso; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_prices_on_country_iso ON spree_prices USING btree (country_iso);


--
-- Name: index_spree_prices_on_variant_id_and_currency; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_prices_on_variant_id_and_currency ON spree_prices USING btree (variant_id, currency);


--
-- Name: index_spree_product_option_types_on_option_type_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_product_option_types_on_option_type_id ON spree_product_option_types USING btree (option_type_id);


--
-- Name: index_spree_product_option_types_on_position; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_product_option_types_on_position ON spree_product_option_types USING btree ("position");


--
-- Name: index_spree_product_option_types_on_product_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_product_option_types_on_product_id ON spree_product_option_types USING btree (product_id);


--
-- Name: index_spree_product_properties_on_position; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_product_properties_on_position ON spree_product_properties USING btree ("position");


--
-- Name: index_spree_product_properties_on_property_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_product_properties_on_property_id ON spree_product_properties USING btree (property_id);


--
-- Name: index_spree_product_property_translations_on_locale; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_product_property_translations_on_locale ON spree_product_property_translations USING btree (locale);


--
-- Name: index_spree_product_translations_on_deleted_at; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_product_translations_on_deleted_at ON spree_product_translations USING btree (deleted_at);


--
-- Name: index_spree_product_translations_on_locale; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_product_translations_on_locale ON spree_product_translations USING btree (locale);


--
-- Name: index_spree_product_translations_on_spree_product_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_product_translations_on_spree_product_id ON spree_product_translations USING btree (spree_product_id);


--
-- Name: index_spree_products_on_available_on; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_products_on_available_on ON spree_products USING btree (available_on);


--
-- Name: index_spree_products_on_deleted_at; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_products_on_deleted_at ON spree_products USING btree (deleted_at);


--
-- Name: index_spree_products_on_name; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_products_on_name ON spree_products USING btree (name);


--
-- Name: index_spree_products_on_slug; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE UNIQUE INDEX index_spree_products_on_slug ON spree_products USING btree (slug);


--
-- Name: index_spree_products_taxons_on_position; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_products_taxons_on_position ON spree_products_taxons USING btree ("position");


--
-- Name: index_spree_products_taxons_on_product_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_products_taxons_on_product_id ON spree_products_taxons USING btree (product_id);


--
-- Name: index_spree_products_taxons_on_taxon_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_products_taxons_on_taxon_id ON spree_products_taxons USING btree (taxon_id);


--
-- Name: index_spree_promotion_action_line_items_on_promotion_action_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_promotion_action_line_items_on_promotion_action_id ON spree_promotion_action_line_items USING btree (promotion_action_id);


--
-- Name: index_spree_promotion_action_line_items_on_variant_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_promotion_action_line_items_on_variant_id ON spree_promotion_action_line_items USING btree (variant_id);


--
-- Name: index_spree_promotion_actions_on_deleted_at; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_promotion_actions_on_deleted_at ON spree_promotion_actions USING btree (deleted_at);


--
-- Name: index_spree_promotion_actions_on_id_and_type; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_promotion_actions_on_id_and_type ON spree_promotion_actions USING btree (id, type);


--
-- Name: index_spree_promotion_actions_on_promotion_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_promotion_actions_on_promotion_id ON spree_promotion_actions USING btree (promotion_id);


--
-- Name: index_spree_promotion_codes_on_promotion_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_promotion_codes_on_promotion_id ON spree_promotion_codes USING btree (promotion_id);


--
-- Name: index_spree_promotion_codes_on_value; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE UNIQUE INDEX index_spree_promotion_codes_on_value ON spree_promotion_codes USING btree (value);


--
-- Name: index_spree_promotion_rule_taxons_on_promotion_rule_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_promotion_rule_taxons_on_promotion_rule_id ON spree_promotion_rule_taxons USING btree (promotion_rule_id);


--
-- Name: index_spree_promotion_rule_taxons_on_taxon_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_promotion_rule_taxons_on_taxon_id ON spree_promotion_rule_taxons USING btree (taxon_id);


--
-- Name: index_spree_promotion_rules_on_promotion_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_promotion_rules_on_promotion_id ON spree_promotion_rules USING btree (promotion_id);


--
-- Name: index_spree_promotion_translations_on_locale; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_promotion_translations_on_locale ON spree_promotion_translations USING btree (locale);


--
-- Name: index_spree_promotion_translations_on_spree_promotion_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_promotion_translations_on_spree_promotion_id ON spree_promotion_translations USING btree (spree_promotion_id);


--
-- Name: index_spree_promotions_on_advertise; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_promotions_on_advertise ON spree_promotions USING btree (advertise);


--
-- Name: index_spree_promotions_on_apply_automatically; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_promotions_on_apply_automatically ON spree_promotions USING btree (apply_automatically);


--
-- Name: index_spree_promotions_on_code; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_promotions_on_code ON spree_promotions USING btree (code);


--
-- Name: index_spree_promotions_on_expires_at; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_promotions_on_expires_at ON spree_promotions USING btree (expires_at);


--
-- Name: index_spree_promotions_on_id_and_type; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_promotions_on_id_and_type ON spree_promotions USING btree (id, type);


--
-- Name: index_spree_promotions_on_promotion_category_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_promotions_on_promotion_category_id ON spree_promotions USING btree (promotion_category_id);


--
-- Name: index_spree_promotions_on_starts_at; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_promotions_on_starts_at ON spree_promotions USING btree (starts_at);


--
-- Name: index_spree_property_translations_on_locale; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_property_translations_on_locale ON spree_property_translations USING btree (locale);


--
-- Name: index_spree_property_translations_on_spree_property_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_property_translations_on_spree_property_id ON spree_property_translations USING btree (spree_property_id);


--
-- Name: index_spree_prototype_taxons_on_prototype_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_prototype_taxons_on_prototype_id ON spree_prototype_taxons USING btree (prototype_id);


--
-- Name: index_spree_prototype_taxons_on_taxon_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_prototype_taxons_on_taxon_id ON spree_prototype_taxons USING btree (taxon_id);


--
-- Name: index_spree_refunds_on_payment_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_refunds_on_payment_id ON spree_refunds USING btree (payment_id);


--
-- Name: index_spree_refunds_on_reimbursement_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_refunds_on_reimbursement_id ON spree_refunds USING btree (reimbursement_id);


--
-- Name: index_spree_reimbursement_types_on_type; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_reimbursement_types_on_type ON spree_reimbursement_types USING btree (type);


--
-- Name: index_spree_reimbursements_on_customer_return_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_reimbursements_on_customer_return_id ON spree_reimbursements USING btree (customer_return_id);


--
-- Name: index_spree_reimbursements_on_order_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_reimbursements_on_order_id ON spree_reimbursements USING btree (order_id);


--
-- Name: index_spree_return_items_on_exchange_inventory_unit_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_return_items_on_exchange_inventory_unit_id ON spree_return_items USING btree (exchange_inventory_unit_id);


--
-- Name: index_spree_roles_users_on_role_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_roles_users_on_role_id ON spree_roles_users USING btree (role_id);


--
-- Name: index_spree_roles_users_on_user_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_roles_users_on_user_id ON spree_roles_users USING btree (user_id);


--
-- Name: index_spree_shipments_on_deprecated_address_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_shipments_on_deprecated_address_id ON spree_shipments USING btree (deprecated_address_id);


--
-- Name: index_spree_shipments_on_order_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_shipments_on_order_id ON spree_shipments USING btree (order_id);


--
-- Name: index_spree_shipments_on_stock_location_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_shipments_on_stock_location_id ON spree_shipments USING btree (stock_location_id);


--
-- Name: index_spree_shipping_method_categories_on_shipping_method_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_shipping_method_categories_on_shipping_method_id ON spree_shipping_method_categories USING btree (shipping_method_id);


--
-- Name: index_spree_shipping_method_translations_on_locale; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_shipping_method_translations_on_locale ON spree_shipping_method_translations USING btree (locale);


--
-- Name: index_spree_shipping_methods_on_tax_category_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_shipping_methods_on_tax_category_id ON spree_shipping_methods USING btree (tax_category_id);


--
-- Name: index_spree_shipping_rate_taxes_on_shipping_rate_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_shipping_rate_taxes_on_shipping_rate_id ON spree_shipping_rate_taxes USING btree (shipping_rate_id);


--
-- Name: index_spree_shipping_rate_taxes_on_tax_rate_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_shipping_rate_taxes_on_tax_rate_id ON spree_shipping_rate_taxes USING btree (tax_rate_id);


--
-- Name: index_spree_state_changes_on_stateful_id_and_stateful_type; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_state_changes_on_stateful_id_and_stateful_type ON spree_state_changes USING btree (stateful_id, stateful_type);


--
-- Name: index_spree_state_changes_on_user_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_state_changes_on_user_id ON spree_state_changes USING btree (user_id);


--
-- Name: index_spree_states_on_country_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_states_on_country_id ON spree_states USING btree (country_id);


--
-- Name: index_spree_stock_items_on_deleted_at; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_stock_items_on_deleted_at ON spree_stock_items USING btree (deleted_at);


--
-- Name: index_spree_stock_items_on_stock_location_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_stock_items_on_stock_location_id ON spree_stock_items USING btree (stock_location_id);


--
-- Name: index_spree_stock_items_on_variant_id_and_stock_location_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE UNIQUE INDEX index_spree_stock_items_on_variant_id_and_stock_location_id ON spree_stock_items USING btree (variant_id, stock_location_id) WHERE (deleted_at IS NULL);


--
-- Name: index_spree_stock_locations_on_country_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_stock_locations_on_country_id ON spree_stock_locations USING btree (country_id);


--
-- Name: index_spree_stock_locations_on_state_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_stock_locations_on_state_id ON spree_stock_locations USING btree (state_id);


--
-- Name: index_spree_stock_movements_on_stock_item_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_stock_movements_on_stock_item_id ON spree_stock_movements USING btree (stock_item_id);


--
-- Name: index_spree_stock_transfers_on_closed_at; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_stock_transfers_on_closed_at ON spree_stock_transfers USING btree (closed_at);


--
-- Name: index_spree_stock_transfers_on_destination_location_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_stock_transfers_on_destination_location_id ON spree_stock_transfers USING btree (destination_location_id);


--
-- Name: index_spree_stock_transfers_on_finalized_at; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_stock_transfers_on_finalized_at ON spree_stock_transfers USING btree (finalized_at);


--
-- Name: index_spree_stock_transfers_on_number; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_stock_transfers_on_number ON spree_stock_transfers USING btree (number);


--
-- Name: index_spree_stock_transfers_on_shipped_at; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_stock_transfers_on_shipped_at ON spree_stock_transfers USING btree (shipped_at);


--
-- Name: index_spree_stock_transfers_on_source_location_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_stock_transfers_on_source_location_id ON spree_stock_transfers USING btree (source_location_id);


--
-- Name: index_spree_store_credit_events_on_deleted_at; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_store_credit_events_on_deleted_at ON spree_store_credit_events USING btree (deleted_at);


--
-- Name: index_spree_store_credit_events_on_store_credit_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_store_credit_events_on_store_credit_id ON spree_store_credit_events USING btree (store_credit_id);


--
-- Name: index_spree_store_credit_types_on_priority; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_store_credit_types_on_priority ON spree_store_credit_types USING btree (priority);


--
-- Name: index_spree_store_credits_on_deleted_at; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_store_credits_on_deleted_at ON spree_store_credits USING btree (deleted_at);


--
-- Name: index_spree_store_credits_on_type_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_store_credits_on_type_id ON spree_store_credits USING btree (type_id);


--
-- Name: index_spree_store_credits_on_user_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_store_credits_on_user_id ON spree_store_credits USING btree (user_id);


--
-- Name: index_spree_store_payment_methods_on_payment_method_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_store_payment_methods_on_payment_method_id ON spree_store_payment_methods USING btree (payment_method_id);


--
-- Name: index_spree_store_payment_methods_on_store_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_store_payment_methods_on_store_id ON spree_store_payment_methods USING btree (store_id);


--
-- Name: index_spree_store_translations_on_locale; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_store_translations_on_locale ON spree_store_translations USING btree (locale);


--
-- Name: index_spree_store_translations_on_spree_store_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_store_translations_on_spree_store_id ON spree_store_translations USING btree (spree_store_id);


--
-- Name: index_spree_stores_on_code; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_stores_on_code ON spree_stores USING btree (code);


--
-- Name: index_spree_stores_on_default; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_stores_on_default ON spree_stores USING btree ("default");


--
-- Name: index_spree_tax_rates_on_deleted_at; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_tax_rates_on_deleted_at ON spree_tax_rates USING btree (deleted_at);


--
-- Name: index_spree_tax_rates_on_tax_category_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_tax_rates_on_tax_category_id ON spree_tax_rates USING btree (tax_category_id);


--
-- Name: index_spree_tax_rates_on_zone_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_tax_rates_on_zone_id ON spree_tax_rates USING btree (zone_id);


--
-- Name: index_spree_taxon_translations_on_locale; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_taxon_translations_on_locale ON spree_taxon_translations USING btree (locale);


--
-- Name: index_spree_taxon_translations_on_spree_taxon_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_taxon_translations_on_spree_taxon_id ON spree_taxon_translations USING btree (spree_taxon_id);


--
-- Name: index_spree_taxonomies_on_position; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_taxonomies_on_position ON spree_taxonomies USING btree ("position");


--
-- Name: index_spree_taxonomy_translations_on_locale; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_taxonomy_translations_on_locale ON spree_taxonomy_translations USING btree (locale);


--
-- Name: index_spree_taxonomy_translations_on_spree_taxonomy_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_taxonomy_translations_on_spree_taxonomy_id ON spree_taxonomy_translations USING btree (spree_taxonomy_id);


--
-- Name: index_spree_taxons_on_position; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_taxons_on_position ON spree_taxons USING btree ("position");


--
-- Name: index_spree_transfer_items_on_stock_transfer_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_transfer_items_on_stock_transfer_id ON spree_transfer_items USING btree (stock_transfer_id);


--
-- Name: index_spree_transfer_items_on_variant_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_transfer_items_on_variant_id ON spree_transfer_items USING btree (variant_id);


--
-- Name: index_spree_unit_cancels_on_inventory_unit_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_unit_cancels_on_inventory_unit_id ON spree_unit_cancels USING btree (inventory_unit_id);


--
-- Name: index_spree_user_addresses_on_address_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_user_addresses_on_address_id ON spree_user_addresses USING btree (address_id);


--
-- Name: index_spree_user_addresses_on_user_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_user_addresses_on_user_id ON spree_user_addresses USING btree (user_id);


--
-- Name: index_spree_user_addresses_on_user_id_and_address_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE UNIQUE INDEX index_spree_user_addresses_on_user_id_and_address_id ON spree_user_addresses USING btree (user_id, address_id);


--
-- Name: index_spree_user_stock_locations_on_user_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_user_stock_locations_on_user_id ON spree_user_stock_locations USING btree (user_id);


--
-- Name: index_spree_users_on_deleted_at; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_users_on_deleted_at ON spree_users USING btree (deleted_at);


--
-- Name: index_spree_users_on_spree_api_key; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_users_on_spree_api_key ON spree_users USING btree (spree_api_key);


--
-- Name: index_spree_variant_prop_rule_conditions_on_rule_and_optval; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_variant_prop_rule_conditions_on_rule_and_optval ON spree_variant_property_rule_conditions USING btree (variant_property_rule_id, option_value_id);


--
-- Name: index_spree_variant_property_rule_values_on_property_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_variant_property_rule_values_on_property_id ON spree_variant_property_rule_values USING btree (property_id);


--
-- Name: index_spree_variant_property_rule_values_on_rule; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_variant_property_rule_values_on_rule ON spree_variant_property_rule_values USING btree (variant_property_rule_id);


--
-- Name: index_spree_variant_property_rules_on_product_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_variant_property_rules_on_product_id ON spree_variant_property_rules USING btree (product_id);


--
-- Name: index_spree_variants_on_position; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_variants_on_position ON spree_variants USING btree ("position");


--
-- Name: index_spree_variants_on_product_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_variants_on_product_id ON spree_variants USING btree (product_id);


--
-- Name: index_spree_variants_on_sku; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_variants_on_sku ON spree_variants USING btree (sku);


--
-- Name: index_spree_variants_on_tax_category_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_variants_on_tax_category_id ON spree_variants USING btree (tax_category_id);


--
-- Name: index_spree_variants_on_track_inventory; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_variants_on_track_inventory ON spree_variants USING btree (track_inventory);


--
-- Name: index_spree_zone_members_on_zone_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_zone_members_on_zone_id ON spree_zone_members USING btree (zone_id);


--
-- Name: index_spree_zone_members_on_zoneable_id_and_zoneable_type; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_spree_zone_members_on_zoneable_id_and_zoneable_type ON spree_zone_members USING btree (zoneable_id, zoneable_type);


--
-- Name: index_taxons_on_parent_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_taxons_on_parent_id ON spree_taxons USING btree (parent_id);


--
-- Name: index_taxons_on_permalink; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_taxons_on_permalink ON spree_taxons USING btree (permalink);


--
-- Name: index_taxons_on_taxonomy_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX index_taxons_on_taxonomy_id ON spree_taxons USING btree (taxonomy_id);


--
-- Name: shipping_method_id_spree_sm_sl; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX shipping_method_id_spree_sm_sl ON spree_shipping_method_stock_locations USING btree (shipping_method_id);


--
-- Name: spree_shipping_rates_join_index; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE UNIQUE INDEX spree_shipping_rates_join_index ON spree_shipping_rates USING btree (shipment_id, shipping_method_id);


--
-- Name: sstock_location_id_spree_sm_sl; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX sstock_location_id_spree_sm_sl ON spree_shipping_method_stock_locations USING btree (stock_location_id);


--
-- Name: stock_item_by_loc_and_var_id; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE INDEX stock_item_by_loc_and_var_id ON spree_stock_items USING btree (stock_location_id, variant_id);


--
-- Name: unique_spree_shipping_method_categories; Type: INDEX; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE UNIQUE INDEX unique_spree_shipping_method_categories ON spree_shipping_method_categories USING btree (shipping_category_id, shipping_method_id);


--
-- Name: fk_rails_5f722a205b; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_shipping_method_stock_locations
    ADD CONSTRAINT fk_rails_5f722a205b FOREIGN KEY (stock_location_id) REFERENCES spree_stock_locations(id);


--
-- Name: fk_rails_64c6b66d98; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_prototype_taxons
    ADD CONSTRAINT fk_rails_64c6b66d98 FOREIGN KEY (prototype_id) REFERENCES spree_prototypes(id);


--
-- Name: fk_rails_bf4245c753; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_shipping_method_stock_locations
    ADD CONSTRAINT fk_rails_bf4245c753 FOREIGN KEY (shipping_method_id) REFERENCES spree_shipping_methods(id);


--
-- Name: fk_rails_cd36696389; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_product_promotion_rules
    ADD CONSTRAINT fk_rails_cd36696389 FOREIGN KEY (product_id) REFERENCES spree_products(id);


--
-- Name: fk_rails_d3da4db5c5; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_prototype_taxons
    ADD CONSTRAINT fk_rails_d3da4db5c5 FOREIGN KEY (taxon_id) REFERENCES spree_taxons(id);


--
-- Name: fk_rails_f4bc451ee6; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_product_promotion_rules
    ADD CONSTRAINT fk_rails_f4bc451ee6 FOREIGN KEY (promotion_rule_id) REFERENCES spree_promotion_rules(id);


--
-- Name: fk_spree_adjustments_order_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY spree_adjustments
    ADD CONSTRAINT fk_spree_adjustments_order_id FOREIGN KEY (order_id) REFERENCES spree_orders(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


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

