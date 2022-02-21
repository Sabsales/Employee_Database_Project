--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2022-02-20 18:50:07

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
-- TOC entry 213 (class 1259 OID 24653)
-- Name: department_employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department_employees (
    emp_no integer NOT NULL,
    dept_no character varying(4) NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);


ALTER TABLE public.department_employees OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 24588)
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    dept_no character varying(4) NOT NULL,
    dept_name character varying(40) NOT NULL
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 24612)
-- Name: dept_manager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dept_manager (
    dept_no character varying(4) NOT NULL,
    emp_no integer NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);


ALTER TABLE public.dept_manager OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 24595)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    emp_no integer NOT NULL,
    birth_date date NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    gender character varying NOT NULL,
    hire_date date NOT NULL
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24768)
-- Name: mentorship_eligibility; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mentorship_eligibility (
    emp_no integer,
    first_name character varying,
    last_name character varying,
    birth_date date,
    from_date date,
    to_date date,
    title character varying(40)
);


ALTER TABLE public.mentorship_eligibility OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 24715)
-- Name: retirement_titles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.retirement_titles (
    emp_no integer,
    first_name character varying,
    last_name character varying,
    title character varying(40),
    from_date date,
    to_date date
);


ALTER TABLE public.retirement_titles OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24765)
-- Name: retiring_titles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.retiring_titles (
    count bigint,
    title character varying(40)
);


ALTER TABLE public.retiring_titles OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 24627)
-- Name: salaries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salaries (
    emp_no integer NOT NULL,
    salary integer NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);


ALTER TABLE public.salaries OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 24678)
-- Name: titles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.titles (
    emp_no integer NOT NULL,
    title character varying(40) NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);


ALTER TABLE public.titles OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 24728)
-- Name: unique_titles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unique_titles (
    emp_no integer,
    first_name character varying,
    last_name character varying,
    title character varying(40)
);


ALTER TABLE public.unique_titles OWNER TO postgres;

--
-- TOC entry 3200 (class 2606 OID 24594)
-- Name: departments department_dept_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT department_dept_name_key UNIQUE (dept_name);


--
-- TOC entry 3210 (class 2606 OID 24657)
-- Name: department_employees department_employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department_employees
    ADD CONSTRAINT department_employees_pkey PRIMARY KEY (emp_no, dept_no);


--
-- TOC entry 3202 (class 2606 OID 24592)
-- Name: departments department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT department_pkey PRIMARY KEY (dept_no);


--
-- TOC entry 3206 (class 2606 OID 24616)
-- Name: dept_manager dept_manager_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT dept_manager_pkey PRIMARY KEY (emp_no, dept_no);


--
-- TOC entry 3204 (class 2606 OID 24601)
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (emp_no);


--
-- TOC entry 3208 (class 2606 OID 24631)
-- Name: salaries salaries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT salaries_pkey PRIMARY KEY (emp_no);


--
-- TOC entry 3215 (class 2606 OID 24663)
-- Name: department_employees department_employees_dept_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department_employees
    ADD CONSTRAINT department_employees_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES public.departments(dept_no);


--
-- TOC entry 3214 (class 2606 OID 24658)
-- Name: department_employees department_employees_emp_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department_employees
    ADD CONSTRAINT department_employees_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);


--
-- TOC entry 3212 (class 2606 OID 24622)
-- Name: dept_manager dept_manager_dept_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT dept_manager_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES public.departments(dept_no);


--
-- TOC entry 3211 (class 2606 OID 24617)
-- Name: dept_manager dept_manager_emp_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT dept_manager_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);


--
-- TOC entry 3213 (class 2606 OID 24632)
-- Name: salaries salaries_emp_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT salaries_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);


--
-- TOC entry 3216 (class 2606 OID 24681)
-- Name: titles titles_emp_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titles
    ADD CONSTRAINT titles_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);


-- Completed on 2022-02-20 18:50:07

--
-- PostgreSQL database dump complete
--

