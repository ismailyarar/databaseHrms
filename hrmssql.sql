-- Database: hrms

-- DROP DATABASE hrms;

CREATE DATABASE hrms
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Turkish_Turkey.1254'
    LC_CTYPE = 'Turkish_Turkey.1254'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

COMMENT ON DATABASE hrms
    IS 'Human Resource Management System';

-- Table: public.employers

-- DROP TABLE public.employers;

CREATE TABLE public.employers
(
    id integer NOT NULL DEFAULT nextval('employers_id_seq'::regclass),
    company_name character varying(25) COLLATE pg_catalog."default" NOT NULL,
    website character varying(25) COLLATE pg_catalog."default" NOT NULL,
    telephone character varying(15) COLLATE pg_catalog."default" NOT NULL,
    email character varying(30) COLLATE pg_catalog."default" NOT NULL,
    password character varying(30) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT employers_pk PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public.employers
    OWNER to postgres;

COMMENT ON TABLE public.employers
    IS 'işveren';
-- Index: employers_email_uindex

-- DROP INDEX public.employers_email_uindex;

CREATE UNIQUE INDEX employers_email_uindex
    ON public.employers USING btree
    (email COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: employers_id_uindex

-- DROP INDEX public.employers_id_uindex;

CREATE UNIQUE INDEX employers_id_uindex
    ON public.employers USING btree
    (id ASC NULLS LAST)
    TABLESPACE pg_default;

-- Table: public.job_seekers

-- DROP TABLE public.job_seekers;

CREATE TABLE public.job_seekers
(
    id integer NOT NULL DEFAULT nextval('job_seekers_id_seq'::regclass),
    first_name character varying(25) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(25) COLLATE pg_catalog."default" NOT NULL,
    identy_number integer NOT NULL,
    email character varying(50) COLLATE pg_catalog."default" NOT NULL,
    date_of_birth date NOT NULL,
    password character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT job_seekers_pk PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public.job_seekers
    OWNER to postgres;

COMMENT ON TABLE public.job_seekers
    IS 'iş arayanlar';
-- Index: job_seekers_email_uindex

-- DROP INDEX public.job_seekers_email_uindex;

CREATE UNIQUE INDEX job_seekers_email_uindex
    ON public.job_seekers USING btree
    (email COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: job_seekers_id_uindex

-- DROP INDEX public.job_seekers_id_uindex;

CREATE UNIQUE INDEX job_seekers_id_uindex
    ON public.job_seekers USING btree
    (id ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: job_seekers_identy_number_uindex

-- DROP INDEX public.job_seekers_identy_number_uindex;

CREATE UNIQUE INDEX job_seekers_identy_number_uindex
    ON public.job_seekers USING btree
    (identy_number ASC NULLS LAST)
    TABLESPACE pg_default;

-- Table: public.jobs_pozitions

-- DROP TABLE public.jobs_pozitions;

CREATE TABLE public.jobs_pozitions
(
    id integer NOT NULL DEFAULT nextval('jobs_pozitions_id_seq'::regclass),
    pozition_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT jobs_pozitions_pk PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public.jobs_pozitions
    OWNER to postgres;

COMMENT ON TABLE public.jobs_pozitions
    IS 'general job pozitions';
-- Index: jobs_pozitions_id_uindex

-- DROP INDEX public.jobs_pozitions_id_uindex;

CREATE UNIQUE INDEX jobs_pozitions_id_uindex
    ON public.jobs_pozitions USING btree
    (id ASC NULLS LAST)
    TABLESPACE pg_default;