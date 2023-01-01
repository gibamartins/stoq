--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

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

--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: account_transaction_operation_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.account_transaction_operation_type AS ENUM (
    'in',
    'out'
);


ALTER TYPE public.account_transaction_operation_type OWNER TO postgres;

--
-- Name: account_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.account_type AS ENUM (
    'bank',
    'cash',
    'asset',
    'credit',
    'income',
    'expense',
    'equity'
);


ALTER TYPE public.account_type OWNER TO postgres;

--
-- Name: certificate_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.certificate_type AS ENUM (
    'pkcs11',
    'pkcs12'
);


ALTER TYPE public.certificate_type OWNER TO postgres;

--
-- Name: client_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.client_status AS ENUM (
    'solvent',
    'indebt',
    'insolvent',
    'inactive'
);


ALTER TYPE public.client_status OWNER TO postgres;

--
-- Name: credit_card_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.credit_card_type AS ENUM (
    'credit',
    'debit',
    'credit-inst-store',
    'credit-inst-provider',
    'debit-pre-dated',
    'voucher'
);


ALTER TYPE public.credit_card_type OWNER TO postgres;

--
-- Name: credit_check_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.credit_check_status AS ENUM (
    'included',
    'not-included'
);


ALTER TYPE public.credit_check_status OWNER TO postgres;

--
-- Name: delivery_freight_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.delivery_freight_type AS ENUM (
    'cif',
    'fob',
    '3rdparty'
);


ALTER TYPE public.delivery_freight_type OWNER TO postgres;

--
-- Name: delivery_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.delivery_status AS ENUM (
    'initial',
    'sent',
    'received',
    'picked',
    'packed',
    'cancelled'
);


ALTER TYPE public.delivery_status OWNER TO postgres;

--
-- Name: employee_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.employee_status AS ENUM (
    'normal',
    'away',
    'vacation',
    'off'
);


ALTER TYPE public.employee_status OWNER TO postgres;

--
-- Name: event_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.event_type AS ENUM (
    'system',
    'user',
    'order',
    'sale',
    'payment'
);


ALTER TYPE public.event_type OWNER TO postgres;

--
-- Name: individual_gender; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.individual_gender AS ENUM (
    'male',
    'female'
);


ALTER TYPE public.individual_gender OWNER TO postgres;

--
-- Name: inventory_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.inventory_status AS ENUM (
    'open',
    'closed',
    'cancelled'
);


ALTER TYPE public.inventory_status OWNER TO postgres;

--
-- Name: invoice_mode; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.invoice_mode AS ENUM (
    'nfe',
    'nfce',
    'legacy'
);


ALTER TYPE public.invoice_mode OWNER TO postgres;

--
-- Name: invoice_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.invoice_type AS ENUM (
    'in',
    'out'
);


ALTER TYPE public.invoice_type OWNER TO postgres;

--
-- Name: loan_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.loan_status AS ENUM (
    'open',
    'closed'
);


ALTER TYPE public.loan_status OWNER TO postgres;

--
-- Name: marital_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.marital_status AS ENUM (
    'single',
    'married',
    'divorced',
    'widowed',
    'separated',
    'cohabitation'
);


ALTER TYPE public.marital_status OWNER TO postgres;

--
-- Name: payment_category_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.payment_category_type AS ENUM (
    'payable',
    'receivable'
);


ALTER TYPE public.payment_category_type OWNER TO postgres;

--
-- Name: payment_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.payment_status AS ENUM (
    'preview',
    'pending',
    'paid',
    'reviewing',
    'confirmed',
    'cancelled'
);


ALTER TYPE public.payment_status OWNER TO postgres;

--
-- Name: payment_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.payment_type AS ENUM (
    'in',
    'out'
);


ALTER TYPE public.payment_type OWNER TO postgres;

--
-- Name: product_cofins_template_calculo; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.product_cofins_template_calculo AS ENUM (
    'percentage',
    'value'
);


ALTER TYPE public.product_cofins_template_calculo OWNER TO postgres;

--
-- Name: product_ipi_template_calculo; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.product_ipi_template_calculo AS ENUM (
    'aliquot',
    'unit'
);


ALTER TYPE public.product_ipi_template_calculo OWNER TO postgres;

--
-- Name: product_pis_template_calculo; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.product_pis_template_calculo AS ENUM (
    'percentage',
    'value'
);


ALTER TYPE public.product_pis_template_calculo OWNER TO postgres;

--
-- Name: product_quality_test_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.product_quality_test_type AS ENUM (
    'boolean',
    'decimal'
);


ALTER TYPE public.product_quality_test_type OWNER TO postgres;

--
-- Name: product_tax_template_tax_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.product_tax_template_tax_type AS ENUM (
    'icms',
    'ipi',
    'pis',
    'cofins'
);


ALTER TYPE public.product_tax_template_tax_type OWNER TO postgres;

--
-- Name: production_order_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.production_order_status AS ENUM (
    'opened',
    'waiting',
    'producing',
    'closed',
    'quality-assurance',
    'cancelled'
);


ALTER TYPE public.production_order_status OWNER TO postgres;

--
-- Name: purchase_order_freight_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.purchase_order_freight_type AS ENUM (
    'fob',
    'cif'
);


ALTER TYPE public.purchase_order_freight_type OWNER TO postgres;

--
-- Name: purchase_order_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.purchase_order_status AS ENUM (
    'quoting',
    'pending',
    'confirmed',
    'consigned',
    'cancelled',
    'closed'
);


ALTER TYPE public.purchase_order_status OWNER TO postgres;

--
-- Name: receiving_order_freight_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.receiving_order_freight_type AS ENUM (
    'fob-payment',
    'fob-installments',
    'cif-unknown',
    'cif-invoice'
);


ALTER TYPE public.receiving_order_freight_type OWNER TO postgres;

--
-- Name: receiving_order_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.receiving_order_status AS ENUM (
    'pending',
    'closed'
);


ALTER TYPE public.receiving_order_status OWNER TO postgres;

--
-- Name: returned_sale_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.returned_sale_status AS ENUM (
    'pending',
    'confirmed',
    'cancelled'
);


ALTER TYPE public.returned_sale_status OWNER TO postgres;

--
-- Name: sale_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.sale_status AS ENUM (
    'initial',
    'quote',
    'ordered',
    'confirmed',
    'cancelled',
    'returned',
    'renegotiated'
);


ALTER TYPE public.sale_status OWNER TO postgres;

--
-- Name: sale_token_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.sale_token_status AS ENUM (
    'available',
    'occupied'
);


ALTER TYPE public.sale_token_status OWNER TO postgres;

--
-- Name: sellable_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.sellable_status AS ENUM (
    'available',
    'closed'
);


ALTER TYPE public.sellable_status OWNER TO postgres;

--
-- Name: stock_decrease_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.stock_decrease_status AS ENUM (
    'initial',
    'confirmed'
);


ALTER TYPE public.stock_decrease_status OWNER TO postgres;

--
-- Name: stock_transaction_history_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.stock_transaction_history_type AS ENUM (
    'initial',
    'sell',
    'returned-sale',
    'cancelled-sale',
    'received-purchase',
    'returned-loan',
    'loan',
    'production-allocated',
    'production-produced',
    'production-returned',
    'stock-decrease',
    'transfer-from',
    'transfer-to',
    'inventory-adjust',
    'production-sent',
    'imported',
    'consignment-returned',
    'wo-used',
    'wo-returned-to-stock',
    'sale-reserved',
    'manual-adjust',
    'update-stock-cost',
    'sale-return-to-stock',
    'undo-returned-sale',
    'cancelled-transfer',
    'cancelled-loan',
    'cancelled-stock-decrease',
    'cancelled-inventory-adjust'
);


ALTER TYPE public.stock_transaction_history_type OWNER TO postgres;

--
-- Name: supplier_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.supplier_status AS ENUM (
    'active',
    'inactive',
    'blocked'
);


ALTER TYPE public.supplier_status OWNER TO postgres;

--
-- Name: till_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.till_status AS ENUM (
    'pending',
    'open',
    'closed',
    'verified'
);


ALTER TYPE public.till_status OWNER TO postgres;

--
-- Name: transfer_order_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.transfer_order_status AS ENUM (
    'pending',
    'sent',
    'received',
    'cancelled'
);


ALTER TYPE public.transfer_order_status OWNER TO postgres;

--
-- Name: work_order_package_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.work_order_package_status AS ENUM (
    'opened',
    'sent',
    'received'
);


ALTER TYPE public.work_order_package_status OWNER TO postgres;

--
-- Name: work_order_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.work_order_status AS ENUM (
    'opened',
    'cancelled',
    'waiting',
    'in-progress',
    'finished',
    'delivered'
);


ALTER TYPE public.work_order_status OWNER TO postgres;

--
-- Name: new_te(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.new_te(table_name text DEFAULT ''::text) RETURNS integer
    LANGUAGE plpgsql
    AS $$
    DECLARE te_id integer;
BEGIN
    INSERT INTO transaction_entry (te_time) VALUES (STATEMENT_TIMESTAMP()) RETURNING id INTO te_id;
    PERFORM pg_notify('new_te', te_id::text || ',' || table_name);
    RETURN te_id;
END;
$$;


ALTER FUNCTION public.new_te(table_name text) OWNER TO postgres;

--
-- Name: stoq_normalize_string(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.stoq_normalize_string(input_string text) RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$
BEGIN
  return LOWER(public.unaccent(input_string));
END;
$$;


ALTER FUNCTION public.stoq_normalize_string(input_string text) OWNER TO postgres;

--
-- Name: update_te(bigint, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_te(te_id bigint, table_name text DEFAULT ''::text) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
    UPDATE transaction_entry SET te_time = STATEMENT_TIMESTAMP(), sync_status = DEFAULT
        WHERE id = $1;
    PERFORM pg_notify('update_te', te_id::text || ',' || table_name);
END;
$_$;


ALTER FUNCTION public.update_te(te_id bigint, table_name text) OWNER TO postgres;

--
-- Name: upsert_stock_item(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.upsert_stock_item() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    stock_cost_ numeric(20, 8);
    psi product_stock_item%ROWTYPE;
BEGIN

    CREATE TEMPORARY TABLE __inserting_sth (warning_note text NOT NULL);
    INSERT INTO __inserting_sth (warning_note) VALUES
        (E'I SHOULD ONLY INSERT OR UPDATE DATA ON PRODUCT_STOCK_ITEM BY ' ||
         E'INSERTING A ROW ON STOCK_TRANSACTION_HISTORY, OTHERWISE MY ' ||
         E'DATABASE WILL BECOME INCONSISTENT. I\'M HEREBY WARNED');

    IF NEW.batch_id IS NOT NULL THEN
        SELECT * INTO psi FROM product_stock_item
            WHERE branch_id = NEW.branch_id AND
                  batch_id = NEW.batch_id AND
                  storable_id = NEW.storable_id;
    ELSE
        SELECT * INTO psi FROM product_stock_item
            WHERE branch_id = NEW.branch_id AND
                  storable_id = NEW.storable_id;
    END IF;

    IF FOUND THEN
        IF NEW.type = 'manual-adjust' THEN
            -- Manual adjusts will not alter the quantity of the stock item.
            -- They are used only to adjust any divergence between the sum of the
            -- transactions quantities and the actual quantity on the stock item.
            IF NEW.unit_cost IS NULL THEN
                RAISE EXCEPTION 'unit_cost cannot be NULL on manual-adjust transactions';
            END IF;
            NEW.stock_cost := NEW.unit_cost;
            DROP TABLE __inserting_sth;
            RETURN NEW;
        ELSIF NEW.quantity > 0 AND NEW.unit_cost IS NOT NULL THEN
            -- Only update the cost if increasing the stock and the new unit_cost is provided
            -- Removing an item from stock does not change the stock cost.
            stock_cost_ := (((psi.quantity * psi.stock_cost) + (NEW.quantity * NEW.unit_cost)) /
                            (psi.quantity + NEW.quantity));
        ELSIF NEW.type = 'update-stock-cost' THEN
            IF NEW.quantity != 0 THEN
                RAISE EXCEPTION 'quantity need to be 0 for update-stock-cost transactions';
            END IF;
            stock_cost_ := NEW.unit_cost;
        ELSE
            stock_cost_ := psi.stock_cost;
        END IF;

        NEW.stock_cost := stock_cost_;
        UPDATE product_stock_item SET
                quantity = quantity + NEW.quantity,
                stock_cost = stock_cost_
            WHERE id = psi.id;
    ELSE
        -- Make sure that update-stock-cost only happens for existing
        -- product_stock_items
        IF NEW.type IN ('manual-adjust', 'update-stock-cost') THEN
            RAISE EXCEPTION 'Cannot adjust stock/cost of non-existing product_stock_item';
        END IF;

        -- In this case, this is the first transaction history for this
        -- stock item. There's no stock_cost calculation to do as it will be
        -- equal to the unit_cost itself
        INSERT INTO product_stock_item
                (storable_id, batch_id, branch_id,
                 stock_cost, quantity)
            VALUES
                (NEW.storable_id, NEW.batch_id, NEW.branch_id,
                 COALESCE(NEW.unit_cost, 0), NEW.quantity)
            RETURNING * INTO psi;
        NEW.stock_cost := psi.stock_cost;
    END IF;

    DROP TABLE __inserting_sth;

    RETURN NEW;
END;
$$;


ALTER FUNCTION public.upsert_stock_item() OWNER TO postgres;

--
-- Name: validate_stock_item(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.validate_stock_item() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    count_ int;
    errmsg text;
BEGIN
    -- Only allow updates that are not touching quantity/stock_cost
    IF (TG_OP = 'UPDATE' AND
        NEW.quantity = OLD.quantity AND
        NEW.stock_cost = OLD.stock_cost) THEN
        RETURN NEW;
    END IF;

    BEGIN
        SELECT COUNT(1) INTO count_ FROM __inserting_sth
            WHERE warning_note = (
                E'I SHOULD ONLY INSERT OR UPDATE DATA ON PRODUCT_STOCK_ITEM BY ' ||
                E'INSERTING A ROW ON STOCK_TRANSACTION_HISTORY, OTHERWISE MY ' ||
                E'DATABASE WILL BECOME INCONSISTENT. I\'M HEREBY WARNED');
    EXCEPTION WHEN undefined_table THEN
        count_ := 0;
    END;

    IF count_ = 0 THEN
        -- Postgresql will give us a syntaxerror if we try to break
        -- the string in the RAISE EXCEPTION statement
        errmsg := ('product_stock_item should not be inserted or have its ' ||
                   'quantity/stock_cost columns updated manually. ' ||
                   'To do that, insert a row on stock_transaction_history');
        RAISE EXCEPTION '%', errmsg;
    END IF;

    RETURN NEW;
END;
$$;


ALTER FUNCTION public.validate_stock_item() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: access_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.access_token (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te(),
    token text NOT NULL,
    issue_date timestamp without time zone NOT NULL,
    revoked boolean DEFAULT false,
    user_id uuid NOT NULL,
    station_id uuid NOT NULL
);


ALTER TABLE public.access_token OWNER TO postgres;

--
-- Name: account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('account'::text),
    account_type public.account_type NOT NULL,
    description text NOT NULL,
    code text,
    parent_id uuid,
    station_id uuid
);


ALTER TABLE public.account OWNER TO postgres;

--
-- Name: account_transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_transaction (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('account_transaction'::text),
    description text,
    code text,
    operation_type public.account_transaction_operation_type NOT NULL,
    value numeric(20,2),
    source_account_id uuid NOT NULL,
    account_id uuid NOT NULL,
    date timestamp without time zone NOT NULL,
    payment_id uuid,
    CONSTRAINT positive_value CHECK ((value >= (0)::numeric))
);


ALTER TABLE public.account_transaction OWNER TO postgres;

--
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('address'::text),
    street text,
    streetnumber integer,
    district text,
    postal_code text,
    complement text,
    is_main_address boolean,
    person_id uuid,
    city_location_id bigint,
    coordinates point,
    CONSTRAINT positive_streetnumber CHECK ((streetnumber > 0))
);


ALTER TABLE public.address OWNER TO postgres;

--
-- Name: attachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attachment (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('attachment'::text),
    name text NOT NULL,
    mimetype text,
    blob bytea
);


ALTER TABLE public.attachment OWNER TO postgres;

--
-- Name: bank_account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bank_account (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('bank_account'::text),
    bank_number integer,
    bank_branch text,
    bank_account text,
    bank_type bigint,
    account_id uuid,
    CONSTRAINT positive_bank_number CHECK ((bank_number >= 0))
);


ALTER TABLE public.bank_account OWNER TO postgres;

--
-- Name: bill_option; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bill_option (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('bill_option'::text),
    option text,
    value text,
    bank_account_id uuid
);


ALTER TABLE public.bill_option OWNER TO postgres;

--
-- Name: branch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.branch (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('branch'::text),
    manager_id uuid,
    is_active boolean,
    crt integer DEFAULT 1,
    acronym text,
    can_execute_foreign_work_orders boolean DEFAULT false,
    person_id uuid,
    name text,
    certificate_id uuid,
    default_client_category_id uuid,
    CONSTRAINT acronym_not_empty CHECK ((acronym <> ''::text))
);


ALTER TABLE public.branch OWNER TO postgres;

--
-- Name: branch_station; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.branch_station (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('branch_station'::text),
    name text,
    is_active boolean,
    branch_id uuid,
    code text DEFAULT ''::text,
    type_id uuid,
    has_kps_enabled boolean DEFAULT false NOT NULL
);


ALTER TABLE public.branch_station OWNER TO postgres;

--
-- Name: branch_synchronization; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.branch_synchronization (
    id bigint NOT NULL,
    sync_time timestamp without time zone NOT NULL,
    policy text NOT NULL,
    branch_id uuid NOT NULL
);


ALTER TABLE public.branch_synchronization OWNER TO postgres;

--
-- Name: branch_synchronization_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.branch_synchronization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.branch_synchronization_id_seq OWNER TO postgres;

--
-- Name: branch_synchronization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.branch_synchronization_id_seq OWNED BY public.branch_synchronization.id;


--
-- Name: calls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.calls (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('calls'::text),
    date timestamp without time zone,
    message text,
    description text,
    person_id uuid,
    attendant_id uuid
);


ALTER TABLE public.calls OWNER TO postgres;

--
-- Name: card_operation_cost; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.card_operation_cost (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('card_operation_cost'::text),
    device_id uuid,
    provider_id uuid,
    card_type public.credit_card_type NOT NULL,
    installment_start integer,
    installment_end integer,
    payment_days integer,
    fee numeric(10,2),
    fare numeric(20,2),
    CONSTRAINT card_operation_cost_payment_days_check CHECK ((payment_days >= 0)),
    CONSTRAINT positive_installment_end CHECK ((installment_end >= 1)),
    CONSTRAINT positive_installment_start CHECK ((installment_start >= 1)),
    CONSTRAINT valid_installment_range CHECK ((installment_start <= installment_end))
);


ALTER TABLE public.card_operation_cost OWNER TO postgres;

--
-- Name: card_payment_device; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.card_payment_device (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('card_payment_device'::text),
    monthly_cost numeric(20,2),
    description text,
    supplier_id uuid
);


ALTER TABLE public.card_payment_device OWNER TO postgres;

--
-- Name: certificate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.certificate (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('certificate'::text),
    active boolean DEFAULT true,
    name text DEFAULT ''::text,
    type public.certificate_type NOT NULL,
    password bytea,
    content bytea,
    encrypted_password bytea
);


ALTER TABLE public.certificate OWNER TO postgres;

--
-- Name: cfop_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cfop_data (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('cfop_data'::text),
    code text,
    description text
);


ALTER TABLE public.cfop_data OWNER TO postgres;

--
-- Name: check_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.check_data (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('check_data'::text),
    payment_id uuid,
    bank_account_id uuid
);


ALTER TABLE public.check_data OWNER TO postgres;

--
-- Name: city_location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.city_location (
    id bigint NOT NULL,
    country text,
    city text,
    state text,
    city_code integer,
    state_code integer
);


ALTER TABLE public.city_location OWNER TO postgres;

--
-- Name: city_location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.city_location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_location_id_seq OWNER TO postgres;

--
-- Name: city_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.city_location_id_seq OWNED BY public.city_location.id;


--
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('client'::text),
    status public.client_status NOT NULL,
    days_late integer,
    credit_limit numeric(20,2) DEFAULT 0,
    salary numeric(20,2) DEFAULT 0,
    person_id uuid,
    category_id uuid,
    CONSTRAINT positive_credit_limit CHECK ((credit_limit >= (0)::numeric)),
    CONSTRAINT positive_days_late CHECK ((days_late >= 0)),
    CONSTRAINT positive_salary CHECK ((salary >= (0)::numeric))
);


ALTER TABLE public.client OWNER TO postgres;

--
-- Name: client_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_category (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('client_category'::text),
    name text,
    max_discount numeric(10,2) DEFAULT 0,
    CONSTRAINT valid_max_discount CHECK (((max_discount >= (0)::numeric) AND (max_discount <= (100)::numeric)))
);


ALTER TABLE public.client_category OWNER TO postgres;

--
-- Name: client_category_price; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_category_price (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('client_category_price'::text),
    sellable_id uuid,
    category_id uuid,
    price numeric(10,2),
    max_discount numeric(10,2),
    commission numeric(10,2),
    CONSTRAINT positive_price CHECK ((price >= (0)::numeric))
);


ALTER TABLE public.client_category_price OWNER TO postgres;

--
-- Name: client_salary_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_salary_history (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('client_salary_history'::text),
    date timestamp without time zone,
    new_salary numeric(20,2) DEFAULT 0,
    old_salary numeric(20,2) DEFAULT 0,
    user_id uuid,
    client_id uuid,
    CONSTRAINT positive_new_salary CHECK ((new_salary >= (0)::numeric)),
    CONSTRAINT positive_old_salary CHECK ((old_salary >= (0)::numeric))
);


ALTER TABLE public.client_salary_history OWNER TO postgres;

--
-- Name: commission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.commission (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('commission'::text),
    value numeric(20,2) NOT NULL,
    commission_type integer NOT NULL,
    sale_id uuid NOT NULL,
    payment_id uuid NOT NULL
);


ALTER TABLE public.commission OWNER TO postgres;

--
-- Name: commission_source; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.commission_source (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('commission_source'::text),
    direct_value numeric(10,2) NOT NULL,
    installments_value numeric(10,2) NOT NULL,
    category_id uuid,
    sellable_id uuid,
    CONSTRAINT check_exist_one_fkey CHECK ((((category_id IS NOT NULL) AND (sellable_id IS NULL)) OR ((category_id IS NULL) AND (sellable_id IS NOT NULL)))),
    CONSTRAINT positive_installments_value CHECK ((installments_value >= (0)::numeric)),
    CONSTRAINT positive_value CHECK ((direct_value >= (0)::numeric))
);


ALTER TABLE public.commission_source OWNER TO postgres;

--
-- Name: company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('company'::text),
    is_active boolean,
    cnpj text,
    fancy_name text,
    state_registry text,
    city_registry text,
    person_id uuid,
    parent_id uuid,
    legal_nature_code text
);


ALTER TABLE public.company OWNER TO postgres;

--
-- Name: contact_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact_info (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('contact_info'::text),
    description text,
    contact_info text,
    person_id uuid
);


ALTER TABLE public.contact_info OWNER TO postgres;

--
-- Name: context; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.context (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te(),
    name text NOT NULL,
    start_time time without time zone,
    end_time time without time zone,
    branch_id uuid NOT NULL
);


ALTER TABLE public.context OWNER TO postgres;

--
-- Name: cost_center; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cost_center (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('cost_center'::text),
    name text NOT NULL,
    description text,
    budget numeric(20,2),
    is_active boolean DEFAULT true NOT NULL,
    CONSTRAINT positive_budget CHECK ((budget >= (0)::numeric))
);


ALTER TABLE public.cost_center OWNER TO postgres;

--
-- Name: cost_center_entry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cost_center_entry (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('cost_center_entry'::text),
    cost_center_id uuid NOT NULL,
    payment_id uuid,
    stock_transaction_id uuid,
    CONSTRAINT stock_transaction_or_payment CHECK ((((payment_id IS NULL) AND (stock_transaction_id IS NOT NULL)) OR ((payment_id IS NOT NULL) AND (stock_transaction_id IS NULL))))
);


ALTER TABLE public.cost_center_entry OWNER TO postgres;

--
-- Name: credit_card_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.credit_card_data (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('credit_card_data'::text),
    auth text,
    nsu text,
    installments integer DEFAULT 1,
    card_type public.credit_card_type NOT NULL,
    entrance_value numeric(20,2) DEFAULT 0,
    fee numeric(10,2) DEFAULT 0 NOT NULL,
    fee_value numeric(20,2) DEFAULT 0,
    fare numeric(20,2) DEFAULT 0,
    payment_id uuid,
    provider_id uuid,
    device_id uuid
);


ALTER TABLE public.credit_card_data OWNER TO postgres;

--
-- Name: credit_check_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.credit_check_history (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('credit_check_history'::text),
    creation_date timestamp without time zone,
    check_date timestamp without time zone,
    identifier text,
    status public.credit_check_status NOT NULL,
    notes text,
    client_id uuid,
    user_id uuid
);


ALTER TABLE public.credit_check_history OWNER TO postgres;

--
-- Name: credit_provider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.credit_provider (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('credit_provider'::text),
    is_active boolean,
    max_installments integer DEFAULT 12,
    short_name text,
    provider_id text,
    open_contract_date timestamp without time zone,
    default_device_id uuid,
    sort_order integer DEFAULT 0,
    visible boolean DEFAULT true,
    CONSTRAINT valid_max_installments CHECK ((max_installments > 0))
);


ALTER TABLE public.credit_provider OWNER TO postgres;

--
-- Name: delivery; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.delivery (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('delivery'::text),
    status public.delivery_status NOT NULL,
    open_date timestamp without time zone,
    send_date timestamp without time zone,
    receive_date timestamp without time zone,
    tracking_code text,
    freight_type public.delivery_freight_type DEFAULT 'cif'::public.delivery_freight_type,
    volumes_kind text,
    volumes_quantity integer,
    cancel_date timestamp without time zone,
    pick_date timestamp without time zone,
    pack_date timestamp without time zone,
    volumes_net_weight numeric(10,3),
    volumes_gross_weight numeric(10,3),
    vehicle_license_plate text,
    vehicle_state text,
    vehicle_registration text,
    cancel_responsible_id uuid,
    pick_responsible_id uuid,
    pack_responsible_id uuid,
    send_responsible_id uuid,
    address_id uuid,
    transporter_id uuid,
    invoice_id uuid
);


ALTER TABLE public.delivery OWNER TO postgres;

--
-- Name: device_constant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.device_constant (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('device_constant'::text),
    constant_type integer,
    constant_name text,
    constant_value numeric(10,2),
    constant_enum integer,
    device_value bytea,
    device_settings_id uuid,
    is_valid_model boolean,
    CONSTRAINT device_constant_constant_enum_check CHECK ((((constant_enum >= 0) AND (constant_enum < 8)) OR ((constant_enum >= 20) AND (constant_enum < 25)) OR ((constant_enum >= 40) AND (constant_enum < 46)))),
    CONSTRAINT positive_constant_value CHECK ((constant_value >= (0)::numeric)),
    CONSTRAINT valid_constant_type CHECK (((constant_type >= 0) AND (constant_type < 3)))
);


ALTER TABLE public.device_constant OWNER TO postgres;

--
-- Name: device_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.device_settings (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('device_settings'::text),
    type integer,
    brand text,
    model text,
    device_name text,
    is_active boolean,
    baudrate integer DEFAULT 9600,
    station_id uuid,
    drawer_inverted boolean DEFAULT false,
    CONSTRAINT valid_type CHECK (((type >= 0) AND (type < 4)))
);


ALTER TABLE public.device_settings OWNER TO postgres;

--
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('employee'::text),
    is_active boolean,
    admission_date timestamp without time zone,
    expire_vacation timestamp without time zone,
    salary numeric(20,2),
    status public.employee_status NOT NULL,
    registry_number text,
    education_level text,
    dependent_person_number integer,
    role_id uuid,
    workpermit_data_id uuid,
    military_data_id uuid,
    voter_data_id uuid,
    bank_account_id uuid,
    person_id uuid,
    branch_id uuid,
    CONSTRAINT positive_dependent_person_number CHECK ((dependent_person_number >= 0))
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- Name: employee_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_role (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('employee_role'::text),
    name text NOT NULL
);


ALTER TABLE public.employee_role OWNER TO postgres;

--
-- Name: employee_role_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_role_history (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('employee_role_history'::text),
    began timestamp without time zone,
    ended timestamp without time zone,
    salary numeric(20,2),
    role_id uuid,
    employee_id uuid,
    is_active boolean
);


ALTER TABLE public.employee_role_history OWNER TO postgres;

--
-- Name: event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event (
    id bigint NOT NULL,
    date timestamp without time zone NOT NULL,
    event_type public.event_type NOT NULL,
    description character varying NOT NULL
);


ALTER TABLE public.event OWNER TO postgres;

--
-- Name: event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_id_seq OWNER TO postgres;

--
-- Name: event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_id_seq OWNED BY public.event.id;


--
-- Name: fiscal_book_entry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fiscal_book_entry (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('fiscal_book_entry'::text),
    entry_type integer,
    icms_value numeric(20,2),
    iss_value numeric(20,2),
    ipi_value numeric(20,2),
    date timestamp without time zone,
    is_reversal boolean,
    invoice_number integer,
    cfop_id uuid,
    branch_id uuid NOT NULL,
    drawee_id uuid,
    payment_group_id uuid,
    CONSTRAINT valid_invoice_number CHECK (((invoice_number >= 0) AND (invoice_number <= 999999999)))
);


ALTER TABLE public.fiscal_book_entry OWNER TO postgres;

--
-- Name: fiscal_day_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fiscal_day_history (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('fiscal_day_history'::text),
    emission_date date,
    station_id uuid,
    serial text,
    serial_id integer,
    coupon_start integer,
    coupon_end integer,
    cro integer,
    crz integer,
    period_total numeric(20,2),
    total numeric(20,2),
    tax_total numeric(10,2),
    reduction_date timestamp without time zone,
    CONSTRAINT coupon_start_lower_than_coupon_end CHECK ((coupon_start <= coupon_end)),
    CONSTRAINT past_emission_date CHECK ((emission_date <= date(now()))),
    CONSTRAINT positive_coupon_end CHECK ((coupon_end > 0)),
    CONSTRAINT positive_coupon_start CHECK ((coupon_start > 0)),
    CONSTRAINT positive_cro CHECK ((cro > 0)),
    CONSTRAINT positive_crz CHECK ((crz > 0)),
    CONSTRAINT positive_period_total CHECK ((period_total >= (0)::numeric)),
    CONSTRAINT positive_tax_total CHECK ((tax_total >= (0)::numeric)),
    CONSTRAINT positive_total CHECK ((total >= (0)::numeric))
);


ALTER TABLE public.fiscal_day_history OWNER TO postgres;

--
-- Name: fiscal_day_tax; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fiscal_day_tax (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('fiscal_day_tax'::text),
    code text,
    value numeric(20,2),
    fiscal_day_history_id uuid,
    type text,
    CONSTRAINT positive_value CHECK ((value >= (0)::numeric)),
    CONSTRAINT valid_code CHECK ((code ~ '^([0-9][0-9][0-9][0-9]|I|F|N|ISS|DESC|CANC)$'::text))
);


ALTER TABLE public.fiscal_day_tax OWNER TO postgres;

--
-- Name: fiscal_sale_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fiscal_sale_history (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('fiscal_sale_history'::text),
    sale_id uuid,
    document_type integer,
    document text,
    coo integer,
    document_counter integer,
    CONSTRAINT valid_type CHECK (((document_type = 0) OR (document_type = 1)))
);


ALTER TABLE public.fiscal_sale_history OWNER TO postgres;

--
-- Name: grid_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grid_attribute (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('grid_attribute'::text),
    description text,
    is_active boolean DEFAULT true,
    group_id uuid
);


ALTER TABLE public.grid_attribute OWNER TO postgres;

--
-- Name: grid_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grid_group (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('grid_group'::text),
    description text,
    is_active boolean DEFAULT true
);


ALTER TABLE public.grid_group OWNER TO postgres;

--
-- Name: grid_option; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grid_option (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('grid_option'::text),
    description text,
    is_active boolean DEFAULT true,
    option_order integer,
    attribute_id uuid
);


ALTER TABLE public.grid_option OWNER TO postgres;

--
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('image'::text),
    image bytea,
    thumbnail bytea,
    description text,
    is_main boolean DEFAULT false,
    internal_use boolean DEFAULT false,
    notes text,
    create_date timestamp without time zone DEFAULT statement_timestamp() NOT NULL,
    filename text,
    sellable_id uuid,
    keywords text,
    station_type_id uuid,
    category_id uuid,
    CONSTRAINT check_exist_one_image CHECK ((((category_id IS NOT NULL) AND (sellable_id IS NULL)) OR ((category_id IS NULL) AND (sellable_id IS NOT NULL)) OR ((category_id IS NULL) AND (sellable_id IS NULL))))
);


ALTER TABLE public.image OWNER TO postgres;

--
-- Name: individual; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.individual (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('individual'::text),
    is_active boolean,
    cpf text,
    rg_number text,
    birth_date timestamp without time zone,
    occupation text,
    marital_status public.marital_status NOT NULL,
    father_name text,
    mother_name text,
    rg_expedition_date timestamp without time zone,
    rg_expedition_local text,
    gender public.individual_gender,
    spouse_name text,
    state_registry text,
    city_registry text,
    birth_location_id bigint,
    person_id uuid,
    responsible_id uuid
);


ALTER TABLE public.individual OWNER TO postgres;

--
-- Name: installed_plugin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.installed_plugin (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('installed_plugin'::text),
    plugin_name text NOT NULL,
    plugin_version integer,
    CONSTRAINT positive_plugin_version CHECK ((plugin_version >= 0))
);


ALTER TABLE public.installed_plugin OWNER TO postgres;

--
-- Name: inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('inventory'::text),
    identifier integer NOT NULL,
    status public.inventory_status NOT NULL,
    open_date timestamp without time zone NOT NULL,
    close_date timestamp without time zone,
    invoice_number integer,
    cancel_reason text,
    cancel_date timestamp without time zone,
    branch_id uuid NOT NULL,
    responsible_id uuid NOT NULL,
    cancel_responsible_id uuid,
    station_id uuid NOT NULL,
    CONSTRAINT valid_invoice_number CHECK (((invoice_number > 0) AND (invoice_number <= 999999999)))
);


ALTER TABLE public.inventory OWNER TO postgres;

--
-- Name: inventory_identifier_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_identifier_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventory_identifier_seq OWNER TO postgres;

--
-- Name: inventory_identifier_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventory_identifier_seq OWNED BY public.inventory.identifier;


--
-- Name: inventory_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory_item (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('inventory_item'::text),
    product_id uuid NOT NULL,
    recorded_quantity numeric(20,3),
    actual_quantity numeric(20,3),
    counted_quantity numeric(20,3),
    inventory_id uuid NOT NULL,
    reason text,
    product_cost numeric(20,8),
    is_adjusted boolean DEFAULT false NOT NULL,
    batch_id uuid,
    cfop_data_id uuid,
    CONSTRAINT positive_actual_quantity CHECK ((actual_quantity >= (0)::numeric)),
    CONSTRAINT positive_counted_quantity CHECK ((counted_quantity >= (0)::numeric)),
    CONSTRAINT positive_product_cost CHECK ((product_cost >= (0)::numeric)),
    CONSTRAINT positive_recorded_quantity CHECK ((recorded_quantity >= (0)::numeric))
);


ALTER TABLE public.inventory_item OWNER TO postgres;

--
-- Name: invoice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invoice (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('invoice'::text),
    invoice_number integer,
    operation_nature text,
    invoice_type public.invoice_type NOT NULL,
    key text,
    cnf text,
    mode public.invoice_mode,
    series integer,
    branch_id uuid
);


ALTER TABLE public.invoice OWNER TO postgres;

--
-- Name: invoice_field; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invoice_field (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('invoice_field'::text),
    field_name character varying NOT NULL,
    content text,
    layout_id uuid,
    x bigint NOT NULL,
    y bigint NOT NULL,
    width bigint NOT NULL,
    height bigint NOT NULL,
    CONSTRAINT positive_height CHECK ((height > 0)),
    CONSTRAINT positive_width CHECK ((width > 0)),
    CONSTRAINT positive_x CHECK ((x >= 0)),
    CONSTRAINT positive_y CHECK ((y >= 0))
);


ALTER TABLE public.invoice_field OWNER TO postgres;

--
-- Name: invoice_item_cofins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invoice_item_cofins (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('invoice_item_cofins'::text),
    cst integer,
    calculo public.product_cofins_template_calculo DEFAULT 'percentage'::public.product_cofins_template_calculo NOT NULL,
    v_bc numeric(10,2),
    p_cofins numeric(10,2),
    q_bc_prod numeric(10,4),
    v_cofins numeric(10,2)
);


ALTER TABLE public.invoice_item_cofins OWNER TO postgres;

--
-- Name: invoice_item_icms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invoice_item_icms (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('invoice_item_icms'::text),
    bc_include_ipi boolean DEFAULT true,
    bc_st_include_ipi boolean DEFAULT true,
    cst integer,
    csosn integer,
    mod_bc integer,
    mod_bc_st integer,
    orig integer,
    p_cred_sn numeric(10,2),
    p_mva_st numeric(10,2),
    p_icms numeric(10,2),
    p_icms_st numeric(10,2),
    p_red_bc numeric(10,2),
    p_red_bc_st numeric(10,2),
    v_bc numeric(20,2),
    v_bc_st numeric(20,2),
    v_bc_st_ret numeric(20,2),
    v_cred_icms_sn numeric(20,2),
    v_icms numeric(20,2),
    v_icms_st numeric(20,2),
    v_icms_st_ret numeric(20,2),
    p_fcp numeric(10,2),
    p_fcp_st numeric(10,2),
    p_st numeric(10,2),
    v_fcp numeric(20,2),
    v_fcp_st numeric(20,2),
    v_fcp_st_ret numeric(20,2),
    v_icms_deson numeric(20,2) DEFAULT NULL::numeric
);


ALTER TABLE public.invoice_item_icms OWNER TO postgres;

--
-- Name: invoice_item_ipi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invoice_item_ipi (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('invoice_item_ipi'::text),
    cl_enq text,
    cnpj_prod text,
    c_selo text,
    q_selo integer,
    c_enq text,
    calculo public.product_ipi_template_calculo DEFAULT 'aliquot'::public.product_ipi_template_calculo,
    cst integer,
    p_ipi numeric(10,2),
    q_unid numeric(16,4),
    v_ipi numeric(20,2),
    v_bc numeric(20,2),
    v_unid numeric(20,4)
);


ALTER TABLE public.invoice_item_ipi OWNER TO postgres;

--
-- Name: invoice_item_pis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invoice_item_pis (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('invoice_item_pis'::text),
    cst integer,
    calculo public.product_pis_template_calculo DEFAULT 'percentage'::public.product_pis_template_calculo NOT NULL,
    v_bc numeric(10,2),
    p_pis numeric(10,2),
    q_bc_prod numeric(10,4),
    v_pis numeric(10,2)
);


ALTER TABLE public.invoice_item_pis OWNER TO postgres;

--
-- Name: invoice_layout; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invoice_layout (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('invoice_layout'::text),
    description character varying NOT NULL,
    continuous_page boolean,
    width bigint NOT NULL,
    height bigint NOT NULL,
    CONSTRAINT positive_height CHECK ((height > 0)),
    CONSTRAINT positive_width CHECK ((width > 0))
);


ALTER TABLE public.invoice_layout OWNER TO postgres;

--
-- Name: invoice_printer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invoice_printer (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('invoice_printer'::text),
    device_name character varying NOT NULL,
    description character varying NOT NULL,
    station_id uuid,
    layout_id uuid
);


ALTER TABLE public.invoice_printer OWNER TO postgres;

--
-- Name: loan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loan (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('loan'::text),
    identifier integer NOT NULL,
    open_date timestamp without time zone,
    close_date timestamp without time zone,
    expire_date timestamp without time zone,
    status public.loan_status NOT NULL,
    notes text,
    removed_by text,
    cancel_reason text,
    cancel_date timestamp without time zone,
    client_id uuid,
    client_category_id uuid,
    responsible_id uuid,
    branch_id uuid NOT NULL,
    invoice_id uuid,
    cancel_responsible_id uuid,
    station_id uuid NOT NULL
);


ALTER TABLE public.loan OWNER TO postgres;

--
-- Name: loan_identifier_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.loan_identifier_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.loan_identifier_seq OWNER TO postgres;

--
-- Name: loan_identifier_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.loan_identifier_seq OWNED BY public.loan.identifier;


--
-- Name: loan_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loan_item (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('loan_item'::text),
    quantity numeric(20,3),
    sale_quantity numeric(20,3),
    return_quantity numeric(20,3),
    price numeric(20,2),
    base_price numeric(20,2),
    loan_id uuid,
    sellable_id uuid,
    batch_id uuid,
    icms_info_id uuid,
    ipi_info_id uuid,
    pis_info_id uuid,
    cofins_info_id uuid,
    CONSTRAINT positive_base_price CHECK ((base_price >= (0)::numeric)),
    CONSTRAINT positive_price CHECK ((price >= (0)::numeric)),
    CONSTRAINT positive_quantity CHECK ((quantity >= (0)::numeric)),
    CONSTRAINT positive_return_quantity CHECK ((return_quantity >= (0)::numeric)),
    CONSTRAINT positive_sale_quantity CHECK ((sale_quantity >= (0)::numeric))
);


ALTER TABLE public.loan_item OWNER TO postgres;

--
-- Name: login_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.login_user (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('login_user'::text),
    username text NOT NULL,
    pw_hash text,
    is_active boolean,
    profile_id uuid,
    person_id uuid
);


ALTER TABLE public.login_user OWNER TO postgres;

--
-- Name: message; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.message (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te(),
    content text DEFAULT ''::text,
    created_at timestamp without time zone DEFAULT now(),
    expire_at timestamp without time zone,
    created_by_id uuid NOT NULL,
    user_id uuid,
    profile_id uuid,
    branch_id uuid
);


ALTER TABLE public.message OWNER TO postgres;

--
-- Name: military_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.military_data (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('military_data'::text),
    number text,
    series_number text,
    category text
);


ALTER TABLE public.military_data OWNER TO postgres;

--
-- Name: parameter_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parameter_data (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('parameter_data'::text),
    field_name text NOT NULL,
    field_value text,
    is_editable boolean
);


ALTER TABLE public.parameter_data OWNER TO postgres;

--
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('payment'::text),
    identifier integer NOT NULL,
    payment_type public.payment_type NOT NULL,
    status public.payment_status NOT NULL,
    open_date timestamp without time zone,
    due_date timestamp without time zone,
    paid_date timestamp without time zone,
    cancel_date timestamp without time zone,
    paid_value numeric(20,2),
    base_value numeric(20,2),
    value numeric(20,2),
    interest numeric(20,2),
    discount numeric(20,2),
    description text,
    payment_number text,
    penalty numeric(20,2),
    bill_received boolean DEFAULT false,
    attachment_id uuid,
    method_id uuid,
    group_id uuid,
    branch_id uuid NOT NULL,
    category_id uuid,
    station_id uuid NOT NULL,
    CONSTRAINT interest_percent CHECK ((interest >= (0)::numeric)),
    CONSTRAINT positive_base_value CHECK ((base_value >= (0)::numeric)),
    CONSTRAINT positive_discount CHECK ((discount >= (0)::numeric)),
    CONSTRAINT positive_paid_value CHECK ((paid_value >= (0)::numeric)),
    CONSTRAINT positive_value CHECK ((value >= (0)::numeric))
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- Name: payment_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_category (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('payment_category'::text),
    name text,
    category_type public.payment_category_type DEFAULT 'payable'::public.payment_category_type NOT NULL,
    color text,
    account_id uuid
);


ALTER TABLE public.payment_category OWNER TO postgres;

--
-- Name: payment_change_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_change_history (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('payment_change_history'::text),
    change_reason text,
    last_due_date timestamp without time zone,
    change_date timestamp without time zone,
    new_due_date timestamp without time zone,
    last_status public.payment_status NOT NULL,
    new_status public.payment_status NOT NULL,
    payment_id uuid
);


ALTER TABLE public.payment_change_history OWNER TO postgres;

--
-- Name: payment_comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_comment (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('payment_comment'::text),
    date timestamp without time zone,
    comment text,
    payment_id uuid,
    author_id uuid
);


ALTER TABLE public.payment_comment OWNER TO postgres;

--
-- Name: payment_flow_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_flow_history (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('payment_flow_history'::text),
    history_date timestamp without time zone,
    to_receive numeric(20,2),
    received numeric(20,2),
    to_pay numeric(20,2),
    paid numeric(20,2),
    to_receive_payments integer,
    received_payments integer,
    to_pay_payments integer,
    paid_payments integer,
    balance_expected numeric(20,2),
    balance_real numeric(20,2),
    CONSTRAINT positive_value_to_pay CHECK ((to_pay >= (0)::numeric)),
    CONSTRAINT positive_value_to_receive CHECK ((to_receive >= (0)::numeric))
);


ALTER TABLE public.payment_flow_history OWNER TO postgres;

--
-- Name: payment_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_group (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('payment_group'::text),
    payer_id uuid,
    renegotiation_id uuid,
    recipient_id uuid
);


ALTER TABLE public.payment_group OWNER TO postgres;

--
-- Name: payment_identifier_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_identifier_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_identifier_seq OWNER TO postgres;

--
-- Name: payment_identifier_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_identifier_seq OWNED BY public.payment.identifier;


--
-- Name: payment_method; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_method (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('payment_method'::text),
    is_active boolean,
    daily_interest numeric(10,2),
    penalty numeric(10,2),
    method_name text,
    payment_day integer,
    closing_day integer,
    max_installments integer,
    destination_account_id uuid NOT NULL,
    CONSTRAINT penalty_percent CHECK (((penalty >= (0)::numeric) AND (penalty <= (100)::numeric))),
    CONSTRAINT positive_max_installments CHECK ((max_installments > 0)),
    CONSTRAINT valid_closing_day CHECK (((closing_day >= 1) AND (closing_day <= 28))),
    CONSTRAINT valid_daily_interest CHECK (((daily_interest >= (0)::numeric) AND (daily_interest <= (100)::numeric))),
    CONSTRAINT valid_payment_day CHECK (((payment_day >= 1) AND (payment_day <= 28)))
);


ALTER TABLE public.payment_method OWNER TO postgres;

--
-- Name: payment_renegotiation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_renegotiation (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('payment_renegotiation'::text),
    identifier integer NOT NULL,
    open_date timestamp without time zone,
    close_date timestamp without time zone,
    status integer,
    discount_value numeric(20,2),
    surcharge_value numeric(20,2),
    total numeric(20,2),
    notes text,
    client_id uuid,
    responsible_id uuid,
    branch_id uuid NOT NULL,
    group_id uuid,
    station_id uuid NOT NULL,
    CONSTRAINT positive_discount_value CHECK ((discount_value >= (0)::numeric)),
    CONSTRAINT positive_surcharge_value CHECK ((surcharge_value >= (0)::numeric)),
    CONSTRAINT positive_total CHECK ((total >= (0)::numeric)),
    CONSTRAINT valid_status CHECK (((status >= 0) AND (status < 3)))
);


ALTER TABLE public.payment_renegotiation OWNER TO postgres;

--
-- Name: payment_renegotiation_identifier_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_renegotiation_identifier_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_renegotiation_identifier_seq OWNER TO postgres;

--
-- Name: payment_renegotiation_identifier_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_renegotiation_identifier_seq OWNED BY public.payment_renegotiation.identifier;


--
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('person'::text),
    name text,
    phone_number text,
    mobile_number text,
    fax_number text,
    email text,
    notes text,
    merged_with_id uuid
);


ALTER TABLE public.person OWNER TO postgres;

--
-- Name: plugin_egg; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plugin_egg (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('plugin_egg'::text),
    plugin_name text NOT NULL,
    egg_md5sum text,
    egg_content bytea
);


ALTER TABLE public.plugin_egg OWNER TO postgres;

--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('product'::text),
    consignment boolean DEFAULT false NOT NULL,
    location text,
    part_number text,
    family text,
    brand text,
    model text,
    ncm text,
    ex_tipi text,
    genero text,
    cest text,
    production_time integer DEFAULT 0,
    manage_stock boolean DEFAULT true,
    is_composed boolean DEFAULT false,
    is_grid boolean DEFAULT false,
    is_package boolean DEFAULT false,
    internal_use boolean DEFAULT false,
    width numeric(10,2),
    height numeric(10,2),
    depth numeric(10,2),
    weight numeric(10,2),
    yield_quantity numeric(20,3) DEFAULT 1,
    icms_template_id uuid,
    ipi_template_id uuid,
    manufacturer_id uuid,
    parent_id uuid,
    pis_template_id uuid,
    cofins_template_id uuid,
    c_benef text,
    CONSTRAINT positive_depth CHECK ((depth >= (0)::numeric)),
    CONSTRAINT positive_height CHECK ((height >= (0)::numeric)),
    CONSTRAINT positive_weight CHECK ((weight >= (0)::numeric)),
    CONSTRAINT positive_width CHECK ((width >= (0)::numeric)),
    CONSTRAINT positive_yield CHECK ((yield_quantity >= (0)::numeric))
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: product_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_attribute (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('product_attribute'::text),
    product_id uuid,
    attribute_id uuid
);


ALTER TABLE public.product_attribute OWNER TO postgres;

--
-- Name: product_branch_override; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_branch_override (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te(),
    location text,
    icms_template_id uuid,
    ipi_template_id uuid,
    pis_template_id uuid,
    cofins_template_id uuid,
    branch_id uuid NOT NULL,
    product_id uuid NOT NULL,
    c_benef text
);


ALTER TABLE public.product_branch_override OWNER TO postgres;

--
-- Name: product_cofins_template; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_cofins_template (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('product_cofins_template'::text),
    product_tax_template_id uuid,
    cst integer,
    calculo public.product_cofins_template_calculo DEFAULT 'percentage'::public.product_cofins_template_calculo NOT NULL,
    p_cofins numeric(10,2)
);


ALTER TABLE public.product_cofins_template OWNER TO postgres;

--
-- Name: product_component; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_component (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('product_component'::text),
    product_id uuid,
    component_id uuid,
    design_reference text,
    quantity numeric(20,3),
    price numeric(20,2),
    CONSTRAINT different_products CHECK ((product_id <> component_id)),
    CONSTRAINT positive_price CHECK ((price >= (0)::numeric)),
    CONSTRAINT positive_quantity CHECK ((quantity > (0)::numeric))
);


ALTER TABLE public.product_component OWNER TO postgres;

--
-- Name: product_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_history (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('product_history'::text),
    quantity_sold numeric(20,3),
    quantity_received numeric(20,3),
    quantity_transfered numeric(20,3),
    quantity_consumed numeric(20,3),
    quantity_produced numeric(20,3),
    quantity_lost numeric(20,3),
    sold_date timestamp without time zone,
    received_date timestamp without time zone,
    production_date timestamp without time zone,
    decreased_date timestamp without time zone,
    quantity_decreased numeric(20,3),
    branch_id uuid NOT NULL,
    sellable_id uuid,
    CONSTRAINT positive_consumed CHECK ((quantity_consumed > (0)::numeric)),
    CONSTRAINT positive_decreased CHECK ((quantity_decreased > (0)::numeric)),
    CONSTRAINT positive_lost CHECK ((quantity_lost > (0)::numeric)),
    CONSTRAINT positive_produced CHECK ((quantity_produced > (0)::numeric)),
    CONSTRAINT positive_quantity_received CHECK ((quantity_received >= (0)::numeric)),
    CONSTRAINT positive_quantity_sold CHECK ((quantity_sold >= (0)::numeric)),
    CONSTRAINT positive_quantity_transfered CHECK ((quantity_transfered >= (0)::numeric))
);


ALTER TABLE public.product_history OWNER TO postgres;

--
-- Name: product_icms_template; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_icms_template (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('product_icms_template'::text),
    product_tax_template_id uuid,
    bc_include_ipi boolean DEFAULT true,
    bc_st_include_ipi boolean DEFAULT true,
    cst integer,
    csosn integer,
    orig integer,
    mod_bc integer,
    mod_bc_st integer,
    p_cred_sn numeric(10,2),
    p_cred_sn_valid_until timestamp without time zone,
    p_icms numeric(10,2),
    p_icms_st numeric(10,2),
    p_mva_st numeric(10,2),
    p_red_bc numeric(10,2),
    p_red_bc_st numeric(10,2),
    p_fcp numeric(10,2),
    p_fcp_st numeric(10,2),
    mot_des_icms integer,
    CONSTRAINT valid_mot_des_icms CHECK ((mot_des_icms = ANY (ARRAY[3, 9, 12])))
);


ALTER TABLE public.product_icms_template OWNER TO postgres;

--
-- Name: product_ipi_template; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_ipi_template (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('product_ipi_template'::text),
    product_tax_template_id uuid,
    cl_enq text,
    cnpj_prod text,
    c_selo text,
    q_selo integer,
    c_enq text,
    calculo public.product_ipi_template_calculo DEFAULT 'aliquot'::public.product_ipi_template_calculo NOT NULL,
    cst integer,
    p_ipi numeric(10,2),
    q_unid numeric(16,4)
);


ALTER TABLE public.product_ipi_template OWNER TO postgres;

--
-- Name: product_manufacturer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_manufacturer (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('product_manufacturer'::text),
    name text,
    code text
);


ALTER TABLE public.product_manufacturer OWNER TO postgres;

--
-- Name: product_option_map; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_option_map (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('product_option_map'::text),
    product_id uuid,
    attribute_id uuid,
    option_id uuid
);


ALTER TABLE public.product_option_map OWNER TO postgres;

--
-- Name: product_pis_template; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_pis_template (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('product_pis_template'::text),
    product_tax_template_id uuid,
    cst integer,
    calculo public.product_pis_template_calculo DEFAULT 'percentage'::public.product_pis_template_calculo NOT NULL,
    p_pis numeric(10,2)
);


ALTER TABLE public.product_pis_template OWNER TO postgres;

--
-- Name: product_quality_test; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_quality_test (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('product_quality_test'::text),
    product_id uuid,
    test_type public.product_quality_test_type NOT NULL,
    description text,
    notes text,
    success_value text
);


ALTER TABLE public.product_quality_test OWNER TO postgres;

--
-- Name: product_stock_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_stock_item (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('product_stock_item'::text),
    stock_cost numeric(20,8),
    quantity numeric(20,3),
    storable_id uuid,
    batch_id uuid,
    branch_id uuid NOT NULL
);


ALTER TABLE public.product_stock_item OWNER TO postgres;

--
-- Name: product_supplier_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_supplier_info (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('product_supplier_info'::text),
    supplier_code text,
    base_cost numeric(20,8),
    notes text,
    is_main_supplier boolean,
    icms numeric(10,2),
    lead_time integer DEFAULT 1,
    minimum_purchase numeric(20,3) DEFAULT 1,
    supplier_id uuid NOT NULL,
    product_id uuid NOT NULL,
    branch_id uuid,
    CONSTRAINT positive_base_cost CHECK ((base_cost >= (0)::numeric)),
    CONSTRAINT positive_icms CHECK ((icms >= (0)::numeric)),
    CONSTRAINT positive_lead_time CHECK ((lead_time > 0))
);


ALTER TABLE public.product_supplier_info OWNER TO postgres;

--
-- Name: product_tax_template; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_tax_template (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('product_tax_template'::text),
    name text,
    tax_type public.product_tax_template_tax_type DEFAULT 'icms'::public.product_tax_template_tax_type
);


ALTER TABLE public.product_tax_template OWNER TO postgres;

--
-- Name: production_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.production_item (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('production_item'::text),
    quantity numeric(20,3),
    produced numeric(20,3) DEFAULT 0,
    lost numeric(20,3) DEFAULT 0,
    product_id uuid,
    order_id uuid,
    CONSTRAINT positive_lost CHECK ((lost >= (0)::numeric)),
    CONSTRAINT positive_produced CHECK ((produced >= (0)::numeric)),
    CONSTRAINT positive_quantity CHECK ((quantity >= (0)::numeric))
);


ALTER TABLE public.production_item OWNER TO postgres;

--
-- Name: production_item_quality_result; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.production_item_quality_result (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('production_item_quality_result'::text),
    produced_item_id uuid,
    quality_test_id uuid,
    tested_by_id uuid,
    tested_date timestamp without time zone,
    result_value text,
    test_passed boolean
);


ALTER TABLE public.production_item_quality_result OWNER TO postgres;

--
-- Name: production_material; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.production_material (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('production_material'::text),
    needed numeric(20,3),
    consumed numeric(20,3) DEFAULT 0,
    allocated numeric(20,3) DEFAULT 0,
    to_purchase numeric(20,3),
    to_make numeric(20,3),
    lost numeric(20,3) DEFAULT 0,
    order_id uuid,
    product_id uuid,
    CONSTRAINT positive_allocated CHECK ((allocated >= (0)::numeric)),
    CONSTRAINT positive_consumed CHECK ((consumed >= (0)::numeric)),
    CONSTRAINT positive_lost CHECK ((lost >= (0)::numeric)),
    CONSTRAINT positive_make_quantity CHECK ((to_make >= (0)::numeric)),
    CONSTRAINT positive_purchase_quantity CHECK ((to_purchase >= (0)::numeric)),
    CONSTRAINT positive_quantity CHECK ((needed > (0)::numeric))
);


ALTER TABLE public.production_material OWNER TO postgres;

--
-- Name: production_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.production_order (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('production_order'::text),
    identifier integer NOT NULL,
    status public.production_order_status NOT NULL,
    open_date timestamp without time zone,
    close_date timestamp without time zone,
    expected_start_date timestamp without time zone,
    start_date timestamp without time zone,
    cancel_date timestamp without time zone,
    description text,
    responsible_id uuid,
    branch_id uuid NOT NULL,
    station_id uuid NOT NULL
);


ALTER TABLE public.production_order OWNER TO postgres;

--
-- Name: production_order_identifier_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.production_order_identifier_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.production_order_identifier_seq OWNER TO postgres;

--
-- Name: production_order_identifier_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.production_order_identifier_seq OWNED BY public.production_order.identifier;


--
-- Name: production_produced_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.production_produced_item (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('production_produced_item'::text),
    order_id uuid,
    product_id uuid,
    produced_by_id uuid,
    produced_date timestamp without time zone,
    serial_number integer,
    entered_stock boolean,
    test_passed boolean
);


ALTER TABLE public.production_produced_item OWNER TO postgres;

--
-- Name: production_service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.production_service (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('production_service'::text),
    quantity numeric(20,3),
    service_id uuid,
    order_id uuid,
    CONSTRAINT positive_quantity CHECK ((quantity >= (0)::numeric))
);


ALTER TABLE public.production_service OWNER TO postgres;

--
-- Name: profile_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profile_settings (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('profile_settings'::text),
    app_dir_name text,
    has_permission boolean,
    user_profile_id uuid
);


ALTER TABLE public.profile_settings OWNER TO postgres;

--
-- Name: purchase_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchase_item (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('purchase_item'::text),
    quantity numeric(20,3),
    quantity_received numeric(20,3),
    base_cost numeric(20,8),
    cost numeric(20,8),
    expected_receival_date timestamp without time zone,
    sellable_id uuid,
    order_id uuid,
    parent_item_id uuid,
    quantity_sold numeric(20,3) DEFAULT 0,
    quantity_returned numeric(20,3) DEFAULT 0,
    ipi_value numeric(20,2),
    icms_st_value numeric(20,2),
    CONSTRAINT positive_base_cost CHECK ((base_cost >= (0)::numeric)),
    CONSTRAINT positive_cost CHECK ((cost >= (0)::numeric)),
    CONSTRAINT positive_icms_st CHECK ((icms_st_value >= (0)::numeric)),
    CONSTRAINT positive_ipi CHECK ((ipi_value >= (0)::numeric)),
    CONSTRAINT positive_quantity CHECK ((quantity >= (0)::numeric)),
    CONSTRAINT positive_quantity_received CHECK ((quantity_received >= (0)::numeric)),
    CONSTRAINT positive_quantity_returned CHECK (((quantity_returned >= (0)::numeric) AND (quantity_returned <= (quantity_received - quantity_sold)))),
    CONSTRAINT positive_quantity_sold CHECK (((quantity_sold >= (0)::numeric) AND (quantity_sold <= quantity_received)))
);


ALTER TABLE public.purchase_item OWNER TO postgres;

--
-- Name: purchase_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchase_order (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('purchase_order'::text),
    identifier integer NOT NULL,
    status public.purchase_order_status NOT NULL,
    open_date timestamp without time zone NOT NULL,
    quote_deadline timestamp without time zone,
    expected_receival_date timestamp without time zone,
    expected_pay_date timestamp without time zone,
    receival_date timestamp without time zone,
    confirm_date timestamp without time zone,
    notes text,
    salesperson_name text,
    freight_type public.purchase_order_freight_type NOT NULL,
    expected_freight numeric(20,2),
    surcharge_value numeric(20,2),
    discount_value numeric(20,2),
    consigned boolean DEFAULT false,
    supplier_id uuid,
    branch_id uuid NOT NULL,
    transporter_id uuid,
    responsible_id uuid,
    group_id uuid,
    work_order_id uuid,
    station_id uuid NOT NULL,
    CONSTRAINT positive_discount_value CHECK ((discount_value >= (0)::numeric)),
    CONSTRAINT positive_expected_freight CHECK ((expected_freight >= (0)::numeric)),
    CONSTRAINT positive_surcharge_value CHECK ((surcharge_value >= (0)::numeric))
);


ALTER TABLE public.purchase_order OWNER TO postgres;

--
-- Name: purchase_order_identifier_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.purchase_order_identifier_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.purchase_order_identifier_seq OWNER TO postgres;

--
-- Name: purchase_order_identifier_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.purchase_order_identifier_seq OWNED BY public.purchase_order.identifier;


--
-- Name: purchase_receiving_map; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchase_receiving_map (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('purchase_receiving_map'::text),
    purchase_id uuid,
    receiving_id uuid
);


ALTER TABLE public.purchase_receiving_map OWNER TO postgres;

--
-- Name: quotation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quotation (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('quotation'::text),
    identifier integer NOT NULL,
    purchase_id uuid,
    branch_id uuid NOT NULL,
    group_id uuid,
    station_id uuid NOT NULL
);


ALTER TABLE public.quotation OWNER TO postgres;

--
-- Name: quotation_identifier_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quotation_identifier_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quotation_identifier_seq OWNER TO postgres;

--
-- Name: quotation_identifier_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.quotation_identifier_seq OWNED BY public.quotation.identifier;


--
-- Name: quote_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quote_group (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('quote_group'::text),
    identifier integer NOT NULL,
    branch_id uuid NOT NULL,
    station_id uuid NOT NULL
);


ALTER TABLE public.quote_group OWNER TO postgres;

--
-- Name: quote_group_identifier_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quote_group_identifier_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quote_group_identifier_seq OWNER TO postgres;

--
-- Name: quote_group_identifier_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.quote_group_identifier_seq OWNED BY public.quote_group.identifier;


--
-- Name: receiving_invoice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.receiving_invoice (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('receiving_invoice'::text),
    identifier integer NOT NULL,
    invoice_number integer,
    invoice_series integer,
    invoice_key text,
    freight_total numeric(20,2),
    surcharge_value numeric(20,2),
    discount_value numeric(20,2),
    icms_total numeric(20,2),
    icms_st_total numeric(20,2),
    ipi_total numeric(20,2),
    expense_value numeric(20,2),
    secure_value numeric(20,2),
    invoice_total numeric(20,2),
    freight_type public.receiving_order_freight_type DEFAULT 'fob-payment'::public.receiving_order_freight_type NOT NULL,
    notes text,
    branch_id uuid NOT NULL,
    group_id uuid,
    supplier_id uuid,
    transporter_id uuid,
    responsible_id uuid,
    station_id uuid NOT NULL,
    CONSTRAINT freight_total CHECK ((freight_total >= (0)::numeric)),
    CONSTRAINT positive_discount CHECK ((discount_value >= (0)::numeric)),
    CONSTRAINT positive_expense CHECK ((expense_value >= (0)::numeric)),
    CONSTRAINT positive_secure CHECK ((secure_value >= (0)::numeric)),
    CONSTRAINT positive_surcharge CHECK ((surcharge_value >= (0)::numeric)),
    CONSTRAINT valid_invoice_number CHECK (((invoice_number > 0) AND (invoice_number <= 999999999)))
);


ALTER TABLE public.receiving_invoice OWNER TO postgres;

--
-- Name: receiving_invoice_identifier_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.receiving_invoice_identifier_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.receiving_invoice_identifier_seq OWNER TO postgres;

--
-- Name: receiving_invoice_identifier_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.receiving_invoice_identifier_seq OWNED BY public.receiving_invoice.identifier;


--
-- Name: receiving_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.receiving_order (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('receiving_order'::text),
    identifier integer NOT NULL,
    status public.receiving_order_status NOT NULL,
    receival_date timestamp without time zone,
    confirm_date timestamp without time zone,
    notes text,
    invoice_number integer,
    packing_number text,
    cfop_id uuid,
    responsible_id uuid,
    branch_id uuid NOT NULL,
    receiving_invoice_id uuid,
    station_id uuid NOT NULL,
    CONSTRAINT valid_invoice_number CHECK (((invoice_number > 0) AND (invoice_number <= 999999999)))
);


ALTER TABLE public.receiving_order OWNER TO postgres;

--
-- Name: receiving_order_identifier_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.receiving_order_identifier_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.receiving_order_identifier_seq OWNER TO postgres;

--
-- Name: receiving_order_identifier_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.receiving_order_identifier_seq OWNED BY public.receiving_order.identifier;


--
-- Name: receiving_order_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.receiving_order_item (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('receiving_order_item'::text),
    quantity numeric(20,3),
    cost numeric(20,8),
    ipi_value numeric(20,2),
    icms_st_value numeric(20,2),
    sellable_id uuid,
    batch_id uuid,
    receiving_order_id uuid,
    purchase_item_id uuid,
    parent_item_id uuid,
    CONSTRAINT positive_cost CHECK ((cost >= (0)::numeric)),
    CONSTRAINT positive_icms_st CHECK ((icms_st_value >= (0)::numeric)),
    CONSTRAINT positive_ipi CHECK ((ipi_value >= (0)::numeric)),
    CONSTRAINT positive_quantity CHECK ((quantity >= (0)::numeric))
);


ALTER TABLE public.receiving_order_item OWNER TO postgres;

--
-- Name: returned_sale; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.returned_sale (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('returned_sale'::text),
    identifier integer NOT NULL,
    status public.returned_sale_status NOT NULL,
    return_date timestamp without time zone,
    confirm_date timestamp without time zone,
    reason text,
    undo_date timestamp without time zone,
    undo_reason text,
    undo_responsible_id uuid,
    responsible_id uuid,
    confirm_responsible_id uuid,
    branch_id uuid NOT NULL,
    sale_id uuid,
    new_sale_id uuid,
    invoice_id uuid,
    station_id uuid NOT NULL
);


ALTER TABLE public.returned_sale OWNER TO postgres;

--
-- Name: returned_sale_identifier_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.returned_sale_identifier_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.returned_sale_identifier_seq OWNER TO postgres;

--
-- Name: returned_sale_identifier_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.returned_sale_identifier_seq OWNED BY public.returned_sale.identifier;


--
-- Name: returned_sale_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.returned_sale_item (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('returned_sale_item'::text),
    quantity numeric(20,3),
    price numeric(20,2),
    sellable_id uuid,
    batch_id uuid,
    sale_item_id uuid,
    returned_sale_id uuid,
    icms_info_id uuid,
    ipi_info_id uuid,
    pis_info_id uuid,
    cofins_info_id uuid,
    parent_item_id uuid,
    CONSTRAINT positive_price CHECK ((price >= (0)::numeric)),
    CONSTRAINT positive_quantity CHECK ((quantity >= (0)::numeric))
);


ALTER TABLE public.returned_sale_item OWNER TO postgres;

--
-- Name: sale; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sale (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('sale'::text),
    identifier integer NOT NULL,
    coupon_id integer,
    service_invoice_number integer,
    status public.sale_status NOT NULL,
    discount_value numeric(20,2),
    surcharge_value numeric(20,2),
    total_amount numeric(20,2),
    open_date timestamp without time zone,
    close_date timestamp without time zone,
    confirm_date timestamp without time zone,
    cancel_date timestamp without time zone,
    return_date timestamp without time zone,
    expire_date timestamp without time zone,
    paid boolean DEFAULT false,
    cancel_reason text,
    client_id uuid,
    client_category_id uuid,
    cfop_id uuid,
    salesperson_id uuid,
    branch_id uuid NOT NULL,
    group_id uuid,
    transporter_id uuid,
    invoice_id uuid,
    sale_token_id uuid,
    cancel_responsible_id uuid,
    cost_center_id uuid,
    station_id uuid NOT NULL,
    CONSTRAINT positive_discount_value CHECK ((discount_value >= (0)::numeric)),
    CONSTRAINT positive_surcharge_value CHECK ((surcharge_value >= (0)::numeric)),
    CONSTRAINT positive_total_amount CHECK ((total_amount >= (0)::numeric))
);


ALTER TABLE public.sale OWNER TO postgres;

--
-- Name: sale_comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sale_comment (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('sale_comment'::text),
    date timestamp without time zone,
    comment text,
    sale_id uuid NOT NULL,
    author_id uuid NOT NULL
);


ALTER TABLE public.sale_comment OWNER TO postgres;

--
-- Name: sale_context; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sale_context (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te(),
    sale_id uuid NOT NULL,
    context_id uuid NOT NULL
);


ALTER TABLE public.sale_context OWNER TO postgres;

--
-- Name: sale_identifier_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sale_identifier_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sale_identifier_seq OWNER TO postgres;

--
-- Name: sale_identifier_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sale_identifier_seq OWNED BY public.sale.identifier;


--
-- Name: sale_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sale_item (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('sale_item'::text),
    quantity numeric(20,3),
    quantity_decreased numeric(20,3) DEFAULT 0,
    base_price numeric(20,2),
    price numeric(20,2),
    notes text,
    estimated_fix_date timestamp without time zone,
    completion_date timestamp without time zone,
    average_cost numeric(20,8) DEFAULT 0,
    sale_id uuid,
    sellable_id uuid,
    batch_id uuid,
    icms_info_id uuid,
    ipi_info_id uuid,
    cfop_id uuid,
    parent_item_id uuid,
    pis_info_id uuid,
    cofins_info_id uuid,
    delivery_id uuid,
    CONSTRAINT positive_base_price CHECK ((base_price >= (0)::numeric)),
    CONSTRAINT positive_price CHECK ((price >= (0)::numeric)),
    CONSTRAINT positive_quantity CHECK ((quantity >= (0)::numeric)),
    CONSTRAINT valid_quantity_decreased CHECK ((quantity_decreased <= quantity))
);


ALTER TABLE public.sale_item OWNER TO postgres;

--
-- Name: sale_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sale_token (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('sale_token'::text),
    status public.sale_token_status DEFAULT 'available'::public.sale_token_status,
    code text,
    name text,
    branch_id uuid NOT NULL,
    sale_id uuid
);


ALTER TABLE public.sale_token OWNER TO postgres;

--
-- Name: sales_person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_person (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('sales_person'::text),
    comission numeric(10,2),
    comission_type integer,
    is_active boolean,
    person_id uuid,
    CONSTRAINT check_valid_comission_type CHECK (((comission_type >= 0) AND (comission_type < 7))),
    CONSTRAINT positive_comission CHECK ((comission >= (0)::numeric))
);


ALTER TABLE public.sales_person OWNER TO postgres;

--
-- Name: sellable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sellable (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('sellable'::text),
    barcode text,
    code text,
    status public.sellable_status NOT NULL,
    description text,
    cost numeric(20,8),
    base_price numeric(20,2),
    notes text,
    max_discount numeric(10,2),
    commission numeric(10,2),
    on_sale_price numeric(20,2),
    on_sale_start_date timestamp without time zone,
    on_sale_end_date timestamp without time zone,
    price_last_updated timestamp without time zone DEFAULT now(),
    cost_last_updated timestamp without time zone DEFAULT now(),
    unit_id uuid,
    category_id uuid,
    tax_constant_id uuid,
    default_sale_cfop_id uuid,
    sort_order integer DEFAULT 0,
    favorite boolean DEFAULT false,
    keywords text,
    requires_kitchen_production boolean DEFAULT false NOT NULL,
    short_description text DEFAULT ''::text,
    CONSTRAINT positive_cost CHECK ((cost >= (0)::numeric)),
    CONSTRAINT positive_on_sale_price CHECK ((on_sale_price >= (0)::numeric)),
    CONSTRAINT positive_price CHECK ((base_price >= (0)::numeric))
);


ALTER TABLE public.sellable OWNER TO postgres;

--
-- Name: sellable_branch_override; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sellable_branch_override (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te(),
    status public.sellable_status,
    base_price numeric(20,2),
    max_discount numeric(10,2),
    on_sale_price numeric(20,2),
    on_sale_start_date timestamp without time zone,
    on_sale_end_date timestamp without time zone,
    tax_constant_id uuid,
    default_sale_cfop_id uuid,
    price_last_updated timestamp without time zone,
    branch_id uuid NOT NULL,
    sellable_id uuid NOT NULL,
    requires_kitchen_production boolean,
    CONSTRAINT positive_on_sale_price CHECK ((on_sale_price >= (0)::numeric)),
    CONSTRAINT positive_price CHECK ((base_price >= (0)::numeric))
);


ALTER TABLE public.sellable_branch_override OWNER TO postgres;

--
-- Name: sellable_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sellable_category (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('sellable_category'::text),
    description text,
    suggested_markup numeric(10,2),
    salesperson_commission numeric(10,2),
    category_id uuid,
    tax_constant_id uuid,
    color text,
    sort_order integer DEFAULT 0
);


ALTER TABLE public.sellable_category OWNER TO postgres;

--
-- Name: sellable_tax_constant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sellable_tax_constant (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('sellable_tax_constant'::text),
    description text,
    tax_type integer,
    tax_value numeric(10,2),
    CONSTRAINT valid_tax_type CHECK (((tax_type >= 41) AND (tax_type < 46)))
);


ALTER TABLE public.sellable_tax_constant OWNER TO postgres;

--
-- Name: sellable_unit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sellable_unit (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('sellable_unit'::text),
    description text,
    unit_index integer,
    allow_fraction boolean DEFAULT true,
    CONSTRAINT positive_unit_index CHECK ((unit_index >= 0))
);


ALTER TABLE public.sellable_unit OWNER TO postgres;

--
-- Name: service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('service'::text),
    city_taxation_code text,
    service_list_item_code text,
    p_iss numeric(10,2)
);


ALTER TABLE public.service OWNER TO postgres;

--
-- Name: service_branch_override; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_branch_override (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te(),
    city_taxation_code text,
    service_list_item_code text,
    p_iss numeric(10,2),
    branch_id uuid NOT NULL,
    service_id uuid NOT NULL
);


ALTER TABLE public.service_branch_override OWNER TO postgres;

--
-- Name: station_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.station_type (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te(),
    name text NOT NULL
);


ALTER TABLE public.station_type OWNER TO postgres;

--
-- Name: stock_decrease; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock_decrease (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('stock_decrease'::text),
    identifier integer NOT NULL,
    confirm_date timestamp without time zone,
    status public.stock_decrease_status NOT NULL,
    reason text,
    notes text,
    cancel_reason text,
    cancel_date timestamp without time zone,
    referenced_invoice_key text,
    responsible_id uuid,
    removed_by_id uuid,
    branch_id uuid NOT NULL,
    person_id uuid,
    cfop_id uuid,
    group_id uuid,
    cost_center_id uuid,
    invoice_id uuid,
    cancel_responsible_id uuid,
    receiving_order_id uuid,
    station_id uuid NOT NULL
);


ALTER TABLE public.stock_decrease OWNER TO postgres;

--
-- Name: stock_decrease_identifier_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stock_decrease_identifier_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stock_decrease_identifier_seq OWNER TO postgres;

--
-- Name: stock_decrease_identifier_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stock_decrease_identifier_seq OWNED BY public.stock_decrease.identifier;


--
-- Name: stock_decrease_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock_decrease_item (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('stock_decrease_item'::text),
    quantity numeric(20,3),
    cost numeric(20,8) DEFAULT 0,
    stock_decrease_id uuid,
    sellable_id uuid,
    batch_id uuid,
    icms_info_id uuid,
    ipi_info_id uuid,
    pis_info_id uuid,
    cofins_info_id uuid,
    delivery_id uuid,
    receiving_order_item_id uuid,
    CONSTRAINT positive_quantity CHECK ((quantity >= (0)::numeric))
);


ALTER TABLE public.stock_decrease_item OWNER TO postgres;

--
-- Name: stock_transaction_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock_transaction_history (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('stock_transaction_history'::text),
    date timestamp without time zone,
    stock_cost numeric(20,8),
    quantity numeric(20,3),
    unit_cost numeric(20,8),
    type public.stock_transaction_history_type NOT NULL,
    object_id uuid,
    responsible_id uuid NOT NULL,
    storable_id uuid NOT NULL,
    batch_id uuid,
    branch_id uuid NOT NULL,
    CONSTRAINT positive_cost CHECK ((stock_cost >= (0)::numeric))
);


ALTER TABLE public.stock_transaction_history OWNER TO postgres;

--
-- Name: storable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.storable (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('storable'::text),
    is_batch boolean DEFAULT false,
    minimum_quantity numeric(20,3) DEFAULT 0,
    maximum_quantity numeric(20,3) DEFAULT 0,
    CONSTRAINT positive_maximum_quantity CHECK ((maximum_quantity >= (0)::numeric)),
    CONSTRAINT positive_minimum_quantity CHECK ((minimum_quantity >= (0)::numeric))
);


ALTER TABLE public.storable OWNER TO postgres;

--
-- Name: storable_batch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.storable_batch (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('storable_batch'::text),
    batch_number text NOT NULL,
    create_date timestamp without time zone NOT NULL,
    expire_date timestamp without time zone,
    notes text,
    storable_id uuid NOT NULL
);


ALTER TABLE public.storable_batch OWNER TO postgres;

--
-- Name: storable_branch_override; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.storable_branch_override (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te(),
    minimum_quantity numeric(20,3) DEFAULT 0,
    maximum_quantity numeric(20,3) DEFAULT 0,
    branch_id uuid NOT NULL,
    storable_id uuid NOT NULL,
    CONSTRAINT positive_maximum_quantity CHECK ((maximum_quantity >= (0)::numeric)),
    CONSTRAINT positive_minimum_quantity CHECK ((minimum_quantity >= (0)::numeric))
);


ALTER TABLE public.storable_branch_override OWNER TO postgres;

--
-- Name: supplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplier (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('supplier'::text),
    is_active boolean,
    status public.supplier_status NOT NULL,
    product_desc text,
    person_id uuid
);


ALTER TABLE public.supplier OWNER TO postgres;

--
-- Name: system_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.system_table (
    id bigint NOT NULL,
    updated timestamp without time zone,
    patchlevel integer,
    generation integer,
    CONSTRAINT positive_generation CHECK ((generation >= 0)),
    CONSTRAINT positive_patchlevel CHECK ((patchlevel >= 0))
);


ALTER TABLE public.system_table OWNER TO postgres;

--
-- Name: system_table_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.system_table_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.system_table_id_seq OWNER TO postgres;

--
-- Name: system_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.system_table_id_seq OWNED BY public.system_table.id;


--
-- Name: till; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.till (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('till'::text),
    status public.till_status NOT NULL,
    initial_cash_amount numeric(20,2),
    final_cash_amount numeric(20,2),
    opening_date timestamp without time zone,
    closing_date timestamp without time zone,
    observations text,
    station_id uuid,
    responsible_open_id uuid,
    responsible_close_id uuid,
    verify_date timestamp without time zone,
    responsible_verify_id uuid,
    identifier integer NOT NULL,
    branch_id uuid NOT NULL,
    CONSTRAINT positive_final_cash_amount CHECK ((final_cash_amount >= (0)::numeric)),
    CONSTRAINT positive_initial_cash_amount CHECK ((initial_cash_amount >= (0)::numeric))
);


ALTER TABLE public.till OWNER TO postgres;

--
-- Name: till_entry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.till_entry (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('till_entry'::text),
    identifier integer NOT NULL,
    date timestamp without time zone,
    description text,
    value numeric(20,2),
    till_id uuid NOT NULL,
    branch_id uuid NOT NULL,
    payment_id uuid,
    station_id uuid NOT NULL
);


ALTER TABLE public.till_entry OWNER TO postgres;

--
-- Name: till_entry_identifier_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.till_entry_identifier_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.till_entry_identifier_seq OWNER TO postgres;

--
-- Name: till_entry_identifier_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.till_entry_identifier_seq OWNED BY public.till_entry.identifier;


--
-- Name: till_identifier_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.till_identifier_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.till_identifier_seq OWNER TO postgres;

--
-- Name: till_identifier_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.till_identifier_seq OWNED BY public.till.identifier;


--
-- Name: till_summary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.till_summary (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('till_summary'::text),
    system_value numeric(20,2),
    user_value numeric(20,2),
    verify_value numeric(20,2),
    card_type public.credit_card_type,
    provider_id uuid,
    method_id uuid NOT NULL,
    till_id uuid NOT NULL,
    notes text,
    CONSTRAINT positive_user_value CHECK ((user_value >= (0)::numeric)),
    CONSTRAINT positive_verify_value CHECK ((verify_value >= (0)::numeric))
);


ALTER TABLE public.till_summary OWNER TO postgres;

--
-- Name: transaction_entry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction_entry (
    id bigint NOT NULL,
    te_time timestamp without time zone NOT NULL,
    metadata jsonb,
    te_server timestamp without time zone DEFAULT statement_timestamp(),
    sync_status bit(1) DEFAULT (0)::bit(1) NOT NULL
);


ALTER TABLE public.transaction_entry OWNER TO postgres;

--
-- Name: transaction_entry_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaction_entry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transaction_entry_id_seq OWNER TO postgres;

--
-- Name: transaction_entry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaction_entry_id_seq OWNED BY public.transaction_entry.id;


--
-- Name: transfer_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transfer_order (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('transfer_order'::text),
    identifier integer NOT NULL,
    open_date timestamp without time zone NOT NULL,
    receival_date timestamp without time zone,
    status public.transfer_order_status NOT NULL,
    comments text,
    cancel_reason text,
    cancel_date timestamp without time zone,
    source_branch_id uuid NOT NULL,
    destination_branch_id uuid NOT NULL,
    source_responsible_id uuid NOT NULL,
    destination_responsible_id uuid,
    invoice_id uuid,
    cancel_responsible_id uuid,
    station_id uuid NOT NULL
);


ALTER TABLE public.transfer_order OWNER TO postgres;

--
-- Name: transfer_order_identifier_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transfer_order_identifier_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transfer_order_identifier_seq OWNER TO postgres;

--
-- Name: transfer_order_identifier_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transfer_order_identifier_seq OWNED BY public.transfer_order.identifier;


--
-- Name: transfer_order_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transfer_order_item (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('transfer_order_item'::text),
    sellable_id uuid NOT NULL,
    batch_id uuid,
    transfer_order_id uuid,
    quantity numeric(20,3) NOT NULL,
    stock_cost numeric(20,8) DEFAULT 0 NOT NULL,
    icms_info_id uuid,
    ipi_info_id uuid,
    pis_info_id uuid,
    cofins_info_id uuid,
    CONSTRAINT positive_quantity CHECK ((quantity > (0)::numeric)),
    CONSTRAINT positive_stock_cost CHECK ((stock_cost >= (0)::numeric))
);


ALTER TABLE public.transfer_order_item OWNER TO postgres;

--
-- Name: transporter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transporter (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('transporter'::text),
    is_active boolean,
    open_contract_date timestamp without time zone,
    freight_percentage numeric(10,2) NOT NULL,
    person_id uuid,
    CONSTRAINT positive_freight_percentage CHECK ((freight_percentage >= (0)::numeric))
);


ALTER TABLE public.transporter OWNER TO postgres;

--
-- Name: ui_field; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ui_field (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('ui_field'::text),
    description text,
    field_name text,
    mandatory boolean,
    visible boolean,
    ui_form_id uuid
);


ALTER TABLE public.ui_field OWNER TO postgres;

--
-- Name: ui_form; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ui_form (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('ui_form'::text),
    description text,
    form_name text
);


ALTER TABLE public.ui_form OWNER TO postgres;

--
-- Name: user_branch_access; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_branch_access (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('user_branch_access'::text),
    user_id uuid NOT NULL,
    branch_id uuid NOT NULL
);


ALTER TABLE public.user_branch_access OWNER TO postgres;

--
-- Name: user_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_profile (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('user_profile'::text),
    name text,
    max_discount numeric(10,2) DEFAULT 0
);


ALTER TABLE public.user_profile OWNER TO postgres;

--
-- Name: voter_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.voter_data (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('voter_data'::text),
    number text,
    section text,
    zone text
);


ALTER TABLE public.voter_data OWNER TO postgres;

--
-- Name: work_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.work_order (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('work_order'::text),
    identifier integer NOT NULL,
    status public.work_order_status NOT NULL,
    description text,
    estimated_hours numeric(10,2),
    estimated_cost numeric(20,2),
    estimated_start timestamp without time zone,
    estimated_finish timestamp without time zone,
    open_date timestamp without time zone,
    approve_date timestamp without time zone,
    finish_date timestamp without time zone,
    is_rejected boolean DEFAULT false NOT NULL,
    defect_reported text,
    defect_detected text,
    quantity integer DEFAULT 1,
    wait_date timestamp without time zone,
    in_progress_date timestamp without time zone,
    deliver_date timestamp without time zone,
    client_informed_date timestamp without time zone,
    branch_id uuid,
    sellable_id uuid,
    quote_responsible_id uuid,
    execution_responsible_id uuid,
    category_id uuid,
    client_id uuid,
    sale_id uuid,
    current_branch_id uuid,
    execution_branch_id uuid,
    supplier_order text,
    station_id uuid NOT NULL,
    check_responsible_id uuid
);


ALTER TABLE public.work_order OWNER TO postgres;

--
-- Name: work_order_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.work_order_category (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('work_order_category'::text),
    name text NOT NULL,
    color text
);


ALTER TABLE public.work_order_category OWNER TO postgres;

--
-- Name: work_order_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.work_order_history (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('work_order_history'::text),
    date timestamp without time zone NOT NULL,
    what text NOT NULL,
    old_value text,
    new_value text,
    notes text,
    user_id uuid NOT NULL,
    work_order_id uuid NOT NULL
);


ALTER TABLE public.work_order_history OWNER TO postgres;

--
-- Name: work_order_identifier_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.work_order_identifier_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.work_order_identifier_seq OWNER TO postgres;

--
-- Name: work_order_identifier_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.work_order_identifier_seq OWNED BY public.work_order.identifier;


--
-- Name: work_order_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.work_order_item (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('work_order_item'::text),
    quantity numeric(20,3),
    quantity_decreased numeric(20,3),
    price numeric(20,2),
    sellable_id uuid,
    batch_id uuid,
    sale_item_id uuid,
    order_id uuid,
    purchase_item_id uuid
);


ALTER TABLE public.work_order_item OWNER TO postgres;

--
-- Name: work_order_package; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.work_order_package (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('work_order_package'::text),
    identifier text NOT NULL,
    status public.work_order_package_status NOT NULL,
    send_date timestamp without time zone,
    receive_date timestamp without time zone,
    send_responsible_id uuid,
    receive_responsible_id uuid,
    destination_branch_id uuid,
    source_branch_id uuid NOT NULL,
    CONSTRAINT different_branches CHECK ((source_branch_id <> destination_branch_id))
);


ALTER TABLE public.work_order_package OWNER TO postgres;

--
-- Name: work_order_package_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.work_order_package_item (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('work_order_package_item'::text),
    order_id uuid NOT NULL,
    package_id uuid NOT NULL
);


ALTER TABLE public.work_order_package_item OWNER TO postgres;

--
-- Name: work_permit_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.work_permit_data (
    id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    te_id bigint DEFAULT public.new_te('work_permit_data'::text),
    number text,
    series_number text,
    pis_number text,
    pis_bank text,
    pis_registry_date timestamp without time zone
);


ALTER TABLE public.work_permit_data OWNER TO postgres;

--
-- Name: branch_synchronization id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch_synchronization ALTER COLUMN id SET DEFAULT nextval('public.branch_synchronization_id_seq'::regclass);


--
-- Name: city_location id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city_location ALTER COLUMN id SET DEFAULT nextval('public.city_location_id_seq'::regclass);


--
-- Name: event id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event ALTER COLUMN id SET DEFAULT nextval('public.event_id_seq'::regclass);


--
-- Name: inventory identifier; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory ALTER COLUMN identifier SET DEFAULT nextval('public.inventory_identifier_seq'::regclass);


--
-- Name: loan identifier; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan ALTER COLUMN identifier SET DEFAULT nextval('public.loan_identifier_seq'::regclass);


--
-- Name: payment identifier; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment ALTER COLUMN identifier SET DEFAULT nextval('public.payment_identifier_seq'::regclass);


--
-- Name: payment_renegotiation identifier; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_renegotiation ALTER COLUMN identifier SET DEFAULT nextval('public.payment_renegotiation_identifier_seq'::regclass);


--
-- Name: production_order identifier; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_order ALTER COLUMN identifier SET DEFAULT nextval('public.production_order_identifier_seq'::regclass);


--
-- Name: purchase_order identifier; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_order ALTER COLUMN identifier SET DEFAULT nextval('public.purchase_order_identifier_seq'::regclass);


--
-- Name: quotation identifier; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quotation ALTER COLUMN identifier SET DEFAULT nextval('public.quotation_identifier_seq'::regclass);


--
-- Name: quote_group identifier; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quote_group ALTER COLUMN identifier SET DEFAULT nextval('public.quote_group_identifier_seq'::regclass);


--
-- Name: receiving_invoice identifier; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receiving_invoice ALTER COLUMN identifier SET DEFAULT nextval('public.receiving_invoice_identifier_seq'::regclass);


--
-- Name: receiving_order identifier; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receiving_order ALTER COLUMN identifier SET DEFAULT nextval('public.receiving_order_identifier_seq'::regclass);


--
-- Name: returned_sale identifier; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returned_sale ALTER COLUMN identifier SET DEFAULT nextval('public.returned_sale_identifier_seq'::regclass);


--
-- Name: sale identifier; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale ALTER COLUMN identifier SET DEFAULT nextval('public.sale_identifier_seq'::regclass);


--
-- Name: stock_decrease identifier; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_decrease ALTER COLUMN identifier SET DEFAULT nextval('public.stock_decrease_identifier_seq'::regclass);


--
-- Name: system_table id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_table ALTER COLUMN id SET DEFAULT nextval('public.system_table_id_seq'::regclass);


--
-- Name: till identifier; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.till ALTER COLUMN identifier SET DEFAULT nextval('public.till_identifier_seq'::regclass);


--
-- Name: till_entry identifier; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.till_entry ALTER COLUMN identifier SET DEFAULT nextval('public.till_entry_identifier_seq'::regclass);


--
-- Name: transaction_entry id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction_entry ALTER COLUMN id SET DEFAULT nextval('public.transaction_entry_id_seq'::regclass);


--
-- Name: transfer_order identifier; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_order ALTER COLUMN identifier SET DEFAULT nextval('public.transfer_order_identifier_seq'::regclass);


--
-- Name: work_order identifier; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order ALTER COLUMN identifier SET DEFAULT nextval('public.work_order_identifier_seq'::regclass);


--
-- Data for Name: access_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.access_token (id, te_id, token, issue_date, revoked, user_id, station_id) FROM stdin;
\.


--
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account (id, te_id, account_type, description, code, parent_id, station_id) FROM stdin;
0f2ed442-7f1a-11ed-b540-cdedf83415da	1	asset	Assets	\N	\N	\N
0f2ed443-7f1a-11ed-b540-cdedf83415da	2	bank	Banks	\N	\N	\N
0f2ed444-7f1a-11ed-b540-cdedf83415da	3	equity	Equity	\N	\N	\N
0f2ed445-7f1a-11ed-b540-cdedf83415da	4	expense	Expenses	\N	\N	\N
0f2ed446-7f1a-11ed-b540-cdedf83415da	5	bank	Imbalance	\N	\N	\N
0f2ed447-7f1a-11ed-b540-cdedf83415da	6	income	Income	\N	\N	\N
0f2ed448-7f1a-11ed-b540-cdedf83415da	7	cash	Tills	\N	\N	\N
105f1ed0-7f1a-11ed-b540-cdedf83415da	623	bank	Banco do Brasil	\N	0f2ed443-7f1a-11ed-b540-cdedf83415da	0facff84-7f1a-11ed-b540-cdedf83415da
105f1ed2-7f1a-11ed-b540-cdedf83415da	625	income	Conta de Investimento	\N	\N	0facff84-7f1a-11ed-b540-cdedf83415da
105f1ed3-7f1a-11ed-b540-cdedf83415da	626	income	Saldos Iniciais	\N	\N	0facff84-7f1a-11ed-b540-cdedf83415da
105f1ed4-7f1a-11ed-b540-cdedf83415da	627	expense	Aluguel	\N	0f2ed445-7f1a-11ed-b540-cdedf83415da	0facff84-7f1a-11ed-b540-cdedf83415da
105f1ed5-7f1a-11ed-b540-cdedf83415da	628	expense	Luz	\N	0f2ed445-7f1a-11ed-b540-cdedf83415da	0facff84-7f1a-11ed-b540-cdedf83415da
105f1ed6-7f1a-11ed-b540-cdedf83415da	629	expense	Salários	\N	0f2ed445-7f1a-11ed-b540-cdedf83415da	0facff84-7f1a-11ed-b540-cdedf83415da
105f1ed7-7f1a-11ed-b540-cdedf83415da	630	expense	Telefonia	\N	0f2ed445-7f1a-11ed-b540-cdedf83415da	0facff84-7f1a-11ed-b540-cdedf83415da
105f1ed8-7f1a-11ed-b540-cdedf83415da	631	expense	Impostos	\N	0f2ed445-7f1a-11ed-b540-cdedf83415da	0facff84-7f1a-11ed-b540-cdedf83415da
\.


--
-- Data for Name: account_transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_transaction (id, te_id, description, code, operation_type, value, source_account_id, account_id, date, payment_id) FROM stdin;
0ffa6bda-7f1a-11ed-b540-cdedf83415da	475	1/1 Money for sale 00001	00002	in	436.00	0f2ed446-7f1a-11ed-b540-cdedf83415da	0f2ed448-7f1a-11ed-b540-cdedf83415da	2022-12-18 18:22:23.22332	0ffa6bd2-7f1a-11ed-b540-cdedf83415da
1068dc54-7f1a-11ed-b540-cdedf83415da	632	Saldo inicial	010101	in	27378.82	0f2ed447-7f1a-11ed-b540-cdedf83415da	105f1ed0-7f1a-11ed-b540-cdedf83415da	2012-01-01 00:00:00	\N
1068dc55-7f1a-11ed-b540-cdedf83415da	633	Aluguel Janeiro	010102	in	850.00	105f1ed0-7f1a-11ed-b540-cdedf83415da	105f1ed4-7f1a-11ed-b540-cdedf83415da	2012-01-01 00:00:00	\N
1068dc56-7f1a-11ed-b540-cdedf83415da	634	Luz Fevereiro	010401	in	120.18	105f1ed0-7f1a-11ed-b540-cdedf83415da	105f1ed5-7f1a-11ed-b540-cdedf83415da	2012-01-04 00:00:00	\N
1068dc57-7f1a-11ed-b540-cdedf83415da	635	Conta telefonia	010801	in	79.90	105f1ed0-7f1a-11ed-b540-cdedf83415da	105f1ed7-7f1a-11ed-b540-cdedf83415da	2012-01-08 00:00:00	\N
1068dc58-7f1a-11ed-b540-cdedf83415da	636	Conta celular	011901	in	152.40	105f1ed0-7f1a-11ed-b540-cdedf83415da	105f1ed7-7f1a-11ed-b540-cdedf83415da	2012-01-19 00:00:00	\N
1068dc59-7f1a-11ed-b540-cdedf83415da	637	Receita Janeiro	012301	in	18374.00	0f2ed447-7f1a-11ed-b540-cdedf83415da	105f1ed0-7f1a-11ed-b540-cdedf83415da	2012-01-23 00:00:00	\N
1068dc5a-7f1a-11ed-b540-cdedf83415da	638	Impostos Janeiro	022701	in	6843.91	105f1ed0-7f1a-11ed-b540-cdedf83415da	105f1ed8-7f1a-11ed-b540-cdedf83415da	2012-01-27 00:00:00	\N
1068dc5b-7f1a-11ed-b540-cdedf83415da	639	Salarío Cleusa Janeiro	012801	in	945.82	105f1ed0-7f1a-11ed-b540-cdedf83415da	105f1ed6-7f1a-11ed-b540-cdedf83415da	2012-01-28 00:00:00	\N
1068dc5c-7f1a-11ed-b540-cdedf83415da	640	Salarío Deivis Janeiro	012802	in	1012.00	105f1ed0-7f1a-11ed-b540-cdedf83415da	105f1ed6-7f1a-11ed-b540-cdedf83415da	2012-01-28 00:00:00	\N
1068dc5d-7f1a-11ed-b540-cdedf83415da	641	Salarío Maria Janeiro	012803	in	934.94	105f1ed0-7f1a-11ed-b540-cdedf83415da	105f1ed6-7f1a-11ed-b540-cdedf83415da	2012-01-28 00:00:00	\N
1068dc5e-7f1a-11ed-b540-cdedf83415da	642	Salarío Osvaldo Janeiro	012804	in	1800.00	105f1ed0-7f1a-11ed-b540-cdedf83415da	105f1ed6-7f1a-11ed-b540-cdedf83415da	2012-01-28 00:00:00	\N
1068dc5f-7f1a-11ed-b540-cdedf83415da	643	Aluguel Fevereiro	020101	in	850.00	105f1ed0-7f1a-11ed-b540-cdedf83415da	105f1ed4-7f1a-11ed-b540-cdedf83415da	2012-02-01 00:00:00	\N
1068dc60-7f1a-11ed-b540-cdedf83415da	644	Luz Fevereiro	020104	in	138.48	105f1ed0-7f1a-11ed-b540-cdedf83415da	105f1ed5-7f1a-11ed-b540-cdedf83415da	2012-02-04 00:00:00	\N
1068dc61-7f1a-11ed-b540-cdedf83415da	645	Impostos Feveiro	022701	in	2834.39	105f1ed0-7f1a-11ed-b540-cdedf83415da	105f1ed8-7f1a-11ed-b540-cdedf83415da	2012-02-27 00:00:00	\N
1068dc62-7f1a-11ed-b540-cdedf83415da	646	Salarío Cleusa Fevereiro	022801	in	945.82	105f1ed0-7f1a-11ed-b540-cdedf83415da	105f1ed6-7f1a-11ed-b540-cdedf83415da	2012-02-28 00:00:00	\N
1068dc63-7f1a-11ed-b540-cdedf83415da	647	Salarío Deivis Fevereiro	022802	in	802.43	105f1ed0-7f1a-11ed-b540-cdedf83415da	105f1ed6-7f1a-11ed-b540-cdedf83415da	2012-02-28 00:00:00	\N
1068dc64-7f1a-11ed-b540-cdedf83415da	648	Salarío Maria Fevereiro	022803	in	954.23	105f1ed0-7f1a-11ed-b540-cdedf83415da	105f1ed6-7f1a-11ed-b540-cdedf83415da	2012-02-28 00:00:00	\N
1068dc65-7f1a-11ed-b540-cdedf83415da	649	Salarío Osvaldo Fevereiro	022804	in	1800.00	105f1ed0-7f1a-11ed-b540-cdedf83415da	105f1ed6-7f1a-11ed-b540-cdedf83415da	2012-02-28 00:00:00	\N
86772d04-82d2-11ed-b1d8-c16b6db879be	696	1/1 Money for order 00001	00001	out	7930.00	0f2ed446-7f1a-11ed-b540-cdedf83415da	0f2ed446-7f1a-11ed-b540-cdedf83415da	2022-12-23 00:00:00	0fddf1e0-7f1a-11ed-b540-cdedf83415da
5cef918c-8878-11ed-b1d8-c16b6db879be	767	1/3 Card for sale 00005	00018	in	154.00	0f2ed446-7f1a-11ed-b540-cdedf83415da	0f2ed446-7f1a-11ed-b540-cdedf83415da	2022-12-30 00:00:00	310b4dea-8878-11ed-b1d8-c16b6db879be
5235a615-8912-11ed-b1d8-c16b6db879be	814	1/2 Money for sale 00006	00021	in	1.00	0f2ed446-7f1a-11ed-b540-cdedf83415da	0f2ed448-7f1a-11ed-b540-cdedf83415da	2022-12-31 10:50:37.935869	3ee68084-8912-11ed-b1d8-c16b6db879be
e8c42209-8a05-11ed-b1d8-c16b6db879be	914	1/1 Money for sale 00007	00023	in	128.00	0f2ed446-7f1a-11ed-b540-cdedf83415da	0f2ed448-7f1a-11ed-b540-cdedf83415da	2023-01-01 15:55:38.857773	e8c42202-8a05-11ed-b1d8-c16b6db879be
\.


--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.address (id, te_id, street, streetnumber, district, postal_code, complement, is_main_address, person_id, city_location_id, coordinates) FROM stdin;
0f7506da-7f1a-11ed-b540-cdedf83415da	251	Avendia São Carlos	2333	Centro	13560-001		t	0f7506d8-7f1a-11ed-b540-cdedf83415da	4616	\N
0f7506df-7f1a-11ed-b540-cdedf83415da	256	Avenida Antônio Paschoal	1283	Centro	14170-700		t	0f7506dd-7f1a-11ed-b540-cdedf83415da	4646	\N
0f85b0ac-7f1a-11ed-b540-cdedf83415da	262	Rua das flores	1002	Vila Matilde			t	0f85b0aa-7f1a-11ed-b540-cdedf83415da	4176	\N
0f8e8c7c-7f1a-11ed-b540-cdedf83415da	267	Rua Principal	234	Centro			t	0f8e8c7a-7f1a-11ed-b540-cdedf83415da	4557	\N
0f962395-7f1a-11ed-b540-cdedf83415da	274	Rua das flores	90	Vila Matilde			t	0f962390-7f1a-11ed-b540-cdedf83415da	4632	\N
0f96239c-7f1a-11ed-b540-cdedf83415da	281	Rua XV de Novembro	232	Centro			t	0f962397-7f1a-11ed-b540-cdedf83415da	2850	\N
0f9623a3-7f1a-11ed-b540-cdedf83415da	288	Avenida Paulista	1211	Brigadeiro			t	0f96239e-7f1a-11ed-b540-cdedf83415da	467	\N
0f9623aa-7f1a-11ed-b540-cdedf83415da	295	Avenida Andradas	912	Pinheiros			t	0f9623a5-7f1a-11ed-b540-cdedf83415da	3490	\N
0fa3001c-7f1a-11ed-b540-cdedf83415da	299	Rua XV de Novembro	342	Centro			t	0fa3001a-7f1a-11ed-b540-cdedf83415da	2850	\N
0fa30020-7f1a-11ed-b540-cdedf83415da	303	Avenida Paulista	213	Brigadeiro			t	0fa3001e-7f1a-11ed-b540-cdedf83415da	4561	\N
0fa30024-7f1a-11ed-b540-cdedf83415da	307	Avenida Andradas	918	Pinheiros			t	0fa30022-7f1a-11ed-b540-cdedf83415da	1447	\N
0fa30028-7f1a-11ed-b540-cdedf83415da	311	Rua Brasil	1211	Brigadeiro			t	0fa30026-7f1a-11ed-b540-cdedf83415da	1	\N
7dbd70e1-7fa2-11ed-a8e6-7bb31e5c53d9	657	Rua Thiago da Fonseca	296	Capoeiras	88085-100	Casa	t	7dbd70de-7fa2-11ed-a8e6-7bb31e5c53d9	2551	\N
41fcbdc7-8877-11ed-b1d8-c16b6db879be	725	Av. Ivo Silveira	12	Santa Catarina			t	41fcbdc4-8877-11ed-b1d8-c16b6db879be	2551	\N
\.


--
-- Data for Name: attachment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attachment (id, te_id, name, mimetype, blob) FROM stdin;
\.


--
-- Data for Name: bank_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bank_account (id, te_id, bank_number, bank_branch, bank_account, bank_type, account_id) FROM stdin;
0ffa6bef-7f1a-11ed-b540-cdedf83415da	496	0			\N	\N
105f1ed1-7f1a-11ed-b540-cdedf83415da	624	1	1234-5	78901-2	\N	105f1ed0-7f1a-11ed-b540-cdedf83415da
\.


--
-- Data for Name: bill_option; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bill_option (id, te_id, option, value, bank_account_id) FROM stdin;
\.


--
-- Data for Name: branch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.branch (id, te_id, manager_id, is_active, crt, acronym, can_execute_foreign_work_orders, person_id, name, certificate_id, default_client_category_id) FROM stdin;
0f7506db-7f1a-11ed-b540-cdedf83415da	252	\N	t	1	\N	f	0f7506d8-7f1a-11ed-b540-cdedf83415da	\N	\N	\N
0f7506e0-7f1a-11ed-b540-cdedf83415da	257	\N	t	1	\N	f	0f7506dd-7f1a-11ed-b540-cdedf83415da	\N	\N	\N
\.


--
-- Data for Name: branch_station; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.branch_station (id, te_id, name, is_active, branch_id, code, type_id, has_kps_enabled) FROM stdin;
0facff84-7f1a-11ed-b540-cdedf83415da	313	Stoqlib station	t	0f7506db-7f1a-11ed-b540-cdedf83415da		\N	f
320e2b0c-7f1a-11ed-b540-cdedf83415da	651	gilberto	t	0f7506db-7f1a-11ed-b540-cdedf83415da		\N	f
\.


--
-- Data for Name: branch_synchronization; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.branch_synchronization (id, sync_time, policy, branch_id) FROM stdin;
\.


--
-- Data for Name: calls; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.calls (id, te_id, date, message, description, person_id, attendant_id) FROM stdin;
\.


--
-- Data for Name: card_operation_cost; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.card_operation_cost (id, te_id, device_id, provider_id, card_type, installment_start, installment_end, payment_days, fee, fare) FROM stdin;
\.


--
-- Data for Name: card_payment_device; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.card_payment_device (id, te_id, monthly_cost, description, supplier_id) FROM stdin;
0f48179d-7f1a-11ed-b540-cdedf83415da	157	\N	Default	\N
\.


--
-- Data for Name: certificate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.certificate (id, te_id, active, name, type, password, content, encrypted_password) FROM stdin;
\.


--
-- Data for Name: cfop_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cfop_data (id, te_id, code, description) FROM stdin;
0f2ed4cb-7f1a-11ed-b540-cdedf83415da	138	5.102	Venda de Mercadoria Adquirida
0f2ed4cd-7f1a-11ed-b540-cdedf83415da	140	1.202	Devolução de Venda de Mercadoria Adquirida
0f2ed4cf-7f1a-11ed-b540-cdedf83415da	142	1.102	Compra para Comercializacao
0f2ed4d1-7f1a-11ed-b540-cdedf83415da	144	5.949	Outra saída de mercadoria ou prestação de serviço não especificado
0f2ed4d3-7f1a-11ed-b540-cdedf83415da	146	5.202	Devolução de compra para comercialização
\.


--
-- Data for Name: check_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.check_data (id, te_id, payment_id, bank_account_id) FROM stdin;
0ffa6bf0-7f1a-11ed-b540-cdedf83415da	497	0ffa6bee-7f1a-11ed-b540-cdedf83415da	0ffa6bef-7f1a-11ed-b540-cdedf83415da
\.


--
-- Data for Name: city_location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.city_location (id, country, city, state, city_code, state_code) FROM stdin;
1	Brazil	Brasília	DF	5300108	53
2	Brazil	Alto Alegre	RR	1400050	14
3	Brazil	Amajari	RR	1400027	14
4	Brazil	Boa Vista	RR	1400100	14
5	Brazil	Bonfim	RR	1400159	14
6	Brazil	Cantá	RR	1400175	14
7	Brazil	Caracaraí	RR	1400209	14
8	Brazil	Caroebe	RR	1400233	14
9	Brazil	Iracema	RR	1400282	14
10	Brazil	Mucajaí	RR	1400308	14
11	Brazil	Normandia	RR	1400407	14
12	Brazil	Pacaraima	RR	1400456	14
13	Brazil	Rorainópolis	RR	1400472	14
14	Brazil	São João da Baliza	RR	1400506	14
15	Brazil	São Luiz	RR	1400605	14
16	Brazil	Uiramutã	RR	1400704	14
17	Brazil	Amapá	AP	1600105	16
18	Brazil	Calçoene	AP	1600204	16
19	Brazil	Cutias	AP	1600212	16
20	Brazil	Ferreira Gomes	AP	1600238	16
21	Brazil	Itaubal	AP	1600253	16
22	Brazil	Laranjal do Jari	AP	1600279	16
23	Brazil	Macapá	AP	1600303	16
24	Brazil	Mazagão	AP	1600402	16
25	Brazil	Oiapoque	AP	1600501	16
26	Brazil	Pedra Branca do Amapari	AP	1600154	16
27	Brazil	Porto Grande	AP	1600535	16
28	Brazil	Pracuúba	AP	1600550	16
29	Brazil	Santana	AP	1600600	16
30	Brazil	Serra do Navio	AP	1600055	16
31	Brazil	Tartarugalzinho	AP	1600709	16
32	Brazil	Vitória do Jari	AP	1600808	16
33	Brazil	Acrelândia	AC	1200013	12
34	Brazil	Assis Brasil	AC	1200054	12
35	Brazil	Brasiléia	AC	1200104	12
36	Brazil	Bujari	AC	1200138	12
37	Brazil	Capixaba	AC	1200179	12
38	Brazil	Cruzeiro do Sul	AC	1200203	12
39	Brazil	Epitaciolândia	AC	1200252	12
40	Brazil	Feijó	AC	1200302	12
41	Brazil	Jordão	AC	1200328	12
42	Brazil	Mâncio Lima	AC	1200336	12
43	Brazil	Manoel Urbano	AC	1200344	12
44	Brazil	Marechal Thaumaturgo	AC	1200351	12
45	Brazil	Plácido de Castro	AC	1200385	12
46	Brazil	Porto Acre	AC	1200807	12
47	Brazil	Porto Walter	AC	1200393	12
48	Brazil	Rio Branco	AC	1200401	12
49	Brazil	Rodrigues Alves	AC	1200427	12
50	Brazil	Santa Rosa do Purus	AC	1200435	12
51	Brazil	Sena Madureira	AC	1200500	12
52	Brazil	Senador Guiomard	AC	1200450	12
53	Brazil	Tarauacá	AC	1200609	12
54	Brazil	Xapuri	AC	1200708	12
55	Brazil	Alta Floresta D'Oeste	RO	1100015	11
56	Brazil	Alto Alegre dos Parecis	RO	1100379	11
57	Brazil	Alto Paraíso	RO	1100403	11
58	Brazil	Alvorada D'Oeste	RO	1100346	11
59	Brazil	Ariquemes	RO	1100023	11
60	Brazil	Buritis	RO	1100452	11
61	Brazil	Cabixi	RO	1100031	11
62	Brazil	Cacaulândia	RO	1100601	11
63	Brazil	Cacoal	RO	1100049	11
64	Brazil	Campo Novo de Rondônia	RO	1100700	11
65	Brazil	Candeias do Jamari	RO	1100809	11
66	Brazil	Castanheiras	RO	1100908	11
67	Brazil	Cerejeiras	RO	1100056	11
68	Brazil	Chupinguaia	RO	1100924	11
69	Brazil	Colorado do Oeste	RO	1100064	11
70	Brazil	Corumbiara	RO	1100072	11
71	Brazil	Costa Marques	RO	1100080	11
72	Brazil	Cujubim	RO	1100940	11
73	Brazil	Espigão D'Oeste	RO	1100098	11
74	Brazil	Governador Jorge Teixeira	RO	1101005	11
75	Brazil	Guajará-Mirim	RO	1100106	11
76	Brazil	Itapuã do Oeste	RO	1101104	11
77	Brazil	Jaru	RO	1100114	11
78	Brazil	Ji-Paraná	RO	1100122	11
79	Brazil	Machadinho D'Oeste	RO	1100130	11
80	Brazil	Ministro Andreazza	RO	1101203	11
81	Brazil	Mirante da Serra	RO	1101302	11
82	Brazil	Monte Negro	RO	1101401	11
83	Brazil	Nova Brasilândia D'Oeste	RO	1100148	11
84	Brazil	Nova Mamoré	RO	1100338	11
85	Brazil	Nova União	RO	1101435	11
86	Brazil	Novo Horizonte do Oeste	RO	1100502	11
87	Brazil	Ouro Preto do Oeste	RO	1100155	11
88	Brazil	Parecis	RO	1101450	11
89	Brazil	Pimenta Bueno	RO	1100189	11
90	Brazil	Pimenteiras do Oeste	RO	1101468	11
91	Brazil	Porto Velho	RO	1100205	11
92	Brazil	Presidente Médici	RO	1100254	11
93	Brazil	Primavera de Rondônia	RO	1101476	11
94	Brazil	Rio Crespo	RO	1100262	11
95	Brazil	Rolim de Moura	RO	1100288	11
96	Brazil	Santa Luzia D'Oeste	RO	1100296	11
97	Brazil	São Felipe D'Oeste	RO	1101484	11
98	Brazil	São Francisco do Guaporé	RO	1101492	11
99	Brazil	São Miguel do Guaporé	RO	1100320	11
100	Brazil	Seringueiras	RO	1101500	11
101	Brazil	Teixeirópolis	RO	1101559	11
102	Brazil	Theobroma	RO	1101609	11
103	Brazil	Urupá	RO	1101708	11
104	Brazil	Vale do Anari	RO	1101757	11
105	Brazil	Vale do Paraíso	RO	1101807	11
106	Brazil	Vilhena	RO	1100304	11
107	Brazil	Alvarães	AM	1300029	13
108	Brazil	Amaturá	AM	1300060	13
109	Brazil	Anamã	AM	1300086	13
110	Brazil	Anori	AM	1300102	13
111	Brazil	Apuí	AM	1300144	13
112	Brazil	Atalaia do Norte	AM	1300201	13
113	Brazil	Autazes	AM	1300300	13
114	Brazil	Barcelos	AM	1300409	13
115	Brazil	Barreirinha	AM	1300508	13
116	Brazil	Benjamin Constant	AM	1300607	13
117	Brazil	Beruri	AM	1300631	13
118	Brazil	Boa Vista do Ramos	AM	1300680	13
119	Brazil	Boca do Acre	AM	1300706	13
120	Brazil	Borba	AM	1300805	13
121	Brazil	Caapiranga	AM	1300839	13
122	Brazil	Canutama	AM	1300904	13
123	Brazil	Carauari	AM	1301001	13
124	Brazil	Careiro	AM	1301100	13
125	Brazil	Careiro da Várzea	AM	1301159	13
126	Brazil	Coari	AM	1301209	13
127	Brazil	Codajás	AM	1301308	13
128	Brazil	Eirunepé	AM	1301407	13
129	Brazil	Envira	AM	1301506	13
130	Brazil	Fonte Boa	AM	1301605	13
131	Brazil	Guajará	AM	1301654	13
132	Brazil	Humaitá	AM	1301704	13
133	Brazil	Ipixuna	AM	1301803	13
134	Brazil	Iranduba	AM	1301852	13
135	Brazil	Itacoatiara	AM	1301902	13
136	Brazil	Itamarati	AM	1301951	13
137	Brazil	Itapiranga	AM	1302009	13
138	Brazil	Japurá	AM	1302108	13
139	Brazil	Juruá	AM	1302207	13
140	Brazil	Jutaí	AM	1302306	13
141	Brazil	Lábrea	AM	1302405	13
142	Brazil	Manacapuru	AM	1302504	13
143	Brazil	Manaquiri	AM	1302553	13
144	Brazil	Manaus	AM	1302603	13
145	Brazil	Manicoré	AM	1302702	13
146	Brazil	Maraã	AM	1302801	13
147	Brazil	Maués	AM	1302900	13
148	Brazil	Nhamundá	AM	1303007	13
149	Brazil	Nova Olinda do Norte	AM	1303106	13
150	Brazil	Novo Airão	AM	1303205	13
151	Brazil	Novo Aripuanã	AM	1303304	13
152	Brazil	Parintins	AM	1303403	13
153	Brazil	Pauini	AM	1303502	13
154	Brazil	Presidente Figueiredo	AM	1303536	13
155	Brazil	Rio Preto da Eva	AM	1303569	13
156	Brazil	Santa Isabel do Rio Negro	AM	1303601	13
157	Brazil	Santo Antônio do Içá	AM	1303700	13
158	Brazil	São Gabriel da Cachoeira	AM	1303809	13
159	Brazil	São Paulo de Olivença	AM	1303908	13
160	Brazil	São Sebastião do Uatumã	AM	1303957	13
161	Brazil	Silves	AM	1304005	13
162	Brazil	Tabatinga	AM	1304062	13
163	Brazil	Tapauá	AM	1304104	13
164	Brazil	Tefé	AM	1304203	13
165	Brazil	Tonantins	AM	1304237	13
166	Brazil	Uarini	AM	1304260	13
167	Brazil	Urucará	AM	1304302	13
168	Brazil	Urucurituba	AM	1304401	13
169	Brazil	Amparo de São Francisco	SE	2800100	28
170	Brazil	Aquidabã	SE	2800209	28
171	Brazil	Aracaju	SE	2800308	28
172	Brazil	Arauá	SE	2800407	28
173	Brazil	Areia Branca	SE	2800506	28
174	Brazil	Barra dos Coqueiros	SE	2800605	28
175	Brazil	Boquim	SE	2800670	28
176	Brazil	Brejo Grande	SE	2800704	28
177	Brazil	Campo do Brito	SE	2801009	28
178	Brazil	Canhoba	SE	2801108	28
179	Brazil	Canindé de São Francisco	SE	2801207	28
180	Brazil	Capela	SE	2801306	28
181	Brazil	Carira	SE	2801405	28
182	Brazil	Carmópolis	SE	2801504	28
183	Brazil	Cedro de São João	SE	2801603	28
184	Brazil	Cristinápolis	SE	2801702	28
185	Brazil	Cumbe	SE	2801900	28
186	Brazil	Divina Pastora	SE	2802007	28
187	Brazil	Estância	SE	2802106	28
188	Brazil	Feira Nova	SE	2802205	28
189	Brazil	Frei Paulo	SE	2802304	28
190	Brazil	Gararu	SE	2802403	28
191	Brazil	General Maynard	SE	2802502	28
192	Brazil	Gracho Cardoso	SE	2802601	28
193	Brazil	Ilha das Flores	SE	2802700	28
194	Brazil	Indiaroba	SE	2802809	28
195	Brazil	Itabaiana	SE	2802908	28
196	Brazil	Itabaianinha	SE	2803005	28
197	Brazil	Itabi	SE	2803104	28
198	Brazil	Itaporanga d'Ajuda	SE	2803203	28
199	Brazil	Japaratuba	SE	2803302	28
200	Brazil	Japoatã	SE	2803401	28
201	Brazil	Lagarto	SE	2803500	28
202	Brazil	Laranjeiras	SE	2803609	28
203	Brazil	Macambira	SE	2803708	28
204	Brazil	Malhada dos Bois	SE	2803807	28
205	Brazil	Malhador	SE	2803906	28
206	Brazil	Maruim	SE	2804003	28
207	Brazil	Moita Bonita	SE	2804102	28
208	Brazil	Monte Alegre de Sergipe	SE	2804201	28
209	Brazil	Muribeca	SE	2804300	28
210	Brazil	Neópolis	SE	2804409	28
211	Brazil	Nossa Senhora Aparecida	SE	2804458	28
212	Brazil	Nossa Senhora da Glória	SE	2804508	28
213	Brazil	Nossa Senhora das Dores	SE	2804607	28
214	Brazil	Nossa Senhora de Lourdes	SE	2804706	28
215	Brazil	Nossa Senhora do Socorro	SE	2804805	28
216	Brazil	Pacatuba	SE	2804904	28
217	Brazil	Pedra Mole	SE	2805000	28
218	Brazil	Pedrinhas	SE	2805109	28
219	Brazil	Pinhão	SE	2805208	28
220	Brazil	Pirambu	SE	2805307	28
221	Brazil	Poço Redondo	SE	2805406	28
222	Brazil	Poço Verde	SE	2805505	28
223	Brazil	Porto da Folha	SE	2805604	28
224	Brazil	Propriá	SE	2805703	28
225	Brazil	Riachão do Dantas	SE	2805802	28
226	Brazil	Riachuelo	SE	2805901	28
227	Brazil	Ribeirópolis	SE	2806008	28
228	Brazil	Rosário do Catete	SE	2806107	28
229	Brazil	Salgado	SE	2806206	28
230	Brazil	Santa Luzia do Itanhy	SE	2806305	28
231	Brazil	Santa Rosa de Lima	SE	2806503	28
232	Brazil	Santana do São Francisco	SE	2806404	28
233	Brazil	Santo Amaro das Brotas	SE	2806602	28
234	Brazil	São Cristóvão	SE	2806701	28
235	Brazil	São Domingos	SE	2806800	28
236	Brazil	São Francisco	SE	2806909	28
237	Brazil	São Miguel do Aleixo	SE	2807006	28
238	Brazil	Simão Dias	SE	2807105	28
239	Brazil	Siriri	SE	2807204	28
240	Brazil	Telha	SE	2807303	28
241	Brazil	Tobias Barreto	SE	2807402	28
242	Brazil	Tomar do Geru	SE	2807501	28
243	Brazil	Umbaúba	SE	2807600	28
244	Brazil	Afonso Cláudio	ES	3200102	32
245	Brazil	Água Doce do Norte	ES	3200169	32
246	Brazil	Águia Branca	ES	3200136	32
247	Brazil	Alegre	ES	3200201	32
248	Brazil	Alfredo Chaves	ES	3200300	32
249	Brazil	Alto Rio Novo	ES	3200359	32
250	Brazil	Anchieta	ES	3200409	32
251	Brazil	Apiacá	ES	3200508	32
252	Brazil	Aracruz	ES	3200607	32
253	Brazil	Atilio Vivacqua	ES	3200706	32
254	Brazil	Baixo Guandu	ES	3200805	32
255	Brazil	Barra de São Francisco	ES	3200904	32
256	Brazil	Boa Esperança	ES	3201001	32
257	Brazil	Bom Jesus do Norte	ES	3201100	32
258	Brazil	Brejetuba	ES	3201159	32
259	Brazil	Cachoeiro de Itapemirim	ES	3201209	32
260	Brazil	Cariacica	ES	3201308	32
261	Brazil	Castelo	ES	3201407	32
262	Brazil	Colatina	ES	3201506	32
263	Brazil	Conceição da Barra	ES	3201605	32
264	Brazil	Conceição do Castelo	ES	3201704	32
265	Brazil	Divino de São Lourenço	ES	3201803	32
266	Brazil	Domingos Martins	ES	3201902	32
267	Brazil	Dores do Rio Preto	ES	3202009	32
268	Brazil	Ecoporanga	ES	3202108	32
269	Brazil	Fundão	ES	3202207	32
270	Brazil	Governador Lindenberg	ES	3202256	32
271	Brazil	Guaçuí	ES	3202306	32
272	Brazil	Guarapari	ES	3202405	32
273	Brazil	Ibatiba	ES	3202454	32
274	Brazil	Ibiraçu	ES	3202504	32
275	Brazil	Ibitirama	ES	3202553	32
276	Brazil	Iconha	ES	3202603	32
277	Brazil	Irupi	ES	3202652	32
278	Brazil	Itaguaçu	ES	3202702	32
279	Brazil	Itapemirim	ES	3202801	32
280	Brazil	Itarana	ES	3202900	32
281	Brazil	Iúna	ES	3203007	32
282	Brazil	Jaguaré	ES	3203056	32
283	Brazil	Jerônimo Monteiro	ES	3203106	32
284	Brazil	João Neiva	ES	3203130	32
285	Brazil	Laranja da Terra	ES	3203163	32
286	Brazil	Linhares	ES	3203205	32
287	Brazil	Mantenópolis	ES	3203304	32
288	Brazil	Marataízes	ES	3203320	32
289	Brazil	Marechal Floriano	ES	3203346	32
290	Brazil	Marilândia	ES	3203353	32
291	Brazil	Mimoso do Sul	ES	3203403	32
292	Brazil	Montanha	ES	3203502	32
293	Brazil	Mucurici	ES	3203601	32
294	Brazil	Muniz Freire	ES	3203700	32
295	Brazil	Muqui	ES	3203809	32
296	Brazil	Nova Venécia	ES	3203908	32
297	Brazil	Pancas	ES	3204005	32
298	Brazil	Pedro Canário	ES	3204054	32
299	Brazil	Pinheiros	ES	3204104	32
300	Brazil	Piúma	ES	3204203	32
301	Brazil	Ponto Belo	ES	3204252	32
302	Brazil	Presidente Kennedy	ES	3204302	32
303	Brazil	Rio Bananal	ES	3204351	32
304	Brazil	Rio Novo do Sul	ES	3204401	32
305	Brazil	Santa Leopoldina	ES	3204500	32
306	Brazil	Santa Maria de Jetibá	ES	3204559	32
307	Brazil	Santa Teresa	ES	3204609	32
308	Brazil	São Domingos do Norte	ES	3204658	32
309	Brazil	São Gabriel da Palha	ES	3204708	32
310	Brazil	São José do Calçado	ES	3204807	32
311	Brazil	São Mateus	ES	3204906	32
312	Brazil	São Roque do Canaã	ES	3204955	32
313	Brazil	Serra	ES	3205002	32
314	Brazil	Sooretama	ES	3205010	32
315	Brazil	Vargem Alta	ES	3205036	32
316	Brazil	Venda Nova do Imigrante	ES	3205069	32
317	Brazil	Viana	ES	3205101	32
318	Brazil	Vila Pavão	ES	3205150	32
319	Brazil	Vila Valério	ES	3205176	32
320	Brazil	Vila Velha	ES	3205200	32
321	Brazil	Vitória	ES	3205309	32
322	Brazil	Água Clara	MS	5000203	50
323	Brazil	Alcinópolis	MS	5000252	50
324	Brazil	Amambaí	MS	5000609	50
325	Brazil	Anastácio	MS	5000708	50
326	Brazil	Anaurilândia	MS	5000807	50
327	Brazil	Angélica	MS	5000856	50
328	Brazil	Antônio João	MS	5000906	50
329	Brazil	Aparecida do Taboado	MS	5001003	50
330	Brazil	Aquidauana	MS	5001102	50
331	Brazil	Aral Moreira	MS	5001243	50
332	Brazil	Bandeirantes	MS	5001508	50
333	Brazil	Bataguassu	MS	5001904	50
334	Brazil	Batayporã	MS	5002001	50
335	Brazil	Bela Vista	MS	5002100	50
336	Brazil	Bodoquena	MS	5002159	50
337	Brazil	Bonito	MS	5002209	50
338	Brazil	Brasilândia	MS	5002308	50
339	Brazil	Caarapó	MS	5002407	50
340	Brazil	Camapuã	MS	5002605	50
341	Brazil	Campo Grande	MS	5002704	50
342	Brazil	Caracol	MS	5002803	50
343	Brazil	Cassilândia	MS	5002902	50
344	Brazil	Chapadão do Sul	MS	5002951	50
345	Brazil	Corguinho	MS	5003108	50
346	Brazil	Coronel Sapucaia	MS	5003157	50
347	Brazil	Corumbá	MS	5003207	50
348	Brazil	Costa Rica	MS	5003256	50
349	Brazil	Coxim	MS	5003306	50
350	Brazil	Deodápolis	MS	5003454	50
351	Brazil	Dois Irmãos do Buriti	MS	5003488	50
352	Brazil	Douradina	MS	5003504	50
353	Brazil	Dourados	MS	5003702	50
354	Brazil	Eldorado	MS	5003751	50
355	Brazil	Fátima do Sul	MS	5003801	50
356	Brazil	Figueirão	MS	5003900	50
357	Brazil	Glória de Dourados	MS	5004007	50
358	Brazil	Guia Lopes da Laguna	MS	5004106	50
359	Brazil	Iguatemi	MS	5004304	50
360	Brazil	Inocência	MS	5004403	50
361	Brazil	Itaporã	MS	5004502	50
362	Brazil	Itaquiraí	MS	5004601	50
363	Brazil	Ivinhema	MS	5004700	50
364	Brazil	Japorã	MS	5004809	50
365	Brazil	Jaraguari	MS	5004908	50
366	Brazil	Jardim	MS	5005004	50
367	Brazil	Jateí	MS	5005103	50
368	Brazil	Juti	MS	5005152	50
369	Brazil	Ladário	MS	5005202	50
370	Brazil	Laguna Carapã	MS	5005251	50
371	Brazil	Maracaju	MS	5005400	50
372	Brazil	Miranda	MS	5005608	50
373	Brazil	Mundo Novo	MS	5005681	50
374	Brazil	Naviraí	MS	5005707	50
375	Brazil	Nioaque	MS	5005806	50
376	Brazil	Nova Alvorada do Sul	MS	5006002	50
377	Brazil	Nova Andradina	MS	5006200	50
378	Brazil	Novo Horizonte do Sul	MS	5006259	50
379	Brazil	Paranaíba	MS	5006309	50
380	Brazil	Paranhos	MS	5006358	50
381	Brazil	Pedro Gomes	MS	5006408	50
382	Brazil	Ponta Porã	MS	5006606	50
383	Brazil	Porto Murtinho	MS	5006903	50
384	Brazil	Ribas do Rio Pardo	MS	5007109	50
385	Brazil	Rio Brilhante	MS	5007208	50
386	Brazil	Rio Negro	MS	5007307	50
387	Brazil	Rio Verde de Mato Grosso	MS	5007406	50
388	Brazil	Rochedo	MS	5007505	50
389	Brazil	Santa Rita do Pardo	MS	5007554	50
390	Brazil	São Gabriel do Oeste	MS	5007695	50
391	Brazil	Selvíria	MS	5007802	50
392	Brazil	Sete Quedas	MS	5007703	50
393	Brazil	Sidrolândia	MS	5007901	50
394	Brazil	Sonora	MS	5007935	50
395	Brazil	Tacuru	MS	5007950	50
396	Brazil	Taquarussu	MS	5007976	50
397	Brazil	Terenos	MS	5008008	50
398	Brazil	Três Lagoas	MS	5008305	50
399	Brazil	Vicentina	MS	5008404	50
400	Brazil	Angra dos Reis	RJ	3300100	33
401	Brazil	Aperibé	RJ	3300159	33
402	Brazil	Araruama	RJ	3300209	33
403	Brazil	Areal	RJ	3300225	33
404	Brazil	Armação dos Búzios	RJ	3300233	33
405	Brazil	Arraial do Cabo	RJ	3300258	33
406	Brazil	Barra do Piraí	RJ	3300308	33
407	Brazil	Barra Mansa	RJ	3300407	33
408	Brazil	Belford Roxo	RJ	3300456	33
409	Brazil	Bom Jardim	RJ	3300506	33
410	Brazil	Bom Jesus do Itabapoana	RJ	3300605	33
411	Brazil	Cabo Frio	RJ	3300704	33
412	Brazil	Cachoeiras de Macacu	RJ	3300803	33
413	Brazil	Cambuci	RJ	3300902	33
414	Brazil	Campos dos Goytacazes	RJ	3301009	33
415	Brazil	Cantagalo	RJ	3301108	33
416	Brazil	Carapebus	RJ	3300936	33
417	Brazil	Cardoso Moreira	RJ	3301157	33
418	Brazil	Carmo	RJ	3301207	33
419	Brazil	Casimiro de Abreu	RJ	3301306	33
420	Brazil	Comendador Levy Gasparian	RJ	3300951	33
421	Brazil	Conceição de Macabu	RJ	3301405	33
422	Brazil	Cordeiro	RJ	3301504	33
423	Brazil	Duas Barras	RJ	3301603	33
424	Brazil	Duque de Caxias	RJ	3301702	33
425	Brazil	Engenheiro Paulo de Frontin	RJ	3301801	33
426	Brazil	Guapimirim	RJ	3301850	33
427	Brazil	Iguaba Grande	RJ	3301876	33
428	Brazil	Itaboraí	RJ	3301900	33
429	Brazil	Itaguaí	RJ	3302007	33
430	Brazil	Italva	RJ	3302056	33
431	Brazil	Itaocara	RJ	3302106	33
432	Brazil	Itaperuna	RJ	3302205	33
433	Brazil	Itatiaia	RJ	3302254	33
434	Brazil	Japeri	RJ	3302270	33
435	Brazil	Laje do Muriaé	RJ	3302304	33
436	Brazil	Macaé	RJ	3302403	33
437	Brazil	Macuco	RJ	3302452	33
438	Brazil	Magé	RJ	3302502	33
439	Brazil	Mangaratiba	RJ	3302601	33
440	Brazil	Maricá	RJ	3302700	33
441	Brazil	Mendes	RJ	3302809	33
442	Brazil	Mesquita	RJ	3302858	33
443	Brazil	Miguel Pereira	RJ	3302908	33
444	Brazil	Miracema	RJ	3303005	33
445	Brazil	Natividade	RJ	3303104	33
446	Brazil	Nilópolis	RJ	3303203	33
447	Brazil	Niterói	RJ	3303302	33
448	Brazil	Nova Friburgo	RJ	3303401	33
449	Brazil	Nova Iguaçu	RJ	3303500	33
450	Brazil	Paracambi	RJ	3303609	33
451	Brazil	Paraíba do Sul	RJ	3303708	33
452	Brazil	Parati	RJ	3303807	33
453	Brazil	Paty do Alferes	RJ	3303856	33
454	Brazil	Petrópolis	RJ	3303906	33
455	Brazil	Pinheiral	RJ	3303955	33
456	Brazil	Piraí	RJ	3304003	33
457	Brazil	Porciúncula	RJ	3304102	33
458	Brazil	Porto Real	RJ	3304110	33
459	Brazil	Quatis	RJ	3304128	33
460	Brazil	Queimados	RJ	3304144	33
461	Brazil	Quissamã	RJ	3304151	33
462	Brazil	Resende	RJ	3304201	33
463	Brazil	Rio Bonito	RJ	3304300	33
464	Brazil	Rio Claro	RJ	3304409	33
465	Brazil	Rio das Flores	RJ	3304508	33
466	Brazil	Rio das Ostras	RJ	3304524	33
467	Brazil	Rio de Janeiro	RJ	3304557	33
468	Brazil	Santa Maria Madalena	RJ	3304607	33
469	Brazil	Santo Antônio de Pádua	RJ	3304706	33
470	Brazil	São Fidélis	RJ	3304805	33
471	Brazil	São Francisco de Itabapoana	RJ	3304755	33
472	Brazil	São Gonçalo	RJ	3304904	33
473	Brazil	São João da Barra	RJ	3305000	33
474	Brazil	São João de Meriti	RJ	3305109	33
475	Brazil	São José de Ubá	RJ	3305133	33
476	Brazil	São José do Vale do Rio Preto	RJ	3305158	33
477	Brazil	São Pedro da Aldeia	RJ	3305208	33
478	Brazil	São Sebastião do Alto	RJ	3305307	33
479	Brazil	Sapucaia	RJ	3305406	33
480	Brazil	Saquarema	RJ	3305505	33
481	Brazil	Seropédica	RJ	3305554	33
482	Brazil	Silva Jardim	RJ	3305604	33
483	Brazil	Sumidouro	RJ	3305703	33
484	Brazil	Tanguá	RJ	3305752	33
485	Brazil	Teresópolis	RJ	3305802	33
486	Brazil	Trajano de Morais	RJ	3305901	33
487	Brazil	Três Rios	RJ	3306008	33
488	Brazil	Valença	RJ	3306107	33
489	Brazil	Varre-Sai	RJ	3306156	33
490	Brazil	Vassouras	RJ	3306206	33
491	Brazil	Volta Redonda	RJ	3306305	33
492	Brazil	Água Branca	AL	2700102	27
493	Brazil	Anadia	AL	2700201	27
494	Brazil	Arapiraca	AL	2700300	27
495	Brazil	Atalaia	AL	2700409	27
496	Brazil	Barra de Santo Antônio	AL	2700508	27
497	Brazil	Barra de São Miguel	AL	2700607	27
498	Brazil	Batalha	AL	2700706	27
499	Brazil	Belém	AL	2700805	27
500	Brazil	Belo Monte	AL	2700904	27
501	Brazil	Boca da Mata	AL	2701001	27
502	Brazil	Branquinha	AL	2701100	27
503	Brazil	Cacimbinhas	AL	2701209	27
504	Brazil	Cajueiro	AL	2701308	27
505	Brazil	Campestre	AL	2701357	27
506	Brazil	Campo Alegre	AL	2701407	27
507	Brazil	Campo Grande	AL	2701506	27
508	Brazil	Canapi	AL	2701605	27
509	Brazil	Capela	AL	2701704	27
510	Brazil	Carneiros	AL	2701803	27
511	Brazil	Chã Preta	AL	2701902	27
512	Brazil	Coité do Nóia	AL	2702009	27
513	Brazil	Colônia Leopoldina	AL	2702108	27
514	Brazil	Coqueiro Seco	AL	2702207	27
515	Brazil	Coruripe	AL	2702306	27
516	Brazil	Craíbas	AL	2702355	27
517	Brazil	Delmiro Gouveia	AL	2702405	27
518	Brazil	Dois Riachos	AL	2702504	27
519	Brazil	Estrela de Alagoas	AL	2702553	27
520	Brazil	Feira Grande	AL	2702603	27
521	Brazil	Feliz Deserto	AL	2702702	27
522	Brazil	Flexeiras	AL	2702801	27
523	Brazil	Girau do Ponciano	AL	2702900	27
524	Brazil	Ibateguara	AL	2703007	27
525	Brazil	Igaci	AL	2703106	27
526	Brazil	Igreja Nova	AL	2703205	27
527	Brazil	Inhapi	AL	2703304	27
528	Brazil	Jacaré dos Homens	AL	2703403	27
529	Brazil	Jacuípe	AL	2703502	27
530	Brazil	Japaratinga	AL	2703601	27
531	Brazil	Jaramataia	AL	2703700	27
532	Brazil	Jequiá da Praia	AL	2703759	27
533	Brazil	Joaquim Gomes	AL	2703809	27
534	Brazil	Jundiá	AL	2703908	27
535	Brazil	Junqueiro	AL	2704005	27
536	Brazil	Lagoa da Canoa	AL	2704104	27
537	Brazil	Limoeiro de Anadia	AL	2704203	27
538	Brazil	Maceió	AL	2704302	27
539	Brazil	Major Isidoro	AL	2704401	27
540	Brazil	Mar Vermelho	AL	2704906	27
541	Brazil	Maragogi	AL	2704500	27
542	Brazil	Maravilha	AL	2704609	27
543	Brazil	Marechal Deodoro	AL	2704708	27
544	Brazil	Maribondo	AL	2704807	27
545	Brazil	Mata Grande	AL	2705002	27
546	Brazil	Matriz de Camaragibe	AL	2705101	27
547	Brazil	Messias	AL	2705200	27
548	Brazil	Minador do Negrão	AL	2705309	27
549	Brazil	Monteirópolis	AL	2705408	27
550	Brazil	Murici	AL	2705507	27
551	Brazil	Novo Lino	AL	2705606	27
552	Brazil	Olho d'Água das Flores	AL	2705705	27
553	Brazil	Olho d'Água do Casado	AL	2705804	27
554	Brazil	Olho d'Água Grande	AL	2705903	27
555	Brazil	Olivença	AL	2706000	27
556	Brazil	Ouro Branco	AL	2706109	27
557	Brazil	Palestina	AL	2706208	27
558	Brazil	Palmeira dos Índios	AL	2706307	27
559	Brazil	Pão de Açúcar	AL	2706406	27
560	Brazil	Pariconha	AL	2706422	27
561	Brazil	Paripueira	AL	2706448	27
562	Brazil	Passo de Camaragibe	AL	2706505	27
563	Brazil	Paulo Jacinto	AL	2706604	27
564	Brazil	Penedo	AL	2706703	27
565	Brazil	Piaçabuçu	AL	2706802	27
566	Brazil	Pilar	AL	2706901	27
567	Brazil	Pindoba	AL	2707008	27
568	Brazil	Piranhas	AL	2707107	27
569	Brazil	Poço das Trincheiras	AL	2707206	27
570	Brazil	Porto Calvo	AL	2707305	27
571	Brazil	Porto de Pedras	AL	2707404	27
572	Brazil	Porto Real do Colégio	AL	2707503	27
573	Brazil	Quebrangulo	AL	2707602	27
574	Brazil	Rio Largo	AL	2707701	27
575	Brazil	Roteiro	AL	2707800	27
576	Brazil	Santa Luzia do Norte	AL	2707909	27
577	Brazil	Santana do Ipanema	AL	2708006	27
578	Brazil	Santana do Mundaú	AL	2708105	27
579	Brazil	São Brás	AL	2708204	27
580	Brazil	São José da Laje	AL	2708303	27
581	Brazil	São José da Tapera	AL	2708402	27
582	Brazil	São Luís do Quitunde	AL	2708501	27
583	Brazil	São Miguel dos Campos	AL	2708600	27
584	Brazil	São Miguel dos Milagres	AL	2708709	27
585	Brazil	São Sebastião	AL	2708808	27
586	Brazil	Satuba	AL	2708907	27
587	Brazil	Senador Rui Palmeira	AL	2708956	27
588	Brazil	Tanque d'Arca	AL	2709004	27
589	Brazil	Taquarana	AL	2709103	27
590	Brazil	Teotônio Vilela	AL	2709152	27
591	Brazil	Traipu	AL	2709202	27
592	Brazil	União dos Palmares	AL	2709301	27
593	Brazil	Viçosa	AL	2709400	27
594	Brazil	Abreulândia	TO	1700251	17
595	Brazil	Aguiarnópolis	TO	1700301	17
596	Brazil	Aliança do Tocantins	TO	1700350	17
597	Brazil	Almas	TO	1700400	17
598	Brazil	Alvorada	TO	1700707	17
599	Brazil	Ananás	TO	1701002	17
600	Brazil	Angico	TO	1701051	17
601	Brazil	Aparecida do Rio Negro	TO	1701101	17
602	Brazil	Aragominas	TO	1701309	17
603	Brazil	Araguacema	TO	1701903	17
604	Brazil	Araguaçu	TO	1702000	17
605	Brazil	Araguaína	TO	1702109	17
606	Brazil	Araguanã	TO	1702158	17
607	Brazil	Araguatins	TO	1702208	17
608	Brazil	Arapoema	TO	1702307	17
609	Brazil	Arraias	TO	1702406	17
610	Brazil	Augustinópolis	TO	1702554	17
611	Brazil	Aurora do Tocantins	TO	1702703	17
612	Brazil	Axixá do Tocantins	TO	1702901	17
613	Brazil	Babaçulândia	TO	1703008	17
614	Brazil	Bandeirantes do Tocantins	TO	1703057	17
615	Brazil	Barra do Ouro	TO	1703073	17
616	Brazil	Barrolândia	TO	1703107	17
617	Brazil	Bernardo Sayão	TO	1703206	17
618	Brazil	Bom Jesus do Tocantins	TO	1703305	17
619	Brazil	Brasilândia do Tocantins	TO	1703602	17
620	Brazil	Brejinho de Nazaré	TO	1703701	17
621	Brazil	Buriti do Tocantins	TO	1703800	17
622	Brazil	Cachoeirinha	TO	1703826	17
623	Brazil	Campos Lindos	TO	1703842	17
624	Brazil	Cariri do Tocantins	TO	1703867	17
625	Brazil	Carmolândia	TO	1703883	17
626	Brazil	Carrasco Bonito	TO	1703891	17
627	Brazil	Caseara	TO	1703909	17
628	Brazil	Centenário	TO	1704105	17
629	Brazil	Chapada da Natividade	TO	1705102	17
630	Brazil	Chapada de Areia	TO	1704600	17
631	Brazil	Colinas do Tocantins	TO	1705508	17
632	Brazil	Colméia	TO	1716703	17
633	Brazil	Combinado	TO	1705557	17
634	Brazil	Conceição do Tocantins	TO	1705607	17
635	Brazil	Couto de Magalhães	TO	1706001	17
636	Brazil	Cristalândia	TO	1706100	17
637	Brazil	Crixás do Tocantins	TO	1706258	17
638	Brazil	Darcinópolis	TO	1706506	17
639	Brazil	Dianópolis	TO	1707009	17
640	Brazil	Divinópolis do Tocantins	TO	1707108	17
641	Brazil	Dois Irmãos do Tocantins	TO	1707207	17
642	Brazil	Dueré	TO	1707306	17
643	Brazil	Esperantina	TO	1707405	17
644	Brazil	Fátima	TO	1707553	17
645	Brazil	Figueirópolis	TO	1707652	17
646	Brazil	Filadélfia	TO	1707702	17
647	Brazil	Formoso do Araguaia	TO	1708205	17
648	Brazil	Fortaleza do Tabocão	TO	1708254	17
649	Brazil	Goianorte	TO	1708304	17
650	Brazil	Goiatins	TO	1709005	17
651	Brazil	Guaraí	TO	1709302	17
652	Brazil	Gurupi	TO	1709500	17
653	Brazil	Ipueiras	TO	1709807	17
654	Brazil	Itacajá	TO	1710508	17
655	Brazil	Itaguatins	TO	1710706	17
656	Brazil	Itapiratins	TO	1710904	17
657	Brazil	Itaporã do Tocantins	TO	1711100	17
658	Brazil	Jaú do Tocantins	TO	1711506	17
659	Brazil	Juarina	TO	1711803	17
660	Brazil	Lagoa da Confusão	TO	1711902	17
661	Brazil	Lagoa do Tocantins	TO	1711951	17
662	Brazil	Lajeado	TO	1712009	17
663	Brazil	Lavandeira	TO	1712157	17
664	Brazil	Lizarda	TO	1712405	17
665	Brazil	Luzinópolis	TO	1712454	17
666	Brazil	Marianópolis do Tocantins	TO	1712504	17
667	Brazil	Mateiros	TO	1712702	17
668	Brazil	Maurilândia do Tocantins	TO	1712801	17
669	Brazil	Miracema do Tocantins	TO	1713205	17
670	Brazil	Miranorte	TO	1713304	17
671	Brazil	Monte do Carmo	TO	1713601	17
672	Brazil	Monte Santo do Tocantins	TO	1713700	17
673	Brazil	Muricilândia	TO	1713957	17
674	Brazil	Natividade	TO	1714203	17
675	Brazil	Nazaré	TO	1714302	17
676	Brazil	Nova Olinda	TO	1714880	17
677	Brazil	Nova Rosalândia	TO	1715002	17
678	Brazil	Novo Acordo	TO	1715101	17
679	Brazil	Novo Alegre	TO	1715150	17
680	Brazil	Novo Jardim	TO	1715259	17
681	Brazil	Oliveira de Fátima	TO	1715507	17
682	Brazil	Palmas	TO	1721000	17
683	Brazil	Palmeirante	TO	1715705	17
684	Brazil	Palmeiras do Tocantins	TO	1713809	17
685	Brazil	Palmeirópolis	TO	1715754	17
686	Brazil	Paraíso do Tocantins	TO	1716109	17
687	Brazil	Paranã	TO	1716208	17
688	Brazil	Pau D'Arco	TO	1716307	17
689	Brazil	Pedro Afonso	TO	1716505	17
690	Brazil	Peixe	TO	1716604	17
691	Brazil	Pequizeiro	TO	1716653	17
692	Brazil	Pindorama do Tocantins	TO	1717008	17
693	Brazil	Piraquê	TO	1717206	17
694	Brazil	Pium	TO	1717503	17
695	Brazil	Ponte Alta do Bom Jesus	TO	1717800	17
696	Brazil	Ponte Alta do Tocantins	TO	1717909	17
697	Brazil	Porto Alegre do Tocantins	TO	1718006	17
698	Brazil	Porto Nacional	TO	1718204	17
699	Brazil	Praia Norte	TO	1718303	17
700	Brazil	Presidente Kennedy	TO	1718402	17
701	Brazil	Pugmil	TO	1718451	17
702	Brazil	Recursolândia	TO	1718501	17
703	Brazil	Riachinho	TO	1718550	17
704	Brazil	Rio da Conceição	TO	1718659	17
705	Brazil	Rio dos Bois	TO	1718709	17
706	Brazil	Rio Sono	TO	1718758	17
707	Brazil	Sampaio	TO	1718808	17
708	Brazil	Sandolândia	TO	1718840	17
709	Brazil	Santa Fé do Araguaia	TO	1718865	17
710	Brazil	Santa Maria do Tocantins	TO	1718881	17
711	Brazil	Santa Rita do Tocantins	TO	1718899	17
712	Brazil	Santa Rosa do Tocantins	TO	1718907	17
713	Brazil	Santa Tereza do Tocantins	TO	1719004	17
714	Brazil	Santa Terezinha do Tocantins	TO	1720002	17
715	Brazil	São Bento do Tocantins	TO	1720101	17
716	Brazil	São Félix do Tocantins	TO	1720150	17
717	Brazil	São Miguel do Tocantins	TO	1720200	17
718	Brazil	São Salvador do Tocantins	TO	1720259	17
719	Brazil	São Sebastião do Tocantins	TO	1720309	17
720	Brazil	São Valério da Natividade	TO	1720499	17
721	Brazil	Silvanópolis	TO	1720655	17
722	Brazil	Sítio Novo do Tocantins	TO	1720804	17
723	Brazil	Sucupira	TO	1720853	17
724	Brazil	Taguatinga	TO	1720903	17
725	Brazil	Taipas do Tocantins	TO	1720937	17
726	Brazil	Talismã	TO	1720978	17
727	Brazil	Tocantínia	TO	1721109	17
728	Brazil	Tocantinópolis	TO	1721208	17
729	Brazil	Tupirama	TO	1721257	17
730	Brazil	Tupiratins	TO	1721307	17
731	Brazil	Wanderlândia	TO	1722081	17
732	Brazil	Xambioá	TO	1722107	17
733	Brazil	Acorizal	MT	5100102	51
734	Brazil	Água Boa	MT	5100201	51
735	Brazil	Alta Floresta	MT	5100250	51
736	Brazil	Alto Araguaia	MT	5100300	51
737	Brazil	Alto Boa Vista	MT	5100359	51
738	Brazil	Alto Garças	MT	5100409	51
739	Brazil	Alto Paraguai	MT	5100508	51
740	Brazil	Alto Taquari	MT	5100607	51
741	Brazil	Apiacás	MT	5100805	51
742	Brazil	Araguaiana	MT	5101001	51
743	Brazil	Araguainha	MT	5101209	51
744	Brazil	Araputanga	MT	5101258	51
745	Brazil	Arenápolis	MT	5101308	51
746	Brazil	Aripuanã	MT	5101407	51
747	Brazil	Barão de Melgaço	MT	5101605	51
748	Brazil	Barra do Bugres	MT	5101704	51
749	Brazil	Barra do Garças	MT	5101803	51
750	Brazil	Bom Jesus do Araguaia	MT	5101852	51
751	Brazil	Brasnorte	MT	5101902	51
752	Brazil	Cáceres	MT	5102504	51
753	Brazil	Campinápolis	MT	5102603	51
754	Brazil	Campo Novo do Parecis	MT	5102637	51
755	Brazil	Campo Verde	MT	5102678	51
756	Brazil	Campos de Júlio	MT	5102686	51
757	Brazil	Canabrava do Norte	MT	5102694	51
758	Brazil	Canarana	MT	5102702	51
759	Brazil	Carlinda	MT	5102793	51
760	Brazil	Castanheira	MT	5102850	51
761	Brazil	Chapada dos Guimarães	MT	5103007	51
762	Brazil	Cláudia	MT	5103056	51
763	Brazil	Cocalinho	MT	5103106	51
764	Brazil	Colíder	MT	5103205	51
765	Brazil	Colniza	MT	5103254	51
766	Brazil	Comodoro	MT	5103304	51
767	Brazil	Confresa	MT	5103353	51
768	Brazil	Conquista D'Oeste	MT	5103361	51
769	Brazil	Cotriguaçu	MT	5103379	51
770	Brazil	Cuiabá	MT	5103403	51
771	Brazil	Curvelândia	MT	5103437	51
772	Brazil	Denise	MT	5103452	51
773	Brazil	Diamantino	MT	5103502	51
774	Brazil	Dom Aquino	MT	5103601	51
775	Brazil	Feliz Natal	MT	5103700	51
776	Brazil	Figueirópolis D'Oeste	MT	5103809	51
777	Brazil	Gaúcha do Norte	MT	5103858	51
778	Brazil	General Carneiro	MT	5103908	51
779	Brazil	Glória D'Oeste	MT	5103957	51
780	Brazil	Guarantã do Norte	MT	5104104	51
781	Brazil	Guiratinga	MT	5104203	51
782	Brazil	Indiavaí	MT	5104500	51
783	Brazil	Ipiranga do Norte	MT	5104526	51
784	Brazil	Itanhangá	MT	5104542	51
785	Brazil	Itaúba	MT	5104559	51
786	Brazil	Itiquira	MT	5104609	51
787	Brazil	Jaciara	MT	5104807	51
788	Brazil	Jangada	MT	5104906	51
789	Brazil	Jauru	MT	5105002	51
790	Brazil	Juara	MT	5105101	51
791	Brazil	Juína	MT	5105150	51
792	Brazil	Juruena	MT	5105176	51
793	Brazil	Juscimeira	MT	5105200	51
794	Brazil	Lambari D'Oeste	MT	5105234	51
795	Brazil	Lucas do Rio Verde	MT	5105259	51
796	Brazil	Luciára	MT	5105309	51
797	Brazil	Marcelândia	MT	5105580	51
798	Brazil	Matupá	MT	5105606	51
799	Brazil	Mirassol d'Oeste	MT	5105622	51
800	Brazil	Nobres	MT	5105903	51
801	Brazil	Nortelândia	MT	5106000	51
802	Brazil	Nossa Senhora do Livramento	MT	5106109	51
803	Brazil	Nova Bandeirantes	MT	5106158	51
804	Brazil	Nova Brasilândia	MT	5106208	51
805	Brazil	Nova Canaã do Norte	MT	5106216	51
806	Brazil	Nova Guarita	MT	5108808	51
807	Brazil	Nova Lacerda	MT	5106182	51
808	Brazil	Nova Marilândia	MT	5108857	51
809	Brazil	Nova Maringá	MT	5108907	51
810	Brazil	Nova Monte Verde	MT	5108956	51
811	Brazil	Nova Mutum	MT	5106224	51
812	Brazil	Nova Nazaré	MT	5106174	51
813	Brazil	Nova Olímpia	MT	5106232	51
814	Brazil	Nova Santa Helena	MT	5106190	51
815	Brazil	Nova Ubiratã	MT	5106240	51
816	Brazil	Nova Xavantina	MT	5106257	51
817	Brazil	Novo Horizonte do Norte	MT	5106273	51
818	Brazil	Novo Mundo	MT	5106265	51
819	Brazil	Novo Santo Antônio	MT	5106315	51
820	Brazil	Novo São Joaquim	MT	5106281	51
821	Brazil	Paranaíta	MT	5106299	51
822	Brazil	Paranatinga	MT	5106307	51
823	Brazil	Pedra Preta	MT	5106372	51
824	Brazil	Peixoto de Azevedo	MT	5106422	51
825	Brazil	Planalto da Serra	MT	5106455	51
826	Brazil	Poconé	MT	5106505	51
827	Brazil	Pontal do Araguaia	MT	5106653	51
828	Brazil	Ponte Branca	MT	5106703	51
829	Brazil	Pontes e Lacerda	MT	5106752	51
830	Brazil	Porto Alegre do Norte	MT	5106778	51
831	Brazil	Porto dos Gaúchos	MT	5106802	51
832	Brazil	Porto Esperidião	MT	5106828	51
833	Brazil	Porto Estrela	MT	5106851	51
834	Brazil	Poxoréo	MT	5107008	51
835	Brazil	Primavera do Leste	MT	5107040	51
836	Brazil	Querência	MT	5107065	51
837	Brazil	Reserva do Cabaçal	MT	5107156	51
838	Brazil	Ribeirão Cascalheira	MT	5107180	51
839	Brazil	Ribeirãozinho	MT	5107198	51
840	Brazil	Rio Branco	MT	5107206	51
841	Brazil	Rondolândia	MT	5107578	51
842	Brazil	Rondonópolis	MT	5107602	51
843	Brazil	Rosário Oeste	MT	5107701	51
844	Brazil	Salto do Céu	MT	5107750	51
845	Brazil	Santa Carmem	MT	5107248	51
846	Brazil	Santa Cruz do Xingu	MT	5107743	51
847	Brazil	Santa Rita do Trivelato	MT	5107768	51
848	Brazil	Santa Terezinha	MT	5107776	51
849	Brazil	Santo Afonso	MT	5107263	51
850	Brazil	Santo Antônio do Leste	MT	5107792	51
851	Brazil	Santo Antônio do Leverger	MT	5107800	51
852	Brazil	São Félix do Araguaia	MT	5107859	51
853	Brazil	São José do Povo	MT	5107297	51
854	Brazil	São José do Rio Claro	MT	5107305	51
855	Brazil	São José do Xingu	MT	5107354	51
856	Brazil	São José dos Quatro Marcos	MT	5107107	51
857	Brazil	São Pedro da Cipa	MT	5107404	51
858	Brazil	Sapezal	MT	5107875	51
859	Brazil	Serra Nova Dourada	MT	5107883	51
860	Brazil	Sinop	MT	5107909	51
861	Brazil	Sorriso	MT	5107925	51
862	Brazil	Tabaporã	MT	5107941	51
863	Brazil	Tangará da Serra	MT	5107958	51
864	Brazil	Tapurah	MT	5108006	51
865	Brazil	Terra Nova do Norte	MT	5108055	51
866	Brazil	Tesouro	MT	5108105	51
867	Brazil	Torixoréu	MT	5108204	51
868	Brazil	União do Sul	MT	5108303	51
869	Brazil	Vale de São Domingos	MT	5108352	51
870	Brazil	Várzea Grande	MT	5108402	51
871	Brazil	Vera	MT	5108501	51
872	Brazil	Vila Bela da Santíssima Trindade	MT	5105507	51
873	Brazil	Vila Rica	MT	5108600	51
874	Brazil	Abaetetuba	PA	1500107	15
875	Brazil	Abel Figueiredo	PA	1500131	15
876	Brazil	Acará	PA	1500206	15
877	Brazil	Afuá	PA	1500305	15
878	Brazil	Água Azul do Norte	PA	1500347	15
879	Brazil	Alenquer	PA	1500404	15
880	Brazil	Almeirim	PA	1500503	15
881	Brazil	Altamira	PA	1500602	15
882	Brazil	Anajás	PA	1500701	15
883	Brazil	Ananindeua	PA	1500800	15
884	Brazil	Anapu	PA	1500859	15
885	Brazil	Augusto Corrêa	PA	1500909	15
886	Brazil	Aurora do Pará	PA	1500958	15
887	Brazil	Aveiro	PA	1501006	15
888	Brazil	Bagre	PA	1501105	15
889	Brazil	Baião	PA	1501204	15
890	Brazil	Bannach	PA	1501253	15
891	Brazil	Barcarena	PA	1501303	15
892	Brazil	Belém	PA	1501402	15
893	Brazil	Belterra	PA	1501451	15
894	Brazil	Benevides	PA	1501501	15
895	Brazil	Bom Jesus do Tocantins	PA	1501576	15
896	Brazil	Bonito	PA	1501600	15
897	Brazil	Bragança	PA	1501709	15
898	Brazil	Brasil Novo	PA	1501725	15
899	Brazil	Brejo Grande do Araguaia	PA	1501758	15
900	Brazil	Breu Branco	PA	1501782	15
901	Brazil	Breves	PA	1501808	15
902	Brazil	Bujaru	PA	1501907	15
903	Brazil	Cachoeira do Arari	PA	1502004	15
904	Brazil	Cachoeira do Piriá	PA	1501956	15
905	Brazil	Cametá	PA	1502103	15
906	Brazil	Canaã dos Carajás	PA	1502152	15
907	Brazil	Capanema	PA	1502202	15
908	Brazil	Capitão Poço	PA	1502301	15
909	Brazil	Castanhal	PA	1502400	15
910	Brazil	Chaves	PA	1502509	15
911	Brazil	Colares	PA	1502608	15
912	Brazil	Conceição do Araguaia	PA	1502707	15
913	Brazil	Concórdia do Pará	PA	1502756	15
914	Brazil	Cumaru do Norte	PA	1502764	15
915	Brazil	Curionópolis	PA	1502772	15
916	Brazil	Curralinho	PA	1502806	15
917	Brazil	Curuá	PA	1502855	15
918	Brazil	Curuçá	PA	1502905	15
919	Brazil	Dom Eliseu	PA	1502939	15
920	Brazil	Eldorado dos Carajás	PA	1502954	15
921	Brazil	Faro	PA	1503002	15
922	Brazil	Floresta do Araguaia	PA	1503044	15
923	Brazil	Garrafão do Norte	PA	1503077	15
924	Brazil	Goianésia do Pará	PA	1503093	15
925	Brazil	Gurupá	PA	1503101	15
926	Brazil	Igarapé-Açu	PA	1503200	15
927	Brazil	Igarapé-Miri	PA	1503309	15
928	Brazil	Inhangapi	PA	1503408	15
929	Brazil	Ipixuna do Pará	PA	1503457	15
930	Brazil	Irituia	PA	1503507	15
931	Brazil	Itaituba	PA	1503606	15
932	Brazil	Itupiranga	PA	1503705	15
933	Brazil	Jacareacanga	PA	1503754	15
934	Brazil	Jacundá	PA	1503804	15
935	Brazil	Juruti	PA	1503903	15
936	Brazil	Limoeiro do Ajuru	PA	1504000	15
937	Brazil	Mãe do Rio	PA	1504059	15
938	Brazil	Magalhães Barata	PA	1504109	15
939	Brazil	Marabá	PA	1504208	15
940	Brazil	Maracanã	PA	1504307	15
941	Brazil	Marapanim	PA	1504406	15
942	Brazil	Marituba	PA	1504422	15
943	Brazil	Medicilândia	PA	1504455	15
944	Brazil	Melgaço	PA	1504505	15
945	Brazil	Mocajuba	PA	1504604	15
946	Brazil	Moju	PA	1504703	15
947	Brazil	Monte Alegre	PA	1504802	15
948	Brazil	Muaná	PA	1504901	15
949	Brazil	Nova Esperança do Piriá	PA	1504950	15
950	Brazil	Nova Ipixuna	PA	1504976	15
951	Brazil	Nova Timboteua	PA	1505007	15
952	Brazil	Novo Progresso	PA	1505031	15
953	Brazil	Novo Repartimento	PA	1505064	15
954	Brazil	Óbidos	PA	1505106	15
955	Brazil	Oeiras do Pará	PA	1505205	15
956	Brazil	Oriximiná	PA	1505304	15
957	Brazil	Ourém	PA	1505403	15
958	Brazil	Ourilândia do Norte	PA	1505437	15
959	Brazil	Pacajá	PA	1505486	15
960	Brazil	Palestina do Pará	PA	1505494	15
961	Brazil	Paragominas	PA	1505502	15
962	Brazil	Parauapebas	PA	1505536	15
963	Brazil	Pau D'Arco	PA	1505551	15
964	Brazil	Peixe-Boi	PA	1505601	15
965	Brazil	Piçarra	PA	1505635	15
966	Brazil	Placas	PA	1505650	15
967	Brazil	Ponta de Pedras	PA	1505700	15
968	Brazil	Portel	PA	1505809	15
969	Brazil	Porto de Moz	PA	1505908	15
970	Brazil	Prainha	PA	1506005	15
971	Brazil	Primavera	PA	1506104	15
972	Brazil	Quatipuru	PA	1506112	15
973	Brazil	Redenção	PA	1506138	15
974	Brazil	Rio Maria	PA	1506161	15
975	Brazil	Rondon do Pará	PA	1506187	15
976	Brazil	Rurópolis	PA	1506195	15
977	Brazil	Salinópolis	PA	1506203	15
978	Brazil	Salvaterra	PA	1506302	15
979	Brazil	Santa Bárbara do Pará	PA	1506351	15
980	Brazil	Santa Cruz do Arari	PA	1506401	15
981	Brazil	Santa Isabel do Pará	PA	1506500	15
982	Brazil	Santa Luzia do Pará	PA	1506559	15
983	Brazil	Santa Maria das Barreiras	PA	1506583	15
984	Brazil	Santa Maria do Pará	PA	1506609	15
985	Brazil	Santana do Araguaia	PA	1506708	15
986	Brazil	Santarém	PA	1506807	15
987	Brazil	Santarém Novo	PA	1506906	15
988	Brazil	Santo Antônio do Tauá	PA	1507003	15
989	Brazil	São Caetano de Odivelas	PA	1507102	15
990	Brazil	São Domingos do Araguaia	PA	1507151	15
991	Brazil	São Domingos do Capim	PA	1507201	15
992	Brazil	São Félix do Xingu	PA	1507300	15
993	Brazil	São Francisco do Pará	PA	1507409	15
994	Brazil	São Geraldo do Araguaia	PA	1507458	15
995	Brazil	São João da Ponta	PA	1507466	15
996	Brazil	São João de Pirabas	PA	1507474	15
997	Brazil	São João do Araguaia	PA	1507508	15
998	Brazil	São Miguel do Guamá	PA	1507607	15
999	Brazil	São Sebastião da Boa Vista	PA	1507706	15
1000	Brazil	Sapucaia	PA	1507755	15
1001	Brazil	Senador José Porfírio	PA	1507805	15
1002	Brazil	Soure	PA	1507904	15
1003	Brazil	Tailândia	PA	1507953	15
1004	Brazil	Terra Alta	PA	1507961	15
1005	Brazil	Terra Santa	PA	1507979	15
1006	Brazil	Tomé-Açu	PA	1508001	15
1007	Brazil	Tracuateua	PA	1508035	15
1008	Brazil	Trairão	PA	1508050	15
1009	Brazil	Tucumã	PA	1508084	15
1010	Brazil	Tucuruí	PA	1508100	15
1011	Brazil	Ulianópolis	PA	1508126	15
1012	Brazil	Uruará	PA	1508159	15
1013	Brazil	Vigia	PA	1508209	15
1014	Brazil	Viseu	PA	1508308	15
1015	Brazil	Vitória do Xingu	PA	1508357	15
1016	Brazil	Xinguara	PA	1508407	15
1017	Brazil	Acari	RN	2400109	24
1018	Brazil	Açu	RN	2400208	24
1019	Brazil	Afonso Bezerra	RN	2400307	24
1020	Brazil	Água Nova	RN	2400406	24
1021	Brazil	Alexandria	RN	2400505	24
1022	Brazil	Almino Afonso	RN	2400604	24
1023	Brazil	Alto do Rodrigues	RN	2400703	24
1024	Brazil	Angicos	RN	2400802	24
1025	Brazil	Antônio Martins	RN	2400901	24
1026	Brazil	Apodi	RN	2401008	24
1027	Brazil	Areia Branca	RN	2401107	24
1028	Brazil	Arês	RN	2401206	24
1029	Brazil	Augusto Severo	RN	2401305	24
1030	Brazil	Baía Formosa	RN	2401404	24
1031	Brazil	Baraúna	RN	2401453	24
1032	Brazil	Barcelona	RN	2401503	24
1033	Brazil	Bento Fernandes	RN	2401602	24
1034	Brazil	Bodó	RN	2401651	24
1035	Brazil	Bom Jesus	RN	2401701	24
1036	Brazil	Brejinho	RN	2401800	24
1037	Brazil	Caiçara do Norte	RN	2401859	24
1038	Brazil	Caiçara do Rio do Vento	RN	2401909	24
1039	Brazil	Caicó	RN	2402006	24
1040	Brazil	Campo Redondo	RN	2402105	24
1041	Brazil	Canguaretama	RN	2402204	24
1042	Brazil	Caraúbas	RN	2402303	24
1043	Brazil	Carnaúba dos Dantas	RN	2402402	24
1044	Brazil	Carnaubais	RN	2402501	24
1045	Brazil	Ceará-Mirim	RN	2402600	24
1046	Brazil	Cerro Corá	RN	2402709	24
1047	Brazil	Coronel Ezequiel	RN	2402808	24
1048	Brazil	Coronel João Pessoa	RN	2402907	24
1049	Brazil	Cruzeta	RN	2403004	24
1050	Brazil	Currais Novos	RN	2403103	24
1051	Brazil	Doutor Severiano	RN	2403202	24
1052	Brazil	Encanto	RN	2403301	24
1053	Brazil	Equador	RN	2403400	24
1054	Brazil	Espírito Santo	RN	2403509	24
1055	Brazil	Extremoz	RN	2403608	24
1056	Brazil	Felipe Guerra	RN	2403707	24
1057	Brazil	Fernando Pedroza	RN	2403756	24
1058	Brazil	Florânia	RN	2403806	24
1059	Brazil	Francisco Dantas	RN	2403905	24
1060	Brazil	Frutuoso Gomes	RN	2404002	24
1061	Brazil	Galinhos	RN	2404101	24
1062	Brazil	Goianinha	RN	2404200	24
1063	Brazil	Governador Dix-Sept Rosado	RN	2404309	24
1064	Brazil	Grossos	RN	2404408	24
1065	Brazil	Guamaré	RN	2404507	24
1066	Brazil	Ielmo Marinho	RN	2404606	24
1067	Brazil	Ipanguaçu	RN	2404705	24
1068	Brazil	Ipueira	RN	2404804	24
1069	Brazil	Itajá	RN	2404853	24
1070	Brazil	Itaú	RN	2404903	24
1071	Brazil	Jaçanã	RN	2405009	24
1072	Brazil	Jandaíra	RN	2405108	24
1073	Brazil	Janduís	RN	2405207	24
1074	Brazil	Januário Cicco	RN	2405306	24
1075	Brazil	Japi	RN	2405405	24
1076	Brazil	Jardim de Angicos	RN	2405504	24
1077	Brazil	Jardim de Piranhas	RN	2405603	24
1078	Brazil	Jardim do Seridó	RN	2405702	24
1079	Brazil	João Câmara	RN	2405801	24
1080	Brazil	João Dias	RN	2405900	24
1081	Brazil	José da Penha	RN	2406007	24
1082	Brazil	Jucurutu	RN	2406106	24
1083	Brazil	Jundiá	RN	2406155	24
1084	Brazil	Lagoa d'Anta	RN	2406205	24
1085	Brazil	Lagoa de Pedras	RN	2406304	24
1086	Brazil	Lagoa de Velhos	RN	2406403	24
1087	Brazil	Lagoa Nova	RN	2406502	24
1088	Brazil	Lagoa Salgada	RN	2406601	24
1089	Brazil	Lajes	RN	2406700	24
1090	Brazil	Lajes Pintadas	RN	2406809	24
1091	Brazil	Lucrécia	RN	2406908	24
1092	Brazil	Luís Gomes	RN	2407005	24
1093	Brazil	Macaíba	RN	2407104	24
1094	Brazil	Macau	RN	2407203	24
1095	Brazil	Major Sales	RN	2407252	24
1096	Brazil	Marcelino Vieira	RN	2407302	24
1097	Brazil	Martins	RN	2407401	24
1098	Brazil	Maxaranguape	RN	2407500	24
1099	Brazil	Messias Targino	RN	2407609	24
1100	Brazil	Montanhas	RN	2407708	24
1101	Brazil	Monte Alegre	RN	2407807	24
1102	Brazil	Monte das Gameleiras	RN	2407906	24
1103	Brazil	Mossoró	RN	2408003	24
1104	Brazil	Natal	RN	2408102	24
1105	Brazil	Nísia Floresta	RN	2408201	24
1106	Brazil	Nova Cruz	RN	2408300	24
1107	Brazil	Olho-d'Água do Borges	RN	2408409	24
1108	Brazil	Ouro Branco	RN	2408508	24
1109	Brazil	Paraná	RN	2408607	24
1110	Brazil	Paraú	RN	2408706	24
1111	Brazil	Parazinho	RN	2408805	24
1112	Brazil	Parelhas	RN	2408904	24
1113	Brazil	Parnamirim	RN	2403251	24
1114	Brazil	Passa e Fica	RN	2409100	24
1115	Brazil	Passagem	RN	2409209	24
1116	Brazil	Patu	RN	2409308	24
1117	Brazil	Pau dos Ferros	RN	2409407	24
1118	Brazil	Pedra Grande	RN	2409506	24
1119	Brazil	Pedra Preta	RN	2409605	24
1120	Brazil	Pedro Avelino	RN	2409704	24
1121	Brazil	Pedro Velho	RN	2409803	24
1122	Brazil	Pendências	RN	2409902	24
1123	Brazil	Pilões	RN	2410009	24
1124	Brazil	Poço Branco	RN	2410108	24
1125	Brazil	Portalegre	RN	2410207	24
1126	Brazil	Porto do Mangue	RN	2410256	24
1127	Brazil	Presidente Juscelino	RN	2410306	24
1128	Brazil	Pureza	RN	2410405	24
1129	Brazil	Rafael Fernandes	RN	2410504	24
1130	Brazil	Rafael Godeiro	RN	2410603	24
1131	Brazil	Riacho da Cruz	RN	2410702	24
1132	Brazil	Riacho de Santana	RN	2410801	24
1133	Brazil	Riachuelo	RN	2410900	24
1134	Brazil	Rio do Fogo	RN	2408953	24
1135	Brazil	Rodolfo Fernandes	RN	2411007	24
1136	Brazil	Ruy Barbosa	RN	2411106	24
1137	Brazil	Santa Cruz	RN	2411205	24
1138	Brazil	Santa Maria	RN	2409332	24
1139	Brazil	Santana do Matos	RN	2411403	24
1140	Brazil	Santana do Seridó	RN	2411429	24
1141	Brazil	Santo Antônio	RN	2411502	24
1142	Brazil	São Bento do Norte	RN	2411601	24
1143	Brazil	São Bento do Trairí	RN	2411700	24
1144	Brazil	São Fernando	RN	2411809	24
1145	Brazil	São Francisco do Oeste	RN	2411908	24
1146	Brazil	São Gonçalo do Amarante	RN	2412005	24
1147	Brazil	São João do Sabugi	RN	2412104	24
1148	Brazil	São José de Mipibu	RN	2412203	24
1149	Brazil	São José do Campestre	RN	2412302	24
1150	Brazil	São José do Seridó	RN	2412401	24
1151	Brazil	São Miguel	RN	2412500	24
1152	Brazil	São Miguel do Gostoso	RN	2412559	24
1153	Brazil	São Paulo do Potengi	RN	2412609	24
1154	Brazil	São Pedro	RN	2412708	24
1155	Brazil	São Rafael	RN	2412807	24
1156	Brazil	São Tomé	RN	2412906	24
1157	Brazil	São Vicente	RN	2413003	24
1158	Brazil	Senador Elói de Souza	RN	2413102	24
1159	Brazil	Senador Georgino Avelino	RN	2413201	24
1160	Brazil	Serra de São Bento	RN	2413300	24
1161	Brazil	Serra do Mel	RN	2413359	24
1162	Brazil	Serra Negra do Norte	RN	2413409	24
1163	Brazil	Serrinha	RN	2413508	24
1164	Brazil	Serrinha dos Pintos	RN	2413557	24
1165	Brazil	Severiano Melo	RN	2413607	24
1166	Brazil	Sítio Novo	RN	2413706	24
1167	Brazil	Taboleiro Grande	RN	2413805	24
1168	Brazil	Taipu	RN	2413904	24
1169	Brazil	Tangará	RN	2414001	24
1170	Brazil	Tenente Ananias	RN	2414100	24
1171	Brazil	Tenente Laurentino Cruz	RN	2414159	24
1172	Brazil	Tibau	RN	2411056	24
1173	Brazil	Tibau do Sul	RN	2414209	24
1174	Brazil	Timbaúba dos Batistas	RN	2414308	24
1175	Brazil	Touros	RN	2414407	24
1176	Brazil	Triunfo Potiguar	RN	2414456	24
1177	Brazil	Umarizal	RN	2414506	24
1178	Brazil	Upanema	RN	2414605	24
1179	Brazil	Várzea	RN	2414704	24
1180	Brazil	Venha-Ver	RN	2414753	24
1181	Brazil	Vera Cruz	RN	2414803	24
1182	Brazil	Viçosa	RN	2414902	24
1183	Brazil	Vila Flor	RN	2415008	24
1184	Brazil	Abaiara	CE	2300101	23
1185	Brazil	Acarape	CE	2300150	23
1186	Brazil	Acaraú	CE	2300200	23
1187	Brazil	Acopiara	CE	2300309	23
1188	Brazil	Aiuaba	CE	2300408	23
1189	Brazil	Alcântaras	CE	2300507	23
1190	Brazil	Altaneira	CE	2300606	23
1191	Brazil	Alto Santo	CE	2300705	23
1192	Brazil	Amontada	CE	2300754	23
1193	Brazil	Antonina do Norte	CE	2300804	23
1194	Brazil	Apuiarés	CE	2300903	23
1195	Brazil	Aquiraz	CE	2301000	23
1196	Brazil	Aracati	CE	2301109	23
1197	Brazil	Aracoiaba	CE	2301208	23
1198	Brazil	Ararendá	CE	2301257	23
1199	Brazil	Araripe	CE	2301307	23
1200	Brazil	Aratuba	CE	2301406	23
1201	Brazil	Arneiroz	CE	2301505	23
1202	Brazil	Assaré	CE	2301604	23
1203	Brazil	Aurora	CE	2301703	23
1204	Brazil	Baixio	CE	2301802	23
1205	Brazil	Banabuiú	CE	2301851	23
1206	Brazil	Barbalha	CE	2301901	23
1207	Brazil	Barreira	CE	2301950	23
1208	Brazil	Barro	CE	2302008	23
1209	Brazil	Barroquinha	CE	2302057	23
1210	Brazil	Baturité	CE	2302107	23
1211	Brazil	Beberibe	CE	2302206	23
1212	Brazil	Bela Cruz	CE	2302305	23
1213	Brazil	Boa Viagem	CE	2302404	23
1214	Brazil	Brejo Santo	CE	2302503	23
1215	Brazil	Camocim	CE	2302602	23
1216	Brazil	Campos Sales	CE	2302701	23
1217	Brazil	Canindé	CE	2302800	23
1218	Brazil	Capistrano	CE	2302909	23
1219	Brazil	Caridade	CE	2303006	23
1220	Brazil	Cariré	CE	2303105	23
1221	Brazil	Caririaçu	CE	2303204	23
1222	Brazil	Cariús	CE	2303303	23
1223	Brazil	Carnaubal	CE	2303402	23
1224	Brazil	Cascavel	CE	2303501	23
1225	Brazil	Catarina	CE	2303600	23
1226	Brazil	Catunda	CE	2303659	23
1227	Brazil	Caucaia	CE	2303709	23
1228	Brazil	Cedro	CE	2303808	23
1229	Brazil	Chaval	CE	2303907	23
1230	Brazil	Choró	CE	2303931	23
1231	Brazil	Chorozinho	CE	2303956	23
1232	Brazil	Coreaú	CE	2304004	23
1233	Brazil	Crateús	CE	2304103	23
1234	Brazil	Crato	CE	2304202	23
1235	Brazil	Croatá	CE	2304236	23
1236	Brazil	Cruz	CE	2304251	23
1237	Brazil	Deputado Irapuan Pinheiro	CE	2304269	23
1238	Brazil	Ererê	CE	2304277	23
1239	Brazil	Eusébio	CE	2304285	23
1240	Brazil	Farias Brito	CE	2304301	23
1241	Brazil	Forquilha	CE	2304350	23
1242	Brazil	Fortaleza	CE	2304400	23
1243	Brazil	Fortim	CE	2304459	23
1244	Brazil	Frecheirinha	CE	2304509	23
1245	Brazil	General Sampaio	CE	2304608	23
1246	Brazil	Graça	CE	2304657	23
1247	Brazil	Granja	CE	2304707	23
1248	Brazil	Granjeiro	CE	2304806	23
1249	Brazil	Groaíras	CE	2304905	23
1250	Brazil	Guaiúba	CE	2304954	23
1251	Brazil	Guaraciaba do Norte	CE	2305001	23
1252	Brazil	Guaramiranga	CE	2305100	23
1253	Brazil	Hidrolândia	CE	2305209	23
1254	Brazil	Horizonte	CE	2305233	23
1255	Brazil	Ibaretama	CE	2305266	23
1256	Brazil	Ibiapina	CE	2305308	23
1257	Brazil	Ibicuitinga	CE	2305332	23
1258	Brazil	Icapuí	CE	2305357	23
1259	Brazil	Icó	CE	2305407	23
1260	Brazil	Iguatu	CE	2305506	23
1261	Brazil	Independência	CE	2305605	23
1262	Brazil	Ipaporanga	CE	2305654	23
1263	Brazil	Ipaumirim	CE	2305704	23
1264	Brazil	Ipu	CE	2305803	23
1265	Brazil	Ipueiras	CE	2305902	23
1266	Brazil	Iracema	CE	2306009	23
1267	Brazil	Irauçuba	CE	2306108	23
1268	Brazil	Itaiçaba	CE	2306207	23
1269	Brazil	Itaitinga	CE	2306256	23
1270	Brazil	Itapagé	CE	2306306	23
1271	Brazil	Itapipoca	CE	2306405	23
1272	Brazil	Itapiúna	CE	2306504	23
1273	Brazil	Itarema	CE	2306553	23
1274	Brazil	Itatira	CE	2306603	23
1275	Brazil	Jaguaretama	CE	2306702	23
1276	Brazil	Jaguaribara	CE	2306801	23
1277	Brazil	Jaguaribe	CE	2306900	23
1278	Brazil	Jaguaruana	CE	2307007	23
1279	Brazil	Jardim	CE	2307106	23
1280	Brazil	Jati	CE	2307205	23
1281	Brazil	Jijoca de Jericoacoara	CE	2307254	23
1282	Brazil	Juazeiro do Norte	CE	2307304	23
1283	Brazil	Jucás	CE	2307403	23
1284	Brazil	Lavras da Mangabeira	CE	2307502	23
1285	Brazil	Limoeiro do Norte	CE	2307601	23
1286	Brazil	Madalena	CE	2307635	23
1287	Brazil	Maracanaú	CE	2307650	23
1288	Brazil	Maranguape	CE	2307700	23
1289	Brazil	Marco	CE	2307809	23
1290	Brazil	Martinópole	CE	2307908	23
1291	Brazil	Massapê	CE	2308005	23
1292	Brazil	Mauriti	CE	2308104	23
1293	Brazil	Meruoca	CE	2308203	23
1294	Brazil	Milagres	CE	2308302	23
1295	Brazil	Milhã	CE	2308351	23
1296	Brazil	Miraíma	CE	2308377	23
1297	Brazil	Missão Velha	CE	2308401	23
1298	Brazil	Mombaça	CE	2308500	23
1299	Brazil	Monsenhor Tabosa	CE	2308609	23
1300	Brazil	Morada Nova	CE	2308708	23
1301	Brazil	Moraújo	CE	2308807	23
1302	Brazil	Morrinhos	CE	2308906	23
1303	Brazil	Mucambo	CE	2309003	23
1304	Brazil	Mulungu	CE	2309102	23
1305	Brazil	Nova Olinda	CE	2309201	23
1306	Brazil	Nova Russas	CE	2309300	23
1307	Brazil	Novo Oriente	CE	2309409	23
1308	Brazil	Ocara	CE	2309458	23
1309	Brazil	Orós	CE	2309508	23
1310	Brazil	Pacajus	CE	2309607	23
1311	Brazil	Pacatuba	CE	2309706	23
1312	Brazil	Pacoti	CE	2309805	23
1313	Brazil	Pacujá	CE	2309904	23
1314	Brazil	Palhano	CE	2310001	23
1315	Brazil	Palmácia	CE	2310100	23
1316	Brazil	Paracuru	CE	2310209	23
1317	Brazil	Paraipaba	CE	2310258	23
1318	Brazil	Parambu	CE	2310308	23
1319	Brazil	Paramoti	CE	2310407	23
1320	Brazil	Pedra Branca	CE	2310506	23
1321	Brazil	Penaforte	CE	2310605	23
1322	Brazil	Pentecoste	CE	2310704	23
1323	Brazil	Pereiro	CE	2310803	23
1324	Brazil	Pindoretama	CE	2310852	23
1325	Brazil	Piquet Carneiro	CE	2310902	23
1326	Brazil	Pires Ferreira	CE	2310951	23
1327	Brazil	Poranga	CE	2311009	23
1328	Brazil	Porteiras	CE	2311108	23
1329	Brazil	Potengi	CE	2311207	23
1330	Brazil	Potiretama	CE	2311231	23
1331	Brazil	Quiterianópolis	CE	2311264	23
1332	Brazil	Quixadá	CE	2311306	23
1333	Brazil	Quixelô	CE	2311355	23
1334	Brazil	Quixeramobim	CE	2311405	23
1335	Brazil	Quixeré	CE	2311504	23
1336	Brazil	Redenção	CE	2311603	23
1337	Brazil	Reriutaba	CE	2311702	23
1338	Brazil	Russas	CE	2311801	23
1339	Brazil	Saboeiro	CE	2311900	23
1340	Brazil	Salitre	CE	2311959	23
1341	Brazil	Santa Quitéria	CE	2312205	23
1342	Brazil	Santana do Acaraú	CE	2312007	23
1343	Brazil	Santana do Cariri	CE	2312106	23
1344	Brazil	São Benedito	CE	2312304	23
1345	Brazil	São Gonçalo do Amarante	CE	2312403	23
1346	Brazil	São João do Jaguaribe	CE	2312502	23
1347	Brazil	São Luís do Curu	CE	2312601	23
1348	Brazil	Senador Pompeu	CE	2312700	23
1349	Brazil	Senador Sá	CE	2312809	23
1350	Brazil	Sobral	CE	2312908	23
1351	Brazil	Solonópole	CE	2313005	23
1352	Brazil	Tabuleiro do Norte	CE	2313104	23
1353	Brazil	Tamboril	CE	2313203	23
1354	Brazil	Tarrafas	CE	2313252	23
1355	Brazil	Tauá	CE	2313302	23
1356	Brazil	Tejuçuoca	CE	2313351	23
1357	Brazil	Tianguá	CE	2313401	23
1358	Brazil	Trairi	CE	2313500	23
1359	Brazil	Tururu	CE	2313559	23
1360	Brazil	Ubajara	CE	2313609	23
1361	Brazil	Umari	CE	2313708	23
1362	Brazil	Umirim	CE	2313757	23
1363	Brazil	Uruburetama	CE	2313807	23
1364	Brazil	Uruoca	CE	2313906	23
1365	Brazil	Varjota	CE	2313955	23
1366	Brazil	Várzea Alegre	CE	2314003	23
1367	Brazil	Viçosa do Ceará	CE	2314102	23
1368	Brazil	Abreu e Lima	PE	2600054	26
1369	Brazil	Afogados da Ingazeira	PE	2600104	26
1370	Brazil	Afrânio	PE	2600203	26
1371	Brazil	Agrestina	PE	2600302	26
1372	Brazil	Água Preta	PE	2600401	26
1373	Brazil	Águas Belas	PE	2600500	26
1374	Brazil	Alagoinha	PE	2600609	26
1375	Brazil	Aliança	PE	2600708	26
1376	Brazil	Altinho	PE	2600807	26
1377	Brazil	Amaraji	PE	2600906	26
1378	Brazil	Angelim	PE	2601003	26
1379	Brazil	Araçoiaba	PE	2601052	26
1380	Brazil	Araripina	PE	2601102	26
1381	Brazil	Arcoverde	PE	2601201	26
1382	Brazil	Barra de Guabiraba	PE	2601300	26
1383	Brazil	Barreiros	PE	2601409	26
1384	Brazil	Belém de Maria	PE	2601508	26
1385	Brazil	Belém de São Francisco	PE	2601607	26
1386	Brazil	Belo Jardim	PE	2601706	26
1387	Brazil	Betânia	PE	2601805	26
1388	Brazil	Bezerros	PE	2601904	26
1389	Brazil	Bodocó	PE	2602001	26
1390	Brazil	Bom Conselho	PE	2602100	26
1391	Brazil	Bom Jardim	PE	2602209	26
1392	Brazil	Bonito	PE	2602308	26
1393	Brazil	Brejão	PE	2602407	26
1394	Brazil	Brejinho	PE	2602506	26
1395	Brazil	Brejo da Madre de Deus	PE	2602605	26
1396	Brazil	Buenos Aires	PE	2602704	26
1397	Brazil	Buíque	PE	2602803	26
1398	Brazil	Cabo de Santo Agostinho	PE	2602902	26
1399	Brazil	Cabrobó	PE	2603009	26
1400	Brazil	Cachoeirinha	PE	2603108	26
1401	Brazil	Caetés	PE	2603207	26
1402	Brazil	Calçado	PE	2603306	26
1403	Brazil	Calumbi	PE	2603405	26
1404	Brazil	Camaragibe	PE	2603454	26
1405	Brazil	Camocim de São Félix	PE	2603504	26
1406	Brazil	Camutanga	PE	2603603	26
1407	Brazil	Canhotinho	PE	2603702	26
1408	Brazil	Capoeiras	PE	2603801	26
1409	Brazil	Carnaíba	PE	2603900	26
1410	Brazil	Carnaubeira da Penha	PE	2603926	26
1411	Brazil	Carpina	PE	2604007	26
1412	Brazil	Caruaru	PE	2604106	26
1413	Brazil	Casinhas	PE	2604155	26
1414	Brazil	Catende	PE	2604205	26
1415	Brazil	Cedro	PE	2604304	26
1416	Brazil	Chã de Alegria	PE	2604403	26
1417	Brazil	Chã Grande	PE	2604502	26
1418	Brazil	Condado	PE	2604601	26
1419	Brazil	Correntes	PE	2604700	26
1420	Brazil	Cortês	PE	2604809	26
1421	Brazil	Cumaru	PE	2604908	26
1422	Brazil	Cupira	PE	2605004	26
1423	Brazil	Custódia	PE	2605103	26
1424	Brazil	Dormentes	PE	2605152	26
1425	Brazil	Escada	PE	2605202	26
1426	Brazil	Exu	PE	2605301	26
1427	Brazil	Feira Nova	PE	2605400	26
1428	Brazil	Fernando de Noronha	PE	2605459	26
1429	Brazil	Ferreiros	PE	2605509	26
1430	Brazil	Flores	PE	2605608	26
1431	Brazil	Floresta	PE	2605707	26
1432	Brazil	Frei Miguelinho	PE	2605806	26
1433	Brazil	Gameleira	PE	2605905	26
1434	Brazil	Garanhuns	PE	2606002	26
1435	Brazil	Glória do Goitá	PE	2606101	26
1436	Brazil	Goiana	PE	2606200	26
1437	Brazil	Granito	PE	2606309	26
1438	Brazil	Gravatá	PE	2606408	26
1439	Brazil	Iati	PE	2606507	26
1440	Brazil	Ibimirim	PE	2606606	26
1441	Brazil	Ibirajuba	PE	2606705	26
1442	Brazil	Igarassu	PE	2606804	26
1443	Brazil	Iguaraci	PE	2606903	26
1444	Brazil	Ilha de Itamaracá	PE	2607604	26
1445	Brazil	Inajá	PE	2607000	26
1446	Brazil	Ingazeira	PE	2607109	26
1447	Brazil	Ipojuca	PE	2607208	26
1448	Brazil	Ipubi	PE	2607307	26
1449	Brazil	Itacuruba	PE	2607406	26
1450	Brazil	Itaíba	PE	2607505	26
1451	Brazil	Itambé	PE	2607653	26
1452	Brazil	Itapetim	PE	2607703	26
1453	Brazil	Itapissuma	PE	2607752	26
1454	Brazil	Itaquitinga	PE	2607802	26
1455	Brazil	Jaboatão dos Guararapes	PE	2607901	26
1456	Brazil	Jaqueira	PE	2607950	26
1457	Brazil	Jataúba	PE	2608008	26
1458	Brazil	Jatobá	PE	2608057	26
1459	Brazil	João Alfredo	PE	2608107	26
1460	Brazil	Joaquim Nabuco	PE	2608206	26
1461	Brazil	Jucati	PE	2608255	26
1462	Brazil	Jupi	PE	2608305	26
1463	Brazil	Jurema	PE	2608404	26
1464	Brazil	Lagoa do Carro	PE	2608453	26
1465	Brazil	Lagoa do Itaenga	PE	2608503	26
1466	Brazil	Lagoa do Ouro	PE	2608602	26
1467	Brazil	Lagoa dos Gatos	PE	2608701	26
1468	Brazil	Lagoa Grande	PE	2608750	26
1469	Brazil	Lajedo	PE	2608800	26
1470	Brazil	Limoeiro	PE	2608909	26
1471	Brazil	Macaparana	PE	2609006	26
1472	Brazil	Machados	PE	2609105	26
1473	Brazil	Manari	PE	2609154	26
1474	Brazil	Maraial	PE	2609204	26
1475	Brazil	Mirandiba	PE	2609303	26
1476	Brazil	Moreilândia	PE	2614303	26
1477	Brazil	Moreno	PE	2609402	26
1478	Brazil	Nazaré da Mata	PE	2609501	26
1479	Brazil	Olinda	PE	2609600	26
1480	Brazil	Orobó	PE	2609709	26
1481	Brazil	Orocó	PE	2609808	26
1482	Brazil	Ouricuri	PE	2609907	26
1483	Brazil	Palmares	PE	2610004	26
1484	Brazil	Palmeirina	PE	2610103	26
1485	Brazil	Panelas	PE	2610202	26
1486	Brazil	Paranatama	PE	2610301	26
1487	Brazil	Parnamirim	PE	2610400	26
1488	Brazil	Passira	PE	2610509	26
1489	Brazil	Paudalho	PE	2610608	26
1490	Brazil	Paulista	PE	2610707	26
1491	Brazil	Pedra	PE	2610806	26
1492	Brazil	Pesqueira	PE	2610905	26
1493	Brazil	Petrolândia	PE	2611002	26
1494	Brazil	Petrolina	PE	2611101	26
1495	Brazil	Poção	PE	2611200	26
1496	Brazil	Pombos	PE	2611309	26
1497	Brazil	Primavera	PE	2611408	26
1498	Brazil	Quipapá	PE	2611507	26
1499	Brazil	Quixaba	PE	2611533	26
1500	Brazil	Recife	PE	2611606	26
1501	Brazil	Riacho das Almas	PE	2611705	26
1502	Brazil	Ribeirão	PE	2611804	26
1503	Brazil	Rio Formoso	PE	2611903	26
1504	Brazil	Sairé	PE	2612000	26
1505	Brazil	Salgadinho	PE	2612109	26
1506	Brazil	Salgueiro	PE	2612208	26
1507	Brazil	Saloá	PE	2612307	26
1508	Brazil	Sanharó	PE	2612406	26
1509	Brazil	Santa Cruz	PE	2612455	26
1510	Brazil	Santa Cruz da Baixa Verde	PE	2612471	26
1511	Brazil	Santa Cruz do Capibaribe	PE	2612505	26
1512	Brazil	Santa Filomena	PE	2612554	26
1513	Brazil	Santa Maria da Boa Vista	PE	2612604	26
1514	Brazil	Santa Maria do Cambucá	PE	2612703	26
1515	Brazil	Santa Terezinha	PE	2612802	26
1516	Brazil	São Benedito do Sul	PE	2612901	26
1517	Brazil	São Bento do Una	PE	2613008	26
1518	Brazil	São Caitano	PE	2613107	26
1519	Brazil	São João	PE	2613206	26
1520	Brazil	São Joaquim do Monte	PE	2613305	26
1521	Brazil	São José da Coroa Grande	PE	2613404	26
1522	Brazil	São José do Belmonte	PE	2613503	26
1523	Brazil	São José do Egito	PE	2613602	26
1524	Brazil	São Lourenço da Mata	PE	2613701	26
1525	Brazil	São Vicente Ferrer	PE	2613800	26
1526	Brazil	Serra Talhada	PE	2613909	26
1527	Brazil	Serrita	PE	2614006	26
1528	Brazil	Sertânia	PE	2614105	26
1529	Brazil	Sirinhaém	PE	2614204	26
1530	Brazil	Solidão	PE	2614402	26
1531	Brazil	Surubim	PE	2614501	26
1532	Brazil	Tabira	PE	2614600	26
1533	Brazil	Tacaimbó	PE	2614709	26
1534	Brazil	Tacaratu	PE	2614808	26
1535	Brazil	Tamandaré	PE	2614857	26
1536	Brazil	Taquaritinga do Norte	PE	2615003	26
1537	Brazil	Terezinha	PE	2615102	26
1538	Brazil	Terra Nova	PE	2615201	26
1539	Brazil	Timbaúba	PE	2615300	26
1540	Brazil	Toritama	PE	2615409	26
1541	Brazil	Tracunhaém	PE	2615508	26
1542	Brazil	Trindade	PE	2615607	26
1543	Brazil	Triunfo	PE	2615706	26
1544	Brazil	Tupanatinga	PE	2615805	26
1545	Brazil	Tuparetama	PE	2615904	26
1546	Brazil	Venturosa	PE	2616001	26
1547	Brazil	Verdejante	PE	2616100	26
1548	Brazil	Vertente do Lério	PE	2616183	26
1549	Brazil	Vertentes	PE	2616209	26
1550	Brazil	Vicência	PE	2616308	26
1551	Brazil	Vitória de Santo Antão	PE	2616407	26
1552	Brazil	Xexéu	PE	2616506	26
1553	Brazil	Açailândia	MA	2100055	21
1554	Brazil	Afonso Cunha	MA	2100105	21
1555	Brazil	Água Doce do Maranhão	MA	2100154	21
1556	Brazil	Alcântara	MA	2100204	21
1557	Brazil	Aldeias Altas	MA	2100303	21
1558	Brazil	Altamira do Maranhão	MA	2100402	21
1559	Brazil	Alto Alegre do Maranhão	MA	2100436	21
1560	Brazil	Alto Alegre do Pindaré	MA	2100477	21
1561	Brazil	Alto Parnaíba	MA	2100501	21
1562	Brazil	Amapá do Maranhão	MA	2100550	21
1563	Brazil	Amarante do Maranhão	MA	2100600	21
1564	Brazil	Anajatuba	MA	2100709	21
1565	Brazil	Anapurus	MA	2100808	21
1566	Brazil	Apicum-Açu	MA	2100832	21
1567	Brazil	Araguanã	MA	2100873	21
1568	Brazil	Araioses	MA	2100907	21
1569	Brazil	Arame	MA	2100956	21
1570	Brazil	Arari	MA	2101004	21
1571	Brazil	Axixá	MA	2101103	21
1572	Brazil	Bacabal	MA	2101202	21
1573	Brazil	Bacabeira	MA	2101251	21
1574	Brazil	Bacuri	MA	2101301	21
1575	Brazil	Bacurituba	MA	2101350	21
1576	Brazil	Balsas	MA	2101400	21
1577	Brazil	Barão de Grajaú	MA	2101509	21
1578	Brazil	Barra do Corda	MA	2101608	21
1579	Brazil	Barreirinhas	MA	2101707	21
1580	Brazil	Bela Vista do Maranhão	MA	2101772	21
1581	Brazil	Belágua	MA	2101731	21
1582	Brazil	Benedito Leite	MA	2101806	21
1583	Brazil	Bequimão	MA	2101905	21
1584	Brazil	Bernardo do Mearim	MA	2101939	21
1585	Brazil	Boa Vista do Gurupi	MA	2101970	21
1586	Brazil	Bom Jardim	MA	2102002	21
1587	Brazil	Bom Jesus das Selvas	MA	2102036	21
1588	Brazil	Bom Lugar	MA	2102077	21
1589	Brazil	Brejo	MA	2102101	21
1590	Brazil	Brejo de Areia	MA	2102150	21
1591	Brazil	Buriti	MA	2102200	21
1592	Brazil	Buriti Bravo	MA	2102309	21
1593	Brazil	Buriticupu	MA	2102325	21
1594	Brazil	Buritirana	MA	2102358	21
1595	Brazil	Cachoeira Grande	MA	2102374	21
1596	Brazil	Cajapió	MA	2102408	21
1597	Brazil	Cajari	MA	2102507	21
1598	Brazil	Campestre do Maranhão	MA	2102556	21
1599	Brazil	Cândido Mendes	MA	2102606	21
1600	Brazil	Cantanhede	MA	2102705	21
1601	Brazil	Capinzal do Norte	MA	2102754	21
1602	Brazil	Carolina	MA	2102804	21
1603	Brazil	Carutapera	MA	2102903	21
1604	Brazil	Caxias	MA	2103000	21
1605	Brazil	Cedral	MA	2103109	21
1606	Brazil	Central do Maranhão	MA	2103125	21
1607	Brazil	Centro do Guilherme	MA	2103158	21
1608	Brazil	Centro Novo do Maranhão	MA	2103174	21
1609	Brazil	Chapadinha	MA	2103208	21
1610	Brazil	Cidelândia	MA	2103257	21
1611	Brazil	Codó	MA	2103307	21
1612	Brazil	Coelho Neto	MA	2103406	21
1613	Brazil	Colinas	MA	2103505	21
1614	Brazil	Conceição do Lago-Açu	MA	2103554	21
1615	Brazil	Coroatá	MA	2103604	21
1616	Brazil	Cururupu	MA	2103703	21
1617	Brazil	Davinópolis	MA	2103752	21
1618	Brazil	Dom Pedro	MA	2103802	21
1619	Brazil	Duque Bacelar	MA	2103901	21
1620	Brazil	Esperantinópolis	MA	2104008	21
1621	Brazil	Estreito	MA	2104057	21
1622	Brazil	Feira Nova do Maranhão	MA	2104073	21
1623	Brazil	Fernando Falcão	MA	2104081	21
1624	Brazil	Formosa da Serra Negra	MA	2104099	21
1625	Brazil	Fortaleza dos Nogueiras	MA	2104107	21
1626	Brazil	Fortuna	MA	2104206	21
1627	Brazil	Godofredo Viana	MA	2104305	21
1628	Brazil	Gonçalves Dias	MA	2104404	21
1629	Brazil	Governador Archer	MA	2104503	21
1630	Brazil	Governador Edison Lobão	MA	2104552	21
1631	Brazil	Governador Eugênio Barros	MA	2104602	21
1632	Brazil	Governador Luiz Rocha	MA	2104628	21
1633	Brazil	Governador Newton Bello	MA	2104651	21
1634	Brazil	Governador Nunes Freire	MA	2104677	21
1635	Brazil	Graça Aranha	MA	2104701	21
1636	Brazil	Grajaú	MA	2104800	21
1637	Brazil	Guimarães	MA	2104909	21
1638	Brazil	Humberto de Campos	MA	2105005	21
1639	Brazil	Icatu	MA	2105104	21
1640	Brazil	Igarapé do Meio	MA	2105153	21
1641	Brazil	Igarapé Grande	MA	2105203	21
1642	Brazil	Imperatriz	MA	2105302	21
1643	Brazil	Itaipava do Grajaú	MA	2105351	21
1644	Brazil	Itapecuru Mirim	MA	2105401	21
1645	Brazil	Itinga do Maranhão	MA	2105427	21
1646	Brazil	Jatobá	MA	2105450	21
1647	Brazil	Jenipapo dos Vieiras	MA	2105476	21
1648	Brazil	João Lisboa	MA	2105500	21
1649	Brazil	Joselândia	MA	2105609	21
1650	Brazil	Junco do Maranhão	MA	2105658	21
1651	Brazil	Lago da Pedra	MA	2105708	21
1652	Brazil	Lago do Junco	MA	2105807	21
1653	Brazil	Lago dos Rodrigues	MA	2105948	21
1654	Brazil	Lago Verde	MA	2105906	21
1655	Brazil	Lagoa do Mato	MA	2105922	21
1656	Brazil	Lagoa Grande do Maranhão	MA	2105963	21
1657	Brazil	Lajeado Novo	MA	2105989	21
1658	Brazil	Lima Campos	MA	2106003	21
1659	Brazil	Loreto	MA	2106102	21
1660	Brazil	Luís Domingues	MA	2106201	21
1661	Brazil	Magalhães de Almeida	MA	2106300	21
1662	Brazil	Maracaçumé	MA	2106326	21
1663	Brazil	Marajá do Sena	MA	2106359	21
1664	Brazil	Maranhãozinho	MA	2106375	21
1665	Brazil	Mata Roma	MA	2106409	21
1666	Brazil	Matinha	MA	2106508	21
1667	Brazil	Matões	MA	2106607	21
1668	Brazil	Matões do Norte	MA	2106631	21
1669	Brazil	Milagres do Maranhão	MA	2106672	21
1670	Brazil	Mirador	MA	2106706	21
1671	Brazil	Miranda do Norte	MA	2106755	21
1672	Brazil	Mirinzal	MA	2106805	21
1673	Brazil	Monção	MA	2106904	21
1674	Brazil	Montes Altos	MA	2107001	21
1675	Brazil	Morros	MA	2107100	21
1676	Brazil	Nina Rodrigues	MA	2107209	21
1677	Brazil	Nova Colinas	MA	2107258	21
1678	Brazil	Nova Iorque	MA	2107308	21
1679	Brazil	Nova Olinda do Maranhão	MA	2107357	21
1680	Brazil	Olho d'Água das Cunhãs	MA	2107407	21
1681	Brazil	Olinda Nova do Maranhão	MA	2107456	21
1682	Brazil	Paço do Lumiar	MA	2107506	21
1683	Brazil	Palmeirândia	MA	2107605	21
1684	Brazil	Paraibano	MA	2107704	21
1685	Brazil	Parnarama	MA	2107803	21
1686	Brazil	Passagem Franca	MA	2107902	21
1687	Brazil	Pastos Bons	MA	2108009	21
1688	Brazil	Paulino Neves	MA	2108058	21
1689	Brazil	Paulo Ramos	MA	2108108	21
1690	Brazil	Pedreiras	MA	2108207	21
1691	Brazil	Pedro do Rosário	MA	2108256	21
1692	Brazil	Penalva	MA	2108306	21
1693	Brazil	Peri Mirim	MA	2108405	21
1694	Brazil	Peritoró	MA	2108454	21
1695	Brazil	Pindaré-Mirim	MA	2108504	21
1696	Brazil	Pinheiro	MA	2108603	21
1697	Brazil	Pio XII	MA	2108702	21
1698	Brazil	Pirapemas	MA	2108801	21
1699	Brazil	Poção de Pedras	MA	2108900	21
1700	Brazil	Porto Franco	MA	2109007	21
1701	Brazil	Porto Rico do Maranhão	MA	2109056	21
1702	Brazil	Presidente Dutra	MA	2109106	21
1703	Brazil	Presidente Juscelino	MA	2109205	21
1704	Brazil	Presidente Médici	MA	2109239	21
1705	Brazil	Presidente Sarney	MA	2109270	21
1706	Brazil	Presidente Vargas	MA	2109304	21
1707	Brazil	Primeira Cruz	MA	2109403	21
1708	Brazil	Raposa	MA	2109452	21
1709	Brazil	Riachão	MA	2109502	21
1710	Brazil	Ribamar Fiquene	MA	2109551	21
1711	Brazil	Rosário	MA	2109601	21
1712	Brazil	Sambaíba	MA	2109700	21
1713	Brazil	Santa Filomena do Maranhão	MA	2109759	21
1714	Brazil	Santa Helena	MA	2109809	21
1715	Brazil	Santa Inês	MA	2109908	21
1716	Brazil	Santa Luzia	MA	2110005	21
1717	Brazil	Santa Luzia do Paruá	MA	2110039	21
1718	Brazil	Santa Quitéria do Maranhão	MA	2110104	21
1719	Brazil	Santa Rita	MA	2110203	21
1720	Brazil	Santana do Maranhão	MA	2110237	21
1721	Brazil	Santo Amaro do Maranhão	MA	2110278	21
1722	Brazil	Santo Antônio dos Lopes	MA	2110302	21
1723	Brazil	São Benedito do Rio Preto	MA	2110401	21
1724	Brazil	São Bento	MA	2110500	21
1725	Brazil	São Bernardo	MA	2110609	21
1726	Brazil	São Domingos do Azeitão	MA	2110658	21
1727	Brazil	São Domingos do Maranhão	MA	2110708	21
1728	Brazil	São Félix de Balsas	MA	2110807	21
1729	Brazil	São Francisco do Brejão	MA	2110856	21
1730	Brazil	São Francisco do Maranhão	MA	2110906	21
1731	Brazil	São João Batista	MA	2111003	21
1732	Brazil	São João do Carú	MA	2111029	21
1733	Brazil	São João do Paraíso	MA	2111052	21
1734	Brazil	São João do Soter	MA	2111078	21
1735	Brazil	São João dos Patos	MA	2111102	21
1736	Brazil	São José de Ribamar	MA	2111201	21
1737	Brazil	São José dos Basílios	MA	2111250	21
1738	Brazil	São Luís	MA	2111300	21
1739	Brazil	São Luís Gonzaga do Maranhão	MA	2111409	21
1740	Brazil	São Mateus do Maranhão	MA	2111508	21
1741	Brazil	São Pedro da Água Branca	MA	2111532	21
1742	Brazil	São Pedro dos Crentes	MA	2111573	21
1743	Brazil	São Raimundo das Mangabeiras	MA	2111607	21
1744	Brazil	São Raimundo do Doca Bezerra	MA	2111631	21
1745	Brazil	São Roberto	MA	2111672	21
1746	Brazil	São Vicente Ferrer	MA	2111706	21
1747	Brazil	Satubinha	MA	2111722	21
1748	Brazil	Senador Alexandre Costa	MA	2111748	21
1749	Brazil	Senador La Rocque	MA	2111763	21
1750	Brazil	Serrano do Maranhão	MA	2111789	21
1751	Brazil	Sítio Novo	MA	2111805	21
1752	Brazil	Sucupira do Norte	MA	2111904	21
1753	Brazil	Sucupira do Riachão	MA	2111953	21
1754	Brazil	Tasso Fragoso	MA	2112001	21
1755	Brazil	Timbiras	MA	2112100	21
1756	Brazil	Timon	MA	2112209	21
1757	Brazil	Trizidela do Vale	MA	2112233	21
1758	Brazil	Tufilândia	MA	2112274	21
1759	Brazil	Tuntum	MA	2112308	21
1760	Brazil	Turiaçu	MA	2112407	21
1761	Brazil	Turilândia	MA	2112456	21
1762	Brazil	Tutóia	MA	2112506	21
1763	Brazil	Urbano Santos	MA	2112605	21
1764	Brazil	Vargem Grande	MA	2112704	21
1765	Brazil	Viana	MA	2112803	21
1766	Brazil	Vila Nova dos Martírios	MA	2112852	21
1767	Brazil	Vitória do Mearim	MA	2112902	21
1768	Brazil	Vitorino Freire	MA	2113009	21
1769	Brazil	Zé Doca	MA	2114007	21
1770	Brazil	Acauã	PI	2200053	22
1771	Brazil	Agricolândia	PI	2200103	22
1772	Brazil	Água Branca	PI	2200202	22
1773	Brazil	Alagoinha do Piauí	PI	2200251	22
1774	Brazil	Alegrete do Piauí	PI	2200277	22
1775	Brazil	Alto Longá	PI	2200301	22
1776	Brazil	Altos	PI	2200400	22
1777	Brazil	Alvorada do Gurguéia	PI	2200459	22
1778	Brazil	Amarante	PI	2200509	22
1779	Brazil	Angical do Piauí	PI	2200608	22
1780	Brazil	Anísio de Abreu	PI	2200707	22
1781	Brazil	Antônio Almeida	PI	2200806	22
1782	Brazil	Aroazes	PI	2200905	22
1783	Brazil	Aroeiras do Itaim	PI	2200954	22
1784	Brazil	Arraial	PI	2201002	22
1785	Brazil	Assunção do Piauí	PI	2201051	22
1786	Brazil	Avelino Lopes	PI	2201101	22
1787	Brazil	Baixa Grande do Ribeiro	PI	2201150	22
1788	Brazil	Barra D'Alcântara	PI	2201176	22
1789	Brazil	Barras	PI	2201200	22
1790	Brazil	Barreiras do Piauí	PI	2201309	22
1791	Brazil	Barro Duro	PI	2201408	22
1792	Brazil	Batalha	PI	2201507	22
1793	Brazil	Bela Vista do Piauí	PI	2201556	22
1794	Brazil	Belém do Piauí	PI	2201572	22
1795	Brazil	Beneditinos	PI	2201606	22
1796	Brazil	Bertolínia	PI	2201705	22
1797	Brazil	Betânia do Piauí	PI	2201739	22
1798	Brazil	Boa Hora	PI	2201770	22
1799	Brazil	Bocaina	PI	2201804	22
1800	Brazil	Bom Jesus	PI	2201903	22
1801	Brazil	Bom Princípio do Piauí	PI	2201919	22
1802	Brazil	Bonfim do Piauí	PI	2201929	22
1803	Brazil	Boqueirão do Piauí	PI	2201945	22
1804	Brazil	Brasileira	PI	2201960	22
1805	Brazil	Brejo do Piauí	PI	2201988	22
1806	Brazil	Buriti dos Lopes	PI	2202000	22
1807	Brazil	Buriti dos Montes	PI	2202026	22
1808	Brazil	Cabeceiras do Piauí	PI	2202059	22
1809	Brazil	Cajazeiras do Piauí	PI	2202075	22
1810	Brazil	Cajueiro da Praia	PI	2202083	22
1811	Brazil	Caldeirão Grande do Piauí	PI	2202091	22
1812	Brazil	Campinas do Piauí	PI	2202109	22
1813	Brazil	Campo Alegre do Fidalgo	PI	2202117	22
1814	Brazil	Campo Grande do Piauí	PI	2202133	22
1815	Brazil	Campo Largo do Piauí	PI	2202174	22
1816	Brazil	Campo Maior	PI	2202208	22
1817	Brazil	Canavieira	PI	2202251	22
1818	Brazil	Canto do Buriti	PI	2202307	22
1819	Brazil	Capitão de Campos	PI	2202406	22
1820	Brazil	Capitão Gervásio Oliveira	PI	2202455	22
1821	Brazil	Caracol	PI	2202505	22
1822	Brazil	Caraúbas do Piauí	PI	2202539	22
1823	Brazil	Caridade do Piauí	PI	2202554	22
1824	Brazil	Castelo do Piauí	PI	2202604	22
1825	Brazil	Caxingó	PI	2202653	22
1826	Brazil	Cocal	PI	2202703	22
1827	Brazil	Cocal de Telha	PI	2202711	22
1828	Brazil	Cocal dos Alves	PI	2202729	22
1829	Brazil	Coivaras	PI	2202737	22
1830	Brazil	Colônia do Gurguéia	PI	2202752	22
2053	Brazil	Condado	PB	2504504	25
1831	Brazil	Colônia do Piauí	PI	2202778	22
1832	Brazil	Conceição do Canindé	PI	2202802	22
1833	Brazil	Coronel José Dias	PI	2202851	22
1834	Brazil	Corrente	PI	2202901	22
1835	Brazil	Cristalândia do Piauí	PI	2203008	22
1836	Brazil	Cristino Castro	PI	2203107	22
1837	Brazil	Curimatá	PI	2203206	22
1838	Brazil	Currais	PI	2203230	22
1839	Brazil	Curral Novo do Piauí	PI	2203271	22
1840	Brazil	Curralinhos	PI	2203255	22
1841	Brazil	Demerval Lobão	PI	2203305	22
1842	Brazil	Dirceu Arcoverde	PI	2203354	22
1843	Brazil	Dom Expedito Lopes	PI	2203404	22
1844	Brazil	Dom Inocêncio	PI	2203453	22
1845	Brazil	Domingos Mourão	PI	2203420	22
1846	Brazil	Elesbão Veloso	PI	2203503	22
1847	Brazil	Eliseu Martins	PI	2203602	22
1848	Brazil	Esperantina	PI	2203701	22
1849	Brazil	Fartura do Piauí	PI	2203750	22
1850	Brazil	Flores do Piauí	PI	2203800	22
1851	Brazil	Floresta do Piauí	PI	2203859	22
1852	Brazil	Floriano	PI	2203909	22
1853	Brazil	Francinópolis	PI	2204006	22
1854	Brazil	Francisco Ayres	PI	2204105	22
1855	Brazil	Francisco Macedo	PI	2204154	22
1856	Brazil	Francisco Santos	PI	2204204	22
1857	Brazil	Fronteiras	PI	2204303	22
1858	Brazil	Geminiano	PI	2204352	22
1859	Brazil	Gilbués	PI	2204402	22
1860	Brazil	Guadalupe	PI	2204501	22
1861	Brazil	Guaribas	PI	2204550	22
1862	Brazil	Hugo Napoleão	PI	2204600	22
1863	Brazil	Ilha Grande	PI	2204659	22
1864	Brazil	Inhuma	PI	2204709	22
1865	Brazil	Ipiranga do Piauí	PI	2204808	22
1866	Brazil	Isaías Coelho	PI	2204907	22
1867	Brazil	Itainópolis	PI	2205003	22
1868	Brazil	Itaueira	PI	2205102	22
1869	Brazil	Jacobina do Piauí	PI	2205151	22
1870	Brazil	Jaicós	PI	2205201	22
1871	Brazil	Jardim do Mulato	PI	2205250	22
1872	Brazil	Jatobá do Piauí	PI	2205276	22
1873	Brazil	Jerumenha	PI	2205300	22
1874	Brazil	João Costa	PI	2205359	22
1875	Brazil	Joaquim Pires	PI	2205409	22
1876	Brazil	Joca Marques	PI	2205458	22
1877	Brazil	José de Freitas	PI	2205508	22
1878	Brazil	Juazeiro do Piauí	PI	2205516	22
1879	Brazil	Júlio Borges	PI	2205524	22
1880	Brazil	Jurema	PI	2205532	22
1881	Brazil	Lagoa Alegre	PI	2205557	22
1882	Brazil	Lagoa de São Francisco	PI	2205573	22
1883	Brazil	Lagoa do Barro do Piauí	PI	2205565	22
1884	Brazil	Lagoa do Piauí	PI	2205581	22
1885	Brazil	Lagoa do Sítio	PI	2205599	22
1886	Brazil	Lagoinha do Piauí	PI	2205540	22
1887	Brazil	Landri Sales	PI	2205607	22
1888	Brazil	Luís Correia	PI	2205706	22
1889	Brazil	Luzilândia	PI	2205805	22
1890	Brazil	Madeiro	PI	2205854	22
1891	Brazil	Manoel Emídio	PI	2205904	22
1892	Brazil	Marcolândia	PI	2205953	22
1893	Brazil	Marcos Parente	PI	2206001	22
1894	Brazil	Massapê do Piauí	PI	2206050	22
1895	Brazil	Matias Olímpio	PI	2206100	22
1896	Brazil	Miguel Alves	PI	2206209	22
1897	Brazil	Miguel Leão	PI	2206308	22
1898	Brazil	Milton Brandão	PI	2206357	22
1899	Brazil	Monsenhor Gil	PI	2206407	22
1900	Brazil	Monsenhor Hipólito	PI	2206506	22
1901	Brazil	Monte Alegre do Piauí	PI	2206605	22
1902	Brazil	Morro Cabeça no Tempo	PI	2206654	22
1903	Brazil	Morro do Chapéu do Piauí	PI	2206670	22
1904	Brazil	Murici dos Portelas	PI	2206696	22
1905	Brazil	Nazaré do Piauí	PI	2206704	22
1906	Brazil	Nazária	PI	2206720	22
1907	Brazil	Nossa Senhora de Nazaré	PI	2206753	22
1908	Brazil	Nossa Senhora dos Remédios	PI	2206803	22
1909	Brazil	Nova Santa Rita	PI	2207959	22
1910	Brazil	Novo Oriente do Piauí	PI	2206902	22
1911	Brazil	Novo Santo Antônio	PI	2206951	22
1912	Brazil	Oeiras	PI	2207009	22
1913	Brazil	Olho D'Água do Piauí	PI	2207108	22
1914	Brazil	Padre Marcos	PI	2207207	22
1915	Brazil	Paes Landim	PI	2207306	22
1916	Brazil	Pajeú do Piauí	PI	2207355	22
1917	Brazil	Palmeira do Piauí	PI	2207405	22
1918	Brazil	Palmeirais	PI	2207504	22
1919	Brazil	Paquetá	PI	2207553	22
1920	Brazil	Parnaguá	PI	2207603	22
1921	Brazil	Parnaíba	PI	2207702	22
1922	Brazil	Passagem Franca do Piauí	PI	2207751	22
1923	Brazil	Patos do Piauí	PI	2207777	22
1924	Brazil	Pau D'Arco do Piauí	PI	2207793	22
1925	Brazil	Paulistana	PI	2207801	22
1926	Brazil	Pavussu	PI	2207850	22
1927	Brazil	Pedro II	PI	2207900	22
1928	Brazil	Pedro Laurentino	PI	2207934	22
1929	Brazil	Picos	PI	2208007	22
1930	Brazil	Pimenteiras	PI	2208106	22
1931	Brazil	Pio IX	PI	2208205	22
1932	Brazil	Piracuruca	PI	2208304	22
1933	Brazil	Piripiri	PI	2208403	22
1934	Brazil	Porto	PI	2208502	22
1935	Brazil	Porto Alegre do Piauí	PI	2208551	22
1936	Brazil	Prata do Piauí	PI	2208601	22
1937	Brazil	Queimada Nova	PI	2208650	22
1938	Brazil	Redenção do Gurguéia	PI	2208700	22
1939	Brazil	Regeneração	PI	2208809	22
1940	Brazil	Riacho Frio	PI	2208858	22
1941	Brazil	Ribeira do Piauí	PI	2208874	22
1942	Brazil	Ribeiro Gonçalves	PI	2208908	22
1943	Brazil	Rio Grande do Piauí	PI	2209005	22
1944	Brazil	Santa Cruz do Piauí	PI	2209104	22
1945	Brazil	Santa Cruz dos Milagres	PI	2209153	22
1946	Brazil	Santa Filomena	PI	2209203	22
1947	Brazil	Santa Luz	PI	2209302	22
1948	Brazil	Santa Rosa do Piauí	PI	2209377	22
1949	Brazil	Santana do Piauí	PI	2209351	22
1950	Brazil	Santo Antônio de Lisboa	PI	2209401	22
1951	Brazil	Santo Antônio dos Milagres	PI	2209450	22
1952	Brazil	Santo Inácio do Piauí	PI	2209500	22
1953	Brazil	São Braz do Piauí	PI	2209559	22
1954	Brazil	São Félix do Piauí	PI	2209609	22
1955	Brazil	São Francisco de Assis do Piauí	PI	2209658	22
1956	Brazil	São Francisco do Piauí	PI	2209708	22
1957	Brazil	São Gonçalo do Gurguéia	PI	2209757	22
1958	Brazil	São Gonçalo do Piauí	PI	2209807	22
1959	Brazil	São João da Canabrava	PI	2209856	22
1960	Brazil	São João da Fronteira	PI	2209872	22
1961	Brazil	São João da Serra	PI	2209906	22
1962	Brazil	São João da Varjota	PI	2209955	22
1963	Brazil	São João do Arraial	PI	2209971	22
1964	Brazil	São João do Piauí	PI	2210003	22
1965	Brazil	São José do Divino	PI	2210052	22
1966	Brazil	São José do Peixe	PI	2210102	22
1967	Brazil	São José do Piauí	PI	2210201	22
1968	Brazil	São Julião	PI	2210300	22
1969	Brazil	São Lourenço do Piauí	PI	2210359	22
1970	Brazil	São Luis do Piauí	PI	2210375	22
1971	Brazil	São Miguel da Baixa Grande	PI	2210383	22
1972	Brazil	São Miguel do Fidalgo	PI	2210391	22
1973	Brazil	São Miguel do Tapuio	PI	2210409	22
1974	Brazil	São Pedro do Piauí	PI	2210508	22
1975	Brazil	São Raimundo Nonato	PI	2210607	22
1976	Brazil	Sebastião Barros	PI	2210623	22
1977	Brazil	Sebastião Leal	PI	2210631	22
1978	Brazil	Sigefredo Pacheco	PI	2210656	22
1979	Brazil	Simões	PI	2210706	22
1980	Brazil	Simplício Mendes	PI	2210805	22
1981	Brazil	Socorro do Piauí	PI	2210904	22
1982	Brazil	Sussuapara	PI	2210938	22
1983	Brazil	Tamboril do Piauí	PI	2210953	22
1984	Brazil	Tanque do Piauí	PI	2210979	22
1985	Brazil	Teresina	PI	2211001	22
1986	Brazil	União	PI	2211100	22
1987	Brazil	Uruçuí	PI	2211209	22
1988	Brazil	Valença do Piauí	PI	2211308	22
1989	Brazil	Várzea Branca	PI	2211357	22
1990	Brazil	Várzea Grande	PI	2211407	22
1991	Brazil	Vera Mendes	PI	2211506	22
1992	Brazil	Vila Nova do Piauí	PI	2211605	22
1993	Brazil	Wall Ferraz	PI	2211704	22
1994	Brazil	Água Branca	PB	2500106	25
1995	Brazil	Aguiar	PB	2500205	25
1996	Brazil	Alagoa Grande	PB	2500304	25
1997	Brazil	Alagoa Nova	PB	2500403	25
1998	Brazil	Alagoinha	PB	2500502	25
1999	Brazil	Alcantil	PB	2500536	25
2000	Brazil	Algodão de Jandaíra	PB	2500577	25
2001	Brazil	Alhandra	PB	2500601	25
2002	Brazil	Amparo	PB	2500734	25
2003	Brazil	Aparecida	PB	2500775	25
2004	Brazil	Araçagi	PB	2500809	25
2005	Brazil	Arara	PB	2500908	25
2006	Brazil	Araruna	PB	2501005	25
2007	Brazil	Areia	PB	2501104	25
2008	Brazil	Areia de Baraúnas	PB	2501153	25
2009	Brazil	Areial	PB	2501203	25
2010	Brazil	Aroeiras	PB	2501302	25
2011	Brazil	Assunção	PB	2501351	25
2012	Brazil	Baía da Traição	PB	2501401	25
2013	Brazil	Bananeiras	PB	2501500	25
2014	Brazil	Baraúna	PB	2501534	25
2015	Brazil	Barra de Santa Rosa	PB	2501609	25
2016	Brazil	Barra de Santana	PB	2501575	25
2017	Brazil	Barra de São Miguel	PB	2501708	25
2018	Brazil	Bayeux	PB	2501807	25
2019	Brazil	Belém	PB	2501906	25
2020	Brazil	Belém do Brejo do Cruz	PB	2502003	25
2021	Brazil	Bernardino Batista	PB	2502052	25
2022	Brazil	Boa Ventura	PB	2502102	25
2023	Brazil	Boa Vista	PB	2502151	25
2024	Brazil	Bom Jesus	PB	2502201	25
2025	Brazil	Bom Sucesso	PB	2502300	25
2026	Brazil	Bonito de Santa Fé	PB	2502409	25
2027	Brazil	Boqueirão	PB	2502508	25
2028	Brazil	Borborema	PB	2502706	25
2029	Brazil	Brejo do Cruz	PB	2502805	25
2030	Brazil	Brejo dos Santos	PB	2502904	25
2031	Brazil	Caaporã	PB	2503001	25
2032	Brazil	Cabaceiras	PB	2503100	25
2033	Brazil	Cabedelo	PB	2503209	25
2034	Brazil	Cachoeira dos Índios	PB	2503308	25
2035	Brazil	Cacimba de Areia	PB	2503407	25
2036	Brazil	Cacimba de Dentro	PB	2503506	25
2037	Brazil	Cacimbas	PB	2503555	25
2038	Brazil	Caiçara	PB	2503605	25
2039	Brazil	Cajazeiras	PB	2503704	25
2040	Brazil	Cajazeirinhas	PB	2503753	25
2041	Brazil	Caldas Brandão	PB	2503803	25
2042	Brazil	Camalaú	PB	2503902	25
2043	Brazil	Campina Grande	PB	2504009	25
2044	Brazil	Campo de Santana	PB	2516409	25
2045	Brazil	Capim	PB	2504033	25
2046	Brazil	Caraúbas	PB	2504074	25
2047	Brazil	Carrapateira	PB	2504108	25
2048	Brazil	Casserengue	PB	2504157	25
2049	Brazil	Catingueira	PB	2504207	25
2050	Brazil	Catolé do Rocha	PB	2504306	25
2051	Brazil	Caturité	PB	2504355	25
2052	Brazil	Conceição	PB	2504405	25
2054	Brazil	Conde	PB	2504603	25
2055	Brazil	Congo	PB	2504702	25
2056	Brazil	Coremas	PB	2504801	25
2057	Brazil	Coxixola	PB	2504850	25
2058	Brazil	Cruz do Espírito Santo	PB	2504900	25
2059	Brazil	Cubati	PB	2505006	25
2060	Brazil	Cuité	PB	2505105	25
2061	Brazil	Cuité de Mamanguape	PB	2505238	25
2062	Brazil	Cuitegi	PB	2505204	25
2063	Brazil	Curral de Cima	PB	2505279	25
2064	Brazil	Curral Velho	PB	2505303	25
2065	Brazil	Damião	PB	2505352	25
2066	Brazil	Desterro	PB	2505402	25
2067	Brazil	Diamante	PB	2505600	25
2068	Brazil	Dona Inês	PB	2505709	25
2069	Brazil	Duas Estradas	PB	2505808	25
2070	Brazil	Emas	PB	2505907	25
2071	Brazil	Esperança	PB	2506004	25
2072	Brazil	Fagundes	PB	2506103	25
2073	Brazil	Frei Martinho	PB	2506202	25
2074	Brazil	Gado Bravo	PB	2506251	25
2075	Brazil	Guarabira	PB	2506301	25
2076	Brazil	Gurinhém	PB	2506400	25
2077	Brazil	Gurjão	PB	2506509	25
2078	Brazil	Ibiara	PB	2506608	25
2079	Brazil	Igaracy	PB	2502607	25
2080	Brazil	Imaculada	PB	2506707	25
2081	Brazil	Ingá	PB	2506806	25
2082	Brazil	Itabaiana	PB	2506905	25
2083	Brazil	Itaporanga	PB	2507002	25
2084	Brazil	Itapororoca	PB	2507101	25
2085	Brazil	Itatuba	PB	2507200	25
2086	Brazil	Jacaraú	PB	2507309	25
2087	Brazil	Jericó	PB	2507408	25
2088	Brazil	João Pessoa	PB	2507507	25
2089	Brazil	Juarez Távora	PB	2507606	25
2090	Brazil	Juazeirinho	PB	2507705	25
2091	Brazil	Junco do Seridó	PB	2507804	25
2092	Brazil	Juripiranga	PB	2507903	25
2093	Brazil	Juru	PB	2508000	25
2094	Brazil	Lagoa	PB	2508109	25
2095	Brazil	Lagoa de Dentro	PB	2508208	25
2096	Brazil	Lagoa Seca	PB	2508307	25
2097	Brazil	Lastro	PB	2508406	25
2098	Brazil	Livramento	PB	2508505	25
2099	Brazil	Logradouro	PB	2508554	25
2100	Brazil	Lucena	PB	2508604	25
2101	Brazil	Mãe d'Água	PB	2508703	25
2102	Brazil	Malta	PB	2508802	25
2103	Brazil	Mamanguape	PB	2508901	25
2104	Brazil	Manaíra	PB	2509008	25
2105	Brazil	Marcação	PB	2509057	25
2106	Brazil	Mari	PB	2509107	25
2107	Brazil	Marizópolis	PB	2509156	25
2108	Brazil	Massaranduba	PB	2509206	25
2109	Brazil	Mataraca	PB	2509305	25
2110	Brazil	Matinhas	PB	2509339	25
2111	Brazil	Mato Grosso	PB	2509370	25
2112	Brazil	Maturéia	PB	2509396	25
2113	Brazil	Mogeiro	PB	2509404	25
2114	Brazil	Montadas	PB	2509503	25
2115	Brazil	Monte Horebe	PB	2509602	25
2116	Brazil	Monteiro	PB	2509701	25
2117	Brazil	Mulungu	PB	2509800	25
2118	Brazil	Natuba	PB	2509909	25
2119	Brazil	Nazarezinho	PB	2510006	25
2120	Brazil	Nova Floresta	PB	2510105	25
2121	Brazil	Nova Olinda	PB	2510204	25
2122	Brazil	Nova Palmeira	PB	2510303	25
2123	Brazil	Olho d'Água	PB	2510402	25
2124	Brazil	Olivedos	PB	2510501	25
2125	Brazil	Ouro Velho	PB	2510600	25
2126	Brazil	Parari	PB	2510659	25
2127	Brazil	Passagem	PB	2510709	25
2128	Brazil	Patos	PB	2510808	25
2129	Brazil	Paulista	PB	2510907	25
2130	Brazil	Pedra Branca	PB	2511004	25
2131	Brazil	Pedra Lavrada	PB	2511103	25
2132	Brazil	Pedras de Fogo	PB	2511202	25
2133	Brazil	Pedro Régis	PB	2512721	25
2134	Brazil	Piancó	PB	2511301	25
2135	Brazil	Picuí	PB	2511400	25
2136	Brazil	Pilar	PB	2511509	25
2137	Brazil	Pilões	PB	2511608	25
2138	Brazil	Pilõezinhos	PB	2511707	25
2139	Brazil	Pirpirituba	PB	2511806	25
2140	Brazil	Pitimbu	PB	2511905	25
2141	Brazil	Pocinhos	PB	2512002	25
2142	Brazil	Poço Dantas	PB	2512036	25
2143	Brazil	Poço de José de Moura	PB	2512077	25
2144	Brazil	Pombal	PB	2512101	25
2145	Brazil	Prata	PB	2512200	25
2146	Brazil	Princesa Isabel	PB	2512309	25
2147	Brazil	Puxinanã	PB	2512408	25
2148	Brazil	Queimadas	PB	2512507	25
2149	Brazil	Quixabá	PB	2512606	25
2150	Brazil	Remígio	PB	2512705	25
2151	Brazil	Riachão	PB	2512747	25
2152	Brazil	Riachão do Bacamarte	PB	2512754	25
2153	Brazil	Riachão do Poço	PB	2512762	25
2154	Brazil	Riacho de Santo Antônio	PB	2512788	25
2155	Brazil	Riacho dos Cavalos	PB	2512804	25
2156	Brazil	Rio Tinto	PB	2512903	25
2157	Brazil	Salgadinho	PB	2513000	25
2158	Brazil	Salgado de São Félix	PB	2513109	25
2159	Brazil	Santa Cecília	PB	2513158	25
2160	Brazil	Santa Cruz	PB	2513208	25
2161	Brazil	Santa Helena	PB	2513307	25
2162	Brazil	Santa Inês	PB	2513356	25
2163	Brazil	Santa Luzia	PB	2513406	25
2164	Brazil	Santa Rita	PB	2513703	25
2165	Brazil	Santa Teresinha	PB	2513802	25
2166	Brazil	Santana de Mangueira	PB	2513505	25
2167	Brazil	Santana dos Garrotes	PB	2513604	25
2168	Brazil	Santarém	PB	2513653	25
2169	Brazil	Santo André	PB	2513851	25
2170	Brazil	São Bentinho	PB	2513927	25
2171	Brazil	São Bento	PB	2513901	25
2172	Brazil	São Domingos de Pombal	PB	2513968	25
2173	Brazil	São Domingos do Cariri	PB	2513943	25
2174	Brazil	São Francisco	PB	2513984	25
2175	Brazil	São João do Cariri	PB	2514008	25
2176	Brazil	São João do Rio do Peixe	PB	2500700	25
2177	Brazil	São João do Tigre	PB	2514107	25
2178	Brazil	São José da Lagoa Tapada	PB	2514206	25
2179	Brazil	São José de Caiana	PB	2514305	25
2180	Brazil	São José de Espinharas	PB	2514404	25
2181	Brazil	São José de Piranhas	PB	2514503	25
2182	Brazil	São José de Princesa	PB	2514552	25
2183	Brazil	São José do Bonfim	PB	2514602	25
2184	Brazil	São José do Brejo do Cruz	PB	2514651	25
2185	Brazil	São José do Sabugi	PB	2514701	25
2186	Brazil	São José dos Cordeiros	PB	2514800	25
2187	Brazil	São José dos Ramos	PB	2514453	25
2188	Brazil	São Mamede	PB	2514909	25
2189	Brazil	São Miguel de Taipu	PB	2515005	25
2190	Brazil	São Sebastião de Lagoa de Roça	PB	2515104	25
2191	Brazil	São Sebastião do Umbuzeiro	PB	2515203	25
2192	Brazil	Sapé	PB	2515302	25
2193	Brazil	Seridó	PB	2515401	25
2194	Brazil	Serra Branca	PB	2515500	25
2195	Brazil	Serra da Raiz	PB	2515609	25
2196	Brazil	Serra Grande	PB	2515708	25
2197	Brazil	Serra Redonda	PB	2515807	25
2198	Brazil	Serraria	PB	2515906	25
2199	Brazil	Sertãozinho	PB	2515930	25
2200	Brazil	Sobrado	PB	2515971	25
2201	Brazil	Solânea	PB	2516003	25
2202	Brazil	Soledade	PB	2516102	25
2203	Brazil	Sossêgo	PB	2516151	25
2204	Brazil	Sousa	PB	2516201	25
2205	Brazil	Sumé	PB	2516300	25
2206	Brazil	Taperoá	PB	2516508	25
2207	Brazil	Tavares	PB	2516607	25
2208	Brazil	Teixeira	PB	2516706	25
2209	Brazil	Tenório	PB	2516755	25
2210	Brazil	Triunfo	PB	2516805	25
2211	Brazil	Uiraúna	PB	2516904	25
2212	Brazil	Umbuzeiro	PB	2517001	25
2213	Brazil	Várzea	PB	2517100	25
2214	Brazil	Vieirópolis	PB	2517209	25
2215	Brazil	Vista Serrana	PB	2505501	25
2216	Brazil	Zabelê	PB	2517407	25
2217	Brazil	Abadia de Goiás	GO	5200050	52
2218	Brazil	Abadiânia	GO	5200100	52
2219	Brazil	Acreúna	GO	5200134	52
2220	Brazil	Adelândia	GO	5200159	52
2221	Brazil	Água Fria de Goiás	GO	5200175	52
2222	Brazil	Água Limpa	GO	5200209	52
2223	Brazil	Águas Lindas de Goiás	GO	5200258	52
2224	Brazil	Alexânia	GO	5200308	52
2225	Brazil	Aloândia	GO	5200506	52
2226	Brazil	Alto Horizonte	GO	5200555	52
2227	Brazil	Alto Paraíso de Goiás	GO	5200605	52
2228	Brazil	Alvorada do Norte	GO	5200803	52
2229	Brazil	Amaralina	GO	5200829	52
2230	Brazil	Americano do Brasil	GO	5200852	52
2231	Brazil	Amorinópolis	GO	5200902	52
2232	Brazil	Anápolis	GO	5201108	52
2233	Brazil	Anhanguera	GO	5201207	52
2234	Brazil	Anicuns	GO	5201306	52
2235	Brazil	Aparecida de Goiânia	GO	5201405	52
2236	Brazil	Aparecida do Rio Doce	GO	5201454	52
2237	Brazil	Aporé	GO	5201504	52
2238	Brazil	Araçu	GO	5201603	52
2239	Brazil	Aragarças	GO	5201702	52
2240	Brazil	Aragoiânia	GO	5201801	52
2241	Brazil	Araguapaz	GO	5202155	52
2242	Brazil	Arenópolis	GO	5202353	52
2243	Brazil	Aruanã	GO	5202502	52
2244	Brazil	Aurilândia	GO	5202601	52
2245	Brazil	Avelinópolis	GO	5202809	52
2246	Brazil	Baliza	GO	5203104	52
2247	Brazil	Barro Alto	GO	5203203	52
2248	Brazil	Bela Vista de Goiás	GO	5203302	52
2249	Brazil	Bom Jardim de Goiás	GO	5203401	52
2250	Brazil	Bom Jesus de Goiás	GO	5203500	52
2251	Brazil	Bonfinópolis	GO	5203559	52
2252	Brazil	Bonópolis	GO	5203575	52
2253	Brazil	Brazabrantes	GO	5203609	52
2254	Brazil	Britânia	GO	5203807	52
2255	Brazil	Buriti Alegre	GO	5203906	52
2256	Brazil	Buriti de Goiás	GO	5203939	52
2257	Brazil	Buritinópolis	GO	5203962	52
2258	Brazil	Cabeceiras	GO	5204003	52
2259	Brazil	Cachoeira Alta	GO	5204102	52
2260	Brazil	Cachoeira de Goiás	GO	5204201	52
2261	Brazil	Cachoeira Dourada	GO	5204250	52
2262	Brazil	Caçu	GO	5204300	52
2263	Brazil	Caiapônia	GO	5204409	52
2264	Brazil	Caldas Novas	GO	5204508	52
2265	Brazil	Caldazinha	GO	5204557	52
2266	Brazil	Campestre de Goiás	GO	5204607	52
2267	Brazil	Campinaçu	GO	5204656	52
2268	Brazil	Campinorte	GO	5204706	52
2269	Brazil	Campo Alegre de Goiás	GO	5204805	52
2270	Brazil	Campo Limpo de Goiás	GO	5204854	52
2271	Brazil	Campos Belos	GO	5204904	52
2272	Brazil	Campos Verdes	GO	5204953	52
2273	Brazil	Carmo do Rio Verde	GO	5205000	52
2274	Brazil	Castelândia	GO	5205059	52
2275	Brazil	Catalão	GO	5205109	52
2276	Brazil	Caturaí	GO	5205208	52
2277	Brazil	Cavalcante	GO	5205307	52
2278	Brazil	Ceres	GO	5205406	52
2279	Brazil	Cezarina	GO	5205455	52
2280	Brazil	Chapadão do Céu	GO	5205471	52
2281	Brazil	Cidade Ocidental	GO	5205497	52
2282	Brazil	Cocalzinho de Goiás	GO	5205513	52
2283	Brazil	Colinas do Sul	GO	5205521	52
2284	Brazil	Córrego do Ouro	GO	5205703	52
2285	Brazil	Corumbá de Goiás	GO	5205802	52
2286	Brazil	Corumbaíba	GO	5205901	52
2287	Brazil	Cristalina	GO	5206206	52
2288	Brazil	Cristianópolis	GO	5206305	52
2289	Brazil	Crixás	GO	5206404	52
2290	Brazil	Cromínia	GO	5206503	52
2291	Brazil	Cumari	GO	5206602	52
2292	Brazil	Damianópolis	GO	5206701	52
2293	Brazil	Damolândia	GO	5206800	52
2294	Brazil	Davinópolis	GO	5206909	52
2295	Brazil	Diorama	GO	5207105	52
2296	Brazil	Divinópolis de Goiás	GO	5208301	52
2297	Brazil	Doverlândia	GO	5207253	52
2298	Brazil	Edealina	GO	5207352	52
2299	Brazil	Edéia	GO	5207402	52
2300	Brazil	Estrela do Norte	GO	5207501	52
2301	Brazil	Faina	GO	5207535	52
2302	Brazil	Fazenda Nova	GO	5207600	52
2303	Brazil	Firminópolis	GO	5207808	52
2304	Brazil	Flores de Goiás	GO	5207907	52
2305	Brazil	Formosa	GO	5208004	52
2306	Brazil	Formoso	GO	5208103	52
2307	Brazil	Gameleira de Goiás	GO	5208152	52
2308	Brazil	Goianápolis	GO	5208400	52
2309	Brazil	Goiandira	GO	5208509	52
2310	Brazil	Goianésia	GO	5208608	52
2311	Brazil	Goiânia	GO	5208707	52
2312	Brazil	Goianira	GO	5208806	52
2313	Brazil	Goiás	GO	5208905	52
2314	Brazil	Goiatuba	GO	5209101	52
2315	Brazil	Gouvelândia	GO	5209150	52
2316	Brazil	Guapó	GO	5209200	52
2317	Brazil	Guaraíta	GO	5209291	52
2318	Brazil	Guarani de Goiás	GO	5209408	52
2319	Brazil	Guarinos	GO	5209457	52
2320	Brazil	Heitoraí	GO	5209606	52
2321	Brazil	Hidrolândia	GO	5209705	52
2322	Brazil	Hidrolina	GO	5209804	52
2323	Brazil	Iaciara	GO	5209903	52
2324	Brazil	Inaciolândia	GO	5209937	52
2325	Brazil	Indiara	GO	5209952	52
2326	Brazil	Inhumas	GO	5210000	52
2327	Brazil	Ipameri	GO	5210109	52
2328	Brazil	Ipiranga de Goiás	GO	5210158	52
2329	Brazil	Iporá	GO	5210208	52
2330	Brazil	Israelândia	GO	5210307	52
2331	Brazil	Itaberaí	GO	5210406	52
2332	Brazil	Itaguari	GO	5210562	52
2333	Brazil	Itaguaru	GO	5210604	52
2334	Brazil	Itajá	GO	5210802	52
2335	Brazil	Itapaci	GO	5210901	52
2336	Brazil	Itapirapuã	GO	5211008	52
2337	Brazil	Itapuranga	GO	5211206	52
2338	Brazil	Itarumã	GO	5211305	52
2339	Brazil	Itauçu	GO	5211404	52
2340	Brazil	Itumbiara	GO	5211503	52
2341	Brazil	Ivolândia	GO	5211602	52
2342	Brazil	Jandaia	GO	5211701	52
2343	Brazil	Jaraguá	GO	5211800	52
2344	Brazil	Jataí	GO	5211909	52
2345	Brazil	Jaupaci	GO	5212006	52
2346	Brazil	Jesúpolis	GO	5212055	52
2347	Brazil	Joviânia	GO	5212105	52
2348	Brazil	Jussara	GO	5212204	52
2349	Brazil	Lagoa Santa	GO	5212253	52
2350	Brazil	Leopoldo de Bulhões	GO	5212303	52
2351	Brazil	Luziânia	GO	5212501	52
2352	Brazil	Mairipotaba	GO	5212600	52
2353	Brazil	Mambaí	GO	5212709	52
2354	Brazil	Mara Rosa	GO	5212808	52
2355	Brazil	Marzagão	GO	5212907	52
2356	Brazil	Matrinchã	GO	5212956	52
2357	Brazil	Maurilândia	GO	5213004	52
2358	Brazil	Mimoso de Goiás	GO	5213053	52
2359	Brazil	Minaçu	GO	5213087	52
2360	Brazil	Mineiros	GO	5213103	52
2361	Brazil	Moiporá	GO	5213400	52
2362	Brazil	Monte Alegre de Goiás	GO	5213509	52
2363	Brazil	Montes Claros de Goiás	GO	5213707	52
2364	Brazil	Montividiu	GO	5213756	52
2365	Brazil	Montividiu do Norte	GO	5213772	52
2366	Brazil	Morrinhos	GO	5213806	52
2367	Brazil	Morro Agudo de Goiás	GO	5213855	52
2368	Brazil	Mossâmedes	GO	5213905	52
2369	Brazil	Mozarlândia	GO	5214002	52
2370	Brazil	Mundo Novo	GO	5214051	52
2371	Brazil	Mutunópolis	GO	5214101	52
2372	Brazil	Nazário	GO	5214408	52
2373	Brazil	Nerópolis	GO	5214507	52
2374	Brazil	Niquelândia	GO	5214606	52
2375	Brazil	Nova América	GO	5214705	52
2376	Brazil	Nova Aurora	GO	5214804	52
2377	Brazil	Nova Crixás	GO	5214838	52
2378	Brazil	Nova Glória	GO	5214861	52
2379	Brazil	Nova Iguaçu de Goiás	GO	5214879	52
2380	Brazil	Nova Roma	GO	5214903	52
2381	Brazil	Nova Veneza	GO	5215009	52
2382	Brazil	Novo Brasil	GO	5215207	52
2383	Brazil	Novo Gama	GO	5215231	52
2384	Brazil	Novo Planalto	GO	5215256	52
2385	Brazil	Orizona	GO	5215306	52
2386	Brazil	Ouro Verde de Goiás	GO	5215405	52
2387	Brazil	Ouvidor	GO	5215504	52
2388	Brazil	Padre Bernardo	GO	5215603	52
2389	Brazil	Palestina de Goiás	GO	5215652	52
2390	Brazil	Palmeiras de Goiás	GO	5215702	52
2391	Brazil	Palmelo	GO	5215801	52
2392	Brazil	Palminópolis	GO	5215900	52
2393	Brazil	Panamá	GO	5216007	52
2394	Brazil	Paranaiguara	GO	5216304	52
2395	Brazil	Paraúna	GO	5216403	52
2396	Brazil	Perolândia	GO	5216452	52
2397	Brazil	Petrolina de Goiás	GO	5216809	52
2398	Brazil	Pilar de Goiás	GO	5216908	52
2399	Brazil	Piracanjuba	GO	5217104	52
2400	Brazil	Piranhas	GO	5217203	52
2401	Brazil	Pirenópolis	GO	5217302	52
2402	Brazil	Pires do Rio	GO	5217401	52
2403	Brazil	Planaltina	GO	5217609	52
2404	Brazil	Pontalina	GO	5217708	52
2405	Brazil	Porangatu	GO	5218003	52
2406	Brazil	Porteirão	GO	5218052	52
2407	Brazil	Portelândia	GO	5218102	52
2408	Brazil	Posse	GO	5218300	52
2409	Brazil	Professor Jamil	GO	5218391	52
2410	Brazil	Quirinópolis	GO	5218508	52
2411	Brazil	Rialma	GO	5218607	52
2412	Brazil	Rianápolis	GO	5218706	52
2413	Brazil	Rio Quente	GO	5218789	52
2414	Brazil	Rio Verde	GO	5218805	52
2415	Brazil	Rubiataba	GO	5218904	52
2416	Brazil	Sanclerlândia	GO	5219001	52
2417	Brazil	Santa Bárbara de Goiás	GO	5219100	52
2418	Brazil	Santa Cruz de Goiás	GO	5219209	52
2419	Brazil	Santa Fé de Goiás	GO	5219258	52
2420	Brazil	Santa Helena de Goiás	GO	5219308	52
2421	Brazil	Santa Isabel	GO	5219357	52
2422	Brazil	Santa Rita do Araguaia	GO	5219407	52
2423	Brazil	Santa Rita do Novo Destino	GO	5219456	52
2424	Brazil	Santa Rosa de Goiás	GO	5219506	52
2425	Brazil	Santa Tereza de Goiás	GO	5219605	52
2426	Brazil	Santa Terezinha de Goiás	GO	5219704	52
2427	Brazil	Santo Antônio da Barra	GO	5219712	52
2428	Brazil	Santo Antônio de Goiás	GO	5219738	52
2429	Brazil	Santo Antônio do Descoberto	GO	5219753	52
2430	Brazil	São Domingos	GO	5219803	52
2431	Brazil	São Francisco de Goiás	GO	5219902	52
2432	Brazil	São João da Paraúna	GO	5220058	52
2433	Brazil	São João d'Aliança	GO	5220009	52
2434	Brazil	São Luís de Montes Belos	GO	5220108	52
2435	Brazil	São Luíz do Norte	GO	5220157	52
2436	Brazil	São Miguel do Araguaia	GO	5220207	52
2437	Brazil	São Miguel do Passa Quatro	GO	5220264	52
2438	Brazil	São Patrício	GO	5220280	52
2439	Brazil	São Simão	GO	5220405	52
2440	Brazil	Senador Canedo	GO	5220454	52
2441	Brazil	Serranópolis	GO	5220504	52
2442	Brazil	Silvânia	GO	5220603	52
2443	Brazil	Simolândia	GO	5220686	52
2444	Brazil	Sítio d'Abadia	GO	5220702	52
2445	Brazil	Taquaral de Goiás	GO	5221007	52
2446	Brazil	Teresina de Goiás	GO	5221080	52
2447	Brazil	Terezópolis de Goiás	GO	5221197	52
2448	Brazil	Três Ranchos	GO	5221304	52
2449	Brazil	Trindade	GO	5221403	52
2450	Brazil	Trombas	GO	5221452	52
2451	Brazil	Turvânia	GO	5221502	52
2452	Brazil	Turvelândia	GO	5221551	52
2453	Brazil	Uirapuru	GO	5221577	52
2454	Brazil	Uruaçu	GO	5221601	52
2455	Brazil	Uruana	GO	5221700	52
2456	Brazil	Urutaí	GO	5221809	52
2457	Brazil	Valparaíso de Goiás	GO	5221858	52
2458	Brazil	Varjão	GO	5221908	52
2459	Brazil	Vianópolis	GO	5222005	52
2460	Brazil	Vicentinópolis	GO	5222054	52
2461	Brazil	Vila Boa	GO	5222203	52
2462	Brazil	Vila Propício	GO	5222302	52
2463	Brazil	Abdon Batista	SC	4200051	42
2464	Brazil	Abelardo Luz	SC	4200101	42
2465	Brazil	Agrolândia	SC	4200200	42
2466	Brazil	Agronômica	SC	4200309	42
2467	Brazil	Água Doce	SC	4200408	42
2468	Brazil	Águas de Chapecó	SC	4200507	42
2469	Brazil	Águas Frias	SC	4200556	42
2470	Brazil	Águas Mornas	SC	4200606	42
2471	Brazil	Alfredo Wagner	SC	4200705	42
2472	Brazil	Alto Bela Vista	SC	4200754	42
2473	Brazil	Anchieta	SC	4200804	42
2474	Brazil	Angelina	SC	4200903	42
2475	Brazil	Anita Garibaldi	SC	4201000	42
2476	Brazil	Anitápolis	SC	4201109	42
2477	Brazil	Antônio Carlos	SC	4201208	42
2478	Brazil	Apiúna	SC	4201257	42
2479	Brazil	Arabutã	SC	4201273	42
2480	Brazil	Araquari	SC	4201307	42
2481	Brazil	Araranguá	SC	4201406	42
2482	Brazil	Armazém	SC	4201505	42
2483	Brazil	Arroio Trinta	SC	4201604	42
2484	Brazil	Arvoredo	SC	4201653	42
2485	Brazil	Ascurra	SC	4201703	42
2486	Brazil	Atalanta	SC	4201802	42
2487	Brazil	Aurora	SC	4201901	42
2488	Brazil	Balneário Arroio do Silva	SC	4201950	42
2489	Brazil	Balneário Barra do Sul	SC	4202057	42
2490	Brazil	Balneário Camboriú	SC	4202008	42
2491	Brazil	Balneário Gaivota	SC	4202073	42
2492	Brazil	Balneário Piçarras	SC	4212809	42
2493	Brazil	Bandeirante	SC	4202081	42
2494	Brazil	Barra Bonita	SC	4202099	42
2495	Brazil	Barra Velha	SC	4202107	42
2496	Brazil	Bela Vista do Toldo	SC	4202131	42
2497	Brazil	Belmonte	SC	4202156	42
2498	Brazil	Benedito Novo	SC	4202206	42
2499	Brazil	Biguaçu	SC	4202305	42
2500	Brazil	Blumenau	SC	4202404	42
2501	Brazil	Bocaina do Sul	SC	4202438	42
2502	Brazil	Bom Jardim da Serra	SC	4202503	42
2503	Brazil	Bom Jesus	SC	4202537	42
2504	Brazil	Bom Jesus do Oeste	SC	4202578	42
2505	Brazil	Bom Retiro	SC	4202602	42
2506	Brazil	Bombinhas	SC	4202453	42
2507	Brazil	Botuverá	SC	4202701	42
2508	Brazil	Braço do Norte	SC	4202800	42
2509	Brazil	Braço do Trombudo	SC	4202859	42
2510	Brazil	Brunópolis	SC	4202875	42
2511	Brazil	Brusque	SC	4202909	42
2512	Brazil	Caçador	SC	4203006	42
2513	Brazil	Caibi	SC	4203105	42
2514	Brazil	Calmon	SC	4203154	42
2515	Brazil	Camboriú	SC	4203204	42
2516	Brazil	Campo Alegre	SC	4203303	42
2517	Brazil	Campo Belo do Sul	SC	4203402	42
2518	Brazil	Campo Erê	SC	4203501	42
2519	Brazil	Campos Novos	SC	4203600	42
2520	Brazil	Canelinha	SC	4203709	42
2521	Brazil	Canoinhas	SC	4203808	42
2522	Brazil	Capão Alto	SC	4203253	42
2523	Brazil	Capinzal	SC	4203907	42
2524	Brazil	Capivari de Baixo	SC	4203956	42
2525	Brazil	Catanduvas	SC	4204004	42
2526	Brazil	Caxambu do Sul	SC	4204103	42
2527	Brazil	Celso Ramos	SC	4204152	42
2528	Brazil	Cerro Negro	SC	4204178	42
2529	Brazil	Chapadão do Lageado	SC	4204194	42
2530	Brazil	Chapecó	SC	4204202	42
2531	Brazil	Cocal do Sul	SC	4204251	42
2532	Brazil	Concórdia	SC	4204301	42
2533	Brazil	Cordilheira Alta	SC	4204350	42
2534	Brazil	Coronel Freitas	SC	4204400	42
2535	Brazil	Coronel Martins	SC	4204459	42
2536	Brazil	Correia Pinto	SC	4204558	42
2537	Brazil	Corupá	SC	4204509	42
2538	Brazil	Criciúma	SC	4204608	42
2539	Brazil	Cunha Porã	SC	4204707	42
2540	Brazil	Cunhataí	SC	4204756	42
2541	Brazil	Curitibanos	SC	4204806	42
2542	Brazil	Descanso	SC	4204905	42
2543	Brazil	Dionísio Cerqueira	SC	4205001	42
2544	Brazil	Dona Emma	SC	4205100	42
2545	Brazil	Doutor Pedrinho	SC	4205159	42
2546	Brazil	Entre Rios	SC	4205175	42
2547	Brazil	Ermo	SC	4205191	42
2548	Brazil	Erval Velho	SC	4205209	42
2549	Brazil	Faxinal dos Guedes	SC	4205308	42
2550	Brazil	Flor do Sertão	SC	4205357	42
2551	Brazil	Florianópolis	SC	4205407	42
2552	Brazil	Formosa do Sul	SC	4205431	42
2553	Brazil	Forquilhinha	SC	4205456	42
2554	Brazil	Fraiburgo	SC	4205506	42
2555	Brazil	Frei Rogério	SC	4205555	42
2556	Brazil	Galvão	SC	4205605	42
2557	Brazil	Garopaba	SC	4205704	42
2558	Brazil	Garuva	SC	4205803	42
2559	Brazil	Gaspar	SC	4205902	42
2560	Brazil	Governador Celso Ramos	SC	4206009	42
2561	Brazil	Grão Pará	SC	4206108	42
2562	Brazil	Gravatal	SC	4206207	42
2563	Brazil	Guabiruba	SC	4206306	42
2564	Brazil	Guaraciaba	SC	4206405	42
2565	Brazil	Guaramirim	SC	4206504	42
2566	Brazil	Guarujá do Sul	SC	4206603	42
2567	Brazil	Guatambú	SC	4206652	42
2568	Brazil	Herval d'Oeste	SC	4206702	42
2569	Brazil	Ibiam	SC	4206751	42
2570	Brazil	Ibicaré	SC	4206801	42
2571	Brazil	Ibirama	SC	4206900	42
2572	Brazil	Içara	SC	4207007	42
2573	Brazil	Ilhota	SC	4207106	42
2574	Brazil	Imaruí	SC	4207205	42
2575	Brazil	Imbituba	SC	4207304	42
2576	Brazil	Imbuia	SC	4207403	42
2577	Brazil	Indaial	SC	4207502	42
2578	Brazil	Iomerê	SC	4207577	42
2579	Brazil	Ipira	SC	4207601	42
2580	Brazil	Iporã do Oeste	SC	4207650	42
2581	Brazil	Ipuaçu	SC	4207684	42
2582	Brazil	Ipumirim	SC	4207700	42
2583	Brazil	Iraceminha	SC	4207759	42
2584	Brazil	Irani	SC	4207809	42
2585	Brazil	Irati	SC	4207858	42
2586	Brazil	Irineópolis	SC	4207908	42
2587	Brazil	Itá	SC	4208005	42
2588	Brazil	Itaiópolis	SC	4208104	42
2589	Brazil	Itajaí	SC	4208203	42
2590	Brazil	Itapema	SC	4208302	42
2591	Brazil	Itapiranga	SC	4208401	42
2592	Brazil	Itapoá	SC	4208450	42
2593	Brazil	Ituporanga	SC	4208500	42
2594	Brazil	Jaborá	SC	4208609	42
2595	Brazil	Jacinto Machado	SC	4208708	42
2596	Brazil	Jaguaruna	SC	4208807	42
2597	Brazil	Jaraguá do Sul	SC	4208906	42
2598	Brazil	Jardinópolis	SC	4208955	42
2599	Brazil	Joaçaba	SC	4209003	42
2600	Brazil	Joinville	SC	4209102	42
2601	Brazil	José Boiteux	SC	4209151	42
2602	Brazil	Jupiá	SC	4209177	42
2603	Brazil	Lacerdópolis	SC	4209201	42
2604	Brazil	Lages	SC	4209300	42
2605	Brazil	Laguna	SC	4209409	42
2606	Brazil	Lajeado Grande	SC	4209458	42
2607	Brazil	Laurentino	SC	4209508	42
2608	Brazil	Lauro Muller	SC	4209607	42
2609	Brazil	Lebon Régis	SC	4209706	42
2610	Brazil	Leoberto Leal	SC	4209805	42
2611	Brazil	Lindóia do Sul	SC	4209854	42
2612	Brazil	Lontras	SC	4209904	42
2613	Brazil	Luiz Alves	SC	4210001	42
2614	Brazil	Luzerna	SC	4210035	42
2615	Brazil	Macieira	SC	4210050	42
2616	Brazil	Mafra	SC	4210100	42
2617	Brazil	Major Gercino	SC	4210209	42
2618	Brazil	Major Vieira	SC	4210308	42
2619	Brazil	Maracajá	SC	4210407	42
2620	Brazil	Maravilha	SC	4210506	42
2621	Brazil	Marema	SC	4210555	42
2622	Brazil	Massaranduba	SC	4210605	42
2623	Brazil	Matos Costa	SC	4210704	42
2624	Brazil	Meleiro	SC	4210803	42
2625	Brazil	Mirim Doce	SC	4210852	42
2626	Brazil	Modelo	SC	4210902	42
2627	Brazil	Mondaí	SC	4211009	42
2628	Brazil	Monte Carlo	SC	4211058	42
2629	Brazil	Monte Castelo	SC	4211108	42
2630	Brazil	Morro da Fumaça	SC	4211207	42
2631	Brazil	Morro Grande	SC	4211256	42
2632	Brazil	Navegantes	SC	4211306	42
2633	Brazil	Nova Erechim	SC	4211405	42
2634	Brazil	Nova Itaberaba	SC	4211454	42
2635	Brazil	Nova Trento	SC	4211504	42
2636	Brazil	Nova Veneza	SC	4211603	42
2637	Brazil	Novo Horizonte	SC	4211652	42
2638	Brazil	Orleans	SC	4211702	42
2639	Brazil	Otacílio Costa	SC	4211751	42
2640	Brazil	Ouro	SC	4211801	42
2641	Brazil	Ouro Verde	SC	4211850	42
2642	Brazil	Paial	SC	4211876	42
2643	Brazil	Painel	SC	4211892	42
2644	Brazil	Palhoça	SC	4211900	42
2645	Brazil	Palma Sola	SC	4212007	42
2646	Brazil	Palmeira	SC	4212056	42
2647	Brazil	Palmitos	SC	4212106	42
2648	Brazil	Papanduva	SC	4212205	42
2649	Brazil	Paraíso	SC	4212239	42
2650	Brazil	Passo de Torres	SC	4212254	42
2651	Brazil	Passos Maia	SC	4212270	42
2652	Brazil	Paulo Lopes	SC	4212304	42
2653	Brazil	Pedras Grandes	SC	4212403	42
2654	Brazil	Penha	SC	4212502	42
2655	Brazil	Peritiba	SC	4212601	42
2656	Brazil	Petrolândia	SC	4212700	42
2657	Brazil	Pinhalzinho	SC	4212908	42
2658	Brazil	Pinheiro Preto	SC	4213005	42
2659	Brazil	Piratuba	SC	4213104	42
2660	Brazil	Planalto Alegre	SC	4213153	42
2661	Brazil	Pomerode	SC	4213203	42
2662	Brazil	Ponte Alta	SC	4213302	42
2663	Brazil	Ponte Alta do Norte	SC	4213351	42
2664	Brazil	Ponte Serrada	SC	4213401	42
2665	Brazil	Porto Belo	SC	4213500	42
2666	Brazil	Porto União	SC	4213609	42
2667	Brazil	Pouso Redondo	SC	4213708	42
2668	Brazil	Praia Grande	SC	4213807	42
2669	Brazil	Presidente Castello Branco	SC	4213906	42
2670	Brazil	Presidente Getúlio	SC	4214003	42
2671	Brazil	Presidente Nereu	SC	4214102	42
2672	Brazil	Princesa	SC	4214151	42
2673	Brazil	Quilombo	SC	4214201	42
2674	Brazil	Rancho Queimado	SC	4214300	42
2675	Brazil	Rio das Antas	SC	4214409	42
2676	Brazil	Rio do Campo	SC	4214508	42
2677	Brazil	Rio do Oeste	SC	4214607	42
2678	Brazil	Rio do Sul	SC	4214805	42
2679	Brazil	Rio dos Cedros	SC	4214706	42
2680	Brazil	Rio Fortuna	SC	4214904	42
2681	Brazil	Rio Negrinho	SC	4215000	42
2682	Brazil	Rio Rufino	SC	4215059	42
2683	Brazil	Riqueza	SC	4215075	42
2684	Brazil	Rodeio	SC	4215109	42
2685	Brazil	Romelândia	SC	4215208	42
2686	Brazil	Salete	SC	4215307	42
2687	Brazil	Saltinho	SC	4215356	42
2688	Brazil	Salto Veloso	SC	4215406	42
2689	Brazil	Sangão	SC	4215455	42
2690	Brazil	Santa Cecília	SC	4215505	42
2691	Brazil	Santa Helena	SC	4215554	42
2692	Brazil	Santa Rosa de Lima	SC	4215604	42
2693	Brazil	Santa Rosa do Sul	SC	4215653	42
2694	Brazil	Santa Terezinha	SC	4215679	42
2695	Brazil	Santa Terezinha do Progresso	SC	4215687	42
2696	Brazil	Santiago do Sul	SC	4215695	42
2697	Brazil	Santo Amaro da Imperatriz	SC	4215703	42
2698	Brazil	São Bento do Sul	SC	4215802	42
2699	Brazil	São Bernardino	SC	4215752	42
2700	Brazil	São Bonifácio	SC	4215901	42
2701	Brazil	São Carlos	SC	4216008	42
2702	Brazil	São Cristovão do Sul	SC	4216057	42
2703	Brazil	São Domingos	SC	4216107	42
2704	Brazil	São Francisco do Sul	SC	4216206	42
2705	Brazil	São João Batista	SC	4216305	42
2706	Brazil	São João do Itaperiú	SC	4216354	42
2707	Brazil	São João do Oeste	SC	4216255	42
2708	Brazil	São João do Sul	SC	4216404	42
2709	Brazil	São Joaquim	SC	4216503	42
2710	Brazil	São José	SC	4216602	42
2711	Brazil	São José do Cedro	SC	4216701	42
2712	Brazil	São José do Cerrito	SC	4216800	42
2713	Brazil	São Lourenço do Oeste	SC	4216909	42
2714	Brazil	São Ludgero	SC	4217006	42
2715	Brazil	São Martinho	SC	4217105	42
2716	Brazil	São Miguel da Boa Vista	SC	4217154	42
2717	Brazil	São Miguel do Oeste	SC	4217204	42
2718	Brazil	São Pedro de Alcântara	SC	4217253	42
2719	Brazil	Saudades	SC	4217303	42
2720	Brazil	Schroeder	SC	4217402	42
2721	Brazil	Seara	SC	4217501	42
2722	Brazil	Serra Alta	SC	4217550	42
2723	Brazil	Siderópolis	SC	4217600	42
2724	Brazil	Sombrio	SC	4217709	42
2725	Brazil	Sul Brasil	SC	4217758	42
2726	Brazil	Taió	SC	4217808	42
2727	Brazil	Tangará	SC	4217907	42
2728	Brazil	Tigrinhos	SC	4217956	42
2729	Brazil	Tijucas	SC	4218004	42
2730	Brazil	Timbé do Sul	SC	4218103	42
2731	Brazil	Timbó	SC	4218202	42
2732	Brazil	Timbó Grande	SC	4218251	42
2733	Brazil	Três Barras	SC	4218301	42
2734	Brazil	Treviso	SC	4218350	42
2735	Brazil	Treze de Maio	SC	4218400	42
2736	Brazil	Treze Tílias	SC	4218509	42
2737	Brazil	Trombudo Central	SC	4218608	42
2738	Brazil	Tubarão	SC	4218707	42
2739	Brazil	Tunápolis	SC	4218756	42
2740	Brazil	Turvo	SC	4218806	42
2741	Brazil	União do Oeste	SC	4218855	42
2742	Brazil	Urubici	SC	4218905	42
2743	Brazil	Urupema	SC	4218954	42
2744	Brazil	Urussanga	SC	4219002	42
2745	Brazil	Vargeão	SC	4219101	42
2746	Brazil	Vargem	SC	4219150	42
2747	Brazil	Vargem Bonita	SC	4219176	42
2748	Brazil	Vidal Ramos	SC	4219200	42
2749	Brazil	Videira	SC	4219309	42
2750	Brazil	Vitor Meireles	SC	4219358	42
2751	Brazil	Witmarsum	SC	4219408	42
2752	Brazil	Xanxerê	SC	4219507	42
2753	Brazil	Xavantina	SC	4219606	42
2754	Brazil	Xaxim	SC	4219705	42
2755	Brazil	Zortéa	SC	4219853	42
2756	Brazil	Abatiá	PR	4100103	41
2757	Brazil	Adrianópolis	PR	4100202	41
2758	Brazil	Agudos do Sul	PR	4100301	41
2759	Brazil	Almirante Tamandaré	PR	4100400	41
2760	Brazil	Altamira do Paraná	PR	4100459	41
2761	Brazil	Alto Paraíso	PR	4128625	41
2762	Brazil	Alto Paraná	PR	4100608	41
2763	Brazil	Alto Piquiri	PR	4100707	41
2764	Brazil	Altônia	PR	4100509	41
2765	Brazil	Alvorada do Sul	PR	4100806	41
2766	Brazil	Amaporã	PR	4100905	41
2767	Brazil	Ampére	PR	4101002	41
2768	Brazil	Anahy	PR	4101051	41
2769	Brazil	Andirá	PR	4101101	41
2770	Brazil	Ângulo	PR	4101150	41
2771	Brazil	Antonina	PR	4101200	41
2772	Brazil	Antônio Olinto	PR	4101309	41
2773	Brazil	Apucarana	PR	4101408	41
2774	Brazil	Arapongas	PR	4101507	41
2775	Brazil	Arapoti	PR	4101606	41
2776	Brazil	Arapuã	PR	4101655	41
2777	Brazil	Araruna	PR	4101705	41
2778	Brazil	Araucária	PR	4101804	41
2779	Brazil	Ariranha do Ivaí	PR	4101853	41
2780	Brazil	Assaí	PR	4101903	41
2781	Brazil	Assis Chateaubriand	PR	4102000	41
2782	Brazil	Astorga	PR	4102109	41
2783	Brazil	Atalaia	PR	4102208	41
2784	Brazil	Balsa Nova	PR	4102307	41
2785	Brazil	Bandeirantes	PR	4102406	41
2786	Brazil	Barbosa Ferraz	PR	4102505	41
2787	Brazil	Barra do Jacaré	PR	4102703	41
2788	Brazil	Barracão	PR	4102604	41
2789	Brazil	Bela Vista da Caroba	PR	4102752	41
2790	Brazil	Bela Vista do Paraíso	PR	4102802	41
2791	Brazil	Bituruna	PR	4102901	41
2792	Brazil	Boa Esperança	PR	4103008	41
2793	Brazil	Boa Esperança do Iguaçu	PR	4103024	41
2794	Brazil	Boa Ventura de São Roque	PR	4103040	41
2795	Brazil	Boa Vista da Aparecida	PR	4103057	41
2796	Brazil	Bocaiúva do Sul	PR	4103107	41
2797	Brazil	Bom Jesus do Sul	PR	4103156	41
2798	Brazil	Bom Sucesso	PR	4103206	41
2799	Brazil	Bom Sucesso do Sul	PR	4103222	41
2800	Brazil	Borrazópolis	PR	4103305	41
2801	Brazil	Braganey	PR	4103354	41
2802	Brazil	Brasilândia do Sul	PR	4103370	41
2803	Brazil	Cafeara	PR	4103404	41
2804	Brazil	Cafelândia	PR	4103453	41
2805	Brazil	Cafezal do Sul	PR	4103479	41
2806	Brazil	Califórnia	PR	4103503	41
2807	Brazil	Cambará	PR	4103602	41
2808	Brazil	Cambé	PR	4103701	41
2809	Brazil	Cambira	PR	4103800	41
2810	Brazil	Campina da Lagoa	PR	4103909	41
2811	Brazil	Campina do Simão	PR	4103958	41
2812	Brazil	Campina Grande do Sul	PR	4104006	41
2813	Brazil	Campo Bonito	PR	4104055	41
2814	Brazil	Campo do Tenente	PR	4104105	41
2815	Brazil	Campo Largo	PR	4104204	41
2816	Brazil	Campo Magro	PR	4104253	41
2817	Brazil	Campo Mourão	PR	4104303	41
2818	Brazil	Cândido de Abreu	PR	4104402	41
2819	Brazil	Candói	PR	4104428	41
2820	Brazil	Cantagalo	PR	4104451	41
2821	Brazil	Capanema	PR	4104501	41
2822	Brazil	Capitão Leônidas Marques	PR	4104600	41
2823	Brazil	Carambeí	PR	4104659	41
2824	Brazil	Carlópolis	PR	4104709	41
2825	Brazil	Cascavel	PR	4104808	41
2826	Brazil	Castro	PR	4104907	41
2827	Brazil	Catanduvas	PR	4105003	41
2828	Brazil	Centenário do Sul	PR	4105102	41
2829	Brazil	Cerro Azul	PR	4105201	41
2830	Brazil	Céu Azul	PR	4105300	41
2831	Brazil	Chopinzinho	PR	4105409	41
2832	Brazil	Cianorte	PR	4105508	41
2833	Brazil	Cidade Gaúcha	PR	4105607	41
2834	Brazil	Clevelândia	PR	4105706	41
2835	Brazil	Colombo	PR	4105805	41
2836	Brazil	Colorado	PR	4105904	41
2837	Brazil	Congonhinhas	PR	4106001	41
2838	Brazil	Conselheiro Mairinck	PR	4106100	41
2839	Brazil	Contenda	PR	4106209	41
2840	Brazil	Corbélia	PR	4106308	41
2841	Brazil	Cornélio Procópio	PR	4106407	41
2842	Brazil	Coronel Domingos Soares	PR	4106456	41
2843	Brazil	Coronel Vivida	PR	4106506	41
2844	Brazil	Corumbataí do Sul	PR	4106555	41
2845	Brazil	Cruz Machado	PR	4106803	41
2846	Brazil	Cruzeiro do Iguaçu	PR	4106571	41
2847	Brazil	Cruzeiro do Oeste	PR	4106605	41
2848	Brazil	Cruzeiro do Sul	PR	4106704	41
2849	Brazil	Cruzmaltina	PR	4106852	41
2850	Brazil	Curitiba	PR	4106902	41
2851	Brazil	Curiúva	PR	4107009	41
2852	Brazil	Diamante do Norte	PR	4107108	41
2853	Brazil	Diamante do Sul	PR	4107124	41
2854	Brazil	Diamante D'Oeste	PR	4107157	41
2855	Brazil	Dois Vizinhos	PR	4107207	41
2856	Brazil	Douradina	PR	4107256	41
2857	Brazil	Doutor Camargo	PR	4107306	41
2858	Brazil	Doutor Ulysses	PR	4128633	41
2859	Brazil	Enéas Marques	PR	4107405	41
2860	Brazil	Engenheiro Beltrão	PR	4107504	41
2861	Brazil	Entre Rios do Oeste	PR	4107538	41
2862	Brazil	Esperança Nova	PR	4107520	41
2863	Brazil	Espigão Alto do Iguaçu	PR	4107546	41
2864	Brazil	Farol	PR	4107553	41
2865	Brazil	Faxinal	PR	4107603	41
2866	Brazil	Fazenda Rio Grande	PR	4107652	41
2867	Brazil	Fênix	PR	4107702	41
2868	Brazil	Fernandes Pinheiro	PR	4107736	41
2869	Brazil	Figueira	PR	4107751	41
2870	Brazil	Flor da Serra do Sul	PR	4107850	41
2871	Brazil	Floraí	PR	4107801	41
2872	Brazil	Floresta	PR	4107900	41
2873	Brazil	Florestópolis	PR	4108007	41
2874	Brazil	Flórida	PR	4108106	41
2875	Brazil	Formosa do Oeste	PR	4108205	41
2876	Brazil	Foz do Iguaçu	PR	4108304	41
2877	Brazil	Foz do Jordão	PR	4108452	41
2878	Brazil	Francisco Alves	PR	4108320	41
2879	Brazil	Francisco Beltrão	PR	4108403	41
2880	Brazil	General Carneiro	PR	4108502	41
2881	Brazil	Godoy Moreira	PR	4108551	41
2882	Brazil	Goioerê	PR	4108601	41
2883	Brazil	Goioxim	PR	4108650	41
2884	Brazil	Grandes Rios	PR	4108700	41
2885	Brazil	Guaíra	PR	4108809	41
2886	Brazil	Guairaçá	PR	4108908	41
2887	Brazil	Guamiranga	PR	4108957	41
2888	Brazil	Guapirama	PR	4109005	41
2889	Brazil	Guaporema	PR	4109104	41
2890	Brazil	Guaraci	PR	4109203	41
2891	Brazil	Guaraniaçu	PR	4109302	41
2892	Brazil	Guarapuava	PR	4109401	41
2893	Brazil	Guaraqueçaba	PR	4109500	41
2894	Brazil	Guaratuba	PR	4109609	41
2895	Brazil	Honório Serpa	PR	4109658	41
2896	Brazil	Ibaiti	PR	4109708	41
2897	Brazil	Ibema	PR	4109757	41
2898	Brazil	Ibiporã	PR	4109807	41
2899	Brazil	Icaraíma	PR	4109906	41
2900	Brazil	Iguaraçu	PR	4110003	41
2901	Brazil	Iguatu	PR	4110052	41
2902	Brazil	Imbaú	PR	4110078	41
2903	Brazil	Imbituva	PR	4110102	41
2904	Brazil	Inácio Martins	PR	4110201	41
2905	Brazil	Inajá	PR	4110300	41
2906	Brazil	Indianópolis	PR	4110409	41
2907	Brazil	Ipiranga	PR	4110508	41
2908	Brazil	Iporã	PR	4110607	41
2909	Brazil	Iracema do Oeste	PR	4110656	41
2910	Brazil	Irati	PR	4110706	41
2911	Brazil	Iretama	PR	4110805	41
2912	Brazil	Itaguajé	PR	4110904	41
2913	Brazil	Itaipulândia	PR	4110953	41
2914	Brazil	Itambaracá	PR	4111001	41
2915	Brazil	Itambé	PR	4111100	41
2916	Brazil	Itapejara d'Oeste	PR	4111209	41
2917	Brazil	Itaperuçu	PR	4111258	41
2918	Brazil	Itaúna do Sul	PR	4111308	41
2919	Brazil	Ivaí	PR	4111407	41
2920	Brazil	Ivaiporã	PR	4111506	41
2921	Brazil	Ivaté	PR	4111555	41
2922	Brazil	Ivatuba	PR	4111605	41
2923	Brazil	Jaboti	PR	4111704	41
2924	Brazil	Jacarezinho	PR	4111803	41
2925	Brazil	Jaguapitã	PR	4111902	41
2926	Brazil	Jaguariaíva	PR	4112009	41
2927	Brazil	Jandaia do Sul	PR	4112108	41
2928	Brazil	Janiópolis	PR	4112207	41
2929	Brazil	Japira	PR	4112306	41
2930	Brazil	Japurá	PR	4112405	41
2931	Brazil	Jardim Alegre	PR	4112504	41
2932	Brazil	Jardim Olinda	PR	4112603	41
2933	Brazil	Jataizinho	PR	4112702	41
2934	Brazil	Jesuítas	PR	4112751	41
2935	Brazil	Joaquim Távora	PR	4112801	41
2936	Brazil	Jundiaí do Sul	PR	4112900	41
2937	Brazil	Juranda	PR	4112959	41
2938	Brazil	Jussara	PR	4113007	41
2939	Brazil	Kaloré	PR	4113106	41
2940	Brazil	Lapa	PR	4113205	41
2941	Brazil	Laranjal	PR	4113254	41
2942	Brazil	Laranjeiras do Sul	PR	4113304	41
2943	Brazil	Leópolis	PR	4113403	41
2944	Brazil	Lidianópolis	PR	4113429	41
2945	Brazil	Lindoeste	PR	4113452	41
2946	Brazil	Loanda	PR	4113502	41
2947	Brazil	Lobato	PR	4113601	41
2948	Brazil	Londrina	PR	4113700	41
2949	Brazil	Luiziana	PR	4113734	41
2950	Brazil	Lunardelli	PR	4113759	41
2951	Brazil	Lupionópolis	PR	4113809	41
2952	Brazil	Mallet	PR	4113908	41
2953	Brazil	Mamborê	PR	4114005	41
2954	Brazil	Mandaguaçu	PR	4114104	41
2955	Brazil	Mandaguari	PR	4114203	41
2956	Brazil	Mandirituba	PR	4114302	41
2957	Brazil	Manfrinópolis	PR	4114351	41
2958	Brazil	Mangueirinha	PR	4114401	41
2959	Brazil	Manoel Ribas	PR	4114500	41
2960	Brazil	Marechal Cândido Rondon	PR	4114609	41
2961	Brazil	Maria Helena	PR	4114708	41
2962	Brazil	Marialva	PR	4114807	41
2963	Brazil	Marilândia do Sul	PR	4114906	41
2964	Brazil	Marilena	PR	4115002	41
2965	Brazil	Mariluz	PR	4115101	41
2966	Brazil	Maringá	PR	4115200	41
2967	Brazil	Mariópolis	PR	4115309	41
2968	Brazil	Maripá	PR	4115358	41
2969	Brazil	Marmeleiro	PR	4115408	41
2970	Brazil	Marquinho	PR	4115457	41
2971	Brazil	Marumbi	PR	4115507	41
2972	Brazil	Matelândia	PR	4115606	41
2973	Brazil	Matinhos	PR	4115705	41
2974	Brazil	Mato Rico	PR	4115739	41
2975	Brazil	Mauá da Serra	PR	4115754	41
2976	Brazil	Medianeira	PR	4115804	41
2977	Brazil	Mercedes	PR	4115853	41
2978	Brazil	Mirador	PR	4115903	41
2979	Brazil	Miraselva	PR	4116000	41
2980	Brazil	Missal	PR	4116059	41
2981	Brazil	Moreira Sales	PR	4116109	41
2982	Brazil	Morretes	PR	4116208	41
2983	Brazil	Munhoz de Melo	PR	4116307	41
2984	Brazil	Nossa Senhora das Graças	PR	4116406	41
2985	Brazil	Nova Aliança do Ivaí	PR	4116505	41
2986	Brazil	Nova América da Colina	PR	4116604	41
2987	Brazil	Nova Aurora	PR	4116703	41
2988	Brazil	Nova Cantu	PR	4116802	41
2989	Brazil	Nova Esperança	PR	4116901	41
2990	Brazil	Nova Esperança do Sudoeste	PR	4116950	41
2991	Brazil	Nova Fátima	PR	4117008	41
2992	Brazil	Nova Laranjeiras	PR	4117057	41
2993	Brazil	Nova Londrina	PR	4117107	41
2994	Brazil	Nova Olímpia	PR	4117206	41
2995	Brazil	Nova Prata do Iguaçu	PR	4117255	41
2996	Brazil	Nova Santa Bárbara	PR	4117214	41
2997	Brazil	Nova Santa Rosa	PR	4117222	41
2998	Brazil	Nova Tebas	PR	4117271	41
2999	Brazil	Novo Itacolomi	PR	4117297	41
3000	Brazil	Ortigueira	PR	4117305	41
3001	Brazil	Ourizona	PR	4117404	41
3002	Brazil	Ouro Verde do Oeste	PR	4117453	41
3003	Brazil	Paiçandu	PR	4117503	41
3004	Brazil	Palmas	PR	4117602	41
3005	Brazil	Palmeira	PR	4117701	41
3006	Brazil	Palmital	PR	4117800	41
3007	Brazil	Palotina	PR	4117909	41
3008	Brazil	Paraíso do Norte	PR	4118006	41
3009	Brazil	Paranacity	PR	4118105	41
3010	Brazil	Paranaguá	PR	4118204	41
3011	Brazil	Paranapoema	PR	4118303	41
3012	Brazil	Paranavaí	PR	4118402	41
3013	Brazil	Pato Bragado	PR	4118451	41
3014	Brazil	Pato Branco	PR	4118501	41
3015	Brazil	Paula Freitas	PR	4118600	41
3016	Brazil	Paulo Frontin	PR	4118709	41
3017	Brazil	Peabiru	PR	4118808	41
3018	Brazil	Perobal	PR	4118857	41
3019	Brazil	Pérola	PR	4118907	41
3020	Brazil	Pérola d'Oeste	PR	4119004	41
3021	Brazil	Piên	PR	4119103	41
3022	Brazil	Pinhais	PR	4119152	41
3023	Brazil	Pinhal de São Bento	PR	4119251	41
3024	Brazil	Pinhalão	PR	4119202	41
3025	Brazil	Pinhão	PR	4119301	41
3026	Brazil	Piraí do Sul	PR	4119400	41
3027	Brazil	Piraquara	PR	4119509	41
3028	Brazil	Pitanga	PR	4119608	41
3029	Brazil	Pitangueiras	PR	4119657	41
3030	Brazil	Planaltina do Paraná	PR	4119707	41
3031	Brazil	Planalto	PR	4119806	41
3032	Brazil	Ponta Grossa	PR	4119905	41
3033	Brazil	Pontal do Paraná	PR	4119954	41
3034	Brazil	Porecatu	PR	4120002	41
3035	Brazil	Porto Amazonas	PR	4120101	41
3036	Brazil	Porto Barreiro	PR	4120150	41
3037	Brazil	Porto Rico	PR	4120200	41
3038	Brazil	Porto Vitória	PR	4120309	41
3039	Brazil	Prado Ferreira	PR	4120333	41
3040	Brazil	Pranchita	PR	4120358	41
3041	Brazil	Presidente Castelo Branco	PR	4120408	41
3042	Brazil	Primeiro de Maio	PR	4120507	41
3043	Brazil	Prudentópolis	PR	4120606	41
3044	Brazil	Quarto Centenário	PR	4120655	41
3045	Brazil	Quatiguá	PR	4120705	41
3046	Brazil	Quatro Barras	PR	4120804	41
3047	Brazil	Quatro Pontes	PR	4120853	41
3048	Brazil	Quedas do Iguaçu	PR	4120903	41
3049	Brazil	Querência do Norte	PR	4121000	41
3050	Brazil	Quinta do Sol	PR	4121109	41
3051	Brazil	Quitandinha	PR	4121208	41
3052	Brazil	Ramilândia	PR	4121257	41
3053	Brazil	Rancho Alegre	PR	4121307	41
3054	Brazil	Rancho Alegre D'Oeste	PR	4121356	41
3055	Brazil	Realeza	PR	4121406	41
3056	Brazil	Rebouças	PR	4121505	41
3057	Brazil	Renascença	PR	4121604	41
3058	Brazil	Reserva	PR	4121703	41
3059	Brazil	Reserva do Iguaçu	PR	4121752	41
3060	Brazil	Ribeirão Claro	PR	4121802	41
3061	Brazil	Ribeirão do Pinhal	PR	4121901	41
3062	Brazil	Rio Azul	PR	4122008	41
3063	Brazil	Rio Bom	PR	4122107	41
3064	Brazil	Rio Bonito do Iguaçu	PR	4122156	41
3065	Brazil	Rio Branco do Ivaí	PR	4122172	41
3066	Brazil	Rio Branco do Sul	PR	4122206	41
3067	Brazil	Rio Negro	PR	4122305	41
3068	Brazil	Rolândia	PR	4122404	41
3069	Brazil	Roncador	PR	4122503	41
3070	Brazil	Rondon	PR	4122602	41
3071	Brazil	Rosário do Ivaí	PR	4122651	41
3072	Brazil	Sabáudia	PR	4122701	41
3073	Brazil	Salgado Filho	PR	4122800	41
3074	Brazil	Salto do Itararé	PR	4122909	41
3075	Brazil	Salto do Lontra	PR	4123006	41
3076	Brazil	Santa Amélia	PR	4123105	41
3077	Brazil	Santa Cecília do Pavão	PR	4123204	41
3078	Brazil	Santa Cruz de Monte Castelo	PR	4123303	41
3079	Brazil	Santa Fé	PR	4123402	41
3080	Brazil	Santa Helena	PR	4123501	41
3081	Brazil	Santa Inês	PR	4123600	41
3082	Brazil	Santa Isabel do Ivaí	PR	4123709	41
3083	Brazil	Santa Izabel do Oeste	PR	4123808	41
3084	Brazil	Santa Lúcia	PR	4123824	41
3085	Brazil	Santa Maria do Oeste	PR	4123857	41
3086	Brazil	Santa Mariana	PR	4123907	41
3087	Brazil	Santa Mônica	PR	4123956	41
3088	Brazil	Santa Tereza do Oeste	PR	4124020	41
3089	Brazil	Santa Terezinha de Itaipu	PR	4124053	41
3090	Brazil	Santana do Itararé	PR	4124004	41
3204	Brazil	Bonito	BA	2904050	29
3091	Brazil	Santo Antônio da Platina	PR	4124103	41
3092	Brazil	Santo Antônio do Caiuá	PR	4124202	41
3093	Brazil	Santo Antônio do Paraíso	PR	4124301	41
3094	Brazil	Santo Antônio do Sudoeste	PR	4124400	41
3095	Brazil	Santo Inácio	PR	4124509	41
3096	Brazil	São Carlos do Ivaí	PR	4124608	41
3097	Brazil	São Jerônimo da Serra	PR	4124707	41
3098	Brazil	São João	PR	4124806	41
3099	Brazil	São João do Caiuá	PR	4124905	41
3100	Brazil	São João do Ivaí	PR	4125001	41
3101	Brazil	São João do Triunfo	PR	4125100	41
3102	Brazil	São Jorge do Ivaí	PR	4125308	41
3103	Brazil	São Jorge do Patrocínio	PR	4125357	41
3104	Brazil	São Jorge d'Oeste	PR	4125209	41
3105	Brazil	São José da Boa Vista	PR	4125407	41
3106	Brazil	São José das Palmeiras	PR	4125456	41
3107	Brazil	São José dos Pinhais	PR	4125506	41
3108	Brazil	São Manoel do Paraná	PR	4125555	41
3109	Brazil	São Mateus do Sul	PR	4125605	41
3110	Brazil	São Miguel do Iguaçu	PR	4125704	41
3111	Brazil	São Pedro do Iguaçu	PR	4125753	41
3112	Brazil	São Pedro do Ivaí	PR	4125803	41
3113	Brazil	São Pedro do Paraná	PR	4125902	41
3114	Brazil	São Sebastião da Amoreira	PR	4126009	41
3115	Brazil	São Tomé	PR	4126108	41
3116	Brazil	Sapopema	PR	4126207	41
3117	Brazil	Sarandi	PR	4126256	41
3118	Brazil	Saudade do Iguaçu	PR	4126272	41
3119	Brazil	Sengés	PR	4126306	41
3120	Brazil	Serranópolis do Iguaçu	PR	4126355	41
3121	Brazil	Sertaneja	PR	4126405	41
3122	Brazil	Sertanópolis	PR	4126504	41
3123	Brazil	Siqueira Campos	PR	4126603	41
3124	Brazil	Sulina	PR	4126652	41
3125	Brazil	Tamarana	PR	4126678	41
3126	Brazil	Tamboara	PR	4126702	41
3127	Brazil	Tapejara	PR	4126801	41
3128	Brazil	Tapira	PR	4126900	41
3129	Brazil	Teixeira Soares	PR	4127007	41
3130	Brazil	Telêmaco Borba	PR	4127106	41
3131	Brazil	Terra Boa	PR	4127205	41
3132	Brazil	Terra Rica	PR	4127304	41
3133	Brazil	Terra Roxa	PR	4127403	41
3134	Brazil	Tibagi	PR	4127502	41
3135	Brazil	Tijucas do Sul	PR	4127601	41
3136	Brazil	Toledo	PR	4127700	41
3137	Brazil	Tomazina	PR	4127809	41
3138	Brazil	Três Barras do Paraná	PR	4127858	41
3139	Brazil	Tunas do Paraná	PR	4127882	41
3140	Brazil	Tuneiras do Oeste	PR	4127908	41
3141	Brazil	Tupãssi	PR	4127957	41
3142	Brazil	Turvo	PR	4127965	41
3143	Brazil	Ubiratã	PR	4128005	41
3144	Brazil	Umuarama	PR	4128104	41
3145	Brazil	União da Vitória	PR	4128203	41
3146	Brazil	Uniflor	PR	4128302	41
3147	Brazil	Uraí	PR	4128401	41
3148	Brazil	Ventania	PR	4128534	41
3149	Brazil	Vera Cruz do Oeste	PR	4128559	41
3150	Brazil	Verê	PR	4128609	41
3151	Brazil	Virmond	PR	4128658	41
3152	Brazil	Vitorino	PR	4128708	41
3153	Brazil	Wenceslau Braz	PR	4128500	41
3154	Brazil	Xambrê	PR	4128807	41
3155	Brazil	Abaíra	BA	2900108	29
3156	Brazil	Abaré	BA	2900207	29
3157	Brazil	Acajutiba	BA	2900306	29
3158	Brazil	Adustina	BA	2900355	29
3159	Brazil	Água Fria	BA	2900405	29
3160	Brazil	Aiquara	BA	2900603	29
3161	Brazil	Alagoinhas	BA	2900702	29
3162	Brazil	Alcobaça	BA	2900801	29
3163	Brazil	Almadina	BA	2900900	29
3164	Brazil	Amargosa	BA	2901007	29
3165	Brazil	Amélia Rodrigues	BA	2901106	29
3166	Brazil	América Dourada	BA	2901155	29
3167	Brazil	Anagé	BA	2901205	29
3168	Brazil	Andaraí	BA	2901304	29
3169	Brazil	Andorinha	BA	2901353	29
3170	Brazil	Angical	BA	2901403	29
3171	Brazil	Anguera	BA	2901502	29
3172	Brazil	Antas	BA	2901601	29
3173	Brazil	Antônio Cardoso	BA	2901700	29
3174	Brazil	Antônio Gonçalves	BA	2901809	29
3175	Brazil	Aporá	BA	2901908	29
3176	Brazil	Apuarema	BA	2901957	29
3177	Brazil	Araças	BA	2902054	29
3178	Brazil	Aracatu	BA	2902005	29
3179	Brazil	Araci	BA	2902104	29
3180	Brazil	Aramari	BA	2902203	29
3181	Brazil	Arataca	BA	2902252	29
3182	Brazil	Aratuípe	BA	2902302	29
3183	Brazil	Aurelino Leal	BA	2902401	29
3184	Brazil	Baianópolis	BA	2902500	29
3185	Brazil	Baixa Grande	BA	2902609	29
3186	Brazil	Banzaê	BA	2902658	29
3187	Brazil	Barra	BA	2902708	29
3188	Brazil	Barra da Estiva	BA	2902807	29
3189	Brazil	Barra do Choça	BA	2902906	29
3190	Brazil	Barra do Mendes	BA	2903003	29
3191	Brazil	Barra do Rocha	BA	2903102	29
3192	Brazil	Barreiras	BA	2903201	29
3193	Brazil	Barro Alto	BA	2903235	29
3194	Brazil	Barro Preto	BA	2903300	29
3195	Brazil	Barrocas	BA	2903276	29
3196	Brazil	Belmonte	BA	2903409	29
3197	Brazil	Belo Campo	BA	2903508	29
3198	Brazil	Biritinga	BA	2903607	29
3199	Brazil	Boa Nova	BA	2903706	29
3200	Brazil	Boa Vista do Tupim	BA	2903805	29
3201	Brazil	Bom Jesus da Lapa	BA	2903904	29
3202	Brazil	Bom Jesus da Serra	BA	2903953	29
3203	Brazil	Boninal	BA	2904001	29
3205	Brazil	Boquira	BA	2904100	29
3206	Brazil	Botuporã	BA	2904209	29
3207	Brazil	Brejões	BA	2904308	29
3208	Brazil	Brejolândia	BA	2904407	29
3209	Brazil	Brotas de Macaúbas	BA	2904506	29
3210	Brazil	Brumado	BA	2904605	29
3211	Brazil	Buerarema	BA	2904704	29
3212	Brazil	Buritirama	BA	2904753	29
3213	Brazil	Caatiba	BA	2904803	29
3214	Brazil	Cabaceiras do Paraguaçu	BA	2904852	29
3215	Brazil	Cachoeira	BA	2904902	29
3216	Brazil	Caculé	BA	2905008	29
3217	Brazil	Caém	BA	2905107	29
3218	Brazil	Caetanos	BA	2905156	29
3219	Brazil	Caetité	BA	2905206	29
3220	Brazil	Cafarnaum	BA	2905305	29
3221	Brazil	Cairu	BA	2905404	29
3222	Brazil	Caldeirão Grande	BA	2905503	29
3223	Brazil	Camacan	BA	2905602	29
3224	Brazil	Camaçari	BA	2905701	29
3225	Brazil	Camamu	BA	2905800	29
3226	Brazil	Campo Alegre de Lourdes	BA	2905909	29
3227	Brazil	Campo Formoso	BA	2906006	29
3228	Brazil	Canápolis	BA	2906105	29
3229	Brazil	Canarana	BA	2906204	29
3230	Brazil	Canavieiras	BA	2906303	29
3231	Brazil	Candeal	BA	2906402	29
3232	Brazil	Candeias	BA	2906501	29
3233	Brazil	Candiba	BA	2906600	29
3234	Brazil	Cândido Sales	BA	2906709	29
3235	Brazil	Cansanção	BA	2906808	29
3236	Brazil	Canudos	BA	2906824	29
3237	Brazil	Capela do Alto Alegre	BA	2906857	29
3238	Brazil	Capim Grosso	BA	2906873	29
3239	Brazil	Caraíbas	BA	2906899	29
3240	Brazil	Caravelas	BA	2906907	29
3241	Brazil	Cardeal da Silva	BA	2907004	29
3242	Brazil	Carinhanha	BA	2907103	29
3243	Brazil	Casa Nova	BA	2907202	29
3244	Brazil	Castro Alves	BA	2907301	29
3245	Brazil	Catolândia	BA	2907400	29
3246	Brazil	Catu	BA	2907509	29
3247	Brazil	Caturama	BA	2907558	29
3248	Brazil	Central	BA	2907608	29
3249	Brazil	Chorrochó	BA	2907707	29
3250	Brazil	Cícero Dantas	BA	2907806	29
3251	Brazil	Cipó	BA	2907905	29
3252	Brazil	Coaraci	BA	2908002	29
3253	Brazil	Cocos	BA	2908101	29
3254	Brazil	Conceição da Feira	BA	2908200	29
3255	Brazil	Conceição do Almeida	BA	2908309	29
3256	Brazil	Conceição do Coité	BA	2908408	29
3257	Brazil	Conceição do Jacuípe	BA	2908507	29
3258	Brazil	Conde	BA	2908606	29
3259	Brazil	Condeúba	BA	2908705	29
3260	Brazil	Contendas do Sincorá	BA	2908804	29
3261	Brazil	Coração de Maria	BA	2908903	29
3262	Brazil	Cordeiros	BA	2909000	29
3263	Brazil	Coribe	BA	2909109	29
3264	Brazil	Coronel João Sá	BA	2909208	29
3265	Brazil	Correntina	BA	2909307	29
3266	Brazil	Cotegipe	BA	2909406	29
3267	Brazil	Cravolândia	BA	2909505	29
3268	Brazil	Crisópolis	BA	2909604	29
3269	Brazil	Cristópolis	BA	2909703	29
3270	Brazil	Cruz das Almas	BA	2909802	29
3271	Brazil	Curaçá	BA	2909901	29
3272	Brazil	Dário Meira	BA	2910008	29
3273	Brazil	Dias d'Ávila	BA	2910057	29
3274	Brazil	Dom Basílio	BA	2910107	29
3275	Brazil	Dom Macedo Costa	BA	2910206	29
3276	Brazil	Elísio Medrado	BA	2910305	29
3277	Brazil	Encruzilhada	BA	2910404	29
3278	Brazil	Entre Rios	BA	2910503	29
3279	Brazil	Érico Cardoso	BA	2900504	29
3280	Brazil	Esplanada	BA	2910602	29
3281	Brazil	Euclides da Cunha	BA	2910701	29
3282	Brazil	Eunápolis	BA	2910727	29
3283	Brazil	Fátima	BA	2910750	29
3284	Brazil	Feira da Mata	BA	2910776	29
3285	Brazil	Feira de Santana	BA	2910800	29
3286	Brazil	Filadélfia	BA	2910859	29
3287	Brazil	Firmino Alves	BA	2910909	29
3288	Brazil	Floresta Azul	BA	2911006	29
3289	Brazil	Formosa do Rio Preto	BA	2911105	29
3290	Brazil	Gandu	BA	2911204	29
3291	Brazil	Gavião	BA	2911253	29
3292	Brazil	Gentio do Ouro	BA	2911303	29
3293	Brazil	Glória	BA	2911402	29
3294	Brazil	Gongogi	BA	2911501	29
3295	Brazil	Governador Mangabeira	BA	2911600	29
3296	Brazil	Guajeru	BA	2911659	29
3297	Brazil	Guanambi	BA	2911709	29
3298	Brazil	Guaratinga	BA	2911808	29
3299	Brazil	Heliópolis	BA	2911857	29
3300	Brazil	Iaçu	BA	2911907	29
3301	Brazil	Ibiassucê	BA	2912004	29
3302	Brazil	Ibicaraí	BA	2912103	29
3303	Brazil	Ibicoara	BA	2912202	29
3304	Brazil	Ibicuí	BA	2912301	29
3305	Brazil	Ibipeba	BA	2912400	29
3306	Brazil	Ibipitanga	BA	2912509	29
3307	Brazil	Ibiquera	BA	2912608	29
3308	Brazil	Ibirapitanga	BA	2912707	29
3309	Brazil	Ibirapuã	BA	2912806	29
3310	Brazil	Ibirataia	BA	2912905	29
3311	Brazil	Ibitiara	BA	2913002	29
3312	Brazil	Ibititá	BA	2913101	29
3313	Brazil	Ibotirama	BA	2913200	29
3314	Brazil	Ichu	BA	2913309	29
3315	Brazil	Igaporã	BA	2913408	29
3316	Brazil	Igrapiúna	BA	2913457	29
3317	Brazil	Iguaí	BA	2913507	29
3318	Brazil	Ilhéus	BA	2913606	29
3319	Brazil	Inhambupe	BA	2913705	29
3320	Brazil	Ipecaetá	BA	2913804	29
3321	Brazil	Ipiaú	BA	2913903	29
3322	Brazil	Ipirá	BA	2914000	29
3323	Brazil	Ipupiara	BA	2914109	29
3324	Brazil	Irajuba	BA	2914208	29
3325	Brazil	Iramaia	BA	2914307	29
3326	Brazil	Iraquara	BA	2914406	29
3327	Brazil	Irará	BA	2914505	29
3328	Brazil	Irecê	BA	2914604	29
3329	Brazil	Itabela	BA	2914653	29
3330	Brazil	Itaberaba	BA	2914703	29
3331	Brazil	Itabuna	BA	2914802	29
3332	Brazil	Itacaré	BA	2914901	29
3333	Brazil	Itaeté	BA	2915007	29
3334	Brazil	Itagi	BA	2915106	29
3335	Brazil	Itagibá	BA	2915205	29
3336	Brazil	Itagimirim	BA	2915304	29
3337	Brazil	Itaguaçu da Bahia	BA	2915353	29
3338	Brazil	Itaju do Colônia	BA	2915403	29
3339	Brazil	Itajuípe	BA	2915502	29
3340	Brazil	Itamaraju	BA	2915601	29
3341	Brazil	Itamari	BA	2915700	29
3342	Brazil	Itambé	BA	2915809	29
3343	Brazil	Itanagra	BA	2915908	29
3344	Brazil	Itanhém	BA	2916005	29
3345	Brazil	Itaparica	BA	2916104	29
3346	Brazil	Itapé	BA	2916203	29
3347	Brazil	Itapebi	BA	2916302	29
3348	Brazil	Itapetinga	BA	2916401	29
3349	Brazil	Itapicuru	BA	2916500	29
3350	Brazil	Itapitanga	BA	2916609	29
3351	Brazil	Itaquara	BA	2916708	29
3352	Brazil	Itarantim	BA	2916807	29
3353	Brazil	Itatim	BA	2916856	29
3354	Brazil	Itiruçu	BA	2916906	29
3355	Brazil	Itiúba	BA	2917003	29
3356	Brazil	Itororó	BA	2917102	29
3357	Brazil	Ituaçu	BA	2917201	29
3358	Brazil	Ituberá	BA	2917300	29
3359	Brazil	Iuiú	BA	2917334	29
3360	Brazil	Jaborandi	BA	2917359	29
3361	Brazil	Jacaraci	BA	2917409	29
3362	Brazil	Jacobina	BA	2917508	29
3363	Brazil	Jaguaquara	BA	2917607	29
3364	Brazil	Jaguarari	BA	2917706	29
3365	Brazil	Jaguaripe	BA	2917805	29
3366	Brazil	Jandaíra	BA	2917904	29
3367	Brazil	Jequié	BA	2918001	29
3368	Brazil	Jeremoabo	BA	2918100	29
3369	Brazil	Jiquiriçá	BA	2918209	29
3370	Brazil	Jitaúna	BA	2918308	29
3371	Brazil	João Dourado	BA	2918357	29
3372	Brazil	Juazeiro	BA	2918407	29
3373	Brazil	Jucuruçu	BA	2918456	29
3374	Brazil	Jussara	BA	2918506	29
3375	Brazil	Jussari	BA	2918555	29
3376	Brazil	Jussiape	BA	2918605	29
3377	Brazil	Lafaiete Coutinho	BA	2918704	29
3378	Brazil	Lagoa Real	BA	2918753	29
3379	Brazil	Laje	BA	2918803	29
3380	Brazil	Lajedão	BA	2918902	29
3381	Brazil	Lajedinho	BA	2919009	29
3382	Brazil	Lajedo do Tabocal	BA	2919058	29
3383	Brazil	Lamarão	BA	2919108	29
3384	Brazil	Lapão	BA	2919157	29
3385	Brazil	Lauro de Freitas	BA	2919207	29
3386	Brazil	Lençóis	BA	2919306	29
3387	Brazil	Licínio de Almeida	BA	2919405	29
3388	Brazil	Livramento de Nossa Senhora	BA	2919504	29
3389	Brazil	Luís Eduardo Magalhães	BA	2919553	29
3390	Brazil	Macajuba	BA	2919603	29
3391	Brazil	Macarani	BA	2919702	29
3392	Brazil	Macaúbas	BA	2919801	29
3393	Brazil	Macururé	BA	2919900	29
3394	Brazil	Madre de Deus	BA	2919926	29
3395	Brazil	Maetinga	BA	2919959	29
3396	Brazil	Maiquinique	BA	2920007	29
3397	Brazil	Mairi	BA	2920106	29
3398	Brazil	Malhada	BA	2920205	29
3399	Brazil	Malhada de Pedras	BA	2920304	29
3400	Brazil	Manoel Vitorino	BA	2920403	29
3401	Brazil	Mansidão	BA	2920452	29
3402	Brazil	Maracás	BA	2920502	29
3403	Brazil	Maragogipe	BA	2920601	29
3404	Brazil	Maraú	BA	2920700	29
3405	Brazil	Marcionílio Souza	BA	2920809	29
3406	Brazil	Mascote	BA	2920908	29
3407	Brazil	Mata de São João	BA	2921005	29
3408	Brazil	Matina	BA	2921054	29
3409	Brazil	Medeiros Neto	BA	2921104	29
3410	Brazil	Miguel Calmon	BA	2921203	29
3411	Brazil	Milagres	BA	2921302	29
3412	Brazil	Mirangaba	BA	2921401	29
3413	Brazil	Mirante	BA	2921450	29
3414	Brazil	Monte Santo	BA	2921500	29
3415	Brazil	Morpará	BA	2921609	29
3416	Brazil	Morro do Chapéu	BA	2921708	29
3417	Brazil	Mortugaba	BA	2921807	29
3418	Brazil	Mucugê	BA	2921906	29
3419	Brazil	Mucuri	BA	2922003	29
3420	Brazil	Mulungu do Morro	BA	2922052	29
3421	Brazil	Mundo Novo	BA	2922102	29
3422	Brazil	Muniz Ferreira	BA	2922201	29
3423	Brazil	Muquém de São Francisco	BA	2922250	29
3424	Brazil	Muritiba	BA	2922300	29
3425	Brazil	Mutuípe	BA	2922409	29
3426	Brazil	Nazaré	BA	2922508	29
3427	Brazil	Nilo Peçanha	BA	2922607	29
3428	Brazil	Nordestina	BA	2922656	29
3429	Brazil	Nova Canaã	BA	2922706	29
3430	Brazil	Nova Fátima	BA	2922730	29
3431	Brazil	Nova Ibiá	BA	2922755	29
3432	Brazil	Nova Itarana	BA	2922805	29
3433	Brazil	Nova Redenção	BA	2922854	29
3434	Brazil	Nova Soure	BA	2922904	29
3435	Brazil	Nova Viçosa	BA	2923001	29
3436	Brazil	Novo Horizonte	BA	2923035	29
3437	Brazil	Novo Triunfo	BA	2923050	29
3438	Brazil	Olindina	BA	2923100	29
3553	Brazil	Uibaí	BA	2932408	29
3439	Brazil	Oliveira dos Brejinhos	BA	2923209	29
3440	Brazil	Ouriçangas	BA	2923308	29
3441	Brazil	Ourolândia	BA	2923357	29
3442	Brazil	Palmas de Monte Alto	BA	2923407	29
3443	Brazil	Palmeiras	BA	2923506	29
3444	Brazil	Paramirim	BA	2923605	29
3445	Brazil	Paratinga	BA	2923704	29
3446	Brazil	Paripiranga	BA	2923803	29
3447	Brazil	Pau Brasil	BA	2923902	29
3448	Brazil	Paulo Afonso	BA	2924009	29
3449	Brazil	Pé de Serra	BA	2924058	29
3450	Brazil	Pedrão	BA	2924108	29
3451	Brazil	Pedro Alexandre	BA	2924207	29
3452	Brazil	Piatã	BA	2924306	29
3453	Brazil	Pilão Arcado	BA	2924405	29
3454	Brazil	Pindaí	BA	2924504	29
3455	Brazil	Pindobaçu	BA	2924603	29
3456	Brazil	Pintadas	BA	2924652	29
3457	Brazil	Piraí do Norte	BA	2924678	29
3458	Brazil	Piripá	BA	2924702	29
3459	Brazil	Piritiba	BA	2924801	29
3460	Brazil	Planaltino	BA	2924900	29
3461	Brazil	Planalto	BA	2925006	29
3462	Brazil	Poções	BA	2925105	29
3463	Brazil	Pojuca	BA	2925204	29
3464	Brazil	Ponto Novo	BA	2925253	29
3465	Brazil	Porto Seguro	BA	2925303	29
3466	Brazil	Potiraguá	BA	2925402	29
3467	Brazil	Prado	BA	2925501	29
3468	Brazil	Presidente Dutra	BA	2925600	29
3469	Brazil	Presidente Jânio Quadros	BA	2925709	29
3470	Brazil	Presidente Tancredo Neves	BA	2925758	29
3471	Brazil	Queimadas	BA	2925808	29
3472	Brazil	Quijingue	BA	2925907	29
3473	Brazil	Quixabeira	BA	2925931	29
3474	Brazil	Rafael Jambeiro	BA	2925956	29
3475	Brazil	Remanso	BA	2926004	29
3476	Brazil	Retirolândia	BA	2926103	29
3477	Brazil	Riachão das Neves	BA	2926202	29
3478	Brazil	Riachão do Jacuípe	BA	2926301	29
3479	Brazil	Riacho de Santana	BA	2926400	29
3480	Brazil	Ribeira do Amparo	BA	2926509	29
3481	Brazil	Ribeira do Pombal	BA	2926608	29
3482	Brazil	Ribeirão do Largo	BA	2926657	29
3483	Brazil	Rio de Contas	BA	2926707	29
3484	Brazil	Rio do Antônio	BA	2926806	29
3485	Brazil	Rio do Pires	BA	2926905	29
3486	Brazil	Rio Real	BA	2927002	29
3487	Brazil	Rodelas	BA	2927101	29
3488	Brazil	Ruy Barbosa	BA	2927200	29
3489	Brazil	Salinas da Margarida	BA	2927309	29
3490	Brazil	Salvador	BA	2927408	29
3491	Brazil	Santa Bárbara	BA	2927507	29
3492	Brazil	Santa Brígida	BA	2927606	29
3493	Brazil	Santa Cruz Cabrália	BA	2927705	29
3494	Brazil	Santa Cruz da Vitória	BA	2927804	29
3495	Brazil	Santa Inês	BA	2927903	29
3496	Brazil	Santa Luzia	BA	2928059	29
3497	Brazil	Santa Maria da Vitória	BA	2928109	29
3498	Brazil	Santa Rita de Cássia	BA	2928406	29
3499	Brazil	Santa Teresinha	BA	2928505	29
3500	Brazil	Santaluz	BA	2928000	29
3501	Brazil	Santana	BA	2928208	29
3502	Brazil	Santanópolis	BA	2928307	29
3503	Brazil	Santo Amaro	BA	2928604	29
3504	Brazil	Santo Antônio de Jesus	BA	2928703	29
3505	Brazil	Santo Estêvão	BA	2928802	29
3506	Brazil	São Desidério	BA	2928901	29
3507	Brazil	São Domingos	BA	2928950	29
3508	Brazil	São Felipe	BA	2929107	29
3509	Brazil	São Félix	BA	2929008	29
3510	Brazil	São Félix do Coribe	BA	2929057	29
3511	Brazil	São Francisco do Conde	BA	2929206	29
3512	Brazil	São Gabriel	BA	2929255	29
3513	Brazil	São Gonçalo dos Campos	BA	2929305	29
3514	Brazil	São José da Vitória	BA	2929354	29
3515	Brazil	São José do Jacuípe	BA	2929370	29
3516	Brazil	São Miguel das Matas	BA	2929404	29
3517	Brazil	São Sebastião do Passé	BA	2929503	29
3518	Brazil	Sapeaçu	BA	2929602	29
3519	Brazil	Sátiro Dias	BA	2929701	29
3520	Brazil	Saubara	BA	2929750	29
3521	Brazil	Saúde	BA	2929800	29
3522	Brazil	Seabra	BA	2929909	29
3523	Brazil	Sebastião Laranjeiras	BA	2930006	29
3524	Brazil	Senhor do Bonfim	BA	2930105	29
3525	Brazil	Sento Sé	BA	2930204	29
3526	Brazil	Serra do Ramalho	BA	2930154	29
3527	Brazil	Serra Dourada	BA	2930303	29
3528	Brazil	Serra Preta	BA	2930402	29
3529	Brazil	Serrinha	BA	2930501	29
3530	Brazil	Serrolândia	BA	2930600	29
3531	Brazil	Simões Filho	BA	2930709	29
3532	Brazil	Sítio do Mato	BA	2930758	29
3533	Brazil	Sítio do Quinto	BA	2930766	29
3534	Brazil	Sobradinho	BA	2930774	29
3535	Brazil	Souto Soares	BA	2930808	29
3536	Brazil	Tabocas do Brejo Velho	BA	2930907	29
3537	Brazil	Tanhaçu	BA	2931004	29
3538	Brazil	Tanque Novo	BA	2931053	29
3539	Brazil	Tanquinho	BA	2931103	29
3540	Brazil	Taperoá	BA	2931202	29
3541	Brazil	Tapiramutá	BA	2931301	29
3542	Brazil	Teixeira de Freitas	BA	2931350	29
3543	Brazil	Teodoro Sampaio	BA	2931400	29
3544	Brazil	Teofilândia	BA	2931509	29
3545	Brazil	Teolândia	BA	2931608	29
3546	Brazil	Terra Nova	BA	2931707	29
3547	Brazil	Tremedal	BA	2931806	29
3548	Brazil	Tucano	BA	2931905	29
3549	Brazil	Uauá	BA	2932002	29
3550	Brazil	Ubaíra	BA	2932101	29
3551	Brazil	Ubaitaba	BA	2932200	29
3552	Brazil	Ubatã	BA	2932309	29
3554	Brazil	Umburanas	BA	2932457	29
3555	Brazil	Una	BA	2932507	29
3556	Brazil	Urandi	BA	2932606	29
3557	Brazil	Uruçuca	BA	2932705	29
3558	Brazil	Utinga	BA	2932804	29
3559	Brazil	Valença	BA	2932903	29
3560	Brazil	Valente	BA	2933000	29
3561	Brazil	Várzea da Roça	BA	2933059	29
3562	Brazil	Várzea do Poço	BA	2933109	29
3563	Brazil	Várzea Nova	BA	2933158	29
3564	Brazil	Varzedo	BA	2933174	29
3565	Brazil	Vera Cruz	BA	2933208	29
3566	Brazil	Vereda	BA	2933257	29
3567	Brazil	Vitória da Conquista	BA	2933307	29
3568	Brazil	Wagner	BA	2933406	29
3569	Brazil	Wanderley	BA	2933455	29
3570	Brazil	Wenceslau Guimarães	BA	2933505	29
3571	Brazil	Xique-Xique	BA	2933604	29
3572	Brazil	Aceguá	RS	4300034	43
3573	Brazil	Água Santa	RS	4300059	43
3574	Brazil	Agudo	RS	4300109	43
3575	Brazil	Ajuricaba	RS	4300208	43
3576	Brazil	Alecrim	RS	4300307	43
3577	Brazil	Alegrete	RS	4300406	43
3578	Brazil	Alegria	RS	4300455	43
3579	Brazil	Almirante Tamandaré do Sul	RS	4300471	43
3580	Brazil	Alpestre	RS	4300505	43
3581	Brazil	Alto Alegre	RS	4300554	43
3582	Brazil	Alto Feliz	RS	4300570	43
3583	Brazil	Alvorada	RS	4300604	43
3584	Brazil	Amaral Ferrador	RS	4300638	43
3585	Brazil	Ametista do Sul	RS	4300646	43
3586	Brazil	André da Rocha	RS	4300661	43
3587	Brazil	Anta Gorda	RS	4300703	43
3588	Brazil	Antônio Prado	RS	4300802	43
3589	Brazil	Arambaré	RS	4300851	43
3590	Brazil	Araricá	RS	4300877	43
3591	Brazil	Aratiba	RS	4300901	43
3592	Brazil	Arroio do Meio	RS	4301008	43
3593	Brazil	Arroio do Padre	RS	4301073	43
3594	Brazil	Arroio do Sal	RS	4301057	43
3595	Brazil	Arroio do Tigre	RS	4301206	43
3596	Brazil	Arroio dos Ratos	RS	4301107	43
3597	Brazil	Arroio Grande	RS	4301305	43
3598	Brazil	Arvorezinha	RS	4301404	43
3599	Brazil	Augusto Pestana	RS	4301503	43
3600	Brazil	Áurea	RS	4301552	43
3601	Brazil	Bagé	RS	4301602	43
3602	Brazil	Balneário Pinhal	RS	4301636	43
3603	Brazil	Barão	RS	4301651	43
3604	Brazil	Barão de Cotegipe	RS	4301701	43
3605	Brazil	Barão do Triunfo	RS	4301750	43
3606	Brazil	Barra do Guarita	RS	4301859	43
3607	Brazil	Barra do Quaraí	RS	4301875	43
3608	Brazil	Barra do Ribeiro	RS	4301909	43
3609	Brazil	Barra do Rio Azul	RS	4301925	43
3610	Brazil	Barra Funda	RS	4301958	43
3611	Brazil	Barracão	RS	4301800	43
3612	Brazil	Barros Cassal	RS	4302006	43
3613	Brazil	Benjamin Constant do Sul	RS	4302055	43
3614	Brazil	Bento Gonçalves	RS	4302105	43
3615	Brazil	Boa Vista das Missões	RS	4302154	43
3616	Brazil	Boa Vista do Buricá	RS	4302204	43
3617	Brazil	Boa Vista do Cadeado	RS	4302220	43
3618	Brazil	Boa Vista do Incra	RS	4302238	43
3619	Brazil	Boa Vista do Sul	RS	4302253	43
3620	Brazil	Bom Jesus	RS	4302303	43
3621	Brazil	Bom Princípio	RS	4302352	43
3622	Brazil	Bom Progresso	RS	4302378	43
3623	Brazil	Bom Retiro do Sul	RS	4302402	43
3624	Brazil	Boqueirão do Leão	RS	4302451	43
3625	Brazil	Bossoroca	RS	4302501	43
3626	Brazil	Bozano	RS	4302584	43
3627	Brazil	Braga	RS	4302600	43
3628	Brazil	Brochier	RS	4302659	43
3629	Brazil	Butiá	RS	4302709	43
3630	Brazil	Caçapava do Sul	RS	4302808	43
3631	Brazil	Cacequi	RS	4302907	43
3632	Brazil	Cachoeira do Sul	RS	4303004	43
3633	Brazil	Cachoeirinha	RS	4303103	43
3634	Brazil	Cacique Doble	RS	4303202	43
3635	Brazil	Caibaté	RS	4303301	43
3636	Brazil	Caiçara	RS	4303400	43
3637	Brazil	Camaquã	RS	4303509	43
3638	Brazil	Camargo	RS	4303558	43
3639	Brazil	Cambará do Sul	RS	4303608	43
3640	Brazil	Campestre da Serra	RS	4303673	43
3641	Brazil	Campina das Missões	RS	4303707	43
3642	Brazil	Campinas do Sul	RS	4303806	43
3643	Brazil	Campo Bom	RS	4303905	43
3644	Brazil	Campo Novo	RS	4304002	43
3645	Brazil	Campos Borges	RS	4304101	43
3646	Brazil	Candelária	RS	4304200	43
3647	Brazil	Cândido Godói	RS	4304309	43
3648	Brazil	Candiota	RS	4304358	43
3649	Brazil	Canela	RS	4304408	43
3650	Brazil	Canguçu	RS	4304507	43
3651	Brazil	Canoas	RS	4304606	43
3652	Brazil	Canudos do Vale	RS	4304614	43
3653	Brazil	Capão Bonito do Sul	RS	4304622	43
3654	Brazil	Capão da Canoa	RS	4304630	43
3655	Brazil	Capão do Cipó	RS	4304655	43
3656	Brazil	Capão do Leão	RS	4304663	43
3657	Brazil	Capela de Santana	RS	4304689	43
3658	Brazil	Capitão	RS	4304697	43
3659	Brazil	Capivari do Sul	RS	4304671	43
3660	Brazil	Caraá	RS	4304713	43
3661	Brazil	Carazinho	RS	4304705	43
3662	Brazil	Carlos Barbosa	RS	4304804	43
3663	Brazil	Carlos Gomes	RS	4304853	43
3664	Brazil	Casca	RS	4304903	43
3665	Brazil	Caseiros	RS	4304952	43
3666	Brazil	Catuípe	RS	4305009	43
3667	Brazil	Caxias do Sul	RS	4305108	43
3668	Brazil	Centenário	RS	4305116	43
3669	Brazil	Cerrito	RS	4305124	43
3670	Brazil	Cerro Branco	RS	4305132	43
3671	Brazil	Cerro Grande	RS	4305157	43
3672	Brazil	Cerro Grande do Sul	RS	4305173	43
3673	Brazil	Cerro Largo	RS	4305207	43
3674	Brazil	Chapada	RS	4305306	43
3675	Brazil	Charqueadas	RS	4305355	43
3676	Brazil	Charrua	RS	4305371	43
3677	Brazil	Chiapetta	RS	4305405	43
3678	Brazil	Chuí	RS	4305439	43
3679	Brazil	Chuvisca	RS	4305447	43
3680	Brazil	Cidreira	RS	4305454	43
3681	Brazil	Ciríaco	RS	4305504	43
3682	Brazil	Colinas	RS	4305587	43
3683	Brazil	Colorado	RS	4305603	43
3684	Brazil	Condor	RS	4305702	43
3685	Brazil	Constantina	RS	4305801	43
3686	Brazil	Coqueiro Baixo	RS	4305835	43
3687	Brazil	Coqueiros do Sul	RS	4305850	43
3688	Brazil	Coronel Barros	RS	4305871	43
3689	Brazil	Coronel Bicaco	RS	4305900	43
3690	Brazil	Coronel Pilar	RS	4305934	43
3691	Brazil	Cotiporã	RS	4305959	43
3692	Brazil	Coxilha	RS	4305975	43
3693	Brazil	Crissiumal	RS	4306007	43
3694	Brazil	Cristal	RS	4306056	43
3695	Brazil	Cristal do Sul	RS	4306072	43
3696	Brazil	Cruz Alta	RS	4306106	43
3697	Brazil	Cruzaltense	RS	4306130	43
3698	Brazil	Cruzeiro do Sul	RS	4306205	43
3699	Brazil	David Canabarro	RS	4306304	43
3700	Brazil	Derrubadas	RS	4306320	43
3701	Brazil	Dezesseis de Novembro	RS	4306353	43
3702	Brazil	Dilermando de Aguiar	RS	4306379	43
3703	Brazil	Dois Irmãos	RS	4306403	43
3704	Brazil	Dois Irmãos das Missões	RS	4306429	43
3705	Brazil	Dois Lajeados	RS	4306452	43
3706	Brazil	Dom Feliciano	RS	4306502	43
3707	Brazil	Dom Pedrito	RS	4306601	43
3708	Brazil	Dom Pedro de Alcântara	RS	4306551	43
3709	Brazil	Dona Francisca	RS	4306700	43
3710	Brazil	Doutor Maurício Cardoso	RS	4306734	43
3711	Brazil	Doutor Ricardo	RS	4306759	43
3712	Brazil	Eldorado do Sul	RS	4306767	43
3713	Brazil	Encantado	RS	4306809	43
3714	Brazil	Encruzilhada do Sul	RS	4306908	43
3715	Brazil	Engenho Velho	RS	4306924	43
3716	Brazil	Entre Rios do Sul	RS	4306957	43
3717	Brazil	Entre-Ijuís	RS	4306932	43
3718	Brazil	Erebango	RS	4306973	43
3719	Brazil	Erechim	RS	4307005	43
3720	Brazil	Ernestina	RS	4307054	43
3721	Brazil	Erval Grande	RS	4307203	43
3722	Brazil	Erval Seco	RS	4307302	43
3723	Brazil	Esmeralda	RS	4307401	43
3724	Brazil	Esperança do Sul	RS	4307450	43
3725	Brazil	Espumoso	RS	4307500	43
3726	Brazil	Estação	RS	4307559	43
3727	Brazil	Estância Velha	RS	4307609	43
3728	Brazil	Esteio	RS	4307708	43
3729	Brazil	Estrela	RS	4307807	43
3730	Brazil	Estrela Velha	RS	4307815	43
3731	Brazil	Eugênio de Castro	RS	4307831	43
3732	Brazil	Fagundes Varela	RS	4307864	43
3733	Brazil	Farroupilha	RS	4307906	43
3734	Brazil	Faxinal do Soturno	RS	4308003	43
3735	Brazil	Faxinalzinho	RS	4308052	43
3736	Brazil	Fazenda Vilanova	RS	4308078	43
3737	Brazil	Feliz	RS	4308102	43
3738	Brazil	Flores da Cunha	RS	4308201	43
3739	Brazil	Floriano Peixoto	RS	4308250	43
3740	Brazil	Fontoura Xavier	RS	4308300	43
3741	Brazil	Formigueiro	RS	4308409	43
3742	Brazil	Forquetinha	RS	4308433	43
3743	Brazil	Fortaleza dos Valos	RS	4308458	43
3744	Brazil	Frederico Westphalen	RS	4308508	43
3745	Brazil	Garibaldi	RS	4308607	43
3746	Brazil	Garruchos	RS	4308656	43
3747	Brazil	Gaurama	RS	4308706	43
3748	Brazil	General Câmara	RS	4308805	43
3749	Brazil	Gentil	RS	4308854	43
3750	Brazil	Getúlio Vargas	RS	4308904	43
3751	Brazil	Giruá	RS	4309001	43
3752	Brazil	Glorinha	RS	4309050	43
3753	Brazil	Gramado	RS	4309100	43
3754	Brazil	Gramado dos Loureiros	RS	4309126	43
3755	Brazil	Gramado Xavier	RS	4309159	43
3756	Brazil	Gravataí	RS	4309209	43
3757	Brazil	Guabiju	RS	4309258	43
3758	Brazil	Guaíba	RS	4309308	43
3759	Brazil	Guaporé	RS	4309407	43
3760	Brazil	Guarani das Missões	RS	4309506	43
3761	Brazil	Harmonia	RS	4309555	43
3762	Brazil	Herval	RS	4307104	43
3763	Brazil	Herveiras	RS	4309571	43
3764	Brazil	Horizontina	RS	4309605	43
3765	Brazil	Hulha Negra	RS	4309654	43
3766	Brazil	Humaitá	RS	4309704	43
3767	Brazil	Ibarama	RS	4309753	43
3768	Brazil	Ibiaçá	RS	4309803	43
3769	Brazil	Ibiraiaras	RS	4309902	43
3770	Brazil	Ibirapuitã	RS	4309951	43
3771	Brazil	Ibirubá	RS	4310009	43
3772	Brazil	Igrejinha	RS	4310108	43
3773	Brazil	Ijuí	RS	4310207	43
3774	Brazil	Ilópolis	RS	4310306	43
3775	Brazil	Imbé	RS	4310330	43
3776	Brazil	Imigrante	RS	4310363	43
3777	Brazil	Independência	RS	4310405	43
3778	Brazil	Inhacorá	RS	4310413	43
3779	Brazil	Ipê	RS	4310439	43
3780	Brazil	Ipiranga do Sul	RS	4310462	43
3781	Brazil	Iraí	RS	4310504	43
3782	Brazil	Itaara	RS	4310538	43
3783	Brazil	Itacurubi	RS	4310553	43
3784	Brazil	Itapuca	RS	4310579	43
3785	Brazil	Itaqui	RS	4310603	43
3786	Brazil	Itati	RS	4310652	43
3787	Brazil	Itatiba do Sul	RS	4310702	43
3788	Brazil	Ivorá	RS	4310751	43
3789	Brazil	Ivoti	RS	4310801	43
3790	Brazil	Jaboticaba	RS	4310850	43
3791	Brazil	Jacuizinho	RS	4310876	43
3792	Brazil	Jacutinga	RS	4310900	43
3793	Brazil	Jaguarão	RS	4311007	43
3794	Brazil	Jaguari	RS	4311106	43
3795	Brazil	Jaquirana	RS	4311122	43
3796	Brazil	Jari	RS	4311130	43
3797	Brazil	Jóia	RS	4311155	43
3798	Brazil	Júlio de Castilhos	RS	4311205	43
3799	Brazil	Lagoa Bonita do Sul	RS	4311239	43
3800	Brazil	Lagoa dos Três Cantos	RS	4311270	43
3801	Brazil	Lagoa Vermelha	RS	4311304	43
3802	Brazil	Lagoão	RS	4311254	43
3803	Brazil	Lajeado	RS	4311403	43
3804	Brazil	Lajeado do Bugre	RS	4311429	43
3805	Brazil	Lavras do Sul	RS	4311502	43
3806	Brazil	Liberato Salzano	RS	4311601	43
3807	Brazil	Lindolfo Collor	RS	4311627	43
3808	Brazil	Linha Nova	RS	4311643	43
3809	Brazil	Maçambara	RS	4311718	43
3810	Brazil	Machadinho	RS	4311700	43
3811	Brazil	Mampituba	RS	4311734	43
3812	Brazil	Manoel Viana	RS	4311759	43
3813	Brazil	Maquiné	RS	4311775	43
3814	Brazil	Maratá	RS	4311791	43
3815	Brazil	Marau	RS	4311809	43
3816	Brazil	Marcelino Ramos	RS	4311908	43
3817	Brazil	Mariana Pimentel	RS	4311981	43
3818	Brazil	Mariano Moro	RS	4312005	43
3819	Brazil	Marques de Souza	RS	4312054	43
3820	Brazil	Mata	RS	4312104	43
3821	Brazil	Mato Castelhano	RS	4312138	43
3822	Brazil	Mato Leitão	RS	4312153	43
3823	Brazil	Mato Queimado	RS	4312179	43
3824	Brazil	Maximiliano de Almeida	RS	4312203	43
3825	Brazil	Minas do Leão	RS	4312252	43
3826	Brazil	Miraguaí	RS	4312302	43
3827	Brazil	Montauri	RS	4312351	43
3828	Brazil	Monte Alegre dos Campos	RS	4312377	43
3829	Brazil	Monte Belo do Sul	RS	4312385	43
3830	Brazil	Montenegro	RS	4312401	43
3831	Brazil	Mormaço	RS	4312427	43
3832	Brazil	Morrinhos do Sul	RS	4312443	43
3833	Brazil	Morro Redondo	RS	4312450	43
3834	Brazil	Morro Reuter	RS	4312476	43
3835	Brazil	Mostardas	RS	4312500	43
3836	Brazil	Muçum	RS	4312609	43
3837	Brazil	Muitos Capões	RS	4312617	43
3838	Brazil	Muliterno	RS	4312625	43
3839	Brazil	Não-Me-Toque	RS	4312658	43
3840	Brazil	Nicolau Vergueiro	RS	4312674	43
3841	Brazil	Nonoai	RS	4312708	43
3842	Brazil	Nova Alvorada	RS	4312757	43
3843	Brazil	Nova Araçá	RS	4312807	43
3844	Brazil	Nova Bassano	RS	4312906	43
3845	Brazil	Nova Boa Vista	RS	4312955	43
3846	Brazil	Nova Bréscia	RS	4313003	43
3847	Brazil	Nova Candelária	RS	4313011	43
3848	Brazil	Nova Esperança do Sul	RS	4313037	43
3849	Brazil	Nova Hartz	RS	4313060	43
3850	Brazil	Nova Pádua	RS	4313086	43
3851	Brazil	Nova Palma	RS	4313102	43
3852	Brazil	Nova Petrópolis	RS	4313201	43
3853	Brazil	Nova Prata	RS	4313300	43
3854	Brazil	Nova Ramada	RS	4313334	43
3855	Brazil	Nova Roma do Sul	RS	4313359	43
3856	Brazil	Nova Santa Rita	RS	4313375	43
3857	Brazil	Novo Barreiro	RS	4313490	43
3858	Brazil	Novo Cabrais	RS	4313391	43
3859	Brazil	Novo Hamburgo	RS	4313409	43
3860	Brazil	Novo Machado	RS	4313425	43
3861	Brazil	Novo Tiradentes	RS	4313441	43
3862	Brazil	Novo Xingu	RS	4313466	43
3863	Brazil	Osório	RS	4313508	43
3864	Brazil	Paim Filho	RS	4313607	43
3865	Brazil	Palmares do Sul	RS	4313656	43
3866	Brazil	Palmeira das Missões	RS	4313706	43
3867	Brazil	Palmitinho	RS	4313805	43
3868	Brazil	Panambi	RS	4313904	43
3869	Brazil	Pantano Grande	RS	4313953	43
3870	Brazil	Paraí	RS	4314001	43
3871	Brazil	Paraíso do Sul	RS	4314027	43
3872	Brazil	Pareci Novo	RS	4314035	43
3873	Brazil	Parobé	RS	4314050	43
3874	Brazil	Passa Sete	RS	4314068	43
3875	Brazil	Passo do Sobrado	RS	4314076	43
3876	Brazil	Passo Fundo	RS	4314100	43
3877	Brazil	Paulo Bento	RS	4314134	43
3878	Brazil	Paverama	RS	4314159	43
3879	Brazil	Pedras Altas	RS	4314175	43
3880	Brazil	Pedro Osório	RS	4314209	43
3881	Brazil	Pejuçara	RS	4314308	43
3882	Brazil	Pelotas	RS	4314407	43
3883	Brazil	Picada Café	RS	4314423	43
3884	Brazil	Pinhal	RS	4314456	43
3885	Brazil	Pinhal da Serra	RS	4314464	43
3886	Brazil	Pinhal Grande	RS	4314472	43
3887	Brazil	Pinheirinho do Vale	RS	4314498	43
3888	Brazil	Pinheiro Machado	RS	4314506	43
3889	Brazil	Pirapó	RS	4314555	43
3890	Brazil	Piratini	RS	4314605	43
3891	Brazil	Planalto	RS	4314704	43
3892	Brazil	Poço das Antas	RS	4314753	43
3893	Brazil	Pontão	RS	4314779	43
3894	Brazil	Ponte Preta	RS	4314787	43
3895	Brazil	Portão	RS	4314803	43
3896	Brazil	Porto Alegre	RS	4314902	43
3897	Brazil	Porto Lucena	RS	4315008	43
3898	Brazil	Porto Mauá	RS	4315057	43
3899	Brazil	Porto Vera Cruz	RS	4315073	43
3900	Brazil	Porto Xavier	RS	4315107	43
3901	Brazil	Pouso Novo	RS	4315131	43
3902	Brazil	Presidente Lucena	RS	4315149	43
3903	Brazil	Progresso	RS	4315156	43
3904	Brazil	Protásio Alves	RS	4315172	43
3905	Brazil	Putinga	RS	4315206	43
3906	Brazil	Quaraí	RS	4315305	43
3907	Brazil	Quatro Irmãos	RS	4315313	43
3908	Brazil	Quevedos	RS	4315321	43
3909	Brazil	Quinze de Novembro	RS	4315354	43
3910	Brazil	Redentora	RS	4315404	43
3911	Brazil	Relvado	RS	4315453	43
3912	Brazil	Restinga Seca	RS	4315503	43
3913	Brazil	Rio dos Índios	RS	4315552	43
3914	Brazil	Rio Grande	RS	4315602	43
3915	Brazil	Rio Pardo	RS	4315701	43
3916	Brazil	Riozinho	RS	4315750	43
3917	Brazil	Roca Sales	RS	4315800	43
3918	Brazil	Rodeio Bonito	RS	4315909	43
3919	Brazil	Rolador	RS	4315958	43
3920	Brazil	Rolante	RS	4316006	43
3921	Brazil	Ronda Alta	RS	4316105	43
3922	Brazil	Rondinha	RS	4316204	43
3923	Brazil	Roque Gonzales	RS	4316303	43
3924	Brazil	Rosário do Sul	RS	4316402	43
3925	Brazil	Sagrada Família	RS	4316428	43
3926	Brazil	Saldanha Marinho	RS	4316436	43
3927	Brazil	Salto do Jacuí	RS	4316451	43
3928	Brazil	Salvador das Missões	RS	4316477	43
3929	Brazil	Salvador do Sul	RS	4316501	43
3930	Brazil	Sananduva	RS	4316600	43
3931	Brazil	Santa Bárbara do Sul	RS	4316709	43
3932	Brazil	Santa Cecília do Sul	RS	4316733	43
3933	Brazil	Santa Clara do Sul	RS	4316758	43
3934	Brazil	Santa Cruz do Sul	RS	4316808	43
3935	Brazil	Santa Margarida do Sul	RS	4316972	43
3936	Brazil	Santa Maria	RS	4316907	43
3937	Brazil	Santa Maria do Herval	RS	4316956	43
3938	Brazil	Santa Rosa	RS	4317202	43
3939	Brazil	Santa Tereza	RS	4317251	43
3940	Brazil	Santa Vitória do Palmar	RS	4317301	43
3941	Brazil	Santana da Boa Vista	RS	4317004	43
3942	Brazil	Santana do Livramento	RS	4317103	43
3943	Brazil	Santiago	RS	4317400	43
3944	Brazil	Santo Ângelo	RS	4317509	43
3945	Brazil	Santo Antônio da Patrulha	RS	4317608	43
3946	Brazil	Santo Antônio das Missões	RS	4317707	43
3947	Brazil	Santo Antônio do Palma	RS	4317558	43
3948	Brazil	Santo Antônio do Planalto	RS	4317756	43
3949	Brazil	Santo Augusto	RS	4317806	43
3950	Brazil	Santo Cristo	RS	4317905	43
3951	Brazil	Santo Expedito do Sul	RS	4317954	43
3952	Brazil	São Borja	RS	4318002	43
3953	Brazil	São Domingos do Sul	RS	4318051	43
3954	Brazil	São Francisco de Assis	RS	4318101	43
3955	Brazil	São Francisco de Paula	RS	4318200	43
3956	Brazil	São Gabriel	RS	4318309	43
3957	Brazil	São Jerônimo	RS	4318408	43
3958	Brazil	São João da Urtiga	RS	4318424	43
3959	Brazil	São João do Polêsine	RS	4318432	43
3960	Brazil	São Jorge	RS	4318440	43
3961	Brazil	São José das Missões	RS	4318457	43
3962	Brazil	São José do Herval	RS	4318465	43
3963	Brazil	São José do Hortêncio	RS	4318481	43
3964	Brazil	São José do Inhacorá	RS	4318499	43
3965	Brazil	São José do Norte	RS	4318507	43
3966	Brazil	São José do Ouro	RS	4318606	43
3967	Brazil	São José do Sul	RS	4318614	43
3968	Brazil	São José dos Ausentes	RS	4318622	43
3969	Brazil	São Leopoldo	RS	4318705	43
3970	Brazil	São Lourenço do Sul	RS	4318804	43
3971	Brazil	São Luiz Gonzaga	RS	4318903	43
3972	Brazil	São Marcos	RS	4319000	43
3973	Brazil	São Martinho	RS	4319109	43
3974	Brazil	São Martinho da Serra	RS	4319125	43
3975	Brazil	São Miguel das Missões	RS	4319158	43
3976	Brazil	São Nicolau	RS	4319208	43
3977	Brazil	São Paulo das Missões	RS	4319307	43
3978	Brazil	São Pedro da Serra	RS	4319356	43
3979	Brazil	São Pedro das Missões	RS	4319364	43
3980	Brazil	São Pedro do Butiá	RS	4319372	43
3981	Brazil	São Pedro do Sul	RS	4319406	43
3982	Brazil	São Sebastião do Caí	RS	4319505	43
3983	Brazil	São Sepé	RS	4319604	43
3984	Brazil	São Valentim	RS	4319703	43
3985	Brazil	São Valentim do Sul	RS	4319711	43
3986	Brazil	São Valério do Sul	RS	4319737	43
3987	Brazil	São Vendelino	RS	4319752	43
3988	Brazil	São Vicente do Sul	RS	4319802	43
3989	Brazil	Sapiranga	RS	4319901	43
3990	Brazil	Sapucaia do Sul	RS	4320008	43
3991	Brazil	Sarandi	RS	4320107	43
3992	Brazil	Seberi	RS	4320206	43
3993	Brazil	Sede Nova	RS	4320230	43
3994	Brazil	Segredo	RS	4320263	43
3995	Brazil	Selbach	RS	4320305	43
3996	Brazil	Senador Salgado Filho	RS	4320321	43
3997	Brazil	Sentinela do Sul	RS	4320354	43
3998	Brazil	Serafina Corrêa	RS	4320404	43
3999	Brazil	Sério	RS	4320453	43
4000	Brazil	Sertão	RS	4320503	43
4001	Brazil	Sertão Santana	RS	4320552	43
4002	Brazil	Sete de Setembro	RS	4320578	43
4003	Brazil	Severiano de Almeida	RS	4320602	43
4004	Brazil	Silveira Martins	RS	4320651	43
4005	Brazil	Sinimbu	RS	4320677	43
4006	Brazil	Sobradinho	RS	4320701	43
4007	Brazil	Soledade	RS	4320800	43
4008	Brazil	Tabaí	RS	4320859	43
4009	Brazil	Tapejara	RS	4320909	43
4010	Brazil	Tapera	RS	4321006	43
4011	Brazil	Tapes	RS	4321105	43
4012	Brazil	Taquara	RS	4321204	43
4013	Brazil	Taquari	RS	4321303	43
4014	Brazil	Taquaruçu do Sul	RS	4321329	43
4015	Brazil	Tavares	RS	4321352	43
4016	Brazil	Tenente Portela	RS	4321402	43
4017	Brazil	Terra de Areia	RS	4321436	43
4018	Brazil	Teutônia	RS	4321451	43
4019	Brazil	Tio Hugo	RS	4321469	43
4020	Brazil	Tiradentes do Sul	RS	4321477	43
4021	Brazil	Toropi	RS	4321493	43
4022	Brazil	Torres	RS	4321501	43
4023	Brazil	Tramandaí	RS	4321600	43
4024	Brazil	Travesseiro	RS	4321626	43
4025	Brazil	Três Arroios	RS	4321634	43
4026	Brazil	Três Cachoeiras	RS	4321667	43
4027	Brazil	Três Coroas	RS	4321709	43
4028	Brazil	Três de Maio	RS	4321808	43
4029	Brazil	Três Forquilhas	RS	4321832	43
4030	Brazil	Três Palmeiras	RS	4321857	43
4031	Brazil	Três Passos	RS	4321907	43
4032	Brazil	Trindade do Sul	RS	4321956	43
4033	Brazil	Triunfo	RS	4322004	43
4034	Brazil	Tucunduva	RS	4322103	43
4035	Brazil	Tunas	RS	4322152	43
4036	Brazil	Tupanci do Sul	RS	4322186	43
4037	Brazil	Tupanciretã	RS	4322202	43
4038	Brazil	Tupandi	RS	4322251	43
4039	Brazil	Tuparendi	RS	4322301	43
4040	Brazil	Turuçu	RS	4322327	43
4041	Brazil	Ubiretama	RS	4322343	43
4042	Brazil	União da Serra	RS	4322350	43
4043	Brazil	Unistalda	RS	4322376	43
4044	Brazil	Uruguaiana	RS	4322400	43
4045	Brazil	Vacaria	RS	4322509	43
4046	Brazil	Vale do Sol	RS	4322533	43
4047	Brazil	Vale Real	RS	4322541	43
4048	Brazil	Vale Verde	RS	4322525	43
4049	Brazil	Vanini	RS	4322558	43
4050	Brazil	Venâncio Aires	RS	4322608	43
4051	Brazil	Vera Cruz	RS	4322707	43
4052	Brazil	Veranópolis	RS	4322806	43
4053	Brazil	Vespasiano Correa	RS	4322855	43
4054	Brazil	Viadutos	RS	4322905	43
4055	Brazil	Viamão	RS	4323002	43
4056	Brazil	Vicente Dutra	RS	4323101	43
4057	Brazil	Victor Graeff	RS	4323200	43
4058	Brazil	Vila Flores	RS	4323309	43
4059	Brazil	Vila Lângaro	RS	4323358	43
4060	Brazil	Vila Maria	RS	4323408	43
4061	Brazil	Vila Nova do Sul	RS	4323457	43
4062	Brazil	Vista Alegre	RS	4323507	43
4063	Brazil	Vista Alegre do Prata	RS	4323606	43
4064	Brazil	Vista Gaúcha	RS	4323705	43
4065	Brazil	Vitória das Missões	RS	4323754	43
4066	Brazil	Westfalia	RS	4323770	43
4067	Brazil	Xangri-lá	RS	4323804	43
4068	Brazil	Adamantina	SP	3500105	35
4069	Brazil	Adolfo	SP	3500204	35
4070	Brazil	Aguaí	SP	3500303	35
4071	Brazil	Águas da Prata	SP	3500402	35
4072	Brazil	Águas de Lindóia	SP	3500501	35
4073	Brazil	Águas de Santa Bárbara	SP	3500550	35
4074	Brazil	Águas de São Pedro	SP	3500600	35
4075	Brazil	Agudos	SP	3500709	35
4076	Brazil	Alambari	SP	3500758	35
4077	Brazil	Alfredo Marcondes	SP	3500808	35
4078	Brazil	Altair	SP	3500907	35
4079	Brazil	Altinópolis	SP	3501004	35
4080	Brazil	Alto Alegre	SP	3501103	35
4081	Brazil	Alumínio	SP	3501152	35
4082	Brazil	Álvares Florence	SP	3501202	35
4083	Brazil	Álvares Machado	SP	3501301	35
4084	Brazil	Álvaro de Carvalho	SP	3501400	35
4085	Brazil	Alvinlândia	SP	3501509	35
4086	Brazil	Americana	SP	3501608	35
4087	Brazil	Américo Brasiliense	SP	3501707	35
4088	Brazil	Américo de Campos	SP	3501806	35
4089	Brazil	Amparo	SP	3501905	35
4090	Brazil	Analândia	SP	3502002	35
4091	Brazil	Andradina	SP	3502101	35
4092	Brazil	Angatuba	SP	3502200	35
4093	Brazil	Anhembi	SP	3502309	35
4094	Brazil	Anhumas	SP	3502408	35
4095	Brazil	Aparecida	SP	3502507	35
4096	Brazil	Aparecida d'Oeste	SP	3502606	35
4097	Brazil	Apiaí	SP	3502705	35
4098	Brazil	Araçariguama	SP	3502754	35
4099	Brazil	Araçatuba	SP	3502804	35
4100	Brazil	Araçoiaba da Serra	SP	3502903	35
4101	Brazil	Aramina	SP	3503000	35
4102	Brazil	Arandu	SP	3503109	35
4103	Brazil	Arapeí	SP	3503158	35
4104	Brazil	Araraquara	SP	3503208	35
4105	Brazil	Araras	SP	3503307	35
4106	Brazil	Arco-Íris	SP	3503356	35
4107	Brazil	Arealva	SP	3503406	35
4108	Brazil	Areias	SP	3503505	35
4109	Brazil	Areiópolis	SP	3503604	35
4110	Brazil	Ariranha	SP	3503703	35
4111	Brazil	Artur Nogueira	SP	3503802	35
4112	Brazil	Arujá	SP	3503901	35
4113	Brazil	Aspásia	SP	3503950	35
4114	Brazil	Assis	SP	3504008	35
4115	Brazil	Atibaia	SP	3504107	35
4116	Brazil	Auriflama	SP	3504206	35
4117	Brazil	Avaí	SP	3504305	35
4118	Brazil	Avanhandava	SP	3504404	35
4119	Brazil	Avaré	SP	3504503	35
4120	Brazil	Bady Bassitt	SP	3504602	35
4121	Brazil	Balbinos	SP	3504701	35
4122	Brazil	Bálsamo	SP	3504800	35
4123	Brazil	Bananal	SP	3504909	35
4124	Brazil	Barão de Antonina	SP	3505005	35
4125	Brazil	Barbosa	SP	3505104	35
4126	Brazil	Bariri	SP	3505203	35
4127	Brazil	Barra Bonita	SP	3505302	35
4128	Brazil	Barra do Chapéu	SP	3505351	35
4129	Brazil	Barra do Turvo	SP	3505401	35
4130	Brazil	Barretos	SP	3505500	35
4131	Brazil	Barrinha	SP	3505609	35
4132	Brazil	Barueri	SP	3505708	35
4133	Brazil	Bastos	SP	3505807	35
4134	Brazil	Batatais	SP	3505906	35
4135	Brazil	Bauru	SP	3506003	35
4136	Brazil	Bebedouro	SP	3506102	35
4137	Brazil	Bento de Abreu	SP	3506201	35
4138	Brazil	Bernardino de Campos	SP	3506300	35
4139	Brazil	Bertioga	SP	3506359	35
4140	Brazil	Bilac	SP	3506409	35
4141	Brazil	Birigui	SP	3506508	35
4142	Brazil	Biritiba-Mirim	SP	3506607	35
4143	Brazil	Boa Esperança do Sul	SP	3506706	35
4144	Brazil	Bocaina	SP	3506805	35
4145	Brazil	Bofete	SP	3506904	35
4146	Brazil	Boituva	SP	3507001	35
4147	Brazil	Bom Jesus dos Perdões	SP	3507100	35
4148	Brazil	Bom Sucesso de Itararé	SP	3507159	35
4149	Brazil	Borá	SP	3507209	35
4150	Brazil	Boracéia	SP	3507308	35
4151	Brazil	Borborema	SP	3507407	35
4152	Brazil	Borebi	SP	3507456	35
4153	Brazil	Botucatu	SP	3507506	35
4154	Brazil	Bragança Paulista	SP	3507605	35
4155	Brazil	Braúna	SP	3507704	35
4156	Brazil	Brejo Alegre	SP	3507753	35
4157	Brazil	Brodowski	SP	3507803	35
4158	Brazil	Brotas	SP	3507902	35
4159	Brazil	Buri	SP	3508009	35
4160	Brazil	Buritama	SP	3508108	35
4161	Brazil	Buritizal	SP	3508207	35
4162	Brazil	Cabrália Paulista	SP	3508306	35
4163	Brazil	Cabreúva	SP	3508405	35
4164	Brazil	Caçapava	SP	3508504	35
4165	Brazil	Cachoeira Paulista	SP	3508603	35
4166	Brazil	Caconde	SP	3508702	35
4167	Brazil	Cafelândia	SP	3508801	35
4168	Brazil	Caiabu	SP	3508900	35
4169	Brazil	Caieiras	SP	3509007	35
4170	Brazil	Caiuá	SP	3509106	35
4171	Brazil	Cajamar	SP	3509205	35
4172	Brazil	Cajati	SP	3509254	35
4173	Brazil	Cajobi	SP	3509304	35
4174	Brazil	Cajuru	SP	3509403	35
4175	Brazil	Campina do Monte Alegre	SP	3509452	35
4176	Brazil	Campinas	SP	3509502	35
4177	Brazil	Campo Limpo Paulista	SP	3509601	35
4178	Brazil	Campos do Jordão	SP	3509700	35
4179	Brazil	Campos Novos Paulista	SP	3509809	35
4180	Brazil	Cananéia	SP	3509908	35
4181	Brazil	Canas	SP	3509957	35
4182	Brazil	Cândido Mota	SP	3510005	35
4183	Brazil	Cândido Rodrigues	SP	3510104	35
4184	Brazil	Canitar	SP	3510153	35
4185	Brazil	Capão Bonito	SP	3510203	35
4186	Brazil	Capela do Alto	SP	3510302	35
4187	Brazil	Capivari	SP	3510401	35
4188	Brazil	Caraguatatuba	SP	3510500	35
4189	Brazil	Carapicuíba	SP	3510609	35
4190	Brazil	Cardoso	SP	3510708	35
4191	Brazil	Casa Branca	SP	3510807	35
4192	Brazil	Cássia dos Coqueiros	SP	3510906	35
4193	Brazil	Castilho	SP	3511003	35
4194	Brazil	Catanduva	SP	3511102	35
4195	Brazil	Catiguá	SP	3511201	35
4196	Brazil	Cedral	SP	3511300	35
4197	Brazil	Cerqueira César	SP	3511409	35
4198	Brazil	Cerquilho	SP	3511508	35
4199	Brazil	Cesário Lange	SP	3511607	35
4200	Brazil	Charqueada	SP	3511706	35
4201	Brazil	Chavantes	SP	3557204	35
4202	Brazil	Clementina	SP	3511904	35
4203	Brazil	Colina	SP	3512001	35
4204	Brazil	Colômbia	SP	3512100	35
4205	Brazil	Conchal	SP	3512209	35
4206	Brazil	Conchas	SP	3512308	35
4207	Brazil	Cordeirópolis	SP	3512407	35
4208	Brazil	Coroados	SP	3512506	35
4209	Brazil	Coronel Macedo	SP	3512605	35
4210	Brazil	Corumbataí	SP	3512704	35
4211	Brazil	Cosmópolis	SP	3512803	35
4212	Brazil	Cosmorama	SP	3512902	35
4213	Brazil	Cotia	SP	3513009	35
4214	Brazil	Cravinhos	SP	3513108	35
4215	Brazil	Cristais Paulista	SP	3513207	35
4216	Brazil	Cruzália	SP	3513306	35
4217	Brazil	Cruzeiro	SP	3513405	35
4218	Brazil	Cubatão	SP	3513504	35
4219	Brazil	Cunha	SP	3513603	35
4220	Brazil	Descalvado	SP	3513702	35
4221	Brazil	Diadema	SP	3513801	35
4222	Brazil	Dirce Reis	SP	3513850	35
4223	Brazil	Divinolândia	SP	3513900	35
4224	Brazil	Dobrada	SP	3514007	35
4225	Brazil	Dois Córregos	SP	3514106	35
4226	Brazil	Dolcinópolis	SP	3514205	35
4227	Brazil	Dourado	SP	3514304	35
4228	Brazil	Dracena	SP	3514403	35
4229	Brazil	Duartina	SP	3514502	35
4230	Brazil	Dumont	SP	3514601	35
4231	Brazil	Echaporã	SP	3514700	35
4232	Brazil	Eldorado	SP	3514809	35
4233	Brazil	Elias Fausto	SP	3514908	35
4234	Brazil	Elisiário	SP	3514924	35
4235	Brazil	Embaúba	SP	3514957	35
4236	Brazil	Embu	SP	3515004	35
4237	Brazil	Embu-Guaçu	SP	3515103	35
4238	Brazil	Emilianópolis	SP	3515129	35
4239	Brazil	Engenheiro Coelho	SP	3515152	35
4240	Brazil	Espírito Santo do Pinhal	SP	3515186	35
4241	Brazil	Espírito Santo do Turvo	SP	3515194	35
4242	Brazil	Estiva Gerbi	SP	3557303	35
4243	Brazil	Estrela do Norte	SP	3515301	35
4244	Brazil	Estrela d'Oeste	SP	3515202	35
4245	Brazil	Euclides da Cunha Paulista	SP	3515350	35
4246	Brazil	Fartura	SP	3515400	35
4247	Brazil	Fernando Prestes	SP	3515608	35
4248	Brazil	Fernandópolis	SP	3515509	35
4249	Brazil	Fernão	SP	3515657	35
4250	Brazil	Ferraz de Vasconcelos	SP	3515707	35
4251	Brazil	Flora Rica	SP	3515806	35
4252	Brazil	Floreal	SP	3515905	35
4253	Brazil	Flórida Paulista	SP	3516002	35
4254	Brazil	Florínia	SP	3516101	35
4255	Brazil	Franca	SP	3516200	35
4256	Brazil	Francisco Morato	SP	3516309	35
4257	Brazil	Franco da Rocha	SP	3516408	35
4258	Brazil	Gabriel Monteiro	SP	3516507	35
4259	Brazil	Gália	SP	3516606	35
4260	Brazil	Garça	SP	3516705	35
4261	Brazil	Gastão Vidigal	SP	3516804	35
4262	Brazil	Gavião Peixoto	SP	3516853	35
4263	Brazil	General Salgado	SP	3516903	35
4264	Brazil	Getulina	SP	3517000	35
4265	Brazil	Glicério	SP	3517109	35
4266	Brazil	Guaiçara	SP	3517208	35
4267	Brazil	Guaimbê	SP	3517307	35
4268	Brazil	Guaíra	SP	3517406	35
4269	Brazil	Guapiaçu	SP	3517505	35
4270	Brazil	Guapiara	SP	3517604	35
4271	Brazil	Guará	SP	3517703	35
4272	Brazil	Guaraçaí	SP	3517802	35
4273	Brazil	Guaraci	SP	3517901	35
4274	Brazil	Guarani d'Oeste	SP	3518008	35
4275	Brazil	Guarantã	SP	3518107	35
4276	Brazil	Guararapes	SP	3518206	35
4277	Brazil	Guararema	SP	3518305	35
4278	Brazil	Guaratinguetá	SP	3518404	35
4279	Brazil	Guareí	SP	3518503	35
4280	Brazil	Guariba	SP	3518602	35
4281	Brazil	Guarujá	SP	3518701	35
4282	Brazil	Guarulhos	SP	3518800	35
4283	Brazil	Guatapará	SP	3518859	35
4284	Brazil	Guzolândia	SP	3518909	35
4285	Brazil	Herculândia	SP	3519006	35
4286	Brazil	Holambra	SP	3519055	35
4287	Brazil	Hortolândia	SP	3519071	35
4288	Brazil	Iacanga	SP	3519105	35
4289	Brazil	Iacri	SP	3519204	35
4290	Brazil	Iaras	SP	3519253	35
4291	Brazil	Ibaté	SP	3519303	35
4292	Brazil	Ibirá	SP	3519402	35
4293	Brazil	Ibirarema	SP	3519501	35
4294	Brazil	Ibitinga	SP	3519600	35
4295	Brazil	Ibiúna	SP	3519709	35
4296	Brazil	Icém	SP	3519808	35
4297	Brazil	Iepê	SP	3519907	35
4298	Brazil	Igaraçu do Tietê	SP	3520004	35
4299	Brazil	Igarapava	SP	3520103	35
4300	Brazil	Igaratá	SP	3520202	35
4301	Brazil	Iguape	SP	3520301	35
4302	Brazil	Ilha Comprida	SP	3520426	35
4303	Brazil	Ilha Solteira	SP	3520442	35
4304	Brazil	Ilhabela	SP	3520400	35
4305	Brazil	Indaiatuba	SP	3520509	35
4306	Brazil	Indiana	SP	3520608	35
4307	Brazil	Indiaporã	SP	3520707	35
4308	Brazil	Inúbia Paulista	SP	3520806	35
4309	Brazil	Ipaussu	SP	3520905	35
4310	Brazil	Iperó	SP	3521002	35
4311	Brazil	Ipeúna	SP	3521101	35
4312	Brazil	Ipiguá	SP	3521150	35
4313	Brazil	Iporanga	SP	3521200	35
4314	Brazil	Ipuã	SP	3521309	35
4315	Brazil	Iracemápolis	SP	3521408	35
4316	Brazil	Irapuã	SP	3521507	35
4317	Brazil	Irapuru	SP	3521606	35
4318	Brazil	Itaberá	SP	3521705	35
4319	Brazil	Itaí	SP	3521804	35
4320	Brazil	Itajobi	SP	3521903	35
4321	Brazil	Itaju	SP	3522000	35
4322	Brazil	Itanhaém	SP	3522109	35
4323	Brazil	Itaóca	SP	3522158	35
4324	Brazil	Itapecerica da Serra	SP	3522208	35
4325	Brazil	Itapetininga	SP	3522307	35
4326	Brazil	Itapeva	SP	3522406	35
4327	Brazil	Itapevi	SP	3522505	35
4328	Brazil	Itapira	SP	3522604	35
4329	Brazil	Itapirapuã Paulista	SP	3522653	35
4330	Brazil	Itápolis	SP	3522703	35
4331	Brazil	Itaporanga	SP	3522802	35
4332	Brazil	Itapuí	SP	3522901	35
4333	Brazil	Itapura	SP	3523008	35
4334	Brazil	Itaquaquecetuba	SP	3523107	35
4335	Brazil	Itararé	SP	3523206	35
4336	Brazil	Itariri	SP	3523305	35
4337	Brazil	Itatiba	SP	3523404	35
4338	Brazil	Itatinga	SP	3523503	35
4339	Brazil	Itirapina	SP	3523602	35
4340	Brazil	Itirapuã	SP	3523701	35
4341	Brazil	Itobi	SP	3523800	35
4342	Brazil	Itu	SP	3523909	35
4343	Brazil	Itupeva	SP	3524006	35
4344	Brazil	Ituverava	SP	3524105	35
4345	Brazil	Jaborandi	SP	3524204	35
4346	Brazil	Jaboticabal	SP	3524303	35
4347	Brazil	Jacareí	SP	3524402	35
4348	Brazil	Jaci	SP	3524501	35
4349	Brazil	Jacupiranga	SP	3524600	35
4350	Brazil	Jaguariúna	SP	3524709	35
4351	Brazil	Jales	SP	3524808	35
4352	Brazil	Jambeiro	SP	3524907	35
4353	Brazil	Jandira	SP	3525003	35
4354	Brazil	Jardinópolis	SP	3525102	35
4355	Brazil	Jarinu	SP	3525201	35
4356	Brazil	Jaú	SP	3525300	35
4357	Brazil	Jeriquara	SP	3525409	35
4358	Brazil	Joanópolis	SP	3525508	35
4359	Brazil	João Ramalho	SP	3525607	35
4360	Brazil	José Bonifácio	SP	3525706	35
4361	Brazil	Júlio Mesquita	SP	3525805	35
4362	Brazil	Jumirim	SP	3525854	35
4363	Brazil	Jundiaí	SP	3525904	35
4364	Brazil	Junqueirópolis	SP	3526001	35
4365	Brazil	Juquiá	SP	3526100	35
4366	Brazil	Juquitiba	SP	3526209	35
4367	Brazil	Lagoinha	SP	3526308	35
4368	Brazil	Laranjal Paulista	SP	3526407	35
4369	Brazil	Lavínia	SP	3526506	35
4370	Brazil	Lavrinhas	SP	3526605	35
4371	Brazil	Leme	SP	3526704	35
4372	Brazil	Lençóis Paulista	SP	3526803	35
4373	Brazil	Limeira	SP	3526902	35
4374	Brazil	Lindóia	SP	3527009	35
4375	Brazil	Lins	SP	3527108	35
4376	Brazil	Lorena	SP	3527207	35
4377	Brazil	Lourdes	SP	3527256	35
4378	Brazil	Louveira	SP	3527306	35
4379	Brazil	Lucélia	SP	3527405	35
4380	Brazil	Lucianópolis	SP	3527504	35
4381	Brazil	Luís Antônio	SP	3527603	35
4382	Brazil	Luiziânia	SP	3527702	35
4383	Brazil	Lupércio	SP	3527801	35
4384	Brazil	Lutécia	SP	3527900	35
4385	Brazil	Macatuba	SP	3528007	35
4386	Brazil	Macaubal	SP	3528106	35
4387	Brazil	Macedônia	SP	3528205	35
4388	Brazil	Magda	SP	3528304	35
4389	Brazil	Mairinque	SP	3528403	35
4390	Brazil	Mairiporã	SP	3528502	35
4391	Brazil	Manduri	SP	3528601	35
4392	Brazil	Marabá Paulista	SP	3528700	35
4393	Brazil	Maracaí	SP	3528809	35
4394	Brazil	Marapoama	SP	3528858	35
4395	Brazil	Mariápolis	SP	3528908	35
4396	Brazil	Marília	SP	3529005	35
4397	Brazil	Marinópolis	SP	3529104	35
4398	Brazil	Martinópolis	SP	3529203	35
4399	Brazil	Matão	SP	3529302	35
4400	Brazil	Mauá	SP	3529401	35
4401	Brazil	Mendonça	SP	3529500	35
4402	Brazil	Meridiano	SP	3529609	35
4403	Brazil	Mesópolis	SP	3529658	35
4404	Brazil	Miguelópolis	SP	3529708	35
4405	Brazil	Mineiros do Tietê	SP	3529807	35
4406	Brazil	Mira Estrela	SP	3530003	35
4407	Brazil	Miracatu	SP	3529906	35
4408	Brazil	Mirandópolis	SP	3530102	35
4409	Brazil	Mirante do Paranapanema	SP	3530201	35
4410	Brazil	Mirassol	SP	3530300	35
4411	Brazil	Mirassolândia	SP	3530409	35
4412	Brazil	Mococa	SP	3530508	35
4413	Brazil	Mogi das Cruzes	SP	3530607	35
4414	Brazil	Mogi Guaçu	SP	3530706	35
4415	Brazil	Moji Mirim	SP	3530805	35
4416	Brazil	Mombuca	SP	3530904	35
4417	Brazil	Monções	SP	3531001	35
4418	Brazil	Mongaguá	SP	3531100	35
4419	Brazil	Monte Alegre do Sul	SP	3531209	35
4420	Brazil	Monte Alto	SP	3531308	35
4421	Brazil	Monte Aprazível	SP	3531407	35
4422	Brazil	Monte Azul Paulista	SP	3531506	35
4423	Brazil	Monte Castelo	SP	3531605	35
4424	Brazil	Monte Mor	SP	3531803	35
4425	Brazil	Monteiro Lobato	SP	3531704	35
4426	Brazil	Morro Agudo	SP	3531902	35
4427	Brazil	Morungaba	SP	3532009	35
4428	Brazil	Motuca	SP	3532058	35
4429	Brazil	Murutinga do Sul	SP	3532108	35
4430	Brazil	Nantes	SP	3532157	35
4431	Brazil	Narandiba	SP	3532207	35
4432	Brazil	Natividade da Serra	SP	3532306	35
4433	Brazil	Nazaré Paulista	SP	3532405	35
4434	Brazil	Neves Paulista	SP	3532504	35
4435	Brazil	Nhandeara	SP	3532603	35
4436	Brazil	Nipoã	SP	3532702	35
4437	Brazil	Nova Aliança	SP	3532801	35
4438	Brazil	Nova Campina	SP	3532827	35
4439	Brazil	Nova Canaã Paulista	SP	3532843	35
4440	Brazil	Nova Castilho	SP	3532868	35
4441	Brazil	Nova Europa	SP	3532900	35
4442	Brazil	Nova Granada	SP	3533007	35
4443	Brazil	Nova Guataporanga	SP	3533106	35
4444	Brazil	Nova Independência	SP	3533205	35
4445	Brazil	Nova Luzitânia	SP	3533304	35
4446	Brazil	Nova Odessa	SP	3533403	35
4447	Brazil	Novais	SP	3533254	35
4448	Brazil	Novo Horizonte	SP	3533502	35
4449	Brazil	Nuporanga	SP	3533601	35
4450	Brazil	Ocauçu	SP	3533700	35
4451	Brazil	Óleo	SP	3533809	35
4452	Brazil	Olímpia	SP	3533908	35
4453	Brazil	Onda Verde	SP	3534005	35
4454	Brazil	Oriente	SP	3534104	35
4455	Brazil	Orindiúva	SP	3534203	35
4456	Brazil	Orlândia	SP	3534302	35
4457	Brazil	Osasco	SP	3534401	35
4458	Brazil	Oscar Bressane	SP	3534500	35
4459	Brazil	Osvaldo Cruz	SP	3534609	35
4460	Brazil	Ourinhos	SP	3534708	35
4461	Brazil	Ouro Verde	SP	3534807	35
4462	Brazil	Ouroeste	SP	3534757	35
4463	Brazil	Pacaembu	SP	3534906	35
4464	Brazil	Palestina	SP	3535002	35
4465	Brazil	Palmares Paulista	SP	3535101	35
4466	Brazil	Palmeira d'Oeste	SP	3535200	35
4467	Brazil	Palmital	SP	3535309	35
4468	Brazil	Panorama	SP	3535408	35
4469	Brazil	Paraguaçu Paulista	SP	3535507	35
4470	Brazil	Paraibuna	SP	3535606	35
4471	Brazil	Paraíso	SP	3535705	35
4472	Brazil	Paranapanema	SP	3535804	35
4473	Brazil	Paranapuã	SP	3535903	35
4474	Brazil	Parapuã	SP	3536000	35
4475	Brazil	Pardinho	SP	3536109	35
4476	Brazil	Pariquera-Açu	SP	3536208	35
4477	Brazil	Parisi	SP	3536257	35
4478	Brazil	Patrocínio Paulista	SP	3536307	35
4479	Brazil	Paulicéia	SP	3536406	35
4480	Brazil	Paulínia	SP	3536505	35
4481	Brazil	Paulistânia	SP	3536570	35
4482	Brazil	Paulo de Faria	SP	3536604	35
4483	Brazil	Pederneiras	SP	3536703	35
4484	Brazil	Pedra Bela	SP	3536802	35
4485	Brazil	Pedranópolis	SP	3536901	35
4486	Brazil	Pedregulho	SP	3537008	35
4487	Brazil	Pedreira	SP	3537107	35
4488	Brazil	Pedrinhas Paulista	SP	3537156	35
4489	Brazil	Pedro de Toledo	SP	3537206	35
4490	Brazil	Penápolis	SP	3537305	35
4491	Brazil	Pereira Barreto	SP	3537404	35
4492	Brazil	Pereiras	SP	3537503	35
4493	Brazil	Peruíbe	SP	3537602	35
4494	Brazil	Piacatu	SP	3537701	35
4495	Brazil	Piedade	SP	3537800	35
4496	Brazil	Pilar do Sul	SP	3537909	35
4497	Brazil	Pindamonhangaba	SP	3538006	35
4498	Brazil	Pindorama	SP	3538105	35
4499	Brazil	Pinhalzinho	SP	3538204	35
4500	Brazil	Piquerobi	SP	3538303	35
4501	Brazil	Piquete	SP	3538501	35
4502	Brazil	Piracaia	SP	3538600	35
4503	Brazil	Piracicaba	SP	3538709	35
4504	Brazil	Piraju	SP	3538808	35
4505	Brazil	Pirajuí	SP	3538907	35
4506	Brazil	Pirangi	SP	3539004	35
4507	Brazil	Pirapora do Bom Jesus	SP	3539103	35
4508	Brazil	Pirapozinho	SP	3539202	35
4509	Brazil	Pirassununga	SP	3539301	35
4510	Brazil	Piratininga	SP	3539400	35
4511	Brazil	Pitangueiras	SP	3539509	35
4512	Brazil	Planalto	SP	3539608	35
4513	Brazil	Platina	SP	3539707	35
4514	Brazil	Poá	SP	3539806	35
4515	Brazil	Poloni	SP	3539905	35
4516	Brazil	Pompéia	SP	3540002	35
4517	Brazil	Pongaí	SP	3540101	35
4518	Brazil	Pontal	SP	3540200	35
4519	Brazil	Pontalinda	SP	3540259	35
4520	Brazil	Pontes Gestal	SP	3540309	35
4521	Brazil	Populina	SP	3540408	35
4522	Brazil	Porangaba	SP	3540507	35
4523	Brazil	Porto Feliz	SP	3540606	35
4524	Brazil	Porto Ferreira	SP	3540705	35
4525	Brazil	Potim	SP	3540754	35
4526	Brazil	Potirendaba	SP	3540804	35
4527	Brazil	Pracinha	SP	3540853	35
4528	Brazil	Pradópolis	SP	3540903	35
4529	Brazil	Praia Grande	SP	3541000	35
4530	Brazil	Pratânia	SP	3541059	35
4531	Brazil	Presidente Alves	SP	3541109	35
4532	Brazil	Presidente Bernardes	SP	3541208	35
4533	Brazil	Presidente Epitácio	SP	3541307	35
4534	Brazil	Presidente Prudente	SP	3541406	35
4535	Brazil	Presidente Venceslau	SP	3541505	35
4536	Brazil	Promissão	SP	3541604	35
4537	Brazil	Quadra	SP	3541653	35
4538	Brazil	Quatá	SP	3541703	35
4539	Brazil	Queiroz	SP	3541802	35
4540	Brazil	Queluz	SP	3541901	35
4541	Brazil	Quintana	SP	3542008	35
4542	Brazil	Rafard	SP	3542107	35
4543	Brazil	Rancharia	SP	3542206	35
4544	Brazil	Redenção da Serra	SP	3542305	35
4545	Brazil	Regente Feijó	SP	3542404	35
4546	Brazil	Reginópolis	SP	3542503	35
4547	Brazil	Registro	SP	3542602	35
4548	Brazil	Restinga	SP	3542701	35
4549	Brazil	Ribeira	SP	3542800	35
4550	Brazil	Ribeirão Bonito	SP	3542909	35
4551	Brazil	Ribeirão Branco	SP	3543006	35
4552	Brazil	Ribeirão Corrente	SP	3543105	35
4553	Brazil	Ribeirão do Sul	SP	3543204	35
4554	Brazil	Ribeirão dos Índios	SP	3543238	35
4555	Brazil	Ribeirão Grande	SP	3543253	35
4556	Brazil	Ribeirão Pires	SP	3543303	35
4557	Brazil	Ribeirão Preto	SP	3543402	35
4558	Brazil	Rifaina	SP	3543600	35
4559	Brazil	Rincão	SP	3543709	35
4560	Brazil	Rinópolis	SP	3543808	35
4561	Brazil	Rio Claro	SP	3543907	35
4562	Brazil	Rio das Pedras	SP	3544004	35
4563	Brazil	Rio Grande da Serra	SP	3544103	35
4564	Brazil	Riolândia	SP	3544202	35
4565	Brazil	Riversul	SP	3543501	35
4566	Brazil	Rosana	SP	3544251	35
4567	Brazil	Roseira	SP	3544301	35
4568	Brazil	Rubiácea	SP	3544400	35
4569	Brazil	Rubinéia	SP	3544509	35
4570	Brazil	Sabino	SP	3544608	35
4571	Brazil	Sagres	SP	3544707	35
4572	Brazil	Sales	SP	3544806	35
4573	Brazil	Sales Oliveira	SP	3544905	35
4574	Brazil	Salesópolis	SP	3545001	35
4575	Brazil	Salmourão	SP	3545100	35
4576	Brazil	Saltinho	SP	3545159	35
4577	Brazil	Salto	SP	3545209	35
4578	Brazil	Salto de Pirapora	SP	3545308	35
4579	Brazil	Salto Grande	SP	3545407	35
4580	Brazil	Sandovalina	SP	3545506	35
4581	Brazil	Santa Adélia	SP	3545605	35
4582	Brazil	Santa Albertina	SP	3545704	35
4583	Brazil	Santa Bárbara d'Oeste	SP	3545803	35
4584	Brazil	Santa Branca	SP	3546009	35
4585	Brazil	Santa Clara d'Oeste	SP	3546108	35
4586	Brazil	Santa Cruz da Conceição	SP	3546207	35
4587	Brazil	Santa Cruz da Esperança	SP	3546256	35
4588	Brazil	Santa Cruz das Palmeiras	SP	3546306	35
4589	Brazil	Santa Cruz do Rio Pardo	SP	3546405	35
4590	Brazil	Santa Ernestina	SP	3546504	35
4591	Brazil	Santa Fé do Sul	SP	3546603	35
4592	Brazil	Santa Gertrudes	SP	3546702	35
4593	Brazil	Santa Isabel	SP	3546801	35
4594	Brazil	Santa Lúcia	SP	3546900	35
4595	Brazil	Santa Maria da Serra	SP	3547007	35
4596	Brazil	Santa Mercedes	SP	3547106	35
4597	Brazil	Santa Rita do Passa Quatro	SP	3547502	35
4598	Brazil	Santa Rita d'Oeste	SP	3547403	35
4599	Brazil	Santa Rosa de Viterbo	SP	3547601	35
4600	Brazil	Santa Salete	SP	3547650	35
4601	Brazil	Santana da Ponte Pensa	SP	3547205	35
4602	Brazil	Santana de Parnaíba	SP	3547304	35
4603	Brazil	Santo Anastácio	SP	3547700	35
4604	Brazil	Santo André	SP	3547809	35
4605	Brazil	Santo Antônio da Alegria	SP	3547908	35
4606	Brazil	Santo Antônio de Posse	SP	3548005	35
4607	Brazil	Santo Antônio do Aracanguá	SP	3548054	35
4608	Brazil	Santo Antônio do Jardim	SP	3548104	35
4609	Brazil	Santo Antônio do Pinhal	SP	3548203	35
4610	Brazil	Santo Expedito	SP	3548302	35
4611	Brazil	Santópolis do Aguapeí	SP	3548401	35
4612	Brazil	Santos	SP	3548500	35
4613	Brazil	São Bento do Sapucaí	SP	3548609	35
4614	Brazil	São Bernardo do Campo	SP	3548708	35
4615	Brazil	São Caetano do Sul	SP	3548807	35
4616	Brazil	São Carlos	SP	3548906	35
4617	Brazil	São Francisco	SP	3549003	35
4618	Brazil	São João da Boa Vista	SP	3549102	35
4619	Brazil	São João das Duas Pontes	SP	3549201	35
4620	Brazil	São João de Iracema	SP	3549250	35
4621	Brazil	São João do Pau d'Alho	SP	3549300	35
4622	Brazil	São Joaquim da Barra	SP	3549409	35
4623	Brazil	São José da Bela Vista	SP	3549508	35
4624	Brazil	São José do Barreiro	SP	3549607	35
4625	Brazil	São José do Rio Pardo	SP	3549706	35
4626	Brazil	São José do Rio Preto	SP	3549805	35
4627	Brazil	São José dos Campos	SP	3549904	35
4628	Brazil	São Lourenço da Serra	SP	3549953	35
4629	Brazil	São Luís do Paraitinga	SP	3550001	35
4630	Brazil	São Manuel	SP	3550100	35
4631	Brazil	São Miguel Arcanjo	SP	3550209	35
4632	Brazil	São Paulo	SP	3550308	35
4633	Brazil	São Pedro	SP	3550407	35
4634	Brazil	São Pedro do Turvo	SP	3550506	35
4635	Brazil	São Roque	SP	3550605	35
4636	Brazil	São Sebastião	SP	3550704	35
4637	Brazil	São Sebastião da Grama	SP	3550803	35
4638	Brazil	São Simão	SP	3550902	35
4639	Brazil	São Vicente	SP	3551009	35
4640	Brazil	Sarapuí	SP	3551108	35
4641	Brazil	Sarutaiá	SP	3551207	35
4642	Brazil	Sebastianópolis do Sul	SP	3551306	35
4643	Brazil	Serra Azul	SP	3551405	35
4644	Brazil	Serra Negra	SP	3551603	35
4645	Brazil	Serrana	SP	3551504	35
4646	Brazil	Sertãozinho	SP	3551702	35
4647	Brazil	Sete Barras	SP	3551801	35
4648	Brazil	Severínia	SP	3551900	35
4649	Brazil	Silveiras	SP	3552007	35
4650	Brazil	Socorro	SP	3552106	35
4651	Brazil	Sorocaba	SP	3552205	35
4652	Brazil	Sud Mennucci	SP	3552304	35
4653	Brazil	Sumaré	SP	3552403	35
4654	Brazil	Suzanápolis	SP	3552551	35
4655	Brazil	Suzano	SP	3552502	35
4656	Brazil	Tabapuã	SP	3552601	35
4657	Brazil	Tabatinga	SP	3552700	35
4658	Brazil	Taboão da Serra	SP	3552809	35
4659	Brazil	Taciba	SP	3552908	35
4660	Brazil	Taguaí	SP	3553005	35
4661	Brazil	Taiaçu	SP	3553104	35
4662	Brazil	Taiúva	SP	3553203	35
4663	Brazil	Tambaú	SP	3553302	35
4664	Brazil	Tanabi	SP	3553401	35
4665	Brazil	Tapiraí	SP	3553500	35
4666	Brazil	Tapiratiba	SP	3553609	35
4667	Brazil	Taquaral	SP	3553658	35
4668	Brazil	Taquaritinga	SP	3553708	35
4669	Brazil	Taquarituba	SP	3553807	35
4670	Brazil	Taquarivaí	SP	3553856	35
4671	Brazil	Tarabai	SP	3553906	35
4672	Brazil	Tarumã	SP	3553955	35
4673	Brazil	Tatuí	SP	3554003	35
4674	Brazil	Taubaté	SP	3554102	35
4675	Brazil	Tejupá	SP	3554201	35
4676	Brazil	Teodoro Sampaio	SP	3554300	35
4677	Brazil	Terra Roxa	SP	3554409	35
4678	Brazil	Tietê	SP	3554508	35
4679	Brazil	Timburi	SP	3554607	35
4680	Brazil	Torre de Pedra	SP	3554656	35
4681	Brazil	Torrinha	SP	3554706	35
4682	Brazil	Trabiju	SP	3554755	35
4683	Brazil	Tremembé	SP	3554805	35
4684	Brazil	Três Fronteiras	SP	3554904	35
4685	Brazil	Tuiuti	SP	3554953	35
4686	Brazil	Tupã	SP	3555000	35
4687	Brazil	Tupi Paulista	SP	3555109	35
4688	Brazil	Turiúba	SP	3555208	35
4689	Brazil	Turmalina	SP	3555307	35
4690	Brazil	Ubarana	SP	3555356	35
4691	Brazil	Ubatuba	SP	3555406	35
4692	Brazil	Ubirajara	SP	3555505	35
4693	Brazil	Uchoa	SP	3555604	35
4694	Brazil	União Paulista	SP	3555703	35
4695	Brazil	Urânia	SP	3555802	35
4696	Brazil	Uru	SP	3555901	35
4697	Brazil	Urupês	SP	3556008	35
4698	Brazil	Valentim Gentil	SP	3556107	35
4699	Brazil	Valinhos	SP	3556206	35
4700	Brazil	Valparaíso	SP	3556305	35
4701	Brazil	Vargem	SP	3556354	35
4702	Brazil	Vargem Grande do Sul	SP	3556404	35
4703	Brazil	Vargem Grande Paulista	SP	3556453	35
4704	Brazil	Várzea Paulista	SP	3556503	35
4705	Brazil	Vera Cruz	SP	3556602	35
4706	Brazil	Vinhedo	SP	3556701	35
4707	Brazil	Viradouro	SP	3556800	35
4708	Brazil	Vista Alegre do Alto	SP	3556909	35
4709	Brazil	Vitória Brasil	SP	3556958	35
4710	Brazil	Votorantim	SP	3557006	35
4711	Brazil	Votuporanga	SP	3557105	35
4712	Brazil	Zacarias	SP	3557154	35
4713	Brazil	Abadia dos Dourados	MG	3100104	31
4714	Brazil	Abaeté	MG	3100203	31
4715	Brazil	Abre Campo	MG	3100302	31
4716	Brazil	Acaiaca	MG	3100401	31
4717	Brazil	Açucena	MG	3100500	31
4718	Brazil	Água Boa	MG	3100609	31
4719	Brazil	Água Comprida	MG	3100708	31
4720	Brazil	Aguanil	MG	3100807	31
4721	Brazil	Águas Formosas	MG	3100906	31
4722	Brazil	Águas Vermelhas	MG	3101003	31
4723	Brazil	Aimorés	MG	3101102	31
4724	Brazil	Aiuruoca	MG	3101201	31
4725	Brazil	Alagoa	MG	3101300	31
4726	Brazil	Albertina	MG	3101409	31
4727	Brazil	Além Paraíba	MG	3101508	31
4728	Brazil	Alfenas	MG	3101607	31
4729	Brazil	Alfredo Vasconcelos	MG	3101631	31
4730	Brazil	Almenara	MG	3101706	31
4731	Brazil	Alpercata	MG	3101805	31
4732	Brazil	Alpinópolis	MG	3101904	31
4733	Brazil	Alterosa	MG	3102001	31
4734	Brazil	Alto Caparaó	MG	3102050	31
4735	Brazil	Alto Jequitibá	MG	3153509	31
4736	Brazil	Alto Rio Doce	MG	3102100	31
4737	Brazil	Alvarenga	MG	3102209	31
4738	Brazil	Alvinópolis	MG	3102308	31
4739	Brazil	Alvorada de Minas	MG	3102407	31
4740	Brazil	Amparo do Serra	MG	3102506	31
4741	Brazil	Andradas	MG	3102605	31
4742	Brazil	Andrelândia	MG	3102803	31
4743	Brazil	Angelândia	MG	3102852	31
4744	Brazil	Antônio Carlos	MG	3102902	31
4745	Brazil	Antônio Dias	MG	3103009	31
4746	Brazil	Antônio Prado de Minas	MG	3103108	31
4747	Brazil	Araçaí	MG	3103207	31
4748	Brazil	Aracitaba	MG	3103306	31
4749	Brazil	Araçuaí	MG	3103405	31
4750	Brazil	Araguari	MG	3103504	31
4751	Brazil	Arantina	MG	3103603	31
4752	Brazil	Araponga	MG	3103702	31
4753	Brazil	Araporã	MG	3103751	31
4754	Brazil	Arapuá	MG	3103801	31
4755	Brazil	Araújos	MG	3103900	31
4756	Brazil	Araxá	MG	3104007	31
4757	Brazil	Arceburgo	MG	3104106	31
4758	Brazil	Arcos	MG	3104205	31
4759	Brazil	Areado	MG	3104304	31
4760	Brazil	Argirita	MG	3104403	31
4761	Brazil	Aricanduva	MG	3104452	31
4762	Brazil	Arinos	MG	3104502	31
4763	Brazil	Astolfo Dutra	MG	3104601	31
4764	Brazil	Ataléia	MG	3104700	31
4765	Brazil	Augusto de Lima	MG	3104809	31
4766	Brazil	Baependi	MG	3104908	31
4767	Brazil	Baldim	MG	3105004	31
4768	Brazil	Bambuí	MG	3105103	31
4769	Brazil	Bandeira	MG	3105202	31
4770	Brazil	Bandeira do Sul	MG	3105301	31
4771	Brazil	Barão de Cocais	MG	3105400	31
4772	Brazil	Barão de Monte Alto	MG	3105509	31
4773	Brazil	Barbacena	MG	3105608	31
4774	Brazil	Barra Longa	MG	3105707	31
4775	Brazil	Barroso	MG	3105905	31
4776	Brazil	Bela Vista de Minas	MG	3106002	31
4777	Brazil	Belmiro Braga	MG	3106101	31
4778	Brazil	Belo Horizonte	MG	3106200	31
4779	Brazil	Belo Oriente	MG	3106309	31
4780	Brazil	Belo Vale	MG	3106408	31
4781	Brazil	Berilo	MG	3106507	31
4782	Brazil	Berizal	MG	3106655	31
4783	Brazil	Bertópolis	MG	3106606	31
4784	Brazil	Betim	MG	3106705	31
4785	Brazil	Bias Fortes	MG	3106804	31
4786	Brazil	Bicas	MG	3106903	31
4787	Brazil	Biquinhas	MG	3107000	31
4788	Brazil	Boa Esperança	MG	3107109	31
4789	Brazil	Bocaina de Minas	MG	3107208	31
4790	Brazil	Bocaiúva	MG	3107307	31
4791	Brazil	Bom Despacho	MG	3107406	31
4792	Brazil	Bom Jardim de Minas	MG	3107505	31
4793	Brazil	Bom Jesus da Penha	MG	3107604	31
4794	Brazil	Bom Jesus do Amparo	MG	3107703	31
4795	Brazil	Bom Jesus do Galho	MG	3107802	31
4796	Brazil	Bom Repouso	MG	3107901	31
4797	Brazil	Bom Sucesso	MG	3108008	31
4798	Brazil	Bonfim	MG	3108107	31
4799	Brazil	Bonfinópolis de Minas	MG	3108206	31
4800	Brazil	Bonito de Minas	MG	3108255	31
4801	Brazil	Borda da Mata	MG	3108305	31
4802	Brazil	Botelhos	MG	3108404	31
4803	Brazil	Botumirim	MG	3108503	31
4804	Brazil	Brás Pires	MG	3108701	31
4805	Brazil	Brasilândia de Minas	MG	3108552	31
4806	Brazil	Brasília de Minas	MG	3108602	31
4807	Brazil	Brasópolis	MG	3108909	31
4808	Brazil	Braúnas	MG	3108800	31
4809	Brazil	Brumadinho	MG	3109006	31
4810	Brazil	Bueno Brandão	MG	3109105	31
4811	Brazil	Buenópolis	MG	3109204	31
4812	Brazil	Bugre	MG	3109253	31
4813	Brazil	Buritis	MG	3109303	31
4814	Brazil	Buritizeiro	MG	3109402	31
4815	Brazil	Cabeceira Grande	MG	3109451	31
4816	Brazil	Cabo Verde	MG	3109501	31
4817	Brazil	Cachoeira da Prata	MG	3109600	31
4818	Brazil	Cachoeira de Minas	MG	3109709	31
4819	Brazil	Cachoeira de Pajeú	MG	3102704	31
4820	Brazil	Cachoeira Dourada	MG	3109808	31
4821	Brazil	Caetanópolis	MG	3109907	31
4822	Brazil	Caeté	MG	3110004	31
4823	Brazil	Caiana	MG	3110103	31
4824	Brazil	Cajuri	MG	3110202	31
4825	Brazil	Caldas	MG	3110301	31
4826	Brazil	Camacho	MG	3110400	31
4827	Brazil	Camanducaia	MG	3110509	31
4828	Brazil	Cambuí	MG	3110608	31
4829	Brazil	Cambuquira	MG	3110707	31
4830	Brazil	Campanário	MG	3110806	31
4831	Brazil	Campanha	MG	3110905	31
4832	Brazil	Campestre	MG	3111002	31
4833	Brazil	Campina Verde	MG	3111101	31
4834	Brazil	Campo Azul	MG	3111150	31
4835	Brazil	Campo Belo	MG	3111200	31
4836	Brazil	Campo do Meio	MG	3111309	31
4837	Brazil	Campo Florido	MG	3111408	31
4838	Brazil	Campos Altos	MG	3111507	31
4839	Brazil	Campos Gerais	MG	3111606	31
4840	Brazil	Cana Verde	MG	3111903	31
4841	Brazil	Canaã	MG	3111705	31
4842	Brazil	Canápolis	MG	3111804	31
4843	Brazil	Candeias	MG	3112000	31
4844	Brazil	Cantagalo	MG	3112059	31
4845	Brazil	Caparaó	MG	3112109	31
4846	Brazil	Capela Nova	MG	3112208	31
4847	Brazil	Capelinha	MG	3112307	31
4848	Brazil	Capetinga	MG	3112406	31
4849	Brazil	Capim Branco	MG	3112505	31
4850	Brazil	Capinópolis	MG	3112604	31
4851	Brazil	Capitão Andrade	MG	3112653	31
4852	Brazil	Capitão Enéas	MG	3112703	31
4853	Brazil	Capitólio	MG	3112802	31
4854	Brazil	Caputira	MG	3112901	31
4855	Brazil	Caraí	MG	3113008	31
4856	Brazil	Caranaíba	MG	3113107	31
4857	Brazil	Carandaí	MG	3113206	31
4858	Brazil	Carangola	MG	3113305	31
4859	Brazil	Caratinga	MG	3113404	31
4860	Brazil	Carbonita	MG	3113503	31
4861	Brazil	Careaçu	MG	3113602	31
4862	Brazil	Carlos Chagas	MG	3113701	31
4863	Brazil	Carmésia	MG	3113800	31
4864	Brazil	Carmo da Cachoeira	MG	3113909	31
4865	Brazil	Carmo da Mata	MG	3114006	31
4866	Brazil	Carmo de Minas	MG	3114105	31
4867	Brazil	Carmo do Cajuru	MG	3114204	31
4868	Brazil	Carmo do Paranaíba	MG	3114303	31
4869	Brazil	Carmo do Rio Claro	MG	3114402	31
4870	Brazil	Carmópolis de Minas	MG	3114501	31
4871	Brazil	Carneirinho	MG	3114550	31
4872	Brazil	Carrancas	MG	3114600	31
4873	Brazil	Carvalhópolis	MG	3114709	31
4874	Brazil	Carvalhos	MG	3114808	31
4875	Brazil	Casa Grande	MG	3114907	31
4876	Brazil	Cascalho Rico	MG	3115003	31
4877	Brazil	Cássia	MG	3115102	31
4878	Brazil	Cataguases	MG	3115300	31
4879	Brazil	Catas Altas	MG	3115359	31
4880	Brazil	Catas Altas da Noruega	MG	3115409	31
4881	Brazil	Catuji	MG	3115458	31
4882	Brazil	Catuti	MG	3115474	31
4883	Brazil	Caxambu	MG	3115508	31
4884	Brazil	Cedro do Abaeté	MG	3115607	31
4885	Brazil	Central de Minas	MG	3115706	31
4886	Brazil	Centralina	MG	3115805	31
4887	Brazil	Chácara	MG	3115904	31
4888	Brazil	Chalé	MG	3116001	31
4889	Brazil	Chapada do Norte	MG	3116100	31
4890	Brazil	Chapada Gaúcha	MG	3116159	31
4891	Brazil	Chiador	MG	3116209	31
4892	Brazil	Cipotânea	MG	3116308	31
4893	Brazil	Claraval	MG	3116407	31
4894	Brazil	Claro dos Poções	MG	3116506	31
4895	Brazil	Cláudio	MG	3116605	31
4896	Brazil	Coimbra	MG	3116704	31
4897	Brazil	Coluna	MG	3116803	31
4898	Brazil	Comendador Gomes	MG	3116902	31
4899	Brazil	Comercinho	MG	3117009	31
4900	Brazil	Conceição da Aparecida	MG	3117108	31
4901	Brazil	Conceição da Barra de Minas	MG	3115201	31
4902	Brazil	Conceição das Alagoas	MG	3117306	31
4903	Brazil	Conceição das Pedras	MG	3117207	31
4904	Brazil	Conceição de Ipanema	MG	3117405	31
4905	Brazil	Conceição do Mato Dentro	MG	3117504	31
4906	Brazil	Conceição do Pará	MG	3117603	31
4907	Brazil	Conceição do Rio Verde	MG	3117702	31
4908	Brazil	Conceição dos Ouros	MG	3117801	31
4909	Brazil	Cônego Marinho	MG	3117836	31
4910	Brazil	Confins	MG	3117876	31
4911	Brazil	Congonhal	MG	3117900	31
4912	Brazil	Congonhas	MG	3118007	31
4913	Brazil	Congonhas do Norte	MG	3118106	31
4914	Brazil	Conquista	MG	3118205	31
4915	Brazil	Conselheiro Lafaiete	MG	3118304	31
4916	Brazil	Conselheiro Pena	MG	3118403	31
4917	Brazil	Consolação	MG	3118502	31
4918	Brazil	Contagem	MG	3118601	31
4919	Brazil	Coqueiral	MG	3118700	31
4920	Brazil	Coração de Jesus	MG	3118809	31
4921	Brazil	Cordisburgo	MG	3118908	31
4922	Brazil	Cordislândia	MG	3119005	31
4923	Brazil	Corinto	MG	3119104	31
4924	Brazil	Coroaci	MG	3119203	31
4925	Brazil	Coromandel	MG	3119302	31
4926	Brazil	Coronel Fabriciano	MG	3119401	31
4927	Brazil	Coronel Murta	MG	3119500	31
4928	Brazil	Coronel Pacheco	MG	3119609	31
4929	Brazil	Coronel Xavier Chaves	MG	3119708	31
4930	Brazil	Córrego Danta	MG	3119807	31
4931	Brazil	Córrego do Bom Jesus	MG	3119906	31
4932	Brazil	Córrego Fundo	MG	3119955	31
4933	Brazil	Córrego Novo	MG	3120003	31
4934	Brazil	Couto de Magalhães de Minas	MG	3120102	31
4935	Brazil	Crisólita	MG	3120151	31
4936	Brazil	Cristais	MG	3120201	31
4937	Brazil	Cristália	MG	3120300	31
4938	Brazil	Cristiano Otoni	MG	3120409	31
4939	Brazil	Cristina	MG	3120508	31
4940	Brazil	Crucilândia	MG	3120607	31
4941	Brazil	Cruzeiro da Fortaleza	MG	3120706	31
4942	Brazil	Cruzília	MG	3120805	31
4943	Brazil	Cuparaque	MG	3120839	31
4944	Brazil	Curral de Dentro	MG	3120870	31
4945	Brazil	Curvelo	MG	3120904	31
4946	Brazil	Datas	MG	3121001	31
4947	Brazil	Delfim Moreira	MG	3121100	31
4948	Brazil	Delfinópolis	MG	3121209	31
4949	Brazil	Delta	MG	3121258	31
4950	Brazil	Descoberto	MG	3121308	31
4951	Brazil	Desterro de Entre Rios	MG	3121407	31
4952	Brazil	Desterro do Melo	MG	3121506	31
4953	Brazil	Diamantina	MG	3121605	31
4954	Brazil	Diogo de Vasconcelos	MG	3121704	31
4955	Brazil	Dionísio	MG	3121803	31
4956	Brazil	Divinésia	MG	3121902	31
4957	Brazil	Divino	MG	3122009	31
4958	Brazil	Divino das Laranjeiras	MG	3122108	31
4959	Brazil	Divinolândia de Minas	MG	3122207	31
4960	Brazil	Divinópolis	MG	3122306	31
4961	Brazil	Divisa Alegre	MG	3122355	31
4962	Brazil	Divisa Nova	MG	3122405	31
4963	Brazil	Divisópolis	MG	3122454	31
4964	Brazil	Dom Bosco	MG	3122470	31
4965	Brazil	Dom Cavati	MG	3122504	31
4966	Brazil	Dom Joaquim	MG	3122603	31
4967	Brazil	Dom Silvério	MG	3122702	31
4968	Brazil	Dom Viçoso	MG	3122801	31
4969	Brazil	Dona Eusébia	MG	3122900	31
4970	Brazil	Dores de Campos	MG	3123007	31
4971	Brazil	Dores de Guanhães	MG	3123106	31
4972	Brazil	Dores do Indaiá	MG	3123205	31
4973	Brazil	Dores do Turvo	MG	3123304	31
4974	Brazil	Doresópolis	MG	3123403	31
4975	Brazil	Douradoquara	MG	3123502	31
4976	Brazil	Durandé	MG	3123528	31
4977	Brazil	Elói Mendes	MG	3123601	31
4978	Brazil	Engenheiro Caldas	MG	3123700	31
4979	Brazil	Engenheiro Navarro	MG	3123809	31
4980	Brazil	Entre Folhas	MG	3123858	31
4981	Brazil	Entre Rios de Minas	MG	3123908	31
4982	Brazil	Ervália	MG	3124005	31
4983	Brazil	Esmeraldas	MG	3124104	31
4984	Brazil	Espera Feliz	MG	3124203	31
4985	Brazil	Espinosa	MG	3124302	31
4986	Brazil	Espírito Santo do Dourado	MG	3124401	31
4987	Brazil	Estiva	MG	3124500	31
4988	Brazil	Estrela Dalva	MG	3124609	31
4989	Brazil	Estrela do Indaiá	MG	3124708	31
4990	Brazil	Estrela do Sul	MG	3124807	31
4991	Brazil	Eugenópolis	MG	3124906	31
4992	Brazil	Ewbank da Câmara	MG	3125002	31
4993	Brazil	Extrema	MG	3125101	31
4994	Brazil	Fama	MG	3125200	31
4995	Brazil	Faria Lemos	MG	3125309	31
4996	Brazil	Felício dos Santos	MG	3125408	31
4997	Brazil	Felisburgo	MG	3125606	31
4998	Brazil	Felixlândia	MG	3125705	31
4999	Brazil	Fernandes Tourinho	MG	3125804	31
5000	Brazil	Ferros	MG	3125903	31
5001	Brazil	Fervedouro	MG	3125952	31
5002	Brazil	Florestal	MG	3126000	31
5003	Brazil	Formiga	MG	3126109	31
5004	Brazil	Formoso	MG	3126208	31
5005	Brazil	Fortaleza de Minas	MG	3126307	31
5006	Brazil	Fortuna de Minas	MG	3126406	31
5007	Brazil	Francisco Badaró	MG	3126505	31
5008	Brazil	Francisco Dumont	MG	3126604	31
5009	Brazil	Francisco Sá	MG	3126703	31
5010	Brazil	Franciscópolis	MG	3126752	31
5011	Brazil	Frei Gaspar	MG	3126802	31
5012	Brazil	Frei Inocêncio	MG	3126901	31
5013	Brazil	Frei Lagonegro	MG	3126950	31
5014	Brazil	Fronteira	MG	3127008	31
5015	Brazil	Fronteira dos Vales	MG	3127057	31
5016	Brazil	Fruta de Leite	MG	3127073	31
5017	Brazil	Frutal	MG	3127107	31
5018	Brazil	Funilândia	MG	3127206	31
5019	Brazil	Galiléia	MG	3127305	31
5020	Brazil	Gameleiras	MG	3127339	31
5021	Brazil	Glaucilândia	MG	3127354	31
5022	Brazil	Goiabeira	MG	3127370	31
5023	Brazil	Goianá	MG	3127388	31
5024	Brazil	Gonçalves	MG	3127404	31
5025	Brazil	Gonzaga	MG	3127503	31
5026	Brazil	Gouveia	MG	3127602	31
5027	Brazil	Governador Valadares	MG	3127701	31
5028	Brazil	Grão Mogol	MG	3127800	31
5029	Brazil	Grupiara	MG	3127909	31
5030	Brazil	Guanhães	MG	3128006	31
5031	Brazil	Guapé	MG	3128105	31
5032	Brazil	Guaraciaba	MG	3128204	31
5033	Brazil	Guaraciama	MG	3128253	31
5034	Brazil	Guaranésia	MG	3128303	31
5035	Brazil	Guarani	MG	3128402	31
5036	Brazil	Guarará	MG	3128501	31
5037	Brazil	Guarda-Mor	MG	3128600	31
5038	Brazil	Guaxupé	MG	3128709	31
5039	Brazil	Guidoval	MG	3128808	31
5040	Brazil	Guimarânia	MG	3128907	31
5041	Brazil	Guiricema	MG	3129004	31
5042	Brazil	Gurinhatã	MG	3129103	31
5043	Brazil	Heliodora	MG	3129202	31
5044	Brazil	Iapu	MG	3129301	31
5045	Brazil	Ibertioga	MG	3129400	31
5046	Brazil	Ibiá	MG	3129509	31
5047	Brazil	Ibiaí	MG	3129608	31
5048	Brazil	Ibiracatu	MG	3129657	31
5049	Brazil	Ibiraci	MG	3129707	31
5050	Brazil	Ibirité	MG	3129806	31
5051	Brazil	Ibitiúra de Minas	MG	3129905	31
5052	Brazil	Ibituruna	MG	3130002	31
5053	Brazil	Icaraí de Minas	MG	3130051	31
5054	Brazil	Igarapé	MG	3130101	31
5055	Brazil	Igaratinga	MG	3130200	31
5056	Brazil	Iguatama	MG	3130309	31
5057	Brazil	Ijaci	MG	3130408	31
5058	Brazil	Ilicínea	MG	3130507	31
5059	Brazil	Imbé de Minas	MG	3130556	31
5060	Brazil	Inconfidentes	MG	3130606	31
5061	Brazil	Indaiabira	MG	3130655	31
5062	Brazil	Indianópolis	MG	3130705	31
5063	Brazil	Ingaí	MG	3130804	31
5064	Brazil	Inhapim	MG	3130903	31
5065	Brazil	Inhaúma	MG	3131000	31
5066	Brazil	Inimutaba	MG	3131109	31
5067	Brazil	Ipaba	MG	3131158	31
5068	Brazil	Ipanema	MG	3131208	31
5069	Brazil	Ipatinga	MG	3131307	31
5070	Brazil	Ipiaçu	MG	3131406	31
5071	Brazil	Ipuiúna	MG	3131505	31
5072	Brazil	Iraí de Minas	MG	3131604	31
5073	Brazil	Itabira	MG	3131703	31
5074	Brazil	Itabirinha	MG	3131802	31
5075	Brazil	Itabirito	MG	3131901	31
5076	Brazil	Itacambira	MG	3132008	31
5077	Brazil	Itacarambi	MG	3132107	31
5078	Brazil	Itaguara	MG	3132206	31
5079	Brazil	Itaipé	MG	3132305	31
5080	Brazil	Itajubá	MG	3132404	31
5081	Brazil	Itamarandiba	MG	3132503	31
5082	Brazil	Itamarati de Minas	MG	3132602	31
5083	Brazil	Itambacuri	MG	3132701	31
5084	Brazil	Itambé do Mato Dentro	MG	3132800	31
5085	Brazil	Itamogi	MG	3132909	31
5086	Brazil	Itamonte	MG	3133006	31
5087	Brazil	Itanhandu	MG	3133105	31
5088	Brazil	Itanhomi	MG	3133204	31
5089	Brazil	Itaobim	MG	3133303	31
5090	Brazil	Itapagipe	MG	3133402	31
5091	Brazil	Itapecerica	MG	3133501	31
5092	Brazil	Itapeva	MG	3133600	31
5093	Brazil	Itatiaiuçu	MG	3133709	31
5094	Brazil	Itaú de Minas	MG	3133758	31
5095	Brazil	Itaúna	MG	3133808	31
5096	Brazil	Itaverava	MG	3133907	31
5097	Brazil	Itinga	MG	3134004	31
5098	Brazil	Itueta	MG	3134103	31
5099	Brazil	Ituiutaba	MG	3134202	31
5100	Brazil	Itumirim	MG	3134301	31
5101	Brazil	Iturama	MG	3134400	31
5102	Brazil	Itutinga	MG	3134509	31
5103	Brazil	Jaboticatubas	MG	3134608	31
5104	Brazil	Jacinto	MG	3134707	31
5105	Brazil	Jacuí	MG	3134806	31
5106	Brazil	Jacutinga	MG	3134905	31
5107	Brazil	Jaguaraçu	MG	3135001	31
5108	Brazil	Jaíba	MG	3135050	31
5109	Brazil	Jampruca	MG	3135076	31
5110	Brazil	Janaúba	MG	3135100	31
5111	Brazil	Januária	MG	3135209	31
5112	Brazil	Japaraíba	MG	3135308	31
5113	Brazil	Japonvar	MG	3135357	31
5114	Brazil	Jeceaba	MG	3135407	31
5115	Brazil	Jenipapo de Minas	MG	3135456	31
5116	Brazil	Jequeri	MG	3135506	31
5117	Brazil	Jequitaí	MG	3135605	31
5118	Brazil	Jequitibá	MG	3135704	31
5119	Brazil	Jequitinhonha	MG	3135803	31
5120	Brazil	Jesuânia	MG	3135902	31
5121	Brazil	Joaíma	MG	3136009	31
5122	Brazil	Joanésia	MG	3136108	31
5123	Brazil	João Monlevade	MG	3136207	31
5124	Brazil	João Pinheiro	MG	3136306	31
5125	Brazil	Joaquim Felício	MG	3136405	31
5126	Brazil	Jordânia	MG	3136504	31
5127	Brazil	José Gonçalves de Minas	MG	3136520	31
5128	Brazil	José Raydan	MG	3136553	31
5129	Brazil	Josenópolis	MG	3136579	31
5130	Brazil	Juatuba	MG	3136652	31
5131	Brazil	Juiz de Fora	MG	3136702	31
5132	Brazil	Juramento	MG	3136801	31
5133	Brazil	Juruaia	MG	3136900	31
5134	Brazil	Juvenília	MG	3136959	31
5135	Brazil	Ladainha	MG	3137007	31
5136	Brazil	Lagamar	MG	3137106	31
5137	Brazil	Lagoa da Prata	MG	3137205	31
5138	Brazil	Lagoa dos Patos	MG	3137304	31
5139	Brazil	Lagoa Dourada	MG	3137403	31
5140	Brazil	Lagoa Formosa	MG	3137502	31
5141	Brazil	Lagoa Grande	MG	3137536	31
5142	Brazil	Lagoa Santa	MG	3137601	31
5143	Brazil	Lajinha	MG	3137700	31
5144	Brazil	Lambari	MG	3137809	31
5145	Brazil	Lamim	MG	3137908	31
5146	Brazil	Laranjal	MG	3138005	31
5147	Brazil	Lassance	MG	3138104	31
5148	Brazil	Lavras	MG	3138203	31
5149	Brazil	Leandro Ferreira	MG	3138302	31
5150	Brazil	Leme do Prado	MG	3138351	31
5151	Brazil	Leopoldina	MG	3138401	31
5152	Brazil	Liberdade	MG	3138500	31
5153	Brazil	Lima Duarte	MG	3138609	31
5154	Brazil	Limeira do Oeste	MG	3138625	31
5155	Brazil	Lontra	MG	3138658	31
5156	Brazil	Luisburgo	MG	3138674	31
5157	Brazil	Luislândia	MG	3138682	31
5158	Brazil	Luminárias	MG	3138708	31
5159	Brazil	Luz	MG	3138807	31
5160	Brazil	Machacalis	MG	3138906	31
5161	Brazil	Machado	MG	3139003	31
5162	Brazil	Madre de Deus de Minas	MG	3139102	31
5163	Brazil	Malacacheta	MG	3139201	31
5164	Brazil	Mamonas	MG	3139250	31
5165	Brazil	Manga	MG	3139300	31
5166	Brazil	Manhuaçu	MG	3139409	31
5167	Brazil	Manhumirim	MG	3139508	31
5168	Brazil	Mantena	MG	3139607	31
5169	Brazil	Mar de Espanha	MG	3139805	31
5170	Brazil	Maravilhas	MG	3139706	31
5171	Brazil	Maria da Fé	MG	3139904	31
5172	Brazil	Mariana	MG	3140001	31
5173	Brazil	Marilac	MG	3140100	31
5174	Brazil	Mário Campos	MG	3140159	31
5175	Brazil	Maripá de Minas	MG	3140209	31
5176	Brazil	Marliéria	MG	3140308	31
5177	Brazil	Marmelópolis	MG	3140407	31
5178	Brazil	Martinho Campos	MG	3140506	31
5179	Brazil	Martins Soares	MG	3140530	31
5180	Brazil	Mata Verde	MG	3140555	31
5181	Brazil	Materlândia	MG	3140605	31
5182	Brazil	Mateus Leme	MG	3140704	31
5183	Brazil	Mathias Lobato	MG	3171501	31
5184	Brazil	Matias Barbosa	MG	3140803	31
5185	Brazil	Matias Cardoso	MG	3140852	31
5186	Brazil	Matipó	MG	3140902	31
5187	Brazil	Mato Verde	MG	3141009	31
5188	Brazil	Matozinhos	MG	3141108	31
5189	Brazil	Matutina	MG	3141207	31
5190	Brazil	Medeiros	MG	3141306	31
5191	Brazil	Medina	MG	3141405	31
5192	Brazil	Mendes Pimentel	MG	3141504	31
5193	Brazil	Mercês	MG	3141603	31
5194	Brazil	Mesquita	MG	3141702	31
5195	Brazil	Minas Novas	MG	3141801	31
5196	Brazil	Minduri	MG	3141900	31
5197	Brazil	Mirabela	MG	3142007	31
5198	Brazil	Miradouro	MG	3142106	31
5199	Brazil	Miraí	MG	3142205	31
5200	Brazil	Miravânia	MG	3142254	31
5201	Brazil	Moeda	MG	3142304	31
5202	Brazil	Moema	MG	3142403	31
5203	Brazil	Monjolos	MG	3142502	31
5204	Brazil	Monsenhor Paulo	MG	3142601	31
5205	Brazil	Montalvânia	MG	3142700	31
5206	Brazil	Monte Alegre de Minas	MG	3142809	31
5207	Brazil	Monte Azul	MG	3142908	31
5208	Brazil	Monte Belo	MG	3143005	31
5209	Brazil	Monte Carmelo	MG	3143104	31
5210	Brazil	Monte Formoso	MG	3143153	31
5211	Brazil	Monte Santo de Minas	MG	3143203	31
5212	Brazil	Monte Sião	MG	3143401	31
5213	Brazil	Montes Claros	MG	3143302	31
5214	Brazil	Montezuma	MG	3143450	31
5215	Brazil	Morada Nova de Minas	MG	3143500	31
5216	Brazil	Morro da Garça	MG	3143609	31
5217	Brazil	Morro do Pilar	MG	3143708	31
5218	Brazil	Munhoz	MG	3143807	31
5219	Brazil	Muriaé	MG	3143906	31
5220	Brazil	Mutum	MG	3144003	31
5221	Brazil	Muzambinho	MG	3144102	31
5222	Brazil	Nacip Raydan	MG	3144201	31
5223	Brazil	Nanuque	MG	3144300	31
5224	Brazil	Naque	MG	3144359	31
5225	Brazil	Natalândia	MG	3144375	31
5226	Brazil	Natércia	MG	3144409	31
5227	Brazil	Nazareno	MG	3144508	31
5228	Brazil	Nepomuceno	MG	3144607	31
5229	Brazil	Ninheira	MG	3144656	31
5230	Brazil	Nova Belém	MG	3144672	31
5231	Brazil	Nova Era	MG	3144706	31
5232	Brazil	Nova Lima	MG	3144805	31
5233	Brazil	Nova Módica	MG	3144904	31
5234	Brazil	Nova Ponte	MG	3145000	31
5235	Brazil	Nova Porteirinha	MG	3145059	31
5236	Brazil	Nova Resende	MG	3145109	31
5237	Brazil	Nova Serrana	MG	3145208	31
5238	Brazil	Nova União	MG	3136603	31
5239	Brazil	Novo Cruzeiro	MG	3145307	31
5240	Brazil	Novo Oriente de Minas	MG	3145356	31
5241	Brazil	Novorizonte	MG	3145372	31
5242	Brazil	Olaria	MG	3145406	31
5243	Brazil	Olhos-d'Água	MG	3145455	31
5244	Brazil	Olímpio Noronha	MG	3145505	31
5245	Brazil	Oliveira	MG	3145604	31
5246	Brazil	Oliveira Fortes	MG	3145703	31
5247	Brazil	Onça de Pitangui	MG	3145802	31
5248	Brazil	Oratórios	MG	3145851	31
5249	Brazil	Orizânia	MG	3145877	31
5250	Brazil	Ouro Branco	MG	3145901	31
5251	Brazil	Ouro Fino	MG	3146008	31
5252	Brazil	Ouro Preto	MG	3146107	31
5253	Brazil	Ouro Verde de Minas	MG	3146206	31
5254	Brazil	Padre Carvalho	MG	3146255	31
5255	Brazil	Padre Paraíso	MG	3146305	31
5256	Brazil	Pai Pedro	MG	3146552	31
5257	Brazil	Paineiras	MG	3146404	31
5258	Brazil	Pains	MG	3146503	31
5259	Brazil	Paiva	MG	3146602	31
5260	Brazil	Palma	MG	3146701	31
5261	Brazil	Palmópolis	MG	3146750	31
5262	Brazil	Papagaios	MG	3146909	31
5263	Brazil	Pará de Minas	MG	3147105	31
5264	Brazil	Paracatu	MG	3147006	31
5265	Brazil	Paraguaçu	MG	3147204	31
5266	Brazil	Paraisópolis	MG	3147303	31
5267	Brazil	Paraopeba	MG	3147402	31
5268	Brazil	Passa Quatro	MG	3147600	31
5269	Brazil	Passa Tempo	MG	3147709	31
5270	Brazil	Passabém	MG	3147501	31
5271	Brazil	Passa-Vinte	MG	3147808	31
5272	Brazil	Passos	MG	3147907	31
5273	Brazil	Patis	MG	3147956	31
5274	Brazil	Patos de Minas	MG	3148004	31
5275	Brazil	Patrocínio	MG	3148103	31
5276	Brazil	Patrocínio do Muriaé	MG	3148202	31
5277	Brazil	Paula Cândido	MG	3148301	31
5278	Brazil	Paulistas	MG	3148400	31
5279	Brazil	Pavão	MG	3148509	31
5280	Brazil	Peçanha	MG	3148608	31
5281	Brazil	Pedra Azul	MG	3148707	31
5282	Brazil	Pedra Bonita	MG	3148756	31
5283	Brazil	Pedra do Anta	MG	3148806	31
5284	Brazil	Pedra do Indaiá	MG	3148905	31
5285	Brazil	Pedra Dourada	MG	3149002	31
5286	Brazil	Pedralva	MG	3149101	31
5287	Brazil	Pedras de Maria da Cruz	MG	3149150	31
5288	Brazil	Pedrinópolis	MG	3149200	31
5289	Brazil	Pedro Leopoldo	MG	3149309	31
5290	Brazil	Pedro Teixeira	MG	3149408	31
5291	Brazil	Pequeri	MG	3149507	31
5292	Brazil	Pequi	MG	3149606	31
5293	Brazil	Perdigão	MG	3149705	31
5294	Brazil	Perdizes	MG	3149804	31
5295	Brazil	Perdões	MG	3149903	31
5296	Brazil	Periquito	MG	3149952	31
5297	Brazil	Pescador	MG	3150000	31
5298	Brazil	Piau	MG	3150109	31
5299	Brazil	Piedade de Caratinga	MG	3150158	31
5300	Brazil	Piedade de Ponte Nova	MG	3150208	31
5301	Brazil	Piedade do Rio Grande	MG	3150307	31
5302	Brazil	Piedade dos Gerais	MG	3150406	31
5303	Brazil	Pimenta	MG	3150505	31
5304	Brazil	Pingo-d'Água	MG	3150539	31
5305	Brazil	Pintópolis	MG	3150570	31
5306	Brazil	Piracema	MG	3150604	31
5307	Brazil	Pirajuba	MG	3150703	31
5308	Brazil	Piranga	MG	3150802	31
5309	Brazil	Piranguçu	MG	3150901	31
5310	Brazil	Piranguinho	MG	3151008	31
5311	Brazil	Pirapetinga	MG	3151107	31
5312	Brazil	Pirapora	MG	3151206	31
5313	Brazil	Piraúba	MG	3151305	31
5314	Brazil	Pitangui	MG	3151404	31
5315	Brazil	Piumhi	MG	3151503	31
5316	Brazil	Planura	MG	3151602	31
5317	Brazil	Poço Fundo	MG	3151701	31
5318	Brazil	Poços de Caldas	MG	3151800	31
5319	Brazil	Pocrane	MG	3151909	31
5320	Brazil	Pompéu	MG	3152006	31
5321	Brazil	Ponte Nova	MG	3152105	31
5322	Brazil	Ponto Chique	MG	3152131	31
5323	Brazil	Ponto dos Volantes	MG	3152170	31
5324	Brazil	Porteirinha	MG	3152204	31
5325	Brazil	Porto Firme	MG	3152303	31
5326	Brazil	Poté	MG	3152402	31
5327	Brazil	Pouso Alegre	MG	3152501	31
5328	Brazil	Pouso Alto	MG	3152600	31
5329	Brazil	Prados	MG	3152709	31
5330	Brazil	Prata	MG	3152808	31
5331	Brazil	Pratápolis	MG	3152907	31
5332	Brazil	Pratinha	MG	3153004	31
5333	Brazil	Presidente Bernardes	MG	3153103	31
5334	Brazil	Presidente Juscelino	MG	3153202	31
5335	Brazil	Presidente Kubitschek	MG	3153301	31
5336	Brazil	Presidente Olegário	MG	3153400	31
5337	Brazil	Prudente de Morais	MG	3153608	31
5338	Brazil	Quartel Geral	MG	3153707	31
5339	Brazil	Queluzito	MG	3153806	31
5340	Brazil	Raposos	MG	3153905	31
5341	Brazil	Raul Soares	MG	3154002	31
5342	Brazil	Recreio	MG	3154101	31
5343	Brazil	Reduto	MG	3154150	31
5344	Brazil	Resende Costa	MG	3154200	31
5345	Brazil	Resplendor	MG	3154309	31
5346	Brazil	Ressaquinha	MG	3154408	31
5347	Brazil	Riachinho	MG	3154457	31
5348	Brazil	Riacho dos Machados	MG	3154507	31
5349	Brazil	Ribeirão das Neves	MG	3154606	31
5350	Brazil	Ribeirão Vermelho	MG	3154705	31
5351	Brazil	Rio Acima	MG	3154804	31
5352	Brazil	Rio Casca	MG	3154903	31
5353	Brazil	Rio do Prado	MG	3155108	31
5354	Brazil	Rio Doce	MG	3155009	31
5355	Brazil	Rio Espera	MG	3155207	31
5356	Brazil	Rio Manso	MG	3155306	31
5357	Brazil	Rio Novo	MG	3155405	31
5358	Brazil	Rio Paranaíba	MG	3155504	31
5359	Brazil	Rio Pardo de Minas	MG	3155603	31
5360	Brazil	Rio Piracicaba	MG	3155702	31
5361	Brazil	Rio Pomba	MG	3155801	31
5362	Brazil	Rio Preto	MG	3155900	31
5363	Brazil	Rio Vermelho	MG	3156007	31
5364	Brazil	Ritápolis	MG	3156106	31
5365	Brazil	Rochedo de Minas	MG	3156205	31
5366	Brazil	Rodeiro	MG	3156304	31
5367	Brazil	Romaria	MG	3156403	31
5368	Brazil	Rosário da Limeira	MG	3156452	31
5369	Brazil	Rubelita	MG	3156502	31
5370	Brazil	Rubim	MG	3156601	31
5371	Brazil	Sabará	MG	3156700	31
5372	Brazil	Sabinópolis	MG	3156809	31
5373	Brazil	Sacramento	MG	3156908	31
5374	Brazil	Salinas	MG	3157005	31
5375	Brazil	Salto da Divisa	MG	3157104	31
5376	Brazil	Santa Bárbara	MG	3157203	31
5377	Brazil	Santa Bárbara do Leste	MG	3157252	31
5378	Brazil	Santa Bárbara do Monte Verde	MG	3157278	31
5379	Brazil	Santa Bárbara do Tugúrio	MG	3157302	31
5380	Brazil	Santa Cruz de Minas	MG	3157336	31
5381	Brazil	Santa Cruz de Salinas	MG	3157377	31
5382	Brazil	Santa Cruz do Escalvado	MG	3157401	31
5383	Brazil	Santa Efigênia de Minas	MG	3157500	31
5384	Brazil	Santa Fé de Minas	MG	3157609	31
5385	Brazil	Santa Helena de Minas	MG	3157658	31
5386	Brazil	Santa Juliana	MG	3157708	31
5387	Brazil	Santa Luzia	MG	3157807	31
5388	Brazil	Santa Margarida	MG	3157906	31
5389	Brazil	Santa Maria de Itabira	MG	3158003	31
5390	Brazil	Santa Maria do Salto	MG	3158102	31
5391	Brazil	Santa Maria do Suaçuí	MG	3158201	31
5392	Brazil	Santa Rita de Caldas	MG	3159209	31
5393	Brazil	Santa Rita de Ibitipoca	MG	3159407	31
5394	Brazil	Santa Rita de Jacutinga	MG	3159308	31
5395	Brazil	Santa Rita de Minas	MG	3159357	31
5396	Brazil	Santa Rita do Itueto	MG	3159506	31
5397	Brazil	Santa Rita do Sapucaí	MG	3159605	31
5398	Brazil	Santa Rosa da Serra	MG	3159704	31
5399	Brazil	Santa Vitória	MG	3159803	31
5400	Brazil	Santana da Vargem	MG	3158300	31
5401	Brazil	Santana de Cataguases	MG	3158409	31
5402	Brazil	Santana de Pirapama	MG	3158508	31
5403	Brazil	Santana do Deserto	MG	3158607	31
5404	Brazil	Santana do Garambéu	MG	3158706	31
5405	Brazil	Santana do Jacaré	MG	3158805	31
5406	Brazil	Santana do Manhuaçu	MG	3158904	31
5407	Brazil	Santana do Paraíso	MG	3158953	31
5408	Brazil	Santana do Riacho	MG	3159001	31
5409	Brazil	Santana dos Montes	MG	3159100	31
5410	Brazil	Santo Antônio do Amparo	MG	3159902	31
5411	Brazil	Santo Antônio do Aventureiro	MG	3160009	31
5412	Brazil	Santo Antônio do Grama	MG	3160108	31
5413	Brazil	Santo Antônio do Itambé	MG	3160207	31
5414	Brazil	Santo Antônio do Jacinto	MG	3160306	31
5415	Brazil	Santo Antônio do Monte	MG	3160405	31
5416	Brazil	Santo Antônio do Retiro	MG	3160454	31
5417	Brazil	Santo Antônio do Rio Abaixo	MG	3160504	31
5418	Brazil	Santo Hipólito	MG	3160603	31
5419	Brazil	Santos Dumont	MG	3160702	31
5420	Brazil	São Bento Abade	MG	3160801	31
5421	Brazil	São Brás do Suaçuí	MG	3160900	31
5422	Brazil	São Domingos das Dores	MG	3160959	31
5423	Brazil	São Domingos do Prata	MG	3161007	31
5424	Brazil	São Félix de Minas	MG	3161056	31
5425	Brazil	São Francisco	MG	3161106	31
5426	Brazil	São Francisco de Paula	MG	3161205	31
5427	Brazil	São Francisco de Sales	MG	3161304	31
5428	Brazil	São Francisco do Glória	MG	3161403	31
5429	Brazil	São Geraldo	MG	3161502	31
5430	Brazil	São Geraldo da Piedade	MG	3161601	31
5431	Brazil	São Geraldo do Baixio	MG	3161650	31
5432	Brazil	São Gonçalo do Abaeté	MG	3161700	31
5433	Brazil	São Gonçalo do Pará	MG	3161809	31
5434	Brazil	São Gonçalo do Rio Abaixo	MG	3161908	31
5435	Brazil	São Gonçalo do Rio Preto	MG	3125507	31
5436	Brazil	São Gonçalo do Sapucaí	MG	3162005	31
5437	Brazil	São Gotardo	MG	3162104	31
5438	Brazil	São João Batista do Glória	MG	3162203	31
5439	Brazil	São João da Lagoa	MG	3162252	31
5440	Brazil	São João da Mata	MG	3162302	31
5441	Brazil	São João da Ponte	MG	3162401	31
5442	Brazil	São João das Missões	MG	3162450	31
5443	Brazil	São João del Rei	MG	3162500	31
5444	Brazil	São João do Manhuaçu	MG	3162559	31
5445	Brazil	São João do Manteninha	MG	3162575	31
5446	Brazil	São João do Oriente	MG	3162609	31
5447	Brazil	São João do Pacuí	MG	3162658	31
5448	Brazil	São João do Paraíso	MG	3162708	31
5449	Brazil	São João Evangelista	MG	3162807	31
5450	Brazil	São João Nepomuceno	MG	3162906	31
5451	Brazil	São Joaquim de Bicas	MG	3162922	31
5452	Brazil	São José da Barra	MG	3162948	31
5453	Brazil	São José da Lapa	MG	3162955	31
5454	Brazil	São José da Safira	MG	3163003	31
5455	Brazil	São José da Varginha	MG	3163102	31
5456	Brazil	São José do Alegre	MG	3163201	31
5457	Brazil	São José do Divino	MG	3163300	31
5458	Brazil	São José do Goiabal	MG	3163409	31
5459	Brazil	São José do Jacuri	MG	3163508	31
5460	Brazil	São José do Mantimento	MG	3163607	31
5461	Brazil	São Lourenço	MG	3163706	31
5462	Brazil	São Miguel do Anta	MG	3163805	31
5463	Brazil	São Pedro da União	MG	3163904	31
5464	Brazil	São Pedro do Suaçuí	MG	3164100	31
5465	Brazil	São Pedro dos Ferros	MG	3164001	31
5466	Brazil	São Romão	MG	3164209	31
5467	Brazil	São Roque de Minas	MG	3164308	31
5468	Brazil	São Sebastião da Bela Vista	MG	3164407	31
5469	Brazil	São Sebastião da Vargem Alegre	MG	3164431	31
5470	Brazil	São Sebastião do Anta	MG	3164472	31
5471	Brazil	São Sebastião do Maranhão	MG	3164506	31
5472	Brazil	São Sebastião do Oeste	MG	3164605	31
5473	Brazil	São Sebastião do Paraíso	MG	3164704	31
5474	Brazil	São Sebastião do Rio Preto	MG	3164803	31
5475	Brazil	São Sebastião do Rio Verde	MG	3164902	31
5476	Brazil	São Thomé das Letras	MG	3165206	31
5477	Brazil	São Tiago	MG	3165008	31
5478	Brazil	São Tomás de Aquino	MG	3165107	31
5479	Brazil	São Vicente de Minas	MG	3165305	31
5480	Brazil	Sapucaí-Mirim	MG	3165404	31
5481	Brazil	Sardoá	MG	3165503	31
5482	Brazil	Sarzedo	MG	3165537	31
5483	Brazil	Sem-Peixe	MG	3165560	31
5484	Brazil	Senador Amaral	MG	3165578	31
5485	Brazil	Senador Cortes	MG	3165602	31
5486	Brazil	Senador Firmino	MG	3165701	31
5487	Brazil	Senador José Bento	MG	3165800	31
5488	Brazil	Senador Modestino Gonçalves	MG	3165909	31
5489	Brazil	Senhora de Oliveira	MG	3166006	31
5490	Brazil	Senhora do Porto	MG	3166105	31
5491	Brazil	Senhora dos Remédios	MG	3166204	31
5492	Brazil	Sericita	MG	3166303	31
5493	Brazil	Seritinga	MG	3166402	31
5494	Brazil	Serra Azul de Minas	MG	3166501	31
5495	Brazil	Serra da Saudade	MG	3166600	31
5496	Brazil	Serra do Salitre	MG	3166808	31
5497	Brazil	Serra dos Aimorés	MG	3166709	31
5498	Brazil	Serrania	MG	3166907	31
5499	Brazil	Serranópolis de Minas	MG	3166956	31
5500	Brazil	Serranos	MG	3167004	31
5501	Brazil	Serro	MG	3167103	31
5502	Brazil	Sete Lagoas	MG	3167202	31
5503	Brazil	Setubinha	MG	3165552	31
5504	Brazil	Silveirânia	MG	3167301	31
5505	Brazil	Silvianópolis	MG	3167400	31
5506	Brazil	Simão Pereira	MG	3167509	31
5507	Brazil	Simonésia	MG	3167608	31
5508	Brazil	Sobrália	MG	3167707	31
5509	Brazil	Soledade de Minas	MG	3167806	31
5510	Brazil	Tabuleiro	MG	3167905	31
5511	Brazil	Taiobeiras	MG	3168002	31
5512	Brazil	Taparuba	MG	3168051	31
5513	Brazil	Tapira	MG	3168101	31
5514	Brazil	Tapiraí	MG	3168200	31
5515	Brazil	Taquaraçu de Minas	MG	3168309	31
5516	Brazil	Tarumirim	MG	3168408	31
5517	Brazil	Teixeiras	MG	3168507	31
5518	Brazil	Teófilo Otoni	MG	3168606	31
5519	Brazil	Timóteo	MG	3168705	31
5520	Brazil	Tiradentes	MG	3168804	31
5521	Brazil	Tiros	MG	3168903	31
5522	Brazil	Tocantins	MG	3169000	31
5523	Brazil	Tocos do Moji	MG	3169059	31
5524	Brazil	Toledo	MG	3169109	31
5525	Brazil	Tombos	MG	3169208	31
5526	Brazil	Três Corações	MG	3169307	31
5527	Brazil	Três Marias	MG	3169356	31
5528	Brazil	Três Pontas	MG	3169406	31
5529	Brazil	Tumiritinga	MG	3169505	31
5530	Brazil	Tupaciguara	MG	3169604	31
5531	Brazil	Turmalina	MG	3169703	31
5532	Brazil	Turvolândia	MG	3169802	31
5533	Brazil	Ubá	MG	3169901	31
5534	Brazil	Ubaí	MG	3170008	31
5535	Brazil	Ubaporanga	MG	3170057	31
5536	Brazil	Uberaba	MG	3170107	31
5537	Brazil	Uberlândia	MG	3170206	31
5538	Brazil	Umburatiba	MG	3170305	31
5539	Brazil	Unaí	MG	3170404	31
5540	Brazil	União de Minas	MG	3170438	31
5541	Brazil	Uruana de Minas	MG	3170479	31
5542	Brazil	Urucânia	MG	3170503	31
5543	Brazil	Urucuia	MG	3170529	31
5544	Brazil	Vargem Alegre	MG	3170578	31
5545	Brazil	Vargem Bonita	MG	3170602	31
5546	Brazil	Vargem Grande do Rio Pardo	MG	3170651	31
5547	Brazil	Varginha	MG	3170701	31
5548	Brazil	Varjão de Minas	MG	3170750	31
5549	Brazil	Várzea da Palma	MG	3170800	31
5550	Brazil	Varzelândia	MG	3170909	31
5551	Brazil	Vazante	MG	3171006	31
5552	Brazil	Verdelândia	MG	3171030	31
5553	Brazil	Veredinha	MG	3171071	31
5554	Brazil	Veríssimo	MG	3171105	31
5555	Brazil	Vermelho Novo	MG	3171154	31
5556	Brazil	Vespasiano	MG	3171204	31
5557	Brazil	Viçosa	MG	3171303	31
5558	Brazil	Vieiras	MG	3171402	31
5559	Brazil	Virgem da Lapa	MG	3171600	31
5560	Brazil	Virgínia	MG	3171709	31
5561	Brazil	Virginópolis	MG	3171808	31
5562	Brazil	Virgolândia	MG	3171907	31
5563	Brazil	Visconde do Rio Branco	MG	3172004	31
5564	Brazil	Volta Grande	MG	3172103	31
5565	Brazil	Wenceslau Braz	MG	3172202	31
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (id, te_id, status, days_late, credit_limit, salary, person_id, category_id) FROM stdin;
0fa3001d-7f1a-11ed-b540-cdedf83415da	300	solvent	0	0.00	0.00	0fa3001a-7f1a-11ed-b540-cdedf83415da	\N
0fa30021-7f1a-11ed-b540-cdedf83415da	304	solvent	0	0.00	0.00	0fa3001e-7f1a-11ed-b540-cdedf83415da	\N
0fa30025-7f1a-11ed-b540-cdedf83415da	308	solvent	0	0.00	0.00	0fa30022-7f1a-11ed-b540-cdedf83415da	\N
0fa30029-7f1a-11ed-b540-cdedf83415da	312	solvent	0	0.00	0.00	0fa30026-7f1a-11ed-b540-cdedf83415da	\N
7dbd70e0-7fa2-11ed-a8e6-7bb31e5c53d9	656	solvent	0	5000.00	2000.00	7dbd70de-7fa2-11ed-a8e6-7bb31e5c53d9	\N
\.


--
-- Data for Name: client_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_category (id, te_id, name, max_discount) FROM stdin;
\.


--
-- Data for Name: client_category_price; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_category_price (id, te_id, sellable_id, category_id, price, max_discount, commission) FROM stdin;
\.


--
-- Data for Name: client_salary_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_salary_history (id, te_id, date, new_salary, old_salary, user_id, client_id) FROM stdin;
e81bfa36-7fa2-11ed-a8e6-7bb31e5c53d9	659	2022-12-19 00:00:00	2000.00	0.00	0f6aad06-7f1a-11ed-b540-cdedf83415da	7dbd70e0-7fa2-11ed-a8e6-7bb31e5c53d9
\.


--
-- Data for Name: commission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.commission (id, te_id, value, commission_type, sale_id, payment_id) FROM stdin;
0ffa6bdb-7f1a-11ed-b540-cdedf83415da	476	60.95	0	0ffa6bc2-7f1a-11ed-b540-cdedf83415da	0ffa6bd2-7f1a-11ed-b540-cdedf83415da
5cef918d-8878-11ed-b1d8-c16b6db879be	768	25.21	1	13855b3c-8878-11ed-b1d8-c16b6db879be	310b4dea-8878-11ed-b1d8-c16b6db879be
5235a616-8912-11ed-b1d8-c16b6db879be	815	0.00	1	1b57c09e-8912-11ed-b1d8-c16b6db879be	3ee68084-8912-11ed-b1d8-c16b6db879be
e8c4220a-8a05-11ed-b1d8-c16b6db879be	915	25.04	0	e1f36d54-8a05-11ed-b1d8-c16b6db879be	e8c42202-8a05-11ed-b1d8-c16b6db879be
\.


--
-- Data for Name: commission_source; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.commission_source (id, te_id, direct_value, installments_value, category_id, sellable_id) FROM stdin;
0fb112eb-7f1a-11ed-b540-cdedf83415da	315	15.00	28.00	0fb112ea-7f1a-11ed-b540-cdedf83415da	\N
0fb112f9-7f1a-11ed-b540-cdedf83415da	333	10.00	12.00	0fb112f8-7f1a-11ed-b540-cdedf83415da	\N
0fb112fe-7f1a-11ed-b540-cdedf83415da	340	10.00	23.00	0fb112fd-7f1a-11ed-b540-cdedf83415da	\N
0fb11303-7f1a-11ed-b540-cdedf83415da	347	27.00	12.00	0fb11302-7f1a-11ed-b540-cdedf83415da	\N
0fb1130b-7f1a-11ed-b540-cdedf83415da	359	25.00	35.00	0fb1130a-7f1a-11ed-b540-cdedf83415da	\N
0fb11310-7f1a-11ed-b540-cdedf83415da	366	23.00	25.00	0fb1130f-7f1a-11ed-b540-cdedf83415da	\N
0fb11318-7f1a-11ed-b540-cdedf83415da	378	25.00	15.00	0fb11317-7f1a-11ed-b540-cdedf83415da	\N
6239b03e-8911-11ed-b1d8-c16b6db879be	780	0.00	0.00	59274812-8911-11ed-b1d8-c16b6db879be	\N
739597bc-8911-11ed-b1d8-c16b6db879be	782	0.00	0.00	6bc2e580-8911-11ed-b1d8-c16b6db879be	\N
7b5e1be0-8911-11ed-b1d8-c16b6db879be	784	0.00	0.00	7488ff92-8911-11ed-b1d8-c16b6db879be	\N
\.


--
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company (id, te_id, is_active, cnpj, fancy_name, state_registry, city_registry, person_id, parent_id, legal_nature_code) FROM stdin;
0f7506d9-7f1a-11ed-b540-cdedf83415da	250	t	24.198.774/7322-35	Moda Stoq	982737266222		0f7506d8-7f1a-11ed-b540-cdedf83415da	\N	\N
0f7506de-7f1a-11ed-b540-cdedf83415da	255	t	24.198.774/7323-16	Stoq Elite Fashion	128373623638		0f7506dd-7f1a-11ed-b540-cdedf83415da	\N	\N
0f85b0ab-7f1a-11ed-b540-cdedf83415da	261	t	51.583.509/0001-45	Cia de Roupas São Carlos	07503278200		0f85b0aa-7f1a-11ed-b540-cdedf83415da	\N	\N
0f8e8c7b-7f1a-11ed-b540-cdedf83415da	266	t	37.165.431/0001-18	José Carlos de Carvalho	53224517140		0f8e8c7a-7f1a-11ed-b540-cdedf83415da	\N	\N
\.


--
-- Data for Name: contact_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_info (id, te_id, description, contact_info, person_id) FROM stdin;
90658208-7fa2-11ed-a8e6-7bb31e5c53d9	658	João	48 988534361	7dbd70de-7fa2-11ed-a8e6-7bb31e5c53d9
\.


--
-- Data for Name: context; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.context (id, te_id, name, start_time, end_time, branch_id) FROM stdin;
\.


--
-- Data for Name: cost_center; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cost_center (id, te_id, name, description, budget, is_active) FROM stdin;
\.


--
-- Data for Name: cost_center_entry; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cost_center_entry (id, te_id, cost_center_id, payment_id, stock_transaction_id) FROM stdin;
\.


--
-- Data for Name: credit_card_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.credit_card_data (id, te_id, auth, nsu, installments, card_type, entrance_value, fee, fee_value, fare, payment_id, provider_id, device_id) FROM stdin;
310b4deb-8878-11ed-b1d8-c16b6db879be	754	1234	\N	3	credit-inst-store	0.00	0.00	0.00	0.00	310b4dea-8878-11ed-b1d8-c16b6db879be	0f48179c-7f1a-11ed-b540-cdedf83415da	0f48179d-7f1a-11ed-b540-cdedf83415da
310b4ded-8878-11ed-b1d8-c16b6db879be	756	1234	\N	3	credit-inst-store	0.00	0.00	0.00	0.00	310b4dec-8878-11ed-b1d8-c16b6db879be	0f48179c-7f1a-11ed-b540-cdedf83415da	0f48179d-7f1a-11ed-b540-cdedf83415da
310b4def-8878-11ed-b1d8-c16b6db879be	758	1234	\N	3	credit-inst-store	0.00	0.00	0.00	0.00	310b4dee-8878-11ed-b1d8-c16b6db879be	0f48179c-7f1a-11ed-b540-cdedf83415da	0f48179d-7f1a-11ed-b540-cdedf83415da
4d5d7c95-8912-11ed-b1d8-c16b6db879be	808		\N	1	credit	0.00	0.00	0.00	0.00	4d5d7c94-8912-11ed-b1d8-c16b6db879be	0f48179c-7f1a-11ed-b540-cdedf83415da	0f48179d-7f1a-11ed-b540-cdedf83415da
\.


--
-- Data for Name: credit_check_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.credit_check_history (id, te_id, creation_date, check_date, identifier, status, notes, client_id, user_id) FROM stdin;
\.


--
-- Data for Name: credit_provider; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.credit_provider (id, te_id, is_active, max_installments, short_name, provider_id, open_contract_date, default_device_id, sort_order, visible) FROM stdin;
0f48179a-7f1a-11ed-b540-cdedf83415da	154	\N	1	VISA	VISA	2022-12-18 18:22:22.053845	\N	0	t
0f48179b-7f1a-11ed-b540-cdedf83415da	155	\N	1	MASTER	MASTER	2022-12-18 18:22:22.053845	\N	0	t
0f48179c-7f1a-11ed-b540-cdedf83415da	156	\N	1	AMEX	AMEX	2022-12-18 18:22:22.053845	\N	0	t
\.


--
-- Data for Name: delivery; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.delivery (id, te_id, status, open_date, send_date, receive_date, tracking_code, freight_type, volumes_kind, volumes_quantity, cancel_date, pick_date, pack_date, volumes_net_weight, volumes_gross_weight, vehicle_license_plate, vehicle_state, vehicle_registration, cancel_responsible_id, pick_responsible_id, pack_responsible_id, send_responsible_id, address_id, transporter_id, invoice_id) FROM stdin;
\.


--
-- Data for Name: device_constant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.device_constant (id, te_id, constant_type, constant_name, constant_value, constant_enum, device_value, device_settings_id, is_valid_model) FROM stdin;
\.


--
-- Data for Name: device_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.device_settings (id, te_id, type, brand, model, device_name, is_active, baudrate, station_id, drawer_inverted) FROM stdin;
\.


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (id, te_id, is_active, admission_date, expire_vacation, salary, status, registry_number, education_level, dependent_person_number, role_id, workpermit_data_id, military_data_id, voter_data_id, bank_account_id, person_id, branch_id) FROM stdin;
0f6aad03-7f1a-11ed-b540-cdedf83415da	245	t	\N	\N	0.00	normal	\N	\N	\N	0f6aad01-7f1a-11ed-b540-cdedf83415da	\N	\N	\N	\N	0f6aad00-7f1a-11ed-b540-cdedf83415da	\N
0f962393-7f1a-11ed-b540-cdedf83415da	272	t	\N	\N	600.00	normal	120	\N	\N	0f962392-7f1a-11ed-b540-cdedf83415da	\N	\N	\N	\N	0f962390-7f1a-11ed-b540-cdedf83415da	\N
0f96239a-7f1a-11ed-b540-cdedf83415da	279	t	\N	\N	1200.00	normal	189	\N	\N	0f962399-7f1a-11ed-b540-cdedf83415da	\N	\N	\N	\N	0f962397-7f1a-11ed-b540-cdedf83415da	\N
0f9623a1-7f1a-11ed-b540-cdedf83415da	286	t	\N	\N	900.00	normal	201	\N	\N	0f9623a0-7f1a-11ed-b540-cdedf83415da	\N	\N	\N	\N	0f96239e-7f1a-11ed-b540-cdedf83415da	\N
0f9623a8-7f1a-11ed-b540-cdedf83415da	293	t	\N	\N	2500.00	normal	231	\N	\N	0f9623a7-7f1a-11ed-b540-cdedf83415da	\N	\N	\N	\N	0f9623a5-7f1a-11ed-b540-cdedf83415da	\N
\.


--
-- Data for Name: employee_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_role (id, te_id, name) FROM stdin;
0f2ed4d7-7f1a-11ed-b540-cdedf83415da	151	Salesperson
0f6aad01-7f1a-11ed-b540-cdedf83415da	243	System Administrator
0f962392-7f1a-11ed-b540-cdedf83415da	271	Financeiro
0f962399-7f1a-11ed-b540-cdedf83415da	278	Gerente
0f9623a0-7f1a-11ed-b540-cdedf83415da	285	Secretário
0f9623a7-7f1a-11ed-b540-cdedf83415da	292	Diretor
\.


--
-- Data for Name: employee_role_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_role_history (id, te_id, began, ended, salary, role_id, employee_id, is_active) FROM stdin;
0f6aad04-7f1a-11ed-b540-cdedf83415da	246	2022-12-18 18:22:22.286212	\N	800.00	0f6aad01-7f1a-11ed-b540-cdedf83415da	0f6aad03-7f1a-11ed-b540-cdedf83415da	t
0f962394-7f1a-11ed-b540-cdedf83415da	273	2006-01-01 00:00:00	\N	600.00	0f962392-7f1a-11ed-b540-cdedf83415da	0f962393-7f1a-11ed-b540-cdedf83415da	t
0f96239b-7f1a-11ed-b540-cdedf83415da	280	2006-02-03 00:00:00	\N	1200.00	0f962399-7f1a-11ed-b540-cdedf83415da	0f96239a-7f1a-11ed-b540-cdedf83415da	t
0f9623a2-7f1a-11ed-b540-cdedf83415da	287	2006-05-01 00:00:00	\N	900.00	0f9623a0-7f1a-11ed-b540-cdedf83415da	0f9623a1-7f1a-11ed-b540-cdedf83415da	t
0f9623a9-7f1a-11ed-b540-cdedf83415da	294	2006-09-23 00:00:00	\N	2500.00	0f9623a7-7f1a-11ed-b540-cdedf83415da	0f9623a8-7f1a-11ed-b540-cdedf83415da	t
\.


--
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event (id, date, event_type, description) FROM stdin;
1	2022-12-18 18:22:22.379339	system	Created branch 'Stoq Elite Fashion'
2	2022-12-18 18:22:22.38002	system	Created branch 'Moda Stoq'
3	2022-12-18 18:22:23.082285	order	Order 00001, total value 7930.00, supplier 'Cia de Roupas São Carlos' is now confirmed
4	2022-12-18 18:22:23.176483	order	Order 00001, total value 7930.00, supplier 'Cia de Roupas São Carlos' is now closed
5	2022-12-18 18:22:23.347427	sale	Sale 00001 to client Vitalina Claudino was paid and confirmed with value 436.00.
6	2022-12-18 18:22:23.347561	payment	Money payment with value 436.00 was paid
7	2022-12-18 18:22:23.447161	sale	Sale 00002 to client Alessandra Almeida Itaberá was confirmed with value 706.00.
8	2022-12-18 18:22:23.52311	sale	Sale 00003 to client Luis Sergio da Silva Marin was confirmed with value 873.00.
16	2022-12-23 12:00:22.937752	payment	Money payment with value 7930.00 was paid
20	2022-12-30 16:28:52.277202	sale	Sale 00005 to client Vania Machado Martins was confirmed with value 462.00.
21	2022-12-30 16:30:05.696492	payment	Card payment with value 154.00 was paid
23	2022-12-31 10:52:10.056835	payment	Money payment with value 1.00 was paid
24	2022-12-31 10:52:10.063261	sale	Sale 00006 to client Luis Sergio da Silva Marin was confirmed with value 3.00.
26	2023-01-01 15:55:50.380219	sale	Sale 00007 to client Luis Sergio da Silva Marin was paid and confirmed with value 128.00.
27	2023-01-01 15:55:50.380332	payment	Money payment with value 128.00 was paid
\.


--
-- Data for Name: fiscal_book_entry; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fiscal_book_entry (id, te_id, entry_type, icms_value, iss_value, ipi_value, date, is_reversal, invoice_number, cfop_id, branch_id, drawee_id, payment_group_id) FROM stdin;
0fddf1ee-7f1a-11ed-b540-cdedf83415da	418	0	0.00	0.00	0.00	2022-12-18 18:22:23.037531	f	1	0f2ed4cf-7f1a-11ed-b540-cdedf83415da	0f7506db-7f1a-11ed-b540-cdedf83415da	0f85b0aa-7f1a-11ed-b540-cdedf83415da	0fddf1d4-7f1a-11ed-b540-cdedf83415da
0ffa6bd9-7f1a-11ed-b540-cdedf83415da	474	0	0.00	0.00	0.00	2022-12-18 18:22:23.22332	f	1001	0f2ed4cb-7f1a-11ed-b540-cdedf83415da	0f7506db-7f1a-11ed-b540-cdedf83415da	\N	0ffa6bc0-7f1a-11ed-b540-cdedf83415da
0ffa6bf7-7f1a-11ed-b540-cdedf83415da	504	0	0.00	0.00	0.00	2022-12-18 18:22:23.22332	f	1002	0f2ed4cb-7f1a-11ed-b540-cdedf83415da	0f7506db-7f1a-11ed-b540-cdedf83415da	\N	0ffa6bdc-7f1a-11ed-b540-cdedf83415da
0ffa6c11-7f1a-11ed-b540-cdedf83415da	530	0	0.00	0.00	0.00	2022-12-18 18:22:23.22332	f	1003	0f2ed4cb-7f1a-11ed-b540-cdedf83415da	0f7506db-7f1a-11ed-b540-cdedf83415da	\N	0ffa6bf8-7f1a-11ed-b540-cdedf83415da
310b4df7-8878-11ed-b1d8-c16b6db879be	766	0	0.00	0.00	0.00	2022-12-30 16:28:02.322831	f	0	0f2ed4cb-7f1a-11ed-b540-cdedf83415da	0f7506db-7f1a-11ed-b540-cdedf83415da	\N	13855b3a-8878-11ed-b1d8-c16b6db879be
5235a614-8912-11ed-b1d8-c16b6db879be	813	0	0.00	0.00	0.00	2022-12-31 10:50:37.935869	f	0	0f2ed4cb-7f1a-11ed-b540-cdedf83415da	0f7506db-7f1a-11ed-b540-cdedf83415da	\N	1b57c09c-8912-11ed-b1d8-c16b6db879be
e8c42208-8a05-11ed-b1d8-c16b6db879be	913	0	0.00	0.00	0.00	2023-01-01 15:55:38.857773	f	0	0f2ed4cb-7f1a-11ed-b540-cdedf83415da	0f7506db-7f1a-11ed-b540-cdedf83415da	\N	e1f36d52-8a05-11ed-b1d8-c16b6db879be
\.


--
-- Data for Name: fiscal_day_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fiscal_day_history (id, te_id, emission_date, station_id, serial, serial_id, coupon_start, coupon_end, cro, crz, period_total, total, tax_total, reduction_date) FROM stdin;
\.


--
-- Data for Name: fiscal_day_tax; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fiscal_day_tax (id, te_id, code, value, fiscal_day_history_id, type) FROM stdin;
\.


--
-- Data for Name: fiscal_sale_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fiscal_sale_history (id, te_id, sale_id, document_type, document, coo, document_counter) FROM stdin;
\.


--
-- Data for Name: grid_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grid_attribute (id, te_id, description, is_active, group_id) FROM stdin;
0538d4c8-8a01-11ed-b1d8-c16b6db879be	817	Tamanho	t	b6e75b1e-8a00-11ed-b1d8-c16b6db879be
27af90e6-8a01-11ed-b1d8-c16b6db879be	823	Cor	t	b6e75b1e-8a00-11ed-b1d8-c16b6db879be
\.


--
-- Data for Name: grid_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grid_group (id, te_id, description, is_active) FROM stdin;
b6e75b1e-8a00-11ed-b1d8-c16b6db879be	816	Um grupo	t
\.


--
-- Data for Name: grid_option; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grid_option (id, te_id, description, is_active, option_order, attribute_id) FROM stdin;
13323c7c-8a01-11ed-b1d8-c16b6db879be	818	P	t	0	0538d4c8-8a01-11ed-b1d8-c16b6db879be
196771ac-8a01-11ed-b1d8-c16b6db879be	819	M	t	0	0538d4c8-8a01-11ed-b1d8-c16b6db879be
1c202182-8a01-11ed-b1d8-c16b6db879be	820	G	t	0	0538d4c8-8a01-11ed-b1d8-c16b6db879be
1f07ef10-8a01-11ed-b1d8-c16b6db879be	821	GG	t	0	0538d4c8-8a01-11ed-b1d8-c16b6db879be
22838ae6-8a01-11ed-b1d8-c16b6db879be	822	XG	t	0	0538d4c8-8a01-11ed-b1d8-c16b6db879be
2a8a1d5e-8a01-11ed-b1d8-c16b6db879be	824	BRANCA	t	0	27af90e6-8a01-11ed-b1d8-c16b6db879be
2d571bc2-8a01-11ed-b1d8-c16b6db879be	825	AZUL	t	0	27af90e6-8a01-11ed-b1d8-c16b6db879be
30229994-8a01-11ed-b1d8-c16b6db879be	826	VERDE	t	0	27af90e6-8a01-11ed-b1d8-c16b6db879be
3214f698-8a01-11ed-b1d8-c16b6db879be	827	AMARELA	t	0	27af90e6-8a01-11ed-b1d8-c16b6db879be
\.


--
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.image (id, te_id, image, thumbnail, description, is_main, internal_use, notes, create_date, filename, sellable_id, keywords, station_type_id, category_id) FROM stdin;
\.


--
-- Data for Name: individual; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.individual (id, te_id, is_active, cpf, rg_number, birth_date, occupation, marital_status, father_name, mother_name, rg_expedition_date, rg_expedition_local, gender, spouse_name, state_registry, city_registry, birth_location_id, person_id, responsible_id) FROM stdin;
0f6aad02-7f1a-11ed-b540-cdedf83415da	244	t			\N		single			\N		\N				\N	0f6aad00-7f1a-11ed-b540-cdedf83415da	\N
0f962391-7f1a-11ed-b540-cdedf83415da	270	t	243.835.646-40	13.681.316-1	\N		single			\N		\N				\N	0f962390-7f1a-11ed-b540-cdedf83415da	\N
0f962398-7f1a-11ed-b540-cdedf83415da	277	t	115.338.625-91	83.233.851-5	\N		single			\N		\N				\N	0f962397-7f1a-11ed-b540-cdedf83415da	\N
0f96239f-7f1a-11ed-b540-cdedf83415da	284	t	874.041.223-76	23.352.315-5	\N		single			\N		\N				\N	0f96239e-7f1a-11ed-b540-cdedf83415da	\N
0f9623a6-7f1a-11ed-b540-cdedf83415da	291	t	845.788.628-28	23.332.435-5	\N		single			\N		\N				\N	0f9623a5-7f1a-11ed-b540-cdedf83415da	\N
0fa3001b-7f1a-11ed-b540-cdedf83415da	298	t	160.618.061-40	5.251.375-B	\N		single			\N		\N				\N	0fa3001a-7f1a-11ed-b540-cdedf83415da	\N
0fa3001f-7f1a-11ed-b540-cdedf83415da	302	t	335.728.854-00	23.352.315-5	\N		single			\N		\N				\N	0fa3001e-7f1a-11ed-b540-cdedf83415da	\N
0fa30023-7f1a-11ed-b540-cdedf83415da	306	t	804.727.615-87	27.487.452-0	\N		single			\N		\N				\N	0fa30022-7f1a-11ed-b540-cdedf83415da	\N
0fa30027-7f1a-11ed-b540-cdedf83415da	310	t	871.007.004-42	5.174.035	\N		single			\N		\N				\N	0fa30026-7f1a-11ed-b540-cdedf83415da	\N
7dbd70df-7fa2-11ed-a8e6-7bb31e5c53d9	655	t	688.974.640-68		1962-06-18 00:00:00		married			\N		female				4616	7dbd70de-7fa2-11ed-a8e6-7bb31e5c53d9	\N
41fcbdc5-8877-11ed-b1d8-c16b6db879be	723	t	199.304.190-71		\N		single			\N		\N				4616	41fcbdc4-8877-11ed-b1d8-c16b6db879be	\N
\.


--
-- Data for Name: installed_plugin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.installed_plugin (id, te_id, plugin_name, plugin_version) FROM stdin;
\.


--
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventory (id, te_id, identifier, status, open_date, close_date, invoice_number, cancel_reason, cancel_date, branch_id, responsible_id, cancel_responsible_id, station_id) FROM stdin;
b8244e00-8876-11ed-b1d8-c16b6db879be	709	1	cancelled	2022-12-30 16:18:19.523288	\N	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	\N	320e2b0c-7f1a-11ed-b540-cdedf83415da
\.


--
-- Data for Name: inventory_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventory_item (id, te_id, product_id, recorded_quantity, actual_quantity, counted_quantity, inventory_id, reason, product_cost, is_adjusted, batch_id, cfop_data_id) FROM stdin;
b8244e01-8876-11ed-b1d8-c16b6db879be	710	0fb112ed-7f1a-11ed-b540-cdedf83415da	3.000	\N	\N	b8244e00-8876-11ed-b1d8-c16b6db879be		70.00000000	f	\N	\N
b8244e02-8876-11ed-b1d8-c16b6db879be	711	0fb11308-7f1a-11ed-b540-cdedf83415da	3.000	\N	\N	b8244e00-8876-11ed-b1d8-c16b6db879be		325.00000000	f	\N	\N
b8244e03-8876-11ed-b1d8-c16b6db879be	712	0fb1131a-7f1a-11ed-b540-cdedf83415da	4.000	\N	\N	b8244e00-8876-11ed-b1d8-c16b6db879be		199.00000000	f	\N	\N
b8244e04-8876-11ed-b1d8-c16b6db879be	713	0fb1130d-7f1a-11ed-b540-cdedf83415da	3.000	\N	\N	b8244e00-8876-11ed-b1d8-c16b6db879be		401.00000000	f	\N	\N
b8244e05-8876-11ed-b1d8-c16b6db879be	714	0fb112f6-7f1a-11ed-b540-cdedf83415da	3.000	\N	\N	b8244e00-8876-11ed-b1d8-c16b6db879be		139.00000000	f	\N	\N
b8244e06-8876-11ed-b1d8-c16b6db879be	715	0fb11300-7f1a-11ed-b540-cdedf83415da	3.000	\N	\N	b8244e00-8876-11ed-b1d8-c16b6db879be		43.00000000	f	\N	\N
b8244e07-8876-11ed-b1d8-c16b6db879be	716	0fb11305-7f1a-11ed-b540-cdedf83415da	3.000	\N	\N	b8244e00-8876-11ed-b1d8-c16b6db879be		101.00000000	f	\N	\N
b8244e08-8876-11ed-b1d8-c16b6db879be	717	0fb112fb-7f1a-11ed-b540-cdedf83415da	3.000	\N	\N	b8244e00-8876-11ed-b1d8-c16b6db879be		56.00000000	f	\N	\N
b8244e09-8876-11ed-b1d8-c16b6db879be	718	0fb11315-7f1a-11ed-b540-cdedf83415da	3.000	\N	\N	b8244e00-8876-11ed-b1d8-c16b6db879be		99.00000000	f	\N	\N
b8244e0a-8876-11ed-b1d8-c16b6db879be	719	0fb11312-7f1a-11ed-b540-cdedf83415da	3.000	\N	\N	b8244e00-8876-11ed-b1d8-c16b6db879be		153.00000000	f	\N	\N
\.


--
-- Data for Name: invoice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invoice (id, te_id, invoice_number, operation_nature, invoice_type, key, cnf, mode, series, branch_id) FROM stdin;
0ffa6bc1-7f1a-11ed-b540-cdedf83415da	450	\N	\N	out	\N	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
0ffa6bdd-7f1a-11ed-b540-cdedf83415da	478	\N	\N	out	\N	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
0ffa6bf9-7f1a-11ed-b540-cdedf83415da	506	\N	\N	out	\N	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
1036b6c0-7f1a-11ed-b540-cdedf83415da	531	\N	Transfer	out	\N	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
13855b3b-8878-11ed-b1d8-c16b6db879be	741	\N	Sale	out	\N	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
1b57c09d-8912-11ed-b1d8-c16b6db879be	799	\N	Sale	out	\N	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
e1f36d53-8a05-11ed-b1d8-c16b6db879be	895	\N	Sale	out	\N	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
\.


--
-- Data for Name: invoice_field; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invoice_field (id, te_id, field_name, content, layout_id, x, y, width, height) FROM stdin;
0f5467fd-7f1a-11ed-b540-cdedf83415da	207	OUTGOING_INVOICE		0f5467fc-7f1a-11ed-b540-cdedf83415da	50	3	1	1
0f5467fe-7f1a-11ed-b540-cdedf83415da	208	INCOMING_INVOICE		0f5467fc-7f1a-11ed-b540-cdedf83415da	60	3	1	1
0f5467ff-7f1a-11ed-b540-cdedf83415da	209	INVOICE_TYPE		0f5467fc-7f1a-11ed-b540-cdedf83415da	0	7	21	1
0f546800-7f1a-11ed-b540-cdedf83415da	210	CFOP		0f5467fc-7f1a-11ed-b540-cdedf83415da	23	7	5	1
0f546801-7f1a-11ed-b540-cdedf83415da	211	INSCR_ESTADUAL_SUBSTITUTO_TRIB		0f5467fc-7f1a-11ed-b540-cdedf83415da	29	7	19	1
0f546802-7f1a-11ed-b540-cdedf83415da	212	CLIENT_NAME		0f5467fc-7f1a-11ed-b540-cdedf83415da	0	10	49	1
0f546803-7f1a-11ed-b540-cdedf83415da	213	CLIENT_DOCUMENT		0f5467fc-7f1a-11ed-b540-cdedf83415da	51	10	17	1
0f546804-7f1a-11ed-b540-cdedf83415da	214	ORDER_EMISSION_DATE		0f5467fc-7f1a-11ed-b540-cdedf83415da	70	10	10	1
0f546805-7f1a-11ed-b540-cdedf83415da	215	CLIENT_ADDRESS		0f5467fc-7f1a-11ed-b540-cdedf83415da	0	12	34	1
0f546806-7f1a-11ed-b540-cdedf83415da	216	CLIENT_DISTRICT		0f5467fc-7f1a-11ed-b540-cdedf83415da	36	12	17	1
0f546807-7f1a-11ed-b540-cdedf83415da	217	CLIENT_POSTAL_CODE		0f5467fc-7f1a-11ed-b540-cdedf83415da	58	12	10	1
0f546808-7f1a-11ed-b540-cdedf83415da	218	ORDER_CREATION_DATE		0f5467fc-7f1a-11ed-b540-cdedf83415da	70	12	10	1
0f546809-7f1a-11ed-b540-cdedf83415da	219	CLIENT_CITY		0f5467fc-7f1a-11ed-b540-cdedf83415da	0	14	24	1
0f54680a-7f1a-11ed-b540-cdedf83415da	220	CLIENT_PHONE_FAX		0f5467fc-7f1a-11ed-b540-cdedf83415da	25	14	17	1
0f54680b-7f1a-11ed-b540-cdedf83415da	221	CLIENT_STATE		0f5467fc-7f1a-11ed-b540-cdedf83415da	47	14	2	1
0f54680c-7f1a-11ed-b540-cdedf83415da	222	CLIENT_STATE_REGISTRY_DOCUMENT		0f5467fc-7f1a-11ed-b540-cdedf83415da	51	14	17	1
0f54680d-7f1a-11ed-b540-cdedf83415da	223	ORDER_CREATION_TIME		0f5467fc-7f1a-11ed-b540-cdedf83415da	71	14	8	1
0f54680e-7f1a-11ed-b540-cdedf83415da	224	PAYMENT_NUMBERS		0f5467fc-7f1a-11ed-b540-cdedf83415da	0	17	10	1
0f54680f-7f1a-11ed-b540-cdedf83415da	225	PAYMENT_DUE_DATES		0f5467fc-7f1a-11ed-b540-cdedf83415da	11	17	28	2
0f546810-7f1a-11ed-b540-cdedf83415da	226	PAYMENT_VALUES		0f5467fc-7f1a-11ed-b540-cdedf83415da	60	17	20	1
0f546811-7f1a-11ed-b540-cdedf83415da	227	PRODUCT_ITEM_COUNTER		0f5467fc-7f1a-11ed-b540-cdedf83415da	0	21	4	9
0f546812-7f1a-11ed-b540-cdedf83415da	228	PRODUCT_ITEM_CODE_DESCRIPTION		0f5467fc-7f1a-11ed-b540-cdedf83415da	5	21	32	9
0f546813-7f1a-11ed-b540-cdedf83415da	229	PRODUCT_ITEM_CODE_SITUATION		0f5467fc-7f1a-11ed-b540-cdedf83415da	39	21	2	9
0f546814-7f1a-11ed-b540-cdedf83415da	230	PRODUCT_ITEM_CODE_UNIT		0f5467fc-7f1a-11ed-b540-cdedf83415da	44	21	2	9
0f546815-7f1a-11ed-b540-cdedf83415da	231	PRODUCT_ITEM_QUANTITY		0f5467fc-7f1a-11ed-b540-cdedf83415da	48	21	6	9
0f546816-7f1a-11ed-b540-cdedf83415da	232	PRODUCT_ITEM_PRICE		0f5467fc-7f1a-11ed-b540-cdedf83415da	54	21	6	9
0f546817-7f1a-11ed-b540-cdedf83415da	233	PRODUCT_ITEM_TOTAL		0f5467fc-7f1a-11ed-b540-cdedf83415da	60	21	9	9
0f546818-7f1a-11ed-b540-cdedf83415da	234	PRODUCT_ITEM_TAX		0f5467fc-7f1a-11ed-b540-cdedf83415da	70	21	2	9
0f546819-7f1a-11ed-b540-cdedf83415da	235	BASE_DE_CALCULO_ICMS		0f5467fc-7f1a-11ed-b540-cdedf83415da	1	44	13	1
0f54681a-7f1a-11ed-b540-cdedf83415da	236	VALOR_ICMS		0f5467fc-7f1a-11ed-b540-cdedf83415da	16	44	15	1
0f54681b-7f1a-11ed-b540-cdedf83415da	237	BASE_DE_CALCULO_ICMS_SUBST		0f5467fc-7f1a-11ed-b540-cdedf83415da	32	44	15	1
0f54681c-7f1a-11ed-b540-cdedf83415da	238	VALOR_ICMS_SUBST		0f5467fc-7f1a-11ed-b540-cdedf83415da	50	44	12	1
0f54681d-7f1a-11ed-b540-cdedf83415da	239	VALOR_TOTAL_PRODUTOS		0f5467fc-7f1a-11ed-b540-cdedf83415da	65	44	14	1
0f54681e-7f1a-11ed-b540-cdedf83415da	240	VALOR_TOTAL_NOTA		0f5467fc-7f1a-11ed-b540-cdedf83415da	65	46	14	1
0f54681f-7f1a-11ed-b540-cdedf83415da	241	ADDITIONAL_SALE_NOTES		0f5467fc-7f1a-11ed-b540-cdedf83415da	0	55	41	3
\.


--
-- Data for Name: invoice_item_cofins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invoice_item_cofins (id, te_id, cst, calculo, v_bc, p_cofins, q_bc_prod, v_cofins) FROM stdin;
0ffa6bc6-7f1a-11ed-b540-cdedf83415da	455	99	percentage	0.00	0.00	1.0000	0.00
0ffa6bcb-7f1a-11ed-b540-cdedf83415da	460	99	percentage	0.00	0.00	1.0000	0.00
0ffa6bd0-7f1a-11ed-b540-cdedf83415da	465	99	percentage	0.00	0.00	1.0000	0.00
0ffa6be2-7f1a-11ed-b540-cdedf83415da	483	99	percentage	0.00	0.00	1.0000	0.00
0ffa6be7-7f1a-11ed-b540-cdedf83415da	488	99	percentage	0.00	0.00	1.0000	0.00
0ffa6bec-7f1a-11ed-b540-cdedf83415da	493	99	percentage	0.00	0.00	1.0000	0.00
0ffa6bfe-7f1a-11ed-b540-cdedf83415da	511	99	percentage	0.00	0.00	1.0000	0.00
0ffa6c03-7f1a-11ed-b540-cdedf83415da	516	99	percentage	0.00	0.00	1.0000	0.00
0ffa6c08-7f1a-11ed-b540-cdedf83415da	521	99	percentage	0.00	0.00	1.0000	0.00
1036b6c5-7f1a-11ed-b540-cdedf83415da	536	99	percentage	0.00	0.00	1.0000	0.00
1036b6ca-7f1a-11ed-b540-cdedf83415da	541	99	percentage	0.00	0.00	1.0000	0.00
1036b6cf-7f1a-11ed-b540-cdedf83415da	546	99	percentage	0.00	0.00	1.0000	0.00
1036b6d4-7f1a-11ed-b540-cdedf83415da	551	99	percentage	0.00	0.00	1.0000	0.00
1036b6d9-7f1a-11ed-b540-cdedf83415da	556	99	percentage	0.00	0.00	1.0000	0.00
1036b6de-7f1a-11ed-b540-cdedf83415da	561	99	percentage	0.00	0.00	1.0000	0.00
1036b6e3-7f1a-11ed-b540-cdedf83415da	566	99	percentage	0.00	0.00	1.0000	0.00
1036b6e8-7f1a-11ed-b540-cdedf83415da	571	99	percentage	0.00	0.00	1.0000	0.00
1036b6ed-7f1a-11ed-b540-cdedf83415da	576	99	percentage	0.00	0.00	1.0000	0.00
1036b6f2-7f1a-11ed-b540-cdedf83415da	581	99	percentage	0.00	0.00	1.0000	0.00
13855b40-8878-11ed-b1d8-c16b6db879be	746	99	percentage	0.00	0.00	1.0000	0.00
13855b45-8878-11ed-b1d8-c16b6db879be	751	99	percentage	0.00	0.00	1.0000	0.00
1b57c0a2-8912-11ed-b1d8-c16b6db879be	804	\N	percentage	3.00	\N	1.0000	0.00
e1f36d58-8a05-11ed-b1d8-c16b6db879be	900	\N	percentage	56.00	\N	1.0000	0.00
e1f36d5d-8a05-11ed-b1d8-c16b6db879be	905	\N	percentage	72.00	\N	1.0000	0.00
\.


--
-- Data for Name: invoice_item_icms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invoice_item_icms (id, te_id, bc_include_ipi, bc_st_include_ipi, cst, csosn, mod_bc, mod_bc_st, orig, p_cred_sn, p_mva_st, p_icms, p_icms_st, p_red_bc, p_red_bc_st, v_bc, v_bc_st, v_bc_st_ret, v_cred_icms_sn, v_icms, v_icms_st, v_icms_st_ret, p_fcp, p_fcp_st, p_st, v_fcp, v_fcp_st, v_fcp_st_ret, v_icms_deson) FROM stdin;
0ffa6bc4-7f1a-11ed-b540-cdedf83415da	453	t	t	\N	102	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
0ffa6bc9-7f1a-11ed-b540-cdedf83415da	458	t	t	\N	102	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
0ffa6bce-7f1a-11ed-b540-cdedf83415da	463	t	t	\N	102	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
0ffa6be0-7f1a-11ed-b540-cdedf83415da	481	t	t	\N	102	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
0ffa6be5-7f1a-11ed-b540-cdedf83415da	486	t	t	\N	102	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
0ffa6bea-7f1a-11ed-b540-cdedf83415da	491	t	t	\N	102	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
0ffa6bfc-7f1a-11ed-b540-cdedf83415da	509	t	t	\N	102	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
0ffa6c01-7f1a-11ed-b540-cdedf83415da	514	t	t	\N	102	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
0ffa6c06-7f1a-11ed-b540-cdedf83415da	519	t	t	\N	102	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1036b6c3-7f1a-11ed-b540-cdedf83415da	534	t	t	\N	102	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1036b6c8-7f1a-11ed-b540-cdedf83415da	539	t	t	\N	102	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1036b6cd-7f1a-11ed-b540-cdedf83415da	544	t	t	\N	102	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1036b6d2-7f1a-11ed-b540-cdedf83415da	549	t	t	\N	102	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1036b6d7-7f1a-11ed-b540-cdedf83415da	554	t	t	\N	102	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1036b6dc-7f1a-11ed-b540-cdedf83415da	559	t	t	\N	102	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1036b6e1-7f1a-11ed-b540-cdedf83415da	564	t	t	\N	102	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1036b6e6-7f1a-11ed-b540-cdedf83415da	569	t	t	\N	102	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1036b6eb-7f1a-11ed-b540-cdedf83415da	574	t	t	\N	102	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1036b6f0-7f1a-11ed-b540-cdedf83415da	579	t	t	\N	102	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13855b3e-8878-11ed-b1d8-c16b6db879be	744	t	t	\N	102	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13855b43-8878-11ed-b1d8-c16b6db879be	749	t	t	\N	102	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1b57c0a0-8912-11ed-b1d8-c16b6db879be	802	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
e1f36d56-8a05-11ed-b1d8-c16b6db879be	898	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
e1f36d5b-8a05-11ed-b1d8-c16b6db879be	903	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: invoice_item_ipi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invoice_item_ipi (id, te_id, cl_enq, cnpj_prod, c_selo, q_selo, c_enq, calculo, cst, p_ipi, q_unid, v_ipi, v_bc, v_unid) FROM stdin;
0ffa6bc3-7f1a-11ed-b540-cdedf83415da	452				\N		aliquot	\N	\N	\N	0.00	\N	\N
0ffa6bc8-7f1a-11ed-b540-cdedf83415da	457				\N		aliquot	\N	\N	\N	0.00	\N	\N
0ffa6bcd-7f1a-11ed-b540-cdedf83415da	462				\N		aliquot	\N	\N	\N	0.00	\N	\N
0ffa6bdf-7f1a-11ed-b540-cdedf83415da	480				\N		aliquot	\N	\N	\N	0.00	\N	\N
0ffa6be4-7f1a-11ed-b540-cdedf83415da	485				\N		aliquot	\N	\N	\N	0.00	\N	\N
0ffa6be9-7f1a-11ed-b540-cdedf83415da	490				\N		aliquot	\N	\N	\N	0.00	\N	\N
0ffa6bfb-7f1a-11ed-b540-cdedf83415da	508				\N		aliquot	\N	\N	\N	0.00	\N	\N
0ffa6c00-7f1a-11ed-b540-cdedf83415da	513				\N		aliquot	\N	\N	\N	0.00	\N	\N
0ffa6c05-7f1a-11ed-b540-cdedf83415da	518				\N		aliquot	\N	\N	\N	0.00	\N	\N
1036b6c2-7f1a-11ed-b540-cdedf83415da	533				\N		aliquot	\N	\N	\N	0.00	\N	\N
1036b6c7-7f1a-11ed-b540-cdedf83415da	538				\N		aliquot	\N	\N	\N	0.00	\N	\N
1036b6cc-7f1a-11ed-b540-cdedf83415da	543				\N		aliquot	\N	\N	\N	0.00	\N	\N
1036b6d1-7f1a-11ed-b540-cdedf83415da	548				\N		aliquot	\N	\N	\N	0.00	\N	\N
1036b6d6-7f1a-11ed-b540-cdedf83415da	553				\N		aliquot	\N	\N	\N	0.00	\N	\N
1036b6db-7f1a-11ed-b540-cdedf83415da	558				\N		aliquot	\N	\N	\N	0.00	\N	\N
1036b6e0-7f1a-11ed-b540-cdedf83415da	563				\N		aliquot	\N	\N	\N	0.00	\N	\N
1036b6e5-7f1a-11ed-b540-cdedf83415da	568				\N		aliquot	\N	\N	\N	0.00	\N	\N
1036b6ea-7f1a-11ed-b540-cdedf83415da	573				\N		aliquot	\N	\N	\N	0.00	\N	\N
1036b6ef-7f1a-11ed-b540-cdedf83415da	578				\N		aliquot	\N	\N	\N	0.00	\N	\N
13855b3d-8878-11ed-b1d8-c16b6db879be	743				\N		aliquot	\N	\N	\N	0.00	\N	\N
13855b42-8878-11ed-b1d8-c16b6db879be	748				\N		aliquot	\N	\N	\N	0.00	\N	\N
1b57c09f-8912-11ed-b1d8-c16b6db879be	801				\N		aliquot	\N	\N	\N	0.00	\N	\N
e1f36d55-8a05-11ed-b1d8-c16b6db879be	897				\N		aliquot	\N	\N	\N	0.00	\N	\N
e1f36d5a-8a05-11ed-b1d8-c16b6db879be	902				\N		aliquot	\N	\N	\N	0.00	\N	\N
\.


--
-- Data for Name: invoice_item_pis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invoice_item_pis (id, te_id, cst, calculo, v_bc, p_pis, q_bc_prod, v_pis) FROM stdin;
0ffa6bc5-7f1a-11ed-b540-cdedf83415da	454	99	percentage	0.00	0.00	1.0000	0.00
0ffa6bca-7f1a-11ed-b540-cdedf83415da	459	99	percentage	0.00	0.00	1.0000	0.00
0ffa6bcf-7f1a-11ed-b540-cdedf83415da	464	99	percentage	0.00	0.00	1.0000	0.00
0ffa6be1-7f1a-11ed-b540-cdedf83415da	482	99	percentage	0.00	0.00	1.0000	0.00
0ffa6be6-7f1a-11ed-b540-cdedf83415da	487	99	percentage	0.00	0.00	1.0000	0.00
0ffa6beb-7f1a-11ed-b540-cdedf83415da	492	99	percentage	0.00	0.00	1.0000	0.00
0ffa6bfd-7f1a-11ed-b540-cdedf83415da	510	99	percentage	0.00	0.00	1.0000	0.00
0ffa6c02-7f1a-11ed-b540-cdedf83415da	515	99	percentage	0.00	0.00	1.0000	0.00
0ffa6c07-7f1a-11ed-b540-cdedf83415da	520	99	percentage	0.00	0.00	1.0000	0.00
1036b6c4-7f1a-11ed-b540-cdedf83415da	535	99	percentage	0.00	0.00	1.0000	0.00
1036b6c9-7f1a-11ed-b540-cdedf83415da	540	99	percentage	0.00	0.00	1.0000	0.00
1036b6ce-7f1a-11ed-b540-cdedf83415da	545	99	percentage	0.00	0.00	1.0000	0.00
1036b6d3-7f1a-11ed-b540-cdedf83415da	550	99	percentage	0.00	0.00	1.0000	0.00
1036b6d8-7f1a-11ed-b540-cdedf83415da	555	99	percentage	0.00	0.00	1.0000	0.00
1036b6dd-7f1a-11ed-b540-cdedf83415da	560	99	percentage	0.00	0.00	1.0000	0.00
1036b6e2-7f1a-11ed-b540-cdedf83415da	565	99	percentage	0.00	0.00	1.0000	0.00
1036b6e7-7f1a-11ed-b540-cdedf83415da	570	99	percentage	0.00	0.00	1.0000	0.00
1036b6ec-7f1a-11ed-b540-cdedf83415da	575	99	percentage	0.00	0.00	1.0000	0.00
1036b6f1-7f1a-11ed-b540-cdedf83415da	580	99	percentage	0.00	0.00	1.0000	0.00
13855b3f-8878-11ed-b1d8-c16b6db879be	745	99	percentage	0.00	0.00	1.0000	0.00
13855b44-8878-11ed-b1d8-c16b6db879be	750	99	percentage	0.00	0.00	1.0000	0.00
1b57c0a1-8912-11ed-b1d8-c16b6db879be	803	\N	percentage	3.00	\N	1.0000	0.00
e1f36d57-8a05-11ed-b1d8-c16b6db879be	899	\N	percentage	56.00	\N	1.0000	0.00
e1f36d5c-8a05-11ed-b1d8-c16b6db879be	904	\N	percentage	72.00	\N	1.0000	0.00
\.


--
-- Data for Name: invoice_layout; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invoice_layout (id, te_id, description, continuous_page, width, height) FROM stdin;
0f5467fc-7f1a-11ed-b540-cdedf83415da	206	Standard Invoice	\N	80	60
\.


--
-- Data for Name: invoice_printer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invoice_printer (id, te_id, device_name, description, station_id, layout_id) FROM stdin;
\.


--
-- Data for Name: loan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.loan (id, te_id, identifier, open_date, close_date, expire_date, status, notes, removed_by, cancel_reason, cancel_date, client_id, client_category_id, responsible_id, branch_id, invoice_id, cancel_responsible_id, station_id) FROM stdin;
\.


--
-- Data for Name: loan_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.loan_item (id, te_id, quantity, sale_quantity, return_quantity, price, base_price, loan_id, sellable_id, batch_id, icms_info_id, ipi_info_id, pis_info_id, cofins_info_id) FROM stdin;
\.


--
-- Data for Name: login_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.login_user (id, te_id, username, pw_hash, is_active, profile_id, person_id) FROM stdin;
0f6aad06-7f1a-11ed-b540-cdedf83415da	248	admin	d41d8cd98f00b204e9800998ecf8427e	t	0f4c5d14-7f1a-11ed-b540-cdedf83415da	0f6aad00-7f1a-11ed-b540-cdedf83415da
\.


--
-- Data for Name: message; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.message (id, te_id, content, created_at, expire_at, created_by_id, user_id, profile_id, branch_id) FROM stdin;
\.


--
-- Data for Name: military_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.military_data (id, te_id, number, series_number, category) FROM stdin;
\.


--
-- Data for Name: parameter_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.parameter_data (id, te_id, field_name, field_value, is_editable) FROM stdin;
0f2ed449-7f1a-11ed-b540-cdedf83415da	8	BANKS_ACCOUNT	0f2ed443-7f1a-11ed-b540-cdedf83415da	t
0f2ed44a-7f1a-11ed-b540-cdedf83415da	9	TILLS_ACCOUNT	0f2ed448-7f1a-11ed-b540-cdedf83415da	t
0f2ed44b-7f1a-11ed-b540-cdedf83415da	10	IMBALANCE_ACCOUNT	0f2ed446-7f1a-11ed-b540-cdedf83415da	t
0f2ed4c9-7f1a-11ed-b540-cdedf83415da	136	USER_HASH	ae4fdd2795d04d93a5036599587fb6ce	t
0f2ed4ca-7f1a-11ed-b540-cdedf83415da	137	DEFAULT_PAYMENT_METHOD	0f2ed44c-7f1a-11ed-b540-cdedf83415da	t
0f2ed4cc-7f1a-11ed-b540-cdedf83415da	139	DEFAULT_SALES_CFOP	0f2ed4cb-7f1a-11ed-b540-cdedf83415da	t
0f2ed4ce-7f1a-11ed-b540-cdedf83415da	141	DEFAULT_RETURN_SALES_CFOP	0f2ed4cd-7f1a-11ed-b540-cdedf83415da	t
0f2ed4d0-7f1a-11ed-b540-cdedf83415da	143	DEFAULT_RECEIVING_CFOP	0f2ed4cf-7f1a-11ed-b540-cdedf83415da	t
0f2ed4d2-7f1a-11ed-b540-cdedf83415da	145	DEFAULT_STOCK_DECREASE_CFOP	0f2ed4d1-7f1a-11ed-b540-cdedf83415da	t
0f2ed4d4-7f1a-11ed-b540-cdedf83415da	147	DEFAULT_PURCHASE_RETURN_CFOP	0f2ed4d3-7f1a-11ed-b540-cdedf83415da	t
0f2ed4d6-7f1a-11ed-b540-cdedf83415da	150	DELIVERY_SERVICE	0f2ed4d5-7f1a-11ed-b540-cdedf83415da	t
0f2ed4d8-7f1a-11ed-b540-cdedf83415da	152	DEFAULT_SALESPERSON_ROLE	0f2ed4d7-7f1a-11ed-b540-cdedf83415da	t
0f2ed4d9-7f1a-11ed-b540-cdedf83415da	153	DEFAULT_PRODUCT_TAX_CONSTANT	0f2ed4c7-7f1a-11ed-b540-cdedf83415da	t
0f7b19ce-7f1a-11ed-b540-cdedf83415da	259	MAIN_COMPANY	0f7506db-7f1a-11ed-b540-cdedf83415da	t
0f89aa98-7f1a-11ed-b540-cdedf83415da	264	SUGGESTED_SUPPLIER	0f85b0ad-7f1a-11ed-b540-cdedf83415da	t
10772ed0-7f1a-11ed-b540-cdedf83415da	650	DEMO_MODE	1	\N
320e2b0d-7f1a-11ed-b540-cdedf83415da	652	ONLINE_SERVICES	1	\N
\.


--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment (id, te_id, identifier, payment_type, status, open_date, due_date, paid_date, cancel_date, paid_value, base_value, value, interest, discount, description, payment_number, penalty, bill_received, attachment_id, method_id, group_id, branch_id, category_id, station_id) FROM stdin;
310b4dee-8878-11ed-b1d8-c16b6db879be	757	20	in	pending	2022-12-30 16:28:51.86966	2023-02-28 16:28:51.860459	\N	\N	\N	154.00	154.00	0.00	0.00	3/3 Card for sale 00005	\N	0.00	f	\N	0f2ed44f-7f1a-11ed-b540-cdedf83415da	13855b3a-8878-11ed-b1d8-c16b6db879be	0f7506db-7f1a-11ed-b540-cdedf83415da	\N	320e2b0c-7f1a-11ed-b540-cdedf83415da
310b4dea-8878-11ed-b1d8-c16b6db879be	753	18	in	paid	2022-12-30 16:28:51.861955	2022-12-30 16:28:51.860459	2022-12-30 00:00:00	\N	154.00	154.00	154.00	0.00	0.00	1/3 Card for sale 00005	\N	0.00	f	\N	0f2ed44f-7f1a-11ed-b540-cdedf83415da	13855b3a-8878-11ed-b1d8-c16b6db879be	0f7506db-7f1a-11ed-b540-cdedf83415da	\N	320e2b0c-7f1a-11ed-b540-cdedf83415da
0ffa6bd2-7f1a-11ed-b540-cdedf83415da	467	2	in	paid	2008-01-01 00:00:00	2008-01-01 00:00:00	2008-01-01 00:00:00	\N	436.00	436.00	436.00	0.00	0.00	1/1 Money for sale 00001	\N	0.00	f	\N	0f2ed44c-7f1a-11ed-b540-cdedf83415da	0ffa6bc0-7f1a-11ed-b540-cdedf83415da	0f7506db-7f1a-11ed-b540-cdedf83415da	\N	0facff84-7f1a-11ed-b540-cdedf83415da
0ffa6bee-7f1a-11ed-b540-cdedf83415da	495	3	in	pending	2008-06-01 00:00:00	2008-06-15 00:00:00	\N	\N	\N	706.00	706.00	0.00	0.00	1/1 Check for sale 00002	\N	0.00	f	\N	0f2ed44d-7f1a-11ed-b540-cdedf83415da	0ffa6bdc-7f1a-11ed-b540-cdedf83415da	0f7506db-7f1a-11ed-b540-cdedf83415da	\N	0facff84-7f1a-11ed-b540-cdedf83415da
0ffa6c0a-7f1a-11ed-b540-cdedf83415da	523	4	in	pending	2008-09-01 00:00:00	2008-09-15 00:00:00	\N	\N	\N	873.00	873.00	0.00	0.00	1/1 Bill for sale 00003	\N	0.00	f	\N	0f2ed44e-7f1a-11ed-b540-cdedf83415da	0ffa6bf8-7f1a-11ed-b540-cdedf83415da	0f7506db-7f1a-11ed-b540-cdedf83415da	\N	0facff84-7f1a-11ed-b540-cdedf83415da
0fddf1e0-7f1a-11ed-b540-cdedf83415da	404	1	out	paid	2008-01-01 00:00:00	2008-01-01 00:00:00	2022-12-23 00:00:00	\N	7930.00	7930.00	7930.00	0.00	0.00	1/1 Money for order 00001	\N	0.00	f	\N	0f2ed44c-7f1a-11ed-b540-cdedf83415da	0fddf1d4-7f1a-11ed-b540-cdedf83415da	0f7506db-7f1a-11ed-b540-cdedf83415da	\N	0facff84-7f1a-11ed-b540-cdedf83415da
4d5d7c94-8912-11ed-b1d8-c16b6db879be	807	22	in	pending	2022-12-31 10:52:01.872097	2022-12-31 10:52:01.870696	\N	\N	\N	2.00	2.00	0.00	0.00	2/2 Card for sale 00006	\N	0.00	f	\N	0f2ed44f-7f1a-11ed-b540-cdedf83415da	1b57c09c-8912-11ed-b1d8-c16b6db879be	0f7506db-7f1a-11ed-b540-cdedf83415da	\N	320e2b0c-7f1a-11ed-b540-cdedf83415da
0efa5801-8877-11ed-b1d8-c16b6db879be	721	5	out	pending	2022-12-30 00:00:00	2022-12-26 00:00:00	\N	\N	\N	255.32	255.32	0.00	0.00	1/13 Conta de Energia	\N	0.00	f	\N	0f2ed44c-7f1a-11ed-b540-cdedf83415da	0efa5800-8877-11ed-b1d8-c16b6db879be	0f7506db-7f1a-11ed-b540-cdedf83415da	\N	320e2b0c-7f1a-11ed-b540-cdedf83415da
9211efdc-8877-11ed-b1d8-c16b6db879be	726	6	out	pending	2022-12-30 00:00:00	2023-01-26 00:00:00	\N	\N	\N	255.32	255.32	0.00	0.00	2/13 Conta de Energia	\N	0.00	f	\N	0f2ed44c-7f1a-11ed-b540-cdedf83415da	0efa5800-8877-11ed-b1d8-c16b6db879be	0f7506db-7f1a-11ed-b540-cdedf83415da	\N	320e2b0c-7f1a-11ed-b540-cdedf83415da
9211efdd-8877-11ed-b1d8-c16b6db879be	727	7	out	pending	2022-12-30 00:00:00	2023-02-26 00:00:00	\N	\N	\N	255.32	255.32	0.00	0.00	3/13 Conta de Energia	\N	0.00	f	\N	0f2ed44c-7f1a-11ed-b540-cdedf83415da	0efa5800-8877-11ed-b1d8-c16b6db879be	0f7506db-7f1a-11ed-b540-cdedf83415da	\N	320e2b0c-7f1a-11ed-b540-cdedf83415da
9211efde-8877-11ed-b1d8-c16b6db879be	728	8	out	pending	2022-12-30 00:00:00	2023-03-26 00:00:00	\N	\N	\N	255.32	255.32	0.00	0.00	4/13 Conta de Energia	\N	0.00	f	\N	0f2ed44c-7f1a-11ed-b540-cdedf83415da	0efa5800-8877-11ed-b1d8-c16b6db879be	0f7506db-7f1a-11ed-b540-cdedf83415da	\N	320e2b0c-7f1a-11ed-b540-cdedf83415da
9211efdf-8877-11ed-b1d8-c16b6db879be	729	9	out	pending	2022-12-30 00:00:00	2023-04-26 00:00:00	\N	\N	\N	255.32	255.32	0.00	0.00	5/13 Conta de Energia	\N	0.00	f	\N	0f2ed44c-7f1a-11ed-b540-cdedf83415da	0efa5800-8877-11ed-b1d8-c16b6db879be	0f7506db-7f1a-11ed-b540-cdedf83415da	\N	320e2b0c-7f1a-11ed-b540-cdedf83415da
9211efe0-8877-11ed-b1d8-c16b6db879be	730	10	out	pending	2022-12-30 00:00:00	2023-05-26 00:00:00	\N	\N	\N	255.32	255.32	0.00	0.00	6/13 Conta de Energia	\N	0.00	f	\N	0f2ed44c-7f1a-11ed-b540-cdedf83415da	0efa5800-8877-11ed-b1d8-c16b6db879be	0f7506db-7f1a-11ed-b540-cdedf83415da	\N	320e2b0c-7f1a-11ed-b540-cdedf83415da
9211efe1-8877-11ed-b1d8-c16b6db879be	731	11	out	pending	2022-12-30 00:00:00	2023-06-26 00:00:00	\N	\N	\N	255.32	255.32	0.00	0.00	7/13 Conta de Energia	\N	0.00	f	\N	0f2ed44c-7f1a-11ed-b540-cdedf83415da	0efa5800-8877-11ed-b1d8-c16b6db879be	0f7506db-7f1a-11ed-b540-cdedf83415da	\N	320e2b0c-7f1a-11ed-b540-cdedf83415da
9211efe2-8877-11ed-b1d8-c16b6db879be	732	12	out	pending	2022-12-30 00:00:00	2023-07-26 00:00:00	\N	\N	\N	255.32	255.32	0.00	0.00	8/13 Conta de Energia	\N	0.00	f	\N	0f2ed44c-7f1a-11ed-b540-cdedf83415da	0efa5800-8877-11ed-b1d8-c16b6db879be	0f7506db-7f1a-11ed-b540-cdedf83415da	\N	320e2b0c-7f1a-11ed-b540-cdedf83415da
9211efe3-8877-11ed-b1d8-c16b6db879be	733	13	out	pending	2022-12-30 00:00:00	2023-08-26 00:00:00	\N	\N	\N	255.32	255.32	0.00	0.00	9/13 Conta de Energia	\N	0.00	f	\N	0f2ed44c-7f1a-11ed-b540-cdedf83415da	0efa5800-8877-11ed-b1d8-c16b6db879be	0f7506db-7f1a-11ed-b540-cdedf83415da	\N	320e2b0c-7f1a-11ed-b540-cdedf83415da
9211efe4-8877-11ed-b1d8-c16b6db879be	734	14	out	pending	2022-12-30 00:00:00	2023-09-26 00:00:00	\N	\N	\N	255.32	255.32	0.00	0.00	10/13 Conta de Energia	\N	0.00	f	\N	0f2ed44c-7f1a-11ed-b540-cdedf83415da	0efa5800-8877-11ed-b1d8-c16b6db879be	0f7506db-7f1a-11ed-b540-cdedf83415da	\N	320e2b0c-7f1a-11ed-b540-cdedf83415da
9211efe5-8877-11ed-b1d8-c16b6db879be	735	15	out	pending	2022-12-30 00:00:00	2023-10-26 00:00:00	\N	\N	\N	255.32	255.32	0.00	0.00	11/13 Conta de Energia	\N	0.00	f	\N	0f2ed44c-7f1a-11ed-b540-cdedf83415da	0efa5800-8877-11ed-b1d8-c16b6db879be	0f7506db-7f1a-11ed-b540-cdedf83415da	\N	320e2b0c-7f1a-11ed-b540-cdedf83415da
9211efe6-8877-11ed-b1d8-c16b6db879be	736	16	out	pending	2022-12-30 00:00:00	2023-11-26 00:00:00	\N	\N	\N	255.32	255.32	0.00	0.00	12/13 Conta de Energia	\N	0.00	f	\N	0f2ed44c-7f1a-11ed-b540-cdedf83415da	0efa5800-8877-11ed-b1d8-c16b6db879be	0f7506db-7f1a-11ed-b540-cdedf83415da	\N	320e2b0c-7f1a-11ed-b540-cdedf83415da
9211efe7-8877-11ed-b1d8-c16b6db879be	737	17	out	pending	2022-12-30 00:00:00	2023-12-26 00:00:00	\N	\N	\N	255.32	255.32	0.00	0.00	13/13 Conta de Energia	\N	0.00	f	\N	0f2ed44c-7f1a-11ed-b540-cdedf83415da	0efa5800-8877-11ed-b1d8-c16b6db879be	0f7506db-7f1a-11ed-b540-cdedf83415da	\N	320e2b0c-7f1a-11ed-b540-cdedf83415da
310b4dec-8878-11ed-b1d8-c16b6db879be	755	19	in	pending	2022-12-30 16:28:51.866734	2023-01-30 16:28:51.860459	\N	\N	\N	154.00	154.00	0.00	0.00	2/3 Card for sale 00005	\N	0.00	f	\N	0f2ed44f-7f1a-11ed-b540-cdedf83415da	13855b3a-8878-11ed-b1d8-c16b6db879be	0f7506db-7f1a-11ed-b540-cdedf83415da	\N	320e2b0c-7f1a-11ed-b540-cdedf83415da
3ee68084-8912-11ed-b1d8-c16b6db879be	806	21	in	paid	2022-12-31 10:51:37.603018	2022-12-31 10:50:37.935869	2022-12-31 10:50:37.935869	\N	1.00	1.00	1.00	0.00	0.00	1/2 Money for sale 00006	\N	0.00	f	\N	0f2ed44c-7f1a-11ed-b540-cdedf83415da	1b57c09c-8912-11ed-b1d8-c16b6db879be	0f7506db-7f1a-11ed-b540-cdedf83415da	\N	320e2b0c-7f1a-11ed-b540-cdedf83415da
e8c42202-8a05-11ed-b1d8-c16b6db879be	907	23	in	paid	2023-01-01 15:55:50.298225	2023-01-01 15:55:38.857773	2023-01-01 15:55:38.857773	\N	128.00	128.00	128.00	0.00	0.00	1/1 Money for sale 00007	\N	0.00	f	\N	0f2ed44c-7f1a-11ed-b540-cdedf83415da	e1f36d52-8a05-11ed-b1d8-c16b6db879be	0f7506db-7f1a-11ed-b540-cdedf83415da	\N	320e2b0c-7f1a-11ed-b540-cdedf83415da
\.


--
-- Data for Name: payment_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_category (id, te_id, name, category_type, color, account_id) FROM stdin;
\.


--
-- Data for Name: payment_change_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_change_history (id, te_id, change_reason, last_due_date, change_date, new_due_date, last_status, new_status, payment_id) FROM stdin;
\.


--
-- Data for Name: payment_comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_comment (id, te_id, date, comment, payment_id, author_id) FROM stdin;
\.


--
-- Data for Name: payment_flow_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_flow_history (id, te_id, history_date, to_receive, received, to_pay, paid, to_receive_payments, received_payments, to_pay_payments, paid_payments, balance_expected, balance_real) FROM stdin;
\.


--
-- Data for Name: payment_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_group (id, te_id, payer_id, renegotiation_id, recipient_id) FROM stdin;
0fddf1d4-7f1a-11ed-b540-cdedf83415da	392	\N	\N	0f85b0aa-7f1a-11ed-b540-cdedf83415da
0ffa6bc0-7f1a-11ed-b540-cdedf83415da	449	0fa3001e-7f1a-11ed-b540-cdedf83415da	\N	\N
0ffa6bdc-7f1a-11ed-b540-cdedf83415da	477	0fa30026-7f1a-11ed-b540-cdedf83415da	\N	\N
0ffa6bf8-7f1a-11ed-b540-cdedf83415da	505	0fa30022-7f1a-11ed-b540-cdedf83415da	\N	\N
0efa5800-8877-11ed-b1d8-c16b6db879be	720	\N	\N	41fcbdc4-8877-11ed-b1d8-c16b6db879be
13855b3a-8878-11ed-b1d8-c16b6db879be	740	7dbd70de-7fa2-11ed-a8e6-7bb31e5c53d9	\N	\N
1b57c09c-8912-11ed-b1d8-c16b6db879be	798	0fa30022-7f1a-11ed-b540-cdedf83415da	\N	\N
e1f36d52-8a05-11ed-b1d8-c16b6db879be	894	0fa30022-7f1a-11ed-b540-cdedf83415da	\N	\N
\.


--
-- Data for Name: payment_method; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_method (id, te_id, is_active, daily_interest, penalty, method_name, payment_day, closing_day, max_installments, destination_account_id) FROM stdin;
0f2ed44c-7f1a-11ed-b540-cdedf83415da	11	t	0.00	0.00	money	\N	\N	1	0f2ed446-7f1a-11ed-b540-cdedf83415da
0f2ed44d-7f1a-11ed-b540-cdedf83415da	12	t	0.00	0.00	check	\N	\N	12	0f2ed446-7f1a-11ed-b540-cdedf83415da
0f2ed44e-7f1a-11ed-b540-cdedf83415da	13	t	0.00	0.00	bill	\N	\N	12	0f2ed446-7f1a-11ed-b540-cdedf83415da
0f2ed44f-7f1a-11ed-b540-cdedf83415da	14	t	0.00	0.00	card	\N	\N	12	0f2ed446-7f1a-11ed-b540-cdedf83415da
0f2ed450-7f1a-11ed-b540-cdedf83415da	15	t	0.00	0.00	store_credit	\N	\N	1	0f2ed446-7f1a-11ed-b540-cdedf83415da
0f2ed451-7f1a-11ed-b540-cdedf83415da	16	t	0.00	0.00	credit	\N	\N	1	0f2ed446-7f1a-11ed-b540-cdedf83415da
0f2ed452-7f1a-11ed-b540-cdedf83415da	17	t	0.00	0.00	deposit	\N	\N	12	0f2ed446-7f1a-11ed-b540-cdedf83415da
0f2ed453-7f1a-11ed-b540-cdedf83415da	18	t	0.00	0.00	online	\N	\N	1	0f2ed446-7f1a-11ed-b540-cdedf83415da
0f2ed454-7f1a-11ed-b540-cdedf83415da	19	t	0.00	0.00	trade	\N	\N	1	0f2ed446-7f1a-11ed-b540-cdedf83415da
0f2ed455-7f1a-11ed-b540-cdedf83415da	20	t	0.00	0.00	multiple	\N	\N	12	0f2ed446-7f1a-11ed-b540-cdedf83415da
\.


--
-- Data for Name: payment_renegotiation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_renegotiation (id, te_id, identifier, open_date, close_date, status, discount_value, surcharge_value, total, notes, client_id, responsible_id, branch_id, group_id, station_id) FROM stdin;
\.


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.person (id, te_id, name, phone_number, mobile_number, fax_number, email, notes, merged_with_id) FROM stdin;
0f6aad00-7f1a-11ed-b540-cdedf83415da	242	Administrator						\N
0f7506d8-7f1a-11ed-b540-cdedf83415da	249	Stoq Roupas e Acessórios Ltda	48763983		32118271			\N
0f7506dd-7f1a-11ed-b540-cdedf83415da	254	Stoq Comércio Ltda ME	33227766		29782872			\N
0f85b0aa-7f1a-11ed-b540-cdedf83415da	260	Cia de Roupas São Carlos	29048308	20049646				\N
0f8e8c7a-7f1a-11ed-b540-cdedf83415da	265	José Carlos de Carvalho	92832745	81732832				\N
0f962390-7f1a-11ed-b540-cdedf83415da	269	Cleusa Blanc Ferreira Norbiato	51432587	91125487				\N
0f962397-7f1a-11ed-b540-cdedf83415da	276	Maria Aparecida Ardana	87229822	89875432				\N
0f96239e-7f1a-11ed-b540-cdedf83415da	283	Deivis Alexandre Junior	12475930	19323341				\N
0f9623a5-7f1a-11ed-b540-cdedf83415da	290	Osvaldo Denadai Marin	51483661	94212023				\N
0fa3001a-7f1a-11ed-b540-cdedf83415da	297	Franciso Elisio de Lima Junior	86537694	24821710				\N
0fa3001e-7f1a-11ed-b540-cdedf83415da	301	Vitalina Claudino	42012545	54566233				\N
0fa30022-7f1a-11ed-b540-cdedf83415da	305	Luis Sergio da Silva Marin	18743182	15355163				\N
0fa30026-7f1a-11ed-b540-cdedf83415da	309	Alessandra Almeida Itaberá	84123041	70356667				\N
7dbd70de-7fa2-11ed-a8e6-7bb31e5c53d9	654	Vania Machado Martins		48999918733		vania@email.com	Testando	\N
41fcbdc4-8877-11ed-b1d8-c16b6db879be	722	CELESC				celesc@mailinator.com		\N
\.


--
-- Data for Name: plugin_egg; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plugin_egg (id, te_id, plugin_name, egg_md5sum, egg_content) FROM stdin;
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, te_id, consignment, location, part_number, family, brand, model, ncm, ex_tipi, genero, cest, production_time, manage_stock, is_composed, is_grid, is_package, internal_use, width, height, depth, weight, yield_quantity, icms_template_id, ipi_template_id, manufacturer_id, parent_id, pis_template_id, cofins_template_id, c_benef) FROM stdin;
0fb11300-7f1a-11ed-b540-cdedf83415da	343	f						64042000	\N	\N	\N	1	t	f	f	f	f	0.00	0.00	0.00	0.00	1.000	0fb112f1-7f1a-11ed-b540-cdedf83415da	\N	\N	\N	0fb112f2-7f1a-11ed-b540-cdedf83415da	0fb112f3-7f1a-11ed-b540-cdedf83415da	\N
0fb11305-7f1a-11ed-b540-cdedf83415da	350	f						61046900	\N	\N	\N	1	t	f	f	f	f	0.00	0.00	0.00	0.00	1.000	0fb112f1-7f1a-11ed-b540-cdedf83415da	\N	\N	\N	0fb112f2-7f1a-11ed-b540-cdedf83415da	0fb112f3-7f1a-11ed-b540-cdedf83415da	\N
0fb11308-7f1a-11ed-b540-cdedf83415da	355	f						61046900	\N	\N	\N	1	t	f	f	f	f	0.00	0.00	0.00	0.00	1.000	0fb112f1-7f1a-11ed-b540-cdedf83415da	\N	\N	\N	0fb112f2-7f1a-11ed-b540-cdedf83415da	0fb112f3-7f1a-11ed-b540-cdedf83415da	\N
0fb1130d-7f1a-11ed-b540-cdedf83415da	362	f						61022000	\N	\N	\N	1	t	f	f	f	f	0.00	0.00	0.00	0.00	1.000	0fb112f1-7f1a-11ed-b540-cdedf83415da	\N	\N	\N	0fb112f2-7f1a-11ed-b540-cdedf83415da	0fb112f3-7f1a-11ed-b540-cdedf83415da	\N
0fb11312-7f1a-11ed-b540-cdedf83415da	369	f						62063000	\N	\N	\N	1	t	f	f	f	f	0.00	0.00	0.00	0.00	1.000	0fb112f1-7f1a-11ed-b540-cdedf83415da	\N	\N	\N	0fb112f2-7f1a-11ed-b540-cdedf83415da	0fb112f3-7f1a-11ed-b540-cdedf83415da	\N
0fb11315-7f1a-11ed-b540-cdedf83415da	374	f						62064000	\N	\N	\N	1	t	f	f	f	f	0.00	0.00	0.00	0.00	1.000	0fb112f1-7f1a-11ed-b540-cdedf83415da	\N	\N	\N	0fb112f2-7f1a-11ed-b540-cdedf83415da	0fb112f3-7f1a-11ed-b540-cdedf83415da	\N
0fb1131a-7f1a-11ed-b540-cdedf83415da	381	f						61044300	\N	\N	\N	1	t	f	f	f	f	0.00	0.00	0.00	0.00	1.000	0fb112f1-7f1a-11ed-b540-cdedf83415da	\N	\N	\N	0fb112f2-7f1a-11ed-b540-cdedf83415da	0fb112f3-7f1a-11ed-b540-cdedf83415da	\N
051dfb42-85f3-11ed-b1d8-c16b6db879be	707	f						\N	\N	\N	\N	1	t	f	f	f	f	1.00	1.00	1.00	1.00	1.000	\N	\N	\N	\N	\N	\N	\N
92b59368-8911-11ed-b1d8-c16b6db879be	786	f						\N	\N	\N	\N	1	t	f	f	f	f	0.00	0.00	0.00	0.00	1.000	\N	\N	\N	\N	\N	\N	\N
0fb112ed-7f1a-11ed-b540-cdedf83415da	318	f						61046300	\N	\N	\N	1	t	f	f	f	f	0.00	0.00	0.00	0.00	1.000	0fb112f1-7f1a-11ed-b540-cdedf83415da	\N	\N	\N	0fb112f2-7f1a-11ed-b540-cdedf83415da	0fb112f3-7f1a-11ed-b540-cdedf83415da	\N
0fb112f6-7f1a-11ed-b540-cdedf83415da	329	f						61046300	\N	\N	\N	1	t	f	f	f	f	0.00	0.00	0.00	0.00	1.000	0fb112f1-7f1a-11ed-b540-cdedf83415da	\N	\N	\N	0fb112f2-7f1a-11ed-b540-cdedf83415da	0fb112f3-7f1a-11ed-b540-cdedf83415da	\N
0fb112fb-7f1a-11ed-b540-cdedf83415da	336	f						61091000	\N	\N	\N	1	t	f	f	f	f	0.00	0.00	0.00	0.00	1.000	0fb112f1-7f1a-11ed-b540-cdedf83415da	\N	\N	\N	0fb112f2-7f1a-11ed-b540-cdedf83415da	0fb112f3-7f1a-11ed-b540-cdedf83415da	\N
51b7dd26-8a01-11ed-b1d8-c16b6db879be	829	f						\N	\N	\N	\N	1	f	f	t	f	f	0.00	0.00	0.00	0.00	1.000	\N	\N	\N	\N	\N	\N	\N
d750a602-8a01-11ed-b1d8-c16b6db879be	834	f						\N	\N	\N	\N	1	f	f	t	f	f	0.00	0.00	0.00	0.00	1.000	\N	\N	\N	\N	\N	\N	\N
f80b0176-8a01-11ed-b1d8-c16b6db879be	839	f						\N	\N	\N	\N	1	f	f	t	f	f	0.00	0.00	0.00	0.00	1.000	\N	\N	\N	\N	\N	\N	\N
047236dc-8a02-11ed-b1d8-c16b6db879be	844	f						\N	\N	\N	\N	1	f	f	t	f	f	0.00	0.00	0.00	0.00	1.000	\N	\N	\N	\N	\N	\N	\N
e03a4e8e-8a02-11ed-b1d8-c16b6db879be	850	f						\N	\N	\N	\N	1	t	f	f	f	f	0.00	0.00	0.00	0.00	1.000	\N	\N	\N	d750a602-8a01-11ed-b1d8-c16b6db879be	\N	\N	\N
6af150d6-8a03-11ed-b1d8-c16b6db879be	857	f						\N	\N	\N	\N	1	t	f	f	f	f	0.00	0.00	0.00	0.00	1.000	\N	\N	\N	f80b0176-8a01-11ed-b1d8-c16b6db879be	\N	\N	\N
7db8dfc2-8a03-11ed-b1d8-c16b6db879be	862	f						\N	\N	\N	\N	1	t	f	f	f	f	0.00	0.00	0.00	0.00	1.000	\N	\N	\N	047236dc-8a02-11ed-b1d8-c16b6db879be	\N	\N	\N
b0ec6a0a-8911-11ed-b1d8-c16b6db879be	789	f						\N	\N	\N	\N	1	f	f	t	f	f	0.00	0.00	0.00	0.00	1.000	\N	\N	\N	\N	\N	\N	\N
20a1ca18-8a05-11ed-b1d8-c16b6db879be	867	f						\N	\N	\N	\N	1	f	f	t	f	f	0.00	0.00	0.00	0.00	1.000	\N	\N	\N	\N	\N	\N	\N
5fb780f8-8a05-11ed-b1d8-c16b6db879be	871	f						\N	\N	\N	\N	1	t	f	f	f	f	0.00	0.00	0.00	0.00	1.000	\N	\N	\N	20a1ca18-8a05-11ed-b1d8-c16b6db879be	\N	\N	\N
711fd796-8a05-11ed-b1d8-c16b6db879be	875	f						\N	\N	\N	\N	1	t	f	f	f	f	0.00	0.00	0.00	0.00	1.000	\N	\N	\N	20a1ca18-8a05-11ed-b1d8-c16b6db879be	\N	\N	\N
75e74c00-8a05-11ed-b1d8-c16b6db879be	879	f						\N	\N	\N	\N	1	t	f	f	f	f	0.00	0.00	0.00	0.00	1.000	\N	\N	\N	20a1ca18-8a05-11ed-b1d8-c16b6db879be	\N	\N	\N
79384724-8a05-11ed-b1d8-c16b6db879be	883	f						\N	\N	\N	\N	1	t	f	f	f	f	0.00	0.00	0.00	0.00	1.000	\N	\N	\N	20a1ca18-8a05-11ed-b1d8-c16b6db879be	\N	\N	\N
\.


--
-- Data for Name: product_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_attribute (id, te_id, product_id, attribute_id) FROM stdin;
51b7dd27-8a01-11ed-b1d8-c16b6db879be	831	51b7dd26-8a01-11ed-b1d8-c16b6db879be	0538d4c8-8a01-11ed-b1d8-c16b6db879be
51b7dd28-8a01-11ed-b1d8-c16b6db879be	832	51b7dd26-8a01-11ed-b1d8-c16b6db879be	27af90e6-8a01-11ed-b1d8-c16b6db879be
d750a603-8a01-11ed-b1d8-c16b6db879be	836	d750a602-8a01-11ed-b1d8-c16b6db879be	0538d4c8-8a01-11ed-b1d8-c16b6db879be
d750a604-8a01-11ed-b1d8-c16b6db879be	837	d750a602-8a01-11ed-b1d8-c16b6db879be	27af90e6-8a01-11ed-b1d8-c16b6db879be
f80b0177-8a01-11ed-b1d8-c16b6db879be	841	f80b0176-8a01-11ed-b1d8-c16b6db879be	0538d4c8-8a01-11ed-b1d8-c16b6db879be
f80b0178-8a01-11ed-b1d8-c16b6db879be	842	f80b0176-8a01-11ed-b1d8-c16b6db879be	27af90e6-8a01-11ed-b1d8-c16b6db879be
047236dd-8a02-11ed-b1d8-c16b6db879be	846	047236dc-8a02-11ed-b1d8-c16b6db879be	0538d4c8-8a01-11ed-b1d8-c16b6db879be
047236de-8a02-11ed-b1d8-c16b6db879be	847	047236dc-8a02-11ed-b1d8-c16b6db879be	27af90e6-8a01-11ed-b1d8-c16b6db879be
20a1ca19-8a05-11ed-b1d8-c16b6db879be	869	20a1ca18-8a05-11ed-b1d8-c16b6db879be	27af90e6-8a01-11ed-b1d8-c16b6db879be
\.


--
-- Data for Name: product_branch_override; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_branch_override (id, te_id, location, icms_template_id, ipi_template_id, pis_template_id, cofins_template_id, branch_id, product_id, c_benef) FROM stdin;
\.


--
-- Data for Name: product_cofins_template; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_cofins_template (id, te_id, product_tax_template_id, cst, calculo, p_cofins) FROM stdin;
0fb112f3-7f1a-11ed-b540-cdedf83415da	324	0fb112f0-7f1a-11ed-b540-cdedf83415da	99	percentage	10.00
\.


--
-- Data for Name: product_component; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_component (id, te_id, product_id, component_id, design_reference, quantity, price) FROM stdin;
\.


--
-- Data for Name: product_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_history (id, te_id, quantity_sold, quantity_received, quantity_transfered, quantity_consumed, quantity_produced, quantity_lost, sold_date, received_date, production_date, decreased_date, quantity_decreased, branch_id, sellable_id) FROM stdin;
0fddf1f1-7f1a-11ed-b540-cdedf83415da	421	\N	5.000	\N	\N	\N	\N	\N	2008-01-01 00:00:00	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da	0fb112ed-7f1a-11ed-b540-cdedf83415da
0fddf1f4-7f1a-11ed-b540-cdedf83415da	424	\N	5.000	\N	\N	\N	\N	\N	2008-01-01 00:00:00	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da	0fb112f6-7f1a-11ed-b540-cdedf83415da
0fddf1f7-7f1a-11ed-b540-cdedf83415da	427	\N	5.000	\N	\N	\N	\N	\N	2008-01-01 00:00:00	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da	0fb112fb-7f1a-11ed-b540-cdedf83415da
0fddf1fa-7f1a-11ed-b540-cdedf83415da	430	\N	5.000	\N	\N	\N	\N	\N	2008-01-01 00:00:00	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da	0fb11300-7f1a-11ed-b540-cdedf83415da
0fddf1fd-7f1a-11ed-b540-cdedf83415da	433	\N	5.000	\N	\N	\N	\N	\N	2008-01-01 00:00:00	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da	0fb11305-7f1a-11ed-b540-cdedf83415da
0fddf200-7f1a-11ed-b540-cdedf83415da	436	\N	5.000	\N	\N	\N	\N	\N	2008-01-01 00:00:00	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da	0fb11308-7f1a-11ed-b540-cdedf83415da
0fddf203-7f1a-11ed-b540-cdedf83415da	439	\N	5.000	\N	\N	\N	\N	\N	2008-01-01 00:00:00	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da	0fb1130d-7f1a-11ed-b540-cdedf83415da
0fddf206-7f1a-11ed-b540-cdedf83415da	442	\N	5.000	\N	\N	\N	\N	\N	2008-01-01 00:00:00	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da	0fb11312-7f1a-11ed-b540-cdedf83415da
0fddf209-7f1a-11ed-b540-cdedf83415da	445	\N	5.000	\N	\N	\N	\N	\N	2008-01-01 00:00:00	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da	0fb11315-7f1a-11ed-b540-cdedf83415da
0fddf20c-7f1a-11ed-b540-cdedf83415da	448	\N	5.000	\N	\N	\N	\N	\N	2008-01-01 00:00:00	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da	0fb1131a-7f1a-11ed-b540-cdedf83415da
0ffa6bd3-7f1a-11ed-b540-cdedf83415da	468	1.000	\N	\N	\N	\N	\N	2022-12-18 18:22:23.22332	\N	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da	0fb112ed-7f1a-11ed-b540-cdedf83415da
0ffa6bd5-7f1a-11ed-b540-cdedf83415da	470	1.000	\N	\N	\N	\N	\N	2022-12-18 18:22:23.22332	\N	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da	0fb112f6-7f1a-11ed-b540-cdedf83415da
0ffa6bd7-7f1a-11ed-b540-cdedf83415da	472	1.000	\N	\N	\N	\N	\N	2022-12-18 18:22:23.22332	\N	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da	0fb112fb-7f1a-11ed-b540-cdedf83415da
0ffa6bf1-7f1a-11ed-b540-cdedf83415da	498	1.000	\N	\N	\N	\N	\N	2022-12-18 18:22:23.22332	\N	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da	0fb11300-7f1a-11ed-b540-cdedf83415da
0ffa6bf3-7f1a-11ed-b540-cdedf83415da	500	1.000	\N	\N	\N	\N	\N	2022-12-18 18:22:23.22332	\N	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da	0fb11305-7f1a-11ed-b540-cdedf83415da
0ffa6bf5-7f1a-11ed-b540-cdedf83415da	502	1.000	\N	\N	\N	\N	\N	2022-12-18 18:22:23.22332	\N	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da	0fb11308-7f1a-11ed-b540-cdedf83415da
0ffa6c0b-7f1a-11ed-b540-cdedf83415da	524	1.000	\N	\N	\N	\N	\N	2022-12-18 18:22:23.22332	\N	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da	0fb1130d-7f1a-11ed-b540-cdedf83415da
0ffa6c0d-7f1a-11ed-b540-cdedf83415da	526	1.000	\N	\N	\N	\N	\N	2022-12-18 18:22:23.22332	\N	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da	0fb11312-7f1a-11ed-b540-cdedf83415da
0ffa6c0f-7f1a-11ed-b540-cdedf83415da	528	1.000	\N	\N	\N	\N	\N	2022-12-18 18:22:23.22332	\N	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da	0fb11315-7f1a-11ed-b540-cdedf83415da
1036b6f5-7f1a-11ed-b540-cdedf83415da	584	\N	\N	1.000	\N	\N	\N	\N	\N	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da	0fb112ed-7f1a-11ed-b540-cdedf83415da
1036b6f7-7f1a-11ed-b540-cdedf83415da	586	\N	\N	1.000	\N	\N	\N	\N	\N	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da	0fb112f6-7f1a-11ed-b540-cdedf83415da
1036b6f9-7f1a-11ed-b540-cdedf83415da	588	\N	\N	1.000	\N	\N	\N	\N	\N	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da	0fb112fb-7f1a-11ed-b540-cdedf83415da
1036b6fb-7f1a-11ed-b540-cdedf83415da	590	\N	\N	1.000	\N	\N	\N	\N	\N	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da	0fb11300-7f1a-11ed-b540-cdedf83415da
1036b6fd-7f1a-11ed-b540-cdedf83415da	592	\N	\N	1.000	\N	\N	\N	\N	\N	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da	0fb11305-7f1a-11ed-b540-cdedf83415da
1036b6ff-7f1a-11ed-b540-cdedf83415da	594	\N	\N	1.000	\N	\N	\N	\N	\N	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da	0fb11308-7f1a-11ed-b540-cdedf83415da
1036b701-7f1a-11ed-b540-cdedf83415da	596	\N	\N	1.000	\N	\N	\N	\N	\N	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da	0fb1130d-7f1a-11ed-b540-cdedf83415da
1036b703-7f1a-11ed-b540-cdedf83415da	598	\N	\N	1.000	\N	\N	\N	\N	\N	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da	0fb11312-7f1a-11ed-b540-cdedf83415da
1036b705-7f1a-11ed-b540-cdedf83415da	600	\N	\N	1.000	\N	\N	\N	\N	\N	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da	0fb11315-7f1a-11ed-b540-cdedf83415da
1036b707-7f1a-11ed-b540-cdedf83415da	602	\N	\N	1.000	\N	\N	\N	\N	\N	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da	0fb1131a-7f1a-11ed-b540-cdedf83415da
310b4df0-8878-11ed-b1d8-c16b6db879be	759	1.000	\N	\N	\N	\N	\N	2022-12-30 16:28:02.322831	\N	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da	0fb1131a-7f1a-11ed-b540-cdedf83415da
310b4df2-8878-11ed-b1d8-c16b6db879be	761	1.000	\N	\N	\N	\N	\N	2022-12-30 16:28:02.322831	\N	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da	0fb11300-7f1a-11ed-b540-cdedf83415da
5235a610-8912-11ed-b1d8-c16b6db879be	809	1.000	\N	\N	\N	\N	\N	2022-12-31 10:50:37.935869	\N	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da	92b59368-8911-11ed-b1d8-c16b6db879be
e8c42203-8a05-11ed-b1d8-c16b6db879be	908	1.000	\N	\N	\N	\N	\N	2023-01-01 15:55:38.857773	\N	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da	5fb780f8-8a05-11ed-b1d8-c16b6db879be
e8c42205-8a05-11ed-b1d8-c16b6db879be	910	1.000	\N	\N	\N	\N	\N	2023-01-01 15:55:38.857773	\N	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da	e03a4e8e-8a02-11ed-b1d8-c16b6db879be
\.


--
-- Data for Name: product_icms_template; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_icms_template (id, te_id, product_tax_template_id, bc_include_ipi, bc_st_include_ipi, cst, csosn, orig, mod_bc, mod_bc_st, p_cred_sn, p_cred_sn_valid_until, p_icms, p_icms_st, p_mva_st, p_red_bc, p_red_bc_st, p_fcp, p_fcp_st, mot_des_icms) FROM stdin;
0fb112f1-7f1a-11ed-b540-cdedf83415da	322	0fb112ee-7f1a-11ed-b540-cdedf83415da	t	t	\N	102	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: product_ipi_template; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_ipi_template (id, te_id, product_tax_template_id, cl_enq, cnpj_prod, c_selo, q_selo, c_enq, calculo, cst, p_ipi, q_unid) FROM stdin;
\.


--
-- Data for Name: product_manufacturer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_manufacturer (id, te_id, name, code) FROM stdin;
\.


--
-- Data for Name: product_option_map; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_option_map (id, te_id, product_id, attribute_id, option_id) FROM stdin;
e03a4e8f-8a02-11ed-b1d8-c16b6db879be	852	e03a4e8e-8a02-11ed-b1d8-c16b6db879be	0538d4c8-8a01-11ed-b1d8-c16b6db879be	196771ac-8a01-11ed-b1d8-c16b6db879be
e03a4e90-8a02-11ed-b1d8-c16b6db879be	853	e03a4e8e-8a02-11ed-b1d8-c16b6db879be	27af90e6-8a01-11ed-b1d8-c16b6db879be	3214f698-8a01-11ed-b1d8-c16b6db879be
6af150d7-8a03-11ed-b1d8-c16b6db879be	859	6af150d6-8a03-11ed-b1d8-c16b6db879be	27af90e6-8a01-11ed-b1d8-c16b6db879be	3214f698-8a01-11ed-b1d8-c16b6db879be
6af150d8-8a03-11ed-b1d8-c16b6db879be	860	6af150d6-8a03-11ed-b1d8-c16b6db879be	0538d4c8-8a01-11ed-b1d8-c16b6db879be	196771ac-8a01-11ed-b1d8-c16b6db879be
7db8dfc3-8a03-11ed-b1d8-c16b6db879be	864	7db8dfc2-8a03-11ed-b1d8-c16b6db879be	0538d4c8-8a01-11ed-b1d8-c16b6db879be	196771ac-8a01-11ed-b1d8-c16b6db879be
7db8dfc4-8a03-11ed-b1d8-c16b6db879be	865	7db8dfc2-8a03-11ed-b1d8-c16b6db879be	27af90e6-8a01-11ed-b1d8-c16b6db879be	2a8a1d5e-8a01-11ed-b1d8-c16b6db879be
5fb780f9-8a05-11ed-b1d8-c16b6db879be	873	5fb780f8-8a05-11ed-b1d8-c16b6db879be	27af90e6-8a01-11ed-b1d8-c16b6db879be	3214f698-8a01-11ed-b1d8-c16b6db879be
711fd797-8a05-11ed-b1d8-c16b6db879be	877	711fd796-8a05-11ed-b1d8-c16b6db879be	27af90e6-8a01-11ed-b1d8-c16b6db879be	30229994-8a01-11ed-b1d8-c16b6db879be
75e74c01-8a05-11ed-b1d8-c16b6db879be	881	75e74c00-8a05-11ed-b1d8-c16b6db879be	27af90e6-8a01-11ed-b1d8-c16b6db879be	2a8a1d5e-8a01-11ed-b1d8-c16b6db879be
79384725-8a05-11ed-b1d8-c16b6db879be	885	79384724-8a05-11ed-b1d8-c16b6db879be	27af90e6-8a01-11ed-b1d8-c16b6db879be	2d571bc2-8a01-11ed-b1d8-c16b6db879be
\.


--
-- Data for Name: product_pis_template; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_pis_template (id, te_id, product_tax_template_id, cst, calculo, p_pis) FROM stdin;
0fb112f2-7f1a-11ed-b540-cdedf83415da	323	0fb112ef-7f1a-11ed-b540-cdedf83415da	99	percentage	10.00
\.


--
-- Data for Name: product_quality_test; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_quality_test (id, te_id, product_id, test_type, description, notes, success_value) FROM stdin;
\.


--
-- Data for Name: product_stock_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_stock_item (id, te_id, stock_cost, quantity, storable_id, batch_id, branch_id) FROM stdin;
0fddf1f0-7f1a-11ed-b540-cdedf83415da	420	70.00000000	3.000	0fb112ed-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
0fddf1f3-7f1a-11ed-b540-cdedf83415da	423	139.00000000	3.000	0fb112f6-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
0fddf1f6-7f1a-11ed-b540-cdedf83415da	426	56.00000000	3.000	0fb112fb-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
0fddf1fc-7f1a-11ed-b540-cdedf83415da	432	101.00000000	3.000	0fb11305-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
0fddf1ff-7f1a-11ed-b540-cdedf83415da	435	325.00000000	3.000	0fb11308-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
0fddf202-7f1a-11ed-b540-cdedf83415da	438	401.00000000	3.000	0fb1130d-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
0fddf205-7f1a-11ed-b540-cdedf83415da	441	153.00000000	3.000	0fb11312-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
0fddf208-7f1a-11ed-b540-cdedf83415da	444	99.00000000	3.000	0fb11315-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
1036b709-7f1a-11ed-b540-cdedf83415da	604	70.00000000	1.000	0fb112ed-7f1a-11ed-b540-cdedf83415da	\N	0f7506e0-7f1a-11ed-b540-cdedf83415da
1036b70b-7f1a-11ed-b540-cdedf83415da	606	139.00000000	1.000	0fb112f6-7f1a-11ed-b540-cdedf83415da	\N	0f7506e0-7f1a-11ed-b540-cdedf83415da
1036b70d-7f1a-11ed-b540-cdedf83415da	608	56.00000000	1.000	0fb112fb-7f1a-11ed-b540-cdedf83415da	\N	0f7506e0-7f1a-11ed-b540-cdedf83415da
1036b70f-7f1a-11ed-b540-cdedf83415da	610	43.00000000	1.000	0fb11300-7f1a-11ed-b540-cdedf83415da	\N	0f7506e0-7f1a-11ed-b540-cdedf83415da
1036b711-7f1a-11ed-b540-cdedf83415da	612	101.00000000	1.000	0fb11305-7f1a-11ed-b540-cdedf83415da	\N	0f7506e0-7f1a-11ed-b540-cdedf83415da
1036b713-7f1a-11ed-b540-cdedf83415da	614	325.00000000	1.000	0fb11308-7f1a-11ed-b540-cdedf83415da	\N	0f7506e0-7f1a-11ed-b540-cdedf83415da
1036b715-7f1a-11ed-b540-cdedf83415da	616	401.00000000	1.000	0fb1130d-7f1a-11ed-b540-cdedf83415da	\N	0f7506e0-7f1a-11ed-b540-cdedf83415da
1036b717-7f1a-11ed-b540-cdedf83415da	618	153.00000000	1.000	0fb11312-7f1a-11ed-b540-cdedf83415da	\N	0f7506e0-7f1a-11ed-b540-cdedf83415da
1036b719-7f1a-11ed-b540-cdedf83415da	620	99.00000000	1.000	0fb11315-7f1a-11ed-b540-cdedf83415da	\N	0f7506e0-7f1a-11ed-b540-cdedf83415da
1036b71b-7f1a-11ed-b540-cdedf83415da	622	199.00000000	1.000	0fb1131a-7f1a-11ed-b540-cdedf83415da	\N	0f7506e0-7f1a-11ed-b540-cdedf83415da
0fddf20b-7f1a-11ed-b540-cdedf83415da	447	199.00000000	3.000	0fb1131a-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
0fddf1f9-7f1a-11ed-b540-cdedf83415da	429	43.00000000	2.000	0fb11300-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
f91839d1-8911-11ed-b1d8-c16b6db879be	793	8.00000000	200.000	051dfb42-85f3-11ed-b1d8-c16b6db879be	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
04af1a21-8912-11ed-b1d8-c16b6db879be	797	2.00000000	90.000	b0ec6a0a-8911-11ed-b1d8-c16b6db879be	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
ff139515-8911-11ed-b1d8-c16b6db879be	795	2.00000000	119.000	92b59368-8911-11ed-b1d8-c16b6db879be	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
a44ed8a7-8a05-11ed-b1d8-c16b6db879be	889	53.00000000	41.000	711fd796-8a05-11ed-b1d8-c16b6db879be	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
aa6c74fb-8a05-11ed-b1d8-c16b6db879be	891	50.00000000	12.000	75e74c00-8a05-11ed-b1d8-c16b6db879be	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
b221da3d-8a05-11ed-b1d8-c16b6db879be	893	50.00000000	23.000	79384724-8a05-11ed-b1d8-c16b6db879be	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
9c8733a3-8a05-11ed-b1d8-c16b6db879be	887	51.00000000	31.000	5fb780f8-8a05-11ed-b1d8-c16b6db879be	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
1fa0e3a9-8a03-11ed-b1d8-c16b6db879be	855	66.00000000	11.000	e03a4e8e-8a02-11ed-b1d8-c16b6db879be	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
\.


--
-- Data for Name: product_supplier_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_supplier_info (id, te_id, supplier_code, base_cost, notes, is_main_supplier, icms, lead_time, minimum_purchase, supplier_id, product_id, branch_id) FROM stdin;
0fb112f4-7f1a-11ed-b540-cdedf83415da	325		70.00000000		t	0.00	1	1.000	0f85b0ad-7f1a-11ed-b540-cdedf83415da	0fb112ed-7f1a-11ed-b540-cdedf83415da	\N
0fb112f7-7f1a-11ed-b540-cdedf83415da	330		139.00000000		t	0.00	1	1.000	0f85b0ad-7f1a-11ed-b540-cdedf83415da	0fb112f6-7f1a-11ed-b540-cdedf83415da	\N
0fb112fc-7f1a-11ed-b540-cdedf83415da	337		56.00000000		t	0.00	1	1.000	0f85b0ad-7f1a-11ed-b540-cdedf83415da	0fb112fb-7f1a-11ed-b540-cdedf83415da	\N
0fb11301-7f1a-11ed-b540-cdedf83415da	344		43.00000000		t	0.00	1	1.000	0f85b0ad-7f1a-11ed-b540-cdedf83415da	0fb11300-7f1a-11ed-b540-cdedf83415da	\N
0fb11306-7f1a-11ed-b540-cdedf83415da	351		101.00000000		t	0.00	1	1.000	0f85b0ad-7f1a-11ed-b540-cdedf83415da	0fb11305-7f1a-11ed-b540-cdedf83415da	\N
0fb11309-7f1a-11ed-b540-cdedf83415da	356		325.00000000		t	0.00	1	1.000	0f85b0ad-7f1a-11ed-b540-cdedf83415da	0fb11308-7f1a-11ed-b540-cdedf83415da	\N
0fb1130e-7f1a-11ed-b540-cdedf83415da	363		401.00000000		t	0.00	1	1.000	0f85b0ad-7f1a-11ed-b540-cdedf83415da	0fb1130d-7f1a-11ed-b540-cdedf83415da	\N
0fb11313-7f1a-11ed-b540-cdedf83415da	370		153.00000000		t	0.00	1	1.000	0f85b0ad-7f1a-11ed-b540-cdedf83415da	0fb11312-7f1a-11ed-b540-cdedf83415da	\N
0fb11316-7f1a-11ed-b540-cdedf83415da	375		99.00000000		t	0.00	1	1.000	0f85b0ad-7f1a-11ed-b540-cdedf83415da	0fb11315-7f1a-11ed-b540-cdedf83415da	\N
0fb1131b-7f1a-11ed-b540-cdedf83415da	382		199.00000000		t	0.00	1	1.000	0f85b0ad-7f1a-11ed-b540-cdedf83415da	0fb1131a-7f1a-11ed-b540-cdedf83415da	\N
\.


--
-- Data for Name: product_tax_template; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_tax_template (id, te_id, name, tax_type) FROM stdin;
0fb112ee-7f1a-11ed-b540-cdedf83415da	319	icms	icms
0fb112ef-7f1a-11ed-b540-cdedf83415da	320	pis	pis
0fb112f0-7f1a-11ed-b540-cdedf83415da	321	cofins	cofins
\.


--
-- Data for Name: production_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.production_item (id, te_id, quantity, produced, lost, product_id, order_id) FROM stdin;
\.


--
-- Data for Name: production_item_quality_result; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.production_item_quality_result (id, te_id, produced_item_id, quality_test_id, tested_by_id, tested_date, result_value, test_passed) FROM stdin;
\.


--
-- Data for Name: production_material; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.production_material (id, te_id, needed, consumed, allocated, to_purchase, to_make, lost, order_id, product_id) FROM stdin;
\.


--
-- Data for Name: production_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.production_order (id, te_id, identifier, status, open_date, close_date, expected_start_date, start_date, cancel_date, description, responsible_id, branch_id, station_id) FROM stdin;
\.


--
-- Data for Name: production_produced_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.production_produced_item (id, te_id, order_id, product_id, produced_by_id, produced_date, serial_number, entered_stock, test_passed) FROM stdin;
\.


--
-- Data for Name: production_service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.production_service (id, te_id, quantity, service_id, order_id) FROM stdin;
\.


--
-- Data for Name: profile_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profile_settings (id, te_id, app_dir_name, has_permission, user_profile_id) FROM stdin;
0f4c5d15-7f1a-11ed-b540-cdedf83415da	159	admin	t	0f4c5d14-7f1a-11ed-b540-cdedf83415da
0f4c5d16-7f1a-11ed-b540-cdedf83415da	160	calendar	t	0f4c5d14-7f1a-11ed-b540-cdedf83415da
0f4c5d17-7f1a-11ed-b540-cdedf83415da	161	delivery	t	0f4c5d14-7f1a-11ed-b540-cdedf83415da
0f4c5d18-7f1a-11ed-b540-cdedf83415da	162	financial	t	0f4c5d14-7f1a-11ed-b540-cdedf83415da
0f4c5d19-7f1a-11ed-b540-cdedf83415da	163	inventory	t	0f4c5d14-7f1a-11ed-b540-cdedf83415da
0f4c5d1a-7f1a-11ed-b540-cdedf83415da	164	link	t	0f4c5d14-7f1a-11ed-b540-cdedf83415da
0f4c5d1b-7f1a-11ed-b540-cdedf83415da	165	payable	t	0f4c5d14-7f1a-11ed-b540-cdedf83415da
0f4c5d1c-7f1a-11ed-b540-cdedf83415da	166	pos	t	0f4c5d14-7f1a-11ed-b540-cdedf83415da
0f4c5d1d-7f1a-11ed-b540-cdedf83415da	167	production	t	0f4c5d14-7f1a-11ed-b540-cdedf83415da
0f4c5d1e-7f1a-11ed-b540-cdedf83415da	168	purchase	t	0f4c5d14-7f1a-11ed-b540-cdedf83415da
0f4c5d1f-7f1a-11ed-b540-cdedf83415da	169	receivable	t	0f4c5d14-7f1a-11ed-b540-cdedf83415da
0f4c5d20-7f1a-11ed-b540-cdedf83415da	170	sales	t	0f4c5d14-7f1a-11ed-b540-cdedf83415da
0f4c5d21-7f1a-11ed-b540-cdedf83415da	171	services	t	0f4c5d14-7f1a-11ed-b540-cdedf83415da
0f4c5d22-7f1a-11ed-b540-cdedf83415da	172	stock	t	0f4c5d14-7f1a-11ed-b540-cdedf83415da
0f4c5d23-7f1a-11ed-b540-cdedf83415da	173	till	t	0f4c5d14-7f1a-11ed-b540-cdedf83415da
0f4c5d25-7f1a-11ed-b540-cdedf83415da	175	admin	t	0f4c5d24-7f1a-11ed-b540-cdedf83415da
0f4c5d26-7f1a-11ed-b540-cdedf83415da	176	calendar	t	0f4c5d24-7f1a-11ed-b540-cdedf83415da
0f4c5d27-7f1a-11ed-b540-cdedf83415da	177	delivery	t	0f4c5d24-7f1a-11ed-b540-cdedf83415da
0f4c5d28-7f1a-11ed-b540-cdedf83415da	178	financial	t	0f4c5d24-7f1a-11ed-b540-cdedf83415da
0f4c5d29-7f1a-11ed-b540-cdedf83415da	179	inventory	t	0f4c5d24-7f1a-11ed-b540-cdedf83415da
0f4c5d2a-7f1a-11ed-b540-cdedf83415da	180	link	t	0f4c5d24-7f1a-11ed-b540-cdedf83415da
0f4c5d2b-7f1a-11ed-b540-cdedf83415da	181	payable	t	0f4c5d24-7f1a-11ed-b540-cdedf83415da
0f4c5d2c-7f1a-11ed-b540-cdedf83415da	182	pos	t	0f4c5d24-7f1a-11ed-b540-cdedf83415da
0f4c5d2d-7f1a-11ed-b540-cdedf83415da	183	production	t	0f4c5d24-7f1a-11ed-b540-cdedf83415da
0f4c5d2e-7f1a-11ed-b540-cdedf83415da	184	purchase	t	0f4c5d24-7f1a-11ed-b540-cdedf83415da
0f4c5d2f-7f1a-11ed-b540-cdedf83415da	185	receivable	t	0f4c5d24-7f1a-11ed-b540-cdedf83415da
0f4c5d30-7f1a-11ed-b540-cdedf83415da	186	sales	t	0f4c5d24-7f1a-11ed-b540-cdedf83415da
0f4c5d31-7f1a-11ed-b540-cdedf83415da	187	services	t	0f4c5d24-7f1a-11ed-b540-cdedf83415da
0f4c5d32-7f1a-11ed-b540-cdedf83415da	188	stock	t	0f4c5d24-7f1a-11ed-b540-cdedf83415da
0f4c5d33-7f1a-11ed-b540-cdedf83415da	189	till	t	0f4c5d24-7f1a-11ed-b540-cdedf83415da
0f4c5d35-7f1a-11ed-b540-cdedf83415da	191	admin	f	0f4c5d34-7f1a-11ed-b540-cdedf83415da
0f4c5d36-7f1a-11ed-b540-cdedf83415da	192	calendar	f	0f4c5d34-7f1a-11ed-b540-cdedf83415da
0f4c5d37-7f1a-11ed-b540-cdedf83415da	193	delivery	f	0f4c5d34-7f1a-11ed-b540-cdedf83415da
0f4c5d38-7f1a-11ed-b540-cdedf83415da	194	financial	f	0f4c5d34-7f1a-11ed-b540-cdedf83415da
0f4c5d39-7f1a-11ed-b540-cdedf83415da	195	inventory	f	0f4c5d34-7f1a-11ed-b540-cdedf83415da
0f4c5d3a-7f1a-11ed-b540-cdedf83415da	196	link	f	0f4c5d34-7f1a-11ed-b540-cdedf83415da
0f4c5d3b-7f1a-11ed-b540-cdedf83415da	197	payable	f	0f4c5d34-7f1a-11ed-b540-cdedf83415da
0f4c5d3d-7f1a-11ed-b540-cdedf83415da	199	production	f	0f4c5d34-7f1a-11ed-b540-cdedf83415da
0f4c5d3e-7f1a-11ed-b540-cdedf83415da	200	purchase	f	0f4c5d34-7f1a-11ed-b540-cdedf83415da
0f4c5d3f-7f1a-11ed-b540-cdedf83415da	201	receivable	f	0f4c5d34-7f1a-11ed-b540-cdedf83415da
0f4c5d41-7f1a-11ed-b540-cdedf83415da	203	services	f	0f4c5d34-7f1a-11ed-b540-cdedf83415da
0f4c5d42-7f1a-11ed-b540-cdedf83415da	204	stock	f	0f4c5d34-7f1a-11ed-b540-cdedf83415da
0f4c5d3c-7f1a-11ed-b540-cdedf83415da	198	pos	t	0f4c5d34-7f1a-11ed-b540-cdedf83415da
0f4c5d40-7f1a-11ed-b540-cdedf83415da	202	sales	t	0f4c5d34-7f1a-11ed-b540-cdedf83415da
0f4c5d43-7f1a-11ed-b540-cdedf83415da	205	till	t	0f4c5d34-7f1a-11ed-b540-cdedf83415da
\.


--
-- Data for Name: purchase_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchase_item (id, te_id, quantity, quantity_received, base_cost, cost, expected_receival_date, sellable_id, order_id, parent_item_id, quantity_sold, quantity_returned, ipi_value, icms_st_value) FROM stdin;
0fddf1d6-7f1a-11ed-b540-cdedf83415da	394	5.000	5.000	70.00000000	70.00000000	\N	0fb112ed-7f1a-11ed-b540-cdedf83415da	0fddf1d5-7f1a-11ed-b540-cdedf83415da	\N	0.000	0.000	0.00	0.00
0fddf1d7-7f1a-11ed-b540-cdedf83415da	395	5.000	5.000	139.00000000	139.00000000	\N	0fb112f6-7f1a-11ed-b540-cdedf83415da	0fddf1d5-7f1a-11ed-b540-cdedf83415da	\N	0.000	0.000	0.00	0.00
0fddf1d8-7f1a-11ed-b540-cdedf83415da	396	5.000	5.000	56.00000000	56.00000000	\N	0fb112fb-7f1a-11ed-b540-cdedf83415da	0fddf1d5-7f1a-11ed-b540-cdedf83415da	\N	0.000	0.000	0.00	0.00
0fddf1d9-7f1a-11ed-b540-cdedf83415da	397	5.000	5.000	43.00000000	43.00000000	\N	0fb11300-7f1a-11ed-b540-cdedf83415da	0fddf1d5-7f1a-11ed-b540-cdedf83415da	\N	0.000	0.000	0.00	0.00
0fddf1da-7f1a-11ed-b540-cdedf83415da	398	5.000	5.000	101.00000000	101.00000000	\N	0fb11305-7f1a-11ed-b540-cdedf83415da	0fddf1d5-7f1a-11ed-b540-cdedf83415da	\N	0.000	0.000	0.00	0.00
0fddf1db-7f1a-11ed-b540-cdedf83415da	399	5.000	5.000	325.00000000	325.00000000	\N	0fb11308-7f1a-11ed-b540-cdedf83415da	0fddf1d5-7f1a-11ed-b540-cdedf83415da	\N	0.000	0.000	0.00	0.00
0fddf1dc-7f1a-11ed-b540-cdedf83415da	400	5.000	5.000	401.00000000	401.00000000	\N	0fb1130d-7f1a-11ed-b540-cdedf83415da	0fddf1d5-7f1a-11ed-b540-cdedf83415da	\N	0.000	0.000	0.00	0.00
0fddf1dd-7f1a-11ed-b540-cdedf83415da	401	5.000	5.000	153.00000000	153.00000000	\N	0fb11312-7f1a-11ed-b540-cdedf83415da	0fddf1d5-7f1a-11ed-b540-cdedf83415da	\N	0.000	0.000	0.00	0.00
0fddf1de-7f1a-11ed-b540-cdedf83415da	402	5.000	5.000	99.00000000	99.00000000	\N	0fb11315-7f1a-11ed-b540-cdedf83415da	0fddf1d5-7f1a-11ed-b540-cdedf83415da	\N	0.000	0.000	0.00	0.00
0fddf1df-7f1a-11ed-b540-cdedf83415da	403	5.000	5.000	199.00000000	199.00000000	\N	0fb1131a-7f1a-11ed-b540-cdedf83415da	0fddf1d5-7f1a-11ed-b540-cdedf83415da	\N	0.000	0.000	0.00	0.00
\.


--
-- Data for Name: purchase_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchase_order (id, te_id, identifier, status, open_date, quote_deadline, expected_receival_date, expected_pay_date, receival_date, confirm_date, notes, salesperson_name, freight_type, expected_freight, surcharge_value, discount_value, consigned, supplier_id, branch_id, transporter_id, responsible_id, group_id, work_order_id, station_id) FROM stdin;
0fddf1d5-7f1a-11ed-b540-cdedf83415da	393	1	closed	2008-01-01 00:00:00	\N	2022-12-18 18:22:23.044447	2022-12-18 18:22:23.044439	\N	2022-12-18 18:22:23.037531			fob	0.00	0.00	0.00	f	0f85b0ad-7f1a-11ed-b540-cdedf83415da	0f7506db-7f1a-11ed-b540-cdedf83415da	0f8e8c7d-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fddf1d4-7f1a-11ed-b540-cdedf83415da	\N	0facff84-7f1a-11ed-b540-cdedf83415da
\.


--
-- Data for Name: purchase_receiving_map; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchase_receiving_map (id, te_id, purchase_id, receiving_id) FROM stdin;
0fddf1e3-7f1a-11ed-b540-cdedf83415da	407	0fddf1d5-7f1a-11ed-b540-cdedf83415da	0fddf1e2-7f1a-11ed-b540-cdedf83415da
\.


--
-- Data for Name: quotation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.quotation (id, te_id, identifier, purchase_id, branch_id, group_id, station_id) FROM stdin;
\.


--
-- Data for Name: quote_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.quote_group (id, te_id, identifier, branch_id, station_id) FROM stdin;
\.


--
-- Data for Name: receiving_invoice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.receiving_invoice (id, te_id, identifier, invoice_number, invoice_series, invoice_key, freight_total, surcharge_value, discount_value, icms_total, icms_st_total, ipi_total, expense_value, secure_value, invoice_total, freight_type, notes, branch_id, group_id, supplier_id, transporter_id, responsible_id, station_id) FROM stdin;
0fddf1e1-7f1a-11ed-b540-cdedf83415da	405	1	1	\N	\N	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	7930.00	fob-payment	\N	0f7506db-7f1a-11ed-b540-cdedf83415da	\N	0f85b0ad-7f1a-11ed-b540-cdedf83415da	0f8e8c7d-7f1a-11ed-b540-cdedf83415da	\N	0facff84-7f1a-11ed-b540-cdedf83415da
\.


--
-- Data for Name: receiving_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.receiving_order (id, te_id, identifier, status, receival_date, confirm_date, notes, invoice_number, packing_number, cfop_id, responsible_id, branch_id, receiving_invoice_id, station_id) FROM stdin;
0fddf1e2-7f1a-11ed-b540-cdedf83415da	406	1	pending	2008-01-01 00:00:00	\N		1	\N	0f2ed4cf-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0f7506db-7f1a-11ed-b540-cdedf83415da	0fddf1e1-7f1a-11ed-b540-cdedf83415da	0facff84-7f1a-11ed-b540-cdedf83415da
\.


--
-- Data for Name: receiving_order_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.receiving_order_item (id, te_id, quantity, cost, ipi_value, icms_st_value, sellable_id, batch_id, receiving_order_id, purchase_item_id, parent_item_id) FROM stdin;
0fddf1e4-7f1a-11ed-b540-cdedf83415da	408	5.000	70.00000000	0.00	0.00	0fb112ed-7f1a-11ed-b540-cdedf83415da	\N	0fddf1e2-7f1a-11ed-b540-cdedf83415da	0fddf1d6-7f1a-11ed-b540-cdedf83415da	\N
0fddf1e5-7f1a-11ed-b540-cdedf83415da	409	5.000	139.00000000	0.00	0.00	0fb112f6-7f1a-11ed-b540-cdedf83415da	\N	0fddf1e2-7f1a-11ed-b540-cdedf83415da	0fddf1d7-7f1a-11ed-b540-cdedf83415da	\N
0fddf1e6-7f1a-11ed-b540-cdedf83415da	410	5.000	56.00000000	0.00	0.00	0fb112fb-7f1a-11ed-b540-cdedf83415da	\N	0fddf1e2-7f1a-11ed-b540-cdedf83415da	0fddf1d8-7f1a-11ed-b540-cdedf83415da	\N
0fddf1e7-7f1a-11ed-b540-cdedf83415da	411	5.000	43.00000000	0.00	0.00	0fb11300-7f1a-11ed-b540-cdedf83415da	\N	0fddf1e2-7f1a-11ed-b540-cdedf83415da	0fddf1d9-7f1a-11ed-b540-cdedf83415da	\N
0fddf1e8-7f1a-11ed-b540-cdedf83415da	412	5.000	101.00000000	0.00	0.00	0fb11305-7f1a-11ed-b540-cdedf83415da	\N	0fddf1e2-7f1a-11ed-b540-cdedf83415da	0fddf1da-7f1a-11ed-b540-cdedf83415da	\N
0fddf1e9-7f1a-11ed-b540-cdedf83415da	413	5.000	325.00000000	0.00	0.00	0fb11308-7f1a-11ed-b540-cdedf83415da	\N	0fddf1e2-7f1a-11ed-b540-cdedf83415da	0fddf1db-7f1a-11ed-b540-cdedf83415da	\N
0fddf1ea-7f1a-11ed-b540-cdedf83415da	414	5.000	401.00000000	0.00	0.00	0fb1130d-7f1a-11ed-b540-cdedf83415da	\N	0fddf1e2-7f1a-11ed-b540-cdedf83415da	0fddf1dc-7f1a-11ed-b540-cdedf83415da	\N
0fddf1eb-7f1a-11ed-b540-cdedf83415da	415	5.000	153.00000000	0.00	0.00	0fb11312-7f1a-11ed-b540-cdedf83415da	\N	0fddf1e2-7f1a-11ed-b540-cdedf83415da	0fddf1dd-7f1a-11ed-b540-cdedf83415da	\N
0fddf1ec-7f1a-11ed-b540-cdedf83415da	416	5.000	99.00000000	0.00	0.00	0fb11315-7f1a-11ed-b540-cdedf83415da	\N	0fddf1e2-7f1a-11ed-b540-cdedf83415da	0fddf1de-7f1a-11ed-b540-cdedf83415da	\N
0fddf1ed-7f1a-11ed-b540-cdedf83415da	417	5.000	199.00000000	0.00	0.00	0fb1131a-7f1a-11ed-b540-cdedf83415da	\N	0fddf1e2-7f1a-11ed-b540-cdedf83415da	0fddf1df-7f1a-11ed-b540-cdedf83415da	\N
\.


--
-- Data for Name: returned_sale; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.returned_sale (id, te_id, identifier, status, return_date, confirm_date, reason, undo_date, undo_reason, undo_responsible_id, responsible_id, confirm_responsible_id, branch_id, sale_id, new_sale_id, invoice_id, station_id) FROM stdin;
\.


--
-- Data for Name: returned_sale_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.returned_sale_item (id, te_id, quantity, price, sellable_id, batch_id, sale_item_id, returned_sale_id, icms_info_id, ipi_info_id, pis_info_id, cofins_info_id, parent_item_id) FROM stdin;
\.


--
-- Data for Name: sale; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sale (id, te_id, identifier, coupon_id, service_invoice_number, status, discount_value, surcharge_value, total_amount, open_date, close_date, confirm_date, cancel_date, return_date, expire_date, paid, cancel_reason, client_id, client_category_id, cfop_id, salesperson_id, branch_id, group_id, transporter_id, invoice_id, sale_token_id, cancel_responsible_id, cost_center_id, station_id) FROM stdin;
0ffa6bc2-7f1a-11ed-b540-cdedf83415da	451	1	1001	\N	confirmed	0.00	0.00	436.00	2008-01-01 00:00:00	2022-12-18 18:22:23.22332	2022-12-18 18:22:23.22332	\N	\N	\N	t	\N	0fa30021-7f1a-11ed-b540-cdedf83415da	\N	0f2ed4cb-7f1a-11ed-b540-cdedf83415da	0f9623a4-7f1a-11ed-b540-cdedf83415da	0f7506db-7f1a-11ed-b540-cdedf83415da	0ffa6bc0-7f1a-11ed-b540-cdedf83415da	\N	0ffa6bc1-7f1a-11ed-b540-cdedf83415da	\N	\N	\N	0facff84-7f1a-11ed-b540-cdedf83415da
e1f36d54-8a05-11ed-b1d8-c16b6db879be	896	7	0	\N	confirmed	0.00	0.00	128.00	2023-01-01 15:55:38.867341	2023-01-01 15:55:38.857773	2023-01-01 15:55:38.857773	\N	\N	\N	t	\N	0fa30025-7f1a-11ed-b540-cdedf83415da	\N	0f2ed4cb-7f1a-11ed-b540-cdedf83415da	0f6aad05-7f1a-11ed-b540-cdedf83415da	0f7506db-7f1a-11ed-b540-cdedf83415da	e1f36d52-8a05-11ed-b1d8-c16b6db879be	\N	e1f36d53-8a05-11ed-b1d8-c16b6db879be	\N	\N	\N	320e2b0c-7f1a-11ed-b540-cdedf83415da
0ffa6bde-7f1a-11ed-b540-cdedf83415da	479	2	1002	\N	confirmed	0.00	0.00	706.00	2008-06-01 00:00:00	\N	2022-12-18 18:22:23.22332	\N	\N	\N	f	\N	0fa30029-7f1a-11ed-b540-cdedf83415da	\N	0f2ed4cb-7f1a-11ed-b540-cdedf83415da	0f9623a4-7f1a-11ed-b540-cdedf83415da	0f7506db-7f1a-11ed-b540-cdedf83415da	0ffa6bdc-7f1a-11ed-b540-cdedf83415da	\N	0ffa6bdd-7f1a-11ed-b540-cdedf83415da	\N	\N	\N	0facff84-7f1a-11ed-b540-cdedf83415da
0ffa6bfa-7f1a-11ed-b540-cdedf83415da	507	3	1003	\N	confirmed	0.00	0.00	873.00	2008-09-01 00:00:00	\N	2022-12-18 18:22:23.22332	\N	\N	\N	f	\N	0fa30025-7f1a-11ed-b540-cdedf83415da	\N	0f2ed4cb-7f1a-11ed-b540-cdedf83415da	0f9623a4-7f1a-11ed-b540-cdedf83415da	0f7506db-7f1a-11ed-b540-cdedf83415da	0ffa6bf8-7f1a-11ed-b540-cdedf83415da	\N	0ffa6bf9-7f1a-11ed-b540-cdedf83415da	\N	\N	\N	0facff84-7f1a-11ed-b540-cdedf83415da
13855b3c-8878-11ed-b1d8-c16b6db879be	742	5	0	\N	confirmed	0.00	0.00	462.00	2022-12-30 16:28:02.333751	\N	2022-12-30 16:28:02.322831	\N	\N	\N	f	\N	7dbd70e0-7fa2-11ed-a8e6-7bb31e5c53d9	\N	0f2ed4cb-7f1a-11ed-b540-cdedf83415da	0f6aad05-7f1a-11ed-b540-cdedf83415da	0f7506db-7f1a-11ed-b540-cdedf83415da	13855b3a-8878-11ed-b1d8-c16b6db879be	\N	13855b3b-8878-11ed-b1d8-c16b6db879be	\N	\N	\N	320e2b0c-7f1a-11ed-b540-cdedf83415da
1b57c09e-8912-11ed-b1d8-c16b6db879be	800	6	0	\N	confirmed	0.00	0.00	3.00	2022-12-31 10:50:37.956634	\N	2022-12-31 10:50:37.935869	\N	\N	\N	f	\N	0fa30025-7f1a-11ed-b540-cdedf83415da	\N	0f2ed4cb-7f1a-11ed-b540-cdedf83415da	0f6aad05-7f1a-11ed-b540-cdedf83415da	0f7506db-7f1a-11ed-b540-cdedf83415da	1b57c09c-8912-11ed-b1d8-c16b6db879be	\N	1b57c09d-8912-11ed-b1d8-c16b6db879be	\N	\N	\N	320e2b0c-7f1a-11ed-b540-cdedf83415da
\.


--
-- Data for Name: sale_comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sale_comment (id, te_id, date, comment, sale_id, author_id) FROM stdin;
\.


--
-- Data for Name: sale_context; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sale_context (id, te_id, sale_id, context_id) FROM stdin;
\.


--
-- Data for Name: sale_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sale_item (id, te_id, quantity, quantity_decreased, base_price, price, notes, estimated_fix_date, completion_date, average_cost, sale_id, sellable_id, batch_id, icms_info_id, ipi_info_id, cfop_id, parent_item_id, pis_info_id, cofins_info_id, delivery_id) FROM stdin;
0ffa6bc7-7f1a-11ed-b540-cdedf83415da	456	1.000	1.000	149.00	149.00	\N	2022-12-18 18:22:23.237221	\N	70.00000000	0ffa6bc2-7f1a-11ed-b540-cdedf83415da	0fb112ed-7f1a-11ed-b540-cdedf83415da	\N	0ffa6bc4-7f1a-11ed-b540-cdedf83415da	0ffa6bc3-7f1a-11ed-b540-cdedf83415da	0f2ed4cb-7f1a-11ed-b540-cdedf83415da	\N	0ffa6bc5-7f1a-11ed-b540-cdedf83415da	0ffa6bc6-7f1a-11ed-b540-cdedf83415da	\N
0ffa6bcc-7f1a-11ed-b540-cdedf83415da	461	1.000	1.000	198.00	198.00	\N	2022-12-18 18:22:23.248206	\N	139.00000000	0ffa6bc2-7f1a-11ed-b540-cdedf83415da	0fb112f6-7f1a-11ed-b540-cdedf83415da	\N	0ffa6bc9-7f1a-11ed-b540-cdedf83415da	0ffa6bc8-7f1a-11ed-b540-cdedf83415da	0f2ed4cb-7f1a-11ed-b540-cdedf83415da	\N	0ffa6bca-7f1a-11ed-b540-cdedf83415da	0ffa6bcb-7f1a-11ed-b540-cdedf83415da	\N
0ffa6bd1-7f1a-11ed-b540-cdedf83415da	466	1.000	1.000	89.00	89.00	\N	2022-12-18 18:22:23.254197	\N	56.00000000	0ffa6bc2-7f1a-11ed-b540-cdedf83415da	0fb112fb-7f1a-11ed-b540-cdedf83415da	\N	0ffa6bce-7f1a-11ed-b540-cdedf83415da	0ffa6bcd-7f1a-11ed-b540-cdedf83415da	0f2ed4cb-7f1a-11ed-b540-cdedf83415da	\N	0ffa6bcf-7f1a-11ed-b540-cdedf83415da	0ffa6bd0-7f1a-11ed-b540-cdedf83415da	\N
0ffa6be3-7f1a-11ed-b540-cdedf83415da	484	1.000	1.000	79.00	79.00	\N	2022-12-18 18:22:23.369515	\N	43.00000000	0ffa6bde-7f1a-11ed-b540-cdedf83415da	0fb11300-7f1a-11ed-b540-cdedf83415da	\N	0ffa6be0-7f1a-11ed-b540-cdedf83415da	0ffa6bdf-7f1a-11ed-b540-cdedf83415da	0f2ed4cb-7f1a-11ed-b540-cdedf83415da	\N	0ffa6be1-7f1a-11ed-b540-cdedf83415da	0ffa6be2-7f1a-11ed-b540-cdedf83415da	\N
0ffa6be8-7f1a-11ed-b540-cdedf83415da	489	1.000	1.000	189.00	189.00	\N	2022-12-18 18:22:23.381267	\N	101.00000000	0ffa6bde-7f1a-11ed-b540-cdedf83415da	0fb11305-7f1a-11ed-b540-cdedf83415da	\N	0ffa6be5-7f1a-11ed-b540-cdedf83415da	0ffa6be4-7f1a-11ed-b540-cdedf83415da	0f2ed4cb-7f1a-11ed-b540-cdedf83415da	\N	0ffa6be6-7f1a-11ed-b540-cdedf83415da	0ffa6be7-7f1a-11ed-b540-cdedf83415da	\N
0ffa6bed-7f1a-11ed-b540-cdedf83415da	494	1.000	1.000	438.00	438.00	\N	2022-12-18 18:22:23.393116	\N	325.00000000	0ffa6bde-7f1a-11ed-b540-cdedf83415da	0fb11308-7f1a-11ed-b540-cdedf83415da	\N	0ffa6bea-7f1a-11ed-b540-cdedf83415da	0ffa6be9-7f1a-11ed-b540-cdedf83415da	0f2ed4cb-7f1a-11ed-b540-cdedf83415da	\N	0ffa6beb-7f1a-11ed-b540-cdedf83415da	0ffa6bec-7f1a-11ed-b540-cdedf83415da	\N
0ffa6bff-7f1a-11ed-b540-cdedf83415da	512	1.000	1.000	503.00	503.00	\N	2022-12-18 18:22:23.453965	\N	401.00000000	0ffa6bfa-7f1a-11ed-b540-cdedf83415da	0fb1130d-7f1a-11ed-b540-cdedf83415da	\N	0ffa6bfc-7f1a-11ed-b540-cdedf83415da	0ffa6bfb-7f1a-11ed-b540-cdedf83415da	0f2ed4cb-7f1a-11ed-b540-cdedf83415da	\N	0ffa6bfd-7f1a-11ed-b540-cdedf83415da	0ffa6bfe-7f1a-11ed-b540-cdedf83415da	\N
0ffa6c04-7f1a-11ed-b540-cdedf83415da	517	1.000	1.000	220.00	220.00	\N	2022-12-18 18:22:23.459275	\N	153.00000000	0ffa6bfa-7f1a-11ed-b540-cdedf83415da	0fb11312-7f1a-11ed-b540-cdedf83415da	\N	0ffa6c01-7f1a-11ed-b540-cdedf83415da	0ffa6c00-7f1a-11ed-b540-cdedf83415da	0f2ed4cb-7f1a-11ed-b540-cdedf83415da	\N	0ffa6c02-7f1a-11ed-b540-cdedf83415da	0ffa6c03-7f1a-11ed-b540-cdedf83415da	\N
0ffa6c09-7f1a-11ed-b540-cdedf83415da	522	1.000	1.000	150.00	150.00	\N	2022-12-18 18:22:23.464298	\N	99.00000000	0ffa6bfa-7f1a-11ed-b540-cdedf83415da	0fb11315-7f1a-11ed-b540-cdedf83415da	\N	0ffa6c06-7f1a-11ed-b540-cdedf83415da	0ffa6c05-7f1a-11ed-b540-cdedf83415da	0f2ed4cb-7f1a-11ed-b540-cdedf83415da	\N	0ffa6c07-7f1a-11ed-b540-cdedf83415da	0ffa6c08-7f1a-11ed-b540-cdedf83415da	\N
13855b41-8878-11ed-b1d8-c16b6db879be	747	1.000	1.000	383.00	383.00	\N	\N	\N	199.00000000	13855b3c-8878-11ed-b1d8-c16b6db879be	0fb1131a-7f1a-11ed-b540-cdedf83415da	\N	13855b3e-8878-11ed-b1d8-c16b6db879be	13855b3d-8878-11ed-b1d8-c16b6db879be	0f2ed4cb-7f1a-11ed-b540-cdedf83415da	\N	13855b3f-8878-11ed-b1d8-c16b6db879be	13855b40-8878-11ed-b1d8-c16b6db879be	\N
13855b46-8878-11ed-b1d8-c16b6db879be	752	1.000	1.000	79.00	79.00	\N	\N	\N	43.00000000	13855b3c-8878-11ed-b1d8-c16b6db879be	0fb11300-7f1a-11ed-b540-cdedf83415da	\N	13855b43-8878-11ed-b1d8-c16b6db879be	13855b42-8878-11ed-b1d8-c16b6db879be	0f2ed4cb-7f1a-11ed-b540-cdedf83415da	\N	13855b44-8878-11ed-b1d8-c16b6db879be	13855b45-8878-11ed-b1d8-c16b6db879be	\N
1b57c0a3-8912-11ed-b1d8-c16b6db879be	805	1.000	1.000	3.00	3.00	\N	\N	\N	2.00000000	1b57c09e-8912-11ed-b1d8-c16b6db879be	92b59368-8911-11ed-b1d8-c16b6db879be	\N	1b57c0a0-8912-11ed-b1d8-c16b6db879be	1b57c09f-8912-11ed-b1d8-c16b6db879be	0f2ed4cb-7f1a-11ed-b540-cdedf83415da	\N	1b57c0a1-8912-11ed-b1d8-c16b6db879be	1b57c0a2-8912-11ed-b1d8-c16b6db879be	\N
e1f36d59-8a05-11ed-b1d8-c16b6db879be	901	1.000	1.000	56.00	56.00	\N	\N	\N	51.00000000	e1f36d54-8a05-11ed-b1d8-c16b6db879be	5fb780f8-8a05-11ed-b1d8-c16b6db879be	\N	e1f36d56-8a05-11ed-b1d8-c16b6db879be	e1f36d55-8a05-11ed-b1d8-c16b6db879be	0f2ed4cb-7f1a-11ed-b540-cdedf83415da	\N	e1f36d57-8a05-11ed-b1d8-c16b6db879be	e1f36d58-8a05-11ed-b1d8-c16b6db879be	\N
e1f36d5e-8a05-11ed-b1d8-c16b6db879be	906	1.000	1.000	72.00	72.00	\N	\N	\N	66.00000000	e1f36d54-8a05-11ed-b1d8-c16b6db879be	e03a4e8e-8a02-11ed-b1d8-c16b6db879be	\N	e1f36d5b-8a05-11ed-b1d8-c16b6db879be	e1f36d5a-8a05-11ed-b1d8-c16b6db879be	0f2ed4cb-7f1a-11ed-b540-cdedf83415da	\N	e1f36d5c-8a05-11ed-b1d8-c16b6db879be	e1f36d5d-8a05-11ed-b1d8-c16b6db879be	\N
\.


--
-- Data for Name: sale_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sale_token (id, te_id, status, code, name, branch_id, sale_id) FROM stdin;
\.


--
-- Data for Name: sales_person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales_person (id, te_id, comission, comission_type, is_active, person_id) FROM stdin;
0f6aad05-7f1a-11ed-b540-cdedf83415da	247	0.00	1	t	0f6aad00-7f1a-11ed-b540-cdedf83415da
0f962396-7f1a-11ed-b540-cdedf83415da	275	0.00	1	t	0f962390-7f1a-11ed-b540-cdedf83415da
0f96239d-7f1a-11ed-b540-cdedf83415da	282	0.00	1	t	0f962397-7f1a-11ed-b540-cdedf83415da
0f9623a4-7f1a-11ed-b540-cdedf83415da	289	0.00	1	t	0f96239e-7f1a-11ed-b540-cdedf83415da
0f9623ab-7f1a-11ed-b540-cdedf83415da	296	0.00	1	t	0f9623a5-7f1a-11ed-b540-cdedf83415da
\.


--
-- Data for Name: sellable; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sellable (id, te_id, barcode, code, status, description, cost, base_price, notes, max_discount, commission, on_sale_price, on_sale_start_date, on_sale_end_date, price_last_updated, cost_last_updated, unit_id, category_id, tax_constant_id, default_sale_cfop_id, sort_order, favorite, keywords, requires_kitchen_production, short_description) FROM stdin;
0f2ed4d5-7f1a-11ed-b540-cdedf83415da	148			available	Delivery	0.00000000	0.00		0.00	0.00	0.00	\N	\N	2022-12-18 18:22:22.0076	2022-12-18 18:22:22.007574	\N	\N	0f2ed4c8-7f1a-11ed-b540-cdedf83415da	\N	0	f	\N	f	
0fb112ed-7f1a-11ed-b540-cdedf83415da	317	2368694135945	01	available	Bermuda Sarja	70.00000000	149.00		0.00	15.00	0.00	\N	\N	2022-12-18 18:22:22.755086	2022-12-18 18:22:22.752104	\N	0fb112ec-7f1a-11ed-b540-cdedf83415da	0f2ed4c7-7f1a-11ed-b540-cdedf83415da	\N	0	f	\N	f	
0fd4b0e3-7f1a-11ed-b540-cdedf83415da	386	3569587451214	12	available	Lavagem Roupa	12.00000000	35.00		0.00	0.00	0.00	\N	\N	2022-12-18 18:22:22.990593	2022-12-18 18:22:22.989615	\N	\N	0f2ed4c8-7f1a-11ed-b540-cdedf83415da	\N	0	f	\N	f	
0fb112f6-7f1a-11ed-b540-cdedf83415da	328	6234564656756	02	available	Shorts com Costuras	139.00000000	198.00		0.00	15.00	0.00	\N	\N	2022-12-18 18:22:22.775314	2022-12-18 18:22:22.772458	\N	0fb112f5-7f1a-11ed-b540-cdedf83415da	0f2ed4c7-7f1a-11ed-b540-cdedf83415da	\N	0	f	\N	f	
0fb112fb-7f1a-11ed-b540-cdedf83415da	335	6985413595971	03	available	Camiseta Tinturada Xcuba Comp	56.00000000	89.00		0.00	10.00	0.00	\N	\N	2022-12-18 18:22:22.79373	2022-12-18 18:22:22.791014	\N	0fb112fa-7f1a-11ed-b540-cdedf83415da	0f2ed4c7-7f1a-11ed-b540-cdedf83415da	\N	0	f	\N	f	
0fb11300-7f1a-11ed-b540-cdedf83415da	342	2692149835416	04	available	Chinelo de Dedo	43.00000000	79.00		0.00	10.00	0.00	\N	\N	2022-12-18 18:22:22.811931	2022-12-18 18:22:22.808835	\N	0fb112ff-7f1a-11ed-b540-cdedf83415da	0f2ed4c7-7f1a-11ed-b540-cdedf83415da	\N	0	f	\N	f	
5fb780f8-8a05-11ed-b1d8-c16b6db879be	870		26	available	Camiseta AMARELA	50.00000000	56.00		0.00	0.00	0.00	\N	\N	2023-01-01 15:52:00.36786	2023-01-01 15:52:00.367875	\N	0fb112f8-7f1a-11ed-b540-cdedf83415da	0f2ed4c7-7f1a-11ed-b540-cdedf83415da	\N	0	f	\N	f	
0fb11305-7f1a-11ed-b540-cdedf83415da	349	1595843695465	05	available	Calça Jeans com Bolso Traseiro	101.00000000	189.00		0.00	27.00	0.00	\N	\N	2022-12-18 18:22:22.830097	2022-12-18 18:22:22.827306	\N	0fb11304-7f1a-11ed-b540-cdedf83415da	0f2ed4c7-7f1a-11ed-b540-cdedf83415da	\N	0	f	\N	f	
0fd4b0e4-7f1a-11ed-b540-cdedf83415da	388	1568749622849	13	available	Confecção Personalizada	55.00000000	150.00		0.00	0.00	0.00	\N	\N	2022-12-18 18:22:22.994314	2022-12-18 18:22:22.993392	\N	\N	0f2ed4c8-7f1a-11ed-b540-cdedf83415da	\N	0	f	\N	f	
0fb11308-7f1a-11ed-b540-cdedf83415da	354	8596458216412	06	available	Calça Brigilda	325.00000000	438.00		0.00	27.00	0.00	\N	\N	2022-12-18 18:22:22.846744	2022-12-18 18:22:22.843972	\N	0fb11307-7f1a-11ed-b540-cdedf83415da	0f2ed4c7-7f1a-11ed-b540-cdedf83415da	\N	0	f	\N	f	
0fb1130d-7f1a-11ed-b540-cdedf83415da	361	9586249534513	07	available	Casaco Vilan	401.00000000	503.00		0.00	25.00	0.00	\N	\N	2022-12-18 18:22:22.864864	2022-12-18 18:22:22.861987	\N	0fb1130c-7f1a-11ed-b540-cdedf83415da	0f2ed4c7-7f1a-11ed-b540-cdedf83415da	\N	0	f	\N	f	
0fb11312-7f1a-11ed-b540-cdedf83415da	368	7826592136954	08	available	Blusa Frente-Única com Pregas	153.00000000	220.00		0.00	23.00	0.00	\N	\N	2022-12-18 18:22:22.882613	2022-12-18 18:22:22.87977	\N	0fb11311-7f1a-11ed-b540-cdedf83415da	0f2ed4c7-7f1a-11ed-b540-cdedf83415da	\N	0	f	\N	f	
0fb11315-7f1a-11ed-b540-cdedf83415da	373	5892458629421	09	available	Blusa Balonê com Bordado nas Costas	99.00000000	150.00		0.00	23.00	0.00	\N	\N	2022-12-18 18:22:22.902001	2022-12-18 18:22:22.898838	\N	0fb11314-7f1a-11ed-b540-cdedf83415da	0f2ed4c7-7f1a-11ed-b540-cdedf83415da	\N	0	f	\N	f	
0fd4b0e5-7f1a-11ed-b540-cdedf83415da	390	1569854136511	14	available	Lavagem a Seco	25.00000000	55.00		0.00	0.00	0.00	\N	\N	2022-12-18 18:22:22.997654	2022-12-18 18:22:22.99664	\N	\N	0f2ed4c8-7f1a-11ed-b540-cdedf83415da	\N	0	f	\N	f	
0fb1131a-7f1a-11ed-b540-cdedf83415da	380	1598756984265	10	available	Vestido Vadalena	199.00000000	383.00		0.00	25.00	0.00	\N	\N	2022-12-18 18:22:22.92077	2022-12-18 18:22:22.917562	\N	0fb11319-7f1a-11ed-b540-cdedf83415da	0f2ed4c7-7f1a-11ed-b540-cdedf83415da	\N	0	f	\N	f	
e03a4e8e-8a02-11ed-b1d8-c16b6db879be	849		22	available	Um produto com grade - P M AMARELA	66.00000000	72.00		0.00	0.00	0.00	\N	\N	2023-01-01 15:34:07.483	2023-01-01 15:34:07.483016	\N	0fb11302-7f1a-11ed-b540-cdedf83415da	0f2ed4c7-7f1a-11ed-b540-cdedf83415da	\N	0	f	\N	f	
0fd4b0e2-7f1a-11ed-b540-cdedf83415da	384	1598587594264	11	available	Ajuste Roupa	20.00000000	50.00		0.00	0.00	0.00	\N	\N	2022-12-18 18:22:22.985604	2022-12-18 18:22:22.9806	\N	\N	0f2ed4c8-7f1a-11ed-b540-cdedf83415da	\N	0	f	\N	f	
051dfb42-85f3-11ed-b1d8-c16b6db879be	706		15	available	Um produto qualquer	8.00000000	10.00	Com vários tamanhos.	0.00	0.00	0.00	\N	\N	2022-12-27 11:31:23.174802	2022-12-27 11:31:18.354833	0f2ed4c4-7f1a-11ed-b540-cdedf83415da	0fb11302-7f1a-11ed-b540-cdedf83415da	0f2ed4c7-7f1a-11ed-b540-cdedf83415da	\N	0	f	\N	f	
d750a602-8a01-11ed-b1d8-c16b6db879be	833		19	available	Um produto com grade - P	66.00000000	72.00		0.00	0.00	0.00	\N	\N	2023-01-01 15:26:43.042239	2023-01-01 15:26:43.042261	\N	0fb11302-7f1a-11ed-b540-cdedf83415da	0f2ed4c7-7f1a-11ed-b540-cdedf83415da	\N	0	f	\N	f	
92b59368-8911-11ed-b1d8-c16b6db879be	785		16	available	Tamanho P	2.00000000	3.00		0.00	0.00	0.00	\N	\N	2022-12-31 10:47:30.01951	2022-12-31 10:47:29.236152	\N	59274812-8911-11ed-b1d8-c16b6db879be	0f2ed4c7-7f1a-11ed-b540-cdedf83415da	\N	0	f	\N	f	
f80b0176-8a01-11ed-b1d8-c16b6db879be	838		20	available	Um produto com grade M	66.00000000	72.00		0.00	0.00	0.00	\N	\N	2023-01-01 15:27:37.948406	2023-01-01 15:27:37.948425	\N	0fb11302-7f1a-11ed-b540-cdedf83415da	0f2ed4c7-7f1a-11ed-b540-cdedf83415da	\N	0	f	\N	f	
6af150d6-8a03-11ed-b1d8-c16b6db879be	856		23	available	Um produto com grade M AMARELA M	66.00000000	72.00		0.00	0.00	0.00	\N	\N	2023-01-01 15:38:00.207537	2023-01-01 15:38:00.207558	\N	0fb11302-7f1a-11ed-b540-cdedf83415da	0f2ed4c7-7f1a-11ed-b540-cdedf83415da	\N	0	f	\N	f	
711fd796-8a05-11ed-b1d8-c16b6db879be	874		27	available	Camiseta VERDE	50.00000000	56.00		0.00	0.00	0.00	\N	\N	2023-01-01 15:52:29.571844	2023-01-01 15:52:29.572196	\N	0fb112f8-7f1a-11ed-b540-cdedf83415da	0f2ed4c7-7f1a-11ed-b540-cdedf83415da	\N	0	f	\N	f	
7db8dfc2-8a03-11ed-b1d8-c16b6db879be	861		24	available	Um produto com grade M M BRANCA	66.00000000	72.00		0.00	0.00	0.00	\N	\N	2023-01-01 15:38:31.714349	2023-01-01 15:38:31.714364	\N	0fb11302-7f1a-11ed-b540-cdedf83415da	0f2ed4c7-7f1a-11ed-b540-cdedf83415da	\N	0	f	\N	f	
b0ec6a0a-8911-11ed-b1d8-c16b6db879be	788		17	available	Tamanho M	2.00000000	3.00		0.00	0.00	0.00	\N	\N	2022-12-31 10:47:39.427689	2022-12-31 10:47:39.427728	\N	0fb11302-7f1a-11ed-b540-cdedf83415da	0f2ed4c7-7f1a-11ed-b540-cdedf83415da	\N	0	f	\N	f	
79384724-8a05-11ed-b1d8-c16b6db879be	882		29	available	Camiseta AZUL	50.00000000	56.00		0.00	0.00	0.00	\N	\N	2023-01-01 15:52:43.155121	2023-01-01 15:52:43.155137	\N	0fb112f8-7f1a-11ed-b540-cdedf83415da	0f2ed4c7-7f1a-11ed-b540-cdedf83415da	\N	0	f	\N	f	
20a1ca18-8a05-11ed-b1d8-c16b6db879be	866		25	available	Camiseta	50.00000000	56.00		0.00	0.00	0.00	\N	\N	2023-01-01 15:51:01.202918	2023-01-01 15:50:24.226219	\N	0fb112f8-7f1a-11ed-b540-cdedf83415da	0f2ed4c7-7f1a-11ed-b540-cdedf83415da	\N	0	f	\N	f	
51b7dd26-8a01-11ed-b1d8-c16b6db879be	828		18	available	Um produto com grade	66.00000000	72.00	Uma decrição do "Um produto com grade."	0.00	0.00	0.00	\N	\N	2023-01-01 15:24:51.657566	2023-01-01 15:24:09.967508	\N	0fb11302-7f1a-11ed-b540-cdedf83415da	0f2ed4c7-7f1a-11ed-b540-cdedf83415da	\N	0	f	\N	f	
047236dc-8a02-11ed-b1d8-c16b6db879be	843		21	available	Um produto com grade M	66.00000000	72.00		0.00	0.00	0.00	\N	\N	2023-01-01 15:27:58.758297	2023-01-01 15:27:58.758316	\N	0fb11302-7f1a-11ed-b540-cdedf83415da	0f2ed4c7-7f1a-11ed-b540-cdedf83415da	\N	0	f	\N	f	
75e74c00-8a05-11ed-b1d8-c16b6db879be	878		28	available	Camiseta BRANCA	50.00000000	56.00		0.00	0.00	0.00	\N	\N	2023-01-01 15:52:37.591174	2023-01-01 15:52:37.591188	\N	0fb112f8-7f1a-11ed-b540-cdedf83415da	0f2ed4c7-7f1a-11ed-b540-cdedf83415da	\N	0	f	\N	f	
\.


--
-- Data for Name: sellable_branch_override; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sellable_branch_override (id, te_id, status, base_price, max_discount, on_sale_price, on_sale_start_date, on_sale_end_date, tax_constant_id, default_sale_cfop_id, price_last_updated, branch_id, sellable_id, requires_kitchen_production) FROM stdin;
\.


--
-- Data for Name: sellable_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sellable_category (id, te_id, description, suggested_markup, salesperson_commission, category_id, tax_constant_id, color, sort_order) FROM stdin;
0fb112ea-7f1a-11ed-b540-cdedf83415da	314	Bermudas	36.00	15.00	\N	\N	\N	0
0fb112ec-7f1a-11ed-b540-cdedf83415da	316	Bermudas Sarja	15.00	0.00	0fb112ea-7f1a-11ed-b540-cdedf83415da	\N	\N	0
0fb112f5-7f1a-11ed-b540-cdedf83415da	327	Bermudas Shorts	15.00	0.00	0fb112ea-7f1a-11ed-b540-cdedf83415da	\N	\N	0
0fb112f8-7f1a-11ed-b540-cdedf83415da	332	Camisetas	43.00	10.00	\N	\N	\N	0
0fb112fa-7f1a-11ed-b540-cdedf83415da	334	Tinturada	33.00	0.00	0fb112f8-7f1a-11ed-b540-cdedf83415da	\N	\N	0
0fb112fd-7f1a-11ed-b540-cdedf83415da	339	Calçados	35.00	10.00	\N	\N	\N	0
0fb112ff-7f1a-11ed-b540-cdedf83415da	341	Chinelos	45.00	0.00	0fb112fd-7f1a-11ed-b540-cdedf83415da	\N	\N	0
0fb11302-7f1a-11ed-b540-cdedf83415da	346	Calças	32.00	27.00	\N	\N	\N	0
0fb11304-7f1a-11ed-b540-cdedf83415da	348	Calças Jeans	52.00	0.00	0fb11302-7f1a-11ed-b540-cdedf83415da	\N	\N	0
0fb11307-7f1a-11ed-b540-cdedf83415da	353	Calças Poliester	52.00	0.00	0fb11302-7f1a-11ed-b540-cdedf83415da	\N	\N	0
0fb1130a-7f1a-11ed-b540-cdedf83415da	358	Casacos	35.00	25.00	\N	\N	\N	0
0fb1130c-7f1a-11ed-b540-cdedf83415da	360	Algodão	55.00	0.00	0fb1130a-7f1a-11ed-b540-cdedf83415da	\N	\N	0
0fb1130f-7f1a-11ed-b540-cdedf83415da	365	Blusas	45.00	23.00	\N	\N	\N	0
0fb11311-7f1a-11ed-b540-cdedf83415da	367	Blusas Algodão	52.00	0.00	0fb1130f-7f1a-11ed-b540-cdedf83415da	\N	\N	0
0fb11314-7f1a-11ed-b540-cdedf83415da	372	Blusas Poliester	52.00	0.00	0fb1130f-7f1a-11ed-b540-cdedf83415da	\N	\N	0
0fb11317-7f1a-11ed-b540-cdedf83415da	377	Vestido	26.00	25.00	\N	\N	\N	0
0fb11319-7f1a-11ed-b540-cdedf83415da	379	Viscose	58.00	0.00	0fb11317-7f1a-11ed-b540-cdedf83415da	\N	\N	0
59274812-8911-11ed-b1d8-c16b6db879be	779	Tamanho P	0.00	0.00	0fb11302-7f1a-11ed-b540-cdedf83415da	0f2ed4c6-7f1a-11ed-b540-cdedf83415da	\N	0
6bc2e580-8911-11ed-b1d8-c16b6db879be	781	Tamanho M	0.00	0.00	0fb11302-7f1a-11ed-b540-cdedf83415da	0f2ed4c6-7f1a-11ed-b540-cdedf83415da	\N	0
7488ff92-8911-11ed-b1d8-c16b6db879be	783	Tamanho G	0.00	0.00	0fb11302-7f1a-11ed-b540-cdedf83415da	0f2ed4c6-7f1a-11ed-b540-cdedf83415da	\N	0
\.


--
-- Data for Name: sellable_tax_constant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sellable_tax_constant (id, te_id, description, tax_type, tax_value) FROM stdin;
0f2ed4c5-7f1a-11ed-b540-cdedf83415da	132	Substitution	41	\N
0f2ed4c6-7f1a-11ed-b540-cdedf83415da	133	Exemption	42	\N
0f2ed4c7-7f1a-11ed-b540-cdedf83415da	134	No tax	43	\N
0f2ed4c8-7f1a-11ed-b540-cdedf83415da	135	Service tax	44	\N
\.


--
-- Data for Name: sellable_unit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sellable_unit (id, te_id, description, unit_index, allow_fraction) FROM stdin;
0f2ed4c2-7f1a-11ed-b540-cdedf83415da	129	Kg	20	t
0f2ed4c3-7f1a-11ed-b540-cdedf83415da	130	Lt	22	t
0f2ed4c4-7f1a-11ed-b540-cdedf83415da	131	m 	21	t
\.


--
-- Data for Name: service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service (id, te_id, city_taxation_code, service_list_item_code, p_iss) FROM stdin;
0f2ed4d5-7f1a-11ed-b540-cdedf83415da	149	\N	\N	\N
0fd4b0e2-7f1a-11ed-b540-cdedf83415da	385	\N	\N	\N
0fd4b0e3-7f1a-11ed-b540-cdedf83415da	387	\N	\N	\N
0fd4b0e4-7f1a-11ed-b540-cdedf83415da	389	\N	\N	\N
0fd4b0e5-7f1a-11ed-b540-cdedf83415da	391	\N	\N	\N
\.


--
-- Data for Name: service_branch_override; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_branch_override (id, te_id, city_taxation_code, service_list_item_code, p_iss, branch_id, service_id) FROM stdin;
\.


--
-- Data for Name: station_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.station_type (id, te_id, name) FROM stdin;
\.


--
-- Data for Name: stock_decrease; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stock_decrease (id, te_id, identifier, confirm_date, status, reason, notes, cancel_reason, cancel_date, referenced_invoice_key, responsible_id, removed_by_id, branch_id, person_id, cfop_id, group_id, cost_center_id, invoice_id, cancel_responsible_id, receiving_order_id, station_id) FROM stdin;
\.


--
-- Data for Name: stock_decrease_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stock_decrease_item (id, te_id, quantity, cost, stock_decrease_id, sellable_id, batch_id, icms_info_id, ipi_info_id, pis_info_id, cofins_info_id, delivery_id, receiving_order_item_id) FROM stdin;
\.


--
-- Data for Name: stock_transaction_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stock_transaction_history (id, te_id, date, stock_cost, quantity, unit_cost, type, object_id, responsible_id, storable_id, batch_id, branch_id) FROM stdin;
0fddf1ef-7f1a-11ed-b540-cdedf83415da	419	2022-12-18 18:22:23.113973	70.00000000	5.000	70.00000000	received-purchase	0fddf1e4-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb112ed-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
0fddf1f2-7f1a-11ed-b540-cdedf83415da	422	2022-12-18 18:22:23.124454	139.00000000	5.000	139.00000000	received-purchase	0fddf1e5-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb112f6-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
0fddf1f5-7f1a-11ed-b540-cdedf83415da	425	2022-12-18 18:22:23.131584	56.00000000	5.000	56.00000000	received-purchase	0fddf1e6-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb112fb-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
0fddf1f8-7f1a-11ed-b540-cdedf83415da	428	2022-12-18 18:22:23.136904	43.00000000	5.000	43.00000000	received-purchase	0fddf1e7-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb11300-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
0fddf1fb-7f1a-11ed-b540-cdedf83415da	431	2022-12-18 18:22:23.14205	101.00000000	5.000	101.00000000	received-purchase	0fddf1e8-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb11305-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
0fddf1fe-7f1a-11ed-b540-cdedf83415da	434	2022-12-18 18:22:23.148007	325.00000000	5.000	325.00000000	received-purchase	0fddf1e9-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb11308-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
0fddf201-7f1a-11ed-b540-cdedf83415da	437	2022-12-18 18:22:23.153966	401.00000000	5.000	401.00000000	received-purchase	0fddf1ea-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb1130d-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
0fddf204-7f1a-11ed-b540-cdedf83415da	440	2022-12-18 18:22:23.159789	153.00000000	5.000	153.00000000	received-purchase	0fddf1eb-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb11312-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
0fddf207-7f1a-11ed-b540-cdedf83415da	443	2022-12-18 18:22:23.164949	99.00000000	5.000	99.00000000	received-purchase	0fddf1ec-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb11315-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
0fddf20a-7f1a-11ed-b540-cdedf83415da	446	2022-12-18 18:22:23.170194	199.00000000	5.000	199.00000000	received-purchase	0fddf1ed-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb1131a-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
0ffa6bd4-7f1a-11ed-b540-cdedf83415da	469	2022-12-18 18:22:23.280393	70.00000000	-1.000	70.00000000	sell	0ffa6bc7-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb112ed-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
0ffa6bd6-7f1a-11ed-b540-cdedf83415da	471	2022-12-18 18:22:23.291759	139.00000000	-1.000	139.00000000	sell	0ffa6bcc-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb112f6-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
0ffa6bd8-7f1a-11ed-b540-cdedf83415da	473	2022-12-18 18:22:23.300836	56.00000000	-1.000	56.00000000	sell	0ffa6bd1-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb112fb-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
0ffa6bf2-7f1a-11ed-b540-cdedf83415da	499	2022-12-18 18:22:23.422311	43.00000000	-1.000	43.00000000	sell	0ffa6be3-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb11300-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
0ffa6bf4-7f1a-11ed-b540-cdedf83415da	501	2022-12-18 18:22:23.427672	101.00000000	-1.000	101.00000000	sell	0ffa6be8-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb11305-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
0ffa6bf6-7f1a-11ed-b540-cdedf83415da	503	2022-12-18 18:22:23.433077	325.00000000	-1.000	325.00000000	sell	0ffa6bed-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb11308-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
0ffa6c0c-7f1a-11ed-b540-cdedf83415da	525	2022-12-18 18:22:23.480147	401.00000000	-1.000	401.00000000	sell	0ffa6bff-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb1130d-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
0ffa6c0e-7f1a-11ed-b540-cdedf83415da	527	2022-12-18 18:22:23.48985	153.00000000	-1.000	153.00000000	sell	0ffa6c04-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb11312-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
0ffa6c10-7f1a-11ed-b540-cdedf83415da	529	2022-12-18 18:22:23.498854	99.00000000	-1.000	99.00000000	sell	0ffa6c09-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb11315-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
1036b6f4-7f1a-11ed-b540-cdedf83415da	583	2022-12-18 18:22:23.752989	70.00000000	-1.000	70.00000000	transfer-to	1036b6c6-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb112ed-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
1036b6f6-7f1a-11ed-b540-cdedf83415da	585	2022-12-18 18:22:23.759044	139.00000000	-1.000	139.00000000	transfer-to	1036b6cb-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb112f6-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
1036b6f8-7f1a-11ed-b540-cdedf83415da	587	2022-12-18 18:22:23.762556	56.00000000	-1.000	56.00000000	transfer-to	1036b6d0-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb112fb-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
1036b6fa-7f1a-11ed-b540-cdedf83415da	589	2022-12-18 18:22:23.76624	43.00000000	-1.000	43.00000000	transfer-to	1036b6d5-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb11300-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
1036b6fc-7f1a-11ed-b540-cdedf83415da	591	2022-12-18 18:22:23.771027	101.00000000	-1.000	101.00000000	transfer-to	1036b6da-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb11305-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
1036b6fe-7f1a-11ed-b540-cdedf83415da	593	2022-12-18 18:22:23.775108	325.00000000	-1.000	325.00000000	transfer-to	1036b6df-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb11308-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
1036b700-7f1a-11ed-b540-cdedf83415da	595	2022-12-18 18:22:23.779315	401.00000000	-1.000	401.00000000	transfer-to	1036b6e4-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb1130d-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
1036b702-7f1a-11ed-b540-cdedf83415da	597	2022-12-18 18:22:23.782835	153.00000000	-1.000	153.00000000	transfer-to	1036b6e9-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb11312-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
1036b704-7f1a-11ed-b540-cdedf83415da	599	2022-12-18 18:22:23.786301	99.00000000	-1.000	99.00000000	transfer-to	1036b6ee-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb11315-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
1036b706-7f1a-11ed-b540-cdedf83415da	601	2022-12-18 18:22:23.79038	199.00000000	-1.000	199.00000000	transfer-to	1036b6f3-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb1131a-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
1036b708-7f1a-11ed-b540-cdedf83415da	603	2022-12-18 18:22:23.79614	70.00000000	1.000	70.00000000	transfer-from	1036b6c6-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb112ed-7f1a-11ed-b540-cdedf83415da	\N	0f7506e0-7f1a-11ed-b540-cdedf83415da
1036b70a-7f1a-11ed-b540-cdedf83415da	605	2022-12-18 18:22:23.799676	139.00000000	1.000	139.00000000	transfer-from	1036b6cb-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb112f6-7f1a-11ed-b540-cdedf83415da	\N	0f7506e0-7f1a-11ed-b540-cdedf83415da
1036b70c-7f1a-11ed-b540-cdedf83415da	607	2022-12-18 18:22:23.802906	56.00000000	1.000	56.00000000	transfer-from	1036b6d0-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb112fb-7f1a-11ed-b540-cdedf83415da	\N	0f7506e0-7f1a-11ed-b540-cdedf83415da
1036b70e-7f1a-11ed-b540-cdedf83415da	609	2022-12-18 18:22:23.806018	43.00000000	1.000	43.00000000	transfer-from	1036b6d5-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb11300-7f1a-11ed-b540-cdedf83415da	\N	0f7506e0-7f1a-11ed-b540-cdedf83415da
1036b710-7f1a-11ed-b540-cdedf83415da	611	2022-12-18 18:22:23.809251	101.00000000	1.000	101.00000000	transfer-from	1036b6da-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb11305-7f1a-11ed-b540-cdedf83415da	\N	0f7506e0-7f1a-11ed-b540-cdedf83415da
1036b712-7f1a-11ed-b540-cdedf83415da	613	2022-12-18 18:22:23.812371	325.00000000	1.000	325.00000000	transfer-from	1036b6df-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb11308-7f1a-11ed-b540-cdedf83415da	\N	0f7506e0-7f1a-11ed-b540-cdedf83415da
1036b714-7f1a-11ed-b540-cdedf83415da	615	2022-12-18 18:22:23.815438	401.00000000	1.000	401.00000000	transfer-from	1036b6e4-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb1130d-7f1a-11ed-b540-cdedf83415da	\N	0f7506e0-7f1a-11ed-b540-cdedf83415da
1036b716-7f1a-11ed-b540-cdedf83415da	617	2022-12-18 18:22:23.818459	153.00000000	1.000	153.00000000	transfer-from	1036b6e9-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb11312-7f1a-11ed-b540-cdedf83415da	\N	0f7506e0-7f1a-11ed-b540-cdedf83415da
1036b718-7f1a-11ed-b540-cdedf83415da	619	2022-12-18 18:22:23.82159	99.00000000	1.000	99.00000000	transfer-from	1036b6ee-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb11315-7f1a-11ed-b540-cdedf83415da	\N	0f7506e0-7f1a-11ed-b540-cdedf83415da
1036b71a-7f1a-11ed-b540-cdedf83415da	621	2022-12-18 18:22:23.824472	199.00000000	1.000	199.00000000	transfer-from	1036b6f3-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb1131a-7f1a-11ed-b540-cdedf83415da	\N	0f7506e0-7f1a-11ed-b540-cdedf83415da
310b4df1-8878-11ed-b1d8-c16b6db879be	760	2022-12-30 16:28:51.917114	199.00000000	-1.000	199.00000000	sell	13855b41-8878-11ed-b1d8-c16b6db879be	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb1131a-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
310b4df3-8878-11ed-b1d8-c16b6db879be	762	2022-12-30 16:28:52.225035	43.00000000	-1.000	43.00000000	sell	13855b46-8878-11ed-b1d8-c16b6db879be	0f6aad06-7f1a-11ed-b540-cdedf83415da	0fb11300-7f1a-11ed-b540-cdedf83415da	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
f91839d0-8911-11ed-b1d8-c16b6db879be	792	2022-12-31 10:49:40.487826	8.00000000	200.000	8.00000000	initial	\N	0f6aad06-7f1a-11ed-b540-cdedf83415da	051dfb42-85f3-11ed-b1d8-c16b6db879be	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
ff139514-8911-11ed-b1d8-c16b6db879be	794	2022-12-31 10:49:50.525123	2.00000000	120.000	2.00000000	initial	\N	0f6aad06-7f1a-11ed-b540-cdedf83415da	92b59368-8911-11ed-b1d8-c16b6db879be	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
04af1a20-8912-11ed-b1d8-c16b6db879be	796	2022-12-31 10:49:59.931724	2.00000000	90.000	2.00000000	initial	\N	0f6aad06-7f1a-11ed-b540-cdedf83415da	b0ec6a0a-8911-11ed-b1d8-c16b6db879be	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
5235a611-8912-11ed-b1d8-c16b6db879be	810	2022-12-31 10:52:10.004627	2.00000000	-1.000	2.00000000	sell	1b57c0a3-8912-11ed-b1d8-c16b6db879be	0f6aad06-7f1a-11ed-b540-cdedf83415da	92b59368-8911-11ed-b1d8-c16b6db879be	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
1fa0e3a8-8a03-11ed-b1d8-c16b6db879be	854	2023-01-01 15:35:53.850889	66.00000000	12.000	66.00000000	initial	\N	0f6aad06-7f1a-11ed-b540-cdedf83415da	e03a4e8e-8a02-11ed-b1d8-c16b6db879be	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
9c8733a2-8a05-11ed-b1d8-c16b6db879be	886	2023-01-01 15:53:42.391066	51.00000000	32.000	51.00000000	initial	\N	0f6aad06-7f1a-11ed-b540-cdedf83415da	5fb780f8-8a05-11ed-b1d8-c16b6db879be	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
a44ed8a6-8a05-11ed-b1d8-c16b6db879be	888	2023-01-01 15:53:55.444427	53.00000000	41.000	53.00000000	initial	\N	0f6aad06-7f1a-11ed-b540-cdedf83415da	711fd796-8a05-11ed-b1d8-c16b6db879be	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
aa6c74fa-8a05-11ed-b1d8-c16b6db879be	890	2023-01-01 15:54:05.704041	50.00000000	12.000	50.00000000	initial	\N	0f6aad06-7f1a-11ed-b540-cdedf83415da	75e74c00-8a05-11ed-b1d8-c16b6db879be	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
b221da3c-8a05-11ed-b1d8-c16b6db879be	892	2023-01-01 15:54:18.636577	50.00000000	23.000	50.00000000	initial	\N	0f6aad06-7f1a-11ed-b540-cdedf83415da	79384724-8a05-11ed-b1d8-c16b6db879be	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
e8c42204-8a05-11ed-b1d8-c16b6db879be	909	2023-01-01 15:55:50.330768	51.00000000	-1.000	51.00000000	sell	e1f36d59-8a05-11ed-b1d8-c16b6db879be	0f6aad06-7f1a-11ed-b540-cdedf83415da	5fb780f8-8a05-11ed-b1d8-c16b6db879be	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
e8c42206-8a05-11ed-b1d8-c16b6db879be	911	2023-01-01 15:55:50.343611	66.00000000	-1.000	66.00000000	sell	e1f36d5e-8a05-11ed-b1d8-c16b6db879be	0f6aad06-7f1a-11ed-b540-cdedf83415da	e03a4e8e-8a02-11ed-b1d8-c16b6db879be	\N	0f7506db-7f1a-11ed-b540-cdedf83415da
\.


--
-- Data for Name: storable; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.storable (id, te_id, is_batch, minimum_quantity, maximum_quantity) FROM stdin;
0fb112ed-7f1a-11ed-b540-cdedf83415da	326	f	0.000	0.000
0fb112fb-7f1a-11ed-b540-cdedf83415da	338	f	0.000	0.000
0fb11300-7f1a-11ed-b540-cdedf83415da	345	f	0.000	0.000
0fb11305-7f1a-11ed-b540-cdedf83415da	352	f	0.000	0.000
0fb11308-7f1a-11ed-b540-cdedf83415da	357	f	0.000	0.000
0fb1130d-7f1a-11ed-b540-cdedf83415da	364	f	0.000	0.000
0fb11312-7f1a-11ed-b540-cdedf83415da	371	f	0.000	0.000
0fb11315-7f1a-11ed-b540-cdedf83415da	376	f	0.000	0.000
0fb1131a-7f1a-11ed-b540-cdedf83415da	383	f	0.000	0.000
0fb112f6-7f1a-11ed-b540-cdedf83415da	331	f	1.000	5.000
051dfb42-85f3-11ed-b1d8-c16b6db879be	708	f	0.000	0.000
92b59368-8911-11ed-b1d8-c16b6db879be	787	f	0.000	0.000
b0ec6a0a-8911-11ed-b1d8-c16b6db879be	790	f	0.000	0.000
e03a4e8e-8a02-11ed-b1d8-c16b6db879be	851	f	0.000	0.000
6af150d6-8a03-11ed-b1d8-c16b6db879be	858	f	0.000	0.000
7db8dfc2-8a03-11ed-b1d8-c16b6db879be	863	f	0.000	0.000
5fb780f8-8a05-11ed-b1d8-c16b6db879be	872	f	0.000	0.000
711fd796-8a05-11ed-b1d8-c16b6db879be	876	f	0.000	0.000
75e74c00-8a05-11ed-b1d8-c16b6db879be	880	f	0.000	0.000
79384724-8a05-11ed-b1d8-c16b6db879be	884	f	0.000	0.000
\.


--
-- Data for Name: storable_batch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.storable_batch (id, te_id, batch_number, create_date, expire_date, notes, storable_id) FROM stdin;
\.


--
-- Data for Name: storable_branch_override; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.storable_branch_override (id, te_id, minimum_quantity, maximum_quantity, branch_id, storable_id) FROM stdin;
\.


--
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplier (id, te_id, is_active, status, product_desc, person_id) FROM stdin;
0f85b0ad-7f1a-11ed-b540-cdedf83415da	263	t	active		0f85b0aa-7f1a-11ed-b540-cdedf83415da
41fcbdc6-8877-11ed-b1d8-c16b6db879be	724	t	active		41fcbdc4-8877-11ed-b1d8-c16b6db879be
\.


--
-- Data for Name: system_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.system_table (id, updated, patchlevel, generation) FROM stdin;
1	2022-12-18 18:22:14.795047	0	6
2	2022-12-18 18:22:20.181006	1	6
3	2022-12-18 18:22:20.279707	2	6
4	2022-12-18 18:22:20.568687	3	6
5	2022-12-18 18:22:20.594084	4	6
6	2022-12-18 18:22:20.723	5	6
7	2022-12-18 18:22:20.798811	6	6
8	2022-12-18 18:22:20.845899	7	6
9	2022-12-18 18:22:20.891797	8	6
10	2022-12-18 18:22:20.965559	9	6
11	2022-12-18 18:22:21.01373	10	6
12	2022-12-18 18:22:21.138898	11	6
13	2022-12-18 18:22:21.184269	12	6
14	2022-12-18 18:22:21.272894	13	6
15	2022-12-18 18:22:21.294303	14	6
16	2022-12-18 18:22:21.35782	15	6
17	2022-12-18 18:22:21.40671	16	6
18	2022-12-18 18:22:21.514251	17	6
19	2022-12-18 18:22:21.565111	18	6
20	2022-12-18 18:22:21.611516	19	6
21	2022-12-18 18:22:21.655173	20	6
22	2022-12-18 18:22:21.699277	21	6
\.


--
-- Data for Name: till; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.till (id, te_id, status, initial_cash_amount, final_cash_amount, opening_date, closing_date, observations, station_id, responsible_open_id, responsible_close_id, verify_date, responsible_verify_id, identifier, branch_id) FROM stdin;
f64a4050-7fab-11ed-a8e6-7bb31e5c53d9	685	closed	0.00	1200.00	2022-12-19 11:46:46.649856	2022-12-30 16:26:12.813166		320e2b0c-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	\N	\N	2	0f7506db-7f1a-11ed-b540-cdedf83415da
d5cae4a4-8877-11ed-b1d8-c16b6db879be	738	closed	1200.00	1762.00	2022-12-30 16:26:18.761404	2022-12-31 10:48:20.731942		320e2b0c-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	\N	\N	3	0f7506db-7f1a-11ed-b540-cdedf83415da
cb6fd132-8911-11ed-b1d8-c16b6db879be	791	closed	1762.00	1765.00	2022-12-31 10:48:23.883352	2023-01-01 15:30:51.846739		320e2b0c-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	\N	\N	4	0f7506db-7f1a-11ed-b540-cdedf83415da
6dadd1b0-8a02-11ed-b1d8-c16b6db879be	848	open	1765.00	0.00	2023-01-01 15:30:55.298073	\N		320e2b0c-7f1a-11ed-b540-cdedf83415da	0f6aad06-7f1a-11ed-b540-cdedf83415da	\N	\N	\N	5	0f7506db-7f1a-11ed-b540-cdedf83415da
\.


--
-- Data for Name: till_entry; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.till_entry (id, te_id, identifier, date, description, value, till_id, branch_id, payment_id, station_id) FROM stdin;
fa30d6fc-7fab-11ed-a8e6-7bb31e5c53d9	686	1	2022-12-19 11:46:53.19484	Initial Cash amount	1200.00	f64a4050-7fab-11ed-a8e6-7bb31e5c53d9	0f7506db-7f1a-11ed-b540-cdedf83415da	\N	320e2b0c-7f1a-11ed-b540-cdedf83415da
d9c7025e-8877-11ed-b1d8-c16b6db879be	739	2	2022-12-30 16:26:25.450154	Initial Cash amount	100.00	d5cae4a4-8877-11ed-b1d8-c16b6db879be	0f7506db-7f1a-11ed-b540-cdedf83415da	\N	320e2b0c-7f1a-11ed-b540-cdedf83415da
310b4df4-8878-11ed-b1d8-c16b6db879be	763	3	2022-12-30 16:28:52.232024	1/3 Card for sale 00005	154.00	d5cae4a4-8877-11ed-b1d8-c16b6db879be	0f7506db-7f1a-11ed-b540-cdedf83415da	310b4dea-8878-11ed-b1d8-c16b6db879be	320e2b0c-7f1a-11ed-b540-cdedf83415da
310b4df5-8878-11ed-b1d8-c16b6db879be	764	4	2022-12-30 16:28:52.232135	2/3 Card for sale 00005	154.00	d5cae4a4-8877-11ed-b1d8-c16b6db879be	0f7506db-7f1a-11ed-b540-cdedf83415da	310b4dec-8878-11ed-b1d8-c16b6db879be	320e2b0c-7f1a-11ed-b540-cdedf83415da
310b4df6-8878-11ed-b1d8-c16b6db879be	765	5	2022-12-30 16:28:52.232278	3/3 Card for sale 00005	154.00	d5cae4a4-8877-11ed-b1d8-c16b6db879be	0f7506db-7f1a-11ed-b540-cdedf83415da	310b4dee-8878-11ed-b1d8-c16b6db879be	320e2b0c-7f1a-11ed-b540-cdedf83415da
5235a612-8912-11ed-b1d8-c16b6db879be	811	6	2022-12-31 10:52:10.017248	1/2 Money for sale 00006	1.00	cb6fd132-8911-11ed-b1d8-c16b6db879be	0f7506db-7f1a-11ed-b540-cdedf83415da	3ee68084-8912-11ed-b1d8-c16b6db879be	320e2b0c-7f1a-11ed-b540-cdedf83415da
5235a613-8912-11ed-b1d8-c16b6db879be	812	7	2022-12-31 10:52:10.017469	2/2 Card for sale 00006	2.00	cb6fd132-8911-11ed-b1d8-c16b6db879be	0f7506db-7f1a-11ed-b540-cdedf83415da	4d5d7c94-8912-11ed-b1d8-c16b6db879be	320e2b0c-7f1a-11ed-b540-cdedf83415da
e8c42207-8a05-11ed-b1d8-c16b6db879be	912	8	2023-01-01 15:55:50.356243	1/1 Money for sale 00007	128.00	6dadd1b0-8a02-11ed-b1d8-c16b6db879be	0f7506db-7f1a-11ed-b540-cdedf83415da	e8c42202-8a05-11ed-b1d8-c16b6db879be	320e2b0c-7f1a-11ed-b540-cdedf83415da
\.


--
-- Data for Name: till_summary; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.till_summary (id, te_id, system_value, user_value, verify_value, card_type, provider_id, method_id, till_id, notes) FROM stdin;
\.


--
-- Data for Name: transaction_entry; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaction_entry (id, te_time, metadata, te_server, sync_status) FROM stdin;
1	2022-12-18 18:22:21.877405	\N	2022-12-18 18:22:21.877405	0
2	2022-12-18 18:22:21.898374	\N	2022-12-18 18:22:21.898374	0
3	2022-12-18 18:22:21.899076	\N	2022-12-18 18:22:21.899076	0
4	2022-12-18 18:22:21.899643	\N	2022-12-18 18:22:21.899643	0
5	2022-12-18 18:22:21.900202	\N	2022-12-18 18:22:21.900202	0
6	2022-12-18 18:22:21.900736	\N	2022-12-18 18:22:21.900736	0
7	2022-12-18 18:22:21.901736	\N	2022-12-18 18:22:21.901736	0
8	2022-12-18 18:22:21.903913	\N	2022-12-18 18:22:21.903913	0
9	2022-12-18 18:22:21.905263	\N	2022-12-18 18:22:21.905263	0
10	2022-12-18 18:22:21.910595	\N	2022-12-18 18:22:21.910595	0
11	2022-12-18 18:22:21.911941	\N	2022-12-18 18:22:21.911941	0
12	2022-12-18 18:22:21.913209	\N	2022-12-18 18:22:21.913209	0
13	2022-12-18 18:22:21.914108	\N	2022-12-18 18:22:21.914108	0
14	2022-12-18 18:22:21.91493	\N	2022-12-18 18:22:21.91493	0
15	2022-12-18 18:22:21.915601	\N	2022-12-18 18:22:21.915601	0
16	2022-12-18 18:22:21.916253	\N	2022-12-18 18:22:21.916253	0
17	2022-12-18 18:22:21.916974	\N	2022-12-18 18:22:21.916974	0
18	2022-12-18 18:22:21.9176	\N	2022-12-18 18:22:21.9176	0
19	2022-12-18 18:22:21.918348	\N	2022-12-18 18:22:21.918348	0
20	2022-12-18 18:22:21.919057	\N	2022-12-18 18:22:21.919057	0
21	2022-12-18 18:22:21.919787	\N	2022-12-18 18:22:21.919787	0
22	2022-12-18 18:22:21.921899	\N	2022-12-18 18:22:21.921899	0
23	2022-12-18 18:22:21.923597	\N	2022-12-18 18:22:21.923597	0
24	2022-12-18 18:22:21.924732	\N	2022-12-18 18:22:21.924732	0
25	2022-12-18 18:22:21.926085	\N	2022-12-18 18:22:21.926085	0
26	2022-12-18 18:22:21.927235	\N	2022-12-18 18:22:21.927235	0
27	2022-12-18 18:22:21.928345	\N	2022-12-18 18:22:21.928345	0
28	2022-12-18 18:22:21.92945	\N	2022-12-18 18:22:21.92945	0
29	2022-12-18 18:22:21.930159	\N	2022-12-18 18:22:21.930159	0
30	2022-12-18 18:22:21.930767	\N	2022-12-18 18:22:21.930767	0
31	2022-12-18 18:22:21.931296	\N	2022-12-18 18:22:21.931296	0
32	2022-12-18 18:22:21.931909	\N	2022-12-18 18:22:21.931909	0
33	2022-12-18 18:22:21.932467	\N	2022-12-18 18:22:21.932467	0
34	2022-12-18 18:22:21.93313	\N	2022-12-18 18:22:21.93313	0
35	2022-12-18 18:22:21.934157	\N	2022-12-18 18:22:21.934157	0
36	2022-12-18 18:22:21.934948	\N	2022-12-18 18:22:21.934948	0
37	2022-12-18 18:22:21.935543	\N	2022-12-18 18:22:21.935543	0
38	2022-12-18 18:22:21.936097	\N	2022-12-18 18:22:21.936097	0
39	2022-12-18 18:22:21.936688	\N	2022-12-18 18:22:21.936688	0
40	2022-12-18 18:22:21.937233	\N	2022-12-18 18:22:21.937233	0
41	2022-12-18 18:22:21.93797	\N	2022-12-18 18:22:21.93797	0
42	2022-12-18 18:22:21.938536	\N	2022-12-18 18:22:21.938536	0
43	2022-12-18 18:22:21.939084	\N	2022-12-18 18:22:21.939084	0
44	2022-12-18 18:22:21.939658	\N	2022-12-18 18:22:21.939658	0
45	2022-12-18 18:22:21.940422	\N	2022-12-18 18:22:21.940422	0
46	2022-12-18 18:22:21.940999	\N	2022-12-18 18:22:21.940999	0
47	2022-12-18 18:22:21.941585	\N	2022-12-18 18:22:21.941585	0
48	2022-12-18 18:22:21.942453	\N	2022-12-18 18:22:21.942453	0
49	2022-12-18 18:22:21.943024	\N	2022-12-18 18:22:21.943024	0
50	2022-12-18 18:22:21.943592	\N	2022-12-18 18:22:21.943592	0
51	2022-12-18 18:22:21.944074	\N	2022-12-18 18:22:21.944074	0
52	2022-12-18 18:22:21.944638	\N	2022-12-18 18:22:21.944638	0
53	2022-12-18 18:22:21.945195	\N	2022-12-18 18:22:21.945195	0
54	2022-12-18 18:22:21.946112	\N	2022-12-18 18:22:21.946112	0
55	2022-12-18 18:22:21.946699	\N	2022-12-18 18:22:21.946699	0
56	2022-12-18 18:22:21.947342	\N	2022-12-18 18:22:21.947342	0
57	2022-12-18 18:22:21.947879	\N	2022-12-18 18:22:21.947879	0
58	2022-12-18 18:22:21.948621	\N	2022-12-18 18:22:21.948621	0
59	2022-12-18 18:22:21.949182	\N	2022-12-18 18:22:21.949182	0
60	2022-12-18 18:22:21.949742	\N	2022-12-18 18:22:21.949742	0
61	2022-12-18 18:22:21.950307	\N	2022-12-18 18:22:21.950307	0
62	2022-12-18 18:22:21.950841	\N	2022-12-18 18:22:21.950841	0
63	2022-12-18 18:22:21.951741	\N	2022-12-18 18:22:21.951741	0
64	2022-12-18 18:22:21.952322	\N	2022-12-18 18:22:21.952322	0
65	2022-12-18 18:22:21.95286	\N	2022-12-18 18:22:21.95286	0
66	2022-12-18 18:22:21.953366	\N	2022-12-18 18:22:21.953366	0
67	2022-12-18 18:22:21.953941	\N	2022-12-18 18:22:21.953941	0
68	2022-12-18 18:22:21.954537	\N	2022-12-18 18:22:21.954537	0
69	2022-12-18 18:22:21.955082	\N	2022-12-18 18:22:21.955082	0
70	2022-12-18 18:22:21.955612	\N	2022-12-18 18:22:21.955612	0
71	2022-12-18 18:22:21.956242	\N	2022-12-18 18:22:21.956242	0
72	2022-12-18 18:22:21.9568	\N	2022-12-18 18:22:21.9568	0
73	2022-12-18 18:22:21.957411	\N	2022-12-18 18:22:21.957411	0
74	2022-12-18 18:22:21.957952	\N	2022-12-18 18:22:21.957952	0
75	2022-12-18 18:22:21.958498	\N	2022-12-18 18:22:21.958498	0
76	2022-12-18 18:22:21.959053	\N	2022-12-18 18:22:21.959053	0
77	2022-12-18 18:22:21.959594	\N	2022-12-18 18:22:21.959594	0
78	2022-12-18 18:22:21.960162	\N	2022-12-18 18:22:21.960162	0
79	2022-12-18 18:22:21.960687	\N	2022-12-18 18:22:21.960687	0
80	2022-12-18 18:22:21.961254	\N	2022-12-18 18:22:21.961254	0
81	2022-12-18 18:22:21.961733	\N	2022-12-18 18:22:21.961733	0
82	2022-12-18 18:22:21.962701	\N	2022-12-18 18:22:21.962701	0
83	2022-12-18 18:22:21.963618	\N	2022-12-18 18:22:21.963618	0
84	2022-12-18 18:22:21.964279	\N	2022-12-18 18:22:21.964279	0
85	2022-12-18 18:22:21.964884	\N	2022-12-18 18:22:21.964884	0
86	2022-12-18 18:22:21.96543	\N	2022-12-18 18:22:21.96543	0
87	2022-12-18 18:22:21.965995	\N	2022-12-18 18:22:21.965995	0
88	2022-12-18 18:22:21.96652	\N	2022-12-18 18:22:21.96652	0
89	2022-12-18 18:22:21.967093	\N	2022-12-18 18:22:21.967093	0
90	2022-12-18 18:22:21.967649	\N	2022-12-18 18:22:21.967649	0
91	2022-12-18 18:22:21.968208	\N	2022-12-18 18:22:21.968208	0
92	2022-12-18 18:22:21.968745	\N	2022-12-18 18:22:21.968745	0
93	2022-12-18 18:22:21.969269	\N	2022-12-18 18:22:21.969269	0
94	2022-12-18 18:22:21.969814	\N	2022-12-18 18:22:21.969814	0
95	2022-12-18 18:22:21.970361	\N	2022-12-18 18:22:21.970361	0
96	2022-12-18 18:22:21.970876	\N	2022-12-18 18:22:21.970876	0
97	2022-12-18 18:22:21.971466	\N	2022-12-18 18:22:21.971466	0
98	2022-12-18 18:22:21.972022	\N	2022-12-18 18:22:21.972022	0
99	2022-12-18 18:22:21.972549	\N	2022-12-18 18:22:21.972549	0
100	2022-12-18 18:22:21.973403	\N	2022-12-18 18:22:21.973403	0
101	2022-12-18 18:22:21.973984	\N	2022-12-18 18:22:21.973984	0
102	2022-12-18 18:22:21.974519	\N	2022-12-18 18:22:21.974519	0
103	2022-12-18 18:22:21.97507	\N	2022-12-18 18:22:21.97507	0
104	2022-12-18 18:22:21.975617	\N	2022-12-18 18:22:21.975617	0
105	2022-12-18 18:22:21.976169	\N	2022-12-18 18:22:21.976169	0
106	2022-12-18 18:22:21.976736	\N	2022-12-18 18:22:21.976736	0
107	2022-12-18 18:22:21.977277	\N	2022-12-18 18:22:21.977277	0
108	2022-12-18 18:22:21.977824	\N	2022-12-18 18:22:21.977824	0
109	2022-12-18 18:22:21.978345	\N	2022-12-18 18:22:21.978345	0
110	2022-12-18 18:22:21.978977	\N	2022-12-18 18:22:21.978977	0
111	2022-12-18 18:22:21.979783	\N	2022-12-18 18:22:21.979783	0
112	2022-12-18 18:22:21.980321	\N	2022-12-18 18:22:21.980321	0
113	2022-12-18 18:22:21.980831	\N	2022-12-18 18:22:21.980831	0
114	2022-12-18 18:22:21.98137	\N	2022-12-18 18:22:21.98137	0
115	2022-12-18 18:22:21.981922	\N	2022-12-18 18:22:21.981922	0
116	2022-12-18 18:22:21.982773	\N	2022-12-18 18:22:21.982773	0
117	2022-12-18 18:22:21.983345	\N	2022-12-18 18:22:21.983345	0
118	2022-12-18 18:22:21.983903	\N	2022-12-18 18:22:21.983903	0
119	2022-12-18 18:22:21.98479	\N	2022-12-18 18:22:21.98479	0
120	2022-12-18 18:22:21.986419	\N	2022-12-18 18:22:21.986419	0
121	2022-12-18 18:22:21.987044	\N	2022-12-18 18:22:21.987044	0
122	2022-12-18 18:22:21.987655	\N	2022-12-18 18:22:21.987655	0
123	2022-12-18 18:22:21.988714	\N	2022-12-18 18:22:21.988714	0
124	2022-12-18 18:22:21.989318	\N	2022-12-18 18:22:21.989318	0
125	2022-12-18 18:22:21.989873	\N	2022-12-18 18:22:21.989873	0
126	2022-12-18 18:22:21.990785	\N	2022-12-18 18:22:21.990785	0
127	2022-12-18 18:22:21.991386	\N	2022-12-18 18:22:21.991386	0
128	2022-12-18 18:22:21.992523	\N	2022-12-18 18:22:21.992523	0
129	2022-12-18 18:22:21.992816	\N	2022-12-18 18:22:21.992816	0
130	2022-12-18 18:22:21.993469	\N	2022-12-18 18:22:21.993469	0
131	2022-12-18 18:22:21.993748	\N	2022-12-18 18:22:21.993748	0
132	2022-12-18 18:22:21.994018	\N	2022-12-18 18:22:21.994018	0
133	2022-12-18 18:22:21.994599	\N	2022-12-18 18:22:21.994599	0
134	2022-12-18 18:22:21.99488	\N	2022-12-18 18:22:21.99488	0
135	2022-12-18 18:22:21.995161	\N	2022-12-18 18:22:21.995161	0
136	2022-12-18 18:22:21.995426	\N	2022-12-18 18:22:21.995426	0
137	2022-12-18 18:22:21.997736	\N	2022-12-18 18:22:21.997736	0
138	2022-12-18 18:22:21.998699	\N	2022-12-18 18:22:21.998699	0
139	2022-12-18 18:22:21.99949	\N	2022-12-18 18:22:21.99949	0
140	2022-12-18 18:22:22.000216	\N	2022-12-18 18:22:22.000216	0
141	2022-12-18 18:22:22.001764	\N	2022-12-18 18:22:22.001764	0
142	2022-12-18 18:22:22.002459	\N	2022-12-18 18:22:22.002459	0
143	2022-12-18 18:22:22.003013	\N	2022-12-18 18:22:22.003013	0
144	2022-12-18 18:22:22.003582	\N	2022-12-18 18:22:22.003582	0
145	2022-12-18 18:22:22.004099	\N	2022-12-18 18:22:22.004099	0
146	2022-12-18 18:22:22.004611	\N	2022-12-18 18:22:22.004611	0
147	2022-12-18 18:22:22.005787	\N	2022-12-18 18:22:22.005787	0
148	2022-12-18 18:22:22.007991	\N	2022-12-18 18:22:22.007991	0
149	2022-12-18 18:22:22.010281	\N	2022-12-18 18:22:22.010281	0
150	2022-12-18 18:22:22.011187	\N	2022-12-18 18:22:22.011187	0
151	2022-12-18 18:22:22.01194	\N	2022-12-18 18:22:22.01194	0
152	2022-12-18 18:22:22.012627	\N	2022-12-18 18:22:22.012627	0
153	2022-12-18 18:22:22.013518	\N	2022-12-18 18:22:22.013518	0
154	2022-12-18 18:22:22.060352	\N	2022-12-18 18:22:22.060352	0
155	2022-12-18 18:22:22.064307	\N	2022-12-18 18:22:22.064307	0
156	2022-12-18 18:22:22.068042	\N	2022-12-18 18:22:22.068042	0
157	2022-12-18 18:22:22.069855	\N	2022-12-18 18:22:22.069855	0
158	2022-12-18 18:22:22.087768	\N	2022-12-18 18:22:22.087768	0
159	2022-12-18 18:22:22.092852	\N	2022-12-18 18:22:22.092852	0
160	2022-12-18 18:22:22.093846	\N	2022-12-18 18:22:22.093846	0
161	2022-12-18 18:22:22.094183	\N	2022-12-18 18:22:22.094183	0
162	2022-12-18 18:22:22.094469	\N	2022-12-18 18:22:22.094469	0
163	2022-12-18 18:22:22.09477	\N	2022-12-18 18:22:22.09477	0
164	2022-12-18 18:22:22.095029	\N	2022-12-18 18:22:22.095029	0
165	2022-12-18 18:22:22.095283	\N	2022-12-18 18:22:22.095283	0
166	2022-12-18 18:22:22.095516	\N	2022-12-18 18:22:22.095516	0
167	2022-12-18 18:22:22.095785	\N	2022-12-18 18:22:22.095785	0
168	2022-12-18 18:22:22.096011	\N	2022-12-18 18:22:22.096011	0
169	2022-12-18 18:22:22.09623	\N	2022-12-18 18:22:22.09623	0
170	2022-12-18 18:22:22.096445	\N	2022-12-18 18:22:22.096445	0
171	2022-12-18 18:22:22.09667	\N	2022-12-18 18:22:22.09667	0
172	2022-12-18 18:22:22.096891	\N	2022-12-18 18:22:22.096891	0
173	2022-12-18 18:22:22.09726	\N	2022-12-18 18:22:22.09726	0
174	2022-12-18 18:22:22.097495	\N	2022-12-18 18:22:22.097495	0
175	2022-12-18 18:22:22.097873	\N	2022-12-18 18:22:22.097873	0
176	2022-12-18 18:22:22.098108	\N	2022-12-18 18:22:22.098108	0
177	2022-12-18 18:22:22.098335	\N	2022-12-18 18:22:22.098335	0
178	2022-12-18 18:22:22.09855	\N	2022-12-18 18:22:22.09855	0
179	2022-12-18 18:22:22.098788	\N	2022-12-18 18:22:22.098788	0
180	2022-12-18 18:22:22.099004	\N	2022-12-18 18:22:22.099004	0
181	2022-12-18 18:22:22.09938	\N	2022-12-18 18:22:22.09938	0
182	2022-12-18 18:22:22.099645	\N	2022-12-18 18:22:22.099645	0
183	2022-12-18 18:22:22.099891	\N	2022-12-18 18:22:22.099891	0
184	2022-12-18 18:22:22.1004	\N	2022-12-18 18:22:22.1004	0
185	2022-12-18 18:22:22.100665	\N	2022-12-18 18:22:22.100665	0
186	2022-12-18 18:22:22.100887	\N	2022-12-18 18:22:22.100887	0
187	2022-12-18 18:22:22.101101	\N	2022-12-18 18:22:22.101101	0
188	2022-12-18 18:22:22.101317	\N	2022-12-18 18:22:22.101317	0
189	2022-12-18 18:22:22.101559	\N	2022-12-18 18:22:22.101559	0
190	2022-12-18 18:22:22.101784	\N	2022-12-18 18:22:22.101784	0
191	2022-12-18 18:22:22.102132	\N	2022-12-18 18:22:22.102132	0
192	2022-12-18 18:22:22.102349	\N	2022-12-18 18:22:22.102349	0
193	2022-12-18 18:22:22.102594	\N	2022-12-18 18:22:22.102594	0
194	2022-12-18 18:22:22.102812	\N	2022-12-18 18:22:22.102812	0
195	2022-12-18 18:22:22.10303	\N	2022-12-18 18:22:22.10303	0
196	2022-12-18 18:22:22.103241	\N	2022-12-18 18:22:22.103241	0
197	2022-12-18 18:22:22.103451	\N	2022-12-18 18:22:22.103451	0
199	2022-12-18 18:22:22.103983	\N	2022-12-18 18:22:22.103983	0
200	2022-12-18 18:22:22.104208	\N	2022-12-18 18:22:22.104208	0
201	2022-12-18 18:22:22.104437	\N	2022-12-18 18:22:22.104437	0
203	2022-12-18 18:22:22.108057	\N	2022-12-18 18:22:22.108057	0
204	2022-12-18 18:22:22.108325	\N	2022-12-18 18:22:22.108325	0
206	2022-12-18 18:22:22.140083	\N	2022-12-18 18:22:22.140083	0
207	2022-12-18 18:22:22.144106	\N	2022-12-18 18:22:22.144106	0
208	2022-12-18 18:22:22.147487	\N	2022-12-18 18:22:22.147487	0
209	2022-12-18 18:22:22.149713	\N	2022-12-18 18:22:22.149713	0
210	2022-12-18 18:22:22.15113	\N	2022-12-18 18:22:22.15113	0
211	2022-12-18 18:22:22.153222	\N	2022-12-18 18:22:22.153222	0
212	2022-12-18 18:22:22.155322	\N	2022-12-18 18:22:22.155322	0
213	2022-12-18 18:22:22.157482	\N	2022-12-18 18:22:22.157482	0
214	2022-12-18 18:22:22.159827	\N	2022-12-18 18:22:22.159827	0
215	2022-12-18 18:22:22.162521	\N	2022-12-18 18:22:22.162521	0
216	2022-12-18 18:22:22.164057	\N	2022-12-18 18:22:22.164057	0
217	2022-12-18 18:22:22.166132	\N	2022-12-18 18:22:22.166132	0
218	2022-12-18 18:22:22.168397	\N	2022-12-18 18:22:22.168397	0
219	2022-12-18 18:22:22.170437	\N	2022-12-18 18:22:22.170437	0
220	2022-12-18 18:22:22.171963	\N	2022-12-18 18:22:22.171963	0
221	2022-12-18 18:22:22.17432	\N	2022-12-18 18:22:22.17432	0
222	2022-12-18 18:22:22.176375	\N	2022-12-18 18:22:22.176375	0
223	2022-12-18 18:22:22.178681	\N	2022-12-18 18:22:22.178681	0
224	2022-12-18 18:22:22.180803	\N	2022-12-18 18:22:22.180803	0
225	2022-12-18 18:22:22.185876	\N	2022-12-18 18:22:22.185876	0
226	2022-12-18 18:22:22.187784	\N	2022-12-18 18:22:22.187784	0
227	2022-12-18 18:22:22.190003	\N	2022-12-18 18:22:22.190003	0
228	2022-12-18 18:22:22.191642	\N	2022-12-18 18:22:22.191642	0
229	2022-12-18 18:22:22.193236	\N	2022-12-18 18:22:22.193236	0
230	2022-12-18 18:22:22.195362	\N	2022-12-18 18:22:22.195362	0
231	2022-12-18 18:22:22.197128	\N	2022-12-18 18:22:22.197128	0
232	2022-12-18 18:22:22.199445	\N	2022-12-18 18:22:22.199445	0
233	2022-12-18 18:22:22.201392	\N	2022-12-18 18:22:22.201392	0
234	2022-12-18 18:22:22.204754	\N	2022-12-18 18:22:22.204754	0
235	2022-12-18 18:22:22.208078	\N	2022-12-18 18:22:22.208078	0
236	2022-12-18 18:22:22.209734	\N	2022-12-18 18:22:22.209734	0
237	2022-12-18 18:22:22.211592	\N	2022-12-18 18:22:22.211592	0
238	2022-12-18 18:22:22.213425	\N	2022-12-18 18:22:22.213425	0
239	2022-12-18 18:22:22.21516	\N	2022-12-18 18:22:22.21516	0
240	2022-12-18 18:22:22.216944	\N	2022-12-18 18:22:22.216944	0
241	2022-12-18 18:22:22.22044	\N	2022-12-18 18:22:22.22044	0
198	2022-12-18 18:22:22.258975	\N	2022-12-18 18:22:22.103723	0
202	2022-12-18 18:22:22.2643	\N	2022-12-18 18:22:22.104727	0
205	2022-12-18 18:22:22.270101	\N	2022-12-18 18:22:22.108554	0
242	2022-12-18 18:22:22.28672	\N	2022-12-18 18:22:22.28672	0
243	2022-12-18 18:22:22.289443	\N	2022-12-18 18:22:22.289443	0
244	2022-12-18 18:22:22.290301	\N	2022-12-18 18:22:22.290301	0
245	2022-12-18 18:22:22.291119	\N	2022-12-18 18:22:22.291119	0
246	2022-12-18 18:22:22.292133	\N	2022-12-18 18:22:22.292133	0
247	2022-12-18 18:22:22.29279	\N	2022-12-18 18:22:22.29279	0
248	2022-12-18 18:22:22.29436	\N	2022-12-18 18:22:22.29436	0
249	2022-12-18 18:22:22.35468	\N	2022-12-18 18:22:22.35468	0
250	2022-12-18 18:22:22.357595	\N	2022-12-18 18:22:22.357595	0
251	2022-12-18 18:22:22.364579	\N	2022-12-18 18:22:22.364579	0
252	2022-12-18 18:22:22.365743	\N	2022-12-18 18:22:22.365743	0
253	2022-12-18 18:22:22.368574	\N	2022-12-18 18:22:22.368574	0
254	2022-12-18 18:22:22.369608	\N	2022-12-18 18:22:22.369608	0
255	2022-12-18 18:22:22.370285	\N	2022-12-18 18:22:22.370285	0
256	2022-12-18 18:22:22.375604	\N	2022-12-18 18:22:22.375604	0
257	2022-12-18 18:22:22.376198	\N	2022-12-18 18:22:22.376198	0
258	2022-12-18 18:22:22.377871	\N	2022-12-18 18:22:22.377871	0
259	2022-12-18 18:22:22.394953	\N	2022-12-18 18:22:22.394953	0
260	2022-12-18 18:22:22.463466	\N	2022-12-18 18:22:22.463466	0
261	2022-12-18 18:22:22.466928	\N	2022-12-18 18:22:22.466928	0
262	2022-12-18 18:22:22.474185	\N	2022-12-18 18:22:22.474185	0
263	2022-12-18 18:22:22.475167	\N	2022-12-18 18:22:22.475167	0
264	2022-12-18 18:22:22.490387	\N	2022-12-18 18:22:22.490387	0
265	2022-12-18 18:22:22.52173	\N	2022-12-18 18:22:22.52173	0
266	2022-12-18 18:22:22.524675	\N	2022-12-18 18:22:22.524675	0
267	2022-12-18 18:22:22.531396	\N	2022-12-18 18:22:22.531396	0
268	2022-12-18 18:22:22.53204	\N	2022-12-18 18:22:22.53204	0
269	2022-12-18 18:22:22.571805	\N	2022-12-18 18:22:22.571805	0
270	2022-12-18 18:22:22.574712	\N	2022-12-18 18:22:22.574712	0
271	2022-12-18 18:22:22.575677	\N	2022-12-18 18:22:22.575677	0
272	2022-12-18 18:22:22.576585	\N	2022-12-18 18:22:22.576585	0
273	2022-12-18 18:22:22.577963	\N	2022-12-18 18:22:22.577963	0
274	2022-12-18 18:22:22.585599	\N	2022-12-18 18:22:22.585599	0
275	2022-12-18 18:22:22.586237	\N	2022-12-18 18:22:22.586237	0
276	2022-12-18 18:22:22.586706	\N	2022-12-18 18:22:22.586706	0
277	2022-12-18 18:22:22.587121	\N	2022-12-18 18:22:22.587121	0
278	2022-12-18 18:22:22.587416	\N	2022-12-18 18:22:22.587416	0
279	2022-12-18 18:22:22.587695	\N	2022-12-18 18:22:22.587695	0
280	2022-12-18 18:22:22.588075	\N	2022-12-18 18:22:22.588075	0
281	2022-12-18 18:22:22.593776	\N	2022-12-18 18:22:22.593776	0
282	2022-12-18 18:22:22.594525	\N	2022-12-18 18:22:22.594525	0
283	2022-12-18 18:22:22.595244	\N	2022-12-18 18:22:22.595244	0
284	2022-12-18 18:22:22.595926	\N	2022-12-18 18:22:22.595926	0
285	2022-12-18 18:22:22.596658	\N	2022-12-18 18:22:22.596658	0
286	2022-12-18 18:22:22.59741	\N	2022-12-18 18:22:22.59741	0
287	2022-12-18 18:22:22.598108	\N	2022-12-18 18:22:22.598108	0
288	2022-12-18 18:22:22.603784	\N	2022-12-18 18:22:22.603784	0
289	2022-12-18 18:22:22.604508	\N	2022-12-18 18:22:22.604508	0
290	2022-12-18 18:22:22.605357	\N	2022-12-18 18:22:22.605357	0
291	2022-12-18 18:22:22.60606	\N	2022-12-18 18:22:22.60606	0
292	2022-12-18 18:22:22.606738	\N	2022-12-18 18:22:22.606738	0
293	2022-12-18 18:22:22.607402	\N	2022-12-18 18:22:22.607402	0
294	2022-12-18 18:22:22.608129	\N	2022-12-18 18:22:22.608129	0
295	2022-12-18 18:22:22.613913	\N	2022-12-18 18:22:22.613913	0
296	2022-12-18 18:22:22.614663	\N	2022-12-18 18:22:22.614663	0
297	2022-12-18 18:22:22.656151	\N	2022-12-18 18:22:22.656151	0
298	2022-12-18 18:22:22.658823	\N	2022-12-18 18:22:22.658823	0
299	2022-12-18 18:22:22.666129	\N	2022-12-18 18:22:22.666129	0
300	2022-12-18 18:22:22.667282	\N	2022-12-18 18:22:22.667282	0
301	2022-12-18 18:22:22.668347	\N	2022-12-18 18:22:22.668347	0
302	2022-12-18 18:22:22.669187	\N	2022-12-18 18:22:22.669187	0
303	2022-12-18 18:22:22.675567	\N	2022-12-18 18:22:22.675567	0
304	2022-12-18 18:22:22.676333	\N	2022-12-18 18:22:22.676333	0
305	2022-12-18 18:22:22.677043	\N	2022-12-18 18:22:22.677043	0
306	2022-12-18 18:22:22.677962	\N	2022-12-18 18:22:22.677962	0
307	2022-12-18 18:22:22.684049	\N	2022-12-18 18:22:22.684049	0
308	2022-12-18 18:22:22.684759	\N	2022-12-18 18:22:22.684759	0
309	2022-12-18 18:22:22.685428	\N	2022-12-18 18:22:22.685428	0
310	2022-12-18 18:22:22.686039	\N	2022-12-18 18:22:22.686039	0
311	2022-12-18 18:22:22.692157	\N	2022-12-18 18:22:22.692157	0
312	2022-12-18 18:22:22.692907	\N	2022-12-18 18:22:22.692907	0
313	2022-12-18 18:22:22.721619	\N	2022-12-18 18:22:22.721619	0
314	2022-12-18 18:22:22.748625	\N	2022-12-18 18:22:22.748625	0
315	2022-12-18 18:22:22.751137	\N	2022-12-18 18:22:22.751137	0
316	2022-12-18 18:22:22.752494	\N	2022-12-18 18:22:22.752494	0
651	2022-12-18 18:23:20.40041	\N	2022-12-18 18:23:20.40041	0
652	2022-12-18 18:23:20.408376	\N	2022-12-18 18:23:20.408376	0
317	2022-12-18 18:22:22.757527	\N	2022-12-18 18:22:22.7529	0
319	2022-12-18 18:22:22.759252	\N	2022-12-18 18:22:22.759252	0
320	2022-12-18 18:22:22.759916	\N	2022-12-18 18:22:22.759916	0
321	2022-12-18 18:22:22.76043	\N	2022-12-18 18:22:22.76043	0
322	2022-12-18 18:22:22.761361	\N	2022-12-18 18:22:22.761361	0
323	2022-12-18 18:22:22.762426	\N	2022-12-18 18:22:22.762426	0
324	2022-12-18 18:22:22.763472	\N	2022-12-18 18:22:22.763472	0
325	2022-12-18 18:22:22.766232	\N	2022-12-18 18:22:22.766232	0
326	2022-12-18 18:22:22.768621	\N	2022-12-18 18:22:22.768621	0
327	2022-12-18 18:22:22.772778	\N	2022-12-18 18:22:22.772778	0
331	2022-12-19 10:14:57.901439	\N	2022-12-18 18:22:22.786768	0
735	2022-12-30 16:24:25.157354	\N	2022-12-30 16:24:25.157354	0
328	2022-12-18 18:22:22.77863	\N	2022-12-18 18:22:22.773448	0
330	2022-12-18 18:22:22.785983	\N	2022-12-18 18:22:22.785983	0
332	2022-12-18 18:22:22.788451	\N	2022-12-18 18:22:22.788451	0
333	2022-12-18 18:22:22.789897	\N	2022-12-18 18:22:22.789897	0
334	2022-12-18 18:22:22.791328	\N	2022-12-18 18:22:22.791328	0
335	2022-12-18 18:22:22.796931	\N	2022-12-18 18:22:22.792017	0
318	2023-01-01 15:17:50.185006	\N	2022-12-18 18:22:22.758021	0
337	2022-12-18 18:22:22.804044	\N	2022-12-18 18:22:22.804044	0
338	2022-12-18 18:22:22.804736	\N	2022-12-18 18:22:22.804736	0
339	2022-12-18 18:22:22.806204	\N	2022-12-18 18:22:22.806204	0
340	2022-12-18 18:22:22.807449	\N	2022-12-18 18:22:22.807449	0
341	2022-12-18 18:22:22.809126	\N	2022-12-18 18:22:22.809126	0
342	2022-12-18 18:22:22.815355	\N	2022-12-18 18:22:22.810034	0
343	2022-12-18 18:22:22.82113	\N	2022-12-18 18:22:22.816117	0
344	2022-12-18 18:22:22.822569	\N	2022-12-18 18:22:22.822569	0
345	2022-12-18 18:22:22.823325	\N	2022-12-18 18:22:22.823325	0
346	2022-12-18 18:22:22.82481	\N	2022-12-18 18:22:22.82481	0
347	2022-12-18 18:22:22.826099	\N	2022-12-18 18:22:22.826099	0
348	2022-12-18 18:22:22.827572	\N	2022-12-18 18:22:22.827572	0
349	2022-12-18 18:22:22.833598	\N	2022-12-18 18:22:22.828363	0
350	2022-12-18 18:22:22.839041	\N	2022-12-18 18:22:22.834411	0
351	2022-12-18 18:22:22.840571	\N	2022-12-18 18:22:22.840571	0
352	2022-12-18 18:22:22.841293	\N	2022-12-18 18:22:22.841293	0
353	2022-12-18 18:22:22.844286	\N	2022-12-18 18:22:22.844286	0
354	2022-12-18 18:22:22.850027	\N	2022-12-18 18:22:22.845035	0
355	2022-12-18 18:22:22.855573	\N	2022-12-18 18:22:22.850844	0
356	2022-12-18 18:22:22.857047	\N	2022-12-18 18:22:22.857047	0
357	2022-12-18 18:22:22.857822	\N	2022-12-18 18:22:22.857822	0
358	2022-12-18 18:22:22.85924	\N	2022-12-18 18:22:22.85924	0
359	2022-12-18 18:22:22.860742	\N	2022-12-18 18:22:22.860742	0
360	2022-12-18 18:22:22.862324	\N	2022-12-18 18:22:22.862324	0
361	2022-12-18 18:22:22.868341	\N	2022-12-18 18:22:22.863024	0
362	2022-12-18 18:22:22.873898	\N	2022-12-18 18:22:22.869195	0
363	2022-12-18 18:22:22.875306	\N	2022-12-18 18:22:22.875306	0
364	2022-12-18 18:22:22.87595	\N	2022-12-18 18:22:22.87595	0
365	2022-12-18 18:22:22.877222	\N	2022-12-18 18:22:22.877222	0
366	2022-12-18 18:22:22.878592	\N	2022-12-18 18:22:22.878592	0
367	2022-12-18 18:22:22.880103	\N	2022-12-18 18:22:22.880103	0
368	2022-12-18 18:22:22.885998	\N	2022-12-18 18:22:22.880766	0
369	2022-12-18 18:22:22.892373	\N	2022-12-18 18:22:22.886746	0
370	2022-12-18 18:22:22.894952	\N	2022-12-18 18:22:22.894952	0
371	2022-12-18 18:22:22.895934	\N	2022-12-18 18:22:22.895934	0
372	2022-12-18 18:22:22.899163	\N	2022-12-18 18:22:22.899163	0
721	2022-12-30 16:24:25.145633	\N	2022-12-30 16:20:45.215517	0
720	2022-12-30 16:24:25.147021	\N	2022-12-30 16:20:45.211453	0
726	2022-12-30 16:24:25.148655	\N	2022-12-30 16:24:25.148655	0
727	2022-12-30 16:24:25.149872	\N	2022-12-30 16:24:25.149872	0
728	2022-12-30 16:24:25.151391	\N	2022-12-30 16:24:25.151391	0
729	2022-12-30 16:24:25.153672	\N	2022-12-30 16:24:25.153672	0
730	2022-12-30 16:24:25.154281	\N	2022-12-30 16:24:25.154281	0
731	2022-12-30 16:24:25.15497	\N	2022-12-30 16:24:25.15497	0
732	2022-12-30 16:24:25.155431	\N	2022-12-30 16:24:25.155431	0
733	2022-12-30 16:24:25.156435	\N	2022-12-30 16:24:25.156435	0
734	2022-12-30 16:24:25.156802	\N	2022-12-30 16:24:25.156802	0
736	2022-12-30 16:24:25.157703	\N	2022-12-30 16:24:25.157703	0
737	2022-12-30 16:24:25.158072	\N	2022-12-30 16:24:25.158072	0
429	2022-12-30 16:28:52.225232	\N	2022-12-18 18:22:23.13712	0
752	2022-12-30 16:28:52.228342	\N	2022-12-30 16:28:02.574246	0
755	2022-12-30 16:28:52.230751	\N	2022-12-30 16:28:51.867448	0
757	2022-12-30 16:28:52.231114	\N	2022-12-30 16:28:51.870125	0
763	2022-12-30 16:28:52.232612	\N	2022-12-30 16:28:52.232612	0
764	2022-12-30 16:28:52.233474	\N	2022-12-30 16:28:52.233474	0
765	2022-12-30 16:28:52.233982	\N	2022-12-30 16:28:52.233982	0
766	2022-12-30 16:28:52.238115	\N	2022-12-30 16:28:52.238115	0
742	2022-12-30 16:28:52.272466	\N	2022-12-30 16:28:02.335056	0
753	2022-12-30 16:30:05.497203	\N	2022-12-30 16:28:51.862921	0
329	2023-01-01 15:17:50.193207	\N	2022-12-18 18:22:22.779391	0
336	2023-01-01 15:17:50.199792	\N	2022-12-18 18:22:22.797867	0
373	2022-12-18 18:22:22.905513	\N	2022-12-18 18:22:22.900134	0
374	2022-12-18 18:22:22.911363	\N	2022-12-18 18:22:22.906326	0
375	2022-12-18 18:22:22.912805	\N	2022-12-18 18:22:22.912805	0
376	2022-12-18 18:22:22.913554	\N	2022-12-18 18:22:22.913554	0
377	2022-12-18 18:22:22.914905	\N	2022-12-18 18:22:22.914905	0
378	2022-12-18 18:22:22.916325	\N	2022-12-18 18:22:22.916325	0
379	2022-12-18 18:22:22.91793	\N	2022-12-18 18:22:22.91793	0
380	2022-12-18 18:22:22.924322	\N	2022-12-18 18:22:22.91868	0
381	2022-12-18 18:22:22.92962	\N	2022-12-18 18:22:22.925118	0
382	2022-12-18 18:22:22.931466	\N	2022-12-18 18:22:22.931466	0
383	2022-12-18 18:22:22.932263	\N	2022-12-18 18:22:22.932263	0
458	2022-12-18 18:22:23.250917	\N	2022-12-18 18:22:23.248756	0
384	2022-12-18 18:22:22.988795	\N	2022-12-18 18:22:22.980805	0
385	2022-12-18 18:22:22.989122	\N	2022-12-18 18:22:22.989122	0
459	2022-12-18 18:22:23.251822	\N	2022-12-18 18:22:23.249069	0
460	2022-12-18 18:22:23.252625	\N	2022-12-18 18:22:23.249458	0
386	2022-12-18 18:22:22.992475	\N	2022-12-18 18:22:22.989757	0
387	2022-12-18 18:22:22.993091	\N	2022-12-18 18:22:22.993091	0
462	2022-12-18 18:22:23.254443	\N	2022-12-18 18:22:23.254443	0
388	2022-12-18 18:22:22.996076	\N	2022-12-18 18:22:22.993527	0
389	2022-12-18 18:22:22.996347	\N	2022-12-18 18:22:22.996347	0
390	2022-12-18 18:22:22.999497	\N	2022-12-18 18:22:22.996773	0
391	2022-12-18 18:22:22.999772	\N	2022-12-18 18:22:22.999772	0
392	2022-12-18 18:22:23.081108	\N	2022-12-18 18:22:23.042585	0
463	2022-12-18 18:22:23.2566	\N	2022-12-18 18:22:23.254769	0
406	2022-12-18 18:22:23.086456	\N	2022-12-18 18:22:23.08497	0
407	2022-12-18 18:22:23.087034	\N	2022-12-18 18:22:23.087034	0
408	2022-12-18 18:22:23.090077	\N	2022-12-18 18:22:23.090077	0
409	2022-12-18 18:22:23.09116	\N	2022-12-18 18:22:23.09116	0
410	2022-12-18 18:22:23.091516	\N	2022-12-18 18:22:23.091516	0
411	2022-12-18 18:22:23.091891	\N	2022-12-18 18:22:23.091891	0
412	2022-12-18 18:22:23.092201	\N	2022-12-18 18:22:23.092201	0
413	2022-12-18 18:22:23.092503	\N	2022-12-18 18:22:23.092503	0
414	2022-12-18 18:22:23.09285	\N	2022-12-18 18:22:23.09285	0
415	2022-12-18 18:22:23.093126	\N	2022-12-18 18:22:23.093126	0
416	2022-12-18 18:22:23.093391	\N	2022-12-18 18:22:23.093391	0
417	2022-12-18 18:22:23.093655	\N	2022-12-18 18:22:23.093655	0
405	2022-12-18 18:22:23.108682	\N	2022-12-18 18:22:23.084012	0
418	2022-12-18 18:22:23.111281	\N	2022-12-18 18:22:23.111281	0
419	2022-12-18 18:22:23.114243	\N	2022-12-18 18:22:23.114243	0
394	2022-12-18 18:22:23.122144	\N	2022-12-18 18:22:23.048469	0
421	2022-12-18 18:22:23.122916	\N	2022-12-18 18:22:23.122916	0
422	2022-12-18 18:22:23.124629	\N	2022-12-18 18:22:23.124629	0
395	2022-12-18 18:22:23.12926	\N	2022-12-18 18:22:23.050364	0
424	2022-12-18 18:22:23.129773	\N	2022-12-18 18:22:23.129773	0
425	2022-12-18 18:22:23.13177	\N	2022-12-18 18:22:23.13177	0
396	2022-12-18 18:22:23.135345	\N	2022-12-18 18:22:23.051456	0
427	2022-12-18 18:22:23.135956	\N	2022-12-18 18:22:23.135956	0
428	2022-12-18 18:22:23.13712	\N	2022-12-18 18:22:23.13712	0
397	2022-12-18 18:22:23.140723	\N	2022-12-18 18:22:23.05247	0
430	2022-12-18 18:22:23.141178	\N	2022-12-18 18:22:23.141178	0
431	2022-12-18 18:22:23.142211	\N	2022-12-18 18:22:23.142211	0
398	2022-12-18 18:22:23.146326	\N	2022-12-18 18:22:23.053518	0
433	2022-12-18 18:22:23.146872	\N	2022-12-18 18:22:23.146872	0
434	2022-12-18 18:22:23.148267	\N	2022-12-18 18:22:23.148267	0
399	2022-12-18 18:22:23.152255	\N	2022-12-18 18:22:23.054967	0
436	2022-12-18 18:22:23.152912	\N	2022-12-18 18:22:23.152912	0
437	2022-12-18 18:22:23.154131	\N	2022-12-18 18:22:23.154131	0
400	2022-12-18 18:22:23.158339	\N	2022-12-18 18:22:23.056017	0
439	2022-12-18 18:22:23.158828	\N	2022-12-18 18:22:23.158828	0
440	2022-12-18 18:22:23.160015	\N	2022-12-18 18:22:23.160015	0
401	2022-12-18 18:22:23.16361	\N	2022-12-18 18:22:23.056986	0
442	2022-12-18 18:22:23.164032	\N	2022-12-18 18:22:23.164032	0
443	2022-12-18 18:22:23.165131	\N	2022-12-18 18:22:23.165131	0
724	2022-12-30 16:22:10.802233	\N	2022-12-30 16:22:10.802233	0
402	2022-12-18 18:22:23.168897	\N	2022-12-18 18:22:23.058015	0
445	2022-12-18 18:22:23.169259	\N	2022-12-18 18:22:23.169259	0
446	2022-12-18 18:22:23.170358	\N	2022-12-18 18:22:23.170358	0
403	2022-12-18 18:22:23.174001	\N	2022-12-18 18:22:23.059393	0
448	2022-12-18 18:22:23.174346	\N	2022-12-18 18:22:23.174346	0
393	2022-12-18 18:22:23.175709	\N	2022-12-18 18:22:23.044887	0
450	2022-12-18 18:22:23.231158	\N	2022-12-18 18:22:23.231158	0
452	2022-12-18 18:22:23.238003	\N	2022-12-18 18:22:23.238003	0
453	2022-12-18 18:22:23.243382	\N	2022-12-18 18:22:23.238675	0
454	2022-12-18 18:22:23.245495	\N	2022-12-18 18:22:23.239252	0
455	2022-12-18 18:22:23.246914	\N	2022-12-18 18:22:23.23983	0
457	2022-12-18 18:22:23.248437	\N	2022-12-18 18:22:23.248437	0
464	2022-12-18 18:22:23.257432	\N	2022-12-18 18:22:23.255071	0
465	2022-12-18 18:22:23.258353	\N	2022-12-18 18:22:23.255323	0
420	2022-12-18 18:22:23.753157	\N	2022-12-18 18:22:23.114243	0
468	2022-12-18 18:22:23.275127	\N	2022-12-18 18:22:23.275127	0
469	2022-12-18 18:22:23.280735	\N	2022-12-18 18:22:23.280735	0
456	2022-12-18 18:22:23.286754	\N	2022-12-18 18:22:23.240696	0
470	2022-12-18 18:22:23.288017	\N	2022-12-18 18:22:23.288017	0
471	2022-12-18 18:22:23.2921	\N	2022-12-18 18:22:23.2921	0
461	2022-12-18 18:22:23.29624	\N	2022-12-18 18:22:23.249751	0
472	2022-12-18 18:22:23.297295	\N	2022-12-18 18:22:23.297295	0
473	2022-12-18 18:22:23.301176	\N	2022-12-18 18:22:23.301176	0
723	2022-12-30 16:23:06.945636	\N	2022-12-30 16:22:10.798107	0
466	2022-12-18 18:22:23.305435	\N	2022-12-18 18:22:23.255602	0
423	2022-12-18 18:22:23.759227	\N	2022-12-18 18:22:23.124629	0
426	2022-12-18 18:22:23.762761	\N	2022-12-18 18:22:23.13177	0
474	2022-12-18 18:22:23.31676	\N	2022-12-18 18:22:23.31676	0
449	2022-12-18 18:22:23.318883	\N	2022-12-18 18:22:23.229046	0
404	2022-12-23 12:00:22.65833	\N	2022-12-18 18:22:23.077929	0
475	2022-12-18 18:22:23.325095	\N	2022-12-18 18:22:23.325095	0
476	2022-12-18 18:22:23.340663	\N	2022-12-18 18:22:23.328175	0
696	2022-12-23 12:00:22.771804	\N	2022-12-23 12:00:22.771804	0
451	2022-12-18 18:22:23.351218	\N	2022-12-18 18:22:23.232122	0
467	2022-12-18 18:22:23.356861	\N	2022-12-18 18:22:23.262935	0
478	2022-12-18 18:22:23.362491	\N	2022-12-18 18:22:23.362491	0
480	2022-12-18 18:22:23.369957	\N	2022-12-18 18:22:23.369957	0
722	2022-12-30 16:23:06.947653	\N	2022-12-30 16:22:10.791067	0
725	2022-12-30 16:23:26.188496	\N	2022-12-30 16:22:10.876194	0
447	2022-12-30 16:28:51.917635	\N	2022-12-18 18:22:23.170358	0
767	2022-12-30 16:30:05.500165	\N	2022-12-30 16:30:05.500165	0
768	2022-12-30 16:30:05.695586	\N	2022-12-30 16:30:05.685398	0
481	2022-12-18 18:22:23.375048	\N	2022-12-18 18:22:23.370697	0
482	2022-12-18 18:22:23.37706	\N	2022-12-18 18:22:23.371442	0
483	2022-12-18 18:22:23.379018	\N	2022-12-18 18:22:23.372046	0
485	2022-12-18 18:22:23.381749	\N	2022-12-18 18:22:23.381749	0
486	2022-12-18 18:22:23.386502	\N	2022-12-18 18:22:23.382514	0
487	2022-12-18 18:22:23.388573	\N	2022-12-18 18:22:23.383187	0
488	2022-12-18 18:22:23.390972	\N	2022-12-18 18:22:23.38383	0
490	2022-12-18 18:22:23.393574	\N	2022-12-18 18:22:23.393574	0
491	2022-12-18 18:22:23.398741	\N	2022-12-18 18:22:23.394311	0
492	2022-12-18 18:22:23.400724	\N	2022-12-18 18:22:23.394978	0
493	2022-12-18 18:22:23.402699	\N	2022-12-18 18:22:23.395532	0
496	2022-12-18 18:22:23.409813	\N	2022-12-18 18:22:23.409813	0
497	2022-12-18 18:22:23.410849	\N	2022-12-18 18:22:23.410849	0
498	2022-12-18 18:22:23.41907	\N	2022-12-18 18:22:23.41907	0
499	2022-12-18 18:22:23.422489	\N	2022-12-18 18:22:23.422489	0
484	2022-12-18 18:22:23.425158	\N	2022-12-18 18:22:23.372735	0
500	2022-12-18 18:22:23.42582	\N	2022-12-18 18:22:23.42582	0
501	2022-12-18 18:22:23.427845	\N	2022-12-18 18:22:23.427845	0
489	2022-12-18 18:22:23.430606	\N	2022-12-18 18:22:23.384439	0
502	2022-12-18 18:22:23.431365	\N	2022-12-18 18:22:23.431365	0
503	2022-12-18 18:22:23.433241	\N	2022-12-18 18:22:23.433241	0
494	2022-12-18 18:22:23.436285	\N	2022-12-18 18:22:23.396209	0
552	2022-12-18 18:22:23.679209	\N	2022-12-18 18:22:23.679209	0
504	2022-12-18 18:22:23.441063	\N	2022-12-18 18:22:23.441063	0
477	2022-12-18 18:22:23.442039	\N	2022-12-18 18:22:23.361887	0
549	2022-12-18 18:22:23.681764	\N	2022-12-18 18:22:23.677216	0
479	2022-12-18 18:22:23.444928	\N	2022-12-18 18:22:23.363258	0
495	2022-12-18 18:22:23.448208	\N	2022-12-18 18:22:23.4089	0
506	2022-12-18 18:22:23.450853	\N	2022-12-18 18:22:23.450853	0
508	2022-12-18 18:22:23.454196	\N	2022-12-18 18:22:23.454196	0
509	2022-12-18 18:22:23.456292	\N	2022-12-18 18:22:23.454523	0
510	2022-12-18 18:22:23.457107	\N	2022-12-18 18:22:23.454798	0
511	2022-12-18 18:22:23.458035	\N	2022-12-18 18:22:23.455047	0
513	2022-12-18 18:22:23.459501	\N	2022-12-18 18:22:23.459501	0
514	2022-12-18 18:22:23.461549	\N	2022-12-18 18:22:23.459811	0
515	2022-12-18 18:22:23.462337	\N	2022-12-18 18:22:23.460098	0
516	2022-12-18 18:22:23.463173	\N	2022-12-18 18:22:23.460356	0
518	2022-12-18 18:22:23.464569	\N	2022-12-18 18:22:23.464569	0
519	2022-12-18 18:22:23.466598	\N	2022-12-18 18:22:23.464866	0
520	2022-12-18 18:22:23.467423	\N	2022-12-18 18:22:23.465174	0
521	2022-12-18 18:22:23.468206	\N	2022-12-18 18:22:23.465408	0
550	2022-12-18 18:22:23.683761	\N	2022-12-18 18:22:23.677909	0
524	2022-12-18 18:22:23.476654	\N	2022-12-18 18:22:23.476654	0
525	2022-12-18 18:22:23.480535	\N	2022-12-18 18:22:23.480535	0
512	2022-12-18 18:22:23.484942	\N	2022-12-18 18:22:23.455336	0
526	2022-12-18 18:22:23.486157	\N	2022-12-18 18:22:23.486157	0
527	2022-12-18 18:22:23.4902	\N	2022-12-18 18:22:23.4902	0
517	2022-12-18 18:22:23.494533	\N	2022-12-18 18:22:23.46062	0
528	2022-12-18 18:22:23.495534	\N	2022-12-18 18:22:23.495534	0
529	2022-12-18 18:22:23.499167	\N	2022-12-18 18:22:23.499167	0
522	2022-12-18 18:22:23.503049	\N	2022-12-18 18:22:23.465667	0
551	2022-12-18 18:22:23.686771	\N	2022-12-18 18:22:23.67861	0
553	2022-12-18 18:22:23.690193	\N	2022-12-18 18:22:23.690193	0
530	2022-12-18 18:22:23.513366	\N	2022-12-18 18:22:23.513366	0
505	2022-12-18 18:22:23.515283	\N	2022-12-18 18:22:23.450498	0
507	2022-12-18 18:22:23.519622	\N	2022-12-18 18:22:23.451205	0
523	2022-12-18 18:22:23.525714	\N	2022-12-18 18:22:23.471737	0
658	2022-12-19 10:40:18.704008	\N	2022-12-19 10:39:30.234836	0
533	2022-12-18 18:22:23.632689	\N	2022-12-18 18:22:23.632689	0
537	2022-12-18 18:22:23.636486	\N	2022-12-18 18:22:23.636486	0
534	2022-12-18 18:22:23.640256	\N	2022-12-18 18:22:23.633607	0
535	2022-12-18 18:22:23.6439	\N	2022-12-18 18:22:23.634854	0
536	2022-12-18 18:22:23.64692	\N	2022-12-18 18:22:23.635701	0
538	2022-12-18 18:22:23.651442	\N	2022-12-18 18:22:23.651442	0
542	2022-12-18 18:22:23.654095	\N	2022-12-18 18:22:23.654095	0
539	2022-12-18 18:22:23.656386	\N	2022-12-18 18:22:23.652143	0
540	2022-12-18 18:22:23.658503	\N	2022-12-18 18:22:23.652758	0
541	2022-12-18 18:22:23.660688	\N	2022-12-18 18:22:23.6534	0
543	2022-12-18 18:22:23.663979	\N	2022-12-18 18:22:23.663979	0
547	2022-12-18 18:22:23.666696	\N	2022-12-18 18:22:23.666696	0
544	2022-12-18 18:22:23.668892	\N	2022-12-18 18:22:23.664687	0
545	2022-12-18 18:22:23.670909	\N	2022-12-18 18:22:23.665455	0
546	2022-12-18 18:22:23.672947	\N	2022-12-18 18:22:23.666071	0
548	2022-12-18 18:22:23.676396	\N	2022-12-18 18:22:23.676396	0
557	2022-12-18 18:22:23.693105	\N	2022-12-18 18:22:23.693105	0
554	2022-12-18 18:22:23.695159	\N	2022-12-18 18:22:23.691069	0
555	2022-12-18 18:22:23.697198	\N	2022-12-18 18:22:23.691776	0
556	2022-12-18 18:22:23.699354	\N	2022-12-18 18:22:23.69245	0
558	2022-12-18 18:22:23.703436	\N	2022-12-18 18:22:23.703436	0
562	2022-12-18 18:22:23.706252	\N	2022-12-18 18:22:23.706252	0
559	2022-12-18 18:22:23.708571	\N	2022-12-18 18:22:23.704323	0
560	2022-12-18 18:22:23.710714	\N	2022-12-18 18:22:23.70495	0
561	2022-12-18 18:22:23.713249	\N	2022-12-18 18:22:23.705599	0
563	2022-12-18 18:22:23.716491	\N	2022-12-18 18:22:23.716491	0
567	2022-12-18 18:22:23.719149	\N	2022-12-18 18:22:23.719149	0
564	2022-12-18 18:22:23.721275	\N	2022-12-18 18:22:23.717212	0
565	2022-12-18 18:22:23.72328	\N	2022-12-18 18:22:23.717878	0
566	2022-12-18 18:22:23.725427	\N	2022-12-18 18:22:23.718479	0
568	2022-12-18 18:22:23.728834	\N	2022-12-18 18:22:23.728834	0
572	2022-12-18 18:22:23.731382	\N	2022-12-18 18:22:23.731382	0
569	2022-12-18 18:22:23.73343	\N	2022-12-18 18:22:23.729536	0
570	2022-12-18 18:22:23.735411	\N	2022-12-18 18:22:23.73016	0
571	2022-12-18 18:22:23.737617	\N	2022-12-18 18:22:23.730782	0
573	2022-12-18 18:22:23.740836	\N	2022-12-18 18:22:23.740836	0
577	2022-12-18 18:22:23.742667	\N	2022-12-18 18:22:23.742667	0
574	2022-12-18 18:22:23.74354	\N	2022-12-18 18:22:23.741509	0
575	2022-12-18 18:22:23.744363	\N	2022-12-18 18:22:23.742165	0
576	2022-12-18 18:22:23.745291	\N	2022-12-18 18:22:23.742423	0
578	2022-12-18 18:22:23.747546	\N	2022-12-18 18:22:23.747546	0
655	2022-12-19 10:41:57.262557	\N	2022-12-19 10:38:59.043811	0
657	2022-12-19 10:40:42.126904	\N	2022-12-19 10:38:59.51648	0
708	2022-12-27 11:30:32.787149	\N	2022-12-27 11:30:32.787149	0
654	2022-12-19 10:41:41.713385	\N	2022-12-19 10:38:58.93335	0
685	2022-12-30 16:26:16.744438	\N	2022-12-19 11:46:46.653126	0
739	2022-12-30 16:26:25.453367	\N	2022-12-30 16:26:25.453367	0
738	2022-12-31 10:48:22.597552	\N	2022-12-30 16:26:18.767219	0
656	2022-12-19 10:41:50.045587	\N	2022-12-19 10:38:59.060508	0
686	2022-12-19 11:46:53.198773	\N	2022-12-19 11:46:53.198773	0
707	2022-12-27 11:32:46.414319	\N	2022-12-27 11:30:32.779149	0
779	2022-12-31 10:45:27.361605	\N	2022-12-31 10:45:12.152907	0
780	2022-12-31 10:45:27.374763	\N	2022-12-31 10:45:27.374763	0
582	2022-12-18 18:22:23.748628	\N	2022-12-18 18:22:23.748628	0
579	2022-12-18 18:22:23.749572	\N	2022-12-18 18:22:23.747837	0
580	2022-12-18 18:22:23.750568	\N	2022-12-18 18:22:23.748114	0
581	2022-12-18 18:22:23.751506	\N	2022-12-18 18:22:23.74839	0
583	2022-12-18 18:22:23.753157	\N	2022-12-18 18:22:23.753157	0
584	2022-12-18 18:22:23.758184	\N	2022-12-18 18:22:23.758184	0
585	2022-12-18 18:22:23.759227	\N	2022-12-18 18:22:23.759227	0
586	2022-12-18 18:22:23.761997	\N	2022-12-18 18:22:23.761997	0
587	2022-12-18 18:22:23.762761	\N	2022-12-18 18:22:23.762761	0
588	2022-12-18 18:22:23.765476	\N	2022-12-18 18:22:23.765476	0
589	2022-12-18 18:22:23.766405	\N	2022-12-18 18:22:23.766405	0
590	2022-12-18 18:22:23.770269	\N	2022-12-18 18:22:23.770269	0
591	2022-12-18 18:22:23.771202	\N	2022-12-18 18:22:23.771202	0
432	2022-12-18 18:22:23.771202	\N	2022-12-18 18:22:23.142211	0
592	2022-12-18 18:22:23.774224	\N	2022-12-18 18:22:23.774224	0
593	2022-12-18 18:22:23.775281	\N	2022-12-18 18:22:23.775281	0
435	2022-12-18 18:22:23.775281	\N	2022-12-18 18:22:23.148267	0
594	2022-12-18 18:22:23.778568	\N	2022-12-18 18:22:23.778568	0
595	2022-12-18 18:22:23.779491	\N	2022-12-18 18:22:23.779491	0
438	2022-12-18 18:22:23.779491	\N	2022-12-18 18:22:23.154131	0
596	2022-12-18 18:22:23.782154	\N	2022-12-18 18:22:23.782154	0
597	2022-12-18 18:22:23.783004	\N	2022-12-18 18:22:23.783004	0
441	2022-12-18 18:22:23.783004	\N	2022-12-18 18:22:23.160015	0
598	2022-12-18 18:22:23.785626	\N	2022-12-18 18:22:23.785626	0
599	2022-12-18 18:22:23.786473	\N	2022-12-18 18:22:23.786473	0
444	2022-12-18 18:22:23.786473	\N	2022-12-18 18:22:23.165131	0
600	2022-12-18 18:22:23.789768	\N	2022-12-18 18:22:23.789768	0
601	2022-12-18 18:22:23.790559	\N	2022-12-18 18:22:23.790559	0
602	2022-12-18 18:22:23.793	\N	2022-12-18 18:22:23.793	0
531	2022-12-18 18:22:23.794696	\N	2022-12-18 18:22:23.624302	0
603	2022-12-18 18:22:23.79632	\N	2022-12-18 18:22:23.79632	0
604	2022-12-18 18:22:23.79632	\N	2022-12-18 18:22:23.79632	0
605	2022-12-18 18:22:23.799878	\N	2022-12-18 18:22:23.799878	0
606	2022-12-18 18:22:23.799878	\N	2022-12-18 18:22:23.799878	0
607	2022-12-18 18:22:23.803161	\N	2022-12-18 18:22:23.803161	0
608	2022-12-18 18:22:23.803161	\N	2022-12-18 18:22:23.803161	0
609	2022-12-18 18:22:23.806188	\N	2022-12-18 18:22:23.806188	0
610	2022-12-18 18:22:23.806188	\N	2022-12-18 18:22:23.806188	0
611	2022-12-18 18:22:23.80945	\N	2022-12-18 18:22:23.80945	0
612	2022-12-18 18:22:23.80945	\N	2022-12-18 18:22:23.80945	0
613	2022-12-18 18:22:23.812537	\N	2022-12-18 18:22:23.812537	0
614	2022-12-18 18:22:23.812537	\N	2022-12-18 18:22:23.812537	0
615	2022-12-18 18:22:23.815603	\N	2022-12-18 18:22:23.815603	0
616	2022-12-18 18:22:23.815603	\N	2022-12-18 18:22:23.815603	0
617	2022-12-18 18:22:23.818631	\N	2022-12-18 18:22:23.818631	0
618	2022-12-18 18:22:23.818631	\N	2022-12-18 18:22:23.818631	0
619	2022-12-18 18:22:23.821868	\N	2022-12-18 18:22:23.821868	0
620	2022-12-18 18:22:23.821868	\N	2022-12-18 18:22:23.821868	0
621	2022-12-18 18:22:23.82464	\N	2022-12-18 18:22:23.82464	0
622	2022-12-18 18:22:23.82464	\N	2022-12-18 18:22:23.82464	0
532	2022-12-18 18:22:23.827586	\N	2022-12-18 18:22:23.627121	0
623	2022-12-18 18:22:23.888956	\N	2022-12-18 18:22:23.888956	0
624	2022-12-18 18:22:23.891468	\N	2022-12-18 18:22:23.891468	0
625	2022-12-18 18:22:23.892852	\N	2022-12-18 18:22:23.892852	0
626	2022-12-18 18:22:23.894109	\N	2022-12-18 18:22:23.894109	0
627	2022-12-18 18:22:23.895724	\N	2022-12-18 18:22:23.895724	0
628	2022-12-18 18:22:23.897245	\N	2022-12-18 18:22:23.897245	0
629	2022-12-18 18:22:23.898916	\N	2022-12-18 18:22:23.898916	0
630	2022-12-18 18:22:23.900631	\N	2022-12-18 18:22:23.900631	0
631	2022-12-18 18:22:23.902163	\N	2022-12-18 18:22:23.902163	0
632	2022-12-18 18:22:23.952641	\N	2022-12-18 18:22:23.952641	0
633	2022-12-18 18:22:23.959078	\N	2022-12-18 18:22:23.959078	0
634	2022-12-18 18:22:23.963749	\N	2022-12-18 18:22:23.963749	0
635	2022-12-18 18:22:23.968301	\N	2022-12-18 18:22:23.968301	0
636	2022-12-18 18:22:23.972525	\N	2022-12-18 18:22:23.972525	0
637	2022-12-18 18:22:23.975924	\N	2022-12-18 18:22:23.975924	0
638	2022-12-18 18:22:23.979698	\N	2022-12-18 18:22:23.979698	0
639	2022-12-18 18:22:23.983526	\N	2022-12-18 18:22:23.983526	0
640	2022-12-18 18:22:23.98759	\N	2022-12-18 18:22:23.98759	0
641	2022-12-18 18:22:23.991514	\N	2022-12-18 18:22:23.991514	0
642	2022-12-18 18:22:23.995391	\N	2022-12-18 18:22:23.995391	0
643	2022-12-18 18:22:23.999313	\N	2022-12-18 18:22:23.999313	0
644	2022-12-18 18:22:24.003436	\N	2022-12-18 18:22:24.003436	0
645	2022-12-18 18:22:24.007247	\N	2022-12-18 18:22:24.007247	0
646	2022-12-18 18:22:24.010633	\N	2022-12-18 18:22:24.010633	0
647	2022-12-18 18:22:24.013939	\N	2022-12-18 18:22:24.013939	0
648	2022-12-18 18:22:24.017184	\N	2022-12-18 18:22:24.017184	0
649	2022-12-18 18:22:24.020609	\N	2022-12-18 18:22:24.020609	0
650	2022-12-18 18:22:24.046384	\N	2022-12-18 18:22:24.046384	0
659	2022-12-19 10:41:57.391889	\N	2022-12-19 10:41:57.391889	0
748	2022-12-30 16:28:02.573025	\N	2022-12-30 16:28:02.573025	0
749	2022-12-30 16:28:02.57753	\N	2022-12-30 16:28:02.573375	0
710	2022-12-30 16:18:19.534381	\N	2022-12-30 16:18:19.534381	0
711	2022-12-30 16:18:19.536212	\N	2022-12-30 16:18:19.536212	0
712	2022-12-30 16:18:19.538544	\N	2022-12-30 16:18:19.538544	0
713	2022-12-30 16:18:19.541315	\N	2022-12-30 16:18:19.541315	0
714	2022-12-30 16:18:19.542826	\N	2022-12-30 16:18:19.542826	0
715	2022-12-30 16:18:19.544398	\N	2022-12-30 16:18:19.544398	0
716	2022-12-30 16:18:19.545968	\N	2022-12-30 16:18:19.545968	0
717	2022-12-30 16:18:19.547249	\N	2022-12-30 16:18:19.547249	0
718	2022-12-30 16:18:19.549194	\N	2022-12-30 16:18:19.549194	0
719	2022-12-30 16:18:19.553267	\N	2022-12-30 16:18:19.553267	0
709	2022-12-30 16:19:05.326516	\N	2022-12-30 16:18:19.523843	0
741	2022-12-30 16:28:02.336753	\N	2022-12-30 16:28:02.334268	0
743	2022-12-30 16:28:02.340756	\N	2022-12-30 16:28:02.340756	0
744	2022-12-30 16:28:02.563892	\N	2022-12-30 16:28:02.341392	0
745	2022-12-30 16:28:02.566659	\N	2022-12-30 16:28:02.488015	0
746	2022-12-30 16:28:02.569761	\N	2022-12-30 16:28:02.534974	0
750	2022-12-30 16:28:02.578828	\N	2022-12-30 16:28:02.573675	0
751	2022-12-30 16:28:02.579902	\N	2022-12-30 16:28:02.57394	0
754	2022-12-30 16:28:51.874102	\N	2022-12-30 16:28:51.86457	0
756	2022-12-30 16:28:51.877513	\N	2022-12-30 16:28:51.868353	0
758	2022-12-30 16:28:51.88058	\N	2022-12-30 16:28:51.871008	0
740	2022-12-30 16:28:51.894292	\N	2022-12-30 16:28:02.329795	0
759	2022-12-30 16:28:51.911193	\N	2022-12-30 16:28:51.911193	0
760	2022-12-30 16:28:51.917635	\N	2022-12-30 16:28:51.917635	0
747	2022-12-30 16:28:52.222389	\N	2022-12-30 16:28:02.556414	0
761	2022-12-30 16:28:52.223181	\N	2022-12-30 16:28:52.223181	0
762	2022-12-30 16:28:52.225232	\N	2022-12-30 16:28:52.225232	0
828	2023-01-01 15:26:28.845392	\N	2023-01-01 15:22:58.762831	0
834	2023-01-01 15:26:43.037478	\N	2023-01-01 15:26:43.037478	0
781	2022-12-31 10:45:56.478885	\N	2022-12-31 10:45:43.373262	0
782	2022-12-31 10:45:56.498719	\N	2022-12-31 10:45:56.498719	0
858	2023-01-01 15:38:00.214359	\N	2023-01-01 15:38:00.214359	0
836	2023-01-01 15:26:43.044383	\N	2023-01-01 15:26:43.044383	0
837	2023-01-01 15:26:43.045317	\N	2023-01-01 15:26:43.045317	0
859	2023-01-01 15:38:00.215751	\N	2023-01-01 15:38:00.215751	0
833	2023-01-01 15:27:21.070616	\N	2023-01-01 15:26:43.032697	0
839	2023-01-01 15:27:37.945028	\N	2023-01-01 15:27:37.945028	0
783	2022-12-31 10:46:09.543849	\N	2022-12-31 10:45:58.093559	0
784	2022-12-31 10:46:09.555549	\N	2022-12-31 10:46:09.555549	0
860	2023-01-01 15:38:00.216343	\N	2023-01-01 15:38:00.216343	0
706	2022-12-31 10:46:42.782547	\N	2022-12-27 11:30:32.775149	0
786	2022-12-31 10:46:48.725133	\N	2022-12-31 10:46:48.725133	0
787	2022-12-31 10:46:48.727895	\N	2022-12-31 10:46:48.727895	0
856	2023-01-01 15:38:00.216661	\N	2023-01-01 15:38:00.207842	0
841	2023-01-01 15:27:37.950338	\N	2023-01-01 15:27:37.950338	0
842	2023-01-01 15:27:37.951024	\N	2023-01-01 15:27:37.951024	0
785	2022-12-31 10:47:33.592357	\N	2022-12-31 10:46:48.715415	0
790	2022-12-31 10:47:39.41691	\N	2022-12-31 10:47:39.41691	0
838	2023-01-01 15:27:46.933207	\N	2023-01-01 15:27:37.941196	0
844	2023-01-01 15:27:58.75475	\N	2023-01-01 15:27:58.75475	0
879	2023-01-01 15:52:37.59701	\N	2023-01-01 15:52:37.594877	0
792	2022-12-31 10:49:40.489056	\N	2022-12-31 10:49:40.489056	0
793	2022-12-31 10:49:40.489056	\N	2022-12-31 10:49:40.489056	0
794	2022-12-31 10:49:50.5248	\N	2022-12-31 10:49:50.5248	0
796	2022-12-31 10:49:59.934135	\N	2022-12-31 10:49:59.934135	0
797	2022-12-31 10:49:59.934135	\N	2022-12-31 10:49:59.934135	0
799	2022-12-31 10:50:38.09377	\N	2022-12-31 10:50:37.957063	0
801	2022-12-31 10:50:38.102658	\N	2022-12-31 10:50:38.102658	0
802	2022-12-31 10:50:38.105363	\N	2022-12-31 10:50:38.105363	0
862	2023-01-01 15:38:31.720971	\N	2023-01-01 15:38:31.71946	0
846	2023-01-01 15:27:58.760433	\N	2023-01-01 15:27:58.760433	0
808	2022-12-31 10:52:01.87877	\N	2022-12-31 10:52:01.875384	0
847	2023-01-01 15:27:58.761174	\N	2023-01-01 15:27:58.761174	0
798	2022-12-31 10:52:09.979337	\N	2022-12-31 10:50:37.946701	0
843	2023-01-01 15:28:04.871804	\N	2023-01-01 15:27:58.750193	0
809	2022-12-31 10:52:10.001516	\N	2022-12-31 10:52:10.001516	0
810	2022-12-31 10:52:10.004869	\N	2022-12-31 10:52:10.004869	0
795	2022-12-31 10:52:10.004869	\N	2022-12-31 10:49:50.5248	0
805	2022-12-31 10:52:10.011682	\N	2022-12-31 10:50:38.115144	0
803	2022-12-31 10:52:10.012439	\N	2022-12-31 10:50:38.109426	0
804	2022-12-31 10:52:10.012966	\N	2022-12-31 10:50:38.112001	0
791	2023-01-01 15:30:53.978268	\N	2022-12-31 10:48:23.888747	0
807	2022-12-31 10:52:10.015818	\N	2022-12-31 10:52:01.872785	0
811	2022-12-31 10:52:10.019216	\N	2022-12-31 10:52:10.019216	0
812	2022-12-31 10:52:10.020372	\N	2022-12-31 10:52:10.020372	0
813	2022-12-31 10:52:10.025369	\N	2022-12-31 10:52:10.025369	0
848	2023-01-01 15:30:55.309678	\N	2023-01-01 15:30:55.302068	0
806	2022-12-31 10:52:10.037182	\N	2022-12-31 10:51:37.605624	0
814	2022-12-31 10:52:10.042041	\N	2022-12-31 10:52:10.042041	0
815	2022-12-31 10:52:10.048737	\N	2022-12-31 10:52:10.048737	0
800	2022-12-31 10:52:10.060027	\N	2022-12-31 10:50:37.95965	0
816	2023-01-01 15:20:23.708885	\N	2023-01-01 15:18:39.158621	0
817	2023-01-01 15:21:13.882914	\N	2023-01-01 15:20:50.555538	0
818	2023-01-01 15:21:24.408017	\N	2023-01-01 15:21:14.001145	0
819	2023-01-01 15:21:28.977771	\N	2023-01-01 15:21:24.416195	0
820	2023-01-01 15:21:33.850864	\N	2023-01-01 15:21:28.981995	0
821	2023-01-01 15:21:39.696058	\N	2023-01-01 15:21:33.856431	0
822	2023-01-01 15:21:45.606684	\N	2023-01-01 15:21:39.699875	0
823	2023-01-01 15:21:53.158755	\N	2023-01-01 15:21:48.375835	0
824	2023-01-01 15:21:57.858012	\N	2023-01-01 15:21:53.164642	0
825	2023-01-01 15:22:02.546834	\N	2023-01-01 15:21:57.863587	0
826	2023-01-01 15:22:05.812638	\N	2023-01-01 15:22:02.552534	0
827	2023-01-01 15:22:10.94071	\N	2023-01-01 15:22:05.818687	0
829	2023-01-01 15:22:58.922522	\N	2023-01-01 15:22:58.922522	0
863	2023-01-01 15:38:31.723023	\N	2023-01-01 15:38:31.723023	0
864	2023-01-01 15:38:31.723705	\N	2023-01-01 15:38:31.723705	0
831	2023-01-01 15:22:58.990271	\N	2023-01-01 15:22:58.990271	0
832	2023-01-01 15:22:58.993512	\N	2023-01-01 15:22:58.993512	0
865	2023-01-01 15:38:31.724286	\N	2023-01-01 15:38:31.724286	0
861	2023-01-01 15:38:31.724817	\N	2023-01-01 15:38:31.71453	0
880	2023-01-01 15:52:37.600613	\N	2023-01-01 15:52:37.600613	0
788	2023-01-01 15:42:32.751218	\N	2022-12-31 10:47:39.407044	0
789	2023-01-01 15:46:51.655983	\N	2022-12-31 10:47:39.414776	0
867	2023-01-01 15:50:14.532326	\N	2023-01-01 15:50:14.532326	0
881	2023-01-01 15:52:37.601546	\N	2023-01-01 15:52:37.601546	0
878	2023-01-01 15:52:37.6023	\N	2023-01-01 15:52:37.591425	0
850	2023-01-01 15:34:07.489441	\N	2023-01-01 15:34:07.488329	0
869	2023-01-01 15:50:14.603013	\N	2023-01-01 15:50:14.603013	0
851	2023-01-01 15:34:07.49074	\N	2023-01-01 15:34:07.49074	0
852	2023-01-01 15:34:07.491348	\N	2023-01-01 15:34:07.491348	0
853	2023-01-01 15:34:07.494716	\N	2023-01-01 15:34:07.494716	0
849	2023-01-01 15:34:07.496169	\N	2023-01-01 15:34:07.483191	0
854	2023-01-01 15:35:53.851462	\N	2023-01-01 15:35:53.851462	0
857	2023-01-01 15:38:00.212966	\N	2023-01-01 15:38:00.21194	0
883	2023-01-01 15:52:43.159613	\N	2023-01-01 15:52:43.158226	0
866	2023-01-01 15:51:58.813409	\N	2023-01-01 15:50:14.528696	0
895	2023-01-01 15:55:38.872304	\N	2023-01-01 15:55:38.868223	0
871	2023-01-01 15:52:00.377412	\N	2023-01-01 15:52:00.37371	0
884	2023-01-01 15:52:43.161526	\N	2023-01-01 15:52:43.161526	0
872	2023-01-01 15:52:00.380776	\N	2023-01-01 15:52:00.380776	0
873	2023-01-01 15:52:00.382058	\N	2023-01-01 15:52:00.382058	0
870	2023-01-01 15:52:00.382987	\N	2023-01-01 15:52:00.368319	0
897	2023-01-01 15:55:38.876311	\N	2023-01-01 15:55:38.876311	0
875	2023-01-01 15:52:29.582547	\N	2023-01-01 15:52:29.579448	0
898	2023-01-01 15:55:38.877025	\N	2023-01-01 15:55:38.877025	0
876	2023-01-01 15:52:29.585924	\N	2023-01-01 15:52:29.585924	0
877	2023-01-01 15:52:29.586925	\N	2023-01-01 15:52:29.586925	0
874	2023-01-01 15:52:29.587823	\N	2023-01-01 15:52:29.572388	0
885	2023-01-01 15:52:43.1624	\N	2023-01-01 15:52:43.1624	0
882	2023-01-01 15:52:43.163204	\N	2023-01-01 15:52:43.155307	0
886	2023-01-01 15:53:42.391604	\N	2023-01-01 15:53:42.391604	0
888	2023-01-01 15:53:55.444657	\N	2023-01-01 15:53:55.444657	0
889	2023-01-01 15:53:55.444657	\N	2023-01-01 15:53:55.444657	0
890	2023-01-01 15:54:05.704858	\N	2023-01-01 15:54:05.704858	0
891	2023-01-01 15:54:05.704858	\N	2023-01-01 15:54:05.704858	0
892	2023-01-01 15:54:18.637704	\N	2023-01-01 15:54:18.637704	0
893	2023-01-01 15:54:18.637704	\N	2023-01-01 15:54:18.637704	0
902	2023-01-01 15:55:38.884647	\N	2023-01-01 15:55:38.884647	0
903	2023-01-01 15:55:38.885096	\N	2023-01-01 15:55:38.885096	0
894	2023-01-01 15:55:50.31553	\N	2023-01-01 15:55:38.863942	0
908	2023-01-01 15:55:50.326693	\N	2023-01-01 15:55:50.326693	0
909	2023-01-01 15:55:50.331263	\N	2023-01-01 15:55:50.331263	0
887	2023-01-01 15:55:50.331263	\N	2023-01-01 15:53:42.391604	0
901	2023-01-01 15:55:50.337587	\N	2023-01-01 15:55:38.878693	0
899	2023-01-01 15:55:50.338432	\N	2023-01-01 15:55:38.877563	0
900	2023-01-01 15:55:50.339258	\N	2023-01-01 15:55:38.878131	0
910	2023-01-01 15:55:50.340124	\N	2023-01-01 15:55:50.340124	0
911	2023-01-01 15:55:50.345133	\N	2023-01-01 15:55:50.345133	0
855	2023-01-01 15:55:50.345133	\N	2023-01-01 15:35:53.851462	0
906	2023-01-01 15:55:50.349835	\N	2023-01-01 15:55:38.886025	0
904	2023-01-01 15:55:50.350704	\N	2023-01-01 15:55:38.885441	0
905	2023-01-01 15:55:50.351324	\N	2023-01-01 15:55:38.885733	0
912	2023-01-01 15:55:50.356771	\N	2023-01-01 15:55:50.356771	0
913	2023-01-01 15:55:50.363695	\N	2023-01-01 15:55:50.363695	0
907	2023-01-01 15:55:50.368963	\N	2023-01-01 15:55:50.29866	0
914	2023-01-01 15:55:50.371572	\N	2023-01-01 15:55:50.371572	0
915	2023-01-01 15:55:50.376955	\N	2023-01-01 15:55:50.373868	0
896	2023-01-01 15:55:50.381637	\N	2023-01-01 15:55:38.869348	0
\.


--
-- Data for Name: transfer_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transfer_order (id, te_id, identifier, open_date, receival_date, status, comments, cancel_reason, cancel_date, source_branch_id, destination_branch_id, source_responsible_id, destination_responsible_id, invoice_id, cancel_responsible_id, station_id) FROM stdin;
1036b6c1-7f1a-11ed-b540-cdedf83415da	532	1	2007-01-01 00:00:00	2022-12-18 18:22:23.827182	received	\N	\N	\N	0f7506db-7f1a-11ed-b540-cdedf83415da	0f7506e0-7f1a-11ed-b540-cdedf83415da	0f9623a8-7f1a-11ed-b540-cdedf83415da	0f962393-7f1a-11ed-b540-cdedf83415da	1036b6c0-7f1a-11ed-b540-cdedf83415da	\N	0facff84-7f1a-11ed-b540-cdedf83415da
\.


--
-- Data for Name: transfer_order_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transfer_order_item (id, te_id, sellable_id, batch_id, transfer_order_id, quantity, stock_cost, icms_info_id, ipi_info_id, pis_info_id, cofins_info_id) FROM stdin;
1036b6c6-7f1a-11ed-b540-cdedf83415da	537	0fb112ed-7f1a-11ed-b540-cdedf83415da	\N	1036b6c1-7f1a-11ed-b540-cdedf83415da	1.000	70.00000000	1036b6c3-7f1a-11ed-b540-cdedf83415da	1036b6c2-7f1a-11ed-b540-cdedf83415da	1036b6c4-7f1a-11ed-b540-cdedf83415da	1036b6c5-7f1a-11ed-b540-cdedf83415da
1036b6cb-7f1a-11ed-b540-cdedf83415da	542	0fb112f6-7f1a-11ed-b540-cdedf83415da	\N	1036b6c1-7f1a-11ed-b540-cdedf83415da	1.000	139.00000000	1036b6c8-7f1a-11ed-b540-cdedf83415da	1036b6c7-7f1a-11ed-b540-cdedf83415da	1036b6c9-7f1a-11ed-b540-cdedf83415da	1036b6ca-7f1a-11ed-b540-cdedf83415da
1036b6d0-7f1a-11ed-b540-cdedf83415da	547	0fb112fb-7f1a-11ed-b540-cdedf83415da	\N	1036b6c1-7f1a-11ed-b540-cdedf83415da	1.000	56.00000000	1036b6cd-7f1a-11ed-b540-cdedf83415da	1036b6cc-7f1a-11ed-b540-cdedf83415da	1036b6ce-7f1a-11ed-b540-cdedf83415da	1036b6cf-7f1a-11ed-b540-cdedf83415da
1036b6d5-7f1a-11ed-b540-cdedf83415da	552	0fb11300-7f1a-11ed-b540-cdedf83415da	\N	1036b6c1-7f1a-11ed-b540-cdedf83415da	1.000	43.00000000	1036b6d2-7f1a-11ed-b540-cdedf83415da	1036b6d1-7f1a-11ed-b540-cdedf83415da	1036b6d3-7f1a-11ed-b540-cdedf83415da	1036b6d4-7f1a-11ed-b540-cdedf83415da
1036b6da-7f1a-11ed-b540-cdedf83415da	557	0fb11305-7f1a-11ed-b540-cdedf83415da	\N	1036b6c1-7f1a-11ed-b540-cdedf83415da	1.000	101.00000000	1036b6d7-7f1a-11ed-b540-cdedf83415da	1036b6d6-7f1a-11ed-b540-cdedf83415da	1036b6d8-7f1a-11ed-b540-cdedf83415da	1036b6d9-7f1a-11ed-b540-cdedf83415da
1036b6df-7f1a-11ed-b540-cdedf83415da	562	0fb11308-7f1a-11ed-b540-cdedf83415da	\N	1036b6c1-7f1a-11ed-b540-cdedf83415da	1.000	325.00000000	1036b6dc-7f1a-11ed-b540-cdedf83415da	1036b6db-7f1a-11ed-b540-cdedf83415da	1036b6dd-7f1a-11ed-b540-cdedf83415da	1036b6de-7f1a-11ed-b540-cdedf83415da
1036b6e4-7f1a-11ed-b540-cdedf83415da	567	0fb1130d-7f1a-11ed-b540-cdedf83415da	\N	1036b6c1-7f1a-11ed-b540-cdedf83415da	1.000	401.00000000	1036b6e1-7f1a-11ed-b540-cdedf83415da	1036b6e0-7f1a-11ed-b540-cdedf83415da	1036b6e2-7f1a-11ed-b540-cdedf83415da	1036b6e3-7f1a-11ed-b540-cdedf83415da
1036b6e9-7f1a-11ed-b540-cdedf83415da	572	0fb11312-7f1a-11ed-b540-cdedf83415da	\N	1036b6c1-7f1a-11ed-b540-cdedf83415da	1.000	153.00000000	1036b6e6-7f1a-11ed-b540-cdedf83415da	1036b6e5-7f1a-11ed-b540-cdedf83415da	1036b6e7-7f1a-11ed-b540-cdedf83415da	1036b6e8-7f1a-11ed-b540-cdedf83415da
1036b6ee-7f1a-11ed-b540-cdedf83415da	577	0fb11315-7f1a-11ed-b540-cdedf83415da	\N	1036b6c1-7f1a-11ed-b540-cdedf83415da	1.000	99.00000000	1036b6eb-7f1a-11ed-b540-cdedf83415da	1036b6ea-7f1a-11ed-b540-cdedf83415da	1036b6ec-7f1a-11ed-b540-cdedf83415da	1036b6ed-7f1a-11ed-b540-cdedf83415da
1036b6f3-7f1a-11ed-b540-cdedf83415da	582	0fb1131a-7f1a-11ed-b540-cdedf83415da	\N	1036b6c1-7f1a-11ed-b540-cdedf83415da	1.000	199.00000000	1036b6f0-7f1a-11ed-b540-cdedf83415da	1036b6ef-7f1a-11ed-b540-cdedf83415da	1036b6f1-7f1a-11ed-b540-cdedf83415da	1036b6f2-7f1a-11ed-b540-cdedf83415da
\.


--
-- Data for Name: transporter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transporter (id, te_id, is_active, open_contract_date, freight_percentage, person_id) FROM stdin;
0f8e8c7d-7f1a-11ed-b540-cdedf83415da	268	t	2010-06-03 00:00:00	7.00	0f8e8c7a-7f1a-11ed-b540-cdedf83415da
\.


--
-- Data for Name: ui_field; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ui_field (id, te_id, description, field_name, mandatory, visible, ui_form_id) FROM stdin;
0f2ed457-7f1a-11ed-b540-cdedf83415da	22	Name	name	t	t	0f2ed456-7f1a-11ed-b540-cdedf83415da
0f2ed458-7f1a-11ed-b540-cdedf83415da	23	Phone number	phone_number	f	t	0f2ed456-7f1a-11ed-b540-cdedf83415da
0f2ed459-7f1a-11ed-b540-cdedf83415da	24	Mobile number	mobile_number	f	t	0f2ed456-7f1a-11ed-b540-cdedf83415da
0f2ed45a-7f1a-11ed-b540-cdedf83415da	25	Fax	fax	f	t	0f2ed456-7f1a-11ed-b540-cdedf83415da
0f2ed45b-7f1a-11ed-b540-cdedf83415da	26	Email	email	f	t	0f2ed456-7f1a-11ed-b540-cdedf83415da
0f2ed45c-7f1a-11ed-b540-cdedf83415da	27	Street	street	t	t	0f2ed456-7f1a-11ed-b540-cdedf83415da
0f2ed45d-7f1a-11ed-b540-cdedf83415da	28	Street number	street_number	t	t	0f2ed456-7f1a-11ed-b540-cdedf83415da
0f2ed45e-7f1a-11ed-b540-cdedf83415da	29	Postal code	postal_code	f	t	0f2ed456-7f1a-11ed-b540-cdedf83415da
0f2ed45f-7f1a-11ed-b540-cdedf83415da	30	District	district	t	t	0f2ed456-7f1a-11ed-b540-cdedf83415da
0f2ed460-7f1a-11ed-b540-cdedf83415da	31	Complement	complement	f	t	0f2ed456-7f1a-11ed-b540-cdedf83415da
0f2ed461-7f1a-11ed-b540-cdedf83415da	32	City	city	f	t	0f2ed456-7f1a-11ed-b540-cdedf83415da
0f2ed462-7f1a-11ed-b540-cdedf83415da	33	State	state	t	t	0f2ed456-7f1a-11ed-b540-cdedf83415da
0f2ed463-7f1a-11ed-b540-cdedf83415da	34	Country	country	t	t	0f2ed456-7f1a-11ed-b540-cdedf83415da
0f2ed464-7f1a-11ed-b540-cdedf83415da	35	Document	cpf	f	t	0f2ed456-7f1a-11ed-b540-cdedf83415da
0f2ed466-7f1a-11ed-b540-cdedf83415da	37	Name	name	t	t	0f2ed465-7f1a-11ed-b540-cdedf83415da
0f2ed467-7f1a-11ed-b540-cdedf83415da	38	Phone number	phone_number	f	t	0f2ed465-7f1a-11ed-b540-cdedf83415da
0f2ed468-7f1a-11ed-b540-cdedf83415da	39	Mobile number	mobile_number	f	t	0f2ed465-7f1a-11ed-b540-cdedf83415da
0f2ed469-7f1a-11ed-b540-cdedf83415da	40	Fax	fax	f	t	0f2ed465-7f1a-11ed-b540-cdedf83415da
0f2ed46a-7f1a-11ed-b540-cdedf83415da	41	Email	email	f	t	0f2ed465-7f1a-11ed-b540-cdedf83415da
0f2ed46b-7f1a-11ed-b540-cdedf83415da	42	Street	street	t	t	0f2ed465-7f1a-11ed-b540-cdedf83415da
0f2ed46c-7f1a-11ed-b540-cdedf83415da	43	Street number	street_number	t	t	0f2ed465-7f1a-11ed-b540-cdedf83415da
0f2ed46d-7f1a-11ed-b540-cdedf83415da	44	Postal code	postal_code	f	t	0f2ed465-7f1a-11ed-b540-cdedf83415da
0f2ed46e-7f1a-11ed-b540-cdedf83415da	45	District	district	t	t	0f2ed465-7f1a-11ed-b540-cdedf83415da
0f2ed46f-7f1a-11ed-b540-cdedf83415da	46	Complement	complement	f	t	0f2ed465-7f1a-11ed-b540-cdedf83415da
0f2ed470-7f1a-11ed-b540-cdedf83415da	47	City	city	f	t	0f2ed465-7f1a-11ed-b540-cdedf83415da
0f2ed471-7f1a-11ed-b540-cdedf83415da	48	State	state	t	t	0f2ed465-7f1a-11ed-b540-cdedf83415da
0f2ed472-7f1a-11ed-b540-cdedf83415da	49	Country	country	t	t	0f2ed465-7f1a-11ed-b540-cdedf83415da
0f2ed473-7f1a-11ed-b540-cdedf83415da	50	Document	cpf	f	t	0f2ed465-7f1a-11ed-b540-cdedf83415da
0f2ed475-7f1a-11ed-b540-cdedf83415da	52	Name	name	t	t	0f2ed474-7f1a-11ed-b540-cdedf83415da
0f2ed476-7f1a-11ed-b540-cdedf83415da	53	Phone number	phone_number	f	t	0f2ed474-7f1a-11ed-b540-cdedf83415da
0f2ed477-7f1a-11ed-b540-cdedf83415da	54	Mobile number	mobile_number	f	t	0f2ed474-7f1a-11ed-b540-cdedf83415da
0f2ed478-7f1a-11ed-b540-cdedf83415da	55	Fax	fax	f	t	0f2ed474-7f1a-11ed-b540-cdedf83415da
0f2ed479-7f1a-11ed-b540-cdedf83415da	56	Email	email	f	t	0f2ed474-7f1a-11ed-b540-cdedf83415da
0f2ed47a-7f1a-11ed-b540-cdedf83415da	57	Street	street	t	t	0f2ed474-7f1a-11ed-b540-cdedf83415da
0f2ed47b-7f1a-11ed-b540-cdedf83415da	58	Street number	street_number	t	t	0f2ed474-7f1a-11ed-b540-cdedf83415da
0f2ed47c-7f1a-11ed-b540-cdedf83415da	59	Postal code	postal_code	f	t	0f2ed474-7f1a-11ed-b540-cdedf83415da
0f2ed47d-7f1a-11ed-b540-cdedf83415da	60	District	district	t	t	0f2ed474-7f1a-11ed-b540-cdedf83415da
0f2ed47e-7f1a-11ed-b540-cdedf83415da	61	Complement	complement	f	t	0f2ed474-7f1a-11ed-b540-cdedf83415da
0f2ed47f-7f1a-11ed-b540-cdedf83415da	62	City	city	f	t	0f2ed474-7f1a-11ed-b540-cdedf83415da
0f2ed480-7f1a-11ed-b540-cdedf83415da	63	State	state	t	t	0f2ed474-7f1a-11ed-b540-cdedf83415da
0f2ed481-7f1a-11ed-b540-cdedf83415da	64	Country	country	t	t	0f2ed474-7f1a-11ed-b540-cdedf83415da
0f2ed482-7f1a-11ed-b540-cdedf83415da	65	Document	cpf	f	t	0f2ed474-7f1a-11ed-b540-cdedf83415da
0f2ed484-7f1a-11ed-b540-cdedf83415da	67	Name	name	t	t	0f2ed483-7f1a-11ed-b540-cdedf83415da
0f2ed485-7f1a-11ed-b540-cdedf83415da	68	Phone number	phone_number	f	t	0f2ed483-7f1a-11ed-b540-cdedf83415da
0f2ed486-7f1a-11ed-b540-cdedf83415da	69	Mobile number	mobile_number	f	t	0f2ed483-7f1a-11ed-b540-cdedf83415da
0f2ed487-7f1a-11ed-b540-cdedf83415da	70	Fax	fax	f	t	0f2ed483-7f1a-11ed-b540-cdedf83415da
0f2ed488-7f1a-11ed-b540-cdedf83415da	71	Email	email	f	t	0f2ed483-7f1a-11ed-b540-cdedf83415da
0f2ed489-7f1a-11ed-b540-cdedf83415da	72	Street	street	t	t	0f2ed483-7f1a-11ed-b540-cdedf83415da
0f2ed48a-7f1a-11ed-b540-cdedf83415da	73	Street number	street_number	t	t	0f2ed483-7f1a-11ed-b540-cdedf83415da
0f2ed48b-7f1a-11ed-b540-cdedf83415da	74	Postal code	postal_code	f	t	0f2ed483-7f1a-11ed-b540-cdedf83415da
0f2ed48c-7f1a-11ed-b540-cdedf83415da	75	District	district	t	t	0f2ed483-7f1a-11ed-b540-cdedf83415da
0f2ed48d-7f1a-11ed-b540-cdedf83415da	76	Complement	complement	f	t	0f2ed483-7f1a-11ed-b540-cdedf83415da
0f2ed48e-7f1a-11ed-b540-cdedf83415da	77	City	city	f	t	0f2ed483-7f1a-11ed-b540-cdedf83415da
0f2ed48f-7f1a-11ed-b540-cdedf83415da	78	State	state	t	t	0f2ed483-7f1a-11ed-b540-cdedf83415da
0f2ed490-7f1a-11ed-b540-cdedf83415da	79	Country	country	t	t	0f2ed483-7f1a-11ed-b540-cdedf83415da
0f2ed491-7f1a-11ed-b540-cdedf83415da	80	Document	cpf	f	t	0f2ed483-7f1a-11ed-b540-cdedf83415da
0f2ed493-7f1a-11ed-b540-cdedf83415da	82	Name	name	t	t	0f2ed492-7f1a-11ed-b540-cdedf83415da
0f2ed494-7f1a-11ed-b540-cdedf83415da	83	Phone number	phone_number	f	t	0f2ed492-7f1a-11ed-b540-cdedf83415da
0f2ed495-7f1a-11ed-b540-cdedf83415da	84	Mobile number	mobile_number	f	t	0f2ed492-7f1a-11ed-b540-cdedf83415da
0f2ed496-7f1a-11ed-b540-cdedf83415da	85	Fax	fax	f	t	0f2ed492-7f1a-11ed-b540-cdedf83415da
0f2ed497-7f1a-11ed-b540-cdedf83415da	86	Email	email	f	t	0f2ed492-7f1a-11ed-b540-cdedf83415da
0f2ed498-7f1a-11ed-b540-cdedf83415da	87	Street	street	t	t	0f2ed492-7f1a-11ed-b540-cdedf83415da
0f2ed499-7f1a-11ed-b540-cdedf83415da	88	Street number	street_number	t	t	0f2ed492-7f1a-11ed-b540-cdedf83415da
0f2ed49a-7f1a-11ed-b540-cdedf83415da	89	Postal code	postal_code	f	t	0f2ed492-7f1a-11ed-b540-cdedf83415da
0f2ed49b-7f1a-11ed-b540-cdedf83415da	90	District	district	t	t	0f2ed492-7f1a-11ed-b540-cdedf83415da
0f2ed49c-7f1a-11ed-b540-cdedf83415da	91	Complement	complement	f	t	0f2ed492-7f1a-11ed-b540-cdedf83415da
0f2ed49d-7f1a-11ed-b540-cdedf83415da	92	City	city	f	t	0f2ed492-7f1a-11ed-b540-cdedf83415da
0f2ed49e-7f1a-11ed-b540-cdedf83415da	93	State	state	t	t	0f2ed492-7f1a-11ed-b540-cdedf83415da
0f2ed49f-7f1a-11ed-b540-cdedf83415da	94	Country	country	t	t	0f2ed492-7f1a-11ed-b540-cdedf83415da
0f2ed4a0-7f1a-11ed-b540-cdedf83415da	95	Document	cpf	f	t	0f2ed492-7f1a-11ed-b540-cdedf83415da
0f2ed4a2-7f1a-11ed-b540-cdedf83415da	97	Name	name	t	t	0f2ed4a1-7f1a-11ed-b540-cdedf83415da
0f2ed4a3-7f1a-11ed-b540-cdedf83415da	98	Phone number	phone_number	f	t	0f2ed4a1-7f1a-11ed-b540-cdedf83415da
0f2ed4a4-7f1a-11ed-b540-cdedf83415da	99	Mobile number	mobile_number	f	t	0f2ed4a1-7f1a-11ed-b540-cdedf83415da
0f2ed4a5-7f1a-11ed-b540-cdedf83415da	100	Fax	fax	f	t	0f2ed4a1-7f1a-11ed-b540-cdedf83415da
0f2ed4a6-7f1a-11ed-b540-cdedf83415da	101	Email	email	f	t	0f2ed4a1-7f1a-11ed-b540-cdedf83415da
0f2ed4a7-7f1a-11ed-b540-cdedf83415da	102	Street	street	t	t	0f2ed4a1-7f1a-11ed-b540-cdedf83415da
0f2ed4a8-7f1a-11ed-b540-cdedf83415da	103	Street number	street_number	t	t	0f2ed4a1-7f1a-11ed-b540-cdedf83415da
0f2ed4a9-7f1a-11ed-b540-cdedf83415da	104	Postal code	postal_code	f	t	0f2ed4a1-7f1a-11ed-b540-cdedf83415da
0f2ed4aa-7f1a-11ed-b540-cdedf83415da	105	District	district	t	t	0f2ed4a1-7f1a-11ed-b540-cdedf83415da
0f2ed4ab-7f1a-11ed-b540-cdedf83415da	106	Complement	complement	f	t	0f2ed4a1-7f1a-11ed-b540-cdedf83415da
0f2ed4ac-7f1a-11ed-b540-cdedf83415da	107	City	city	f	t	0f2ed4a1-7f1a-11ed-b540-cdedf83415da
0f2ed4ad-7f1a-11ed-b540-cdedf83415da	108	State	state	t	t	0f2ed4a1-7f1a-11ed-b540-cdedf83415da
0f2ed4ae-7f1a-11ed-b540-cdedf83415da	109	Country	country	t	t	0f2ed4a1-7f1a-11ed-b540-cdedf83415da
0f2ed4af-7f1a-11ed-b540-cdedf83415da	110	Document	cpf	f	t	0f2ed4a1-7f1a-11ed-b540-cdedf83415da
0f2ed4b0-7f1a-11ed-b540-cdedf83415da	111	Role	role	t	t	0f2ed474-7f1a-11ed-b540-cdedf83415da
0f2ed4b1-7f1a-11ed-b540-cdedf83415da	112	Salary	salary	t	t	0f2ed474-7f1a-11ed-b540-cdedf83415da
0f2ed4b3-7f1a-11ed-b540-cdedf83415da	114	Code	code	f	t	0f2ed4b2-7f1a-11ed-b540-cdedf83415da
0f2ed4b4-7f1a-11ed-b540-cdedf83415da	115	Barcode	barcode	f	t	0f2ed4b2-7f1a-11ed-b540-cdedf83415da
0f2ed4b5-7f1a-11ed-b540-cdedf83415da	116	Category	category	f	t	0f2ed4b2-7f1a-11ed-b540-cdedf83415da
0f2ed4b6-7f1a-11ed-b540-cdedf83415da	117	Location	location	f	t	0f2ed4b2-7f1a-11ed-b540-cdedf83415da
0f2ed4b7-7f1a-11ed-b540-cdedf83415da	118	Part number	part_number	f	t	0f2ed4b2-7f1a-11ed-b540-cdedf83415da
0f2ed4b8-7f1a-11ed-b540-cdedf83415da	119	Width	width	f	t	0f2ed4b2-7f1a-11ed-b540-cdedf83415da
0f2ed4b9-7f1a-11ed-b540-cdedf83415da	120	Height	height	f	t	0f2ed4b2-7f1a-11ed-b540-cdedf83415da
0f2ed4ba-7f1a-11ed-b540-cdedf83415da	121	Depth	depth	f	t	0f2ed4b2-7f1a-11ed-b540-cdedf83415da
0f2ed4bb-7f1a-11ed-b540-cdedf83415da	122	Weight	weight	f	t	0f2ed4b2-7f1a-11ed-b540-cdedf83415da
0f2ed4bc-7f1a-11ed-b540-cdedf83415da	123	Minimum quantity	minimum_quantity	f	t	0f2ed4b2-7f1a-11ed-b540-cdedf83415da
0f2ed4bd-7f1a-11ed-b540-cdedf83415da	124	Maximum quantity	maximum_quantity	f	t	0f2ed4b2-7f1a-11ed-b540-cdedf83415da
0f2ed4be-7f1a-11ed-b540-cdedf83415da	125	Manufacturer	manufacturer	f	t	0f2ed4b2-7f1a-11ed-b540-cdedf83415da
0f2ed4bf-7f1a-11ed-b540-cdedf83415da	126	Mercosul NCM	ncm	f	t	0f2ed4b2-7f1a-11ed-b540-cdedf83415da
0f2ed4c0-7f1a-11ed-b540-cdedf83415da	127	Mercosul EX Tipi	ex_tipi	f	t	0f2ed4b2-7f1a-11ed-b540-cdedf83415da
0f2ed4c1-7f1a-11ed-b540-cdedf83415da	128	Mercosul Gênero	genero	f	t	0f2ed4b2-7f1a-11ed-b540-cdedf83415da
\.


--
-- Data for Name: ui_form; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ui_form (id, te_id, description, form_name) FROM stdin;
0f2ed456-7f1a-11ed-b540-cdedf83415da	21	User	user
0f2ed465-7f1a-11ed-b540-cdedf83415da	36	Client	client
0f2ed474-7f1a-11ed-b540-cdedf83415da	51	Employee	employee
0f2ed483-7f1a-11ed-b540-cdedf83415da	66	Supplier	supplier
0f2ed492-7f1a-11ed-b540-cdedf83415da	81	Transporter	transporter
0f2ed4a1-7f1a-11ed-b540-cdedf83415da	96	Branch	branch
0f2ed4b2-7f1a-11ed-b540-cdedf83415da	113	Product	product
\.


--
-- Data for Name: user_branch_access; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_branch_access (id, te_id, user_id, branch_id) FROM stdin;
0f7506dc-7f1a-11ed-b540-cdedf83415da	253	0f6aad06-7f1a-11ed-b540-cdedf83415da	0f7506db-7f1a-11ed-b540-cdedf83415da
0f7506e1-7f1a-11ed-b540-cdedf83415da	258	0f6aad06-7f1a-11ed-b540-cdedf83415da	0f7506e0-7f1a-11ed-b540-cdedf83415da
\.


--
-- Data for Name: user_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_profile (id, te_id, name, max_discount) FROM stdin;
0f4c5d14-7f1a-11ed-b540-cdedf83415da	158	Administrator	0.00
0f4c5d24-7f1a-11ed-b540-cdedf83415da	174	Manager	0.00
0f4c5d34-7f1a-11ed-b540-cdedf83415da	190	Salesperson	0.00
\.


--
-- Data for Name: voter_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.voter_data (id, te_id, number, section, zone) FROM stdin;
\.


--
-- Data for Name: work_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.work_order (id, te_id, identifier, status, description, estimated_hours, estimated_cost, estimated_start, estimated_finish, open_date, approve_date, finish_date, is_rejected, defect_reported, defect_detected, quantity, wait_date, in_progress_date, deliver_date, client_informed_date, branch_id, sellable_id, quote_responsible_id, execution_responsible_id, category_id, client_id, sale_id, current_branch_id, execution_branch_id, supplier_order, station_id, check_responsible_id) FROM stdin;
\.


--
-- Data for Name: work_order_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.work_order_category (id, te_id, name, color) FROM stdin;
\.


--
-- Data for Name: work_order_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.work_order_history (id, te_id, date, what, old_value, new_value, notes, user_id, work_order_id) FROM stdin;
\.


--
-- Data for Name: work_order_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.work_order_item (id, te_id, quantity, quantity_decreased, price, sellable_id, batch_id, sale_item_id, order_id, purchase_item_id) FROM stdin;
\.


--
-- Data for Name: work_order_package; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.work_order_package (id, te_id, identifier, status, send_date, receive_date, send_responsible_id, receive_responsible_id, destination_branch_id, source_branch_id) FROM stdin;
\.


--
-- Data for Name: work_order_package_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.work_order_package_item (id, te_id, order_id, package_id) FROM stdin;
\.


--
-- Data for Name: work_permit_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.work_permit_data (id, te_id, number, series_number, pis_number, pis_bank, pis_registry_date) FROM stdin;
\.


--
-- Name: branch_synchronization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.branch_synchronization_id_seq', 1, false);


--
-- Name: city_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.city_location_id_seq', 5565, true);


--
-- Name: event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_id_seq', 30, true);


--
-- Name: inventory_identifier_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_identifier_seq', 1, true);


--
-- Name: loan_identifier_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.loan_identifier_seq', 1, false);


--
-- Name: payment_identifier_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_identifier_seq', 23, true);


--
-- Name: payment_renegotiation_identifier_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_renegotiation_identifier_seq', 1, false);


--
-- Name: production_order_identifier_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.production_order_identifier_seq', 1, false);


--
-- Name: purchase_order_identifier_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchase_order_identifier_seq', 1, true);


--
-- Name: quotation_identifier_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.quotation_identifier_seq', 1, false);


--
-- Name: quote_group_identifier_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.quote_group_identifier_seq', 1, false);


--
-- Name: receiving_invoice_identifier_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.receiving_invoice_identifier_seq', 1, true);


--
-- Name: receiving_order_identifier_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.receiving_order_identifier_seq', 1, true);


--
-- Name: returned_sale_identifier_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.returned_sale_identifier_seq', 1, true);


--
-- Name: sale_identifier_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sale_identifier_seq', 7, true);


--
-- Name: stock_decrease_identifier_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stock_decrease_identifier_seq', 1, false);


--
-- Name: system_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.system_table_id_seq', 22, true);


--
-- Name: till_entry_identifier_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.till_entry_identifier_seq', 8, true);


--
-- Name: till_identifier_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.till_identifier_seq', 5, true);


--
-- Name: transaction_entry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaction_entry_id_seq', 915, true);


--
-- Name: transfer_order_identifier_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transfer_order_identifier_seq', 1, true);


--
-- Name: work_order_identifier_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.work_order_identifier_seq', 1, false);


--
-- Name: access_token access_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.access_token
    ADD CONSTRAINT access_token_pkey PRIMARY KEY (id);


--
-- Name: access_token access_token_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.access_token
    ADD CONSTRAINT access_token_te_id_key UNIQUE (te_id);


--
-- Name: access_token access_token_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.access_token
    ADD CONSTRAINT access_token_token_key UNIQUE (token);


--
-- Name: account account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);


--
-- Name: account account_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_te_id_key UNIQUE (te_id);


--
-- Name: account_transaction account_transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_transaction
    ADD CONSTRAINT account_transaction_pkey PRIMARY KEY (id);


--
-- Name: account_transaction account_transaction_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_transaction
    ADD CONSTRAINT account_transaction_te_id_key UNIQUE (te_id);


--
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- Name: address address_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_te_id_key UNIQUE (te_id);


--
-- Name: attachment attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachment
    ADD CONSTRAINT attachment_pkey PRIMARY KEY (id);


--
-- Name: attachment attachment_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachment
    ADD CONSTRAINT attachment_te_id_key UNIQUE (te_id);


--
-- Name: bank_account bank_account_account_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_account
    ADD CONSTRAINT bank_account_account_id_key UNIQUE (account_id);


--
-- Name: bank_account bank_account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_account
    ADD CONSTRAINT bank_account_pkey PRIMARY KEY (id);


--
-- Name: bank_account bank_account_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_account
    ADD CONSTRAINT bank_account_te_id_key UNIQUE (te_id);


--
-- Name: bill_option bill_option_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_option
    ADD CONSTRAINT bill_option_pkey PRIMARY KEY (id);


--
-- Name: bill_option bill_option_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_option
    ADD CONSTRAINT bill_option_te_id_key UNIQUE (te_id);


--
-- Name: branch branch_acronym_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch
    ADD CONSTRAINT branch_acronym_key UNIQUE (acronym);


--
-- Name: branch branch_person_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch
    ADD CONSTRAINT branch_person_id_key UNIQUE (person_id);


--
-- Name: branch branch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch
    ADD CONSTRAINT branch_pkey PRIMARY KEY (id);


--
-- Name: branch_station branch_station_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch_station
    ADD CONSTRAINT branch_station_name_key UNIQUE (name);


--
-- Name: branch_station branch_station_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch_station
    ADD CONSTRAINT branch_station_pkey PRIMARY KEY (id);


--
-- Name: branch_station branch_station_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch_station
    ADD CONSTRAINT branch_station_te_id_key UNIQUE (te_id);


--
-- Name: branch_synchronization branch_synchronization_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch_synchronization
    ADD CONSTRAINT branch_synchronization_pkey PRIMARY KEY (id);


--
-- Name: branch branch_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch
    ADD CONSTRAINT branch_te_id_key UNIQUE (te_id);


--
-- Name: calls calls_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calls
    ADD CONSTRAINT calls_pkey PRIMARY KEY (id);


--
-- Name: calls calls_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calls
    ADD CONSTRAINT calls_te_id_key UNIQUE (te_id);


--
-- Name: card_operation_cost card_operation_cost_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_operation_cost
    ADD CONSTRAINT card_operation_cost_pkey PRIMARY KEY (id);


--
-- Name: card_operation_cost card_operation_cost_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_operation_cost
    ADD CONSTRAINT card_operation_cost_te_id_key UNIQUE (te_id);


--
-- Name: card_payment_device card_payment_device_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_payment_device
    ADD CONSTRAINT card_payment_device_pkey PRIMARY KEY (id);


--
-- Name: card_payment_device card_payment_device_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_payment_device
    ADD CONSTRAINT card_payment_device_te_id_key UNIQUE (te_id);


--
-- Name: certificate certificate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificate
    ADD CONSTRAINT certificate_pkey PRIMARY KEY (id);


--
-- Name: certificate certificate_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificate
    ADD CONSTRAINT certificate_te_id_key UNIQUE (te_id);


--
-- Name: cfop_data cfop_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cfop_data
    ADD CONSTRAINT cfop_data_pkey PRIMARY KEY (id);


--
-- Name: cfop_data cfop_data_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cfop_data
    ADD CONSTRAINT cfop_data_te_id_key UNIQUE (te_id);


--
-- Name: check_data check_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.check_data
    ADD CONSTRAINT check_data_pkey PRIMARY KEY (id);


--
-- Name: check_data check_data_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.check_data
    ADD CONSTRAINT check_data_te_id_key UNIQUE (te_id);


--
-- Name: city_location city_location_country_state_city_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city_location
    ADD CONSTRAINT city_location_country_state_city_key UNIQUE (country, state, city);


--
-- Name: city_location city_location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city_location
    ADD CONSTRAINT city_location_pkey PRIMARY KEY (id);


--
-- Name: client_category client_category_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_category
    ADD CONSTRAINT client_category_name_key UNIQUE (name);


--
-- Name: client_category client_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_category
    ADD CONSTRAINT client_category_pkey PRIMARY KEY (id);


--
-- Name: client_category_price client_category_price_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_category_price
    ADD CONSTRAINT client_category_price_pkey PRIMARY KEY (id);


--
-- Name: client_category_price client_category_price_sellable_id_category_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_category_price
    ADD CONSTRAINT client_category_price_sellable_id_category_id_key UNIQUE (sellable_id, category_id);


--
-- Name: client_category_price client_category_price_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_category_price
    ADD CONSTRAINT client_category_price_te_id_key UNIQUE (te_id);


--
-- Name: client_category client_category_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_category
    ADD CONSTRAINT client_category_te_id_key UNIQUE (te_id);


--
-- Name: client client_person_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_person_id_key UNIQUE (person_id);


--
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);


--
-- Name: client_salary_history client_salary_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_salary_history
    ADD CONSTRAINT client_salary_history_pkey PRIMARY KEY (id);


--
-- Name: client_salary_history client_salary_history_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_salary_history
    ADD CONSTRAINT client_salary_history_te_id_key UNIQUE (te_id);


--
-- Name: client client_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_te_id_key UNIQUE (te_id);


--
-- Name: commission commission_payment_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commission
    ADD CONSTRAINT commission_payment_id_key UNIQUE (payment_id);


--
-- Name: commission commission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commission
    ADD CONSTRAINT commission_pkey PRIMARY KEY (id);


--
-- Name: commission_source commission_source_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commission_source
    ADD CONSTRAINT commission_source_pkey PRIMARY KEY (id);


--
-- Name: commission_source commission_source_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commission_source
    ADD CONSTRAINT commission_source_te_id_key UNIQUE (te_id);


--
-- Name: commission commission_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commission
    ADD CONSTRAINT commission_te_id_key UNIQUE (te_id);


--
-- Name: company company_person_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_person_id_key UNIQUE (person_id);


--
-- Name: company company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_pkey PRIMARY KEY (id);


--
-- Name: company company_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_te_id_key UNIQUE (te_id);


--
-- Name: contact_info contact_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_info
    ADD CONSTRAINT contact_info_pkey PRIMARY KEY (id);


--
-- Name: contact_info contact_info_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_info
    ADD CONSTRAINT contact_info_te_id_key UNIQUE (te_id);


--
-- Name: context context_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.context
    ADD CONSTRAINT context_name_key UNIQUE (name);


--
-- Name: context context_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.context
    ADD CONSTRAINT context_pkey PRIMARY KEY (id);


--
-- Name: context context_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.context
    ADD CONSTRAINT context_te_id_key UNIQUE (te_id);


--
-- Name: cost_center_entry cost_center_entry_payment_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cost_center_entry
    ADD CONSTRAINT cost_center_entry_payment_id_key UNIQUE (payment_id);


--
-- Name: cost_center_entry cost_center_entry_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cost_center_entry
    ADD CONSTRAINT cost_center_entry_pkey PRIMARY KEY (id);


--
-- Name: cost_center_entry cost_center_entry_stock_transaction_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cost_center_entry
    ADD CONSTRAINT cost_center_entry_stock_transaction_id_key UNIQUE (stock_transaction_id);


--
-- Name: cost_center_entry cost_center_entry_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cost_center_entry
    ADD CONSTRAINT cost_center_entry_te_id_key UNIQUE (te_id);


--
-- Name: cost_center cost_center_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cost_center
    ADD CONSTRAINT cost_center_pkey PRIMARY KEY (id);


--
-- Name: cost_center cost_center_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cost_center
    ADD CONSTRAINT cost_center_te_id_key UNIQUE (te_id);


--
-- Name: credit_card_data credit_card_data_payment_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_card_data
    ADD CONSTRAINT credit_card_data_payment_id_key UNIQUE (payment_id);


--
-- Name: credit_card_data credit_card_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_card_data
    ADD CONSTRAINT credit_card_data_pkey PRIMARY KEY (id);


--
-- Name: credit_card_data credit_card_data_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_card_data
    ADD CONSTRAINT credit_card_data_te_id_key UNIQUE (te_id);


--
-- Name: credit_check_history credit_check_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_check_history
    ADD CONSTRAINT credit_check_history_pkey PRIMARY KEY (id);


--
-- Name: credit_check_history credit_check_history_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_check_history
    ADD CONSTRAINT credit_check_history_te_id_key UNIQUE (te_id);


--
-- Name: credit_provider credit_provider_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_provider
    ADD CONSTRAINT credit_provider_pkey PRIMARY KEY (id);


--
-- Name: credit_provider credit_provider_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_provider
    ADD CONSTRAINT credit_provider_te_id_key UNIQUE (te_id);


--
-- Name: delivery delivery_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT delivery_pkey PRIMARY KEY (id);


--
-- Name: delivery delivery_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT delivery_te_id_key UNIQUE (te_id);


--
-- Name: device_constant device_constant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_constant
    ADD CONSTRAINT device_constant_pkey PRIMARY KEY (id);


--
-- Name: device_constant device_constant_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_constant
    ADD CONSTRAINT device_constant_te_id_key UNIQUE (te_id);


--
-- Name: device_settings device_settings_device_name_station_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_settings
    ADD CONSTRAINT device_settings_device_name_station_id_key UNIQUE (device_name, station_id);


--
-- Name: device_settings device_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_settings
    ADD CONSTRAINT device_settings_pkey PRIMARY KEY (id);


--
-- Name: device_settings device_settings_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_settings
    ADD CONSTRAINT device_settings_te_id_key UNIQUE (te_id);


--
-- Name: employee employee_person_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_person_id_key UNIQUE (person_id);


--
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- Name: employee_role_history employee_role_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_role_history
    ADD CONSTRAINT employee_role_history_pkey PRIMARY KEY (id);


--
-- Name: employee_role_history employee_role_history_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_role_history
    ADD CONSTRAINT employee_role_history_te_id_key UNIQUE (te_id);


--
-- Name: employee_role employee_role_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_role
    ADD CONSTRAINT employee_role_name_key UNIQUE (name);


--
-- Name: employee_role employee_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_role
    ADD CONSTRAINT employee_role_pkey PRIMARY KEY (id);


--
-- Name: employee_role employee_role_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_role
    ADD CONSTRAINT employee_role_te_id_key UNIQUE (te_id);


--
-- Name: employee employee_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_te_id_key UNIQUE (te_id);


--
-- Name: event event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_pkey PRIMARY KEY (id);


--
-- Name: fiscal_book_entry fiscal_book_entry_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fiscal_book_entry
    ADD CONSTRAINT fiscal_book_entry_pkey PRIMARY KEY (id);


--
-- Name: fiscal_book_entry fiscal_book_entry_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fiscal_book_entry
    ADD CONSTRAINT fiscal_book_entry_te_id_key UNIQUE (te_id);


--
-- Name: fiscal_day_history fiscal_day_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fiscal_day_history
    ADD CONSTRAINT fiscal_day_history_pkey PRIMARY KEY (id);


--
-- Name: fiscal_day_history fiscal_day_history_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fiscal_day_history
    ADD CONSTRAINT fiscal_day_history_te_id_key UNIQUE (te_id);


--
-- Name: fiscal_day_tax fiscal_day_tax_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fiscal_day_tax
    ADD CONSTRAINT fiscal_day_tax_pkey PRIMARY KEY (id);


--
-- Name: fiscal_day_tax fiscal_day_tax_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fiscal_day_tax
    ADD CONSTRAINT fiscal_day_tax_te_id_key UNIQUE (te_id);


--
-- Name: fiscal_sale_history fiscal_sale_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fiscal_sale_history
    ADD CONSTRAINT fiscal_sale_history_pkey PRIMARY KEY (id);


--
-- Name: fiscal_sale_history fiscal_sale_history_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fiscal_sale_history
    ADD CONSTRAINT fiscal_sale_history_te_id_key UNIQUE (te_id);


--
-- Name: grid_attribute grid_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grid_attribute
    ADD CONSTRAINT grid_attribute_pkey PRIMARY KEY (id);


--
-- Name: grid_attribute grid_attribute_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grid_attribute
    ADD CONSTRAINT grid_attribute_te_id_key UNIQUE (te_id);


--
-- Name: grid_group grid_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grid_group
    ADD CONSTRAINT grid_group_pkey PRIMARY KEY (id);


--
-- Name: grid_group grid_group_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grid_group
    ADD CONSTRAINT grid_group_te_id_key UNIQUE (te_id);


--
-- Name: grid_option grid_option_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grid_option
    ADD CONSTRAINT grid_option_pkey PRIMARY KEY (id);


--
-- Name: grid_option grid_option_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grid_option
    ADD CONSTRAINT grid_option_te_id_key UNIQUE (te_id);


--
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- Name: image image_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_te_id_key UNIQUE (te_id);


--
-- Name: individual individual_person_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individual
    ADD CONSTRAINT individual_person_id_key UNIQUE (person_id);


--
-- Name: individual individual_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individual
    ADD CONSTRAINT individual_pkey PRIMARY KEY (id);


--
-- Name: individual individual_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individual
    ADD CONSTRAINT individual_te_id_key UNIQUE (te_id);


--
-- Name: installed_plugin installed_plugin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.installed_plugin
    ADD CONSTRAINT installed_plugin_pkey PRIMARY KEY (id);


--
-- Name: installed_plugin installed_plugin_plugin_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.installed_plugin
    ADD CONSTRAINT installed_plugin_plugin_name_key UNIQUE (plugin_name);


--
-- Name: installed_plugin installed_plugin_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.installed_plugin
    ADD CONSTRAINT installed_plugin_te_id_key UNIQUE (te_id);


--
-- Name: inventory inventory_identifier_branch_id_station_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_identifier_branch_id_station_id_key UNIQUE (identifier, branch_id, station_id);


--
-- Name: inventory_item inventory_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_item
    ADD CONSTRAINT inventory_item_pkey PRIMARY KEY (id);


--
-- Name: inventory_item inventory_item_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_item
    ADD CONSTRAINT inventory_item_te_id_key UNIQUE (te_id);


--
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (id);


--
-- Name: inventory inventory_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_te_id_key UNIQUE (te_id);


--
-- Name: invoice invoice_branch_id_invoice_number_mode_series_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_branch_id_invoice_number_mode_series_key UNIQUE (branch_id, invoice_number, mode, series);


--
-- Name: invoice_field invoice_field_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_field
    ADD CONSTRAINT invoice_field_pkey PRIMARY KEY (id);


--
-- Name: invoice_field invoice_field_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_field
    ADD CONSTRAINT invoice_field_te_id_key UNIQUE (te_id);


--
-- Name: invoice_item_cofins invoice_item_cofins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_item_cofins
    ADD CONSTRAINT invoice_item_cofins_pkey PRIMARY KEY (id);


--
-- Name: invoice_item_cofins invoice_item_cofins_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_item_cofins
    ADD CONSTRAINT invoice_item_cofins_te_id_key UNIQUE (te_id);


--
-- Name: invoice_item_icms invoice_item_icms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_item_icms
    ADD CONSTRAINT invoice_item_icms_pkey PRIMARY KEY (id);


--
-- Name: invoice_item_icms invoice_item_icms_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_item_icms
    ADD CONSTRAINT invoice_item_icms_te_id_key UNIQUE (te_id);


--
-- Name: invoice_item_ipi invoice_item_ipi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_item_ipi
    ADD CONSTRAINT invoice_item_ipi_pkey PRIMARY KEY (id);


--
-- Name: invoice_item_ipi invoice_item_ipi_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_item_ipi
    ADD CONSTRAINT invoice_item_ipi_te_id_key UNIQUE (te_id);


--
-- Name: invoice_item_pis invoice_item_pis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_item_pis
    ADD CONSTRAINT invoice_item_pis_pkey PRIMARY KEY (id);


--
-- Name: invoice_item_pis invoice_item_pis_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_item_pis
    ADD CONSTRAINT invoice_item_pis_te_id_key UNIQUE (te_id);


--
-- Name: invoice_layout invoice_layout_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_layout
    ADD CONSTRAINT invoice_layout_pkey PRIMARY KEY (id);


--
-- Name: invoice_layout invoice_layout_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_layout
    ADD CONSTRAINT invoice_layout_te_id_key UNIQUE (te_id);


--
-- Name: invoice invoice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_pkey PRIMARY KEY (id);


--
-- Name: invoice_printer invoice_printer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_printer
    ADD CONSTRAINT invoice_printer_pkey PRIMARY KEY (id);


--
-- Name: invoice_printer invoice_printer_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_printer
    ADD CONSTRAINT invoice_printer_te_id_key UNIQUE (te_id);


--
-- Name: invoice invoice_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_te_id_key UNIQUE (te_id);


--
-- Name: loan loan_identifier_branch_id_station_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan
    ADD CONSTRAINT loan_identifier_branch_id_station_id_key UNIQUE (identifier, branch_id, station_id);


--
-- Name: loan_item loan_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan_item
    ADD CONSTRAINT loan_item_pkey PRIMARY KEY (id);


--
-- Name: loan_item loan_item_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan_item
    ADD CONSTRAINT loan_item_te_id_key UNIQUE (te_id);


--
-- Name: loan loan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan
    ADD CONSTRAINT loan_pkey PRIMARY KEY (id);


--
-- Name: loan loan_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan
    ADD CONSTRAINT loan_te_id_key UNIQUE (te_id);


--
-- Name: login_user login_user_person_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_user
    ADD CONSTRAINT login_user_person_id_key UNIQUE (person_id);


--
-- Name: login_user login_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_user
    ADD CONSTRAINT login_user_pkey PRIMARY KEY (id);


--
-- Name: login_user login_user_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_user
    ADD CONSTRAINT login_user_te_id_key UNIQUE (te_id);


--
-- Name: login_user login_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_user
    ADD CONSTRAINT login_user_username_key UNIQUE (username);


--
-- Name: message message_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_pkey PRIMARY KEY (id);


--
-- Name: message message_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_te_id_key UNIQUE (te_id);


--
-- Name: military_data military_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.military_data
    ADD CONSTRAINT military_data_pkey PRIMARY KEY (id);


--
-- Name: military_data military_data_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.military_data
    ADD CONSTRAINT military_data_te_id_key UNIQUE (te_id);


--
-- Name: parameter_data parameter_data_field_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parameter_data
    ADD CONSTRAINT parameter_data_field_name_key UNIQUE (field_name);


--
-- Name: parameter_data parameter_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parameter_data
    ADD CONSTRAINT parameter_data_pkey PRIMARY KEY (id);


--
-- Name: parameter_data parameter_data_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parameter_data
    ADD CONSTRAINT parameter_data_te_id_key UNIQUE (te_id);


--
-- Name: payment payment_attachment_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_attachment_id_key UNIQUE (attachment_id);


--
-- Name: payment_category payment_category_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_category
    ADD CONSTRAINT payment_category_name_key UNIQUE (name);


--
-- Name: payment_category payment_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_category
    ADD CONSTRAINT payment_category_pkey PRIMARY KEY (id);


--
-- Name: payment_category payment_category_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_category
    ADD CONSTRAINT payment_category_te_id_key UNIQUE (te_id);


--
-- Name: payment_change_history payment_change_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_change_history
    ADD CONSTRAINT payment_change_history_pkey PRIMARY KEY (id);


--
-- Name: payment_change_history payment_change_history_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_change_history
    ADD CONSTRAINT payment_change_history_te_id_key UNIQUE (te_id);


--
-- Name: payment_comment payment_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_comment
    ADD CONSTRAINT payment_comment_pkey PRIMARY KEY (id);


--
-- Name: payment_comment payment_comment_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_comment
    ADD CONSTRAINT payment_comment_te_id_key UNIQUE (te_id);


--
-- Name: payment_flow_history payment_flow_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_flow_history
    ADD CONSTRAINT payment_flow_history_pkey PRIMARY KEY (id);


--
-- Name: payment_flow_history payment_flow_history_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_flow_history
    ADD CONSTRAINT payment_flow_history_te_id_key UNIQUE (te_id);


--
-- Name: payment_group payment_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_group
    ADD CONSTRAINT payment_group_pkey PRIMARY KEY (id);


--
-- Name: payment_group payment_group_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_group
    ADD CONSTRAINT payment_group_te_id_key UNIQUE (te_id);


--
-- Name: payment payment_identifier_branch_id_station_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_identifier_branch_id_station_id_key UNIQUE (identifier, branch_id, station_id);


--
-- Name: payment_method payment_method_method_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_method
    ADD CONSTRAINT payment_method_method_name_key UNIQUE (method_name);


--
-- Name: payment_method payment_method_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_method
    ADD CONSTRAINT payment_method_pkey PRIMARY KEY (id);


--
-- Name: payment_method payment_method_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_method
    ADD CONSTRAINT payment_method_te_id_key UNIQUE (te_id);


--
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id);


--
-- Name: payment_renegotiation payment_renegotiation_identifier_branch_id_station_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_renegotiation
    ADD CONSTRAINT payment_renegotiation_identifier_branch_id_station_id_key UNIQUE (identifier, branch_id, station_id);


--
-- Name: payment_renegotiation payment_renegotiation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_renegotiation
    ADD CONSTRAINT payment_renegotiation_pkey PRIMARY KEY (id);


--
-- Name: payment_renegotiation payment_renegotiation_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_renegotiation
    ADD CONSTRAINT payment_renegotiation_te_id_key UNIQUE (te_id);


--
-- Name: payment payment_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_te_id_key UNIQUE (te_id);


--
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- Name: person person_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_te_id_key UNIQUE (te_id);


--
-- Name: plugin_egg plugin_egg_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plugin_egg
    ADD CONSTRAINT plugin_egg_pkey PRIMARY KEY (id);


--
-- Name: plugin_egg plugin_egg_plugin_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plugin_egg
    ADD CONSTRAINT plugin_egg_plugin_name_key UNIQUE (plugin_name);


--
-- Name: plugin_egg plugin_egg_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plugin_egg
    ADD CONSTRAINT plugin_egg_te_id_key UNIQUE (te_id);


--
-- Name: product_attribute product_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_attribute
    ADD CONSTRAINT product_attribute_pkey PRIMARY KEY (id);


--
-- Name: product_attribute product_attribute_product_id_attribute_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_attribute
    ADD CONSTRAINT product_attribute_product_id_attribute_id_key UNIQUE (product_id, attribute_id);


--
-- Name: product_attribute product_attribute_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_attribute
    ADD CONSTRAINT product_attribute_te_id_key UNIQUE (te_id);


--
-- Name: product_branch_override product_branch_override_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_branch_override
    ADD CONSTRAINT product_branch_override_pkey PRIMARY KEY (id);


--
-- Name: product_branch_override product_branch_override_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_branch_override
    ADD CONSTRAINT product_branch_override_te_id_key UNIQUE (te_id);


--
-- Name: product_cofins_template product_cofins_template_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cofins_template
    ADD CONSTRAINT product_cofins_template_pkey PRIMARY KEY (id);


--
-- Name: product_cofins_template product_cofins_template_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cofins_template
    ADD CONSTRAINT product_cofins_template_te_id_key UNIQUE (te_id);


--
-- Name: product_component product_component_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_component
    ADD CONSTRAINT product_component_pkey PRIMARY KEY (id);


--
-- Name: product_component product_component_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_component
    ADD CONSTRAINT product_component_te_id_key UNIQUE (te_id);


--
-- Name: product_history product_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_history
    ADD CONSTRAINT product_history_pkey PRIMARY KEY (id);


--
-- Name: product_history product_history_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_history
    ADD CONSTRAINT product_history_te_id_key UNIQUE (te_id);


--
-- Name: product_icms_template product_icms_template_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_icms_template
    ADD CONSTRAINT product_icms_template_pkey PRIMARY KEY (id);


--
-- Name: product_icms_template product_icms_template_product_tax_template_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_icms_template
    ADD CONSTRAINT product_icms_template_product_tax_template_id_key UNIQUE (product_tax_template_id);


--
-- Name: product_icms_template product_icms_template_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_icms_template
    ADD CONSTRAINT product_icms_template_te_id_key UNIQUE (te_id);


--
-- Name: product_ipi_template product_ipi_template_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_ipi_template
    ADD CONSTRAINT product_ipi_template_pkey PRIMARY KEY (id);


--
-- Name: product_ipi_template product_ipi_template_product_tax_template_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_ipi_template
    ADD CONSTRAINT product_ipi_template_product_tax_template_id_key UNIQUE (product_tax_template_id);


--
-- Name: product_ipi_template product_ipi_template_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_ipi_template
    ADD CONSTRAINT product_ipi_template_te_id_key UNIQUE (te_id);


--
-- Name: product_manufacturer product_manufacturer_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_manufacturer
    ADD CONSTRAINT product_manufacturer_code_key UNIQUE (code);


--
-- Name: product_manufacturer product_manufacturer_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_manufacturer
    ADD CONSTRAINT product_manufacturer_name_key UNIQUE (name);


--
-- Name: product_manufacturer product_manufacturer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_manufacturer
    ADD CONSTRAINT product_manufacturer_pkey PRIMARY KEY (id);


--
-- Name: product_manufacturer product_manufacturer_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_manufacturer
    ADD CONSTRAINT product_manufacturer_te_id_key UNIQUE (te_id);


--
-- Name: product_option_map product_option_map_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option_map
    ADD CONSTRAINT product_option_map_pkey PRIMARY KEY (id);


--
-- Name: product_option_map product_option_map_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option_map
    ADD CONSTRAINT product_option_map_te_id_key UNIQUE (te_id);


--
-- Name: product_pis_template product_pis_template_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_pis_template
    ADD CONSTRAINT product_pis_template_pkey PRIMARY KEY (id);


--
-- Name: product_pis_template product_pis_template_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_pis_template
    ADD CONSTRAINT product_pis_template_te_id_key UNIQUE (te_id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: product_quality_test product_quality_test_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_quality_test
    ADD CONSTRAINT product_quality_test_pkey PRIMARY KEY (id);


--
-- Name: product_quality_test product_quality_test_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_quality_test
    ADD CONSTRAINT product_quality_test_te_id_key UNIQUE (te_id);


--
-- Name: product_stock_item product_stock_item_branch_id_storable_id_batch_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_stock_item
    ADD CONSTRAINT product_stock_item_branch_id_storable_id_batch_id_key UNIQUE (branch_id, storable_id, batch_id);


--
-- Name: product_stock_item product_stock_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_stock_item
    ADD CONSTRAINT product_stock_item_pkey PRIMARY KEY (id);


--
-- Name: product_stock_item product_stock_item_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_stock_item
    ADD CONSTRAINT product_stock_item_te_id_key UNIQUE (te_id);


--
-- Name: product_supplier_info product_supplier_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_supplier_info
    ADD CONSTRAINT product_supplier_info_pkey PRIMARY KEY (id);


--
-- Name: product_supplier_info product_supplier_info_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_supplier_info
    ADD CONSTRAINT product_supplier_info_te_id_key UNIQUE (te_id);


--
-- Name: product_tax_template product_tax_template_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_tax_template
    ADD CONSTRAINT product_tax_template_pkey PRIMARY KEY (id);


--
-- Name: product_tax_template product_tax_template_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_tax_template
    ADD CONSTRAINT product_tax_template_te_id_key UNIQUE (te_id);


--
-- Name: product product_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_te_id_key UNIQUE (te_id);


--
-- Name: production_item production_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_item
    ADD CONSTRAINT production_item_pkey PRIMARY KEY (id);


--
-- Name: production_item_quality_result production_item_quality_result_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_item_quality_result
    ADD CONSTRAINT production_item_quality_result_pkey PRIMARY KEY (id);


--
-- Name: production_item_quality_result production_item_quality_result_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_item_quality_result
    ADD CONSTRAINT production_item_quality_result_te_id_key UNIQUE (te_id);


--
-- Name: production_item production_item_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_item
    ADD CONSTRAINT production_item_te_id_key UNIQUE (te_id);


--
-- Name: production_material production_material_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_material
    ADD CONSTRAINT production_material_pkey PRIMARY KEY (id);


--
-- Name: production_material production_material_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_material
    ADD CONSTRAINT production_material_te_id_key UNIQUE (te_id);


--
-- Name: production_order production_order_identifier_branch_id_station_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_order
    ADD CONSTRAINT production_order_identifier_branch_id_station_id_key UNIQUE (identifier, branch_id, station_id);


--
-- Name: production_order production_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_order
    ADD CONSTRAINT production_order_pkey PRIMARY KEY (id);


--
-- Name: production_order production_order_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_order
    ADD CONSTRAINT production_order_te_id_key UNIQUE (te_id);


--
-- Name: production_produced_item production_produced_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_produced_item
    ADD CONSTRAINT production_produced_item_pkey PRIMARY KEY (id);


--
-- Name: production_produced_item production_produced_item_product_id_serial_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_produced_item
    ADD CONSTRAINT production_produced_item_product_id_serial_number_key UNIQUE (product_id, serial_number);


--
-- Name: production_produced_item production_produced_item_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_produced_item
    ADD CONSTRAINT production_produced_item_te_id_key UNIQUE (te_id);


--
-- Name: production_service production_service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_service
    ADD CONSTRAINT production_service_pkey PRIMARY KEY (id);


--
-- Name: production_service production_service_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_service
    ADD CONSTRAINT production_service_te_id_key UNIQUE (te_id);


--
-- Name: profile_settings profile_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_settings
    ADD CONSTRAINT profile_settings_pkey PRIMARY KEY (id);


--
-- Name: profile_settings profile_settings_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_settings
    ADD CONSTRAINT profile_settings_te_id_key UNIQUE (te_id);


--
-- Name: purchase_item purchase_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_item
    ADD CONSTRAINT purchase_item_pkey PRIMARY KEY (id);


--
-- Name: purchase_item purchase_item_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_item
    ADD CONSTRAINT purchase_item_te_id_key UNIQUE (te_id);


--
-- Name: purchase_order purchase_order_identifier_branch_id_station_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_order
    ADD CONSTRAINT purchase_order_identifier_branch_id_station_id_key UNIQUE (identifier, branch_id, station_id);


--
-- Name: purchase_order purchase_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_order
    ADD CONSTRAINT purchase_order_pkey PRIMARY KEY (id);


--
-- Name: purchase_order purchase_order_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_order
    ADD CONSTRAINT purchase_order_te_id_key UNIQUE (te_id);


--
-- Name: purchase_receiving_map purchase_receiving_map_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_receiving_map
    ADD CONSTRAINT purchase_receiving_map_pkey PRIMARY KEY (id);


--
-- Name: purchase_receiving_map purchase_receiving_map_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_receiving_map
    ADD CONSTRAINT purchase_receiving_map_te_id_key UNIQUE (te_id);


--
-- Name: quotation quotation_identifier_branch_id_station_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quotation
    ADD CONSTRAINT quotation_identifier_branch_id_station_id_key UNIQUE (identifier, branch_id, station_id);


--
-- Name: quotation quotation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quotation
    ADD CONSTRAINT quotation_pkey PRIMARY KEY (id);


--
-- Name: quotation quotation_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quotation
    ADD CONSTRAINT quotation_te_id_key UNIQUE (te_id);


--
-- Name: quote_group quote_group_identifier_branch_id_station_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quote_group
    ADD CONSTRAINT quote_group_identifier_branch_id_station_id_key UNIQUE (identifier, branch_id, station_id);


--
-- Name: quote_group quote_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quote_group
    ADD CONSTRAINT quote_group_pkey PRIMARY KEY (id);


--
-- Name: quote_group quote_group_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quote_group
    ADD CONSTRAINT quote_group_te_id_key UNIQUE (te_id);


--
-- Name: receiving_invoice receiving_invoice_identifier_branch_id_station_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receiving_invoice
    ADD CONSTRAINT receiving_invoice_identifier_branch_id_station_id_key UNIQUE (identifier, branch_id, station_id);


--
-- Name: receiving_invoice receiving_invoice_invoice_number_invoice_series_supplier_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receiving_invoice
    ADD CONSTRAINT receiving_invoice_invoice_number_invoice_series_supplier_id_key UNIQUE (invoice_number, invoice_series, supplier_id);


--
-- Name: receiving_invoice receiving_invoice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receiving_invoice
    ADD CONSTRAINT receiving_invoice_pkey PRIMARY KEY (id);


--
-- Name: receiving_invoice receiving_invoice_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receiving_invoice
    ADD CONSTRAINT receiving_invoice_te_id_key UNIQUE (te_id);


--
-- Name: receiving_order receiving_order_identifier_branch_id_station_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receiving_order
    ADD CONSTRAINT receiving_order_identifier_branch_id_station_id_key UNIQUE (identifier, branch_id, station_id);


--
-- Name: receiving_order_item receiving_order_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receiving_order_item
    ADD CONSTRAINT receiving_order_item_pkey PRIMARY KEY (id);


--
-- Name: receiving_order_item receiving_order_item_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receiving_order_item
    ADD CONSTRAINT receiving_order_item_te_id_key UNIQUE (te_id);


--
-- Name: receiving_order receiving_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receiving_order
    ADD CONSTRAINT receiving_order_pkey PRIMARY KEY (id);


--
-- Name: receiving_order receiving_order_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receiving_order
    ADD CONSTRAINT receiving_order_te_id_key UNIQUE (te_id);


--
-- Name: returned_sale returned_sale_identifier_branch_id_station_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returned_sale
    ADD CONSTRAINT returned_sale_identifier_branch_id_station_id_key UNIQUE (identifier, branch_id, station_id);


--
-- Name: returned_sale_item returned_sale_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returned_sale_item
    ADD CONSTRAINT returned_sale_item_pkey PRIMARY KEY (id);


--
-- Name: returned_sale_item returned_sale_item_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returned_sale_item
    ADD CONSTRAINT returned_sale_item_te_id_key UNIQUE (te_id);


--
-- Name: returned_sale returned_sale_new_sale_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returned_sale
    ADD CONSTRAINT returned_sale_new_sale_id_key UNIQUE (new_sale_id);


--
-- Name: returned_sale returned_sale_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returned_sale
    ADD CONSTRAINT returned_sale_pkey PRIMARY KEY (id);


--
-- Name: returned_sale returned_sale_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returned_sale
    ADD CONSTRAINT returned_sale_te_id_key UNIQUE (te_id);


--
-- Name: sale_comment sale_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_comment
    ADD CONSTRAINT sale_comment_pkey PRIMARY KEY (id);


--
-- Name: sale_comment sale_comment_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_comment
    ADD CONSTRAINT sale_comment_te_id_key UNIQUE (te_id);


--
-- Name: sale_context sale_context_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_context
    ADD CONSTRAINT sale_context_pkey PRIMARY KEY (id);


--
-- Name: sale_context sale_context_sale_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_context
    ADD CONSTRAINT sale_context_sale_id_key UNIQUE (sale_id);


--
-- Name: sale_context sale_context_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_context
    ADD CONSTRAINT sale_context_te_id_key UNIQUE (te_id);


--
-- Name: sale sale_identifier_branch_id_station_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_identifier_branch_id_station_id_key UNIQUE (identifier, branch_id, station_id);


--
-- Name: sale_item sale_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_item
    ADD CONSTRAINT sale_item_pkey PRIMARY KEY (id);


--
-- Name: sale_item sale_item_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_item
    ADD CONSTRAINT sale_item_te_id_key UNIQUE (te_id);


--
-- Name: sale sale_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_pkey PRIMARY KEY (id);


--
-- Name: sale sale_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_te_id_key UNIQUE (te_id);


--
-- Name: sale_token sale_token_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_token
    ADD CONSTRAINT sale_token_code_key UNIQUE (code);


--
-- Name: sale_token sale_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_token
    ADD CONSTRAINT sale_token_pkey PRIMARY KEY (id);


--
-- Name: sale_token sale_token_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_token
    ADD CONSTRAINT sale_token_te_id_key UNIQUE (te_id);


--
-- Name: sales_person sales_person_person_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_person
    ADD CONSTRAINT sales_person_person_id_key UNIQUE (person_id);


--
-- Name: sales_person sales_person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_person
    ADD CONSTRAINT sales_person_pkey PRIMARY KEY (id);


--
-- Name: sales_person sales_person_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_person
    ADD CONSTRAINT sales_person_te_id_key UNIQUE (te_id);


--
-- Name: sellable_branch_override sellable_branch_override_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellable_branch_override
    ADD CONSTRAINT sellable_branch_override_pkey PRIMARY KEY (id);


--
-- Name: sellable_branch_override sellable_branch_override_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellable_branch_override
    ADD CONSTRAINT sellable_branch_override_te_id_key UNIQUE (te_id);


--
-- Name: sellable_category sellable_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellable_category
    ADD CONSTRAINT sellable_category_pkey PRIMARY KEY (id);


--
-- Name: sellable_category sellable_category_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellable_category
    ADD CONSTRAINT sellable_category_te_id_key UNIQUE (te_id);


--
-- Name: sellable sellable_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellable
    ADD CONSTRAINT sellable_pkey PRIMARY KEY (id);


--
-- Name: sellable_tax_constant sellable_tax_constant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellable_tax_constant
    ADD CONSTRAINT sellable_tax_constant_pkey PRIMARY KEY (id);


--
-- Name: sellable_tax_constant sellable_tax_constant_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellable_tax_constant
    ADD CONSTRAINT sellable_tax_constant_te_id_key UNIQUE (te_id);


--
-- Name: sellable sellable_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellable
    ADD CONSTRAINT sellable_te_id_key UNIQUE (te_id);


--
-- Name: sellable_unit sellable_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellable_unit
    ADD CONSTRAINT sellable_unit_pkey PRIMARY KEY (id);


--
-- Name: sellable_unit sellable_unit_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellable_unit
    ADD CONSTRAINT sellable_unit_te_id_key UNIQUE (te_id);


--
-- Name: service_branch_override service_branch_override_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_branch_override
    ADD CONSTRAINT service_branch_override_pkey PRIMARY KEY (id);


--
-- Name: service_branch_override service_branch_override_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_branch_override
    ADD CONSTRAINT service_branch_override_te_id_key UNIQUE (te_id);


--
-- Name: service service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_pkey PRIMARY KEY (id);


--
-- Name: service service_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_te_id_key UNIQUE (te_id);


--
-- Name: station_type station_type_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station_type
    ADD CONSTRAINT station_type_name_key UNIQUE (name);


--
-- Name: station_type station_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station_type
    ADD CONSTRAINT station_type_pkey PRIMARY KEY (id);


--
-- Name: station_type station_type_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station_type
    ADD CONSTRAINT station_type_te_id_key UNIQUE (te_id);


--
-- Name: stock_decrease stock_decrease_identifier_branch_id_station_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_decrease
    ADD CONSTRAINT stock_decrease_identifier_branch_id_station_id_key UNIQUE (identifier, branch_id, station_id);


--
-- Name: stock_decrease_item stock_decrease_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_decrease_item
    ADD CONSTRAINT stock_decrease_item_pkey PRIMARY KEY (id);


--
-- Name: stock_decrease_item stock_decrease_item_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_decrease_item
    ADD CONSTRAINT stock_decrease_item_te_id_key UNIQUE (te_id);


--
-- Name: stock_decrease stock_decrease_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_decrease
    ADD CONSTRAINT stock_decrease_pkey PRIMARY KEY (id);


--
-- Name: stock_decrease stock_decrease_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_decrease
    ADD CONSTRAINT stock_decrease_te_id_key UNIQUE (te_id);


--
-- Name: stock_transaction_history stock_transaction_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_transaction_history
    ADD CONSTRAINT stock_transaction_history_pkey PRIMARY KEY (id);


--
-- Name: stock_transaction_history stock_transaction_history_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_transaction_history
    ADD CONSTRAINT stock_transaction_history_te_id_key UNIQUE (te_id);


--
-- Name: storable_batch storable_batch_batch_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storable_batch
    ADD CONSTRAINT storable_batch_batch_number_key UNIQUE (batch_number);


--
-- Name: storable_batch storable_batch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storable_batch
    ADD CONSTRAINT storable_batch_pkey PRIMARY KEY (id);


--
-- Name: storable_batch storable_batch_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storable_batch
    ADD CONSTRAINT storable_batch_te_id_key UNIQUE (te_id);


--
-- Name: storable_branch_override storable_branch_override_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storable_branch_override
    ADD CONSTRAINT storable_branch_override_pkey PRIMARY KEY (id);


--
-- Name: storable_branch_override storable_branch_override_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storable_branch_override
    ADD CONSTRAINT storable_branch_override_te_id_key UNIQUE (te_id);


--
-- Name: storable storable_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storable
    ADD CONSTRAINT storable_pkey PRIMARY KEY (id);


--
-- Name: storable storable_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storable
    ADD CONSTRAINT storable_te_id_key UNIQUE (te_id);


--
-- Name: supplier supplier_person_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_person_id_key UNIQUE (person_id);


--
-- Name: supplier supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (id);


--
-- Name: supplier supplier_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_te_id_key UNIQUE (te_id);


--
-- Name: system_table system_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.system_table
    ADD CONSTRAINT system_table_pkey PRIMARY KEY (id);


--
-- Name: till_entry till_entry_identifier_branch_id_station_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.till_entry
    ADD CONSTRAINT till_entry_identifier_branch_id_station_id_key UNIQUE (identifier, branch_id, station_id);


--
-- Name: till_entry till_entry_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.till_entry
    ADD CONSTRAINT till_entry_pkey PRIMARY KEY (id);


--
-- Name: till_entry till_entry_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.till_entry
    ADD CONSTRAINT till_entry_te_id_key UNIQUE (te_id);


--
-- Name: till till_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.till
    ADD CONSTRAINT till_pkey PRIMARY KEY (id);


--
-- Name: till_summary till_summary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.till_summary
    ADD CONSTRAINT till_summary_pkey PRIMARY KEY (id);


--
-- Name: till_summary till_summary_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.till_summary
    ADD CONSTRAINT till_summary_te_id_key UNIQUE (te_id);


--
-- Name: till_summary till_summary_till_id_method_id_provider_id_card_type_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.till_summary
    ADD CONSTRAINT till_summary_till_id_method_id_provider_id_card_type_key UNIQUE (till_id, method_id, provider_id, card_type);


--
-- Name: till till_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.till
    ADD CONSTRAINT till_te_id_key UNIQUE (te_id);


--
-- Name: transaction_entry transaction_entry_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction_entry
    ADD CONSTRAINT transaction_entry_pkey PRIMARY KEY (id);


--
-- Name: transfer_order transfer_order_identifier_source_branch_id_station_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_order
    ADD CONSTRAINT transfer_order_identifier_source_branch_id_station_id_key UNIQUE (identifier, source_branch_id, station_id);


--
-- Name: transfer_order_item transfer_order_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_order_item
    ADD CONSTRAINT transfer_order_item_pkey PRIMARY KEY (id);


--
-- Name: transfer_order_item transfer_order_item_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_order_item
    ADD CONSTRAINT transfer_order_item_te_id_key UNIQUE (te_id);


--
-- Name: transfer_order transfer_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_order
    ADD CONSTRAINT transfer_order_pkey PRIMARY KEY (id);


--
-- Name: transfer_order transfer_order_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_order
    ADD CONSTRAINT transfer_order_te_id_key UNIQUE (te_id);


--
-- Name: transporter transporter_person_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transporter
    ADD CONSTRAINT transporter_person_id_key UNIQUE (person_id);


--
-- Name: transporter transporter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transporter
    ADD CONSTRAINT transporter_pkey PRIMARY KEY (id);


--
-- Name: transporter transporter_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transporter
    ADD CONSTRAINT transporter_te_id_key UNIQUE (te_id);


--
-- Name: ui_field ui_field_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ui_field
    ADD CONSTRAINT ui_field_pkey PRIMARY KEY (id);


--
-- Name: ui_field ui_field_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ui_field
    ADD CONSTRAINT ui_field_te_id_key UNIQUE (te_id);


--
-- Name: ui_form ui_form_form_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ui_form
    ADD CONSTRAINT ui_form_form_name_key UNIQUE (form_name);


--
-- Name: ui_form ui_form_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ui_form
    ADD CONSTRAINT ui_form_pkey PRIMARY KEY (id);


--
-- Name: ui_form ui_form_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ui_form
    ADD CONSTRAINT ui_form_te_id_key UNIQUE (te_id);


--
-- Name: product_supplier_info unique_supplier_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_supplier_info
    ADD CONSTRAINT unique_supplier_code UNIQUE (branch_id, supplier_id, product_id, supplier_code);


--
-- Name: user_branch_access user_branch_access_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_branch_access
    ADD CONSTRAINT user_branch_access_pkey PRIMARY KEY (id);


--
-- Name: user_branch_access user_branch_access_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_branch_access
    ADD CONSTRAINT user_branch_access_te_id_key UNIQUE (te_id);


--
-- Name: user_branch_access user_branch_access_user_id_branch_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_branch_access
    ADD CONSTRAINT user_branch_access_user_id_branch_id_key UNIQUE (user_id, branch_id);


--
-- Name: user_profile user_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_profile
    ADD CONSTRAINT user_profile_pkey PRIMARY KEY (id);


--
-- Name: user_profile user_profile_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_profile
    ADD CONSTRAINT user_profile_te_id_key UNIQUE (te_id);


--
-- Name: voter_data voter_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voter_data
    ADD CONSTRAINT voter_data_pkey PRIMARY KEY (id);


--
-- Name: voter_data voter_data_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voter_data
    ADD CONSTRAINT voter_data_te_id_key UNIQUE (te_id);


--
-- Name: work_order_category work_order_category_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order_category
    ADD CONSTRAINT work_order_category_name_key UNIQUE (name);


--
-- Name: work_order_category work_order_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order_category
    ADD CONSTRAINT work_order_category_pkey PRIMARY KEY (id);


--
-- Name: work_order_category work_order_category_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order_category
    ADD CONSTRAINT work_order_category_te_id_key UNIQUE (te_id);


--
-- Name: work_order_history work_order_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order_history
    ADD CONSTRAINT work_order_history_pkey PRIMARY KEY (id);


--
-- Name: work_order_history work_order_history_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order_history
    ADD CONSTRAINT work_order_history_te_id_key UNIQUE (te_id);


--
-- Name: work_order work_order_identifier_branch_id_station_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order
    ADD CONSTRAINT work_order_identifier_branch_id_station_id_key UNIQUE (identifier, branch_id, station_id);


--
-- Name: work_order_item work_order_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order_item
    ADD CONSTRAINT work_order_item_pkey PRIMARY KEY (id);


--
-- Name: work_order_item work_order_item_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order_item
    ADD CONSTRAINT work_order_item_te_id_key UNIQUE (te_id);


--
-- Name: work_order_package_item work_order_package_item_order_id_package_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order_package_item
    ADD CONSTRAINT work_order_package_item_order_id_package_id_key UNIQUE (order_id, package_id);


--
-- Name: work_order_package_item work_order_package_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order_package_item
    ADD CONSTRAINT work_order_package_item_pkey PRIMARY KEY (id);


--
-- Name: work_order_package_item work_order_package_item_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order_package_item
    ADD CONSTRAINT work_order_package_item_te_id_key UNIQUE (te_id);


--
-- Name: work_order_package work_order_package_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order_package
    ADD CONSTRAINT work_order_package_pkey PRIMARY KEY (id);


--
-- Name: work_order_package work_order_package_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order_package
    ADD CONSTRAINT work_order_package_te_id_key UNIQUE (te_id);


--
-- Name: work_order work_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order
    ADD CONSTRAINT work_order_pkey PRIMARY KEY (id);


--
-- Name: work_order work_order_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order
    ADD CONSTRAINT work_order_te_id_key UNIQUE (te_id);


--
-- Name: work_permit_data work_permit_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_permit_data
    ADD CONSTRAINT work_permit_data_pkey PRIMARY KEY (id);


--
-- Name: work_permit_data work_permit_data_te_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_permit_data
    ADD CONSTRAINT work_permit_data_te_id_key UNIQUE (te_id);


--
-- Name: sellable_description_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sellable_description_idx ON public.sellable USING gist (description public.gist_trgm_ops);


--
-- Name: sellable_description_normalized_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sellable_description_normalized_idx ON public.sellable USING gist (public.stoq_normalize_string(description) public.gist_trgm_ops);


--
-- Name: stock_transaction_history_branch_storable_batch_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX stock_transaction_history_branch_storable_batch_idx ON public.stock_transaction_history USING btree (branch_id, storable_id, batch_id);


--
-- Name: attachment update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.attachment DO  SELECT public.update_te(old.te_id, 'attachment'::text) AS update_te;


--
-- Name: person update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.person DO  SELECT public.update_te(old.te_id, 'person'::text) AS update_te;


--
-- Name: client_category update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.client_category DO  SELECT public.update_te(old.te_id, 'client_category'::text) AS update_te;


--
-- Name: client update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.client DO  SELECT public.update_te(old.te_id, 'client'::text) AS update_te;


--
-- Name: company update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.company DO  SELECT public.update_te(old.te_id, 'company'::text) AS update_te;


--
-- Name: individual update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.individual DO  SELECT public.update_te(old.te_id, 'individual'::text) AS update_te;


--
-- Name: employee_role update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.employee_role DO  SELECT public.update_te(old.te_id, 'employee_role'::text) AS update_te;


--
-- Name: work_permit_data update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.work_permit_data DO  SELECT public.update_te(old.te_id, 'work_permit_data'::text) AS update_te;


--
-- Name: military_data update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.military_data DO  SELECT public.update_te(old.te_id, 'military_data'::text) AS update_te;


--
-- Name: voter_data update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.voter_data DO  SELECT public.update_te(old.te_id, 'voter_data'::text) AS update_te;


--
-- Name: bank_account update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.bank_account DO  SELECT public.update_te(old.te_id, 'bank_account'::text) AS update_te;


--
-- Name: bill_option update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.bill_option DO  SELECT public.update_te(old.te_id, 'bill_option'::text) AS update_te;


--
-- Name: employee update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.employee DO  SELECT public.update_te(old.te_id, 'employee'::text) AS update_te;


--
-- Name: branch update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.branch DO  SELECT public.update_te(old.te_id, 'branch'::text) AS update_te;


--
-- Name: sales_person update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.sales_person DO  SELECT public.update_te(old.te_id, 'sales_person'::text) AS update_te;


--
-- Name: supplier update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.supplier DO  SELECT public.update_te(old.te_id, 'supplier'::text) AS update_te;


--
-- Name: transporter update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.transporter DO  SELECT public.update_te(old.te_id, 'transporter'::text) AS update_te;


--
-- Name: user_profile update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.user_profile DO  SELECT public.update_te(old.te_id, 'user_profile'::text) AS update_te;


--
-- Name: login_user update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.login_user DO  SELECT public.update_te(old.te_id, 'login_user'::text) AS update_te;


--
-- Name: user_branch_access update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.user_branch_access DO  SELECT public.update_te(old.te_id, 'user_branch_access'::text) AS update_te;


--
-- Name: client_salary_history update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.client_salary_history DO  SELECT public.update_te(old.te_id, 'client_salary_history'::text) AS update_te;


--
-- Name: product_tax_template update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.product_tax_template DO  SELECT public.update_te(old.te_id, 'product_tax_template'::text) AS update_te;


--
-- Name: sellable_tax_constant update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.sellable_tax_constant DO  SELECT public.update_te(old.te_id, 'sellable_tax_constant'::text) AS update_te;


--
-- Name: sellable_category update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.sellable_category DO  SELECT public.update_te(old.te_id, 'sellable_category'::text) AS update_te;


--
-- Name: sellable_unit update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.sellable_unit DO  SELECT public.update_te(old.te_id, 'sellable_unit'::text) AS update_te;


--
-- Name: cfop_data update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.cfop_data DO  SELECT public.update_te(old.te_id, 'cfop_data'::text) AS update_te;


--
-- Name: sellable update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.sellable DO  SELECT public.update_te(old.te_id, 'sellable'::text) AS update_te;


--
-- Name: image update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.image DO  SELECT public.update_te(old.te_id, 'image'::text) AS update_te;


--
-- Name: product_icms_template update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.product_icms_template DO  SELECT public.update_te(old.te_id, 'product_icms_template'::text) AS update_te;


--
-- Name: product_ipi_template update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.product_ipi_template DO  SELECT public.update_te(old.te_id, 'product_ipi_template'::text) AS update_te;


--
-- Name: product_manufacturer update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.product_manufacturer DO  SELECT public.update_te(old.te_id, 'product_manufacturer'::text) AS update_te;


--
-- Name: product update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.product DO  SELECT public.update_te(old.te_id, 'product'::text) AS update_te;


--
-- Name: grid_group update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.grid_group DO  SELECT public.update_te(old.te_id, 'grid_group'::text) AS update_te;


--
-- Name: grid_attribute update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.grid_attribute DO  SELECT public.update_te(old.te_id, 'grid_attribute'::text) AS update_te;


--
-- Name: grid_option update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.grid_option DO  SELECT public.update_te(old.te_id, 'grid_option'::text) AS update_te;


--
-- Name: product_attribute update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.product_attribute DO  SELECT public.update_te(old.te_id, 'product_attribute'::text) AS update_te;


--
-- Name: product_option_map update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.product_option_map DO  SELECT public.update_te(old.te_id, 'product_option_map'::text) AS update_te;


--
-- Name: product_component update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.product_component DO  SELECT public.update_te(old.te_id, 'product_component'::text) AS update_te;


--
-- Name: storable update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.storable DO  SELECT public.update_te(old.te_id, 'storable'::text) AS update_te;


--
-- Name: storable_batch update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.storable_batch DO  SELECT public.update_te(old.te_id, 'storable_batch'::text) AS update_te;


--
-- Name: product_stock_item update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.product_stock_item DO  SELECT public.update_te(old.te_id, 'product_stock_item'::text) AS update_te;


--
-- Name: product_supplier_info update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.product_supplier_info DO  SELECT public.update_te(old.te_id, 'product_supplier_info'::text) AS update_te;


--
-- Name: product_history update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.product_history DO  SELECT public.update_te(old.te_id, 'product_history'::text) AS update_te;


--
-- Name: service update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.service DO  SELECT public.update_te(old.te_id, 'service'::text) AS update_te;


--
-- Name: payment_renegotiation update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.payment_renegotiation DO  SELECT public.update_te(old.te_id, 'payment_renegotiation'::text) AS update_te;


--
-- Name: payment_group update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.payment_group DO  SELECT public.update_te(old.te_id, 'payment_group'::text) AS update_te;


--
-- Name: payment_flow_history update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.payment_flow_history DO  SELECT public.update_te(old.te_id, 'payment_flow_history'::text) AS update_te;


--
-- Name: stock_transaction_history update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.stock_transaction_history DO  SELECT public.update_te(old.te_id, 'stock_transaction_history'::text) AS update_te;


--
-- Name: quote_group update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.quote_group DO  SELECT public.update_te(old.te_id, 'quote_group'::text) AS update_te;


--
-- Name: branch_station update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.branch_station DO  SELECT public.update_te(old.te_id, 'branch_station'::text) AS update_te;


--
-- Name: till update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.till DO  SELECT public.update_te(old.te_id, 'till'::text) AS update_te;


--
-- Name: client_category_price update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.client_category_price DO  SELECT public.update_te(old.te_id, 'client_category_price'::text) AS update_te;


--
-- Name: invoice update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.invoice DO  SELECT public.update_te(old.te_id, 'invoice'::text) AS update_te;


--
-- Name: sale_token update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.sale_token DO  SELECT public.update_te(old.te_id, 'sale_token'::text) AS update_te;


--
-- Name: sale update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.sale DO  SELECT public.update_te(old.te_id, 'sale'::text) AS update_te;


--
-- Name: sale_comment update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.sale_comment DO  SELECT public.update_te(old.te_id, 'sale_comment'::text) AS update_te;


--
-- Name: invoice_item_icms update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.invoice_item_icms DO  SELECT public.update_te(old.te_id, 'invoice_item_icms'::text) AS update_te;


--
-- Name: invoice_item_ipi update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.invoice_item_ipi DO  SELECT public.update_te(old.te_id, 'invoice_item_ipi'::text) AS update_te;


--
-- Name: sale_item update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.sale_item DO  SELECT public.update_te(old.te_id, 'sale_item'::text) AS update_te;


--
-- Name: returned_sale update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.returned_sale DO  SELECT public.update_te(old.te_id, 'returned_sale'::text) AS update_te;


--
-- Name: returned_sale_item update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.returned_sale_item DO  SELECT public.update_te(old.te_id, 'returned_sale_item'::text) AS update_te;


--
-- Name: address update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.address DO  SELECT public.update_te(old.te_id, 'address'::text) AS update_te;


--
-- Name: delivery update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.delivery DO  SELECT public.update_te(old.te_id, 'delivery'::text) AS update_te;


--
-- Name: calls update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.calls DO  SELECT public.update_te(old.te_id, 'calls'::text) AS update_te;


--
-- Name: account update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.account DO  SELECT public.update_te(old.te_id, 'account'::text) AS update_te;


--
-- Name: payment_method update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.payment_method DO  SELECT public.update_te(old.te_id, 'payment_method'::text) AS update_te;


--
-- Name: payment_category update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.payment_category DO  SELECT public.update_te(old.te_id, 'payment_category'::text) AS update_te;


--
-- Name: payment update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.payment DO  SELECT public.update_te(old.te_id, 'payment'::text) AS update_te;


--
-- Name: payment_comment update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.payment_comment DO  SELECT public.update_te(old.te_id, 'payment_comment'::text) AS update_te;


--
-- Name: check_data update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.check_data DO  SELECT public.update_te(old.te_id, 'check_data'::text) AS update_te;


--
-- Name: card_payment_device update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.card_payment_device DO  SELECT public.update_te(old.te_id, 'card_payment_device'::text) AS update_te;


--
-- Name: credit_provider update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.credit_provider DO  SELECT public.update_te(old.te_id, 'credit_provider'::text) AS update_te;


--
-- Name: card_operation_cost update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.card_operation_cost DO  SELECT public.update_te(old.te_id, 'card_operation_cost'::text) AS update_te;


--
-- Name: credit_card_data update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.credit_card_data DO  SELECT public.update_te(old.te_id, 'credit_card_data'::text) AS update_te;


--
-- Name: payment_change_history update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.payment_change_history DO  SELECT public.update_te(old.te_id, 'payment_change_history'::text) AS update_te;


--
-- Name: fiscal_sale_history update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.fiscal_sale_history DO  SELECT public.update_te(old.te_id, 'fiscal_sale_history'::text) AS update_te;


--
-- Name: device_settings update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.device_settings DO  SELECT public.update_te(old.te_id, 'device_settings'::text) AS update_te;


--
-- Name: device_constant update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.device_constant DO  SELECT public.update_te(old.te_id, 'device_constant'::text) AS update_te;


--
-- Name: employee_role_history update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.employee_role_history DO  SELECT public.update_te(old.te_id, 'employee_role_history'::text) AS update_te;


--
-- Name: contact_info update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.contact_info DO  SELECT public.update_te(old.te_id, 'contact_info'::text) AS update_te;


--
-- Name: parameter_data update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.parameter_data DO  SELECT public.update_te(old.te_id, 'parameter_data'::text) AS update_te;


--
-- Name: profile_settings update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.profile_settings DO  SELECT public.update_te(old.te_id, 'profile_settings'::text) AS update_te;


--
-- Name: cost_center update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.cost_center DO  SELECT public.update_te(old.te_id, 'cost_center'::text) AS update_te;


--
-- Name: cost_center_entry update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.cost_center_entry DO  SELECT public.update_te(old.te_id, 'cost_center_entry'::text) AS update_te;


--
-- Name: receiving_invoice update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.receiving_invoice DO  SELECT public.update_te(old.te_id, 'receiving_invoice'::text) AS update_te;


--
-- Name: till_entry update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.till_entry DO  SELECT public.update_te(old.te_id, 'till_entry'::text) AS update_te;


--
-- Name: fiscal_book_entry update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.fiscal_book_entry DO  SELECT public.update_te(old.te_id, 'fiscal_book_entry'::text) AS update_te;


--
-- Name: fiscal_day_history update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.fiscal_day_history DO  SELECT public.update_te(old.te_id, 'fiscal_day_history'::text) AS update_te;


--
-- Name: fiscal_day_tax update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.fiscal_day_tax DO  SELECT public.update_te(old.te_id, 'fiscal_day_tax'::text) AS update_te;


--
-- Name: installed_plugin update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.installed_plugin DO  SELECT public.update_te(old.te_id, 'installed_plugin'::text) AS update_te;


--
-- Name: plugin_egg update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.plugin_egg DO  SELECT public.update_te(old.te_id, 'plugin_egg'::text) AS update_te;


--
-- Name: commission_source update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.commission_source DO  SELECT public.update_te(old.te_id, 'commission_source'::text) AS update_te;


--
-- Name: commission update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.commission DO  SELECT public.update_te(old.te_id, 'commission'::text) AS update_te;


--
-- Name: transfer_order update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.transfer_order DO  SELECT public.update_te(old.te_id, 'transfer_order'::text) AS update_te;


--
-- Name: transfer_order_item update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.transfer_order_item DO  SELECT public.update_te(old.te_id, 'transfer_order_item'::text) AS update_te;


--
-- Name: invoice_layout update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.invoice_layout DO  SELECT public.update_te(old.te_id, 'invoice_layout'::text) AS update_te;


--
-- Name: invoice_field update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.invoice_field DO  SELECT public.update_te(old.te_id, 'invoice_field'::text) AS update_te;


--
-- Name: invoice_printer update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.invoice_printer DO  SELECT public.update_te(old.te_id, 'invoice_printer'::text) AS update_te;


--
-- Name: inventory update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.inventory DO  SELECT public.update_te(old.te_id, 'inventory'::text) AS update_te;


--
-- Name: inventory_item update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.inventory_item DO  SELECT public.update_te(old.te_id, 'inventory_item'::text) AS update_te;


--
-- Name: production_order update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.production_order DO  SELECT public.update_te(old.te_id, 'production_order'::text) AS update_te;


--
-- Name: production_item update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.production_item DO  SELECT public.update_te(old.te_id, 'production_item'::text) AS update_te;


--
-- Name: production_material update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.production_material DO  SELECT public.update_te(old.te_id, 'production_material'::text) AS update_te;


--
-- Name: production_service update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.production_service DO  SELECT public.update_te(old.te_id, 'production_service'::text) AS update_te;


--
-- Name: loan update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.loan DO  SELECT public.update_te(old.te_id, 'loan'::text) AS update_te;


--
-- Name: loan_item update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.loan_item DO  SELECT public.update_te(old.te_id, 'loan_item'::text) AS update_te;


--
-- Name: work_order_category update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.work_order_category DO  SELECT public.update_te(old.te_id, 'work_order_category'::text) AS update_te;


--
-- Name: work_order update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.work_order DO  SELECT public.update_te(old.te_id, 'work_order'::text) AS update_te;


--
-- Name: work_order_package update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.work_order_package DO  SELECT public.update_te(old.te_id, 'work_order_package'::text) AS update_te;


--
-- Name: work_order_package_item update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.work_order_package_item DO  SELECT public.update_te(old.te_id, 'work_order_package_item'::text) AS update_te;


--
-- Name: work_order_history update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.work_order_history DO  SELECT public.update_te(old.te_id, 'work_order_history'::text) AS update_te;


--
-- Name: purchase_order update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.purchase_order DO  SELECT public.update_te(old.te_id, 'purchase_order'::text) AS update_te;


--
-- Name: purchase_item update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.purchase_item DO  SELECT public.update_te(old.te_id, 'purchase_item'::text) AS update_te;


--
-- Name: work_order_item update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.work_order_item DO  SELECT public.update_te(old.te_id, 'work_order_item'::text) AS update_te;


--
-- Name: quotation update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.quotation DO  SELECT public.update_te(old.te_id, 'quotation'::text) AS update_te;


--
-- Name: receiving_order update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.receiving_order DO  SELECT public.update_te(old.te_id, 'receiving_order'::text) AS update_te;


--
-- Name: receiving_order_item update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.receiving_order_item DO  SELECT public.update_te(old.te_id, 'receiving_order_item'::text) AS update_te;


--
-- Name: purchase_receiving_map update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.purchase_receiving_map DO  SELECT public.update_te(old.te_id, 'purchase_receiving_map'::text) AS update_te;


--
-- Name: stock_decrease update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.stock_decrease DO  SELECT public.update_te(old.te_id, 'stock_decrease'::text) AS update_te;


--
-- Name: stock_decrease_item update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.stock_decrease_item DO  SELECT public.update_te(old.te_id, 'stock_decrease_item'::text) AS update_te;


--
-- Name: account_transaction update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.account_transaction DO  SELECT public.update_te(old.te_id, 'account_transaction'::text) AS update_te;


--
-- Name: ui_form update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.ui_form DO  SELECT public.update_te(old.te_id, 'ui_form'::text) AS update_te;


--
-- Name: ui_field update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.ui_field DO  SELECT public.update_te(old.te_id, 'ui_field'::text) AS update_te;


--
-- Name: product_quality_test update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.product_quality_test DO  SELECT public.update_te(old.te_id, 'product_quality_test'::text) AS update_te;


--
-- Name: production_produced_item update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.production_produced_item DO  SELECT public.update_te(old.te_id, 'production_produced_item'::text) AS update_te;


--
-- Name: production_item_quality_result update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.production_item_quality_result DO  SELECT public.update_te(old.te_id, 'production_item_quality_result'::text) AS update_te;


--
-- Name: credit_check_history update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.credit_check_history DO  SELECT public.update_te(old.te_id, 'credit_check_history'::text) AS update_te;


--
-- Name: certificate update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.certificate DO  SELECT public.update_te(old.te_id, 'certificate'::text) AS update_te;


--
-- Name: till_summary update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.till_summary DO  SELECT public.update_te(old.te_id, 'till_summary'::text) AS update_te;


--
-- Name: invoice_item_cofins update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.invoice_item_cofins DO  SELECT public.update_te(old.te_id, 'invoice_item_cofins'::text) AS update_te;


--
-- Name: invoice_item_pis update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.invoice_item_pis DO  SELECT public.update_te(old.te_id, 'invoice_item_pis'::text) AS update_te;


--
-- Name: product_cofins_template update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.product_cofins_template DO  SELECT public.update_te(old.te_id, 'product_cofins_template'::text) AS update_te;


--
-- Name: product_pis_template update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.product_pis_template DO  SELECT public.update_te(old.te_id, 'product_pis_template'::text) AS update_te;


--
-- Name: message update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.message DO  SELECT public.update_te(old.te_id) AS update_te;


--
-- Name: station_type update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.station_type DO  SELECT public.update_te(old.te_id, 'station_type'::text) AS update_te;


--
-- Name: sellable_branch_override update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.sellable_branch_override DO  SELECT public.update_te(old.te_id, 'sellable_branch_override'::text) AS update_te;


--
-- Name: product_branch_override update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.product_branch_override DO  SELECT public.update_te(old.te_id, 'product_branch_override'::text) AS update_te;


--
-- Name: storable_branch_override update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.storable_branch_override DO  SELECT public.update_te(old.te_id, 'storable_branch_override'::text) AS update_te;


--
-- Name: service_branch_override update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.service_branch_override DO  SELECT public.update_te(old.te_id, 'service_branch_override'::text) AS update_te;


--
-- Name: access_token update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.access_token DO  SELECT public.update_te(old.te_id, 'access_token'::text) AS update_te;


--
-- Name: context update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.context DO  SELECT public.update_te(old.te_id) AS update_te;


--
-- Name: sale_context update_te; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE update_te AS
    ON UPDATE TO public.sale_context DO  SELECT public.update_te(old.te_id) AS update_te;


--
-- Name: stock_transaction_history update_stock_item_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_stock_item_trigger BEFORE INSERT ON public.stock_transaction_history FOR EACH ROW EXECUTE FUNCTION public.upsert_stock_item();


--
-- Name: product_stock_item validate_stock_item_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER validate_stock_item_trigger BEFORE INSERT OR UPDATE ON public.product_stock_item FOR EACH ROW EXECUTE FUNCTION public.validate_stock_item();


--
-- Name: access_token access_token_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.access_token
    ADD CONSTRAINT access_token_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.branch_station(id) ON UPDATE CASCADE;


--
-- Name: access_token access_token_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.access_token
    ADD CONSTRAINT access_token_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: access_token access_token_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.access_token
    ADD CONSTRAINT access_token_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.login_user(id) ON UPDATE CASCADE;


--
-- Name: account account_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.account(id) ON UPDATE CASCADE;


--
-- Name: account account_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.branch_station(id) ON UPDATE CASCADE;


--
-- Name: account account_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: account_transaction account_transaction_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_transaction
    ADD CONSTRAINT account_transaction_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(id) ON UPDATE CASCADE;


--
-- Name: account_transaction account_transaction_payment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_transaction
    ADD CONSTRAINT account_transaction_payment_id_fkey FOREIGN KEY (payment_id) REFERENCES public.payment(id) ON UPDATE CASCADE;


--
-- Name: account_transaction account_transaction_source_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_transaction
    ADD CONSTRAINT account_transaction_source_account_id_fkey FOREIGN KEY (source_account_id) REFERENCES public.account(id) ON UPDATE CASCADE;


--
-- Name: account_transaction account_transaction_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_transaction
    ADD CONSTRAINT account_transaction_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: address address_city_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_city_location_id_fkey FOREIGN KEY (city_location_id) REFERENCES public.city_location(id) ON UPDATE CASCADE;


--
-- Name: address address_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.person(id) ON UPDATE CASCADE;


--
-- Name: address address_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: attachment attachment_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachment
    ADD CONSTRAINT attachment_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: bank_account bank_account_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_account
    ADD CONSTRAINT bank_account_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(id) ON UPDATE CASCADE;


--
-- Name: bank_account bank_account_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank_account
    ADD CONSTRAINT bank_account_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: bill_option bill_option_bank_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_option
    ADD CONSTRAINT bill_option_bank_account_id_fkey FOREIGN KEY (bank_account_id) REFERENCES public.bank_account(id) ON UPDATE CASCADE;


--
-- Name: bill_option bill_option_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_option
    ADD CONSTRAINT bill_option_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: branch branch_certificate_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch
    ADD CONSTRAINT branch_certificate_id_fkey FOREIGN KEY (certificate_id) REFERENCES public.certificate(id) ON UPDATE CASCADE;


--
-- Name: branch branch_default_client_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch
    ADD CONSTRAINT branch_default_client_category_id_fkey FOREIGN KEY (default_client_category_id) REFERENCES public.client_category(id) ON UPDATE CASCADE;


--
-- Name: branch branch_manager_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch
    ADD CONSTRAINT branch_manager_id_fkey FOREIGN KEY (manager_id) REFERENCES public.employee(id) ON UPDATE CASCADE;


--
-- Name: branch branch_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch
    ADD CONSTRAINT branch_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.person(id) ON UPDATE CASCADE;


--
-- Name: branch_station branch_station_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch_station
    ADD CONSTRAINT branch_station_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: branch_station branch_station_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch_station
    ADD CONSTRAINT branch_station_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: branch_station branch_station_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch_station
    ADD CONSTRAINT branch_station_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.station_type(id) ON UPDATE CASCADE;


--
-- Name: branch_synchronization branch_synchronization_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch_synchronization
    ADD CONSTRAINT branch_synchronization_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: branch branch_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch
    ADD CONSTRAINT branch_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: calls calls_attendant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calls
    ADD CONSTRAINT calls_attendant_id_fkey FOREIGN KEY (attendant_id) REFERENCES public.login_user(id) ON UPDATE CASCADE;


--
-- Name: calls calls_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calls
    ADD CONSTRAINT calls_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.person(id) ON UPDATE CASCADE;


--
-- Name: calls calls_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calls
    ADD CONSTRAINT calls_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: card_operation_cost card_operation_cost_device_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_operation_cost
    ADD CONSTRAINT card_operation_cost_device_id_fkey FOREIGN KEY (device_id) REFERENCES public.card_payment_device(id) ON UPDATE CASCADE;


--
-- Name: card_operation_cost card_operation_cost_provider_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_operation_cost
    ADD CONSTRAINT card_operation_cost_provider_id_fkey FOREIGN KEY (provider_id) REFERENCES public.credit_provider(id) ON UPDATE CASCADE;


--
-- Name: card_operation_cost card_operation_cost_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_operation_cost
    ADD CONSTRAINT card_operation_cost_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: card_payment_device card_payment_device_supplier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_payment_device
    ADD CONSTRAINT card_payment_device_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES public.supplier(id) ON UPDATE CASCADE;


--
-- Name: card_payment_device card_payment_device_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_payment_device
    ADD CONSTRAINT card_payment_device_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: certificate certificate_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificate
    ADD CONSTRAINT certificate_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: cfop_data cfop_data_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cfop_data
    ADD CONSTRAINT cfop_data_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: check_data check_data_bank_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.check_data
    ADD CONSTRAINT check_data_bank_account_id_fkey FOREIGN KEY (bank_account_id) REFERENCES public.bank_account(id) ON UPDATE CASCADE;


--
-- Name: check_data check_data_payment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.check_data
    ADD CONSTRAINT check_data_payment_id_fkey FOREIGN KEY (payment_id) REFERENCES public.payment(id) ON UPDATE CASCADE;


--
-- Name: check_data check_data_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.check_data
    ADD CONSTRAINT check_data_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: client client_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.client_category(id) ON UPDATE CASCADE;


--
-- Name: client_category_price client_category_price_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_category_price
    ADD CONSTRAINT client_category_price_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.client_category(id) ON UPDATE CASCADE;


--
-- Name: client_category_price client_category_price_sellable_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_category_price
    ADD CONSTRAINT client_category_price_sellable_id_fkey FOREIGN KEY (sellable_id) REFERENCES public.sellable(id) ON UPDATE CASCADE;


--
-- Name: client_category_price client_category_price_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_category_price
    ADD CONSTRAINT client_category_price_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: client_category client_category_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_category
    ADD CONSTRAINT client_category_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: client client_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.person(id) ON UPDATE CASCADE;


--
-- Name: client_salary_history client_salary_history_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_salary_history
    ADD CONSTRAINT client_salary_history_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(id) ON UPDATE CASCADE;


--
-- Name: client_salary_history client_salary_history_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_salary_history
    ADD CONSTRAINT client_salary_history_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: client_salary_history client_salary_history_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_salary_history
    ADD CONSTRAINT client_salary_history_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.login_user(id) ON UPDATE CASCADE;


--
-- Name: client client_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: commission commission_payment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commission
    ADD CONSTRAINT commission_payment_id_fkey FOREIGN KEY (payment_id) REFERENCES public.payment(id) ON UPDATE CASCADE;


--
-- Name: commission commission_sale_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commission
    ADD CONSTRAINT commission_sale_id_fkey FOREIGN KEY (sale_id) REFERENCES public.sale(id) ON UPDATE CASCADE;


--
-- Name: commission_source commission_source_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commission_source
    ADD CONSTRAINT commission_source_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.sellable_category(id) ON UPDATE CASCADE;


--
-- Name: commission_source commission_source_sellable_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commission_source
    ADD CONSTRAINT commission_source_sellable_id_fkey FOREIGN KEY (sellable_id) REFERENCES public.sellable(id) ON UPDATE CASCADE;


--
-- Name: commission_source commission_source_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commission_source
    ADD CONSTRAINT commission_source_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: commission commission_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commission
    ADD CONSTRAINT commission_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: company company_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.company(id) ON UPDATE CASCADE;


--
-- Name: company company_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.person(id) ON UPDATE CASCADE;


--
-- Name: company company_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: contact_info contact_info_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_info
    ADD CONSTRAINT contact_info_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.person(id) ON UPDATE CASCADE;


--
-- Name: contact_info contact_info_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_info
    ADD CONSTRAINT contact_info_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: context context_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.context
    ADD CONSTRAINT context_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: context context_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.context
    ADD CONSTRAINT context_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: cost_center_entry cost_center_entry_cost_center_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cost_center_entry
    ADD CONSTRAINT cost_center_entry_cost_center_id_fkey FOREIGN KEY (cost_center_id) REFERENCES public.cost_center(id) ON UPDATE CASCADE;


--
-- Name: cost_center_entry cost_center_entry_payment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cost_center_entry
    ADD CONSTRAINT cost_center_entry_payment_id_fkey FOREIGN KEY (payment_id) REFERENCES public.payment(id) ON UPDATE CASCADE;


--
-- Name: cost_center_entry cost_center_entry_stock_transaction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cost_center_entry
    ADD CONSTRAINT cost_center_entry_stock_transaction_id_fkey FOREIGN KEY (stock_transaction_id) REFERENCES public.stock_transaction_history(id) ON UPDATE CASCADE;


--
-- Name: cost_center_entry cost_center_entry_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cost_center_entry
    ADD CONSTRAINT cost_center_entry_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: cost_center cost_center_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cost_center
    ADD CONSTRAINT cost_center_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: credit_card_data credit_card_data_device_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_card_data
    ADD CONSTRAINT credit_card_data_device_id_fkey FOREIGN KEY (device_id) REFERENCES public.card_payment_device(id) ON UPDATE CASCADE;


--
-- Name: credit_card_data credit_card_data_payment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_card_data
    ADD CONSTRAINT credit_card_data_payment_id_fkey FOREIGN KEY (payment_id) REFERENCES public.payment(id) ON UPDATE CASCADE;


--
-- Name: credit_card_data credit_card_data_provider_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_card_data
    ADD CONSTRAINT credit_card_data_provider_id_fkey FOREIGN KEY (provider_id) REFERENCES public.credit_provider(id) ON UPDATE CASCADE;


--
-- Name: credit_card_data credit_card_data_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_card_data
    ADD CONSTRAINT credit_card_data_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: credit_check_history credit_check_history_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_check_history
    ADD CONSTRAINT credit_check_history_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(id) ON UPDATE CASCADE;


--
-- Name: credit_check_history credit_check_history_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_check_history
    ADD CONSTRAINT credit_check_history_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: credit_check_history credit_check_history_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_check_history
    ADD CONSTRAINT credit_check_history_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.login_user(id) ON UPDATE CASCADE;


--
-- Name: credit_provider credit_provider_default_device_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_provider
    ADD CONSTRAINT credit_provider_default_device_id_fkey FOREIGN KEY (default_device_id) REFERENCES public.card_payment_device(id) ON UPDATE CASCADE;


--
-- Name: credit_provider credit_provider_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credit_provider
    ADD CONSTRAINT credit_provider_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: delivery delivery_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT delivery_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.address(id) ON UPDATE CASCADE;


--
-- Name: delivery delivery_cancel_responsible_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT delivery_cancel_responsible_id_fkey FOREIGN KEY (cancel_responsible_id) REFERENCES public.login_user(id) ON UPDATE CASCADE;


--
-- Name: delivery delivery_invoice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT delivery_invoice_id_fkey FOREIGN KEY (invoice_id) REFERENCES public.invoice(id) ON UPDATE CASCADE;


--
-- Name: delivery delivery_pack_responsible_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT delivery_pack_responsible_id_fkey FOREIGN KEY (pack_responsible_id) REFERENCES public.login_user(id) ON UPDATE CASCADE;


--
-- Name: delivery delivery_pick_responsible_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT delivery_pick_responsible_id_fkey FOREIGN KEY (pick_responsible_id) REFERENCES public.login_user(id) ON UPDATE CASCADE;


--
-- Name: delivery delivery_send_responsible_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT delivery_send_responsible_id_fkey FOREIGN KEY (send_responsible_id) REFERENCES public.login_user(id) ON UPDATE CASCADE;


--
-- Name: delivery delivery_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT delivery_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: delivery delivery_transporter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT delivery_transporter_id_fkey FOREIGN KEY (transporter_id) REFERENCES public.transporter(id) ON UPDATE CASCADE;


--
-- Name: device_constant device_constant_device_settings_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_constant
    ADD CONSTRAINT device_constant_device_settings_id_fkey FOREIGN KEY (device_settings_id) REFERENCES public.device_settings(id) ON UPDATE CASCADE;


--
-- Name: device_constant device_constant_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_constant
    ADD CONSTRAINT device_constant_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: device_settings device_settings_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_settings
    ADD CONSTRAINT device_settings_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.branch_station(id) ON UPDATE CASCADE;


--
-- Name: device_settings device_settings_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_settings
    ADD CONSTRAINT device_settings_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: employee employee_bank_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_bank_account_id_fkey FOREIGN KEY (bank_account_id) REFERENCES public.bank_account(id) ON UPDATE CASCADE;


--
-- Name: employee employee_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: employee employee_military_data_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_military_data_id_fkey FOREIGN KEY (military_data_id) REFERENCES public.military_data(id) ON UPDATE CASCADE;


--
-- Name: employee employee_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.person(id) ON UPDATE CASCADE;


--
-- Name: employee_role_history employee_role_history_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_role_history
    ADD CONSTRAINT employee_role_history_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employee(id) ON UPDATE CASCADE;


--
-- Name: employee_role_history employee_role_history_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_role_history
    ADD CONSTRAINT employee_role_history_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.employee_role(id) ON UPDATE CASCADE;


--
-- Name: employee_role_history employee_role_history_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_role_history
    ADD CONSTRAINT employee_role_history_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: employee employee_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.employee_role(id) ON UPDATE CASCADE;


--
-- Name: employee_role employee_role_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_role
    ADD CONSTRAINT employee_role_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: employee employee_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: employee employee_voter_data_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_voter_data_id_fkey FOREIGN KEY (voter_data_id) REFERENCES public.voter_data(id) ON UPDATE CASCADE;


--
-- Name: employee employee_workpermit_data_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_workpermit_data_id_fkey FOREIGN KEY (workpermit_data_id) REFERENCES public.work_permit_data(id) ON UPDATE CASCADE;


--
-- Name: fiscal_book_entry fiscal_book_entry_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fiscal_book_entry
    ADD CONSTRAINT fiscal_book_entry_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: fiscal_book_entry fiscal_book_entry_cfop_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fiscal_book_entry
    ADD CONSTRAINT fiscal_book_entry_cfop_id_fkey FOREIGN KEY (cfop_id) REFERENCES public.cfop_data(id) ON UPDATE CASCADE;


--
-- Name: fiscal_book_entry fiscal_book_entry_drawee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fiscal_book_entry
    ADD CONSTRAINT fiscal_book_entry_drawee_id_fkey FOREIGN KEY (drawee_id) REFERENCES public.person(id) ON UPDATE CASCADE;


--
-- Name: fiscal_book_entry fiscal_book_entry_payment_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fiscal_book_entry
    ADD CONSTRAINT fiscal_book_entry_payment_group_id_fkey FOREIGN KEY (payment_group_id) REFERENCES public.payment_group(id) ON UPDATE CASCADE;


--
-- Name: fiscal_book_entry fiscal_book_entry_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fiscal_book_entry
    ADD CONSTRAINT fiscal_book_entry_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: fiscal_day_history fiscal_day_history_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fiscal_day_history
    ADD CONSTRAINT fiscal_day_history_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.branch_station(id) ON UPDATE CASCADE;


--
-- Name: fiscal_day_history fiscal_day_history_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fiscal_day_history
    ADD CONSTRAINT fiscal_day_history_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: fiscal_day_tax fiscal_day_tax_fiscal_day_history_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fiscal_day_tax
    ADD CONSTRAINT fiscal_day_tax_fiscal_day_history_id_fkey FOREIGN KEY (fiscal_day_history_id) REFERENCES public.fiscal_day_history(id) ON UPDATE CASCADE;


--
-- Name: fiscal_day_tax fiscal_day_tax_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fiscal_day_tax
    ADD CONSTRAINT fiscal_day_tax_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: fiscal_sale_history fiscal_sale_history_sale_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fiscal_sale_history
    ADD CONSTRAINT fiscal_sale_history_sale_id_fkey FOREIGN KEY (sale_id) REFERENCES public.sale(id) ON UPDATE CASCADE;


--
-- Name: fiscal_sale_history fiscal_sale_history_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fiscal_sale_history
    ADD CONSTRAINT fiscal_sale_history_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: grid_attribute grid_attribute_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grid_attribute
    ADD CONSTRAINT grid_attribute_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.grid_group(id) ON UPDATE CASCADE;


--
-- Name: grid_attribute grid_attribute_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grid_attribute
    ADD CONSTRAINT grid_attribute_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: grid_group grid_group_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grid_group
    ADD CONSTRAINT grid_group_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: grid_option grid_option_attribute_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grid_option
    ADD CONSTRAINT grid_option_attribute_id_fkey FOREIGN KEY (attribute_id) REFERENCES public.grid_attribute(id) ON UPDATE CASCADE;


--
-- Name: grid_option grid_option_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grid_option
    ADD CONSTRAINT grid_option_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: image image_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.sellable_category(id) ON UPDATE CASCADE;


--
-- Name: image image_sellable_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_sellable_id_fkey FOREIGN KEY (sellable_id) REFERENCES public.sellable(id) ON UPDATE CASCADE;


--
-- Name: image image_station_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_station_type_id_fkey FOREIGN KEY (station_type_id) REFERENCES public.station_type(id) ON UPDATE CASCADE;


--
-- Name: image image_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: individual individual_birth_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individual
    ADD CONSTRAINT individual_birth_location_id_fkey FOREIGN KEY (birth_location_id) REFERENCES public.city_location(id) ON UPDATE CASCADE;


--
-- Name: individual individual_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individual
    ADD CONSTRAINT individual_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.person(id) ON UPDATE CASCADE;


--
-- Name: individual individual_responsible_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individual
    ADD CONSTRAINT individual_responsible_id_fkey FOREIGN KEY (responsible_id) REFERENCES public.individual(id) ON UPDATE CASCADE;


--
-- Name: individual individual_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.individual
    ADD CONSTRAINT individual_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: installed_plugin installed_plugin_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.installed_plugin
    ADD CONSTRAINT installed_plugin_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: inventory inventory_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: inventory inventory_cancel_responsible_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_cancel_responsible_id_fkey FOREIGN KEY (cancel_responsible_id) REFERENCES public.login_user(id) ON UPDATE CASCADE;


--
-- Name: inventory_item inventory_item_batch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_item
    ADD CONSTRAINT inventory_item_batch_id_fkey FOREIGN KEY (batch_id) REFERENCES public.storable_batch(id) ON UPDATE CASCADE;


--
-- Name: inventory_item inventory_item_cfop_data_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_item
    ADD CONSTRAINT inventory_item_cfop_data_id_fkey FOREIGN KEY (cfop_data_id) REFERENCES public.cfop_data(id) ON UPDATE CASCADE;


--
-- Name: inventory_item inventory_item_inventory_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_item
    ADD CONSTRAINT inventory_item_inventory_id_fkey FOREIGN KEY (inventory_id) REFERENCES public.inventory(id) ON UPDATE CASCADE;


--
-- Name: inventory_item inventory_item_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_item
    ADD CONSTRAINT inventory_item_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id) ON UPDATE CASCADE;


--
-- Name: inventory_item inventory_item_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory_item
    ADD CONSTRAINT inventory_item_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: inventory inventory_responsible_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_responsible_id_fkey FOREIGN KEY (responsible_id) REFERENCES public.login_user(id) ON UPDATE CASCADE;


--
-- Name: inventory inventory_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.branch_station(id) ON UPDATE CASCADE;


--
-- Name: inventory inventory_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: invoice invoice_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: invoice_field invoice_field_layout_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_field
    ADD CONSTRAINT invoice_field_layout_id_fkey FOREIGN KEY (layout_id) REFERENCES public.invoice_layout(id) ON UPDATE CASCADE;


--
-- Name: invoice_field invoice_field_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_field
    ADD CONSTRAINT invoice_field_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: invoice_item_cofins invoice_item_cofins_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_item_cofins
    ADD CONSTRAINT invoice_item_cofins_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: invoice_item_icms invoice_item_icms_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_item_icms
    ADD CONSTRAINT invoice_item_icms_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: invoice_item_ipi invoice_item_ipi_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_item_ipi
    ADD CONSTRAINT invoice_item_ipi_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: invoice_item_pis invoice_item_pis_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_item_pis
    ADD CONSTRAINT invoice_item_pis_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: invoice_layout invoice_layout_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_layout
    ADD CONSTRAINT invoice_layout_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: invoice_printer invoice_printer_layout_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_printer
    ADD CONSTRAINT invoice_printer_layout_id_fkey FOREIGN KEY (layout_id) REFERENCES public.invoice_layout(id) ON UPDATE CASCADE;


--
-- Name: invoice_printer invoice_printer_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_printer
    ADD CONSTRAINT invoice_printer_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.branch_station(id) ON UPDATE CASCADE;


--
-- Name: invoice_printer invoice_printer_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_printer
    ADD CONSTRAINT invoice_printer_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: invoice invoice_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: loan loan_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan
    ADD CONSTRAINT loan_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: loan loan_cancel_responsible_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan
    ADD CONSTRAINT loan_cancel_responsible_id_fkey FOREIGN KEY (cancel_responsible_id) REFERENCES public.login_user(id) ON UPDATE CASCADE;


--
-- Name: loan loan_client_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan
    ADD CONSTRAINT loan_client_category_id_fkey FOREIGN KEY (client_category_id) REFERENCES public.client_category(id) ON UPDATE CASCADE;


--
-- Name: loan loan_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan
    ADD CONSTRAINT loan_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(id) ON UPDATE CASCADE;


--
-- Name: loan loan_invoice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan
    ADD CONSTRAINT loan_invoice_id_fkey FOREIGN KEY (invoice_id) REFERENCES public.invoice(id) ON UPDATE CASCADE;


--
-- Name: loan_item loan_item_batch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan_item
    ADD CONSTRAINT loan_item_batch_id_fkey FOREIGN KEY (batch_id) REFERENCES public.storable_batch(id) ON UPDATE CASCADE;


--
-- Name: loan_item loan_item_cofins_info_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan_item
    ADD CONSTRAINT loan_item_cofins_info_id_fkey FOREIGN KEY (cofins_info_id) REFERENCES public.invoice_item_cofins(id) ON UPDATE CASCADE;


--
-- Name: loan_item loan_item_icms_info_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan_item
    ADD CONSTRAINT loan_item_icms_info_id_fkey FOREIGN KEY (icms_info_id) REFERENCES public.invoice_item_icms(id) ON UPDATE CASCADE;


--
-- Name: loan_item loan_item_ipi_info_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan_item
    ADD CONSTRAINT loan_item_ipi_info_id_fkey FOREIGN KEY (ipi_info_id) REFERENCES public.invoice_item_ipi(id) ON UPDATE CASCADE;


--
-- Name: loan_item loan_item_loan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan_item
    ADD CONSTRAINT loan_item_loan_id_fkey FOREIGN KEY (loan_id) REFERENCES public.loan(id) ON UPDATE CASCADE;


--
-- Name: loan_item loan_item_pis_info_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan_item
    ADD CONSTRAINT loan_item_pis_info_id_fkey FOREIGN KEY (pis_info_id) REFERENCES public.invoice_item_pis(id) ON UPDATE CASCADE;


--
-- Name: loan_item loan_item_sellable_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan_item
    ADD CONSTRAINT loan_item_sellable_id_fkey FOREIGN KEY (sellable_id) REFERENCES public.sellable(id) ON UPDATE CASCADE;


--
-- Name: loan_item loan_item_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan_item
    ADD CONSTRAINT loan_item_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: loan loan_responsible_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan
    ADD CONSTRAINT loan_responsible_id_fkey FOREIGN KEY (responsible_id) REFERENCES public.login_user(id) ON UPDATE CASCADE;


--
-- Name: loan loan_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan
    ADD CONSTRAINT loan_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.branch_station(id) ON UPDATE CASCADE;


--
-- Name: loan loan_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan
    ADD CONSTRAINT loan_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: login_user login_user_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_user
    ADD CONSTRAINT login_user_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.person(id) ON UPDATE CASCADE;


--
-- Name: login_user login_user_profile_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_user
    ADD CONSTRAINT login_user_profile_id_fkey FOREIGN KEY (profile_id) REFERENCES public.user_profile(id) ON UPDATE CASCADE;


--
-- Name: login_user login_user_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_user
    ADD CONSTRAINT login_user_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: message message_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: message message_created_by_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_created_by_id_fkey FOREIGN KEY (created_by_id) REFERENCES public.login_user(id) ON UPDATE CASCADE;


--
-- Name: message message_profile_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_profile_id_fkey FOREIGN KEY (profile_id) REFERENCES public.user_profile(id) ON UPDATE CASCADE;


--
-- Name: message message_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: message message_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.login_user(id) ON UPDATE CASCADE;


--
-- Name: military_data military_data_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.military_data
    ADD CONSTRAINT military_data_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: parameter_data parameter_data_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parameter_data
    ADD CONSTRAINT parameter_data_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: payment payment_attachment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_attachment_id_fkey FOREIGN KEY (attachment_id) REFERENCES public.attachment(id) ON UPDATE CASCADE;


--
-- Name: payment payment_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: payment_category payment_category_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_category
    ADD CONSTRAINT payment_category_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(id) ON UPDATE CASCADE;


--
-- Name: payment payment_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.payment_category(id) ON UPDATE CASCADE;


--
-- Name: payment_category payment_category_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_category
    ADD CONSTRAINT payment_category_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: payment_change_history payment_change_history_payment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_change_history
    ADD CONSTRAINT payment_change_history_payment_id_fkey FOREIGN KEY (payment_id) REFERENCES public.payment(id) ON UPDATE CASCADE;


--
-- Name: payment_change_history payment_change_history_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_change_history
    ADD CONSTRAINT payment_change_history_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: payment_comment payment_comment_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_comment
    ADD CONSTRAINT payment_comment_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.login_user(id) ON UPDATE CASCADE;


--
-- Name: payment_comment payment_comment_payment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_comment
    ADD CONSTRAINT payment_comment_payment_id_fkey FOREIGN KEY (payment_id) REFERENCES public.payment(id) ON UPDATE CASCADE;


--
-- Name: payment_comment payment_comment_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_comment
    ADD CONSTRAINT payment_comment_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: payment_flow_history payment_flow_history_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_flow_history
    ADD CONSTRAINT payment_flow_history_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: payment payment_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.payment_group(id) ON UPDATE CASCADE;


--
-- Name: payment_group payment_group_payer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_group
    ADD CONSTRAINT payment_group_payer_id_fkey FOREIGN KEY (payer_id) REFERENCES public.person(id) ON UPDATE CASCADE;


--
-- Name: payment_group payment_group_recipient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_group
    ADD CONSTRAINT payment_group_recipient_id_fkey FOREIGN KEY (recipient_id) REFERENCES public.person(id) ON UPDATE CASCADE;


--
-- Name: payment_group payment_group_renegotiation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_group
    ADD CONSTRAINT payment_group_renegotiation_id_fkey FOREIGN KEY (renegotiation_id) REFERENCES public.payment_renegotiation(id) ON UPDATE CASCADE;


--
-- Name: payment_group payment_group_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_group
    ADD CONSTRAINT payment_group_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: payment_method payment_method_destination_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_method
    ADD CONSTRAINT payment_method_destination_account_id_fkey FOREIGN KEY (destination_account_id) REFERENCES public.account(id) ON UPDATE CASCADE;


--
-- Name: payment payment_method_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_method_id_fkey FOREIGN KEY (method_id) REFERENCES public.payment_method(id) ON UPDATE CASCADE;


--
-- Name: payment_method payment_method_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_method
    ADD CONSTRAINT payment_method_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: payment_renegotiation payment_renegotiation_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_renegotiation
    ADD CONSTRAINT payment_renegotiation_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: payment_renegotiation payment_renegotiation_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_renegotiation
    ADD CONSTRAINT payment_renegotiation_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(id) ON UPDATE CASCADE;


--
-- Name: payment_renegotiation payment_renegotiation_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_renegotiation
    ADD CONSTRAINT payment_renegotiation_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.payment_group(id) ON UPDATE CASCADE;


--
-- Name: payment_renegotiation payment_renegotiation_responsible_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_renegotiation
    ADD CONSTRAINT payment_renegotiation_responsible_id_fkey FOREIGN KEY (responsible_id) REFERENCES public.login_user(id) ON UPDATE CASCADE;


--
-- Name: payment_renegotiation payment_renegotiation_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_renegotiation
    ADD CONSTRAINT payment_renegotiation_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.branch_station(id) ON UPDATE CASCADE;


--
-- Name: payment_renegotiation payment_renegotiation_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_renegotiation
    ADD CONSTRAINT payment_renegotiation_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: payment payment_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.branch_station(id) ON UPDATE CASCADE;


--
-- Name: payment payment_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: person person_merged_with_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_merged_with_id_fkey FOREIGN KEY (merged_with_id) REFERENCES public.person(id) ON UPDATE CASCADE;


--
-- Name: person person_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: plugin_egg plugin_egg_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plugin_egg
    ADD CONSTRAINT plugin_egg_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: product_attribute product_attribute_attribute_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_attribute
    ADD CONSTRAINT product_attribute_attribute_id_fkey FOREIGN KEY (attribute_id) REFERENCES public.grid_attribute(id) ON UPDATE CASCADE;


--
-- Name: product_attribute product_attribute_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_attribute
    ADD CONSTRAINT product_attribute_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id) ON UPDATE CASCADE;


--
-- Name: product_attribute product_attribute_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_attribute
    ADD CONSTRAINT product_attribute_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: product_branch_override product_branch_override_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_branch_override
    ADD CONSTRAINT product_branch_override_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: product_branch_override product_branch_override_cofins_template_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_branch_override
    ADD CONSTRAINT product_branch_override_cofins_template_id_fkey FOREIGN KEY (cofins_template_id) REFERENCES public.product_cofins_template(id) ON UPDATE CASCADE;


--
-- Name: product_branch_override product_branch_override_icms_template_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_branch_override
    ADD CONSTRAINT product_branch_override_icms_template_id_fkey FOREIGN KEY (icms_template_id) REFERENCES public.product_icms_template(id) ON UPDATE CASCADE;


--
-- Name: product_branch_override product_branch_override_ipi_template_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_branch_override
    ADD CONSTRAINT product_branch_override_ipi_template_id_fkey FOREIGN KEY (ipi_template_id) REFERENCES public.product_ipi_template(id) ON UPDATE CASCADE;


--
-- Name: product_branch_override product_branch_override_pis_template_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_branch_override
    ADD CONSTRAINT product_branch_override_pis_template_id_fkey FOREIGN KEY (pis_template_id) REFERENCES public.product_pis_template(id) ON UPDATE CASCADE;


--
-- Name: product_branch_override product_branch_override_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_branch_override
    ADD CONSTRAINT product_branch_override_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id) ON UPDATE CASCADE;


--
-- Name: product_branch_override product_branch_override_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_branch_override
    ADD CONSTRAINT product_branch_override_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: product product_cofins_template_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_cofins_template_id_fkey FOREIGN KEY (cofins_template_id) REFERENCES public.product_cofins_template(id) ON UPDATE CASCADE;


--
-- Name: product_cofins_template product_cofins_template_product_tax_template_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cofins_template
    ADD CONSTRAINT product_cofins_template_product_tax_template_id_fkey FOREIGN KEY (product_tax_template_id) REFERENCES public.product_tax_template(id) ON UPDATE CASCADE;


--
-- Name: product_cofins_template product_cofins_template_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cofins_template
    ADD CONSTRAINT product_cofins_template_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: product_component product_component_component_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_component
    ADD CONSTRAINT product_component_component_id_fkey FOREIGN KEY (component_id) REFERENCES public.product(id) ON UPDATE CASCADE;


--
-- Name: product_component product_component_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_component
    ADD CONSTRAINT product_component_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id) ON UPDATE CASCADE;


--
-- Name: product_component product_component_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_component
    ADD CONSTRAINT product_component_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: product_history product_history_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_history
    ADD CONSTRAINT product_history_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: product_history product_history_sellable_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_history
    ADD CONSTRAINT product_history_sellable_id_fkey FOREIGN KEY (sellable_id) REFERENCES public.sellable(id) ON UPDATE CASCADE;


--
-- Name: product_history product_history_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_history
    ADD CONSTRAINT product_history_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: product product_icms_template_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_icms_template_id_fkey FOREIGN KEY (icms_template_id) REFERENCES public.product_icms_template(id) ON UPDATE CASCADE;


--
-- Name: product_icms_template product_icms_template_product_tax_template_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_icms_template
    ADD CONSTRAINT product_icms_template_product_tax_template_id_fkey FOREIGN KEY (product_tax_template_id) REFERENCES public.product_tax_template(id) ON UPDATE CASCADE;


--
-- Name: product_icms_template product_icms_template_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_icms_template
    ADD CONSTRAINT product_icms_template_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: product product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_id_fkey FOREIGN KEY (id) REFERENCES public.sellable(id) ON UPDATE CASCADE;


--
-- Name: product product_ipi_template_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_ipi_template_id_fkey FOREIGN KEY (ipi_template_id) REFERENCES public.product_ipi_template(id) ON UPDATE CASCADE;


--
-- Name: product_ipi_template product_ipi_template_product_tax_template_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_ipi_template
    ADD CONSTRAINT product_ipi_template_product_tax_template_id_fkey FOREIGN KEY (product_tax_template_id) REFERENCES public.product_tax_template(id) ON UPDATE CASCADE;


--
-- Name: product_ipi_template product_ipi_template_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_ipi_template
    ADD CONSTRAINT product_ipi_template_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: product product_manufacturer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_manufacturer_id_fkey FOREIGN KEY (manufacturer_id) REFERENCES public.product_manufacturer(id) ON UPDATE CASCADE;


--
-- Name: product_manufacturer product_manufacturer_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_manufacturer
    ADD CONSTRAINT product_manufacturer_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: product_option_map product_option_map_attribute_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option_map
    ADD CONSTRAINT product_option_map_attribute_id_fkey FOREIGN KEY (attribute_id) REFERENCES public.grid_attribute(id) ON UPDATE CASCADE;


--
-- Name: product_option_map product_option_map_option_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option_map
    ADD CONSTRAINT product_option_map_option_id_fkey FOREIGN KEY (option_id) REFERENCES public.grid_option(id) ON UPDATE CASCADE;


--
-- Name: product_option_map product_option_map_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option_map
    ADD CONSTRAINT product_option_map_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id) ON UPDATE CASCADE;


--
-- Name: product_option_map product_option_map_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_option_map
    ADD CONSTRAINT product_option_map_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: product product_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.product(id) ON UPDATE CASCADE;


--
-- Name: product product_pis_template_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pis_template_id_fkey FOREIGN KEY (pis_template_id) REFERENCES public.product_pis_template(id) ON UPDATE CASCADE;


--
-- Name: product_pis_template product_pis_template_product_tax_template_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_pis_template
    ADD CONSTRAINT product_pis_template_product_tax_template_id_fkey FOREIGN KEY (product_tax_template_id) REFERENCES public.product_tax_template(id) ON UPDATE CASCADE;


--
-- Name: product_pis_template product_pis_template_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_pis_template
    ADD CONSTRAINT product_pis_template_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: product_quality_test product_quality_test_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_quality_test
    ADD CONSTRAINT product_quality_test_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id) ON UPDATE CASCADE;


--
-- Name: product_quality_test product_quality_test_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_quality_test
    ADD CONSTRAINT product_quality_test_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: product_stock_item product_stock_item_batch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_stock_item
    ADD CONSTRAINT product_stock_item_batch_id_fkey FOREIGN KEY (batch_id) REFERENCES public.storable_batch(id) ON UPDATE CASCADE;


--
-- Name: product_stock_item product_stock_item_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_stock_item
    ADD CONSTRAINT product_stock_item_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: product_stock_item product_stock_item_storable_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_stock_item
    ADD CONSTRAINT product_stock_item_storable_id_fkey FOREIGN KEY (storable_id) REFERENCES public.storable(id) ON UPDATE CASCADE;


--
-- Name: product_stock_item product_stock_item_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_stock_item
    ADD CONSTRAINT product_stock_item_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: product_supplier_info product_supplier_info_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_supplier_info
    ADD CONSTRAINT product_supplier_info_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: product_supplier_info product_supplier_info_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_supplier_info
    ADD CONSTRAINT product_supplier_info_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id) ON UPDATE CASCADE;


--
-- Name: product_supplier_info product_supplier_info_supplier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_supplier_info
    ADD CONSTRAINT product_supplier_info_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES public.supplier(id) ON UPDATE CASCADE;


--
-- Name: product_supplier_info product_supplier_info_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_supplier_info
    ADD CONSTRAINT product_supplier_info_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: product_tax_template product_tax_template_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_tax_template
    ADD CONSTRAINT product_tax_template_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: product product_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: production_item production_item_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_item
    ADD CONSTRAINT production_item_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.production_order(id) ON UPDATE CASCADE;


--
-- Name: production_item production_item_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_item
    ADD CONSTRAINT production_item_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id) ON UPDATE CASCADE;


--
-- Name: production_item_quality_result production_item_quality_result_produced_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_item_quality_result
    ADD CONSTRAINT production_item_quality_result_produced_item_id_fkey FOREIGN KEY (produced_item_id) REFERENCES public.production_produced_item(id) ON UPDATE CASCADE;


--
-- Name: production_item_quality_result production_item_quality_result_quality_test_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_item_quality_result
    ADD CONSTRAINT production_item_quality_result_quality_test_id_fkey FOREIGN KEY (quality_test_id) REFERENCES public.product_quality_test(id) ON UPDATE CASCADE;


--
-- Name: production_item_quality_result production_item_quality_result_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_item_quality_result
    ADD CONSTRAINT production_item_quality_result_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: production_item_quality_result production_item_quality_result_tested_by_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_item_quality_result
    ADD CONSTRAINT production_item_quality_result_tested_by_id_fkey FOREIGN KEY (tested_by_id) REFERENCES public.login_user(id) ON UPDATE CASCADE;


--
-- Name: production_item production_item_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_item
    ADD CONSTRAINT production_item_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: production_material production_material_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_material
    ADD CONSTRAINT production_material_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.production_order(id) ON UPDATE CASCADE;


--
-- Name: production_material production_material_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_material
    ADD CONSTRAINT production_material_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id) ON UPDATE CASCADE;


--
-- Name: production_material production_material_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_material
    ADD CONSTRAINT production_material_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: production_order production_order_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_order
    ADD CONSTRAINT production_order_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: production_order production_order_responsible_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_order
    ADD CONSTRAINT production_order_responsible_id_fkey FOREIGN KEY (responsible_id) REFERENCES public.employee(id) ON UPDATE CASCADE;


--
-- Name: production_order production_order_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_order
    ADD CONSTRAINT production_order_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.branch_station(id) ON UPDATE CASCADE;


--
-- Name: production_order production_order_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_order
    ADD CONSTRAINT production_order_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: production_produced_item production_produced_item_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_produced_item
    ADD CONSTRAINT production_produced_item_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.production_order(id) ON UPDATE CASCADE;


--
-- Name: production_produced_item production_produced_item_produced_by_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_produced_item
    ADD CONSTRAINT production_produced_item_produced_by_id_fkey FOREIGN KEY (produced_by_id) REFERENCES public.login_user(id) ON UPDATE CASCADE;


--
-- Name: production_produced_item production_produced_item_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_produced_item
    ADD CONSTRAINT production_produced_item_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id) ON UPDATE CASCADE;


--
-- Name: production_produced_item production_produced_item_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_produced_item
    ADD CONSTRAINT production_produced_item_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: production_service production_service_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_service
    ADD CONSTRAINT production_service_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.production_order(id) ON UPDATE CASCADE;


--
-- Name: production_service production_service_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_service
    ADD CONSTRAINT production_service_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id) ON UPDATE CASCADE;


--
-- Name: production_service production_service_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_service
    ADD CONSTRAINT production_service_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: profile_settings profile_settings_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_settings
    ADD CONSTRAINT profile_settings_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: profile_settings profile_settings_user_profile_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_settings
    ADD CONSTRAINT profile_settings_user_profile_id_fkey FOREIGN KEY (user_profile_id) REFERENCES public.user_profile(id) ON UPDATE CASCADE;


--
-- Name: purchase_item purchase_item_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_item
    ADD CONSTRAINT purchase_item_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.purchase_order(id) ON UPDATE CASCADE;


--
-- Name: purchase_item purchase_item_parent_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_item
    ADD CONSTRAINT purchase_item_parent_item_id_fkey FOREIGN KEY (parent_item_id) REFERENCES public.purchase_item(id) ON UPDATE CASCADE;


--
-- Name: purchase_item purchase_item_sellable_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_item
    ADD CONSTRAINT purchase_item_sellable_id_fkey FOREIGN KEY (sellable_id) REFERENCES public.sellable(id) ON UPDATE CASCADE;


--
-- Name: purchase_item purchase_item_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_item
    ADD CONSTRAINT purchase_item_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: purchase_order purchase_order_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_order
    ADD CONSTRAINT purchase_order_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: purchase_order purchase_order_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_order
    ADD CONSTRAINT purchase_order_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.payment_group(id) ON UPDATE CASCADE;


--
-- Name: purchase_order purchase_order_responsible_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_order
    ADD CONSTRAINT purchase_order_responsible_id_fkey FOREIGN KEY (responsible_id) REFERENCES public.login_user(id) ON UPDATE CASCADE;


--
-- Name: purchase_order purchase_order_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_order
    ADD CONSTRAINT purchase_order_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.branch_station(id) ON UPDATE CASCADE;


--
-- Name: purchase_order purchase_order_supplier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_order
    ADD CONSTRAINT purchase_order_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES public.supplier(id) ON UPDATE CASCADE;


--
-- Name: purchase_order purchase_order_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_order
    ADD CONSTRAINT purchase_order_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: purchase_order purchase_order_transporter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_order
    ADD CONSTRAINT purchase_order_transporter_id_fkey FOREIGN KEY (transporter_id) REFERENCES public.transporter(id) ON UPDATE CASCADE;


--
-- Name: purchase_order purchase_order_work_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_order
    ADD CONSTRAINT purchase_order_work_order_id_fkey FOREIGN KEY (work_order_id) REFERENCES public.work_order(id) ON UPDATE CASCADE;


--
-- Name: purchase_receiving_map purchase_receiving_map_purchase_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_receiving_map
    ADD CONSTRAINT purchase_receiving_map_purchase_id_fkey FOREIGN KEY (purchase_id) REFERENCES public.purchase_order(id) ON UPDATE CASCADE;


--
-- Name: purchase_receiving_map purchase_receiving_map_receiving_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_receiving_map
    ADD CONSTRAINT purchase_receiving_map_receiving_id_fkey FOREIGN KEY (receiving_id) REFERENCES public.receiving_order(id) ON UPDATE CASCADE;


--
-- Name: purchase_receiving_map purchase_receiving_map_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_receiving_map
    ADD CONSTRAINT purchase_receiving_map_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: quotation quotation_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quotation
    ADD CONSTRAINT quotation_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: quotation quotation_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quotation
    ADD CONSTRAINT quotation_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.quote_group(id) ON UPDATE CASCADE;


--
-- Name: quotation quotation_purchase_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quotation
    ADD CONSTRAINT quotation_purchase_id_fkey FOREIGN KEY (purchase_id) REFERENCES public.purchase_order(id) ON UPDATE CASCADE;


--
-- Name: quotation quotation_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quotation
    ADD CONSTRAINT quotation_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.branch_station(id) ON UPDATE CASCADE;


--
-- Name: quotation quotation_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quotation
    ADD CONSTRAINT quotation_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: quote_group quote_group_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quote_group
    ADD CONSTRAINT quote_group_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: quote_group quote_group_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quote_group
    ADD CONSTRAINT quote_group_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.branch_station(id) ON UPDATE CASCADE;


--
-- Name: quote_group quote_group_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quote_group
    ADD CONSTRAINT quote_group_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: receiving_invoice receiving_invoice_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receiving_invoice
    ADD CONSTRAINT receiving_invoice_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: receiving_invoice receiving_invoice_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receiving_invoice
    ADD CONSTRAINT receiving_invoice_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.payment_group(id) ON UPDATE CASCADE;


--
-- Name: receiving_invoice receiving_invoice_responsible_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receiving_invoice
    ADD CONSTRAINT receiving_invoice_responsible_id_fkey FOREIGN KEY (responsible_id) REFERENCES public.login_user(id) ON UPDATE CASCADE;


--
-- Name: receiving_invoice receiving_invoice_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receiving_invoice
    ADD CONSTRAINT receiving_invoice_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.branch_station(id) ON UPDATE CASCADE;


--
-- Name: receiving_invoice receiving_invoice_supplier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receiving_invoice
    ADD CONSTRAINT receiving_invoice_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES public.supplier(id) ON UPDATE CASCADE;


--
-- Name: receiving_invoice receiving_invoice_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receiving_invoice
    ADD CONSTRAINT receiving_invoice_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: receiving_invoice receiving_invoice_transporter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receiving_invoice
    ADD CONSTRAINT receiving_invoice_transporter_id_fkey FOREIGN KEY (transporter_id) REFERENCES public.transporter(id) ON UPDATE CASCADE;


--
-- Name: receiving_order receiving_order_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receiving_order
    ADD CONSTRAINT receiving_order_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: receiving_order receiving_order_cfop_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receiving_order
    ADD CONSTRAINT receiving_order_cfop_id_fkey FOREIGN KEY (cfop_id) REFERENCES public.cfop_data(id) ON UPDATE CASCADE;


--
-- Name: receiving_order_item receiving_order_item_batch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receiving_order_item
    ADD CONSTRAINT receiving_order_item_batch_id_fkey FOREIGN KEY (batch_id) REFERENCES public.storable_batch(id) ON UPDATE CASCADE;


--
-- Name: receiving_order_item receiving_order_item_parent_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receiving_order_item
    ADD CONSTRAINT receiving_order_item_parent_item_id_fkey FOREIGN KEY (parent_item_id) REFERENCES public.receiving_order_item(id) ON UPDATE CASCADE;


--
-- Name: receiving_order_item receiving_order_item_purchase_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receiving_order_item
    ADD CONSTRAINT receiving_order_item_purchase_item_id_fkey FOREIGN KEY (purchase_item_id) REFERENCES public.purchase_item(id) ON UPDATE CASCADE;


--
-- Name: receiving_order_item receiving_order_item_receiving_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receiving_order_item
    ADD CONSTRAINT receiving_order_item_receiving_order_id_fkey FOREIGN KEY (receiving_order_id) REFERENCES public.receiving_order(id) ON UPDATE CASCADE;


--
-- Name: receiving_order_item receiving_order_item_sellable_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receiving_order_item
    ADD CONSTRAINT receiving_order_item_sellable_id_fkey FOREIGN KEY (sellable_id) REFERENCES public.sellable(id) ON UPDATE CASCADE;


--
-- Name: receiving_order_item receiving_order_item_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receiving_order_item
    ADD CONSTRAINT receiving_order_item_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: receiving_order receiving_order_receiving_invoice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receiving_order
    ADD CONSTRAINT receiving_order_receiving_invoice_id_fkey FOREIGN KEY (receiving_invoice_id) REFERENCES public.receiving_invoice(id) ON UPDATE CASCADE;


--
-- Name: receiving_order receiving_order_responsible_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receiving_order
    ADD CONSTRAINT receiving_order_responsible_id_fkey FOREIGN KEY (responsible_id) REFERENCES public.login_user(id) ON UPDATE CASCADE;


--
-- Name: receiving_order receiving_order_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receiving_order
    ADD CONSTRAINT receiving_order_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.branch_station(id) ON UPDATE CASCADE;


--
-- Name: receiving_order receiving_order_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receiving_order
    ADD CONSTRAINT receiving_order_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: returned_sale returned_sale_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returned_sale
    ADD CONSTRAINT returned_sale_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: returned_sale returned_sale_confirm_responsible_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returned_sale
    ADD CONSTRAINT returned_sale_confirm_responsible_id_fkey FOREIGN KEY (confirm_responsible_id) REFERENCES public.login_user(id) ON UPDATE CASCADE;


--
-- Name: returned_sale returned_sale_invoice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returned_sale
    ADD CONSTRAINT returned_sale_invoice_id_fkey FOREIGN KEY (invoice_id) REFERENCES public.invoice(id) ON UPDATE CASCADE;


--
-- Name: returned_sale_item returned_sale_item_batch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returned_sale_item
    ADD CONSTRAINT returned_sale_item_batch_id_fkey FOREIGN KEY (batch_id) REFERENCES public.storable_batch(id) ON UPDATE CASCADE;


--
-- Name: returned_sale_item returned_sale_item_cofins_info_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returned_sale_item
    ADD CONSTRAINT returned_sale_item_cofins_info_id_fkey FOREIGN KEY (cofins_info_id) REFERENCES public.invoice_item_cofins(id) ON UPDATE CASCADE;


--
-- Name: returned_sale_item returned_sale_item_icms_info_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returned_sale_item
    ADD CONSTRAINT returned_sale_item_icms_info_id_fkey FOREIGN KEY (icms_info_id) REFERENCES public.invoice_item_icms(id) ON UPDATE CASCADE;


--
-- Name: returned_sale_item returned_sale_item_ipi_info_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returned_sale_item
    ADD CONSTRAINT returned_sale_item_ipi_info_id_fkey FOREIGN KEY (ipi_info_id) REFERENCES public.invoice_item_ipi(id) ON UPDATE CASCADE;


--
-- Name: returned_sale_item returned_sale_item_parent_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returned_sale_item
    ADD CONSTRAINT returned_sale_item_parent_item_id_fkey FOREIGN KEY (parent_item_id) REFERENCES public.returned_sale_item(id) ON UPDATE CASCADE;


--
-- Name: returned_sale_item returned_sale_item_pis_info_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returned_sale_item
    ADD CONSTRAINT returned_sale_item_pis_info_id_fkey FOREIGN KEY (pis_info_id) REFERENCES public.invoice_item_pis(id) ON UPDATE CASCADE;


--
-- Name: returned_sale_item returned_sale_item_returned_sale_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returned_sale_item
    ADD CONSTRAINT returned_sale_item_returned_sale_id_fkey FOREIGN KEY (returned_sale_id) REFERENCES public.returned_sale(id) ON UPDATE CASCADE;


--
-- Name: returned_sale_item returned_sale_item_sale_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returned_sale_item
    ADD CONSTRAINT returned_sale_item_sale_item_id_fkey FOREIGN KEY (sale_item_id) REFERENCES public.sale_item(id) ON UPDATE CASCADE;


--
-- Name: returned_sale_item returned_sale_item_sellable_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returned_sale_item
    ADD CONSTRAINT returned_sale_item_sellable_id_fkey FOREIGN KEY (sellable_id) REFERENCES public.sellable(id) ON UPDATE CASCADE;


--
-- Name: returned_sale_item returned_sale_item_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returned_sale_item
    ADD CONSTRAINT returned_sale_item_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: returned_sale returned_sale_new_sale_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returned_sale
    ADD CONSTRAINT returned_sale_new_sale_id_fkey FOREIGN KEY (new_sale_id) REFERENCES public.sale(id) ON UPDATE CASCADE;


--
-- Name: returned_sale returned_sale_responsible_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returned_sale
    ADD CONSTRAINT returned_sale_responsible_id_fkey FOREIGN KEY (responsible_id) REFERENCES public.login_user(id) ON UPDATE CASCADE;


--
-- Name: returned_sale returned_sale_sale_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returned_sale
    ADD CONSTRAINT returned_sale_sale_id_fkey FOREIGN KEY (sale_id) REFERENCES public.sale(id) ON UPDATE CASCADE;


--
-- Name: returned_sale returned_sale_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returned_sale
    ADD CONSTRAINT returned_sale_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.branch_station(id) ON UPDATE CASCADE;


--
-- Name: returned_sale returned_sale_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returned_sale
    ADD CONSTRAINT returned_sale_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: returned_sale returned_sale_undo_responsible_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.returned_sale
    ADD CONSTRAINT returned_sale_undo_responsible_id_fkey FOREIGN KEY (undo_responsible_id) REFERENCES public.login_user(id) ON UPDATE CASCADE;


--
-- Name: sale sale_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: sale sale_cancel_responsible_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_cancel_responsible_id_fkey FOREIGN KEY (cancel_responsible_id) REFERENCES public.login_user(id) ON UPDATE CASCADE;


--
-- Name: sale sale_cfop_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_cfop_id_fkey FOREIGN KEY (cfop_id) REFERENCES public.cfop_data(id) ON UPDATE CASCADE;


--
-- Name: sale sale_client_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_client_category_id_fkey FOREIGN KEY (client_category_id) REFERENCES public.client_category(id) ON UPDATE CASCADE;


--
-- Name: sale sale_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(id) ON UPDATE CASCADE;


--
-- Name: sale_comment sale_comment_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_comment
    ADD CONSTRAINT sale_comment_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.login_user(id) ON UPDATE CASCADE;


--
-- Name: sale_comment sale_comment_sale_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_comment
    ADD CONSTRAINT sale_comment_sale_id_fkey FOREIGN KEY (sale_id) REFERENCES public.sale(id) ON UPDATE CASCADE;


--
-- Name: sale_comment sale_comment_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_comment
    ADD CONSTRAINT sale_comment_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: sale_context sale_context_context_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_context
    ADD CONSTRAINT sale_context_context_id_fkey FOREIGN KEY (context_id) REFERENCES public.context(id) ON UPDATE CASCADE;


--
-- Name: sale_context sale_context_sale_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_context
    ADD CONSTRAINT sale_context_sale_id_fkey FOREIGN KEY (sale_id) REFERENCES public.sale(id) ON UPDATE CASCADE;


--
-- Name: sale_context sale_context_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_context
    ADD CONSTRAINT sale_context_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: sale sale_cost_center_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_cost_center_id_fkey FOREIGN KEY (cost_center_id) REFERENCES public.cost_center(id) ON UPDATE CASCADE;


--
-- Name: sale sale_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.payment_group(id) ON UPDATE CASCADE;


--
-- Name: sale sale_invoice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_invoice_id_fkey FOREIGN KEY (invoice_id) REFERENCES public.invoice(id) ON UPDATE CASCADE;


--
-- Name: sale_item sale_item_batch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_item
    ADD CONSTRAINT sale_item_batch_id_fkey FOREIGN KEY (batch_id) REFERENCES public.storable_batch(id) ON UPDATE CASCADE;


--
-- Name: sale_item sale_item_cfop_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_item
    ADD CONSTRAINT sale_item_cfop_id_fkey FOREIGN KEY (cfop_id) REFERENCES public.cfop_data(id) ON UPDATE CASCADE;


--
-- Name: sale_item sale_item_cofins_info_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_item
    ADD CONSTRAINT sale_item_cofins_info_id_fkey FOREIGN KEY (cofins_info_id) REFERENCES public.invoice_item_cofins(id) ON UPDATE CASCADE;


--
-- Name: sale_item sale_item_delivery_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_item
    ADD CONSTRAINT sale_item_delivery_id_fkey FOREIGN KEY (delivery_id) REFERENCES public.delivery(id) ON UPDATE CASCADE;


--
-- Name: sale_item sale_item_icms_info_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_item
    ADD CONSTRAINT sale_item_icms_info_id_fkey FOREIGN KEY (icms_info_id) REFERENCES public.invoice_item_icms(id) ON UPDATE CASCADE;


--
-- Name: sale_item sale_item_ipi_info_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_item
    ADD CONSTRAINT sale_item_ipi_info_id_fkey FOREIGN KEY (ipi_info_id) REFERENCES public.invoice_item_ipi(id) ON UPDATE CASCADE;


--
-- Name: sale_item sale_item_parent_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_item
    ADD CONSTRAINT sale_item_parent_item_id_fkey FOREIGN KEY (parent_item_id) REFERENCES public.sale_item(id) ON UPDATE CASCADE;


--
-- Name: sale_item sale_item_pis_info_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_item
    ADD CONSTRAINT sale_item_pis_info_id_fkey FOREIGN KEY (pis_info_id) REFERENCES public.invoice_item_pis(id) ON UPDATE CASCADE;


--
-- Name: sale_item sale_item_sale_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_item
    ADD CONSTRAINT sale_item_sale_id_fkey FOREIGN KEY (sale_id) REFERENCES public.sale(id) ON UPDATE CASCADE;


--
-- Name: sale_item sale_item_sellable_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_item
    ADD CONSTRAINT sale_item_sellable_id_fkey FOREIGN KEY (sellable_id) REFERENCES public.sellable(id) ON UPDATE CASCADE;


--
-- Name: sale_item sale_item_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_item
    ADD CONSTRAINT sale_item_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: sale sale_sale_token_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_sale_token_id_fkey FOREIGN KEY (sale_token_id) REFERENCES public.sale_token(id);


--
-- Name: sale sale_salesperson_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_salesperson_id_fkey FOREIGN KEY (salesperson_id) REFERENCES public.sales_person(id) ON UPDATE CASCADE;


--
-- Name: sale sale_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.branch_station(id) ON UPDATE CASCADE;


--
-- Name: sale sale_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: sale_token sale_token_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_token
    ADD CONSTRAINT sale_token_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: sale_token sale_token_sale_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_token
    ADD CONSTRAINT sale_token_sale_id_fkey FOREIGN KEY (sale_id) REFERENCES public.sale(id) ON UPDATE CASCADE;


--
-- Name: sale_token sale_token_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_token
    ADD CONSTRAINT sale_token_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: sale sale_transporter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_transporter_id_fkey FOREIGN KEY (transporter_id) REFERENCES public.transporter(id) ON UPDATE CASCADE;


--
-- Name: sales_person sales_person_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_person
    ADD CONSTRAINT sales_person_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.person(id) ON UPDATE CASCADE;


--
-- Name: sales_person sales_person_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_person
    ADD CONSTRAINT sales_person_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: sellable_branch_override sellable_branch_override_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellable_branch_override
    ADD CONSTRAINT sellable_branch_override_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: sellable_branch_override sellable_branch_override_default_sale_cfop_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellable_branch_override
    ADD CONSTRAINT sellable_branch_override_default_sale_cfop_id_fkey FOREIGN KEY (default_sale_cfop_id) REFERENCES public.cfop_data(id) ON UPDATE CASCADE;


--
-- Name: sellable_branch_override sellable_branch_override_sellable_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellable_branch_override
    ADD CONSTRAINT sellable_branch_override_sellable_id_fkey FOREIGN KEY (sellable_id) REFERENCES public.sellable(id) ON UPDATE CASCADE;


--
-- Name: sellable_branch_override sellable_branch_override_tax_constant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellable_branch_override
    ADD CONSTRAINT sellable_branch_override_tax_constant_id_fkey FOREIGN KEY (tax_constant_id) REFERENCES public.sellable_tax_constant(id) ON UPDATE CASCADE;


--
-- Name: sellable_branch_override sellable_branch_override_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellable_branch_override
    ADD CONSTRAINT sellable_branch_override_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: sellable_category sellable_category_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellable_category
    ADD CONSTRAINT sellable_category_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.sellable_category(id) ON UPDATE CASCADE;


--
-- Name: sellable sellable_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellable
    ADD CONSTRAINT sellable_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.sellable_category(id) ON UPDATE CASCADE;


--
-- Name: sellable_category sellable_category_tax_constant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellable_category
    ADD CONSTRAINT sellable_category_tax_constant_id_fkey FOREIGN KEY (tax_constant_id) REFERENCES public.sellable_tax_constant(id) ON UPDATE CASCADE;


--
-- Name: sellable_category sellable_category_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellable_category
    ADD CONSTRAINT sellable_category_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: sellable sellable_default_sale_cfop_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellable
    ADD CONSTRAINT sellable_default_sale_cfop_id_fkey FOREIGN KEY (default_sale_cfop_id) REFERENCES public.cfop_data(id) ON UPDATE CASCADE;


--
-- Name: sellable sellable_tax_constant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellable
    ADD CONSTRAINT sellable_tax_constant_id_fkey FOREIGN KEY (tax_constant_id) REFERENCES public.sellable_tax_constant(id) ON UPDATE CASCADE;


--
-- Name: sellable_tax_constant sellable_tax_constant_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellable_tax_constant
    ADD CONSTRAINT sellable_tax_constant_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: sellable sellable_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellable
    ADD CONSTRAINT sellable_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: sellable sellable_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellable
    ADD CONSTRAINT sellable_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.sellable_unit(id) ON UPDATE CASCADE;


--
-- Name: sellable_unit sellable_unit_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellable_unit
    ADD CONSTRAINT sellable_unit_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: service_branch_override service_branch_override_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_branch_override
    ADD CONSTRAINT service_branch_override_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: service_branch_override service_branch_override_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_branch_override
    ADD CONSTRAINT service_branch_override_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id) ON UPDATE CASCADE;


--
-- Name: service_branch_override service_branch_override_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_branch_override
    ADD CONSTRAINT service_branch_override_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: service service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_id_fkey FOREIGN KEY (id) REFERENCES public.sellable(id) ON UPDATE CASCADE;


--
-- Name: service service_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: station_type station_type_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station_type
    ADD CONSTRAINT station_type_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: stock_decrease stock_decrease_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_decrease
    ADD CONSTRAINT stock_decrease_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: stock_decrease stock_decrease_cancel_responsible_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_decrease
    ADD CONSTRAINT stock_decrease_cancel_responsible_id_fkey FOREIGN KEY (cancel_responsible_id) REFERENCES public.login_user(id) ON UPDATE CASCADE;


--
-- Name: stock_decrease stock_decrease_cfop_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_decrease
    ADD CONSTRAINT stock_decrease_cfop_id_fkey FOREIGN KEY (cfop_id) REFERENCES public.cfop_data(id) ON UPDATE CASCADE;


--
-- Name: stock_decrease stock_decrease_cost_center_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_decrease
    ADD CONSTRAINT stock_decrease_cost_center_id_fkey FOREIGN KEY (cost_center_id) REFERENCES public.cost_center(id) ON UPDATE CASCADE;


--
-- Name: stock_decrease stock_decrease_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_decrease
    ADD CONSTRAINT stock_decrease_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.payment_group(id) ON UPDATE CASCADE;


--
-- Name: stock_decrease stock_decrease_invoice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_decrease
    ADD CONSTRAINT stock_decrease_invoice_id_fkey FOREIGN KEY (invoice_id) REFERENCES public.invoice(id) ON UPDATE CASCADE;


--
-- Name: stock_decrease_item stock_decrease_item_batch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_decrease_item
    ADD CONSTRAINT stock_decrease_item_batch_id_fkey FOREIGN KEY (batch_id) REFERENCES public.storable_batch(id) ON UPDATE CASCADE;


--
-- Name: stock_decrease_item stock_decrease_item_cofins_info_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_decrease_item
    ADD CONSTRAINT stock_decrease_item_cofins_info_id_fkey FOREIGN KEY (cofins_info_id) REFERENCES public.invoice_item_cofins(id) ON UPDATE CASCADE;


--
-- Name: stock_decrease_item stock_decrease_item_delivery_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_decrease_item
    ADD CONSTRAINT stock_decrease_item_delivery_id_fkey FOREIGN KEY (delivery_id) REFERENCES public.delivery(id) ON UPDATE CASCADE;


--
-- Name: stock_decrease_item stock_decrease_item_icms_info_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_decrease_item
    ADD CONSTRAINT stock_decrease_item_icms_info_id_fkey FOREIGN KEY (icms_info_id) REFERENCES public.invoice_item_icms(id) ON UPDATE CASCADE;


--
-- Name: stock_decrease_item stock_decrease_item_ipi_info_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_decrease_item
    ADD CONSTRAINT stock_decrease_item_ipi_info_id_fkey FOREIGN KEY (ipi_info_id) REFERENCES public.invoice_item_ipi(id) ON UPDATE CASCADE;


--
-- Name: stock_decrease_item stock_decrease_item_pis_info_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_decrease_item
    ADD CONSTRAINT stock_decrease_item_pis_info_id_fkey FOREIGN KEY (pis_info_id) REFERENCES public.invoice_item_pis(id) ON UPDATE CASCADE;


--
-- Name: stock_decrease_item stock_decrease_item_receiving_order_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_decrease_item
    ADD CONSTRAINT stock_decrease_item_receiving_order_item_id_fkey FOREIGN KEY (receiving_order_item_id) REFERENCES public.receiving_order_item(id) ON UPDATE CASCADE;


--
-- Name: stock_decrease_item stock_decrease_item_sellable_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_decrease_item
    ADD CONSTRAINT stock_decrease_item_sellable_id_fkey FOREIGN KEY (sellable_id) REFERENCES public.sellable(id) ON UPDATE CASCADE;


--
-- Name: stock_decrease_item stock_decrease_item_stock_decrease_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_decrease_item
    ADD CONSTRAINT stock_decrease_item_stock_decrease_id_fkey FOREIGN KEY (stock_decrease_id) REFERENCES public.stock_decrease(id) ON UPDATE CASCADE;


--
-- Name: stock_decrease_item stock_decrease_item_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_decrease_item
    ADD CONSTRAINT stock_decrease_item_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: stock_decrease stock_decrease_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_decrease
    ADD CONSTRAINT stock_decrease_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.person(id) ON UPDATE CASCADE;


--
-- Name: stock_decrease stock_decrease_receiving_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_decrease
    ADD CONSTRAINT stock_decrease_receiving_order_id_fkey FOREIGN KEY (receiving_order_id) REFERENCES public.receiving_order(id) ON UPDATE CASCADE;


--
-- Name: stock_decrease stock_decrease_removed_by_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_decrease
    ADD CONSTRAINT stock_decrease_removed_by_id_fkey FOREIGN KEY (removed_by_id) REFERENCES public.employee(id) ON UPDATE CASCADE;


--
-- Name: stock_decrease stock_decrease_responsible_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_decrease
    ADD CONSTRAINT stock_decrease_responsible_id_fkey FOREIGN KEY (responsible_id) REFERENCES public.login_user(id) ON UPDATE CASCADE;


--
-- Name: stock_decrease stock_decrease_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_decrease
    ADD CONSTRAINT stock_decrease_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.branch_station(id) ON UPDATE CASCADE;


--
-- Name: stock_decrease stock_decrease_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_decrease
    ADD CONSTRAINT stock_decrease_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: stock_transaction_history stock_transaction_history_batch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_transaction_history
    ADD CONSTRAINT stock_transaction_history_batch_id_fkey FOREIGN KEY (batch_id) REFERENCES public.storable_batch(id) ON UPDATE CASCADE;


--
-- Name: stock_transaction_history stock_transaction_history_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_transaction_history
    ADD CONSTRAINT stock_transaction_history_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: stock_transaction_history stock_transaction_history_responsible_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_transaction_history
    ADD CONSTRAINT stock_transaction_history_responsible_id_fkey FOREIGN KEY (responsible_id) REFERENCES public.login_user(id) ON UPDATE CASCADE;


--
-- Name: stock_transaction_history stock_transaction_history_storable_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_transaction_history
    ADD CONSTRAINT stock_transaction_history_storable_id_fkey FOREIGN KEY (storable_id) REFERENCES public.storable(id) ON UPDATE CASCADE;


--
-- Name: stock_transaction_history stock_transaction_history_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_transaction_history
    ADD CONSTRAINT stock_transaction_history_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: storable_batch storable_batch_storable_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storable_batch
    ADD CONSTRAINT storable_batch_storable_id_fkey FOREIGN KEY (storable_id) REFERENCES public.storable(id) ON UPDATE CASCADE;


--
-- Name: storable_batch storable_batch_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storable_batch
    ADD CONSTRAINT storable_batch_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: storable_branch_override storable_branch_override_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storable_branch_override
    ADD CONSTRAINT storable_branch_override_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: storable_branch_override storable_branch_override_storable_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storable_branch_override
    ADD CONSTRAINT storable_branch_override_storable_id_fkey FOREIGN KEY (storable_id) REFERENCES public.storable(id) ON UPDATE CASCADE;


--
-- Name: storable_branch_override storable_branch_override_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storable_branch_override
    ADD CONSTRAINT storable_branch_override_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: storable storable_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storable
    ADD CONSTRAINT storable_id_fkey FOREIGN KEY (id) REFERENCES public.product(id) ON UPDATE CASCADE;


--
-- Name: storable storable_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storable
    ADD CONSTRAINT storable_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: supplier supplier_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.person(id) ON UPDATE CASCADE;


--
-- Name: supplier supplier_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: till till_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.till
    ADD CONSTRAINT till_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: till_entry till_entry_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.till_entry
    ADD CONSTRAINT till_entry_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: till_entry till_entry_payment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.till_entry
    ADD CONSTRAINT till_entry_payment_id_fkey FOREIGN KEY (payment_id) REFERENCES public.payment(id) ON UPDATE CASCADE;


--
-- Name: till_entry till_entry_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.till_entry
    ADD CONSTRAINT till_entry_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.branch_station(id) ON UPDATE CASCADE;


--
-- Name: till_entry till_entry_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.till_entry
    ADD CONSTRAINT till_entry_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: till_entry till_entry_till_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.till_entry
    ADD CONSTRAINT till_entry_till_id_fkey FOREIGN KEY (till_id) REFERENCES public.till(id) ON UPDATE CASCADE;


--
-- Name: till till_responsible_close_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.till
    ADD CONSTRAINT till_responsible_close_id_fkey FOREIGN KEY (responsible_close_id) REFERENCES public.login_user(id) ON UPDATE CASCADE;


--
-- Name: till till_responsible_open_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.till
    ADD CONSTRAINT till_responsible_open_id_fkey FOREIGN KEY (responsible_open_id) REFERENCES public.login_user(id) ON UPDATE CASCADE;


--
-- Name: till till_responsible_verify_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.till
    ADD CONSTRAINT till_responsible_verify_id_fkey FOREIGN KEY (responsible_verify_id) REFERENCES public.login_user(id) ON UPDATE CASCADE;


--
-- Name: till till_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.till
    ADD CONSTRAINT till_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.branch_station(id) ON UPDATE CASCADE;


--
-- Name: till_summary till_summary_method_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.till_summary
    ADD CONSTRAINT till_summary_method_id_fkey FOREIGN KEY (method_id) REFERENCES public.payment_method(id) ON UPDATE CASCADE;


--
-- Name: till_summary till_summary_provider_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.till_summary
    ADD CONSTRAINT till_summary_provider_id_fkey FOREIGN KEY (provider_id) REFERENCES public.credit_provider(id) ON UPDATE CASCADE;


--
-- Name: till_summary till_summary_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.till_summary
    ADD CONSTRAINT till_summary_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: till_summary till_summary_till_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.till_summary
    ADD CONSTRAINT till_summary_till_id_fkey FOREIGN KEY (till_id) REFERENCES public.till(id) ON UPDATE CASCADE;


--
-- Name: till till_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.till
    ADD CONSTRAINT till_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: transfer_order transfer_order_cancel_responsible_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_order
    ADD CONSTRAINT transfer_order_cancel_responsible_id_fkey FOREIGN KEY (cancel_responsible_id) REFERENCES public.employee(id) ON UPDATE CASCADE;


--
-- Name: transfer_order transfer_order_destination_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_order
    ADD CONSTRAINT transfer_order_destination_branch_id_fkey FOREIGN KEY (destination_branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: transfer_order transfer_order_destination_responsible_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_order
    ADD CONSTRAINT transfer_order_destination_responsible_id_fkey FOREIGN KEY (destination_responsible_id) REFERENCES public.employee(id) ON UPDATE CASCADE;


--
-- Name: transfer_order transfer_order_invoice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_order
    ADD CONSTRAINT transfer_order_invoice_id_fkey FOREIGN KEY (invoice_id) REFERENCES public.invoice(id) ON UPDATE CASCADE;


--
-- Name: transfer_order_item transfer_order_item_batch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_order_item
    ADD CONSTRAINT transfer_order_item_batch_id_fkey FOREIGN KEY (batch_id) REFERENCES public.storable_batch(id) ON UPDATE CASCADE;


--
-- Name: transfer_order_item transfer_order_item_cofins_info_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_order_item
    ADD CONSTRAINT transfer_order_item_cofins_info_id_fkey FOREIGN KEY (cofins_info_id) REFERENCES public.invoice_item_cofins(id) ON UPDATE CASCADE;


--
-- Name: transfer_order_item transfer_order_item_icms_info_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_order_item
    ADD CONSTRAINT transfer_order_item_icms_info_id_fkey FOREIGN KEY (icms_info_id) REFERENCES public.invoice_item_icms(id) ON UPDATE CASCADE;


--
-- Name: transfer_order_item transfer_order_item_ipi_info_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_order_item
    ADD CONSTRAINT transfer_order_item_ipi_info_id_fkey FOREIGN KEY (ipi_info_id) REFERENCES public.invoice_item_ipi(id) ON UPDATE CASCADE;


--
-- Name: transfer_order_item transfer_order_item_pis_info_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_order_item
    ADD CONSTRAINT transfer_order_item_pis_info_id_fkey FOREIGN KEY (pis_info_id) REFERENCES public.invoice_item_pis(id) ON UPDATE CASCADE;


--
-- Name: transfer_order_item transfer_order_item_sellable_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_order_item
    ADD CONSTRAINT transfer_order_item_sellable_id_fkey FOREIGN KEY (sellable_id) REFERENCES public.sellable(id) ON UPDATE CASCADE;


--
-- Name: transfer_order_item transfer_order_item_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_order_item
    ADD CONSTRAINT transfer_order_item_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: transfer_order_item transfer_order_item_transfer_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_order_item
    ADD CONSTRAINT transfer_order_item_transfer_order_id_fkey FOREIGN KEY (transfer_order_id) REFERENCES public.transfer_order(id) ON UPDATE CASCADE;


--
-- Name: transfer_order transfer_order_source_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_order
    ADD CONSTRAINT transfer_order_source_branch_id_fkey FOREIGN KEY (source_branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: transfer_order transfer_order_source_responsible_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_order
    ADD CONSTRAINT transfer_order_source_responsible_id_fkey FOREIGN KEY (source_responsible_id) REFERENCES public.employee(id) ON UPDATE CASCADE;


--
-- Name: transfer_order transfer_order_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_order
    ADD CONSTRAINT transfer_order_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.branch_station(id) ON UPDATE CASCADE;


--
-- Name: transfer_order transfer_order_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer_order
    ADD CONSTRAINT transfer_order_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: transporter transporter_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transporter
    ADD CONSTRAINT transporter_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.person(id) ON UPDATE CASCADE;


--
-- Name: transporter transporter_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transporter
    ADD CONSTRAINT transporter_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: ui_field ui_field_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ui_field
    ADD CONSTRAINT ui_field_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: ui_field ui_field_ui_form_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ui_field
    ADD CONSTRAINT ui_field_ui_form_id_fkey FOREIGN KEY (ui_form_id) REFERENCES public.ui_form(id) ON UPDATE CASCADE;


--
-- Name: ui_form ui_form_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ui_form
    ADD CONSTRAINT ui_form_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: user_branch_access user_branch_access_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_branch_access
    ADD CONSTRAINT user_branch_access_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: user_branch_access user_branch_access_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_branch_access
    ADD CONSTRAINT user_branch_access_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: user_branch_access user_branch_access_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_branch_access
    ADD CONSTRAINT user_branch_access_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.login_user(id) ON UPDATE CASCADE;


--
-- Name: user_profile user_profile_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_profile
    ADD CONSTRAINT user_profile_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: voter_data voter_data_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voter_data
    ADD CONSTRAINT voter_data_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: work_order work_order_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order
    ADD CONSTRAINT work_order_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: work_order work_order_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order
    ADD CONSTRAINT work_order_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.work_order_category(id) ON UPDATE CASCADE;


--
-- Name: work_order_category work_order_category_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order_category
    ADD CONSTRAINT work_order_category_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: work_order work_order_check_responsible_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order
    ADD CONSTRAINT work_order_check_responsible_id_fkey FOREIGN KEY (check_responsible_id) REFERENCES public.employee(id) ON UPDATE CASCADE;


--
-- Name: work_order work_order_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order
    ADD CONSTRAINT work_order_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(id) ON UPDATE CASCADE;


--
-- Name: work_order work_order_current_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order
    ADD CONSTRAINT work_order_current_branch_id_fkey FOREIGN KEY (current_branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: work_order work_order_execution_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order
    ADD CONSTRAINT work_order_execution_branch_id_fkey FOREIGN KEY (execution_branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: work_order work_order_execution_responsible_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order
    ADD CONSTRAINT work_order_execution_responsible_id_fkey FOREIGN KEY (execution_responsible_id) REFERENCES public.employee(id) ON UPDATE CASCADE;


--
-- Name: work_order_history work_order_history_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order_history
    ADD CONSTRAINT work_order_history_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: work_order_history work_order_history_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order_history
    ADD CONSTRAINT work_order_history_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.login_user(id) ON UPDATE CASCADE;


--
-- Name: work_order_history work_order_history_work_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order_history
    ADD CONSTRAINT work_order_history_work_order_id_fkey FOREIGN KEY (work_order_id) REFERENCES public.work_order(id) ON UPDATE CASCADE;


--
-- Name: work_order_item work_order_item_batch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order_item
    ADD CONSTRAINT work_order_item_batch_id_fkey FOREIGN KEY (batch_id) REFERENCES public.storable_batch(id) ON UPDATE CASCADE;


--
-- Name: work_order_item work_order_item_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order_item
    ADD CONSTRAINT work_order_item_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.work_order(id) ON UPDATE CASCADE;


--
-- Name: work_order_item work_order_item_purchase_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order_item
    ADD CONSTRAINT work_order_item_purchase_item_id_fkey FOREIGN KEY (purchase_item_id) REFERENCES public.purchase_item(id) ON UPDATE CASCADE;


--
-- Name: work_order_item work_order_item_sale_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order_item
    ADD CONSTRAINT work_order_item_sale_item_id_fkey FOREIGN KEY (sale_item_id) REFERENCES public.sale_item(id) ON UPDATE CASCADE;


--
-- Name: work_order_item work_order_item_sellable_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order_item
    ADD CONSTRAINT work_order_item_sellable_id_fkey FOREIGN KEY (sellable_id) REFERENCES public.sellable(id) ON UPDATE CASCADE;


--
-- Name: work_order_item work_order_item_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order_item
    ADD CONSTRAINT work_order_item_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: work_order_package work_order_package_destination_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order_package
    ADD CONSTRAINT work_order_package_destination_branch_id_fkey FOREIGN KEY (destination_branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: work_order_package_item work_order_package_item_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order_package_item
    ADD CONSTRAINT work_order_package_item_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.work_order(id) ON UPDATE CASCADE;


--
-- Name: work_order_package_item work_order_package_item_package_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order_package_item
    ADD CONSTRAINT work_order_package_item_package_id_fkey FOREIGN KEY (package_id) REFERENCES public.work_order_package(id) ON UPDATE CASCADE;


--
-- Name: work_order_package_item work_order_package_item_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order_package_item
    ADD CONSTRAINT work_order_package_item_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: work_order_package work_order_package_receive_responsible_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order_package
    ADD CONSTRAINT work_order_package_receive_responsible_id_fkey FOREIGN KEY (receive_responsible_id) REFERENCES public.login_user(id) ON UPDATE CASCADE;


--
-- Name: work_order_package work_order_package_send_responsible_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order_package
    ADD CONSTRAINT work_order_package_send_responsible_id_fkey FOREIGN KEY (send_responsible_id) REFERENCES public.login_user(id) ON UPDATE CASCADE;


--
-- Name: work_order_package work_order_package_source_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order_package
    ADD CONSTRAINT work_order_package_source_branch_id_fkey FOREIGN KEY (source_branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE;


--
-- Name: work_order_package work_order_package_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order_package
    ADD CONSTRAINT work_order_package_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: work_order work_order_quote_responsible_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order
    ADD CONSTRAINT work_order_quote_responsible_id_fkey FOREIGN KEY (quote_responsible_id) REFERENCES public.employee(id) ON UPDATE CASCADE;


--
-- Name: work_order work_order_sale_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order
    ADD CONSTRAINT work_order_sale_id_fkey FOREIGN KEY (sale_id) REFERENCES public.sale(id) ON UPDATE CASCADE;


--
-- Name: work_order work_order_sellable_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order
    ADD CONSTRAINT work_order_sellable_id_fkey FOREIGN KEY (sellable_id) REFERENCES public.sellable(id) ON UPDATE CASCADE;


--
-- Name: work_order work_order_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order
    ADD CONSTRAINT work_order_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.branch_station(id) ON UPDATE CASCADE;


--
-- Name: work_order work_order_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_order
    ADD CONSTRAINT work_order_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- Name: work_permit_data work_permit_data_te_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_permit_data
    ADD CONSTRAINT work_permit_data_te_id_fkey FOREIGN KEY (te_id) REFERENCES public.transaction_entry(id);


--
-- PostgreSQL database dump complete
--

