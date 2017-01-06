--
-- PostgreSQL database dump
--

-- Started on 2009-09-17 10:46:10

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 6 (class 2615 OID 35338242)
-- Name: sistema; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA sistema;


ALTER SCHEMA sistema OWNER TO postgres;

--
-- TOC entry 495 (class 2612 OID 35338245)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

CREATE PROCEDURAL LANGUAGE plpgsql;


ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO postgres;

SET search_path = public, pg_catalog;

--
-- TOC entry 349 (class 1247 OID 35338254)
-- Dependencies: 1501
-- Name: attcampo; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE attcampo AS (
	numero name,
	nombre name,
	tipo name,
	long smallint,
	longvar integer,
	esnulo boolean,
	esfk boolean,
	tablafk name
);


ALTER TYPE public.attcampo OWNER TO postgres;

--
-- TOC entry 392 (class 1247 OID 35338328)
-- Dependencies: 1530
-- Name: tattcampo; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tattcampo AS (
	numero name,
	nombre name,
	tipo name,
	long smallint,
	longvar integer,
	esnulo boolean
);


ALTER TYPE public.tattcampo OWNER TO postgres;

--
-- TOC entry 25 (class 1255 OID 35338522)
-- Dependencies: 5 495
-- Name: act_contratista_evaluacion(integer, integer, date); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION act_contratista_evaluacion(integer, integer, date) RETURNS bigint
    AS $_$BEGIN
UPDATE contratista_evaluacion
   SET eva_estatus=$1
 WHERE con_contratistas_fk=$2 and eva_fecha_emision =$3;
RETURN $2;
END;
$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.act_contratista_evaluacion(integer, integer, date) OWNER TO postgres;

--
-- TOC entry 26 (class 1255 OID 35338523)
-- Dependencies: 5 495
-- Name: del_areas_objeto(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION del_areas_objeto(bigint) RETURNS bigint
    AS $_$
BEGIN

BEGIN
DELETE FROM areas_objeto WHERE aob_areas_objeto_pk = $1;
 EXCEPTION  WHEN foreign_key_violation THEN  RAISE exception 'Imposible eliminar el registro, existen dependencia con las Especialidades de las contratistas';
end;
RETURN $1;
END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.del_areas_objeto(bigint) OWNER TO postgres;

--
-- TOC entry 27 (class 1255 OID 35338524)
-- Dependencies: 5 495
-- Name: del_ciudades(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION del_ciudades(bigint) RETURNS bigint
    AS $_$
Begin
 delete from ciudades where ciu_ciudades_pk = $1;
 return $1;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.del_ciudades(bigint) OWNER TO postgres;

--
-- TOC entry 28 (class 1255 OID 35338525)
-- Dependencies: 5 495
-- Name: del_contratista_evaluacion(bigint, date); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION del_contratista_evaluacion(bigint, date) RETURNS bigint
    AS $_$BEGIN
DELETE FROM contratista_evaluacion 
 WHERE con_contratistas_fk = $1 and eva_fecha_emision = $2;
RETURN $1;
END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.del_contratista_evaluacion(bigint, date) OWNER TO postgres;

--
-- TOC entry 29 (class 1255 OID 35338526)
-- Dependencies: 5 495
-- Name: del_contratistas_acjdrl(bigint, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION del_contratistas_acjdrl(bigint, integer) RETURNS bigint
    AS $_$Begin
delete from contratistas_acjdrl where con_contratistas_fk = $1 and pnt_personas_naturales_fk= $2;
return $1;
End;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.del_contratistas_acjdrl(bigint, integer) OWNER TO postgres;

--
-- TOC entry 30 (class 1255 OID 35338527)
-- Dependencies: 5 495
-- Name: del_contratistas_comisarios(bigint, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION del_contratistas_comisarios(bigint, integer) RETURNS bigint
    AS $_$Begin
delete from contratistas_comisarios where con_contratistas_fk = $1 and pnt_personas_naturales_fk= $2;
return $1;
End;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.del_contratistas_comisarios(bigint, integer) OWNER TO postgres;

--
-- TOC entry 31 (class 1255 OID 35338528)
-- Dependencies: 5 495
-- Name: del_contratistas_contratos(bigint, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION del_contratistas_contratos(bigint, integer) RETURNS bigint
    AS $_$Begin
delete from contratistas_contratos where con_contratistas_fk = $1 and ctt_contratistas_contratos_pk= $2;
return $1;
End;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.del_contratistas_contratos(bigint, integer) OWNER TO postgres;

--
-- TOC entry 32 (class 1255 OID 35338529)
-- Dependencies: 495 5
-- Name: del_contratistas_estatus(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION del_contratistas_estatus() RETURNS bigint
    AS $_$BEGIN
 DELETE FROM contratistas_estatus
  WHERE ett_contratistas_estatus_pk = $1;
 RETURN $1;
END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.del_contratistas_estatus() OWNER TO postgres;

--
-- TOC entry 33 (class 1255 OID 35338530)
-- Dependencies: 5 495
-- Name: del_contratistas_legal(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION del_contratistas_legal(integer, integer) RETURNS bigint
    AS $_$Begin
delete from contratistas_legal where clg_contratistas_legal_pk = $1 and con_contratistas_fk = $2;
return $1;
End;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.del_contratistas_legal(integer, integer) OWNER TO postgres;

--
-- TOC entry 19 (class 1255 OID 35338531)
-- Dependencies: 5 495
-- Name: del_contratistas_sucursales(boolean, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION del_contratistas_sucursales(boolean, bigint) RETURNS bigint
    AS $_$begin
 update contratistas_sucursales 
 set csu_activo = $1 
 where csu_contratistas_sucursales_pk = $2;
 return $2;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.del_contratistas_sucursales(boolean, bigint) OWNER TO postgres;

--
-- TOC entry 34 (class 1255 OID 35338532)
-- Dependencies: 5 495
-- Name: del_contratistas_tipo(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION del_contratistas_tipo(bigint) RETURNS bigint
    AS $_$BEGIN
DELETE FROM contratistas_tipo 
 WHERE cTP_contratistas_tipo_pk = $1;
RETURN $1;
END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.del_contratistas_tipo(bigint) OWNER TO postgres;

--
-- TOC entry 35 (class 1255 OID 35338533)
-- Dependencies: 5 495
-- Name: del_denominacion_comercial(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION del_denominacion_comercial(bigint) RETURNS bigint
    AS $_$BEGIN 
 DELETE FROM denominacion_comercial 
  WHERE dec_denominacion_comercial_pk = $1;
 RETURN $1;
END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.del_denominacion_comercial(bigint) OWNER TO postgres;

--
-- TOC entry 36 (class 1255 OID 35338534)
-- Dependencies: 5 495
-- Name: del_esp_are_xcontratista(bigint, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION del_esp_are_xcontratista(bigint, bigint) RETURNS bigint
    AS $_$
Begin
 delete from esp_are_xcontratista where  con_contratistas_fk = $1    and epo_especialidad_objeto_fk = $2;
 return $1;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.del_esp_are_xcontratista(bigint, bigint) OWNER TO postgres;

--
-- TOC entry 37 (class 1255 OID 35338535)
-- Dependencies: 5 495
-- Name: del_esp_are_xcontratista(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION del_esp_are_xcontratista(bigint) RETURNS bigint
    AS $_$
Begin
 delete from esp_are_xcontratista where  con_contratistas_fk = $1;
 return $1;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.del_esp_are_xcontratista(bigint) OWNER TO postgres;

--
-- TOC entry 38 (class 1255 OID 35338536)
-- Dependencies: 495 5
-- Name: del_especialidad_objeto(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION del_especialidad_objeto(bigint) RETURNS bigint
    AS $_$BEGIN
Begin
 delete from especialidad_objeto where epo_especialidad_objeto_pk = $1;
 --UPDATE especialidad_objeto SET epo_activo = false WHERE epo_especialidad_objeto_pk = $1;
 EXCEPTION  WHEN foreign_key_violation THEN  RAISE exception 'Imposible eliminar el registro, existen dependencia con Contratistas';
end;
 return $1;
END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.del_especialidad_objeto(bigint) OWNER TO postgres;

--
-- TOC entry 39 (class 1255 OID 35338537)
-- Dependencies: 495 5
-- Name: del_estados(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION del_estados(valor_pk bigint) RETURNS bigint
    AS $_$Begin
Begin
delete from estados where est_estados_pk = $1;
 EXCEPTION  WHEN foreign_key_violation THEN  RAISE exception 'Imposible eliminar el registro, existen dependencia con Municipios';
end;
return $1;
End;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.del_estados(valor_pk bigint) OWNER TO postgres;

--
-- TOC entry 40 (class 1255 OID 35338538)
-- Dependencies: 5 495
-- Name: del_estatus(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION del_estatus(valor_pk bigint) RETURNS bigint
    AS $_$Begin
delete from estatus where ett_estatus_pk = $1;
return $1;
End;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.del_estatus(valor_pk bigint) OWNER TO postgres;

--
-- TOC entry 112 (class 1255 OID 35339058)
-- Dependencies: 495 5
-- Name: del_indice_capital_social(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION del_indice_capital_social(bigint) RETURNS bigint
    AS $_$Begin
Begin
delete from indice_capital_social where ics_indice_capital_social_pk = $1;
 EXCEPTION  WHEN foreign_key_violation THEN  RAISE exception 'Imposible eliminar el registro, existen dependencia con Contratistas';
end;
return $1;
End;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.del_indice_capital_social(bigint) OWNER TO postgres;

--
-- TOC entry 41 (class 1255 OID 35338539)
-- Dependencies: 5 495
-- Name: del_municipio(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION del_municipio(valor_pk bigint) RETURNS bigint
    AS $_$Begin
delete from municipio where mun_municipio_pk = $1;
return $1;
End;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.del_municipio(valor_pk bigint) OWNER TO postgres;

--
-- TOC entry 42 (class 1255 OID 35338540)
-- Dependencies: 5 495
-- Name: del_nivel_financiero_snc(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION del_nivel_financiero_snc(bigint) RETURNS bigint
    AS $_$BEGIN
DELETE FROM nivel_financiero_snc 
 WHERE nfs_nivel_financiero_snc_pk = $1;
RETURN $1;
END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.del_nivel_financiero_snc(bigint) OWNER TO postgres;

--
-- TOC entry 43 (class 1255 OID 35338541)
-- Dependencies: 495 5
-- Name: del_numeros_telefonicos(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION del_numeros_telefonicos(integer) RETURNS integer
    AS $_$
Begin
 DELETE FROM numeros_telefonicos 
 WHERE con_contratistas_fk = $1;
 RETURN $1;
END;	$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.del_numeros_telefonicos(integer) OWNER TO postgres;

--
-- TOC entry 44 (class 1255 OID 35338542)
-- Dependencies: 495 5
-- Name: del_numeros_telefonicos_sucursales(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION del_numeros_telefonicos_sucursales(integer) RETURNS integer
    AS $_$
Begin
 DELETE FROM numeros_telefonicos_sucursales 
 WHERE csu_contratistas_sucursales_fk = $1;
 RETURN $1;
END;	$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.del_numeros_telefonicos_sucursales(integer) OWNER TO postgres;

--
-- TOC entry 45 (class 1255 OID 35338543)
-- Dependencies: 495 5
-- Name: del_numeros_telefonicos_tipo(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION del_numeros_telefonicos_tipo(bigint) RETURNS bigint
    AS $_$BEGIN
DELETE FROM numeros_telefonicos_tipo 
  WHERE ntt_numeros_telefonicos_tipo_pk = $1;
 RETURN $1;
END;	$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.del_numeros_telefonicos_tipo(bigint) OWNER TO postgres;

--
-- TOC entry 46 (class 1255 OID 35338544)
-- Dependencies: 495 5
-- Name: del_organismos(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION del_organismos(bigint) RETURNS bigint
    AS $_$BEGIN 
 DELETE FROM rendimientos 
  WHERE ren_rendimientos_pk = $1;
 RETURN $1;
END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.del_organismos(bigint) OWNER TO postgres;

--
-- TOC entry 47 (class 1255 OID 35338545)
-- Dependencies: 5 495
-- Name: del_rendimientos(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION del_rendimientos(bigint) RETURNS bigint
    AS $_$BEGIN
 DELETE FROM rendimientos 
  WHERE ren_rendimientos_pk = $1;
 RETURN $1;
END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.del_rendimientos(bigint) OWNER TO postgres;

--
-- TOC entry 48 (class 1255 OID 35338546)
-- Dependencies: 5 495
-- Name: del_sol_rec_xtipo(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION del_sol_rec_xtipo(bigint) RETURNS bigint
    AS $_$BEGIN
DELETE FROM sol_rec_xtipo WHERE srt_sol_rec_xtipo_pk=$1;
RETURN $1;
END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.del_sol_rec_xtipo(bigint) OWNER TO postgres;

--
-- TOC entry 49 (class 1255 OID 35338547)
-- Dependencies: 5 495
-- Name: del_solvencias_recaudos(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION del_solvencias_recaudos(bigint) RETURNS bigint
    AS $_$
Begin
 delete from solvencias_recaudos where svr_solvencias_recaudos_pk = $1;
 return $1;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.del_solvencias_recaudos(bigint) OWNER TO postgres;

--
-- TOC entry 50 (class 1255 OID 35338548)
-- Dependencies: 5 495
-- Name: del_tipo_actividad(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION del_tipo_actividad(bigint) RETURNS bigint
    AS $_$BEGIN 
DELETE FROM tipo_actividad 
  WHERE tpa_tipo_actividad_pk = $1;
 RETURN $1;
END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.del_tipo_actividad(bigint) OWNER TO postgres;

--
-- TOC entry 114 (class 1255 OID 35344595)
-- Dependencies: 5 495
-- Name: del_tipo_beca(numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION del_tipo_beca(numeric) RETURNS numeric
    AS $_$BEGIN

Begin
 DELETE FROM tipo_beca WHERE tipo_beca_id = $1;
 EXCEPTION  WHEN foreign_key_violation THEN  RAISE exception 'Imposible eliminar el registro, existen Dependencia';
end;
 RETURN $1;
END;
$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.del_tipo_beca(numeric) OWNER TO postgres;

--
-- TOC entry 51 (class 1255 OID 35338549)
-- Dependencies: 5 495
-- Name: del_tipo_cooperativa(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION del_tipo_cooperativa(bigint) RETURNS bigint
    AS $_$
Begin
 delete from tipo_cooperativa where tpc_tipo_cooperativa_pk = $1;
 return $1;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.del_tipo_cooperativa(bigint) OWNER TO postgres;

--
-- TOC entry 52 (class 1255 OID 35338550)
-- Dependencies: 5 495
-- Name: del_tipo_firma(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION del_tipo_firma(bigint) RETURNS bigint
    AS $_$BEGIN
 DELETE FROM tipo_firma 
  WHERE tpf_tipo_firma_pk = $1;
 RETURN $1;
END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.del_tipo_firma(bigint) OWNER TO postgres;

--
-- TOC entry 53 (class 1255 OID 35338551)
-- Dependencies: 5 495
-- Name: ett_contratistas(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ett_contratistas(integer, integer) RETURNS bigint
    AS $_$BEGIN
UPDATE contratistas
   SET ett_contratistas_estatus_fk=$1
 WHERE con_contratistas_pk=$2;
RETURN $2;
END;
$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ett_contratistas(integer, integer) OWNER TO postgres;

--
-- TOC entry 54 (class 1255 OID 35338552)
-- Dependencies: 5 495
-- Name: gen_codigo_siez(date); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gen_codigo_siez(date) RETURNS character varying
    AS $_$DECLARE codigos bigint;
DECLARE reseteo bigint;
DECLARE nuevocodigo character varying;
BEGIN

SELECT INTO codigos count(con_codigo_siez)
  FROM contratistas
 WHERE con_fecha_inscripcion = $1;

IF(codigos = 0) THEN
 SELECT into reseteo setval('seq_codigo_siez', 1, false);
END IF;

SELECT into nuevocodigo 'SIEZ-'||$1||'-'||lpad(nextval('seq_codigo_siez'),3,'0');
  
return nuevocodigo;
END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.gen_codigo_siez(date) OWNER TO postgres;

--
-- TOC entry 55 (class 1255 OID 35338553)
-- Dependencies: 5 495
-- Name: ins_areas_objeto(character varying, character varying, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_areas_objeto(character varying, character varying, boolean) RETURNS bigint
    AS $_$
declare areasid bigint;
BEGIN
INSERT INTO areas_objeto (aob_nombre,aob_inicial,aob_activo) VALUES ($1,$2,$3);

select into areasid 
  max(aob_areas_objeto_pk) 
 from areas_objeto;

return areasid;
END;
$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_areas_objeto(character varying, character varying, boolean) OWNER TO postgres;

--
-- TOC entry 56 (class 1255 OID 35338554)
-- Dependencies: 5 495
-- Name: ins_ciudades(bigint, character varying, character varying, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_ciudades(bigint, character varying, character varying, boolean) RETURNS bigint
    AS $_$DECLARE ciuid BIGINT;
BEGIN
INSERT INTO ciudades(
            mun_municipio_fk, ciu_nombre, ciu_abreviatura, ciu_activo)
    VALUES ($1, $2, $3, $4);

SELECT INTO ciuid
 MAX(ciu_ciudades_pk)
 FROM ciudades;

RETURN ciuid;
END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_ciudades(bigint, character varying, character varying, boolean) OWNER TO postgres;

--
-- TOC entry 57 (class 1255 OID 35338555)
-- Dependencies: 5 495
-- Name: ins_contratista_evaluacion(integer, integer, date, character varying, date, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_contratista_evaluacion(integer, integer, date, character varying, date, character varying) RETURNS bigint
    AS $_$declare contratista_evaluacionid bigint;
Begin
 insert into contratista_evaluacion (svr_solvencias_recaudos_fk, con_contratistas_fk, eva_fecha_emision, eva_estatus, eva_fecha_vencimiento, eva_codigo_ancla)        
values 
 ($1,$2,$3,$4,$5,$6);

select into contratista_evaluacionid 
 max(eva_contratista_evaluacion_pk) 
from contratista_evaluacion;

return contratista_evaluacionid;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_contratista_evaluacion(integer, integer, date, character varying, date, character varying) OWNER TO postgres;

--
-- TOC entry 58 (class 1255 OID 35338556)
-- Dependencies: 5 495
-- Name: ins_contratistas(integer, integer, integer, integer, integer, character varying, character varying, character varying, character varying, date, date, character varying, character varying, character varying, integer, character varying, numeric, character varying, integer, character varying, integer, integer, date, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_contratistas(integer, integer, integer, integer, integer, character varying, character varying, character varying, character varying, date, date, character varying, character varying, character varying, integer, character varying, numeric, character varying, integer, character varying, integer, integer, date, character varying) RETURNS bigint
    AS $_$declare contratistasid bigint;
Begin
 insert into contratistas(nfs_nivel_financiero_snc_fk, tpc_tipo_cooperativa_fk, ciu_ciudades_fk, ctp_contratistas_tipo_fk, ett_contratistas_estatus_fk, con_nombre, con_siglas, con_numero_rif, con_numero_rnc,  con_fecha_inscripcion_rnc, con_fecha_vencimiento_rnc, con_direccion_fiscal, con_codigo_postal, con_email, tpf_tipo_firma_fk, con_calificacion_financiera, con_capacidad_financiera, con_objeto_cooperativa, con_tiempo_cooperativa, con_objeto_social_cooperativa, con_duracion_cooperativa, ics_indice_capital_social_fk, con_fecha_inscripcion, con_codigo_siez)
values 
 ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21,$22, $23, $24);

select into contratistasid 
 max(con_contratistas_pk) 
from contratistas;

return contratistasid;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_contratistas(integer, integer, integer, integer, integer, character varying, character varying, character varying, character varying, date, date, character varying, character varying, character varying, integer, character varying, numeric, character varying, integer, character varying, integer, integer, date, character varying) OWNER TO postgres;

--
-- TOC entry 59 (class 1255 OID 35338557)
-- Dependencies: 5 495
-- Name: ins_contratistas_acjdrl(integer, integer, character varying, boolean, boolean, boolean, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_contratistas_acjdrl(integer, integer, character varying, boolean, boolean, boolean, numeric) RETURNS bigint
    AS $_$declare contratistas_acjdrlid bigint;
Begin
 insert into contratistas_acjdrl (con_contratistas_fk, pnt_personas_naturales_fk, ajr_cargo_actual, ajr_accionista, ajr_miembro_junta_directiva,ajr_representante_legal, ajr_porcentaje_acciones)        
values 
 ($1,$2,$3,$4,$5,$6,$7);

select into contratistas_acjdrlid 
 max(ajr_contratistas_acjdrl_pk) 
from contratistas_acjdrl;

return contratistas_acjdrlid;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_contratistas_acjdrl(integer, integer, character varying, boolean, boolean, boolean, numeric) OWNER TO postgres;

--
-- TOC entry 60 (class 1255 OID 35338558)
-- Dependencies: 5 495
-- Name: ins_contratistas_comisarios(integer, integer, character varying, character varying, date); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_contratistas_comisarios(integer, integer, character varying, character varying, date) RETURNS bigint
    AS $_$declare contratistas_comisariosid bigint;
Begin
 insert into contratistas_comisarios (con_contratistas_fk, pnt_personas_naturales_fk, com_profesion, com_numero_colegiado, com_vigencia_colegiado)        
values 
 ($1,$2,$3,$4,$5);

select into contratistas_comisariosid 
 max(com_contratistas_comisarios_pk) 
from contratistas_comisarios;

return contratistas_comisariosid;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_contratistas_comisarios(integer, integer, character varying, character varying, date) OWNER TO postgres;

--
-- TOC entry 61 (class 1255 OID 35338559)
-- Dependencies: 5 495
-- Name: ins_contratistas_contratos(integer, integer, integer, integer, character varying, character varying, date, character varying, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_contratistas_contratos(integer, integer, integer, integer, character varying, character varying, date, character varying, bigint) RETURNS bigint
    AS $_$declare contratistas_contratosid bigint;
Begin
 insert into contratistas_contratos 
  (con_contratistas_fk, tpa_tipo_actividad_fk, ett_estatus_fk, org_organismos_fk, ctt_numero, ctt_descripcion, ctt_fecha, ctt_observaciones, ren_rendimiento_fk) 
 values 
  ($1,$2,$3,$4,$5,$6,$7,$8,$9);

 select into contratistas_contratosid 
  max(ctt_contratistas_contratos_pk) 
 from contratistas_contratos;

 return contratistas_contratosid;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_contratistas_contratos(integer, integer, integer, integer, character varying, character varying, date, character varying, bigint) OWNER TO postgres;

--
-- TOC entry 62 (class 1255 OID 35338560)
-- Dependencies: 495 5
-- Name: ins_contratistas_estatus(character varying, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_contratistas_estatus(character varying, boolean) RETURNS bigint
    AS $_$DECLARE ettid BIGINT;
BEGIN
INSERT INTO contratistas_estatus(
            ett_nombre, ett_activo)
    VALUES ($1, $2);

SELECT INTO ettid
 MAX(ett_contratistas_estatus_pk)
 FROM contratistas_estatus;

RETURN ettid;
END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_contratistas_estatus(character varying, boolean) OWNER TO postgres;

--
-- TOC entry 113 (class 1255 OID 35339888)
-- Dependencies: 495 5
-- Name: ins_contratistas_legal(integer, character varying, integer, character varying, date, character varying, character varying, character varying, character varying, character varying, date, date, numeric, numeric, boolean, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_contratistas_legal(integer, character varying, integer, character varying, date, character varying, character varying, character varying, character varying, character varying, date, date, numeric, numeric, boolean, character varying, character varying) RETURNS bigint
    AS $_$declare contratistas_legalid bigint;
Begin
 insert into contratistas_legal (con_contratistas_fk, clg_numero_registro, dec_denominacion_comercial_fk, clg_circunscripcion_judicial, clg_fecha_inscripcion,  clg_numero_inscripcion, clg_numero_tomo, clg_numero_folio, clg_objeto_social, clg_domicilio_legal_actual, clg_fecha_constitutiva,  clg_cierre_fiscal_actual, clg_capital_social_suscrito,  clg_capital_social_pagado, clg_modificacion, clg_numero_modificaciones,clg_observaciones)       
values 
 ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17);

select into contratistas_legalid 
 max(clg_contratistas_legal_pk) 
from contratistas_legal;

return contratistas_legalid;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_contratistas_legal(integer, character varying, integer, character varying, date, character varying, character varying, character varying, character varying, character varying, date, date, numeric, numeric, boolean, character varying, character varying) OWNER TO postgres;

--
-- TOC entry 63 (class 1255 OID 35338562)
-- Dependencies: 5 495
-- Name: ins_contratistas_solvencias(integer, date, date, character varying, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_contratistas_solvencias(integer, date, date, character varying, boolean) RETURNS bigint
    AS $_$declare contratistas_solvenciasid bigint;
Begin
 insert into contratistas_solvencias (con_contratistas_fk,sol_fecha_emision,sol_fecha_vencimiento,sol_periodo,sol_activo)        
values 
 ($1,$2,$3,$4,$5);

select into contratistas_solvenciasid 
 max(sol_contratistas_solvencias_pk) 
from contratistas_solvencias;

return contratistas_solvenciasid;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_contratistas_solvencias(integer, date, date, character varying, boolean) OWNER TO postgres;

--
-- TOC entry 64 (class 1255 OID 35338563)
-- Dependencies: 495 5
-- Name: ins_contratistas_sucursales(integer, character varying, character varying, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_contratistas_sucursales(integer, character varying, character varying, boolean) RETURNS bigint
    AS $_$declare contratistas_sucursalesid bigint;
Begin
 insert into contratistas_sucursales
  (con_contratistas_fk, csu_descripcion, csu_direccion, csu_activo)
 values 
  ($1,$2,$3,$4);

 select into contratistas_sucursalesid 
  max(csu_contratistas_sucursales_pk) 
 from contratistas_sucursales;

 return contratistas_sucursalesid;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_contratistas_sucursales(integer, character varying, character varying, boolean) OWNER TO postgres;

--
-- TOC entry 65 (class 1255 OID 35338564)
-- Dependencies: 495 5
-- Name: ins_contratistas_tipo(character varying, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_contratistas_tipo(character varying, boolean) RETURNS bigint
    AS $_$DECLARE ctpid BIGINT;
BEGIN
INSERT INTO contratistas_tipo(
            ctp_descripcion, ctp_activo)
    VALUES ($1, $2);

SELECT INTO ctpid
  max(ctp_contratistas_tipo_pk)
 FROM contratistas_tipo;

RETURN ctpid;
END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_contratistas_tipo(character varying, boolean) OWNER TO postgres;

--
-- TOC entry 66 (class 1255 OID 35338565)
-- Dependencies: 5 495
-- Name: ins_denominacion_comercial(character varying, character varying, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_denominacion_comercial(character varying, character varying, boolean) RETURNS bigint
    AS $_$DECLARE decid BIGINT;
BEGIN
INSERT INTO denominacion_comercial(
             dec_descripcion, dec_abreviatura, dec_activo)
    VALUES ($1, $2, $3);

SELECT INTO decid 
 MAX(dec_denominacion_comercial_pk)
 FROM denominacion_comercial;

RETURN decid;
END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_denominacion_comercial(character varying, character varying, boolean) OWNER TO postgres;

--
-- TOC entry 67 (class 1255 OID 35338566)
-- Dependencies: 5 495
-- Name: ins_esp_are_xcontratista(integer, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_esp_are_xcontratista(integer, integer, boolean) RETURNS bigint
    AS $_$declare esp_are_xcontratistaid bigint;
Begin
 insert into esp_are_xcontratista 
  (con_contratistas_fk, epo_especialidad_objeto_fk, eac_principal) 
 values 
  ($1,$2,$3);

 select into esp_are_xcontratistaid 
  max(eac_esp_are_xcontratista_pk) 
 from esp_are_xcontratista;

 return esp_are_xcontratistaid;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_esp_are_xcontratista(integer, integer, boolean) OWNER TO postgres;

--
-- TOC entry 68 (class 1255 OID 35338567)
-- Dependencies: 5 495
-- Name: ins_especialidad_objeto(bigint, character varying, character varying, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_especialidad_objeto(bigint, character varying, character varying, boolean) RETURNS bigint
    AS $_$DECLARE especialidad_objetoid BIGINT;
BEGIN
 INSERT INTO especialidad_objeto(
            aob_areas_objeto_fk, epo_nombre, 
            epo_inicial, epo_activo)
    VALUES ($1, $2, $3, $4);

SELECT INTO especialidad_objetoid 
  max(epo_especialidad_objeto_pk) 
 FROM especialidad_objeto;

RETURN especialidad_objetoid;
END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_especialidad_objeto(bigint, character varying, character varying, boolean) OWNER TO postgres;

--
-- TOC entry 69 (class 1255 OID 35338568)
-- Dependencies: 495 5
-- Name: ins_estados(character varying, character varying, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_estados(character varying, character varying, boolean) RETURNS bigint
    AS $_$declare estadosid bigint;
Begin
 insert into estados 
  (est_nombre,est_abreviatura,est_activo) 
 values 
  ($1,$2,$3);

 select into estadosid 
  max(est_estados_pk) 
 from estados;

 return estadosid;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_estados(character varying, character varying, boolean) OWNER TO postgres;

--
-- TOC entry 70 (class 1255 OID 35338569)
-- Dependencies: 495 5
-- Name: ins_estatus(character varying, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_estatus(character varying, boolean) RETURNS bigint
    AS $_$declare estatusid bigint;
Begin
 insert into estatus 
  (ett_nombre,ett_activo) 
 values 
  ($1,$2);

 select into estatusid 
  max(ett_estatus_pk) 
 from estatus;

 return estatusid;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_estatus(character varying, boolean) OWNER TO postgres;

--
-- TOC entry 71 (class 1255 OID 35338570)
-- Dependencies: 495 5
-- Name: ins_indice_capital_social(character varying, numeric, numeric, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_indice_capital_social(character varying, numeric, numeric, boolean) RETURNS bigint
    AS $_$DECLARE icsid BIGINT;
BEGIN
INSERT INTO indice_capital_social(
            ics_descripcion, ics_desde, ics_hasta, ics_activo)
    VALUES ($1, $2, $3, $4);

SELECT INTO icsid 
  max(ics_indice_capital_social_pk) 
 FROM indice_capital_social;

RETURN icsid;
END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_indice_capital_social(character varying, numeric, numeric, boolean) OWNER TO postgres;

--
-- TOC entry 72 (class 1255 OID 35338571)
-- Dependencies: 5 495
-- Name: ins_municipio(bigint, character varying, character varying, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_municipio(bigint, character varying, character varying, boolean) RETURNS bigint
    AS $_$
DECLARE munid BIGINT;
begin
 insert into municipio(est_estados_fk, mun_nombre, mun_abreviatura,  mun_activo)  
 values ($1,$2,$3,$4);

 select into munid
  max(mun_municipio_pk)
 from municipio;

 return munid;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_municipio(bigint, character varying, character varying, boolean) OWNER TO postgres;

--
-- TOC entry 73 (class 1255 OID 35338572)
-- Dependencies: 495 5
-- Name: ins_nivel_financiero_snc(character varying, numeric, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_nivel_financiero_snc(character varying, numeric, numeric) RETURNS bigint
    AS $_$DECLARE nfssncid BIGINT;
BEGIN

INSERT INTO nivel_financiero_snc(
            nfs_nivel, nfs_capital_desde, nfs_capital_hasta)
    VALUES ($1, $2, $3);

SELECT INTO nfssncid 
  max(nfs_nivel_financiero_snc_pk) 
 FROM nivel_financiero_snc;

RETURN nfssncid;
END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_nivel_financiero_snc(character varying, numeric, numeric) OWNER TO postgres;

--
-- TOC entry 74 (class 1255 OID 35338573)
-- Dependencies: 5 495
-- Name: ins_numeros_telefonicos(integer, integer, character varying, character varying, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_numeros_telefonicos(integer, integer, character varying, character varying, boolean) RETURNS bigint
    AS $_$declare numeros_telefonicosid bigint;
Begin
 insert into numeros_telefonicos (ntt_numeros_telefonicos_tipo_fk, con_contratistas_fk, tel_numero, tel_codigo_area,  tel_activo)
values 
 ($1,$2,$3,$4,$5);

select into numeros_telefonicosid
 max(tel_numeros_telefonicos_pk) 
from numeros_telefonicos;

return numeros_telefonicosid;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_numeros_telefonicos(integer, integer, character varying, character varying, boolean) OWNER TO postgres;

--
-- TOC entry 75 (class 1255 OID 35338574)
-- Dependencies: 495 5
-- Name: ins_numeros_telefonicos_sucursales(integer, integer, character varying, character varying, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_numeros_telefonicos_sucursales(integer, integer, character varying, character varying, boolean) RETURNS bigint
    AS $_$declare numeros_telefonicos_sucursalesid bigint;
Begin
 insert into numeros_telefonicos_sucursales(ntt_numeros_telefonicos_tipo_fk, csu_contratistas_sucursales_fk, tls_numero, tls_codigo_area,  tls_activo)
values 
 ($1,$2,$3,$4,$5);

select into numeros_telefonicos_sucursalesid
 max(tls_numeros_telefonicos_sucursales_pk) 
from numeros_telefonicos_sucursales;

return numeros_telefonicos_sucursalesid;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_numeros_telefonicos_sucursales(integer, integer, character varying, character varying, boolean) OWNER TO postgres;

--
-- TOC entry 76 (class 1255 OID 35338575)
-- Dependencies: 5 495
-- Name: ins_numeros_telefonicos_tipo(character varying, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_numeros_telefonicos_tipo(character varying, boolean) RETURNS bigint
    AS $_$DECLARE nttid BIGINT;
BEGIN

INSERT INTO numeros_telefonicos_tipo(
             ntt_descripcion, ntt_obligatorio)
    VALUES ($1, $2);

SELECT INTO nttid
 MAX(ntt_numeros_telefonicos_tipo_pK)
 FROM numeros_telefonicos_tipo;

RETURN nttid;
END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_numeros_telefonicos_tipo(character varying, boolean) OWNER TO postgres;

--
-- TOC entry 77 (class 1255 OID 35338576)
-- Dependencies: 495 5
-- Name: ins_organismos(character varying, character varying, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_organismos(character varying, character varying, boolean) RETURNS bigint
    AS $_$declare organismosid bigint;
Begin
 insert into organismos
  (org_nombre,org_siglas,org_activo) 
 values 
  ($1,$2,$3);

 select into organismosid 
  max(org_organismos_pk) 
 from organismos;

 return organismosid;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_organismos(character varying, character varying, boolean) OWNER TO postgres;

--
-- TOC entry 78 (class 1255 OID 35338577)
-- Dependencies: 495 5
-- Name: ins_pais(character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_pais(character varying, character varying, integer) RETURNS bigint
    AS $_$declare paisid bigint;
Begin
 insert into pais 
  (pais_pk,usuario_fk,ultima_mod,nombre,abreviatura,vigente) 
 values 
  (default,current_user,current_date,$1,$2,$3);

 select into paisid 
  max(pais_pk) 
 from pais;

 return paisid;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_pais(character varying, character varying, integer) OWNER TO postgres;

--
-- TOC entry 79 (class 1255 OID 35338578)
-- Dependencies: 5 495
-- Name: ins_personas_naturales(character varying, character varying, character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_personas_naturales(character varying, character varying, character varying, character varying, character varying, character varying) RETURNS bigint
    AS $_$declare personas_naturalesid bigint;
Begin
 insert into personas_naturales (pnt_nombres, pnt_apellidos, pnt_cedula_de_identidad, pnt_rif_personal, pnt_email, pnt_otro_documento)        
values 
 ($1,$2,$3,$4,$5,$6);

select into personas_naturalesid 
 max(pnt_personas_naturales_pk) 
from personas_naturales;

return personas_naturalesid;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_personas_naturales(character varying, character varying, character varying, character varying, character varying, character varying) OWNER TO postgres;

--
-- TOC entry 80 (class 1255 OID 35338579)
-- Dependencies: 495 5
-- Name: ins_rendimientos(character varying, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_rendimientos(character varying, boolean) RETURNS bigint
    AS $_$DECLARE renid BIGINT;
BEGIN
INSERT INTO rendimientos(
            ren_descripcion, ren_activo)
    VALUES ($1, $2);
SELECT INTO renid
 MAX(ren_rendimientos_pk)
 FROM rendimientos;
RETURN renid;
END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_rendimientos(character varying, boolean) OWNER TO postgres;

--
-- TOC entry 81 (class 1255 OID 35338580)
-- Dependencies: 495 5
-- Name: ins_sol_rec_xtipo(integer, integer, date, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_sol_rec_xtipo(integer, integer, date, boolean) RETURNS bigint
    AS $_$declare sol_rec_xtipoid bigint;
Begin


 insert into sol_rec_xtipo
  (ctp_contratistas_tipo_fk, svr_solvencias_recaudos_fk, srt_vigente_hasta, srt_obligatorio) 
 values 
  ($1,$2,$3,$4);

 select into sol_rec_xtipoid 
  max(srt_sol_rec_xtipo_pk) 
 from sol_rec_xtipo;

 return sol_rec_xtipoid;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_sol_rec_xtipo(integer, integer, date, boolean) OWNER TO postgres;

--
-- TOC entry 82 (class 1255 OID 35338581)
-- Dependencies: 5 495
-- Name: ins_solvencias_recaudos(character varying, boolean, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_solvencias_recaudos(character varying, boolean, integer, boolean) RETURNS bigint
    AS $_$declare solvencias_recaudosid bigint;
Begin
 insert into solvencias_recaudos 
  (svr_descripcion, svr_tiene_vencimiento, svr_vencimiento_dias, svr_activo) 
 values 
  ($1,$2,$3,$4);

 select into solvencias_recaudosid 
  max(svr_solvencias_recaudos_pk) 
 from solvencias_recaudos;

 return solvencias_recaudosid;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_solvencias_recaudos(character varying, boolean, integer, boolean) OWNER TO postgres;

--
-- TOC entry 83 (class 1255 OID 35338582)
-- Dependencies: 495 5
-- Name: ins_tipo_actividad(character varying, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_tipo_actividad(character varying, boolean) RETURNS bigint
    AS $_$declare tipo_actividadid bigint;
Begin
 insert into tipo_actividad 
  (tpa_nombre,tpa_activo) 
 values 
  ($1,$2);

 select into tipo_actividadid 
  max(tpa_tipo_actividad_pk) 
 from tipo_actividad;

 return tipo_actividadid;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_tipo_actividad(character varying, boolean) OWNER TO postgres;

--
-- TOC entry 84 (class 1255 OID 35338583)
-- Dependencies: 495 5
-- Name: ins_tipo_cooperativa(character varying, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_tipo_cooperativa(character varying, boolean) RETURNS bigint
    AS $_$declare tipocooperativasid bigint;
Begin
 insert into tipo_cooperativa 
  (tpc_nombre,tpc_activo) 
 values 
  ($1,$2);

 select into tipocooperativasid  
  max(tpc_tipo_cooperativa_pk) 
 from tipo_cooperativa;

 return tipocooperativasid;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_tipo_cooperativa(character varying, boolean) OWNER TO postgres;

--
-- TOC entry 85 (class 1255 OID 35338584)
-- Dependencies: 5 495
-- Name: ins_tipo_firma(character varying, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ins_tipo_firma(character varying, boolean) RETURNS bigint
    AS $_$DECLARE tpfid BIGINT;
BEGIN
INSERT INTO tipo_firma(
             tpf_descripcion, tpf_activo)
    VALUES ($1, $2);
SELECT INTO tpfid
  MAX(tpf_tipo_firma_pk)
  FROM tipo_firma;
RETURN tpfid;
END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ins_tipo_firma(character varying, boolean) OWNER TO postgres;

--
-- TOC entry 86 (class 1255 OID 35338585)
-- Dependencies: 392 5 495
-- Name: pg_att_campo(name, name); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pg_att_campo(name, name) RETURNS tattcampo
    AS $_$

DECLARE
    resultado tattcampo;

BEGIN
 
SELECT INTO resultado 
                a.attnum,
                a.attname AS field,
                t.typname AS type,
                a.attlen AS length,
                a.atttypmod AS lengthvar,
                a.attnotnull AS notnull
                
        FROM
                pg_class c,
                pg_attribute a,
                pg_type t
        WHERE
                c.relname = $1
                and a.attnum > 0
                and a.attrelid = c.oid
                and a.atttypid = t.oid
                and a.attname = $2
        ORDER BY a.attnum;
return resultado;
END;
$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.pg_att_campo(name, name) OWNER TO postgres;

--
-- TOC entry 87 (class 1255 OID 35338586)
-- Dependencies: 5 495
-- Name: upd_activo_contratistas(character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION upd_activo_contratistas(character varying, integer) RETURNS bigint
    AS $_$BEGIN
UPDATE contratistas_estatus
   SET con_estatus=$1
 WHERE con_contratistas_pk=$2;
RETURN $2;
END;
$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.upd_activo_contratistas(character varying, integer) OWNER TO postgres;

--
-- TOC entry 88 (class 1255 OID 35338587)
-- Dependencies: 5 495
-- Name: upd_areas_objeto(character varying, character varying, boolean, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION upd_areas_objeto(character varying, character varying, boolean, bigint) RETURNS bigint
    AS $_$BEGIN
 update areas_objeto
 set aob_nombre = $1, aob_inicial  = $2, aob_activo = $3
 where  aob_areas_objeto_pk = $4;
 return $4;
END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.upd_areas_objeto(character varying, character varying, boolean, bigint) OWNER TO postgres;

--
-- TOC entry 89 (class 1255 OID 35338588)
-- Dependencies: 5 495
-- Name: upd_ciudades(bigint, character varying, character varying, boolean, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION upd_ciudades(bigint, character varying, character varying, boolean, bigint) RETURNS bigint
    AS $_$BEGIN
 UPDATE ciudades
   SET  mun_municipio_fk=$1, ciu_nombre=$2, ciu_abreviatura=$3, ciu_activo=$4
 WHERE ciu_ciudades_pk=$5;
 RETURN $5;
END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.upd_ciudades(bigint, character varying, character varying, boolean, bigint) OWNER TO postgres;

--
-- TOC entry 90 (class 1255 OID 35338589)
-- Dependencies: 495 5
-- Name: upd_contratistas(integer, integer, integer, integer, character varying, character varying, character varying, date, date, character varying, character varying, character varying, integer, character varying, numeric, character varying, bigint, character varying, bigint, bigint, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION upd_contratistas(integer, integer, integer, integer, character varying, character varying, character varying, date, date, character varying, character varying, character varying, integer, character varying, numeric, character varying, bigint, character varying, bigint, bigint, bigint) RETURNS bigint
    AS $_$begin
 update contratistas
 set  nfs_nivel_financiero_snc_fk=$1, tpc_tipo_cooperativa_fk=$2, ciu_ciudades_fk=$3, ctp_contratistas_tipo_fk=$4 , con_nombre=$5, con_siglas=$6, con_numero_rnc=$7, con_fecha_inscripcion_rnc=$8, con_fecha_vencimiento_rnc=$9, con_direccion_fiscal =$10, con_codigo_postal=$11, con_email=$12, tpf_tipo_firma_fk=$13, con_calificacion_financiera=$14, con_capacidad_financiera=$15, con_objeto_cooperativa=$16, con_tiempo_cooperativa=$17, con_objeto_social_cooperativa=$18, con_duracion_cooperativa=$19, ics_indice_capital_social_fk=$20 
where con_contratistas_pk=$21;
return $21;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.upd_contratistas(integer, integer, integer, integer, character varying, character varying, character varying, date, date, character varying, character varying, character varying, integer, character varying, numeric, character varying, bigint, character varying, bigint, bigint, bigint) OWNER TO postgres;

--
-- TOC entry 91 (class 1255 OID 35338590)
-- Dependencies: 5 495
-- Name: upd_contratistas_acjdrl(character varying, boolean, boolean, boolean, numeric, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION upd_contratistas_acjdrl(character varying, boolean, boolean, boolean, numeric, integer) RETURNS bigint
    AS $_$begin
 update contratistas_acjdrl
 set  ajr_cargo_actual= $1, ajr_accionista = $2, ajr_miembro_junta_directiva= $3, ajr_representante_legal =$4 , ajr_porcentaje_acciones= $5 
 where pnt_personas_naturales_fk=$6;
 return $6;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.upd_contratistas_acjdrl(character varying, boolean, boolean, boolean, numeric, integer) OWNER TO postgres;

--
-- TOC entry 92 (class 1255 OID 35338591)
-- Dependencies: 495 5
-- Name: upd_contratistas_comisarios(character varying, character varying, date, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION upd_contratistas_comisarios(character varying, character varying, date, integer) RETURNS bigint
    AS $_$begin
 update contratistas_comisarios
 set  com_profesion= $1, com_numero_colegiado = $2, com_vigencia_colegiado= $3
 where pnt_personas_naturales_fk=$4;
 return $4;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.upd_contratistas_comisarios(character varying, character varying, date, integer) OWNER TO postgres;

--
-- TOC entry 93 (class 1255 OID 35338592)
-- Dependencies: 5 495
-- Name: upd_contratistas_contratos(integer, integer, integer, character varying, character varying, date, character varying, bigint, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION upd_contratistas_contratos(integer, integer, integer, character varying, character varying, date, character varying, bigint, integer) RETURNS bigint
    AS $_$begin
 update contratistas_contratos
 set  tpa_tipo_actividad_fk= $1, ett_estatus_fk = $2, org_organismos_fk= $3, ctt_numero= $4, ctt_descripcion= $5, ctt_fecha= $6, ctt_observaciones= $7, ren_rendimiento_fk = $8
 where ctt_contratistas_contratos_pk=$9;
 return $9;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.upd_contratistas_contratos(integer, integer, integer, character varying, character varying, date, character varying, bigint, integer) OWNER TO postgres;

--
-- TOC entry 94 (class 1255 OID 35338593)
-- Dependencies: 495 5
-- Name: upd_contratistas_estatus(character varying, boolean, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION upd_contratistas_estatus(character varying, boolean, bigint) RETURNS bigint
    AS $_$BEGIN
UPDATE contratistas_estatus
   SET ett_nombre=$1, ett_activo=$2
 WHERE ett_contratistas_estatus_pk=$3;
RETURN $3;
END;
$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.upd_contratistas_estatus(character varying, boolean, bigint) OWNER TO postgres;

--
-- TOC entry 95 (class 1255 OID 35338594)
-- Dependencies: 5 495
-- Name: upd_contratistas_legal(integer, character varying, character varying, date, character varying, character varying, character varying, character varying, character varying, date, date, numeric, numeric, boolean, character varying, character varying, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION upd_contratistas_legal(integer, character varying, character varying, date, character varying, character varying, character varying, character varying, character varying, date, date, numeric, numeric, boolean, character varying, character varying, integer, integer) RETURNS bigint
    AS $_$BEGIN
UPDATE contratistas_legal
   SET dec_denominacion_comercial_fk=$1, clg_numero_registro=$2, clg_circunscripcion_judicial= $3, clg_fecha_inscripcion = $4, clg_numero_inscripcion= $5, clg_numero_tomo = $6, clg_numero_folio = $7, clg_objeto_social =$8, clg_domicilio_legal_actual = $9, clg_fecha_constitutiva = $10, clg_cierre_fiscal_actual = $11, clg_capital_social_suscrito = $12, clg_capital_social_pagado = $13, clg_modificacion = $14, clg_numero_modificaciones = $15, clg_observaciones=$16
 WHERE clg_contratistas_legal_pk=$17 and con_contratistas_fk= $18;
RETURN $17;
END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.upd_contratistas_legal(integer, character varying, character varying, date, character varying, character varying, character varying, character varying, character varying, date, date, numeric, numeric, boolean, character varying, character varying, integer, integer) OWNER TO postgres;

--
-- TOC entry 96 (class 1255 OID 35338595)
-- Dependencies: 5 495
-- Name: upd_contratistas_sucursales(character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION upd_contratistas_sucursales(character varying, character varying, integer) RETURNS bigint
    AS $_$BEGIN
 UPDATE contratistas_sucursales
   SET  csu_descripcion=$1, csu_direccion=$2
 WHERE csu_contratistas_sucursales_pk=$3;
 RETURN $3;
END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.upd_contratistas_sucursales(character varying, character varying, integer) OWNER TO postgres;

--
-- TOC entry 97 (class 1255 OID 35338596)
-- Dependencies: 5 495
-- Name: upd_contratistas_tipo(character varying, boolean, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION upd_contratistas_tipo(character varying, boolean, bigint) RETURNS bigint
    AS $_$BEGIN
UPDATE contratistas_tipo
   SET  ctp_descripcion=$1, ctp_activo=$2
 WHERE ctp_contratistas_tipo_pk=$3;
RETURN $3;
END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.upd_contratistas_tipo(character varying, boolean, bigint) OWNER TO postgres;

--
-- TOC entry 98 (class 1255 OID 35338597)
-- Dependencies: 5 495
-- Name: upd_denominacion_comercial(character varying, character varying, boolean, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION upd_denominacion_comercial(character varying, character varying, boolean, bigint) RETURNS bigint
    AS $_$BEGIN
UPDATE denominacion_comercial
   SET dec_descripcion=$1, dec_abreviatura=$2,dec_activo=$3
 WHERE dec_denominacion_comercial_pk=$4;
RETURN $4;
END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.upd_denominacion_comercial(character varying, character varying, boolean, bigint) OWNER TO postgres;

--
-- TOC entry 99 (class 1255 OID 35338598)
-- Dependencies: 495 5
-- Name: upd_especialidad_objeto(bigint, character varying, character varying, boolean, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION upd_especialidad_objeto(bigint, character varying, character varying, boolean, bigint) RETURNS bigint
    AS $_$BEGIN
UPDATE especialidad_objeto
   SET aob_areas_objeto_fk=$1, epo_nombre=$2, epo_inicial=$3, epo_activo=$4
 WHERE epo_especialidad_objeto_pk = $5;
RETURN $5;
END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.upd_especialidad_objeto(bigint, character varying, character varying, boolean, bigint) OWNER TO postgres;

--
-- TOC entry 21 (class 1255 OID 35338599)
-- Dependencies: 495 5
-- Name: upd_estados(character varying, character varying, boolean, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION upd_estados(character varying, character varying, boolean, bigint) RETURNS bigint
    AS $_$begin
 update estados 
 set est_nombre = $1, est_abreviatura  = $2, est_activo = $3 
 where est_estados_pk = $4;
 return $4;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.upd_estados(character varying, character varying, boolean, bigint) OWNER TO postgres;

--
-- TOC entry 22 (class 1255 OID 35338600)
-- Dependencies: 5 495
-- Name: upd_estatus(character varying, boolean, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION upd_estatus(character varying, boolean, bigint) RETURNS bigint
    AS $_$begin
 update estatus 
 set ett_nombre = $1, ett_activo = $2
 where ett_estatus_pk = $3;
 return $3;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.upd_estatus(character varying, boolean, bigint) OWNER TO postgres;

--
-- TOC entry 100 (class 1255 OID 35338601)
-- Dependencies: 495 5
-- Name: upd_indice_capital_social(character varying, numeric, numeric, boolean, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION upd_indice_capital_social(character varying, numeric, numeric, boolean, bigint) RETURNS bigint
    AS $_$BEGIN
UPDATE indice_capital_social
   SET ics_descripcion=$1, ics_desde=$2, 
       ics_hasta=$3, ics_activo=$4
 WHERE ics_indice_capital_social_pk = $5;
RETURN $5;
END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.upd_indice_capital_social(character varying, numeric, numeric, boolean, bigint) OWNER TO postgres;

--
-- TOC entry 101 (class 1255 OID 35338602)
-- Dependencies: 5 495
-- Name: upd_municipio(bigint, character varying, character varying, boolean, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION upd_municipio(bigint, character varying, character varying, boolean, bigint) RETURNS bigint
    AS $_$begin
 update municipio set
 est_estados_fk = $1, mun_nombre = $2, mun_abreviatura  = $3, mun_activo = $4
 where mun_municipio_pk = $5;
 return $5;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.upd_municipio(bigint, character varying, character varying, boolean, bigint) OWNER TO postgres;

--
-- TOC entry 102 (class 1255 OID 35338603)
-- Dependencies: 5 495
-- Name: upd_nivel_financiero_snc(character varying, numeric, numeric, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION upd_nivel_financiero_snc(character varying, numeric, numeric, bigint) RETURNS bigint
    AS $_$BEGIN
UPDATE nivel_financiero_snc
   SET  nfs_nivel=$1, nfs_capital_desde=$2, nfs_capital_hasta=$3
 WHERE nfs_nivel_financiero_snc_pk=$4;
RETURN $4;
END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.upd_nivel_financiero_snc(character varying, numeric, numeric, bigint) OWNER TO postgres;

--
-- TOC entry 23 (class 1255 OID 35338604)
-- Dependencies: 495 5
-- Name: upd_numeros_telefonicos_sucursales(boolean, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION upd_numeros_telefonicos_sucursales(boolean, bigint) RETURNS bigint
    AS $_$begin
 update numeros_telefonicos_sucursales 
 set tls_activo = $1 
 where csu_contratistas_sucursales_fk = $2;
 return $2;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.upd_numeros_telefonicos_sucursales(boolean, bigint) OWNER TO postgres;

--
-- TOC entry 103 (class 1255 OID 35338605)
-- Dependencies: 495 5
-- Name: upd_numeros_telefonicos_tipo(character varying, boolean, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION upd_numeros_telefonicos_tipo(character varying, boolean, bigint) RETURNS bigint
    AS $_$BEGIN
UPDATE numeros_telefonicos_tipo
   SET ntt_descripcion=$1, ntt_obligatorio=$2
 WHERE ntt_numeros_telefonicos_tipo_pk=$3;
RETURN $3;
END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.upd_numeros_telefonicos_tipo(character varying, boolean, bigint) OWNER TO postgres;

--
-- TOC entry 104 (class 1255 OID 35338606)
-- Dependencies: 5 495
-- Name: upd_organismos(character varying, character varying, boolean, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION upd_organismos(character varying, character varying, boolean, bigint) RETURNS bigint
    AS $_$BEGIN
UPDATE organismos
   SET  org_nombre=$1, org_siglas=$2, org_activo=$3
 WHERE org_organismos_pk=$4;
RETURN $4;
END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.upd_organismos(character varying, character varying, boolean, bigint) OWNER TO postgres;

--
-- TOC entry 24 (class 1255 OID 35338607)
-- Dependencies: 5 495
-- Name: upd_pais(character varying, character varying, integer, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION upd_pais(character varying, character varying, integer, bigint) RETURNS bigint
    AS $_$begin
 update pais 
 set nombre = $1, abreviatura = $2, vigente = $3, ultima_mod = current_date, usuario_fk = current_user 
 where pais_pk = $4;
 return $4;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.upd_pais(character varying, character varying, integer, bigint) OWNER TO postgres;

--
-- TOC entry 105 (class 1255 OID 35338608)
-- Dependencies: 495 5
-- Name: upd_personas_naturales(character varying, character varying, character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION upd_personas_naturales(character varying, character varying, character varying, character varying, integer) RETURNS bigint
    AS $_$begin
 update personas_naturales
 set pnt_nombres = $1, pnt_apellidos=$2,  pnt_email= $3, pnt_otro_documento= $4
 where pnt_personas_naturales_pk = $5;
 return $5;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.upd_personas_naturales(character varying, character varying, character varying, character varying, integer) OWNER TO postgres;

--
-- TOC entry 106 (class 1255 OID 35338609)
-- Dependencies: 495 5
-- Name: upd_rendimientos(character varying, boolean, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION upd_rendimientos(character varying, boolean, bigint) RETURNS bigint
    AS $_$BEGIN
UPDATE rendimientos
   SET  ren_descripcion=$1, ren_activo=$2
 WHERE ren_rendimientos_pk=$3;
RETURN $3;
END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.upd_rendimientos(character varying, boolean, bigint) OWNER TO postgres;

--
-- TOC entry 107 (class 1255 OID 35338610)
-- Dependencies: 495 5
-- Name: upd_sol_rec_xtipo(bigint, bigint, date, boolean, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION upd_sol_rec_xtipo(bigint, bigint, date, boolean, bigint) RETURNS bigint
    AS $_$BEGIN
UPDATE sol_rec_xtipo
   SET ctp_contratistas_tipo_fk=$1, svr_solvencias_recaudos_fk=$2, 
       srt_vigente_hasta=$3, srt_obligatorio=$4
 WHERE srt_sol_rec_xtipo_pk=$5;
RETURN $5;
END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.upd_sol_rec_xtipo(bigint, bigint, date, boolean, bigint) OWNER TO postgres;

--
-- TOC entry 108 (class 1255 OID 35338611)
-- Dependencies: 495 5
-- Name: upd_solvencias_recaudos(character varying, boolean, integer, boolean, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION upd_solvencias_recaudos(character varying, boolean, integer, boolean, bigint) RETURNS bigint
    AS $_$begin
 UPDATE solvencias_recaudos
  SET svr_descripcion = $1, svr_tiene_vencimiento = $2, svr_vencimiento_dias = $3, svr_activo=$4
  WHERE  svr_solvencias_recaudos_pk = $5;
 return $5;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.upd_solvencias_recaudos(character varying, boolean, integer, boolean, bigint) OWNER TO postgres;

--
-- TOC entry 109 (class 1255 OID 35338612)
-- Dependencies: 5 495
-- Name: upd_tipo_actividad(character varying, boolean, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION upd_tipo_actividad(character varying, boolean, bigint) RETURNS bigint
    AS $_$BEGIN
UPDATE tipo_actividad
   SET tpa_nombre=$1, tpa_activo=$2
 WHERE tpa_tipo_actividad_pk=$3;
RETURN $3;
END;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.upd_tipo_actividad(character varying, boolean, bigint) OWNER TO postgres;

--
-- TOC entry 110 (class 1255 OID 35338613)
-- Dependencies: 495 5
-- Name: upd_tipo_cooperativa(character varying, boolean, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION upd_tipo_cooperativa(character varying, boolean, bigint) RETURNS bigint
    AS $_$begin
 update tipo_cooperativa
 set tpc_nombre = $1, tpc_activo  = $2
 where  tpc_tipo_cooperativa_pk = $3;
 return $3;
end;$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.upd_tipo_cooperativa(character varying, boolean, bigint) OWNER TO postgres;

--
-- TOC entry 111 (class 1255 OID 35338614)
-- Dependencies: 5 495
-- Name: upd_tipo_firma(character varying, boolean, bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION upd_tipo_firma(character varying, boolean, bigint) RETURNS bigint
    AS $_$BEGIN
UPDATE tipo_firma
   SET  tpf_descripcion=$1, tpf_activo=$2
 WHERE tpf_tipo_firma_pk=$3;
RETURN $3;
END;
$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.upd_tipo_firma(character varying, boolean, bigint) OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1500 (class 1259 OID 35338251)
-- Dependencies: 5
-- Name: areas_objeto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE areas_objeto (
    aob_areas_objeto_pk integer NOT NULL,
    aob_nombre character varying(150) NOT NULL,
    aob_inicial character varying(10) NOT NULL,
    aob_activo boolean NOT NULL
);


ALTER TABLE public.areas_objeto OWNER TO postgres;

--
-- TOC entry 2316 (class 0 OID 0)
-- Dependencies: 1500
-- Name: TABLE areas_objeto; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE areas_objeto IS 'Se almacena las areas de la economia para la cual las empresas prestan servicios';


--
-- TOC entry 1586 (class 1259 OID 35338615)
-- Dependencies: 5 1500
-- Name: areas_objeto_aob_areas_objeto_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE areas_objeto_aob_areas_objeto_pk_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.areas_objeto_aob_areas_objeto_pk_seq OWNER TO postgres;

--
-- TOC entry 2317 (class 0 OID 0)
-- Dependencies: 1586
-- Name: areas_objeto_aob_areas_objeto_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE areas_objeto_aob_areas_objeto_pk_seq OWNED BY areas_objeto.aob_areas_objeto_pk;


--
-- TOC entry 2318 (class 0 OID 0)
-- Dependencies: 1586
-- Name: areas_objeto_aob_areas_objeto_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('areas_objeto_aob_areas_objeto_pk_seq', 36, true);


--
-- TOC entry 1502 (class 1259 OID 35338255)
-- Dependencies: 5
-- Name: auditoria; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auditoria (
    adt_auditoria_pk integer NOT NULL,
    adt_fecha_hora timestamp with time zone,
    adt_tabla character varying(100),
    adt_accion character varying(50),
    adt_usuario character varying(50),
    adt_pk_registro bigint,
    adt_campo_afectado character varying(100),
    adt_valor_old character varying(250),
    adt_valor_new character varying(250),
    adt_cliente_ip inet
);


ALTER TABLE public.auditoria OWNER TO postgres;

--
-- TOC entry 2319 (class 0 OID 0)
-- Dependencies: 1502
-- Name: TABLE auditoria; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE auditoria IS 'Registro de todos los cambios efectuados en las tablaa del sistema';


--
-- TOC entry 1587 (class 1259 OID 35338617)
-- Dependencies: 1502 5
-- Name: auditoria_adt_auditoria_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auditoria_adt_auditoria_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auditoria_adt_auditoria_pk_seq OWNER TO postgres;

--
-- TOC entry 2320 (class 0 OID 0)
-- Dependencies: 1587
-- Name: auditoria_adt_auditoria_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auditoria_adt_auditoria_pk_seq OWNED BY auditoria.adt_auditoria_pk;


--
-- TOC entry 2321 (class 0 OID 0)
-- Dependencies: 1587
-- Name: auditoria_adt_auditoria_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auditoria_adt_auditoria_pk_seq', 1, false);


--
-- TOC entry 1503 (class 1259 OID 35338260)
-- Dependencies: 5
-- Name: ciudades; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ciudades (
    ciu_ciudades_pk integer NOT NULL,
    mun_municipio_fk integer,
    ciu_nombre character varying(150) NOT NULL,
    ciu_abreviatura character varying(15) NOT NULL,
    ciu_activo boolean NOT NULL
);


ALTER TABLE public.ciudades OWNER TO postgres;

--
-- TOC entry 2322 (class 0 OID 0)
-- Dependencies: 1503
-- Name: TABLE ciudades; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE ciudades IS 'Listado de ciudades por municipio';


--
-- TOC entry 1588 (class 1259 OID 35338619)
-- Dependencies: 5 1503
-- Name: ciudades_ciu_ciudades_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ciudades_ciu_ciudades_pk_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.ciudades_ciu_ciudades_pk_seq OWNER TO postgres;

--
-- TOC entry 2323 (class 0 OID 0)
-- Dependencies: 1588
-- Name: ciudades_ciu_ciudades_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ciudades_ciu_ciudades_pk_seq OWNED BY ciudades.ciu_ciudades_pk;


--
-- TOC entry 2324 (class 0 OID 0)
-- Dependencies: 1588
-- Name: ciudades_ciu_ciudades_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ciudades_ciu_ciudades_pk_seq', 338, true);


--
-- TOC entry 1631 (class 1259 OID 35871069)
-- Dependencies: 5
-- Name: con; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE con (
    con_contratistas_pk bigint NOT NULL,
    nfs_nivel_financiero_snc_fk integer,
    tpc_tipo_cooperativa_fk integer,
    ciu_ciudades_fk integer,
    ctp_contratistas_tipo_fk integer,
    ett_contratistas_estatus_fk integer,
    con_nombre character varying(200) NOT NULL,
    con_siglas character varying(100),
    con_numero_rif character varying(50) NOT NULL,
    con_numero_rnc character varying(50),
    con_fecha_inscripcion_rnc date NOT NULL,
    con_fecha_vencimiento_rnc date NOT NULL,
    con_direccion_fiscal character varying(200) NOT NULL,
    con_codigo_postal character varying(12),
    con_email character varying(150) NOT NULL,
    tpf_tipo_firma_fk smallint,
    con_calificacion_financiera character varying(5),
    con_capacidad_financiera numeric(20,2),
    con_objeto_cooperativa character varying(250),
    con_tiempo_cooperativa bigint,
    con_objeto_social_cooperativa character varying(250),
    con_duracion_cooperativa bigint,
    ics_indice_capital_social_fk bigint,
    con_fecha_inscripcion date,
    con_codigo_siez character varying(50)
);


ALTER TABLE public.con OWNER TO postgres;

--
-- TOC entry 1504 (class 1259 OID 35338262)
-- Dependencies: 5
-- Name: contratista_evaluacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE contratista_evaluacion (
    eva_contratista_evaluacion_pk integer NOT NULL,
    svr_solvencias_recaudos_fk integer,
    con_contratistas_fk integer,
    eva_fecha_emision date,
    eva_estatus character varying(5),
    eva_fecha_vencimiento date,
    eva_codigo_ancla character varying(20)
);


ALTER TABLE public.contratista_evaluacion OWNER TO postgres;

--
-- TOC entry 2325 (class 0 OID 0)
-- Dependencies: 1504
-- Name: TABLE contratista_evaluacion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE contratista_evaluacion IS 'Se almacena los distintos rubros de evaluaciÃ³n de la contratista';


--
-- TOC entry 1589 (class 1259 OID 35338621)
-- Dependencies: 5 1504
-- Name: contratista_evaluacion_eva_contratista_evaluacion_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contratista_evaluacion_eva_contratista_evaluacion_pk_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.contratista_evaluacion_eva_contratista_evaluacion_pk_seq OWNER TO postgres;

--
-- TOC entry 2326 (class 0 OID 0)
-- Dependencies: 1589
-- Name: contratista_evaluacion_eva_contratista_evaluacion_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contratista_evaluacion_eva_contratista_evaluacion_pk_seq OWNED BY contratista_evaluacion.eva_contratista_evaluacion_pk;


--
-- TOC entry 2327 (class 0 OID 0)
-- Dependencies: 1589
-- Name: contratista_evaluacion_eva_contratista_evaluacion_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('contratista_evaluacion_eva_contratista_evaluacion_pk_seq', 1485, true);


--
-- TOC entry 1505 (class 1259 OID 35338264)
-- Dependencies: 5
-- Name: contratistas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE contratistas (
    con_contratistas_pk integer NOT NULL,
    nfs_nivel_financiero_snc_fk integer,
    tpc_tipo_cooperativa_fk integer,
    ciu_ciudades_fk integer,
    ctp_contratistas_tipo_fk integer,
    ett_contratistas_estatus_fk integer,
    con_nombre character varying(200) NOT NULL,
    con_siglas character varying(100),
    con_numero_rif character varying(50) NOT NULL,
    con_numero_rnc character varying(50),
    con_fecha_inscripcion_rnc date NOT NULL,
    con_fecha_vencimiento_rnc date NOT NULL,
    con_direccion_fiscal character varying(200) NOT NULL,
    con_codigo_postal character varying(12),
    con_email character varying(150) NOT NULL,
    tpf_tipo_firma_fk smallint,
    con_calificacion_financiera character varying(5),
    con_capacidad_financiera numeric(20,2),
    con_objeto_cooperativa character varying(250),
    con_tiempo_cooperativa bigint,
    con_objeto_social_cooperativa character varying(250),
    con_duracion_cooperativa bigint,
    ics_indice_capital_social_fk bigint,
    con_fecha_inscripcion date,
    con_codigo_siez character varying(50)
);


ALTER TABLE public.contratistas OWNER TO postgres;

--
-- TOC entry 2328 (class 0 OID 0)
-- Dependencies: 1505
-- Name: TABLE contratistas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE contratistas IS 'InformaciÃ³n general de la empresa contratista o cooperativa';


--
-- TOC entry 1506 (class 1259 OID 35338269)
-- Dependencies: 5
-- Name: contratistas_acjdrl; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE contratistas_acjdrl (
    ajr_contratistas_acjdrl_pk integer NOT NULL,
    con_contratistas_fk integer,
    pnt_personas_naturales_fk integer,
    ajr_cargo_actual character varying(50),
    ajr_accionista boolean,
    ajr_miembro_junta_directiva boolean,
    ajr_representante_legal boolean,
    ajr_porcentaje_acciones numeric(5,2)
);


ALTER TABLE public.contratistas_acjdrl OWNER TO postgres;

--
-- TOC entry 2329 (class 0 OID 0)
-- Dependencies: 1506
-- Name: TABLE contratistas_acjdrl; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE contratistas_acjdrl IS 'Se registran los accionistas, representantes legales y junta directiva de la empresa';


--
-- TOC entry 1590 (class 1259 OID 35338623)
-- Dependencies: 1506 5
-- Name: contratistas_acjdrl_ajr_contratistas_acjdrl_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contratistas_acjdrl_ajr_contratistas_acjdrl_pk_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.contratistas_acjdrl_ajr_contratistas_acjdrl_pk_seq OWNER TO postgres;

--
-- TOC entry 2330 (class 0 OID 0)
-- Dependencies: 1590
-- Name: contratistas_acjdrl_ajr_contratistas_acjdrl_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contratistas_acjdrl_ajr_contratistas_acjdrl_pk_seq OWNED BY contratistas_acjdrl.ajr_contratistas_acjdrl_pk;


--
-- TOC entry 2331 (class 0 OID 0)
-- Dependencies: 1590
-- Name: contratistas_acjdrl_ajr_contratistas_acjdrl_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('contratistas_acjdrl_ajr_contratistas_acjdrl_pk_seq', 220, true);


--
-- TOC entry 1507 (class 1259 OID 35338271)
-- Dependencies: 5
-- Name: contratistas_comisarios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE contratistas_comisarios (
    com_contratistas_comisarios_pk integer NOT NULL,
    con_contratistas_fk integer,
    pnt_personas_naturales_fk integer,
    com_profesion character varying(150) NOT NULL,
    com_numero_colegiado character varying(30) NOT NULL,
    com_vigencia_colegiado date
);


ALTER TABLE public.contratistas_comisarios OWNER TO postgres;

--
-- TOC entry 2332 (class 0 OID 0)
-- Dependencies: 1507
-- Name: TABLE contratistas_comisarios; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE contratistas_comisarios IS 'Registro de los comisarios de la empresa';


--
-- TOC entry 1591 (class 1259 OID 35338625)
-- Dependencies: 1507 5
-- Name: contratistas_comisarios_com_contratistas_comisarios_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contratistas_comisarios_com_contratistas_comisarios_pk_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.contratistas_comisarios_com_contratistas_comisarios_pk_seq OWNER TO postgres;

--
-- TOC entry 2333 (class 0 OID 0)
-- Dependencies: 1591
-- Name: contratistas_comisarios_com_contratistas_comisarios_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contratistas_comisarios_com_contratistas_comisarios_pk_seq OWNED BY contratistas_comisarios.com_contratistas_comisarios_pk;


--
-- TOC entry 2334 (class 0 OID 0)
-- Dependencies: 1591
-- Name: contratistas_comisarios_com_contratistas_comisarios_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('contratistas_comisarios_com_contratistas_comisarios_pk_seq', 33, true);


--
-- TOC entry 1592 (class 1259 OID 35338627)
-- Dependencies: 5 1505
-- Name: contratistas_con_contratistas_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contratistas_con_contratistas_pk_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.contratistas_con_contratistas_pk_seq OWNER TO postgres;

--
-- TOC entry 2335 (class 0 OID 0)
-- Dependencies: 1592
-- Name: contratistas_con_contratistas_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contratistas_con_contratistas_pk_seq OWNED BY contratistas.con_contratistas_pk;


--
-- TOC entry 2336 (class 0 OID 0)
-- Dependencies: 1592
-- Name: contratistas_con_contratistas_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('contratistas_con_contratistas_pk_seq', 204, true);


--
-- TOC entry 1508 (class 1259 OID 35338273)
-- Dependencies: 5
-- Name: contratistas_contratos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE contratistas_contratos (
    ctt_contratistas_contratos_pk integer NOT NULL,
    con_contratistas_fk integer,
    tpa_tipo_actividad_fk integer,
    ett_estatus_fk integer,
    org_organismos_fk integer,
    ctt_numero character varying(100) NOT NULL,
    ctt_descripcion character varying(250) NOT NULL,
    ctt_fecha date NOT NULL,
    ctt_observaciones character varying(250),
    ren_rendimiento_fk bigint
);


ALTER TABLE public.contratistas_contratos OWNER TO postgres;

--
-- TOC entry 2337 (class 0 OID 0)
-- Dependencies: 1508
-- Name: TABLE contratistas_contratos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE contratistas_contratos IS 'Almacena los contratos que ha tenido la contratista con los organismos adscritos al ente regulador';


--
-- TOC entry 1593 (class 1259 OID 35338629)
-- Dependencies: 1508 5
-- Name: contratistas_contratos_ctt_contratistas_contratos_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contratistas_contratos_ctt_contratistas_contratos_pk_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.contratistas_contratos_ctt_contratistas_contratos_pk_seq OWNER TO postgres;

--
-- TOC entry 2339 (class 0 OID 0)
-- Dependencies: 1593
-- Name: contratistas_contratos_ctt_contratistas_contratos_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contratistas_contratos_ctt_contratistas_contratos_pk_seq OWNED BY contratistas_contratos.ctt_contratistas_contratos_pk;


--
-- TOC entry 2340 (class 0 OID 0)
-- Dependencies: 1593
-- Name: contratistas_contratos_ctt_contratistas_contratos_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('contratistas_contratos_ctt_contratistas_contratos_pk_seq', 55, true);


--
-- TOC entry 1509 (class 1259 OID 35338278)
-- Dependencies: 5
-- Name: contratistas_estatus; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE contratistas_estatus (
    ett_contratistas_estatus_pk integer NOT NULL,
    ett_nombre character varying(100),
    ett_activo boolean
);


ALTER TABLE public.contratistas_estatus OWNER TO postgres;

--
-- TOC entry 2341 (class 0 OID 0)
-- Dependencies: 1509
-- Name: TABLE contratistas_estatus; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE contratistas_estatus IS 'Estatus de las empresas o cooperativas dentro del Registro de Contratistas';


--
-- TOC entry 1594 (class 1259 OID 35338631)
-- Dependencies: 1509 5
-- Name: contratistas_estatus_ett_contratistas_estatus_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contratistas_estatus_ett_contratistas_estatus_pk_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.contratistas_estatus_ett_contratistas_estatus_pk_seq OWNER TO postgres;

--
-- TOC entry 2342 (class 0 OID 0)
-- Dependencies: 1594
-- Name: contratistas_estatus_ett_contratistas_estatus_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contratistas_estatus_ett_contratistas_estatus_pk_seq OWNED BY contratistas_estatus.ett_contratistas_estatus_pk;


--
-- TOC entry 2343 (class 0 OID 0)
-- Dependencies: 1594
-- Name: contratistas_estatus_ett_contratistas_estatus_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('contratistas_estatus_ett_contratistas_estatus_pk_seq', 5, true);


--
-- TOC entry 1510 (class 1259 OID 35338280)
-- Dependencies: 5
-- Name: contratistas_legal; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE contratistas_legal (
    clg_contratistas_legal_pk integer NOT NULL,
    con_contratistas_fk integer,
    dec_denominacion_comercial_fk integer,
    clg_numero_registro character varying(50),
    clg_circunscripcion_judicial character varying(200),
    clg_fecha_inscripcion date,
    clg_numero_inscripcion character varying(100),
    clg_numero_tomo character varying(50),
    clg_numero_folio character varying(50),
    clg_objeto_social character varying(10000),
    clg_domicilio_legal_actual character varying(200),
    clg_fecha_constitutiva date,
    clg_cierre_fiscal_actual date,
    clg_capital_social_suscrito numeric(20,2),
    clg_capital_social_pagado numeric(20,2),
    clg_modificacion boolean,
    clg_numero_modificaciones character varying(15),
    clg_observaciones character varying(250)
);


ALTER TABLE public.contratistas_legal OWNER TO postgres;

--
-- TOC entry 2344 (class 0 OID 0)
-- Dependencies: 1510
-- Name: TABLE contratistas_legal; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE contratistas_legal IS 'Informacion legal de la empresa';


--
-- TOC entry 2345 (class 0 OID 0)
-- Dependencies: 1510
-- Name: COLUMN contratistas_legal.clg_contratistas_legal_pk; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN contratistas_legal.clg_contratistas_legal_pk IS 'Identificador primario de la tabla contratistas legal. ';


--
-- TOC entry 2346 (class 0 OID 0)
-- Dependencies: 1510
-- Name: COLUMN contratistas_legal.con_contratistas_fk; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN contratistas_legal.con_contratistas_fk IS 'Identificador foraneo de la tabla contratista.';


--
-- TOC entry 2347 (class 0 OID 0)
-- Dependencies: 1510
-- Name: COLUMN contratistas_legal.dec_denominacion_comercial_fk; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN contratistas_legal.dec_denominacion_comercial_fk IS 'Identificador foraneo de la tabla denominacion comercial.';


--
-- TOC entry 2348 (class 0 OID 0)
-- Dependencies: 1510
-- Name: COLUMN contratistas_legal.clg_numero_registro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN contratistas_legal.clg_numero_registro IS 'Registra el numero de registro legal de la empresa.';


--
-- TOC entry 2349 (class 0 OID 0)
-- Dependencies: 1510
-- Name: COLUMN contratistas_legal.clg_circunscripcion_judicial; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN contratistas_legal.clg_circunscripcion_judicial IS 'Registra la fecha de inscripcion de la empresa en el registro de comercio.';


--
-- TOC entry 2350 (class 0 OID 0)
-- Dependencies: 1510
-- Name: COLUMN contratistas_legal.clg_fecha_inscripcion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN contratistas_legal.clg_fecha_inscripcion IS 'Registra la fecha de inscripcion de la empresa en el registro de comercio.';


--
-- TOC entry 2351 (class 0 OID 0)
-- Dependencies: 1510
-- Name: COLUMN contratistas_legal.clg_numero_inscripcion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN contratistas_legal.clg_numero_inscripcion IS 'Almacena el numero del registro de comercio de la empresa.';


--
-- TOC entry 2352 (class 0 OID 0)
-- Dependencies: 1510
-- Name: COLUMN contratistas_legal.clg_numero_tomo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN contratistas_legal.clg_numero_tomo IS 'Registra el numero del tomo  del libro de registro de la empresa.';


--
-- TOC entry 2353 (class 0 OID 0)
-- Dependencies: 1510
-- Name: COLUMN contratistas_legal.clg_numero_folio; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN contratistas_legal.clg_numero_folio IS 'Registra el número de folio correspondiente al registro de la empresa.';


--
-- TOC entry 2354 (class 0 OID 0)
-- Dependencies: 1510
-- Name: COLUMN contratistas_legal.clg_objeto_social; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN contratistas_legal.clg_objeto_social IS 'Registra el objeto social a la cual se dedica la empresa.';


--
-- TOC entry 2355 (class 0 OID 0)
-- Dependencies: 1510
-- Name: COLUMN contratistas_legal.clg_domicilio_legal_actual; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN contratistas_legal.clg_domicilio_legal_actual IS 'Registra la dirección fiscal de la Empresa.';


--
-- TOC entry 2356 (class 0 OID 0)
-- Dependencies: 1510
-- Name: COLUMN contratistas_legal.clg_fecha_constitutiva; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN contratistas_legal.clg_fecha_constitutiva IS 'Registra la fecha de constitución legal de la empresa.';


--
-- TOC entry 2357 (class 0 OID 0)
-- Dependencies: 1510
-- Name: COLUMN contratistas_legal.clg_cierre_fiscal_actual; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN contratistas_legal.clg_cierre_fiscal_actual IS 'Registra la fecha del cierre del ejercicio fiscal anual de la empresa.';


--
-- TOC entry 2358 (class 0 OID 0)
-- Dependencies: 1510
-- Name: COLUMN contratistas_legal.clg_capital_social_suscrito; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN contratistas_legal.clg_capital_social_suscrito IS 'Registra el monto del capital social suscrito de la empresa.';


--
-- TOC entry 2359 (class 0 OID 0)
-- Dependencies: 1510
-- Name: COLUMN contratistas_legal.clg_capital_social_pagado; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN contratistas_legal.clg_capital_social_pagado IS 'Registra el monto del capital social pagado hasta la fecha por la empresa.';


--
-- TOC entry 2360 (class 0 OID 0)
-- Dependencies: 1510
-- Name: COLUMN contratistas_legal.clg_modificacion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN contratistas_legal.clg_modificacion IS 'Registra si la empresa posee modificaciones de actas constitutivas.';


--
-- TOC entry 2361 (class 0 OID 0)
-- Dependencies: 1510
-- Name: COLUMN contratistas_legal.clg_numero_modificaciones; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN contratistas_legal.clg_numero_modificaciones IS 'Registra el numero de modificaciones existentes en actas constitutivas de la empresa.';


--
-- TOC entry 1595 (class 1259 OID 35338633)
-- Dependencies: 1510 5
-- Name: contratistas_legal_clg_contratistas_legal_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contratistas_legal_clg_contratistas_legal_pk_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.contratistas_legal_clg_contratistas_legal_pk_seq OWNER TO postgres;

--
-- TOC entry 2362 (class 0 OID 0)
-- Dependencies: 1595
-- Name: contratistas_legal_clg_contratistas_legal_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contratistas_legal_clg_contratistas_legal_pk_seq OWNED BY contratistas_legal.clg_contratistas_legal_pk;


--
-- TOC entry 2363 (class 0 OID 0)
-- Dependencies: 1595
-- Name: contratistas_legal_clg_contratistas_legal_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('contratistas_legal_clg_contratistas_legal_pk_seq', 99, true);


--
-- TOC entry 1511 (class 1259 OID 35338285)
-- Dependencies: 5
-- Name: contratistas_solvencias; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE contratistas_solvencias (
    sol_contratistas_solvencias_pk integer NOT NULL,
    con_contratistas_fk integer,
    sol_fecha_emision date NOT NULL,
    sol_fecha_vencimiento date NOT NULL,
    sol_periodo character varying(10),
    sol_activo boolean NOT NULL
);


ALTER TABLE public.contratistas_solvencias OWNER TO postgres;

--
-- TOC entry 2364 (class 0 OID 0)
-- Dependencies: 1511
-- Name: TABLE contratistas_solvencias; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE contratistas_solvencias IS 'Alamacena todas las solvencias de las contratistas emitidas con su fecha de vencimiento';


--
-- TOC entry 1596 (class 1259 OID 35338635)
-- Dependencies: 5 1511
-- Name: contratistas_solvencias_sol_contratistas_solvencias_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contratistas_solvencias_sol_contratistas_solvencias_pk_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.contratistas_solvencias_sol_contratistas_solvencias_pk_seq OWNER TO postgres;

--
-- TOC entry 2365 (class 0 OID 0)
-- Dependencies: 1596
-- Name: contratistas_solvencias_sol_contratistas_solvencias_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contratistas_solvencias_sol_contratistas_solvencias_pk_seq OWNED BY contratistas_solvencias.sol_contratistas_solvencias_pk;


--
-- TOC entry 2366 (class 0 OID 0)
-- Dependencies: 1596
-- Name: contratistas_solvencias_sol_contratistas_solvencias_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('contratistas_solvencias_sol_contratistas_solvencias_pk_seq', 34, true);


--
-- TOC entry 1512 (class 1259 OID 35338287)
-- Dependencies: 5
-- Name: contratistas_sucursales; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE contratistas_sucursales (
    csu_contratistas_sucursales_pk integer NOT NULL,
    con_contratistas_fk integer,
    csu_descripcion character varying(150) NOT NULL,
    csu_direccion character varying(200) NOT NULL,
    csu_activo boolean
);


ALTER TABLE public.contratistas_sucursales OWNER TO postgres;

--
-- TOC entry 2367 (class 0 OID 0)
-- Dependencies: 1512
-- Name: TABLE contratistas_sucursales; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE contratistas_sucursales IS 'Almacena todas las sucursales de la empresa';


--
-- TOC entry 1597 (class 1259 OID 35338637)
-- Dependencies: 1512 5
-- Name: contratistas_sucursales_csu_contratistas_sucursales_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contratistas_sucursales_csu_contratistas_sucursales_pk_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.contratistas_sucursales_csu_contratistas_sucursales_pk_seq OWNER TO postgres;

--
-- TOC entry 2368 (class 0 OID 0)
-- Dependencies: 1597
-- Name: contratistas_sucursales_csu_contratistas_sucursales_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contratistas_sucursales_csu_contratistas_sucursales_pk_seq OWNED BY contratistas_sucursales.csu_contratistas_sucursales_pk;


--
-- TOC entry 2369 (class 0 OID 0)
-- Dependencies: 1597
-- Name: contratistas_sucursales_csu_contratistas_sucursales_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('contratistas_sucursales_csu_contratistas_sucursales_pk_seq', 177, true);


--
-- TOC entry 1513 (class 1259 OID 35338289)
-- Dependencies: 5
-- Name: contratistas_tipo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE contratistas_tipo (
    ctp_contratistas_tipo_pk integer NOT NULL,
    ctp_descripcion character varying(150) NOT NULL,
    ctp_activo boolean NOT NULL
);


ALTER TABLE public.contratistas_tipo OWNER TO postgres;

--
-- TOC entry 2370 (class 0 OID 0)
-- Dependencies: 1513
-- Name: TABLE contratistas_tipo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE contratistas_tipo IS 'Tipo de contratistas o empresas';


--
-- TOC entry 1598 (class 1259 OID 35338639)
-- Dependencies: 5 1513
-- Name: contratistas_tipo_ctp_contratistas_tipo_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contratistas_tipo_ctp_contratistas_tipo_pk_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.contratistas_tipo_ctp_contratistas_tipo_pk_seq OWNER TO postgres;

--
-- TOC entry 2371 (class 0 OID 0)
-- Dependencies: 1598
-- Name: contratistas_tipo_ctp_contratistas_tipo_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contratistas_tipo_ctp_contratistas_tipo_pk_seq OWNED BY contratistas_tipo.ctp_contratistas_tipo_pk;


--
-- TOC entry 2372 (class 0 OID 0)
-- Dependencies: 1598
-- Name: contratistas_tipo_ctp_contratistas_tipo_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('contratistas_tipo_ctp_contratistas_tipo_pk_seq', 14, true);


--
-- TOC entry 1514 (class 1259 OID 35338291)
-- Dependencies: 5
-- Name: denominacion_comercial; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE denominacion_comercial (
    dec_denominacion_comercial_pk integer NOT NULL,
    dec_descripcion character varying(100) NOT NULL,
    dec_abreviatura character varying(10) NOT NULL,
    dec_activo boolean
);


ALTER TABLE public.denominacion_comercial OWNER TO postgres;

--
-- TOC entry 1599 (class 1259 OID 35338641)
-- Dependencies: 1514 5
-- Name: denominacion_comercial_dec_denominacion_comercial_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE denominacion_comercial_dec_denominacion_comercial_pk_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.denominacion_comercial_dec_denominacion_comercial_pk_seq OWNER TO postgres;

--
-- TOC entry 2373 (class 0 OID 0)
-- Dependencies: 1599
-- Name: denominacion_comercial_dec_denominacion_comercial_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE denominacion_comercial_dec_denominacion_comercial_pk_seq OWNED BY denominacion_comercial.dec_denominacion_comercial_pk;


--
-- TOC entry 2374 (class 0 OID 0)
-- Dependencies: 1599
-- Name: denominacion_comercial_dec_denominacion_comercial_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('denominacion_comercial_dec_denominacion_comercial_pk_seq', 5, true);


--
-- TOC entry 1515 (class 1259 OID 35338293)
-- Dependencies: 5
-- Name: esp_are_xcontratista; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE esp_are_xcontratista (
    eac_esp_are_xcontratista_pk integer NOT NULL,
    con_contratistas_fk integer,
    epo_especialidad_objeto_fk integer,
    eac_principal boolean
);


ALTER TABLE public.esp_are_xcontratista OWNER TO postgres;

--
-- TOC entry 1600 (class 1259 OID 35338643)
-- Dependencies: 5 1515
-- Name: esp_are_xcontratista_eac_esp_are_xcontratista_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE esp_are_xcontratista_eac_esp_are_xcontratista_pk_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.esp_are_xcontratista_eac_esp_are_xcontratista_pk_seq OWNER TO postgres;

--
-- TOC entry 2375 (class 0 OID 0)
-- Dependencies: 1600
-- Name: esp_are_xcontratista_eac_esp_are_xcontratista_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE esp_are_xcontratista_eac_esp_are_xcontratista_pk_seq OWNED BY esp_are_xcontratista.eac_esp_are_xcontratista_pk;


--
-- TOC entry 2376 (class 0 OID 0)
-- Dependencies: 1600
-- Name: esp_are_xcontratista_eac_esp_are_xcontratista_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('esp_are_xcontratista_eac_esp_are_xcontratista_pk_seq', 398, true);


--
-- TOC entry 1516 (class 1259 OID 35338295)
-- Dependencies: 5
-- Name: especialidad_objeto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE especialidad_objeto (
    epo_especialidad_objeto_pk integer NOT NULL,
    aob_areas_objeto_fk integer,
    epo_nombre character varying(150) NOT NULL,
    epo_inicial character varying(10) NOT NULL,
    epo_activo boolean
);


ALTER TABLE public.especialidad_objeto OWNER TO postgres;

--
-- TOC entry 2377 (class 0 OID 0)
-- Dependencies: 1516
-- Name: TABLE especialidad_objeto; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE especialidad_objeto IS 'Se cataloga las subareas de la economia';


--
-- TOC entry 1601 (class 1259 OID 35338645)
-- Dependencies: 1516 5
-- Name: especialidad_objeto_epo_especialidad_objeto_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE especialidad_objeto_epo_especialidad_objeto_pk_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.especialidad_objeto_epo_especialidad_objeto_pk_seq OWNER TO postgres;

--
-- TOC entry 2378 (class 0 OID 0)
-- Dependencies: 1601
-- Name: especialidad_objeto_epo_especialidad_objeto_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE especialidad_objeto_epo_especialidad_objeto_pk_seq OWNED BY especialidad_objeto.epo_especialidad_objeto_pk;


--
-- TOC entry 2379 (class 0 OID 0)
-- Dependencies: 1601
-- Name: especialidad_objeto_epo_especialidad_objeto_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('especialidad_objeto_epo_especialidad_objeto_pk_seq', 27, true);


--
-- TOC entry 1517 (class 1259 OID 35338297)
-- Dependencies: 5
-- Name: estados; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estados (
    est_estados_pk integer NOT NULL,
    est_nombre character varying(150) NOT NULL,
    est_abreviatura character varying(10) NOT NULL,
    est_activo boolean NOT NULL
);


ALTER TABLE public.estados OWNER TO postgres;

--
-- TOC entry 1602 (class 1259 OID 35338647)
-- Dependencies: 1517 5
-- Name: estados_est_estados_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estados_est_estados_pk_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.estados_est_estados_pk_seq OWNER TO postgres;

--
-- TOC entry 2380 (class 0 OID 0)
-- Dependencies: 1602
-- Name: estados_est_estados_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estados_est_estados_pk_seq OWNED BY estados.est_estados_pk;


--
-- TOC entry 2381 (class 0 OID 0)
-- Dependencies: 1602
-- Name: estados_est_estados_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estados_est_estados_pk_seq', 30, true);


--
-- TOC entry 1518 (class 1259 OID 35338299)
-- Dependencies: 5
-- Name: estatus; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estatus (
    ett_estatus_pk integer NOT NULL,
    ett_nombre character varying(150),
    ett_activo boolean
);


ALTER TABLE public.estatus OWNER TO postgres;

--
-- TOC entry 2382 (class 0 OID 0)
-- Dependencies: 1518
-- Name: TABLE estatus; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE estatus IS 'Almacena los estados que puede tener un contrato';


--
-- TOC entry 1603 (class 1259 OID 35338649)
-- Dependencies: 1518 5
-- Name: estatus_ett_estatus_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estatus_ett_estatus_pk_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.estatus_ett_estatus_pk_seq OWNER TO postgres;

--
-- TOC entry 2383 (class 0 OID 0)
-- Dependencies: 1603
-- Name: estatus_ett_estatus_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estatus_ett_estatus_pk_seq OWNED BY estatus.ett_estatus_pk;


--
-- TOC entry 2384 (class 0 OID 0)
-- Dependencies: 1603
-- Name: estatus_ett_estatus_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estatus_ett_estatus_pk_seq', 13, true);


--
-- TOC entry 1519 (class 1259 OID 35338301)
-- Dependencies: 5
-- Name: indice_capital_social; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE indice_capital_social (
    ics_indice_capital_social_pk integer NOT NULL,
    ics_descripcion character varying(50) NOT NULL,
    ics_desde numeric(20,2) NOT NULL,
    ics_hasta numeric(20,2) NOT NULL,
    ics_activo boolean NOT NULL
);


ALTER TABLE public.indice_capital_social OWNER TO postgres;

--
-- TOC entry 1604 (class 1259 OID 35338651)
-- Dependencies: 1519 5
-- Name: indice_capital_social_ics_indice_capital_social_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE indice_capital_social_ics_indice_capital_social_pk_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.indice_capital_social_ics_indice_capital_social_pk_seq OWNER TO postgres;

--
-- TOC entry 2385 (class 0 OID 0)
-- Dependencies: 1604
-- Name: indice_capital_social_ics_indice_capital_social_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE indice_capital_social_ics_indice_capital_social_pk_seq OWNED BY indice_capital_social.ics_indice_capital_social_pk;


--
-- TOC entry 2386 (class 0 OID 0)
-- Dependencies: 1604
-- Name: indice_capital_social_ics_indice_capital_social_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('indice_capital_social_ics_indice_capital_social_pk_seq', 17, true);


--
-- TOC entry 1520 (class 1259 OID 35338303)
-- Dependencies: 5
-- Name: municipio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE municipio (
    mun_municipio_pk integer NOT NULL,
    est_estados_fk integer,
    mun_nombre character varying(150) NOT NULL,
    mun_abreviatura character varying(10) NOT NULL,
    mun_activo boolean NOT NULL
);


ALTER TABLE public.municipio OWNER TO postgres;

--
-- TOC entry 2387 (class 0 OID 0)
-- Dependencies: 1520
-- Name: TABLE municipio; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE municipio IS 'Municipios por estado';


--
-- TOC entry 1605 (class 1259 OID 35338653)
-- Dependencies: 1520 5
-- Name: municipio_mun_municipio_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE municipio_mun_municipio_pk_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.municipio_mun_municipio_pk_seq OWNER TO postgres;

--
-- TOC entry 2388 (class 0 OID 0)
-- Dependencies: 1605
-- Name: municipio_mun_municipio_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE municipio_mun_municipio_pk_seq OWNED BY municipio.mun_municipio_pk;


--
-- TOC entry 2389 (class 0 OID 0)
-- Dependencies: 1605
-- Name: municipio_mun_municipio_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('municipio_mun_municipio_pk_seq', 1, false);


--
-- TOC entry 1521 (class 1259 OID 35338305)
-- Dependencies: 5
-- Name: nivel_financiero_snc; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE nivel_financiero_snc (
    nfs_nivel_financiero_snc_pk integer NOT NULL,
    nfs_nivel character varying(15),
    nfs_capital_desde numeric(20,2),
    nfs_capital_hasta numeric(20,2)
);


ALTER TABLE public.nivel_financiero_snc OWNER TO postgres;

--
-- TOC entry 2390 (class 0 OID 0)
-- Dependencies: 1521
-- Name: TABLE nivel_financiero_snc; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE nivel_financiero_snc IS 'Tabla de nivel financiero segun SNC';


--
-- TOC entry 1606 (class 1259 OID 35338655)
-- Dependencies: 5 1521
-- Name: nivel_financiero_snc_nfs_nivel_financiero_snc_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE nivel_financiero_snc_nfs_nivel_financiero_snc_pk_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.nivel_financiero_snc_nfs_nivel_financiero_snc_pk_seq OWNER TO postgres;

--
-- TOC entry 2391 (class 0 OID 0)
-- Dependencies: 1606
-- Name: nivel_financiero_snc_nfs_nivel_financiero_snc_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE nivel_financiero_snc_nfs_nivel_financiero_snc_pk_seq OWNED BY nivel_financiero_snc.nfs_nivel_financiero_snc_pk;


--
-- TOC entry 2392 (class 0 OID 0)
-- Dependencies: 1606
-- Name: nivel_financiero_snc_nfs_nivel_financiero_snc_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('nivel_financiero_snc_nfs_nivel_financiero_snc_pk_seq', 62, true);


--
-- TOC entry 1522 (class 1259 OID 35338307)
-- Dependencies: 5
-- Name: numeros_telefonicos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE numeros_telefonicos (
    tel_numeros_telefonicos_pk integer NOT NULL,
    ntt_numeros_telefonicos_tipo_fk integer,
    con_contratistas_fk integer,
    tel_numero character varying(75),
    tel_codigo_area character varying(10),
    tel_activo boolean
);


ALTER TABLE public.numeros_telefonicos OWNER TO postgres;

--
-- TOC entry 2393 (class 0 OID 0)
-- Dependencies: 1522
-- Name: TABLE numeros_telefonicos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE numeros_telefonicos IS 'Se almacena los distintos numeros telefonicos de la empresa';


--
-- TOC entry 1523 (class 1259 OID 35338309)
-- Dependencies: 5
-- Name: numeros_telefonicos_sucursales; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE numeros_telefonicos_sucursales (
    tls_numeros_telefonicos_sucursales_pk integer NOT NULL,
    ntt_numeros_telefonicos_tipo_fk integer,
    csu_contratistas_sucursales_fk integer,
    tls_numero character varying(75),
    tls_codigo_area character varying(10),
    tls_activo boolean
);


ALTER TABLE public.numeros_telefonicos_sucursales OWNER TO postgres;

--
-- TOC entry 2394 (class 0 OID 0)
-- Dependencies: 1523
-- Name: TABLE numeros_telefonicos_sucursales; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE numeros_telefonicos_sucursales IS 'Se almacena los distintos numeros telefonicos de las sucursales';


--
-- TOC entry 1607 (class 1259 OID 35338657)
-- Dependencies: 5 1523
-- Name: numeros_telefonicos_sucursale_tls_numeros_telefonicos_sucur_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE numeros_telefonicos_sucursale_tls_numeros_telefonicos_sucur_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.numeros_telefonicos_sucursale_tls_numeros_telefonicos_sucur_seq OWNER TO postgres;

--
-- TOC entry 2395 (class 0 OID 0)
-- Dependencies: 1607
-- Name: numeros_telefonicos_sucursale_tls_numeros_telefonicos_sucur_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE numeros_telefonicos_sucursale_tls_numeros_telefonicos_sucur_seq OWNED BY numeros_telefonicos_sucursales.tls_numeros_telefonicos_sucursales_pk;


--
-- TOC entry 2396 (class 0 OID 0)
-- Dependencies: 1607
-- Name: numeros_telefonicos_sucursale_tls_numeros_telefonicos_sucur_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('numeros_telefonicos_sucursale_tls_numeros_telefonicos_sucur_seq', 179, true);


--
-- TOC entry 1608 (class 1259 OID 35338659)
-- Dependencies: 5 1522
-- Name: numeros_telefonicos_tel_numeros_telefonicos_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE numeros_telefonicos_tel_numeros_telefonicos_pk_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.numeros_telefonicos_tel_numeros_telefonicos_pk_seq OWNER TO postgres;

--
-- TOC entry 2397 (class 0 OID 0)
-- Dependencies: 1608
-- Name: numeros_telefonicos_tel_numeros_telefonicos_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE numeros_telefonicos_tel_numeros_telefonicos_pk_seq OWNED BY numeros_telefonicos.tel_numeros_telefonicos_pk;


--
-- TOC entry 2398 (class 0 OID 0)
-- Dependencies: 1608
-- Name: numeros_telefonicos_tel_numeros_telefonicos_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('numeros_telefonicos_tel_numeros_telefonicos_pk_seq', 565, true);


--
-- TOC entry 1524 (class 1259 OID 35338311)
-- Dependencies: 5
-- Name: numeros_telefonicos_tipo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE numeros_telefonicos_tipo (
    ntt_numeros_telefonicos_tipo_pk integer NOT NULL,
    ntt_descripcion character varying(100) NOT NULL,
    ntt_obligatorio boolean
);


ALTER TABLE public.numeros_telefonicos_tipo OWNER TO postgres;

--
-- TOC entry 2399 (class 0 OID 0)
-- Dependencies: 1524
-- Name: TABLE numeros_telefonicos_tipo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE numeros_telefonicos_tipo IS 'ClasificaciÃ³n de los numeros de telefono, ejemplo principal, celular, etc';


--
-- TOC entry 1609 (class 1259 OID 35338661)
-- Dependencies: 5 1524
-- Name: numeros_telefonicos_tipo_ntt_numeros_telefonicos_tipo_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE numeros_telefonicos_tipo_ntt_numeros_telefonicos_tipo_pk_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.numeros_telefonicos_tipo_ntt_numeros_telefonicos_tipo_pk_seq OWNER TO postgres;

--
-- TOC entry 2400 (class 0 OID 0)
-- Dependencies: 1609
-- Name: numeros_telefonicos_tipo_ntt_numeros_telefonicos_tipo_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE numeros_telefonicos_tipo_ntt_numeros_telefonicos_tipo_pk_seq OWNED BY numeros_telefonicos_tipo.ntt_numeros_telefonicos_tipo_pk;


--
-- TOC entry 2401 (class 0 OID 0)
-- Dependencies: 1609
-- Name: numeros_telefonicos_tipo_ntt_numeros_telefonicos_tipo_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('numeros_telefonicos_tipo_ntt_numeros_telefonicos_tipo_pk_seq', 7, true);


--
-- TOC entry 1525 (class 1259 OID 35338313)
-- Dependencies: 5
-- Name: organismos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE organismos (
    org_organismos_pk integer NOT NULL,
    org_nombre character varying(200) NOT NULL,
    org_siglas character varying(50) NOT NULL,
    org_activo boolean
);


ALTER TABLE public.organismos OWNER TO postgres;

--
-- TOC entry 2402 (class 0 OID 0)
-- Dependencies: 1525
-- Name: TABLE organismos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE organismos IS 'Almacena los organismos a evaluar';


--
-- TOC entry 1610 (class 1259 OID 35338663)
-- Dependencies: 1525 5
-- Name: organismos_org_organismos_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE organismos_org_organismos_pk_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.organismos_org_organismos_pk_seq OWNER TO postgres;

--
-- TOC entry 2403 (class 0 OID 0)
-- Dependencies: 1610
-- Name: organismos_org_organismos_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE organismos_org_organismos_pk_seq OWNED BY organismos.org_organismos_pk;


--
-- TOC entry 2404 (class 0 OID 0)
-- Dependencies: 1610
-- Name: organismos_org_organismos_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('organismos_org_organismos_pk_seq', 6, true);


--
-- TOC entry 1526 (class 1259 OID 35338315)
-- Dependencies: 5
-- Name: personas_naturales; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE personas_naturales (
    pnt_personas_naturales_pk integer NOT NULL,
    pnt_nombres character varying(150),
    pnt_apellidos character varying(150),
    pnt_cedula_de_identidad character varying(20),
    pnt_rif_personal character varying(20),
    pnt_email character varying(100),
    pnt_otro_documento character varying(100)
);


ALTER TABLE public.personas_naturales OWNER TO postgres;

--
-- TOC entry 2405 (class 0 OID 0)
-- Dependencies: 1526
-- Name: TABLE personas_naturales; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE personas_naturales IS 'Listado de personas naturales con sus datos personales, los cuales pueden ser comisarios, accionistas, representante legal o junta directiva';


--
-- TOC entry 1611 (class 1259 OID 35338665)
-- Dependencies: 1526 5
-- Name: personas_naturales_pnt_personas_naturales_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE personas_naturales_pnt_personas_naturales_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.personas_naturales_pnt_personas_naturales_seq OWNER TO postgres;

--
-- TOC entry 2406 (class 0 OID 0)
-- Dependencies: 1611
-- Name: personas_naturales_pnt_personas_naturales_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE personas_naturales_pnt_personas_naturales_seq OWNED BY personas_naturales.pnt_personas_naturales_pk;


--
-- TOC entry 2407 (class 0 OID 0)
-- Dependencies: 1611
-- Name: personas_naturales_pnt_personas_naturales_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('personas_naturales_pnt_personas_naturales_seq', 294, true);


--
-- TOC entry 1527 (class 1259 OID 35338320)
-- Dependencies: 5
-- Name: rendimientos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rendimientos (
    ren_rendimientos_pk integer NOT NULL,
    ren_descripcion character varying(100) NOT NULL,
    ren_activo boolean NOT NULL
);


ALTER TABLE public.rendimientos OWNER TO postgres;

--
-- TOC entry 1612 (class 1259 OID 35338667)
-- Dependencies: 5 1527
-- Name: rendimientos_ren_rendimientos_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rendimientos_ren_rendimientos_pk_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.rendimientos_ren_rendimientos_pk_seq OWNER TO postgres;

--
-- TOC entry 2408 (class 0 OID 0)
-- Dependencies: 1612
-- Name: rendimientos_ren_rendimientos_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rendimientos_ren_rendimientos_pk_seq OWNED BY rendimientos.ren_rendimientos_pk;


--
-- TOC entry 2409 (class 0 OID 0)
-- Dependencies: 1612
-- Name: rendimientos_ren_rendimientos_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rendimientos_ren_rendimientos_pk_seq', 8, true);


--
-- TOC entry 1613 (class 1259 OID 35338669)
-- Dependencies: 5
-- Name: seq_codigo_siez; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE seq_codigo_siez
    INCREMENT BY 1
    MAXVALUE 999
    NO MINVALUE
    CACHE 1
    CYCLE;


ALTER TABLE public.seq_codigo_siez OWNER TO postgres;

--
-- TOC entry 2410 (class 0 OID 0)
-- Dependencies: 1613
-- Name: SEQUENCE seq_codigo_siez; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON SEQUENCE seq_codigo_siez IS 'Numero consecutivo del codigo de siez';


--
-- TOC entry 2411 (class 0 OID 0)
-- Dependencies: 1613
-- Name: seq_codigo_siez; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('seq_codigo_siez', 3, true);


--
-- TOC entry 1528 (class 1259 OID 35338322)
-- Dependencies: 2047 5
-- Name: sol_rec_xtipo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sol_rec_xtipo (
    srt_sol_rec_xtipo_pk integer NOT NULL,
    ctp_contratistas_tipo_fk integer,
    svr_solvencias_recaudos_fk integer,
    srt_vigente_hasta date DEFAULT '2500-12-31'::date,
    srt_obligatorio boolean
);


ALTER TABLE public.sol_rec_xtipo OWNER TO postgres;

--
-- TOC entry 2413 (class 0 OID 0)
-- Dependencies: 1528
-- Name: TABLE sol_rec_xtipo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE sol_rec_xtipo IS 'Se almacenan las solvencias y recaudos por tipo de contratista, se identifica si aplica para empresas o cooperativas, o algun otro tipo de contratista que surja en el tiempo';


--
-- TOC entry 1614 (class 1259 OID 35338671)
-- Dependencies: 5 1528
-- Name: sol_rec_xtipo_srt_sol_rec_xtipo_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sol_rec_xtipo_srt_sol_rec_xtipo_pk_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sol_rec_xtipo_srt_sol_rec_xtipo_pk_seq OWNER TO postgres;

--
-- TOC entry 2414 (class 0 OID 0)
-- Dependencies: 1614
-- Name: sol_rec_xtipo_srt_sol_rec_xtipo_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sol_rec_xtipo_srt_sol_rec_xtipo_pk_seq OWNED BY sol_rec_xtipo.srt_sol_rec_xtipo_pk;


--
-- TOC entry 2415 (class 0 OID 0)
-- Dependencies: 1614
-- Name: sol_rec_xtipo_srt_sol_rec_xtipo_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sol_rec_xtipo_srt_sol_rec_xtipo_pk_seq', 41, true);


--
-- TOC entry 1529 (class 1259 OID 35338325)
-- Dependencies: 5
-- Name: solvencias_recaudos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE solvencias_recaudos (
    svr_solvencias_recaudos_pk integer NOT NULL,
    svr_descripcion character varying(200) NOT NULL,
    svr_tiene_vencimiento boolean,
    svr_vencimiento_dias smallint,
    svr_activo boolean
);


ALTER TABLE public.solvencias_recaudos OWNER TO postgres;

--
-- TOC entry 2416 (class 0 OID 0)
-- Dependencies: 1529
-- Name: TABLE solvencias_recaudos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE solvencias_recaudos IS 'Se ingresan todos los tipo de solvencias y recaudos a exigir a las contratistas y cooperativas';


--
-- TOC entry 1615 (class 1259 OID 35338673)
-- Dependencies: 5 1529
-- Name: solvencias_recaudos_svr_solvencias_recaudos_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE solvencias_recaudos_svr_solvencias_recaudos_pk_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.solvencias_recaudos_svr_solvencias_recaudos_pk_seq OWNER TO postgres;

--
-- TOC entry 2417 (class 0 OID 0)
-- Dependencies: 1615
-- Name: solvencias_recaudos_svr_solvencias_recaudos_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE solvencias_recaudos_svr_solvencias_recaudos_pk_seq OWNED BY solvencias_recaudos.svr_solvencias_recaudos_pk;


--
-- TOC entry 2418 (class 0 OID 0)
-- Dependencies: 1615
-- Name: solvencias_recaudos_svr_solvencias_recaudos_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('solvencias_recaudos_svr_solvencias_recaudos_pk_seq', 25, true);


--
-- TOC entry 1531 (class 1259 OID 35338329)
-- Dependencies: 5
-- Name: tipo_actividad; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_actividad (
    tpa_tipo_actividad_pk integer NOT NULL,
    tpa_nombre character varying(150),
    tpa_activo boolean
);


ALTER TABLE public.tipo_actividad OWNER TO postgres;

--
-- TOC entry 2419 (class 0 OID 0)
-- Dependencies: 1531
-- Name: TABLE tipo_actividad; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE tipo_actividad IS 'Tipos de actividad economica de los contratos';


--
-- TOC entry 1616 (class 1259 OID 35338675)
-- Dependencies: 5 1531
-- Name: tipo_actividad_tpa_tipo_actividad_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_actividad_tpa_tipo_actividad_pk_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tipo_actividad_tpa_tipo_actividad_pk_seq OWNER TO postgres;

--
-- TOC entry 2420 (class 0 OID 0)
-- Dependencies: 1616
-- Name: tipo_actividad_tpa_tipo_actividad_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_actividad_tpa_tipo_actividad_pk_seq OWNED BY tipo_actividad.tpa_tipo_actividad_pk;


--
-- TOC entry 2421 (class 0 OID 0)
-- Dependencies: 1616
-- Name: tipo_actividad_tpa_tipo_actividad_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_actividad_tpa_tipo_actividad_pk_seq', 13, true);


--
-- TOC entry 1532 (class 1259 OID 35338331)
-- Dependencies: 5
-- Name: tipo_cooperativa; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_cooperativa (
    tpc_tipo_cooperativa_pk integer NOT NULL,
    tpc_nombre character varying(150),
    tpc_activo boolean
);


ALTER TABLE public.tipo_cooperativa OWNER TO postgres;

--
-- TOC entry 2422 (class 0 OID 0)
-- Dependencies: 1532
-- Name: TABLE tipo_cooperativa; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE tipo_cooperativa IS 'Tipos de cooperativas segun su ramo ';


--
-- TOC entry 1617 (class 1259 OID 35338677)
-- Dependencies: 1532 5
-- Name: tipo_cooperativa_tpc_tipo_cooperativa_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_cooperativa_tpc_tipo_cooperativa_pk_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tipo_cooperativa_tpc_tipo_cooperativa_pk_seq OWNER TO postgres;

--
-- TOC entry 2423 (class 0 OID 0)
-- Dependencies: 1617
-- Name: tipo_cooperativa_tpc_tipo_cooperativa_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_cooperativa_tpc_tipo_cooperativa_pk_seq OWNED BY tipo_cooperativa.tpc_tipo_cooperativa_pk;


--
-- TOC entry 2424 (class 0 OID 0)
-- Dependencies: 1617
-- Name: tipo_cooperativa_tpc_tipo_cooperativa_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_cooperativa_tpc_tipo_cooperativa_pk_seq', 9, true);


--
-- TOC entry 1533 (class 1259 OID 35338333)
-- Dependencies: 5
-- Name: tipo_firma; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_firma (
    tpf_tipo_firma_pk integer NOT NULL,
    tpf_descripcion character varying(100) NOT NULL,
    tpf_activo boolean NOT NULL
);


ALTER TABLE public.tipo_firma OWNER TO postgres;

--
-- TOC entry 1618 (class 1259 OID 35338679)
-- Dependencies: 1533 5
-- Name: tipo_firma_tpf_tipo_firma_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_firma_tpf_tipo_firma_pk_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tipo_firma_tpf_tipo_firma_pk_seq OWNER TO postgres;

--
-- TOC entry 2425 (class 0 OID 0)
-- Dependencies: 1618
-- Name: tipo_firma_tpf_tipo_firma_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_firma_tpf_tipo_firma_pk_seq OWNED BY tipo_firma.tpf_tipo_firma_pk;


--
-- TOC entry 2426 (class 0 OID 0)
-- Dependencies: 1618
-- Name: tipo_firma_tpf_tipo_firma_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_firma_tpf_tipo_firma_pk_seq', 7, true);


--
-- TOC entry 1534 (class 1259 OID 35338335)
-- Dependencies: 1706 5
-- Name: vis_areas_objeto; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_areas_objeto AS
    SELECT areas_objeto.aob_areas_objeto_pk, areas_objeto.aob_nombre, areas_objeto.aob_inicial, areas_objeto.aob_activo FROM areas_objeto ORDER BY areas_objeto.aob_nombre;


ALTER TABLE public.vis_areas_objeto OWNER TO postgres;

--
-- TOC entry 1535 (class 1259 OID 35338338)
-- Dependencies: 1707 5
-- Name: vis_ciudades; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_ciudades AS
    SELECT ciudades.ciu_ciudades_pk, ciudades.ciu_nombre, ciudades.ciu_abreviatura, ciudades.ciu_activo FROM ciudades ORDER BY ciudades.ciu_nombre;


ALTER TABLE public.vis_ciudades OWNER TO postgres;

--
-- TOC entry 1536 (class 1259 OID 35338341)
-- Dependencies: 1708 5
-- Name: vis_consolvencia; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_consolvencia AS
    SELECT DISTINCT c.con_contratistas_pk AS consolvencia_pk, c.con_nombre, c.con_numero_rif, c.con_codigo_siez FROM contratistas c, esp_are_xcontratista e, contratistas_acjdrl ac, contratistas_legal cl WHERE ((((c.con_contratistas_pk = e.con_contratistas_fk) AND (c.con_contratistas_pk = ac.con_contratistas_fk)) AND (c.con_contratistas_pk = cl.con_contratistas_fk)) AND (ac.ajr_representante_legal = true)) ORDER BY c.con_contratistas_pk, c.con_nombre, c.con_numero_rif, c.con_codigo_siez;


ALTER TABLE public.vis_consolvencia OWNER TO postgres;

--
-- TOC entry 1537 (class 1259 OID 35338344)
-- Dependencies: 1709 5
-- Name: vis_contratista_evaluacion; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_contratista_evaluacion AS
    SELECT contratista_evaluacion.eva_contratista_evaluacion_pk, contratista_evaluacion.svr_solvencias_recaudos_fk, contratista_evaluacion.con_contratistas_fk, contratista_evaluacion.eva_fecha_emision, contratista_evaluacion.eva_estatus, contratista_evaluacion.eva_fecha_vencimiento, contratistas_tipo.ctp_contratistas_tipo_pk, contratistas_tipo.ctp_descripcion, contratistas.con_contratistas_pk, contratista_evaluacion.eva_codigo_ancla FROM ((contratista_evaluacion contratista_evaluacion JOIN contratistas contratistas ON ((contratista_evaluacion.con_contratistas_fk = contratistas.con_contratistas_pk))) JOIN contratistas_tipo contratistas_tipo ON ((contratistas_tipo.ctp_contratistas_tipo_pk = contratistas.ctp_contratistas_tipo_fk)));


ALTER TABLE public.vis_contratista_evaluacion OWNER TO postgres;

--
-- TOC entry 1625 (class 1259 OID 35339042)
-- Dependencies: 1758 5
-- Name: vis_contratistas; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_contratistas AS
    SELECT contratistas.con_contratistas_pk, contratistas.con_nombre, contratistas.con_numero_rif, contratistas.con_codigo_siez FROM contratistas WHERE ((contratistas.ett_contratistas_estatus_fk <> 3) AND (contratistas.ett_contratistas_estatus_fk <> 2)) ORDER BY contratistas.con_nombre;


ALTER TABLE public.vis_contratistas OWNER TO postgres;

--
-- TOC entry 1538 (class 1259 OID 35338351)
-- Dependencies: 1710 5
-- Name: vis_contratistas_contratos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_contratistas_contratos AS
    SELECT contratistas_contratos.ctt_contratistas_contratos_pk, contratistas_contratos.con_contratistas_fk, contratistas_contratos.tpa_tipo_actividad_fk, tipo_actividad.tpa_nombre, contratistas_contratos.ett_estatus_fk, estatus.ett_nombre, contratistas_contratos.org_organismos_fk, organismos.org_nombre, organismos.org_siglas AS org_abreviatura, contratistas_contratos.ren_rendimiento_fk, rendimientos.ren_descripcion, contratistas_contratos.ctt_numero, contratistas_contratos.ctt_descripcion, contratistas_contratos.ctt_fecha, contratistas_contratos.ctt_observaciones FROM (((((contratistas contratistas JOIN contratistas_contratos contratistas_contratos ON ((contratistas.con_contratistas_pk = contratistas_contratos.con_contratistas_fk))) JOIN tipo_actividad tipo_actividad ON ((tipo_actividad.tpa_tipo_actividad_pk = contratistas_contratos.tpa_tipo_actividad_fk))) JOIN estatus estatus ON ((estatus.ett_estatus_pk = contratistas_contratos.ett_estatus_fk))) JOIN rendimientos rendimientos ON ((rendimientos.ren_rendimientos_pk = contratistas_contratos.ren_rendimiento_fk))) JOIN organismos organismos ON ((organismos.org_organismos_pk = contratistas_contratos.org_organismos_fk)));


ALTER TABLE public.vis_contratistas_contratos OWNER TO postgres;

--
-- TOC entry 1539 (class 1259 OID 35338355)
-- Dependencies: 1711 5
-- Name: vis_contratistas_estatus; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_contratistas_estatus AS
    SELECT contratistas_estatus.ett_contratistas_estatus_pk, contratistas_estatus.ett_nombre, contratistas_estatus.ett_activo FROM contratistas_estatus ORDER BY contratistas_estatus.ett_nombre;


ALTER TABLE public.vis_contratistas_estatus OWNER TO postgres;

--
-- TOC entry 1624 (class 1259 OID 35339038)
-- Dependencies: 1757 5
-- Name: vis_contratistas_general; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_contratistas_general AS
    SELECT contratistas.ctp_contratistas_tipo_fk, ciudades.ciu_nombre, municipio.mun_nombre, estados.est_nombre, contratistas.con_contratistas_pk, contratistas.con_numero_rif, contratistas.con_numero_rnc, contratistas.con_fecha_inscripcion_rnc, contratistas.con_fecha_vencimiento_rnc, contratistas.con_nombre, contratistas.con_siglas, contratistas.con_calificacion_financiera, nivel_financiero_snc.nfs_nivel, nivel_financiero_snc.nfs_capital_desde, nivel_financiero_snc.nfs_capital_hasta, contratistas.tpf_tipo_firma_fk AS con_tipo_firma, contratistas_tipo.ctp_descripcion, contratistas.con_tiempo_cooperativa, contratistas.con_objeto_cooperativa, contratistas.con_duracion_cooperativa, contratistas.con_objeto_social_cooperativa, contratistas.con_email, contratistas.con_codigo_postal, contratistas.con_direccion_fiscal, contratistas.con_capacidad_financiera, tipo_cooperativa.tpc_nombre, contratistas.con_codigo_siez FROM ((((((ciudades ciudades JOIN contratistas contratistas ON ((ciudades.ciu_ciudades_pk = contratistas.ciu_ciudades_fk))) RIGHT JOIN municipio municipio ON ((municipio.mun_municipio_pk = ciudades.mun_municipio_fk))) RIGHT JOIN estados estados ON ((estados.est_estados_pk = municipio.est_estados_fk))) JOIN contratistas_tipo contratistas_tipo ON ((contratistas_tipo.ctp_contratistas_tipo_pk = contratistas.ctp_contratistas_tipo_fk))) JOIN nivel_financiero_snc nivel_financiero_snc ON ((nivel_financiero_snc.nfs_nivel_financiero_snc_pk = contratistas.nfs_nivel_financiero_snc_fk))) LEFT JOIN tipo_cooperativa tipo_cooperativa ON ((contratistas.tpc_tipo_cooperativa_fk = tipo_cooperativa.tpc_tipo_cooperativa_pk)));


ALTER TABLE public.vis_contratistas_general OWNER TO postgres;

--
-- TOC entry 1540 (class 1259 OID 35338362)
-- Dependencies: 1712 5
-- Name: vis_contratistas_legal; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_contratistas_legal AS
    SELECT contratistas_legal.con_contratistas_fk, contratistas_legal.clg_contratistas_legal_pk, contratistas_legal.dec_denominacion_comercial_fk, contratistas_legal.clg_numero_registro, contratistas_legal.clg_circunscripcion_judicial, contratistas_legal.clg_fecha_inscripcion, contratistas_legal.clg_numero_inscripcion, contratistas_legal.clg_numero_tomo, contratistas_legal.clg_numero_folio, contratistas_legal.clg_objeto_social, contratistas_legal.clg_domicilio_legal_actual, contratistas_legal.clg_fecha_constitutiva, contratistas_legal.clg_capital_social_suscrito, contratistas_legal.clg_cierre_fiscal_actual, contratistas_legal.clg_capital_social_pagado, contratistas_legal.clg_modificacion, contratistas_legal.clg_numero_modificaciones, denominacion_comercial.dec_denominacion_comercial_pk, denominacion_comercial.dec_descripcion, denominacion_comercial.dec_activo, denominacion_comercial.dec_abreviatura, contratistas_legal.clg_observaciones FROM (denominacion_comercial denominacion_comercial JOIN contratistas_legal contratistas_legal ON ((denominacion_comercial.dec_denominacion_comercial_pk = contratistas_legal.dec_denominacion_comercial_fk)));


ALTER TABLE public.vis_contratistas_legal OWNER TO postgres;

--
-- TOC entry 1628 (class 1259 OID 35344490)
-- Dependencies: 1761 5
-- Name: vis_contratistas_sucursales_telefonos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_contratistas_sucursales_telefonos AS
    SELECT contratistas_sucursales.csu_contratistas_sucursales_pk, contratistas_sucursales.con_contratistas_fk, numeros_telefonicos_sucursales.tls_numeros_telefonicos_sucursales_pk, numeros_telefonicos_sucursales.ntt_numeros_telefonicos_tipo_fk, contratistas_sucursales.csu_descripcion, contratistas_sucursales.csu_direccion, contratistas_sucursales.csu_activo, numeros_telefonicos_sucursales.tls_numero, numeros_telefonicos_sucursales.tls_codigo_area, numeros_telefonicos_sucursales.tls_activo FROM (contratistas_sucursales LEFT JOIN numeros_telefonicos_sucursales ON ((contratistas_sucursales.csu_contratistas_sucursales_pk = numeros_telefonicos_sucursales.csu_contratistas_sucursales_fk)));


ALTER TABLE public.vis_contratistas_sucursales_telefonos OWNER TO postgres;

--
-- TOC entry 1541 (class 1259 OID 35338369)
-- Dependencies: 1713 5
-- Name: vis_contratistas_telefonos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_contratistas_telefonos AS
    SELECT contratistas.con_contratistas_pk, numeros_telefonicos.tel_numeros_telefonicos_pk, numeros_telefonicos.tel_numero, numeros_telefonicos.tel_codigo_area, numeros_telefonicos.tel_activo, numeros_telefonicos_tipo.ntt_numeros_telefonicos_tipo_pk, numeros_telefonicos_tipo.ntt_descripcion, numeros_telefonicos_tipo.ntt_obligatorio FROM ((numeros_telefonicos numeros_telefonicos JOIN contratistas contratistas ON ((numeros_telefonicos.con_contratistas_fk = contratistas.con_contratistas_pk))) JOIN numeros_telefonicos_tipo numeros_telefonicos_tipo ON ((numeros_telefonicos.ntt_numeros_telefonicos_tipo_fk = numeros_telefonicos_tipo.ntt_numeros_telefonicos_tipo_pk))) WHERE (numeros_telefonicos.tel_activo = true);


ALTER TABLE public.vis_contratistas_telefonos OWNER TO postgres;

--
-- TOC entry 1542 (class 1259 OID 35338373)
-- Dependencies: 1714 5
-- Name: vis_contratistas_tipo; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_contratistas_tipo AS
    SELECT contratistas_tipo.ctp_contratistas_tipo_pk, contratistas_tipo.ctp_descripcion, contratistas_tipo.ctp_activo FROM contratistas_tipo ORDER BY contratistas_tipo.ctp_descripcion;


ALTER TABLE public.vis_contratistas_tipo OWNER TO postgres;

--
-- TOC entry 1543 (class 1259 OID 35338376)
-- Dependencies: 1715 5
-- Name: vis_contrstistas_areas_objeto; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_contrstistas_areas_objeto AS
    SELECT esp_are_xcontratista.eac_esp_are_xcontratista_pk, contratistas.con_contratistas_pk, areas_objeto.aob_areas_objeto_pk, areas_objeto.aob_nombre, especialidad_objeto.epo_especialidad_objeto_pk, especialidad_objeto.epo_nombre, esp_are_xcontratista.eac_principal FROM (((esp_are_xcontratista esp_are_xcontratista JOIN especialidad_objeto especialidad_objeto ON ((esp_are_xcontratista.epo_especialidad_objeto_fk = especialidad_objeto.epo_especialidad_objeto_pk))) JOIN areas_objeto areas_objeto ON ((especialidad_objeto.aob_areas_objeto_fk = areas_objeto.aob_areas_objeto_pk))) JOIN contratistas contratistas ON ((contratistas.con_contratistas_pk = esp_are_xcontratista.con_contratistas_fk))) ORDER BY areas_objeto.aob_nombre;


ALTER TABLE public.vis_contrstistas_areas_objeto OWNER TO postgres;

--
-- TOC entry 1544 (class 1259 OID 35338380)
-- Dependencies: 1716 5
-- Name: vis_denominacion_comercial; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_denominacion_comercial AS
    SELECT denominacion_comercial.dec_denominacion_comercial_pk, denominacion_comercial.dec_descripcion, denominacion_comercial.dec_abreviatura, denominacion_comercial.dec_activo FROM denominacion_comercial denominacion_comercial ORDER BY denominacion_comercial.dec_descripcion;


ALTER TABLE public.vis_denominacion_comercial OWNER TO postgres;

--
-- TOC entry 1545 (class 1259 OID 35338383)
-- Dependencies: 1717 5
-- Name: vis_desincorporar; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_desincorporar AS
    SELECT contratistas.con_contratistas_pk, contratistas.con_nombre, contratistas.con_numero_rif, contratistas.con_numero_rnc, contratistas.con_siglas, contratistas.con_codigo_siez FROM contratistas_solvencias, contratistas WHERE ((((contratistas.con_contratistas_pk = contratistas_solvencias.con_contratistas_fk) AND (date_part('year'::text, contratistas_solvencias.sol_fecha_emision) <= (date_part('year'::text, ('now'::text)::date) - (10)::double precision))) AND (contratistas.ett_contratistas_estatus_fk <> 4)) AND (contratistas.ett_contratistas_estatus_fk <> 2));


ALTER TABLE public.vis_desincorporar OWNER TO postgres;

--
-- TOC entry 1546 (class 1259 OID 35338386)
-- Dependencies: 1718 5
-- Name: vis_especialidad_objeto; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_especialidad_objeto AS
    SELECT especialidad_objeto.epo_especialidad_objeto_pk, especialidad_objeto.epo_nombre, especialidad_objeto.epo_inicial, especialidad_objeto.epo_activo FROM especialidad_objeto ORDER BY especialidad_objeto.epo_nombre;


ALTER TABLE public.vis_especialidad_objeto OWNER TO postgres;

--
-- TOC entry 1547 (class 1259 OID 35338389)
-- Dependencies: 1719 5
-- Name: vis_estados; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_estados AS
    SELECT estados.est_estados_pk, estados.est_nombre, estados.est_abreviatura, estados.est_activo FROM estados ORDER BY estados.est_nombre;


ALTER TABLE public.vis_estados OWNER TO postgres;

--
-- TOC entry 1548 (class 1259 OID 35338392)
-- Dependencies: 1720 5
-- Name: vis_estatus; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_estatus AS
    SELECT estatus.ett_estatus_pk, estatus.ett_nombre, estatus.ett_activo FROM estatus ORDER BY estatus.ett_nombre;


ALTER TABLE public.vis_estatus OWNER TO postgres;

--
-- TOC entry 1549 (class 1259 OID 35338395)
-- Dependencies: 1721 5
-- Name: vis_estatus_activos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_estatus_activos AS
    SELECT estatus.ett_estatus_pk, estatus.ett_nombre, estatus.ett_activo FROM estatus estatus WHERE (estatus.ett_activo = true);


ALTER TABLE public.vis_estatus_activos OWNER TO postgres;

--
-- TOC entry 1622 (class 1259 OID 35339032)
-- Dependencies: 1755 5
-- Name: vis_indice_capital_social; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_indice_capital_social AS
    SELECT indice_capital_social.ics_indice_capital_social_pk, indice_capital_social.ics_descripcion, indice_capital_social.ics_desde, indice_capital_social.ics_hasta, indice_capital_social.ics_activo FROM indice_capital_social ORDER BY indice_capital_social.ics_desde;


ALTER TABLE public.vis_indice_capital_social OWNER TO postgres;

--
-- TOC entry 1550 (class 1259 OID 35338401)
-- Dependencies: 1722 5
-- Name: vis_sucursales_telefonos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_sucursales_telefonos AS
    SELECT contratistas_sucursales.csu_contratistas_sucursales_pk, numeros_telefonicos.tel_numeros_telefonicos_pk, contratistas_sucursales.con_contratistas_fk, contratistas_sucursales.csu_descripcion, contratistas_sucursales.csu_direccion, numeros_telefonicos.tel_codigo_area, numeros_telefonicos.tel_numero, contratistas_sucursales.csu_activo, numeros_telefonicos.tel_activo FROM contratistas_sucursales, numeros_telefonicos WHERE (contratistas_sucursales.csu_contratistas_sucursales_pk = numeros_telefonicos.con_contratistas_fk);


ALTER TABLE public.vis_sucursales_telefonos OWNER TO postgres;

--
-- TOC entry 1551 (class 1259 OID 35338404)
-- Dependencies: 1723 5
-- Name: vis_max_min_sucursal; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_max_min_sucursal AS
    SELECT max(vis_sucursales_telefonos.csu_contratistas_sucursales_pk) AS max, min(vis_sucursales_telefonos.csu_contratistas_sucursales_pk) AS min FROM vis_sucursales_telefonos;


ALTER TABLE public.vis_max_min_sucursal OWNER TO postgres;

--
-- TOC entry 1629 (class 1259 OID 35344493)
-- Dependencies: 1762 5
-- Name: vis_max_min_vis_contratistas_sucursales_telefonos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_max_min_vis_contratistas_sucursales_telefonos AS
    SELECT max(vis_contratistas_sucursales_telefonos.csu_contratistas_sucursales_pk) AS max, min(vis_contratistas_sucursales_telefonos.csu_contratistas_sucursales_pk) AS min FROM vis_contratistas_sucursales_telefonos;


ALTER TABLE public.vis_max_min_vis_contratistas_sucursales_telefonos OWNER TO postgres;

--
-- TOC entry 1552 (class 1259 OID 35338410)
-- Dependencies: 1724 5
-- Name: vis_municipio; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_municipio AS
    SELECT municipio.mun_municipio_pk, municipio.mun_nombre, municipio.mun_abreviatura, municipio.mun_activo FROM municipio ORDER BY municipio.mun_nombre;


ALTER TABLE public.vis_municipio OWNER TO postgres;

--
-- TOC entry 1553 (class 1259 OID 35338413)
-- Dependencies: 1725 5
-- Name: vis_municipio_combo; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_municipio_combo AS
    SELECT municipio.est_estados_fk, municipio.mun_municipio_pk, municipio.mun_nombre, municipio.mun_abreviatura, municipio.mun_activo FROM municipio ORDER BY municipio.mun_nombre;


ALTER TABLE public.vis_municipio_combo OWNER TO postgres;

--
-- TOC entry 1626 (class 1259 OID 35339045)
-- Dependencies: 1759 5
-- Name: vis_nivel_financiero_snc; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_nivel_financiero_snc AS
    SELECT nivel_financiero_snc.nfs_nivel_financiero_snc_pk, nivel_financiero_snc.nfs_nivel, nivel_financiero_snc.nfs_capital_desde, nivel_financiero_snc.nfs_capital_hasta FROM nivel_financiero_snc ORDER BY nivel_financiero_snc.nfs_capital_desde;


ALTER TABLE public.vis_nivel_financiero_snc OWNER TO postgres;

--
-- TOC entry 1554 (class 1259 OID 35338419)
-- Dependencies: 1726 5
-- Name: vis_numeros_telefonicos_tipo; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_numeros_telefonicos_tipo AS
    SELECT numeros_telefonicos_tipo.ntt_numeros_telefonicos_tipo_pk, numeros_telefonicos_tipo.ntt_descripcion, numeros_telefonicos_tipo.ntt_obligatorio FROM numeros_telefonicos_tipo ORDER BY numeros_telefonicos_tipo.ntt_descripcion;


ALTER TABLE public.vis_numeros_telefonicos_tipo OWNER TO postgres;

--
-- TOC entry 1555 (class 1259 OID 35338422)
-- Dependencies: 1727 5
-- Name: vis_organismos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_organismos AS
    SELECT organismos.org_organismos_pk, organismos.org_nombre, organismos.org_siglas, organismos.org_activo FROM organismos organismos ORDER BY organismos.org_nombre;


ALTER TABLE public.vis_organismos OWNER TO postgres;

--
-- TOC entry 1556 (class 1259 OID 35338425)
-- Dependencies: 1728 5
-- Name: vis_persona_comisario; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_persona_comisario AS
    SELECT contratistas_comisarios.con_contratistas_fk, personas_naturales.pnt_rif_personal, personas_naturales.pnt_cedula_de_identidad, personas_naturales.pnt_nombres, personas_naturales.pnt_apellidos, contratistas_comisarios.com_profesion, contratistas_comisarios.com_numero_colegiado, contratistas_comisarios.com_vigencia_colegiado, personas_naturales.pnt_email, personas_naturales.pnt_otro_documento, contratistas_comisarios.pnt_personas_naturales_fk FROM (personas_naturales personas_naturales JOIN contratistas_comisarios contratistas_comisarios ON ((personas_naturales.pnt_personas_naturales_pk = contratistas_comisarios.pnt_personas_naturales_fk)));


ALTER TABLE public.vis_persona_comisario OWNER TO postgres;

--
-- TOC entry 1557 (class 1259 OID 35338428)
-- Dependencies: 1729 5
-- Name: vis_persona_legal; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_persona_legal AS
    SELECT contratistas_acjdrl.con_contratistas_fk, personas_naturales.pnt_rif_personal, personas_naturales.pnt_cedula_de_identidad, personas_naturales.pnt_nombres, personas_naturales.pnt_apellidos, contratistas_acjdrl.ajr_cargo_actual, contratistas_acjdrl.ajr_accionista, contratistas_acjdrl.ajr_miembro_junta_directiva, contratistas_acjdrl.ajr_representante_legal, contratistas_acjdrl.ajr_porcentaje_acciones, personas_naturales.pnt_email FROM (personas_naturales personas_naturales JOIN contratistas_acjdrl contratistas_acjdrl ON ((personas_naturales.pnt_personas_naturales_pk = contratistas_acjdrl.pnt_personas_naturales_fk)));


ALTER TABLE public.vis_persona_legal OWNER TO postgres;

--
-- TOC entry 1558 (class 1259 OID 35338431)
-- Dependencies: 1730 5
-- Name: vis_personas_contratistas; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_personas_contratistas AS
    SELECT c1.con_contratistas_pk, c1.con_nombre, c1.pnt_personas_naturales_fk, pn.pnt_nombres, pn.pnt_apellidos, pn.pnt_cedula_de_identidad, pn.pnt_rif_personal, -1 AS comisario, c1.ajr_accionista AS accionista_id, c1.ajr_miembro_junta_directiva AS jdir_id, c1.ajr_representante_legal AS rpl_id, c1.ajr_cargo_actual AS cargoac_id, c1.ajr_porcentaje_acciones AS pacciones_id FROM ((SELECT c.con_contratistas_pk, c.con_nombre, a.pnt_personas_naturales_fk, a.ajr_accionista, a.ajr_miembro_junta_directiva, a.ajr_representante_legal, a.ajr_cargo_actual, a.ajr_porcentaje_acciones FROM (contratistas c LEFT JOIN contratistas_acjdrl a ON ((c.con_contratistas_pk = a.con_contratistas_fk)))) c1 LEFT JOIN personas_naturales pn ON ((c1.pnt_personas_naturales_fk = pn.pnt_personas_naturales_pk))) UNION SELECT c2.con_contratistas_pk, c2.con_nombre, c2.pnt_personas_naturales_fk, pn.pnt_nombres, pn.pnt_apellidos, pn.pnt_cedula_de_identidad, pn.pnt_rif_personal, c2.com_contratistas_comisarios_pk AS comisario, false AS accionista_id, false AS jdir_id, false AS rpl_id, NULL::"unknown" AS cargoac_id, NULL::"unknown" AS pacciones_id FROM ((SELECT c.con_contratistas_pk, c.con_nombre, co.pnt_personas_naturales_fk, co.com_contratistas_comisarios_pk FROM (contratistas c JOIN contratistas_comisarios co ON ((c.con_contratistas_pk = co.con_contratistas_fk)))) c2 LEFT JOIN personas_naturales pn ON ((c2.pnt_personas_naturales_fk = pn.pnt_personas_naturales_pk))) ORDER BY 2;


ALTER TABLE public.vis_personas_contratistas OWNER TO postgres;

--
-- TOC entry 1559 (class 1259 OID 35338435)
-- Dependencies: 1731 5
-- Name: vis_personas_naturales; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_personas_naturales AS
    SELECT personas_naturales.pnt_personas_naturales_pk, personas_naturales.pnt_nombres, personas_naturales.pnt_apellidos, personas_naturales.pnt_cedula_de_identidad, personas_naturales.pnt_rif_personal, personas_naturales.pnt_email, personas_naturales.pnt_otro_documento FROM personas_naturales personas_naturales;


ALTER TABLE public.vis_personas_naturales OWNER TO postgres;

--
-- TOC entry 1560 (class 1259 OID 35338438)
-- Dependencies: 1732 5
-- Name: vis_tipo_cont_tipo_recaudo; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_tipo_cont_tipo_recaudo AS
    SELECT contratistas_tipo.ctp_contratistas_tipo_pk, contratistas_tipo.ctp_descripcion, contratistas_tipo.ctp_activo, sol_rec_xtipo.srt_sol_rec_xtipo_pk, sol_rec_xtipo.ctp_contratistas_tipo_fk, sol_rec_xtipo.svr_solvencias_recaudos_fk, sol_rec_xtipo.srt_vigente_hasta, sol_rec_xtipo.srt_obligatorio, solvencias_recaudos.svr_solvencias_recaudos_pk, solvencias_recaudos.svr_descripcion, solvencias_recaudos.svr_vencimiento_dias, solvencias_recaudos.svr_tiene_vencimiento, solvencias_recaudos.svr_activo FROM ((solvencias_recaudos solvencias_recaudos FULL JOIN sol_rec_xtipo sol_rec_xtipo ON ((solvencias_recaudos.svr_solvencias_recaudos_pk = sol_rec_xtipo.svr_solvencias_recaudos_fk))) FULL JOIN contratistas_tipo contratistas_tipo ON ((contratistas_tipo.ctp_contratistas_tipo_pk = sol_rec_xtipo.ctp_contratistas_tipo_fk))) WHERE (sol_rec_xtipo.srt_vigente_hasta >= ('now'::text)::date);


ALTER TABLE public.vis_tipo_cont_tipo_recaudo OWNER TO postgres;

--
-- TOC entry 1561 (class 1259 OID 35338441)
-- Dependencies: 1733 5
-- Name: vis_recaudos_transito; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_recaudos_transito AS
    SELECT ce.eva_contratista_evaluacion_pk, ce.svr_solvencias_recaudos_fk, ce.con_contratistas_fk, ce.eva_fecha_emision, ce.eva_estatus, ce.eva_fecha_vencimiento, ce.eva_codigo_ancla, t.svr_descripcion, t.ctp_contratistas_tipo_pk, t.ctp_descripcion FROM vis_contratista_evaluacion ce, vis_tipo_cont_tipo_recaudo t, (SELECT contratista_evaluacion.con_contratistas_fk, contratista_evaluacion.svr_solvencias_recaudos_fk, max(contratista_evaluacion.eva_fecha_emision) AS fecha_emision FROM contratista_evaluacion GROUP BY contratista_evaluacion.con_contratistas_fk, contratista_evaluacion.svr_solvencias_recaudos_fk) m WHERE (((((ce.svr_solvencias_recaudos_fk = t.svr_solvencias_recaudos_pk) AND (ce.con_contratistas_fk = m.con_contratistas_fk)) AND (ce.svr_solvencias_recaudos_fk = m.svr_solvencias_recaudos_fk)) AND (ce.eva_fecha_emision = m.fecha_emision)) AND (t.ctp_contratistas_tipo_pk = ce.ctp_contratistas_tipo_pk));


ALTER TABLE public.vis_recaudos_transito OWNER TO postgres;

--
-- TOC entry 1562 (class 1259 OID 35338444)
-- Dependencies: 1734 5
-- Name: vis_rendimientos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_rendimientos AS
    SELECT rendimientos.ren_rendimientos_pk, rendimientos.ren_descripcion FROM rendimientos WHERE (rendimientos.ren_activo = true) ORDER BY rendimientos.ren_descripcion;


ALTER TABLE public.vis_rendimientos OWNER TO postgres;

--
-- TOC entry 1563 (class 1259 OID 35338447)
-- Dependencies: 1735 5
-- Name: vis_sol_rec_xtipo; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_sol_rec_xtipo AS
    SELECT sol_rec_xtipo.srt_sol_rec_xtipo_pk, contratistas_tipo.ctp_descripcion AS srt_tipo_de_contratista, solvencias_recaudos.svr_descripcion AS srt_recaudo, sol_rec_xtipo.srt_vigente_hasta FROM sol_rec_xtipo, contratistas_tipo, solvencias_recaudos WHERE ((sol_rec_xtipo.ctp_contratistas_tipo_fk = contratistas_tipo.ctp_contratistas_tipo_pk) AND (solvencias_recaudos.svr_solvencias_recaudos_pk = sol_rec_xtipo.svr_solvencias_recaudos_fk));


ALTER TABLE public.vis_sol_rec_xtipo OWNER TO postgres;

--
-- TOC entry 1564 (class 1259 OID 35338450)
-- Dependencies: 1736 5
-- Name: vis_solvencias_recaudos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_solvencias_recaudos AS
    SELECT solvencias_recaudos.svr_solvencias_recaudos_pk, solvencias_recaudos.svr_descripcion, solvencias_recaudos.svr_tiene_vencimiento, solvencias_recaudos.svr_vencimiento_dias FROM solvencias_recaudos solvencias_recaudos ORDER BY solvencias_recaudos.svr_descripcion;


ALTER TABLE public.vis_solvencias_recaudos OWNER TO postgres;

--
-- TOC entry 1565 (class 1259 OID 35338453)
-- Dependencies: 1737 5
-- Name: vis_tipo_actividad; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_tipo_actividad AS
    SELECT tipo_actividad.tpa_tipo_actividad_pk, tipo_actividad.tpa_nombre, tipo_actividad.tpa_activo FROM tipo_actividad tipo_actividad ORDER BY tipo_actividad.tpa_nombre;


ALTER TABLE public.vis_tipo_actividad OWNER TO postgres;

--
-- TOC entry 1566 (class 1259 OID 35338456)
-- Dependencies: 1738 5
-- Name: vis_tipo_cooperativa; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_tipo_cooperativa AS
    SELECT tipo_cooperativa.tpc_tipo_cooperativa_pk, tipo_cooperativa.tpc_nombre, tipo_cooperativa.tpc_activo FROM tipo_cooperativa ORDER BY tipo_cooperativa.tpc_nombre;


ALTER TABLE public.vis_tipo_cooperativa OWNER TO postgres;

--
-- TOC entry 1567 (class 1259 OID 35338459)
-- Dependencies: 1739 5
-- Name: vis_tipo_firma; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vis_tipo_firma AS
    SELECT tipo_firma.tpf_tipo_firma_pk, tipo_firma.tpf_descripcion, tipo_firma.tpf_activo FROM tipo_firma ORDER BY tipo_firma.tpf_descripcion;


ALTER TABLE public.vis_tipo_firma OWNER TO postgres;

--
-- TOC entry 1568 (class 1259 OID 35338462)
-- Dependencies: 1740 5
-- Name: visfk_areas_objeto; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW visfk_areas_objeto AS
    SELECT areas_objeto.aob_areas_objeto_pk, areas_objeto.aob_nombre FROM areas_objeto WHERE (areas_objeto.aob_activo = true) ORDER BY areas_objeto.aob_nombre;


ALTER TABLE public.visfk_areas_objeto OWNER TO postgres;

--
-- TOC entry 1569 (class 1259 OID 35338465)
-- Dependencies: 1741 5
-- Name: visfk_ciudades; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW visfk_ciudades AS
    SELECT ciudades.ciu_ciudades_pk, ciudades.ciu_nombre FROM ciudades WHERE (ciudades.ciu_activo = true) ORDER BY ciudades.ciu_nombre;


ALTER TABLE public.visfk_ciudades OWNER TO postgres;

--
-- TOC entry 1570 (class 1259 OID 35338468)
-- Dependencies: 1742 5
-- Name: visfk_contratistas_estatus; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW visfk_contratistas_estatus AS
    SELECT contratistas_estatus.ett_contratistas_estatus_pk, contratistas_estatus.ett_nombre FROM contratistas_estatus WHERE (contratistas_estatus.ett_activo = true) ORDER BY contratistas_estatus.ett_nombre;


ALTER TABLE public.visfk_contratistas_estatus OWNER TO postgres;

--
-- TOC entry 1571 (class 1259 OID 35338471)
-- Dependencies: 1743 5
-- Name: visfk_contratistas_tipo; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW visfk_contratistas_tipo AS
    SELECT contratistas_tipo.ctp_contratistas_tipo_pk, contratistas_tipo.ctp_descripcion FROM contratistas_tipo WHERE (contratistas_tipo.ctp_activo = true) ORDER BY contratistas_tipo.ctp_descripcion;


ALTER TABLE public.visfk_contratistas_tipo OWNER TO postgres;

--
-- TOC entry 1572 (class 1259 OID 35338474)
-- Dependencies: 1744 5
-- Name: visfk_denominacion_comercial; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW visfk_denominacion_comercial AS
    SELECT denominacion_comercial.dec_denominacion_comercial_pk, denominacion_comercial.dec_descripcion FROM denominacion_comercial denominacion_comercial WHERE (denominacion_comercial.dec_activo = true) ORDER BY denominacion_comercial.dec_descripcion;


ALTER TABLE public.visfk_denominacion_comercial OWNER TO postgres;

--
-- TOC entry 1573 (class 1259 OID 35338477)
-- Dependencies: 1745 5
-- Name: visfk_estados; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW visfk_estados AS
    SELECT estados.est_estados_pk, estados.est_nombre FROM estados WHERE (estados.est_activo = true) ORDER BY estados.est_nombre;


ALTER TABLE public.visfk_estados OWNER TO postgres;

--
-- TOC entry 1574 (class 1259 OID 35338480)
-- Dependencies: 1746 5
-- Name: visfk_estatus; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW visfk_estatus AS
    SELECT estatus.ett_estatus_pk, estatus.ett_nombre FROM estatus WHERE (estatus.ett_activo = true) ORDER BY estatus.ett_nombre;


ALTER TABLE public.visfk_estatus OWNER TO postgres;

--
-- TOC entry 1623 (class 1259 OID 35339035)
-- Dependencies: 1756 5
-- Name: visfk_indice_capital_social; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW visfk_indice_capital_social AS
    SELECT indice_capital_social.ics_indice_capital_social_pk, (((((indice_capital_social.ics_descripcion)::text || '=>'::text) || "replace"(to_char(indice_capital_social.ics_desde, '9,999,999,999,990'::text), ','::text, '.'::text)) || ':'::text) || "replace"(to_char(indice_capital_social.ics_hasta, '9,999,999,999,990'::text), ','::text, '.'::text)) AS descripcion_indice FROM indice_capital_social WHERE (indice_capital_social.ics_activo = true) ORDER BY indice_capital_social.ics_desde;


ALTER TABLE public.visfk_indice_capital_social OWNER TO postgres;

--
-- TOC entry 1575 (class 1259 OID 35338486)
-- Dependencies: 1747 5
-- Name: visfk_municipio; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW visfk_municipio AS
    SELECT municipio.mun_municipio_pk, municipio.mun_nombre FROM municipio WHERE (municipio.mun_activo = true) ORDER BY municipio.mun_nombre;


ALTER TABLE public.visfk_municipio OWNER TO postgres;

--
-- TOC entry 1627 (class 1259 OID 35339048)
-- Dependencies: 1760 5
-- Name: visfk_nivel_financiero_snc; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW visfk_nivel_financiero_snc AS
    SELECT nivel_financiero_snc.nfs_nivel_financiero_snc_pk, (((((nivel_financiero_snc.nfs_nivel)::text || '   =>   '::text) || "replace"(to_char(nivel_financiero_snc.nfs_capital_desde, '9,999,999,999,990'::text), ','::text, '.'::text)) || ':'::text) || "replace"(to_char(nivel_financiero_snc.nfs_capital_hasta, '9,999,999,999,990'::text), ','::text, '.'::text)) AS descripcion_nf FROM nivel_financiero_snc ORDER BY nivel_financiero_snc.nfs_capital_desde;


ALTER TABLE public.visfk_nivel_financiero_snc OWNER TO postgres;

--
-- TOC entry 1630 (class 1259 OID 35344524)
-- Dependencies: 1763 5
-- Name: visfk_organismos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW visfk_organismos AS
    SELECT organismos.org_organismos_pk, organismos.org_siglas FROM organismos organismos WHERE (organismos.org_activo = true) ORDER BY organismos.org_nombre;


ALTER TABLE public.visfk_organismos OWNER TO postgres;

--
-- TOC entry 1576 (class 1259 OID 35338495)
-- Dependencies: 1748 5
-- Name: visfk_rendimientos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW visfk_rendimientos AS
    SELECT rendimientos.ren_rendimientos_pk, rendimientos.ren_descripcion FROM rendimientos WHERE (rendimientos.ren_activo = true) ORDER BY rendimientos.ren_descripcion;


ALTER TABLE public.visfk_rendimientos OWNER TO postgres;

--
-- TOC entry 1577 (class 1259 OID 35338498)
-- Dependencies: 1749 5
-- Name: visfk_solvencias_recaudos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW visfk_solvencias_recaudos AS
    SELECT solvencias_recaudos.svr_solvencias_recaudos_pk, solvencias_recaudos.svr_descripcion FROM solvencias_recaudos solvencias_recaudos WHERE (solvencias_recaudos.svr_activo = true) ORDER BY solvencias_recaudos.svr_descripcion;


ALTER TABLE public.visfk_solvencias_recaudos OWNER TO postgres;

--
-- TOC entry 1578 (class 1259 OID 35338501)
-- Dependencies: 1750 5
-- Name: visfk_tipo_actividad; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW visfk_tipo_actividad AS
    SELECT tipo_actividad.tpa_tipo_actividad_pk, tipo_actividad.tpa_nombre FROM tipo_actividad tipo_actividad WHERE (tipo_actividad.tpa_activo = true) ORDER BY tipo_actividad.tpa_nombre;


ALTER TABLE public.visfk_tipo_actividad OWNER TO postgres;

--
-- TOC entry 1579 (class 1259 OID 35338504)
-- Dependencies: 1751 5
-- Name: visfk_tipo_cooperativa; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW visfk_tipo_cooperativa AS
    SELECT tipo_cooperativa.tpc_tipo_cooperativa_pk, tipo_cooperativa.tpc_nombre FROM tipo_cooperativa WHERE (tipo_cooperativa.tpc_activo = true) ORDER BY tipo_cooperativa.tpc_nombre;


ALTER TABLE public.visfk_tipo_cooperativa OWNER TO postgres;

--
-- TOC entry 1580 (class 1259 OID 35338507)
-- Dependencies: 1752 5
-- Name: visfk_tipo_firma; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW visfk_tipo_firma AS
    SELECT tipo_firma.tpf_tipo_firma_pk, tipo_firma.tpf_descripcion FROM tipo_firma WHERE (tipo_firma.tpf_activo = true) ORDER BY tipo_firma.tpf_descripcion;


ALTER TABLE public.visfk_tipo_firma OWNER TO postgres;

SET search_path = sistema, pg_catalog;

--
-- TOC entry 1581 (class 1259 OID 35338510)
-- Dependencies: 6
-- Name: usuarios; Type: TABLE; Schema: sistema; Owner: postgres; Tablespace: 
--

CREATE TABLE usuarios (
    usr_usuarios_pk integer NOT NULL,
    usr_nombre character varying(50),
    usr_clave character varying(50) NOT NULL,
    usr_correo_electronico character varying(100) NOT NULL,
    usr_nivel smallint NOT NULL,
    usr_fecha_creacion date,
    usr_fecha_expira date,
    usr_rol character varying(100)
);


ALTER TABLE sistema.usuarios OWNER TO postgres;

--
-- TOC entry 1582 (class 1259 OID 35338512)
-- Dependencies: 6
-- Name: usuarios_menu; Type: TABLE; Schema: sistema; Owner: postgres; Tablespace: 
--

CREATE TABLE usuarios_menu (
    usm_usuarios_menu_pk integer NOT NULL,
    usm_nivel character varying(15) NOT NULL,
    usm_codigo character varying(250) NOT NULL,
    usm_titulos character varying(150) NOT NULL,
    usm_activo boolean NOT NULL
);


ALTER TABLE sistema.usuarios_menu OWNER TO postgres;

--
-- TOC entry 1619 (class 1259 OID 35338681)
-- Dependencies: 1582 6
-- Name: usuarios_menu_usm_usuarios_menu_pk_seq; Type: SEQUENCE; Schema: sistema; Owner: postgres
--

CREATE SEQUENCE usuarios_menu_usm_usuarios_menu_pk_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE sistema.usuarios_menu_usm_usuarios_menu_pk_seq OWNER TO postgres;

--
-- TOC entry 2446 (class 0 OID 0)
-- Dependencies: 1619
-- Name: usuarios_menu_usm_usuarios_menu_pk_seq; Type: SEQUENCE OWNED BY; Schema: sistema; Owner: postgres
--

ALTER SEQUENCE usuarios_menu_usm_usuarios_menu_pk_seq OWNED BY usuarios_menu.usm_usuarios_menu_pk;


--
-- TOC entry 2447 (class 0 OID 0)
-- Dependencies: 1619
-- Name: usuarios_menu_usm_usuarios_menu_pk_seq; Type: SEQUENCE SET; Schema: sistema; Owner: postgres
--

SELECT pg_catalog.setval('usuarios_menu_usm_usuarios_menu_pk_seq', 36, true);


--
-- TOC entry 1583 (class 1259 OID 35338514)
-- Dependencies: 6
-- Name: usuarios_opciones; Type: TABLE; Schema: sistema; Owner: postgres; Tablespace: 
--

CREATE TABLE usuarios_opciones (
    uso_usuarios_opciones_pk integer NOT NULL,
    usr_usuarios_fk bigint,
    usm_usuarios_fk bigint,
    uso_ver boolean NOT NULL,
    uso_incluir boolean NOT NULL,
    uso_modificar boolean NOT NULL,
    uso_borrar boolean NOT NULL,
    uso_campos character varying(250)
);


ALTER TABLE sistema.usuarios_opciones OWNER TO postgres;

--
-- TOC entry 1620 (class 1259 OID 35338683)
-- Dependencies: 6 1583
-- Name: usuarios_opciones_uso_usuarios_opciones_pk_seq; Type: SEQUENCE; Schema: sistema; Owner: postgres
--

CREATE SEQUENCE usuarios_opciones_uso_usuarios_opciones_pk_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE sistema.usuarios_opciones_uso_usuarios_opciones_pk_seq OWNER TO postgres;

--
-- TOC entry 2448 (class 0 OID 0)
-- Dependencies: 1620
-- Name: usuarios_opciones_uso_usuarios_opciones_pk_seq; Type: SEQUENCE OWNED BY; Schema: sistema; Owner: postgres
--

ALTER SEQUENCE usuarios_opciones_uso_usuarios_opciones_pk_seq OWNED BY usuarios_opciones.uso_usuarios_opciones_pk;


--
-- TOC entry 2449 (class 0 OID 0)
-- Dependencies: 1620
-- Name: usuarios_opciones_uso_usuarios_opciones_pk_seq; Type: SEQUENCE SET; Schema: sistema; Owner: postgres
--

SELECT pg_catalog.setval('usuarios_opciones_uso_usuarios_opciones_pk_seq', 817, true);


--
-- TOC entry 1621 (class 1259 OID 35338685)
-- Dependencies: 6 1581
-- Name: usuarios_usr_usuarios_pk_seq; Type: SEQUENCE; Schema: sistema; Owner: postgres
--

CREATE SEQUENCE usuarios_usr_usuarios_pk_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE sistema.usuarios_usr_usuarios_pk_seq OWNER TO postgres;

--
-- TOC entry 2450 (class 0 OID 0)
-- Dependencies: 1621
-- Name: usuarios_usr_usuarios_pk_seq; Type: SEQUENCE OWNED BY; Schema: sistema; Owner: postgres
--

ALTER SEQUENCE usuarios_usr_usuarios_pk_seq OWNED BY usuarios.usr_usuarios_pk;


--
-- TOC entry 2451 (class 0 OID 0)
-- Dependencies: 1621
-- Name: usuarios_usr_usuarios_pk_seq; Type: SEQUENCE SET; Schema: sistema; Owner: postgres
--

SELECT pg_catalog.setval('usuarios_usr_usuarios_pk_seq', 26, true);


--
-- TOC entry 1584 (class 1259 OID 35338516)
-- Dependencies: 1753 6
-- Name: vis_usuarios; Type: VIEW; Schema: sistema; Owner: postgres
--

CREATE VIEW vis_usuarios AS
    SELECT usuarios.usr_usuarios_pk, usuarios.usr_nombre, usuarios.usr_correo_electronico, usuarios.usr_fecha_expira FROM usuarios ORDER BY usuarios.usr_nombre;


ALTER TABLE sistema.vis_usuarios OWNER TO postgres;

--
-- TOC entry 1585 (class 1259 OID 35338519)
-- Dependencies: 1754 6
-- Name: vis_usuarios_menu; Type: VIEW; Schema: sistema; Owner: postgres
--

CREATE VIEW vis_usuarios_menu AS
    SELECT usuarios_menu.usm_usuarios_menu_pk, usuarios_menu.usm_nivel, usuarios_menu.usm_codigo, usuarios_menu.usm_titulos, usuarios_menu.usm_activo FROM usuarios_menu WHERE (usuarios_menu.usm_activo = true) ORDER BY usuarios_menu.usm_nivel;


ALTER TABLE sistema.vis_usuarios_menu OWNER TO postgres;

SET search_path = public, pg_catalog;

--
-- TOC entry 2020 (class 2604 OID 35338687)
-- Dependencies: 1586 1500
-- Name: aob_areas_objeto_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE areas_objeto ALTER COLUMN aob_areas_objeto_pk SET DEFAULT nextval('areas_objeto_aob_areas_objeto_pk_seq'::regclass);


--
-- TOC entry 2021 (class 2604 OID 35338688)
-- Dependencies: 1587 1502
-- Name: adt_auditoria_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE auditoria ALTER COLUMN adt_auditoria_pk SET DEFAULT nextval('auditoria_adt_auditoria_pk_seq'::regclass);


--
-- TOC entry 2022 (class 2604 OID 35338689)
-- Dependencies: 1588 1503
-- Name: ciu_ciudades_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ciudades ALTER COLUMN ciu_ciudades_pk SET DEFAULT nextval('ciudades_ciu_ciudades_pk_seq'::regclass);


--
-- TOC entry 2023 (class 2604 OID 35338690)
-- Dependencies: 1589 1504
-- Name: eva_contratista_evaluacion_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE contratista_evaluacion ALTER COLUMN eva_contratista_evaluacion_pk SET DEFAULT nextval('contratista_evaluacion_eva_contratista_evaluacion_pk_seq'::regclass);


--
-- TOC entry 2024 (class 2604 OID 35338691)
-- Dependencies: 1592 1505
-- Name: con_contratistas_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE contratistas ALTER COLUMN con_contratistas_pk SET DEFAULT nextval('contratistas_con_contratistas_pk_seq'::regclass);


--
-- TOC entry 2025 (class 2604 OID 35338692)
-- Dependencies: 1590 1506
-- Name: ajr_contratistas_acjdrl_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE contratistas_acjdrl ALTER COLUMN ajr_contratistas_acjdrl_pk SET DEFAULT nextval('contratistas_acjdrl_ajr_contratistas_acjdrl_pk_seq'::regclass);


--
-- TOC entry 2026 (class 2604 OID 35338693)
-- Dependencies: 1591 1507
-- Name: com_contratistas_comisarios_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE contratistas_comisarios ALTER COLUMN com_contratistas_comisarios_pk SET DEFAULT nextval('contratistas_comisarios_com_contratistas_comisarios_pk_seq'::regclass);


--
-- TOC entry 2027 (class 2604 OID 35338694)
-- Dependencies: 1593 1508
-- Name: ctt_contratistas_contratos_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE contratistas_contratos ALTER COLUMN ctt_contratistas_contratos_pk SET DEFAULT nextval('contratistas_contratos_ctt_contratistas_contratos_pk_seq'::regclass);


--
-- TOC entry 2028 (class 2604 OID 35338695)
-- Dependencies: 1594 1509
-- Name: ett_contratistas_estatus_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE contratistas_estatus ALTER COLUMN ett_contratistas_estatus_pk SET DEFAULT nextval('contratistas_estatus_ett_contratistas_estatus_pk_seq'::regclass);


--
-- TOC entry 2029 (class 2604 OID 35338696)
-- Dependencies: 1595 1510
-- Name: clg_contratistas_legal_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE contratistas_legal ALTER COLUMN clg_contratistas_legal_pk SET DEFAULT nextval('contratistas_legal_clg_contratistas_legal_pk_seq'::regclass);


--
-- TOC entry 2030 (class 2604 OID 35338697)
-- Dependencies: 1596 1511
-- Name: sol_contratistas_solvencias_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE contratistas_solvencias ALTER COLUMN sol_contratistas_solvencias_pk SET DEFAULT nextval('contratistas_solvencias_sol_contratistas_solvencias_pk_seq'::regclass);


--
-- TOC entry 2031 (class 2604 OID 35338698)
-- Dependencies: 1597 1512
-- Name: csu_contratistas_sucursales_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE contratistas_sucursales ALTER COLUMN csu_contratistas_sucursales_pk SET DEFAULT nextval('contratistas_sucursales_csu_contratistas_sucursales_pk_seq'::regclass);


--
-- TOC entry 2032 (class 2604 OID 35338699)
-- Dependencies: 1598 1513
-- Name: ctp_contratistas_tipo_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE contratistas_tipo ALTER COLUMN ctp_contratistas_tipo_pk SET DEFAULT nextval('contratistas_tipo_ctp_contratistas_tipo_pk_seq'::regclass);


--
-- TOC entry 2033 (class 2604 OID 35338700)
-- Dependencies: 1599 1514
-- Name: dec_denominacion_comercial_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE denominacion_comercial ALTER COLUMN dec_denominacion_comercial_pk SET DEFAULT nextval('denominacion_comercial_dec_denominacion_comercial_pk_seq'::regclass);


--
-- TOC entry 2034 (class 2604 OID 35338701)
-- Dependencies: 1600 1515
-- Name: eac_esp_are_xcontratista_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE esp_are_xcontratista ALTER COLUMN eac_esp_are_xcontratista_pk SET DEFAULT nextval('esp_are_xcontratista_eac_esp_are_xcontratista_pk_seq'::regclass);


--
-- TOC entry 2035 (class 2604 OID 35338702)
-- Dependencies: 1601 1516
-- Name: epo_especialidad_objeto_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE especialidad_objeto ALTER COLUMN epo_especialidad_objeto_pk SET DEFAULT nextval('especialidad_objeto_epo_especialidad_objeto_pk_seq'::regclass);


--
-- TOC entry 2036 (class 2604 OID 35338703)
-- Dependencies: 1602 1517
-- Name: est_estados_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE estados ALTER COLUMN est_estados_pk SET DEFAULT nextval('estados_est_estados_pk_seq'::regclass);


--
-- TOC entry 2037 (class 2604 OID 35338704)
-- Dependencies: 1603 1518
-- Name: ett_estatus_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE estatus ALTER COLUMN ett_estatus_pk SET DEFAULT nextval('estatus_ett_estatus_pk_seq'::regclass);


--
-- TOC entry 2038 (class 2604 OID 35338705)
-- Dependencies: 1604 1519
-- Name: ics_indice_capital_social_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE indice_capital_social ALTER COLUMN ics_indice_capital_social_pk SET DEFAULT nextval('indice_capital_social_ics_indice_capital_social_pk_seq'::regclass);


--
-- TOC entry 2039 (class 2604 OID 35338706)
-- Dependencies: 1605 1520
-- Name: mun_municipio_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE municipio ALTER COLUMN mun_municipio_pk SET DEFAULT nextval('municipio_mun_municipio_pk_seq'::regclass);


--
-- TOC entry 2040 (class 2604 OID 35338707)
-- Dependencies: 1606 1521
-- Name: nfs_nivel_financiero_snc_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE nivel_financiero_snc ALTER COLUMN nfs_nivel_financiero_snc_pk SET DEFAULT nextval('nivel_financiero_snc_nfs_nivel_financiero_snc_pk_seq'::regclass);


--
-- TOC entry 2041 (class 2604 OID 35338708)
-- Dependencies: 1608 1522
-- Name: tel_numeros_telefonicos_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE numeros_telefonicos ALTER COLUMN tel_numeros_telefonicos_pk SET DEFAULT nextval('numeros_telefonicos_tel_numeros_telefonicos_pk_seq'::regclass);


--
-- TOC entry 2042 (class 2604 OID 35338709)
-- Dependencies: 1607 1523
-- Name: tls_numeros_telefonicos_sucursales_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE numeros_telefonicos_sucursales ALTER COLUMN tls_numeros_telefonicos_sucursales_pk SET DEFAULT nextval('numeros_telefonicos_sucursale_tls_numeros_telefonicos_sucur_seq'::regclass);


--
-- TOC entry 2043 (class 2604 OID 35338710)
-- Dependencies: 1609 1524
-- Name: ntt_numeros_telefonicos_tipo_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE numeros_telefonicos_tipo ALTER COLUMN ntt_numeros_telefonicos_tipo_pk SET DEFAULT nextval('numeros_telefonicos_tipo_ntt_numeros_telefonicos_tipo_pk_seq'::regclass);


--
-- TOC entry 2044 (class 2604 OID 35338711)
-- Dependencies: 1610 1525
-- Name: org_organismos_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE organismos ALTER COLUMN org_organismos_pk SET DEFAULT nextval('organismos_org_organismos_pk_seq'::regclass);


--
-- TOC entry 2045 (class 2604 OID 35338712)
-- Dependencies: 1611 1526
-- Name: pnt_personas_naturales_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE personas_naturales ALTER COLUMN pnt_personas_naturales_pk SET DEFAULT nextval('personas_naturales_pnt_personas_naturales_seq'::regclass);


--
-- TOC entry 2046 (class 2604 OID 35338713)
-- Dependencies: 1612 1527
-- Name: ren_rendimientos_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE rendimientos ALTER COLUMN ren_rendimientos_pk SET DEFAULT nextval('rendimientos_ren_rendimientos_pk_seq'::regclass);


--
-- TOC entry 2048 (class 2604 OID 35338714)
-- Dependencies: 1614 1528
-- Name: srt_sol_rec_xtipo_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE sol_rec_xtipo ALTER COLUMN srt_sol_rec_xtipo_pk SET DEFAULT nextval('sol_rec_xtipo_srt_sol_rec_xtipo_pk_seq'::regclass);


--
-- TOC entry 2049 (class 2604 OID 35338715)
-- Dependencies: 1615 1529
-- Name: svr_solvencias_recaudos_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE solvencias_recaudos ALTER COLUMN svr_solvencias_recaudos_pk SET DEFAULT nextval('solvencias_recaudos_svr_solvencias_recaudos_pk_seq'::regclass);


--
-- TOC entry 2050 (class 2604 OID 35338716)
-- Dependencies: 1616 1531
-- Name: tpa_tipo_actividad_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tipo_actividad ALTER COLUMN tpa_tipo_actividad_pk SET DEFAULT nextval('tipo_actividad_tpa_tipo_actividad_pk_seq'::regclass);


--
-- TOC entry 2051 (class 2604 OID 35338717)
-- Dependencies: 1617 1532
-- Name: tpc_tipo_cooperativa_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tipo_cooperativa ALTER COLUMN tpc_tipo_cooperativa_pk SET DEFAULT nextval('tipo_cooperativa_tpc_tipo_cooperativa_pk_seq'::regclass);


--
-- TOC entry 2052 (class 2604 OID 35338718)
-- Dependencies: 1618 1533
-- Name: tpf_tipo_firma_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tipo_firma ALTER COLUMN tpf_tipo_firma_pk SET DEFAULT nextval('tipo_firma_tpf_tipo_firma_pk_seq'::regclass);


SET search_path = sistema, pg_catalog;

--
-- TOC entry 2053 (class 2604 OID 35338719)
-- Dependencies: 1621 1581
-- Name: usr_usuarios_pk; Type: DEFAULT; Schema: sistema; Owner: postgres
--

ALTER TABLE usuarios ALTER COLUMN usr_usuarios_pk SET DEFAULT nextval('usuarios_usr_usuarios_pk_seq'::regclass);


--
-- TOC entry 2054 (class 2604 OID 35338720)
-- Dependencies: 1619 1582
-- Name: usm_usuarios_menu_pk; Type: DEFAULT; Schema: sistema; Owner: postgres
--

ALTER TABLE usuarios_menu ALTER COLUMN usm_usuarios_menu_pk SET DEFAULT nextval('usuarios_menu_usm_usuarios_menu_pk_seq'::regclass);


--
-- TOC entry 2055 (class 2604 OID 35338721)
-- Dependencies: 1620 1583
-- Name: uso_usuarios_opciones_pk; Type: DEFAULT; Schema: sistema; Owner: postgres
--

ALTER TABLE usuarios_opciones ALTER COLUMN uso_usuarios_opciones_pk SET DEFAULT nextval('usuarios_opciones_uso_usuarios_opciones_pk_seq'::regclass);


SET search_path = public, pg_catalog;

--
-- TOC entry 2186 (class 0 OID 35338251)
-- Dependencies: 1500
-- Data for Name: areas_objeto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY areas_objeto (aob_areas_objeto_pk, aob_nombre, aob_inicial, aob_activo) FROM stdin;
3	Vialidad	V	t
18	Consultores	C	t
19	Edificios	E	t
36	Fundaciones	F	t
5	Hidraúlica	H	t
4	Servicios	S	t
\.


--
-- TOC entry 2187 (class 0 OID 35338255)
-- Dependencies: 1502
-- Data for Name: auditoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auditoria (adt_auditoria_pk, adt_fecha_hora, adt_tabla, adt_accion, adt_usuario, adt_pk_registro, adt_campo_afectado, adt_valor_old, adt_valor_new, adt_cliente_ip) FROM stdin;
\.


--
-- TOC entry 2188 (class 0 OID 35338260)
-- Dependencies: 1503
-- Data for Name: ciudades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ciudades (ciu_ciudades_pk, mun_municipio_fk, ciu_nombre, ciu_abreviatura, ciu_activo) FROM stdin;
2	2	SAN FERNANDO DE ATABAPO	SATAB	t
3	3	PUERTO AYACUCHO	PTAY	t
4	4	ISLA RATÓN	ISRT	t
5	5	SAN JUAN DE MANAPIARE	SJM	t
6	6	MAROA	MAR	t
7	7	SAN CARLOS DE RÍO NEGRO	SNRN	t
8	8	ANACO	ANA	t
9	9	ARAGUA DE BARCELONA	ARA	t
10	10	LECHERÍA	LECH	t
11	11	PUERTO PÍRITU	PPIR	t
12	12	VALLE DE GUANAPE	VLLP	t
13	13	PARIAGUÁN	PAR	t
14	14	GUANTA	GUA	t
15	15	SOLEDAD	SOL	t
16	16	MAPIRE	MAP	t
17	17	PUERTO LA CRUZ	PTLC	t
18	18	ONOTO	ONO	t
19	19	SAN MATEO	SNMT	t
20	20	CLARINES	CLA	t
21	21	CANTAURA	CAN	t
22	22	PÍRITU	PRT	t
23	23	EL TIGRITO	ELTGRT	t
24	24	BOCA DE UCHIRE	BCUCH	t
25	25	SANTA ANA	STA	t
26	26	BARCELONA	BAR	t
27	27	EL TIGRE	ETGR	t
28	28	EL CHAPARRO	ELCHP	t
29	29	ACHAGUAS	ACHA	t
30	30	BIRUACA	BIR	t
31	31	BRUZUAL	BRU	t
32	32	SAN JUAN DE PAYARA	SJP	t
33	33	GUASDUALITO	GUAS	t
34	34	ELORZA	ELO	t
35	35	SAN FERNANDO DE APURE	SNF	t
36	36	SAN MATEO	SNMT	t
37	37	CAMATAGUA	CAMA	t
38	38	SANTA RITA	SNRIT	t
39	39	MARACAY	MAR	t
40	40	SANTA CRUZ	SNC	t
41	41	LA VICTORIA	LAVIC	t
42	42	EL CONSEJO	ELCN	t
43	43	PALO NEGRO	PNEGR	t
44	44	EL LIMÓN	EL	t
45	45	OCUMARE DE LA COSTA	OCO	t
46	46	SAN CASIMIRO	SNC	t
47	47	SAN SEBASTIÁN	SNSB	t
48	48	TURMERO	TUR	t
49	49	LAS TEJERÍAS	LTEJ	t
50	50	CAGUA	CAG	t
51	51	COLONIA TOVAR	CTOV	t
52	52	BARBACOAS	BAR	t
53	53	VILLA DE CURA	VLLCR	t
54	54	SABANETA	SAB	t
55	55	EL CANTÓN	ECTN	t
56	56	SOCOPÓ	SOC	t
57	57	ARISMENDI	ARIS	t
58	58	BARINAS	BAR	t
59	59	BARINITAS	BART	t
60	60	BARRANCAS	BARR	t
61	61	SANTA BÁRBARA	SNBAR	t
62	62	OBISPOS	OBI	t
63	63	CIUDAD BOLIVIA	CBOL	t
64	64	LIBERTAD	LIB	t
65	65	CIUDAD DE NUTRIAS	CNUT	t
66	66	CIUDAD GUAYANA (PUERTO ORDAZ Y SAN FÉLIX)	CGUAY	t
67	67	CAICARA DEL ORINOCO	CDO	t
68	68	EL CALLAO	ECLL	t
69	69	SANTA ELENA DE UAIRÉN	SEG	t
70	70	CIUDAD BOLÍVAR	CBOL	t
71	71	EL PALMAR	EPMR	t
72	72	UPATA	UPA	t
73	73	CIUDAD PIAR	CPIAR	t
74	74	GUASIPATI	GUA	t
75	75	EL DORADO	ELDOR	t
76	76	MARIPA	MAR	t
77	77	BEJUMA	BEJ	t
78	78	GÜIGÜE	GUI	t
79	79	MARIARA	MAR	t
80	80	GUACARA	GUA	t
81	81	MORÓN	MOR	t
82	82	TOCUYITO	TOC	t
83	83	LOS GUAYOS	LGY	t
84	84	MIRANDA	MIR	t
85	85	MONTALBÁN	MNTB	t
86	86	NAGUANAGUA	NAG	t
87	87	PUERTO CABELLO	PTCB	t
88	88	SAN DIEGO	SND	t
89	89	SAN JOAQUÍN	SNJ	t
90	90	VALENCIA	VAL	t
91	91	CIUDAD DE COJEDES	CCOJ	t
92	92	EL PAO	EPAO	t
93	93	TINAQUILLO	TINA	t
94	94	EL BAÚL	EBAUL	t
95	95	MACAPO	MAC	t
96	96	LIBERTAD	LIB	t
97	97	LAS VEGAS	LVGS	t
98	98	SAN CARLOS	SNCA	t
99	99	TINACO	TIN	t
100	100	CURIAPO	CUR	t
101	101	SIERRA IMATACA	SIMA	t
102	102	PEDERNALES	PED	t
103	103	TUCUPITA	TUC	t
104	104	CARACAS	CCS	t
105	105	SAN JUAN DE LOS CAYOS	SJCY	t
106	106	SAN LUIS	SNLS	t
107	107	CAPATÁRIDA	CAP	t
108	108	YARACAL	YAR	t
109	109	PUNTO FIJO	PF	t
110	110	LA VELA DE CORO	LVELA	t
111	111	DABAJURO	DAB	t
112	112	PEDREGAL	PED	t
113	113	PUEBLO NUEVO	PNVO	t
114	114	CHURUGUARA	CHU	t
115	115	JACURA	JAC	t
116	116	SANTA CRUZ DE LOS TAQUES	LTQ	t
117	117	MENE DE MAUROA	MAU	t
118	118	SANTA ANA DE CORO	CORO	t
119	119	CHICHIRIVICHE	CHI	t
120	120	PALMA SOLA	PSO	t
121	121	CABURE	CAB	t
122	122	PÍRITU	PIR	t
123	123	MIRIMIRE	MIRI	t
124	124	TUCACAS	TUC	t
125	125	LA CRUZ DE TARATARA	LCTR	t
126	126	TOCÓPERO	TOC	t
127	127	SANTA CRUZ DE BUCARAL	SNCBC	t
128	128	URUMACO	URU	t
129	129	PUERTO CUMAREBO	PTCMB	t
130	130	CAMAGUÁN	CAMA	t
131	131	CHAGUARAMAS	CHAG	t
132	132	EL SOCORRO	ESOC	t
133	133	CALABOZO	CAL	t
134	134	TUCUPIDO	TUC	t
135	135	ALTAGRACIA DE ORITUCO	JTM	t
136	136	SAN JUAN DE LOS MORROS	SJM	t
137	137	EL SOMBRERO	ESMB	t
138	138	LAS MERCEDES	LM	t
139	139	VALLE DE LA PASCUA	VLLPSC	t
140	140	ORTIZ	ORT	t
141	141	ZARAZA	ZAR	t
142	142	GUAYABAL	GUAY	t
143	143	SAN JOSÉ DE GUARIBE	SJG	t
144	144	SANTA MARÍA DE IPIRE	SMI	t
145	145	SANARE	SAN	t
146	146	DUACA	DUA	t
147	147	BARQUISIMETO	BARQ	t
148	148	QUIBOR	QUI	t
149	149	EL TOCUYO	ELTOC	t
150	150	CABUDARE	CABU	t
151	151	SARARE	SAN	t
152	152	CARORA	CAR	t
153	153	SIQUISIQUE	SIQ	t
154	154	EL VIGÍA	EVIG	t
155	155	LA AZULITA	LAZT	t
156	156	SANTA CRUZ DE MORA	SNCMO	t
157	157	ARICAGUA	ARI	t
158	158	CANAGUA	CAN	t
159	159	EJIDO	EJI	t
160	160	TUCANI	TUC	t
161	161	SANTO DOMINGO	SNDG	t
162	162	GUARAQUE	GUA	t
163	163	ARAPUEY	ARA	t
164	164	TORONDOY	TOR	t
165	165	MÉRIDA	MER	t
166	166	TIMOTES	TIM	t
167	167	SANTA ELENA DE ARENALES	SEDA	t
168	168	SANTA MARÍA DE CAPARO	SMDC	t
169	169	PUEBLO LLANO	PLLN	t
170	170	MUCUCHÍES	MUCU	t
171	171	BAILADORES	BAIL	t
172	172	TABAY	TABAY	t
173	173	LAGUNILLAS	LAG	t
174	174	TOVAR	TOV	t
175	175	NUEVA BOLIVIA	NVBOL	t
176	176	ZEA	ZEA	t
177	177	CAUCAGUA	CAU	t
178	178	BARLOVENTO	BAR	t
179	179	NUESTRA SEÑORA DEL ROSARIO DE BARUTA	BARU	t
180	180	HIGUEROTE	HIG	t
181	181	MAMPORAL	MAMP	t
182	182	CARRIZAL	CAR	t
183	183	CHACAO	CHA	t
184	184	CHARALLAVE	CHARV	t
185	185	EL HATILLO	EHAT	t
186	186	LOS TEQUES	LTQS	t
187	187	SANTA TERESA DEL TUY	STDT	t
188	188	OCUMARE DEL TUY	OCDT	t
189	189	SAN ANTONIO DE LOS ALTOS	SNANT	t
190	190	RÍO CHICO	RCHI	t
191	191	SANTA LUCÍA DEL TUY	SNLDT	t
192	192	CÚPIRA	CUP	t
193	193	GUARENAS	GUA	t
194	194	SAN FRANCISCO DE YARE	SFCOY	t
195	195	CÚA	CUA	t
196	196	PETARE	PET	t
197	197	GUATIRE	GUAT	t
198	198	SAN ANTONIO DE MATURÍN	SNAM	t
199	199	AGUASAY	AGU	t
200	200	CARIPITO	CAR	t
201	201	CARIPE	CARP	t
202	202	CAICARA DE MATURÍN	CDM	t
203	203	PUNTA DE MATA	PDM	t
204	204	TEMBLADOR	TEM	t
205	205	MATURÍN	MAT	t
206	206	ARAGUA DE MATURÍN	AMAT	t
207	207	QUIRIQUIRE	QUI	t
208	208	SANTA BÁRBARA	SNBR	t
209	209	BARRANCAS DEL ORINOCO	BRRDO	t
210	210	URACOA	URA	t
211	211	LA PLAZA DE PARAGUACHÍ	PAR	t
212	212	LA ASUNCIÓN	LASNC	t
213	213	SAN JUAN BAUTISTA	SJB	t
214	214	EL VALLE DEL ESPÍRITU SANTO	VES	t
215	215	SANTA ANA	SANA	t
216	216	PAMPATAR	PAM	t
217	217	JUAN GRIEGO	JGRI	t
218	218	PORLAMAR	PLMAR	t
219	219	BOCA DE RÍO	BCRIO	t
220	220	PUNTA DE PIEDRAS	PTPIE	t
221	221	SAN PEDRO DE COCHE	SNPDC	t
222	222	AGUA BLANCA	AGBC	t
223	223	ARAURE	ARA	t
224	224	PÍRITU	PIR	t
225	225	GUANARE	GUA	t
226	226	GUANARITO	GTO	t
227	227	PARAÍSO DE CHABASQUÉN	CHA	t
228	228	OSPINO	OSP	t
229	229	ACARIGUA	ACA	t
230	230	PAPELÓN	PPLN	t
231	231	BOCONOÍTO	BOCT	t
232	232	SAN RAFAEL DE ONOTO	SNRO	t
233	233	EL PLAYÓN	EPLYN	t
234	234	BISCUCUY	BIS	t
235	235	VILLA BRUZUAL	VBRU	t
236	236	CASANAY	CAS	t
237	237	SAN JOSÉ DE AEROCUAR	SNJAE	t
238	238	RÍO CARIBE	RCAR	t
239	239	EL PILAR	EPLR	t
240	240	CARÚPANO	CARU	t
241	241	MARIGÜITAR	MAR	t
242	242	YAGUARAPARO	YAG	t
243	243	ARAYA	ARY	t
244	244	TUNAPUY	TUN	t
245	245	IRAPA	IRA	t
246	246	SAN ANTONIO DEL GOLFO	SNADG	t
247	247	CUMANACOA	CUM	t
248	248	CARIACO	CAR	t
249	249	CUMANÁ	CUM	t
250	250	GÜIRIA	GUI	t
251	251	CORDERO	COR	t
252	252	LAS MESAS	LMS	t
253	253	SAN JUAN DE COLÓN	SJDC	t
254	254	SAN ANTONIO DEL TÁCHIRA	SNANTCH	t
255	255	TÁRIBA	TAR	t
256	256	SANTA ANA DE TÁCHIRA	SNATCH	t
257	257	SAN RAFAEL DEL PIÑAL	SNRDP	t
258	258	SAN JOSÉ DE BOLÍVAR	SNJB	t
259	259	LA FRÍA	LFRIA	t
260	260	PALMIRA	PAL	t
261	261	CAPACHO NUEVO	CAPNVO	t
262	262	LA GRITA	LGRITA	t
263	263	EL COBRE	ECOBR	t
264	264	RUBIO	RUBIO	t
265	265	CAPACHO VIEJO	CAPVJ	t
266	266	ABEJALES	ABEJ	t
267	267	LOBATERA	LOB	t
268	268	MICHELENA	MICH	t
269	269	COLONCITO	CLNTO	t
270	270	UREÑA	URE	t
271	271	DELICIAS	DEL	t
272	272	LA TENDIDA	LTEND	t
273	273	SAN CRISTÓBAL	SNCRTB	t
274	274	SEBORUCO	SEB	t
275	275	SAN SIMÓN	SSMON	t
276	276	QUENIQUEA	QUE	t
277	277	SAN JOSECITO	SNJSTO	t
278	278	PREGONERO	PRE	t
279	279	UMUQUENA	UMU	t
280	280	SANTA ISABEL	SNTIBL	t
281	281	BOCONÓ	BOC	t
282	282	SABANA GRANDE	SGDE	t
283	283	CHEJENDÉ	CHEJ	t
284	284	CARACHE	CAR	t
285	285	ESCUQUE	ESQ	t
286	286	EL PARADERO	EPARA	t
287	287	CAMPO ELÍAS	CELS	t
288	288	SANTA APOLONIA	SNTAPO	t
289	289	EL DIVIDIVE	EDIV	t
290	290	MONTE CARMELO	MTC	t
291	291	MOTATÁN	MOT	t
292	292	PAMPÁN	PAM	t
293	293	PAMPANITO	PMPT	t
294	294	BETIJOQUE	BJQ	t
295	295	CARVAJAL	CAR	t
296	296	SABANA DE MENDOZA	SMDZ	t
297	297	TRUJILLO	TRU	t
298	298	LA QUEBRADA	LQBD	t
299	299	VALERA	VAL	t
300	300	LA GUAIRA	GUA	t
301	301	SAN PABLO	SNPBL	t
302	302	AROA	AROA	t
303	303	COCOROTE	COC	t
304	304	INDEPENDENCIA	INDP	t
305	305	BORAURE	BOR	t
306	306	YUMARE	YUM	t
307	307	NIRGUA	NIR	t
308	308	YARITAGUA	YRTG	t
309	309	SAN FELIPE	SNF	t
310	310	GUAMA	GUA	t
311	311	URACHICHE	URA	t
312	312	FARRIAR	FERR	t
313	313	CHIVACOA	CHIV	t
314	314	SABANA DE PARRA	SPRR	t
315	315	EL TORO	ETORO	t
316	316	SAN TIMOTEO	SNTTEO	t
317	317	CABIMAS	CAB	t
318	318	ENCONTRADOS	ENC	t
319	319	SAN CARLOS DEL ZULIA	SCLS	t
320	320	PUEBLO NUEVO-EL CHIVO	PNVO	t
321	321	LA CONCEPCIÓN	LCNCP	t
322	322	CASIGUA-EL CUBO	CAS	t
323	323	CONCEPCIÓN	CNCP	t
324	324	CIUDAD OJEDA	COJD	t
325	325	MACHIQUES	MACH	t
326	326	SAN RAFAEL DE EL MOJÁN	EMJAN	t
327	327	MARACAIBO	MCBO	t
328	328	LOS PUERTOS DE ALTAGRACIA	LPTS	t
329	329	SINAMAICA	SINA	t
330	330	SAN FRANCISCO	SFCO	t
331	331	SANTA RITA	SNTRT	t
332	332	TÍA JUANA	TJNA	t
333	333	VILLA DEL ROSARIO	VROS	t
334	334	BOBURES	BOB	t
335	335	BACHAQUERO	BACH	t
1	1	LA ESMERALDA	LAES	t
337	331	SAN FRANCISCO	SF	t
338	177	ACEVEDO	AC	t
\.


--
-- TOC entry 2221 (class 0 OID 35871069)
-- Dependencies: 1631
-- Data for Name: con; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY con (con_contratistas_pk, nfs_nivel_financiero_snc_fk, tpc_tipo_cooperativa_fk, ciu_ciudades_fk, ctp_contratistas_tipo_fk, ett_contratistas_estatus_fk, con_nombre, con_siglas, con_numero_rif, con_numero_rnc, con_fecha_inscripcion_rnc, con_fecha_vencimiento_rnc, con_direccion_fiscal, con_codigo_postal, con_email, tpf_tipo_firma_fk, con_calificacion_financiera, con_capacidad_financiera, con_objeto_cooperativa, con_tiempo_cooperativa, con_objeto_social_cooperativa, con_duracion_cooperativa, ics_indice_capital_social_fk, con_fecha_inscripcion, con_codigo_siez) FROM stdin;
811	1	1	327	1	\N	S & C SERVICIOS,C.A.		J-30672049-9	20010523000000	2009-01-01	2009-12-31	CALLE 72 CON AV.17			\N		\N		\N		\N	\N	\N	\N
883	1	1	327	1	\N	CIGCA,C.A.		J-30660926-1	20021016000001	2009-01-01	2009-12-31	CARRETERA VIA EL MOJAN AV.16 C.C. PALAIMA LOCAL 1-2			\N		\N		\N		\N	\N	\N	\N
1469	1	1	327	1	\N	L.C. INGENIERIA,C.A.		J-30737159-5	20001214000003	2009-01-01	2009-12-31	CALLE 85 NO.8-81			\N		\N		\N		\N	\N	\N	\N
1500	1	1	327	1	\N	CONSTRUCCIONES H Y P,C.A.		J-30695909-2	20010212000001	2009-01-01	2009-12-31	KM.48 VIA A PERIJA			\N		\N		\N		\N	\N	\N	\N
1524	1	1	327	1	\N	ARQUITEC,S.A.		J-07052063-9	20010131000001	2009-01-01	2009-12-31	CALLE 84 UNION RES.DON PAULO 3F-110			\N		\N		\N		\N	\N	\N	\N
1582	1	1	327	1	\N	CONSTRUCTORA MARCUZZI,C.A.	COMARCA	J-09009520-9	20011102000002	2009-01-01	2009-12-31	AV.24 CON CALLE 68 N0. 68-06			\N		\N		\N		\N	\N	\N	\N
1638	1	1	327	1	\N	ORME C.A.	ORMECA	J-30892088-6	20030610000000	2009-01-01	2009-12-31	AV.15 N0. 75-51			\N		\N		\N		\N	\N	\N	\N
1810	1	1	327	1	\N	J.N. INGENIERIA,C.A.		J-30390404-1	20040217000001	2009-01-01	2009-12-31	AV.28B # 58A-26			\N		\N		\N		\N	\N	\N	\N
1871	1	1	327	1	\N	ROUS & ASOCIADOS,C.A.		J-30741096-5	20050118000001	2009-01-01	2009-12-31	CALLE J CASA N0. 8-28			\N		\N		\N		\N	\N	\N	\N
1878	1	1	327	1	\N	COLGRI, C.A.		J-30369620-1	20050302000002	2009-01-01	2009-12-31	CALLE 40 N0. 13A-20			\N		\N		\N		\N	\N	\N	\N
2119	1	1	327	1	\N	INVERSIMC		V- 09182888-6	20070801000001	2009-01-01	2009-12-31	CALLE 172 N. 44- 86 URB COROMOTO SAM FCSO			\N		\N		\N		\N	\N	\N	\N
2223	1	1	327	1	\N	EMPRESA DE PRODUCCION SICIAL REY DE REYES C.A	EPS REY DE REYES C.A	J- 29530079-4	20081014000001	2009-01-01	2009-12-31	AV.  21 CALLE 104 N. 104- 20 SECTOR LA POMONA			\N		\N		\N		\N	\N	\N	\N
2224	1	1	327	1	\N	COOP CONSTRUCCIONES AGROPECUARIA DEL SUR		J- 31653630-0	20081015000001	2009-01-01	2009-12-31	KM. 8 CARRETERA PUERTO CONCHA EL PARAISO			\N		\N		\N		\N	\N	\N	\N
2225	1	1	327	1	\N	SERV SIMINIS TRANSPORTE E INVERSIONES  C.A	SERSUTRAINCA	J- 31538701-8	20081016000001	2009-01-01	2009-12-31	SECTOR LA PUNTA CALLE 24 CON AV. 8 CASA N. 22-105			\N		\N		\N		\N	\N	\N	\N
2226	1	1	327	1	\N	ASOCIACION COOPERATIVA SERVICIOS CONST Y MANT	COOPSCOM	J- 31611447-3	20081030000001	2009-01-01	2009-12-31	SECTOR RIO ROSALES CALLE LOS ROSALES			\N		\N		\N		\N	\N	\N	\N
2227	1	1	327	1	\N	MAZA INVERSIONES Y CONSTRUCCIONES  C.A	MINCCA	J- 29615312-4	20081030000002	2009-01-01	2009-12-31	AV. 4 BELLA VISTA CON CALLE 83 EDIF CARACAS N. 7			\N		\N		\N		\N	\N	\N	\N
2228	1	1	327	1	\N	CONSTRUCTORA EDISON Y FRANKLIN  C.A	EDIFRANCA	J- 29405698-9	20081105000001	2009-01-01	2009-12-31	LOCAL S/N - SECTOR PUEBLO NUEVO			\N		\N		\N		\N	\N	\N	\N
2229	1	1	327	1	\N	INVERSIONES ANTEL C.A.	ANTEL. C.A	J-29600818-3	20081009000002	2009-01-01	2009-12-31	URB. COROMOTO AV. 36 No. 165-181, SAN FRANCISCO			\N		\N		\N		\N	\N	\N	\N
2230	1	1	327	1	\N	INVERSIONES R & R 3000  C.A	INVERCA	J-31483111-9	20081110000001	2009-01-01	2009-12-31	CALLE 59 A N. 4-30 SECTOR LAS MERCEDES			\N		\N		\N		\N	\N	\N	\N
2231	1	1	327	1	\N	INGENERIA GONZALEZ . C.A	INGONCA	J-30713850-5	20081112000001	2009-01-01	2009-12-31	EDIF BANCO CARACAS 1 PISO OFIC 1-A			\N		\N		\N		\N	\N	\N	\N
2240	1	1	327	1	\N	TOPOGRAFIA ZULIANA, COMPAÃ‘IA ANONIMA	TOZULCA	J- 29501801-0	20090119000001	2009-01-01	2009-12-31	CALLE BARLOMENTO CASA N. 06 SECTOR MONTE CLARO			\N		\N		\N		\N	\N	\N	\N
2241	1	1	327	1	\N	CONSTRUCCIONES FARIA.  C.A	CONFACA	J- 07055017-1	20090121000001	2009-01-01	2009-12-31	CALLE FRANCIA A 500 MTS DE LA GN. CONCEPCION MUCP J.E LOSADA			\N		\N		\N		\N	\N	\N	\N
2242	1	1	327	1	\N	INROVECA. C.A		J- 30942763-6	20090123000001	2009-01-01	2009-12-31	C.C VILLASMIL CALLE 65 CON AV. 4A N. 65-40			\N		\N		\N		\N	\N	\N	\N
2243	1	1	327	1	\N	CONATRUCCIONES Y SERVICIOS. M&C . C.A		J- 31385722-0	20090126000001	2009-01-01	2009-12-31	CARRETERA L ENTRE CALLE 44 Y 61			\N		\N		\N		\N	\N	\N	\N
2244	1	1	327	1	\N	CONSTRUCCIONES Y SERVICIOS M&C. C.A		J- 31385722-0	20090126000002	2009-01-01	2009-12-31	CARRETERA , L  ENTRE CALLE 44 Y 61 CIUDAD OJEDA			\N		\N		\N		\N	\N	\N	\N
2245	1	1	327	1	\N	CONSTRUCTORA BAREMA, C.A	BAREMA,C.A	J- 31651728-4	20090127000001	2009-01-01	2009-12-31	AV. 1O ENTRE CALLE 66A Y 67 C.C  ALIJUNA LOCAL 2 SECTOR TIERRA NEGRA			\N		\N		\N		\N	\N	\N	\N
2246	1	1	327	1	\N	GRUPO EMPRESARIAL INMASERCA  S.A		J- 30414846-1	20090127000002	2009-01-01	2009-12-31	AV. 4A CON CALLE 65 N. 40, SECTOR BELLA VISTA			\N		\N		\N		\N	\N	\N	\N
2247	1	1	327	1	\N	PREFABRICADOS Y CONSTRUCCIONES, C.A	PRECONCA	J- 29358392-6	20090130000001	2009-01-01	2009-12-31	CALLE 129, CASA N. 80 A- 56 SECTOR BARRIO ALMALARIA			\N		\N		\N		\N	\N	\N	\N
2248	1	1	327	1	\N	CONSTRUCCIONES MARACAIBO,  C.A	CONSTRUMARA, C.A	J- 31688934-3	20090130000002	2009-01-01	2009-12-31	AV. 4 BELLA  EDIF MANGLE PISO 7 A			\N		\N		\N		\N	\N	\N	\N
2249	1	1	327	1	\N	SERVIPROMCA,  C. A		J- 29701188-9	20090204000001	2009-01-01	2009-12-31	TORRE EL SALADILLO EDIF PORLAMAR PISO 15 APTA 15-8			\N		\N		\N		\N	\N	\N	\N
2250	1	1	327	1	\N	CONSTRUCCIONES ROCAYA		J- 31348604-3	20090218000001	2009-01-01	2009-12-31	AV. 13 N. 50-57  EL PORTAL			\N		\N		\N		\N	\N	\N	\N
194	1	1	327	1	1	ING.BENEDICTO RAMON RINCON MORALES	ING.BENEDICTO RAMON RINCON MOR	V-02773317-0	19990614000009	2009-01-01	2009-12-31	SIN DIRECCIÃ“N	1	1	1		1.00	1	1	1	1	\N	\N	\N
272	1	1	327	1	\N	URBANIZADORA FAMA, C.A.		J-07050625-3	19990318000004	2009-01-01	2009-12-31	CALLE 72 CON AV.19 EDIF.NOEL P.B. LOCAL H			\N		\N		\N		\N	\N	\N	\N
284	1	1	327	1	\N	EDM CONSTRUCCIONES, C.A.		J-30366344-3	20000127000002	2009-01-01	2009-12-31	C/115 #.59-115 SECTOR LOS ROBLES			\N		\N		\N		\N	\N	\N	\N
294	1	1	327	1	\N	VORTEX, COMPAÃ‘IA ANONIMA	VORTEXCA	J-30364967-0	19990526000006	2009-01-01	2009-12-31	AV.LIBERTAD C/ BELGRANO MINIICENTRO JHOINER P.A. LOCAL 03 CAB			\N		\N		\N		\N	\N	\N	\N
338	1	1	327	1	\N	CONSTRUCTORA MISOA, C.A.	COMISO, C.A.	J-30255258-3	19990310000092	2009-01-01	2009-12-31	CALLE CAMINO NUEVO,CASA SIN NO.,C/C BOJAS ROMERO,LA RITA			\N		\N		\N		\N	\N	\N	\N
379	1	1	327	1	\N	TRANSPORTE RODGHER, S.A.		J-30023819-9	20000417000000	2009-01-01	2009-12-31	C.SAN MATIAS ENTRANDO POR LA AV. 41			\N		\N		\N		\N	\N	\N	\N
384	1	1	327	1	\N	CONSULTORA CHACIN MONRREAL, C.A.	CONSULTORA CH.M, C.A.	J-30364565-8	19990315000077	2009-01-01	2009-12-31	SAN JOSE AVDA.EUDON PEREZ,CARRETERA J,CIUDAD OJEDA			\N		\N		\N		\N	\N	\N	\N
404	1	1	327	1	\N	EDICA CONSTRUCCIONES, C.A.		J-30167012-4	19990318000098	2009-01-01	2009-12-31	CALLE GH NO. 10-18			\N		\N		\N		\N	\N	\N	\N
395	1	1	327	1	\N	CONSTRUCCIONES Y MANTENIMIENTO LUSAN, C.A.	LUSANCA	J-30121226-6	19990304000038	2009-01-01	2009-12-31	AV.9B ESQUINA C/C 73 #72-68			\N		\N		\N		\N	\N	\N	\N
410	1	1	327	1	\N	DISEÃ‘O Y CONSTRUCCION DE OBRAS CIVILES,C.A.	DICONCA	J-30716330-5	20001215000000	2009-01-01	2009-12-31	AV.3Y ENTRE CALLES 78 Y 79 C.C.SALTO ANGEL PRIMER NIVEL L.53			\N		\N		\N		\N	\N	\N	\N
415	1	1	327	1	\N	ACROPOLIS DISEÃ‘OS Y CONSTRUCCIONES,C.A.	ACROPOLIS,C.A.	J-30726101-3	20001215000001	2009-01-01	2009-12-31	AV.3Y ENTRE CALLES 78 Y 79 C.C.SALTO ANGEL PRIMER NIVEL L.53			\N		\N		\N		\N	\N	\N	\N
430	1	1	327	1	\N	INGENIERIA NEGLIS Y CARLOS C.A.	INEYCAR C.A.	J-30704294-0	20001207000001	2009-01-01	2009-12-31	EL MANZANILLO CALLE 3 CON AV. 24D NO. 3-25			\N		\N		\N		\N	\N	\N	\N
431	1	1	327	1	\N	H.J.PROYECTOS Y CONSTRUCCIONES  C.A.	HUJIMPROCA	J-30721143-1	20001211000000	2009-01-01	2009-12-31	AV.15 SECTOR TIERRA NEGRA EDIF.GREDOS NO.67B-10 LOCAL 4			\N		\N		\N		\N	\N	\N	\N
433	1	1	327	1	\N	CONSTRUCTORA CRESMO, C.A.		J-07041337-9	19990308000068	2009-01-01	2009-12-31	AV.9B C/CALLE QTA.CHECHE SECTOR TIERRA NEGRA			\N		\N		\N		\N	\N	\N	\N
438	1	1	327	1	\N	CONSTRUCCIONES Y PROYECTOS CYPCA,C.A.	CYPCA,C.A.	J-07045629-9	20001213000002	2009-01-01	2009-12-31	AV. LA LIMPIA NO-41-45			\N		\N		\N		\N	\N	\N	\N
441	1	1	327	1	\N	RO-CAL C.A.	ROCALCA	J-07030205-4	20010117000000	2009-01-01	2009-12-31	CARRETERA PRINCIPAL A CAMPO MARA NO. 45-122.			\N		\N		\N		\N	\N	\N	\N
1108	1	1	327	1	\N	INGENIERIA Y CONSTRUCCION INTEGRAL, C.A.	INCICA	J-30202673-3	19990310000022	2009-01-01	2009-12-31	CALLE 67B,ENTRE AV.13A Y 13B N.13-44			\N		\N		\N		\N	\N	\N	\N
2111	1	1	327	1	\N	CHAPITEL, C.A		J- 30067069-4	20070618000001	2009-01-01	2009-12-31	RES LA PILOX			\N		\N		\N		\N	\N	\N	\N
2217	1	1	327	1	\N	CONSTRUCCIONES CONDIESCA .C.A		J- 07041809-5	20080919000001	2009-01-01	2009-12-31	AV. 2 C.C CARIBE NIVEL PANTA BAJA			\N		\N		\N		\N	\N	\N	\N
2218	1	1	327	1	\N	ROMERO VEGA C.A	ROVECA	J- 29433411-3	20080922000001	2009-01-01	2009-12-31	CALLE LAS FLORES N. 15-62-B URB CONCORDIA			\N		\N		\N		\N	\N	\N	\N
2219	1	1	327	1	\N	CORPORACION S.R.V. C.A	S.R.V.C.A	J- 31496600-6	20080924000001	2009-01-01	2009-12-31	CALLE 86 AV. BELLA VISTA C.C  AKRAI CENTER PISO 1 LOCAL 6-B			\N		\N		\N		\N	\N	\N	\N
2220	1	1	327	1	\N	CONSTRUCCIONES CIVILES MORALES QUINTERO. C.A	MOR- QUIN	J- 30069558-1	20080929000001	2009-01-01	2009-12-31	CALLE BUENOS AIRE LOCAL N. 11 SECTOR MONTE REY			\N		\N		\N		\N	\N	\N	\N
451	1	1	327	1	\N	INVERSIONES INBRUWAL C.A.	INBRUWALCA	J-304283921-1	20010116000000	2009-01-01	2009-12-31	AV. 4 CON CALLE 84 ANT. UNION EDIF. MONACO OFIC. 11A.			\N		\N		\N		\N	\N	\N	\N
458	1	1	327	1	\N	CONSTRUCCIONES GENERALES,C.A.	CONSTRUGENCA	J-30745225-0	20001211000004	2009-01-01	2009-12-31	AV.08 CON CALLE 95 SECTOR CASCO CENTRAL C.C.STA.BARBARA L-02			\N		\N		\N		\N	\N	\N	\N
461	1	1	327	1	\N	INGENIERIA,PREFABRICADOS Y CONSTRUCCION,C.A.	INPRECO,C.A.	J-30603262-2	20001214000001	2009-01-01	2009-12-31	AV.22 SABANETA GALPON 3			\N		\N		\N		\N	\N	\N	\N
462	1	1	327	1	\N	MEGASERVICIOS,C.A.	MEGASERCA	J-30716416-6	20001212000000	2009-01-01	2009-12-31	AV.58 CIRCV. 2 SECTOR AMPARO E/S BP LOCAL 2			\N		\N		\N		\N	\N	\N	\N
463	1	1	327	1	\N	CONSTRUCCIONES E INVERSIONES CARABALLO C.A.	COINCA	J-30669516-8	20001128000000	2009-01-01	2009-12-31	AV.3E NO.80-70 C.C. KARELYS LOCAL P.B. (2)			\N		\N		\N		\N	\N	\N	\N
464	1	1	327	1	\N	CONSTRUCCIONES VAMCEL,C.A.		J-30681020-0	20001206000000	2009-01-01	2009-12-31	CALLE 115  CASA NO.R58-43			\N		\N		\N		\N	\N	\N	\N
465	1	1	327	1	\N	CON-PER INTERNACIONAL,C.A.		J-30522164-2	20001221000005	2009-01-01	2009-12-31	CALLE 67 NO. 9B-10 SECTOR TIERRA NEGRA			\N		\N		\N		\N	\N	\N	\N
467	1	1	327	1	\N	SAN ANTONIO INGENIERIA, C.A.	SAIN, C.A.	J-30261957-2	19990315000078	2009-01-01	2009-12-31	CALLE 73 CON AV.113A, NO.13A-08 SECTOR TIERRA NEGRA			\N		\N		\N		\N	\N	\N	\N
468	1	1	327	1	\N	IMPROZUL,C.A.		J-30754334-5	20010208000002	2009-01-01	2009-12-31	PARQUE LAS COLINAS CALLE 96G EDIF.MIRANDA APTO.6A			\N		\N		\N		\N	\N	\N	\N
474	1	1	327	1	\N	SERVICIOS & VENTAS COMPAÃ‘IA ANONIMA	SERVENCA	J-30749713-0	20010215000000	2009-01-01	2009-12-31	CALLE 64 N0.4-134 C.C. VENVENSA PISO 1 LOCAL 13			\N		\N		\N		\N	\N	\N	\N
476	1	1	327	1	\N	INVERSIONES RODOLFO RINCON,C.A.	RORICA	J-30342357-4	20010219000002	2009-01-01	2009-12-31	AV.4 SIERRA MAESTRA			\N		\N		\N		\N	\N	\N	\N
481	1	1	327	1	\N	GARCIA & GIL INVERSORA,C.A.	G & G INVERSORA,C.A.	J-30676219-1	20010220000000	2009-01-01	2009-12-31	AV.POSTES NEGROS B.SAN JOSE CALLE 92F N0.27C-348			\N		\N		\N		\N	\N	\N	\N
483	1	1	327	1	\N	ARQUITECTURA CONSTRUCCION TECNICA,C.A.	ARQUITE,C.A.	J-301156654-4	20001227000001	2009-01-01	2009-12-31	URB.MARA NORTE,TRANVERSAL E C/CALLE 09 NO.09-21			\N		\N		\N		\N	\N	\N	\N
484	1	1	327	1	\N	ERIC ESIS CONSTRUCCIONES C.A.	E&E.C.A.	J-30145433-2	20000328000000	2009-01-01	2009-12-31	AV.LA LIMPIA SECTOR AYACUCHO CALLE 79B N0.84-21			\N		\N		\N		\N	\N	\N	\N
488	1	1	327	1	\N	CONSTRUCCIONES Y SERVICIOS MORALES,C.A.	CONSTRUSERMO	J-30324033-0	20001227000002	2009-01-01	2009-12-31	CALLE 74 AV.14A Y 15 C.C. LA COLINA LOCAL 06			\N		\N		\N		\N	\N	\N	\N
1129	1	1	327	1	\N	INVERSIONES N & B 2000,C.A.		J-30776724-3	20031002000000	2009-01-01	2009-12-31	C. F ENTRE AV.5 Y 6 N0.6-71 LOCAL 9 URB. IRAMA			\N		\N		\N		\N	\N	\N	\N
1191	1	1	327	1	\N	INGENIERIA REN COMPAÃ‘IA ANONIMA	INGRENCA	J-07038259-7	20000411000000	2009-01-01	2009-12-31	CALLE 78 # 61-227			\N		\N		\N		\N	\N	\N	\N
1621	1	1	327	1	\N	DRACO,S.A.		J-30127079-7	20010423000001	2009-01-01	2009-12-31	CALLE 71  N0.78A-28			\N		\N		\N		\N	\N	\N	\N
2012	1	1	327	1	\N	ELGA  DE  VENEZUELA   COMPAÃ‘IA  ANONIMA		J- O7000663	20060619000001	2009-01-01	2009-12-31	AV. 16 N 95B- 59  SECTOR EL TRANSITO			\N		\N		\N		\N	\N	\N	\N
489	1	1	327	1	\N	CONSTRUCTORES Y ASESORES AMBIENTALES,C.A.	CASAMCA	J-30674719-2	20001226000001	2009-01-01	2009-12-31	BARRIO SAN JOSE CALLE 19D NO. 95B-160			\N		\N		\N		\N	\N	\N	\N
490	1	1	327	1	\N	CONSTRUCCIONES TROYK,C.A.	COTROYCA	J-30169282-9	20010104000000	2009-01-01	2009-12-31	AV.17 NO.16-61 DR.PORTILLO EDIF.CONDOMINIO PISO 5 OFIC.52			\N		\N		\N		\N	\N	\N	\N
491	1	1	327	1	\N	INVERSIONES Y CONSTRUCCIONES PORLAMAR,C.A.		J-30738013-6	20010223000000	2009-01-01	2009-12-31	CALLE 93 AVES.13 Y 14 RESD.EL SALADILLO TORRE PORLAMAR P.5			\N		\N		\N		\N	\N	\N	\N
492	1	1	327	1	\N	CONSTRUCCIONES Y MANTENIMIENTO DE OBRAS ELECTRICAS Y CIVILES	COMEC C.A.	J-30014173-0	19990422000062	2009-01-01	2009-12-31	CARRETERA L ENTRE 33/34 CAMPO LINDO CABIMAS			\N		\N		\N		\N	\N	\N	\N
497	1	1	327	1	\N	MAXIMILIANO CONSTRUCCIONES, C.A.		J-30497534-1	19990324000092	2009-01-01	2009-12-31	AV.14B NO.84-65 SECTOR DELICIAS			\N		\N		\N		\N	\N	\N	\N
498	1	1	327	1	\N	CONSTRUCTORA CANALES, C.A.		J-07045803-8	19990318000016	2009-01-01	2009-12-31	AVDA 16 ENTRE CALLES 83Y84 LAS DELICIAS NO.83-88			\N		\N		\N		\N	\N	\N	\N
503	1	1	327	1	\N	PROYECTOS Y CONSTRUCCIONES, H.P., C.A.		J-30342205-5	19990312000045	2009-01-01	2009-12-31	AV.59 SECTOR CUMBRES DE MCBO,RES.TORRE MOLINO I EDIF.D			\N		\N		\N		\N	\N	\N	\N
504	1	1	327	1	\N	CONSTRUCTORA JAN, C.A.	JANCA	J-07044583-1	19990310000020	2009-01-01	2009-12-31	AV.13A,ENTRE CALLES 76 Y 77,NO.76-47 LOCAL NO.1			\N		\N		\N		\N	\N	\N	\N
508	1	1	327	1	\N	BPC CONSTRUCCIONES,C.A.		J-30003324-4000	20010314000000	2009-01-01	2009-12-31	CALLE 72 ENTE AV.3C Y 3D SECT.LA LAGO RESD. EL CUJI PB-SOT.			\N		\N		\N		\N	\N	\N	\N
513	1	1	327	1	\N	CONSTRUCCIONES,PROYECTOS E INVERSIONES ROJAS,C.A.	COPREINCA	J-30665412-7	20010222000002	2009-01-01	2009-12-31	CALLE 89 BARRIO 1RO.DE MAYO CASA N0. 19A-95			\N		\N		\N		\N	\N	\N	\N
528	1	1	327	1	\N	CONSTRUCCIONES Y CONSULTORIAS TECNICAS INDUSTRIALES C.A.	COTEICA	J-30330428-1	20000607000000	2009-01-01	2009-12-31	C.C. LAS TEJITAS LOCAL # 4 SECTOR INDIO MARA			\N		\N		\N		\N	\N	\N	\N
538	1	1	327	1	\N	CONSTRUCCIONES INGENIERIA Y SERVICIOS DE ELECTRICIDAD C.A.	COINSECA	J-30588233-9	19990806000001	2009-01-01	2009-12-31	CIRCUNVALACION # 2 C.C. EL DIVIDIVE LOCAL 4 DIAG. H. MARUMA			\N		\N		\N		\N	\N	\N	\N
543	1	1	327	1	\N	ODINCA, S.A.		J-07031763-9	19990319000044	2009-01-01	2009-12-31	AV.13A,ESQUINA CALLE 84.NO.83-79,SECTOR BELLOSO			\N		\N		\N		\N	\N	\N	\N
545	1	1	327	1	\N	SUMINISTROS,SERVICIOS E INGENIERIA DAVILA, C.A.	SUSIDCA	J-30013851-8	19990304000018	2009-01-01	2009-12-31	CARRETERA H SECT. TIA JUANA.			\N		\N		\N		\N	\N	\N	\N
556	1	1	327	1	\N	CONTRUING, C.A.		J-30355488-1	19990305000055	2009-01-01	2009-12-31	CALLE 89D NO.89D-52 CIRCUVALACION NO.1 FRENTE A DELICIAS			\N		\N		\N		\N	\N	\N	\N
563	1	1	327	1	\N	LINNCA,C.A.		J-07032145-8	20001221000004	2009-01-01	2009-12-31	AV.15 EDIF. LAS PALMERAS 2DO.PISO OFICINA 2-6			\N		\N		\N		\N	\N	\N	\N
568	1	1	327	1	\N	MEDICIONES Y MANTENIMIENTOS, C.A.	M.Y.M.C.A.	J-30412103-2	20010110000000	2009-01-01	2009-12-31	URB. LA ROTARIA AV. 111 NO.84-167			\N		\N		\N		\N	\N	\N	\N
569	1	1	327	1	\N	PROYECTOS Y OBRAS CIVILES C.A.	PROCICA	J-30716278-8	20001214000004	2009-01-01	2009-12-31	SECTOR LA PRINGAMOSA DIAGONAL A ENELVEN			\N		\N		\N		\N	\N	\N	\N
573	1	1	327	1	\N	HEITKAMP CONSTRUCCIONES DE VENEZUELA,S.A.	HEICOVEN,S.A.	J-00213735-5	20010207000003	2009-01-01	2009-12-31	CALLE LOS HUERTOS QTA.ELENA ENTRE CALLE EL MIRADOR-MOLINO			\N		\N		\N		\N	\N	\N	\N
576	1	1	327	1	\N	CONSTRUCTORA NACIONAL,C.A.	CONAL,C.A.	J-30456481-3	20010212000000	2009-01-01	2009-12-31	AV.4 BELLA VISTA CON CALLE 83 EDIF. CARACAS PISO 1			\N		\N		\N		\N	\N	\N	\N
580	1	1	327	1	\N	COSTA SUR INGENIERIA,C.A.	COSTASURCA	J-30757143-8	20010208000000	2009-01-01	2009-12-31	CARRETERA A PERIJA KM.6.5 N0. 163-55 EL SILENCIO			\N		\N		\N		\N	\N	\N	\N
581	1	1	327	1	\N	CONSTRUCCIONES E INGENIERIA,C.A.	CEINCA	J-30770845-0	20010313000001	2009-01-01	2009-12-31	AV.BOLIVAR S/N PUEBLO NUEVO EL CHIVO SANTA BARBARA			\N		\N		\N		\N	\N	\N	\N
582	1	1	327	1	\N	CORPORACION HABITAT 2000,C.A.		J-30770846-8	20010308000000	2009-01-01	2009-12-31	AV.3E ESQ.CALLE 79 N0.3E-11			\N		\N		\N		\N	\N	\N	\N
583	1	1	327	1	\N	GRUPO DMO,C.A.		J-30723744-9	20010207000001	2009-01-01	2009-12-31	AV.3D N0. 65-A-13 SECTOR DON BOSCO PAROQUIA O.VILLALOBOS			\N		\N		\N		\N	\N	\N	\N
584	1	1	327	1	\N	SERVICIOS Y MANTENIMINETO GASIFEROS DE VENEZUELA,C.A.	GASVENCA	J-30735454-2	20010125000003	2009-01-01	2009-12-31	CALLE 70 URB. LOS OLIVOS CASA N0. 66-124			\N		\N		\N		\N	\N	\N	\N
585	1	1	327	1	\N	INVERSIONES MESI,C.A.	INMESICA	J-30770879-4	20010321000000	2009-01-01	2009-12-31	CALLE 70 CON AV.12 TIERRA NEGRA NO.69A-75			\N		\N		\N		\N	\N	\N	\N
587	1	1	327	1	\N	CONSTRUCCIONES J.J.,C.A.	J.J.,C.A.	J-30768673-1	20010404000002	2009-01-01	2009-12-31	B.SIMON BOLIVAR C.3 CASA S/N AL LADO DE ASERRADERO MAZZOCA			\N		\N		\N		\N	\N	\N	\N
588	1	1	327	1	\N	PRECISION EN EJECUTORIA DE INGENIERIA,C.A.	PRECINCA	J-00071614-5	20010404000003	2009-01-01	2009-12-31	CARRETERA LARA ZULIA DISTRIBUIDOR PUNTA IGUANA			\N		\N		\N		\N	\N	\N	\N
589	1	1	327	1	\N	RIOS LATOZEFSKY,C.A.	RILACA	J-30709254-8	20010406000001	2009-01-01	2009-12-31	LA MARINA SECTOR 8 CALLE 03 N0.58			\N		\N		\N		\N	\N	\N	\N
590	1	1	327	1	\N	INSTALACIONES, MECANICAS ELECTRICAS Y REFRIGERACION, C.A.	IMARECA	J-30645196-0	19991026000006	2009-01-01	2009-12-31	B/PUERTO RICO CALLE 61C #.29C-219			\N		\N		\N		\N	\N	\N	\N
592	1	1	327	1	\N	INVERSIONES PIEDRA BLANCA,C.A.	INPIBCA	J-30437220-5	20010221000000	2009-01-01	2009-12-31	AV.4 BELLA VISTA BENTRE CALLE 61 Y 62 SEC.LAS MERCEDES			\N		\N		\N		\N	\N	\N	\N
593	1	1	327	1	\N	CONSTRUCCIONES DOUSOT,C.A.	DOSOCA	J-30740544-9	20010219000003	2009-01-01	2009-12-31	URB.COROMOTO CALLE 167 N0. 42-113			\N		\N		\N		\N	\N	\N	\N
594	1	1	327	1	\N	PEROZO BRACHO,C.A.	PEBRA,C.A.	J-30778608-6	20010423000000	2009-01-01	2009-12-31	AV.20 ENTRE CALLES 67 Y 68 EDIF.RIO BRAVO APTO.8			\N		\N		\N		\N	\N	\N	\N
595	1	1	327	1	\N	CONSTRUCCIONES INGENIERIA Y MANTENIMIENTO ANDRADE,C.A.	CINGMA,C.A.	J-30484726-2	20010426000005	2009-01-01	2009-12-31	RESD.LAS VISTAS EDIF.VISTA BELLA PISO 3 AV 16			\N		\N		\N		\N	\N	\N	\N
598	1	1	327	1	\N	CONSTRUCTORA SIMA,C.A.	SIMACA	J-30777061-9	20010507000000	2009-01-01	2009-12-31	CALLE 3 VEREDA 36 SEGUNDA VEREDA N0.11 URB. URDANETA			\N		\N		\N		\N	\N	\N	\N
599	1	1	327	1	\N	TORNILLERIA Y MATERIALES PETROLEROS,C.A.	TMP,C.A.	J-30312025-3	20010426000002	2009-01-01	2009-12-31	CALLE 59 CON EQUI. A.V.3F-18			\N		\N		\N		\N	\N	\N	\N
601	1	1	327	1	\N	INVERSORA ARDI		V-05497506-2	20010315000000	2009-01-01	2009-12-31	SECTOR LOS POSITOS CAJA SECA			\N		\N		\N		\N	\N	\N	\N
602	1	1	327	1	\N	SERVICIOS HEDEL,C.A.		J-30690410-7	20010319000000	2009-01-01	2009-12-31	AV.6 CALLE 55 URB.ZAPARA BLOQUE 1			\N		\N		\N		\N	\N	\N	\N
603	1	1	327	1	\N	OBRAS DIVERSAS,C.A.	ODICA	J-07049324-0	20010319000002	2009-01-01	2009-12-31	CALLE 72 CON AV. 3Y EDIF.LOS ROQUES OFICINA 2 Y 3			\N		\N		\N		\N	\N	\N	\N
604	1	1	327	1	\N	PROYECTOS,CONSTRUCCIONES Y SERVICIOS DEL VALLE,C.A.	P.C.S.V.	J-30743383-3	20010316000001	2009-01-01	2009-12-31	CARRETERA PANAMERICANA, CAJA SECA			\N		\N		\N		\N	\N	\N	\N
605	1	1	327	1	\N	SISTEMAS DE INGENIERIA Y MANTENIMIENTO,C.A.	SINGEMA	J-30775839-2	20010511000000	2009-01-01	2009-12-31	AV.20 CON CALLE 67 N0. 67-8 INDIO MARA			\N		\N		\N		\N	\N	\N	\N
606	1	1	327	1	\N	PROYECTO NACIONAL,C.A.	PRONACA	J-30772498-6	20010322000000	2009-01-01	2009-12-31	CALLE 28			\N		\N		\N		\N	\N	\N	\N
607	1	1	327	1	\N	CONSTRUCCION,SUMINISTRO,INGENIERIA Y MANTENIMIENTO,C.A.	CONSUINMA,C.A.	J-30697279-0	20010326000000	2009-01-01	2009-12-31	AV.BELLA VISTA CON CALLE 67 C.C. SOCUY LOCAL 28			\N		\N		\N		\N	\N	\N	\N
608	1	1	327	1	\N	INVERSIONES J & F,C.A.		J-30682016-7	20010322000001	2009-01-01	2009-12-31	AV.13B N0. 50-42 LA PARAGUA			\N		\N		\N		\N	\N	\N	\N
610	1	1	327	1	\N	VENEZUELAN ENGINEERING SUPPLY CONSTRUCTION,C.A.	VENESC, C.A	J-30726564-7	20010329000000	2009-01-01	2009-12-31	CALLE 52 ENTRE 11D Y 12 C.C. CARIDAD DEL COBRE			\N		\N		\N		\N	\N	\N	\N
611	1	1	327	1	\N	GEVENMED,S.A.		J-00221404-0	20010330000003	2009-01-01	2009-12-31	CALLE PASCUALE GIORGIO CON AV.DIEGO CISNERO LOS RUICES P.4			\N		\N		\N		\N	\N	\N	\N
612	1	1	327	1	\N	CONSTRUCCIONES OKINAWA,C.A.		J-30765719-7	20010403000002	2009-01-01	2009-12-31	VIA PALITO BLANCO HACIA EL KM.18 CARRETERA A PERIJA			\N		\N		\N		\N	\N	\N	\N
613	1	1	327	1	\N	CONSTRUCCIONES LA CONCHA,S.A.	C.LA C.,S.A.	J-30731071-5	20010405000003	2009-01-01	2009-12-31	AV.12 ENTRE CALLE 78 Y 79 EDIF.TORRE 12 OFICINA 8D			\N		\N		\N		\N	\N	\N	\N
614	1	1	327	1	\N	INVERSIONES BERMUDEZ RIOS,C.A.	INBERIOS,C.A.	J-30777660-9	20010402000001	2009-01-01	2009-12-31	CALLE 61 SECTOR LAS TARABAS N0. 12-60			\N		\N		\N		\N	\N	\N	\N
615	1	1	327	1	\N	B.I.C.OCCIDENTAL DE CONSTRUCCIONES, C.A.	BICOC,C.A.	J-30245207-4	20010406000004	2009-01-01	2009-12-31	CONJ.RESID.LA PARAGUA EDIF.CUCHIVERO III 1 PISO APTO.1C			\N		\N		\N		\N	\N	\N	\N
616	1	1	327	1	\N	CONSTRUCTORA RONSAN		V-09330462-0	20010405000002	2009-01-01	2009-12-31	AV.49A CALLE 167 N0. 1-61 BA. DALIA DE FERNANDEZ			\N		\N		\N		\N	\N	\N	\N
617	1	1	327	1	\N	CONSTRUCCIONES GOVEA VARGAS,C.A.	GOVAR,C.A.	J-30739161-8	20001228000000	2009-01-01	2009-12-31	CALLE 1A BARRIO MAIQUETIA STA.BARBARA NO.68-92			\N		\N		\N		\N	\N	\N	\N
618	1	1	327	1	\N	ASESORIA,CONSTRUCCIONES Y SUMINISTROS ELECTRICOS,C.A.	ACSE,C.A.	J-30685303-0	20010402000002	2009-01-01	2009-12-31	LOS ESTANQUES CALLE 115 N0. 54-45			\N		\N		\N		\N	\N	\N	\N
619	1	1	327	1	\N	TURBO SERVICIOS,C.A.		J-30604833-2	20010411000001	2009-01-01	2009-12-31	AV.INTERCOMUNAL SECTOR LA VACA KLEES,TIA JAUNA			\N		\N		\N		\N	\N	\N	\N
622	1	1	327	1	\N	DISEÃ‘OS TECNICOS Y SUPERVISION BENNY,C.A.	DISBENCA	J-30719460-0	20010420000000	2009-01-01	2009-12-31	AV.62A N0. 98A-84 URB.SAN RAFAEL			\N		\N		\N		\N	\N	\N	\N
623	1	1	327	1	\N	SUPLIDORA INDUSTRIAL REPRESENTACIONES,C.A.	SIR,C.A.	J-07026650-3	20010426000000	2009-01-01	2009-12-31	CALLE PIAR A 100 MTS. CARRETARA L CIUDAD OJEDA			\N		\N		\N		\N	\N	\N	\N
624	1	1	327	1	\N	INVERSIONES,ASESORIAS Y SERVICIOS,C.A,	INSOVICA	J-30790616-2	20010625000002	2009-01-01	2009-12-31	AV.17A CALLE 108B N0.108B-81 SECTOR HATICOS			\N		\N		\N		\N	\N	\N	\N
625	1	1	327	1	\N	CONSTRUCTORA Y SERVICIOS LAGO NORTE,C.A.	CONSERLAGO,C.A.	J-30779727-4	20010430000000	2009-01-01	2009-12-31	VIA LA TUBERIA SECTOR LA MOCHA HACIENDA SAN JUAN LOS PUERTO			\N		\N		\N		\N	\N	\N	\N
628	1	1	327	1	\N	SERVICIOS Y CONSTRUCCIONES VENEZOLANAS,C.A.	SERCOVENCA	J-30455411-7	20010702000000	2009-01-01	2009-12-31	CALLE 106 N0. 18-91 URB. VILLA HERMOSA			\N		\N		\N		\N	\N	\N	\N
629	1	1	327	1	\N	ACROPOLIS,CONSTRUCCIONES Y SERVICIOS,C.A.	ACROPOLIS,C.A	J-30772909-0	20010517000000	2009-01-01	2009-12-31	CALLE 41 SECTOR DELICIAS C.C. VIENTO NORTE PISO 1 LOCAL 4			\N		\N		\N		\N	\N	\N	\N
630	1	1	327	1	\N	CONSTRUCCIONES O Y V,C.A.	CONOYVCA	J-30768037-7	20010516000001	2009-01-01	2009-12-31	URB.CANTA CLARO CASA N0.50-125			\N		\N		\N		\N	\N	\N	\N
631	1	1	327	1	\N	CONSTRUCCIONES BROMBIN,C.A.		J-30589619-4	20010713000000	2009-01-01	2009-12-31	URB.FUNDACOLON CASA N0. 3-27			\N		\N		\N		\N	\N	\N	\N
632	1	1	327	1	\N	CONSTRUCCIONES RAIMAR,C.A.	CONSTRUCCIONES RM,C.A.	J-30879420-4	20010606000000	2009-01-01	2009-12-31	BARRIO LIBERTAD,CALLE PRINCIPAL# 06			\N		\N		\N		\N	\N	\N	\N
633	1	1	327	1	\N	CONSTRUCCIONES Y SERVICIOS DIAZ & HERRERA,C.A.	CONSERDIHE,C.A.	J-30410907-5	20010525000000	2009-01-01	2009-12-31	CALLE 100 SABANETA CON AV. 20B N0.20B-06			\N		\N		\N		\N	\N	\N	\N
635	1	1	327	1	\N	INVERSORA FLOWERS,C.A.	INVERFLOWERS,C.A.	J-30823556-3	20010717000000	2009-01-01	2009-12-31	URB.EL GUAYABAL CALLE 98 CASA N0. 45-50			\N		\N		\N		\N	\N	\N	\N
636	1	1	327	1	\N	INVERSIONES Y PROYECTOS REYMONT,C.A.		J-30753874-0	20010627000001	2009-01-01	2009-12-31	AV.4 BELLA VISTA C.CALLE 85(FALCON)QTA.CASA DE MADERA			\N		\N		\N		\N	\N	\N	\N
637	1	1	327	1	\N	CONSTRUCCIONES Y SUMINISTROS VALBUENA,C.A.	CONSUVAL,C.A.	J-30789178-5	20010529000000	2009-01-01	2009-12-31	AV.17 SECTOR EL POTENTE EDIF.SAN MIGUEL P.B. LOCAL 6			\N		\N		\N		\N	\N	\N	\N
638	1	1	327	1	\N	PROYECTOS MECANICOS INTEGRALES,C.A.	PROMEINCA	J-30743539-9	20010606000005	2009-01-01	2009-12-31	URB.LA ROSA CALLE E-7 N0.17			\N		\N		\N		\N	\N	\N	\N
640	1	1	327	1	\N	C Y M CONSTRUCCIONES Y MANTENIMIENTOS,C.A.	CYMYCA	J-30586778-0	20010612000001	2009-01-01	2009-12-31	CALLE 24 C.C. CUNSOLO FINOLL LOCAL P.A. 2 EL MOJAN			\N		\N		\N		\N	\N	\N	\N
641	1	1	327	1	\N	PROYECTOS Y CONSTRUCCIONES ELI,	PROCONELICA	J-30739211-8	20010808000001	2009-01-01	2009-12-31	AV.3C.C.1 SAN CARLOS DEL ZULIA C.C.LIMA P/1			\N		\N		\N		\N	\N	\N	\N
644	1	1	327	1	\N	INVERSIONES,DUCTOS Y CONSTRUCCIONES,C.A.	DUCONSCA	J-30777345-6	20010614000001	2009-01-01	2009-12-31	CALLE 60B N0.15E-04 FTE.AL ABASTO BUENOS AIRES B/ZIRUMA			\N		\N		\N		\N	\N	\N	\N
645	1	1	327	1	\N	CONSTRUCTORA LA ESTANCIA,C.A.	CONLESCA	J-30801834-1	20010620000002	2009-01-01	2009-12-31	CASCO CENTRAL CALLE 95 CASA N0. 3-68			\N		\N		\N		\N	\N	\N	\N
647	1	1	327	1	\N	CONSTRUCCIONES EXCEL,S.A.	EXCELSA	J-30068306-0	20010329000001	2009-01-01	2009-12-31	AV.3Y SAN MARTIN C.C. LOS PERINEOS LOCAL 08			\N		\N		\N		\N	\N	\N	\N
649	1	1	327	1	\N	RAEL INMUEBLES,C.A.	RAELCA	J-30114384-1	20010710000000	2009-01-01	2009-12-31	C.100 SABANETA C.C.EL VARILLAL LOCAL 47C			\N		\N		\N		\N	\N	\N	\N
652	1	1	327	1	\N	INGENIERIA,MANTENIMIENTO Y CONSTRUCCIONES DE OCCIDENTE,C.A.	IMACON,C.A.	J-30789358-3	20010627000003	2009-01-01	2009-12-31	CALLE 95 SECTOR CASCO CENTRAL CASA N0.3-68			\N		\N		\N		\N	\N	\N	\N
654	1	1	327	1	\N	CONSTRUCCIONES E INVERSIONES VER-PER.C.A.	VERPERCA	J-30789065-7	20010627000002	2009-01-01	2009-12-31	CALLE 85 BARRIO VALLE FRIO CASA N0.3E-94			\N		\N		\N		\N	\N	\N	\N
655	1	1	327	1	\N	SOTO Y MARTINEZ, C.A.	SOTO MAR,C.A.	J-30809771-3	20010803000000	2009-01-01	2009-12-31	C.C.EL CASTAÃ‘O L.09 Y 10 PLANTA ALTA AV.8 STA.RITA C/C 66-A			\N		\N		\N		\N	\N	\N	\N
656	1	1	327	1	\N	ACOUSTIC BUSINESS SERVICE,C.A.	ACBS	J-30712689-2	20010706000000	2009-01-01	2009-12-31	CALLE PIAR CON AV.MIRANDA N0. 144 CIUDAD OJEDA			\N		\N		\N		\N	\N	\N	\N
657	1	1	327	1	\N	KAIN C.A.		J-30048613-3	20010406000007	2009-01-01	2009-12-31	C.C. NIVALDO  CALLE 66 SECTOR INDIO MARA LOCAL 4			\N		\N		\N		\N	\N	\N	\N
660	1	1	327	1	\N	VIPALKA,PROYECTOS Y CONSTRUCCIONES,C.A.	VIPALKA,C.A.	J-30801957-7	20010712000000	2009-01-01	2009-12-31	AV.10 C.CALLE URB.MONTE BELLO RESID.LAS AVES PISO 9 APTO 9H			\N		\N		\N		\N	\N	\N	\N
661	1	1	327	1	\N	CONSTRUCTORES ELECTRICOS INDUSTRIALES C.A.	CEICA	J-07014329-0	20010709000001	2009-01-01	2009-12-31	CARRETERA LA PLATA ESQ.CARRETERA WILLIAMS SECT.PUNTA GORDA			\N		\N		\N		\N	\N	\N	\N
665	1	1	327	1	\N	ARQDECO, C.A.		J-30005082-3	19990324000073	2009-01-01	2009-12-31	RES.VALLE CLARO EDIF. DON JUAQUIN APTO 6B			\N		\N		\N		\N	\N	\N	\N
666	1	1	327	1	\N	INGENIERIA DE MANTENIMIENTO Y CONSTRUCCIONES,C.A.	IMC,C.A.	J-30767959-0	20010807000000	2009-01-01	2009-12-31	AV.70B N0.79F-75			\N		\N		\N		\N	\N	\N	\N
667	1	1	327	1	\N	ARQ.JEANNETTE GANSER LYNCH		V-04523623-0	20010509000000	2009-01-01	2009-12-31	AV.12 N0.74-09 QTA. LOS MONJES			\N		\N		\N		\N	\N	\N	\N
668	1	1	327	1	\N	INGENIERIA,CONSTRUCCION,MANTENIMIENTO Y SERVICIO,C.A.	INGENIERIA, C.M.S.,C.A	J-30839154-9	20010925000001	2009-01-01	2009-12-31	AV.9B CALLE 70 SECTOR TIERRA NEGRA N0. 9B-90			\N		\N		\N		\N	\N	\N	\N
669	1	1	327	1	\N	INVERSIONES Y CONSTRUCCIONES RADA,C.A.	RADACA	J-30820613-0	20011004000000	2009-01-01	2009-12-31	MONTE BELLO AV.10 C.CALLE N EDIF.LAS AVES 2D0.PISO APTO.2H			\N		\N		\N		\N	\N	\N	\N
670	1	1	327	1	\N	INVERSIONES VERA TRIGGIANO C.A.	INVERTRICA	J-30775416-8	20010809000002	2009-01-01	2009-12-31	AV.12C/CALLE 52Â´C.C.CARIDAD DEL COBRE,URB.CANTA CLARO.			\N		\N		\N		\N	\N	\N	\N
671	1	1	327	1	\N	CONSTRUCTORA SANBE,C.A.		J-30769257-0	20010810000000	2009-01-01	2009-12-31	AV.4 SECTOR CASCO CENTRAL CASA N0.94-55			\N		\N		\N		\N	\N	\N	\N
673	1	1	327	1	\N	DISEÃ‘O SERVICIOS Y MANTENIMIENTO ESPECIALIZADOS,C.A.	DISERMECA,C.A.	J-30641938-1	20010911000002	2009-01-01	2009-12-31	BA. LOS ANDES, SECTOR POMONA,CALLE 111 NO.19-30			\N		\N		\N		\N	\N	\N	\N
674	1	1	327	1	\N	INVERSIONES Y CONSTRUCCIONES DI DAVIDE,C.A.	INCODICA	J-30806140-9	20010816000000	2009-01-01	2009-12-31	CALLE 116 BARRIO 23 DE ENERO CASA N0.19B-87			\N		\N		\N		\N	\N	\N	\N
676	1	1	327	1	\N	CONSTRUCCIONES, ESTUDIOS Y PROYECTOS DE INGENIERIA, C.A.	CEPROCA	J-07027406-9	19990421000058	2009-01-01	2009-12-31	CALLE 77 EDIF.TORRE 77 2DO.PISO			\N		\N		\N		\N	\N	\N	\N
677	1	1	327	1	\N	CONSTRUCCIONES CONZUVEN,COMPAÃ‘IA ANONIMA	CONZUVEN,C.A.	J-30832091-9	20010911000000	2009-01-01	2009-12-31	SECTOR EL CEMENTERIO,C.PADRE LANDAETA,QTA.SISMELY S/N.			\N		\N		\N		\N	\N	\N	\N
678	1	1	327	1	\N	HEVERSON,C.A.		J-30387205-0	20011022000000	2009-01-01	2009-12-31	CAMPO ALEGRIA SEG.CALLE # 26  MENE GRANDE			\N		\N		\N		\N	\N	\N	\N
682	1	1	327	1	\N	SOL Y AGUA INVERSIONES,C.A.	SOL Y AGUA,C.A.	J-30844004-3	20011102000000	2009-01-01	2009-12-31	AV.SABANETA URB.URDANETA BLOQUE 1 APTO.A-1			\N		\N		\N		\N	\N	\N	\N
686	1	1	327	1	\N	INGENIEROS CONSULTORES C.A.	I.C.C.A.	J-30471250-2	20001226000000	2009-01-01	2009-12-31	AV.DELICIAS C.C.PUENTE CRISTAL 1 PISO OFIC.84			\N		\N		\N		\N	\N	\N	\N
687	1	1	327	1	\N	KEMER INGENIERIA, C.A.	KEMERCA	J-30582294-8	19990324000086	2009-01-01	2009-12-31	SECTOR CASCO CENTRAL CALLE 95 NO.3-68 LOCAL NO.01			\N		\N		\N		\N	\N	\N	\N
688	1	1	327	1	\N	AIRES Y PROYECTOS,C.A.	AIPROCA	J-30859484-9	20011031000001	2009-01-01	2009-12-31	URB.RAUL LEONI II ETAPA BLOQUE 6 EDIF.2 APTO.00-01			\N		\N		\N		\N	\N	\N	\N
689	1	1	327	1	\N	DISEÃ‘OS,PROYECTOS E INVERSIONES MARAF,C.A.		J-30742903-8	20010928000000	2009-01-01	2009-12-31	AV.08 CON CALLE 95 SECTOR CASCO CENTRAL C.C.STA.BARBARA L.22			\N		\N		\N		\N	\N	\N	\N
690	1	1	327	1	\N	CORPORACION VENEZOLANA DE SERVICIOS DAVILA,C.A.	CODAVEN,C.A.	J-30842194-4	20010926000000	2009-01-01	2009-12-31	SHOWROOM AV. 15 MALL DELICIAS PLAZA,LOCAL 129 PLANTA ALTA			\N		\N		\N		\N	\N	\N	\N
691	1	1	327	1	\N	MAGNA, COMPAÃ‘IA ANONIMA		J-07036961-2	20001205000000	2009-01-01	2009-12-31	C.C.CARIDAD DEL COBRE AV.12 C/C 52 2DO.NIVEL			\N		\N		\N		\N	\N	\N	\N
693	1	1	327	1	\N	CONSTRUCCIONES Y ASESORIAS VENEZOLANAS,C.A.	CAVENCA	J-30749935-4	20011002000001	2009-01-01	2009-12-31	CALLE 64 N0.8-33 SECTOR SANTA RITA			\N		\N		\N		\N	\N	\N	\N
694	1	1	327	1	\N	CONSTRUCTORA LOAIZA-VILCHEZ,C.A.	CLOVILCA	J-30757854-8	20011022000004	2009-01-01	2009-12-31	SECTOR VIRGEN DEL CARMEN CARRETERA EL CANO CASA S/N			\N		\N		\N		\N	\N	\N	\N
695	1	1	327	1	\N	CONSTRUCCIONES JIMENEZ CAMACHO, C.A.	CONSTRUCCIONES JIMECA	J-07027243-0	19990310000007	2009-01-01	2009-12-31	AV.15 DELICIAS CON CALLE 89B.EDIF.CENTRO EMPRESARIAL PISO 2			\N		\N		\N		\N	\N	\N	\N
696	1	1	327	1	\N	CONSTRUCCIONES,MANTENIMIENTO Y SERVICIOS TABORDA,C.A.	COMSERTA	J-30345775-4	20011011000001	2009-01-01	2009-12-31	URB.MONTE CLARO SECTOR M N0.M9			\N		\N		\N		\N	\N	\N	\N
698	1	1	327	1	\N	CONSTRUCCIONES EL MILAGRO,C.A.		J-30775730-2	20011026000001	2009-01-01	2009-12-31	AV.9B ENTE CALLE 66 Y 66A			\N		\N		\N		\N	\N	\N	\N
699	1	1	327	1	\N	REPRESENTACIONES Y SERVICIOS MEDINA,C.A.	RESERMECA	J-30233939-1	20011126000000	2009-01-01	2009-12-31	CARRETERA J BARRIO SAN JOSE N0. 23A  CIUDAD OJEDA			\N		\N		\N		\N	\N	\N	\N
704	1	1	327	1	\N	VERZAM,C.A.	VERZACA	J-30622068-2	20010213000000	2009-01-01	2009-12-31	URB.EL ROSAL SUR CALLE 40 N0. 13-40			\N		\N		\N		\N	\N	\N	\N
706	1	1	327	1	\N	PROYECTOS CONSTRUCCIONES Y SERVICIOS YANCEN,C.A.	PROCONSER,C.A.	J-30674883-0	20010220000001	2009-01-01	2009-12-31	CALLE 88 SECTOR VERITA N0. 10-29			\N		\N		\N		\N	\N	\N	\N
708	1	1	327	1	\N	CONSTRUCCIONES 448,C.A.		J-30736162-0	20011120000001	2009-01-01	2009-12-31	AV.24 SECTOR PARAISO CASA N0. 65-30			\N		\N		\N		\N	\N	\N	\N
710	1	1	327	1	\N	CONSTRUCCIONES CAMPISI,C.A.		J-07034132-7	20010302000001	2009-01-01	2009-12-31	CALLE 100 SABANETA RESD.PAUL 1 LOCALES 5 Y 6			\N		\N		\N		\N	\N	\N	\N
711	1	1	327	1	\N	VILLA MORA, C.A.		J-30713074-1	20010302000002	2009-01-01	2009-12-31	CALLE 100 SABANETA EDIF. LA VEGA 1D APART.3-2			\N		\N		\N		\N	\N	\N	\N
642	1	1	327	1	\N	INVERSIONES SHANGAY,C.A.		J-30785633-5	20010612000000	2009-01-01	2009-12-31	AV.13 CON CALLE 45  N0.45-41			\N		\N		\N		\N	\N	\N	\N
713	1	1	327	1	\N	ELECTRIC Y CONSTRUCCIONES BARBOZA ALBORNOZ,C.A.		J-30606327-7	20010307000000	2009-01-01	2009-12-31	AV.8 CASA 14 SECT.STO.DOMINGO STA.BARBARA DEL ZULIA			\N		\N		\N		\N	\N	\N	\N
714	1	1	327	1	\N	CONSTRUCCIONES L.V.,C.A.		J-3073366-4	20011108000000	2009-01-01	2009-12-31	AV.19 ENTRE CALLES 3 Y 2 N0.3-91 SIERRA MAESTRA			\N		\N		\N		\N	\N	\N	\N
715	1	1	327	1	\N	DIRECCION ADMINISTRATIVA COMERCIAL Y CONSTRUCCIONES,S.A.	DACCSA	J-07023694-9	20010319000001	2009-01-01	2009-12-31	CALLE 77 AV.3Y SAN MARTIN C.C. COSENZA IER.PISO OFIC.5			\N		\N		\N		\N	\N	\N	\N
716	1	1	327	1	\N	JOSELINCA,C.A.	JOSELINCA,C.A.	J-30866397-2	20011206000000	2009-01-01	2009-12-31	CALLE 83A SECTOR SANTA MARIA N0. 69-68			\N		\N		\N		\N	\N	\N	\N
717	1	1	327	1	\N	INVERSIONES Y CONSTRUCCIONES DIEGO,C.A.	INCODICA	J-30832993-2	20011206000001	2009-01-01	2009-12-31	CALLE 13 EDIF.EL PIONIO PISO 2 OFIC.03 ESTADO.PORTUGUESA			\N		\N		\N		\N	\N	\N	\N
719	1	1	327	1	\N	A & Z CONSTRUCCIONES,C.A.	A & Z, C.A.	J-30590342-5	20010309000002	2009-01-01	2009-12-31	AV. BELLA VISTA CALLE 82B N0. 3G-35			\N		\N		\N		\N	\N	\N	\N
720	1	1	327	1	\N	PROYECTOS INDUSTRIALES E INVERSIONES, S.A.	PROINSA	J-07026623-6	19990310000084	2009-01-01	2009-12-31	CALLE 72 NO.3C,EDIF.PALMA REAL APTO.10-A,			\N		\N		\N		\N	\N	\N	\N
722	1	1	327	1	\N	INTELEC,C.A.		J-07038566-9	20010314000001	2009-01-01	2009-12-31	CALLE 72 CON AV.3H C.C. LAS TINAJITAS LOCAL 7 P.B.			\N		\N		\N		\N	\N	\N	\N
723	1	1	327	1	\N	CONSTRUCTORA YOHEL LEAL,COMPAÃ‘IA ANONIMA	CONYOLECA	J-30581215-2	19990906000001	2009-01-01	2009-12-31	CALLE 99C AV.55 #99A-160P			\N		\N		\N		\N	\N	\N	\N
725	1	1	327	1	\N	CONSTRUCCIONES MARIN  C.A	CONSMARCA	J-30733532-7	20010125000001	2009-01-01	2009-12-31	AV 3Y ENTRE  CALLES 78 Y 79 C.C. SALTO ANGEL NIVEL 2 OFI.3			\N		\N		\N		\N	\N	\N	\N
727	1	1	327	1	\N	INVERSIONES Y CONSTRUCCIONES BALMAZ,C.A.	INCOBALMAZCA	J-30668978-8	20010305000000	2009-01-01	2009-12-31	AV.23 ENTRE CALLES 66 Y 67 RESD.STA.MARIA PISO 7 APTO 7-A			\N		\N		\N		\N	\N	\N	\N
728	1	1	327	1	\N	CONSTRUCCIONES Y SERVICIOS JIBELL,C.A.	JIBELLCA	J-30729136-2	20001214000006	2009-01-01	2009-12-31	AV.16 SECTOR DELICIAS CON CALLE 88 Y 89 NO.88-40			\N		\N		\N		\N	\N	\N	\N
729	1	1	327	1	\N	INVERSIONES E IMPORTACIONES RONALD IMPORT,C.A.		J-30647762-4	20011228000000	2009-01-01	2009-12-31	VIA PANAMERICANA AV.PPAL.AGUA SANTA,VALERA			\N		\N		\N		\N	\N	\N	\N
730	1	1	327	1	\N	DELTRY,C.A.		J-30335514-5	20020102000000	2009-01-01	2009-12-31	RESID.RIO ARRIBA EDIF.12 APTO.51 MERIDA			\N		\N		\N		\N	\N	\N	\N
731	1	1	327	1	\N	MARIN & MARIN CONSTRUCCIONES Y PROYECTOS,C.A.	M.C.P.,C.A.	J-30439828-0	20010326000002	2009-01-01	2009-12-31	CENTRO EMPRESARIAL OLA AV.11 ENTRE CALLE 72 Y 73			\N		\N		\N		\N	\N	\N	\N
732	1	1	327	1	\N	SUMINISTROS,SERVICIOS Y REPRESENTACIONES MULTIPLES,C.A.	SUSREMCA	J-30506231-5	20010614000000	2009-01-01	2009-12-31	AV.12 CALLE 78 Y 79 EDIF.TORRE 12 PH NORTE LOCAL 2			\N		\N		\N		\N	\N	\N	\N
733	1	1	327	1	\N	OBRAS,CONSTRUCCIONES Y SERVICIOS ANGELINI,C.A.	OCONSA,C.A.	J-30669966-0	20010405000004	2009-01-01	2009-12-31	CALLE 75 CON AV. 13A C.C.PRIMAVERA LOCALES 9-10-11			\N		\N		\N		\N	\N	\N	\N
738	1	1	327	1	\N	SERVICIOS Y MANTENIMIENTOS MOAL-CA,C.A.		J-07031962-3	20001205000003	2009-01-01	2009-12-31	CALLE 79 CON AVS. 17 Y 18 NO. 17-89			\N		\N		\N		\N	\N	\N	\N
739	1	1	327	1	\N	ROCOSA CONSTRUCCIONES,S.A.	ROCOSA	J-30659215-6	20010529000003	2009-01-01	2009-12-31	AV.51 N0. 96E-180 SECTOR LOS CLAVELES			\N		\N		\N		\N	\N	\N	\N
740	1	1	327	1	\N	ACCESORIOS MEDICOS,C.A.		J-30563328-2	20010502000000	2009-01-01	2009-12-31	AV.3Y CON CALLE 72 C.C. LAS TINAJITAS P.B.			\N		\N		\N		\N	\N	\N	\N
741	1	1	327	1	\N	SERVICIOS DE CONTABILIDAD E INGENIERIA SERRANO ARENAS C.A.	SERVICONTINSE C.A.	J-07041901-6	20010622000000	2009-01-01	2009-12-31	URB. MONTE BELLO CALLE Ã‘O NO. 11-27 ENTRE AV. 10 Y 11 MCBO.			\N		\N		\N		\N	\N	\N	\N
742	1	1	327	1	\N	CONSTRUCCIONES Y ELECTRIFICACIONES R.H.,C.A.	CONSELEC,R.H.,C.A.	J-30789077-0	20020219000000	2009-01-01	2009-12-31	CALLE 71B N0. 27-100 SECTOR SANTA MARIA			\N		\N		\N		\N	\N	\N	\N
744	1	1	327	1	\N	INGENIERIA MULTIPLE ASOCIADOS,C.A.	IMACA	J-07045394-0	20010831000000	2009-01-01	2009-12-31	CALLE DONALDO GARCIA,DIAG. FERRETERIA LA CONFIANZA.			\N		\N		\N		\N	\N	\N	\N
745	1	1	327	1	\N	GLOBEX,C.A.	GLOBEX,C.A.	J-30727286-4	20001220000000	2009-01-01	2009-12-31	C.C.SALTO ANGEL L.27 AV. 3Y C.CALLE 78 Y 79			\N		\N		\N		\N	\N	\N	\N
746	1	1	327	1	\N	INGENIERIA GARCIA HERNANDEZ, C.A.	INGAHECA	J-30232726-1	19990708000006	2009-01-01	2009-12-31	CALLE 64 AVS.71A Y 72 QTA.VILLA 2 # 71URB. CIUDADELA FARIA			\N		\N		\N		\N	\N	\N	\N
748	1	1	327	1	\N	SELIMAT,C.A.		J-07011860-1	20010528000000	2009-01-01	2009-12-31	AV.9 ENTRE CALLES 77 Y 78 N0. 77-61			\N		\N		\N		\N	\N	\N	\N
751	1	1	327	1	\N	BALANOS BROTHERS SERVICE,S.A.	B.B.S.,S.A.	J-30166296-2	20010613000002	2009-01-01	2009-12-31	AV.42 CARRETERA N Y O SECTOR LOS SAMANES CIUDAD OJEDA			\N		\N		\N		\N	\N	\N	\N
752	1	1	327	1	\N	INVERSIONES Y DESARROLLOS DE INGENIERIA,C.A.	IDINCA	J-30713780-0	20010129000001	2009-01-01	2009-12-31	CALLE 2-A SECTOR SIERRA MAESTRA EDIF.PARAGUALITO			\N		\N		\N		\N	\N	\N	\N
757	1	1	327	1	\N	OBRAS SERVICIOS C.E.N.,C.A.	OCENCA	J-30471589-7	20010131000000	2009-01-01	2009-12-31	CALLE 78B ENTRE 41 Y 42 NO. 58-30			\N		\N		\N		\N	\N	\N	\N
758	1	1	327	1	\N	CONSTRUCCIONES E INVERSIONES VIGER,C.A.	VIGERCA	J-30769665-6	20010228000001	2009-01-01	2009-12-31	SECT.VALLE CLARO CALLE 82A EDIF.MATLDE APTO.1-C			\N		\N		\N		\N	\N	\N	\N
761	1	1	327	1	\N	CONSTRUCCIONES Y TELECOMUNICACIONES C.A.	CONSTELCA	J-30768740-1	20010315000002	2009-01-01	2009-12-31	C.C.PUENTE CRISTAL PB LOCAL 19 CALLE 99 CON AV.14			\N		\N		\N		\N	\N	\N	\N
765	1	1	327	1	\N	CONSTRUCCIONES PRIETO 2021,C.A.		J-30744399-5	20010305000001	2009-01-01	2009-12-31	URB.ROSAL SUR CALLE 41 N0.13-132			\N		\N		\N		\N	\N	\N	\N
766	1	1	327	1	\N	RAYCO,C.A.		J-07029691-7	20010730000000	2009-01-01	2009-12-31	CALLE YARACUY N0.20 DELICIAS NUEVAS			\N		\N		\N		\N	\N	\N	\N
767	1	1	327	1	\N	LUGONZA,C.A.		J-30784022-6	20010409000003	2009-01-01	2009-12-31	CALLE 77 CON AV.MILAGRO			\N		\N		\N		\N	\N	\N	\N
769	1	1	327	1	\N	EDIF. CONST Y VIALIDAD EDICONVIALSA.S.A	EDICONVIALSA.	J-07046125-0	19990319000045	2009-01-01	2009-12-31	CALLE 72 CON AV.25 EDIF.NESUL P.B.			\N		\N		\N		\N	\N	\N	\N
770	1	1	327	1	\N	LAMBDA INGENIERIA,C.A.		J-30773897-9	20010406000005	2009-01-01	2009-12-31	CALLE 62 SECTOR PUEBLO NUEVO CASA N0. 98-01			\N		\N		\N		\N	\N	\N	\N
772	1	1	327	1	\N	CONSTRUCTORA MENDOZA Y FINOL,S.A.	MENFI	J-30626842-1	20010925000004	2009-01-01	2009-12-31	CALLE B URB.LA POMONA EDIF.BLOQUE 19A-36 APTP.1			\N		\N		\N		\N	\N	\N	\N
773	1	1	327	1	\N	DIMARCO INTERNACIONAL COMPAÃ‘IA ANONIMA	DIMINCA	J-07020299-8	20001214000000	2009-01-01	2009-12-31	CALLE 115 NO.56-70 LOS ESTANQUES SECTOR ZONA INDUSTRIAL			\N		\N		\N		\N	\N	\N	\N
775	1	1	327	1	\N	CONSTRUCCIONES BOUTIER,C.A.	BOUTIERCA	J-30667012-6	20010219000001	2009-01-01	2009-12-31	CALLE 95 SECTOR CASCO CENTRAL EDIF. CLINICA CATEDRAL			\N		\N		\N		\N	\N	\N	\N
777	1	1	327	1	\N	CONSTRUCCIONES PETROCA,S.A.	PETROCASA	J-070546026	20010829000000	2009-01-01	2009-12-31	AV.4,CON C.67,C.C.SOCUY,LOCAL 27			\N		\N		\N		\N	\N	\N	\N
778	1	1	327	1	\N	CONSTRUCCIONES HENCARCA		J-30767881-0	20011015000000	2009-01-01	2009-12-31	CALLE 108 BARRIO ALTAMIRA N0. 108-35			\N		\N		\N		\N	\N	\N	\N
780	1	1	327	1	\N	CONSTRUCCIONES OBRAS Y VIALIDAD,C.A.	COVIALCA	J-30767009-6	20010305000002	2009-01-01	2009-12-31	AV.4 SECT.CASCO CENTRAL CASA N0.94-55			\N		\N		\N		\N	\N	\N	\N
781	1	1	327	1	\N	CONSTRUCCIONES CIVILES VENEZOLANAS,C.A.	CONCIVENCA	J-30756586-1	20010518000002	2009-01-01	2009-12-31	AV.EL MILAGRO BARRIO EL RELLENO CASA N0. 76A-73			\N		\N		\N		\N	\N	\N	\N
782	1	1	327	1	\N	INGENIERIA DE CONSTRUCCIONES Y SERVICIOS TECNICOS,C.A.	INCOSERTEC,C.A.	J-30660330-1	20010925000002	2009-01-01	2009-12-31	ENTRADA PPAL.DE CASIGUA EL CUBO-FRENTA A CAUCHERA SAN BENITO			\N		\N		\N		\N	\N	\N	\N
783	1	1	327	1	\N	PERFECCIONES VIALES,C.A.	PEVILCA	J-30595829-7	20010606000002	2009-01-01	2009-12-31	AV. VIA BOBURES URB. LA CONQUISTA CASA # 1-92			\N		\N		\N		\N	\N	\N	\N
784	1	1	327	1	\N	CONSTRUCCIONES GUSSY,C.A.		J-07046350-3	20010327000000	2009-01-01	2009-12-31	URB.LOS OLIVOS CALLE 75 N0-61-31 QTA.LILIA			\N		\N		\N		\N	\N	\N	\N
785	1	1	327	1	\N	PROYECTOS DE INGENIERIA Y MONTAJE,S.A.	PRIMSA	J-30746998-6	20010424000000	2009-01-01	2009-12-31	AV.4 CON CALLE 65 EDIF. SIGMA APTO.4-A			\N		\N		\N		\N	\N	\N	\N
787	1	1	327	1	\N	CONSTRUCCIONES Y PROYECTOS DICASAS,C.A.		J-30352528-8	20010814000001	2009-01-01	2009-12-31	CALLE 79B N0. 108-57			\N		\N		\N		\N	\N	\N	\N
789	1	1	327	1	\N	VENEMAR SUPPLY,C.A.		J-30675085-1	20010615000001	2009-01-01	2009-12-31	AV.3F N0.78-48 EDIF.ALGARROBO LOCAL			\N		\N		\N		\N	\N	\N	\N
790	1	1	327	1	\N	CONSPLACA,C.A.		J-30754197-0	20010627000000	2009-01-01	2009-12-31	CIRCUNV.3 SECTOR EL ROSARIO AV. 98 CARDON N0.1 LOCAL 98-57			\N		\N		\N		\N	\N	\N	\N
791	1	1	327	1	\N	CONSTRUCTORA RICARDO ATENCIO LEON,C.A.	CORALCA	J-30769233-2	20010626000000	2009-01-01	2009-12-31	AV.FUERZAS ARMADAS CONJ.RES.VILLA BONITA TORRE I APTO.PH-B			\N		\N		\N		\N	\N	\N	\N
793	1	1	327	1	\N	MEICA COMPAÃ‘IA ANONIMA	MEICA, C.A.	J-08518924-6	20000925000000	2009-01-01	2009-12-31	CALLE 19 DE CALLE NÃ‘ N0. 11 -70			\N		\N		\N		\N	\N	\N	\N
795	1	1	327	1	\N	BERUR, C.A.	BERURCA	J-07049254-6	19990304000029	2009-01-01	2009-12-31	C.65 C. AV.22A LOCAL NO.2 ALMACENES MILITARES			\N		\N		\N		\N	\N	\N	\N
796	1	1	327	1	\N	SERVICIO DE ASISTENCIA TECNICA AGROPECUARIA	SATAGRO,C.A.	J-305881987	20010816000001	2009-01-01	2009-12-31	URB.PROLONG.LA CONQUISTA N0.196,SECTOR.3			\N		\N		\N		\N	\N	\N	\N
797	1	1	327	1	\N	INVERSIONES CUBILLAN MARTINEZ,C.A.	INCUMACA	J-30464599-6	20011107000000	2009-01-01	2009-12-31	CALLE 93 CON AV.61 Y 62C.C.C.CUMBRES DE MARACAIBO LOCAL 05			\N		\N		\N		\N	\N	\N	\N
799	1	1	327	1	\N	CORPORACION W & A,C.A.		J-30788524-6	20011115000000	2009-01-01	2009-12-31	URB.EL NARANJAL CALLE 51A N0. 15L-22 QTA.KASHY			\N		\N		\N		\N	\N	\N	\N
800	1	1	327	1	\N	CODIESCA 2020,C.A.		J-30738822-6	20010209000001	2009-01-01	2009-12-31	AV.3F ENTRE CALLE 57 Y 58 DETRAS DEL HOSP.PSIQUIATRICO			\N		\N		\N		\N	\N	\N	\N
801	1	1	327	1	\N	SERVICIOS DE INGENIERIA Y MANTENIMIENTO INDUSTRIAL,C.A.	S.I.M.I.,C.A.	J-07035159-4	20011122000000	2009-01-01	2009-12-31	CALLE 70 N0. 12-40			\N		\N		\N		\N	\N	\N	\N
803	1	1	327	1	\N	CONSTRUCTORA D`AFRA,C.A.		J-30780988-4	20010426000004	2009-01-01	2009-12-31	URB.CALIFORNIA CALLE 47 N0. 15A-87			\N		\N		\N		\N	\N	\N	\N
804	1	1	327	1	\N	B.H.M. & ASOCIADOS, C.A.		J-07024639-1	19990716000001	2009-01-01	2009-12-31	AV. 17C ENTRE CALLES 95 Y 96 #. 95C-100 SECTOR EL TRANSITO			\N		\N		\N		\N	\N	\N	\N
805	1	1	327	1	\N	CONSTRUCCIONES Y SERVICIOS EL CUBO,C.A.	C.S. EL CUBO.C.A.	J-30462611-8	20011009000000	2009-01-01	2009-12-31	CALLE 77 SECTOR PANAMERICANO C.C. DOÃ‘A IRENE LOCAL 2			\N		\N		\N		\N	\N	\N	\N
806	1	1	327	1	\N	SERVICIOS TECNICOS INTEGRALES Y MANTENIMIENTO,C.A.	STIM,C.A.	J-30710223-3	20011129000000	2009-01-01	2009-12-31	SECTOR LOS OLIVOS CALLE 67 N0.65-25			\N		\N		\N		\N	\N	\N	\N
807	1	1	327	1	\N	MALFA,C.A.	MALFA,C.A.	J-30804324-9	20011211000000	2009-01-01	2009-12-31	CALLE 23 CON 70 SECTOR INDIO MARA C.C. CENTER LOCAL 8			\N		\N		\N		\N	\N	\N	\N
809	1	1	327	1	\N	RODRIGUEZ LEMUS,C.A.	ROLECA	J-30498272-0	20011023000001	2009-01-01	2009-12-31	CALLE 58 N0.7-95 EDIF.MONTREAL P.B. ZAPARA II			\N		\N		\N		\N	\N	\N	\N
810	1	1	327	1	\N	CONSTRUCTORA OVIALCA,C.A.	OVIALCA,C.A.	J-30785565-7	20010326000001	2009-01-01	2009-12-31	CALLE 88 SECTOR VERITAS CASA N0.10-29			\N		\N		\N		\N	\N	\N	\N
812	1	1	327	1	\N	HC CONSTRUCCIONES Y SERVICIOS,C.A.	CONSTRUCSER,C.A.	J-30716213-9	20010606000004	2009-01-01	2009-12-31	CALLE LA TUBERIA SEC.LOS SAMANES CASA N0. 21-A			\N		\N		\N		\N	\N	\N	\N
813	1	1	327	1	\N	CONSTRUCTORA PINEDO VILLALOBOS,C.A.	COPIVICA	J-30469740-6	20001229000002	2009-01-01	2009-12-31	CALLE 83A SECTOR PARAISO NO. 21-79			\N		\N		\N		\N	\N	\N	\N
814	1	1	327	1	\N	INVERSIONES RODRIGUEZ RAMIREZ,C.A.	RORINCA	J-30282736-1	20011107000001	2009-01-01	2009-12-31	URB.MONTE BELLO CALLES M-N N0. 12-31			\N		\N		\N		\N	\N	\N	\N
816	1	1	327	1	\N	OFICINA TECNICA DE MANTENIMIENTO ZULIA C.A.	O.T.M. ZULIA,C.A.	J-303469108	19990722000000	2009-01-01	2009-12-31	AV.13 #.66A-26 APTO 2B RESIDENCIA DON EDMUNDO			\N		\N		\N		\N	\N	\N	\N
817	1	1	327	1	\N	AC INGENIERIA, C.A.		J-30435512-2	19990322000015	2009-01-01	2009-12-31	AV.28 LA LIMPIA SECTOR LA FUSTA NO.3-9			\N		\N		\N		\N	\N	\N	\N
818	1	1	327	1	\N	ING. DANIEL HOMEZ		J-05064156-9	20001019000001	2009-01-01	2009-12-31	AV.13 SECTOR TIERRA NEGRA NO.66A-21 EDIF.MACBO.AP.9A			\N		\N		\N		\N	\N	\N	\N
820	1	1	327	1	\N	CONSTRUCCIONES Y MANTENIMIENTOS A.I.,C.A.	COYMACA	J-07054737-5	20010406000002	2009-01-01	2009-12-31	AV.5 DE JULIO TORRE CRISTAL 4TO. PISO			\N		\N		\N		\N	\N	\N	\N
821	1	1	327	1	\N	INVERSIONES MENDOZA OVIEDO,C.A.	INVERMOCA	J-30643902-1	20020313000000	2009-01-01	2009-12-31	CALLE 69C URB.SANTA MARIA CASA NO.28A-32			\N		\N		\N		\N	\N	\N	\N
822	1	1	327	1	\N	RINCON Y LINARES,C.A.	R Y L,C.A.	J-30788423-1	20010425000000	2009-01-01	2009-12-31	AV.04 CASCO CENTRAL CASA NO.94-55 LAB,.ISIDRO			\N		\N		\N		\N	\N	\N	\N
824	1	1	327	1	\N	CONSTRUCTORA AMAYA RISCO,C.A.	CONARCA	J-30630637-4	20010129000000	2009-01-01	2009-12-31	CALLE 21 CON CALLE AV. 14 SECTOR SANTA TERESA			\N		\N		\N		\N	\N	\N	\N
825	1	1	327	1	\N	INVERSIONES JAINCA,C.A.	JAINCA	J-30853886-8	20020305000000	2009-01-01	2009-12-31	CALLE 51 VILLA DELICIAS CASA N0. 15G-67 ALCARROAL			\N		\N		\N		\N	\N	\N	\N
828	1	1	327	1	\N	CONSTRUCTORA WILPERCA,C.A.		J-30852394-1	20020319000000	2009-01-01	2009-12-31	CALLE ZULIA FTE.FERRETERIA GAMA,SCTOR CASIGUA EL CUBO			\N		\N		\N		\N	\N	\N	\N
829	1	1	327	1	\N	ASFALTADO,VIALIDAD Y CONSTRUCCIONES J.K.,C.A.	ASVICONCA	J-30756079-7	20020313000002	2009-01-01	2009-12-31	AV.3H ENTRE CALLE 78 Y 79 EDIF.REPUBLICA LOCAL 2			\N		\N		\N		\N	\N	\N	\N
831	1	1	327	1	\N	START-UP & SERVICES,C.A.	START-UP,C.A.	J-30880271-9	20020528000000	2009-01-01	2009-12-31	CALLE 89 CON AVES.18 SECTOR 1 DE MAYO CASA N0. 18-63			\N		\N		\N		\N	\N	\N	\N
833	1	1	327	1	\N	INGENIERIA Y SERVICIOS R & R,C.A.		J-30882456-9	20020416000000	2009-01-01	2009-12-31	CALLE LOS NOVIOS,SECTOR EL BATEY,CASA N. 35			\N		\N		\N		\N	\N	\N	\N
834	1	1	327	1	\N	STRUCTURE, C.A.		J-308828653	20020614000000	2009-01-01	2009-12-31	URB. CANTA CLARO,C.52,AV.11 NO.  52-10.			\N		\N		\N		\N	\N	\N	\N
835	1	1	327	1	\N	VENEZUELAN  NETHERLAND FIELD CONTRACTORS,S.A.	VENEFCO,S.A.	J-070022108	20011001000000	2009-01-01	2009-12-31	CALLE JUNIN ANTIGUA CARRETERA NACIONAL PUNTA GORDA,CABIMAS			\N		\N		\N		\N	\N	\N	\N
836	1	1	327	1	\N	DESARROLLO DE SOLUCIONES TECNICAS,C.A.	DESTACA	J-30749211-2	20010329000003	2009-01-01	2009-12-31	CALLE 101 SABANETA CONJ.RESID.LAS FLORES			\N		\N		\N		\N	\N	\N	\N
837	1	1	327	1	\N	ING. RAFAEL DIONISIO VASQUEZ AVILA		V-00424667-1	20010927000000	2009-01-01	2009-12-31	AV.11 N0. 53-8D URB. CANTA CLARO			\N		\N		\N		\N	\N	\N	\N
838	1	1	327	1	\N	VENEQUIP S.A.		J-304780869	20010410000003	2009-01-01	2009-12-31	ZONA INDUSTRIAL KM. 4 1/2 VIA PERIJA EDIF. VENEQUIP			\N		\N		\N		\N	\N	\N	\N
839	1	1	327	1	\N	CONSTRUCCIONES CIVILES PURDUE,C.A.	PURDUE,C.A	J-30746241-8	20001219000000	2009-01-01	2009-12-31	CALLE 72 CON AV.2D EDIF.AMBASSADOR PISO 19 APART.19			\N		\N		\N		\N	\N	\N	\N
840	1	1	327	1	\N	CONSTRUCTORA NISI Y ASOCIADOS,C.A.		J-30782777-7	20020530000000	2009-01-01	2009-12-31	CIRC.3 AV.98 N0.98-57 SECT.EL ROSARIO CARDON II EDIF.EPIAYU			\N		\N		\N		\N	\N	\N	\N
841	1	1	327	1	\N	TECNO SEGURIDAD,C.A.		J-30890104-0	20020524000000	2009-01-01	2009-12-31	CALLE 72 ENTRE AV.15A Y 16 SECTOR DELICIAS N0.47			\N		\N		\N		\N	\N	\N	\N
842	1	1	327	1	\N	CONSTRUCCIONES,MATERIALES Y PROYECTOS,C.A.	CONMAPROCA	J-30737973-1	20020731000000	2009-01-01	2009-12-31	AV.PPAL. SECTOR DELICIAS NUEVAS,CABIMAS N0.154			\N		\N		\N		\N	\N	\N	\N
844	1	1	327	1	\N	GEOSUELO, C.A.		J-30845394-3	20020814000001	2009-01-01	2009-12-31	URB.EL PINAR.EDIF.PINO MORO I,PB-D LA POMONA			\N		\N		\N		\N	\N	\N	\N
845	1	1	327	1	\N	SUMINISTRO,CONSTRUCCIONES Y MANTENIMIENTO,C.A.	SUCOM,C.A.	J-30934500-1	20020814000000	2009-01-01	2009-12-31	BARRIO LOS OLIVOS, AV. 69 NO. 68A-77			\N		\N		\N		\N	\N	\N	\N
847	1	1	327	1	\N	CONSTRUCCIONES ROMERO ARTEAGA, SOCIEDAD ANONIMA	CORASA	J-30079937-9	19991115000004	2009-01-01	2009-12-31	AV 3Y #69-65			\N		\N		\N		\N	\N	\N	\N
848	1	1	327	1	\N	REMODELACIONES Y MANTENIMIENTO,C.A.	REMANCA	J-30908912-9	20020826000000	2009-01-01	2009-12-31	CALLE 65 ENTRE AV. 4 Y 8,RESIDENCIAS TOVAR PISO 7,APTO.7B			\N		\N		\N		\N	\N	\N	\N
849	1	1	327	1	\N	SERVICIOS DE GEOLOGIA,ELECTRICIDAD Y SUMINISTRO,C.A.	GESCA	J-07047252-9	20010620000000	2009-01-01	2009-12-31	C.C.SIMON BOLIVAR,PLANTA ALTA,LOCAL 8 URB.TAMARE			\N		\N		\N		\N	\N	\N	\N
850	1	1	327	1	\N	PROYECTOS Y CONSTRUCCIONES L & T, C.A.	PROYCO	J-30585492-0	19990324000070	2009-01-01	2009-12-31	AV.BELLA VISTA CON CALLE 67 CECILIO ACOSTA			\N		\N		\N		\N	\N	\N	\N
851	1	1	327	1	\N	ASFALTANDO VENEZUELA, COMPAÃ‘IA ANONIMA.		J-30933784-0	20020827000000	2009-01-01	2009-12-31	AV 8A,ENTRE C.67 Y 67B,SECTOR TIERRA NEGRA,QTA.MARIA ANGELIC			\N		\N		\N		\N	\N	\N	\N
852	1	1	327	1	\N	PREFABRICADOS MARACAIBO,C.A.	PREMAR,C.A.	J-30830588-0	20020702000000	2009-01-01	2009-12-31	AV.PPAL.PALITO BLANCO-TERRENO VACIO			\N		\N		\N		\N	\N	\N	\N
853	1	1	327	1	\N	SERVICIOS TECNICOS AR-VI, COMPAÃ‘IA ANONIMA		J-07023431-8	20020905000000	2009-01-01	2009-12-31	CALLE 67 N. 63-155 LOS OLIVOS			\N		\N		\N		\N	\N	\N	\N
854	1	1	327	1	\N	CONSTRUCCIONES,MANTENIMIENTOS,EQUIPAMIENTOS,COMPAÃ‘IA ANONIMA	CONMECA	J-309309213-4	20020905000001	2009-01-01	2009-12-31	AV.75,N. 71A-217 SECTOR PANAMERICANO			\N		\N		\N		\N	\N	\N	\N
855	1	1	327	1	\N	CONSTRUCCION,MANTENIMIENTO Y SERVICIOS SAN ANTONIO,S.A.	COMSSA	J-30831930-9	20020718000001	2009-01-01	2009-12-31	CARRETERA K ESQ. AV. 41 SECTOR BARRIO PUNTO FIJO			\N		\N		\N		\N	\N	\N	\N
856	1	1	327	1	\N	CONSTRUCTORA SANTA MARIA,C.A.		J-30681285-7	20020722000000	2009-01-01	2009-12-31	CONJ.RESID.EL OLIVAR EDIF. EL OLIVO I APTO.2B CALLE 75			\N		\N		\N		\N	\N	\N	\N
857	1	1	327	1	\N	ARQUITECTURA & INGENIERIA FA,C.A.	ARQINGFA,C.A.	J-30694479-6	20001211000002	2009-01-01	2009-12-31	AV.15 LAS DELICIAS, EDIFICIO GREDO OFICINA 5-A			\N		\N		\N		\N	\N	\N	\N
858	1	1	327	1	\N	TECNICAS DE CONSTRUCCIONES, C.A.		J-30670008-0	20010124000000	2009-01-01	2009-12-31	AV.4C N0.19G-93 ALTOS DE JALISCO			\N		\N		\N		\N	\N	\N	\N
859	1	1	327	1	\N	MARTINEZ Y RODRIGUEZ, C.A.	MAROCA	J-30775767-1	20010309000003	2009-01-01	2009-12-31	CALLE 73 AV.16A N0. 16A-09 SECTOR PARAISO			\N		\N		\N		\N	\N	\N	\N
860	1	1	327	1	\N	GLOBAL EXPRESS, C.A.		J-30677309-6	20020906000000	2009-01-01	2009-12-31	AV. 14, SECTOR MONTE BELLO			\N		\N		\N		\N	\N	\N	\N
861	1	1	327	1	\N	CORPORACION A & C,C.A.		J-30887653-4	20020726000001	2009-01-01	2009-12-31	AV.13A SECTOR CARABOBO URB.TAMARE CASA N0.1 CIUDAD OJEDA			\N		\N		\N		\N	\N	\N	\N
862	1	1	327	1	\N	PROYECTOS INGENIERIA Y SERVICIO L.N., C.A.	PROINSER, C.A.	J-07030638-6	19990310000013	2009-01-01	2009-12-31	CALLE 63 ENTRE AV.8 Y 8B NO.8-73			\N		\N		\N		\N	\N	\N	\N
863	1	1	327	1	\N	CAMARGO C.A.		J-30913382-9	20020930000002	2009-01-01	2009-12-31	AV.BELLA VISTA EDIF.SOCUY MEZZANNINE LOCAL 25			\N		\N		\N		\N	\N	\N	\N
864	1	1	327	1	\N	CONSTRUCCIONES MAKSO,C.A.		J-30921361-0	20020801000000	2009-01-01	2009-12-31	CALLE 77 C.AV.16 Y 17 SECT.5 DE JULIO C.C.SAN LUIS LOCAL 8			\N		\N		\N		\N	\N	\N	\N
866	1	1	327	1	\N	INVERSORA MIZE LAMEDA, C.A.		J-30118531-5	19990304000043	2009-01-01	2009-12-31	AV.8 CON CALLE F NO.F-09 URB. IRAMA			\N		\N		\N		\N	\N	\N	\N
867	1	1	327	1	\N	SISCON CONSTRUCCION, C.A.		J-30924261-0	20020815000000	2009-01-01	2009-12-31	URB. CANAIMA CALLE 43 Â·N.151-32 SECTOR DELICIAS NORTE			\N		\N		\N		\N	\N	\N	\N
868	1	1	327	1	\N	CONSTRUCCIONES CARDOZO VILLASMIL,C.A.	CONSCARVICA	J-30523490-6	20011114000000	2009-01-01	2009-12-31	AV.LIBERTADOR C.C. LA REDOMA LOCALES 17 Y 18 D			\N		\N		\N		\N	\N	\N	\N
871	1	1	327	1	\N	PROYECTOS Y CONSTRUCCIONES EVAMAR, C.A.	EVAMAR, C.A.	J-07047486-6	19990312000064	2009-01-01	2009-12-31	IURB.LA TRINIDAD AV.15E N0.55A-17			\N		\N		\N		\N	\N	\N	\N
872	1	1	327	1	\N	CONSTRUCCIONES SAME,C.A.	SAMECA	J-30926851-1	20020822000000	2009-01-01	2009-12-31	CALLE 88,SECTOR LAS VERITAS CASA NO. 10-09			\N		\N		\N		\N	\N	\N	\N
874	1	1	327	1	\N	CONSTRUCCIONES,SUMINISTRO Y MANTENIMIENTO HEVILCA,C.A.	HEVILCA,C.A.	J-30730623-8	20011112000000	2009-01-01	2009-12-31	URB.VALLE ALTO CALLE 95 CIRCUNV.2 N0.58A-119			\N		\N		\N		\N	\N	\N	\N
876	1	1	327	1	\N	CONSTRUCTORA LEMA,C.A.		J-30842996-1	20020208000000	2009-01-01	2009-12-31	AV.3G # 67-93 SECTOR BELLAS ARTES			\N		\N		\N		\N	\N	\N	\N
877	1	1	327	1	\N	CONTRATISTA DEL		J-16108715-3	20010815000000	2009-01-01	2009-12-31	AV.STA. TERESA NO.42			\N		\N		\N		\N	\N	\N	\N
878	1	1	327	1	\N	CONSTRUCCIONES,INGENIERIA Y MANTENIMIENTO RONALD,C.A.	RONALCA	J-30766090-2	20010905000000	2009-01-01	2009-12-31	AV.LA LIMPIA,NO.13-19.			\N		\N		\N		\N	\N	\N	\N
880	1	1	327	1	\N	CONSTRUCTORA ANSAVEN, C.A.	ANSAVENCA	J-30293841-4	19990324000089	2009-01-01	2009-12-31	AV.PRINCIPAL ESQUINA CALLE VENEZUELA AL LADO  DE LA ASAMBELA L.			\N		\N		\N		\N	\N	\N	\N
881	1	1	327	1	\N	TUNA`S CONSTRUCTIONS & CORPORATIONS,COMPAÃ‘IA ANONIMA		J-30896339-9	20020823000000	2009-01-01	2009-12-31	AV.15 DELICIAS.CON C/72 C.C.PASEO 72.PH-03 OFICINA 3.			\N		\N		\N		\N	\N	\N	\N
882	1	1	327	1	\N	INVERSIONES SIANGA,C.A.	ISCA	J-30509091-2	20020827000001	2009-01-01	2009-12-31	AV.4, CALLE 14 N.4-24 SIERRA MAESTRA			\N		\N		\N		\N	\N	\N	\N
884	1	1	327	1	\N	TUVIO,COMPAÃ‘IA ANONIMA		J-30933754-8	20020905000002	2009-01-01	2009-12-31	AV.  FUERZASA ARMADAS URB. LOMA LINDA, EDIF. 12,APTO 5			\N		\N		\N		\N	\N	\N	\N
885	1	1	327	1	\N	INVERSIONES TIBISAY, C.A.	INVERTICA	J-30292916-4	20010315000003	2009-01-01	2009-12-31	URB.ROSAL SUR CALLE 43 C.AV.10 #13-143			\N		\N		\N		\N	\N	\N	\N
887	1	1	327	1	\N	CONSTRUCCIONES,SERVICIO Y MANTENIMIENTO BORJAS MEDINA,C.A.	BORMECA	J-30775333-1	20010625000000	2009-01-01	2009-12-31	AV.3F C/CALLE 78 EDIF.TORRE DR.PORTILLO OFIC.IA MEZZANINA			\N		\N		\N		\N	\N	\N	\N
888	1	1	327	1	\N	DAUMA C.A.		J-07030536-3	20020829000001	2009-01-01	2009-12-31	AV.22 EDIF. MONTIELCO,NO. 72-19,2PISO.OFICINA 2 E.			\N		\N		\N		\N	\N	\N	\N
889	1	1	327	1	\N	INVERSIONES EL CASTILLO,C.A.		J-30234831-5	20021125000000	2009-01-01	2009-12-31	URB.EL NARANJAL AV.15 N0. 50B-66			\N		\N		\N		\N	\N	\N	\N
890	1	1	327	1	\N	CONSTRUCCIONES 7.50, C.A.		J-30742812-0	20020912000003	2009-01-01	2009-12-31	BARRIO PANAMERICANO, CALLE 71, NO. 43C-54			\N		\N		\N		\N	\N	\N	\N
891	1	1	327	1	\N	CONSELECA C.A.		J-30855292-5	20020902000000	2009-01-01	2009-12-31	AV. 19 DE ABRIL.C.C.EL PARQUE,TORRE A,OFICINA 2 D,SANCRISTOB			\N		\N		\N		\N	\N	\N	\N
892	1	1	327	1	\N	P.I.M. CONSTRUCCIONES, C.A.		J-3091O580-9	20020909000000	2009-01-01	2009-12-31	CALLE 79 G, SECT. AYACUCHO URB. LA FLORIDA CONJ.R.LA FLORIDA			\N		\N		\N		\N	\N	\N	\N
893	1	1	327	1	\N	INVERSIONES 440, C.A.		J-30913048-O	20020909000001	2009-01-01	2009-12-31	AV. 6, SECT. PLAZA BARALT EDIF. SAN FRANCISCO,APTO. 1-D			\N		\N		\N		\N	\N	\N	\N
894	1	1	327	1	\N	CHEMICAL INJECTION SYSTEMS COMPAÃ‘IA ANONIMA	CISCA	J-30449498-0	20020912000000	2009-01-01	2009-12-31	CALLE 67 N. 24-48			\N		\N		\N		\N	\N	\N	\N
895	1	1	327	1	\N	REYES & CORDERO,SERVICIOS TECNICOS INDUSTRIALES,C.A.	R&C,SERTICA	J-30783278-9	20021107000000	2009-01-01	2009-12-31	CALLE 75 ENTRE AV.8 Y 4 SECTOR BELLA VISTA C.C.S.BENITO L.01			\N		\N		\N		\N	\N	\N	\N
898	1	1	327	1	\N	CONSTRUCCIONES,SERVICIOS Y MANTENIMIENTOS SABATINI,C.A.		J-30734951-4	20011214000000	2009-01-01	2009-12-31	AV.7 CALLE 66 Y 67 SECTOR SANTA RITA EDIF.PLAZA PARK APTO 9B			\N		\N		\N		\N	\N	\N	\N
899	1	1	327	1	\N	IRAUSQUIN FALCON,C.A.	IRFALCA	J-30862202-8	20021114000000	2009-01-01	2009-12-31	URB.EL DORAL NORTE AV.12A N0. 35-82			\N		\N		\N		\N	\N	\N	\N
900	1	1	327	1	\N	SUMINISTROS INTEGRALES,C.A.	SUICA	J-30446698-6	20021120000001	2009-01-01	2009-12-31	URB. IRAMA C.C.IRAMA PLANTA ALTA  LOCAL 10			\N		\N		\N		\N	\N	\N	\N
901	1	1	327	1	\N	SERVICIOS,MANTENIMIENTO Y CONSTRUCCIONES COQUIVACOA,C.A.	SERMACCO,C.A.	J-30934125-1	20021004000001	2009-01-01	2009-12-31	CENTRO COMERCIAL LAS TEJAS LOCAL 3-11			\N		\N		\N		\N	\N	\N	\N
902	1	1	327	1	\N	INGENIERIA GUZMAN ATENCIO COMPAÃ‘IA ANONIMA	INGUZA,C.A.	J-07015188-9	19990603000003	2009-01-01	2009-12-31	C.C LAS TUNAS LOCAL #.12,2D0 PISO NIVEL			\N		\N		\N		\N	\N	\N	\N
903	1	1	327	1	\N	REPRESENTACIONES NAVA PRIETO, C.A.	RENAPRICA	J-30287682-6	19990422000061	2009-01-01	2009-12-31	CALLE STA.MARIA LA MONTAÃ‘ITA NO.114-B CABIMAS			\N		\N		\N		\N	\N	\N	\N
904	1	1	327	1	\N	PROTERS CONSTRUCCIONES  Y SERVICIOS,C.A.		J-30750770-5	20021105000000	2009-01-01	2009-12-31	AV.17 BARRIO SANTA ROSA DE TIERRA			\N		\N		\N		\N	\N	\N	\N
905	1	1	327	1	\N	INVERSIONES DE PROYECTISTAS VENEZOLANOS, C.A.	INPRO VENEZUELA, C.A.	J-07047117-4	19990312000062	2009-01-01	2009-12-31	URB.URDANETA CALLE 28A BLO.22-20 APTO 2			\N		\N		\N		\N	\N	\N	\N
906	1	1	327	1	\N	T.J.R. CONSTRUCCIONES,C.A.	T.J.R. CONSTRUCCIONES	J-30944851-0	20021120000000	2009-01-01	2009-12-31	CALLE 100 SABANETA CON AV. PPAL.URB.URDANETA N0.99C-60			\N		\N		\N		\N	\N	\N	\N
907	1	1	327	1	\N	NASTASI & MOLINA CONSTRUCTORA,S.A.	N & M.C,S.A.	J-30692345-4	20021115000000	2009-01-01	2009-12-31	AV. CRISTOBAL COLON			\N		\N		\N		\N	\N	\N	\N
908	1	1	327	1	\N	NICODIBARCA,S.A.		J-30951921-2	20021125000001	2009-01-01	2009-12-31	CIRCUNVALACION N0. 1 SECT.LOS PINOS N0. 500-125			\N		\N		\N		\N	\N	\N	\N
910	1	1	327	1	\N	CONSTRUCCIONES Y MANTENIMIENTO,C.A.	CONMACA	J-30939133-0	20021004000000	2009-01-01	2009-12-31	CALLE 21 N0. 49-43 SECTOR ALTOS DE JALISCOS			\N		\N		\N		\N	\N	\N	\N
911	1	1	327	1	\N	LA CORTE & MALDONADO CONSTRUCCIONES,C.A.	L & M CONSTRUCCIONES,C.A.	J-07047034-8	20001120000000	2009-01-01	2009-12-31	CARRETERA L ENTRE A.V 44Y61			\N		\N		\N		\N	\N	\N	\N
912	1	1	327	1	\N	CONSTRUCTORA COJORO,C.A.	CONSCO,C.A.	J-30802523-2	20010607000000	2009-01-01	2009-12-31	AV.15P N0.47-84			\N		\N		\N		\N	\N	\N	\N
913	1	1	327	1	\N	CONSTRUCTORA BOSCAN,C.A.	CONBOS,C.A.	J-30889378-1	20021022000000	2009-01-01	2009-12-31	CALLE 69 N0. 66-25 LOS OLIVOS			\N		\N		\N		\N	\N	\N	\N
914	1	1	327	1	\N	PAMARCA,C.A.		J-30598049-7	20021018000000	2009-01-01	2009-12-31	AV.16 CONJUNTO RESD.PALAIMA EDIF.4 TORRE A APTO.1-B			\N		\N		\N		\N	\N	\N	\N
915	1	1	327	1	\N	INVERSORA LA VIVIENDA,C.A.	INVELVICA	J-30451873-0	20010529000002	2009-01-01	2009-12-31	AV.19 N0. 98-152 SECTOR LA FLORIDA			\N		\N		\N		\N	\N	\N	\N
916	1	1	327	1	\N	DRAGAS DEL SUR COMPAÃ‘IA ANONIMA	DRAGASUR,C.A.	J-07050180-4	20000607000001	2009-01-01	2009-12-31	CALLE 1 # 5-117 SAN CARLOS DEL ZULIA EDO. ZULIA			\N		\N		\N		\N	\N	\N	\N
917	1	1	327	1	\N	CONSTRUCTORA FIGUERA GONZALEZ,C.A.	FIGOCA	J-30318189-9	20021030000000	2009-01-01	2009-12-31	CALLE 84 N0. 16B-26 LAS DELICIAS			\N		\N		\N		\N	\N	\N	\N
918	1	1	327	1	\N	INCIARTE INGENIERIA,C.A.	ININCA	J-30016810-7	20001228000001	2009-01-01	2009-12-31	AV.13-A N0.74-45			\N		\N		\N		\N	\N	\N	\N
919	1	1	327	1	\N	INGENIERIA,GERENCIA Y OBRAS,C.A.	INGEOCA	J-30342185-7	20020313000001	2009-01-01	2009-12-31	AV.3D-4 N0.63-41 ENTRE CALLES 63 Y 64 SECTOR SAN ROQUE			\N		\N		\N		\N	\N	\N	\N
920	1	1	327	1	\N	INVERSIONES DON ANGEL,C.A.		J-07029276-1	20011102000001	2009-01-01	2009-12-31	CALLE 69A N0.224-42			\N		\N		\N		\N	\N	\N	\N
921	1	1	327	1	\N	D & M CONSTRUCCIONES,C.A.		J-30810188-5	20030131000000	2009-01-01	2009-12-31	AV.4 CON CALLE 65 SECT.BELLA VISTA EDIF. SIGMA OFIC. 4-A			\N		\N		\N		\N	\N	\N	\N
922	1	1	327	1	\N	CONSTRUCCIONES ACOSTA ROMERO,C.A.	ACORO,C.A.	J-30514936-4	20011102000003	2009-01-01	2009-12-31	CALLE D CON AV. 4 N0. 5-57 SECTOR 18 DE OCTUBRE			\N		\N		\N		\N	\N	\N	\N
923	1	1	327	1	\N	SANTA RITA CONSTRUCCIONES, C.A.		J-07049794-7	19990310000079	2009-01-01	2009-12-31	AV.PEDRO LUCAS URRIBARRI,SECTOR LA CAÃ‘ADITA SANTA RITA			\N		\N		\N		\N	\N	\N	\N
924	1	1	327	1	\N	OCTAVO GRUPO INVERSIONES, C.A.	OCTAINCA	J-07055737-0	19990324000095	2009-01-01	2009-12-31	CIRCUNVALACION NO.2,C/C 99 NO.99-48 CENTRO OCTAINCA			\N		\N		\N		\N	\N	\N	\N
925	1	1	327	1	\N	TELECOMUNICACIONES OK-TEL,C.A.		J-30742828-7	20010404000001	2009-01-01	2009-12-31	URB.FUNDA PERIJA INTERCEP.DE LA C/B CON C/A-2 N0.34D-3			\N		\N		\N		\N	\N	\N	\N
926	1	1	327	1	\N	V & Q SERVICES,C.A.		J-30825780-0	20030226000000	2009-01-01	2009-12-31	AV.13A SECTOR TIERRA NEGRA EDIF.CARLINE APTO. 1 Y 3			\N		\N		\N		\N	\N	\N	\N
927	1	1	327	1	\N	BOMBAS FLYGT DE VENEZUELA,S.A.		J-30669742-0	20010918000001	2009-01-01	2009-12-31	CALLE 10 CON C.5.C.EMPRESARIAL ORINOCO,PISO 1,OFI.6,CARACAS			\N		\N		\N		\N	\N	\N	\N
928	1	1	327	1	\N	INVERSIONES, SUMINISTROS Y CONSTRUCCIONES C.A.	INSUCOCA	J-30607279-9	19991007000001	2009-01-01	2009-12-31	AV.23 SECTOR 1 DE MAYO N0.85-72 LOCAL 4			\N		\N		\N		\N	\N	\N	\N
929	1	1	327	1	\N	CONSTRUCCIONES HERNANDEZ PACHECO,C.A.	CONHERPACA	J-30766949-7	20010503000001	2009-01-01	2009-12-31	AV.15J CON CALLE 55 C.C. LA TRINIDAD			\N		\N		\N		\N	\N	\N	\N
930	1	1	327	1	\N	CONSTRUCTORA LA YAPACANA,C.A.	COYAPA,C.A,	J-30781177-3	20011101000000	2009-01-01	2009-12-31	CALLE 1 URB. EL SILENCIO CASA # 3 ARAPUEY EDO. MERIDA			\N		\N		\N		\N	\N	\N	\N
931	1	1	327	1	\N	CONSTRUCCIONES A & M, C.A.		J-30641119-4	20010122000000	2009-01-01	2009-12-31	URB.MAGISTERIAL CASA NO. 185			\N		\N		\N		\N	\N	\N	\N
932	1	1	327	1	\N	CONSTRUCTORA MIFRANCA,C.A.		J-30839428-9	20020515000000	2009-01-01	2009-12-31	CALLE 1 SANTA BARBARA DEL ZULIA CASA N0. 10-46			\N		\N		\N		\N	\N	\N	\N
933	1	1	327	1	\N	INVERSIONES L.V.,C.A.	INVERSIONES L.V.,C.A.	J-30857879-7	20011226000000	2009-01-01	2009-12-31	AV.4 SECTOR CASCO CENTRAL CASA N0. 94-55			\N		\N		\N		\N	\N	\N	\N
934	1	1	327	1	\N	CONSTRUCTORES ASOCIADOS INTERNACIONALES, S.A.	CONSTRUINSA	J-30358732-1	19990416000044	2009-01-01	2009-12-31	CALLE 88 ENTRE AVDAS.15/16 NO.15-32			\N		\N		\N		\N	\N	\N	\N
935	1	1	327	1	\N	CONSTRUCCIONES Y DRENAJES, C.A.	CONDRECA	J-30619182-8	20010313000000	2009-01-01	2009-12-31	CALLE 66 SECTOR PARAISO N0.66-40			\N		\N		\N		\N	\N	\N	\N
936	1	1	327	1	\N	SUMINISTROS CONSTRUCCIONES Y MANTENIMIENTOS EL MENITO, C.A.	SUCOMECA	J-30409788-3	19990322000027	2009-01-01	2009-12-31	AV.18 E/C 78/79 EDIF.IMAR LOCAL NO.4			\N		\N		\N		\N	\N	\N	\N
937	1	1	327	1	\N	DESARROLLOS, PROYECTOS, INGENIERIA, CONSTRUCCIONES, C.A.	D.P.I. CONSTRUCCIONES, C.A.	J-30564126-9	19990324000087	2009-01-01	2009-12-31	CALLE 55 ENTRE AV.15 Y 15B NO.55-80 PROLON			\N		\N		\N		\N	\N	\N	\N
938	1	1	327	1	\N	INVERSIONES, MANTENIMIENTO DE PROYECTOS VIALES C.A.	IMPROVIALCA	J-30770419-5	20010316000003	2009-01-01	2009-12-31	TORRE 77  EDIF. 5 DE JULIO PISO 13			\N		\N		\N		\N	\N	\N	\N
939	1	1	327	1	\N	CONSTRUCTORA SUR DEL LAGO, C.A.		J-30410798-6	19990412000018	2009-01-01	2009-12-31	CALLE 91 N0.13-43			\N		\N		\N		\N	\N	\N	\N
940	1	1	327	1	\N	HIDROSERVICIOS HB. C.A.		J-07044422-3	20001030000002	2009-01-01	2009-12-31	AV. 82A SECTOR AYACUCHO EDIF. B LA RINCONADA			\N		\N		\N		\N	\N	\N	\N
941	1	1	327	1	\N	INGENIERIA DE AGUAS, C.A.	INGACA	J-07038815-3	19990319000049	2009-01-01	2009-12-31	PARAISO,CL 72,ESQ.AV.19,EDIF NOEL TORRE B,P.B. OFIC.2			\N		\N		\N		\N	\N	\N	\N
942	1	1	327	1	\N	M & F CONSTRUCCIONES, C.A.		J-30445903-3	19991210000002	2009-01-01	2009-12-31	AV.49 B- #.151-66 EL SILENCIO ZULIA			\N		\N		\N		\N	\N	\N	\N
943	1	1	327	1	\N	APON INGENIERIA,C.A.	APINCA	J-30880984-5	20020528000001	2009-01-01	2009-12-31	CALLE 89B CON AV.15 EDIF.EMP.OCCIDENTE PISO 10 OFC.10-01			\N		\N		\N		\N	\N	\N	\N
944	1	1	327	1	\N	CONSTRUCCIONES ARNEDO AGUIRRE, C.A.	CONAACA	J-07038595-2	19990304000040	2009-01-01	2009-12-31	CARRETERA LA ENGRANZONADA SECTOR DELICIAS DIAG. SERV. CANAIMA			\N		\N		\N		\N	\N	\N	\N
945	1	1	327	1	\N	ETEIS COMPAÃ‘IA ANONIMA	ETEIS COMPAÃ‘IA ANONIMA	J-30597910-3	19990621000000	2009-01-01	2009-12-31	LA CONCEPCION CAMPO GUAICAIPURO CASA #.5 LOCAL #.1			\N		\N		\N		\N	\N	\N	\N
946	1	1	327	1	\N	CACERES ROMERO C.A.	CACEROCA	J-303744206	20010118000000	2009-01-01	2009-12-31	AV. SANTA TERESA ENTRE CALLES FLORIDA Y LA PAZ			\N		\N		\N		\N	\N	\N	\N
947	1	1	327	1	\N	SERVICIOS, CONSTRUCCIONES Y MANTENIMIENTO SINAMAICA, C.A.	SERCONMACA	J-30598206-6	19991026000008	2009-01-01	2009-12-31	CALLE 5 #.17 SECTOR 15 URB. SAN JACINTO			\N		\N		\N		\N	\N	\N	\N
948	1	1	327	1	\N	CONSTRUCCIONES GALIOTO,C.A.	COGALCA	J-30841927-3	20020122000000	2009-01-01	2009-12-31	CALLE 66A CON AV. 9C SECTOR TIERRA NEGRA EDIF.COTOPERIZ L.2B			\N		\N		\N		\N	\N	\N	\N
949	1	1	327	1	\N	ELECTRICIDAD Y OBRAS CIVILES L.L., C.A.	ELECTROCA	J-30328224-5	19990322000009	2009-01-01	2009-12-31	C.C.LA PARAGUA LOCAL 4.CIRCUNV. N.3.			\N		\N		\N		\N	\N	\N	\N
950	1	1	327	1	\N	CONSTRUCTORA CERVI, C.A.		J-30621518-2	20000129000001	2009-01-01	2009-12-31	ZONA INDUSTRIAL CALLE 149 AV68 #68-185 SEGUNDA ETAPA			\N		\N		\N		\N	\N	\N	\N
951	1	1	327	1	\N	TEMISTOCLES SUAREZ, C.A.	TESUCA	J-07033670-6	19990310000081	2009-01-01	2009-12-31	TERRAZAS DE MCBO,NO.02,EDIF.SANTA BARBARA,LOCAL 3D			\N		\N		\N		\N	\N	\N	\N
952	1	1	327	1	\N	CONSTRUCCIONES LAMARCA,C.A.		J-30856710-8	20020521000000	2009-01-01	2009-12-31	URB.LA PAZ AV. 53A N0. 96H-81 A UNA CUADRA DEL TEATRO N.C.			\N		\N		\N		\N	\N	\N	\N
953	1	1	327	1	\N	ING.VECELIO FOCA CONSTRUCCIONES		V-04321984-3	19990614000020	2009-01-01	2009-12-31	C/URDANETA # 15 EL BATEY MCPIO SUCRE CAJA SECA			\N		\N		\N		\N	\N	\N	\N
954	1	1	327	1	\N	DEMOLICIONES,MANTENIMIENTO,CONSTRUCCIONES Y VIALIDAD C.A.	DEMACA	J-30734271-4	20001211000003	2009-01-01	2009-12-31	AV.LA LIMPIA AV.87 ESQ.CALLE 79 LOCAL 5 NO.42-19 LA CURVA			\N		\N		\N		\N	\N	\N	\N
955	1	1	327	1	\N	INVERSIONES Y CONSTRUCCIONES CARONI, S.A.	INCOCASA	J-30192854-7	19990421000054	2009-01-01	2009-12-31	CALLE 79H NO.74-81 URB.GILCON			\N		\N		\N		\N	\N	\N	\N
956	1	1	327	1	\N	INVERSIONES KOBIAKOV FUENMAYOR,C.A.		J-30731782-5	20010122000001	2009-01-01	2009-12-31	AV.12 C.R. ALTAMIRA APTO.1-A			\N		\N		\N		\N	\N	\N	\N
957	1	1	327	1	\N	PERFORACIONES ANDRADE COMPAÃ‘IA ANONIMA	PERGAR	J-070443707	19990528000000	2009-01-01	2009-12-31	CALLE 90-# 16-23 SECTOR DELICIAS			\N		\N		\N		\N	\N	\N	\N
958	1	1	327	1	\N	CONSTRUCTION & ENGINEERING SERVICE, S.A.	CONESSA	J-30573913-7	19990329000057	2009-01-01	2009-12-31	CARRETERA H NO.95			\N		\N		\N		\N	\N	\N	\N
959	1	1	327	1	\N	CARIBBEAN ENERGY SERVICES,C.A.		J-30868410-4	20020709000000	2009-01-01	2009-12-31	AV.INTERCOMUNAL SECTOR LA VACA- TIA JUANA			\N		\N		\N		\N	\N	\N	\N
960	1	1	327	1	\N	CONSTRUCCIONES E INVERSIONES DURADERO S, C.A.		J-30368502-1	19990517000009	2009-01-01	2009-12-31	EL PINAR PINO MORO 11 APTO 2D ZULIA ZONA POSTAL 4001			\N		\N		\N		\N	\N	\N	\N
961	1	1	327	1	\N	ANAN CONSTRUCCIONES,C.A.	ANANCO,C.A.	J-30652606-4	20010122000003	2009-01-01	2009-12-31	LA CONCEPCION,CAMPO ELIAS CASA NO. 30 "B"			\N		\N		\N		\N	\N	\N	\N
962	1	1	327	1	\N	CONSTRUCCIONES TOMCAR,C.A.	TOMCAR,C.A.	J-30737838-7	20010202000002	2009-01-01	2009-12-31	AV.45 CASA NO.97-03			\N		\N		\N		\N	\N	\N	\N
963	1	1	327	1	\N	INGENIERIA MODERNA DE VENEZUELA,C.A.	INGEMOVECA	J-30549827-0	20011031000000	2009-01-01	2009-12-31	URB. FUNFACION MENDOZA CALLE 126-B # 22A-50			\N		\N		\N		\N	\N	\N	\N
964	1	1	327	1	\N	INVERSIONES Y SERVICIOS, COMPAÃ‘IA ANONIMA	INVESERCA	J-301709900	19990727000001	2009-01-01	2009-12-31	AV.3F # 62A-73 LAS MERCEDES			\N		\N		\N		\N	\N	\N	\N
965	1	1	327	1	\N	CONSTRUCCIONES Y SERVICIOS  R.G.,C.A..		J-30772826-4	20020401000000	2009-01-01	2009-12-31	AV.34 SECT. LOS LAURELES.C.NO.34.			\N		\N		\N		\N	\N	\N	\N
966	1	1	327	1	\N	CONST.Y MANT.DE OBRAS CIVILES Y ELECTRICAS,C.A.	CYMOCE,C.A.	J-30457050-3	20010731000000	2009-01-01	2009-12-31	CALLE STA.MARTHA N0.15 ,CABIMAS			\N		\N		\N		\N	\N	\N	\N
967	1	1	327	1	\N	CONSTRUCCIONES,LINEAS,ACUEDUCTOS,MONTAJES,INSTALACIONES S.A.	CLAM INSTALACIONES,S.A.	J-07036142-5	20010427000002	2009-01-01	2009-12-31	CARRETERA PERIJA KM.6 1/2 C.EMPRESARIAL INDICA ZONA INDUST.			\N		\N		\N		\N	\N	\N	\N
968	1	1	327	1	\N	INVERSIONES LUIS GOMEZ CAMARGO, COMPAÃ‘IA ANONIMA	LUGOCA	J-30628422-2	19991214000002	2009-01-01	2009-12-31	AV.6 SECTOR PLAZA BARALT EDF. SAN FRANCISCO LOCAL 1			\N		\N		\N		\N	\N	\N	\N
969	1	1	327	1	\N	FLAN CARBE,C.A.		J-30840408-0	20011106000000	2009-01-01	2009-12-31	AV.C CASA N0. T-41 BUENA VISTA			\N		\N		\N		\N	\N	\N	\N
970	1	1	327	1	\N	A.V.G. CONSTRUCCIONES, C.A.		J-07042330-7	19990312000063	2009-01-01	2009-12-31	CALLE 77 NO.70 SECTOR PANAMERICANO			\N		\N		\N		\N	\N	\N	\N
971	1	1	327	1	\N	INDUSTRIAS,EDIFICACIONES Y PAVIMENTOS VENEZUELA,C.A.	INEPAVECA	J-30827255-8	20020308000000	2009-01-01	2009-12-31	AV.9B ENTRE CALLE 66A Y 66 N0. 66-49			\N		\N		\N		\N	\N	\N	\N
972	1	1	327	1	\N	ANGEL PINEDA Y COMPAÃ‘IA,C.A.	ANPCO,C.A.	J-30263800-3	20020510000000	2009-01-01	2009-12-31	URB.EL ESTANQUE CALLE 61 N0.9-120 SAN FRANCISCO			\N		\N		\N		\N	\N	\N	\N
973	1	1	327	1	\N	EQUIPA DE OCCIDENTE C.A.		J-07047451-3	20000316000000	2009-01-01	2009-12-31	AV. 3F CALLE 64 NO. 3F-47 SECTOR DON BOSCO			\N		\N		\N		\N	\N	\N	\N
974	1	1	327	1	\N	CONSTRUCTORA GONMADY,C.A.	GONMADYCA	J-30518440-2	20010330000000	2009-01-01	2009-12-31	CALLE 95 N0.3-68 EDIF.CLINICA CATEDRAL LOCAL 01			\N		\N		\N		\N	\N	\N	\N
975	1	1	327	1	\N	CONTRATISTA INDUS. SALAZAR Y SERVICIO, C.A.	COINSERCA	J-07037987-1	19990302000002	2009-01-01	2009-12-31	KM.13 CARRETERA LA CAÃ‘ADA AV.48 CON CALLE 206			\N		\N		\N		\N	\N	\N	\N
976	1	1	327	1	\N	CONSTRUCTORA GUTIERREZ RODRIGUEZ C.A.	CONSTRUCTORA GUR,C.A.	J-30712404-0	20001218000000	2009-01-01	2009-12-31	CAMPO GUAICAIPURO CASA NO.7 LA CONCEPCION			\N		\N		\N		\N	\N	\N	\N
977	1	1	327	1	\N	CONSTRUCCIONES LA DOÃ‘A,C.A.	CONSTRULADOCA	J-30827265-5	20010907000001	2009-01-01	2009-12-31	CALLE R-1 S/N B. EL COMANDANTE,SEC. PUNTA GORDA			\N		\N		\N		\N	\N	\N	\N
978	1	1	327	1	\N	CONSTRUCCIONES BRIGOT COMPAÃ‘IA ANONIMA	BRIGOT	J-07048074-2	20000428000000	2009-01-01	2009-12-31	AV.2 CALLE 78A-100			\N		\N		\N		\N	\N	\N	\N
979	1	1	327	1	\N	LEANDER CONSTRUCTIONS,C.A.	LEANDER,C.A.	J-30731877-5	20001205000001	2009-01-01	2009-12-31	AV.16A CARRETERA VIA EL MOJAN AL LADO RES.EL CUJI LOCAL 2			\N		\N		\N		\N	\N	\N	\N
980	1	1	327	1	\N	MORRIS INGENIERIA,C.A.		J-30673833-9	20011023000003	2009-01-01	2009-12-31	GALLO VERDE CALLE 100 N0. 48B-130			\N		\N		\N		\N	\N	\N	\N
981	1	1	327	1	\N	HYDROSERVICES C.A.		J-30227466-4	19991105000002	2009-01-01	2009-12-31	AV.SANTA RITA ESQ. CALLE 8A 73-80			\N		\N		\N		\N	\N	\N	\N
982	1	1	327	1	\N	FICA S  WELDING CONSTRUCTIONS,C.A.		J-07052221-6	20020819000002	2009-01-01	2009-12-31	CARRETERA MCBO,KM. 85, VILLA DEL ROSARIO.ESTADO ZULIA			\N		\N		\N		\N	\N	\N	\N
983	1	1	327	1	\N	PROYECTOS TECNICOS Y CONSTRUCCIONES  R  & E,C.A.	PROTECON,R & E,C.A.	J-30766744-3	20010830000000	2009-01-01	2009-12-31	CARRETERA H,SECTOR CAMPO ALEGRE NO.356.			\N		\N		\N		\N	\N	\N	\N
984	1	1	327	1	\N	INVERSIONES UNICAP, C.A.		J-30537219-5	19990623000040	2009-01-01	2009-12-31	AV.EL MILAGRO CON CALLE 78 DR.PORTILLO #.2A-79			\N		\N		\N		\N	\N	\N	\N
985	1	1	327	1	\N	DONIL,C.A.		J-30776338-8	20010504000000	2009-01-01	2009-12-31	CALLE PADRE OLIVARES,SECTOR AMPARITO, N0. 28			\N		\N		\N		\N	\N	\N	\N
986	1	1	327	1	\N	H.P. INGENIERIA C.A.		J-30751187-7	20001201000000	2009-01-01	2009-12-31	AV. 4 BELLA VISTA C.C. VILLA INES PISO 4 LOCAL 4			\N		\N		\N		\N	\N	\N	\N
987	1	1	327	1	\N	TRAZO, C.A.		J-30094349-6	19990310000024	2009-01-01	2009-12-31	AV.81# 79E-89 LA LIMPIA SECTOR AYACUCHO			\N		\N		\N		\N	\N	\N	\N
988	1	1	327	1	\N	CONSTRUCTORA BRAVO,C.A.		J-30501482-5	20010316000000	2009-01-01	2009-12-31	CALLE 104 N0. 18B-24			\N		\N		\N		\N	\N	\N	\N
989	1	1	327	1	\N	COMPANY SERVICE, C.A.	COSERCA	J-07055159-3	19990426000003	2009-01-01	2009-12-31	SECTOR 1ERO DE MAYO CALLE LOS ANDES LOCAL #01			\N		\N		\N		\N	\N	\N	\N
990	1	1	327	1	\N	CONSTRUCCIONES MARDENY, C,A,		J-07041122-8	20020905000003	2009-01-01	2009-12-31	CARRETERA K, AV.41,CALLE CUMARE, CABIMAS			\N		\N		\N		\N	\N	\N	\N
991	1	1	327	1	\N	INVERSIONES MIRALLES S.A.	INVERMISA	J-00339352-5	20010116000001	2009-01-01	2009-12-31	AV. 43 ENTRE N Y O SAN BENITO CIUDAD OJEDA			\N		\N		\N		\N	\N	\N	\N
992	1	1	327	1	\N	LEM CONSTRUCCIONES, S.A.		J-07051481-7	19990429000002	2009-01-01	2009-12-31	AV. 3E # 79-80 EDIF. SAN GEMIS LOCAL A			\N		\N		\N		\N	\N	\N	\N
993	1	1	327	1	\N	CONSTRUCCIONES URBA, C.A.	URBA, C.A.	J-07034820-8	19991026000003	2009-01-01	2009-12-31	AV.12 ENTRE CALLES 78 Y 79 EDIF.TORRE 12,MEZANINE 77 2DO. PISO			\N		\N		\N		\N	\N	\N	\N
994	1	1	327	1	\N	CONSTRUCTORA CABIMAS, S.A.	COCASA	J-07018173-7	19990607000008	2009-01-01	2009-12-31	LAS DELICIAS C/PRINCIPAL #.180			\N		\N		\N		\N	\N	\N	\N
995	1	1	327	1	\N	CONSTRUCCIONES LA GALERA,C.A.		J-06507429-9	20011003000000	2009-01-01	2009-12-31	AV. 9B CON CALLE 78 Y 79 N. 78-80			\N		\N		\N		\N	\N	\N	\N
996	1	1	327	1	\N	RIEGO,ESTUDIOS Y PROYECTOS MARACAIBO,C.A.	RIESPROMARCA	J-07035080-6	20001229000001	2009-01-01	2009-12-31	URB.SAN RAFAEL CALLE 98 NO. 61-120			\N		\N		\N		\N	\N	\N	\N
997	1	1	327	1	\N	INVERSIONES BOTELLO PARRA COMPAÃ‘IA ANONIMA	INBOPACA	J-30877927-0	20020912000001	2009-01-01	2009-12-31	CALLE 148 A, BA. SUR AMERICA			\N		\N		\N		\N	\N	\N	\N
998	1	1	327	1	\N	TOPOGRAFIA INGENIERIA, C.A.	TOPING, C.A.	J-07045941-7	19990324000043	2009-01-01	2009-12-31	CALLE 65 ESQ.QV 92 NO.91-100 SECTOR PANAMERICANO			\N		\N		\N		\N	\N	\N	\N
999	1	1	327	1	\N	CPM CONSTRUCCIONES,C.A.		J-30453265-2	20010409000000	2009-01-01	2009-12-31	AV.PRINCIPAL DEL BARRIO SAN JOSE CALLE 61 N0. 61-58			\N		\N		\N		\N	\N	\N	\N
1000	1	1	327	1	\N	INVERSORA CARAN, C.A.		J-30661707-8	20020912000002	2009-01-01	2009-12-31	CALLE CARABOBO,SECTOR LOS ANDES,# 388			\N		\N		\N		\N	\N	\N	\N
1001	1	1	327	1	\N	URBANISMO, VIALIDAD Y CONSTRUCCIONES, C.A.	URVICA	J-30421230-5	20010301000000	2009-01-01	2009-12-31	AV.4 N0. 67-46 SECTOR BELLA VISTA			\N		\N		\N		\N	\N	\N	\N
1002	1	1	327	1	\N	SUMINISTROS Y SERVICIOS  ALIRIAMS,C.A.	S.S.A.L.C.A.	J-30878184-3	20020530000001	2009-01-01	2009-12-31	CALLE 79 N0.13A-131 SECTOR BELLOSO			\N		\N		\N		\N	\N	\N	\N
1004	1	1	327	1	\N	CONSTRUCCIONES Y MANTENIMIENTO PROCCY,C.A.	COMPROCA	J-30900834-0	20021002000000	2009-01-01	2009-12-31	URB.RAUL LEONI 1ERA.ETAPA AV. 92-C EDIF. 7			\N		\N		\N		\N	\N	\N	\N
1005	1	1	327	1	\N	CENTRO DE INSPECCIONES Y ENSAYOS METALURGICOS C.A.	CINEMET, C.A.	J-07050924-4	19991210000000	2009-01-01	2009-12-31	AV.PPAL SABANETA CALLE 100A,SECTOR ALTOS DE VANEGA #.56-75			\N		\N		\N		\N	\N	\N	\N
1006	1	1	327	1	\N	REPARACIONES,MANTENIMIENTO Y CONSTRUCCIONES C.A.	R & M CONSTRUCCIONES,C.A.	J-30473691-6	20001020000003	2009-01-01	2009-12-31	AV.37B NO. 33B-38 BARRIO SAN JOSE			\N		\N		\N		\N	\N	\N	\N
1007	1	1	327	1	\N	CONSTRUCCIONES Y SUMINISTROS H Y C, C.A.	CONSUHYCCA	J-07046754-1	19990315000079	2009-01-01	2009-12-31	AV.LA LIMPIA, CALLE 59 NO.31A-70			\N		\N		\N		\N	\N	\N	\N
1008	1	1	327	1	\N	CONSTRUCCION,SERVICIOS,MANTENIMIENTO Y ASESORAMIENTO,C.A.	CONSERMA,C.A.	J-30236602-0	20010703000000	2009-01-01	2009-12-31	AV.PPAL.CARRETERA LA CONCEPCION SECTOR 1ERO.DE MAYO			\N		\N		\N		\N	\N	\N	\N
1009	1	1	327	1	\N	INVERSIONES FERNANDEZ & RODRIGUEZ,C.A.	INVERSIONES F & R,C.A.	J-30805233-7	20021030000001	2009-01-01	2009-12-31	AV.16 LA GUAJIRA CONJ.RESID. EL CUJI EDIF.1 NUCLEO 4 PISO 4			\N		\N		\N		\N	\N	\N	\N
1010	1	1	327	1	\N	CONSTRUCTORES VENEZOLANOS, C.A.	CONVECA	J-07006927-9	19990319000056	2009-01-01	2009-12-31	CALLE 144 NO.62-225 1ERA ETAPA,ZONA INDUSTRIAL			\N		\N		\N		\N	\N	\N	\N
1011	1	1	327	1	\N	INVERSIONES VELBRA,C.A.	INVELBRACA	J-30775972-0	20010329000002	2009-01-01	2009-12-31	AV.LIBERTADOR SECTOR EL GUAYABO CASA S/N			\N		\N		\N		\N	\N	\N	\N
1013	1	1	327	1	\N	INVERSIONES SALAZAR MARTINEZ, S.A.	ISAMAR	J-30589992-2	19990305000052	2009-01-01	2009-12-31	AV.78 NO.51-91 SECTOR URB.LAS AMALIAS			\N		\N		\N		\N	\N	\N	\N
1014	1	1	327	1	\N	B & D,CONSULTORES GERENCIALES,C.A.		J-30885669-0	20020315000000	2009-01-01	2009-12-31	AV.20 C.C.LAS TEJAS LOCAL 1-20 PLANTA ALTA			\N		\N		\N		\N	\N	\N	\N
1015	1	1	327	1	\N	CENTRO DE ADESTRAMIENTO Y ASESORA.INDUS.LATINOAMERICANO,C.A.	CAILA, C.A.	J-30413187-9	19990714000002	2009-01-01	2009-12-31	URB.LAS CUARENTAS CALLE 3 NO.117-A			\N		\N		\N		\N	\N	\N	\N
1016	1	1	327	1	\N	ARQUITECTOS OCCIDENTALES,C.A.	ARO,C.A.	J-30810330-6	20010813000000	2009-01-01	2009-12-31	CALLE 70 CON AV,13 RESID.MI ENSUEÃ‘O L.1			\N		\N		\N		\N	\N	\N	\N
1017	1	1	327	1	\N	CONSTRUCCIONES RUMAR, C.A.	RUMAR, C.A.	J-07055543-2	19990310000098	2009-01-01	2009-12-31	CALLE 175  NO. 43-24 URB. COROMOTO			\N		\N		\N		\N	\N	\N	\N
1018	1	1	327	1	\N	HERCO CONSTRUCCIONES,C.A.		J-30729400-0	20010515000000	2009-01-01	2009-12-31	CALLE 61 SECTOR LA ESTRELLA CASA N0.11-215			\N		\N		\N		\N	\N	\N	\N
1019	1	1	327	1	\N	OCIVIELECTRI, C.A.		J-305784620	19990526000003	2009-01-01	2009-12-31	SECTOR MILAGRO NORTE AV.2A #.19-54 PUNTICA DE PIEDRA			\N		\N		\N		\N	\N	\N	\N
1020	1	1	327	1	\N	INGENIERIA CORONEL Y PAZ,C.A.	INCORPACA	J-30779536-0	20010925000000	2009-01-01	2009-12-31	CALLE 66 N0. 3D-93 SECTOR BELLA VISTA			\N		\N		\N		\N	\N	\N	\N
1021	1	1	327	1	\N	FERRACO,S.A.	FERRACOSA	J-30782435-2	20010620000001	2009-01-01	2009-12-31	CALLE 59A N0. 4-30 SECTOR LAS MERCEDES			\N		\N		\N		\N	\N	\N	\N
1022	1	1	327	1	\N	CONSTRUCTORA COSTA ORIENTAL DEL LAGO,C.A.	CONTRUCOL,C.A.	J-30742040-5	20011019000001	2009-01-01	2009-12-31	CALLE ALTAMIRA SECTOR LOS BARROSOS CASA S/N MENE GRANDE			\N		\N		\N		\N	\N	\N	\N
1023	1	1	327	1	\N	INVERSIONES RIBAR,C.A.	INRIBARCA	J-30746011-3	20010607000002	2009-01-01	2009-12-31	AV.6 ENTRE CALLES 23 Y 24 CASA N0. 23-51 ESTADO MERIDA			\N		\N		\N		\N	\N	\N	\N
1024	1	1	327	1	\N	CONSTRUCTORA ARIANNA,C.A.		J-30369436-5	20030410000001	2009-01-01	2009-12-31	SIN DIRECCIÃ“N			\N		\N		\N		\N	\N	\N	\N
1025	1	1	327	1	\N	LABARCA MARTINEZ,C.A.	LAMARCA	J-30942071-2	20021009000000	2009-01-01	2009-12-31	CALLE 61 CON AV.3G N0. 61-40 SECT.LAS MERCEDES			\N		\N		\N		\N	\N	\N	\N
1026	1	1	327	1	\N	PROYECTOS, INGENIERIA Y CONSTRUCCIONES.FFG. COMPAÃ‘IA ANONIMA	PROFERGOCA	J-306227857	19990818000000	2009-01-01	2009-12-31	CALLE 60 #.14A-65 RESIDENCIAS CANAIMA APTO 8A LAS TARABAS			\N		\N		\N		\N	\N	\N	\N
1027	1	1	327	1	\N	CONSTRUCTORA E INVERSIONES RINCON BERMUDEZ,C.A.	COIRIBECA	J-30841922-2	20011106000001	2009-01-01	2009-12-31	VILLA DEL ROSARIO AV.10 SECTOR LA ENGRANZONADA			\N		\N		\N		\N	\N	\N	\N
1028	1	1	327	1	\N	PROYECTOS,SERVICIOS,TECNOLOGIA Y CONSTRUCCION, C.A	PROSERTECO,C.A.	J-30603062-0	20030502000000	2009-01-01	2009-12-31	BARRIO ZIRUMA  CALLE 59 N0.15C-71			\N		\N		\N		\N	\N	\N	\N
1029	1	1	327	1	\N	HUPERTZ, C.A.		J-3000520-5	19990319000062	2009-01-01	2009-12-31	AV.14B NO.84-65 SECTOR DELICIAS			\N		\N		\N		\N	\N	\N	\N
1030	1	1	327	1	\N	ASOC.CIVIL PEQUEÃ‘OS Y MEDIANOS PROD.DE ASENT.CAMP.CAÃ‘O NEGRO	ASOPROCANE I Y II	J-30846598-4	20030319000001	2009-01-01	2009-12-31	MACHIQUES COLON SECTOR CAÃ‘O NEGRO			\N		\N		\N		\N	\N	\N	\N
1031	1	1	327	1	\N	FUNDACION PARA EL DESARROLLO FRONTERIZO LIBANO-LA MOTILONA	FUNDEFROLIMO	J-30930897-1	20030319000000	2009-01-01	2009-12-31	C.MACHIQUES COLON SECT.LIBANO MOTILONA FINCA EL ENCANTO			\N		\N		\N		\N	\N	\N	\N
1032	1	1	327	1	\N	SUPLIDORA DE MATERIALES BECERRA,C.A.	SUPLIBECA	J-30417926-0	20030520000000	2009-01-01	2009-12-31	AV.16 CON ESQUINA CALLE 70 EDIF.LOS PINOS LOCAL 1			\N		\N		\N		\N	\N	\N	\N
1033	1	1	327	1	\N	CONSTRUCCIONES Y MANTENIMIENTO ZULIA,C.A.	COMAZUCA	J-30843368-3	20030521000000	2009-01-01	2009-12-31	AV.9B ENTRE CALLE 66-66A # 66-49			\N		\N		\N		\N	\N	\N	\N
1034	1	1	327	1	\N	CONSTRUCTORA LIZARD, C.A.		J-07054399-0	19990416000045	2009-01-01	2009-12-31	CALLE 45 CASA NO. 13-104 URB. EL ROSAL SUR			\N		\N		\N		\N	\N	\N	\N
1035	1	1	327	1	\N	LENEMA,C.A.		J-30735322-8	20001117000003	2009-01-01	2009-12-31	CALLE 78 NO.16- 61 TORRE CONDOMINIO OFICINA 32			\N		\N		\N		\N	\N	\N	\N
1036	1	1	327	1	\N	SERVICIOS,MANTENIMIENTOS ELECTRICOS,C.A.	SERMECA	J-07052619-0	20030604000000	2009-01-01	2009-12-31	AV.INTERCOMUNAL,SECTOR LA TROPICANA CALLE 1 CASA 112 C.OJE.			\N		\N		\N		\N	\N	\N	\N
1037	1	1	327	1	\N	DE LA TORRE COMPANY,C.A.	DELTCOM,C.A.	J-30612392-0	20030415000001	2009-01-01	2009-12-31	CALLE 97 N0.96H-114 URB.SAN MIGUEL			\N		\N		\N		\N	\N	\N	\N
1038	1	1	327	1	\N	CONSTRUCCIONES E INVERSIONES PUNTA ARENA SOCIEDAD ANONIMA	COPUSA	J-30738839-0	20001205000002	2009-01-01	2009-12-31	AV.BELLA VISTA TORRE SOCUY PISO 8 OFICINA 3			\N		\N		\N		\N	\N	\N	\N
1039	1	1	327	1	\N	ARQUITECTOS CONSULTORES PLANIFICADORES, COMPAÃ‘IA ANONIMA	ARCOPLAN, C.A. CONSTRUCCIONES	J-07044194-1	19990430000005	2009-01-01	2009-12-31	AV.10 #.83-49 SECTOR VERITAS.			\N		\N		\N		\N	\N	\N	\N
1040	1	1	327	1	\N	PROYECTOS INSPECCIONES Y CONSTRUCCIONES PIC.,C.A.	P.I.C.C.A.	J-30187914-7	20030611000000	2009-01-01	2009-12-31	CALLE 75 C/AV.3G LA LAGO,EDIF.LUNA P.B.			\N		\N		\N		\N	\N	\N	\N
1041	1	1	327	1	\N	CONSTRUCCIONES Y VIALIDADES DE OCCIDENTE,C.A.	CONVIAL	J-30997819-5	20030612000000	2009-01-01	2009-12-31	C/72 ENTRE AV.15A Y 16 N0.15A-33 P.B. L-2 DELICIAS			\N		\N		\N		\N	\N	\N	\N
1042	1	1	327	1	\N	PROYECTOS CONSTRUCCIONES E INSPECCION DE OBRAS DE INGENIERIA	OBRINCA	J-07038783-1	20000831000000	2009-01-01	2009-12-31	URB. STA. MARIA AV. 25 NO. 65-10 DIAG. ESTADIO A. BORGES			\N		\N		\N		\N	\N	\N	\N
1043	1	1	327	1	\N	INVERSIONES GON-PORT,C.A.		J-30740255-5	20020722000001	2009-01-01	2009-12-31	CALLE CONSUELO N0.3 CASCO CENTRAL			\N		\N		\N		\N	\N	\N	\N
1044	1	1	327	1	\N	CEM INGENIERIA,C.A.	CACEM	J-30590699-8	20030619000000	2009-01-01	2009-12-31	LOS ROBLES CALLE 115  GALPON 64-330 ZONA INDUSTRIAL			\N		\N		\N		\N	\N	\N	\N
1045	1	1	327	1	\N	PROYECTOS Y OBRAS DE INGENIERIA OSORIO GARCIA, C.A.	PROINOGCA	J-30062589-3	19990429000000	2009-01-01	2009-12-31	AV 3Y ENTRE CALLE 74 Y75 CC SAN MARTI EDO ZULIA			\N		\N		\N		\N	\N	\N	\N
1046	1	1	327	1	\N	CONSTRUCCIONES HERNANDEZ C.A.	COHERDCA	J-07052232-1	20001208000001	2009-01-01	2009-12-31	CALLE 103 NO. 195-70 SABANETA			\N		\N		\N		\N	\N	\N	\N
1047	1	1	327	1	\N	N.V. INGENIERIA Y SERVICIOS, S.A.		J-30556245-8	19990310000099	2009-01-01	2009-12-31	SECTOR CASCO CENTRAL AV.4 LOCAL NO.1,CLINICA OBISPO LAZO			\N		\N		\N		\N	\N	\N	\N
1048	1	1	327	1	\N	R & J CONSTRUCCIONES, C.A.	R & J,C.A.	J-07021637-9	19990319000028	2009-01-01	2009-12-31	CALLE A ESQ.AVE. 5 NO.5-05			\N		\N		\N		\N	\N	\N	\N
1049	1	1	327	1	\N	DIAZ CONSTRUCTORES C.A.	DIAZCO,C.A.	J-30622144-1	20010223000001	2009-01-01	2009-12-31	URB.LA GUAIREÃ‘A AV. 15J N0. 38A-91			\N		\N		\N		\N	\N	\N	\N
1050	1	1	327	1	\N	INGENIERIA,PROYECTOS Y VIALIDAD,C.A.	INPROVIAL,C.A.	J-30930745-2	20030512000000	2009-01-01	2009-12-31	CIRCV.1 ENTRE C.108 Y 109 SECTOR ALTAMIRA SUR			\N		\N		\N		\N	\N	\N	\N
1051	1	1	327	1	\N	CONSTRUCCIONES Y MANTENIMIENTOS INDUSTRIALES,C.A.	CARPICA	J-30765375-2	20010518000001	2009-01-01	2009-12-31	BARRIO PANAMERICANO AV.86 N0.67-47			\N		\N		\N		\N	\N	\N	\N
1052	1	1	327	1	\N	M & W CONSTRUCCIONES Y SERVICIOS,C.A.	M & W C.A.	J-30784994-0	20030602000000	2009-01-01	2009-12-31	CALLE C SECTOR MONTE CLARO CASA NO. 2-71			\N		\N		\N		\N	\N	\N	\N
1053	1	1	327	1	\N	INGENIEROS CONSTRUCTORES DE OCCIDENTE COMPAÃ‘IA ANONIMA	I.C.O., C.A.	J-07009250-5	19990707000006	2009-01-01	2009-12-31	URB. C/77 5 DE JULIO #,3D-71 DIAG.A C.A. ELCA DE VZLA			\N		\N		\N		\N	\N	\N	\N
1054	1	1	327	1	\N	CONSTRUCTORA SAN MIGUEL,S.A.		J-30681257-1	20001122000000	2009-01-01	2009-12-31	CALLE 70 CON AV.24 C.C. PALMIRA LOCAL 6			\N		\N		\N		\N	\N	\N	\N
1055	1	1	327	1	\N	CH-20 SISTEMAS, C.A.	CH20-SISCA	J-30407005-5	19990322000098	2009-01-01	2009-12-31	AV.16 CON CALLE 29B C.C. DELICIAS 2 LOCAL 5			\N		\N		\N		\N	\N	\N	\N
1056	1	1	327	1	\N	LIFE LINE,C.A.		J-30381946-0	20010207000002	2009-01-01	2009-12-31	AV.3Y SAN MARTIN ENTRE CALLES 71 Y 72 MINI CENTRO TULIPAN L5			\N		\N		\N		\N	\N	\N	\N
1057	1	1	327	1	\N	M.A.P.R. INVERSIONES,C.A.	M.A.P.R.C.A.	J-30766644-7	20030623000001	2009-01-01	2009-12-31	CALLE 80 CON AV.13 Y 13A NO.28-54			\N		\N		\N		\N	\N	\N	\N
1058	1	1	327	1	\N	INVERSIONES,CONSTRUCCIONES Y VIALIDAD,C.A.	ICONVIALCA	J-30980477-4	20030725000000	2009-01-01	2009-12-31	AV.6A ESQ.CALLE UNION N0.10-24 URB. LA ALHAMBRA			\N		\N		\N		\N	\N	\N	\N
1059	1	1	327	1	\N	ELORRIAGA, FARIA & ASOCIADOS, C.A.	EFACA	J-30139074-1	19990318000093	2009-01-01	2009-12-31	CALLE 72 C/AVE.3G RESIDENCIAS EL CARMEN			\N		\N		\N		\N	\N	\N	\N
1060	1	1	327	1	\N	CONSTRUCCIONES Y PERFILES,C.A.	CONPERCA	J-30506198-0	20030827000000	2009-01-01	2009-12-31	AV. FUERZAS ARMADAS C.C.DORAL CENTER			\N		\N		\N		\N	\N	\N	\N
1061	1	1	327	1	\N	N.O.R.,CONSTRUCCIONES,DISEÃ‘OS Y MANTENIMIENTO,C.A.	N.O.R.CODIMA	J-30795365-9	20010525000001	2009-01-01	2009-12-31	AV.19B SECTOR SABANETA N0. 99A-49			\N		\N		\N		\N	\N	\N	\N
1062	1	1	327	1	\N	EMPRESA RENTAL DE LA FACULT.DE ARQUITEC.DE LA U.DEL ZULIA	ARQUILUZ,C.A.	J-30498053-1	20011022000003	2009-01-01	2009-12-31	CALLE 68 ENTRE AV.4 Y 8 EDIF.TORRE SUR LOCAL 4 MEZZANINE			\N		\N		\N		\N	\N	\N	\N
1063	1	1	327	1	\N	IMPORTADORA Y EXPORTADORA MEJOCA SOCIEDAD ANONIMA	MEJOCA,S.A.	J-30218867-9	20030825000000	2009-01-01	2009-12-31	AV,79 LA LIMPIA URB.LA FLORIDA SECT. AYACUCHO EDIF CARABOBO			\N		\N		\N		\N	\N	\N	\N
1064	1	1	327	1	\N	C.A.VENEZOLANA DE MANTENIMIENTOS MAYORES	CAVEM	J-30837561-6	20030828000000	2009-01-01	2009-12-31	AV.3C.C.C.67,UNICENT.VIRGINIA,PISO 1,LOCAL 1-11,LA LAGO			\N		\N		\N		\N	\N	\N	\N
1065	1	1	327	1	\N	PROMOCIONES Y DESARROLLOS SANTA LUCIA,C.A.	PRODESANCA	J-30043606-3	20001211000001	2009-01-01	2009-12-31	URB.EL ROSAL SUR AV.14A NO.45-103			\N		\N		\N		\N	\N	\N	\N
1066	1	1	327	1	\N	INVERSIONES VR,C.A.		J-30418482-4	20010208000001	2009-01-01	2009-12-31	URB. LA TRINIDAD CALLE 52B N0. 15R-35			\N		\N		\N		\N	\N	\N	\N
1067	1	1	327	1	\N	CONSTRUCTORA INGENIERO MOGOLLON, C.A.	COINMOCA	J-30127738-4	19990322000000	2009-01-01	2009-12-31	CALLE 70 NO.83A-61 SECTOR STA.MARIA			\N		\N		\N		\N	\N	\N	\N
1068	1	1	327	1	\N	COSSPRO,C.A.		J-30728911-2	20010316000002	2009-01-01	2009-12-31	CALLE 71 C/AV. 28 SECTOR SANTA MARIA			\N		\N		\N		\N	\N	\N	\N
1069	1	1	327	1	\N	CONSTRUCTORA ALATRACHE C.A.	CONSTRACHE C.A.	J-30706991-0	20010117000002	2009-01-01	2009-12-31	URB. SAN FELIPE AV. 3 SECTOR 7 NO. 45-40			\N		\N		\N		\N	\N	\N	\N
1070	1	1	327	1	\N	CONSTRUCTORA DELIA,C.A.	CONDELCA	J-07044237-9	20030804000000	2009-01-01	2009-12-31	CALLE 83 CON AV.63 PROLONGACION AMPARO C.C. DOÃ‘A ANA LOC.09			\N		\N		\N		\N	\N	\N	\N
1071	1	1	327	1	\N	INVERSIONES JAIGOM DE ENRRY GERALDO JAIMES GOMEZ		J-09083927-2	20010405000001	2009-01-01	2009-12-31	EDIF.DON EPIFANIO APTO.A-1 CALLE BOLIVAR ESTADO MERIDA			\N		\N		\N		\N	\N	\N	\N
1072	1	1	327	1	\N	CONSTRUCCIONES TIERRAS DEL SOL, C.A.	CONTISOLCA	J-30839838-1	20030811000000	2009-01-01	2009-12-31	CALLE 68 SECTOR TIERRA NEGRA NO.9B-71			\N		\N		\N		\N	\N	\N	\N
1073	1	1	327	1	\N	CONSTRUCTORA PICO, C.A.	COPICA	J-30584874-2	19990324000080	2009-01-01	2009-12-31	CALLE CON AV. 73. #  73-12			\N		\N		\N		\N	\N	\N	\N
1074	1	1	327	1	\N	ADVAN TRADING EXPORT & IMPORT,C.A.	ADVANCA	J-07042867-8	20020718000002	2009-01-01	2009-12-31	CALLE 91 AV.10 N0.11-10,SECTOR BELLOSO			\N		\N		\N		\N	\N	\N	\N
1075	1	1	327	1	\N	A & V, C.A.		J-30863381-0	20020718000003	2009-01-01	2009-12-31	CALLE 71 ENTRE AV 14A Y 15 N0. 14A-102			\N		\N		\N		\N	\N	\N	\N
1077	1	1	327	1	\N	CONSTRUCCIONES POLQUI,C.A.		J-30858197-6	20011115000001	2009-01-01	2009-12-31	AV.28 SECTOR LA LIMPIA LOCAL 2			\N		\N		\N		\N	\N	\N	\N
1078	1	1	327	1	\N	PROYECTOS CONSTRUCCIONES Y SOLUCIONES ALTERNATIVAS,C.A.	PROSALCA	J-30879383-3	20020425000000	2009-01-01	2009-12-31	S.MONTE CLARO AV.06, C.C. IRAMA,LOCAL1			\N		\N		\N		\N	\N	\N	\N
1079	1	1	327	1	\N	MANTENIMIENTOS  NEATNESS,C.A.		J-30041633-0	20010830000001	2009-01-01	2009-12-31	C.C. CONSENSA  AV.5 DE JULIO PISO 1 OFICINA 7			\N		\N		\N		\N	\N	\N	\N
1080	1	1	327	1	\N	SUPLIDORES TECNICOS ESPECIALIZADOS,C.A.	SUPLITECA	J-31002970-9	20030606000000	2009-01-01	2009-12-31	CALLE 63 C.AV.5 EDIF.LAS MERCEDES P.B. OFIC.A-2 S.LAS MERCED			\N		\N		\N		\N	\N	\N	\N
1081	1	1	327	1	\N	ONICA, S.A.		J-07009292-0	19990302000007	2009-01-01	2009-12-31	CIRCUVALACION NO.1 N.500 DETRAS DEL IMAU			\N		\N		\N		\N	\N	\N	\N
1082	1	1	327	1	\N	HILMAR CONSTRUCCIONES,C.A.		J-30905409-0	20030617000000	2009-01-01	2009-12-31	C.77 5 DE JULIO EDIF.VARGHEL LOCAL 1 SECTOR EL PARAISO			\N		\N		\N		\N	\N	\N	\N
1083	1	1	327	1	\N	OPERADORA DE SERVICIOS MEDICOS,C.A.	OSM,C.A.	J-31032015-2	20030814000000	2009-01-01	2009-12-31	AV.3CH SECTOR LA LAGO CASA NO. 71-40			\N		\N		\N		\N	\N	\N	\N
1084	1	1	327	1	\N	CAMELOT CONSTRUCCIONES,C.A.		J-31131676-0	20030815000000	2009-01-01	2009-12-31	AV.4 Y 8 ESQ.CALLE 72 EDIF.CLODOMIRA PISO 2 L.303			\N		\N		\N		\N	\N	\N	\N
1085	1	1	327	1	\N	ARTE Y PROYECTO,C.A.	ARPROCA	J-31009892-1	20030623000000	2009-01-01	2009-12-31	AV.3H C.C.68 SECTOR BELLA VISTA N0.69-51			\N		\N		\N		\N	\N	\N	\N
1086	1	1	327	1	\N	REMODELACIONES Y CONSTRUCCIONES NACIONALES, C.A.	RECONCA	J-30933868-4	20030905000000	2009-01-01	2009-12-31	AV 15,N. 85-86BDELICIAS AUTO REPUESTOS 2000.			\N		\N		\N		\N	\N	\N	\N
1087	1	1	327	1	\N	CONSTRUCCIONES Y SUMINISTRO CORREA RINCON & ASOCIADOS C.A.	CONSUCOR, C.A.	J-30572000-2	19990426000004	2009-01-01	2009-12-31	URB.LOS SAUCES CALLE 78 #71A-34			\N		\N		\N		\N	\N	\N	\N
1088	1	1	327	1	\N	CONSTRUCTORA ZULIANA DE LA COSTA ORIENTAL DEL LAGO, C.A.	CONZUCOLCA	J-07050723-3	19990318000094	2009-01-01	2009-12-31	DELICIA NUEVA C.ARGENTI M/C COLOMBIA # 29B			\N		\N		\N		\N	\N	\N	\N
1089	1	1	327	1	\N	VAYEW, C.A.		J-30174475-6	20000927000000	2009-01-01	2009-12-31	CALLE 10 AV.6-6-60 LOS PUERTOS DE ALTAGRACIA			\N		\N		\N		\N	\N	\N	\N
1090	1	1	327	1	\N	TECNICOS ASOCIADOS EN MANT.Y SERVICIOS DE OCCIDENTE,C.A.	TAMASCA	J-07052145-7	20020628000000	2009-01-01	2009-12-31	AV.5 Y 6 URB.IRAMA LOCAL 9 CASA 6-71			\N		\N		\N		\N	\N	\N	\N
1091	1	1	327	1	\N	CONSTRUCCIONES CHACIN, C.A.		J-30150499-2	19990315000083	2009-01-01	2009-12-31	AV.PEDRO LUCAS URRIBARRI SECTOR BARRANCAS.			\N		\N		\N		\N	\N	\N	\N
1092	1	1	327	1	\N	CONSTRUCTORA TRES HERMANOS MORILLO, S.A.	G.H.H.,S.A.	J-30357322-3	19990304000041	2009-01-01	2009-12-31	AV.3C NO.71 SECTOR LA LAGO			\N		\N		\N		\N	\N	\N	\N
1093	1	1	327	1	\N	EPSILON, C.A.		J-30430869-8	20030902000000	2009-01-01	2009-12-31	AV. INTERCOMUNAL N. 492			\N		\N		\N		\N	\N	\N	\N
1094	1	1	327	1	\N	CONSTRUCCIONES Y SERVICIOS J & V,C.A.	J & V,C.A.	J-31008658-3	20030701000000	2009-01-01	2009-12-31	AV. 08 SAN JACINTO CASA N0. 70			\N		\N		\N		\N	\N	\N	\N
1095	1	1	327	1	\N	MANTENIMIENTO,CONSTRUCCIONES Y SERVICIOS,C.A.	MACONSE,C.A.	J-30884192-7	20020425000001	2009-01-01	2009-12-31	CARRETERA F, SECTOR LA MISION EDIF. LORETO CABIMAS			\N		\N		\N		\N	\N	\N	\N
1096	1	1	327	1	\N	SOLDADURAS Y CONSTRUCCIONES VENEZUELA COMPANIA ANONIMA	SOCOVENCA	J-07009811-2	20030901000000	2009-01-01	2009-12-31	AV. SECTOR LA CURVA DEL PATO VIA AL TABLAZO			\N		\N		\N		\N	\N	\N	\N
1097	1	1	327	1	\N	DECONFERCA, S.A.		J-30243509-9	19990310000004	2009-01-01	2009-12-31	CALLE 70 EDIF.DOÃ‘A DALIA MEZZANINE 2 OFICNA 2-2			\N		\N		\N		\N	\N	\N	\N
1098	1	1	327	1	\N	VIALIDAD, INSPECCION Y CONSTRUCCION, COMPAÃ‘IA ANONIMA	VINC, C.A.	J-07049625-8	19990310000041	2009-01-01	2009-12-31	AV.3-C SECTOR LA LAGO EDIF CHAMA APTO 9B			\N		\N		\N		\N	\N	\N	\N
1099	1	1	327	1	\N	CONSTRUCCIONES F & M,C.A.		J-30731916-0	20010426000006	2009-01-01	2009-12-31	CARRETERA LA CONCEPCION KM.18 SECTOR PALITO BLANCO			\N		\N		\N		\N	\N	\N	\N
1100	1	1	327	1	\N	CONSTRUCCIONES A Y E, S.A.	CONAESA	J-07024363-5	19990304000022	2009-01-01	2009-12-31	CALLE 72 CON AV.25 EDIF.NEZUL LOCAL 04 P.B.			\N		\N		\N		\N	\N	\N	\N
1101	1	1	327	1	\N	INVERSIONES PROYECTOS MANT. Y CONSTRUCCIONES MENDEZ RUBIO	INVERPROMCA	J-30519237-5	20000907000000	2009-01-01	2009-12-31	BARRIO CARMELO URDANETA AV. 105 NO. 71-55			\N		\N		\N		\N	\N	\N	\N
1102	1	1	327	1	\N	CONSTRUCTORA JAIME,C.A.	CONSERJACA	J-30636221-5	20030910000000	2009-01-01	2009-12-31	CALLE 92 LOS BARROSOS, QUINTA S.N.			\N		\N		\N		\N	\N	\N	\N
1103	1	1	327	1	\N	CONSTRUCCIONES Y MANTENIMIENTO MONRIELCA,C.A.		J-30740592-9	20010410000002	2009-01-01	2009-12-31	CALLE 67 AV.27 EDIF.FINQUITA SEMI-SOTANO OFICINA N0.03			\N		\N		\N		\N	\N	\N	\N
1104	1	1	327	1	\N	SERVICIOS Y CONSTRUCCIONES R.S.M.,C.A.	R.S.M.,C.A.	J-30768529-8	20010315000004	2009-01-01	2009-12-31	AV.EL MILAGRO N0.84-576 QUINTA SALAMANCA			\N		\N		\N		\N	\N	\N	\N
1105	1	1	327	1	\N	INGENIERIA DE PROYECTOS, CONSTRUCCIONES, Y MEDICIONES,C.A.	INPROCOME, C.A.	J-07012274-9	19990621000001	2009-01-01	2009-12-31	C/67B #.11-91 ENTRE LAS AVS. 11 Y 12			\N		\N		\N		\N	\N	\N	\N
1106	1	1	327	1	\N	CONSTRUCCIONES Y ASFALTADOS DEL ZULIA,C.A.	COAZCA	J-30711970-5	20001215000002	2009-01-01	2009-12-31	AC.3Y ENTRE CALLES 74 Y 75 C.C.SAN MARTIN PRIMER NIVEL L.12			\N		\N		\N		\N	\N	\N	\N
1107	1	1	327	1	\N	GRUPO DE INVERSIONES Y SERVICIOS,C.A.	GRISERCA	J-30435300-6	20010907000000	2009-01-01	2009-12-31	AV 3F,NO.58A-58,ANTIGUO GALPON LA SUIZA.			\N		\N		\N		\N	\N	\N	\N
1109	1	1	327	1	\N	COMPUTOS,C.A.		J-30913238-5	20020703000000	2009-01-01	2009-12-31	VEREDA 1 URB.SAN JACINTO CASA N0. 38			\N		\N		\N		\N	\N	\N	\N
1110	1	1	327	1	\N	INVERSIONES V & G, COMPAÃ‘IA ANONIMA	V & G	J-31045898-7	20030915000000	2009-01-01	2009-12-31	CALLE 77 N. 70-11 SECTOR PANAMERICANO			\N		\N		\N		\N	\N	\N	\N
1111	1	1	327	1	\N	GOMEZ Y SANCHEZ INVERSIONES, C.A.	G & S INVERSIONES, C.A.	J-30446375-2	19990318000005	2009-01-01	2009-12-31	AV.15 DELICIAS CON CALLE 89 EDIF.CENTRO EMPRESARIAL PISO.02			\N		\N		\N		\N	\N	\N	\N
1112	1	1	327	1	\N	OLAR CONTRATACIONES,C.A.	OLAR CONTRATACIONES,C.A.	J-31025007-3	20030808000000	2009-01-01	2009-12-31	CALLE 71 NO. 12-54 ENTRE AV. 12 Y 13 SECTOR TIERRA NEGRA			\N		\N		\N		\N	\N	\N	\N
1113	1	1	327	1	\N	CONSTRUCCIONES Y MANTENIMIENTOS WILLARD, C.A.	WILLARDCA	J-07050936-8	19990505000002	2009-01-01	2009-12-31	AV.19A-#.79-96 SECTOR LAS DELICIAS			\N		\N		\N		\N	\N	\N	\N
1114	1	1	327	1	\N	CONSTRUCCIONES Y MANTENIMIENTO VILORIA, COMPAÃ‘IA ANONIMA	COVICA	J-30391924-3	19990505000009	2009-01-01	2009-12-31	AV. 62A # 113-49 LOS ROBLES A 1/2 CUADRA DEL DISPENSARIO			\N		\N		\N		\N	\N	\N	\N
1115	1	1	327	1	\N	CONSTRUCCIONES LANGUT C.A.		J-30450887-5	20000829000000	2009-01-01	2009-12-31	AV.13A ENTRE CALLES 71 Y 72 NO. 71-84			\N		\N		\N		\N	\N	\N	\N
1116	1	1	327	1	\N	CENTRAL DE ACRILICOS SANTA RITA,C.A.		J-30214532-4	20010403000000	2009-01-01	2009-12-31	AV.8 SANTA RITA N0.82-35			\N		\N		\N		\N	\N	\N	\N
1117	1	1	327	1	\N	TOTAL SERVICIOS,C.A.	TOSCA	J-30831037-9	20020716000000	2009-01-01	2009-12-31	CALLE 81 CARRETERA N SECTOR EL DANTO			\N		\N		\N		\N	\N	\N	\N
1118	1	1	327	1	\N	G Y G INGENIERIA,C.A.		J-31014167-3	20030925000000	2009-01-01	2009-12-31	CALLE 79 DR.PORTILLO N0. 12-63			\N		\N		\N		\N	\N	\N	\N
1119	1	1	327	1	\N	INSTALACIONES CONSTRUCCIONES Y MANTENIMIENTOS RODRIGUEZ,C.A.	INCOMAROCA	J-30917234-4	20021031000000	2009-01-01	2009-12-31	AV.11B URB. LAS CAMELIAS ZONA NORTE CASA N0. K-51			\N		\N		\N		\N	\N	\N	\N
1120	1	1	327	1	\N	DISEÃ‘O Y CONSTRUCCION DE INGENIERIA,C.A.	DICICA	J-31040319-8	20030926000000	2009-01-01	2009-12-31	VEREDA 01 URB. SAN JACINTO SECTOR 10 CASA N0.38			\N		\N		\N		\N	\N	\N	\N
1121	1	1	327	1	\N	VENEZOLANA DE CONSTRUCCION,C.A.	VENCOCA	J-30626026-9	20030925000001	2009-01-01	2009-12-31	AV.16 B.EL SALADILLO CASA N0.950-35			\N		\N		\N		\N	\N	\N	\N
1122	1	1	327	1	\N	CONCRETOS Y AGREGADOS AGROINDUSTRIALES,C.A.	CONAINCA,C.A.	J-30172754	20000303000000	2009-01-01	2009-12-31	AV. 18A CON C/112 RES. ACROPOLIS APTO. S-1-1 TORRE SUR			\N		\N		\N		\N	\N	\N	\N
1123	1	1	327	1	\N	DISTRIBUCION TERMICA,C.A.	DISTERCA	J-30658091-3	20030929000001	2009-01-01	2009-12-31	CARRETERA "O"AV. 52 ZONA INDUSTRIAL,CIUDAD OJEDA			\N		\N		\N		\N	\N	\N	\N
1124	1	1	327	1	\N	CONSTRUCTORA LOS RUICES, C.A.		J-07036506-4	19990324000083	2009-01-01	2009-12-31	AV.1 CASA # 11-04			\N		\N		\N		\N	\N	\N	\N
1125	1	1	327	1	\N	V & P INGENIERIA Y CONSTRUCCIONES, C.A.	V & P, C.A.	J-30585232-4	19990325000003	2009-01-01	2009-12-31	SECTOR TIERRA NEGRA CALLE 68 NO.9B-71			\N		\N		\N		\N	\N	\N	\N
1126	1	1	327	1	\N	GRAPHOS DISEÃ‘O Y CONSTRUCCIONES CIVILES,C.A.	GRAPHOS,C.A.	J-07039035-2	20020809000001	2009-01-01	2009-12-31	EDIF.SIMON BOLIVAR LOCAL 04 SECTOR TAMARE			\N		\N		\N		\N	\N	\N	\N
1127	1	1	327	1	\N	CONSTRUCCIONES ARIZONA,C.A.	ARIZONA	J-30899071-0	20020610000000	2009-01-01	2009-12-31	BARRIO LOS ROBLES,CALLE 113 N0.63-12			\N		\N		\N		\N	\N	\N	\N
1128	1	1	327	1	\N	ESTUDIO TECNICOS DE ARQUITECTURA, C.A.	E.T.A.C.A.	J-30013941-7	19990322000008	2009-01-01	2009-12-31	C.C. PASEO MIRANDA LOCAL NO.7 AV.3 C/C 10			\N		\N		\N		\N	\N	\N	\N
1130	1	1	327	1	\N	PROYECTO Y SERVICIO AGRO-CIVIL MORA GUTIERREZ,C.A.	PROMOGCA	J-30745350-8	20010202000000	2009-01-01	2009-12-31	URB.FUNDACOLON KM.5 VIA STA.BARBARA-ELVIGIA,CASA 3-43			\N		\N		\N		\N	\N	\N	\N
1131	1	1	327	1	\N	CONSTRUCONSULT,C.A.		J-31029735-5	20030813000000	2009-01-01	2009-12-31	AV.3G C.C.70 SECT.BELLAS ARTES EDIF.APART.ALVAREZ B-02 P.B.			\N		\N		\N		\N	\N	\N	\N
1132	1	1	327	1	\N	PORAGUA,C.A.	PORAGUA	J-30731492-3	20021112000001	2009-01-01	2009-12-31	AV.5 DE JULIO C.C. INTERNACIONAL P.B.			\N		\N		\N		\N	\N	\N	\N
1133	1	1	327	1	\N	SER.TECNOLOGICOS DE GEOLOGIA,OBRAS CIVILES E INFORMATICA,C.A	GEOCINTECH,C.A.	J-30822451-0	20010710000001	2009-01-01	2009-12-31	AV.4 SECTOR CASCO CENTRAL CASA N0.94-55			\N		\N		\N		\N	\N	\N	\N
1134	1	1	327	1	\N	SERVICIOS Y MANTENIMENTO GARCIA, C.A.	SEMAGAR, C.A.	J-07049647-9	19990319000051	2009-01-01	2009-12-31	AV.17B,CALLE 115A NO.17-34			\N		\N		\N		\N	\N	\N	\N
1135	1	1	327	1	\N	INGENIERIA DE LA REMODELACION MANTENIMIENTO Y AVALUOS,C.A.	INREMACA	J-30891295-6	20030829000000	2009-01-01	2009-12-31	CALLE 69 N. 9B-04 SECTOR TIERRA NEGRA			\N		\N		\N		\N	\N	\N	\N
1136	1	1	327	1	\N	CONSTRUCCIONES NAVA Y ARAUJO,C.A.	CONARAUCA	J-30747231-6	20010726000000	2009-01-01	2009-12-31	AV.73B SECTOR LOS MEDANOS LA LIMPIA N0. 79I-10			\N		\N		\N		\N	\N	\N	\N
1137	1	1	327	1	\N	PROYECTOS GERENCIALES, C.A.	PROGERCA	J-30535301-8	19990315000075	2009-01-01	2009-12-31	AV.15 DELICIAS ENTRE CALLES 89 Y 89B EDIF.LAS PALMERAS P-1			\N		\N		\N		\N	\N	\N	\N
1138	1	1	327	1	\N	TECNO CIVIL, C.A.		J-07032485-6	19990429000001	2009-01-01	2009-12-31	AV.3H /CALLE 78 Y 79 RESID. REPUBLICA PLANT.BAJA LOCAL #2			\N		\N		\N		\N	\N	\N	\N
1139	1	1	327	1	\N	DESARROLLOS URBANISMO E INGIENERIA,C.A.	DUINCA	J-30966262-7	20030905000001	2009-01-01	2009-12-31	CALLE 15 C. AV. 15B,NO. 55-80, LA TRINIDAD,PROLG.DELICIAS			\N		\N		\N		\N	\N	\N	\N
1140	1	1	327	1	\N	LUNACA,C.A.		J-31008535-8	20030923000000	2009-01-01	2009-12-31	CALLE CARABOBO SANTA RITA CASA N0.167			\N		\N		\N		\N	\N	\N	\N
1141	1	1	327	1	\N	OBRAS, PROYECTOS Y CALCULOS, COMPAÃ‘IA ANONIMA	OPROCCA	J-30108044-0	19990304000016	2009-01-01	2009-12-31	URB. EL PORTAL CALLE 50 CON AV. 14 # 50-64			\N		\N		\N		\N	\N	\N	\N
1142	1	1	327	1	\N	VIDELCA CONSTRUCCIONES, C.A.		J-31009472-1	20030929000000	2009-01-01	2009-12-31	AV. 5 DE JULIO CALLE 77 C.AV. 2B CASA N0.2C-01-21			\N		\N		\N		\N	\N	\N	\N
1144	1	1	327	1	\N	SUPLIDORA COMERCILIZADORA O.R., C.A.	SUROS, C.A.	J-30494175-7	19990412000012	2009-01-01	2009-12-31	AV.57 C/C 146 NO.67-55 ZONA INDUSTRIAL 1ERA ETA			\N		\N		\N		\N	\N	\N	\N
1146	1	1	327	1	\N	BUILDINGS DEVELOPMENTS C.A.	BIDECA	J-30873947-2	20030916000001	2009-01-01	2009-12-31	AV. SANTA RITA, ENTRE CALLE 67 Y 68 EDIF, MA.VICTORIA AP.13-			\N		\N		\N		\N	\N	\N	\N
1147	1	1	327	1	\N	CONSTRUCA, C.A.		J-07024242-6	19990302000009	2009-01-01	2009-12-31	ZONA INSDUSTRIAL 2DA.ETAPA CALLE 148A ESQ.K.V.			\N		\N		\N		\N	\N	\N	\N
1148	1	1	327	1	\N	INGENIERIA,CONSTRUCCIONES ELECTRICAS Y REPRESENTACIONES, C.A	INCERCA	J-07044132	19990602000012	2009-01-01	2009-12-31	CALLE 67 C/C AVDA 27 EDIF. FINQUITA SEMI-SOTANO SECT.STA M.			\N		\N		\N		\N	\N	\N	\N
1149	1	1	327	1	\N	CONSTRUCCIONES DALMONTE COMPANIA ANONIMA	CONDALCA	J-07013372-4	20030909000000	2009-01-01	2009-12-31	CALLE 69A,NO. 14A-126 PLANTA ALTA			\N		\N		\N		\N	\N	\N	\N
1150	1	1	327	1	\N	CONSTRUCCIONES PEREZ,C.A.	COPERCA	J-30697654-0	20010126000000	2009-01-01	2009-12-31	CALLE 79I N0. 73A-112			\N		\N		\N		\N	\N	\N	\N
1151	1	1	327	1	\N	GRUPO RAGIL,C.A.		J-30657384- 4	20010530000001	2009-01-01	2009-12-31	AV.21 EDIF.MIRANDA P.B.			\N		\N		\N		\N	\N	\N	\N
1152	1	1	327	1	\N	INVERSIONES Y CONSTRUCCIONES BADELL,S.A.	INCOBASA	J-07050082-4	20021016000000	2009-01-01	2009-12-31	AV.15 DELICIAS CON CALLE 74 N0. 74-50			\N		\N		\N		\N	\N	\N	\N
1153	1	1	327	1	\N	PROMOTORES DE INGENIERIA, PROYECTOS Y CONSTRUCCIONES, C.A.	P.A.P. CONSTRUCCIONES, C.A.	J-30079945-0	19991122000002	2009-01-01	2009-12-31	CALLE 75 ESQ. AV. 3G. EDIF.LUNA PLANTA BAJA			\N		\N		\N		\N	\N	\N	\N
1154	1	1	327	1	\N	TECNICA RAME, C.A.		J-07027670-3	19990324000063	2009-01-01	2009-12-31	URB.LA ROTARIA,AVENIDA 81G, NO.81-22			\N		\N		\N		\N	\N	\N	\N
1155	1	1	327	1	\N	INVERSIONES RIO BRAVO,C.A.	RIO BRAVO,C.A.	J-30618471-6	20020118000000	2009-01-01	2009-12-31	AV.BOLIVAR N0.3-30 SANTA BARBARA-ESTADO ZULIA			\N		\N		\N		\N	\N	\N	\N
1156	1	1	327	1	\N	INVERSIONES CONTRERAS & CONTRERAS,C.A.	I.C.C.,C.A.	J-30879160-1	20020926000000	2009-01-01	2009-12-31	CALLE 65 CON AV. 3 EDIF. ZUPIRE PB SECTOR SAN BARTOLO			\N		\N		\N		\N	\N	\N	\N
1157	1	1	327	1	\N	L Y M REPRESENTACIONES,C.A.		J-30651697-2	20001218000001	2009-01-01	2009-12-31	CALLE 14B# 84-145			\N		\N		\N		\N	\N	\N	\N
1158	1	1	327	1	\N	CONSULTORIAS Y ASESORIAS GEOTECNICAS, COMPAÃ‘IA ANONIMA	GEOTECNIA, C.A.	J-300504565	19990615000006	2009-01-01	2009-12-31	AV 9B CALLE 59 # 59A-12			\N		\N		\N		\N	\N	\N	\N
1159	1	1	327	1	\N	INSTALACIONES PETROLERAS, C.A.	INSTALPETROL	J-30051346-7	19990310000002	2009-01-01	2009-12-31	CALLE 67 NO.66B-06 SECTOR LOS OLIVOS			\N		\N		\N		\N	\N	\N	\N
1160	1	1	327	1	\N	CONSTRUCCIONES Y MANTENIMIENTOS JOSMAX,C.A.	JOSMAXCA	J-30782280-5	20010809000000	2009-01-01	2009-12-31	AV.MILAGRO NORTE SECTOR SANTA ROSA N0.6E-71			\N		\N		\N		\N	\N	\N	\N
1161	1	1	327	1	\N	CONSTRUCCIONES Y ESTRUCTURAS CATATUMBO,C.A.	CESCA	J-30864578-8	20030610000001	2009-01-01	2009-12-31	AV.10 ENTRE CALLE 67 Y 68 EDIF.CONSULTORES CARI 1 PISO L-1			\N		\N		\N		\N	\N	\N	\N
1162	1	1	327	1	\N	B&C INVERSIONES,C.A.		J-30908527-1	20030429000000	2009-01-01	2009-12-31	ESQ.AV.8B CALLE 64N0.8A-65			\N		\N		\N		\N	\N	\N	\N
1163	1	1	327	1	\N	CONSTRUCCIONES Y PROYECTOS COLON,S.A.	COPROCOL,S.A.	J-30970645-4	20030922000000	2009-01-01	2009-12-31	AV. 15 LAS DELICIAS NO. 74-50			\N		\N		\N		\N	\N	\N	\N
1164	1	1	327	1	\N	INSTALACIONES ELECTRICAS Y CONSTRUCCIONES,C.A.	INSTELCO,C.A.	J-30937396-0	20020930000000	2009-01-01	2009-12-31	AV.4 BELLA VISTA C.C. EL TRIANGULO LOCAL 24			\N		\N		\N		\N	\N	\N	\N
1165	1	1	327	1	\N	PROYECTOS Y CONSTRUCCIONES LOPEZ COMPAÃ‘IA ANONIMA	PROCOLCA	J-30793275-9	20020830000000	2009-01-01	2009-12-31	CALLE N, URB. MONTE BELLO N.   12-5O			\N		\N		\N		\N	\N	\N	\N
1166	1	1	327	1	\N	INVERSIONES JADID, C.A.	JADIDCA	J-07042186-0	19990319000036	2009-01-01	2009-12-31	CALLE 80 AV.13 NO.80-80			\N		\N		\N		\N	\N	\N	\N
1167	1	1	327	1	\N	D.A. INVERSIONES, C.A.	DAICA	J-30222198-6	19990308000066	2009-01-01	2009-12-31	LAS DELICIAS AV15 # 88A-44 EDIF. MONTIEL P.1			\N		\N		\N		\N	\N	\N	\N
1168	1	1	327	1	\N	PROYECTOS Y CONSTRUCCIONES DE INGENIERIA, C.A.	PROCOIN	J-30001089-9	19991217000001	2009-01-01	2009-12-31	AV.11 C/CALLE 69-10 SECTOR TIERRA NEGRA.			\N		\N		\N		\N	\N	\N	\N
1169	1	1	327	1	\N	TELECOMUNICACIONES Y SERVICIOS INDUSTRIALES DEL ZULIA	TELSI-ZULIA	V-05560968-0	20011026000000	2009-01-01	2009-12-31	CALLE  16 BARRIO SIERRA MAESTRA N0. 5-47			\N		\N		\N		\N	\N	\N	\N
1170	1	1	327	1	\N	CONSULTORIA,ASESORIA,SERVICIOS Y CONSTRUCCIONES,C.A.	CONSUSERCA	J-30531827-1	20001214000005	2009-01-01	2009-12-31	CALLE 95 ENTRE AV.14 Y 14A C.C.PUENTE CRISTAL LOCAL 83			\N		\N		\N		\N	\N	\N	\N
1171	1	1	327	1	\N	CONSTRUCCIONES,REPARACIONES Y SERVICIOS CRESERCA,C.A.	CRESERCA,C.A.	J-30930722-3	20020821000000	2009-01-01	2009-12-31	URB. MARACAIBO,AV.C/C NNO.65 LA CASITA.			\N		\N		\N		\N	\N	\N	\N
1172	1	1	327	1	\N	SERVICIOS Y MANTENIMIENTO INDUSTRIALES COL,C.A.	SERMICOLCA	J-30780474-2	20010410000001	2009-01-01	2009-12-31	AV.PPAL.V.RODRIGUEZ C.C.ZULIANIKITA LOCAL 2 P.B.BACHAQUERO			\N		\N		\N		\N	\N	\N	\N
1173	1	1	327	1	\N	INVERSIONES GENERALES, S.A.	INVERGESA	J-07055175-5	19990329000050	2009-01-01	2009-12-31	CENTRO EMP.DE OCCIDENTE CALLE 89B CON AV.15 3ER PISO OFIC.3			\N		\N		\N		\N	\N	\N	\N
1174	1	1	327	1	\N	CONSTRUCCIONES Y MANTENIMIENTO DE OBRAS J.Y.H.,C.A.	CONMAJYHCA	J-30774528-2	20010329000005	2009-01-01	2009-12-31	URB.VALMORE RODRIGUEZ VEREDA 2 N0.26 CAJA SECA			\N		\N		\N		\N	\N	\N	\N
1175	1	1	327	1	\N	INVERSIONES Y PROYECTOS ATENCIO, C.A.	INPROACA	J-30499321-8	19990304000045	2009-01-01	2009-12-31	SECTOR TIERRA NEGRA A.V. 13-A C.C. 66-A RES. MCBO. APTO. 8-C			\N		\N		\N		\N	\N	\N	\N
1176	1	1	327	1	\N	CONSTRUCTORA ALITASIA,C.A.	CONALICA	J-30740747-6	20010426000003	2009-01-01	2009-12-31	AV.27 CON CALLE 9 LA PUNTA SAN FRANCISCO HATO PACUCHU			\N		\N		\N		\N	\N	\N	\N
1177	1	1	327	1	\N	INGENIERIA Y CONSTRUCCIONES NAZARENO	INGCONA, C.A.	J-30585174-3	19990324000057	2009-01-01	2009-12-31	CALLE 74 C/AV.13 NO.13-74			\N		\N		\N		\N	\N	\N	\N
1178	1	1	327	1	\N	DESARROLLO DE PROYECTOS Y MANTENIMIENTO,C.A.	DEPROMACA	J-30345766-5	20010319000003	2009-01-01	2009-12-31	BLOQUE 30 I ETAPA PLANTA BAJA OFIC.00-07			\N		\N		\N		\N	\N	\N	\N
1179	1	1	327	1	\N	SERVICIOS TECNICOS DE INGENIERIA VENEZOLANA,C.A.	SERTIVENCA	J-30537822-3	19990329000059	2009-01-01	2009-12-31	CALLE 57 NO.7-74 SECTOR ZAPARA II PLANTA ALTA			\N		\N		\N		\N	\N	\N	\N
1180	1	1	327	1	\N	DAMIANO INGENIERIA, C.A.	DAINCA	J-07052738-2	19990329000049	2009-01-01	2009-12-31	URB. MONTE BELLO AV.8 CALLE K # 8-03.			\N		\N		\N		\N	\N	\N	\N
1181	1	1	327	1	\N	CONSTRUCCIONES FERNANDEZ,C.A.	COFECA	J-30642190-4	20010524000000	2009-01-01	2009-12-31	CALLE 72 C.C. MONTIELCO PISO 4 OF.4-4			\N		\N		\N		\N	\N	\N	\N
1182	1	1	327	1	\N	CONSTRUCTORA CASTELLANO,C.A.	CONCASCA	J-30831319-0	20010814000000	2009-01-01	2009-12-31	CALLE DELICIAS SECTOR SANTA CLARA CASA N0.54 CABIMAS			\N		\N		\N		\N	\N	\N	\N
1183	1	1	327	1	\N	GRUPO LABRADOR C.A.	GRULACA	J-30581987-4	19990428000003	2009-01-01	2009-12-31	AV.28 LA LIMPIA INTERSC. CON CALLE 78 B N0.44-238.			\N		\N		\N		\N	\N	\N	\N
1184	1	1	327	1	\N	CONSTRUCCIONES MIZPHA COMPAÃ‘IA ANONIMA	MIZPHACA	J-30525075-8	19990318000006	2009-01-01	2009-12-31	CLLE 72 AV. 20 EDIF. NOEL TORRE A.			\N		\N		\N		\N	\N	\N	\N
1185	1	1	327	1	\N	INVERSORA S Y D, C.A.		J-30336025-4	19990308000062	2009-01-01	2009-12-31	AV.12 ENTRE CALLES 78 Y 79 EDIF.TORRE 12 MEZZANINE 3			\N		\N		\N		\N	\N	\N	\N
1186	1	1	327	1	\N	CONSTRUCTORA GENESIS 2000,C.A.	GENESIS 2000,C.A.	J-30285847-0	20020718000000	2009-01-01	2009-12-31	AV.3 SECTOR SANTA LUCIA CASA N0. 88-15			\N		\N		\N		\N	\N	\N	\N
1187	1	1	327	1	\N	PROYECTOS Y CONTRATOS, C.A.	PROCONCA	J-30182188-2	19990325000010	2009-01-01	2009-12-31	CALLE 74 CON AV.13 NO.13-74			\N		\N		\N		\N	\N	\N	\N
1188	1	1	327	1	\N	INGENIERO ORLANDO PARRA COMPAÃ‘IA ANONIMA	INORPACA	J-30766751-6	20010219000000	2009-01-01	2009-12-31	CARRETERA H SECTOR CAMPO ALEGRE CASA N0. 356			\N		\N		\N		\N	\N	\N	\N
1189	1	1	327	1	\N	CONSTRUCCIONES DEL ROSARIO,C.A.		J-30985663-4	20030415000000	2009-01-01	2009-12-31	CALLE 79 DR. QUINTERO # 12-63			\N		\N		\N		\N	\N	\N	\N
1190	1	1	327	1	\N	S.T.B.PROYECTOS Y CONSTRUCCIONES,C.A.	S.T.B.P.C.,C.A.	J-30876851-0	20020508000000	2009-01-01	2009-12-31	SECTOR PARAISO,CALLE 72 CENTRO C. MONTIELCO,APT.04			\N		\N		\N		\N	\N	\N	\N
1192	1	1	327	1	\N	SERVICIOS DE INGENIERIA PARA PROYECTOS Y CONSTRUCCIONES S.A.	SIPPCO,S.A.	J-07042980-1	20010306000001	2009-01-01	2009-12-31	URB.LA TRINIDAD AV.15C N0.55A-114 EDIF.DOÃ‘A DALIA OF.1-2			\N		\N		\N		\N	\N	\N	\N
1193	1	1	327	1	\N	PAVIMENTADORA ONICA, S.A.		J-300066908	19990318000013	2009-01-01	2009-12-31	CARRETERA EL VIGIA  STA.BARBARA SECTOR LOS POZONES			\N		\N		\N		\N	\N	\N	\N
1194	1	1	327	1	\N	CONSTRUCCIONES VILORIA,C.A.	VICOCA	J-30855191-0	20020121000000	2009-01-01	2009-12-31	AV.14A SECTOR LAS DELICIAS CASA N0. 74-15			\N		\N		\N		\N	\N	\N	\N
1195	1	1	327	1	\N	INVERSIONES SANTARO,C.A.	SANTARO,C.A.	J-30733293-0	20010704000000	2009-01-01	2009-12-31	CALLE 68 ENTRE AVS.21 Y 22 C.C.URACOA LOCAL 7			\N		\N		\N		\N	\N	\N	\N
1196	1	1	327	1	\N	EMAGOM,C.A.		J-30071003-3	20020902000001	2009-01-01	2009-12-31	AV. 2C N. 77A-80 ANTES DR. PORTILLO.			\N		\N		\N		\N	\N	\N	\N
1197	1	1	327	1	\N	SUMINISTROS SERMA C.A.	SUSERMA C.A.	J-30733916-0	20001207000000	2009-01-01	2009-12-31	C.C. PALAIMA PISO 1 OFIC. 1-17			\N		\N		\N		\N	\N	\N	\N
1198	1	1	327	1	\N	SERVICIOS Y CONSTRUCCIONES DEL SUR,C.A.	SERCONSURCA	J-30405087-9	20010209000000	2009-01-01	2009-12-31	CALLE 69 AV.12 EDIF. RAFAEL OFIC.2B			\N		\N		\N		\N	\N	\N	\N
1199	1	1	327	1	\N	BALZA CONSTRUCCIONES S.A.	BALCOSA	J-30282472-9	20001221000001	2009-01-01	2009-12-31	AV.100 SABANETA NO. 228-53			\N		\N		\N		\N	\N	\N	\N
1200	1	1	327	1	\N	VENEZOLANA DE CONSTRUCCION M & P C.A.	VENCO M & P C.A.	J-30433270-0	19990412000024	2009-01-01	2009-12-31	AV.12 NO.45-72 ROSAL SUR			\N		\N		\N		\N	\N	\N	\N
1201	1	1	327	1	\N	FUND.DE PROD.DE EL PARAISO Y DE LA PARROQ.U.DEL MCPIO COLON.	FUNDAPPUR	J-30653660-4	19991220000000	2009-01-01	2009-12-31	CALLE 80A URB.LAS LOMAS #.71A-95			\N		\N		\N		\N	\N	\N	\N
1270	1	1	327	1	\N	ALUMAS,C.A.		J-30582458-4	20011022000001	2009-01-01	2009-12-31	BARRIO MODELO CALLE 72B N0. 08A-140 SECTOR EL MARITE			\N		\N		\N		\N	\N	\N	\N
1271	1	1	327	1	\N	RIEGO Y ACUEDUCTOS,C.A.	RIADUCA	J-30963031-8	20030609000000	2009-01-01	2009-12-31	AV.22 CALLE 29  CASA N0.57N			\N		\N		\N		\N	\N	\N	\N
1301	1	1	327	1	\N	STEWART & STEVENSON DE VENEZUELA,S.A.		J-07010555-0	20010228000000	2009-01-01	2009-12-31	KM.4 1/2 CARRETERA VIA LA CAÃ‘ADA			\N		\N		\N		\N	\N	\N	\N
1303	1	1	327	1	\N	CONSTRUCCIONES METELIA C.A.	CONMACA	J-305131350	20030828000001	2009-01-01	2009-12-31	SECTOR LA LAGO,AV.3C,C.PROF.COROMOTO OFIC.6			\N		\N		\N		\N	\N	\N	\N
1398	1	1	327	1	\N	TRANSPORTE VIER COMPANIA ANONIMA	TRAVIERCA	J-07034158-0	20030828000003	2009-01-01	2009-12-31	CALLE 73 ENTRE A.V. 3C Y 3D EDIF.HALEAKALA OFI.#1			\N		\N		\N		\N	\N	\N	\N
1400	1	1	327	1	\N	LUBVENCA DE OCCIDENTE,COMPAÃ‘IA ANONIMA	LUBVENCA	J-30439960-0	20030828000002	2009-01-01	2009-12-31	CALLE 82 ENTRE AV 9 Y 9B EDIF GUASARE			\N		\N		\N		\N	\N	\N	\N
1412	1	1	327	1	\N	INVERSIONES Y SERVICIOS FERRER, COMPAÃ‘IA ANONIMA	INSFERCA	J-30617647-O	20030916000000	2009-01-01	2009-12-31	C.C.CENTRO UNION CALLE 10 LOCALES 3 Y 4			\N		\N		\N		\N	\N	\N	\N
1413	1	1	327	1	\N	SUMINISTRO E INSTALACIONES TECNICAS C.A.	SUMITEC	J-30866110-4	20020829000000	2009-01-01	2009-12-31	CALLE 76 C/AV.4 BELLA VISTA,EDIF. DON MATIAS,PB-LOCAL 05			\N		\N		\N		\N	\N	\N	\N
1423	1	1	327	1	\N	MCS, MANTENIMIENTO, CONSTRUCCIONES Y SERVICIOS, S.A.	MCS,S.A.	J-30595870-0	20000926000003	2009-01-01	2009-12-31	CALLE 72 AV. 3Y BELLA VISTA			\N		\N		\N		\N	\N	\N	\N
1428	1	1	327	1	\N	ZULIA INDUSTRIAS VENEZUELA, C.A.	ZULIVEN,C.A.	J-07012770-8	20001129000000	2009-01-01	2009-12-31	SAN FRANCISCO CALLE 16 EL ESTUDIANTE NO. 6-37			\N		\N		\N		\N	\N	\N	\N
1429	1	1	327	1	\N	GONZALEZ STEFANELLI SERVICIOS INDUSTRIALES,C.A.	GOSTECA,C.A.	J-30299572-8	20001011000000	2009-01-01	2009-12-31	CALLE72CON AV.BELLA VISTA C.C.EMPRESARIAL CLODOMIRA OF.01			\N		\N		\N		\N	\N	\N	\N
1434	1	1	327	1	\N	CONSTRUCCIONES VENEZOLANAS,C.A.	COVECA	J-30745370-2	20001226000002	2009-01-01	2009-12-31	SECTOR R-10 CALLE PARAGUANA NO.2			\N		\N		\N		\N	\N	\N	\N
1436	1	1	327	1	\N	PROYECTOS N.M.,C.A.		J-30281086-8	20010206000001	2009-01-01	2009-12-31	CALLE 85 CON AV.8 STA.RITA EDIF.FERRECLOSET LOCAL 1-2			\N		\N		\N		\N	\N	\N	\N
1437	1	1	327	1	\N	GRUPO EMPRESARIAL SABATINI,C.A.	GRUPENSA,C.A.	J-30270738-2	20010214000000	2009-01-01	2009-12-31	URB.CANTA CLARO AV.12 N0.55-105			\N		\N		\N		\N	\N	\N	\N
1441	1	1	327	1	\N	INGENIERIA Y GESTION EMPRESARIAL,S.A.	INGEMSA	J-30667452-7	20010301000001	2009-01-01	2009-12-31	C.C.SOCUY AV. 4 CALLE 67 OFICINA 29			\N		\N		\N		\N	\N	\N	\N
1443	1	1	327	1	\N	SERVIMUEBLE,C.A.		J-07023051-7	20010220000002	2009-01-01	2009-12-31	CALLE 78 DR.PORTILLO ESQ.AV 16 N0. 16-07 SECTOR PARAISO			\N		\N		\N		\N	\N	\N	\N
1449	1	1	327	1	\N	SERVICIOS BADELL & PLUMACHER COMPAÃ‘IA ANONIMA	S.B.P. C.A. DE CONSTRUCCION)	J-30059449-1	19990319000066	2009-01-01	2009-12-31	CALLE 67 NO.11-115 LOCAL B			\N		\N		\N		\N	\N	\N	\N
1450	1	1	327	1	\N	CONSTRUCTORA NORTE SUR, C.A.		J-07020187-8	20001207000003	2009-01-01	2009-12-31	URB. EL PORTAL CALLE 51A NO.13-73			\N		\N		\N		\N	\N	\N	\N
1451	1	1	327	1	\N	REPARACION Y PINTURA DE MUEBLES DE OFICINAS,C.A.	REPIMUEBLES,C.A.	J-30007165-0	20010228000002	2009-01-01	2009-12-31	AV.LA LIMPIA SECT.POSTES NEGROS N0. 8-15			\N		\N		\N		\N	\N	\N	\N
1453	1	1	327	1	\N	FIGUEROA GARCIA,C.A.	FIGARCA	J-30508229-4	20010108000000	2009-01-01	2009-12-31	CARRETERA NACIONAL ESQUINA TASAJERAS,LAGUNILLAS			\N		\N		\N		\N	\N	\N	\N
1455	1	1	327	1	\N	BLINDACA,SERVICIO Y MANTENIMIENTO,C.A.	BLINDACA	J-30005997-9	20010130000000	2009-01-01	2009-12-31	AV.8 SANTA RITA CON CALLE 71 EDIF.RISSON LOCALES 1 Y 2			\N		\N		\N		\N	\N	\N	\N
1458	1	1	327	1	\N	CONSTRUCCIONES MONSERCA,S.A.		J-07022868-7	20010222000000	2009-01-01	2009-12-31	AV.57B NO.97-51 SECT.ANDRES ELOY BLANCO C.2 DETRAS C.C.TARC.			\N		\N		\N		\N	\N	\N	\N
1459	1	1	327	1	\N	CONSTRUCTORA HERMANOS FURLANETTO,C.A.	CONFURCA	J-07012509-8	20010405000000	2009-01-01	2009-12-31	CALLE PIAR N0.100 CIUDAD OJEDA			\N		\N		\N		\N	\N	\N	\N
1460	1	1	327	1	\N	SERVICIOS,MONTAJES Y MANTENIMIENTOS,C.A.	SERMOMACA	J-07054814-2	20010312000001	2009-01-01	2009-12-31	VIA AEROPUERTO N0. 75-1591			\N		\N		\N		\N	\N	\N	\N
1461	1	1	327	1	\N	INVERSIONES Y DESARROLLOS LOS CEDROS I,C.A.		J-30403351-6	20010321000002	2009-01-01	2009-12-31	CALLE CARRILLO N0. 0-8			\N		\N		\N		\N	\N	\N	\N
1462	1	1	327	1	\N	GERENCIA,MANTENIMIENTO Y CONSTRUCCIONES,C.A.	GEMACOCA	J-09037920-7	20010320000000	2009-01-01	2009-12-31	AV.BOLIVAR C.C.EDIVICA II LOCAL 44 VALERA EDO.TRUJILLO			\N		\N		\N		\N	\N	\N	\N
1463	1	1	327	1	\N	INVERSIONES Y CONSTRUCCIONES NAVA & ACEVEDO,S.A.	INVERCON,S.A.	J-30390453-0	20010518000000	2009-01-01	2009-12-31	URB.NUEVA MIRANDA CALLE 8A ENTRE AV.4 Y 5 N0.4-112 PUERTOS			\N		\N		\N		\N	\N	\N	\N
1464	1	1	327	1	\N	INDUSTRIAS Y CONSTRUCCIONES DE VENEZUELA, S.A.	SAINCOVEN	J-07039533-8	20010409000001	2009-01-01	2009-12-31	CALLE 86A ENTRE AV.8 Y 9 N0. 8-77			\N		\N		\N		\N	\N	\N	\N
1465	1	1	327	1	\N	J & S CONSTRUCCIONES,C.A.		J-30487121-0	20010411000000	2009-01-01	2009-12-31	AV.22 ENTRE CALLES 65 Y 66 MINI-CENTRO DON LUIS LOCAL N0.4			\N		\N		\N		\N	\N	\N	\N
1467	1	1	327	1	\N	SUPLIDORES MEDICOS VANMAR,C.A.	VANMAR,C.A.	J-30693739-0	20010521000000	2009-01-01	2009-12-31	AV.10 CALLE 91 N0. 11-10			\N		\N		\N		\N	\N	\N	\N
1468	1	1	327	1	\N	INVERSIONES,CONSTRUCCIONES EMMANUEL,C.A.	INCONTREMA,C.A.	J-30797203-3	20010628000000	2009-01-01	2009-12-31	CALLE 64 ENTRE AV.4 Y 8 EDIF.SUR AMERICA PISO 5 APTO 5B			\N		\N		\N		\N	\N	\N	\N
1471	1	1	327	1	\N	CONSTRUCTORA LA PAZ,C.A.	CONPAZCA	J-30581504-6	20010523000001	2009-01-01	2009-12-31	LA CONCEPCION SECTOR ELGUAYABO, VIA PRINCIPAL A CAMPO LA PAZ			\N		\N		\N		\N	\N	\N	\N
1472	1	1	327	1	\N	GAS AIR CONDITIONING SERVICE,C.A.	GAS AIR,C.A.	J-07013125-0	20010530000000	2009-01-01	2009-12-31	AV.12 CON CALLE 70 N0. 70-55			\N		\N		\N		\N	\N	\N	\N
1473	1	1	327	1	\N	INGENIERIA, ESTUDIOS Y PROYECTOS AMBIENTALES, C.A.	INESPA	J-30615190-7	19991026000000	2009-01-01	2009-12-31	AV.3FC.C.58A EDIF.CLARISA LAS MERCEDES			\N		\N		\N		\N	\N	\N	\N
1474	1	1	327	1	\N	BRIMONTI CONSTRUCCIONES,C.A.		J-30226121-0	20010606000003	2009-01-01	2009-12-31	AV.11 N0.2-26 SANTA BARBARA.EDO.ZULIA			\N		\N		\N		\N	\N	\N	\N
1475	1	1	327	1	\N	SERVICIOS CATELLANOS,C.A.	SERCAS	J-30069654-5	20010625000001	2009-01-01	2009-12-31	ZONA INDUSTRIAL II VIA PALITO BLANCO VIA AEROPUERTO			\N		\N		\N		\N	\N	\N	\N
1476	1	1	327	1	\N	TECNO EMBOBINADOS PENIEL,C.A.	PENIELCA	J-30594868-2	20010820000000	2009-01-01	2009-12-31	SECTOR BELLOSO CALLE 89D,N0.13B-01			\N		\N		\N		\N	\N	\N	\N
1478	1	1	327	1	\N	ELECTRIFICACIONES Y CONSTRUCCIONES NEGRON,C.A.	ELECNECA	J-30544003-4	20010628000001	2009-01-01	2009-12-31	CALLE LA MARINA N0-127 MACHIQUES			\N		\N		\N		\N	\N	\N	\N
1479	1	1	327	1	\N	INVERSIONES ROMAVA,C.A.		J-30099998-0	20010801000000	2009-01-01	2009-12-31	AV.GONZALO PICON,QUINTA TRINIDAD PLANTA ALTA,EDO.MERIDA			\N		\N		\N		\N	\N	\N	\N
1480	1	1	327	1	\N	INGENIERIA G.B.R.,C.A.		J-07538506-3	20010725000001	2009-01-01	2009-12-31	C.2 AL LADO DE HIPERMERCADO META.			\N		\N		\N		\N	\N	\N	\N
1481	1	1	327	1	\N	SEGOVIA INGENIERIA Y PROYECTOS,C.A.	SEINPROCA	J-30491287-0	20010911000001	2009-01-01	2009-12-31	CALLE 105,N0. 18A-276,LA POMONA			\N		\N		\N		\N	\N	\N	\N
1483	1	1	327	1	\N	CLAVE PROYECTOS Y CONSTRUCCION,C,A,		J-30777827-0	20010920000001	2009-01-01	2009-12-31	AV, 15 DELICIAS,EDIF.GRADOS OF.1-A.			\N		\N		\N		\N	\N	\N	\N
1484	1	1	327	1	\N	SERVICIOS Y CONSTRUCCIONES SERVICON"S,C.A.		J-30782386-0	20010906000000	2009-01-01	2009-12-31	AV. 15 SECTOR DELICIAS, NO.74-45			\N		\N		\N		\N	\N	\N	\N
1486	1	1	327	1	\N	SERVICIOS INTEGRALES DE INGENIERIA AGRONOMICA,C.A.	AGROSEINCA	J-30479694-3	20001123000002	2009-01-01	2009-12-31	AV.71-B # 01-102			\N		\N		\N		\N	\N	\N	\N
1487	1	1	327	1	\N	CONSTRUCTORA LEOMAR,C.A.	CONLECA	J-30817304-5	20010820000001	2009-01-01	2009-12-31	AV. PEDRO LUCAS URRIBARRI,SANTA RITA NO.12			\N		\N		\N		\N	\N	\N	\N
1488	1	1	327	1	\N	CONSTRUCTORA LEAL Y MAYOR, C..A.	LYMCA.	J-307888008	20010823000000	2009-01-01	2009-12-31	CALLE SAN BENITO,ANTES C.PRINCIPAL.			\N		\N		\N		\N	\N	\N	\N
1489	1	1	327	1	\N	WEST-CONSTRUCCIONES,C.A.	WESCA	J-30831071-9	20010905000001	2009-01-01	2009-12-31	CALLE 70,EDIF. DONA JULIA, PISO 2, OFICINA 1 A.			\N		\N		\N		\N	\N	\N	\N
1490	1	1	327	1	\N	SERVICIOS INTEGRALES DE MANTENIMIENTO Y CONSTRUCCION,C.A.	SERIMCO,C.A.	J-30804289-7	20010829000001	2009-01-01	2009-12-31	AV.23,SECTOR PARAISO,NO.65-91,EDIF.HARRAR,APT.2			\N		\N		\N		\N	\N	\N	\N
1493	1	1	327	1	\N	MEDITRON,C.A.		J-00081466-0	20011002000000	2009-01-01	2009-12-31	CALLE 10 LA URBINA EDIF. MEDITRON,CARACAS			\N		\N		\N		\N	\N	\N	\N
1494	1	1	327	1	\N	INVERSIONES COSTA MARENSE,C.A.	ICOMCA	J-30007992-9	20001213000004	2009-01-01	2009-12-31	AV.7 ENTRE CALLE 58 Y 59 NO. 58-61 ZAPARA DOS			\N		\N		\N		\N	\N	\N	\N
1495	1	1	327	1	\N	CONSTRUCTORA OMEGA,C.A.	OMEGA,C.A.	J-07025834-9	20001221000002	2009-01-01	2009-12-31	CALLE 76 C/AV.12 EDIF.UPEMA PISO 2			\N		\N		\N		\N	\N	\N	\N
1497	1	1	327	1	\N	CONSTRUCTORA MOLSAN,C.A.	COMOLSANCA	J-30681749-2	20001220000001	2009-01-01	2009-12-31	SECTOR SOTOVENTO CALLE PRINCIPAL			\N		\N		\N		\N	\N	\N	\N
1501	1	1	327	1	\N	INGENIERIA ESPECIALIZADA DE MARACAIBO, C.A.	INGEMA,C.A.	J-30436617-5	20000807000000	2009-01-01	2009-12-31	AV.8B 61-49 ENTRE CALLES 61 Y 62			\N		\N		\N		\N	\N	\N	\N
1504	1	1	327	1	\N	CONSTRUCTORA MUNICIPAL,C.A.	CONMUPALCA	J-30194422-4	20010302000000	2009-01-01	2009-12-31	SECTOR SAN AGUSTIN CALLE 47 N0. 16B-48			\N		\N		\N		\N	\N	\N	\N
1505	1	1	327	1	\N	INVERSIONES Y DESARROLLO LOS ANDES,C.A.	INDERANDES,C.A.	J-30295611-0	20010312000000	2009-01-01	2009-12-31	URB.LAS ACACIAS C.C. EL PINAR PISO 5 APTO 13			\N		\N		\N		\N	\N	\N	\N
1506	1	1	327	1	\N	SERVICIOS INTEGRALES DE INGENIERIA,C.A.	SERTINCA	J-30606694-2	20010302000003	2009-01-01	2009-12-31	CALLE 59A N0.4-30 SECTOR LAS MERCEDES			\N		\N		\N		\N	\N	\N	\N
1509	1	1	327	1	\N	CONSTRUCTORA FUTURO,C.A.	COFUCA	J-30488649-7	20020115000000	2009-01-01	2009-12-31	CALLE EL POZO C.C. CALLE SANTA ROSA N0.26 POZUELO			\N		\N		\N		\N	\N	\N	\N
1510	1	1	327	1	\N	PALAS INVERSORA,C.A.	PALINCA	J-30441505-2	20010315000005	2009-01-01	2009-12-31	AV.14A N0. 76-11 SECT.5 DE JULIO C.C. LUCKY LOCAL 5			\N		\N		\N		\N	\N	\N	\N
1512	1	1	327	1	\N	ESTRUCTURAS CENO DE OCCIDENTE,C.A.		J-07000708-7	20010321000003	2009-01-01	2009-12-31	CALLE 140 CON AV. 62 ZONA INDUSTRIAL			\N		\N		\N		\N	\N	\N	\N
1513	1	1	327	1	\N	CONTRUCTORAS OBRAS Y DESARROLLO, C.A.	COYDECA	J-30121244-4	19990414000030	2009-01-01	2009-12-31	VIA LAS LOMAS C.C. DOÃ‘A ANA LOCAL NO.9			\N		\N		\N		\N	\N	\N	\N
1517	1	1	327	1	\N	O.P. & P.SERVICIOS INTEGRALES,C.A.		J-30693309-3	20010409000004	2009-01-01	2009-12-31	AV.3H CON CALLE 79 N0-79-39			\N		\N		\N		\N	\N	\N	\N
1518	1	1	327	1	\N	SERVICIOS BIOTECNICOS,C.A.	SERBIOTEC,C.A.	J-30379725-3	20010427000000	2009-01-01	2009-12-31	CALLE 79 ENTRE AV. 11 Y 12 EDIF. KAIKA LOCAL 3			\N		\N		\N		\N	\N	\N	\N
1519	1	1	327	1	\N	INVERSIONES PRIETO BAVARESCO,C.A.	P Y B ,C.A.	J-30499747-7	19990329000051	2009-01-01	2009-12-31	CIRC.2 C.COMERCIAL ANPARO LOCAL 10 AL LADO DE LA FERRETERIA LA CAMPECINA			\N		\N		\N		\N	\N	\N	\N
1520	1	1	327	1	\N	VISION PROFESIONAL DEL ZULIA, C.A.	VIPROZUCA	J-30355643-4	20010515000001	2009-01-01	2009-12-31	CIRCUNVALACION 2 SECTOR SAN MIGUEL CALLE 96C N0.60B-06			\N		\N		\N		\N	\N	\N	\N
1521	1	1	327	1	\N	CONSTRUCCIONES INCIARTE,C.A.		J-30132293-2	20010604000000	2009-01-01	2009-12-31	AV.15 CON CALLE 93 LA PADILLA EDIF.LATINA PISO 1 LOCAL 2			\N		\N		\N		\N	\N	\N	\N
1522	1	1	327	1	\N	CONSTRUCCIONES,INVERSIONES Y SERVICIOS ORTIZ,C.A.	CINORCA	J-30278980-0	20010503000000	2009-01-01	2009-12-31	URB.SAN MIGUEL CALLE 97B N0. 60A-54			\N		\N		\N		\N	\N	\N	\N
1523	1	1	327	1	\N	MARCANO ROJAS,C.A.	MAROCA	J-30205394-3	20001214000002	2009-01-01	2009-12-31	KM.5 CARRETERA VIA PERIJA AV.50 NO.150-74			\N		\N		\N		\N	\N	\N	\N
1526	1	1	327	1	\N	SERTYAGRO,C.A.		J-07040275-0	20010719000000	2009-01-01	2009-12-31	SECTOR EL PARAISO CALLE 65 AV.77D N0.35C-32			\N		\N		\N		\N	\N	\N	\N
1530	1	1	327	1	\N	CONSTRUCCIONES,SERVICIOS Y MANTENIMIENTO R & P,C.A.	CONSERMANCA	J-07027910-9	20010613000000	2009-01-01	2009-12-31	AV.BELLA VISTA CON CALLE 66 C.C.EL TRIANGULO LOCAL 22			\N		\N		\N		\N	\N	\N	\N
1531	1	1	327	1	\N	CONSTRUCCIONES Y MANTENIMIENTOS SILVA, C.A.	COMSICA	J-30263907-7	19990312000067	2009-01-01	2009-12-31	AV.LA LIMPIA  B.AYACUCHO,AV.80D NO.79H-15			\N		\N		\N		\N	\N	\N	\N
1532	1	1	327	1	\N	REPARACIONES ELECTRICAS,MECANICAS,INDUSTRIALES,NAVALES,C.A.	R.E.M.I.N.C.A.	J-07015385-7	20010125000000	2009-01-01	2009-12-31	AV.18A N0.123-87 LOS HATICOS			\N		\N		\N		\N	\N	\N	\N
1533	1	1	327	1	\N	REPRESENTACIONES INDUSTRIALES DE OCCIDENTE,C.A.	REINOCA	J-30391546-9	20010307000002	2009-01-01	2009-12-31	CALLE 69A N0.15-44 SECTOR DELICIAS			\N		\N		\N		\N	\N	\N	\N
1535	1	1	327	1	\N	SERVICIOS MULTIPLES DE CONTRATACION,S.A.	SERMUCOSA	J-30391545-0	20010307000001	2009-01-01	2009-12-31	CALLE 69A N0.15-44 SECT.DELICIAS			\N		\N		\N		\N	\N	\N	\N
1537	1	1	327	1	\N	CONSTRUCCIONES E INVERSIONES A.R.C.A.		J-06004957-1	20010406000003	2009-01-01	2009-12-31	CARRETERA STA.BARBARA EL VIGIA KM.2			\N		\N		\N		\N	\N	\N	\N
1539	1	1	327	1	\N	G.M. PROYECTOS, C.A.		J-30788390-1	20010823000001	2009-01-01	2009-12-31	AV.MIRAFLORES CABIMAS,CASA NO.28			\N		\N		\N		\N	\N	\N	\N
1540	1	1	327	1	\N	RODRIGUEZ & ROMERO,C.A.	R & R, C.A.	J-30654729-0	20010206000000	2009-01-01	2009-12-31	URB.LAS 50 CALLE N0.03 CASA N0. 114 CABIMAS			\N		\N		\N		\N	\N	\N	\N
1542	1	1	327	1	\N	CONSTRUCCIONES Y MANTENIMIENTO RODRIGUEZ,C.A.	COSTAMAR,C.A.	J-30732846-0	20010925000005	2009-01-01	2009-12-31	AV.PPAL.ZONA INDUSTRIAL N0.53-14 II ETAPA			\N		\N		\N		\N	\N	\N	\N
1543	1	1	327	1	\N	CONSTRUCCIONES CIVILES,METALMECANICAS,ELECTRICAS,REFRIG.,C.A	COCIMERCA	J-30364877-0	20010529000001	2009-01-01	2009-12-31	AV.1 GALPON 2-141 SEC SANTA TERESA			\N		\N		\N		\N	\N	\N	\N
1544	1	1	327	1	\N	OPAL,C.A.		J-07010333-7	20010403000001	2009-01-01	2009-12-31	AV.44 ENTRE CARRETERA N Y CALLE VARGAS DETRAS DE FECSA			\N		\N		\N		\N	\N	\N	\N
1546	1	1	327	1	\N	CONSTRUCTORA LA VILLA C.A.	CONVICA	J-07054092-3	20001020000000	2009-01-01	2009-12-31	AV. 10 C/C AV. 26 LA VILLA			\N		\N		\N		\N	\N	\N	\N
1548	1	1	327	1	\N	LE MIRAGE, C.A.		J-30068483-0	19990317000087	2009-01-01	2009-12-31	CALL2 72,ENTRE AV. 13 Y 13A, C.C. LOS CORALES,LOCAL 07			\N		\N		\N		\N	\N	\N	\N
1550	1	1	327	1	\N	MEGA CONSTRUCCIONES,C.A.		J-30521873-0	20010409000002	2009-01-01	2009-12-31	CALLE 71 N0.28-60 SECTOR SANTA MARIA			\N		\N		\N		\N	\N	\N	\N
1552	1	1	327	1	\N	ACRE INVERSIONES, C.A.		J-30495991-5	20010406000006	2009-01-01	2009-12-31	AV.28 LA LIMPIA N0.14 54 EDIF.RODRIGUEZ BARBOZA PISO 2 OF.7			\N		\N		\N		\N	\N	\N	\N
1554	1	1	327	1	\N	CONTRATISTA VAMALUVT,C.A.	VAMALUVT	J-30617738-8	20010426000001	2009-01-01	2009-12-31	C.RESID.LA PARAGUA EDIF.CUCHIVERO II LOCAL 2A			\N		\N		\N		\N	\N	\N	\N
1556	1	1	327	1	\N	ASCENSORES Y CONSTRUCCIONES ELECTROMECANICAS,S.A.	ASCEMSA	J-30855412-0	20020321000000	2009-01-01	2009-12-31	BARRIO ANDRES E. BLANCO CALLE 99 N0. 98H-140			\N		\N		\N		\N	\N	\N	\N
1557	1	1	327	1	\N	INGENIERIA DE DRENAJE Y CANALIZACIONES,C.A.	INDRECALCA	J-07050198-7	20010129000002	2009-01-01	2009-12-31	CALLE 79 CON AV. 3E NO. 3E-11			\N		\N		\N		\N	\N	\N	\N
1558	1	1	327	1	\N	ROGO CONSTRUCCIONES C.A.	ROGO,C.A.	J-30731880-5	20001204000000	2009-01-01	2009-12-31	AV.16 CARRETERA EL MOJAN AL LADO DE RESID. EL CUJI NO.41-08			\N		\N		\N		\N	\N	\N	\N
1562	1	1	327	1	\N	COOPERATIVA DE SERVICIOS INDUSTRIALES	COODESI	J-30922552-9	20020802000000	2009-01-01	2009-12-31	AV.28 CALLE 85 N0. 28B-72			\N		\N		\N		\N	\N	\N	\N
1563	1	1	327	1	\N	CONSTRUCCIONES CERRO AZUL,C.A.	CONCECA	J-09001899-9	20020723000000	2009-01-01	2009-12-31	CONJ.RESID.EL OLIVAR EDIF.OLIVO I APTO.2B CALLE 75 LA LIMPIA			\N		\N		\N		\N	\N	\N	\N
1564	1	1	327	1	\N	SERVICIOS GENERAL DE ELEVADORES,C.A.	GECSERCA	J-30610231-0	20020918000000	2009-01-01	2009-12-31	URB. URDANETA VEREDA 39 CALLE 07 CASA N0. 02			\N		\N		\N		\N	\N	\N	\N
1566	1	1	327	1	\N	INVERSIONES DELTA, C.A.		J-30531492-6	19990701000000	2009-01-01	2009-12-31	SECTOR MONTE CLARO #.6-66			\N		\N		\N		\N	\N	\N	\N
1567	1	1	327	1	\N	EQUIPOS R.Y.Z., C.A.		J-30227070-7	19990319000088	2009-01-01	2009-12-31	C.77 AV.5 DE JULIO CON AV.9B EDIF.TORRE BUENOS AIRES P.3			\N		\N		\N		\N	\N	\N	\N
1570	1	1	327	1	\N	CONSTRUCTORA MADRIZ MEDINA,C.A.	(M & M),C.A.	J-30500416-1	20020819000000	2009-01-01	2009-12-31	CALLE ECUADOR ENTRE 23 DE ENERO Y GUAICAIPURO,PTO FIJO			\N		\N		\N		\N	\N	\N	\N
1572	1	1	327	1	\N	C.A.LISU	CALISU	J-30248436-7	20000331000000	2009-01-01	2009-12-31	AV.2 #87-97 EDIF. 2001 PISO1 LOCAL1			\N		\N		\N		\N	\N	\N	\N
1574	1	1	327	1	\N	OBIMACA,C.A.		J-30684993-9	20020822000001	2009-01-01	2009-12-31	C.C.BIG LOW CENTER NAVE K,PLANTA ALTA LOCAL 16,CARABOBO			\N		\N		\N		\N	\N	\N	\N
1575	1	1	327	1	\N	CONSORCIO VENEZUELA 2001		J-30181453-3	20020430000000	2009-01-01	2009-12-31	CALLE 69 AV.10A N0.10A-48 SECT.TIERRA NEGRA			\N		\N		\N		\N	\N	\N	\N
1576	1	1	327	1	\N	SERVICIOS DE INGENIERIA PRISMA,C.A.		J-30320163-6	20020924000000	2009-01-01	2009-12-31	URB. LA POMONA CALLE B VEREDA 13 CASA G-7			\N		\N		\N		\N	\N	\N	\N
1577	1	1	327	1	\N	CORPORACION PROYSER,S.A.	PROYSER,S.A.	J-30758578-1	20021128000000	2009-01-01	2009-12-31	CALLE 75 N0. 9-53 EX COLONIA SHELL-SECTOR SANTA RITA			\N		\N		\N		\N	\N	\N	\N
1579	1	1	327	1	\N	CORPORACION 1ANS DE VENEZUELA,C.A.		J-30462563-4	20020930000001	2009-01-01	2009-12-31	CALLE SUAPURE RAMAL 2 EDIF.SAN BERNARDO OFI.82 BELLO MONTE			\N		\N		\N		\N	\N	\N	\N
1580	1	1	327	1	\N	INVERLAGO,C.A.		J-30417605-8	20020924000001	2009-01-01	2009-12-31	AV.VLZA.ENTRE C.5 Y 6 N0.5-11 BARQUISIMETO EDO.LARA			\N		\N		\N		\N	\N	\N	\N
1583	1	1	327	1	\N	CASUCCI CONSTRUTION COMPANY,C.A.	C.C.C.C.A.	J-07047655-9	20021112000000	2009-01-01	2009-12-31	AV.INTERCOMUNAL SECTOR LA VACA ESQ. CON ENTRADA A LA GLP			\N		\N		\N		\N	\N	\N	\N
1584	1	1	327	1	\N	CONSTRUCTORA MENDEZ RINCON,C.A.	MENRICA	J-07045048-7	20021127000000	2009-01-01	2009-12-31	AV.68 CON CALLE 153 ZONA INDUSTRIAL II ETAPA.			\N		\N		\N		\N	\N	\N	\N
1585	1	1	327	1	\N	DISTRIBUIDORA ZUMAQUE,C.A.	DIZUCA	J-30174006-8	20021125000002	2009-01-01	2009-12-31	AV.INTERCOMUNAL COLINA DE BELLO MONTE-CABIMAS			\N		\N		\N		\N	\N	\N	\N
1586	1	1	327	1	\N	CONSTRUCTORA 70-67, COMPAÃ‘IA ANONIMA		J-30727878-1	20001020000001	2009-01-01	2009-12-31	AV.3Y Y 3H CALLE 71 Y 69 SECTOR SAN MARTIN EDIF.ANDREINA P.B.			\N		\N		\N		\N	\N	\N	\N
1587	1	1	327	1	\N	H.F. INGENIERIA,C.A.		J-30275278-7	20001114000001	2009-01-01	2009-12-31	AV.GUAJIRA EDIF.FRIUL P.A.LOCAL 04			\N		\N		\N		\N	\N	\N	\N
1588	1	1	327	1	\N	AMERICAN TECNOLOGIA INVERSIONES,C.A.	ATEINCA	J-30594854-2	20020429000001	2009-01-01	2009-12-31	AV.BELLA VISTA C.83 EDIF.ALFA			\N		\N		\N		\N	\N	\N	\N
1589	1	1	327	1	\N	CONSTRUCTORA HEYRO,C.A.	COHEYROCA	J-30575084-0	20020429000000	2009-01-01	2009-12-31	AV.GUAYANA,SECT. LOS KIOSKOS PARTE BAJA,QTA.NINEMAR,V.51.			\N		\N		\N		\N	\N	\N	\N
1590	1	1	327	1	\N	PROECO, C.A.		J-30421328-0	19990319000048	2009-01-01	2009-12-31	AV.8 STA.RITA C.C. LAS CAROLINAS MEZNINE 8 Y 9			\N		\N		\N		\N	\N	\N	\N
1591	1	1	327	1	\N	KOINONIA, C.A.		J-30590614-9	19990324000051	2009-01-01	2009-12-31	SECTOR CASCO CENTRAL AV.4 LOCAL NO.1 NO.94-55			\N		\N		\N		\N	\N	\N	\N
1592	1	1	327	1	\N	GENERAL TURBINE SYSTEMS DE VENEZUELA,S.A.	GTS,S.A.	J-07028291-6	20020725000000	2009-01-01	2009-12-31	AV.70 C.CALLE 153 EDIF.CORPORACION LINK Z.INDUST.II ETAPA			\N		\N		\N		\N	\N	\N	\N
1593	1	1	327	1	\N	CONSTRUCCIONES SIGMA,S.A.	CONSSA	J-07017386-6	20000427000000	2009-01-01	2009-12-31	AV.PRINCIPAL, ANTIGUAS OFICINAS DEL M.G.O.			\N		\N		\N		\N	\N	\N	\N
1594	1	1	327	1	\N	ZULIA INDUSTRIAL CONSTRUCTIONS,C.A.	ZIC,C.A.	J-07009350-1	20011019000000	2009-01-01	2009-12-31	AV.5 DE JULIO ESQ.AV.17 EDIF.SAN LUIS PISO 3			\N		\N		\N		\N	\N	\N	\N
1595	1	1	327	1	\N	BELLO GONZALEZ,S.A	BEGOSA	J-30746191-8	20010824000000	2009-01-01	2009-12-31	CALLE CHURUGUARA NO.149,SECTOR LA GLORIA			\N		\N		\N		\N	\N	\N	\N
1596	1	1	327	1	\N	INGENIERIA B Y C, C.A.		J-30756226-9	20010410000000	2009-01-01	2009-12-31	CALLE 74 CON ESQ.AV.14 N0.14A-126			\N		\N		\N		\N	\N	\N	\N
1597	1	1	327	1	\N	J&D.C. SPORTS,C.A.		J-30725875-6	20010516000000	2009-01-01	2009-12-31	CALLE 69A ENTRE AV.13 Y 13A N0. 13-68			\N		\N		\N		\N	\N	\N	\N
1598	1	1	327	1	\N	CONSTRUCTORA E INVERSORA GAFF C.A.		J-30662125-3	20000920000000	2009-01-01	2009-12-31	AV. 13A  C.C. CARLINE PH P-A.			\N		\N		\N		\N	\N	\N	\N
1599	1	1	327	1	\N	INVERSIONES L.P., C.A.		J-30095669-5	19990310000032	2009-01-01	2009-12-31	AV.PEDRO LUCAS URRIBARRI NO.14 SECTOR PELE EL OJO,CABIMAS			\N		\N		\N		\N	\N	\N	\N
1600	1	1	327	1	\N	SERVICIOS  DABAJURO,S.A.		J-07009157-6	20020529000000	2009-01-01	2009-12-31	CARRETERA A PAUJIZAL KM.114 DABAJURO EDO.FALCON			\N		\N		\N		\N	\N	\N	\N
1601	1	1	327	1	\N	CONSTRUCCIONES Y PROYECTOS SANTA RITA DE COSCIA,C.A.		J-30380491-8	20010112000000	2009-01-01	2009-12-31	URB. NELSON OCANDO A 2 CUADRAS DEL ESTADIO EL MOJAN			\N		\N		\N		\N	\N	\N	\N
1602	1	1	327	1	\N	CASAL C.A.		J-07019689-0	20000530000000	2009-01-01	2009-12-31	URB. LA ROTARIA CALLE 83 NO. 85-147			\N		\N		\N		\N	\N	\N	\N
1603	1	1	327	1	\N	CONSTRUJOR,C.A.		J-30683958-5	20020621000000	2009-01-01	2009-12-31	RESD.COSTA DEL SOL N0.A-6 LAS CUARENTA CABIMAS			\N		\N		\N		\N	\N	\N	\N
1604	1	1	327	1	\N	CONSTRUCTORA LAS DELICIAS, C.A.		J-30669863-9	20001009000000	2009-01-01	2009-12-31	CALLE SAN BENITO NO. 32 CAJA SECA			\N		\N		\N		\N	\N	\N	\N
1605	1	1	327	1	\N	YOLRUF CONSTRUCCIONES, C.A.	YOLRUFCA	J-30652581-5	20001025000000	2009-01-01	2009-12-31	AV.13 CON CALLE 72 CASA NO. 71-62			\N		\N		\N		\N	\N	\N	\N
1606	1	1	327	1	\N	FETOR, C.A.	FETORCA	J-30444529-6	19990329000053	2009-01-01	2009-12-31	EDIF.ZEA AV.3D NO.76-56 APTO.7-E			\N		\N		\N		\N	\N	\N	\N
1607	1	1	327	1	\N	ESPECIALIDADES INDUSTRIALES ESPINDUCA,C.A.	ESPINDUCA	J-30746963-3	20020425000002	2009-01-01	2009-12-31	CALLE PRINCIPAL CAMPO ELIAS N0.153 ESQ.CALLEJON MARA			\N		\N		\N		\N	\N	\N	\N
1608	1	1	327	1	\N	CONSTRUCTORA ASTRO,C.A.		J-30584722-3	20010920000000	2009-01-01	2009-12-31	CENT.C. FUNG LOCAL NO.4.P.A.ESQ.AV.74 LA LIMPIA			\N		\N		\N		\N	\N	\N	\N
1609	1	1	327	1	\N	CONSTRUCCIONES GILEMI, C.A.	GILEMICA	J-30557569-0	19990310000087	2009-01-01	2009-12-31	SECT.TIERRA NEGRA,C.75CON AV.13 NO.13-64 APT.LOCAL 6			\N		\N		\N		\N	\N	\N	\N
1610	1	1	327	1	\N	ARQUITECTURA Y ARTE COMPAÃ‘IA ANONIMA	ARQUIARTE C.A.	J-302873673	20000104000000	2009-01-01	2009-12-31	C.C. PALAIMA PISO 2 OFICINA 2-6			\N		\N		\N		\N	\N	\N	\N
1611	1	1	327	1	\N	BROIDE D-EMPAIRE Y ASOCIADOS COMPAÃ‘IA ANONIMA	BRODAMCA	J-07016456-5	20001101000000	2009-01-01	2009-12-31	CALLE 67 CON AV. 3F C.C. MAZZEI OFICINA NO. 18			\N		\N		\N		\N	\N	\N	\N
1612	1	1	327	1	\N	CONSTRUCCIONES Y MECANICA,C.A.	CONYMECA	J-07029585-6	20010418000000	2009-01-01	2009-12-31	AV.58 N0.96G-102 CIRCUNV.2			\N		\N		\N		\N	\N	\N	\N
1613	1	1	327	1	\N	INVERSIONES COROMOTO, C.A.		J-07035114-4	19990412000026	2009-01-01	2009-12-31	CALLE 67 CON AV.24 EDIF.QUICHUA II APTO. 2A			\N		\N		\N		\N	\N	\N	\N
1614	1	1	327	1	\N	BURGOS A/A,C.A.		J-30828125-5	20020116000000	2009-01-01	2009-12-31	AV.PADILLA TORRE DEL SALADILLO LOCAL 02			\N		\N		\N		\N	\N	\N	\N
1615	1	1	327	1	\N	CONSTRUCCIONES E INVERSIONES MUÃ‘OZ, C.A.	CONINVIMCA	J-07048953-7	19990329000055	2009-01-01	2009-12-31	CALLE 72 ENTRTE AV.13/113A C.C.LOS CORALES LOCAL NO.7			\N		\N		\N		\N	\N	\N	\N
1616	1	1	327	1	\N	P & C  ASOCIADOS,C.A.		J-30527886-5	19990302000000	2009-01-01	2009-12-31	AV.PRINCIPAL SAN FRANCISCO NO.14-65			\N		\N		\N		\N	\N	\N	\N
1617	1	1	327	1	\N	CONSTRUCCIONES E INSTALACIONES VENEZOLANAS, C.A.	CIVENCA	J-07049534-0	19990312000051	2009-01-01	2009-12-31	AV.15 ENTRE CALLES 89 Y 89B,EDIF.LAS PALMERAS,PISO 2 ,OFIC 2			\N		\N		\N		\N	\N	\N	\N
1618	1	1	327	1	\N	INGENIERIA LUANCO, C.A.		J-09025380-7	19990312000052	2009-01-01	2009-12-31	AV.8 CALLES 77 Y 78 #. 77-29			\N		\N		\N		\N	\N	\N	\N
1619	1	1	327	1	\N	A & P DE OCCIDENTE,C.A.		J-30555752-7	20001208000000	2009-01-01	2009-12-31	BOULEVAR 5 DE JULIO EDIF. LOS MELLIZOS PISO 1 OFICINA 1			\N		\N		\N		\N	\N	\N	\N
1620	1	1	327	1	\N	PROYECTOS  Y CONSTRUCCIONES 2A,C.A.	PROYCON 2A,C.A.	J-30515625-5	20010829000002	2009-01-01	2009-12-31	CALLE 72 ENTRE AV,20 Y 19,EDIF. NOEL,			\N		\N		\N		\N	\N	\N	\N
1622	1	1	327	1	\N	CONSTRUCCIONES INSTALACIONES Y SERVICIOS PUBLICOS,S.A.	CIPSA	J-30744633-1	20010122000004	2009-01-01	2009-12-31	CALLE 67 ENTRE AV. 11 Y 12,EDIF. LEOMARA,LOCAL 04,CECILIO AC			\N		\N		\N		\N	\N	\N	\N
1623	1	1	327	1	\N	NAMAZI & ASOCIADOS,C.A.		J-30130025-4	20001213000001	2009-01-01	2009-12-31	AV.4 BELLA VISTA C.CALLE 65 EDIF.SIGMA 3 PISO OFIC. 3			\N		\N		\N		\N	\N	\N	\N
1624	1	1	327	1	\N	OBRAS DE INGENIERIA DEL LAGO, C.A.	OBRINLAGO, C.A.	J-07029616-0	19990305000048	2009-01-01	2009-12-31	B EL MANZANILLO, AV.28 N0.131-693			\N		\N		\N		\N	\N	\N	\N
1625	1	1	327	1	\N	PROYECTOS,INSPECCIONES Y CONSTRUCCIONES DE INGENIERIA, C.A.	PROINCI, C.A.	J-07020937-2	19990312000048	2009-01-01	2009-12-31	AV.15 C.C.PASEO LAS DELICIAS,TORRE EMPRESARIAL			\N		\N		\N		\N	\N	\N	\N
1626	1	1	327	1	\N	ESTRUCTURA Y VIALIDAD,C.A.	ESTRUVIAL,C.A.	J-30777085-6	20010511000001	2009-01-01	2009-12-31	AV.2 EL MILAGRO C.CALLE 86 EDIF.ANGELICA B LOCAL 06			\N		\N		\N		\N	\N	\N	\N
1627	1	1	327	1	\N	CONSTRUCCIONES MAR S C.A.	CONMAR S C.A.	J-30047078-4	19990308000071	2009-01-01	2009-12-31	AV.29 EDIF.N.76-10 LOCAL NO.01 SECTOR AMPARO			\N		\N		\N		\N	\N	\N	\N
1628	1	1	327	1	\N	MEGA INGENIERIA, C.A.		J-30554870-9	19990701000001	2009-01-01	2009-12-31	CALLE 76 AV.12 EDIF. UPEMA PISO 2 ALA B			\N		\N		\N		\N	\N	\N	\N
1629	1	1	327	1	\N	CONSTRUCCIONES VARELA,C.A.	CONVARCA	J-30416669-9	20011112000001	2009-01-01	2009-12-31	CALLE 148 N0.168 VIA PALITO BLANCO FRENTE A ACERO VENEZOLANO			\N		\N		\N		\N	\N	\N	\N
1630	1	1	327	1	\N	CONSTRUCTORA IMATACA,C.A	IMATACA	J-30965560-4	20030228000000	2009-01-01	2009-12-31	BARRIO LOS ROBLES CALLE 113 N0.63-12			\N		\N		\N		\N	\N	\N	\N
1631	1	1	327	1	\N	DRAGIN,C.A.		J-30451555-3	20030410000000	2009-01-01	2009-12-31	C.PANAMERICANA-VIA SAN CRISTOBAL SECTOR SANTA ISABEL			\N		\N		\N		\N	\N	\N	\N
1632	1	1	327	1	\N	VENEZOLANA DE INGEN.ELECTR.Y MECANICA, C.A.	VIEMCA	J-30003580-8	19990322000016	2009-01-01	2009-12-31	AV.28 LA LIMPIA NO,.3-92			\N		\N		\N		\N	\N	\N	\N
1633	1	1	327	1	\N	VIVIENDAS FAMILIARES,C.A.	VIFACA	J-07037446-2	20030314000000	2009-01-01	2009-12-31	CALLE 73 N0. 16A-64 QUINTA NAQUIN			\N		\N		\N		\N	\N	\N	\N
1634	1	1	327	1	\N	CONSTRUCTORA ARRIETA Y NORIEGA C.A.	ARNOCA	J-07032130-0	20010406000000	2009-01-01	2009-12-31	AV.21A N0. 100-60 SABANETA			\N		\N		\N		\N	\N	\N	\N
1635	1	1	327	1	\N	SERVICIOS PROFESIONALES DE INGENIERIA,C.A.	SEPROIN,C.A.	J-30935341-1	20020917000000	2009-01-01	2009-12-31	AV.3H RESID.REPUBLICA P.B. LOCAL N0. 2			\N		\N		\N		\N	\N	\N	\N
1636	1	1	327	1	\N	IMECAV C.A.		J-07014153-0	20000410000000	2009-01-01	2009-12-31	AVE.INTERCOMUNAL CARRETERA "H" SECTOR EL PRADO.			\N		\N		\N		\N	\N	\N	\N
1637	1	1	327	1	\N	MECANICA-ELECTRICIDAD INSTRUMENTACION,C.A.	M.E.I.C.A.	J-07014133-6	20001124000000	2009-01-01	2009-12-31	AV 10 CALLES 66 Y 66A EDIF.UCHIRE APTO.1-A			\N		\N		\N		\N	\N	\N	\N
1639	1	1	327	1	\N	INGENIERIA FERRER ALCALA,C.A.	INFALCA	J-30198263-0	20010404000000	2009-01-01	2009-12-31	CALLE 71 ENTRE 16A Y 17N0. 16B-29 SECTOR RAFAEL M.BARALT			\N		\N		\N		\N	\N	\N	\N
1640	1	1	327	1	\N	OBRAS MARITIMAS Y CIVILES, C.A.	OMYCCA	J-07001412-1	19990322000003	2009-01-01	2009-12-31	AV.LOS HATICOS ENTRE AVDAS,15/17			\N		\N		\N		\N	\N	\N	\N
1641	1	1	327	1	\N	PROYECTOS,CONSTRUCCION Y MANTENIMIENTO ELECTRICOS Y CIVILES	PROCMECI,C.A.	J-07019874-5	20001026000005	2009-01-01	2009-12-31	CARRETERA K ENTRE AV.42 Y 43 BARRIO PUNTO FIJO.CABIMAS			\N		\N		\N		\N	\N	\N	\N
1642	1	1	327	1	\N	CONSTRUCCIONES Y MANTENIMIENTO PERAZA,C.A.	CONSPER,C.A.	J-07046882-3	20001227000003	2009-01-01	2009-12-31	CALLE 78 DR.PORTILLO CON AV.17 NO.16-61 PISO 5 OFIC.52			\N		\N		\N		\N	\N	\N	\N
1643	1	1	327	1	\N	CONSTRUCCIONES ALZO, C.A.		J-07047920-5	19990324000047	2009-01-01	2009-12-31	CALLE 5 NO.4-251,SAN CARLOS DEL ZULIA LOCAL 1-A			\N		\N		\N		\N	\N	\N	\N
1644	1	1	327	1	\N	CONSTRUCCIONES CONSPERCA, C.A.	CONSPERCA	J-07050452-8	19990322000005	2009-01-01	2009-12-31	CALLE 67 CON AV. 27 EDIF.FINQUITA SECTOR STA.MARIA NO.26-82			\N		\N		\N		\N	\N	\N	\N
1645	1	1	327	1	\N	CONSTRUCTORA ORIZAWA C.A.	CORIZA	J-40249318-8	20001006000000	2009-01-01	2009-12-31	AV.20 ENTRES CALLES 66 Y 67 C.C. CASIQUIARE P.B.LOCAL 06			\N		\N		\N		\N	\N	\N	\N
1646	1	1	327	1	\N	E.F.R., C.A.		J-30215013-2	19990310000027	2009-01-01	2009-12-31	CALLE 71 CON AV.3C NO.3C-86 SECTOR LA LAGO			\N		\N		\N		\N	\N	\N	\N
1647	1	1	327	1	\N	LUFER CONSTRUCCIONES,C.A.	LUFERCA	J-30732689-1	20030506000000	2009-01-01	2009-12-31	CALLE 100 EDIF.ARAGUANEY N0.5 APTO.1-D			\N		\N		\N		\N	\N	\N	\N
1648	1	1	327	1	\N	REALIZACION, INVERSIONES, PROYECTOS Y CONSTRUCCIONES, C.A.	REIMPROCA	J-07028826-4	19991214000003	2009-01-01	2009-12-31	AV.8 SECTOR ZAPARA NO.58-56			\N		\N		\N		\N	\N	\N	\N
1649	1	1	327	1	\N	CONSTRUCTORA R & P, C.A.		J-303596193	19990324000077	2009-01-01	2009-12-31	URB.LA PAZ AV.52 NO.95M-36			\N		\N		\N		\N	\N	\N	\N
1650	1	1	327	1	\N	CONSTRUCCIONES INDUSTRIALES MARACAIBO,C.A.	CONIMARCA	J-30497532-5	20000613000000	2009-01-01	2009-12-31	CALLE 82A N0. 3E-114 SECTOR LA LAGO			\N		\N		\N		\N	\N	\N	\N
1651	1	1	327	1	\N	CONSTRUCCIONES JIMENEZ LUZARDO,C.A.	COJILCA	J-30083865-0	19990318000015	2009-01-01	2009-12-31	AV.10 CALLE 66A NO. 66A-38			\N		\N		\N		\N	\N	\N	\N
1652	1	1	327	1	\N	CORPORACION ZUMAQUE,S.A.		J-30758508-0	20010522000000	2009-01-01	2009-12-31	CARRETERA N SECTOR EL DANTO CIUDAD OJEDA			\N		\N		\N		\N	\N	\N	\N
1653	1	1	327	1	\N	OBRAS CIVILES FERNANDEZ, C.A.	OCIFERCA	J-30585767-9	19990329000038	2009-01-01	2009-12-31	CIRCUNV.NO.3 EL ROSARIO CALLE 97 ENTRE AV.84B Y 85 NO.84B-50			\N		\N		\N		\N	\N	\N	\N
1654	1	1	327	1	\N	CONSTRUCCIONES Y ASFALTO ANDES, C.A.		J-09001504-3	19990707000002	2009-01-01	2009-12-31	CARRETERA PANAMERICANA-CAJA SECA			\N		\N		\N		\N	\N	\N	\N
1655	1	1	327	1	\N	CONINVERCA		J-30015356-8	20010731000001	2009-01-01	2009-12-31	AV.71A N0.79C-17 URB. EL PRADO			\N		\N		\N		\N	\N	\N	\N
1657	1	1	327	1	\N	NAUD INGENIERIA,C.A.		J-30431182-6	20010418000001	2009-01-01	2009-12-31	AV.19 ENTRE CALLES 71 Y 72 RESID.MARTA LOCAL 02			\N		\N		\N		\N	\N	\N	\N
1658	1	1	327	1	\N	CONSTRUCTORA KAROLKA,C.A.		J-30513443-0	20001221000000	2009-01-01	2009-12-31	AV.INDEPENDENCIA SECT.STA.MARIA NO.3 MENE GRANDE			\N		\N		\N		\N	\N	\N	\N
1659	1	1	327	1	\N	CONSTRUCTORA MACBO COMPAÃ‘IA ANONIMA		J-30493341-0	19990929000000	2009-01-01	2009-12-31	AV.68 #65-35.LOS OLIVOS			\N		\N		\N		\N	\N	\N	\N
1660	1	1	327	1	\N	CONSTRUCTORA GORVE,COMPAÃ‘IA ANONIMA	GORVECA	J-30341569-5	19990929000001	2009-01-01	2009-12-31	CIRCUNVALACION #2 C.C.AMPARO LOCAL 1			\N		\N		\N		\N	\N	\N	\N
1661	1	1	327	1	\N	CONSTRUCCIONES R Y P, C.A.	CONREROCA	J-07050136-7	19990428000004	2009-01-01	2009-12-31	SECTOR LA MISION CALLE SAN JOSE #.27			\N		\N		\N		\N	\N	\N	\N
1662	1	1	327	1	\N	CONSTRUCCIONES DAS, C.A.	CODASCA	J-30502523-1	19990302000012	2009-01-01	2009-12-31	AV.16 ESQUINA CALLE 89B CENTRO COMERCIAL DELICIAS II LOCAL 9			\N		\N		\N		\N	\N	\N	\N
1663	1	1	327	1	\N	PROYECTOS Y OBRAS FERNANDEZ,C.A.	PROBAFER,C.A.	J-30504961-0	20010312000002	2009-01-01	2009-12-31	AV.13 SIERRA MAESTRA ENTRE CALLE 20 Y 21 N0. 20-52			\N		\N		\N		\N	\N	\N	\N
1664	1	1	327	1	\N	PERFORACIONES VENEZUELA,C.A.	PERVENCA	J-30014006-7	20030613000000	2009-01-01	2009-12-31	SECTOR JALISCO AV.10 CARRETERA LA ENGRANSONADA CASA S/N			\N		\N		\N		\N	\N	\N	\N
1665	1	1	327	1	\N	OFICINA DE PROYECTOS INTEGRALES,C.A.	OPICA	J-07043090-7	19990614000019	2009-01-01	2009-12-31	AV.4 BELLA VISTA C.C. VILLA INES PISO 3, OFICINAS 34 Y 35			\N		\N		\N		\N	\N	\N	\N
1666	1	1	327	1	\N	JAPREM ZULIA, C.A.		J-07045742-2	19990302000010	2009-01-01	2009-12-31	AV.29 NO.39-40 SECTOR CUJICITO DETRAS COL.OLGA M.ABREU			\N		\N		\N		\N	\N	\N	\N
1667	1	1	327	1	\N	IMOSA TUBOACERO FABRICACION,C.A.		J-30475155-9	20010504000001	2009-01-01	2009-12-31	AV.FRANCISCO DE MIRANDA LOS PALOS GRANDES,CARACAS			\N		\N		\N		\N	\N	\N	\N
1668	1	1	327	1	\N	PROYECTOS,CONSTRUCCIONES Y NEGOCIOS,S.A.	PROYCONSA	J-30058052-0	20001102000004	2009-01-01	2009-12-31	CALLE 71 AV,3H Y 3Y N  3H- 44 SECTOR BELLAS ARTES			\N		\N		\N		\N	\N	\N	\N
1669	1	1	327	1	\N	CONSTRUCTORA VALLES,C.A.	CONVALLES	J-07021011-7	20001116000000	2009-01-01	2009-12-31	CIRCUNVALACION 2 AV.58 NO. 96J-77			\N		\N		\N		\N	\N	\N	\N
1670	1	1	327	1	\N	GUEDEZ MATA DESARROLLOS, COMPAÃ‘IA ANONIMA	G.M. DESARROLLOS	J-30545969-0	20000926000000	2009-01-01	2009-12-31	AV. BELLA VISTA NO.60-91,LOCAL GM.			\N		\N		\N		\N	\N	\N	\N
1671	1	1	327	1	\N	3JR INGENIERIA Y CONSTRUCCIONES C.A.		J-30722284-0	20001017000002	2009-01-01	2009-12-31	AV.6 N0.57-32 EDIF.TATAYITO PB APTO.1-A URB. ZAPARA 2			\N		\N		\N		\N	\N	\N	\N
1672	1	1	327	1	\N	INGENIERIA DE CONTROL, C.A.	INTROL,C.A.	J-30488509-1	19990319000022	2009-01-01	2009-12-31	AV.12 CALLE 63 N0.63-35 URB.MARACAIBO			\N		\N		\N		\N	\N	\N	\N
1673	1	1	327	1	\N	CONSTRUCCIONES LA NUEVA CHINITA COMPAÃ‘IA ANONIMA		J-30497524-4	19990924000000	2009-01-01	2009-12-31	GALPON AV.7 ENTR.25 Y 26 #.25-62			\N		\N		\N		\N	\N	\N	\N
1674	1	1	327	1	\N	CONSTRUCCIONES, INFRAESTRUCTURA Y SERVICIOS AMBIENTALES C.A.	COINSA	J-30669510-9	20000224000000	2009-01-01	2009-12-31	AV.3F C.CALLE 58A SECTOR LAS MERCEDES EDIF.CLARISA LOCAL 4			\N		\N		\N		\N	\N	\N	\N
1675	1	1	327	1	\N	INVERSIONES Y CONSTRUCCIONES URDANETA VILLAFAÃ‘E, C.A.	INCURVI, C.A.	J-09026436-1	19990319000069	2009-01-01	2009-12-31	KM 7 CARRETERA STA.BARBARA LAS GAVIOTAS AV. 15 DELICIAS			\N		\N		\N		\N	\N	\N	\N
1676	1	1	327	1	\N	SERVICIOS RAMSAN,C.A.		J-30575621-0	20010920000002	2009-01-01	2009-12-31	AV.MILAGRO,RESID. PREMIUM,EDIF.1, PISO 09,APART. 9B			\N		\N		\N		\N	\N	\N	\N
1677	1	1	327	1	\N	CONSTRUCTORA PROSPERIDAD,C.A.	COPROS,C.A.	J-30470942-0	20010205000001	2009-01-01	2009-12-31	KM.4 1/2 CARRETERA SANTA BARBARA EL VIGIA URB. PARQUE SOL CASA # 48			\N		\N		\N		\N	\N	\N	\N
1678	1	1	327	1	\N	SERVICIOS Y TRANSPORTE LUCCHI,C.A.	SERTRALUCCHI,C.A.	J-30249681-0	20021022000001	2009-01-01	2009-12-31	CAMPO JUNIN,BACHAQUERO			\N		\N		\N		\N	\N	\N	\N
1679	1	1	327	1	\N	SEMAFOROS DE VENEZUELA.C.A.	SEMAVENCA	J-09009714-7	20010309000000	2009-01-01	2009-12-31	CALLE 70 ENTRE AVES.14A Y 15			\N		\N		\N		\N	\N	\N	\N
1680	1	1	327	1	\N	CONSTRUCCION VHL,C.A. NO SE PUEDE HACER  SOLVENCIA	VHLCA	J-30936117-1	20030224000000	2009-01-01	2009-12-31	URB.LA TRINIDAD C.C. LA TRINIDAD LOCAL 18			\N		\N		\N		\N	\N	\N	\N
1681	1	1	327	1	\N	CONSTRUCTORA ZODIACO,C.A.	CONZO,C.A.	J-07049940-0	20001128000001	2009-01-01	2009-12-31	EDIF.PIACOA AV.20 PISO 2 ENTRE CALLE 69 Y 69A			\N		\N		\N		\N	\N	\N	\N
1682	1	1	327	1	\N	ACOND.MANTENIMIENTO PETROLERO Y SERVICIOS AFINES,C.A.	AMPSA,C.A.	J-07016289-9	20030612000001	2009-01-01	2009-12-31	AV.5 C.C.18B N0.18B-75 SAN FRANCISCO			\N		\N		\N		\N	\N	\N	\N
1683	1	1	327	1	\N	MONTAJE ELECTRICO DE EDIFICIOS C.A	MEECA	J-07041948-2	19991103000001	2009-01-01	2009-12-31	CALLE 73 #.16A-64 LAS DELICIAS			\N		\N		\N		\N	\N	\N	\N
1684	1	1	327	1	\N	CONSTRUCTORA KAEX,C.A.		J-30874706-8	20030930000000	2009-01-01	2009-12-31	CALLE 42 NO.15J-55 URB.CANAIMA			\N		\N		\N		\N	\N	\N	\N
1685	1	1	327	1	\N	TERMOPLASTICA DE OCCIDENTE C.A.	TERMOCCIDENTE C.A.	J-305826331	20001030000001	2009-01-01	2009-12-31	BARRIO LOS CORTIJOS CALLE 216 CON AV. 49I			\N		\N		\N		\N	\N	\N	\N
1686	1	1	327	1	\N	E.C. CONSTRUCCIONES,S.A.	ECONSA	J-30432619-0	20010330000002	2009-01-01	2009-12-31	AV.78 AL LADO DE LA FLORISTERIA ANGELA			\N		\N		\N		\N	\N	\N	\N
1687	1	1	327	1	\N	CONSTRUCCIONES LAGIOIA, C.A.	CONGIOCA	J-30357254-5	19991210000001	2009-01-01	2009-12-31	CALLE 100 SABANETA NO. 22B-53			\N		\N		\N		\N	\N	\N	\N
1688	1	1	327	1	\N	CONSTRUCCIONES VILLALOBOS GARCIA, C.A.	COVIGARCA	J-07038395-0	19990310000095	2009-01-01	2009-12-31	URB.MONTE BELLO CALLE M CON AV.13 NO.12-80			\N		\N		\N		\N	\N	\N	\N
1690	1	1	327	1	\N	CONSTRUCCIONES E INSPECCIONES VENEZUELA C.A.	COINVECA	J-30070985-0	20000517000000	2009-01-01	2009-12-31	CALLE 75 ESQ.AV.3G EDIF.LUNA PLANTA BAJA SECTOR LA LAGO			\N		\N		\N		\N	\N	\N	\N
1692	1	1	327	1	\N	TECNOLOGIA Y CONSTRUCCION DE OCCIDENTE,S.A.	TECOSA	J-30418944-3	20020809000000	2009-01-01	2009-12-31	URB.CIUDADELA FARIA VCALLE 65 N0. 71A-26			\N		\N		\N		\N	\N	\N	\N
1693	1	1	327	1	\N	CONSTRUCTORA CATATUMBO, S.A.		J-07012132-7	19990304000017	2009-01-01	2009-12-31	CALLE 92 N0. 82A-47			\N		\N		\N		\N	\N	\N	\N
1694	1	1	327	1	\N	INVERSIONES Y CONSTRUCCIONES AMAZONA, C.A.		J-07049716-5	19990315000069	2009-01-01	2009-12-31	EDIFICIO BELINI,AV.15 C/C 74 PISO 2 OFIC.02			\N		\N		\N		\N	\N	\N	\N
1695	1	1	327	1	\N	COSTA BOLIVAR CONSTRUCCIONES, C.A.	C.B.C.	J-07012092-4	19990315000084	2009-01-01	2009-12-31	AV.PRINCIPAL CON CALLE VENEZUELA			\N		\N		\N		\N	\N	\N	\N
1696	1	1	327	1	\N	CONSTRUCCIONES REYES MARTINEZ DEL ZULIA,C.A.	CREMAZUCA	J-30632225-6	19990916000001	2009-01-01	2009-12-31	AV.VIA BOBURES 2DA.C/LA CONQUISTA #10-906,CAJA SECA			\N		\N		\N		\N	\N	\N	\N
1697	1	1	327	1	\N	CONSTRUCCIONES Y SERVICIOS LA TORRE,C.A.	CYSLATO,C.A.	J-07032806-1	20010813000001	2009-01-01	2009-12-31	MENE GRANDE SECTOR SANTA MARIA QUINTA MARIELIANA			\N		\N		\N		\N	\N	\N	\N
1698	1	1	327	1	\N	CASTEBAR, C.A.		J-30735799-1	20001102000003	2009-01-01	2009-12-31	CALLEJK URB.MONTE BELLO CASA NO.11-58			\N		\N		\N		\N	\N	\N	\N
1699	1	1	327	1	\N	INGENIERIA COSTA ORIENTAL DEL LAGO,C.A.	INGECOL,C.A.	J-30418444-1	20011220000000	2009-01-01	2009-12-31	CARRETERA L ENTRE AV.31 Y 32 EDIF.VILLA SAN JOSE N0. 06			\N		\N		\N		\N	\N	\N	\N
1700	1	1	327	1	\N	PROYECTOS, VIALIDAD, CONSTRUCCION Y ASFALTADO, C.A.	PROVIACA, C.A.	J-07029765-4	19990310000042	2009-01-01	2009-12-31	AV.25 NO.65 SECTOR SANTA MARIA			\N		\N		\N		\N	\N	\N	\N
1701	1	1	327	1	\N	SERVICIOS TECNICOS INTEGRALES C.A	SETINCA	J-07034388-5	19990629000001	2009-01-01	2009-12-31	C.C. CALLE 66 PTA ALTA LOCAL 4 FRENTE A LA PLAZA INDIO MARA			\N		\N		\N		\N	\N	\N	\N
1702	1	1	327	1	\N	OBRAS CIVILES Y MECANICAS, C.A.	OCYMCA	J-30318066-3	19990319000082	2009-01-01	2009-12-31	CALLE 72 CON AV.4 Y 8 C.C. CLODOMIRA P.2 OFI.305			\N		\N		\N		\N	\N	\N	\N
1703	1	1	327	1	\N	OBRAS DE INGENIERIA HS, C.A.	OIN, HS, C.A.	J-30430915-5	19990320000038	2009-01-01	2009-12-31	CALLE 90 ESQ. AV.16A, N. 16-74			\N		\N		\N		\N	\N	\N	\N
1704	1	1	327	1	\N	ELECTROTECNICA SAQUI,C.A.		J-00091377-3	20030131000001	2009-01-01	2009-12-31	CALLE 74 C.C.14 N0.74-15			\N		\N		\N		\N	\N	\N	\N
1705	1	1	327	1	\N	CONSTRUCCIONES,INSPECCIONES,Y PROYECTOS, C.A.	CIYPROCA	J-30587542-1	19990412000007	2009-01-01	2009-12-31	CALLE 216A N0. 49I-48			\N		\N		\N		\N	\N	\N	\N
1706	1	1	327	1	\N	DISEÃ‘OS, PROYECTOS Y CONST.PIRELA, C.A.	DIPROCA	J-07028505-5	19990324000060	2009-01-01	2009-12-31	CALLE 96 NO.15A-119 SECTOR EL TRANSITO			\N		\N		\N		\N	\N	\N	\N
1707	1	1	327	1	\N	CONSTRUCCIONES Y SERVICIOS DEL NORTE,C.A.	CONSTRUNORTE,C.A.	J-30343290-5	20010308000002	2009-01-01	2009-12-31	AV.DELICIAS C.C.DEL SAVIO N0. 55-243N P.B. LOCAL 1-A			\N		\N		\N		\N	\N	\N	\N
1708	1	1	327	1	\N	SOLER FERNANDO,C.A.	SOFECA	J-30354503-3	20021015000000	2009-01-01	2009-12-31	AV. GUAJIRA 16-A N0.61-87			\N		\N		\N		\N	\N	\N	\N
1709	1	1	327	1	\N	CORPORACION G & D, C.A.		J-30181453-3	19990305000053	2009-01-01	2009-12-31	CALLE 69 CON AV. 10A #.10A-48 SECTOR TIERRA NEGRA			\N		\N		\N		\N	\N	\N	\N
1710	1	1	327	1	\N	INVERSIONES Y CONSTRUCCIONES CDF 2193, C.A.		J-30198689-0	19990416000037	2009-01-01	2009-12-31	AV.9 N. F-36 URB. IRAMA			\N		\N		\N		\N	\N	\N	\N
1711	1	1	327	1	\N	D.I.T. PROYECTOS Y CONSTRUCCIONES, C.A.		J-30198690-3	19990412000029	2009-01-01	2009-12-31	SECTOR LAS TUNAS CALLE 80 CON AV.78			\N		\N		\N		\N	\N	\N	\N
1712	1	1	327	1	\N	GRUPO VENEZOLANO DE CONSTRUCCION C.A.	GRUVECO	J-30061694-0	20001019000002	2009-01-01	2009-12-31	AV.16 ESQ.CALLE 89-B C.C. DELICIAS II LOCAL 05			\N		\N		\N		\N	\N	\N	\N
1713	1	1	327	1	\N	INVERSIONES TAUROS,C.A.	INTAUCA	J-30789150-5	20010511000002	2009-01-01	2009-12-31	AV.9 Y 10 MONTE BELLO CASA N0.10-61			\N		\N		\N		\N	\N	\N	\N
1714	1	1	327	1	\N	PLAZAS Y PARQUES, C.A.		J-30518181-0	19990319000021	2009-01-01	2009-12-31	CALLE 90 NO.7A-24 DETRAS DEL HPTAL. DE NIÃ‘OS SECTOR VERITAS			\N		\N		\N		\N	\N	\N	\N
1715	1	1	327	1	\N	INVERSORA JARAMILLO,C.A.	INJACA	J-30631184-0	20011023000002	2009-01-01	2009-12-31	URB.MONTE BELLO CALLE J N0.9-32			\N		\N		\N		\N	\N	\N	\N
1716	1	1	327	1	\N	MANTENIMIENTO, NEGOCIO Y VAPOR C.A.	MANEVA	J-07031806-6	19990304000021	2009-01-01	2009-12-31	CALLE 77 ESQ.AV.18 EDIF.IMAR PISO 3 OFICINA 9			\N		\N		\N		\N	\N	\N	\N
1717	1	1	327	1	\N	DESARROLLOS,INVERSIONES Y SERVICIOS, C.A.	DISCA	J-30587742-4	19990329000043	2009-01-01	2009-12-31	CALLE 86 A/AV.2 EL MILAGRO EDIF.ANGELICA B LOCAL NO.6			\N		\N		\N		\N	\N	\N	\N
1718	1	1	327	1	\N	CONSTRUCCIONES O.M. COMPAÃ‘IA ANONIMA	OMCA	J-30318620-3	20001017000000	2009-01-01	2009-12-31	AV.24 CALLE 70 C.C. PALMIRA LOCAL 06			\N		\N		\N		\N	\N	\N	\N
1719	1	1	327	1	\N	CONTRATISTA DE SERVICOS MARACAIBO,C.A.	CONSERMARCA	J-07044402-9	20010122000002	2009-01-01	2009-12-31	PLAZA BARALT AV.06 EDIF.SAN FRANCISCO LOCAL 1-D			\N		\N		\N		\N	\N	\N	\N
1720	1	1	327	1	\N	INVERSIONES CATIRE, S.A.	INCASA	J-30058255-8	20000808000000	2009-01-01	2009-12-31	CALLE 93 PADILLA ENTRE AVES.9 Y 10 EDIF.RAFAEL URDANETA			\N		\N		\N		\N	\N	\N	\N
1721	1	1	327	1	\N	CONSTRUCCIONES E INVERSIONES TINAJAS C.A.	CITICA	J-07052754-4	20001002000000	2009-01-01	2009-12-31	URB.RAUL LEONI BLOQUE 31 APTO.01-05 I ETAPA			\N		\N		\N		\N	\N	\N	\N
1722	1	1	327	1	\N	PLANIFICACION Y ORG.DE TELEFONOS,ELECTRICIDAD Y CONST.ASOC.	PLOTECA, C.A.	J-07014686-9	19990319000034	2009-01-01	2009-12-31	AV.UNION URB.LA ALAMBRA N0.8A-23			\N		\N		\N		\N	\N	\N	\N
1691	1	1	327	1	\N	SIEMENS,S.A.		J-00034354-3	20010427000001	2009-01-01	2009-12-31	AV.17 N0.112-224 LOS HATICOS			\N		\N		\N		\N	\N	\N	\N
1723	1	1	327	1	\N	MADEIRA CONSTRUCCIONES,C.A.	MADECON	J-30777081-3	20010330000001	2009-01-01	2009-12-31	AV.60 URB. SAN MIGUEL CASA N0. 96B-31			\N		\N		\N		\N	\N	\N	\N
1724	1	1	327	1	\N	CONSTRUCTORA ESFERA,C.A.		J-30040065-4	20001117000000	2009-01-01	2009-12-31	URB.JUANA DE AVILA CALLE 66 AV.16 Y 16A QUINTA NO.15D-42			\N		\N		\N		\N	\N	\N	\N
1725	1	1	327	1	\N	MANTENIMIENTO VIAL 252,C.A.		J-30172194-2	20010525000002	2009-01-01	2009-12-31	CALLE MARIÃ‘O NORTE C/CARRETERA NNAL CAGUA,ESTADO ARAGUA			\N		\N		\N		\N	\N	\N	\N
1726	1	1	327	1	\N	LM INGENIERIA C.A. CONSTRUCCIONES		J-30331162-8	19990610000007	2009-01-01	2009-12-31	AV 20 C/72 CC MONTIELCO PISO 7 OFIC. #.4			\N		\N		\N		\N	\N	\N	\N
1727	1	1	327	1	\N	INVERSIONES EL LUCERO,C.A.	INVERLUCA	J-30698669-3	20010308000001	2009-01-01	2009-12-31	CALLE PANAMA ENTRE A.V.31Y32 SECTOR EL LUCERO			\N		\N		\N		\N	\N	\N	\N
1728	1	1	327	1	\N	AVO PROYECTOS Y CONSTRUCCIONES COMPAÃ‘IA ANONIMA		J-30587959-1	19991103000002	2009-01-01	2009-12-31	AVE-8 # 58-56 SECTOR ZAPARA			\N		\N		\N		\N	\N	\N	\N
1729	1	1	327	1	\N	CONSTRUCTORA RINYBOL, C.A.		J-30441817-5	19990329000065	2009-01-01	2009-12-31	AV.4 NO.94-55 CLINICA OBISPO.LAZO			\N		\N		\N		\N	\N	\N	\N
1730	1	1	327	1	\N	PROYECTOS CARIBE VENEZOLANOS, C.A.	PROCAVEN, C.A.	J-07047552Z-9	19990324000065	2009-01-01	2009-12-31	AV.16 ENTRE 96/86			\N		\N		\N		\N	\N	\N	\N
1731	1	1	327	1	\N	SERVICIOS DE INGENIERIA INDUSTRIAL,C.A.	SICA	J-07012937-9	20001213000000	2009-01-01	2009-12-31	CALLE 149 NO. 67A-149 ZONA INDUSTRIAL SEGUNDA ETAPA			\N		\N		\N		\N	\N	\N	\N
1732	1	1	327	1	\N	CONSTRUCTORA LOS BUCARES,C.A.		J-07031795-7	19990416000050	2009-01-01	2009-12-31	VIA PLANTA DEL INOS SECTOR EL ROSARIO			\N		\N		\N		\N	\N	\N	\N
1733	1	1	327	1	\N	CONSTRUCTORA COSTA DEL ZULIA,C.A.		J-30765230-6	20020801000001	2009-01-01	2009-12-31	CALLE 92A LAS LOMAS N0. 70B-213			\N		\N		\N		\N	\N	\N	\N
1734	1	1	327	1	\N	CONTERCA		J-30001718-4	20010123000001	2009-01-01	2009-12-31	AV.8 N0. 82D-85 RESD.SANTA RITA OFIC.2			\N		\N		\N		\N	\N	\N	\N
1735	1	1	327	1	\N	CONSTRUCCIONES FRANCO GONZALEZ, C.A.	CONFRAGONCA	J-30075818-4	19990324000046	2009-01-01	2009-12-31	AV.UNIVERSIDAD C.C.OQUENDO OFICINA 3			\N		\N		\N		\N	\N	\N	\N
1736	1	1	327	1	\N	INGENIERIA,SERVICIOS Y MANTENIMIENTO TACOA MIQUELENA,,C.A.	INSERMA,C.A.	J-30879136-9	20020819000001	2009-01-01	2009-12-31	CALLE 62 NO. 15-35, SECTOR LAS TARABAS			\N		\N		\N		\N	\N	\N	\N
1737	1	1	327	1	\N	HERMANOS PIETRALUNGA, S.A.		J-07001511-0	19990329000052	2009-01-01	2009-12-31	AV.INTERCOMUNAL NO.191 CABIMAS			\N		\N		\N		\N	\N	\N	\N
1738	1	1	327	1	\N	F & L PROYECTOS Y CONSTRUCCIONES, COMPAÃ‘IA ANONIMA		J-07040321-7	19990708000004	2009-01-01	2009-12-31	AV.4 BELLA VISTA C.CALLE 67 C.ACOSTA EDF.GRAL DE SEGUROS			\N		\N		\N		\N	\N	\N	\N
1739	1	1	327	1	\N	CONSTRUCTORA CAME,C.A.		J-30234656-8	20011022000002	2009-01-01	2009-12-31	AV.3 INDEPENDENCIA C.C. GALERIAS LOCAL 2-B P.A.			\N		\N		\N		\N	\N	\N	\N
1740	1	1	327	1	\N	TUBOACERO,C.A.	TUBOACERO,C.A.	J-08507117-2	20010306000002	2009-01-01	2009-12-31	PAL.LA ROSA VIEJA			\N		\N		\N		\N	\N	\N	\N
1741	1	1	327	1	\N	GERENCIA DE INGENIERIA A Y C,C.A.		J-30611708-3	20020926000001	2009-01-01	2009-12-31	C.C.SALTO ANGEL NIVEL 2 OFIC.3 AV.3Y SAN MARTIN C.76 Y 77			\N		\N		\N		\N	\N	\N	\N
1742	1	1	327	1	\N	CONSTRUCTORA JEROGA, C.A.		J-07008965-2	19990416000046	2009-01-01	2009-12-31	AV.66 NO. 146-30			\N		\N		\N		\N	\N	\N	\N
1743	1	1	327	1	\N	CONSTRUCCIONES Y PINTURA CONSTRUPINTU, C.A.	CONSTRUPINTU,C.A.	J-3044350-1	19990308000063	2009-01-01	2009-12-31	URB.LA ROSALEDA CALLE 80E NÂº 82A-45			\N		\N		\N		\N	\N	\N	\N
1744	1	1	327	1	\N	CONSTRUCTORA RECUCIPROCA,C.A.		J-30448374-0	20000313000001	2009-01-01	2009-12-31	AV.6 C.CALLE 98 DIAGONAL AL CONVENTO EDIF.SAN FRANCISCO			\N		\N		\N		\N	\N	\N	\N
1745	1	1	327	1	\N	CONSTRUCTORA ORECAR,C.A.		J-30531963-4	20010126000001	2009-01-01	2009-12-31	PROLONG.CIRCUNV.2 C.C. LA PARAGUA LOCAL 32			\N		\N		\N		\N	\N	\N	\N
1746	1	1	327	1	\N	INVERSIONES EN CONSTRUCCIONES Y COMERCIO A & C, C.A.	INCONACA, C.A.	J-30411267-0	19990603000002	2009-01-01	2009-12-31	C.C. 5 DE JULIO OFICINA 8B PISO 2 AV 5 DE JULIO			\N		\N		\N		\N	\N	\N	\N
1747	1	1	327	1	\N	SUMINISTROS Y SERVICIOS,C.A.	S Y S,C.A.	J-30894959-0	20030313000000	2009-01-01	2009-12-31	LA COROMOTO CALLE 165 EDIF.FLOR DE COROMOTO APTO.1-A			\N		\N		\N		\N	\N	\N	\N
1751	1	1	327	1	\N	CONSTRUCTORA VALLE BLANCO,C.A.		J-30179494-0	20011011000000	2009-01-01	2009-12-31	C.C.LOS PUENTES II ETAPA PISO 3 LOCAL 4			\N		\N		\N		\N	\N	\N	\N
1754	1	1	327	1	\N	CONSTRUCCIONES LUMAR,C.A.		J-31043236-8	20031020000001	2009-01-01	2009-12-31	CALLE PANAMA ENTRE AV.31 Y 32			\N		\N		\N		\N	\N	\N	\N
1755	1	1	327	1	\N	PROYECTOS,OBRAS Y SERVICIOS INDUSTRIALES,C.A.	PROSERVICA	J-31042630-9	20031021000001	2009-01-01	2009-12-31	URB.TAMARE CASA # 33			\N		\N		\N		\N	\N	\N	\N
1756	1	1	327	1	\N	COMERCIALIZADORA DE CONCRETO Y AGREGADOS,S.A.	CONCRESA	J-30843452-3	20031021000002	2009-01-01	2009-12-31	CALLE 36 B SAN JACINTO			\N		\N		\N		\N	\N	\N	\N
1757	1	1	327	1	\N	T & T INGENIERIA,C.A.		J-30509288-5	20031021000003	2009-01-01	2009-12-31	URB.BUENA VISTA CALLE # 6			\N		\N		\N		\N	\N	\N	\N
1758	1	1	327	1	\N	CONSTRUCCIONES S.P.V.,C.A.		J-00180480-3	20031021000004	2009-01-01	2009-12-31	AV.20 ENTRE C. 68Y69 C.C. LAS TEJAS LOCAL1-4			\N		\N		\N		\N	\N	\N	\N
1759	1	1	327	1	\N	B.M. CONSTRUCTORA C.A.	B.M,C.A.	J-07028682-2	20031023000001	2009-01-01	2009-12-31	A.V. 31 # 238 EDIF. BMCA			\N		\N		\N		\N	\N	\N	\N
1760	1	1	327	1	\N	VENEZOLANA DE INGENIERIA Y CONSTRUCCION,C.A.	VINCO	J-31021793-9	20031027000001	2009-01-01	2009-12-31	A.V. 16 C.C. 89A C.C.DELICIAS 2 LOCAL #5			\N		\N		\N		\N	\N	\N	\N
1761	1	1	327	1	\N	INGENIERIA, PRODUCTOS Y SERVICIOS,C.A.	I.P.S.	J-30999975-3	20031029000001	2009-01-01	2009-12-31	CALLE 100 CONJ. RESD. EL VARILLAL			\N		\N		\N		\N	\N	\N	\N
1762	1	1	327	1	\N	CONSTRUCCIONES CIVILES Y PROYECTOS AMBIENTALES	CONCIPA	J-30810854-5	20031029000002	2009-01-01	2009-12-31	HDA. LOS NARANJOS KM. 16			\N		\N		\N		\N	\N	\N	\N
1763	1	1	327	1	\N	MANTENIMIENTO Y SERVICIOS EN GENERAL MAGMARI,C.A.	MAGMARI,C.A.	J-30993151-2	20031030000001	2009-01-01	2009-12-31	CALLE 63B C. AV. 95C			\N		\N		\N		\N	\N	\N	\N
1764	1	1	327	1	\N	CONSTRUCTORA BRACHO,C.A.	CONSBRACA	J-07019788-9	20031030000002	2009-01-01	2009-12-31	CALLE3Âª, #10-72,BARRIO SAN RAFAEL			\N		\N		\N		\N	\N	\N	\N
1765	1	1	327	1	\N	BERAGUI VILLAN. INGENIERIA Y CONSTRUCCION,C.A.	BERVICCA	J-30563350-9	20031030000003	2009-01-01	2009-12-31	CALLE 7 I. #2D-126			\N		\N		\N		\N	\N	\N	\N
1766	1	1	327	1	\N	SEWER WORLD SERVICES,C.A.	SEWOCA	J-30873941-3	20031031000001	2009-01-01	2009-12-31	AV. 3E C/C 76 EDIF. ALEJANDRA PAOLA APTO. 13			\N		\N		\N		\N	\N	\N	\N
1767	1	1	327	1	\N	COSTA ATLANTIC INGENIERIA,C.A.		J-31000290-8	20031031000002	2009-01-01	2009-12-31	A.V. 13A C/C 75 C.C EL BAUL DE LA ABUELA			\N		\N		\N		\N	\N	\N	\N
1769	1	1	327	1	\N	SOLDADURA MIGUEL CORDERO,C.A.	SOLMICO	J-07028688-1	19990312000054	2009-01-01	2009-12-31	A.V 72 ESQUINA  CALLE PP			\N		\N		\N		\N	\N	\N	\N
1770	1	1	327	1	\N	INSPECCIONES Y CONSTRUCCIONES ZULIANAS,C.A.	INCOZUCA	J-30827960-9	20011023000000	2009-01-01	2009-12-31	AV.72 RES. VILLA OLIVAR EDIF. 4 APT.1A			\N		\N		\N		\N	\N	\N	\N
1771	1	1	327	1	\N	INVERSORA Y CONSTRUTORA DEL ZULIA,C.A.	INCOZUCA	J-070354186	19991223000003	2009-01-01	2009-12-31	CALLE 56 #15Q-10			\N		\N		\N		\N	\N	\N	\N
1772	1	1	327	1	\N	TRAFFIC VIAL, C.A.	TRAVICA	J-30446022-8	20031110000004	2009-01-01	2009-12-31	CALLE 70 ENTRE AVDAS. 14A Y 15			\N		\N		\N		\N	\N	\N	\N
1773	1	1	327	1	\N	CONSTRUCTORA CANADA,C.A.		J-31032930-3	20031112000001	2009-01-01	2009-12-31	A.V 2 C.C. CARIBE CASA #81-12			\N		\N		\N		\N	\N	\N	\N
1774	1	1	327	1	\N	MAYOR,C.A.		J-31011831-0	20031119000001	2009-01-01	2009-12-31	SANTA ELENA DE ARENALES CALLE 3 # 2-5			\N		\N		\N		\N	\N	\N	\N
1775	1	1	327	1	\N	CONSTRUCTORA BOSQUE VERDE,C.A.		J-31020335-0	20031120000001	2009-01-01	2009-12-31	CALLE 84A # 85-93			\N		\N		\N		\N	\N	\N	\N
1776	1	1	327	1	\N	ING. NOE CARRASQUERO GONZALES		V-01659916-2	20010207000000	2009-01-01	2009-12-31	CALLE 69# 15-75 EDIF.EDIMAR.APTO.4-B			\N		\N		\N		\N	\N	\N	\N
1777	1	1	327	1	\N	PROYECTOS Y PAISAJISMOS,C.A.		J-30442168-0	20031121000002	2009-01-01	2009-12-31	A.V.117-A VIA PLANTA C DE HIDROLAGO			\N		\N		\N		\N	\N	\N	\N
1778	1	1	327	1	\N	CONSTRUCTORA PETRO AGRO,C.A.		J-30584951-0	20010329000004	2009-01-01	2009-12-31	URB.RAFAEL ALBARADO # 03 CASA #63-09			\N		\N		\N		\N	\N	\N	\N
1779	1	1	327	1	\N	CARPINTERIA LOREND,C.A.		J-07044531-9	20031125000001	2009-01-01	2009-12-31	.AV ROOSELVELT #348 BARRIO RAFAEL URDANETA			\N		\N		\N		\N	\N	\N	\N
1780	1	1	327	1	\N	INVERSIONES MATAPALO,C.A.		J-30950040-6	20031202000001	2009-01-01	2009-12-31	AV.2A CASA #71-146			\N		\N		\N		\N	\N	\N	\N
1781	1	1	327	1	\N	DISTRIBUIDORA BRACHO VILLALOBOS,C.A.	DISBRAVICA	J-30594540-3	20031202000002	2009-01-01	2009-12-31	CALLE 96A GALPON # 19-55			\N		\N		\N		\N	\N	\N	\N
1782	1	1	327	1	\N	CONSTRUCCIONES BARBOZA & BARBOZA,C.A.		J-30022138-5	20031204000001	2009-01-01	2009-12-31	CALLE 84 AV.3E EDIF.COMUNIMAR P.B.			\N		\N		\N		\N	\N	\N	\N
1783	1	1	327	1	\N	NELLY HERNANDEZ REPRESENTACIONES,C.A.	N.H.REPRESENTACIONES,C.A.	J-30341563-6	20031210000001	2009-01-01	2009-12-31	CALLE 72 ESQ.CALLE 77 C.C.TAMACUARY LOCAL16 P.A.			\N		\N		\N		\N	\N	\N	\N
1785	1	1	327	1	\N	CONSTRUCTORA TERRAPLEN,C.A.		J-00132632-4	20031211000001	2009-01-01	2009-12-31	URB. EL CAUJARO KM.11 VIA A PERIJA CALLE 49H			\N		\N		\N		\N	\N	\N	\N
1786	1	1	327	1	\N	GLOBAL TECHNOLOGY,C.A.	GLOBAL TECH,C.A.	J-30494625-2	20031211000002	2009-01-01	2009-12-31	AV.3C CON CALLE 67 UNICENTRO VIRGINIA PISO 2 OFICINA 18			\N		\N		\N		\N	\N	\N	\N
1787	1	1	327	1	\N	BRACHO,HERNANDEZ Y GARZON INVERSIONES,C.A.	INVERSIONES B.H.G.	J-30406830-1	20031212000001	2009-01-01	2009-12-31	CALLE 89D # 10-140			\N		\N		\N		\N	\N	\N	\N
1788	1	1	327	1	\N	INVERSIONES Y CONSTRUCCIONES MONTERO,C.A.	I.C.M.,C.A.	J-31030601-0	20031216000001	2009-01-01	2009-12-31	AV.15 DELICIAS # 74-50			\N		\N		\N		\N	\N	\N	\N
1789	1	1	327	1	\N	MANTENIMIENTOS, SERVICIOS Y OBRAS,C.A.	MASOCA	J-30985413-5	20031217000001	2009-01-01	2009-12-31	CALLE 106B BARRIO ALTAMIRA # 18B-77			\N		\N		\N		\N	\N	\N	\N
1790	1	1	327	1	\N	SERVICIOS Y MANTENIMIENTO O.H.,C.A.	SERVYMOHCA	J-30761814-0	20031218000001	2009-01-01	2009-12-31	CALLE PRIMAVERA SECTOR TAMARE BARRIO MARISCAL SUCRE			\N		\N		\N		\N	\N	\N	\N
1791	1	1	327	1	\N	24-H,C.A.		J-30853056-5	20031009000002	2009-01-01	2009-12-31	SECTOR PANAMERICANO CALLE 77 # 69-126			\N		\N		\N		\N	\N	\N	\N
1792	1	1	327	1	\N	ALIMARCA		J-30079643-4	20040107000001	2009-01-01	2009-12-31	URB.LAS PALMAS,CASA # 6,SECT.LA VEREDA			\N		\N		\N		\N	\N	\N	\N
1793	1	1	327	1	\N	HERNANDEZ, TRUJILLO, FILIALES & ASOCIADOS,C.A.	HTF & ASOCIADOS,C.A.	J-31008833-0	20040112000001	2009-01-01	2009-12-31	CALLE 84 ENTRE AV.2A Y 2B C.C. LA COLINA LOCAL 18			\N		\N		\N		\N	\N	\N	\N
1794	1	1	327	1	\N	EVENTS AND PRODUCTIONS CORPORATIONS,C.A.		J-30839302-9	20040119000001	2009-01-01	2009-12-31	AV.18 CASA # 122-103			\N		\N		\N		\N	\N	\N	\N
1795	1	1	327	1	\N	J & M CONSTRUCCIONES,C.A.		J-30347449-7	20040120000001	2009-01-01	2009-12-31	AV.20 C.C. LAS TEJAS LOCAL 1-4			\N		\N		\N		\N	\N	\N	\N
1796	1	1	327	1	\N	CONST.MANT. Y SERVICIOS GENERALES SAN BENITO,C.A.	CONSABE,C.A.	J-30713467-4	20040120000002	2009-01-01	2009-12-31	CALLE 65 EDIFICIO SIGMA LOCAL 4A			\N		\N		\N		\N	\N	\N	\N
1797	1	1	327	1	\N	MENDEZ SERVICIOS,C.A.	MENSERCA	J-300303667	20040121000001	2009-01-01	2009-12-31	CALLE 73 CON AV. 10  EDIF.TACARICA LOCAL 3			\N		\N		\N		\N	\N	\N	\N
1798	1	1	327	1	\N	INVERSIONES EL RHUR,C.A.		J-30691492-7	20040122000001	2009-01-01	2009-12-31	AV.15B URB. LAGO MAR BEACH CASA # 15-122			\N		\N		\N		\N	\N	\N	\N
1799	1	1	327	1	\N	MEDICAL DE VENEZUELA,C.A.		J-30713461-5	20040122000002	2009-01-01	2009-12-31	AV.6 QUINTA D-25			\N		\N		\N		\N	\N	\N	\N
1800	1	1	327	1	\N	PROY.CONST. E IMPERMEABILIZACIONES EDELMARA,C.A.	EDELMARA,C.A.	J-31006556-0	20040122000003	2009-01-01	2009-12-31	AV.15 DELICIAS ESQ.CALLE 75 # 75-86			\N		\N		\N		\N	\N	\N	\N
1801	1	1	327	1	\N	SERVICIOS Y SUMINISTROS DE MARACAIBO,C.A.	SUMCA	J-31093610-2	20040126000001	2009-01-01	2009-12-31	C.C.BUENA VISTA CIRCUNV.2 LOCAL 20			\N		\N		\N		\N	\N	\N	\N
1802	1	1	327	1	\N	CONSTRUCTORA PEREZ,C.A.	CONPERCA	J-30877216-0	20020704000000	2009-01-01	2009-12-31	AV.10 E/C. 67 Y 68 C.C.CARI PISO 2 LOCALES 3 Y 4			\N		\N		\N		\N	\N	\N	\N
1803	1	1	327	1	\N	INGENIERIA DE LA CONSTRUCCION,C.A.	INCONCA	J-31041734-2	20040130000001	2009-01-01	2009-12-31	CALLE 88 ENTRE AV.9B Y 13 CASA # 10-12			\N		\N		\N		\N	\N	\N	\N
1804	1	1	327	1	\N	CONSTRUCTORA LIBARDO MOLANO,C.A.	LIMOLCA	J-30604634-8	20040204000001	2009-01-01	2009-12-31	URB.LAS MADRINAS,VEREDA 19 CASA 02			\N		\N		\N		\N	\N	\N	\N
1805	1	1	327	1	\N	CONSTRUCCIONES BRACHO PEREIRA,C.A.	CONBRAPCA	J-31050929-8	20040206000001	2009-01-01	2009-12-31	CALLE 69 AV. 15A # 15-85			\N		\N		\N		\N	\N	\N	\N
1806	1	1	327	1	\N	FERRE ESPECIAL,C.A.		J-30591003-0	20040212000001	2009-01-01	2009-12-31	AV. ANDRES BELLO # 295			\N		\N		\N		\N	\N	\N	\N
1807	1	1	327	1	\N	SOUTHERN TECHNOLOGY & SERVICES DE VENEZUELA,C.A.		J-31094109-2	20040212000002	2009-01-01	2009-12-31	AV.INTERCOMUNAL S/N			\N		\N		\N		\N	\N	\N	\N
1808	1	1	327	1	\N	INGENIERIA ZERPA & FERNANDEZ,C.A.	INZERFECA	J-30627197-0	20040213000001	2009-01-01	2009-12-31	CALLE LA PAZ ENTRE AV.SANTA TERESA Y LIBERTAD C.C. MARIA VICTORIA LOCAL I			\N		\N		\N		\N	\N	\N	\N
1809	1	1	327	1	\N	CONSTRUCCIONES Y SUMINISTROS PEREZ-CANDIAN,C.A.	CONSUPECA	J-31071239-5	20040216000001	2009-01-01	2009-12-31	AV.3G # 67-98 SECTOR BELLAS ARTES			\N		\N		\N		\N	\N	\N	\N
1811	1	1	327	1	\N	SUMINISTROS TECNICOS DE MANTENIMIENTO,C.A.	SUTECMACA	J-31090149-0	20040217000002	2009-01-01	2009-12-31	AV.CARNEVALLI EDIF.CAICO OFIC.7			\N		\N		\N		\N	\N	\N	\N
1812	1	1	327	1	\N	ARZDAL,C.A.		J-30576805-6	20040218000001	2009-01-01	2009-12-31	AV.8 SANTA RITA C.C. LAS CAROLINAS LOCAL 8 Y 9			\N		\N		\N		\N	\N	\N	\N
1813	1	1	327	1	\N	CONSTRUCCIONES,MANTENIMIENTO,SERVICIOS Y SUMINISTROS,C.A.	COMSCA	J-31105169-4	20040226000001	2009-01-01	2009-12-31	AV.2A EDIF.GILMAR # 85-215			\N		\N		\N		\N	\N	\N	\N
1814	1	1	327	1	\N	CONSTRUCTORA CANQUIZ Y PERNIA,C.A.	CAYPERCA	J-30220716-9	20040226000002	2009-01-01	2009-12-31	CALLE BOLIVAR # 124 CASA S/N			\N		\N		\N		\N	\N	\N	\N
1815	1	1	327	1	\N	CONSTRUCTORA ZAMBRANO,C.A.	CONZAMCA	J-30750195-2	20040227000001	2009-01-01	2009-12-31	RESID.EL GURI TORRE 1 APTO. 1B			\N		\N		\N		\N	\N	\N	\N
1816	1	1	327	1	\N	INVERSIONES TECNOLOGICAS,C.A.	INVERTEC	J-30265484-0	20040301000001	2009-01-01	2009-12-31	AV.PPAL.CASTILLITO,VIA CARACAS EDIF. WALCO PUERTO ORDAZ			\N		\N		\N		\N	\N	\N	\N
1817	1	1	327	1	\N	FANSIL INVERSIONES, C.A.	FASILCA	J-30749140-0	20040301000002	2009-01-01	2009-12-31	CALLE 59 CASA # 4-72			\N		\N		\N		\N	\N	\N	\N
1818	1	1	327	1	\N	TECNICA 2006,C.A.		J-30734385-0	20040301000003	2009-01-01	2009-12-31	AV.3F # 58-88 GALPON DIMATCO,ANTES LA SUIZA			\N		\N		\N		\N	\N	\N	\N
1819	1	1	327	1	\N	CONSTRUCCIONES MEJIAS GELVEZ,C.A.	CONSTRUMEJICA	J-30725496-0	20040301000004	2009-01-01	2009-12-31	AV.CIRCV.#2 C.C. LA PARAGUITA LOCAL #14			\N		\N		\N		\N	\N	\N	\N
1820	1	1	327	1	\N	INGENIERIA TECNICA,C.A.		J-30176196-0	20040302000001	2009-01-01	2009-12-31	AV.5 DE JULIO ENTRE CALLEW 13-13A EDIF.LA CASTELLANA APTO.13B			\N		\N		\N		\N	\N	\N	\N
1821	1	1	327	1	\N	CONST.SUMINIS.PROY.DE ARQUIT.E ING.Y SERV.EN GENERAL,C.A.	CONSUPROSCA	J-30897281-9	20040302000002	2009-01-01	2009-12-31	EDIF.GRAL.DE SEGUROS PISO 4 OFIC.46 CALLE 67 CON AV 4			\N		\N		\N		\N	\N	\N	\N
1822	1	1	327	1	\N	MANT.INGENIERIA,CONSTRUCCION E INSTRUMENTACION,C.A.	MICICA	J-31013873-7	20040304000001	2009-01-01	2009-12-31	LAS MOROCHAS CALLE AMPARO ESQ.CALLE CARACAS			\N		\N		\N		\N	\N	\N	\N
1823	1	1	327	1	\N	HABITAT,ORGANIZACION DE CONSTRUCCION,C.A.	HABITAT	J-30868201-2	20040308000001	2009-01-01	2009-12-31	CALLE 96 # 61-54			\N		\N		\N		\N	\N	\N	\N
1824	1	1	327	1	\N	SERVICIO AUTONOMO DE MANTENIMIENTO DEL ESTADO ZULIA	SAMEZ	G-20000966-7	20040308000002	2009-01-01	2009-12-31	CALLE ARISMENDI			\N		\N		\N		\N	\N	\N	\N
1825	1	1	327	1	\N	SERVICIOS TECNICOS ASOCIADOS,C.A.	SERTASCA	J-31107401-5	20040308000003	2009-01-01	2009-12-31	SECTOR 2 VEREDA 26 CASA # 05 CALLE 18			\N		\N		\N		\N	\N	\N	\N
1826	1	1	327	1	\N	OBRAS CIVILES MECANICAS Y ELECTRICAS, OCIMECA,C.A.	OCIMECA	J-07043383-3	20040315000001	2009-01-01	2009-12-31	AV.12 ESQ.CALLE 68 # 67B-71			\N		\N		\N		\N	\N	\N	\N
1827	1	1	327	1	\N	PROYECTOS Y OBRAS DEL LAGO,C.A.	PROYLAGOCA	J-31101270-2	20040318000001	2009-01-01	2009-12-31	AV.4 BELLA VISTA CON CALLE 78 C.C. DON SILVIO LOCAL PA-1			\N		\N		\N		\N	\N	\N	\N
1828	1	1	327	1	\N	SANTA BARBARA CONST.REP. Y SUMINISTROS,C.A.	SANTA,C.A.	J-31109967-0	20040318000002	2009-01-01	2009-12-31	CALLE 106A CASA # 24-63			\N		\N		\N		\N	\N	\N	\N
1829	1	1	327	1	\N	CONSTRUCCIONES,SERVICIOS Y SUMINISTROS MILAGROS,C.A.	CONSERSUMCA	J-31114064-6	20040402000001	2009-01-01	2009-12-31	CALLE 2 CASA S/N			\N		\N		\N		\N	\N	\N	\N
1830	1	1	327	1	\N	FG SERVICIOS,C.A.		J-31063524-2	20040405000001	2009-01-01	2009-12-31	CALLE LOS DATILES # 205-A URB. MIRAFLORES			\N		\N		\N		\N	\N	\N	\N
1831	1	1	327	1	\N	INGENIERIA,CONSTRUCCIONES Y MANTENIMIENTO 93,C.A.	INCOMA 93	J-30128285-0	20040420000001	2009-01-01	2009-12-31	AV.PPAL.DE EL LIMON N0. 291 MARACAY ESTADO ARAGUA			\N		\N		\N		\N	\N	\N	\N
1832	1	1	327	1	\N	GALINDO COMPAÃ‘IA ANONIMA DE VENEZUELA	GALCAVEN	J-30707900-2	20040504000001	2009-01-01	2009-12-31	CARRETERA LA CAÃ‘ADA AV.48 KM.10			\N		\N		\N		\N	\N	\N	\N
1833	1	1	327	1	\N	CONSTRUCTORA COSTA DE ORO,C.A.	CONCOSOCA	J-07047633-8	20040504000002	2009-01-01	2009-12-31	CALLEJON SOLEDAD ENTRANDO POR LA AV. 43			\N		\N		\N		\N	\N	\N	\N
1834	1	1	327	1	\N	TECNICOS EN CONSTRUCCION,C.A.	TECONCA	J-31113764-5	20040505000001	2009-01-01	2009-12-31	AV.5 C.CALLE F EDIF.MADEIMAR LOCAL 9			\N		\N		\N		\N	\N	\N	\N
1835	1	1	327	1	\N	CONCRETERA INDUSTRIAL DE OCCIDENTE,C.A.	CIDOCA	J-07011196-8	20040512000001	2009-01-01	2009-12-31	km.4 CARRETERA A PERIJA CALLE 69A ESQ.AV.15C N0.69A-07			\N		\N		\N		\N	\N	\N	\N
1836	1	1	327	1	\N	CONSTRUCCIONES Y MANTENIMIENTOS M & F,C.A.	M & F, C.A.	J-31111496-3	20040512000002	2009-01-01	2009-12-31	AV.17 C.CALLE 2A EDIF. EL PARAGUALITO LOCAL 3			\N		\N		\N		\N	\N	\N	\N
1837	1	1	327	1	\N	CONSTRUCTORA TEL-ZULIA,C.A.	CONTEZUCA	J-31055848-5	20040519000001	2009-01-01	2009-12-31	CALLE 16 CASA N0. 5-47			\N		\N		\N		\N	\N	\N	\N
1838	1	1	327	1	\N	CORPORACION MOGA,C.A.	MOGA,C.A.	J-30827949-8	20040526000001	2009-01-01	2009-12-31	AV.74B N0. 68B-132 I ETAPA			\N		\N		\N		\N	\N	\N	\N
1839	1	1	327	1	\N	EQUIDEX V & D,S.A.		J-31064344-0	20040527000001	2009-01-01	2009-12-31	AV.CIRCUNVALACION 2 C.C. EL DIVIDIVI LOCAL G-7			\N		\N		\N		\N	\N	\N	\N
1840	1	1	327	1	\N	EQUIPMENT & SUPPLY INTERNATIONAL,C.A.	E & S INTERNATIONAL,C.A.	J-31148300-4	20040609000001	2009-01-01	2009-12-31	AV. 6 EDIF.SAN FRANCISCO OFICINA 5C			\N		\N		\N		\N	\N	\N	\N
1841	1	1	327	1	\N	ALIZO YELAMO INGENIERIA, C.A.		J-30910022-0	20040610000001	2009-01-01	2009-12-31	AV.9B ENTRE CALLE 72 Y 73 EDIF.MARIA APTO 1			\N		\N		\N		\N	\N	\N	\N
1842	1	1	327	1	\N	CONSTRUCCIONES  Y SERVICIOS P & B,C.A.	CONSERCA	J-31122822-5	20040611000001	2009-01-01	2009-12-31	CASA N0. 45-106 CALLE 159C			\N		\N		\N		\N	\N	\N	\N
1843	1	1	327	1	\N	TALLER INDUSTRIAL LA PONDEROSA,C.A.		J-30876255-5	20040615000001	2009-01-01	2009-12-31	AV.3C EDIF. RESD.EL LAGO			\N		\N		\N		\N	\N	\N	\N
1844	1	1	327	1	\N	INVERSIONES FUENMAYOR ROSARIO,C.A.	INFUROCA,C.A.	J-30594669-8	20040615000002	2009-01-01	2009-12-31	AV.3C EDIF.RESD.DEL LAGO			\N		\N		\N		\N	\N	\N	\N
1845	1	1	327	1	\N	TECNICA PENSA,C.A.		J00229469-8	20040622000001	2009-01-01	2009-12-31	CALLE 4TA. CAMPO RANCHO GRANDE NO. 76-B			\N		\N		\N		\N	\N	\N	\N
1846	1	1	327	1	\N	CONSTRUCTORA SANTO DOMINGO,C.A.		J-07031794-9	20040622000002	2009-01-01	2009-12-31	AV.59 CASA N0. 95C-1-114 CIRCUNV.2			\N		\N		\N		\N	\N	\N	\N
1847	1	1	327	1	\N	SALUD 2000,C.A.		J-30622534-0	20040623000001	2009-01-01	2009-12-31	AV.CARNEVALLI S/N AL LADO DE CAICOC			\N		\N		\N		\N	\N	\N	\N
1848	1	1	327	1	\N	SERVICIOS Y CONSTRUCCIONES MULTIPLES,C.A.		J-30543208-2	20040623000002	2009-01-01	2009-12-31	CALLE 96D N0. 55B-43			\N		\N		\N		\N	\N	\N	\N
1849	1	1	327	1	\N	IMPERMIABILIZADORA OTECA C.A.	OTECA	J-31140054-0	20040707000001	2009-01-01	2009-12-31	AV. LA LIMPIA CALLE 92-A N0.15-80			\N		\N		\N		\N	\N	\N	\N
1850	1	1	327	1	\N	ZULIANA DE SEMAFOROS, C.A.	SEMAZULIA, C.A.	J-31092726-0	20040707000002	2009-01-01	2009-12-31	CALLE 70 ENTRE AV. 14-A Y 15 NO. 14A-117 AL LADO HOTEL GRAN DELICIAS			\N		\N		\N		\N	\N	\N	\N
1851	1	1	327	1	\N	RECOL , C.A.	RECOLCA	J-31111792-0	20040722000001	2009-01-01	2009-12-31	C/ 95E LOCAL NO. 52-149			\N		\N		\N		\N	\N	\N	\N
1852	1	1	327	1	\N	INVERSIONES Y CONSTRUCCIONES GUICAM,C.A.	TECNO-CELL	J-30180821-5	20040726000001	2009-01-01	2009-12-31	URB. MONTE BELLO CALLE NO. AV. 14 CASA NO. 09			\N		\N		\N		\N	\N	\N	\N
1853	1	1	327	1	\N	GRUPO RINCON CARBONELL,  COMPAÃ‘IA ANONIMA	RCGROUP C.A.	J-31052385-1	20040727000001	2009-01-01	2009-12-31	AV. 18  SECTOR LOS HATICOS CASA NO. 122-103			\N		\N		\N		\N	\N	\N	\N
1854	1	1	327	1	\N	ITALVI,C.A.	ITALVICA	J-30949617-4	20040831000001	2009-01-01	2009-12-31	CALLE CENTRAL C.C. TORNILLO			\N		\N		\N		\N	\N	\N	\N
1855	1	1	327	1	\N	TOPOGRAFIA,INSPECCION Y CONSTRUCCION,C.A.	TOINCO,C.A.	J-31180180-4	20040831000002	2009-01-01	2009-12-31	VIA LA CULEBRA SEGUNDAENTRADA URB. DOÃ‘A VALENTINA CASA N0.1			\N		\N		\N		\N	\N	\N	\N
1856	1	1	327	1	\N	CONSTRUCCIONES & PROYECTOS ,C.A.	C & P,C.A.	J-31142388-5	20040831000003	2009-01-01	2009-12-31	C.C. EL RIEGO LOCAL 3			\N		\N		\N		\N	\N	\N	\N
1857	1	1	327	1	\N	CONSTRUCCIONES RODRIGUEZ & MALAVE,C.A.	C.R.&M,C.A.	J-31173581-0	20040903000001	2009-01-01	2009-12-31	CALLE 83B AV. 2A Y 2B EDIF.LUGANO PIAZZA APT. 15C			\N		\N		\N		\N	\N	\N	\N
1858	1	1	327	1	\N	CONSTRUCCIONES E INVERSIONES ISRAEL ANDRADE,C.A.	CONIAND,C.A.	J-07050444-7	20040908000001	2009-01-01	2009-12-31	AV.15 CON CALLE 89B EDIF. LAS PALMERAS			\N		\N		\N		\N	\N	\N	\N
1859	1	1	327	1	\N	CONSTRUCCIONES RAVEN & ROMERO, C.A.	RAVROCA	J-31078120-6	20040917000001	2009-01-01	2009-12-31	CALLE 77 Y 78 EDIF.BEFERCON AV.16 SECTOR 5 DE JULIO			\N		\N		\N		\N	\N	\N	\N
1860	1	1	327	1	\N	DISTRIBUIDORA Y SERVICIOS DE INGENIERIA,C.A.	DISERCA	J-30823129-0	20040921000001	2009-01-01	2009-12-31	CALLE 62A SECTOR LA LIMPIA CASA N0. 31-164			\N		\N		\N		\N	\N	\N	\N
1861	1	1	327	1	\N	INVERSIONES Y CONSTRUCCIONES CASTILLA,C.A.	I.N.V.E.R.C.A.	J-30966006-3	20041004000001	2009-01-01	2009-12-31	CALLE 77 AV. 5 DE JULIO EDIF. MONTIELCO OFICINA 2B			\N		\N		\N		\N	\N	\N	\N
1862	1	1	327	1	\N	CONSTRUCCIONES  E INVERSIONES J.D.,C.A.	CONINVERCA	J-31113757-2	20041005000001	2009-01-01	2009-12-31	AV.5 CON CALLE F EDIF. MADEIMAR LOCAL 9			\N		\N		\N		\N	\N	\N	\N
1863	1	1	327	1	\N	CONSTRUCCIONES DE OBRAS RINCON,S.A.	CORINSA	J-30505414-2	20041008000001	2009-01-01	2009-12-31	AV.13A N0. 67A-58			\N		\N		\N		\N	\N	\N	\N
1864	1	1	327	1	\N	TERRA CONSTRUCCIONES C.A.		J-30964717-2	20041011000001	2009-01-01	2009-12-31	CALLE 70 ENTRE AV. 13 Y 13A EDIF. MI ENSUEÃ‘O L: 18-A			\N		\N		\N		\N	\N	\N	\N
1865	1	1	327	1	\N	CONSTRUCCIONES E INVERSIONES TROCONIZ,C.A.	COINTROCA	J-31171966-0	20041019000001	2009-01-01	2009-12-31	CIRCUNV.2 EDIF. SOL Y LUNA N0. 79-405			\N		\N		\N		\N	\N	\N	\N
1866	1	1	327	1	\N	PROYECTOS & CONSTRUCCIONES, T & M,C.A.		J-30522308-4	20041026000001	2009-01-01	2009-12-31	AV.31 N0. 58-172			\N		\N		\N		\N	\N	\N	\N
1867	1	1	327	1	\N	CONSTRUCTORA LUPASA,S.A.		J-09015199-0	20041115000001	2009-01-01	2009-12-31	AV.17 C.CALLE 2A EDIF. PARAGUANITO APTO. 24			\N		\N		\N		\N	\N	\N	\N
1868	1	1	327	1	\N	H.B.M. SUPPLY,C.A.		J-30936587-8	20041206000001	2009-01-01	2009-12-31	AV.13 ENTRE CALLES 78-79 N0. 78-68			\N		\N		\N		\N	\N	\N	\N
1869	1	1	327	1	\N	INFRAESTRUCTURA Y SERVICIOS,C.A.	INFRASERCA	J-31000060-3	20041207000001	2009-01-01	2009-12-31	AV.8 SANTA RITA ESQ.CON CALLE 60			\N		\N		\N		\N	\N	\N	\N
1870	1	1	327	1	\N	OPERADORA,PREVENCION Y SALUD INTEGRAL,C.A.	OPRESAIN,C.A.	J-31253909-7	20050111000001	2009-01-01	2009-12-31	CALLE 74 CON AV.11 RESID. MACOITA PISO 7 APTO 7A			\N		\N		\N		\N	\N	\N	\N
1872	1	1	327	1	\N	INVERSIONES VEROCA,C.A.	VEROCA	J-30596516-1	20050125000001	2009-01-01	2009-12-31	AV.2A CASA N0. 85C-29			\N		\N		\N		\N	\N	\N	\N
1873	1	1	327	1	\N	INVERSIONES OLANO SANDOVAL,C.A.	INOLSA,C.A.	J-31211413-4	20050203000001	2009-01-01	2009-12-31	CALLE 82 CONJ.RESID. AGUA SANTA N0. 82B-37			\N		\N		\N		\N	\N	\N	\N
1874	1	1	327	1	\N	D.R.CONSTRUCCIONES C.A.	D.R.C.,C.A.	J-31152332-4	20050221000001	2009-01-01	2009-12-31	CALLE YARACUY CASA N0. 20			\N		\N		\N		\N	\N	\N	\N
1875	1	1	327	1	\N	PROYECTOS TOTALES,C.A.	PROTOCA	J-31260644-4	20050224000001	2009-01-01	2009-12-31	CALLR 95 SECTOR CASCO CENTRAL N0. 3-68			\N		\N		\N		\N	\N	\N	\N
1876	1	1	327	1	\N	INVERSIONES Y CONSTRUCCIONES FUENMAYOR RUIZ, C.A.	ICONFUCA	J-31245376-1	20050225000001	2009-01-01	2009-12-31	AV.9B ENTRE CALLE 72 Y 73 N0. 72-57 RESD.MARIA FERNANDA 4TO. PISO			\N		\N		\N		\N	\N	\N	\N
1877	1	1	327	1	\N	ELECT.CONST. Y MANT.DE OBRAS CIVILES EN GENERAL,C.A.	STYHCA,C.A.	J-31270027-0	20050302000001	2009-01-01	2009-12-31	AV. 3D3 N0. 59-42			\N		\N		\N		\N	\N	\N	\N
1879	1	1	327	1	\N	CONSTRUCCIONES OBERTO RUBIO,S.A.	CORSA	J-31244959-4	20050304000001	2009-01-01	2009-12-31	CALLE 72 CON AV.09 EDIF. YARE P.B. LOCAL 1			\N		\N		\N		\N	\N	\N	\N
1880	1	1	327	1	\N	CONSTRUCTORA MONTIEL PARRA.C.A.	MOPARCA	J-31264373-0	20050311000001	2009-01-01	2009-12-31	AV.4 BELLA VISTA C.C.CLODOMIRA PISO 2 OFIC. 303			\N		\N		\N		\N	\N	\N	\N
1881	1	1	327	1	\N	ICEL,C.A.		J-30338385-8	20050311000002	2009-01-01	2009-12-31	CALLE 69A N0. 19-11			\N		\N		\N		\N	\N	\N	\N
1882	1	1	327	1	\N	CONSTRUCTORA COSACO,C.A.	COSACO	J-07006264-9	20050316000001	2009-01-01	2009-12-31	AV.9B 5 DE JULIO EDIF. BANCO INDUSTRIAL PISO 1 OFIC. 1			\N		\N		\N		\N	\N	\N	\N
1883	1	1	327	1	\N	BERMUDEZ PAZ WILLIAM ENRIQUE		V-04996604-7	20050318000001	2009-01-01	2009-12-31	CALLE 52B N0. 15P-142			\N		\N		\N		\N	\N	\N	\N
1884	1	1	327	1	\N	COMPAÃ‘IA ANONIMA NACIONAL,TELEFONOS DE VENEZUELA	CANTV	J-00124134-5	20050328000001	2009-01-01	2009-12-31	AV.100 CENTRO OPERATIVO CANTV PISO 2			\N		\N		\N		\N	\N	\N	\N
1885	1	1	327	1	\N	SOTO URDANETA CONSTRUCCIONES,C.A.	SURCONCA	J-31260671-1	20050330000001	2009-01-01	2009-12-31	CALLE 77 ENTRE AV.15 Y 16 CASA N0. 15-57			\N		\N		\N		\N	\N	\N	\N
1886	1	1	327	1	\N	CONSTRUCTORA DRECOMA,C.A.		J-09038800-1	20050404000001	2009-01-01	2009-12-31	FUNDACION INDOSA CALLE 9 BIS N0. 1-124			\N		\N		\N		\N	\N	\N	\N
1887	1	1	327	1	\N	SISTEMA INTEGRAL DE SALUD,C.A.	SISCA	J-31289843-7	20050406000001	2009-01-01	2009-12-31	AV.3E C.CALLE 79 N0. 3E-11			\N		\N		\N		\N	\N	\N	\N
1888	1	1	327	1	\N	INVERSIONES MENDEZ,C.A.	INMENCA	J-30728790-0	20050406000002	2009-01-01	2009-12-31	AV.LOS PROCERES SECTOR EL CAMPITO RESID. EL MILAGRO EDIF.1 APTO.6.B.2			\N		\N		\N		\N	\N	\N	\N
1889	1	1	327	1	\N	SILICE,C.A.		J-31242835-0	20050407000001	2009-01-01	2009-12-31	CALLE 84 CON CARRETERA UNION CASA N0. 3A-55			\N		\N		\N		\N	\N	\N	\N
1890	1	1	327	1	\N	CONSTRUCCIONES Y SERVICIOS LIDOTE,C.A.		J-31266584-0	20050408000001	2009-01-01	2009-12-31	CALLE 49B AV. 99  EDIF. A-3 APTO.14			\N		\N		\N		\N	\N	\N	\N
1891	1	1	327	1	\N	CONSULTORA REICHEL,C.A.	CONREICA	J-31169337-8	20050412000001	2009-01-01	2009-12-31	EDIF.ALMADEN, PISO 01 APTO O1 CALLE 74 N0. 9-56			\N		\N		\N		\N	\N	\N	\N
1892	1	1	327	1	\N	GRUPO 2021,C.A.		J-31047732-9	20050412000002	2009-01-01	2009-12-31	SECTOR 5 DE JULIO CALLE 72 ESQ.AV.5 DE JULIO EDIF MONTIELCO PISO 3 APTO 3-1			\N		\N		\N		\N	\N	\N	\N
1893	1	1	327	1	\N	COSTA CABIMAS INVERSIONES,C.A.		J-30773639-9	20050421000001	2009-01-01	2009-12-31	AV.31 SECTOR CAMPO ALEGRE GALPON S/N			\N		\N		\N		\N	\N	\N	\N
1894	1	1	327	1	\N	V & P INGENIERIA,C.A.		J-31296739-0	20050422000001	2009-01-01	2009-12-31	AV.17 N0.101-58 SECTOR PUENTE ESPAÃ‘A			\N		\N		\N		\N	\N	\N	\N
1895	1	1	327	1	\N	PROYECTOS Y CONSTRUCCIONES DE SUR,C.A.	PROSURCA	J-31296726-9	20050422000002	2009-01-01	2009-12-31	CALLE 16 N0. 6-24			\N		\N		\N		\N	\N	\N	\N
1896	1	1	327	1	\N	SERVICIOS TECNICOS VOM,S.A.		J-30627487-1	20050502000001	2009-01-01	2009-12-31	AV.3D C/C.80 NO. 2C-1-7			\N		\N		\N		\N	\N	\N	\N
1897	1	1	327	1	\N	INVERSIONES BOSQUE EL RETIRO,C.A.		J-31155521-8	20050502000002	2009-01-01	2009-12-31	AV.3D C/C 80 N0. 2C-1-7			\N		\N		\N		\N	\N	\N	\N
1898	1	1	327	1	\N	CONSTRUCCIONES GANDO,C.A.		J-30499346-3	20050504000001	2009-01-01	2009-12-31	CARRETERA MACHIQUE COLON			\N		\N		\N		\N	\N	\N	\N
1899	1	1	327	1	\N	INGENIERIA PROCURA Y CONSTRUCCION DE VENEZUELA,C.A.	I.P.C. DE VENEZUELA	J-31140309-4	20050505000001	2009-01-01	2009-12-31	AV.100 SABANETA CASA N0. 54-125			\N		\N		\N		\N	\N	\N	\N
1900	1	1	327	1	\N	CONSTRUCTORA W.G.,C.A.		J-31266117-8	20050505000002	2009-01-01	2009-12-31	AV.72 N0.79-18			\N		\N		\N		\N	\N	\N	\N
1901	1	1	327	1	\N	INVERSIONES LA FLORESTA,C.A.		J-31054765-3	20050505000003	2009-01-01	2009-12-31	CALLE 61 CON AV.10 C.C. PALAFITO SHOPPI OFC.2A-2B			\N		\N		\N		\N	\N	\N	\N
1903	1	1	327	1	\N	CONSTRUCCIONES MONTREAL,C.A.		J-30740620-8	20050520000001	2009-01-01	2009-12-31	CALLE 67 CON AV. 27 EDIF.FINQUITA			\N		\N		\N		\N	\N	\N	\N
1904	1	1	327	1	\N	INVERSORA CONSTRUCTORA BARRIENTOS,C.A.	INCOBACA	J-30888087-6	20050524000001	2009-01-01	2009-12-31	CALLE 75B N0. 26-26 QTA. ELYUALI			\N		\N		\N		\N	\N	\N	\N
1905	1	1	327	1	\N	CONSTRUCCIONES J & C,C.A.		J-31313096-6	20050530000001	2009-01-01	2009-12-31	CALLE 216A CASA N0. 49I-48			\N		\N		\N		\N	\N	\N	\N
1906	1	1	327	1	\N	ASOCIACION COOPERATIVA VISTA AL SOL 32165,R.L.		J-31267019-3	20050601000001	2009-01-01	2009-12-31	CALLE CAMPO ELIAS CON CALLE BERMUDEZ RED.AAA			\N		\N		\N		\N	\N	\N	\N
1907	1	1	327	1	\N	SUMINISTROS  Y CONSTRUCCIONES NOLETTI,C.A.		J-30957810-3	20050607000001	2009-01-01	2009-12-31	CALLE 100 CON AV. 20 N0. 20A-17			\N		\N		\N		\N	\N	\N	\N
1908	1	1	327	1	\N	ANDRADE RIGUAL ARQUITECTOS,C.A.	ANRIARCA	J-31275791-4	20050608000001	2009-01-01	2009-12-31	SAN JACINTO SECTOR 4 VEREDA 1 CASA 9			\N		\N		\N		\N	\N	\N	\N
1909	1	1	327	1	\N	R.C. CONSULTORES & ASOCIADOS, C.A.		J-30070901-9	20050609000001	2009-01-01	2009-12-31	LAGO MAR BEACH AV 15-D Â· 14-89			\N		\N		\N		\N	\N	\N	\N
1910	1	1	327	1	\N	DISTRIBUIDORA MIRANDA,C.A.		J-30583156-4	20050610000001	2009-01-01	2009-12-31	AV.15A CON CALLE 69			\N		\N		\N		\N	\N	\N	\N
1911	1	1	327	1	\N	CONSTRUCCIONES Y MANTENIMIENTO LUZARCA,C.A.	LUZARCA	J-30435477-0	20050610000002	2009-01-01	2009-12-31	CALLE 67A N0.2D-150 DETRAS DEL UNICENTRO VIRGINIA URB.CREOLE SECTOR LA LAGO			\N		\N		\N		\N	\N	\N	\N
1912	1	1	327	1	\N	TEMARK DE VENEZUELA,C.A.	TEMARK	J31114983-0	20050610000003	2009-01-01	2009-12-31	AV.9B CASA N0. 60B-46 P.B.Âº			\N		\N		\N		\N	\N	\N	\N
1913	1	1	327	1	\N	PAYCO PAVIMENTADORA Y CONSTRUCCIONES ,C.A.		J-30951459-8	20050610000004	2009-01-01	2009-12-31	CARRETERA PANAMERICANA KM.686			\N		\N		\N		\N	\N	\N	\N
1914	1	1	327	1	\N	CONSTRUCTORA CM & C.A.		J-30654078-4	20050617000001	2009-01-01	2009-12-31	CAMPO STAFF N0. 9 QTA. LOS CASTILLO			\N		\N		\N		\N	\N	\N	\N
1915	1	1	327	1	\N	SERVICIOS ELECTRICOS VENEZOLANOS C.A.	SERELVENCA	J-30244002-5	20050621000001	2009-01-01	2009-12-31	CARRETERA J EDF.SERELVENCA CABIMAS SECTOR  NVA. ROSA			\N		\N		\N		\N	\N	\N	\N
1916	1	1	327	1	\N	CONSTRUCCIONES Y OBRAS CIVILES G Y R,C.A.		J-31182289-5	20050628000001	2009-01-01	2009-12-31	AV.3Y ENTRE CALLES 74 Y 75 PISO 1 OFICINA 13 SECTOR SAN MARTIN			\N		\N		\N		\N	\N	\N	\N
1917	1	1	327	1	\N	SUPLIDORA CONTINENTAL,C.A.	SUPLICONCA	J-07027451-4	20050628000002	2009-01-01	2009-12-31	AV.3Y CON ESQ.CALLE 71 EDIF.MI REINA LOCAL 1 P.B.			\N		\N		\N		\N	\N	\N	\N
1918	1	1	327	1	\N	CONSTRUCCIONES M.D.E.,C.A.		J-31193658-0	20050630000001	2009-01-01	2009-12-31	AV.16 LA GUAJIRA C.C. PALAIMA LOCAL 1-15			\N		\N		\N		\N	\N	\N	\N
1919	1	1	327	1	\N	CONSTRUCTORA  ALGE, C.A.		J-30410823-0	20050630000002	2009-01-01	2009-12-31	CALLE STA. BARBARA C.CALLE 3E CASA N0. 3-5			\N		\N		\N		\N	\N	\N	\N
1920	1	1	327	1	\N	CONSTRUCCIONES,INSPECCIONES,MANTENIMIENTO Y ADQUISICIONES,C.A.	CIMACA	J-31330318-6	20050708000001	2009-01-01	2009-12-31	CALLE 216-A N0. 49 I-48 LA GALLERA			\N		\N		\N		\N	\N	\N	\N
1921	1	1	327	1	\N	GERENPRO,S.A.		J-30301744-4	20050708000002	2009-01-01	2009-12-31	CARRETERA 44 FEDERACION 2 LOCAL 5			\N		\N		\N		\N	\N	\N	\N
1922	1	1	327	1	\N	DESARROLLO DE SOLUCIONES ESPECIFICAS,C.A.	DESCA	J-30338807-8	20050722000001	2009-01-01	2009-12-31	CALLE 72 AV. 3H C.C. LAS TINAJITAS LOCAL 19			\N		\N		\N		\N	\N	\N	\N
1923	1	1	327	1	\N	SUMINISTROS, MANTENIMIENTO Y SERVICIOS LOS LUISES,C.A.	SUMSELUCA	J-31255713-3	20050727000001	2009-01-01	2009-12-31	AV.15B C.C. 54			\N		\N		\N		\N	\N	\N	\N
1924	1	1	327	1	\N	CHACIN INGENIERIA,C.A.	CHACINCA	J-31216232-5	20050729000001	2009-01-01	2009-12-31	EDIF.RIO MACOITA APTO. 6-H			\N		\N		\N		\N	\N	\N	\N
1925	1	1	327	1	\N	BAHICONSA  S.A.	BAHICONSA	J-3098889-2	20050805000001	2009-01-01	2009-12-31	CALLE 7 SECTOR EL PARE DIAG. TERM. DE PASAJEROS NO. 6-95			\N		\N		\N		\N	\N	\N	\N
1926	1	1	327	1	\N	SERV.TRANSP.Y CONTRAT.COSTA ORIENTAL DEL LAGO, C.A. (SETRACOL)  C.A		J-31273924-0	20050815000001	2009-01-01	2009-12-31	AV. PRINCIPAL CABIMAS SECT. LA VEREDA DIAG. CUERPO BOMBEROS			\N		\N		\N		\N	\N	\N	\N
1927	1	1	327	1	\N	CONST. DEPORTIVA DE ALTO RENDIMIENTO,C.A.	CODARCA,C.A.	J-31009672-4	20050815000002	2009-01-01	2009-12-31	AV. 20 CON CALLE 69. C.C. LAS TEJAS LOCAL 1-9			\N		\N		\N		\N	\N	\N	\N
1928	1	1	327	1	\N	BOMDECO  C.A		J-07014017-8	20050815000003	2009-01-01	2009-12-31	CIRCUNV. No. 2, frente a frio EDGAR, No 99-159			\N		\N		\N		\N	\N	\N	\N
1929	1	1	327	1	\N	FJL INGENIERIA,C.A.	F J L, C.A.	J-30743763-4	20050824000001	2009-01-01	2009-12-31	AV. 11 CON CALLE 93 C.C.EMPRESAIAL LA LAGO L.1			\N		\N		\N		\N	\N	\N	\N
1930	1	1	327	1	\N	INVERSIONES Y CONSTRUCCIONES GARCIA ACOSTA,C.A.	INCOGACOSCA	J-31369627-7	20050824000002	2009-01-01	2009-12-31	CALLE 80 SECT. VERITAS LOCAL 10A-45			\N		\N		\N		\N	\N	\N	\N
1931	1	1	327	1	\N	CONSTRUCCIONES ZAMBRANO,C.A.	CONSTRUZA, C.A.	J-31366777-3	20050901000001	2009-01-01	2009-12-31	AV. 15 EDIFICIO LA PALMERA PISO 1 OFICINA 1-1			\N		\N		\N		\N	\N	\N	\N
1932	1	1	327	1	\N	DEGON CONSTRUCCIONES,C.A.	DEGONCA	J-31254057-5	20050906000001	2009-01-01	2009-12-31	AV.15 LAS DELICIAS ENTRE CALLES 89 Y 89B EDIF. LA PALMERA OFICINA 2-6			\N		\N		\N		\N	\N	\N	\N
1933	1	1	327	1	\N	ING. OSCAR PACHECO PIFANO Y ASOCIADOS,C.A.		J-30203743-3	20050908000001	2009-01-01	2009-12-31	C.C. EL TRIANGULO LOCAL 31, AV. 4 C-3Y BELLA VISTA			\N		\N		\N		\N	\N	\N	\N
1934	1	1	327	1	\N	TELCONS  INGENIEROS, C.A.		J-00268139-0	20050908000002	2009-01-01	2009-12-31	URB. LA GLORIA,AV.69 N. 94-132 SECTOR PEDREGAL			\N		\N		\N		\N	\N	\N	\N
1935	1	1	327	1	\N	CONSTRUCCIONES CIYEN, C.A.		J-31270167-6	20050909000001	2009-01-01	2009-12-31	CALLE 124 N0. 67A-11			\N		\N		\N		\N	\N	\N	\N
1936	1	1	327	1	\N	GARCA CONSTRUCCIONES Y SERVICIOS,C.A.		J-31283426-9	20050909000002	2009-01-01	2009-12-31	AV.3Y SAN MARTIN CON CALLE 78 C.C. SALTO ANGEL OFIC.27			\N		\N		\N		\N	\N	\N	\N
1937	1	1	327	1	\N	PROYECTOS Y SERVICIOS, C.A.	PROSCA	J-31150180-0	20050913000001	2009-01-01	2009-12-31	AV. 24A B-12 83B-12 PRIMERO DE MAYO			\N		\N		\N		\N	\N	\N	\N
1938	1	1	327	1	\N	CONSTRUCCIONES E INGENIERIA PETIT, C.A.	CONINGPET, C.A.	J-31137066-8	20050915000001	2009-01-01	2009-12-31	AV. PPL. LA POMONA, URB. EL PINAR, EDIF. PINO BANK 1, P-1, APART. 1-B.			\N		\N		\N		\N	\N	\N	\N
1939	1	1	327	1	\N	CORPORACIÃ“N NACIONAL DE CONSTRUCCIÃ“N, C. A.	C.N.C., C.A.	J-07042946-1	20050919000001	2009-01-01	2009-12-31	ZONA INDUSTRIAL DE MARACAIBO AV. 60 II 59-175			\N		\N		\N		\N	\N	\N	\N
1940	1	1	327	1	\N	TECNICA DE PROY. Y CONSTRUCCIONES Z & R, C. A.	TEPROCON Z & R, C.A.	J-07042821-0	20050921000001	2009-01-01	2009-12-31	CALLE PROGRESO NÂº 30B			\N		\N		\N		\N	\N	\N	\N
1941	1	1	327	1	\N	SIMONCA INGENIERIA, C. A.		J-30536124-0	20050923000001	2009-01-01	2009-12-31	AV. 22A ENTRE CALLE 69 Y 70 C. C. LAS PALMAS			\N		\N		\N		\N	\N	\N	\N
1942	1	1	327	1	\N	CONSTRUCCIONES ALYON,C.A.		J-31272432-3	20050923000002	2009-01-01	2009-12-31	CALLE LARA, CASA N0. 182			\N		\N		\N		\N	\N	\N	\N
1943	1	1	327	1	\N	PROYECTOS MONT RIVER, C. A.		J-30409879-0	20050929000001	2009-01-01	2009-12-31	CALLE 70 NÂº 28A-128			\N		\N		\N		\N	\N	\N	\N
1944	1	1	327	1	\N	CELOR,C.A.		J-09010378-3	20051004000001	2009-01-01	2009-12-31	SECTOR RIO FRIO HACIENDA LA TRINIDAD			\N		\N		\N		\N	\N	\N	\N
1945	1	1	327	1	\N	CONSTRUCTORA MAER,C.A.	MAERCA	J-31401788-8	20051007000001	2009-01-01	2009-12-31	AV.4 CASA N0. 78A-100			\N		\N		\N		\N	\N	\N	\N
1946	1	1	327	1	\N	SUMINISTROS SERVICIOS INDUSTRIALES ,C.A,	SUSERINCA	J-30740860-0	20051017000001	2009-01-01	2009-12-31	CALLE 66 ENTRE AV.13A Y 14B N0. 13A-47 URB. MARACAIBO			\N		\N		\N		\N	\N	\N	\N
1947	1	1	327	1	\N	VENEZOLANA DE LA CONSTRUCCION,C.A.	VENECON,C.A.	J-30943527-2	20051018000001	2009-01-01	2009-12-31	CALLE 77 ENTRE AV.15 Y14 EDIF.5 DE JULIO OFIC.B-12 MARACAIBO EDO. ZULIA			\N		\N		\N		\N	\N	\N	\N
1948	1	1	327	1	\N	CONSTRUCCIONES E INVERSIONES VENEZOLANAS, C. A.	COINVECA	J-31367112-6	20051031000001	2009-01-01	2009-12-31	ZONA INDUSTRIAL, SECTOR EL GAITERO, AV 68 NÂº 131-99.			\N		\N		\N		\N	\N	\N	\N
1949	1	1	327	1	\N	SERVICIOS Y CONSTRUCCIONES, C.A.	SERVICONCA	J-31326424-5	20051101000001	2009-01-01	2009-12-31	URB. LA PAZ, AV. 56 NÂº 96D-31			\N		\N		\N		\N	\N	\N	\N
1950	1	1	327	1	\N	CONSTRUCTORA  MARTONE & PEREZ,C.A.	CONMARPE,C.A.	J-07048804-2	20051110000001	2009-01-01	2009-12-31	CIRCUNVALACION N0.1 AV.23 N0. 21-64 SECTOR NORIEGA TRIGO			\N		\N		\N		\N	\N	\N	\N
1951	1	1	327	1	\N	INVERSIONES Y SERVICIOS OCCIDENTALES,C.A.	INSEROCA	J-31397726-8	20051110000002	2009-01-01	2009-12-31	AV.83 BACHAQUERO SECTOR EL MURO			\N		\N		\N		\N	\N	\N	\N
1952	1	1	327	1	\N	R & A INVERSIONES, CA		J-31363971-0	20051116000001	2009-01-01	2009-12-31	AV. 40A EDIF. MADISON APART. 1-B			\N		\N		\N		\N	\N	\N	\N
1953	1	1	327	1	\N	MENEMARINA		J-30489764-2	20051116000002	2009-01-01	2009-12-31	AV. HOLLIWOOD C. C. SCHILACI LOCAL NÂº 1			\N		\N		\N		\N	\N	\N	\N
1954	1	1	327	1	\N	SERVICIOS SOCOAVO, C.A.	SOCOAVOCA	J-30719270-4	20051117000001	2009-01-01	2009-12-31	CALLE 89 SECTOR BELLOSO NÂº 10-140			\N		\N		\N		\N	\N	\N	\N
1955	1	1	327	1	\N	PROYECTOS, INSTALACIONES, SERVICIOS Y MANTENIMIENTO PRISMA,C.A.	PRISMA C.A.	J-31274640-8	20051125000001	2009-01-01	2009-12-31	AV.72 CON CALLE 77 #77-07 LA LIMPIA			\N		\N		\N		\N	\N	\N	\N
1956	1	1	327	1	\N	CONSTRUCCIONES OMNICA, C.A.	OMNICA, C.A.	J-31390071-0	20051130000001	2009-01-01	2009-12-31	URB. LA TRINIDAD C.C. PALAIMA PISO 2 OFICINA 2-6			\N		\N		\N		\N	\N	\N	\N
1957	1	1	327	1	\N	INGENIERIA DE SERVICIOS Y MANTENIMIENTO,C.A.	INSERMANCA	J-30373125-2	20051130000002	2009-01-01	2009-12-31	CALLE 75 ESQ. AV. 3G EDIF. LUNA OFICINA -A P.B.			\N		\N		\N		\N	\N	\N	\N
1958	1	1	327	1	\N	L. C. DISEÃ‘OS INGENIERIA E INSPECCIONES, C.A.	L.C., CA	J-30288294-0	20051201000001	2009-01-01	2009-12-31	AV. 28B NÂº 61 A-85 LA LIMPIA			\N		\N		\N		\N	\N	\N	\N
1959	1	1	327	1	\N	CONSTRUCCIONES Y SERVICIOS GELMAC, C.A.		J-31257174-8	20051205000001	2009-01-01	2009-12-31	C.C. CARIBE ZULIA AV. 11 Y 12 CON  CALLE 96 Y 97 NIVEL SOTANO OFICINA 01			\N		\N		\N		\N	\N	\N	\N
1960	1	1	327	1	\N	INGENIERIA, CONST., MANT.  Y SERVICIO, C.A.	INGENIERIA, C. M. S. C.A.	J-30839154-9	20051208000001	2009-01-01	2009-12-31	AV. 9B ENTRE CALLES 82B Y 83 NÂº 9B-60			\N		\N		\N		\N	\N	\N	\N
1961	1	1	327	1	\N	INGENIERIA Y PROYECTOS DEL LAGO, C.A.	INPROLAGO	J-31150924-0	20051208000002	2009-01-01	2009-12-31	URB EL PINAR EDIF PINO NIGRAL 1 APART 3-F			\N		\N		\N		\N	\N	\N	\N
1962	1	1	327	1	\N	PROMOTORA DE LA ROCA, C.A.		J-30942881-0	20051209000001	2009-01-01	2009-12-31	AV.7 CON CALLE N SECTOR MONTE CLARO CASA S/N			\N		\N		\N		\N	\N	\N	\N
1963	1	1	327	1	\N	CONSTRUCTORA SUPLIDORA MUNDIAL, C.A.	CONSUMUNCA	J-30983090-2	20051213000001	2009-01-01	2009-12-31	AV. 14A CON CALLE 67 CECILIO ACOSTA SECTOR TIERRA NEGRA CASA NÂº 66-111			\N		\N		\N		\N	\N	\N	\N
1964	1	1	327	1	\N	COMPAÃ‘IA VENEZOLANA DE CONSTRUCCION, C.A.		J-31054754-8	20051216000001	2009-01-01	2009-12-31	AV 10 C/C  61 CC PALAFITO SHOPING CENTER OFIC 2A-2B			\N		\N		\N		\N	\N	\N	\N
1965	1	1	327	1	\N	FACOA COMPAÃ‘IA ANONIMA		J-30060301-6	20051221000001	2009-01-01	2009-12-31	AV. PARQUE C/C ALEJO ZULUAGA URB TRIGAL CENTRO ITALO VICTOR			\N		\N		\N		\N	\N	\N	\N
1966	1	1	327	1	\N	R & D SERVICIOS, C.A.		J-31335453-8	20051223000001	2009-01-01	2009-12-31	CALLE 81 NÂº 3F-33 QTA. FLOR ELENA			\N		\N		\N		\N	\N	\N	\N
1967	1	1	327	1	\N	CONSTRUCTORA AMCO 1995, C.A.		J-30285408-3	20060109000001	2009-01-01	2009-12-31	CALLE VILLAFLOR CENTRO PROFESIONAL ESTE PISO 9 OFIC 93 SABANA GRANDE			\N		\N		\N		\N	\N	\N	\N
1968	1	1	327	1	\N	CONSTRUCCIONES Y SERVICIOS GAMMA, C.A.	GAMMA, C.A.	J-31464098-4	20060118000001	2009-01-01	2009-12-31	CIRCUNVALACION 2 SECTOR SAN RAFAEL N 99-159 EDIF MANDECO.			\N		\N		\N		\N	\N	\N	\N
1969	1	1	327	1	\N	INGENIERIA ALFA-ONIA, C.A.		J-31200803-2	20060120000001	2009-01-01	2009-12-31	EDIF GLORIA APART N 6 AV. BOLIVAR EL VIGIA EDO MERIDA/ LOS PUERTOS DE ALTAGRACIA SECTOR LA SALINA DEL SUR CALLE LA TUBERIA N 70			\N		\N		\N		\N	\N	\N	\N
1970	1	1	327	1	\N	TRANSPORTE  SANTA MARIA, C.A.	TRANSAMARCA	J-07031019-7	20060123000001	2009-01-01	2009-12-31	AV. INTERCOMUNAL SECTOR R-5 VIA CABIMAS-LAGUNILLAS			\N		\N		\N		\N	\N	\N	\N
1971	1	1	327	1	\N	CONSTRUCCIONES JESUS HERRERA		V-04752832-8	20060123000002	2009-01-01	2009-12-31	CALLE 86-A NÂº 7-107 QUINTA SANTANA			\N		\N		\N		\N	\N	\N	\N
1972	1	1	327	1	\N	VENEZOLANA DE CLORO, C.A.	VENCLORO	J-07046011-3	20060125000001	2009-01-01	2009-12-31	CALLE 148, ENTRE AV. 85 Y 87 NÂº 85-60			\N		\N		\N		\N	\N	\N	\N
1973	1	1	327	1	\N	L.M.G. SERVICIOS, C.A.		J-31341375-5	20060126000001	2009-01-01	2009-12-31	CALLE 74 ENTRE AV. 11 Y 12 NÂº 11-37			\N		\N		\N		\N	\N	\N	\N
1974	1	1	327	1	\N	INVERSIONES ENDELST. C.A.	INVENCA	J-07042619-5	20060126000002	2009-01-01	2009-12-31	AV. 4 BELLA VISTA CON CALLE 67 CECILIO ACOSTA			\N		\N		\N		\N	\N	\N	\N
1975	1	1	327	1	\N	SERVI CONSTRUCCIONES F.A.R. C.A.	SCFARCA	J-30751841-3	20060130000001	2009-01-01	2009-12-31	CALLE 79N SECTOR PARAISO			\N		\N		\N		\N	\N	\N	\N
1976	1	1	327	1	\N	ZULIANA DE OBRAS, MANT., INV. Y SUMINISTRO, C.A.	ZOMISCA	J-31474125-0	20060217000001	2009-01-01	2009-12-31	AV. 13 LOS ANDES SECTOR BELLOSO CASA NÂº 90-69			\N		\N		\N		\N	\N	\N	\N
1977	1	1	327	1	\N	INVERSIONES, CONSTRUCCIONES Y SERVICIOS ALFA, C.A.	ISCA, C.A.	J-31474132-2	20060217000002	2009-01-01	2009-12-31	AV. 20H BARRIO LA CHINITA SECTOR HATICOS NÂº 113A-31			\N		\N		\N		\N	\N	\N	\N
1978	1	1	327	1	\N	CONSTRUCCIONES R & M, C.A.		J-07049512-0	20060221000001	2009-01-01	2009-12-31	AV. GOAJIRA C.C. PALAIMA PISO 1 LOCAL 1-4			\N		\N		\N		\N	\N	\N	\N
1979	1	1	327	1	\N	JOMA CONSTRUCCIONES C.A.	JOMACON, C.A.	J-31435853-7	20060301000001	2009-01-01	2009-12-31	CALLE 72 ENTRE AV. 9B Y 10 RESID. CLARET TORRE 3			\N		\N		\N		\N	\N	\N	\N
1980	1	1	327	1	\N	ORGANIZACION PRODECA COMPAÃ‘IA ANONIMA	PRODECA	J-31464154-9	20060302000001	2009-01-01	2009-12-31	CALLE 56 CIRCUNVALACION 2 LA PARAGUA CC LA PARAGUA LOCAL SE-35			\N		\N		\N		\N	\N	\N	\N
1981	1	1	327	1	\N	INVERSIONES Y CONSTRUCCIONES L & S COMPAÃ‘IA ANONIMA		J-30089019-8	20060303000001	2009-01-01	2009-12-31	LA CONCEPCION CARRETERA PRINCIPAL VIA MARA CAMPO E`LATA EDIFICIO 134			\N		\N		\N		\N	\N	\N	\N
1982	1	1	327	1	\N	SISTEMAS, DISEÃ‘OS Y CONSTRUCCIONES C.A	S, D&C, C.A.	J-30986849-7	20060314000001	2009-01-01	2009-12-31	CALLE 75 ENTRE AV. 13 Y 13A SECTOR TIERRA NEGRA EDIF. SANTA LUCIA OFIC. 3B			\N		\N		\N		\N	\N	\N	\N
1983	1	1	327	1	\N	INVERSIONES DIANA ANGEL (INDIANGEL), COMPAÃ‘IA ANONIMA		J-30707468-0	20060317000001	2009-01-01	2009-12-31	CONJUNTO RESIDENCIAL TIERRA NORTE EDIFICIO 10 PB-B			\N		\N		\N		\N	\N	\N	\N
1984	1	1	327	1	\N	DESARROLLOS DIMAR, C.A.		J-30582855-5	20060323000001	2009-01-01	2009-12-31	CIRCUNVALACION NÂº 2 NÂº 98 E-71			\N		\N		\N		\N	\N	\N	\N
1985	1	1	327	1	\N	INGENIERIA VILLALOBOS EMONET C.A.	IVE C.A.	J-07044821-0	20060323000002	2009-01-01	2009-12-31	AV. 6 SAN FCO. SECTOR SAN RAMON EDIF. RESD SAN JORGE APART 1B			\N		\N		\N		\N	\N	\N	\N
1986	1	1	327	1	\N	DOTACION Y SERVICIOS, C.A.		J-31390787-1	20060324000001	2009-01-01	2009-12-31	AV 15 DELICIAS CENTRO COMERCIAL LUZ LOCAL 8			\N		\N		\N		\N	\N	\N	\N
1987	1	1	327	1	\N	CONSTRUCTORA S. Y N. SILNA		V-10430610-8	20060327000001	2009-01-01	2009-12-31	LA BLANCA C/PRINCIPAL NÂº 19			\N		\N		\N		\N	\N	\N	\N
1988	1	1	327	1	\N	SUMINISTROS Y SERVICIOS WOLCLEM, C.A.	SUSERWOLCLEMCA	J-30766249-2	20060327000002	2009-01-01	2009-12-31	AV. 19 CALLE 8 CALLE 8-23			\N		\N		\N		\N	\N	\N	\N
1989	1	1	327	1	\N	MULTISERVICIOS DE INGENIERIA, C.A.		J-30972971-3	20060327000003	2009-01-01	2009-12-31	PASEO 72 AV 15 DELICIAS CC PASEO 72 OFIC. 18.			\N		\N		\N		\N	\N	\N	\N
1990	1	1	327	1	\N	CONSTRUCCIONES OLAVE, COMPAÃ‘IA ANONIMA	CONSOLCA	J-07027979-6	20060329000001	2009-01-01	2009-12-31	CALLE 53-B URB LA TRINIDAD CASA N 15-066			\N		\N		\N		\N	\N	\N	\N
1991	1	1	327	1	\N	INVERSIONES R Y L COMPAÃ‘IA ANONIMA		J-30676551-4	20060109000002	2009-01-01	2009-12-31	CALLE 64A URB MARACAIBO N 12 121 12-121 QUINTA NEY VIC			\N		\N		\N		\N	\N	\N	\N
1992	1	1	327	1	\N	H & Y CONSTRUCCIONES Y SUMINISTROS C.A.	HYCONSUCA	J-31393552-2	20060331000001	2009-01-01	2009-12-31	AV. 19 LOS HATICOS POR ARRIBA NÂº 114-78. SECTOR CORITO.			\N		\N		\N		\N	\N	\N	\N
1993	1	1	327	1	\N	ASCENSORES METROPOLIS,C.A.		J-30322557-8	20060331000002	2009-01-01	2009-12-31	AV.5DE JULIO CON CALLE72 C.C. MONTIELCO LOCAL 18			\N		\N		\N		\N	\N	\N	\N
1994	1	1	327	1	\N	SERVICIO TOTAL DE INGENIERIA, C.A.	SETINCA	J-30129150-6	20060417000001	2009-01-01	2009-12-31	URB. LA CALIFORNIA C 50 NÂº 15A-125			\N		\N		\N		\N	\N	\N	\N
1995	1	1	327	1	\N	CONSTRUCCIONES NEON, C.A.		J-31195068-0	20060417000002	2009-01-01	2009-12-31	URB. LA MARINA CALLE O3 SECTOR SAN JACINTO BLOQE 14 RESD. 01 LOCAL 01-02			\N		\N		\N		\N	\N	\N	\N
1996	1	1	327	1	\N	SERVICIOS LEAL COMPAÃ‘IA ANONIMA	SERLECA	J-07048008-4	20060420000001	2009-01-01	2009-12-31	CALLEJON BOLIVAR CON CALLE SUCRE, CASCO CENTRAL CASA S/N			\N		\N		\N		\N	\N	\N	\N
1997	1	1	327	1	\N	INVERSIONES Y CONSTRUCCIONES REAL, C.A.	INCORECA	J-30930052-0	20060424000001	2009-01-01	2009-12-31	AV. 1A NÂº 4-197 SECTOR SAN ANDRES.			\N		\N		\N		\N	\N	\N	\N
1998	1	1	327	1	\N	CAÃ‘O NEGRO SERVICIOS , C.A. CANECA		J-30555108-1	20060426000001	2009-01-01	2009-12-31	AV. 15 DELICIAS RES JUANA DE AVILA PISO 11 APT K1			\N		\N		\N		\N	\N	\N	\N
1999	1	1	327	1	\N	MANTENIMIENTO ESPECIALIZADO DEL ZULIA C.A.	MANTEZUL	J-31177098-4	20060503000001	2009-01-01	2009-12-31	EDIF. KALUA AV. 8 STA. RITA C/ CALLE 78 LOCAL 3			\N		\N		\N		\N	\N	\N	\N
2000	1	1	327	1	\N	ACEROTEC.COMPAÃ‘IA ANONIMA	ACEROTEC, C.A.	J-30446949-7	20060504000001	2009-01-01	2009-12-31	SECTOR PARAISO AV.22A CON CALLE 65 # 65-02			\N		\N		\N		\N	\N	\N	\N
2001	1	1	327	1	\N	J.C.M. SERVICIOS GENERALES C.A.		J- 314338018-4	20060523000001	2009-01-01	2009-12-31	CALLE 66 ETRE AV 3E Y 3F,no E-59 EDIFICIO LA NEGRA.DON BOSCO			\N		\N		\N		\N	\N	\N	\N
2002	1	1	327	1	\N	SERVICIO MARITIMOS & IMPORTADORA LEON C.A.	SERMALECA	J-30630773-7	20060406000001	2009-01-01	2009-12-31	CALLE 17 CON AV.6 No 6-75. SECTOR PERU			\N		\N		\N		\N	\N	\N	\N
2003	1	1	327	1	\N	INVERSIONES YAHOO, C.A.	INYA, C.A	J-30594700-7	20060406000002	2009-01-01	2009-12-31	AV.49. SECTOR SABANETA #99F-60			\N		\N		\N		\N	\N	\N	\N
2004	1	1	327	1	\N	OVINDOLI CONSTRUCCIONES, C A	OVINCA	J-  30298856-0	20060407000001	2009-01-01	2009-12-31	AV.  15 A ENTRE CALLE 65 Y 69 A N  6- 58 SECTOR  DELICIAS			\N		\N		\N		\N	\N	\N	\N
2005	1	1	327	1	\N	CONST, SERV Y  MANT CAMINO NUEVO, C.A.	CONSERCANCA	J-  30989975-9	20060608000001	2009-01-01	2009-12-31	AV. PEDRO LUCAS URRIBARRI, SECTOR PELE EL OJO			\N		\N		\N		\N	\N	\N	\N
2006	1	1	327	1	\N	CONSTRUCCIONES Y PROYECTOS DONPA C.A		J- 31490565-1	20060609000001	2009-01-01	2009-12-31	AV 14 ENTRE CALLE 8Y9 SECTOR SIERRA MAESTRA  CASA N 18-39			\N		\N		\N		\N	\N	\N	\N
2007	1	1	327	1	\N	CONSTRUCCIONES Y APLICACIONES TECNICAS C. A	CONATCA	J - 07042455-9	20060612000001	2009-01-01	2009-12-31	CALLE 76, AV. 4 BELLA VISTA, EDIF.  DON  MATIAS, OFICINA 5-A			\N		\N		\N		\N	\N	\N	\N
2008	1	1	327	1	\N	PROYECTOS Y CONSTRUCCIONES DE VENEZUELA, C.A.	P & C, C.A.	J-31193482-0	20060612000002	2009-01-01	2009-12-31	AV. 8 STA RITA,C.C. LAS CAROLINAS MEZANINE LOCAL 8 Y 9			\N		\N		\N		\N	\N	\N	\N
2009	1	1	327	1	\N	CORPORACION EMILY, C .A		J-  31405892- 4	20060614000001	2009-01-01	2009-12-31	AV. UNION SECTOR EL MANZANILLO.  C. COMERCIAL CAPRICORNIO  LOCAL N 1			\N		\N		\N		\N	\N	\N	\N
2010	1	1	327	1	\N	C.A   VIALES Y CIVILES		J. 07027137-0	20060615000001	2009-01-01	2009-12-31	AV. 3F  N 66- 82			\N		\N		\N		\N	\N	\N	\N
2011	1	1	327	1	\N	CONST  E  INVER  BERMUDEZ Y  SOCORRO  C.A	CIBYSCA	J- 31492622-5	20060616000001	2009-01-01	2009-12-31	CALLE N. 3-74 SECTOR  BELLO MONTE.  18  DE OCTUBRE			\N		\N		\N		\N	\N	\N	\N
2013	1	1	327	1	\N	PROYECTOS Y CONSTRUCCIONES  G  Y   B  ,C.A		J- 30866511-8	20060626000001	2009-01-01	2009-12-31	AV. 15 LAS DELICIAS  OTA GABY N 15A-25			\N		\N		\N		\N	\N	\N	\N
2014	1	1	327	1	\N	OMOCA   EQUIPOS Y TRASPORTE PARA LA CONSTRUCCION	OMOCA	J- 30507976- 5	20060627000001	2009-01-01	2009-12-31	BARRIO SUR AMERICA CALLE 150 N. 56-67			\N		\N		\N		\N	\N	\N	\N
2015	1	1	327	1	\N	MADICRIS  C. A		J- 30480443-1	20060627000002	2009-01-01	2009-12-31	CALLE ARAGUA N 60, SECTOR LA  PLAYA			\N		\N		\N		\N	\N	\N	\N
2016	1	1	327	1	\N	PROYECTOS Y CONSTRUCCIONES  ELI	PROCONELICA	J- 30739211-8	20060627000003	2009-01-01	2009-12-31	URB. LA MAROMA CALLE. 1 CASA A-13 SANTA BARBARA  DEL ESTADO  ZULIA			\N		\N		\N		\N	\N	\N	\N
2017	1	1	327	1	\N	REPRESENTACIONES  VALE,  C. A	REVALCA	J- 30120246-5	20060629000002	2009-01-01	2009-12-31	CALLEJON  PIAR N . 222			\N		\N		\N		\N	\N	\N	\N
2018	1	1	327	1	\N	R & F CONSTRUCCIONES  C.A		J- 31311864-8	20060629000001	2009-01-01	2009-12-31	AV.  9,  N.  78-68,  SECTOR LOS  MARISTAS			\N		\N		\N		\N	\N	\N	\N
2019	1	1	327	1	\N	PROYECTO MARINA,  C.A	MARINA`S	J-31539053-1	20060704000001	2009-01-01	2009-12-31	CALLE 72  SECTOR PARAISO EDIF. MIX  MONTIELCO LOCAL N. 20-22			\N		\N		\N		\N	\N	\N	\N
2020	1	1	327	1	\N	PULIRE SERVICIOS, COMPAÃ‘IA   ANONIMA	PULISERVI,C.A	J-30890529-1	20060706000001	2009-01-01	2009-12-31	KM 4 1/2 VIA A LA CAÃ‘ADA AL LADO DEL  CENTRO COMERCIAL FORCAREX			\N		\N		\N		\N	\N	\N	\N
2021	1	1	327	1	\N	CORPORACION    J.B.C,   C.A		J- 31327242-6	20060707000001	2009-01-01	2009-12-31	CALLE 79 LA LIMPIA SECTOR PANAMERICANO N.  69-36			\N		\N		\N		\N	\N	\N	\N
2022	1	1	327	1	\N	CONSTRUCCIONES E INVERSIONES PARAISO  C.A	CIPACA	31369712-5	20060712000001	2009-01-01	2009-12-31	CALLE 61 AVE. UNIVERSIDAD C.C VILLA NUEVA PISO 1 LOCAL 8			\N		\N		\N		\N	\N	\N	\N
2023	1	1	327	1	\N	CONSTRUCCIONES ESCOBAR MAVAREZ MAVARES, C.A	CEMM, C.A	30486570-8	20060721000001	2009-01-01	2009-12-31	AV 24 ENTRE D Y E SECTOR BARRIO UNION S/N TIA JUANA			\N		\N		\N		\N	\N	\N	\N
2024	1	1	327	1	\N	TEXAS ELECTRIC. SERVICE SOCIEDAD ANONIMA	T.E.S.S.A	J- 07047121-2	20060727000001	2009-01-01	2009-12-31	AV. 43 ESQUINA CARRETERA N.			\N		\N		\N		\N	\N	\N	\N
2025	1	1	327	1	\N	INVERSIONES  R Y L   C.A		J- 306765551-4	20060727000002	2009-01-01	2009-12-31	CALLE 64A, CON AV. 13 N 12-121  URBANIZACION  MARACAIBO			\N		\N		\N		\N	\N	\N	\N
2026	1	1	327	1	\N	CONSTRUCTORA ORION, SOCIEDAD ANONIMA	CONSORCIO	J- 31239956-2	20060807000001	2009-01-01	2009-12-31	AV. FALCON Y CONCEPCION CALLE BOLIVAR EMISORA 88.1 GANADERIA  C.C HDA C.A  PLANTA ALTA			\N		\N		\N		\N	\N	\N	\N
2027	1	1	327	1	\N	CONSTRUCCIONES  L.C.R,  C.A		J-31533801-7	20060815000001	2009-01-01	2009-12-31	AV. FUERZAS ARMADA VILLA BONITA  TORRE II P.H.C			\N		\N		\N		\N	\N	\N	\N
2028	1	1	327	1	\N	CONSTRUCCIONES  L. C.R, C.A		J- 31533801-7	20060816000001	2009-01-01	2009-12-31	AV. FUERZAS ARMADA VILLIA BONITA TORRE II PHC			\N		\N		\N		\N	\N	\N	\N
2029	1	1	327	1	\N	CONSTRUCCIONES L.C.R,  C.A		J-31533801-7	20060816000002	2009-01-01	2009-12-31	AV. FUERZAS ARMADA VILLA BONITA TORRE II PHC			\N		\N		\N		\N	\N	\N	\N
2030	1	1	327	1	\N	DISTRIBUIDORA Y REPRESENTACIONES  ROQUIVEN  C.A	ROQUIVEN	J- 30271119-3	20060823000001	2009-01-01	2009-12-31	AV. INTERCOMUNAL CALLE FALCON   N 15			\N		\N		\N		\N	\N	\N	\N
2031	1	1	327	1	\N	CONSTRUCCIONES Y SERVICIOS  HT  C.A		J- 31472725-7	20060824000001	2009-01-01	2009-12-31	AV. 82A N. 19F-08  SECTOR AYACUCHO			\N		\N		\N		\N	\N	\N	\N
2032	1	1	327	1	\N	BERMUDEZ  CONSTRUCCIONES, C.A	BECONCA	J- 30790822-0	20060828000001	2009-01-01	2009-12-31	SECTOR EL CEMENTERIO CALLE PRINCIPAL CASA   S/ N			\N		\N		\N		\N	\N	\N	\N
2033	1	1	327	1	\N	CONSTRUCCIONES, SERVICIOS, PROYECTOS Y SUMINISTROS C.A	CONSERPROCA	J- 31608820-0	20060905000001	2009-01-01	2009-12-31	AV. 15-D  N 54-38. URB. LA TRINIDAD			\N		\N		\N		\N	\N	\N	\N
2034	1	1	327	1	\N	INVERSIONES Y CONSTRUCCIONES  G & L. C.A		J- 31025807-4	20060908000001	2009-01-01	2009-12-31	AV.2 EL MILAGRO  C.C CARIBE  PISO 2 OFICINA 5			\N		\N		\N		\N	\N	\N	\N
2035	1	1	327	1	\N	ZONA SUR INVERSIONES Y SERVICIOS, C.A		J- 31265348-5	20060911000001	2009-01-01	2009-12-31	URB.  EL PORTAL  AV.  13 N 50- 153			\N		\N		\N		\N	\N	\N	\N
2036	1	1	327	1	\N	FERRETERIA  BERNARDO MORILLO  COMPAÃ‘IA  ANONIMA		J- 70713070-9	20060912000001	2009-01-01	2009-12-31	AV. GUAJIRA. VIA EL MOJAN KM 4 AV. 2. C.C  FERRE MALL			\N		\N		\N		\N	\N	\N	\N
2037	1	1	327	1	\N	CONSTRUCTORA  TURAGUAL, C.A	TURAGUAL, C.A.	J- 07053428-1	20060714000001	2009-01-01	2009-12-31	SECTOR 18 DE OCTUBRE CALLE M. ENTRE AV. 2 Y 3 N 3-53			\N		\N		\N		\N	\N	\N	\N
2038	1	1	327	1	\N	CONSTRUCTORA   3   M  I, C.A		J- 30742733-7	20060920000001	2009-01-01	2009-12-31	AV. 13 ENTRE CALLE 68 Y 69 CP  WIDAG  OFIC N 5			\N		\N		\N		\N	\N	\N	\N
2039	1	1	327	1	\N	INVERSIONES  PRA, C.A	PRACA	J- 30337064-0	20060920000002	2009-01-01	2009-12-31	AV. 15 DELICIAS ENTRE CALLE 75  Y  76 CASA N 25-75			\N		\N		\N		\N	\N	\N	\N
2040	1	1	327	1	\N	CONSTRUCCIONES  CONSARCA,  C.A		J- 31443440-3	20060922000001	2009-01-01	2009-12-31	AV. PRINCIPAL RURAL SANTA CRUZ DE MARA C.C  FINARCA			\N		\N		\N		\N	\N	\N	\N
2041	1	1	327	1	\N	CONSTRUCCIONES JAIMEN URDANETA C.A.	CONSJUCA	J-30615344-6	20060922000002	2009-01-01	2009-12-31	CALLE 4 MANZANA NO. 7 URB. LAS 40 CASA NO. 34 PQUIA. CARMEN HERRERA			\N		\N		\N		\N	\N	\N	\N
2042	1	1	327	1	\N	ICF,  C.A		J-31549504-O	20060922000003	2009-01-01	2009-12-31	5 DE JULIO CON AV. 15 DELICIAS EDIF CORAZON DE JESUS  APT. 3			\N		\N		\N		\N	\N	\N	\N
2043	1	1	327	1	\N	SERVICIOS Y MANTENIMIENTOS DEL LAGO,  C.A	SERMALAGO  CA	J- 30932476-4	20060925000001	2009-01-01	2009-12-31	CALLE 69-A E/ AV. 12  Y  13, SECTOR TIERRA NEGRA.  N 12- 38			\N		\N		\N		\N	\N	\N	\N
2044	1	1	327	1	\N	INVERSIONES Y CONTRUCCIONES CANTABRICO, S.A.	INCOARSA	J-31285514-2	20060925000002	2009-01-01	2009-12-31	CALLE MUNICIPAL. CASCO CENTRAL, CASA No. 91. LA VILLA DEL ROSARIO. EDO. ZULIA.			\N		\N		\N		\N	\N	\N	\N
2045	1	1	327	1	\N	SMA  INGENIEROS  Y CONSULTORES,  C.A		J- 30598806-4	20060928000001	2009-01-01	2009-12-31	AV. MILAGRO CRUZE 5 DE JULIO EDIF. LAGO PISO N 6			\N		\N		\N		\N	\N	\N	\N
2046	1	1	327	1	\N	S. M.  INVERSIONES COMPAÃ‘IA  ANONIMA.	SM  INVERSIONES  CA	J- 31296566- 5	20060928000002	2009-01-01	2009-12-31	AV. ANDRES BELLO ES. BP. AMBROSIO LOCAL 2 P.B			\N		\N		\N		\N	\N	\N	\N
2047	1	1	327	1	\N	M. C. P  OCCIDENTE,  C.A		J- 31515232-O	20061003000001	2009-01-01	2009-12-31	AV. 15 DELICIAS  ENTRE CALLE 69 Y 69A CC ESCA			\N		\N		\N		\N	\N	\N	\N
2048	1	1	327	1	\N	ELINSUBCA  C.A		J- 30940578-0	20061009000001	2009-01-01	2009-12-31	KM. 6.5 VIA LA CAÃ‘ADA DE URDANETA  FRENTE A LINEA  COSTA SUR MCPIO   SAN FCSO			\N		\N		\N		\N	\N	\N	\N
2049	1	1	327	1	\N	INVERSIONES  MEDINA,  COMPAÃ‘IA ANONIMA	INVMEDICA	J- 31125370-0	20061011000001	2009-01-01	2009-12-31	SECTOR 18 DE OCTUBRE CALLE   D  ENTRE AV 4 Y 5  N 5- 75			\N		\N		\N		\N	\N	\N	\N
2050	1	1	327	1	\N	OIL  SERVICE  &  MAINTENANCE  C.A	OILSERMA	J- 31283026-3	20061019000001	2009-01-01	2009-12-31	KILOMETRO 12 CAMPO UNO  CARRETERA 33			\N		\N		\N		\N	\N	\N	\N
2051	1	1	327	1	\N	CONTRATISTA  ALFOSERMA COMPAÃ‘IA ANONIMA	ALFOSERMA,  C.A	J- 07029241-5	20061023000001	2009-01-01	2009-12-31	AV.16 ENTRE CALLE 89D  Y  90N. 89D-  95			\N		\N		\N		\N	\N	\N	\N
2052	1	1	327	1	\N	INGENIERIA, DATOS Y TECNOLOGIA  COMPAÃ‘IA  ANONIMA	ID Y T, CA	J- 30983987-0	20061026000001	2009-01-01	2009-12-31	CALLE 68 ENTRE AV. 9 Y 9B  SECTOR TIERRA NEGRA CASA N 9- 97			\N		\N		\N		\N	\N	\N	\N
2053	1	1	327	1	\N	ASOCIACION CIVIL  C/ CAMILO CIENFUEGOS ( G.I.)		J-  30752222-4	20061101000001	2009-01-01	2009-12-31	AV. PPAL  SOFIA  CALDERON  SECTOR SAN PEDRO SACA N. 17-56			\N		\N		\N		\N	\N	\N	\N
2054	1	1	327	1	\N	SERVICIOS  Y  CONSTRUCCIONES C.A	SERCO. C.A	J- 30833070-1	20061108000001	2009-01-01	2009-12-31	URB: VISTA HERMOSA  SECTOR ALTAMIRA CALLE 106 A N. 86- 9A			\N		\N		\N		\N	\N	\N	\N
2057	1	1	327	1	\N	COOPERATIVA  DE SERVICIOS MULTIPLES CASIGUA 41	COOPESERVICA 41	J-31112783-6	20061113000001	2009-01-01	2009-12-31	BARRIO NORIEGA TRIGO SECTOR LA CRUZ  CASA S/N			\N		\N		\N		\N	\N	\N	\N
2058	1	1	327	1	\N	CONSTRUCCIONES E INVERSIONES COMPOSTELA SOCIEDAD ANONIMA	CONCOSA	J-31283568-0	20061113000002	2009-01-01	2009-12-31	KM.90 SAN JUAN II,VILLA DEL ROSARIO			\N		\N		\N		\N	\N	\N	\N
2059	1	1	327	1	\N	EDIFICACIONES 50/50, C.A.		J-07056038-0	20061114000001	2009-01-01	2009-12-31	AV. 3C CON CALLE 67A CC RESIDENCIA DEL LADO PISO 1 OF 11			\N		\N		\N		\N	\N	\N	\N
2060	1	1	327	1	\N	R & V CONSTRUCCIONES, C.A..	R & V	J-31540425-7	20061116000001	2009-01-01	2009-12-31	SECTOR SANTA RITA C. 63 CON AV. UNIVERSIDAD CASA NO. 8B-71			\N		\N		\N		\N	\N	\N	\N
2061	1	1	327	1	\N	INFRAESTRUCTURAS VENEZOLANAS COMPAÃ‘IA ANONIMA	INFRAVE,C.A.	J-31161688-8	20061117000001	2009-01-01	2009-12-31	CARRETERA L, CIUDAD OJEDA,C.C. VILLA SAN JOSE LOCAL 02			\N		\N		\N		\N	\N	\N	\N
2062	1	1	327	1	\N	SUMINISTROS E INSTALACIONES G & V, C.A	G & V, C.A	J- 30640303-5	20061129000001	2009-01-01	2009-12-31	CALLE 72 ENTRE AV. 13 Y 13A CENTRO COMERCIAL LOS CORALES LOCAL  10			\N		\N		\N		\N	\N	\N	\N
2063	1	1	327	1	\N	PROMOCIONES 2004, C.A.	PROMOCIONES 2004	J-31122012-7	20061207000001	2009-01-01	2009-12-31	CIRCUNVALACION 2 CENTRO DE CONVERSIONES DE MARACAIBO LOCAL 54			\N		\N		\N		\N	\N	\N	\N
2064	1	1	327	1	\N	SERV  Y  DESARR  AMBIEN  COMPAÃ‘IA  ANONIMA	SERDAMCA	J- 31448740-0	20061212000001	2009-01-01	2009-12-31	CARRETERA EL MOJAN STA CRUZ DE MARA C.C  TU  Y  YO  LOCAL  5			\N		\N		\N		\N	\N	\N	\N
2065	1	1	327	1	\N	INVERSIONES  Y PROYECTOS  MARACAIBO  C.A	INPROMACA	J-  31652772-7	20061212000002	2009-01-01	2009-12-31	AV. 62  CUMBRE DE MARACAIBO			\N		\N		\N		\N	\N	\N	\N
2066	1	1	327	1	\N	INVERSIONES  CARRISANZ,  C.A.		J- 30013897-6	20061222000001	2009-01-01	2009-12-31	URBANIZACION  LAS AMERICAS CALLE ECUADOR N. D- 28			\N		\N		\N		\N	\N	\N	\N
2067	1	1	327	1	\N	GEOLOGIA  VENEZOLANA,  COMPAÃ‘IA  ANONIMA	GEOVENCA	J-  30332485-1	20070104000001	2009-01-01	2009-12-31	SECTOR PARAISO,ESQ. AV.22 A CALLE 70,C.C.TAICUPA LOCAL 29 Y 30			\N		\N		\N		\N	\N	\N	\N
2068	1	1	327	1	\N	R &  C, CONSTRUCCIONES Y MANTENIMIENTO  C.A		J- 07035320-1	20070108000001	2009-01-01	2009-12-31	SECTOR CASCO CENTRAL   AV.04 CASA  N. 94-55			\N		\N		\N		\N	\N	\N	\N
2069	1	1	327	1	\N	CONSTRUCCIONES PRIETO & ASOCIADOS,  C.A	CONPRICA	J-  31637925-6	20070109000001	2009-01-01	2009-12-31	URBA  ZAPARA  AV. 8  ESQ  CON CALLE 58 EDIF CLINIMED LOCAL  2PB			\N		\N		\N		\N	\N	\N	\N
2070	1	1	327	1	\N	ARQUIT CONSTRU INDUS CIVILES Y TRASPORTE C.A	ACICT C.A	J- 31595939-9	20070110000001	2009-01-01	2009-12-31	AV. 5 LA MONTAÃ‘ITA QUINTA SANTA RITA 1M-45			\N		\N		\N		\N	\N	\N	\N
2071	1	1	327	1	\N	SUMINISTROS & SERVICIOS OCCIDENTE C.A	SERVIOCA	J- 31115620-8	20070111000001	2009-01-01	2009-12-31	AV 12 SECTOR 5 DE JULIO, EDIF TORRE 12 OFIC 1-  A			\N		\N		\N		\N	\N	\N	\N
2072	1	1	327	1	\N	PETROLEUM DELIVERY AND SERVICE S.A	PETRODAS	J- 31043833-1	20070115000001	2009-01-01	2009-12-31	C.C LAS TEJAS AV. 20 SECTOR PARAISO PRIMER PISO OFIC 3-11			\N		\N		\N		\N	\N	\N	\N
2073	1	1	327	1	\N	PROYECTOS Y SERVICIOS VENEZOLANOS C.A	PROSERVENCA	J- 31129648-4	20070115000002	2009-01-01	2009-12-31	SECTOR PARAISO CALLE 69 AV. 18 Y 19-22			\N		\N		\N		\N	\N	\N	\N
2074	1	1	327	1	\N	IPTEL COMPAÃ‘IA ANONIMA		J- 30755477-0	20070126000001	2009-01-01	2009-12-31	TIERRA NEGRA ESQUINA AV.13A N ALLE 75  EDIF FIRST PISO 2A- 2B			\N		\N		\N		\N	\N	\N	\N
2075	1	1	327	1	\N	CONSTRUCTIVE & HEALTH COMPAÃ‘IA ANONIMA	COSHEL C. A	J- 31704346-4	20070202000001	2009-01-01	2009-12-31	ZONA INDUSTRIAL LOS ROBLES AV. 59 C/ CALLE 114 CASA 114D  20  114D-20			\N		\N		\N		\N	\N	\N	\N
2076	1	1	327	1	\N	INGENERIA DE CONSTRUCCIONES Y MANTENIMIENTO C.A	INCONMACA	J- 30766016-3	20070205000001	2009-01-01	2009-12-31	AV 15 DELICIAS C/ CALLE 72 C EMPRESARIAL PASEO 72 LOCAL 18			\N		\N		\N		\N	\N	\N	\N
2077	1	1	327	1	\N	CONSTRUCCIONES DE COLON C.A	CODELCO C.A	J- 30457728-1	20070212000001	2009-01-01	2009-12-31	SECTOR SIERRA MAESTRA STA BARBARA CALLE 6 N. 6-50			\N		\N		\N		\N	\N	\N	\N
2078	1	1	327	1	\N	ELECTROLOGIA  COMPAÃ‘IA  ANONIMA		J- 07011822-9	20070222000001	2009-01-01	2009-12-31	LOS ACEITUNOS AV. 69A N. 80B- 105			\N		\N		\N		\N	\N	\N	\N
2079	1	1	327	1	\N	CONSTRUCCONES VICTOR  Y ANTONIO COMPAÃ‘IA  ANONIMA	CONVIANCA	J- 30737395-4	20070227000001	2009-01-01	2009-12-31	URBANIZACION MONTE BELLO AV. 8 CALLE K CASA N. 8 -08			\N		\N		\N		\N	\N	\N	\N
2080	1	1	327	1	\N	CONSTRUCTORA C3M COMPAÃ‘A ANONIMA		J- 31582689-5	20070227000002	2009-01-01	2009-12-31	URB CAMINOS DEL DORAL AV. 12C A51			\N		\N		\N		\N	\N	\N	\N
2081	1	1	327	1	\N	CONSTRUCTORA TORRES COMPAÃ‘IA ANONIMA	TOCA	J- 31498032-7	20070301000001	2009-01-01	2009-12-31	CALLE 34B DORAL NORTE CASA 12 -51			\N		\N		\N		\N	\N	\N	\N
2082	1	1	327	1	\N	N&C  CONSULTORES S.A		J- 07056030-4	20070302000001	2009-01-01	2009-12-31	AV DELICIAS CON CALLE 72 SECTOR PARAISO CC. PASEO 72 PISO 1 LOCAL 23C			\N		\N		\N		\N	\N	\N	\N
2083	1	1	327	1	\N	DEL SUR OBRAS Y SERVICOS COMPAÃ‘IA ANONIMA	DELSURCA	J- 30774046-9	20070305000001	2009-01-01	2009-12-31	URBANIZACION LA ESQ COROMOTO  C. 172  N. 41- 128			\N		\N		\N		\N	\N	\N	\N
2084	1	1	327	1	\N	COPIADORAS Y EQUIPOS DE OFICINA COMPAÃ‘IA ANONIMA	COPYOFI CA	J- 30709919-4	20070104000002	2009-01-01	2009-12-31	AV. 15 CON CALLE 69 C. COMERCAL UNIVERSITARIO PISO 1			\N		\N		\N		\N	\N	\N	\N
2085	1	1	327	1	\N	CONSTRUCTORA LUVIL C.A	CONSLUVILCA	J- 31625203-3	20070314000001	2009-01-01	2009-12-31	AV.15 DELICIAS CALLE 89B EDIF LA PALMERA LOCAL 01-01 PISO 1			\N		\N		\N		\N	\N	\N	\N
2086	1	1	327	1	\N	LUBRICANTES TEXAS COMPAÃ‘IA ANONIMA	LUBRITEX CA	J- 30596880-2	20070315000001	2009-01-01	2009-12-31	AV. 8 SANTA RITA N. 83-68			\N		\N		\N		\N	\N	\N	\N
2087	1	1	327	1	\N	CONSTRUCCIONES Y SERVICIOS G& V COMPAÃ‘IA ANONIMA	CONGEVECA	J-30820314-9	20070320000001	2009-01-01	2009-12-31	SECTOR BELLA VISTA, CALLE  72  ENTRE AV. 4 Y 8 CLODOMIRA LOCAL 2-10			\N		\N		\N		\N	\N	\N	\N
2088	1	1	327	1	\N	INVERSIONES BECERRA OJEDA, CA	INBOCA	J- 31536341-0	20070323000001	2009-01-01	2009-12-31	SECTOR LOS OLIVOS CALLE 64 RIO DE JANEIRO			\N		\N		\N		\N	\N	\N	\N
2089	1	1	327	1	\N	PEDRO D CLIMASTONE FUENTES		V- 02772267-5	20070329000001	2009-01-01	2009-12-31	URBA  LAS 5O CALLE 2 CASA No. 14			\N		\N		\N		\N	\N	\N	\N
2090	1	1	327	1	\N	CONSTRUCTORA MONACO C.A		J- 31628009-8	20070402000001	2009-01-01	2009-12-31	AV. 67- 1 BARRIO 19 DE ABRIL CASA N. 99C- 48			\N		\N		\N		\N	\N	\N	\N
2091	1	1	327	1	\N	GOLLARZA & CARDOZO , CONSTRUCCIONES, C.A	G & C, C.A	J-29366607-4	20070402000002	2009-01-01	2009-12-31	POMONA SECTOR COREA, CALLE SAN LUIS N. 105A			\N		\N		\N		\N	\N	\N	\N
2092	1	1	327	1	\N	PETROFAUSTO ZULIA, S.A		J- 31609260-7	20070402000003	2009-01-01	2009-12-31	CALLE J N.2-34 18 DE OCTUBRE			\N		\N		\N		\N	\N	\N	\N
2093	1	1	327	1	\N	GRUPO EMPRESARIAL LA ARBOLEDA, C.A.		J-31498409-8	20070410000001	2009-01-01	2009-12-31	CARRETERA HURB. LOS LAURELES, EDIF. LA ARBOLEDA, NÂª 421, OFI. 1			\N		\N		\N		\N	\N	\N	\N
2094	1	1	327	1	\N	TRANSPORTE Y SERVICIOS DE MANTENIMIENTO C.A.	TRANSERMACA	J-30694595-4	20051130000003	2009-01-01	2009-12-31	CALLE 90 No. 3-45 SECTOR SANTA LUCIA			\N		\N		\N		\N	\N	\N	\N
2095	1	1	327	1	\N	GEMA CONSTRUCCION C.A.		J-30157188-6	20070412000001	2009-01-01	2009-12-31	URB. CANTA CLARO, AV. 11 C, CASA NO. 52-298			\N		\N		\N		\N	\N	\N	\N
2096	1	1	327	1	\N	INVERSIONES 1990, C.A.		J-31249983-4	20070417000001	2009-01-01	2009-12-31	AV. 9 B, con calle 68 sector tierra negra No- 9B-08			\N		\N		\N		\N	\N	\N	\N
2097	1	1	327	1	\N	CONSTRUCCIONES LAGO COMPAÃ‘IA ANONIMA	CONLACA	J-29383051-6	20070426000001	2009-01-01	2009-12-31	SECTOR TIERRA NEGRA,AV,13 CON CALLE PROFESIONAL WIDASG,NIVEL 1,LOCAL 2.			\N		\N		\N		\N	\N	\N	\N
2098	1	1	327	1	\N	A.C.H. CONSTRUCCIONES C.A		J- 31656061-9	20070510000001	2009-01-01	2009-12-31	CALLE 59 CON AV. 12 SECTOR EL PILAR CASA 58A- 33			\N		\N		\N		\N	\N	\N	\N
2099	1	1	327	1	\N	MANUEL  LOPEZ & ASOCIODOS, C.A	MALOASCA	J-31225805-5	20070514000001	2009-01-01	2009-12-31	BOLIVAR AV. CALLE 99C N. 257			\N		\N		\N		\N	\N	\N	\N
2100	1	1	327	1	\N	CONSTRUCCIONES C&B, C.A		J-30043338-2	20070516000001	2009-01-01	2009-12-31	AV. CUMANA RESD CUMANA LOCAL N. 01			\N		\N		\N		\N	\N	\N	\N
2101	1	1	327	1	\N	ASFALTADORA LA CHINITA, C.A		J- 31658550-6	20070521000001	2009-01-01	2009-12-31	VIA PALITO BLANCO ENTRANDO POR DEPOSITO LICORES EL CHAPARRON			\N		\N		\N		\N	\N	\N	\N
2102	1	1	327	1	\N	PROYECTOS CIVILES Y MARITIMOS 2000 C.A.	PCM 2000 C.A	J- 30602795- 5	20070528000001	2009-01-01	2009-12-31	SIERRA MAESTRA AV. 12 CALLE 14 N. 13-66			\N		\N		\N		\N	\N	\N	\N
2103	1	1	327	1	\N	CORPO. VENEZOLANA DE CONST CA	CVCON, CA	J- 30516088-0	20070604000001	2009-01-01	2009-12-31	CALLE 72 CON AV. 3C EDIF VIRGINIOA PISO 4 APTO 4			\N		\N		\N		\N	\N	\N	\N
2104	1	1	327	1	\N	SUPLIDORA DE BIENES Y SERVICIOS, S.A	SUPLISERCA	J- 31137092-7	20070604000002	2009-01-01	2009-12-31	AV. 13A ENTRE CALLE 67 Y 67A, EDIFICIO LA ORQUIDEA LOCAL 1 PB, SECTOR TIERRA NEGRA			\N		\N		\N		\N	\N	\N	\N
2105	1	1	327	1	\N	TRANSWORLD TRADER, C.A		J- 30538663-3	20070605000001	2009-01-01	2009-12-31	SECTOR VILLA MAGNA CALLE 70 CON AV. 23 EDF VILLA MAGNA			\N		\N		\N		\N	\N	\N	\N
2106	1	1	327	1	\N	PROYECTOS E INVERSIONES CABIMAS S.A	PROINCASA	J- 31228908-2	20070606000001	2009-01-01	2009-12-31	URB BUENA VISTA RES BUENA VISTA CALLE PRINCIPAL N. 02			\N		\N		\N		\N	\N	\N	\N
2107	1	1	327	1	\N	CORPORACION  M&B, C.A	M&B	J- 29392568-1	20070407000001	2009-01-01	2009-12-31	SECTOR BELLOSO CALLE 89O 10 - 30			\N		\N		\N		\N	\N	\N	\N
2108	1	1	327	1	\N	OBRAS CIVILES, PETRO Y TRASNP. HER. B. C.A	HERBARCA	J- 31642140-6	20070608000001	2009-01-01	2009-12-31	CALLE 103 N 19 J -70 SABANETA			\N		\N		\N		\N	\N	\N	\N
2109	1	1	327	1	\N	SISTEMAS EX, C.A	SISTEX	J- 30269108-7	20070612000001	2009-01-01	2009-12-31	CALLE 76, ENTRE AV. 14 A-15 RESD ISAMAR, LOCAL 2-3 PB			\N		\N		\N		\N	\N	\N	\N
2110	1	1	327	1	\N	CONSTRUCTORA LOS ANDES C.A	COANCA	J- 30008548-1	20070613000001	2009-01-01	2009-12-31	78 CON  12 EDIF  TORRE 12 PISO 09			\N		\N		\N		\N	\N	\N	\N
2112	1	1	327	1	\N	CONSTRUCCIONES VICMARALF, C.A		J- 31257154-3	20070619000001	2009-01-01	2009-12-31	AV. 32 CALLE SAN BENITO BARRIO SAN VICENTE SECTOR EL LICERO, PARQ HERNANDEZ MUNIC CABIMA			\N		\N		\N		\N	\N	\N	\N
2113	1	1	327	1	\N	CONSULTORES OCCIDENTALES DE INGENERIA, S.A	COINSA	J- 07045272-2	20070620000001	2009-01-01	2009-12-31	AV. 12 SECTOR 5 DE JULIO EDIF TORRE  12 OFICINA 8			\N		\N		\N		\N	\N	\N	\N
2114	1	1	327	1	\N	AGRUPACION MACHER, C A	MACHERCA	J- 30776031-1	20070622000001	2009-01-01	2009-12-31	AV. 17 RAFAEL MARIA BARALT, SECTOR EL PARAISO			\N		\N		\N		\N	\N	\N	\N
2115	1	1	327	1	\N	SIERRA  NORTE CONSTRUCCIONES C.A	SIENCCA	J- 31544522-0	20070627000001	2009-01-01	2009-12-31	AV. 16 GUAJIRA  C.C FRIUL LOCAL 3 P B			\N		\N		\N		\N	\N	\N	\N
2116	1	1	327	1	\N	INGENIEROS CONSTRUCTORES C.A	INCOCA	J- 09007868-1	20070629000001	2009-01-01	2009-12-31	JESUS PINTO CALLE 2 URB ALFONZO COPOS CASA N. 2 CASIGUA DEL CUBO			\N		\N		\N		\N	\N	\N	\N
2117	1	1	327	1	\N	IRON WOLTER & LA GUARDIA, S.A	IWOSA, S.A	J- 07044038-4	20070719000001	2009-01-01	2009-12-31	KM 7 CARRETERA EL MOJAN ZONA IND NORTE			\N		\N		\N		\N	\N	\N	\N
2118	1	1	327	1	\N	MANTENIMIENTO Y SERVICIOS J.E.S.  C.A	MANT Y SERV. J.E.S. C.A	J- 30671635-1	20070726000001	2009-01-01	2009-12-31	CORITO AV. INTERCOMUNAL JES 719-B			\N		\N		\N		\N	\N	\N	\N
2120	1	1	327	1	\N	CORPORACION CEDEÃ‘O MOLERO  C.A	CORCEMOCA	J- 31251624-0	20070816000001	2009-01-01	2009-12-31	C.COMERCIAL GALILEO PLAZA NIVEL II LOCAL 13			\N		\N		\N		\N	\N	\N	\N
2121	1	1	327	1	\N	HJ INVERSIONES Y CONSTRUCCIONES  C.A	HJIC,C.A	J- 29419719-1	20070820000001	2009-01-01	2009-12-31	CALLE 89E CON AV. 14-A CASA N. 14A-A 23. SECTOR BELLOSO			\N		\N		\N		\N	\N	\N	\N
2122	1	1	327	1	\N	ASESORIA & SERVICIOS MONTIEL C.A	ASERMO, C.A	J- 31565841-O	20070820000002	2009-01-01	2009-12-31	SANTA BARBARA ESTADO ZULIA, MUNICIPIO COLON			\N		\N		\N		\N	\N	\N	\N
2123	1	1	327	1	\N	INVERSIONES VEGA C.A	INVECA	J-  31589178-6	20070821000001	2009-01-01	2009-12-31	CALLE 77 ENTRE AV. 14 Y 15 EDIF TORRE 77. PISO 5			\N		\N		\N		\N	\N	\N	\N
2124	1	1	327	1	\N	SERVICIOS Y CONSTRUCCIONES MENDOZA   C.A	SECOMECA	J- 31159248-2	20070903000001	2009-01-01	2009-12-31	AV. 15 B/ CON CALLE 22 N. 15B- AV FUERZAS ARMADAS MARACAIBO			\N		\N		\N		\N	\N	\N	\N
2125	1	1	327	1	\N	CIVILES, METALICAS Y ELECTRICAS, C.A	CIVIMECA	J- 30461058-0	20070907000001	2009-01-01	2009-12-31	CALLE 72 N. 3F- 7C			\N		\N		\N		\N	\N	\N	\N
2126	1	1	327	1	\N	CONSTRUCCIONES CARMONA, S.A	CONTRUCASA	J- 07046888-2	20070921000001	2009-01-01	2009-12-31	AV.20 CON CALLE 72 C.C MONTIELCO 5 TO PISO OFC -4			\N		\N		\N		\N	\N	\N	\N
2127	1	1	327	1	\N	MANT Y SERVICIOS INDUSTRIALES FERNOGAL, C.A		J- 29443901-2	20071001000001	2009-01-01	2009-12-31	SECTOR BARRIO PEDREGAL AV. 82 CASA S/N			\N		\N		\N		\N	\N	\N	\N
2128	1	1	327	1	\N	IMPORTACIONES Y SERVICIOS. C.A	IMPROSER,C.A	J-30566011-5	20071004000001	2009-01-01	2009-12-31	AV. 4 BELLA VISTA CON CALLE 67 CECILIO ACOSTA., EDIF BLITZ, PRIMER PISO, OFIC 3			\N		\N		\N		\N	\N	\N	\N
2129	1	1	327	1	\N	MAQUINARIAS DEL SUR,C.A		J- 31552460-0	20071015000001	2009-01-01	2009-12-31	URB LA COROMOTO CALLE 170 N. 43-43			\N		\N		\N		\N	\N	\N	\N
2130	1	1	327	1	\N	COOPERATIVA PRODUC QUIMICOS MARACAIBO 03.R.L		J- 31377493-6	20071109000001	2009-01-01	2009-12-31	AV. 50 SECTOR LOS ESTANQUES, CASA N. 110-63  LOCAL N. 2			\N		\N		\N		\N	\N	\N	\N
2131	1	1	327	1	\N	MANTENIMIENTO Y CONSTRUCCION BASERAND. C.A		J- 31311449-9	20071113000001	2009-01-01	2009-12-31	LA CONCEPCION MCPIO JESUS E LOSADA			\N		\N		\N		\N	\N	\N	\N
2132	1	1	327	1	\N	SUMINISTROS TAMARE,COMPAÃ‘IA ANONIMA	SUTACA	J-30647662-8	20071120000001	2009-01-01	2009-12-31	SECTOR TASAJERA, AV. INTERCOMUNAL, ENTRE O Y P			\N		\N		\N		\N	\N	\N	\N
2133	1	1	327	1	\N	CONSTRUCTORA PARAISO, COMPAÃ‘IA ANONIMA	CONPARCA	J- 31508862-2	20071121000001	2009-01-01	2009-12-31	CALLE 27 AV. 8 Y 9  SAN BENITO  SAN FRANCISCO			\N		\N		\N		\N	\N	\N	\N
2134	1	1	327	1	\N	ASOCIACION COOPERATIVA H-G-M	H-G-M	J-31538637-2	20071121000002	2009-01-01	2009-12-31	SECTOR INDIO MARA AV. 21 CALLE 69 N. 69-60			\N		\N		\N		\N	\N	\N	\N
2135	1	1	327	1	\N	INVERSIONES DAJAR, C.A		J- 30179576-8	20071130000001	2009-01-01	2009-12-31	AV. 53 CASA N. 21			\N		\N		\N		\N	\N	\N	\N
2137	1	1	327	1	\N	ITS TECNOLOGIA VIAL,C.A		J- 29432427-4	20071213000001	2009-01-01	2009-12-31	CENTRO COMERCIAL LA COLINA PB LOCAL 3 CALLE 84 ENTRE 2 Y 2B SECTOR VALLE FRIO			\N		\N		\N		\N	\N	\N	\N
2138	1	1	327	1	\N	INVERSIONES HERRERA MORILLO, C.A	HERMOCA	J- 29503592-6	20071220000001	2009-01-01	2009-12-31	AV. 3Y PLANTA ALTA LOCAL 4 EDIF SAM MARTIN			\N		\N		\N		\N	\N	\N	\N
2139	1	1	327	1	\N	INVERSORA Y CONSTRUCTORA CEUTA, C.A	CEUTACA	J- 31640895-7	20080110000001	2009-01-01	2009-12-31	URBA LA VICTORIA AV. 75-A CALLE 67-O8			\N		\N		\N		\N	\N	\N	\N
2140	1	1	327	1	\N	GRATING COMPAÃ‘IA ANONIMA	GRATING. C.A	J- 30489617-4	20080121000001	2009-01-01	2009-12-31	AV. ALONSO DE OJEDA ESQ. AV. INTERCOMUNAL CIUDAD OJEDA			\N		\N		\N		\N	\N	\N	\N
2141	1	1	327	1	\N	INVERSIONES D & B, C.A.		J-31247703-2	20080128000001	2009-01-01	2009-12-31	CABIMAS			\N		\N		\N		\N	\N	\N	\N
2142	1	1	327	1	\N	INGENERIA DE OBRAS C.A	INOCA	J- 29381731-5	20080131000001	2009-01-01	2009-12-31	URB. LA PARAGUA. EDIF CARUACHI 1 APTO 5B			\N		\N		\N		\N	\N	\N	\N
2143	1	1	327	1	\N	CONSTRUCCIONES CIVILES, VIALES E INVERSIONES C.A.	COVINCA	J- 31528744-7	20080131000002	2009-01-01	2009-12-31	CALLE 76, SECTOR LA LAGO VILLA OFIC II, PISO N. 4			\N		\N		\N		\N	\N	\N	\N
2144	1	1	327	1	\N	DEMARCACIONES Y SEÃ‘ALIZACIONES OCCIDENTE C.A	DEMARCA, C.A	J-29412910 -2	20080131000003	2009-01-01	2009-12-31	CALLE 65 C. EDIF ORITUCO PISO 7 APTO 7-D URB CIUDAD DE LA FARIA			\N		\N		\N		\N	\N	\N	\N
2145	1	1	327	1	\N	COMSTRUCCIONES Y MANTENIMIENTO VALENTY.C.A		J- 31647369-4	20080201000001	2009-01-01	2009-12-31	VIA EL MOJAN SECTOR MONTE VERDE C.C SAN RAFAEL LICAL 1 P. A DIAGONAL AL PEAJE SAN RAFAEL			\N		\N		\N		\N	\N	\N	\N
2146	1	1	327	1	\N	SERVICIOS, CONSTRUCCIONES Y MANTENIMIENTO VALENTY C.A.		J-31647369-4	20080201000002	2009-01-01	2009-12-31	EL MOJAN SECTOR MONTE VERDE. C.C. SAN RAFAEL			\N		\N		\N		\N	\N	\N	\N
2147	1	1	327	1	\N	LAGO MARINE SERVICES,COMPAÃ‘IA ANONIMA	LAGOSERCA	J- 30612252-4	20080201000003	2009-01-01	2009-12-31	CALLE 72 ENTRE AV. 13 Y  13A C.C. LOS CORALES LOCAL N. 4			\N		\N		\N		\N	\N	\N	\N
2148	1	1	327	1	\N	CONSULTORIA E INGENERIA DE PROCESOS. C.A	CIPCA	J-  29356299-6	20080206000001	2009-01-01	2009-12-31	CALLE Dr PORTILLO			\N		\N		\N		\N	\N	\N	\N
2149	1	1	327	1	\N	CONSTRUCCIONES MECANICAS PIRAZZO, C.A	COMECA	J- 07029682-8	20080208000001	2009-01-01	2009-12-31	SECTOR CORAZON DE JUSUS CALLE 2 N. 1-91			\N		\N		\N		\N	\N	\N	\N
2150	1	1	327	1	\N	INGENA.C.A		J- 31099499-4	20080213000001	2009-01-01	2009-12-31	AV. 14A ENTRE CALLE 76 Y 75 EDIF MIRANDA P.B LOCAL 6			\N		\N		\N		\N	\N	\N	\N
2151	1	1	327	1	\N	AMBIENTALES Y CONSTRUCCIONES INTEGRALES C.A	A.C.I.C.A	J- 29386416-0	20080220000001	2009-01-01	2009-12-31	AV. 13 CON CALLE 88 LOC 8 SECTOR BELLOSO			\N		\N		\N		\N	\N	\N	\N
2152	1	1	327	1	\N	SERVI CONSTRUCCIONES F.A.R.C.A	SCFARCA	J- 30751841-3	20080221000001	2009-01-01	2009-12-31	AV. 13 N. 90- 64 SECTOR BELLOSO			\N		\N		\N		\N	\N	\N	\N
2153	1	1	327	1	\N	CONSTRUCTORA P Y M DEL ZULIA, C.A.	P Y M DEL ZULIA, C.A.	J-07052671-8	20080303000001	2009-01-01	2009-12-31	MARACAIBO			\N		\N		\N		\N	\N	\N	\N
2154	1	1	327	1	\N	DAVID & BEATRIZ C.A.	DABECA	J- 30704837-9	20080303000002	2009-01-01	2009-12-31	AV. 16 CON CALLE 89B. C.C  DELICIASII LOCAL N. 7			\N		\N		\N		\N	\N	\N	\N
2155	1	1	327	1	\N	CONSTRUCCIONES H-M, C.A.		J-30644639-7	20080307000001	2009-01-01	2009-12-31	AV. 41 SECTOR LR CASA NÂº 2 VIA LAGUNILLAS			\N		\N		\N		\N	\N	\N	\N
2156	1	1	327	1	\N	CONSTRUCCIONES, MANTENIMIENTO, INSPECCIONES  E INVERSIONES C.A.	C & M C.A.	J-31437655-1	20080310000001	2009-01-01	2009-12-31	URB. ALTOS DEL SOL AMADA 1ERA. ETAPA AV. BARALT No. 280			\N		\N		\N		\N	\N	\N	\N
2157	1	1	327	1	\N	CORPORACION LYNQUS C.A.		J-31170865-0	20080314000001	2009-01-01	2009-12-31	EDIF. REGIONAL PISO 2			\N		\N		\N		\N	\N	\N	\N
2158	1	1	327	1	\N	SERVICIOS DE INGENIERIA, PROCURA Y CONSTRUCCION DE OBRAS, C.A.	SIPCA	J-29443881-4	20080317000001	2009-01-01	2009-12-31	URB. JUANA DE AVILA, AV. 15C # 66C-46			\N		\N		\N		\N	\N	\N	\N
2159	1	1	327	1	\N	INVERSIONES GONTA, COMPAÃ‘IA ANONIMA	GONTA, C.A.	J-29541495-1	20080317000002	2009-01-01	2009-12-31	AV. 82A NO. 79F-08 SECTOR AYACUCHO			\N		\N		\N		\N	\N	\N	\N
2160	1	1	327	1	\N	COOPERATIVA VALPERCA. R.L		J- 31592200-2	20080327000001	2009-01-01	2009-12-31	5 DE JULIO DIF REGIONAL			\N		\N		\N		\N	\N	\N	\N
2161	1	1	327	1	\N	COOPERATIVA GUAICAIPURO Y PARAMACONI		J- 31534798-9	20080328000001	2009-01-01	2009-12-31	SAN FRANCISCO SECTOR SAN BENITO AV. 12 CASA N. 28-5			\N		\N		\N		\N	\N	\N	\N
2162	1	1	327	1	\N	CONSTRUCCIONES INTERNACIONAL SURAMERICANA C.A	CONINSUCA	J- 29497664-6	20080404000001	2009-01-01	2009-12-31	URB. MONTE BELLO CALLE J N. 7-50			\N		\N		\N		\N	\N	\N	\N
2163	1	1	327	1	\N	K&P SUPPLY. C.A		J- 31060600-5	20080408000001	2009-01-01	2009-12-31	SECTOR BELLOSO CALLE 82 AV. 13B GRUPO ASSPER LOCAL 10 P.A			\N		\N		\N		\N	\N	\N	\N
2164	1	1	327	1	\N	CONTRIVEN COMPAÃ‘IA ANONIMA	CONTRIVENCA	J- 31313891-6	20080409000001	2009-01-01	2009-12-31	AV. 3G SECTOR LA LAGO N. 65-78			\N		\N		\N		\N	\N	\N	\N
2165	1	1	327	1	\N	INVERSIONES INGOY.  C.A	INGOYCA	J- 30547280-7	20080410000001	2009-01-01	2009-12-31	AV 3G SECTOR LA LAGO			\N		\N		\N		\N	\N	\N	\N
2166	1	1	327	1	\N	HERIZE, C.A		J- 30985317-1	20080418000001	2009-01-01	2009-12-31	AV. 9 CON CALLE 67-B EDF MURCA APTO 1O			\N		\N		\N		\N	\N	\N	\N
2167	1	1	327	1	\N	CONSTRUCTORA ZACO S.A.	ZACO S.A.	J- 30751462-0	20080424000001	2009-01-01	2009-12-31	CALLE 75 ENTRE AV. 13A Y 14A C/C PRIMAVERA, OF 17 SECTOR TIERRA NEGRA			\N		\N		\N		\N	\N	\N	\N
2168	1	1	327	1	\N	INVERSIONES 27 DE NOVEMBRE COMPAÃ‘IA ANONIMA		J- 31434513-3	20080425000001	2009-01-01	2009-12-31	AV. INTERCOMUNAL N. 92 SECTOR AMPARITO			\N		\N		\N		\N	\N	\N	\N
2169	1	1	327	1	\N	J.A CONSTRUCCIONES CIVILES E INDUSTRIALES C.A		J- 29386440-2	20080506000001	2009-01-01	2009-12-31	CALLE 162 CON AV. 37 CASA 162-18 SECTOR BARRIO DIVINO NIÃ‘O			\N		\N		\N		\N	\N	\N	\N
2170	1	1	327	1	\N	ASOCIACION COOPERATIVA LA TOÃ‘ECA 2589,R.L	LA TOÃ‘ECA 2589 . R.L	J- 29545462-7	20080507000001	2009-01-01	2009-12-31	AV. LA LIMPIA SECTOR AYACUCHO CALLE 79 G. CASA 80- C. 48			\N		\N		\N		\N	\N	\N	\N
2171	1	1	327	1	\N	TRASPORTE Y CONSTRUCCIONES L&M C.A		J- 31514117-5	20080508000001	2009-01-01	2009-12-31	C.A PISO PB, LOCAL 1-B SECTOR ANCOR ALTO MARACAIBO			\N		\N		\N		\N	\N	\N	\N
2172	1	1	327	1	\N	COOPERATIVA ISAIAS  MEDINA ANGARITA	COIMA. R.S	J- 29567629-8	20080509000001	2009-01-01	2009-12-31	AV. H CON CALLE CARABOBO CC PARAISO MALL ALTA, LOCAL PLTA ALTA 1.5 EL SOLITO			\N		\N		\N		\N	\N	\N	\N
2173	1	1	327	1	\N	CONSTRUCCIONES TARRA 2010 C.A		J- 31327885-8	20080513000001	2009-01-01	2009-12-31	BARRIO ANDRES ELOY BLANCO, CALLE 96 J N. 57- 141			\N		\N		\N		\N	\N	\N	\N
2174	1	1	327	1	\N	CONSORCIO INDUSTRIAL GALAXY 2021. C.A	COINGACA 2021	J- 31517530-4	20080513000002	2009-01-01	2009-12-31	BALLIUO LOS ROBLES CALL CALLE 113 AV.5			\N		\N		\N		\N	\N	\N	\N
2175	1	1	327	1	\N	SERVICIOS Y CONSTRUCCIONES, C.A	SERVICONSCA	J- 31501548- 0	20080515000001	2009-01-01	2009-12-31	CARRETERA VIA LA CONSECCION KM 13 SECTOR EL CAIMITO			\N		\N		\N		\N	\N	\N	\N
2176	1	1	327	1	\N	INVERSIONES CADI . C.A	INCADICA	J- 31170505-8	20080516000001	2009-01-01	2009-12-31	URB LA PAZ AV. 56 N. 18-51			\N		\N		\N		\N	\N	\N	\N
2177	1	1	327	1	\N	CONSTRUCCIONES Y SERVICIOS NACAR C.A.	CONANCAR	J-07034720-1	20080520000001	2009-01-01	2009-12-31	SECTOR DELICIAS AV. 25 No. 64-30			\N		\N		\N		\N	\N	\N	\N
2178	1	1	327	1	\N	CONST  SERVICIOS Y SUMINISTROS DEL CARIBE C.A	CONSESUCA	J- 30736635-4	20080520000002	2009-01-01	2009-12-31	URB. LA PICOLA CALLE 41 N. 15M- 42			\N		\N		\N		\N	\N	\N	\N
2179	1	1	327	1	\N	CONSTRUCTORA PEDRO NIXON C.A	CONSPERNIXCA	J- 31599725-8	20080520000003	2009-01-01	2009-12-31	MENE GRANDE MUCP BARAL EDO ZULIA			\N		\N		\N		\N	\N	\N	\N
2180	1	1	327	1	\N	M & G DISEÃ‘OS Y PROYECTOS  C.A		J- 31037925-4	20080530000001	2009-01-01	2009-12-31	CALLE 139 CASA N. 63-39 ZONA INDUSTRIAL			\N		\N		\N		\N	\N	\N	\N
2181	1	1	327	1	\N	SUMINISTROS Y SERVICIOS GARCIA TABORDA C.A	SUSEGACA	J- 31282962-1	20080530000002	2009-01-01	2009-12-31	AVE. 11 N. 53-90			\N		\N		\N		\N	\N	\N	\N
2182	1	1	327	1	\N	PROYECTOS GOZALEZ PAZ. C.A	PROGOPA. C.A	J- 29476985-3	20080530000003	2009-01-01	2009-12-31	URB. LA ROSA AV. E7, CASA N. 2, SECTOR 1			\N		\N		\N		\N	\N	\N	\N
2183	1	1	327	1	\N	PREFAB  Y CONST DE ACERO PELLIZZARI.  C.A	PREACERO PELLIZZARI	J- 09003123-5	20080530000004	2009-01-01	2009-12-31	AV.PRINCIPAL DE LAGUNILLASECTOR PUERTO NUEVO APT 6			\N		\N		\N		\N	\N	\N	\N
2184	1	1	327	1	\N	CORPORACION REGIONAL BROADCASTING  C.A	C.R.B	J- 30977966-4	20080602000001	2009-01-01	2009-12-31	CALLE 74 ENTRE AV. 3C Y 3D			\N		\N		\N		\N	\N	\N	\N
2185	1	1	327	1	\N	DALTON  SERVICIOS Y CONSTRUCCIONES  C.A	DALTON, C.A	J-31464527-7	20080603000001	2009-01-01	2009-12-31	AV. 20  N. 51 KA CHINITA 113 A 31			\N		\N		\N		\N	\N	\N	\N
2186	1	1	327	1	\N	TECNICA DIONISIO  C.A	TECNIDICA	J- 31269306-1	20080604000001	2009-01-01	2009-12-31	AV. 3F C/ CECILIO ACOSTA EDIF HAWAI LOCAL 2			\N		\N		\N		\N	\N	\N	\N
2187	1	1	327	1	\N	CONST Y SERVICIOS DE INGENERIA FERRER  C.A	CONSFERCA	J- 31301381-1	20080605000001	2009-01-01	2009-12-31	AV. 4 BELLA VISTA TORRE SOCUY PRIMER PISO			\N		\N		\N		\N	\N	\N	\N
2188	1	1	327	1	\N	COOPERATIVA ASOVECIMA 007 R,L		J- 31341763-7	20080606000001	2009-01-01	2009-12-31	BARRIO SIERRA MAESTRA  CALLE SAN LUIS N. 25			\N		\N		\N		\N	\N	\N	\N
2189	1	1	327	1	\N	CONSTRUCTORA L.F.N  C.A		J-30962849-6	20080606000002	2009-01-01	2009-12-31	AV. 3 N. 86A-O4  VALLE FRIO			\N		\N		\N		\N	\N	\N	\N
2190	1	1	327	1	\N	MULTI SERVICIOS MACHADO  C.A	MUSEMA	J- 30135623-3	20080610000001	2009-01-01	2009-12-31	SECTOR LOS ESTANQUES CALLE 127 BARRIO BELLO MONTE N. 44-62			\N		\N		\N		\N	\N	\N	\N
2232	1	1	327	1	\N	COOPORACION HOSPITALARIA DEL ZULIA. C.A	CORPHOS	J- 07019253-4	20081203000001	2009-01-01	2009-12-31	AV. 12 ESQ CECILIO ACOSTA N. 66A- 73 EDIF R B LOCAL 11			\N		\N		\N		\N	\N	\N	\N
2191	1	1	327	1	\N	INVERSIONES OMER Y DOUGLAS  C.A	INODCA	J-30700344-8	20080611000001	2009-01-01	2009-12-31	KM 1 VIA PERIJA, HOSPITAL GENERAL DEL SUR			\N		\N		\N		\N	\N	\N	\N
2192	1	1	327	1	\N	J.G CONST MANTENIMIENTO Y SERVICIO  C.A	J.G COMASE. C.A	J-30166038-2	20080611000002	2009-01-01	2009-12-31	AV. 19 HATICOS POR ARRIBA N. 111 -32 AL LADO DE REFRILEC			\N		\N		\N		\N	\N	\N	\N
2193	1	1	327	1	\N	ASOCIACION COOPERATIVA UNIDOS POR VENAZUELA	UPV	J- 29514272-2	20080617000001	2009-01-01	2009-12-31	SABANETA LARGA, CALLE 99 F N. 21-04 SECTOR GALLO VERDE			\N		\N		\N		\N	\N	\N	\N
2194	1	1	327	1	\N	CONSTRUCTORA PARAGUANA  C.A	CONPACA	J- 29358463-9	20080623000001	2009-01-01	2009-12-31	CALLE 90 N. 16-23 SECTOR LAS DELICIAS			\N		\N		\N		\N	\N	\N	\N
2195	1	1	327	1	\N	INVERSIONES MULTIPLES,  C.A	INVERMULCA	J- 31133308-8	20080623000002	2009-01-01	2009-12-31	CALLE173  CASA N. 41A - 30 URB LA COROMOTO			\N		\N		\N		\N	\N	\N	\N
2196	1	1	327	1	\N	CONSTRUCCIONES BARRIO MORAN, C.A		J-30063900-2	20080625000001	2009-01-01	2009-12-31	AV. 6 BELLAVISTA CENTRO COMERCIAL SIGMA PISO 2 EDIF 2B			\N		\N		\N		\N	\N	\N	\N
2197	1	1	327	1	\N	OMICRON,  S.A		J- 30742984-4	20080625000002	2009-01-01	2009-12-31	AV. 15 CON CALLE 89B, TORRE EMPRESARIA DE OCCIDENTE PISO 10 OFIC 2			\N		\N		\N		\N	\N	\N	\N
2198	1	1	327	1	\N	CONSTRUCTORA MULTIPLE VENEZOLANA C.A	CONSMUVECA	J- 31552550-0	20080623000003	2009-01-01	2009-12-31	CALLE COREPCION LA VILLA DEL ROSARIO			\N		\N		\N		\N	\N	\N	\N
2199	1	1	327	1	\N	INVERSORA CEMPI . C.A		J- 31508419-8	20080703000001	2009-01-01	2009-12-31	URBANIZACION MARA NORTE, TRASVERSAL A N. 11-15 MACB - ZULIA			\N		\N		\N		\N	\N	\N	\N
2200	1	1	327	1	\N	INMACO 2021  C.A		J- 29371628-4	20080708000001	2009-01-01	2009-12-31	AV. INTERCOMUNAL SECCTOR PUNTA GORDA			\N		\N		\N		\N	\N	\N	\N
2201	1	1	327	1	\N	INGENERIA INTEGRAL NOVOA, C.A	INGENOCA	J- 07039678-4	20080709000001	2009-01-01	2009-12-31	AV. 27 C/ CALLE 69 A N. 69-08 SECTOR SANTA MARIA			\N		\N		\N		\N	\N	\N	\N
2202	1	1	327	1	\N	CONSTRUCCIONES Y DESARROLLOS B&C,  C.A	CONDERBICA	J- 29559096-2	20080709000002	2009-01-01	2009-12-31	SAN FRANCISCO B. SUR AMERICA CALLE 149-C N. 56-22			\N		\N		\N		\N	\N	\N	\N
2203	1	1	327	1	\N	VENEZOLANA DE IMPORTACION.  C.A	VENEIMPCA	J- 29584516-2	20080714000001	2009-01-01	2009-12-31	CALLE 50 AV. 15 CASA 15D -10 URB. LA CALIFORNIA			\N		\N		\N		\N	\N	\N	\N
2204	1	1	327	1	\N	CONSTRUCCIONES E INVERSIONES PAZ, C.A	CONPACA	J.29495073-6	20080718000001	2009-01-01	2009-12-31	Av. 67-A, No. 78A-5. Urb. La Victoria			\N		\N		\N		\N	\N	\N	\N
2205	1	1	327	1	\N	REPRESENTACIONES E Y G .  C.A		J- 30551794-0	20080718000002	2009-01-01	2009-12-31	URB SAN RAFAEL  AV. 62 N. 96 J- 117			\N		\N		\N		\N	\N	\N	\N
2206	1	1	327	1	\N	CONSTRUCCIONES Y PROYECTOS DEL ZULIA, C.A.	CONSPROZUCA	J-31671820-4	20080721000001	2009-01-01	2009-12-31	Av. El Milagro, C.C. Caribe, piso 2, oficina No. 2.			\N		\N		\N		\N	\N	\N	\N
2207	1	1	327	1	\N	CONSTRUCCIONES Y SERVICIOS L&C.  C.A		J- 30749324-0	20080729000001	2009-01-01	2009-12-31	AV. BELLA VISTA P/B C.C VILLA INES			\N		\N		\N		\N	\N	\N	\N
2208	1	1	327	1	\N	COOPERATIVA SOLIDARIDAD DEL CARIBE R.L		J- 31666145-8	20080807000001	2009-01-01	2009-12-31	AVE  11 CON CALLE 21 CASA N. 10-96 SECTOR SIERRA MAESTRA			\N		\N		\N		\N	\N	\N	\N
2209	1	1	327	1	\N	COOPERATIVA LA FORTALEZA DE NUESTROS HIJOS 971, R.S		J-29605494-0	20080811000001	2009-01-01	2009-12-31	URBA VILLA SAN JOSE CALLE 96-A N. 160			\N		\N		\N		\N	\N	\N	\N
2210	1	1	327	1	\N	QUIVA Y GALBAN CONSTRUCTORES ASOCIADOS,S.A	QUIBANCASA	J-31502284-2	20080815000001	2009-01-01	2009-12-31	Calle 77, Edificio BHV, Mezanina 1 Zona, Sector 5 de Julio			\N		\N		\N		\N	\N	\N	\N
2211	1	1	327	1	\N	INVERSIONES & CONSTRUCCIONES GRECIA, C.A	INGRECA	J-29567334-5	20080815000002	2009-01-01	2009-12-31	Calle 79, Dr. Quintero, Entre Av. 9 y 9B, C.C. Odepal, Local 4.			\N		\N		\N		\N	\N	\N	\N
2212	1	1	327	1	\N	" SEGOVIA CONSTRUCCIONES, C.A, SEGCONCA"	"SEGCONCA"	J-29599736-1	20080828000001	2009-01-01	2009-12-31	Av. Principal Las Delicias, Edif. Torre3 III, Piso P.B- A Apto. Residencias Villa Delicias, Sector Delicias			\N		\N		\N		\N	\N	\N	\N
2213	1	1	327	1	\N	A & N ASESORES, MANTENIMIENTO Y SERVICIOS COMPAÃ‘IA ANONIMA		J-31107455-4	20080829000001	2009-01-01	2009-12-31	Centro Comercial Internacional, Local No. 1, Planta Baja, Cabimas, Estado Zulia			\N		\N		\N		\N	\N	\N	\N
2214	1	1	327	1	\N	INGENIERIA RINCON NOGUERA, C.A	I-RINO, C.A	J-31256552-7	20080901000001	2009-01-01	2009-12-31	Carretara Santa Barbara El Vigia, Urb. La Maroma, Casa A-096, Avenida 2.			\N		\N		\N		\N	\N	\N	\N
2215	1	1	327	1	\N	SUMIN DE MAT Y TRASPORTE GAMEZ Y TIGRERA C. A	SUMATGAT,C.A	J- 29545320-5	20080917000001	2009-01-01	2009-12-31	CALLE 67 EDIF  LINGUITA PISO 5 APTO 05 SUR SECTOR SANTA MARIA			\N		\N		\N		\N	\N	\N	\N
2216	1	1	327	1	\N	INVERSIONES MEPERCA, C.A		J- 29431708-1	20080918000001	2009-01-01	2009-12-31	CALLE PRINCIPAL EDIF CEOCA PISO 1 OFIC 1 CAMPO  STAFF			\N		\N		\N		\N	\N	\N	\N
2221	1	1	327	1	\N	CONSTRUCTORA SANTA MARTA C.A.		J-07022206-9	20080625000003	2009-01-01	2009-12-31	CALLE 96J CON AV. 57-A No. 57-10 BARRIO ANDRES ELOY BLANCO			\N		\N		\N		\N	\N	\N	\N
2222	1	1	327	1	\N	CONSTRUCTORA LAS BRISAS  C.A	CONBRISACA	J- 29573293-7	20081009000001	2009-01-01	2009-12-31	SECTOR SAN JUAN CALLE 1 CASA N. S/N BOBURES			\N		\N		\N		\N	\N	\N	\N
2233	1	1	327	1	\N	CONTINENTAL CONSTRUCCIONES Y SERVICIOS, COMPAÃ‘IA ANONIMA	CONTINENTAL, C.A.	J-29556848-7	20081215000001	2009-01-01	2009-12-31	SECTOR CERRO ALTO, CARRETERA MACHIQUES-COLON, EDIFICIO MAQUINARIAS R Y S			\N		\N		\N		\N	\N	\N	\N
2234	1	1	327	1	\N	SERVICIOS Y BOMBAS PERIJA , C.A	SERBOPECA	J- 29354835-7	20081216000001	2009-01-01	2009-12-31	CALLE 27 CON AV. 9 SAN FRANCISCO CASA 9-20			\N		\N		\N		\N	\N	\N	\N
2235	1	1	327	1	\N	CONSTRUCTORA  HERNANDEZ . C.A	CONHERCA	J- 29440604-1	20081218000001	2009-01-01	2009-12-31	CALLE SAN JACINTO N. 116 SECTOR R.10			\N		\N		\N		\N	\N	\N	\N
2236	1	1	327	1	\N	INVERSIONES ESCORIAL . COMPAÃ‘IA ANONIMA	INVERES C.A	J- 31099859-0	20081222000001	2009-01-01	2009-12-31	BOULEVAR DE 5 DE JULIO CALLE 77 N. 8A- 25			\N		\N		\N		\N	\N	\N	\N
2237	1	1	327	1	\N	PROYECTOS Y CONSTRUCCIONES URBANA. C.A	CONSURCA	J- 29474576-8	20090112000001	2009-01-01	2009-12-31	CALLE 76 EDIF VILLA II PT APTO B SECTOR LA LAGO			\N		\N		\N		\N	\N	\N	\N
2238	1	1	327	1	\N	POLUX SERVICIOS, SOCIEDAD ANONIMA		J- 312813954	20090115000001	2009-01-01	2009-12-31	AV. 15 DELICIAS C/C 72 EDIF C.C PASEO 72  1er PISO  OFIC 23C			\N		\N		\N		\N	\N	\N	\N
2239	1	1	327	1	\N	CONSTRUCCIONES DJ 125. C.A		J- 31011607-5	20090115000002	2009-01-01	2009-12-31	LA CONCEPCION, CALLE N. 31B DIAGONAL DE LA INGLESIA			\N		\N		\N		\N	\N	\N	\N
\.


--
-- TOC entry 2189 (class 0 OID 35338262)
-- Dependencies: 1504
-- Data for Name: contratista_evaluacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY contratista_evaluacion (eva_contratista_evaluacion_pk, svr_solvencias_recaudos_fk, con_contratistas_fk, eva_fecha_emision, eva_estatus, eva_fecha_vencimiento, eva_codigo_ancla) FROM stdin;
1446	11	2212	2009-06-01	2	\N	22122009-06-01
1447	6	2212	2009-06-01	2	2009-06-25	22122009-06-01
1448	13	2212	2009-06-01	2	2009-06-26	22122009-06-01
1449	17	2212	2009-06-01	5	\N	22122009-06-01
1450	1	2212	2009-06-01	5	\N	22122009-06-01
1451	14	2212	2009-06-01	5	\N	22122009-06-01
1452	15	2212	2009-06-01	1	\N	22122009-06-01
1453	16	2212	2009-06-01	5	\N	22122009-06-01
1454	24	2212	2009-06-01	5	\N	22122009-06-01
1455	8	2212	2009-06-01	2	2009-06-27	22122009-06-01
1456	11	2262	2009-06-10	4	\N	22622009-06-10
1457	6	2262	2009-06-10	4	2009-06-30	22622009-06-10
1458	13	2262	2009-06-10	4	2009-06-30	22622009-06-10
1459	17	2262	2009-06-10	4	2009-06-30	22622009-06-10
1460	1	2262	2009-06-10	4	2009-06-30	22622009-06-10
1461	14	2262	2009-06-10	4	2009-06-30	22622009-06-10
1462	15	2262	2009-06-10	4	2009-06-30	22622009-06-10
1463	16	2262	2009-06-10	4	2009-06-30	22622009-06-10
1464	24	2262	2009-06-10	4	2009-06-30	22622009-06-10
1465	8	2262	2009-06-10	4	2009-06-30	22622009-06-10
1466	11	2262	2009-08-13	4	\N	22622009-08-13
1467	6	2262	2009-08-13	4	2009-08-31	22622009-08-13
1468	13	2262	2009-08-13	4	2009-08-31	22622009-08-13
1469	17	2262	2009-08-13	4	2009-08-31	22622009-08-13
1470	1	2262	2009-08-13	4	2009-08-31	22622009-08-13
1471	14	2262	2009-08-13	4	2009-08-31	22622009-08-13
1472	15	2262	2009-08-13	4	\N	22622009-08-13
1473	16	2262	2009-08-13	4	2009-08-31	22622009-08-13
1474	24	2262	2009-08-13	4	2009-08-31	22622009-08-13
1475	8	2262	2009-08-13	4	\N	22622009-08-13
1476	11	2238	2009-08-20	4	\N	22382009-08-20
1477	6	2238	2009-08-20	4	2009-08-31	22382009-08-20
1478	13	2238	2009-08-20	4	2009-08-31	22382009-08-20
1479	17	2238	2009-08-20	4	2009-08-31	22382009-08-20
1480	1	2238	2009-08-20	4	2009-08-31	22382009-08-20
1481	14	2238	2009-08-20	4	2009-08-31	22382009-08-20
1482	15	2238	2009-08-20	4	\N	22382009-08-20
1483	16	2238	2009-08-20	4	2009-08-31	22382009-08-20
1484	24	2238	2009-08-20	4	2009-08-31	22382009-08-20
1485	8	2238	2009-08-20	4	\N	22382009-08-20
\.


--
-- TOC entry 2190 (class 0 OID 35338264)
-- Dependencies: 1505
-- Data for Name: contratistas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY contratistas (con_contratistas_pk, nfs_nivel_financiero_snc_fk, tpc_tipo_cooperativa_fk, ciu_ciudades_fk, ctp_contratistas_tipo_fk, ett_contratistas_estatus_fk, con_nombre, con_siglas, con_numero_rif, con_numero_rnc, con_fecha_inscripcion_rnc, con_fecha_vencimiento_rnc, con_direccion_fiscal, con_codigo_postal, con_email, tpf_tipo_firma_fk, con_calificacion_financiera, con_capacidad_financiera, con_objeto_cooperativa, con_tiempo_cooperativa, con_objeto_social_cooperativa, con_duracion_cooperativa, ics_indice_capital_social_fk, con_fecha_inscripcion, con_codigo_siez) FROM stdin;
374	1	\N	327	1	1	Carlos Ramirez	C	J666	666	2009-05-19	2009-05-22	ñdskjfñlsdkfdsf	4001	casslos@hotmail.com	1	D	1000.00	null	\N	null	\N	2	2009-05-26	SIEZ-2009-05-26-001
1878	1	2	327	1	1	COLGRI, C.A.		J303696201	20050302000002	2009-01-01	2009-12-31	CALLE 40 N0. 13A-20			\N		\N		\N		\N	\N	2005-03-02	SIEZ-2005-03-02-000002
2262	1	\N	205	1	4	Construcciones y Servicios la Base	CONSERVI	J293696976	1202011293696976	2007-05-31	2008-06-30	Calle 2, Nro 3 Urbanizacion Raul Leoni	4002	construccioneslabase@hotmail.com	2	C	100000.00	null	\N	null	\N	5	2009-06-05	SIEZ-2009-06-05-003
943	1	2	327	1	1	APON INGENIERIA,C.A.	APINCA	J308809845	20020528000001	2009-01-01	2009-12-31	CALLE 89B CON AV.15 EDIF.EMP.OCCIDENTE PISO 10 OFC.10-01	656	casslos@hn.com	1	C	100005.00	null	\N	null	\N	6	2002-05-28	SIEZ-2002-05-28-000001
1791	10	2	327	1	1	24-H,C.A.	24H	J308530565	20031009000002	2009-01-01	2009-12-31	SECTOR PANAMERICANO CALLE 77 # 69-126	4001	correo@idyt.org	1	A	500000.00	null	\N	null	\N	2	2003-10-09	SIEZ-2003-10-09-000002
985	1	2	327	1	1	DONIL,C.A.		J307763388	20010504000000	2009-01-01	2009-12-31	CALLE PADRE OLIVARES,SECTOR AMPARITO, N0. 28			\N		\N		\N		\N	\N	2001-05-04	SIEZ-2001-05-04-000000
1093	1	2	327	1	1	EPSILON, C.A.		J304308698	20030902000000	2009-01-01	2009-12-31	AV. INTERCOMUNAL N. 492			\N		\N		\N		\N	\N	2003-09-02	SIEZ-2003-09-02-000000
876	1	2	327	1	1	CONSTRUCTORA LEMA,C.A.		J308429961	20020208000000	2009-01-01	2009-12-31	AV.3G # 67-93 SECTOR BELLAS ARTES			\N		\N		\N		\N	\N	2002-02-08	SIEZ-2002-02-08-000000
601	1	2	327	1	1	INVERSORA ARDI		V054975062	20010315000000	2009-01-01	2009-12-31	SECTOR LOS POSITOS CAJA SECA			\N		\N		\N		\N	\N	2001-03-15	SIEZ-2001-03-15-000000
1966	1	2	327	1	1	R & D SERVICIOS, C.A.		J313354538	20051223000001	2009-01-01	2009-12-31	CALLE 81 Nº 3F-33 QTA. FLOR ELENA			\N		\N		\N		\N	\N	2005-12-23	SIEZ-2005-12-23-000001
2100	1	2	327	1	1	CONSTRUCCIONES C&B, C.A		J300433382	20070516000001	2009-01-01	2009-12-31	AV. CUMANA RESD CUMANA LOCAL N. 01			\N		\N		\N		\N	\N	2007-05-16	SIEZ-2007-05-16-000001
375	11	\N	327	1	1	hjhj	HJHJHJ	J77777	777777	2009-05-29	2009-05-30	fdsfsdfsdfsdf	4001	correo@idyt.oer	1	H	550000.00	null	\N	null	\N	2	2009-05-29	SIEZ-2009-05-29-001
376	2	\N	327	1	1	ASql C.A	ASQL	J555555	555555	2009-05-28	2009-05-30	sdfdsadsad	4001	correo@n.com	1	V	150000.00	null	\N	null	\N	5	2009-05-29	SIEZ-2009-05-29-002
377	2	\N	327	1	1	fsfsdf	DSFSDF	J44444	4554454	2009-05-20	2009-05-30	dfgdfgfdg	45634	corre@djf.com	1	C	180016.08	null	\N	null	\N	2	2009-05-29	SIEZ-2009-05-29-003
378	1	\N	327	1	1	Ingeniería, Datos, Tecnología, C.A.	IDYT	J309839870	1234567890123456	2009-05-29	2010-06-25	Sector Tierra Negra	4002	idyt@gmail.com	1	A	1240.00	null	\N	null	\N	11	2009-05-29	SIEZ-2009-05-29-004
380	14	\N	327	1	1	sdfgfgf	DFGFDG	J1233448	23444	2009-05-29	2009-05-31	dfdfdfdfddf	4001	cvcxv@ff.com	1	F	1120000.00	null	\N	null	\N	6	2009-05-29	SIEZ-2009-05-29-006
381	14	\N	327	1	1	sdfgfgf	DFGFDG	J123344	23444	2009-05-29	2009-05-31	dfdfdfdfddf	4001	cvcxv@ff.com	1	F	1120000.00	null	\N	null	\N	6	2009-05-29	SIEZ-2009-05-29-005
382	1	\N	327	1	1	sdadfdf	DD	J44434	43434	2009-06-17	2009-06-30	wdqwdwqdwdd 	4001	correo@idyt.com	1	E3	50.00	null	\N	null	\N	2	2009-06-01	SIEZ-2009-06-01-001
383	\N	\N	327	1	1	gfhfgh	YT	J654654	656	2009-06-12	2009-06-19	dfdfsdf	34	co@dyt.com	1	T	0.00	null	\N	null	\N	1	2009-06-01	SIEZ-2009-06-01-002
2234	1	\N	327	1	1	vvvv	VV	J1225	34	2009-06-17	2009-06-25	dsfsdfsdfdsfsdf	4001	correo@idyt.org	1	V	1.00	null	\N	null	\N	1	2009-06-01	SIEZ-2009-06-01-006
2235	\N	\N	327	1	1	rrrr	RR	J455	44	2009-06-24	2009-06-18	dddffffd	4001	co@idyt.org	1	CV	0.00	null	\N	null	\N	1	2009-06-01	SIEZ-2009-06-01-007
2236	1	\N	327	1	1	rrrr	RR	J4556	44	2009-06-24	2009-06-18	dddffffd	4001	co@idyt.org	1	CV	0.00	null	\N	null	\N	1	2009-06-01	SIEZ-2009-06-01-008
385	14	\N	327	1	1	Prueba 1	1	J4444	3444	2009-06-18	2009-06-25	La Limpia	34	correo@idyt.org	1	C	1258800.00	null	\N	null	\N	7	2009-06-01	SIEZ-2009-06-01-004
386	2	\N	327	1	1	Prueba 1	D	J45454	5545	2009-06-25	2009-06-25	La limpia	4001	correo@dyt.com	1	D	125899.00	null	\N	null	\N	5	2009-06-01	SIEZ-2009-06-01-005
2237	34	\N	327	1	1	1Compañía Anónima	CA	J123456789	1234567890123456	2009-05-04	2010-06-01	Tierra Negra	4001	ca@idyt.org	1	A	50896321.35	null	\N	null	\N	10	2009-06-01	SIEZ-2009-06-01-009
2238	19	\N	327	1	4	Sociedad Anónima	SA	J987654321	1234567890123456	2008-05-02	2009-06-02	Av. La Limpia	4001	sa@idyt.com	2	A	2548799.00	null	\N	null	\N	9	2009-06-02	SIEZ-2009-06-02-001
2239	1	\N	327	1	1	AAA	AAA	V11453342	11453342	2009-04-30	2009-03-31	cabimas	4013	ratardo@homail.com	1	A	1500.00	null	\N	null	\N	1	2009-06-03	SIEZ-2009-06-03-001
2241	1	\N	327	1	1	Clkjlkj	454354	J1215	54564	2009-06-18	2009-06-25	gdfgdfgdfg fdg fd gfdg 	324	correo@idyt.org	1	GFG	1.25	null	\N	null	\N	4	2009-06-04	SIEZ-2009-06-04-002
2242	1	\N	327	1	1	Clkjlkj	454354	J12154	54564	2009-06-18	2009-06-25	gdfgdfgdfg fdg fd gfdg 	324	correo@idyt.org	1	GFG	1.25	null	\N	null	\N	4	2009-06-04	SIEZ-2009-06-04-003
2243	1	\N	327	1	1	Clkjlkj	454354	J12154565	54564	2009-06-18	2009-06-25	gdfgdfgdfg fdg fd gfdg 	324	correo@idyt.org	1	GFG	1.25	null	\N	null	\N	4	2009-06-04	SIEZ-2009-06-04-004
2244	1	\N	327	1	1	Clkjlkj	454354	J12154565756	54564	2009-06-18	2009-06-25	gdfgdfgdfg fdg fd gfdg 	324	correo@idyt.org	1	GFG	1.25	null	\N	null	\N	4	2009-06-04	SIEZ-2009-06-04-005
2245	1	\N	327	1	1	Clkjlkj	454354	J121545657564	54564	2009-06-18	2009-06-25	gdfgdfgdfg fdg fd gfdg 	324	correo@idyt.org	1	GFG	1.25	null	\N	null	\N	4	2009-06-04	SIEZ-2009-06-04-006
2246	1	\N	327	1	1	Clkjlkj	454354	J12154546	54564	2009-06-18	2009-06-25	gdfgdfgdfg fdg fd gfdg 	324	correo@idyt.org	1	GFG	1.25	null	\N	null	\N	4	2009-06-04	SIEZ-2009-06-04-007
2247	1	\N	327	1	1	rtdfgfd	GGFD	J4543543	454	2009-06-10	2009-06-19	dsfsdfsdfsdf 	32	correo@idyt.org	1	5	1.00	null	\N	null	\N	1	2009-06-04	SIEZ-2009-06-04-008
2248	1	\N	327	1	1	ftgfdgdf	GFDGDF	J5435	435435	2009-06-10	2009-06-18	sdfdsf dsf ds dsf dsf dssdf 	4325	correo@idyt.org	1	5	1.10	null	\N	null	\N	1	2009-06-04	SIEZ-2009-06-04-009
2249	1	\N	327	1	1	tytygfh	GHFG	J45345435	546546	2009-05-07	2009-06-25	rdgfdgfdg fdg fd gdf f 	45345	correo@idyt.com	1	TG	12.36	null	\N	null	\N	1	2009-06-04	SIEZ-2009-06-04-010
2250	1	\N	327	1	1	rtyfghfg	FGHFGH	J435546	54645	2009-06-19	2009-06-18	dsadsadsadsad	4001	correo@idyt.com	1	TR	45.54	null	\N	null	\N	1	2009-06-04	SIEZ-2009-06-04-011
2251	1	\N	327	1	1	rtyfghfg	FGHFGH	J435546	54645	2009-06-19	2009-06-18	dsadsadsadsad	4001	correo@idyt.com	1	TR	45.54	null	\N	null	\N	1	2009-06-04	SIEZ-2009-06-04-012
2252	1	\N	327	1	1	rtyfghfg	FGHFGH	J43554645	54645	2009-06-19	2009-06-18	dsadsadsadsad	4001	correo@idyt.com	1	TR	45.54	null	\N	null	\N	1	2009-06-04	SIEZ-2009-06-04-013
2253	1	\N	327	1	1	fgfhgfh	GF	J1254	4554	2009-06-16	2009-06-25	sdfgs dsfgdg dfg fd g	4001	correo@idyt.org	1	GF	14.00	null	\N	null	\N	1	2009-06-04	SIEZ-2009-06-04-014
2254	1	\N	327	1	1	retgrg	DFGDFG	J454	45435	2009-06-25	2009-06-18	vdfvsd dsf sdfsd 	4001	correo@idyt.org	1	R	1.00	null	\N	null	\N	1	2009-06-04	SIEZ-2009-06-04-015
2255	1	\N	327	1	1	retgrg	DFGDFG	J454	45435	2009-06-25	2009-06-18	vdfvsd dsf sdfsd 	4001	correo@idyt.org	1	R	1.00	null	\N	null	\N	1	2009-06-04	SIEZ-2009-06-04-016
2256	12	6	89	10	1	Asociación Cooperativa Servimer 415	ASOCOOPSER415	J293697352	5700004293697352	2008-11-27	2009-11-27	carretera guacara - san joaquin, Urb. La pradera, Sector los Bucares, segunda etapa, manzana G, casa nº. 272	4001	servimer415@yahoo.com	1	A	849708.60	null	365	obras	256	7	2009-06-04	SIEZ-2009-06-04-017
2257	1	\N	327	1	1	retgrg	DFGDFG	J454	45435	2009-06-25	2009-06-18	vdfvsd dsf sdfsd 	4001	correo@idyt.org	1	R	1.00	null	\N	null	\N	1	2009-06-04	SIEZ-2009-06-04-018
2258	1	\N	327	1	1	retgrg	DFGDFG	J454	45435	2009-06-25	2009-06-18	vdfvsd dsf sdfsd 	4001	correo@idyt.org	1	R	1.00	null	\N	null	\N	1	2009-06-04	SIEZ-2009-06-04-019
2259	1	\N	327	1	1	kjgjkh	DF	J123554	12544	2009-06-02	2009-06-11	esfrsef esr fes rser esr 	4001	correo@idyt.org	1	C	1.25	null	\N	null	\N	1	2009-06-04	SIEZ-2009-06-04-020
2240	10	\N	327	1	1	1Barcos del Mar Nordico	BM	J1258987	122544	2009-06-10	2009-06-18	cvfgfdgdfgsdfg df gdf df	3454	casslos@hotmail.com	2	D	452000.00	null	\N	null	\N	4	2009-06-04	SIEZ-2009-06-04-001
2261	27	\N	90	1	1	Inversiones J.I. S.A.	JI	J302086760	100204302086760	2008-06-27	2009-06-30	Zona Norte, Av. Bolívar, Callejón Don Bosco, piso 4, Ofic. 4-6	2001	yelsi88@hotmail.com	2	A	19247348.58	null	\N	null	\N	11	2009-06-05	SIEZ-2009-06-05-002
2260	1	\N	327	1	1	12vcbbvnbvn	GHGFH	J43543543	12	2009-06-10	2009-06-25	ertrtrgretg	4001	correo@idyt.com	1	G	12.22	null	\N	null	\N	1	2009-06-05	SIEZ-2009-06-05-001
602	1	2	327	1	1	SERVICIOS HEDEL,C.A.		J306904107	20010319000000	2009-01-01	2009-12-31	AV.6 CALLE 55 URB.ZAPARA BLOQUE 1			\N		\N		\N		\N	\N	2001-03-19	SIEZ-2001-03-19-000000
2029	1	2	327	1	1	CONSTRUCCIONES L.C.R,  C.A		J315338017	20060816000002	2009-01-01	2009-12-31	AV. FUERZAS ARMADA VILLA BONITA TORRE II PHC			\N		\N		\N		\N	\N	2006-08-15	SIEZ-2006-08-15-000001
2027	1	2	327	1	1	CONSTRUCCIONES  L.C.R,  C.A		J315338017	20060815000001	2009-01-01	2009-12-31	AV. FUERZAS ARMADA VILLA BONITA  TORRE II P.H.C			\N		\N		\N		\N	\N	2006-08-15	SIEZ-2006-08-15-000001
194	1	2	327	1	1	ING.BENEDICTO RAMON RINCON MORALES	ING.BENEDICTO RAMON RINCON MOR	V027733170	19990614000009	2009-01-01	2009-12-31	SIN DIRECCIÓN	1	1	1		1.00	1	1	1	1	\N	1999-06-14	SIEZ-1999-06-14-000009
1020	1	2	327	1	1	INGENIERIA CORONEL Y PAZ,C.A.	INCORPACA	J307795360	20010925000000	2009-01-01	2009-12-31	CALLE 66 N0. 3D-93 SECTOR BELLA VISTA			\N		\N		\N		\N	\N	2001-09-25	SIEZ-2001-09-25-000000
1734	1	2	327	1	1	CONTERCA		J300017184	20010123000001	2009-01-01	2009-12-31	AV.8 N0. 82D-85 RESD.SANTA RITA OFIC.2			\N		\N		\N		\N	\N	2001-01-23	SIEZ-2001-01-23-000001
1016	1	2	327	1	1	ARQUITECTOS OCCIDENTALES,C.A.	ARO,C.A.	J308103306	20010813000000	2009-01-01	2009-12-31	CALLE 70 CON AV,13 RESID.MI ENSUEÑO L.1			\N		\N		\N		\N	\N	2001-08-13	SIEZ-2001-08-13-000000
1068	1	2	327	1	1	COSSPRO,C.A.		J307289112	20010316000002	2009-01-01	2009-12-31	CALLE 71 C/AV. 28 SECTOR SANTA MARIA			\N		\N		\N		\N	\N	2001-03-16	SIEZ-2001-03-16-000002
1176	1	2	327	1	1	CONSTRUCTORA ALITASIA,C.A.	CONALICA	J307407476	20010426000003	2009-01-01	2009-12-31	AV.27 CON CALLE 9 LA PUNTA SAN FRANCISCO HATO PACUCHU			\N		\N		\N		\N	\N	2001-04-26	SIEZ-2001-04-26-000003
1971	1	2	327	1	1	CONSTRUCCIONES JESUS HERRERA		V047528328	20060123000002	2009-01-01	2009-12-31	CALLE 86-A Nº 7-107 QUINTA SANTANA			\N		\N		\N		\N	\N	2006-01-23	SIEZ-2006-01-23-000002
504	1	2	327	1	1	CONSTRUCTORA JAN, C.A.	JANCA	J070445831	19990310000020	2009-01-01	2009-12-31	AV.13A,ENTRE CALLES 76 Y 77,NO.76-47 LOCAL NO.1			\N		\N		\N		\N	\N	1999-03-10	SIEZ-1999-03-10-000020
1046	1	2	327	1	1	CONSTRUCCIONES HERNANDEZ C.A.	COHERDCA	J070522321	20001208000001	2009-01-01	2009-12-31	CALLE 103 NO. 195-70 SABANETA			\N		\N		\N		\N	\N	2000-12-08	SIEZ-2000-12-08-000001
1562	1	2	327	1	1	COOPERATIVA DE SERVICIOS INDUSTRIALES	COODESI	J309225529	20020802000000	2009-01-01	2009-12-31	AV.28 CALLE 85 N0. 28B-72			\N		\N		\N		\N	\N	2002-08-02	SIEZ-2002-08-02-000000
1679	1	2	327	1	1	SEMAFOROS DE VENEZUELA.C.A.	SEMAVENCA	J090097147	20010309000000	2009-01-01	2009-12-31	CALLE 70 ENTRE AVES.14A Y 15			\N		\N		\N		\N	\N	2001-03-09	SIEZ-2001-03-09-000000
1912	1	2	327	1	1	TEMARK DE VENEZUELA,C.A.	TEMARK	J311149830	20050610000003	2009-01-01	2009-12-31	AV.9B CASA N0. 60B-46 P.B.º			\N		\N		\N		\N	\N	2005-06-10	SIEZ-2005-06-10-000003
1073	1	2	327	1	1	CONSTRUCTORA PICO, C.A.	COPICA	J305848742	19990324000080	2009-01-01	2009-12-31	CALLE CON AV. 73. #  73-12			\N		\N		\N		\N	\N	1999-03-24	SIEZ-1999-03-24-000080
935	1	2	327	1	1	CONSTRUCCIONES Y DRENAJES, C.A.	CONDRECA	J306191828	20010313000000	2009-01-01	2009-12-31	CALLE 66 SECTOR PARAISO N0.66-40			\N		\N		\N		\N	\N	2001-03-13	SIEZ-2001-03-13-000000
1633	1	2	327	1	1	VIVIENDAS FAMILIARES,C.A.	VIFACA	J070374462	20030314000000	2009-01-01	2009-12-31	CALLE 73 N0. 16A-64 QUINTA NAQUIN			\N		\N		\N		\N	\N	2003-03-14	SIEZ-2003-03-14-000000
845	1	2	327	1	1	SUMINISTRO,CONSTRUCCIONES Y MANTENIMIENTO,C.A.	SUCOM,C.A.	J309345001	20020814000000	2009-01-01	2009-12-31	BARRIO LOS OLIVOS, AV. 69 NO. 68A-77			\N		\N		\N		\N	\N	2002-08-14	SIEZ-2002-08-14-000000
847	1	2	327	1	1	CONSTRUCCIONES ROMERO ARTEAGA, SOCIEDAD ANONIMA	CORASA	J300799379	19991115000004	2009-01-01	2009-12-31	AV 3Y #69-65			\N		\N		\N		\N	\N	1999-11-15	SIEZ-1999-11-15-000004
851	1	2	327	1	1	ASFALTANDO VENEZUELA, COMPAÑIA ANONIMA.		J309337840	20020827000000	2009-01-01	2009-12-31	AV 8A,ENTRE C.67 Y 67B,SECTOR TIERRA NEGRA,QTA.MARIA ANGELIC			\N		\N		\N		\N	\N	2002-08-27	SIEZ-2002-08-27-000000
854	1	2	327	1	1	CONSTRUCCIONES,MANTENIMIENTOS,EQUIPAMIENTOS,COMPAÑIA ANONIMA	CONMECA	J3093092134	20020905000001	2009-01-01	2009-12-31	AV.75,N. 71A-217 SECTOR PANAMERICANO			\N		\N		\N		\N	\N	2002-09-05	SIEZ-2002-09-05-000001
1743	1	2	327	1	1	CONSTRUCCIONES Y PINTURA CONSTRUPINTU, C.A.	CONSTRUPINTU,C.A.	J30443501	19990308000063	2009-01-01	2009-12-31	URB.LA ROSALEDA CALLE 80E Nº 82A-45			\N		\N		\N		\N	\N	1999-03-08	SIEZ-1999-03-08-000063
855	1	2	327	1	1	CONSTRUCCION,MANTENIMIENTO Y SERVICIOS SAN ANTONIO,S.A.	COMSSA	J308319309	20020718000001	2009-01-01	2009-12-31	CARRETERA K ESQ. AV. 41 SECTOR BARRIO PUNTO FIJO			\N		\N		\N		\N	\N	2002-07-18	SIEZ-2002-07-18-000001
856	1	2	327	1	1	CONSTRUCTORA SANTA MARIA,C.A.		J306812857	20020722000000	2009-01-01	2009-12-31	CONJ.RESID.EL OLIVAR EDIF. EL OLIVO I APTO.2B CALLE 75			\N		\N		\N		\N	\N	2002-07-22	SIEZ-2002-07-22-000000
857	1	2	327	1	1	ARQUITECTURA & INGENIERIA FA,C.A.	ARQINGFA,C.A.	J306944796	20001211000002	2009-01-01	2009-12-31	AV.15 LAS DELICIAS, EDIFICIO GREDO OFICINA 5-A			\N		\N		\N		\N	\N	2000-12-11	SIEZ-2000-12-11-000002
465	1	2	327	1	1	CON-PER INTERNACIONAL,C.A.		J305221642	20001221000005	2009-01-01	2009-12-31	CALLE 67 NO. 9B-10 SECTOR TIERRA NEGRA			\N		\N		\N		\N	\N	2000-12-21	SIEZ-2000-12-21-000005
954	1	2	327	1	1	DEMOLICIONES,MANTENIMIENTO,CONSTRUCCIONES Y VIALIDAD C.A.	DEMACA	J307342714	20001211000003	2009-01-01	2009-12-31	AV.LA LIMPIA AV.87 ESQ.CALLE 79 LOCAL 5 NO.42-19 LA CURVA			\N		\N		\N		\N	\N	2000-12-11	SIEZ-2000-12-11-000003
859	1	2	327	1	1	MARTINEZ Y RODRIGUEZ, C.A.	MAROCA	J307757671	20010309000003	2009-01-01	2009-12-31	CALLE 73 AV.16A N0. 16A-09 SECTOR PARAISO			\N		\N		\N		\N	\N	2001-03-09	SIEZ-2001-03-09-000003
861	1	2	327	1	1	CORPORACION A & C,C.A.		J308876534	20020726000001	2009-01-01	2009-12-31	AV.13A SECTOR CARABOBO URB.TAMARE CASA N0.1 CIUDAD OJEDA			\N		\N		\N		\N	\N	2002-07-26	SIEZ-2002-07-26-000001
862	1	2	327	1	1	PROYECTOS INGENIERIA Y SERVICIO L.N., C.A.	PROINSER, C.A.	J070306386	19990310000013	2009-01-01	2009-12-31	CALLE 63 ENTRE AV.8 Y 8B NO.8-73			\N		\N		\N		\N	\N	1999-03-10	SIEZ-1999-03-10-000013
863	1	2	327	1	1	CAMARGO C.A.		J309133829	20020930000002	2009-01-01	2009-12-31	AV.BELLA VISTA EDIF.SOCUY MEZZANNINE LOCAL 25			\N		\N		\N		\N	\N	2002-09-30	SIEZ-2002-09-30-000002
864	1	2	327	1	1	CONSTRUCCIONES MAKSO,C.A.		J309213610	20020801000000	2009-01-01	2009-12-31	CALLE 77 C.AV.16 Y 17 SECT.5 DE JULIO C.C.SAN LUIS LOCAL 8			\N		\N		\N		\N	\N	2002-08-01	SIEZ-2002-08-01-000000
867	1	2	327	1	1	SISCON CONSTRUCCION, C.A.		J309242610	20020815000000	2009-01-01	2009-12-31	URB. CANAIMA CALLE 43 ·N.151-32 SECTOR DELICIAS NORTE			\N		\N		\N		\N	\N	2002-08-15	SIEZ-2002-08-15-000000
905	1	2	327	1	1	INVERSIONES DE PROYECTISTAS VENEZOLANOS, C.A.	INPRO VENEZUELA, C.A.	J070471174	19990312000062	2009-01-01	2009-12-31	URB.URDANETA CALLE 28A BLO.22-20 APTO 2			\N		\N		\N		\N	\N	1999-03-12	SIEZ-1999-03-12-000062
906	1	2	327	1	1	T.J.R. CONSTRUCCIONES,C.A.	T.J.R. CONSTRUCCIONES	J309448510	20021120000000	2009-01-01	2009-12-31	CALLE 100 SABANETA CON AV. PPAL.URB.URDANETA N0.99C-60			\N		\N		\N		\N	\N	2002-11-20	SIEZ-2002-11-20-000000
910	1	2	327	1	1	CONSTRUCCIONES Y MANTENIMIENTO,C.A.	CONMACA	J309391330	20021004000000	2009-01-01	2009-12-31	CALLE 21 N0. 49-43 SECTOR ALTOS DE JALISCOS			\N		\N		\N		\N	\N	2002-10-04	SIEZ-2002-10-04-000000
608	1	2	327	1	1	INVERSIONES J & F,C.A.		J306820167	20010322000001	2009-01-01	2009-12-31	AV.13B N0. 50-42 LA PARAGUA			\N		\N		\N		\N	\N	2001-03-22	SIEZ-2001-03-22-000001
656	1	2	327	1	1	ACOUSTIC BUSINESS SERVICE,C.A.	ACBS	J307126892	20010706000000	2009-01-01	2009-12-31	CALLE PIAR CON AV.MIRANDA N0. 144 CIUDAD OJEDA			\N		\N		\N		\N	\N	2001-07-06	SIEZ-2001-07-06-000000
975	1	2	327	1	1	CONTRATISTA INDUS. SALAZAR Y SERVICIO, C.A.	COINSERCA	J070379871	19990302000002	2009-01-01	2009-12-31	KM.13 CARRETERA LA CAÑADA AV.48 CON CALLE 206			\N		\N		\N		\N	\N	1999-03-02	SIEZ-1999-03-02-000002
410	1	2	327	1	1	DISEÑO Y CONSTRUCCION DE OBRAS CIVILES,C.A.	DICONCA	J307163305	20001215000000	2009-01-01	2009-12-31	AV.3Y ENTRE CALLES 78 Y 79 C.C.SALTO ANGEL PRIMER NIVEL L.53			\N		\N		\N		\N	\N	2000-12-15	SIEZ-2000-12-15-000000
415	1	2	327	1	1	ACROPOLIS DISEÑOS Y CONSTRUCCIONES,C.A.	ACROPOLIS,C.A.	J307261013	20001215000001	2009-01-01	2009-12-31	AV.3Y ENTRE CALLES 78 Y 79 C.C.SALTO ANGEL PRIMER NIVEL L.53			\N		\N		\N		\N	\N	2000-12-15	SIEZ-2000-12-15-000001
1037	1	2	327	1	1	DE LA TORRE COMPANY,C.A.	DELTCOM,C.A.	J306123920	20030415000001	2009-01-01	2009-12-31	CALLE 97 N0.96H-114 URB.SAN MIGUEL			\N		\N		\N		\N	\N	2003-04-15	SIEZ-2003-04-15-000001
1060	1	2	327	1	1	CONSTRUCCIONES Y PERFILES,C.A.	CONPERCA	J305061980	20030827000000	2009-01-01	2009-12-31	AV. FUERZAS ARMADAS C.C.DORAL CENTER			\N		\N		\N		\N	\N	2003-08-27	SIEZ-2003-08-27-000000
1109	1	2	327	1	1	COMPUTOS,C.A.		J309132385	20020703000000	2009-01-01	2009-12-31	VEREDA 1 URB.SAN JACINTO CASA N0. 38			\N		\N		\N		\N	\N	2002-07-03	SIEZ-2002-07-03-000000
1590	1	2	327	1	1	PROECO, C.A.		J304213280	19990319000048	2009-01-01	2009-12-31	AV.8 STA.RITA C.C. LAS CAROLINAS MEZNINE 8 Y 9			\N		\N		\N		\N	\N	1999-03-19	SIEZ-1999-03-19-000048
1623	1	2	327	1	1	NAMAZI & ASOCIADOS,C.A.		J301300254	20001213000001	2009-01-01	2009-12-31	AV.4 BELLA VISTA C.CALLE 65 EDIF.SIGMA 3 PISO OFIC. 3			\N		\N		\N		\N	\N	2000-12-13	SIEZ-2000-12-13-000001
767	1	2	327	1	1	LUGONZA,C.A.		J307840226	20010409000003	2009-01-01	2009-12-31	CALLE 77 CON AV.MILAGRO			\N		\N		\N		\N	\N	2001-04-09	SIEZ-2001-04-09-000003
994	1	2	327	1	1	CONSTRUCTORA CABIMAS, S.A.	COCASA	J070181737	19990607000008	2009-01-01	2009-12-31	LAS DELICIAS C/PRINCIPAL #.180			\N		\N		\N		\N	\N	1999-06-07	SIEZ-1999-06-07-000008
1021	1	2	327	1	1	FERRACO,S.A.	FERRACOSA	J307824352	20010620000001	2009-01-01	2009-12-31	CALLE 59A N0. 4-30 SECTOR LAS MERCEDES			\N		\N		\N		\N	\N	2001-06-20	SIEZ-2001-06-20-000001
1022	1	2	327	1	1	CONSTRUCTORA COSTA ORIENTAL DEL LAGO,C.A.	CONTRUCOL,C.A.	J307420405	20011019000001	2009-01-01	2009-12-31	CALLE ALTAMIRA SECTOR LOS BARROSOS CASA S/N MENE GRANDE			\N		\N		\N		\N	\N	2001-10-19	SIEZ-2001-10-19-000001
1067	1	2	327	1	1	CONSTRUCTORA INGENIERO MOGOLLON, C.A.	COINMOCA	J301277384	19990322000000	2009-01-01	2009-12-31	CALLE 70 NO.83A-61 SECTOR STA.MARIA			\N		\N		\N		\N	\N	1999-03-22	SIEZ-1999-03-22-000000
868	1	2	327	1	1	CONSTRUCCIONES CARDOZO VILLASMIL,C.A.	CONSCARVICA	J305234906	20011114000000	2009-01-01	2009-12-31	AV.LIBERTADOR C.C. LA REDOMA LOCALES 17 Y 18 D			\N		\N		\N		\N	\N	2001-11-14	SIEZ-2001-11-14-000000
871	1	2	327	1	1	PROYECTOS Y CONSTRUCCIONES EVAMAR, C.A.	EVAMAR, C.A.	J070474866	19990312000064	2009-01-01	2009-12-31	IURB.LA TRINIDAD AV.15E N0.55A-17			\N		\N		\N		\N	\N	1999-03-12	SIEZ-1999-03-12-000064
872	1	2	327	1	1	CONSTRUCCIONES SAME,C.A.	SAMECA	J309268511	20020822000000	2009-01-01	2009-12-31	CALLE 88,SECTOR LAS VERITAS CASA NO. 10-09			\N		\N		\N		\N	\N	2002-08-22	SIEZ-2002-08-22-000000
874	1	2	327	1	1	CONSTRUCCIONES,SUMINISTRO Y MANTENIMIENTO HEVILCA,C.A.	HEVILCA,C.A.	J307306238	20011112000000	2009-01-01	2009-12-31	URB.VALLE ALTO CALLE 95 CIRCUNV.2 N0.58A-119			\N		\N		\N		\N	\N	2001-11-12	SIEZ-2001-11-12-000000
877	1	2	327	1	1	CONTRATISTA DEL		J161087153	20010815000000	2009-01-01	2009-12-31	AV.STA. TERESA NO.42			\N		\N		\N		\N	\N	2001-08-15	SIEZ-2001-08-15-000000
878	1	2	327	1	1	CONSTRUCCIONES,INGENIERIA Y MANTENIMIENTO RONALD,C.A.	RONALCA	J307660902	20010905000000	2009-01-01	2009-12-31	AV.LA LIMPIA,NO.13-19.			\N		\N		\N		\N	\N	2001-09-05	SIEZ-2001-09-05-000000
880	1	2	327	1	1	CONSTRUCTORA ANSAVEN, C.A.	ANSAVENCA	J302938414	19990324000089	2009-01-01	2009-12-31	AV.PRINCIPAL ESQUINA CALLE VENEZUELA AL LADO  DE LA ASAMBELA L.			\N		\N		\N		\N	\N	1999-03-24	SIEZ-1999-03-24-000089
881	1	2	327	1	1	TUNA`S CONSTRUCTIONS & CORPORATIONS,COMPAÑIA ANONIMA		J308963399	20020823000000	2009-01-01	2009-12-31	AV.15 DELICIAS.CON C/72 C.C.PASEO 72.PH-03 OFICINA 3.			\N		\N		\N		\N	\N	2002-08-23	SIEZ-2002-08-23-000000
882	1	2	327	1	1	INVERSIONES SIANGA,C.A.	ISCA	J305090912	20020827000001	2009-01-01	2009-12-31	AV.4, CALLE 14 N.4-24 SIERRA MAESTRA			\N		\N		\N		\N	\N	2002-08-27	SIEZ-2002-08-27-000001
883	1	2	327	1	1	CIGCA,C.A.		J306609261	20021016000001	2009-01-01	2009-12-31	CARRETERA VIA EL MOJAN AV.16 C.C. PALAIMA LOCAL 1-2			\N		\N		\N		\N	\N	2002-10-16	SIEZ-2002-10-16-000001
884	1	2	327	1	1	TUVIO,COMPAÑIA ANONIMA		J309337548	20020905000002	2009-01-01	2009-12-31	AV.  FUERZASA ARMADAS URB. LOMA LINDA, EDIF. 12,APTO 5			\N		\N		\N		\N	\N	2002-09-05	SIEZ-2002-09-05-000002
885	1	2	327	1	1	INVERSIONES TIBISAY, C.A.	INVERTICA	J302929164	20010315000003	2009-01-01	2009-12-31	URB.ROSAL SUR CALLE 43 C.AV.10 #13-143			\N		\N		\N		\N	\N	2001-03-15	SIEZ-2001-03-15-000003
887	1	2	327	1	1	CONSTRUCCIONES,SERVICIO Y MANTENIMIENTO BORJAS MEDINA,C.A.	BORMECA	J307753331	20010625000000	2009-01-01	2009-12-31	AV.3F C/CALLE 78 EDIF.TORRE DR.PORTILLO OFIC.IA MEZZANINA			\N		\N		\N		\N	\N	2001-06-25	SIEZ-2001-06-25-000000
888	1	2	327	1	1	DAUMA C.A.		J070305363	20020829000001	2009-01-01	2009-12-31	AV.22 EDIF. MONTIELCO,NO. 72-19,2PISO.OFICINA 2 E.			\N		\N		\N		\N	\N	2002-08-29	SIEZ-2002-08-29-000001
889	1	2	327	1	1	INVERSIONES EL CASTILLO,C.A.		J302348315	20021125000000	2009-01-01	2009-12-31	URB.EL NARANJAL AV.15 N0. 50B-66			\N		\N		\N		\N	\N	2002-11-25	SIEZ-2002-11-25-000000
890	1	2	327	1	1	CONSTRUCCIONES 7.50, C.A.		J307428120	20020912000003	2009-01-01	2009-12-31	BARRIO PANAMERICANO, CALLE 71, NO. 43C-54			\N		\N		\N		\N	\N	2002-09-12	SIEZ-2002-09-12-000003
891	1	2	327	1	1	CONSELECA C.A.		J308552925	20020902000000	2009-01-01	2009-12-31	AV. 19 DE ABRIL.C.C.EL PARQUE,TORRE A,OFICINA 2 D,SANCRISTOB			\N		\N		\N		\N	\N	2002-09-02	SIEZ-2002-09-02-000000
892	1	2	327	1	1	P.I.M. CONSTRUCCIONES, C.A.		J3091O5809	20020909000000	2009-01-01	2009-12-31	CALLE 79 G, SECT. AYACUCHO URB. LA FLORIDA CONJ.R.LA FLORIDA			\N		\N		\N		\N	\N	2002-09-09	SIEZ-2002-09-09-000000
894	1	2	327	1	1	CHEMICAL INJECTION SYSTEMS COMPAÑIA ANONIMA	CISCA	J304494980	20020912000000	2009-01-01	2009-12-31	CALLE 67 N. 24-48			\N		\N		\N		\N	\N	2002-09-12	SIEZ-2002-09-12-000000
895	1	2	327	1	1	REYES & CORDERO,SERVICIOS TECNICOS INDUSTRIALES,C.A.	R&C,SERTICA	J307832789	20021107000000	2009-01-01	2009-12-31	CALLE 75 ENTRE AV.8 Y 4 SECTOR BELLA VISTA C.C.S.BENITO L.01			\N		\N		\N		\N	\N	2002-11-07	SIEZ-2002-11-07-000000
898	1	2	327	1	1	CONSTRUCCIONES,SERVICIOS Y MANTENIMIENTOS SABATINI,C.A.		J307349514	20011214000000	2009-01-01	2009-12-31	AV.7 CALLE 66 Y 67 SECTOR SANTA RITA EDIF.PLAZA PARK APTO 9B			\N		\N		\N		\N	\N	2001-12-14	SIEZ-2001-12-14-000000
899	1	2	327	1	1	IRAUSQUIN FALCON,C.A.	IRFALCA	J308622028	20021114000000	2009-01-01	2009-12-31	URB.EL DORAL NORTE AV.12A N0. 35-82			\N		\N		\N		\N	\N	2002-11-14	SIEZ-2002-11-14-000000
900	1	2	327	1	1	SUMINISTROS INTEGRALES,C.A.	SUICA	J304466986	20021120000001	2009-01-01	2009-12-31	URB. IRAMA C.C.IRAMA PLANTA ALTA  LOCAL 10			\N		\N		\N		\N	\N	2002-11-20	SIEZ-2002-11-20-000001
901	1	2	327	1	1	SERVICIOS,MANTENIMIENTO Y CONSTRUCCIONES COQUIVACOA,C.A.	SERMACCO,C.A.	J309341251	20021004000001	2009-01-01	2009-12-31	CENTRO COMERCIAL LAS TEJAS LOCAL 3-11			\N		\N		\N		\N	\N	2002-10-04	SIEZ-2002-10-04-000001
902	1	2	327	1	1	INGENIERIA GUZMAN ATENCIO COMPAÑIA ANONIMA	INGUZA,C.A.	J070151889	19990603000003	2009-01-01	2009-12-31	C.C LAS TUNAS LOCAL #.12,2D0 PISO NIVEL			\N		\N		\N		\N	\N	1999-06-03	SIEZ-1999-06-03-000003
903	1	2	327	1	1	REPRESENTACIONES NAVA PRIETO, C.A.	RENAPRICA	J302876826	19990422000061	2009-01-01	2009-12-31	CALLE STA.MARIA LA MONTAÑITA NO.114-B CABIMAS			\N		\N		\N		\N	\N	1999-04-22	SIEZ-1999-04-22-000061
904	1	2	327	1	1	PROTERS CONSTRUCCIONES  Y SERVICIOS,C.A.		J307507705	20021105000000	2009-01-01	2009-12-31	AV.17 BARRIO SANTA ROSA DE TIERRA			\N		\N		\N		\N	\N	2002-11-05	SIEZ-2002-11-05-000000
911	1	2	327	1	1	LA CORTE & MALDONADO CONSTRUCCIONES,C.A.	L & M CONSTRUCCIONES,C.A.	J070470348	20001120000000	2009-01-01	2009-12-31	CARRETERA L ENTRE A.V 44Y61			\N		\N		\N		\N	\N	2000-11-20	SIEZ-2000-11-20-000000
912	1	2	327	1	1	CONSTRUCTORA COJORO,C.A.	CONSCO,C.A.	J308025232	20010607000000	2009-01-01	2009-12-31	AV.15P N0.47-84			\N		\N		\N		\N	\N	2001-06-07	SIEZ-2001-06-07-000000
914	1	2	327	1	1	PAMARCA,C.A.		J305980497	20021018000000	2009-01-01	2009-12-31	AV.16 CONJUNTO RESD.PALAIMA EDIF.4 TORRE A APTO.1-B			\N		\N		\N		\N	\N	2002-10-18	SIEZ-2002-10-18-000000
915	1	2	327	1	1	INVERSORA LA VIVIENDA,C.A.	INVELVICA	J304518730	20010529000002	2009-01-01	2009-12-31	AV.19 N0. 98-152 SECTOR LA FLORIDA			\N		\N		\N		\N	\N	2001-05-29	SIEZ-2001-05-29-000002
916	1	2	327	1	1	DRAGAS DEL SUR COMPAÑIA ANONIMA	DRAGASUR,C.A.	J070501804	20000607000001	2009-01-01	2009-12-31	CALLE 1 # 5-117 SAN CARLOS DEL ZULIA EDO. ZULIA			\N		\N		\N		\N	\N	2000-06-07	SIEZ-2000-06-07-000001
917	1	2	327	1	1	CONSTRUCTORA FIGUERA GONZALEZ,C.A.	FIGOCA	J303181899	20021030000000	2009-01-01	2009-12-31	CALLE 84 N0. 16B-26 LAS DELICIAS			\N		\N		\N		\N	\N	2002-10-30	SIEZ-2002-10-30-000000
919	1	2	327	1	1	INGENIERIA,GERENCIA Y OBRAS,C.A.	INGEOCA	J303421857	20020313000001	2009-01-01	2009-12-31	AV.3D-4 N0.63-41 ENTRE CALLES 63 Y 64 SECTOR SAN ROQUE			\N		\N		\N		\N	\N	2002-03-13	SIEZ-2002-03-13-000001
926	1	2	327	1	1	V & Q SERVICES,C.A.		J308257800	20030226000000	2009-01-01	2009-12-31	AV.13A SECTOR TIERRA NEGRA EDIF.CARLINE APTO. 1 Y 3			\N		\N		\N		\N	\N	2003-02-26	SIEZ-2003-02-26-000000
927	1	2	327	1	1	BOMBAS FLYGT DE VENEZUELA,S.A.		J306697420	20010918000001	2009-01-01	2009-12-31	CALLE 10 CON C.5.C.EMPRESARIAL ORINOCO,PISO 1,OFI.6,CARACAS			\N		\N		\N		\N	\N	2001-09-18	SIEZ-2001-09-18-000001
928	1	2	327	1	1	INVERSIONES, SUMINISTROS Y CONSTRUCCIONES C.A.	INSUCOCA	J306072799	19991007000001	2009-01-01	2009-12-31	AV.23 SECTOR 1 DE MAYO N0.85-72 LOCAL 4			\N		\N		\N		\N	\N	1999-10-07	SIEZ-1999-10-07-000001
1113	1	2	327	1	1	CONSTRUCCIONES Y MANTENIMIENTOS WILLARD, C.A.	WILLARDCA	J070509368	19990505000002	2009-01-01	2009-12-31	AV.19A-#.79-96 SECTOR LAS DELICIAS			\N		\N		\N		\N	\N	1999-05-05	SIEZ-1999-05-05-000002
941	1	2	327	1	1	INGENIERIA DE AGUAS, C.A.	INGACA	J070388153	19990319000049	2009-01-01	2009-12-31	PARAISO,CL 72,ESQ.AV.19,EDIF NOEL TORRE B,P.B. OFIC.2			\N		\N		\N		\N	\N	1999-03-19	SIEZ-1999-03-19-000049
942	1	2	327	1	1	M & F CONSTRUCCIONES, C.A.		J304459033	19991210000002	2009-01-01	2009-12-31	AV.49 B- #.151-66 EL SILENCIO ZULIA			\N		\N		\N		\N	\N	1999-12-10	SIEZ-1999-12-10-000002
607	1	2	327	1	1	CONSTRUCCION,SUMINISTRO,INGENIERIA Y MANTENIMIENTO,C.A.	CONSUINMA,C.A.	J306972790	20010326000000	2009-01-01	2009-12-31	AV.BELLA VISTA CON CALLE 67 C.C. SOCUY LOCAL 28			\N		\N		\N		\N	\N	2001-03-26	SIEZ-2001-03-26-000000
610	1	2	327	1	1	VENEZUELAN ENGINEERING SUPPLY CONSTRUCTION,C.A.	VENESC, C.A	J307265647	20010329000000	2009-01-01	2009-12-31	CALLE 52 ENTRE 11D Y 12 C.C. CARIDAD DEL COBRE			\N		\N		\N		\N	\N	2001-03-29	SIEZ-2001-03-29-000000
1627	1	2	327	1	1	CONSTRUCCIONES MAR S C.A.	CONMAR S C.A.	J300470784	19990308000071	2009-01-01	2009-12-31	AV.29 EDIF.N.76-10 LOCAL NO.01 SECTOR AMPARO			\N		\N		\N		\N	\N	1999-03-08	SIEZ-1999-03-08-000071
1628	1	2	327	1	1	MEGA INGENIERIA, C.A.		J305548709	19990701000001	2009-01-01	2009-12-31	CALLE 76 AV.12 EDIF. UPEMA PISO 2 ALA B			\N		\N		\N		\N	\N	1999-07-01	SIEZ-1999-07-01-000001
1629	1	2	327	1	1	CONSTRUCCIONES VARELA,C.A.	CONVARCA	J304166699	20011112000001	2009-01-01	2009-12-31	CALLE 148 N0.168 VIA PALITO BLANCO FRENTE A ACERO VENEZOLANO			\N		\N		\N		\N	\N	2001-11-12	SIEZ-2001-11-12-000001
1630	1	2	327	1	1	CONSTRUCTORA IMATACA,C.A	IMATACA	J309655604	20030228000000	2009-01-01	2009-12-31	BARRIO LOS ROBLES CALLE 113 N0.63-12			\N		\N		\N		\N	\N	2003-02-28	SIEZ-2003-02-28-000000
1631	1	2	327	1	1	DRAGIN,C.A.		J304515553	20030410000000	2009-01-01	2009-12-31	C.PANAMERICANA-VIA SAN CRISTOBAL SECTOR SANTA ISABEL			\N		\N		\N		\N	\N	2003-04-10	SIEZ-2003-04-10-000000
1632	1	2	327	1	1	VENEZOLANA DE INGEN.ELECTR.Y MECANICA, C.A.	VIEMCA	J300035808	19990322000016	2009-01-01	2009-12-31	AV.28 LA LIMPIA NO,.3-92			\N		\N		\N		\N	\N	1999-03-22	SIEZ-1999-03-22-000016
956	1	2	327	1	1	INVERSIONES KOBIAKOV FUENMAYOR,C.A.		J307317825	20010122000001	2009-01-01	2009-12-31	AV.12 C.R. ALTAMIRA APTO.1-A			\N		\N		\N		\N	\N	2001-01-22	SIEZ-2001-01-22-000001
1638	1	2	327	1	1	ORME C.A.	ORMECA	J308920886	20030610000000	2009-01-01	2009-12-31	AV.15 N0. 75-51			\N		\N		\N		\N	\N	2003-06-10	SIEZ-2003-06-10-000000
441	1	2	327	1	1	RO-CAL C.A.	ROCALCA	J070302054	20010117000000	2009-01-01	2009-12-31	CARRETERA PRINCIPAL A CAMPO MARA NO. 45-122.			\N		\N		\N		\N	\N	2001-01-17	SIEZ-2001-01-17-000000
451	1	2	327	1	1	INVERSIONES INBRUWAL C.A.	INBRUWALCA	J3042839211	20010116000000	2009-01-01	2009-12-31	AV. 4 CON CALLE 84 ANT. UNION EDIF. MONACO OFIC. 11A.			\N		\N		\N		\N	\N	2001-01-16	SIEZ-2001-01-16-000000
458	1	2	327	1	1	CONSTRUCCIONES GENERALES,C.A.	CONSTRUGENCA	J307452250	20001211000004	2009-01-01	2009-12-31	AV.08 CON CALLE 95 SECTOR CASCO CENTRAL C.C.STA.BARBARA L-02			\N		\N		\N		\N	\N	2000-12-11	SIEZ-2000-12-11-000004
1065	1	2	327	1	1	PROMOCIONES Y DESARROLLOS SANTA LUCIA,C.A.	PRODESANCA	J300436063	20001211000001	2009-01-01	2009-12-31	URB.EL ROSAL SUR AV.14A NO.45-103			\N		\N		\N		\N	\N	2000-12-11	SIEZ-2000-12-11-000001
803	1	2	327	1	1	CONSTRUCTORA D`AFRA,C.A.		J307809884	20010426000004	2009-01-01	2009-12-31	URB.CALIFORNIA CALLE 47 N0. 15A-87			\N		\N		\N		\N	\N	2001-04-26	SIEZ-2001-04-26-000004
858	1	2	327	1	1	TECNICAS DE CONSTRUCCIONES, C.A.		J306700080	20010124000000	2009-01-01	2009-12-31	AV.4C N0.19G-93 ALTOS DE JALISCO			\N		\N		\N		\N	\N	2001-01-24	SIEZ-2001-01-24-000000
395	1	2	327	1	1	CONSTRUCCIONES Y MANTENIMIENTO LUSAN, C.A.	LUSANCA	J301212266	19990304000038	2009-01-01	2009-12-31	AV.9B ESQUINA C/C 73 #72-68			\N		\N		\N		\N	\N	1999-03-04	SIEZ-1999-03-04-000038
404	1	2	327	1	1	EDICA CONSTRUCCIONES, C.A.		J301670124	19990318000098	2009-01-01	2009-12-31	CALLE GH NO. 10-18			\N		\N		\N		\N	\N	1999-03-18	SIEZ-1999-03-18-000098
1591	1	2	327	1	1	KOINONIA, C.A.		J305906149	19990324000051	2009-01-01	2009-12-31	SECTOR CASCO CENTRAL AV.4 LOCAL NO.1 NO.94-55			\N		\N		\N		\N	\N	1999-03-24	SIEZ-1999-03-24-000051
1655	1	2	327	1	1	CONINVERCA		J300153568	20010731000001	2009-01-01	2009-12-31	AV.71A N0.79C-17 URB. EL PRADO			\N		\N		\N		\N	\N	2001-07-31	SIEZ-2001-07-31-000001
1658	1	2	327	1	1	CONSTRUCTORA KAROLKA,C.A.		J305134430	20001221000000	2009-01-01	2009-12-31	AV.INDEPENDENCIA SECT.STA.MARIA NO.3 MENE GRANDE			\N		\N		\N		\N	\N	2000-12-21	SIEZ-2000-12-21-000000
430	1	2	327	1	1	INGENIERIA NEGLIS Y CARLOS C.A.	INEYCAR C.A.	J307042940	20001207000001	2009-01-01	2009-12-31	EL MANZANILLO CALLE 3 CON AV. 24D NO. 3-25			\N		\N		\N		\N	\N	2000-12-07	SIEZ-2000-12-07-000001
431	1	2	327	1	1	H.J.PROYECTOS Y CONSTRUCCIONES  C.A.	HUJIMPROCA	J307211431	20001211000000	2009-01-01	2009-12-31	AV.15 SECTOR TIERRA NEGRA EDIF.GREDOS NO.67B-10 LOCAL 4			\N		\N		\N		\N	\N	2000-12-11	SIEZ-2000-12-11-000000
604	1	2	327	1	1	PROYECTOS,CONSTRUCCIONES Y SERVICIOS DEL VALLE,C.A.	P.C.S.V.	J307433833	20010316000001	2009-01-01	2009-12-31	CARRETERA PANAMERICANA, CAJA SECA			\N		\N		\N		\N	\N	2001-03-16	SIEZ-2001-03-16-000001
605	1	2	327	1	1	SISTEMAS DE INGENIERIA Y MANTENIMIENTO,C.A.	SINGEMA	J307758392	20010511000000	2009-01-01	2009-12-31	AV.20 CON CALLE 67 N0. 67-8 INDIO MARA			\N		\N		\N		\N	\N	2001-05-11	SIEZ-2001-05-11-000000
606	1	2	327	1	1	PROYECTO NACIONAL,C.A.	PRONACA	J307724986	20010322000000	2009-01-01	2009-12-31	CALLE 28			\N		\N		\N		\N	\N	2001-03-22	SIEZ-2001-03-22-000000
1960	1	2	327	1	1	INGENIERIA, CONST., MANT.  Y SERVICIO, C.A.	INGENIERIA, C. M. S. C.A.	J308391549	20051208000001	2009-01-01	2009-12-31	AV. 9B ENTRE CALLES 82B Y 83 Nº 9B-60			\N		\N		\N		\N	\N	2005-12-08	SIEZ-2005-12-08-000001
668	1	2	327	1	1	INGENIERIA,CONSTRUCCION,MANTENIMIENTO Y SERVICIO,C.A.	INGENIERIA, C.M.S.,C.A	J308391549	20010925000001	2009-01-01	2009-12-31	AV.9B CALLE 70 SECTOR TIERRA NEGRA N0. 9B-90			\N		\N		\N		\N	\N	2005-12-08	SIEZ-2005-12-08-000001
1150	1	2	327	1	1	CONSTRUCCIONES PEREZ,C.A.	COPERCA	J306976540	20010126000000	2009-01-01	2009-12-31	CALLE 79I N0. 73A-112			\N		\N		\N		\N	\N	2001-01-26	SIEZ-2001-01-26-000000
1678	1	2	327	1	1	SERVICIOS Y TRANSPORTE LUCCHI,C.A.	SERTRALUCCHI,C.A.	J302496810	20021022000001	2009-01-01	2009-12-31	CAMPO JUNIN,BACHAQUERO			\N		\N		\N		\N	\N	2002-10-22	SIEZ-2002-10-22-000001
592	1	2	327	1	1	INVERSIONES PIEDRA BLANCA,C.A.	INPIBCA	J304372205	20010221000000	2009-01-01	2009-12-31	AV.4 BELLA VISTA BENTRE CALLE 61 Y 62 SEC.LAS MERCEDES			\N		\N		\N		\N	\N	2001-02-21	SIEZ-2001-02-21-000000
593	1	2	327	1	1	CONSTRUCCIONES DOUSOT,C.A.	DOSOCA	J307405449	20010219000003	2009-01-01	2009-12-31	URB.COROMOTO CALLE 167 N0. 42-113			\N		\N		\N		\N	\N	2001-02-19	SIEZ-2001-02-19-000003
594	1	2	327	1	1	PEROZO BRACHO,C.A.	PEBRA,C.A.	J307786086	20010423000000	2009-01-01	2009-12-31	AV.20 ENTRE CALLES 67 Y 68 EDIF.RIO BRAVO APTO.8			\N		\N		\N		\N	\N	2001-04-23	SIEZ-2001-04-23-000000
595	1	2	327	1	1	CONSTRUCCIONES INGENIERIA Y MANTENIMIENTO ANDRADE,C.A.	CINGMA,C.A.	J304847262	20010426000005	2009-01-01	2009-12-31	RESD.LAS VISTAS EDIF.VISTA BELLA PISO 3 AV 16			\N		\N		\N		\N	\N	2001-04-26	SIEZ-2001-04-26-000005
598	1	2	327	1	1	CONSTRUCTORA SIMA,C.A.	SIMACA	J307770619	20010507000000	2009-01-01	2009-12-31	CALLE 3 VEREDA 36 SEGUNDA VEREDA N0.11 URB. URDANETA			\N		\N		\N		\N	\N	2001-05-07	SIEZ-2001-05-07-000000
603	1	2	327	1	1	OBRAS DIVERSAS,C.A.	ODICA	J070493240	20010319000002	2009-01-01	2009-12-31	CALLE 72 CON AV. 3Y EDIF.LOS ROQUES OFICINA 2 Y 3			\N		\N		\N		\N	\N	2001-03-19	SIEZ-2001-03-19-000002
1162	1	2	327	1	1	B&C INVERSIONES,C.A.		J309085271	20030429000000	2009-01-01	2009-12-31	ESQ.AV.8B CALLE 64N0.8A-65			\N		\N		\N		\N	\N	2003-04-29	SIEZ-2003-04-29-000000
953	1	2	327	1	1	ING.VECELIO FOCA CONSTRUCCIONES		V043219843	19990614000020	2009-01-01	2009-12-31	C/URDANETA # 15 EL BATEY MCPIO SUCRE CAJA SECA			\N		\N		\N		\N	\N	1999-06-14	SIEZ-1999-06-14-000020
1056	1	2	327	1	1	LIFE LINE,C.A.		J303819460	20010207000002	2009-01-01	2009-12-31	AV.3Y SAN MARTIN ENTRE CALLES 71 Y 72 MINI CENTRO TULIPAN L5			\N		\N		\N		\N	\N	2001-02-07	SIEZ-2001-02-07-000002
1007	1	2	327	1	1	CONSTRUCCIONES Y SUMINISTROS H Y C, C.A.	CONSUHYCCA	J070467541	19990315000079	2009-01-01	2009-12-31	AV.LA LIMPIA, CALLE 59 NO.31A-70			\N		\N		\N		\N	\N	1999-03-15	SIEZ-1999-03-15-000079
1082	1	2	327	1	1	HILMAR CONSTRUCCIONES,C.A.		J309054090	20030617000000	2009-01-01	2009-12-31	C.77 5 DE JULIO EDIF.VARGHEL LOCAL 1 SECTOR EL PARAISO			\N		\N		\N		\N	\N	2003-06-17	SIEZ-2003-06-17-000000
1027	1	2	327	1	1	CONSTRUCTORA E INVERSIONES RINCON BERMUDEZ,C.A.	COIRIBECA	J308419222	20011106000001	2009-01-01	2009-12-31	VILLA DEL ROSARIO AV.10 SECTOR LA ENGRANZONADA			\N		\N		\N		\N	\N	2001-11-06	SIEZ-2001-11-06-000001
1544	1	2	327	1	1	OPAL,C.A.		J070103337	20010403000001	2009-01-01	2009-12-31	AV.44 ENTRE CARRETERA N Y CALLE VARGAS DETRAS DE FECSA			\N		\N		\N		\N	\N	2001-04-03	SIEZ-2001-04-03-000001
1566	1	2	327	1	1	INVERSIONES DELTA, C.A.		J305314926	19990701000000	2009-01-01	2009-12-31	SECTOR MONTE CLARO #.6-66			\N		\N		\N		\N	\N	1999-07-01	SIEZ-1999-07-01-000000
791	1	2	327	1	1	CONSTRUCTORA RICARDO ATENCIO LEON,C.A.	CORALCA	J307692332	20010626000000	2009-01-01	2009-12-31	AV.FUERZAS ARMADAS CONJ.RES.VILLA BONITA TORRE I APTO.PH-B			\N		\N		\N		\N	\N	2001-06-26	SIEZ-2001-06-26-000000
852	1	2	327	1	1	PREFABRICADOS MARACAIBO,C.A.	PREMAR,C.A.	J308305880	20020702000000	2009-01-01	2009-12-31	AV.PPAL.PALITO BLANCO-TERRENO VACIO			\N		\N		\N		\N	\N	2002-07-02	SIEZ-2002-07-02-000000
1015	1	2	327	1	1	CENTRO DE ADESTRAMIENTO Y ASESORA.INDUS.LATINOAMERICANO,C.A.	CAILA, C.A.	J304131879	19990714000002	2009-01-01	2009-12-31	URB.LAS CUARENTAS CALLE 3 NO.117-A			\N		\N		\N		\N	\N	1999-07-14	SIEZ-1999-07-14-000002
1095	1	2	327	1	1	MANTENIMIENTO,CONSTRUCCIONES Y SERVICIOS,C.A.	MACONSE,C.A.	J308841927	20020425000001	2009-01-01	2009-12-31	CARRETERA F, SECTOR LA MISION EDIF. LORETO CABIMAS			\N		\N		\N		\N	\N	2002-04-25	SIEZ-2002-04-25-000001
907	1	2	327	1	1	NASTASI & MOLINA CONSTRUCTORA,S.A.	N & M.C,S.A.	J306923454	20021115000000	2009-01-01	2009-12-31	AV. CRISTOBAL COLON			\N		\N		\N		\N	\N	2002-11-15	SIEZ-2002-11-15-000000
1035	1	2	327	1	1	LENEMA,C.A.		J307353228	20001117000003	2009-01-01	2009-12-31	CALLE 78 NO.16- 61 TORRE CONDOMINIO OFICINA 32			\N		\N		\N		\N	\N	2000-11-17	SIEZ-2000-11-17-000003
1132	1	2	327	1	1	PORAGUA,C.A.	PORAGUA	J307314923	20021112000001	2009-01-01	2009-12-31	AV.5 DE JULIO C.C. INTERNACIONAL P.B.			\N		\N		\N		\N	\N	2002-11-12	SIEZ-2002-11-12-000001
1134	1	2	327	1	1	SERVICIOS Y MANTENIMENTO GARCIA, C.A.	SEMAGAR, C.A.	J070496479	19990319000051	2009-01-01	2009-12-31	AV.17B,CALLE 115A NO.17-34			\N		\N		\N		\N	\N	1999-03-19	SIEZ-1999-03-19-000051
1645	1	2	327	1	1	CONSTRUCTORA ORIZAWA C.A.	CORIZA	J402493188	20001006000000	2009-01-01	2009-12-31	AV.20 ENTRES CALLES 66 Y 67 C.C. CASIQUIARE P.B.LOCAL 06			\N		\N		\N		\N	\N	2000-10-06	SIEZ-2000-10-06-000000
1646	1	2	327	1	1	E.F.R., C.A.		J302150132	19990310000027	2009-01-01	2009-12-31	CALLE 71 CON AV.3C NO.3C-86 SECTOR LA LAGO			\N		\N		\N		\N	\N	1999-03-10	SIEZ-1999-03-10-000027
1716	1	2	327	1	1	MANTENIMIENTO, NEGOCIO Y VAPOR C.A.	MANEVA	J070318066	19990304000021	2009-01-01	2009-12-31	CALLE 77 ESQ.AV.18 EDIF.IMAR PISO 3 OFICINA 9			\N		\N		\N		\N	\N	1999-03-04	SIEZ-1999-03-04-000021
1717	1	2	327	1	1	DESARROLLOS,INVERSIONES Y SERVICIOS, C.A.	DISCA	J305877424	19990329000043	2009-01-01	2009-12-31	CALLE 86 A/AV.2 EL MILAGRO EDIF.ANGELICA B LOCAL NO.6			\N		\N		\N		\N	\N	1999-03-29	SIEZ-1999-03-29-000043
1718	1	2	327	1	1	CONSTRUCCIONES O.M. COMPAÑIA ANONIMA	OMCA	J303186203	20001017000000	2009-01-01	2009-12-31	AV.24 CALLE 70 C.C. PALMIRA LOCAL 06			\N		\N		\N		\N	\N	2000-10-17	SIEZ-2000-10-17-000000
1085	1	2	327	1	1	ARTE Y PROYECTO,C.A.	ARPROCA	J310098921	20030623000000	2009-01-01	2009-12-31	AV.3H C.C.68 SECTOR BELLA VISTA N0.69-51			\N		\N		\N		\N	\N	2003-06-23	SIEZ-2003-06-23-000000
1086	1	2	327	1	1	REMODELACIONES Y CONSTRUCCIONES NACIONALES, C.A.	RECONCA	J309338684	20030905000000	2009-01-01	2009-12-31	AV 15,N. 85-86BDELICIAS AUTO REPUESTOS 2000.			\N		\N		\N		\N	\N	2003-09-05	SIEZ-2003-09-05-000000
706	1	2	327	1	1	PROYECTOS CONSTRUCCIONES Y SERVICIOS YANCEN,C.A.	PROCONSER,C.A.	J306748830	20010220000001	2009-01-01	2009-12-31	CALLE 88 SECTOR VERITA N0. 10-29			\N		\N		\N		\N	\N	2001-02-20	SIEZ-2001-02-20-000001
708	1	2	327	1	1	CONSTRUCCIONES 448,C.A.		J307361620	20011120000001	2009-01-01	2009-12-31	AV.24 SECTOR PARAISO CASA N0. 65-30			\N		\N		\N		\N	\N	2001-11-20	SIEZ-2001-11-20-000001
841	1	2	327	1	1	TECNO SEGURIDAD,C.A.		J308901040	20020524000000	2009-01-01	2009-12-31	CALLE 72 ENTRE AV.15A Y 16 SECTOR DELICIAS N0.47			\N		\N		\N		\N	\N	2002-05-24	SIEZ-2002-05-24-000000
842	1	2	327	1	1	CONSTRUCCIONES,MATERIALES Y PROYECTOS,C.A.	CONMAPROCA	J307379731	20020731000000	2009-01-01	2009-12-31	AV.PPAL. SECTOR DELICIAS NUEVAS,CABIMAS N0.154			\N		\N		\N		\N	\N	2002-07-31	SIEZ-2002-07-31-000000
844	1	2	327	1	1	GEOSUELO, C.A.		J308453943	20020814000001	2009-01-01	2009-12-31	URB.EL PINAR.EDIF.PINO MORO I,PB-D LA POMONA			\N		\N		\N		\N	\N	2002-08-14	SIEZ-2002-08-14-000001
949	1	2	327	1	1	ELECTRICIDAD Y OBRAS CIVILES L.L., C.A.	ELECTROCA	J303282245	19990322000009	2009-01-01	2009-12-31	C.C.LA PARAGUA LOCAL 4.CIRCUNV. N.3.			\N		\N		\N		\N	\N	1999-03-22	SIEZ-1999-03-22-000009
1443	1	2	327	1	1	SERVIMUEBLE,C.A.		J070230517	20010220000002	2009-01-01	2009-12-31	CALLE 78 DR.PORTILLO ESQ.AV 16 N0. 16-07 SECTOR PARAISO			\N		\N		\N		\N	\N	2001-02-20	SIEZ-2001-02-20-000002
1449	1	2	327	1	1	SERVICIOS BADELL & PLUMACHER COMPAÑIA ANONIMA	S.B.P. C.A. DE CONSTRUCCION)	J300594491	19990319000066	2009-01-01	2009-12-31	CALLE 67 NO.11-115 LOCAL B			\N		\N		\N		\N	\N	1999-03-19	SIEZ-1999-03-19-000066
1899	1	2	327	1	1	INGENIERIA PROCURA Y CONSTRUCCION DE VENEZUELA,C.A.	I.P.C. DE VENEZUELA	J311403094	20050505000001	2009-01-01	2009-12-31	AV.100 SABANETA CASA N0. 54-125			\N		\N		\N		\N	\N	2005-05-05	SIEZ-2005-05-05-000001
1901	1	2	327	1	1	INVERSIONES LA FLORESTA,C.A.		J310547653	20050505000003	2009-01-01	2009-12-31	CALLE 61 CON AV.10 C.C. PALAFITO SHOPPI OFC.2A-2B			\N		\N		\N		\N	\N	2005-05-05	SIEZ-2005-05-05-000003
1903	1	2	327	1	1	CONSTRUCCIONES MONTREAL,C.A.		J307406208	20050520000001	2009-01-01	2009-12-31	CALLE 67 CON AV. 27 EDIF.FINQUITA			\N		\N		\N		\N	\N	2005-05-20	SIEZ-2005-05-20-000001
1905	1	2	327	1	1	CONSTRUCCIONES J & C,C.A.		J313130966	20050530000001	2009-01-01	2009-12-31	CALLE 216A CASA N0. 49I-48			\N		\N		\N		\N	\N	2005-05-30	SIEZ-2005-05-30-000001
1025	1	2	327	1	1	LABARCA MARTINEZ,C.A.	LAMARCA	J309420712	20021009000000	2009-01-01	2009-12-31	CALLE 61 CON AV.3G N0. 61-40 SECT.LAS MERCEDES			\N		\N		\N		\N	\N	2002-10-09	SIEZ-2002-10-09-000000
1026	1	2	327	1	1	PROYECTOS, INGENIERIA Y CONSTRUCCIONES.FFG. COMPAÑIA ANONIMA	PROFERGOCA	J306227857	19990818000000	2009-01-01	2009-12-31	CALLE 60 #.14A-65 RESIDENCIAS CANAIMA APTO 8A LAS TARABAS			\N		\N		\N		\N	\N	1999-08-18	SIEZ-1999-08-18-000000
1028	1	2	327	1	1	PROYECTOS,SERVICIOS,TECNOLOGIA Y CONSTRUCCION, C.A	PROSERTECO,C.A.	J306030620	20030502000000	2009-01-01	2009-12-31	BARRIO ZIRUMA  CALLE 59 N0.15C-71			\N		\N		\N		\N	\N	2003-05-02	SIEZ-2003-05-02-000000
1096	1	2	327	1	1	SOLDADURAS Y CONSTRUCCIONES VENEZUELA COMPANIA ANONIMA	SOCOVENCA	J070098112	20030901000000	2009-01-01	2009-12-31	AV. SECTOR LA CURVA DEL PATO VIA AL TABLAZO			\N		\N		\N		\N	\N	2003-09-01	SIEZ-2003-09-01-000000
1097	1	2	327	1	1	DECONFERCA, S.A.		J302435099	19990310000004	2009-01-01	2009-12-31	CALLE 70 EDIF.DOÑA DALIA MEZZANINE 2 OFICNA 2-2			\N		\N		\N		\N	\N	1999-03-10	SIEZ-1999-03-10-000004
1098	1	2	327	1	1	VIALIDAD, INSPECCION Y CONSTRUCCION, COMPAÑIA ANONIMA	VINC, C.A.	J070496258	19990310000041	2009-01-01	2009-12-31	AV.3-C SECTOR LA LAGO EDIF CHAMA APTO 9B			\N		\N		\N		\N	\N	1999-03-10	SIEZ-1999-03-10-000041
1099	1	2	327	1	1	CONSTRUCCIONES F & M,C.A.		J307319160	20010426000006	2009-01-01	2009-12-31	CARRETERA LA CONCEPCION KM.18 SECTOR PALITO BLANCO			\N		\N		\N		\N	\N	2001-04-26	SIEZ-2001-04-26-000006
1100	1	2	327	1	1	CONSTRUCCIONES A Y E, S.A.	CONAESA	J070243635	19990304000022	2009-01-01	2009-12-31	CALLE 72 CON AV.25 EDIF.NEZUL LOCAL 04 P.B.			\N		\N		\N		\N	\N	1999-03-04	SIEZ-1999-03-04-000022
1703	1	2	327	1	1	OBRAS DE INGENIERIA HS, C.A.	OIN, HS, C.A.	J304309155	19990320000038	2009-01-01	2009-12-31	CALLE 90 ESQ. AV.16A, N. 16-74			\N		\N		\N		\N	\N	1999-03-20	SIEZ-1999-03-20-000038
1101	1	2	327	1	1	INVERSIONES PROYECTOS MANT. Y CONSTRUCCIONES MENDEZ RUBIO	INVERPROMCA	J305192375	20000907000000	2009-01-01	2009-12-31	BARRIO CARMELO URDANETA AV. 105 NO. 71-55			\N		\N		\N		\N	\N	2000-09-07	SIEZ-2000-09-07-000000
1135	1	2	327	1	1	INGENIERIA DE LA REMODELACION MANTENIMIENTO Y AVALUOS,C.A.	INREMACA	J308912956	20030829000000	2009-01-01	2009-12-31	CALLE 69 N. 9B-04 SECTOR TIERRA NEGRA			\N		\N		\N		\N	\N	2003-08-29	SIEZ-2003-08-29-000000
1136	1	2	327	1	1	CONSTRUCCIONES NAVA Y ARAUJO,C.A.	CONARAUCA	J307472316	20010726000000	2009-01-01	2009-12-31	AV.73B SECTOR LOS MEDANOS LA LIMPIA N0. 79I-10			\N		\N		\N		\N	\N	2001-07-26	SIEZ-2001-07-26-000000
1458	1	2	327	1	1	CONSTRUCCIONES MONSERCA,S.A.		J070228687	20010222000000	2009-01-01	2009-12-31	AV.57B NO.97-51 SECT.ANDRES ELOY BLANCO C.2 DETRAS C.C.TARC.			\N		\N		\N		\N	\N	2001-02-22	SIEZ-2001-02-22-000000
1137	1	2	327	1	1	PROYECTOS GERENCIALES, C.A.	PROGERCA	J305353018	19990315000075	2009-01-01	2009-12-31	AV.15 DELICIAS ENTRE CALLES 89 Y 89B EDIF.LAS PALMERAS P-1			\N		\N		\N		\N	\N	1999-03-15	SIEZ-1999-03-15-000075
1138	1	2	327	1	1	TECNO CIVIL, C.A.		J070324856	19990429000001	2009-01-01	2009-12-31	AV.3H /CALLE 78 Y 79 RESID. REPUBLICA PLANT.BAJA LOCAL #2			\N		\N		\N		\N	\N	1999-04-29	SIEZ-1999-04-29-000001
950	1	2	327	1	1	CONSTRUCTORA CERVI, C.A.		J306215182	20000129000001	2009-01-01	2009-12-31	ZONA INDUSTRIAL CALLE 149 AV68 #68-185 SEGUNDA ETAPA			\N		\N		\N		\N	\N	2000-01-29	SIEZ-2000-01-29-000001
951	1	2	327	1	1	TEMISTOCLES SUAREZ, C.A.	TESUCA	J070336706	19990310000081	2009-01-01	2009-12-31	TERRAZAS DE MCBO,NO.02,EDIF.SANTA BARBARA,LOCAL 3D			\N		\N		\N		\N	\N	1999-03-10	SIEZ-1999-03-10-000081
1451	1	2	327	1	1	REPARACION Y PINTURA DE MUEBLES DE OFICINAS,C.A.	REPIMUEBLES,C.A.	J300071650	20010228000002	2009-01-01	2009-12-31	AV.LA LIMPIA SECT.POSTES NEGROS N0. 8-15			\N		\N		\N		\N	\N	2001-02-28	SIEZ-2001-02-28-000002
1683	1	2	327	1	1	MONTAJE ELECTRICO DE EDIFICIOS C.A	MEECA	J070419482	19991103000001	2009-01-01	2009-12-31	CALLE 73 #.16A-64 LAS DELICIAS			\N		\N		\N		\N	\N	1999-11-03	SIEZ-1999-11-03-000001
1685	1	2	327	1	1	TERMOPLASTICA DE OCCIDENTE C.A.	TERMOCCIDENTE C.A.	J305826331	20001030000001	2009-01-01	2009-12-31	BARRIO LOS CORTIJOS CALLE 216 CON AV. 49I			\N		\N		\N		\N	\N	2000-10-30	SIEZ-2000-10-30-000001
1686	1	2	327	1	1	E.C. CONSTRUCCIONES,S.A.	ECONSA	J304326190	20010330000002	2009-01-01	2009-12-31	AV.78 AL LADO DE LA FLORISTERIA ANGELA			\N		\N		\N		\N	\N	2001-03-30	SIEZ-2001-03-30-000002
1688	1	2	327	1	1	CONSTRUCCIONES VILLALOBOS GARCIA, C.A.	COVIGARCA	J070383950	19990310000095	2009-01-01	2009-12-31	URB.MONTE BELLO CALLE M CON AV.13 NO.12-80			\N		\N		\N		\N	\N	1999-03-10	SIEZ-1999-03-10-000095
1690	1	2	327	1	1	CONSTRUCCIONES E INSPECCIONES VENEZUELA C.A.	COINVECA	J300709850	20000517000000	2009-01-01	2009-12-31	CALLE 75 ESQ.AV.3G EDIF.LUNA PLANTA BAJA SECTOR LA LAGO			\N		\N		\N		\N	\N	2000-05-17	SIEZ-2000-05-17-000000
1520	1	2	327	1	1	VISION PROFESIONAL DEL ZULIA, C.A.	VIPROZUCA	J303556434	20010515000001	2009-01-01	2009-12-31	CIRCUNVALACION 2 SECTOR SAN MIGUEL CALLE 96C N0.60B-06			\N		\N		\N		\N	\N	2001-05-15	SIEZ-2001-05-15-000001
1522	1	2	327	1	1	CONSTRUCCIONES,INVERSIONES Y SERVICIOS ORTIZ,C.A.	CINORCA	J302789800	20010503000000	2009-01-01	2009-12-31	URB.SAN MIGUEL CALLE 97B N0. 60A-54			\N		\N		\N		\N	\N	2001-05-03	SIEZ-2001-05-03-000000
1888	1	2	327	1	1	INVERSIONES MENDEZ,C.A.	INMENCA	J307287900	20050406000002	2009-01-01	2009-12-31	AV.LOS PROCERES SECTOR EL CAMPITO RESID. EL MILAGRO EDIF.1 APTO.6.B.2			\N		\N		\N		\N	\N	2005-04-06	SIEZ-2005-04-06-000002
1891	1	2	327	1	1	CONSULTORA REICHEL,C.A.	CONREICA	J311693378	20050412000001	2009-01-01	2009-12-31	EDIF.ALMADEN, PISO 01 APTO O1 CALLE 74 N0. 9-56			\N		\N		\N		\N	\N	2005-04-12	SIEZ-2005-04-12-000001
1892	1	2	327	1	1	GRUPO 2021,C.A.		J310477329	20050412000002	2009-01-01	2009-12-31	SECTOR 5 DE JULIO CALLE 72 ESQ.AV.5 DE JULIO EDIF MONTIELCO PISO 3 APTO 3-1			\N		\N		\N		\N	\N	2005-04-12	SIEZ-2005-04-12-000002
1893	1	2	327	1	1	COSTA CABIMAS INVERSIONES,C.A.		J307736399	20050421000001	2009-01-01	2009-12-31	AV.31 SECTOR CAMPO ALEGRE GALPON S/N			\N		\N		\N		\N	\N	2005-04-21	SIEZ-2005-04-21-000001
1904	1	2	327	1	1	INVERSORA CONSTRUCTORA BARRIENTOS,C.A.	INCOBACA	J308880876	20050524000001	2009-01-01	2009-12-31	CALLE 75B N0. 26-26 QTA. ELYUALI			\N		\N		\N		\N	\N	2005-05-24	SIEZ-2005-05-24-000001
1906	1	2	327	1	1	ASOCIACION COOPERATIVA VISTA AL SOL 32165,R.L.		J312670193	20050601000001	2009-01-01	2009-12-31	CALLE CAMPO ELIAS CON CALLE BERMUDEZ RED.AAA			\N		\N		\N		\N	\N	2005-06-01	SIEZ-2005-06-01-000001
2177	1	2	327	1	1	CONSTRUCCIONES Y SERVICIOS NACAR C.A.	CONANCAR	J070347201	20080520000001	2009-01-01	2009-12-31	SECTOR DELICIAS AV. 25 No. 64-30			\N		\N		\N		\N	\N	2008-05-20	SIEZ-2008-05-20-000001
944	1	2	327	1	1	CONSTRUCCIONES ARNEDO AGUIRRE, C.A.	CONAACA	J070385952	19990304000040	2009-01-01	2009-12-31	CARRETERA LA ENGRANZONADA SECTOR DELICIAS DIAG. SERV. CANAIMA			\N		\N		\N		\N	\N	1999-03-04	SIEZ-1999-03-04-000040
945	1	2	327	1	1	ETEIS COMPAÑIA ANONIMA	ETEIS COMPAÑIA ANONIMA	J305979103	19990621000000	2009-01-01	2009-12-31	LA CONCEPCION CAMPO GUAICAIPURO CASA #.5 LOCAL #.1			\N		\N		\N		\N	\N	1999-06-21	SIEZ-1999-06-21-000000
946	1	2	327	1	1	CACERES ROMERO C.A.	CACEROCA	J303744206	20010118000000	2009-01-01	2009-12-31	AV. SANTA TERESA ENTRE CALLES FLORIDA Y LA PAZ			\N		\N		\N		\N	\N	2001-01-18	SIEZ-2001-01-18-000000
952	1	2	327	1	1	CONSTRUCCIONES LAMARCA,C.A.		J308567108	20020521000000	2009-01-01	2009-12-31	URB.LA PAZ AV. 53A N0. 96H-81 A UNA CUADRA DEL TEATRO N.C.			\N		\N		\N		\N	\N	2002-05-21	SIEZ-2002-05-21-000000
955	1	2	327	1	1	INVERSIONES Y CONSTRUCCIONES CARONI, S.A.	INCOCASA	J301928547	19990421000054	2009-01-01	2009-12-31	CALLE 79H NO.74-81 URB.GILCON			\N		\N		\N		\N	\N	1999-04-21	SIEZ-1999-04-21-000054
1740	1	2	327	1	1	TUBOACERO,C.A.	TUBOACERO,C.A.	J085071172	20010306000002	2009-01-01	2009-12-31	PAL.LA ROSA VIEJA			\N		\N		\N		\N	\N	2001-03-06	SIEZ-2001-03-06-000002
462	1	2	327	1	1	MEGASERVICIOS,C.A.	MEGASERCA	J307164166	20001212000000	2009-01-01	2009-12-31	AV.58 CIRCV. 2 SECTOR AMPARO E/S BP LOCAL 2			\N		\N		\N		\N	\N	2000-12-12	SIEZ-2000-12-12-000000
463	1	2	327	1	1	CONSTRUCCIONES E INVERSIONES CARABALLO C.A.	COINCA	J306695168	20001128000000	2009-01-01	2009-12-31	AV.3E NO.80-70 C.C. KARELYS LOCAL P.B. (2)			\N		\N		\N		\N	\N	2000-11-28	SIEZ-2000-11-28-000000
464	1	2	327	1	1	CONSTRUCCIONES VAMCEL,C.A.		J306810200	20001206000000	2009-01-01	2009-12-31	CALLE 115  CASA NO.R58-43			\N		\N		\N		\N	\N	2000-12-06	SIEZ-2000-12-06-000000
467	1	2	327	1	1	SAN ANTONIO INGENIERIA, C.A.	SAIN, C.A.	J302619572	19990315000078	2009-01-01	2009-12-31	CALLE 73 CON AV.113A, NO.13A-08 SECTOR TIERRA NEGRA			\N		\N		\N		\N	\N	1999-03-15	SIEZ-1999-03-15-000078
468	1	2	327	1	1	IMPROZUL,C.A.		J307543345	20010208000002	2009-01-01	2009-12-31	PARQUE LAS COLINAS CALLE 96G EDIF.MIRANDA APTO.6A			\N		\N		\N		\N	\N	2001-02-08	SIEZ-2001-02-08-000002
474	1	2	327	1	1	SERVICIOS & VENTAS COMPAÑIA ANONIMA	SERVENCA	J307497130	20010215000000	2009-01-01	2009-12-31	CALLE 64 N0.4-134 C.C. VENVENSA PISO 1 LOCAL 13			\N		\N		\N		\N	\N	2001-02-15	SIEZ-2001-02-15-000000
481	1	2	327	1	1	GARCIA & GIL INVERSORA,C.A.	G & G INVERSORA,C.A.	J306762191	20010220000000	2009-01-01	2009-12-31	AV.POSTES NEGROS B.SAN JOSE CALLE 92F N0.27C-348			\N		\N		\N		\N	\N	2001-02-20	SIEZ-2001-02-20-000000
483	1	2	327	1	1	ARQUITECTURA CONSTRUCCION TECNICA,C.A.	ARQUITE,C.A.	J3011566544	20001227000001	2009-01-01	2009-12-31	URB.MARA NORTE,TRANVERSAL E C/CALLE 09 NO.09-21			\N		\N		\N		\N	\N	2000-12-27	SIEZ-2000-12-27-000001
484	1	2	327	1	1	ERIC ESIS CONSTRUCCIONES C.A.	E&E.C.A.	J301454332	20000328000000	2009-01-01	2009-12-31	AV.LA LIMPIA SECTOR AYACUCHO CALLE 79B N0.84-21			\N		\N		\N		\N	\N	2000-03-28	SIEZ-2000-03-28-000000
489	1	2	327	1	1	CONSTRUCTORES Y ASESORES AMBIENTALES,C.A.	CASAMCA	J306747192	20001226000001	2009-01-01	2009-12-31	BARRIO SAN JOSE CALLE 19D NO. 95B-160			\N		\N		\N		\N	\N	2000-12-26	SIEZ-2000-12-26-000001
490	1	2	327	1	1	CONSTRUCCIONES TROYK,C.A.	COTROYCA	J301692829	20010104000000	2009-01-01	2009-12-31	AV.17 NO.16-61 DR.PORTILLO EDIF.CONDOMINIO PISO 5 OFIC.52			\N		\N		\N		\N	\N	2001-01-04	SIEZ-2001-01-04-000000
491	1	2	327	1	1	INVERSIONES Y CONSTRUCCIONES PORLAMAR,C.A.		J307380136	20010223000000	2009-01-01	2009-12-31	CALLE 93 AVES.13 Y 14 RESD.EL SALADILLO TORRE PORLAMAR P.5			\N		\N		\N		\N	\N	2001-02-23	SIEZ-2001-02-23-000000
585	1	2	327	1	1	INVERSIONES MESI,C.A.	INMESICA	J307708794	20010321000000	2009-01-01	2009-12-31	CALLE 70 CON AV.12 TIERRA NEGRA NO.69A-75			\N		\N		\N		\N	\N	2001-03-21	SIEZ-2001-03-21-000000
587	1	2	327	1	1	CONSTRUCCIONES J.J.,C.A.	J.J.,C.A.	J307686731	20010404000002	2009-01-01	2009-12-31	B.SIMON BOLIVAR C.3 CASA S/N AL LADO DE ASERRADERO MAZZOCA			\N		\N		\N		\N	\N	2001-04-04	SIEZ-2001-04-04-000002
588	1	2	327	1	1	PRECISION EN EJECUTORIA DE INGENIERIA,C.A.	PRECINCA	J000716145	20010404000003	2009-01-01	2009-12-31	CARRETERA LARA ZULIA DISTRIBUIDOR PUNTA IGUANA			\N		\N		\N		\N	\N	2001-04-04	SIEZ-2001-04-04-000003
589	1	2	327	1	1	RIOS LATOZEFSKY,C.A.	RILACA	J307092548	20010406000001	2009-01-01	2009-12-31	LA MARINA SECTOR 8 CALLE 03 N0.58			\N		\N		\N		\N	\N	2001-04-06	SIEZ-2001-04-06-000001
964	1	2	327	1	1	INVERSIONES Y SERVICIOS, COMPAÑIA ANONIMA	INVESERCA	J301709900	19990727000001	2009-01-01	2009-12-31	AV.3F # 62A-73 LAS MERCEDES			\N		\N		\N		\N	\N	1999-07-27	SIEZ-1999-07-27-000001
965	1	2	327	1	1	CONSTRUCCIONES Y SERVICIOS  R.G.,C.A..		J307728264	20020401000000	2009-01-01	2009-12-31	AV.34 SECT. LOS LAURELES.C.NO.34.			\N		\N		\N		\N	\N	2002-04-01	SIEZ-2002-04-01-000000
966	1	2	327	1	1	CONST.Y MANT.DE OBRAS CIVILES Y ELECTRICAS,C.A.	CYMOCE,C.A.	J304570503	20010731000000	2009-01-01	2009-12-31	CALLE STA.MARTHA N0.15 ,CABIMAS			\N		\N		\N		\N	\N	2001-07-31	SIEZ-2001-07-31-000000
968	1	2	327	1	1	INVERSIONES LUIS GOMEZ CAMARGO, COMPAÑIA ANONIMA	LUGOCA	J306284222	19991214000002	2009-01-01	2009-12-31	AV.6 SECTOR PLAZA BARALT EDF. SAN FRANCISCO LOCAL 1			\N		\N		\N		\N	\N	1999-12-14	SIEZ-1999-12-14-000002
969	1	2	327	1	1	FLAN CARBE,C.A.		J308404080	20011106000000	2009-01-01	2009-12-31	AV.C CASA N0. T-41 BUENA VISTA			\N		\N		\N		\N	\N	2001-11-06	SIEZ-2001-11-06-000000
970	1	2	327	1	1	A.V.G. CONSTRUCCIONES, C.A.		J070423307	19990312000063	2009-01-01	2009-12-31	CALLE 77 NO.70 SECTOR PANAMERICANO			\N		\N		\N		\N	\N	1999-03-12	SIEZ-1999-03-12-000063
971	1	2	327	1	1	INDUSTRIAS,EDIFICACIONES Y PAVIMENTOS VENEZUELA,C.A.	INEPAVECA	J308272558	20020308000000	2009-01-01	2009-12-31	AV.9B ENTRE CALLE 66A Y 66 N0. 66-49			\N		\N		\N		\N	\N	2002-03-08	SIEZ-2002-03-08-000000
972	1	2	327	1	1	ANGEL PINEDA Y COMPAÑIA,C.A.	ANPCO,C.A.	J302638003	20020510000000	2009-01-01	2009-12-31	URB.EL ESTANQUE CALLE 61 N0.9-120 SAN FRANCISCO			\N		\N		\N		\N	\N	2002-05-10	SIEZ-2002-05-10-000000
976	1	2	327	1	1	CONSTRUCTORA GUTIERREZ RODRIGUEZ C.A.	CONSTRUCTORA GUR,C.A.	J307124040	20001218000000	2009-01-01	2009-12-31	CAMPO GUAICAIPURO CASA NO.7 LA CONCEPCION			\N		\N		\N		\N	\N	2000-12-18	SIEZ-2000-12-18-000000
977	1	2	327	1	1	CONSTRUCCIONES LA DOÑA,C.A.	CONSTRULADOCA	J308272655	20010907000001	2009-01-01	2009-12-31	CALLE R-1 S/N B. EL COMANDANTE,SEC. PUNTA GORDA			\N		\N		\N		\N	\N	2001-09-07	SIEZ-2001-09-07-000001
979	1	2	327	1	1	LEANDER CONSTRUCTIONS,C.A.	LEANDER,C.A.	J307318775	20001205000001	2009-01-01	2009-12-31	AV.16A CARRETERA VIA EL MOJAN AL LADO RES.EL CUJI LOCAL 2			\N		\N		\N		\N	\N	2000-12-05	SIEZ-2000-12-05-000001
980	1	2	327	1	1	MORRIS INGENIERIA,C.A.		J306738339	20011023000003	2009-01-01	2009-12-31	GALLO VERDE CALLE 100 N0. 48B-130			\N		\N		\N		\N	\N	2001-10-23	SIEZ-2001-10-23-000003
982	1	2	327	1	1	FICA S  WELDING CONSTRUCTIONS,C.A.		J070522216	20020819000002	2009-01-01	2009-12-31	CARRETERA MCBO,KM. 85, VILLA DEL ROSARIO.ESTADO ZULIA			\N		\N		\N		\N	\N	2002-08-19	SIEZ-2002-08-19-000002
983	1	2	327	1	1	PROYECTOS TECNICOS Y CONSTRUCCIONES  R  & E,C.A.	PROTECON,R & E,C.A.	J307667443	20010830000000	2009-01-01	2009-12-31	CARRETERA H,SECTOR CAMPO ALEGRE NO.356.			\N		\N		\N		\N	\N	2001-08-30	SIEZ-2001-08-30-000000
984	1	2	327	1	1	INVERSIONES UNICAP, C.A.		J305372195	19990623000040	2009-01-01	2009-12-31	AV.EL MILAGRO CON CALLE 78 DR.PORTILLO #.2A-79			\N		\N		\N		\N	\N	1999-06-23	SIEZ-1999-06-23-000040
986	1	2	327	1	1	H.P. INGENIERIA C.A.		J307511877	20001201000000	2009-01-01	2009-12-31	AV. 4 BELLA VISTA C.C. VILLA INES PISO 4 LOCAL 4			\N		\N		\N		\N	\N	2000-12-01	SIEZ-2000-12-01-000000
987	1	2	327	1	1	TRAZO, C.A.		J300943496	19990310000024	2009-01-01	2009-12-31	AV.81# 79E-89 LA LIMPIA SECTOR AYACUCHO			\N		\N		\N		\N	\N	1999-03-10	SIEZ-1999-03-10-000024
989	1	2	327	1	1	COMPANY SERVICE, C.A.	COSERCA	J070551593	19990426000003	2009-01-01	2009-12-31	SECTOR 1ERO DE MAYO CALLE LOS ANDES LOCAL #01			\N		\N		\N		\N	\N	1999-04-26	SIEZ-1999-04-26-000003
990	1	2	327	1	1	CONSTRUCCIONES MARDENY, C,A,		J070411228	20020905000003	2009-01-01	2009-12-31	CARRETERA K, AV.41,CALLE CUMARE, CABIMAS			\N		\N		\N		\N	\N	2002-09-05	SIEZ-2002-09-05-000003
991	1	2	327	1	1	INVERSIONES MIRALLES S.A.	INVERMISA	J003393525	20010116000001	2009-01-01	2009-12-31	AV. 43 ENTRE N Y O SAN BENITO CIUDAD OJEDA			\N		\N		\N		\N	\N	2001-01-16	SIEZ-2001-01-16-000001
992	1	2	327	1	1	LEM CONSTRUCCIONES, S.A.		J070514817	19990429000002	2009-01-01	2009-12-31	AV. 3E # 79-80 EDIF. SAN GEMIS LOCAL A			\N		\N		\N		\N	\N	1999-04-29	SIEZ-1999-04-29-000002
993	1	2	327	1	1	CONSTRUCCIONES URBA, C.A.	URBA, C.A.	J070348208	19991026000003	2009-01-01	2009-12-31	AV.12 ENTRE CALLES 78 Y 79 EDIF.TORRE 12,MEZANINE 77 2DO. PISO			\N		\N		\N		\N	\N	1999-10-26	SIEZ-1999-10-26-000003
996	1	2	327	1	1	RIEGO,ESTUDIOS Y PROYECTOS MARACAIBO,C.A.	RIESPROMARCA	J070350806	20001229000001	2009-01-01	2009-12-31	URB.SAN RAFAEL CALLE 98 NO. 61-120			\N		\N		\N		\N	\N	2000-12-29	SIEZ-2000-12-29-000001
997	1	2	327	1	1	INVERSIONES BOTELLO PARRA COMPAÑIA ANONIMA	INBOPACA	J308779270	20020912000001	2009-01-01	2009-12-31	CALLE 148 A, BA. SUR AMERICA			\N		\N		\N		\N	\N	2002-09-12	SIEZ-2002-09-12-000001
998	1	2	327	1	1	TOPOGRAFIA INGENIERIA, C.A.	TOPING, C.A.	J070459417	19990324000043	2009-01-01	2009-12-31	CALLE 65 ESQ.QV 92 NO.91-100 SECTOR PANAMERICANO			\N		\N		\N		\N	\N	1999-03-24	SIEZ-1999-03-24-000043
999	1	2	327	1	1	CPM CONSTRUCCIONES,C.A.		J304532652	20010409000000	2009-01-01	2009-12-31	AV.PRINCIPAL DEL BARRIO SAN JOSE CALLE 61 N0. 61-58			\N		\N		\N		\N	\N	2001-04-09	SIEZ-2001-04-09-000000
1000	1	2	327	1	1	INVERSORA CARAN, C.A.		J306617078	20020912000002	2009-01-01	2009-12-31	CALLE CARABOBO,SECTOR LOS ANDES,# 388			\N		\N		\N		\N	\N	2002-09-12	SIEZ-2002-09-12-000002
1001	1	2	327	1	1	URBANISMO, VIALIDAD Y CONSTRUCCIONES, C.A.	URVICA	J304212305	20010301000000	2009-01-01	2009-12-31	AV.4 N0. 67-46 SECTOR BELLA VISTA			\N		\N		\N		\N	\N	2001-03-01	SIEZ-2001-03-01-000000
1108	1	2	327	1	1	INGENIERIA Y CONSTRUCCION INTEGRAL, C.A.	INCICA	J302026733	19990310000022	2009-01-01	2009-12-31	CALLE 67B,ENTRE AV.13A Y 13B N.13-44			\N		\N		\N		\N	\N	1999-03-10	SIEZ-1999-03-10-000022
1546	1	2	327	1	1	CONSTRUCTORA LA VILLA C.A.	CONVICA	J070540923	20001020000000	2009-01-01	2009-12-31	AV. 10 C/C AV. 26 LA VILLA			\N		\N		\N		\N	\N	2000-10-20	SIEZ-2000-10-20-000000
1548	1	2	327	1	1	LE MIRAGE, C.A.		J300684830	19990317000087	2009-01-01	2009-12-31	CALL2 72,ENTRE AV. 13 Y 13A, C.C. LOS CORALES,LOCAL 07			\N		\N		\N		\N	\N	1999-03-17	SIEZ-1999-03-17-000087
1002	1	2	327	1	1	SUMINISTROS Y SERVICIOS  ALIRIAMS,C.A.	S.S.A.L.C.A.	J308781843	20020530000001	2009-01-01	2009-12-31	CALLE 79 N0.13A-131 SECTOR BELLOSO			\N		\N		\N		\N	\N	2002-05-30	SIEZ-2002-05-30-000001
1005	1	2	327	1	1	CENTRO DE INSPECCIONES Y ENSAYOS METALURGICOS C.A.	CINEMET, C.A.	J070509244	19991210000000	2009-01-01	2009-12-31	AV.PPAL SABANETA CALLE 100A,SECTOR ALTOS DE VANEGA #.56-75			\N		\N		\N		\N	\N	1999-12-10	SIEZ-1999-12-10-000000
1006	1	2	327	1	1	REPARACIONES,MANTENIMIENTO Y CONSTRUCCIONES C.A.	R & M CONSTRUCCIONES,C.A.	J304736916	20001020000003	2009-01-01	2009-12-31	AV.37B NO. 33B-38 BARRIO SAN JOSE			\N		\N		\N		\N	\N	2000-10-20	SIEZ-2000-10-20-000003
1008	1	2	327	1	1	CONSTRUCCION,SERVICIOS,MANTENIMIENTO Y ASESORAMIENTO,C.A.	CONSERMA,C.A.	J302366020	20010703000000	2009-01-01	2009-12-31	AV.PPAL.CARRETERA LA CONCEPCION SECTOR 1ERO.DE MAYO			\N		\N		\N		\N	\N	2001-07-03	SIEZ-2001-07-03-000000
1010	1	2	327	1	1	CONSTRUCTORES VENEZOLANOS, C.A.	CONVECA	J070069279	19990319000056	2009-01-01	2009-12-31	CALLE 144 NO.62-225 1ERA ETAPA,ZONA INDUSTRIAL			\N		\N		\N		\N	\N	1999-03-19	SIEZ-1999-03-19-000056
1011	1	2	327	1	1	INVERSIONES VELBRA,C.A.	INVELBRACA	J307759720	20010329000002	2009-01-01	2009-12-31	AV.LIBERTADOR SECTOR EL GUAYABO CASA S/N			\N		\N		\N		\N	\N	2001-03-29	SIEZ-2001-03-29-000002
1013	1	2	327	1	1	INVERSIONES SALAZAR MARTINEZ, S.A.	ISAMAR	J305899922	19990305000052	2009-01-01	2009-12-31	AV.78 NO.51-91 SECTOR URB.LAS AMALIAS			\N		\N		\N		\N	\N	1999-03-05	SIEZ-1999-03-05-000052
1014	1	2	327	1	1	B & D,CONSULTORES GERENCIALES,C.A.		J308856690	20020315000000	2009-01-01	2009-12-31	AV.20 C.C.LAS TEJAS LOCAL 1-20 PLANTA ALTA			\N		\N		\N		\N	\N	2002-03-15	SIEZ-2002-03-15-000000
1017	1	2	327	1	1	CONSTRUCCIONES RUMAR, C.A.	RUMAR, C.A.	J070555432	19990310000098	2009-01-01	2009-12-31	CALLE 175  NO. 43-24 URB. COROMOTO			\N		\N		\N		\N	\N	1999-03-10	SIEZ-1999-03-10-000098
384	1	2	327	1	1	CONSULTORA CHACIN MONRREAL, C.A.	CONSULTORA CH.M, C.A.	J303645658	19990315000077	2009-01-01	2009-12-31	SAN JOSE AVDA.EUDON PEREZ,CARRETERA J,CIUDAD OJEDA			\N		\N		\N		\N	\N	1999-03-15	SIEZ-1999-03-15-000077
1019	1	2	327	1	1	OCIVIELECTRI, C.A.		J305784620	19990526000003	2009-01-01	2009-12-31	SECTOR MILAGRO NORTE AV.2A #.19-54 PUNTICA DE PIEDRA			\N		\N		\N		\N	\N	1999-05-26	SIEZ-1999-05-26-000003
1030	1	2	327	1	1	ASOC.CIVIL PEQUEÑOS Y MEDIANOS PROD.DE ASENT.CAMP.CAÑO NEGRO	ASOPROCANE I Y II	J308465984	20030319000001	2009-01-01	2009-12-31	MACHIQUES COLON SECTOR CAÑO NEGRO			\N		\N		\N		\N	\N	2003-03-19	SIEZ-2003-03-19-000001
1032	1	2	327	1	1	SUPLIDORA DE MATERIALES BECERRA,C.A.	SUPLIBECA	J304179260	20030520000000	2009-01-01	2009-12-31	AV.16 CON ESQUINA CALLE 70 EDIF.LOS PINOS LOCAL 1			\N		\N		\N		\N	\N	2003-05-20	SIEZ-2003-05-20-000000
1033	1	2	327	1	1	CONSTRUCCIONES Y MANTENIMIENTO ZULIA,C.A.	COMAZUCA	J308433683	20030521000000	2009-01-01	2009-12-31	AV.9B ENTRE CALLE 66-66A # 66-49			\N		\N		\N		\N	\N	2003-05-21	SIEZ-2003-05-21-000000
1036	1	2	327	1	1	SERVICIOS,MANTENIMIENTOS ELECTRICOS,C.A.	SERMECA	J070526190	20030604000000	2009-01-01	2009-12-31	AV.INTERCOMUNAL,SECTOR LA TROPICANA CALLE 1 CASA 112 C.OJE.			\N		\N		\N		\N	\N	2003-06-04	SIEZ-2003-06-04-000000
1038	1	2	327	1	1	CONSTRUCCIONES E INVERSIONES PUNTA ARENA SOCIEDAD ANONIMA	COPUSA	J307388390	20001205000002	2009-01-01	2009-12-31	AV.BELLA VISTA TORRE SOCUY PISO 8 OFICINA 3			\N		\N		\N		\N	\N	2000-12-05	SIEZ-2000-12-05-000002
1039	1	2	327	1	1	ARQUITECTOS CONSULTORES PLANIFICADORES, COMPAÑIA ANONIMA	ARCOPLAN, C.A. CONSTRUCCIONES	J070441941	19990430000005	2009-01-01	2009-12-31	AV.10 #.83-49 SECTOR VERITAS.			\N		\N		\N		\N	\N	1999-04-30	SIEZ-1999-04-30-000005
1040	1	2	327	1	1	PROYECTOS INSPECCIONES Y CONSTRUCCIONES PIC.,C.A.	P.I.C.C.A.	J301879147	20030611000000	2009-01-01	2009-12-31	CALLE 75 C/AV.3G LA LAGO,EDIF.LUNA P.B.			\N		\N		\N		\N	\N	2003-06-11	SIEZ-2003-06-11-000000
1041	1	2	327	1	1	CONSTRUCCIONES Y VIALIDADES DE OCCIDENTE,C.A.	CONVIAL	J309978195	20030612000000	2009-01-01	2009-12-31	C/72 ENTRE AV.15A Y 16 N0.15A-33 P.B. L-2 DELICIAS			\N		\N		\N		\N	\N	2003-06-12	SIEZ-2003-06-12-000000
1042	1	2	327	1	1	PROYECTOS CONSTRUCCIONES E INSPECCION DE OBRAS DE INGENIERIA	OBRINCA	J070387831	20000831000000	2009-01-01	2009-12-31	URB. STA. MARIA AV. 25 NO. 65-10 DIAG. ESTADIO A. BORGES			\N		\N		\N		\N	\N	2000-08-31	SIEZ-2000-08-31-000000
1044	1	2	327	1	1	CEM INGENIERIA,C.A.	CACEM	J305906998	20030619000000	2009-01-01	2009-12-31	LOS ROBLES CALLE 115  GALPON 64-330 ZONA INDUSTRIAL			\N		\N		\N		\N	\N	2003-06-19	SIEZ-2003-06-19-000000
1045	1	2	327	1	1	PROYECTOS Y OBRAS DE INGENIERIA OSORIO GARCIA, C.A.	PROINOGCA	J300625893	19990429000000	2009-01-01	2009-12-31	AV 3Y ENTRE CALLE 74 Y75 CC SAN MARTI EDO ZULIA			\N		\N		\N		\N	\N	1999-04-29	SIEZ-1999-04-29-000000
1047	1	2	327	1	1	N.V. INGENIERIA Y SERVICIOS, S.A.		J305562458	19990310000099	2009-01-01	2009-12-31	SECTOR CASCO CENTRAL AV.4 LOCAL NO.1,CLINICA OBISPO LAZO			\N		\N		\N		\N	\N	1999-03-10	SIEZ-1999-03-10-000099
1048	1	2	327	1	1	R & J CONSTRUCCIONES, C.A.	R & J,C.A.	J070216379	19990319000028	2009-01-01	2009-12-31	CALLE A ESQ.AVE. 5 NO.5-05			\N		\N		\N		\N	\N	1999-03-19	SIEZ-1999-03-19-000028
1049	1	2	327	1	1	DIAZ CONSTRUCTORES C.A.	DIAZCO,C.A.	J306221441	20010223000001	2009-01-01	2009-12-31	URB.LA GUAIREÑA AV. 15J N0. 38A-91			\N		\N		\N		\N	\N	2001-02-23	SIEZ-2001-02-23-000001
1050	1	2	327	1	1	INGENIERIA,PROYECTOS Y VIALIDAD,C.A.	INPROVIAL,C.A.	J309307452	20030512000000	2009-01-01	2009-12-31	CIRCV.1 ENTRE C.108 Y 109 SECTOR ALTAMIRA SUR			\N		\N		\N		\N	\N	2003-05-12	SIEZ-2003-05-12-000000
1051	1	2	327	1	1	CONSTRUCCIONES Y MANTENIMIENTOS INDUSTRIALES,C.A.	CARPICA	J307653752	20010518000001	2009-01-01	2009-12-31	BARRIO PANAMERICANO AV.86 N0.67-47			\N		\N		\N		\N	\N	2001-05-18	SIEZ-2001-05-18-000001
1052	1	2	327	1	1	M & W CONSTRUCCIONES Y SERVICIOS,C.A.	M & W C.A.	J307849940	20030602000000	2009-01-01	2009-12-31	CALLE C SECTOR MONTE CLARO CASA NO. 2-71			\N		\N		\N		\N	\N	2003-06-02	SIEZ-2003-06-02-000000
1053	1	2	327	1	1	INGENIEROS CONSTRUCTORES DE OCCIDENTE COMPAÑIA ANONIMA	I.C.O., C.A.	J070092505	19990707000006	2009-01-01	2009-12-31	URB. C/77 5 DE JULIO #,3D-71 DIAG.A C.A. ELCA DE VZLA			\N		\N		\N		\N	\N	1999-07-07	SIEZ-1999-07-07-000006
1058	1	2	327	1	1	INVERSIONES,CONSTRUCCIONES Y VIALIDAD,C.A.	ICONVIALCA	J309804774	20030725000000	2009-01-01	2009-12-31	AV.6A ESQ.CALLE UNION N0.10-24 URB. LA ALHAMBRA			\N		\N		\N		\N	\N	2003-07-25	SIEZ-2003-07-25-000000
1064	1	2	327	1	1	C.A.VENEZOLANA DE MANTENIMIENTOS MAYORES	CAVEM	J308375616	20030828000000	2009-01-01	2009-12-31	AV.3C.C.C.67,UNICENT.VIRGINIA,PISO 1,LOCAL 1-11,LA LAGO			\N		\N		\N		\N	\N	2003-08-28	SIEZ-2003-08-28-000000
1069	1	2	327	1	1	CONSTRUCTORA ALATRACHE C.A.	CONSTRACHE C.A.	J307069910	20010117000002	2009-01-01	2009-12-31	URB. SAN FELIPE AV. 3 SECTOR 7 NO. 45-40			\N		\N		\N		\N	\N	2001-01-17	SIEZ-2001-01-17-000002
1070	1	2	327	1	1	CONSTRUCTORA DELIA,C.A.	CONDELCA	J070442379	20030804000000	2009-01-01	2009-12-31	CALLE 83 CON AV.63 PROLONGACION AMPARO C.C. DOÑA ANA LOC.09			\N		\N		\N		\N	\N	2003-08-04	SIEZ-2003-08-04-000000
1154	1	2	327	1	1	TECNICA RAME, C.A.		J070276703	19990324000063	2009-01-01	2009-12-31	URB.LA ROTARIA,AVENIDA 81G, NO.81-22			\N		\N		\N		\N	\N	1999-03-24	SIEZ-1999-03-24-000063
1642	1	2	327	1	1	CONSTRUCCIONES Y MANTENIMIENTO PERAZA,C.A.	CONSPER,C.A.	J070468823	20001227000003	2009-01-01	2009-12-31	CALLE 78 DR.PORTILLO CON AV.17 NO.16-61 PISO 5 OFIC.52			\N		\N		\N		\N	\N	2000-12-27	SIEZ-2000-12-27-000003
1071	1	2	327	1	1	INVERSIONES JAIGOM DE ENRRY GERALDO JAIMES GOMEZ		J090839272	20010405000001	2009-01-01	2009-12-31	EDIF.DON EPIFANIO APTO.A-1 CALLE BOLIVAR ESTADO MERIDA			\N		\N		\N		\N	\N	2001-04-05	SIEZ-2001-04-05-000001
1074	1	2	327	1	1	ADVAN TRADING EXPORT & IMPORT,C.A.	ADVANCA	J070428678	20020718000002	2009-01-01	2009-12-31	CALLE 91 AV.10 N0.11-10,SECTOR BELLOSO			\N		\N		\N		\N	\N	2002-07-18	SIEZ-2002-07-18-000002
1075	1	2	327	1	1	A & V, C.A.		J308633810	20020718000003	2009-01-01	2009-12-31	CALLE 71 ENTRE AV 14A Y 15 N0. 14A-102			\N		\N		\N		\N	\N	2002-07-18	SIEZ-2002-07-18-000003
1077	1	2	327	1	1	CONSTRUCCIONES POLQUI,C.A.		J308581976	20011115000001	2009-01-01	2009-12-31	AV.28 SECTOR LA LIMPIA LOCAL 2			\N		\N		\N		\N	\N	2001-11-15	SIEZ-2001-11-15-000001
1087	1	2	327	1	1	CONSTRUCCIONES Y SUMINISTRO CORREA RINCON & ASOCIADOS C.A.	CONSUCOR, C.A.	J305720002	19990426000004	2009-01-01	2009-12-31	URB.LOS SAUCES CALLE 78 #71A-34			\N		\N		\N		\N	\N	1999-04-26	SIEZ-1999-04-26-000004
1088	1	2	327	1	1	CONSTRUCTORA ZULIANA DE LA COSTA ORIENTAL DEL LAGO, C.A.	CONZUCOLCA	J070507233	19990318000094	2009-01-01	2009-12-31	DELICIA NUEVA C.ARGENTI M/C COLOMBIA # 29B			\N		\N		\N		\N	\N	1999-03-18	SIEZ-1999-03-18-000094
1089	1	2	327	1	1	VAYEW, C.A.		J301744756	20000927000000	2009-01-01	2009-12-31	CALLE 10 AV.6-6-60 LOS PUERTOS DE ALTAGRACIA			\N		\N		\N		\N	\N	2000-09-27	SIEZ-2000-09-27-000000
1090	1	2	327	1	1	TECNICOS ASOCIADOS EN MANT.Y SERVICIOS DE OCCIDENTE,C.A.	TAMASCA	J070521457	20020628000000	2009-01-01	2009-12-31	AV.5 Y 6 URB.IRAMA LOCAL 9 CASA 6-71			\N		\N		\N		\N	\N	2002-06-28	SIEZ-2002-06-28-000000
1092	1	2	327	1	1	CONSTRUCTORA TRES HERMANOS MORILLO, S.A.	G.H.H.,S.A.	J303573223	19990304000041	2009-01-01	2009-12-31	AV.3C NO.71 SECTOR LA LAGO			\N		\N		\N		\N	\N	1999-03-04	SIEZ-1999-03-04-000041
1102	1	2	327	1	1	CONSTRUCTORA JAIME,C.A.	CONSERJACA	J306362215	20030910000000	2009-01-01	2009-12-31	CALLE 92 LOS BARROSOS, QUINTA S.N.			\N		\N		\N		\N	\N	2003-09-10	SIEZ-2003-09-10-000000
1103	1	2	327	1	1	CONSTRUCCIONES Y MANTENIMIENTO MONRIELCA,C.A.		J307405929	20010410000002	2009-01-01	2009-12-31	CALLE 67 AV.27 EDIF.FINQUITA SEMI-SOTANO OFICINA N0.03			\N		\N		\N		\N	\N	2001-04-10	SIEZ-2001-04-10-000002
1104	1	2	327	1	1	SERVICIOS Y CONSTRUCCIONES R.S.M.,C.A.	R.S.M.,C.A.	J307685298	20010315000004	2009-01-01	2009-12-31	AV.EL MILAGRO N0.84-576 QUINTA SALAMANCA			\N		\N		\N		\N	\N	2001-03-15	SIEZ-2001-03-15-000004
1105	1	2	327	1	1	INGENIERIA DE PROYECTOS, CONSTRUCCIONES, Y MEDICIONES,C.A.	INPROCOME, C.A.	J070122749	19990621000001	2009-01-01	2009-12-31	C/67B #.11-91 ENTRE LAS AVS. 11 Y 12			\N		\N		\N		\N	\N	1999-06-21	SIEZ-1999-06-21-000001
1106	1	2	327	1	1	CONSTRUCCIONES Y ASFALTADOS DEL ZULIA,C.A.	COAZCA	J307119705	20001215000002	2009-01-01	2009-12-31	AC.3Y ENTRE CALLES 74 Y 75 C.C.SAN MARTIN PRIMER NIVEL L.12			\N		\N		\N		\N	\N	2000-12-15	SIEZ-2000-12-15-000002
1110	1	2	327	1	1	INVERSIONES V & G, COMPAÑIA ANONIMA	V & G	J310458987	20030915000000	2009-01-01	2009-12-31	CALLE 77 N. 70-11 SECTOR PANAMERICANO			\N		\N		\N		\N	\N	2003-09-15	SIEZ-2003-09-15-000000
1111	1	2	327	1	1	GOMEZ Y SANCHEZ INVERSIONES, C.A.	G & S INVERSIONES, C.A.	J304463752	19990318000005	2009-01-01	2009-12-31	AV.15 DELICIAS CON CALLE 89 EDIF.CENTRO EMPRESARIAL PISO.02			\N		\N		\N		\N	\N	1999-03-18	SIEZ-1999-03-18-000005
939	1	2	327	1	1	CONSTRUCTORA SUR DEL LAGO, C.A.		J304107986	19990412000018	2009-01-01	2009-12-31	CALLE 91 N0.13-43			\N		\N		\N		\N	\N	1999-04-12	SIEZ-1999-04-12-000018
940	1	2	327	1	1	HIDROSERVICIOS HB. C.A.		J070444223	20001030000002	2009-01-01	2009-12-31	AV. 82A SECTOR AYACUCHO EDIF. B LA RINCONADA			\N		\N		\N		\N	\N	2000-10-30	SIEZ-2000-10-30-000002
1149	1	2	327	1	1	CONSTRUCCIONES DALMONTE COMPANIA ANONIMA	CONDALCA	J070133724	20030909000000	2009-01-01	2009-12-31	CALLE 69A,NO. 14A-126 PLANTA ALTA			\N		\N		\N		\N	\N	2003-09-09	SIEZ-2003-09-09-000000
1187	1	2	327	1	1	PROYECTOS Y CONTRATOS, C.A.	PROCONCA	J301821882	19990325000010	2009-01-01	2009-12-31	CALLE 74 CON AV.13 NO.13-74			\N		\N		\N		\N	\N	1999-03-25	SIEZ-1999-03-25-000010
1055	1	2	327	1	1	CH-20 SISTEMAS, C.A.	CH20-SISCA	J304070055	19990322000098	2009-01-01	2009-12-31	AV.16 CON CALLE 29B C.C. DELICIAS 2 LOCAL 5			\N		\N		\N		\N	\N	1999-03-22	SIEZ-1999-03-22-000098
1114	1	2	327	1	1	CONSTRUCCIONES Y MANTENIMIENTO VILORIA, COMPAÑIA ANONIMA	COVICA	J303919243	19990505000009	2009-01-01	2009-12-31	AV. 62A # 113-49 LOS ROBLES A 1/2 CUADRA DEL DISPENSARIO			\N		\N		\N		\N	\N	1999-05-05	SIEZ-1999-05-05-000009
1117	1	2	327	1	1	TOTAL SERVICIOS,C.A.	TOSCA	J308310379	20020716000000	2009-01-01	2009-12-31	CALLE 81 CARRETERA N SECTOR EL DANTO			\N		\N		\N		\N	\N	2002-07-16	SIEZ-2002-07-16-000000
1118	1	2	327	1	1	G Y G INGENIERIA,C.A.		J310141673	20030925000000	2009-01-01	2009-12-31	CALLE 79 DR.PORTILLO N0. 12-63			\N		\N		\N		\N	\N	2003-09-25	SIEZ-2003-09-25-000000
1119	1	2	327	1	1	INSTALACIONES CONSTRUCCIONES Y MANTENIMIENTOS RODRIGUEZ,C.A.	INCOMAROCA	J309172344	20021031000000	2009-01-01	2009-12-31	AV.11B URB. LAS CAMELIAS ZONA NORTE CASA N0. K-51			\N		\N		\N		\N	\N	2002-10-31	SIEZ-2002-10-31-000000
1120	1	2	327	1	1	DISEÑO Y CONSTRUCCION DE INGENIERIA,C.A.	DICICA	J310403198	20030926000000	2009-01-01	2009-12-31	VEREDA 01 URB. SAN JACINTO SECTOR 10 CASA N0.38			\N		\N		\N		\N	\N	2003-09-26	SIEZ-2003-09-26-000000
1121	1	2	327	1	1	VENEZOLANA DE CONSTRUCCION,C.A.	VENCOCA	J306260269	20030925000001	2009-01-01	2009-12-31	AV.16 B.EL SALADILLO CASA N0.950-35			\N		\N		\N		\N	\N	2003-09-25	SIEZ-2003-09-25-000001
1122	1	2	327	1	1	CONCRETOS Y AGREGADOS AGROINDUSTRIALES,C.A.	CONAINCA,C.A.	J30172754	20000303000000	2009-01-01	2009-12-31	AV. 18A CON C/112 RES. ACROPOLIS APTO. S-1-1 TORRE SUR			\N		\N		\N		\N	\N	2000-03-03	SIEZ-2000-03-03-000000
1123	1	2	327	1	1	DISTRIBUCION TERMICA,C.A.	DISTERCA	J306580913	20030929000001	2009-01-01	2009-12-31	CARRETERA "O"AV. 52 ZONA INDUSTRIAL,CIUDAD OJEDA			\N		\N		\N		\N	\N	2003-09-29	SIEZ-2003-09-29-000001
1125	1	2	327	1	1	V & P INGENIERIA Y CONSTRUCCIONES, C.A.	V & P, C.A.	J305852324	19990325000003	2009-01-01	2009-12-31	SECTOR TIERRA NEGRA CALLE 68 NO.9B-71			\N		\N		\N		\N	\N	1999-03-25	SIEZ-1999-03-25-000003
1126	1	2	327	1	1	GRAPHOS DISEÑO Y CONSTRUCCIONES CIVILES,C.A.	GRAPHOS,C.A.	J070390352	20020809000001	2009-01-01	2009-12-31	EDIF.SIMON BOLIVAR LOCAL 04 SECTOR TAMARE			\N		\N		\N		\N	\N	2002-08-09	SIEZ-2002-08-09-000001
1127	1	2	327	1	1	CONSTRUCCIONES ARIZONA,C.A.	ARIZONA	J308990710	20020610000000	2009-01-01	2009-12-31	BARRIO LOS ROBLES,CALLE 113 N0.63-12			\N		\N		\N		\N	\N	2002-06-10	SIEZ-2002-06-10-000000
1128	1	2	327	1	1	ESTUDIO TECNICOS DE ARQUITECTURA, C.A.	E.T.A.C.A.	J300139417	19990322000008	2009-01-01	2009-12-31	C.C. PASEO MIRANDA LOCAL NO.7 AV.3 C/C 10			\N		\N		\N		\N	\N	1999-03-22	SIEZ-1999-03-22-000008
1129	1	2	327	1	1	INVERSIONES N & B 2000,C.A.		J307767243	20031002000000	2009-01-01	2009-12-31	C. F ENTRE AV.5 Y 6 N0.6-71 LOCAL 9 URB. IRAMA			\N		\N		\N		\N	\N	2003-10-02	SIEZ-2003-10-02-000000
1131	1	2	327	1	1	CONSTRUCONSULT,C.A.		J310297355	20030813000000	2009-01-01	2009-12-31	AV.3G C.C.70 SECT.BELLAS ARTES EDIF.APART.ALVAREZ B-02 P.B.			\N		\N		\N		\N	\N	2003-08-13	SIEZ-2003-08-13-000000
1898	1	2	327	1	1	CONSTRUCCIONES GANDO,C.A.		J304993463	20050504000001	2009-01-01	2009-12-31	CARRETERA MACHIQUE COLON			\N		\N		\N		\N	\N	2005-05-04	SIEZ-2005-05-04-000001
1139	1	2	327	1	1	DESARROLLOS URBANISMO E INGIENERIA,C.A.	DUINCA	J309662627	20030905000001	2009-01-01	2009-12-31	CALLE 15 C. AV. 15B,NO. 55-80, LA TRINIDAD,PROLG.DELICIAS			\N		\N		\N		\N	\N	2003-09-05	SIEZ-2003-09-05-000001
1140	1	2	327	1	1	LUNACA,C.A.		J310085358	20030923000000	2009-01-01	2009-12-31	CALLE CARABOBO SANTA RITA CASA N0.167			\N		\N		\N		\N	\N	2003-09-23	SIEZ-2003-09-23-000000
1141	1	2	327	1	1	OBRAS, PROYECTOS Y CALCULOS, COMPAÑIA ANONIMA	OPROCCA	J301080440	19990304000016	2009-01-01	2009-12-31	URB. EL PORTAL CALLE 50 CON AV. 14 # 50-64			\N		\N		\N		\N	\N	1999-03-04	SIEZ-1999-03-04-000016
1886	1	2	327	1	1	CONSTRUCTORA DRECOMA,C.A.		J090388001	20050404000001	2009-01-01	2009-12-31	FUNDACION INDOSA CALLE 9 BIS N0. 1-124			\N		\N		\N		\N	\N	2005-04-04	SIEZ-2005-04-04-000001
1142	1	2	327	1	1	VIDELCA CONSTRUCCIONES, C.A.		J310094721	20030929000000	2009-01-01	2009-12-31	AV. 5 DE JULIO CALLE 77 C.AV. 2B CASA N0.2C-01-21			\N		\N		\N		\N	\N	2003-09-29	SIEZ-2003-09-29-000000
1144	1	2	327	1	1	SUPLIDORA COMERCILIZADORA O.R., C.A.	SUROS, C.A.	J304941757	19990412000012	2009-01-01	2009-12-31	AV.57 C/C 146 NO.67-55 ZONA INDUSTRIAL 1ERA ETA			\N		\N		\N		\N	\N	1999-04-12	SIEZ-1999-04-12-000012
1146	1	2	327	1	1	BUILDINGS DEVELOPMENTS C.A.	BIDECA	J308739472	20030916000001	2009-01-01	2009-12-31	AV. SANTA RITA, ENTRE CALLE 67 Y 68 EDIF, MA.VICTORIA AP.13-			\N		\N		\N		\N	\N	2003-09-16	SIEZ-2003-09-16-000001
1147	1	2	327	1	1	CONSTRUCA, C.A.		J070242426	19990302000009	2009-01-01	2009-12-31	ZONA INSDUSTRIAL 2DA.ETAPA CALLE 148A ESQ.K.V.			\N		\N		\N		\N	\N	1999-03-02	SIEZ-1999-03-02-000009
1148	1	2	327	1	1	INGENIERIA,CONSTRUCCIONES ELECTRICAS Y REPRESENTACIONES, C.A	INCERCA	J07044132	19990602000012	2009-01-01	2009-12-31	CALLE 67 C/C AVDA 27 EDIF. FINQUITA SEMI-SOTANO SECT.STA M.			\N		\N		\N		\N	\N	1999-06-02	SIEZ-1999-06-02-000012
1152	1	2	327	1	1	INVERSIONES Y CONSTRUCCIONES BADELL,S.A.	INCOBASA	J070500824	20021016000000	2009-01-01	2009-12-31	AV.15 DELICIAS CON CALLE 74 N0. 74-50			\N		\N		\N		\N	\N	2002-10-16	SIEZ-2002-10-16-000000
1153	1	2	327	1	1	PROMOTORES DE INGENIERIA, PROYECTOS Y CONSTRUCCIONES, C.A.	P.A.P. CONSTRUCCIONES, C.A.	J300799450	19991122000002	2009-01-01	2009-12-31	CALLE 75 ESQ. AV. 3G. EDIF.LUNA PLANTA BAJA			\N		\N		\N		\N	\N	1999-11-22	SIEZ-1999-11-22-000002
1155	1	2	327	1	1	INVERSIONES RIO BRAVO,C.A.	RIO BRAVO,C.A.	J306184716	20020118000000	2009-01-01	2009-12-31	AV.BOLIVAR N0.3-30 SANTA BARBARA-ESTADO ZULIA			\N		\N		\N		\N	\N	2002-01-18	SIEZ-2002-01-18-000000
1156	1	2	327	1	1	INVERSIONES CONTRERAS & CONTRERAS,C.A.	I.C.C.,C.A.	J308791601	20020926000000	2009-01-01	2009-12-31	CALLE 65 CON AV. 3 EDIF. ZUPIRE PB SECTOR SAN BARTOLO			\N		\N		\N		\N	\N	2002-09-26	SIEZ-2002-09-26-000000
1157	1	2	327	1	1	L Y M REPRESENTACIONES,C.A.		J306516972	20001218000001	2009-01-01	2009-12-31	CALLE 14B# 84-145			\N		\N		\N		\N	\N	2000-12-18	SIEZ-2000-12-18-000001
1158	1	2	327	1	1	CONSULTORIAS Y ASESORIAS GEOTECNICAS, COMPAÑIA ANONIMA	GEOTECNIA, C.A.	J300504565	19990615000006	2009-01-01	2009-12-31	AV 9B CALLE 59 # 59A-12			\N		\N		\N		\N	\N	1999-06-15	SIEZ-1999-06-15-000006
1159	1	2	327	1	1	INSTALACIONES PETROLERAS, C.A.	INSTALPETROL	J300513467	19990310000002	2009-01-01	2009-12-31	CALLE 67 NO.66B-06 SECTOR LOS OLIVOS			\N		\N		\N		\N	\N	1999-03-10	SIEZ-1999-03-10-000002
1160	1	2	327	1	1	CONSTRUCCIONES Y MANTENIMIENTOS JOSMAX,C.A.	JOSMAXCA	J307822805	20010809000000	2009-01-01	2009-12-31	AV.MILAGRO NORTE SECTOR SANTA ROSA N0.6E-71			\N		\N		\N		\N	\N	2001-08-09	SIEZ-2001-08-09-000000
1161	1	2	327	1	1	CONSTRUCCIONES Y ESTRUCTURAS CATATUMBO,C.A.	CESCA	J308645788	20030610000001	2009-01-01	2009-12-31	AV.10 ENTRE CALLE 67 Y 68 EDIF.CONSULTORES CARI 1 PISO L-1			\N		\N		\N		\N	\N	2003-06-10	SIEZ-2003-06-10-000001
1163	1	2	327	1	1	CONSTRUCCIONES Y PROYECTOS COLON,S.A.	COPROCOL,S.A.	J309706454	20030922000000	2009-01-01	2009-12-31	AV. 15 LAS DELICIAS NO. 74-50			\N		\N		\N		\N	\N	2003-09-22	SIEZ-2003-09-22-000000
1164	1	2	327	1	1	INSTALACIONES ELECTRICAS Y CONSTRUCCIONES,C.A.	INSTELCO,C.A.	J309373960	20020930000000	2009-01-01	2009-12-31	AV.4 BELLA VISTA C.C. EL TRIANGULO LOCAL 24			\N		\N		\N		\N	\N	2002-09-30	SIEZ-2002-09-30-000000
1165	1	2	327	1	1	PROYECTOS Y CONSTRUCCIONES LOPEZ COMPAÑIA ANONIMA	PROCOLCA	J307932759	20020830000000	2009-01-01	2009-12-31	CALLE N, URB. MONTE BELLO N.   12-5O			\N		\N		\N		\N	\N	2002-08-30	SIEZ-2002-08-30-000000
1167	1	2	327	1	1	D.A. INVERSIONES, C.A.	DAICA	J302221986	19990308000066	2009-01-01	2009-12-31	LAS DELICIAS AV15 # 88A-44 EDIF. MONTIEL P.1			\N		\N		\N		\N	\N	1999-03-08	SIEZ-1999-03-08-000066
1168	1	2	327	1	1	PROYECTOS Y CONSTRUCCIONES DE INGENIERIA, C.A.	PROCOIN	J300010899	19991217000001	2009-01-01	2009-12-31	AV.11 C/CALLE 69-10 SECTOR TIERRA NEGRA.			\N		\N		\N		\N	\N	1999-12-17	SIEZ-1999-12-17-000001
1169	1	2	327	1	1	TELECOMUNICACIONES Y SERVICIOS INDUSTRIALES DEL ZULIA	TELSI-ZULIA	V055609680	20011026000000	2009-01-01	2009-12-31	CALLE  16 BARRIO SIERRA MAESTRA N0. 5-47			\N		\N		\N		\N	\N	2001-10-26	SIEZ-2001-10-26-000000
1170	1	2	327	1	1	CONSULTORIA,ASESORIA,SERVICIOS Y CONSTRUCCIONES,C.A.	CONSUSERCA	J305318271	20001214000005	2009-01-01	2009-12-31	CALLE 95 ENTRE AV.14 Y 14A C.C.PUENTE CRISTAL LOCAL 83			\N		\N		\N		\N	\N	2000-12-14	SIEZ-2000-12-14-000005
1171	1	2	327	1	1	CONSTRUCCIONES,REPARACIONES Y SERVICIOS CRESERCA,C.A.	CRESERCA,C.A.	J309307223	20020821000000	2009-01-01	2009-12-31	URB. MARACAIBO,AV.C/C NNO.65 LA CASITA.			\N		\N		\N		\N	\N	2002-08-21	SIEZ-2002-08-21-000000
1172	1	2	327	1	1	SERVICIOS Y MANTENIMIENTO INDUSTRIALES COL,C.A.	SERMICOLCA	J307804742	20010410000001	2009-01-01	2009-12-31	AV.PPAL.V.RODRIGUEZ C.C.ZULIANIKITA LOCAL 2 P.B.BACHAQUERO			\N		\N		\N		\N	\N	2001-04-10	SIEZ-2001-04-10-000001
1173	1	2	327	1	1	INVERSIONES GENERALES, S.A.	INVERGESA	J070551755	19990329000050	2009-01-01	2009-12-31	CENTRO EMP.DE OCCIDENTE CALLE 89B CON AV.15 3ER PISO OFIC.3			\N		\N		\N		\N	\N	1999-03-29	SIEZ-1999-03-29-000050
1174	1	2	327	1	1	CONSTRUCCIONES Y MANTENIMIENTO DE OBRAS J.Y.H.,C.A.	CONMAJYHCA	J307745282	20010329000005	2009-01-01	2009-12-31	URB.VALMORE RODRIGUEZ VEREDA 2 N0.26 CAJA SECA			\N		\N		\N		\N	\N	2001-03-29	SIEZ-2001-03-29-000005
1175	1	2	327	1	1	INVERSIONES Y PROYECTOS ATENCIO, C.A.	INPROACA	J304993218	19990304000045	2009-01-01	2009-12-31	SECTOR TIERRA NEGRA A.V. 13-A C.C. 66-A RES. MCBO. APTO. 8-C			\N		\N		\N		\N	\N	1999-03-04	SIEZ-1999-03-04-000045
1177	1	2	327	1	1	INGENIERIA Y CONSTRUCCIONES NAZARENO	INGCONA, C.A.	J305851743	19990324000057	2009-01-01	2009-12-31	CALLE 74 C/AV.13 NO.13-74			\N		\N		\N		\N	\N	1999-03-24	SIEZ-1999-03-24-000057
1178	1	2	327	1	1	DESARROLLO DE PROYECTOS Y MANTENIMIENTO,C.A.	DEPROMACA	J303457665	20010319000003	2009-01-01	2009-12-31	BLOQUE 30 I ETAPA PLANTA BAJA OFIC.00-07			\N		\N		\N		\N	\N	2001-03-19	SIEZ-2001-03-19-000003
1179	1	2	327	1	1	SERVICIOS TECNICOS DE INGENIERIA VENEZOLANA,C.A.	SERTIVENCA	J305378223	19990329000059	2009-01-01	2009-12-31	CALLE 57 NO.7-74 SECTOR ZAPARA II PLANTA ALTA			\N		\N		\N		\N	\N	1999-03-29	SIEZ-1999-03-29-000059
1180	1	2	327	1	1	DAMIANO INGENIERIA, C.A.	DAINCA	J070527382	19990329000049	2009-01-01	2009-12-31	URB. MONTE BELLO AV.8 CALLE K # 8-03.			\N		\N		\N		\N	\N	1999-03-29	SIEZ-1999-03-29-000049
1182	1	2	327	1	1	CONSTRUCTORA CASTELLANO,C.A.	CONCASCA	J308313190	20010814000000	2009-01-01	2009-12-31	CALLE DELICIAS SECTOR SANTA CLARA CASA N0.54 CABIMAS			\N		\N		\N		\N	\N	2001-08-14	SIEZ-2001-08-14-000000
1183	1	2	327	1	1	GRUPO LABRADOR C.A.	GRULACA	J305819874	19990428000003	2009-01-01	2009-12-31	AV.28 LA LIMPIA INTERSC. CON CALLE 78 B N0.44-238.			\N		\N		\N		\N	\N	1999-04-28	SIEZ-1999-04-28-000003
1184	1	2	327	1	1	CONSTRUCCIONES MIZPHA COMPAÑIA ANONIMA	MIZPHACA	J305250758	19990318000006	2009-01-01	2009-12-31	CLLE 72 AV. 20 EDIF. NOEL TORRE A.			\N		\N		\N		\N	\N	1999-03-18	SIEZ-1999-03-18-000006
1186	1	2	327	1	1	CONSTRUCTORA GENESIS 2000,C.A.	GENESIS 2000,C.A.	J302858470	20020718000000	2009-01-01	2009-12-31	AV.3 SECTOR SANTA LUCIA CASA N0. 88-15			\N		\N		\N		\N	\N	2002-07-18	SIEZ-2002-07-18-000000
1188	1	2	327	1	1	INGENIERO ORLANDO PARRA COMPAÑIA ANONIMA	INORPACA	J307667516	20010219000000	2009-01-01	2009-12-31	CARRETERA H SECTOR CAMPO ALEGRE CASA N0. 356			\N		\N		\N		\N	\N	2001-02-19	SIEZ-2001-02-19-000000
1189	1	2	327	1	1	CONSTRUCCIONES DEL ROSARIO,C.A.		J309856634	20030415000000	2009-01-01	2009-12-31	CALLE 79 DR. QUINTERO # 12-63			\N		\N		\N		\N	\N	2003-04-15	SIEZ-2003-04-15-000000
1190	1	2	327	1	1	S.T.B.PROYECTOS Y CONSTRUCCIONES,C.A.	S.T.B.P.C.,C.A.	J308768510	20020508000000	2009-01-01	2009-12-31	SECTOR PARAISO,CALLE 72 CENTRO C. MONTIELCO,APT.04			\N		\N		\N		\N	\N	2002-05-08	SIEZ-2002-05-08-000000
1480	1	2	327	1	1	INGENIERIA G.B.R.,C.A.		J075385063	20010725000001	2009-01-01	2009-12-31	C.2 AL LADO DE HIPERMERCADO META.			\N		\N		\N		\N	\N	2001-07-25	SIEZ-2001-07-25-000001
1715	1	2	327	1	1	INVERSORA JARAMILLO,C.A.	INJACA	J306311840	20011023000002	2009-01-01	2009-12-31	URB.MONTE BELLO CALLE J N0.9-32			\N		\N		\N		\N	\N	2001-10-23	SIEZ-2001-10-23-000002
1191	1	2	327	1	1	INGENIERIA REN COMPAÑIA ANONIMA	INGRENCA	J070382597	20000411000000	2009-01-01	2009-12-31	CALLE 78 # 61-227			\N		\N		\N		\N	\N	2000-04-11	SIEZ-2000-04-11-000000
1192	1	2	327	1	1	SERVICIOS DE INGENIERIA PARA PROYECTOS Y CONSTRUCCIONES S.A.	SIPPCO,S.A.	J070429801	20010306000001	2009-01-01	2009-12-31	URB.LA TRINIDAD AV.15C N0.55A-114 EDIF.DOÑA DALIA OF.1-2			\N		\N		\N		\N	\N	2001-03-06	SIEZ-2001-03-06-000001
1195	1	2	327	1	1	INVERSIONES SANTARO,C.A.	SANTARO,C.A.	J307332930	20010704000000	2009-01-01	2009-12-31	CALLE 68 ENTRE AVS.21 Y 22 C.C.URACOA LOCAL 7			\N		\N		\N		\N	\N	2001-07-04	SIEZ-2001-07-04-000000
1196	1	2	327	1	1	EMAGOM,C.A.		J300710033	20020902000001	2009-01-01	2009-12-31	AV. 2C N. 77A-80 ANTES DR. PORTILLO.			\N		\N		\N		\N	\N	2002-09-02	SIEZ-2002-09-02-000001
1197	1	2	327	1	1	SUMINISTROS SERMA C.A.	SUSERMA C.A.	J307339160	20001207000000	2009-01-01	2009-12-31	C.C. PALAIMA PISO 1 OFIC. 1-17			\N		\N		\N		\N	\N	2000-12-07	SIEZ-2000-12-07-000000
1198	1	2	327	1	1	SERVICIOS Y CONSTRUCCIONES DEL SUR,C.A.	SERCONSURCA	J304050879	20010209000000	2009-01-01	2009-12-31	CALLE 69 AV.12 EDIF. RAFAEL OFIC.2B			\N		\N		\N		\N	\N	2001-02-09	SIEZ-2001-02-09-000000
1199	1	2	327	1	1	BALZA CONSTRUCCIONES S.A.	BALCOSA	J302824729	20001221000001	2009-01-01	2009-12-31	AV.100 SABANETA NO. 228-53			\N		\N		\N		\N	\N	2000-12-21	SIEZ-2000-12-21-000001
1200	1	2	327	1	1	VENEZOLANA DE CONSTRUCCION M & P C.A.	VENCO M & P C.A.	J304332700	19990412000024	2009-01-01	2009-12-31	AV.12 NO.45-72 ROSAL SUR			\N		\N		\N		\N	\N	1999-04-12	SIEZ-1999-04-12-000024
1201	1	2	327	1	1	FUND.DE PROD.DE EL PARAISO Y DE LA PARROQ.U.DEL MCPIO COLON.	FUNDAPPUR	J306536604	19991220000000	2009-01-01	2009-12-31	CALLE 80A URB.LAS LOMAS #.71A-95			\N		\N		\N		\N	\N	1999-12-20	SIEZ-1999-12-20-000000
1270	1	2	327	1	1	ALUMAS,C.A.		J305824584	20011022000001	2009-01-01	2009-12-31	BARRIO MODELO CALLE 72B N0. 08A-140 SECTOR EL MARITE			\N		\N		\N		\N	\N	2001-10-22	SIEZ-2001-10-22-000001
1271	1	2	327	1	1	RIEGO Y ACUEDUCTOS,C.A.	RIADUCA	J309630318	20030609000000	2009-01-01	2009-12-31	AV.22 CALLE 29  CASA N0.57N			\N		\N		\N		\N	\N	2003-06-09	SIEZ-2003-06-09-000000
1301	1	2	327	1	1	STEWART & STEVENSON DE VENEZUELA,S.A.		J070105550	20010228000000	2009-01-01	2009-12-31	KM.4 1/2 CARRETERA VIA LA CAÑADA			\N		\N		\N		\N	\N	2001-02-28	SIEZ-2001-02-28-000000
1303	1	2	327	1	1	CONSTRUCCIONES METELIA C.A.	CONMACA	J305131350	20030828000001	2009-01-01	2009-12-31	SECTOR LA LAGO,AV.3C,C.PROF.COROMOTO OFIC.6			\N		\N		\N		\N	\N	2003-08-28	SIEZ-2003-08-28-000001
1398	1	2	327	1	1	TRANSPORTE VIER COMPANIA ANONIMA	TRAVIERCA	J070341580	20030828000003	2009-01-01	2009-12-31	CALLE 73 ENTRE A.V. 3C Y 3D EDIF.HALEAKALA OFI.#1			\N		\N		\N		\N	\N	2003-08-28	SIEZ-2003-08-28-000003
1400	1	2	327	1	1	LUBVENCA DE OCCIDENTE,COMPAÑIA ANONIMA	LUBVENCA	J304399600	20030828000002	2009-01-01	2009-12-31	CALLE 82 ENTRE AV 9 Y 9B EDIF GUASARE			\N		\N		\N		\N	\N	2003-08-28	SIEZ-2003-08-28-000002
1413	1	2	327	1	1	SUMINISTRO E INSTALACIONES TECNICAS C.A.	SUMITEC	J308661104	20020829000000	2009-01-01	2009-12-31	CALLE 76 C/AV.4 BELLA VISTA,EDIF. DON MATIAS,PB-LOCAL 05			\N		\N		\N		\N	\N	2002-08-29	SIEZ-2002-08-29-000000
1423	1	2	327	1	1	MCS, MANTENIMIENTO, CONSTRUCCIONES Y SERVICIOS, S.A.	MCS,S.A.	J305958700	20000926000003	2009-01-01	2009-12-31	CALLE 72 AV. 3Y BELLA VISTA			\N		\N		\N		\N	\N	2000-09-26	SIEZ-2000-09-26-000003
1428	1	2	327	1	1	ZULIA INDUSTRIAS VENEZUELA, C.A.	ZULIVEN,C.A.	J070127708	20001129000000	2009-01-01	2009-12-31	SAN FRANCISCO CALLE 16 EL ESTUDIANTE NO. 6-37			\N		\N		\N		\N	\N	2000-11-29	SIEZ-2000-11-29-000000
1429	1	2	327	1	1	GONZALEZ STEFANELLI SERVICIOS INDUSTRIALES,C.A.	GOSTECA,C.A.	J302995728	20001011000000	2009-01-01	2009-12-31	CALLE72CON AV.BELLA VISTA C.C.EMPRESARIAL CLODOMIRA OF.01			\N		\N		\N		\N	\N	2000-10-11	SIEZ-2000-10-11-000000
1434	1	2	327	1	1	CONSTRUCCIONES VENEZOLANAS,C.A.	COVECA	J307453702	20001226000002	2009-01-01	2009-12-31	SECTOR R-10 CALLE PARAGUANA NO.2			\N		\N		\N		\N	\N	2000-12-26	SIEZ-2000-12-26-000002
1436	1	2	327	1	1	PROYECTOS N.M.,C.A.		J302810868	20010206000001	2009-01-01	2009-12-31	CALLE 85 CON AV.8 STA.RITA EDIF.FERRECLOSET LOCAL 1-2			\N		\N		\N		\N	\N	2001-02-06	SIEZ-2001-02-06-000001
1437	1	2	327	1	1	GRUPO EMPRESARIAL SABATINI,C.A.	GRUPENSA,C.A.	J302707382	20010214000000	2009-01-01	2009-12-31	URB.CANTA CLARO AV.12 N0.55-105			\N		\N		\N		\N	\N	2001-02-14	SIEZ-2001-02-14-000000
1523	1	2	327	1	1	MARCANO ROJAS,C.A.	MAROCA	J302053943	20001214000002	2009-01-01	2009-12-31	KM.5 CARRETERA VIA PERIJA AV.50 NO.150-74			\N		\N		\N		\N	\N	2000-12-14	SIEZ-2000-12-14-000002
1526	1	2	327	1	1	SERTYAGRO,C.A.		J070402750	20010719000000	2009-01-01	2009-12-31	SECTOR EL PARAISO CALLE 65 AV.77D N0.35C-32			\N		\N		\N		\N	\N	2001-07-19	SIEZ-2001-07-19-000000
1567	1	2	327	1	1	EQUIPOS R.Y.Z., C.A.		J302270707	19990319000088	2009-01-01	2009-12-31	C.77 AV.5 DE JULIO CON AV.9B EDIF.TORRE BUENOS AIRES P.3			\N		\N		\N		\N	\N	1999-03-19	SIEZ-1999-03-19-000088
1570	1	2	327	1	1	CONSTRUCTORA MADRIZ MEDINA,C.A.	(M & M),C.A.	J305004161	20020819000000	2009-01-01	2009-12-31	CALLE ECUADOR ENTRE 23 DE ENERO Y GUAICAIPURO,PTO FIJO			\N		\N		\N		\N	\N	2002-08-19	SIEZ-2002-08-19-000000
1572	1	2	327	1	1	C.A.LISU	CALISU	J302484367	20000331000000	2009-01-01	2009-12-31	AV.2 #87-97 EDIF. 2001 PISO1 LOCAL1			\N		\N		\N		\N	\N	2000-03-31	SIEZ-2000-03-31-000000
1574	1	2	327	1	1	OBIMACA,C.A.		J306849939	20020822000001	2009-01-01	2009-12-31	C.C.BIG LOW CENTER NAVE K,PLANTA ALTA LOCAL 16,CARABOBO			\N		\N		\N		\N	\N	2002-08-22	SIEZ-2002-08-22-000001
1709	1	2	327	1	1	CORPORACION G & D, C.A.		J301814533	19990305000053	2009-01-01	2009-12-31	CALLE 69 CON AV. 10A #.10A-48 SECTOR TIERRA NEGRA			\N		\N		\N		\N	\N	2002-04-30	SIEZ-2002-04-30-000000
1575	1	2	327	1	1	CONSORCIO VENEZUELA 2001		J301814533	20020430000000	2009-01-01	2009-12-31	CALLE 69 AV.10A N0.10A-48 SECT.TIERRA NEGRA			\N		\N		\N		\N	\N	2002-04-30	SIEZ-2002-04-30-000000
1576	1	2	327	1	1	SERVICIOS DE INGENIERIA PRISMA,C.A.		J303201636	20020924000000	2009-01-01	2009-12-31	URB. LA POMONA CALLE B VEREDA 13 CASA G-7			\N		\N		\N		\N	\N	2002-09-24	SIEZ-2002-09-24-000000
1577	1	2	327	1	1	CORPORACION PROYSER,S.A.	PROYSER,S.A.	J307585781	20021128000000	2009-01-01	2009-12-31	CALLE 75 N0. 9-53 EX COLONIA SHELL-SECTOR SANTA RITA			\N		\N		\N		\N	\N	2002-11-28	SIEZ-2002-11-28-000000
1579	1	2	327	1	1	CORPORACION 1ANS DE VENEZUELA,C.A.		J304625634	20020930000001	2009-01-01	2009-12-31	CALLE SUAPURE RAMAL 2 EDIF.SAN BERNARDO OFI.82 BELLO MONTE			\N		\N		\N		\N	\N	2002-09-30	SIEZ-2002-09-30-000001
1580	1	2	327	1	1	INVERLAGO,C.A.		J304176058	20020924000001	2009-01-01	2009-12-31	AV.VLZA.ENTRE C.5 Y 6 N0.5-11 BARQUISIMETO EDO.LARA			\N		\N		\N		\N	\N	2002-09-24	SIEZ-2002-09-24-000001
1582	1	2	327	1	1	CONSTRUCTORA MARCUZZI,C.A.	COMARCA	J090095209	20011102000002	2009-01-01	2009-12-31	AV.24 CON CALLE 68 N0. 68-06			\N		\N		\N		\N	\N	2001-11-02	SIEZ-2001-11-02-000002
1583	1	2	327	1	1	CASUCCI CONSTRUTION COMPANY,C.A.	C.C.C.C.A.	J070476559	20021112000000	2009-01-01	2009-12-31	AV.INTERCOMUNAL SECTOR LA VACA ESQ. CON ENTRADA A LA GLP			\N		\N		\N		\N	\N	2002-11-12	SIEZ-2002-11-12-000000
1584	1	2	327	1	1	CONSTRUCTORA MENDEZ RINCON,C.A.	MENRICA	J070450487	20021127000000	2009-01-01	2009-12-31	AV.68 CON CALLE 153 ZONA INDUSTRIAL II ETAPA.			\N		\N		\N		\N	\N	2002-11-27	SIEZ-2002-11-27-000000
1585	1	2	327	1	1	DISTRIBUIDORA ZUMAQUE,C.A.	DIZUCA	J301740068	20021125000002	2009-01-01	2009-12-31	AV.INTERCOMUNAL COLINA DE BELLO MONTE-CABIMAS			\N		\N		\N		\N	\N	2002-11-25	SIEZ-2002-11-25-000002
1586	1	2	327	1	1	CONSTRUCTORA 70-67, COMPAÑIA ANONIMA		J307278781	20001020000001	2009-01-01	2009-12-31	AV.3Y Y 3H CALLE 71 Y 69 SECTOR SAN MARTIN EDIF.ANDREINA P.B.			\N		\N		\N		\N	\N	2000-10-20	SIEZ-2000-10-20-000001
1973	1	2	327	1	1	L.M.G. SERVICIOS, C.A.		J313413755	20060126000001	2009-01-01	2009-12-31	CALLE 74 ENTRE AV. 11 Y 12 Nº 11-37			\N		\N		\N		\N	\N	2006-01-26	SIEZ-2006-01-26-000001
1512	1	2	327	1	1	ESTRUCTURAS CENO DE OCCIDENTE,C.A.		J070007087	20010321000003	2009-01-01	2009-12-31	CALLE 140 CON AV. 62 ZONA INDUSTRIAL			\N		\N		\N		\N	\N	2001-03-21	SIEZ-2001-03-21-000003
1072	1	2	327	1	1	CONSTRUCCIONES TIERRAS DEL SOL, C.A.	CONTISOLCA	J308398381	20030811000000	2009-01-01	2009-12-31	CALLE 68 SECTOR TIERRA NEGRA NO.9B-71			\N		\N		\N		\N	\N	2003-08-11	SIEZ-2003-08-11-000000
1761	1	2	327	1	1	INGENIERIA, PRODUCTOS Y SERVICIOS,C.A.	I.P.S.	J309999753	20031029000001	2009-01-01	2009-12-31	CALLE 100 CONJ. RESD. EL VARILLAL			\N		\N		\N		\N	\N	2003-10-29	SIEZ-2003-10-29-000001
1762	1	2	327	1	1	CONSTRUCCIONES CIVILES Y PROYECTOS AMBIENTALES	CONCIPA	J308108545	20031029000002	2009-01-01	2009-12-31	HDA. LOS NARANJOS KM. 16			\N		\N		\N		\N	\N	2003-10-29	SIEZ-2003-10-29-000002
1763	1	2	327	1	1	MANTENIMIENTO Y SERVICIOS EN GENERAL MAGMARI,C.A.	MAGMARI,C.A.	J309931512	20031030000001	2009-01-01	2009-12-31	CALLE 63B C. AV. 95C			\N		\N		\N		\N	\N	2003-10-30	SIEZ-2003-10-30-000001
1764	1	2	327	1	1	CONSTRUCTORA BRACHO,C.A.	CONSBRACA	J070197889	20031030000002	2009-01-01	2009-12-31	CALLE3ª, #10-72,BARRIO SAN RAFAEL			\N		\N		\N		\N	\N	2003-10-30	SIEZ-2003-10-30-000002
1765	1	2	327	1	1	BERAGUI VILLAN. INGENIERIA Y CONSTRUCCION,C.A.	BERVICCA	J305633509	20031030000003	2009-01-01	2009-12-31	CALLE 7 I. #2D-126			\N		\N		\N		\N	\N	2003-10-30	SIEZ-2003-10-30-000003
1769	1	2	327	1	1	SOLDADURA MIGUEL CORDERO,C.A.	SOLMICO	J070286881	19990312000054	2009-01-01	2009-12-31	A.V 72 ESQUINA  CALLE PP			\N		\N		\N		\N	\N	1999-03-12	SIEZ-1999-03-12-000054
1691	1	2	327	1	1	SIEMENS,S.A.		J000343543	20010427000001	2009-01-01	2009-12-31	AV.17 N0.112-224 LOS HATICOS			\N		\N		\N		\N	\N	2001-04-27	SIEZ-2001-04-27-000001
1770	1	2	327	1	1	INSPECCIONES Y CONSTRUCCIONES ZULIANAS,C.A.	INCOZUCA	J308279609	20011023000000	2009-01-01	2009-12-31	AV.72 RES. VILLA OLIVAR EDIF. 4 APT.1A			\N		\N		\N		\N	\N	2001-10-23	SIEZ-2001-10-23-000000
1986	1	2	327	1	1	DOTACION Y SERVICIOS, C.A.		J313907871	20060324000001	2009-01-01	2009-12-31	AV 15 DELICIAS CENTRO COMERCIAL LUZ LOCAL 8			\N		\N		\N		\N	\N	2006-03-24	SIEZ-2006-03-24-000001
1587	1	2	327	1	1	H.F. INGENIERIA,C.A.		J302752787	20001114000001	2009-01-01	2009-12-31	AV.GUAJIRA EDIF.FRIUL P.A.LOCAL 04			\N		\N		\N		\N	\N	2000-11-14	SIEZ-2000-11-14-000001
1588	1	2	327	1	1	AMERICAN TECNOLOGIA INVERSIONES,C.A.	ATEINCA	J305948542	20020429000001	2009-01-01	2009-12-31	AV.BELLA VISTA C.83 EDIF.ALFA			\N		\N		\N		\N	\N	2002-04-29	SIEZ-2002-04-29-000001
1589	1	2	327	1	1	CONSTRUCTORA HEYRO,C.A.	COHEYROCA	J305750840	20020429000000	2009-01-01	2009-12-31	AV.GUAYANA,SECT. LOS KIOSKOS PARTE BAJA,QTA.NINEMAR,V.51.			\N		\N		\N		\N	\N	2002-04-29	SIEZ-2002-04-29-000000
1592	1	2	327	1	1	GENERAL TURBINE SYSTEMS DE VENEZUELA,S.A.	GTS,S.A.	J070282916	20020725000000	2009-01-01	2009-12-31	AV.70 C.CALLE 153 EDIF.CORPORACION LINK Z.INDUST.II ETAPA			\N		\N		\N		\N	\N	2002-07-25	SIEZ-2002-07-25-000000
793	1	2	327	1	1	MEICA COMPAÑIA ANONIMA	MEICA, C.A.	J085189246	20000925000000	2009-01-01	2009-12-31	CALLE 19 DE CALLE NÑ N0. 11 -70			\N		\N		\N		\N	\N	2000-09-25	SIEZ-2000-09-25-000000
795	1	2	327	1	1	BERUR, C.A.	BERURCA	J070492546	19990304000029	2009-01-01	2009-12-31	C.65 C. AV.22A LOCAL NO.2 ALMACENES MILITARES			\N		\N		\N		\N	\N	1999-03-04	SIEZ-1999-03-04-000029
796	1	2	327	1	1	SERVICIO DE ASISTENCIA TECNICA AGROPECUARIA	SATAGRO,C.A.	J305881987	20010816000001	2009-01-01	2009-12-31	URB.PROLONG.LA CONQUISTA N0.196,SECTOR.3			\N		\N		\N		\N	\N	2001-08-16	SIEZ-2001-08-16-000001
797	1	2	327	1	1	INVERSIONES CUBILLAN MARTINEZ,C.A.	INCUMACA	J304645996	20011107000000	2009-01-01	2009-12-31	CALLE 93 CON AV.61 Y 62C.C.C.CUMBRES DE MARACAIBO LOCAL 05			\N		\N		\N		\N	\N	2001-11-07	SIEZ-2001-11-07-000000
799	1	2	327	1	1	CORPORACION W & A,C.A.		J307885246	20011115000000	2009-01-01	2009-12-31	URB.EL NARANJAL CALLE 51A N0. 15L-22 QTA.KASHY			\N		\N		\N		\N	\N	2001-11-15	SIEZ-2001-11-15-000000
800	1	2	327	1	1	CODIESCA 2020,C.A.		J307388226	20010209000001	2009-01-01	2009-12-31	AV.3F ENTRE CALLE 57 Y 58 DETRAS DEL HOSP.PSIQUIATRICO			\N		\N		\N		\N	\N	2001-02-09	SIEZ-2001-02-09-000001
801	1	2	327	1	1	SERVICIOS DE INGENIERIA Y MANTENIMIENTO INDUSTRIAL,C.A.	S.I.M.I.,C.A.	J070351594	20011122000000	2009-01-01	2009-12-31	CALLE 70 N0. 12-40			\N		\N		\N		\N	\N	2001-11-22	SIEZ-2001-11-22-000000
804	1	2	327	1	1	B.H.M. & ASOCIADOS, C.A.		J070246391	19990716000001	2009-01-01	2009-12-31	AV. 17C ENTRE CALLES 95 Y 96 #. 95C-100 SECTOR EL TRANSITO			\N		\N		\N		\N	\N	1999-07-16	SIEZ-1999-07-16-000001
805	1	2	327	1	1	CONSTRUCCIONES Y SERVICIOS EL CUBO,C.A.	C.S. EL CUBO.C.A.	J304626118	20011009000000	2009-01-01	2009-12-31	CALLE 77 SECTOR PANAMERICANO C.C. DOÑA IRENE LOCAL 2			\N		\N		\N		\N	\N	2001-10-09	SIEZ-2001-10-09-000000
806	1	2	327	1	1	SERVICIOS TECNICOS INTEGRALES Y MANTENIMIENTO,C.A.	STIM,C.A.	J307102233	20011129000000	2009-01-01	2009-12-31	SECTOR LOS OLIVOS CALLE 67 N0.65-25			\N		\N		\N		\N	\N	2001-11-29	SIEZ-2001-11-29-000000
807	1	2	327	1	1	MALFA,C.A.	MALFA,C.A.	J308043249	20011211000000	2009-01-01	2009-12-31	CALLE 23 CON 70 SECTOR INDIO MARA C.C. CENTER LOCAL 8			\N		\N		\N		\N	\N	2001-12-11	SIEZ-2001-12-11-000000
809	1	2	327	1	1	RODRIGUEZ LEMUS,C.A.	ROLECA	J304982720	20011023000001	2009-01-01	2009-12-31	CALLE 58 N0.7-95 EDIF.MONTREAL P.B. ZAPARA II			\N		\N		\N		\N	\N	2001-10-23	SIEZ-2001-10-23-000001
810	1	2	327	1	1	CONSTRUCTORA OVIALCA,C.A.	OVIALCA,C.A.	J307855657	20010326000001	2009-01-01	2009-12-31	CALLE 88 SECTOR VERITAS CASA N0.10-29			\N		\N		\N		\N	\N	2001-03-26	SIEZ-2001-03-26-000001
812	1	2	327	1	1	HC CONSTRUCCIONES Y SERVICIOS,C.A.	CONSTRUCSER,C.A.	J307162139	20010606000004	2009-01-01	2009-12-31	CALLE LA TUBERIA SEC.LOS SAMANES CASA N0. 21-A			\N		\N		\N		\N	\N	2001-06-06	SIEZ-2001-06-06-000004
813	1	2	327	1	1	CONSTRUCTORA PINEDO VILLALOBOS,C.A.	COPIVICA	J304697406	20001229000002	2009-01-01	2009-12-31	CALLE 83A SECTOR PARAISO NO. 21-79			\N		\N		\N		\N	\N	2000-12-29	SIEZ-2000-12-29-000002
932	1	2	327	1	1	CONSTRUCTORA MIFRANCA,C.A.		J308394289	20020515000000	2009-01-01	2009-12-31	CALLE 1 SANTA BARBARA DEL ZULIA CASA N0. 10-46			\N		\N		\N		\N	\N	2002-05-15	SIEZ-2002-05-15-000000
933	1	2	327	1	1	INVERSIONES L.V.,C.A.	INVERSIONES L.V.,C.A.	J308578797	20011226000000	2009-01-01	2009-12-31	AV.4 SECTOR CASCO CENTRAL CASA N0. 94-55			\N		\N		\N		\N	\N	2001-12-26	SIEZ-2001-12-26-000000
1463	1	2	327	1	1	INVERSIONES Y CONSTRUCCIONES NAVA & ACEVEDO,S.A.	INVERCON,S.A.	J303904530	20010518000000	2009-01-01	2009-12-31	URB.NUEVA MIRANDA CALLE 8A ENTRE AV.4 Y 5 N0.4-112 PUERTOS			\N		\N		\N		\N	\N	2001-05-18	SIEZ-2001-05-18-000000
1464	1	2	327	1	1	INDUSTRIAS Y CONSTRUCCIONES DE VENEZUELA, S.A.	SAINCOVEN	J070395338	20010409000001	2009-01-01	2009-12-31	CALLE 86A ENTRE AV.8 Y 9 N0. 8-77			\N		\N		\N		\N	\N	2001-04-09	SIEZ-2001-04-09-000001
1465	1	2	327	1	1	J & S CONSTRUCCIONES,C.A.		J304871210	20010411000000	2009-01-01	2009-12-31	AV.22 ENTRE CALLES 65 Y 66 MINI-CENTRO DON LUIS LOCAL N0.4			\N		\N		\N		\N	\N	2001-04-11	SIEZ-2001-04-11-000000
1467	1	2	327	1	1	SUPLIDORES MEDICOS VANMAR,C.A.	VANMAR,C.A.	J306937390	20010521000000	2009-01-01	2009-12-31	AV.10 CALLE 91 N0. 11-10			\N		\N		\N		\N	\N	2001-05-21	SIEZ-2001-05-21-000000
1468	1	2	327	1	1	INVERSIONES,CONSTRUCCIONES EMMANUEL,C.A.	INCONTREMA,C.A.	J307972033	20010628000000	2009-01-01	2009-12-31	CALLE 64 ENTRE AV.4 Y 8 EDIF.SUR AMERICA PISO 5 APTO 5B			\N		\N		\N		\N	\N	2001-06-28	SIEZ-2001-06-28-000000
1469	1	2	327	1	1	L.C. INGENIERIA,C.A.		J307371595	20001214000003	2009-01-01	2009-12-31	CALLE 85 NO.8-81			\N		\N		\N		\N	\N	2000-12-14	SIEZ-2000-12-14-000003
1471	1	2	327	1	1	CONSTRUCTORA LA PAZ,C.A.	CONPAZCA	J305815046	20010523000001	2009-01-01	2009-12-31	LA CONCEPCION SECTOR ELGUAYABO, VIA PRINCIPAL A CAMPO LA PAZ			\N		\N		\N		\N	\N	2001-05-23	SIEZ-2001-05-23-000001
1472	1	2	327	1	1	GAS AIR CONDITIONING SERVICE,C.A.	GAS AIR,C.A.	J070131250	20010530000000	2009-01-01	2009-12-31	AV.12 CON CALLE 70 N0. 70-55			\N		\N		\N		\N	\N	2001-05-30	SIEZ-2001-05-30-000000
1473	1	2	327	1	1	INGENIERIA, ESTUDIOS Y PROYECTOS AMBIENTALES, C.A.	INESPA	J306151907	19991026000000	2009-01-01	2009-12-31	AV.3FC.C.58A EDIF.CLARISA LAS MERCEDES			\N		\N		\N		\N	\N	1999-10-26	SIEZ-1999-10-26-000000
1474	1	2	327	1	1	BRIMONTI CONSTRUCCIONES,C.A.		J302261210	20010606000003	2009-01-01	2009-12-31	AV.11 N0.2-26 SANTA BARBARA.EDO.ZULIA			\N		\N		\N		\N	\N	2001-06-06	SIEZ-2001-06-06-000003
1475	1	2	327	1	1	SERVICIOS CATELLANOS,C.A.	SERCAS	J300696545	20010625000001	2009-01-01	2009-12-31	ZONA INDUSTRIAL II VIA PALITO BLANCO VIA AEROPUERTO			\N		\N		\N		\N	\N	2001-06-25	SIEZ-2001-06-25-000001
1483	1	2	327	1	1	CLAVE PROYECTOS Y CONSTRUCCION,C,A,		J307778270	20010920000001	2009-01-01	2009-12-31	AV, 15 DELICIAS,EDIF.GRADOS OF.1-A.			\N		\N		\N		\N	\N	2001-09-20	SIEZ-2001-09-20-000001
1484	1	2	327	1	1	SERVICIOS Y CONSTRUCCIONES SERVICON"S,C.A.		J307823860	20010906000000	2009-01-01	2009-12-31	AV. 15 SECTOR DELICIAS, NO.74-45			\N		\N		\N		\N	\N	2001-09-06	SIEZ-2001-09-06-000000
1486	1	2	327	1	1	SERVICIOS INTEGRALES DE INGENIERIA AGRONOMICA,C.A.	AGROSEINCA	J304796943	20001123000002	2009-01-01	2009-12-31	AV.71-B # 01-102			\N		\N		\N		\N	\N	2000-11-23	SIEZ-2000-11-23-000002
1487	1	2	327	1	1	CONSTRUCTORA LEOMAR,C.A.	CONLECA	J308173045	20010820000001	2009-01-01	2009-12-31	AV. PEDRO LUCAS URRIBARRI,SANTA RITA NO.12			\N		\N		\N		\N	\N	2001-08-20	SIEZ-2001-08-20-000001
1488	1	2	327	1	1	CONSTRUCTORA LEAL Y MAYOR, C..A.	LYMCA.	J307888008	20010823000000	2009-01-01	2009-12-31	CALLE SAN BENITO,ANTES C.PRINCIPAL.			\N		\N		\N		\N	\N	2001-08-23	SIEZ-2001-08-23-000000
834	1	2	327	1	1	STRUCTURE, C.A.		J308828653	20020614000000	2009-01-01	2009-12-31	URB. CANTA CLARO,C.52,AV.11 NO.  52-10.			\N		\N		\N		\N	\N	2002-06-14	SIEZ-2002-06-14-000000
1489	1	2	327	1	1	WEST-CONSTRUCCIONES,C.A.	WESCA	J308310719	20010905000001	2009-01-01	2009-12-31	CALLE 70,EDIF. DONA JULIA, PISO 2, OFICINA 1 A.			\N		\N		\N		\N	\N	2001-09-05	SIEZ-2001-09-05-000001
1490	1	2	327	1	1	SERVICIOS INTEGRALES DE MANTENIMIENTO Y CONSTRUCCION,C.A.	SERIMCO,C.A.	J308042897	20010829000001	2009-01-01	2009-12-31	AV.23,SECTOR PARAISO,NO.65-91,EDIF.HARRAR,APT.2			\N		\N		\N		\N	\N	2001-08-29	SIEZ-2001-08-29-000001
1530	1	2	327	1	1	CONSTRUCCIONES,SERVICIOS Y MANTENIMIENTO R & P,C.A.	CONSERMANCA	J070279109	20010613000000	2009-01-01	2009-12-31	AV.BELLA VISTA CON CALLE 66 C.C.EL TRIANGULO LOCAL 22			\N		\N		\N		\N	\N	2001-06-13	SIEZ-2001-06-13-000000
1531	1	2	327	1	1	CONSTRUCCIONES Y MANTENIMIENTOS SILVA, C.A.	COMSICA	J302639077	19990312000067	2009-01-01	2009-12-31	AV.LA LIMPIA  B.AYACUCHO,AV.80D NO.79H-15			\N		\N		\N		\N	\N	1999-03-12	SIEZ-1999-03-12-000067
1540	1	2	327	1	1	RODRIGUEZ & ROMERO,C.A.	R & R, C.A.	J306547290	20010206000000	2009-01-01	2009-12-31	URB.LAS 50 CALLE N0.03 CASA N0. 114 CABIMAS			\N		\N		\N		\N	\N	2001-02-06	SIEZ-2001-02-06-000000
1542	1	2	327	1	1	CONSTRUCCIONES Y MANTENIMIENTO RODRIGUEZ,C.A.	COSTAMAR,C.A.	J307328460	20010925000005	2009-01-01	2009-12-31	AV.PPAL.ZONA INDUSTRIAL N0.53-14 II ETAPA			\N		\N		\N		\N	\N	2001-09-25	SIEZ-2001-09-25-000005
1543	1	2	327	1	1	CONSTRUCCIONES CIVILES,METALMECANICAS,ELECTRICAS,REFRIG.,C.A	COCIMERCA	J303648770	20010529000001	2009-01-01	2009-12-31	AV.1 GALPON 2-141 SEC SANTA TERESA			\N		\N		\N		\N	\N	2001-05-29	SIEZ-2001-05-29-000001
1554	1	2	327	1	1	CONTRATISTA VAMALUVT,C.A.	VAMALUVT	J306177388	20010426000001	2009-01-01	2009-12-31	C.RESID.LA PARAGUA EDIF.CUCHIVERO II LOCAL 2A			\N		\N		\N		\N	\N	2001-04-26	SIEZ-2001-04-26-000001
1556	1	2	327	1	1	ASCENSORES Y CONSTRUCCIONES ELECTROMECANICAS,S.A.	ASCEMSA	J308554120	20020321000000	2009-01-01	2009-12-31	BARRIO ANDRES E. BLANCO CALLE 99 N0. 98H-140			\N		\N		\N		\N	\N	2002-03-21	SIEZ-2002-03-21-000000
1557	1	2	327	1	1	INGENIERIA DE DRENAJE Y CANALIZACIONES,C.A.	INDRECALCA	J070501987	20010129000002	2009-01-01	2009-12-31	CALLE 79 CON AV. 3E NO. 3E-11			\N		\N		\N		\N	\N	2001-01-29	SIEZ-2001-01-29-000002
1558	1	2	327	1	1	ROGO CONSTRUCCIONES C.A.	ROGO,C.A.	J307318805	20001204000000	2009-01-01	2009-12-31	AV.16 CARRETERA EL MOJAN AL LADO DE RESID. EL CUJI NO.41-08			\N		\N		\N		\N	\N	2000-12-04	SIEZ-2000-12-04-000000
1563	1	2	327	1	1	CONSTRUCCIONES CERRO AZUL,C.A.	CONCECA	J090018999	20020723000000	2009-01-01	2009-12-31	CONJ.RESID.EL OLIVAR EDIF.OLIVO I APTO.2B CALLE 75 LA LIMPIA			\N		\N		\N		\N	\N	2002-07-23	SIEZ-2002-07-23-000000
1564	1	2	327	1	1	SERVICIOS GENERAL DE ELEVADORES,C.A.	GECSERCA	J306102310	20020918000000	2009-01-01	2009-12-31	URB. URDANETA VEREDA 39 CALLE 07 CASA N0. 02			\N		\N		\N		\N	\N	2002-09-18	SIEZ-2002-09-18-000000
1598	1	2	327	1	1	CONSTRUCTORA E INVERSORA GAFF C.A.		J306621253	20000920000000	2009-01-01	2009-12-31	AV. 13A  C.C. CARLINE PH P-A.			\N		\N		\N		\N	\N	2000-09-20	SIEZ-2000-09-20-000000
1599	1	2	327	1	1	INVERSIONES L.P., C.A.		J300956695	19990310000032	2009-01-01	2009-12-31	AV.PEDRO LUCAS URRIBARRI NO.14 SECTOR PELE EL OJO,CABIMAS			\N		\N		\N		\N	\N	1999-03-10	SIEZ-1999-03-10-000032
1600	1	2	327	1	1	SERVICIOS  DABAJURO,S.A.		J070091576	20020529000000	2009-01-01	2009-12-31	CARRETERA A PAUJIZAL KM.114 DABAJURO EDO.FALCON			\N		\N		\N		\N	\N	2002-05-29	SIEZ-2002-05-29-000000
1601	1	2	327	1	1	CONSTRUCCIONES Y PROYECTOS SANTA RITA DE COSCIA,C.A.		J303804918	20010112000000	2009-01-01	2009-12-31	URB. NELSON OCANDO A 2 CUADRAS DEL ESTADIO EL MOJAN			\N		\N		\N		\N	\N	2001-01-12	SIEZ-2001-01-12-000000
1603	1	2	327	1	1	CONSTRUJOR,C.A.		J306839585	20020621000000	2009-01-01	2009-12-31	RESD.COSTA DEL SOL N0.A-6 LAS CUARENTA CABIMAS			\N		\N		\N		\N	\N	2002-06-21	SIEZ-2002-06-21-000000
1604	1	2	327	1	1	CONSTRUCTORA LAS DELICIAS, C.A.		J306698639	20001009000000	2009-01-01	2009-12-31	CALLE SAN BENITO NO. 32 CAJA SECA			\N		\N		\N		\N	\N	2000-10-09	SIEZ-2000-10-09-000000
1606	1	2	327	1	1	FETOR, C.A.	FETORCA	J304445296	19990329000053	2009-01-01	2009-12-31	EDIF.ZEA AV.3D NO.76-56 APTO.7-E			\N		\N		\N		\N	\N	1999-03-29	SIEZ-1999-03-29-000053
1607	1	2	327	1	1	ESPECIALIDADES INDUSTRIALES ESPINDUCA,C.A.	ESPINDUCA	J307469633	20020425000002	2009-01-01	2009-12-31	CALLE PRINCIPAL CAMPO ELIAS N0.153 ESQ.CALLEJON MARA			\N		\N		\N		\N	\N	2002-04-25	SIEZ-2002-04-25-000002
1608	1	2	327	1	1	CONSTRUCTORA ASTRO,C.A.		J305847223	20010920000000	2009-01-01	2009-12-31	CENT.C. FUNG LOCAL NO.4.P.A.ESQ.AV.74 LA LIMPIA			\N		\N		\N		\N	\N	2001-09-20	SIEZ-2001-09-20-000000
1609	1	2	327	1	1	CONSTRUCCIONES GILEMI, C.A.	GILEMICA	J305575690	19990310000087	2009-01-01	2009-12-31	SECT.TIERRA NEGRA,C.75CON AV.13 NO.13-64 APT.LOCAL 6			\N		\N		\N		\N	\N	1999-03-10	SIEZ-1999-03-10-000087
1029	1	2	327	1	1	HUPERTZ, C.A.		J30005205	19990319000062	2009-01-01	2009-12-31	AV.14B NO.84-65 SECTOR DELICIAS			\N		\N		\N		\N	\N	1999-03-19	SIEZ-1999-03-19-000062
1610	1	2	327	1	1	ARQUITECTURA Y ARTE COMPAÑIA ANONIMA	ARQUIARTE C.A.	J302873673	20000104000000	2009-01-01	2009-12-31	C.C. PALAIMA PISO 2 OFICINA 2-6			\N		\N		\N		\N	\N	2000-01-04	SIEZ-2000-01-04-000000
1611	1	2	327	1	1	BROIDE D-EMPAIRE Y ASOCIADOS COMPAÑIA ANONIMA	BRODAMCA	J070164565	20001101000000	2009-01-01	2009-12-31	CALLE 67 CON AV. 3F C.C. MAZZEI OFICINA NO. 18			\N		\N		\N		\N	\N	2000-11-01	SIEZ-2000-11-01-000000
1612	1	2	327	1	1	CONSTRUCCIONES Y MECANICA,C.A.	CONYMECA	J070295856	20010418000000	2009-01-01	2009-12-31	AV.58 N0.96G-102 CIRCUNV.2			\N		\N		\N		\N	\N	2001-04-18	SIEZ-2001-04-18-000000
1613	1	2	327	1	1	INVERSIONES COROMOTO, C.A.		J070351144	19990412000026	2009-01-01	2009-12-31	CALLE 67 CON AV.24 EDIF.QUICHUA II APTO. 2A			\N		\N		\N		\N	\N	1999-04-12	SIEZ-1999-04-12-000026
1614	1	2	327	1	1	BURGOS A/A,C.A.		J308281255	20020116000000	2009-01-01	2009-12-31	AV.PADILLA TORRE DEL SALADILLO LOCAL 02			\N		\N		\N		\N	\N	2002-01-16	SIEZ-2002-01-16-000000
1615	1	2	327	1	1	CONSTRUCCIONES E INVERSIONES MUÑOZ, C.A.	CONINVIMCA	J070489537	19990329000055	2009-01-01	2009-12-31	CALLE 72 ENTRTE AV.13/113A C.C.LOS CORALES LOCAL NO.7			\N		\N		\N		\N	\N	1999-03-29	SIEZ-1999-03-29-000055
1616	1	2	327	1	1	P & C  ASOCIADOS,C.A.		J305278865	19990302000000	2009-01-01	2009-12-31	AV.PRINCIPAL SAN FRANCISCO NO.14-65			\N		\N		\N		\N	\N	1999-03-02	SIEZ-1999-03-02-000000
1617	1	2	327	1	1	CONSTRUCCIONES E INSTALACIONES VENEZOLANAS, C.A.	CIVENCA	J070495340	19990312000051	2009-01-01	2009-12-31	AV.15 ENTRE CALLES 89 Y 89B,EDIF.LAS PALMERAS,PISO 2 ,OFIC 2			\N		\N		\N		\N	\N	1999-03-12	SIEZ-1999-03-12-000051
1618	1	2	327	1	1	INGENIERIA LUANCO, C.A.		J090253807	19990312000052	2009-01-01	2009-12-31	AV.8 CALLES 77 Y 78 #. 77-29			\N		\N		\N		\N	\N	1999-03-12	SIEZ-1999-03-12-000052
1619	1	2	327	1	1	A & P DE OCCIDENTE,C.A.		J305557527	20001208000000	2009-01-01	2009-12-31	BOULEVAR 5 DE JULIO EDIF. LOS MELLIZOS PISO 1 OFICINA 1			\N		\N		\N		\N	\N	2000-12-08	SIEZ-2000-12-08-000000
1620	1	2	327	1	1	PROYECTOS  Y CONSTRUCCIONES 2A,C.A.	PROYCON 2A,C.A.	J305156255	20010829000002	2009-01-01	2009-12-31	CALLE 72 ENTRE AV,20 Y 19,EDIF. NOEL,			\N		\N		\N		\N	\N	2001-08-29	SIEZ-2001-08-29-000002
1639	1	2	327	1	1	INGENIERIA FERRER ALCALA,C.A.	INFALCA	J301982630	20010404000000	2009-01-01	2009-12-31	CALLE 71 ENTRE 16A Y 17N0. 16B-29 SECTOR RAFAEL M.BARALT			\N		\N		\N		\N	\N	2001-04-04	SIEZ-2001-04-04-000000
1640	1	2	327	1	1	OBRAS MARITIMAS Y CIVILES, C.A.	OMYCCA	J070014121	19990322000003	2009-01-01	2009-12-31	AV.LOS HATICOS ENTRE AVDAS,15/17			\N		\N		\N		\N	\N	1999-03-22	SIEZ-1999-03-22-000003
1641	1	2	327	1	1	PROYECTOS,CONSTRUCCION Y MANTENIMIENTO ELECTRICOS Y CIVILES	PROCMECI,C.A.	J070198745	20001026000005	2009-01-01	2009-12-31	CARRETERA K ENTRE AV.42 Y 43 BARRIO PUNTO FIJO.CABIMAS			\N		\N		\N		\N	\N	2000-10-26	SIEZ-2000-10-26-000005
2060	1	2	327	1	1	R & V CONSTRUCCIONES, C.A..	R & V	J315404257	20061116000001	2009-01-01	2009-12-31	SECTOR SANTA RITA C. 63 CON AV. UNIVERSIDAD CASA NO. 8B-71			\N		\N		\N		\N	\N	2006-11-16	SIEZ-2006-11-16-000001
1649	1	2	327	1	1	CONSTRUCTORA R & P, C.A.		J303596193	19990324000077	2009-01-01	2009-12-31	URB.LA PAZ AV.52 NO.95M-36			\N		\N		\N		\N	\N	1999-03-24	SIEZ-1999-03-24-000077
1650	1	2	327	1	1	CONSTRUCCIONES INDUSTRIALES MARACAIBO,C.A.	CONIMARCA	J304975325	20000613000000	2009-01-01	2009-12-31	CALLE 82A N0. 3E-114 SECTOR LA LAGO			\N		\N		\N		\N	\N	2000-06-13	SIEZ-2000-06-13-000000
1651	1	2	327	1	1	CONSTRUCCIONES JIMENEZ LUZARDO,C.A.	COJILCA	J300838650	19990318000015	2009-01-01	2009-12-31	AV.10 CALLE 66A NO. 66A-38			\N		\N		\N		\N	\N	1999-03-18	SIEZ-1999-03-18-000015
1660	1	2	327	1	1	CONSTRUCTORA GORVE,COMPAÑIA ANONIMA	GORVECA	J303415695	19990929000001	2009-01-01	2009-12-31	CIRCUNVALACION #2 C.C.AMPARO LOCAL 1			\N		\N		\N		\N	\N	1999-09-29	SIEZ-1999-09-29-000001
1661	1	2	327	1	1	CONSTRUCCIONES R Y P, C.A.	CONREROCA	J070501367	19990428000004	2009-01-01	2009-12-31	SECTOR LA MISION CALLE SAN JOSE #.27			\N		\N		\N		\N	\N	1999-04-28	SIEZ-1999-04-28-000004
1664	1	2	327	1	1	PERFORACIONES VENEZUELA,C.A.	PERVENCA	J300140067	20030613000000	2009-01-01	2009-12-31	SECTOR JALISCO AV.10 CARRETERA LA ENGRANSONADA CASA S/N			\N		\N		\N		\N	\N	2003-06-13	SIEZ-2003-06-13-000000
1665	1	2	327	1	1	OFICINA DE PROYECTOS INTEGRALES,C.A.	OPICA	J070430907	19990614000019	2009-01-01	2009-12-31	AV.4 BELLA VISTA C.C. VILLA INES PISO 3, OFICINAS 34 Y 35			\N		\N		\N		\N	\N	1999-06-14	SIEZ-1999-06-14-000019
1666	1	2	327	1	1	JAPREM ZULIA, C.A.		J070457422	19990302000010	2009-01-01	2009-12-31	AV.29 NO.39-40 SECTOR CUJICITO DETRAS COL.OLGA M.ABREU			\N		\N		\N		\N	\N	1999-03-02	SIEZ-1999-03-02-000010
1667	1	2	327	1	1	IMOSA TUBOACERO FABRICACION,C.A.		J304751559	20010504000001	2009-01-01	2009-12-31	AV.FRANCISCO DE MIRANDA LOS PALOS GRANDES,CARACAS			\N		\N		\N		\N	\N	2001-05-04	SIEZ-2001-05-04-000001
1597	1	2	327	1	1	J&D.C. SPORTS,C.A.		J307258756	20010516000000	2009-01-01	2009-12-31	CALLE 69A ENTRE AV.13 Y 13A N0. 13-68			\N		\N		\N		\N	\N	2001-05-16	SIEZ-2001-05-16-000000
1668	1	2	327	1	1	PROYECTOS,CONSTRUCCIONES Y NEGOCIOS,S.A.	PROYCONSA	J300580520	20001102000004	2009-01-01	2009-12-31	CALLE 71 AV,3H Y 3Y N  3H- 44 SECTOR BELLAS ARTES			\N		\N		\N		\N	\N	2000-11-02	SIEZ-2000-11-02-000004
1670	1	2	327	1	1	GUEDEZ MATA DESARROLLOS, COMPAÑIA ANONIMA	G.M. DESARROLLOS	J305459690	20000926000000	2009-01-01	2009-12-31	AV. BELLA VISTA NO.60-91,LOCAL GM.			\N		\N		\N		\N	\N	2000-09-26	SIEZ-2000-09-26-000000
1671	1	2	327	1	1	3JR INGENIERIA Y CONSTRUCCIONES C.A.		J307222840	20001017000002	2009-01-01	2009-12-31	AV.6 N0.57-32 EDIF.TATAYITO PB APTO.1-A URB. ZAPARA 2			\N		\N		\N		\N	\N	2000-10-17	SIEZ-2000-10-17-000002
476	1	2	327	1	1	INVERSIONES RODOLFO RINCON,C.A.	RORICA	J303423574	20010219000002	2009-01-01	2009-12-31	AV.4 SIERRA MAESTRA			\N		\N		\N		\N	\N	2001-02-19	SIEZ-2001-02-19-000002
811	1	2	327	1	1	S & C SERVICIOS,C.A.		J306720499	20010523000000	2009-01-01	2009-12-31	CALLE 72 CON AV.17			\N		\N		\N		\N	\N	2001-05-23	SIEZ-2001-05-23-000000
860	1	2	327	1	1	GLOBAL EXPRESS, C.A.		J306773096	20020906000000	2009-01-01	2009-12-31	AV. 14, SECTOR MONTE BELLO			\N		\N		\N		\N	\N	2002-09-06	SIEZ-2002-09-06-000000
1673	1	2	327	1	1	CONSTRUCCIONES LA NUEVA CHINITA COMPAÑIA ANONIMA		J304975244	19990924000000	2009-01-01	2009-12-31	GALPON AV.7 ENTR.25 Y 26 #.25-62			\N		\N		\N		\N	\N	1999-09-24	SIEZ-1999-09-24-000000
1674	1	2	327	1	1	CONSTRUCCIONES, INFRAESTRUCTURA Y SERVICIOS AMBIENTALES C.A.	COINSA	J306695109	20000224000000	2009-01-01	2009-12-31	AV.3F C.CALLE 58A SECTOR LAS MERCEDES EDIF.CLARISA LOCAL 4			\N		\N		\N		\N	\N	2000-02-24	SIEZ-2000-02-24-000000
1091	1	2	327	1	1	CONSTRUCCIONES CHACIN, C.A.		J301504992	19990315000083	2009-01-01	2009-12-31	AV.PEDRO LUCAS URRIBARRI SECTOR BARRANCAS.			\N		\N		\N		\N	\N	1999-03-15	SIEZ-1999-03-15-000083
1675	1	2	327	1	1	INVERSIONES Y CONSTRUCCIONES URDANETA VILLAFAÑE, C.A.	INCURVI, C.A.	J090264361	19990319000069	2009-01-01	2009-12-31	KM 7 CARRETERA STA.BARBARA LAS GAVIOTAS AV. 15 DELICIAS			\N		\N		\N		\N	\N	1999-03-19	SIEZ-1999-03-19-000069
1676	1	2	327	1	1	SERVICIOS RAMSAN,C.A.		J305756210	20010920000002	2009-01-01	2009-12-31	AV.MILAGRO,RESID. PREMIUM,EDIF.1, PISO 09,APART. 9B			\N		\N		\N		\N	\N	2001-09-20	SIEZ-2001-09-20-000002
1677	1	2	327	1	1	CONSTRUCTORA PROSPERIDAD,C.A.	COPROS,C.A.	J304709420	20010205000001	2009-01-01	2009-12-31	KM.4 1/2 CARRETERA SANTA BARBARA EL VIGIA URB. PARQUE SOL CASA # 48			\N		\N		\N		\N	\N	2001-02-05	SIEZ-2001-02-05-000001
1680	1	2	327	1	1	CONSTRUCCION VHL,C.A. NO SE PUEDE HACER  SOLVENCIA	VHLCA	J309361171	20030224000000	2009-01-01	2009-12-31	URB.LA TRINIDAD C.C. LA TRINIDAD LOCAL 18			\N		\N		\N		\N	\N	2003-02-24	SIEZ-2003-02-24-000000
1695	1	2	327	1	1	COSTA BOLIVAR CONSTRUCCIONES, C.A.	C.B.C.	J070120924	19990315000084	2009-01-01	2009-12-31	AV.PRINCIPAL CON CALLE VENEZUELA			\N		\N		\N		\N	\N	1999-03-15	SIEZ-1999-03-15-000084
1696	1	2	327	1	1	CONSTRUCCIONES REYES MARTINEZ DEL ZULIA,C.A.	CREMAZUCA	J306322256	19990916000001	2009-01-01	2009-12-31	AV.VIA BOBURES 2DA.C/LA CONQUISTA #10-906,CAJA SECA			\N		\N		\N		\N	\N	1999-09-16	SIEZ-1999-09-16-000001
1699	1	2	327	1	1	INGENIERIA COSTA ORIENTAL DEL LAGO,C.A.	INGECOL,C.A.	J304184441	20011220000000	2009-01-01	2009-12-31	CARRETERA L ENTRE AV.31 Y 32 EDIF.VILLA SAN JOSE N0. 06			\N		\N		\N		\N	\N	2001-12-20	SIEZ-2001-12-20-000000
1700	1	2	327	1	1	PROYECTOS, VIALIDAD, CONSTRUCCION Y ASFALTADO, C.A.	PROVIACA, C.A.	J070297654	19990310000042	2009-01-01	2009-12-31	AV.25 NO.65 SECTOR SANTA MARIA			\N		\N		\N		\N	\N	1999-03-10	SIEZ-1999-03-10-000042
1701	1	2	327	1	1	SERVICIOS TECNICOS INTEGRALES C.A	SETINCA	J070343885	19990629000001	2009-01-01	2009-12-31	C.C. CALLE 66 PTA ALTA LOCAL 4 FRENTE A LA PLAZA INDIO MARA			\N		\N		\N		\N	\N	1999-06-29	SIEZ-1999-06-29-000001
1702	1	2	327	1	1	OBRAS CIVILES Y MECANICAS, C.A.	OCYMCA	J303180663	19990319000082	2009-01-01	2009-12-31	CALLE 72 CON AV.4 Y 8 C.C. CLODOMIRA P.2 OFI.305			\N		\N		\N		\N	\N	1999-03-19	SIEZ-1999-03-19-000082
1704	1	2	327	1	1	ELECTROTECNICA SAQUI,C.A.		J000913773	20030131000001	2009-01-01	2009-12-31	CALLE 74 C.C.14 N0.74-15			\N		\N		\N		\N	\N	2003-01-31	SIEZ-2003-01-31-000001
1705	1	2	327	1	1	CONSTRUCCIONES,INSPECCIONES,Y PROYECTOS, C.A.	CIYPROCA	J305875421	19990412000007	2009-01-01	2009-12-31	CALLE 216A N0. 49I-48			\N		\N		\N		\N	\N	1999-04-12	SIEZ-1999-04-12-000007
1706	1	2	327	1	1	DISEÑOS, PROYECTOS Y CONST.PIRELA, C.A.	DIPROCA	J070285055	19990324000060	2009-01-01	2009-12-31	CALLE 96 NO.15A-119 SECTOR EL TRANSITO			\N		\N		\N		\N	\N	1999-03-24	SIEZ-1999-03-24-000060
1713	1	2	327	1	1	INVERSIONES TAUROS,C.A.	INTAUCA	J307891505	20010511000002	2009-01-01	2009-12-31	AV.9 Y 10 MONTE BELLO CASA N0.10-61			\N		\N		\N		\N	\N	2001-05-11	SIEZ-2001-05-11-000002
1714	1	2	327	1	1	PLAZAS Y PARQUES, C.A.		J305181810	19990319000021	2009-01-01	2009-12-31	CALLE 90 NO.7A-24 DETRAS DEL HPTAL. DE NIÑOS SECTOR VERITAS			\N		\N		\N		\N	\N	1999-03-19	SIEZ-1999-03-19-000021
1719	1	2	327	1	1	CONTRATISTA DE SERVICOS MARACAIBO,C.A.	CONSERMARCA	J070444029	20010122000002	2009-01-01	2009-12-31	PLAZA BARALT AV.06 EDIF.SAN FRANCISCO LOCAL 1-D			\N		\N		\N		\N	\N	2001-01-22	SIEZ-2001-01-22-000002
1720	1	2	327	1	1	INVERSIONES CATIRE, S.A.	INCASA	J300582558	20000808000000	2009-01-01	2009-12-31	CALLE 93 PADILLA ENTRE AVES.9 Y 10 EDIF.RAFAEL URDANETA			\N		\N		\N		\N	\N	2000-08-08	SIEZ-2000-08-08-000000
1721	1	2	327	1	1	CONSTRUCCIONES E INVERSIONES TINAJAS C.A.	CITICA	J070527544	20001002000000	2009-01-01	2009-12-31	URB.RAUL LEONI BLOQUE 31 APTO.01-05 I ETAPA			\N		\N		\N		\N	\N	2000-10-02	SIEZ-2000-10-02-000000
1722	1	2	327	1	1	PLANIFICACION Y ORG.DE TELEFONOS,ELECTRICIDAD Y CONST.ASOC.	PLOTECA, C.A.	J070146869	19990319000034	2009-01-01	2009-12-31	AV.UNION URB.LA ALAMBRA N0.8A-23			\N		\N		\N		\N	\N	1999-03-19	SIEZ-1999-03-19-000034
1723	1	2	327	1	1	MADEIRA CONSTRUCCIONES,C.A.	MADECON	J307770813	20010330000001	2009-01-01	2009-12-31	AV.60 URB. SAN MIGUEL CASA N0. 96B-31			\N		\N		\N		\N	\N	2001-03-30	SIEZ-2001-03-30-000001
1726	1	2	327	1	1	LM INGENIERIA C.A. CONSTRUCCIONES		J303311628	19990610000007	2009-01-01	2009-12-31	AV 20 C/72 CC MONTIELCO PISO 7 OFIC. #.4			\N		\N		\N		\N	\N	1999-06-10	SIEZ-1999-06-10-000007
1727	1	2	327	1	1	INVERSIONES EL LUCERO,C.A.	INVERLUCA	J306986693	20010308000001	2009-01-01	2009-12-31	CALLE PANAMA ENTRE A.V.31Y32 SECTOR EL LUCERO			\N		\N		\N		\N	\N	2001-03-08	SIEZ-2001-03-08-000001
1728	1	2	327	1	1	AVO PROYECTOS Y CONSTRUCCIONES COMPAÑIA ANONIMA		J305879591	19991103000002	2009-01-01	2009-12-31	AVE-8 # 58-56 SECTOR ZAPARA			\N		\N		\N		\N	\N	1999-11-03	SIEZ-1999-11-03-000002
1729	1	2	327	1	1	CONSTRUCTORA RINYBOL, C.A.		J304418175	19990329000065	2009-01-01	2009-12-31	AV.4 NO.94-55 CLINICA OBISPO.LAZO			\N		\N		\N		\N	\N	1999-03-29	SIEZ-1999-03-29-000065
1730	1	2	327	1	1	PROYECTOS CARIBE VENEZOLANOS, C.A.	PROCAVEN, C.A.	J07047552Z9	19990324000065	2009-01-01	2009-12-31	AV.16 ENTRE 96/86			\N		\N		\N		\N	\N	1999-03-24	SIEZ-1999-03-24-000065
1731	1	2	327	1	1	SERVICIOS DE INGENIERIA INDUSTRIAL,C.A.	SICA	J070129379	20001213000000	2009-01-01	2009-12-31	CALLE 149 NO. 67A-149 ZONA INDUSTRIAL SEGUNDA ETAPA			\N		\N		\N		\N	\N	2000-12-13	SIEZ-2000-12-13-000000
1732	1	2	327	1	1	CONSTRUCTORA LOS BUCARES,C.A.		J070317957	19990416000050	2009-01-01	2009-12-31	VIA PLANTA DEL INOS SECTOR EL ROSARIO			\N		\N		\N		\N	\N	1999-04-16	SIEZ-1999-04-16-000050
1733	1	2	327	1	1	CONSTRUCTORA COSTA DEL ZULIA,C.A.		J307652306	20020801000001	2009-01-01	2009-12-31	CALLE 92A LAS LOMAS N0. 70B-213			\N		\N		\N		\N	\N	2002-08-01	SIEZ-2002-08-01-000001
1625	1	2	327	1	1	PROYECTOS,INSPECCIONES Y CONSTRUCCIONES DE INGENIERIA, C.A.	PROINCI, C.A.	J070209372	19990312000048	2009-01-01	2009-12-31	AV.15 C.C.PASEO LAS DELICIAS,TORRE EMPRESARIAL			\N		\N		\N		\N	\N	1999-03-12	SIEZ-1999-03-12-000048
1735	1	2	327	1	1	CONSTRUCCIONES FRANCO GONZALEZ, C.A.	CONFRAGONCA	J300758184	19990324000046	2009-01-01	2009-12-31	AV.UNIVERSIDAD C.C.OQUENDO OFICINA 3			\N		\N		\N		\N	\N	1999-03-24	SIEZ-1999-03-24-000046
1736	1	2	327	1	1	INGENIERIA,SERVICIOS Y MANTENIMIENTO TACOA MIQUELENA,,C.A.	INSERMA,C.A.	J308791369	20020819000001	2009-01-01	2009-12-31	CALLE 62 NO. 15-35, SECTOR LAS TARABAS			\N		\N		\N		\N	\N	2002-08-19	SIEZ-2002-08-19-000001
1737	1	2	327	1	1	HERMANOS PIETRALUNGA, S.A.		J070015110	19990329000052	2009-01-01	2009-12-31	AV.INTERCOMUNAL NO.191 CABIMAS			\N		\N		\N		\N	\N	1999-03-29	SIEZ-1999-03-29-000052
1738	1	2	327	1	1	F & L PROYECTOS Y CONSTRUCCIONES, COMPAÑIA ANONIMA		J070403217	19990708000004	2009-01-01	2009-12-31	AV.4 BELLA VISTA C.CALLE 67 C.ACOSTA EDF.GRAL DE SEGUROS			\N		\N		\N		\N	\N	1999-07-08	SIEZ-1999-07-08-000004
1739	1	2	327	1	1	CONSTRUCTORA CAME,C.A.		J302346568	20011022000002	2009-01-01	2009-12-31	AV.3 INDEPENDENCIA C.C. GALERIAS LOCAL 2-B P.A.			\N		\N		\N		\N	\N	2001-10-22	SIEZ-2001-10-22-000002
1741	1	2	327	1	1	GERENCIA DE INGENIERIA A Y C,C.A.		J306117083	20020926000001	2009-01-01	2009-12-31	C.C.SALTO ANGEL NIVEL 2 OFIC.3 AV.3Y SAN MARTIN C.76 Y 77			\N		\N		\N		\N	\N	2002-09-26	SIEZ-2002-09-26-000001
1742	1	2	327	1	1	CONSTRUCTORA JEROGA, C.A.		J070089652	19990416000046	2009-01-01	2009-12-31	AV.66 NO. 146-30			\N		\N		\N		\N	\N	1999-04-16	SIEZ-1999-04-16-000046
1744	1	2	327	1	1	CONSTRUCTORA RECUCIPROCA,C.A.		J304483740	20000313000001	2009-01-01	2009-12-31	AV.6 C.CALLE 98 DIAGONAL AL CONVENTO EDIF.SAN FRANCISCO			\N		\N		\N		\N	\N	2000-03-13	SIEZ-2000-03-13-000001
1745	1	2	327	1	1	CONSTRUCTORA ORECAR,C.A.		J305319634	20010126000001	2009-01-01	2009-12-31	PROLONG.CIRCUNV.2 C.C. LA PARAGUA LOCAL 32			\N		\N		\N		\N	\N	2001-01-26	SIEZ-2001-01-26-000001
1746	1	2	327	1	1	INVERSIONES EN CONSTRUCCIONES Y COMERCIO A & C, C.A.	INCONACA, C.A.	J304112670	19990603000002	2009-01-01	2009-12-31	C.C. 5 DE JULIO OFICINA 8B PISO 2 AV 5 DE JULIO			\N		\N		\N		\N	\N	1999-06-03	SIEZ-1999-06-03-000002
1747	1	2	327	1	1	SUMINISTROS Y SERVICIOS,C.A.	S Y S,C.A.	J308949590	20030313000000	2009-01-01	2009-12-31	LA COROMOTO CALLE 165 EDIF.FLOR DE COROMOTO APTO.1-A			\N		\N		\N		\N	\N	2003-03-13	SIEZ-2003-03-13-000000
1751	1	2	327	1	1	CONSTRUCTORA VALLE BLANCO,C.A.		J301794940	20011011000000	2009-01-01	2009-12-31	C.C.LOS PUENTES II ETAPA PISO 3 LOCAL 4			\N		\N		\N		\N	\N	2001-10-11	SIEZ-2001-10-11-000000
1754	1	2	327	1	1	CONSTRUCCIONES LUMAR,C.A.		J310432368	20031020000001	2009-01-01	2009-12-31	CALLE PANAMA ENTRE AV.31 Y 32			\N		\N		\N		\N	\N	2003-10-20	SIEZ-2003-10-20-000001
1755	1	2	327	1	1	PROYECTOS,OBRAS Y SERVICIOS INDUSTRIALES,C.A.	PROSERVICA	J310426309	20031021000001	2009-01-01	2009-12-31	URB.TAMARE CASA # 33			\N		\N		\N		\N	\N	2003-10-21	SIEZ-2003-10-21-000001
1756	1	2	327	1	1	COMERCIALIZADORA DE CONCRETO Y AGREGADOS,S.A.	CONCRESA	J308434523	20031021000002	2009-01-01	2009-12-31	CALLE 36 B SAN JACINTO			\N		\N		\N		\N	\N	2003-10-21	SIEZ-2003-10-21-000002
1757	1	2	327	1	1	T & T INGENIERIA,C.A.		J305092885	20031021000003	2009-01-01	2009-12-31	URB.BUENA VISTA CALLE # 6			\N		\N		\N		\N	\N	2003-10-21	SIEZ-2003-10-21-000003
1758	1	2	327	1	1	CONSTRUCCIONES S.P.V.,C.A.		J001804803	20031021000004	2009-01-01	2009-12-31	AV.20 ENTRE C. 68Y69 C.C. LAS TEJAS LOCAL1-4			\N		\N		\N		\N	\N	2003-10-21	SIEZ-2003-10-21-000004
1759	1	2	327	1	1	B.M. CONSTRUCTORA C.A.	B.M,C.A.	J070286822	20031023000001	2009-01-01	2009-12-31	A.V. 31 # 238 EDIF. BMCA			\N		\N		\N		\N	\N	2003-10-23	SIEZ-2003-10-23-000001
1760	1	2	327	1	1	VENEZOLANA DE INGENIERIA Y CONSTRUCCION,C.A.	VINCO	J310217939	20031027000001	2009-01-01	2009-12-31	A.V. 16 C.C. 89A C.C.DELICIAS 2 LOCAL #5			\N		\N		\N		\N	\N	2003-10-27	SIEZ-2003-10-27-000001
1771	1	2	327	1	1	INVERSORA Y CONSTRUTORA DEL ZULIA,C.A.	INCOZUCA	J070354186	19991223000003	2009-01-01	2009-12-31	CALLE 56 #15Q-10			\N		\N		\N		\N	\N	1999-12-23	SIEZ-1999-12-23-000003
1772	1	2	327	1	1	TRAFFIC VIAL, C.A.	TRAVICA	J304460228	20031110000004	2009-01-01	2009-12-31	CALLE 70 ENTRE AVDAS. 14A Y 15			\N		\N		\N		\N	\N	2003-11-10	SIEZ-2003-11-10-000004
1773	1	2	327	1	1	CONSTRUCTORA CANADA,C.A.		J310329303	20031112000001	2009-01-01	2009-12-31	A.V 2 C.C. CARIBE CASA #81-12			\N		\N		\N		\N	\N	2003-11-12	SIEZ-2003-11-12-000001
1775	1	2	327	1	1	CONSTRUCTORA BOSQUE VERDE,C.A.		J310203350	20031120000001	2009-01-01	2009-12-31	CALLE 84A # 85-93			\N		\N		\N		\N	\N	2003-11-20	SIEZ-2003-11-20-000001
1777	1	2	327	1	1	PROYECTOS Y PAISAJISMOS,C.A.		J304421680	20031121000002	2009-01-01	2009-12-31	A.V.117-A VIA PLANTA C DE HIDROLAGO			\N		\N		\N		\N	\N	2003-11-21	SIEZ-2003-11-21-000002
1779	1	2	327	1	1	CARPINTERIA LOREND,C.A.		J070445319	20031125000001	2009-01-01	2009-12-31	.AV ROOSELVELT #348 BARRIO RAFAEL URDANETA			\N		\N		\N		\N	\N	2003-11-25	SIEZ-2003-11-25-000001
1786	1	2	327	1	1	GLOBAL TECHNOLOGY,C.A.	GLOBAL TECH,C.A.	J304946252	20031211000002	2009-01-01	2009-12-31	AV.3C CON CALLE 67 UNICENTRO VIRGINIA PISO 2 OFICINA 18			\N		\N		\N		\N	\N	2003-12-11	SIEZ-2003-12-11-000002
1787	1	2	327	1	1	BRACHO,HERNANDEZ Y GARZON INVERSIONES,C.A.	INVERSIONES B.H.G.	J304068301	20031212000001	2009-01-01	2009-12-31	CALLE 89D # 10-140			\N		\N		\N		\N	\N	2003-12-12	SIEZ-2003-12-12-000001
1788	1	2	327	1	1	INVERSIONES Y CONSTRUCCIONES MONTERO,C.A.	I.C.M.,C.A.	J310306010	20031216000001	2009-01-01	2009-12-31	AV.15 DELICIAS # 74-50			\N		\N		\N		\N	\N	2003-12-16	SIEZ-2003-12-16-000001
1789	1	2	327	1	1	MANTENIMIENTOS, SERVICIOS Y OBRAS,C.A.	MASOCA	J309854135	20031217000001	2009-01-01	2009-12-31	CALLE 106B BARRIO ALTAMIRA # 18B-77			\N		\N		\N		\N	\N	2003-12-17	SIEZ-2003-12-17-000001
1790	1	2	327	1	1	SERVICIOS Y MANTENIMIENTO O.H.,C.A.	SERVYMOHCA	J307618140	20031218000001	2009-01-01	2009-12-31	CALLE PRIMAVERA SECTOR TAMARE BARRIO MARISCAL SUCRE			\N		\N		\N		\N	\N	2003-12-18	SIEZ-2003-12-18-000001
1792	1	2	327	1	1	ALIMARCA		J300796434	20040107000001	2009-01-01	2009-12-31	URB.LAS PALMAS,CASA # 6,SECT.LA VEREDA			\N		\N		\N		\N	\N	2004-01-07	SIEZ-2004-01-07-000001
1793	1	2	327	1	1	HERNANDEZ, TRUJILLO, FILIALES & ASOCIADOS,C.A.	HTF & ASOCIADOS,C.A.	J310088330	20040112000001	2009-01-01	2009-12-31	CALLE 84 ENTRE AV.2A Y 2B C.C. LA COLINA LOCAL 18			\N		\N		\N		\N	\N	2004-01-12	SIEZ-2004-01-12-000001
1794	1	2	327	1	1	EVENTS AND PRODUCTIONS CORPORATIONS,C.A.		J308393029	20040119000001	2009-01-01	2009-12-31	AV.18 CASA # 122-103			\N		\N		\N		\N	\N	2004-01-19	SIEZ-2004-01-19-000001
1795	1	2	327	1	1	J & M CONSTRUCCIONES,C.A.		J303474497	20040120000001	2009-01-01	2009-12-31	AV.20 C.C. LAS TEJAS LOCAL 1-4			\N		\N		\N		\N	\N	2004-01-20	SIEZ-2004-01-20-000001
1796	1	2	327	1	1	CONST.MANT. Y SERVICIOS GENERALES SAN BENITO,C.A.	CONSABE,C.A.	J307134674	20040120000002	2009-01-01	2009-12-31	CALLE 65 EDIFICIO SIGMA LOCAL 4A			\N		\N		\N		\N	\N	2004-01-20	SIEZ-2004-01-20-000002
1797	1	2	327	1	1	MENDEZ SERVICIOS,C.A.	MENSERCA	J300303667	20040121000001	2009-01-01	2009-12-31	CALLE 73 CON AV. 10  EDIF.TACARICA LOCAL 3			\N		\N		\N		\N	\N	2004-01-21	SIEZ-2004-01-21-000001
1798	1	2	327	1	1	INVERSIONES EL RHUR,C.A.		J306914927	20040122000001	2009-01-01	2009-12-31	AV.15B URB. LAGO MAR BEACH CASA # 15-122			\N		\N		\N		\N	\N	2004-01-22	SIEZ-2004-01-22-000001
1799	1	2	327	1	1	MEDICAL DE VENEZUELA,C.A.		J307134615	20040122000002	2009-01-01	2009-12-31	AV.6 QUINTA D-25			\N		\N		\N		\N	\N	2004-01-22	SIEZ-2004-01-22-000002
1800	1	2	327	1	1	PROY.CONST. E IMPERMEABILIZACIONES EDELMARA,C.A.	EDELMARA,C.A.	J310065560	20040122000003	2009-01-01	2009-12-31	AV.15 DELICIAS ESQ.CALLE 75 # 75-86			\N		\N		\N		\N	\N	2004-01-22	SIEZ-2004-01-22-000003
1801	1	2	327	1	1	SERVICIOS Y SUMINISTROS DE MARACAIBO,C.A.	SUMCA	J310936102	20040126000001	2009-01-01	2009-12-31	C.C.BUENA VISTA CIRCUNV.2 LOCAL 20			\N		\N		\N		\N	\N	2004-01-26	SIEZ-2004-01-26-000001
1900	1	2	327	1	1	CONSTRUCTORA W.G.,C.A.		J312661178	20050505000002	2009-01-01	2009-12-31	AV.72 N0.79-18			\N		\N		\N		\N	\N	2005-05-05	SIEZ-2005-05-05-000002
1802	1	2	327	1	1	CONSTRUCTORA PEREZ,C.A.	CONPERCA	J308772160	20020704000000	2009-01-01	2009-12-31	AV.10 E/C. 67 Y 68 C.C.CARI PISO 2 LOCALES 3 Y 4			\N		\N		\N		\N	\N	2002-07-04	SIEZ-2002-07-04-000000
1803	1	2	327	1	1	INGENIERIA DE LA CONSTRUCCION,C.A.	INCONCA	J310417342	20040130000001	2009-01-01	2009-12-31	CALLE 88 ENTRE AV.9B Y 13 CASA # 10-12			\N		\N		\N		\N	\N	2004-01-30	SIEZ-2004-01-30-000001
1804	1	2	327	1	1	CONSTRUCTORA LIBARDO MOLANO,C.A.	LIMOLCA	J306046348	20040204000001	2009-01-01	2009-12-31	URB.LAS MADRINAS,VEREDA 19 CASA 02			\N		\N		\N		\N	\N	2004-02-04	SIEZ-2004-02-04-000001
1805	1	2	327	1	1	CONSTRUCCIONES BRACHO PEREIRA,C.A.	CONBRAPCA	J310509298	20040206000001	2009-01-01	2009-12-31	CALLE 69 AV. 15A # 15-85			\N		\N		\N		\N	\N	2004-02-06	SIEZ-2004-02-06-000001
1806	1	2	327	1	1	FERRE ESPECIAL,C.A.		J305910030	20040212000001	2009-01-01	2009-12-31	AV. ANDRES BELLO # 295			\N		\N		\N		\N	\N	2004-02-12	SIEZ-2004-02-12-000001
1807	1	2	327	1	1	SOUTHERN TECHNOLOGY & SERVICES DE VENEZUELA,C.A.		J310941092	20040212000002	2009-01-01	2009-12-31	AV.INTERCOMUNAL S/N			\N		\N		\N		\N	\N	2004-02-12	SIEZ-2004-02-12-000002
1808	1	2	327	1	1	INGENIERIA ZERPA & FERNANDEZ,C.A.	INZERFECA	J306271970	20040213000001	2009-01-01	2009-12-31	CALLE LA PAZ ENTRE AV.SANTA TERESA Y LIBERTAD C.C. MARIA VICTORIA LOCAL I			\N		\N		\N		\N	\N	2004-02-13	SIEZ-2004-02-13-000001
1809	1	2	327	1	1	CONSTRUCCIONES Y SUMINISTROS PEREZ-CANDIAN,C.A.	CONSUPECA	J310712395	20040216000001	2009-01-01	2009-12-31	AV.3G # 67-98 SECTOR BELLAS ARTES			\N		\N		\N		\N	\N	2004-02-16	SIEZ-2004-02-16-000001
1810	1	2	327	1	1	J.N. INGENIERIA,C.A.		J303904041	20040217000001	2009-01-01	2009-12-31	AV.28B # 58A-26			\N		\N		\N		\N	\N	2004-02-17	SIEZ-2004-02-17-000001
1811	1	2	327	1	1	SUMINISTROS TECNICOS DE MANTENIMIENTO,C.A.	SUTECMACA	J310901490	20040217000002	2009-01-01	2009-12-31	AV.CARNEVALLI EDIF.CAICO OFIC.7			\N		\N		\N		\N	\N	2004-02-17	SIEZ-2004-02-17-000002
1812	1	2	327	1	1	ARZDAL,C.A.		J305768056	20040218000001	2009-01-01	2009-12-31	AV.8 SANTA RITA C.C. LAS CAROLINAS LOCAL 8 Y 9			\N		\N		\N		\N	\N	2004-02-18	SIEZ-2004-02-18-000001
1813	1	2	327	1	1	CONSTRUCCIONES,MANTENIMIENTO,SERVICIOS Y SUMINISTROS,C.A.	COMSCA	J311051694	20040226000001	2009-01-01	2009-12-31	AV.2A EDIF.GILMAR # 85-215			\N		\N		\N		\N	\N	2004-02-26	SIEZ-2004-02-26-000001
1815	1	2	327	1	1	CONSTRUCTORA ZAMBRANO,C.A.	CONZAMCA	J307501952	20040227000001	2009-01-01	2009-12-31	RESID.EL GURI TORRE 1 APTO. 1B			\N		\N		\N		\N	\N	2004-02-27	SIEZ-2004-02-27-000001
1816	1	2	327	1	1	INVERSIONES TECNOLOGICAS,C.A.	INVERTEC	J302654840	20040301000001	2009-01-01	2009-12-31	AV.PPAL.CASTILLITO,VIA CARACAS EDIF. WALCO PUERTO ORDAZ			\N		\N		\N		\N	\N	2004-03-01	SIEZ-2004-03-01-000001
1817	1	2	327	1	1	FANSIL INVERSIONES, C.A.	FASILCA	J307491400	20040301000002	2009-01-01	2009-12-31	CALLE 59 CASA # 4-72			\N		\N		\N		\N	\N	2004-03-01	SIEZ-2004-03-01-000002
1818	1	2	327	1	1	TECNICA 2006,C.A.		J307343850	20040301000003	2009-01-01	2009-12-31	AV.3F # 58-88 GALPON DIMATCO,ANTES LA SUIZA			\N		\N		\N		\N	\N	2004-03-01	SIEZ-2004-03-01-000003
1819	1	2	327	1	1	CONSTRUCCIONES MEJIAS GELVEZ,C.A.	CONSTRUMEJICA	J307254960	20040301000004	2009-01-01	2009-12-31	AV.CIRCV.#2 C.C. LA PARAGUITA LOCAL #14			\N		\N		\N		\N	\N	2004-03-01	SIEZ-2004-03-01-000004
1820	1	2	327	1	1	INGENIERIA TECNICA,C.A.		J301761960	20040302000001	2009-01-01	2009-12-31	AV.5 DE JULIO ENTRE CALLEW 13-13A EDIF.LA CASTELLANA APTO.13B			\N		\N		\N		\N	\N	2004-03-02	SIEZ-2004-03-02-000001
1821	1	2	327	1	1	CONST.SUMINIS.PROY.DE ARQUIT.E ING.Y SERV.EN GENERAL,C.A.	CONSUPROSCA	J308972819	20040302000002	2009-01-01	2009-12-31	EDIF.GRAL.DE SEGUROS PISO 4 OFIC.46 CALLE 67 CON AV 4			\N		\N		\N		\N	\N	2004-03-02	SIEZ-2004-03-02-000002
1822	1	2	327	1	1	MANT.INGENIERIA,CONSTRUCCION E INSTRUMENTACION,C.A.	MICICA	J310138737	20040304000001	2009-01-01	2009-12-31	LAS MOROCHAS CALLE AMPARO ESQ.CALLE CARACAS			\N		\N		\N		\N	\N	2004-03-04	SIEZ-2004-03-04-000001
1823	1	2	327	1	1	HABITAT,ORGANIZACION DE CONSTRUCCION,C.A.	HABITAT	J308682012	20040308000001	2009-01-01	2009-12-31	CALLE 96 # 61-54			\N		\N		\N		\N	\N	2004-03-08	SIEZ-2004-03-08-000001
1824	1	2	327	1	1	SERVICIO AUTONOMO DE MANTENIMIENTO DEL ESTADO ZULIA	SAMEZ	G200009667	20040308000002	2009-01-01	2009-12-31	CALLE ARISMENDI			\N		\N		\N		\N	\N	2004-03-08	SIEZ-2004-03-08-000002
1825	1	2	327	1	1	SERVICIOS TECNICOS ASOCIADOS,C.A.	SERTASCA	J311074015	20040308000003	2009-01-01	2009-12-31	SECTOR 2 VEREDA 26 CASA # 05 CALLE 18			\N		\N		\N		\N	\N	2004-03-08	SIEZ-2004-03-08-000003
1826	1	2	327	1	1	OBRAS CIVILES MECANICAS Y ELECTRICAS, OCIMECA,C.A.	OCIMECA	J070433833	20040315000001	2009-01-01	2009-12-31	AV.12 ESQ.CALLE 68 # 67B-71			\N		\N		\N		\N	\N	2004-03-15	SIEZ-2004-03-15-000001
1828	1	2	327	1	1	SANTA BARBARA CONST.REP. Y SUMINISTROS,C.A.	SANTA,C.A.	J311099670	20040318000002	2009-01-01	2009-12-31	CALLE 106A CASA # 24-63			\N		\N		\N		\N	\N	2004-03-18	SIEZ-2004-03-18-000002
1829	1	2	327	1	1	CONSTRUCCIONES,SERVICIOS Y SUMINISTROS MILAGROS,C.A.	CONSERSUMCA	J311140646	20040402000001	2009-01-01	2009-12-31	CALLE 2 CASA S/N			\N		\N		\N		\N	\N	2004-04-02	SIEZ-2004-04-02-000001
1830	1	2	327	1	1	FG SERVICIOS,C.A.		J310635242	20040405000001	2009-01-01	2009-12-31	CALLE LOS DATILES # 205-A URB. MIRAFLORES			\N		\N		\N		\N	\N	2004-04-05	SIEZ-2004-04-05-000001
1831	1	2	327	1	1	INGENIERIA,CONSTRUCCIONES Y MANTENIMIENTO 93,C.A.	INCOMA 93	J301282850	20040420000001	2009-01-01	2009-12-31	AV.PPAL.DE EL LIMON N0. 291 MARACAY ESTADO ARAGUA			\N		\N		\N		\N	\N	2004-04-20	SIEZ-2004-04-20-000001
1833	1	2	327	1	1	CONSTRUCTORA COSTA DE ORO,C.A.	CONCOSOCA	J070476338	20040504000002	2009-01-01	2009-12-31	CALLEJON SOLEDAD ENTRANDO POR LA AV. 43			\N		\N		\N		\N	\N	2004-05-04	SIEZ-2004-05-04-000002
1834	1	2	327	1	1	TECNICOS EN CONSTRUCCION,C.A.	TECONCA	J311137645	20040505000001	2009-01-01	2009-12-31	AV.5 C.CALLE F EDIF.MADEIMAR LOCAL 9			\N		\N		\N		\N	\N	2004-05-05	SIEZ-2004-05-05-000001
1835	1	2	327	1	1	CONCRETERA INDUSTRIAL DE OCCIDENTE,C.A.	CIDOCA	J070111968	20040512000001	2009-01-01	2009-12-31	km.4 CARRETERA A PERIJA CALLE 69A ESQ.AV.15C N0.69A-07			\N		\N		\N		\N	\N	2004-05-12	SIEZ-2004-05-12-000001
1836	1	2	327	1	1	CONSTRUCCIONES Y MANTENIMIENTOS M & F,C.A.	M & F, C.A.	J311114963	20040512000002	2009-01-01	2009-12-31	AV.17 C.CALLE 2A EDIF. EL PARAGUALITO LOCAL 3			\N		\N		\N		\N	\N	2004-05-12	SIEZ-2004-05-12-000002
1838	1	2	327	1	1	CORPORACION MOGA,C.A.	MOGA,C.A.	J308279498	20040526000001	2009-01-01	2009-12-31	AV.74B N0. 68B-132 I ETAPA			\N		\N		\N		\N	\N	2004-05-26	SIEZ-2004-05-26-000001
1839	1	2	327	1	1	EQUIDEX V & D,S.A.		J310643440	20040527000001	2009-01-01	2009-12-31	AV.CIRCUNVALACION 2 C.C. EL DIVIDIVI LOCAL G-7			\N		\N		\N		\N	\N	2004-05-27	SIEZ-2004-05-27-000001
1840	1	2	327	1	1	EQUIPMENT & SUPPLY INTERNATIONAL,C.A.	E & S INTERNATIONAL,C.A.	J311483004	20040609000001	2009-01-01	2009-12-31	AV. 6 EDIF.SAN FRANCISCO OFICINA 5C			\N		\N		\N		\N	\N	2004-06-09	SIEZ-2004-06-09-000001
1841	1	2	327	1	1	ALIZO YELAMO INGENIERIA, C.A.		J309100220	20040610000001	2009-01-01	2009-12-31	AV.9B ENTRE CALLE 72 Y 73 EDIF.MARIA APTO 1			\N		\N		\N		\N	\N	2004-06-10	SIEZ-2004-06-10-000001
1842	1	2	327	1	1	CONSTRUCCIONES  Y SERVICIOS P & B,C.A.	CONSERCA	J311228225	20040611000001	2009-01-01	2009-12-31	CASA N0. 45-106 CALLE 159C			\N		\N		\N		\N	\N	2004-06-11	SIEZ-2004-06-11-000001
1843	1	2	327	1	1	TALLER INDUSTRIAL LA PONDEROSA,C.A.		J308762555	20040615000001	2009-01-01	2009-12-31	AV.3C EDIF. RESD.EL LAGO			\N		\N		\N		\N	\N	2004-06-15	SIEZ-2004-06-15-000001
1844	1	2	327	1	1	INVERSIONES FUENMAYOR ROSARIO,C.A.	INFUROCA,C.A.	J305946698	20040615000002	2009-01-01	2009-12-31	AV.3C EDIF.RESD.DEL LAGO			\N		\N		\N		\N	\N	2004-06-15	SIEZ-2004-06-15-000002
1845	1	2	327	1	1	TECNICA PENSA,C.A.		J002294698	20040622000001	2009-01-01	2009-12-31	CALLE 4TA. CAMPO RANCHO GRANDE NO. 76-B			\N		\N		\N		\N	\N	2004-06-22	SIEZ-2004-06-22-000001
1846	1	2	327	1	1	CONSTRUCTORA SANTO DOMINGO,C.A.		J070317949	20040622000002	2009-01-01	2009-12-31	AV.59 CASA N0. 95C-1-114 CIRCUNV.2			\N		\N		\N		\N	\N	2004-06-22	SIEZ-2004-06-22-000002
1847	1	2	327	1	1	SALUD 2000,C.A.		J306225340	20040623000001	2009-01-01	2009-12-31	AV.CARNEVALLI S/N AL LADO DE CAICOC			\N		\N		\N		\N	\N	2004-06-23	SIEZ-2004-06-23-000001
1848	1	2	327	1	1	SERVICIOS Y CONSTRUCCIONES MULTIPLES,C.A.		J305432082	20040623000002	2009-01-01	2009-12-31	CALLE 96D N0. 55B-43			\N		\N		\N		\N	\N	2004-06-23	SIEZ-2004-06-23-000002
1849	1	2	327	1	1	IMPERMIABILIZADORA OTECA C.A.	OTECA	J311400540	20040707000001	2009-01-01	2009-12-31	AV. LA LIMPIA CALLE 92-A N0.15-80			\N		\N		\N		\N	\N	2004-07-07	SIEZ-2004-07-07-000001
1850	1	2	327	1	1	ZULIANA DE SEMAFOROS, C.A.	SEMAZULIA, C.A.	J310927260	20040707000002	2009-01-01	2009-12-31	CALLE 70 ENTRE AV. 14-A Y 15 NO. 14A-117 AL LADO HOTEL GRAN DELICIAS			\N		\N		\N		\N	\N	2004-07-07	SIEZ-2004-07-07-000002
1851	1	2	327	1	1	RECOL , C.A.	RECOLCA	J311117920	20040722000001	2009-01-01	2009-12-31	C/ 95E LOCAL NO. 52-149			\N		\N		\N		\N	\N	2004-07-22	SIEZ-2004-07-22-000001
1852	1	2	327	1	1	INVERSIONES Y CONSTRUCCIONES GUICAM,C.A.	TECNO-CELL	J301808215	20040726000001	2009-01-01	2009-12-31	URB. MONTE BELLO CALLE NO. AV. 14 CASA NO. 09			\N		\N		\N		\N	\N	2004-07-26	SIEZ-2004-07-26-000001
1853	1	2	327	1	1	GRUPO RINCON CARBONELL,  COMPAÑIA ANONIMA	RCGROUP C.A.	J310523851	20040727000001	2009-01-01	2009-12-31	AV. 18  SECTOR LOS HATICOS CASA NO. 122-103			\N		\N		\N		\N	\N	2004-07-27	SIEZ-2004-07-27-000001
1854	1	2	327	1	1	ITALVI,C.A.	ITALVICA	J309496174	20040831000001	2009-01-01	2009-12-31	CALLE CENTRAL C.C. TORNILLO			\N		\N		\N		\N	\N	2004-08-31	SIEZ-2004-08-31-000001
1859	1	2	327	1	1	CONSTRUCCIONES RAVEN & ROMERO, C.A.	RAVROCA	J310781206	20040917000001	2009-01-01	2009-12-31	CALLE 77 Y 78 EDIF.BEFERCON AV.16 SECTOR 5 DE JULIO			\N		\N		\N		\N	\N	2004-09-17	SIEZ-2004-09-17-000001
1860	1	2	327	1	1	DISTRIBUIDORA Y SERVICIOS DE INGENIERIA,C.A.	DISERCA	J308231290	20040921000001	2009-01-01	2009-12-31	CALLE 62A SECTOR LA LIMPIA CASA N0. 31-164			\N		\N		\N		\N	\N	2004-09-21	SIEZ-2004-09-21-000001
1861	1	2	327	1	1	INVERSIONES Y CONSTRUCCIONES CASTILLA,C.A.	I.N.V.E.R.C.A.	J309660063	20041004000001	2009-01-01	2009-12-31	CALLE 77 AV. 5 DE JULIO EDIF. MONTIELCO OFICINA 2B			\N		\N		\N		\N	\N	2004-10-04	SIEZ-2004-10-04-000001
1862	1	2	327	1	1	CONSTRUCCIONES  E INVERSIONES J.D.,C.A.	CONINVERCA	J311137572	20041005000001	2009-01-01	2009-12-31	AV.5 CON CALLE F EDIF. MADEIMAR LOCAL 9			\N		\N		\N		\N	\N	2004-10-05	SIEZ-2004-10-05-000001
1863	1	2	327	1	1	CONSTRUCCIONES DE OBRAS RINCON,S.A.	CORINSA	J305054142	20041008000001	2009-01-01	2009-12-31	AV.13A N0. 67A-58			\N		\N		\N		\N	\N	2004-10-08	SIEZ-2004-10-08-000001
1864	1	2	327	1	1	TERRA CONSTRUCCIONES C.A.		J309647172	20041011000001	2009-01-01	2009-12-31	CALLE 70 ENTRE AV. 13 Y 13A EDIF. MI ENSUEÑO L: 18-A			\N		\N		\N		\N	\N	2004-10-11	SIEZ-2004-10-11-000001
1865	1	2	327	1	1	CONSTRUCCIONES E INVERSIONES TROCONIZ,C.A.	COINTROCA	J311719660	20041019000001	2009-01-01	2009-12-31	CIRCUNV.2 EDIF. SOL Y LUNA N0. 79-405			\N		\N		\N		\N	\N	2004-10-19	SIEZ-2004-10-19-000001
1867	1	2	327	1	1	CONSTRUCTORA LUPASA,S.A.		J090151990	20041115000001	2009-01-01	2009-12-31	AV.17 C.CALLE 2A EDIF. PARAGUANITO APTO. 24			\N		\N		\N		\N	\N	2004-11-15	SIEZ-2004-11-15-000001
1869	1	2	327	1	1	INFRAESTRUCTURA Y SERVICIOS,C.A.	INFRASERCA	J310000603	20041207000001	2009-01-01	2009-12-31	AV.8 SANTA RITA ESQ.CON CALLE 60			\N		\N		\N		\N	\N	2004-12-07	SIEZ-2004-12-07-000001
1871	1	2	327	1	1	ROUS & ASOCIADOS,C.A.		J307410965	20050118000001	2009-01-01	2009-12-31	CALLE J CASA N0. 8-28			\N		\N		\N		\N	\N	2005-01-18	SIEZ-2005-01-18-000001
1872	1	2	327	1	1	INVERSIONES VEROCA,C.A.	VEROCA	J305965161	20050125000001	2009-01-01	2009-12-31	AV.2A CASA N0. 85C-29			\N		\N		\N		\N	\N	2005-01-25	SIEZ-2005-01-25-000001
1873	1	2	327	1	1	INVERSIONES OLANO SANDOVAL,C.A.	INOLSA,C.A.	J312114134	20050203000001	2009-01-01	2009-12-31	CALLE 82 CONJ.RESID. AGUA SANTA N0. 82B-37			\N		\N		\N		\N	\N	2005-02-03	SIEZ-2005-02-03-000001
1875	1	2	327	1	1	PROYECTOS TOTALES,C.A.	PROTOCA	J312606444	20050224000001	2009-01-01	2009-12-31	CALLR 95 SECTOR CASCO CENTRAL N0. 3-68			\N		\N		\N		\N	\N	2005-02-24	SIEZ-2005-02-24-000001
1876	1	2	327	1	1	INVERSIONES Y CONSTRUCCIONES FUENMAYOR RUIZ, C.A.	ICONFUCA	J312453761	20050225000001	2009-01-01	2009-12-31	AV.9B ENTRE CALLE 72 Y 73 N0. 72-57 RESD.MARIA FERNANDA 4TO. PISO			\N		\N		\N		\N	\N	2005-02-25	SIEZ-2005-02-25-000001
1877	1	2	327	1	1	ELECT.CONST. Y MANT.DE OBRAS CIVILES EN GENERAL,C.A.	STYHCA,C.A.	J312700270	20050302000001	2009-01-01	2009-12-31	AV. 3D3 N0. 59-42			\N		\N		\N		\N	\N	2005-03-02	SIEZ-2005-03-02-000001
1879	1	2	327	1	1	CONSTRUCCIONES OBERTO RUBIO,S.A.	CORSA	J312449594	20050304000001	2009-01-01	2009-12-31	CALLE 72 CON AV.09 EDIF. YARE P.B. LOCAL 1			\N		\N		\N		\N	\N	2005-03-04	SIEZ-2005-03-04-000001
1882	1	2	327	1	1	CONSTRUCTORA COSACO,C.A.	COSACO	J070062649	20050316000001	2009-01-01	2009-12-31	AV.9B 5 DE JULIO EDIF. BANCO INDUSTRIAL PISO 1 OFIC. 1			\N		\N		\N		\N	\N	2005-03-16	SIEZ-2005-03-16-000001
1883	1	2	327	1	1	BERMUDEZ PAZ WILLIAM ENRIQUE		V049966047	20050318000001	2009-01-01	2009-12-31	CALLE 52B N0. 15P-142			\N		\N		\N		\N	\N	2005-03-18	SIEZ-2005-03-18-000001
1884	1	2	327	1	1	COMPAÑIA ANONIMA NACIONAL,TELEFONOS DE VENEZUELA	CANTV	J001241345	20050328000001	2009-01-01	2009-12-31	AV.100 CENTRO OPERATIVO CANTV PISO 2			\N		\N		\N		\N	\N	2005-03-28	SIEZ-2005-03-28-000001
1885	1	2	327	1	1	SOTO URDANETA CONSTRUCCIONES,C.A.	SURCONCA	J312606711	20050330000001	2009-01-01	2009-12-31	CALLE 77 ENTRE AV.15 Y 16 CASA N0. 15-57			\N		\N		\N		\N	\N	2005-03-30	SIEZ-2005-03-30-000001
1909	1	2	327	1	1	R.C. CONSULTORES & ASOCIADOS, C.A.		J300709019	20050609000001	2009-01-01	2009-12-31	LAGO MAR BEACH AV 15-D · 14-89			\N		\N		\N		\N	\N	2005-06-09	SIEZ-2005-06-09-000001
1911	1	2	327	1	1	CONSTRUCCIONES Y MANTENIMIENTO LUZARCA,C.A.	LUZARCA	J304354770	20050610000002	2009-01-01	2009-12-31	CALLE 67A N0.2D-150 DETRAS DEL UNICENTRO VIRGINIA URB.CREOLE SECTOR LA LAGO			\N		\N		\N		\N	\N	2005-06-10	SIEZ-2005-06-10-000002
1913	1	2	327	1	1	PAYCO PAVIMENTADORA Y CONSTRUCCIONES ,C.A.		J309514598	20050610000004	2009-01-01	2009-12-31	CARRETERA PANAMERICANA KM.686			\N		\N		\N		\N	\N	2005-06-10	SIEZ-2005-06-10-000004
1914	1	2	327	1	1	CONSTRUCTORA CM & C.A.		J306540784	20050617000001	2009-01-01	2009-12-31	CAMPO STAFF N0. 9 QTA. LOS CASTILLO			\N		\N		\N		\N	\N	2005-06-17	SIEZ-2005-06-17-000001
1915	1	2	327	1	1	SERVICIOS ELECTRICOS VENEZOLANOS C.A.	SERELVENCA	J302440025	20050621000001	2009-01-01	2009-12-31	CARRETERA J EDF.SERELVENCA CABIMAS SECTOR  NVA. ROSA			\N		\N		\N		\N	\N	2005-06-21	SIEZ-2005-06-21-000001
1916	1	2	327	1	1	CONSTRUCCIONES Y OBRAS CIVILES G Y R,C.A.		J311822895	20050628000001	2009-01-01	2009-12-31	AV.3Y ENTRE CALLES 74 Y 75 PISO 1 OFICINA 13 SECTOR SAN MARTIN			\N		\N		\N		\N	\N	2005-06-28	SIEZ-2005-06-28-000001
1917	1	2	327	1	1	SUPLIDORA CONTINENTAL,C.A.	SUPLICONCA	J070274514	20050628000002	2009-01-01	2009-12-31	AV.3Y CON ESQ.CALLE 71 EDIF.MI REINA LOCAL 1 P.B.			\N		\N		\N		\N	\N	2005-06-28	SIEZ-2005-06-28-000002
1918	1	2	327	1	1	CONSTRUCCIONES M.D.E.,C.A.		J311936580	20050630000001	2009-01-01	2009-12-31	AV.16 LA GUAJIRA C.C. PALAIMA LOCAL 1-15			\N		\N		\N		\N	\N	2005-06-30	SIEZ-2005-06-30-000001
1926	1	2	327	1	1	SERV.TRANSP.Y CONTRAT.COSTA ORIENTAL DEL LAGO, C.A. (SETRACOL)  C.A		J312739240	20050815000001	2009-01-01	2009-12-31	AV. PRINCIPAL CABIMAS SECT. LA VEREDA DIAG. CUERPO BOMBEROS			\N		\N		\N		\N	\N	2005-08-15	SIEZ-2005-08-15-000001
1927	1	2	327	1	1	CONST. DEPORTIVA DE ALTO RENDIMIENTO,C.A.	CODARCA,C.A.	J310096724	20050815000002	2009-01-01	2009-12-31	AV. 20 CON CALLE 69. C.C. LAS TEJAS LOCAL 1-9			\N		\N		\N		\N	\N	2005-08-15	SIEZ-2005-08-15-000002
1928	1	2	327	1	1	BOMDECO  C.A		J070140178	20050815000003	2009-01-01	2009-12-31	CIRCUNV. No. 2, frente a frio EDGAR, No 99-159			\N		\N		\N		\N	\N	2005-08-15	SIEZ-2005-08-15-000003
1929	1	2	327	1	1	FJL INGENIERIA,C.A.	F J L, C.A.	J307437634	20050824000001	2009-01-01	2009-12-31	AV. 11 CON CALLE 93 C.C.EMPRESAIAL LA LAGO L.1			\N		\N		\N		\N	\N	2005-08-24	SIEZ-2005-08-24-000001
1930	1	2	327	1	1	INVERSIONES Y CONSTRUCCIONES GARCIA ACOSTA,C.A.	INCOGACOSCA	J313696277	20050824000002	2009-01-01	2009-12-31	CALLE 80 SECT. VERITAS LOCAL 10A-45			\N		\N		\N		\N	\N	2005-08-24	SIEZ-2005-08-24-000002
1931	1	2	327	1	1	CONSTRUCCIONES ZAMBRANO,C.A.	CONSTRUZA, C.A.	J313667773	20050901000001	2009-01-01	2009-12-31	AV. 15 EDIFICIO LA PALMERA PISO 1 OFICINA 1-1			\N		\N		\N		\N	\N	2005-09-01	SIEZ-2005-09-01-000001
1932	1	2	327	1	1	DEGON CONSTRUCCIONES,C.A.	DEGONCA	J312540575	20050906000001	2009-01-01	2009-12-31	AV.15 LAS DELICIAS ENTRE CALLES 89 Y 89B EDIF. LA PALMERA OFICINA 2-6			\N		\N		\N		\N	\N	2005-09-06	SIEZ-2005-09-06-000001
1934	1	2	327	1	1	TELCONS  INGENIEROS, C.A.		J002681390	20050908000002	2009-01-01	2009-12-31	URB. LA GLORIA,AV.69 N. 94-132 SECTOR PEDREGAL			\N		\N		\N		\N	\N	2005-09-08	SIEZ-2005-09-08-000002
1936	1	2	327	1	1	GARCA CONSTRUCCIONES Y SERVICIOS,C.A.		J312834269	20050909000002	2009-01-01	2009-12-31	AV.3Y SAN MARTIN CON CALLE 78 C.C. SALTO ANGEL OFIC.27			\N		\N		\N		\N	\N	2005-09-09	SIEZ-2005-09-09-000002
1937	1	2	327	1	1	PROYECTOS Y SERVICIOS, C.A.	PROSCA	J311501800	20050913000001	2009-01-01	2009-12-31	AV. 24A B-12 83B-12 PRIMERO DE MAYO			\N		\N		\N		\N	\N	2005-09-13	SIEZ-2005-09-13-000001
1938	1	2	327	1	1	CONSTRUCCIONES E INGENIERIA PETIT, C.A.	CONINGPET, C.A.	J311370668	20050915000001	2009-01-01	2009-12-31	AV. PPL. LA POMONA, URB. EL PINAR, EDIF. PINO BANK 1, P-1, APART. 1-B.			\N		\N		\N		\N	\N	2005-09-15	SIEZ-2005-09-15-000001
1939	1	2	327	1	1	CORPORACIÓN NACIONAL DE CONSTRUCCIÓN, C. A.	C.N.C., C.A.	J070429461	20050919000001	2009-01-01	2009-12-31	ZONA INDUSTRIAL DE MARACAIBO AV. 60 II 59-175			\N		\N		\N		\N	\N	2005-09-19	SIEZ-2005-09-19-000001
1940	1	2	327	1	1	TECNICA DE PROY. Y CONSTRUCCIONES Z & R, C. A.	TEPROCON Z & R, C.A.	J070428210	20050921000001	2009-01-01	2009-12-31	CALLE PROGRESO Nº 30B			\N		\N		\N		\N	\N	2005-09-21	SIEZ-2005-09-21-000001
1942	1	2	327	1	1	CONSTRUCCIONES ALYON,C.A.		J312724323	20050923000002	2009-01-01	2009-12-31	CALLE LARA, CASA N0. 182			\N		\N		\N		\N	\N	2005-09-23	SIEZ-2005-09-23-000002
1944	1	2	327	1	1	CELOR,C.A.		J090103783	20051004000001	2009-01-01	2009-12-31	SECTOR RIO FRIO HACIENDA LA TRINIDAD			\N		\N		\N		\N	\N	2005-10-04	SIEZ-2005-10-04-000001
1945	1	2	327	1	1	CONSTRUCTORA MAER,C.A.	MAERCA	J314017888	20051007000001	2009-01-01	2009-12-31	AV.4 CASA N0. 78A-100			\N		\N		\N		\N	\N	2005-10-07	SIEZ-2005-10-07-000001
1946	1	2	327	1	1	SUMINISTROS SERVICIOS INDUSTRIALES ,C.A,	SUSERINCA	J307408600	20051017000001	2009-01-01	2009-12-31	CALLE 66 ENTRE AV.13A Y 14B N0. 13A-47 URB. MARACAIBO			\N		\N		\N		\N	\N	2005-10-17	SIEZ-2005-10-17-000001
1947	1	2	327	1	1	VENEZOLANA DE LA CONSTRUCCION,C.A.	VENECON,C.A.	J309435272	20051018000001	2009-01-01	2009-12-31	CALLE 77 ENTRE AV.15 Y14 EDIF.5 DE JULIO OFIC.B-12 MARACAIBO EDO. ZULIA			\N		\N		\N		\N	\N	2005-10-18	SIEZ-2005-10-18-000001
1954	1	2	327	1	1	SERVICIOS SOCOAVO, C.A.	SOCOAVOCA	J307192704	20051117000001	2009-01-01	2009-12-31	CALLE 89 SECTOR BELLOSO Nº 10-140			\N		\N		\N		\N	\N	2005-11-17	SIEZ-2005-11-17-000001
1955	1	2	327	1	1	PROYECTOS, INSTALACIONES, SERVICIOS Y MANTENIMIENTO PRISMA,C.A.	PRISMA C.A.	J312746408	20051125000001	2009-01-01	2009-12-31	AV.72 CON CALLE 77 #77-07 LA LIMPIA			\N		\N		\N		\N	\N	2005-11-25	SIEZ-2005-11-25-000001
1957	1	2	327	1	1	INGENIERIA DE SERVICIOS Y MANTENIMIENTO,C.A.	INSERMANCA	J303731252	20051130000002	2009-01-01	2009-12-31	CALLE 75 ESQ. AV. 3G EDIF. LUNA OFICINA -A P.B.			\N		\N		\N		\N	\N	2005-11-30	SIEZ-2005-11-30-000002
1958	1	2	327	1	1	L. C. DISEÑOS INGENIERIA E INSPECCIONES, C.A.	L.C., CA	J302882940	20051201000001	2009-01-01	2009-12-31	AV. 28B Nº 61 A-85 LA LIMPIA			\N		\N		\N		\N	\N	2005-12-01	SIEZ-2005-12-01-000001
1959	1	2	327	1	1	CONSTRUCCIONES Y SERVICIOS GELMAC, C.A.		J312571748	20051205000001	2009-01-01	2009-12-31	C.C. CARIBE ZULIA AV. 11 Y 12 CON  CALLE 96 Y 97 NIVEL SOTANO OFICINA 01			\N		\N		\N		\N	\N	2005-12-05	SIEZ-2005-12-05-000001
1963	1	2	327	1	1	CONSTRUCTORA SUPLIDORA MUNDIAL, C.A.	CONSUMUNCA	J309830902	20051213000001	2009-01-01	2009-12-31	AV. 14A CON CALLE 67 CECILIO ACOSTA SECTOR TIERRA NEGRA CASA Nº 66-111			\N		\N		\N		\N	\N	2005-12-13	SIEZ-2005-12-13-000001
1964	1	2	327	1	1	COMPAÑIA VENEZOLANA DE CONSTRUCCION, C.A.		J310547548	20051216000001	2009-01-01	2009-12-31	AV 10 C/C  61 CC PALAFITO SHOPING CENTER OFIC 2A-2B			\N		\N		\N		\N	\N	2005-12-16	SIEZ-2005-12-16-000001
1965	1	2	327	1	1	FACOA COMPAÑIA ANONIMA		J300603016	20051221000001	2009-01-01	2009-12-31	AV. PARQUE C/C ALEJO ZULUAGA URB TRIGAL CENTRO ITALO VICTOR			\N		\N		\N		\N	\N	2005-12-21	SIEZ-2005-12-21-000001
1967	1	2	327	1	1	CONSTRUCTORA AMCO 1995, C.A.		J302854083	20060109000001	2009-01-01	2009-12-31	CALLE VILLAFLOR CENTRO PROFESIONAL ESTE PISO 9 OFIC 93 SABANA GRANDE			\N		\N		\N		\N	\N	2006-01-09	SIEZ-2006-01-09-000001
1968	1	2	327	1	1	CONSTRUCCIONES Y SERVICIOS GAMMA, C.A.	GAMMA, C.A.	J314640984	20060118000001	2009-01-01	2009-12-31	CIRCUNVALACION 2 SECTOR SAN RAFAEL N 99-159 EDIF MANDECO.			\N		\N		\N		\N	\N	2006-01-18	SIEZ-2006-01-18-000001
1969	1	2	327	1	1	INGENIERIA ALFA-ONIA, C.A.		J312008032	20060120000001	2009-01-01	2009-12-31	EDIF GLORIA APART N 6 AV. BOLIVAR EL VIGIA EDO MERIDA/ LOS PUERTOS DE ALTAGRACIA SECTOR LA SALINA DEL SUR CALLE LA TUBERIA N 70			\N		\N		\N		\N	\N	2006-01-20	SIEZ-2006-01-20-000001
1970	1	2	327	1	1	TRANSPORTE  SANTA MARIA, C.A.	TRANSAMARCA	J070310197	20060123000001	2009-01-01	2009-12-31	AV. INTERCOMUNAL SECTOR R-5 VIA CABIMAS-LAGUNILLAS			\N		\N		\N		\N	\N	2006-01-23	SIEZ-2006-01-23-000001
1972	1	2	327	1	1	VENEZOLANA DE CLORO, C.A.	VENCLORO	J070460113	20060125000001	2009-01-01	2009-12-31	CALLE 148, ENTRE AV. 85 Y 87 Nº 85-60			\N		\N		\N		\N	\N	2006-01-25	SIEZ-2006-01-25-000001
1974	1	2	327	1	1	INVERSIONES ENDELST. C.A.	INVENCA	J070426195	20060126000002	2009-01-01	2009-12-31	AV. 4 BELLA VISTA CON CALLE 67 CECILIO ACOSTA			\N		\N		\N		\N	\N	2006-01-26	SIEZ-2006-01-26-000002
1975	1	2	327	1	1	SERVI CONSTRUCCIONES F.A.R. C.A.	SCFARCA	J307518413	20060130000001	2009-01-01	2009-12-31	CALLE 79N SECTOR PARAISO			\N		\N		\N		\N	\N	2006-01-30	SIEZ-2006-01-30-000001
1976	1	2	327	1	1	ZULIANA DE OBRAS, MANT., INV. Y SUMINISTRO, C.A.	ZOMISCA	J314741250	20060217000001	2009-01-01	2009-12-31	AV. 13 LOS ANDES SECTOR BELLOSO CASA Nº 90-69			\N		\N		\N		\N	\N	2006-02-17	SIEZ-2006-02-17-000001
1977	1	2	327	1	1	INVERSIONES, CONSTRUCCIONES Y SERVICIOS ALFA, C.A.	ISCA, C.A.	J314741322	20060217000002	2009-01-01	2009-12-31	AV. 20H BARRIO LA CHINITA SECTOR HATICOS Nº 113A-31			\N		\N		\N		\N	\N	2006-02-17	SIEZ-2006-02-17-000002
1978	1	2	327	1	1	CONSTRUCCIONES R & M, C.A.		J070495120	20060221000001	2009-01-01	2009-12-31	AV. GOAJIRA C.C. PALAIMA PISO 1 LOCAL 1-4			\N		\N		\N		\N	\N	2006-02-21	SIEZ-2006-02-21-000001
1980	1	2	327	1	1	ORGANIZACION PRODECA COMPAÑIA ANONIMA	PRODECA	J314641549	20060302000001	2009-01-01	2009-12-31	CALLE 56 CIRCUNVALACION 2 LA PARAGUA CC LA PARAGUA LOCAL SE-35			\N		\N		\N		\N	\N	2006-03-02	SIEZ-2006-03-02-000001
1981	1	2	327	1	1	INVERSIONES Y CONSTRUCCIONES L & S COMPAÑIA ANONIMA		J300890198	20060303000001	2009-01-01	2009-12-31	LA CONCEPCION CARRETERA PRINCIPAL VIA MARA CAMPO E`LATA EDIFICIO 134			\N		\N		\N		\N	\N	2006-03-03	SIEZ-2006-03-03-000001
1982	1	2	327	1	1	SISTEMAS, DISEÑOS Y CONSTRUCCIONES C.A	S, D&C, C.A.	J309868497	20060314000001	2009-01-01	2009-12-31	CALLE 75 ENTRE AV. 13 Y 13A SECTOR TIERRA NEGRA EDIF. SANTA LUCIA OFIC. 3B			\N		\N		\N		\N	\N	2006-03-14	SIEZ-2006-03-14-000001
1983	1	2	327	1	1	INVERSIONES DIANA ANGEL (INDIANGEL), COMPAÑIA ANONIMA		J307074680	20060317000001	2009-01-01	2009-12-31	CONJUNTO RESIDENCIAL TIERRA NORTE EDIFICIO 10 PB-B			\N		\N		\N		\N	\N	2006-03-17	SIEZ-2006-03-17-000001
1985	1	2	327	1	1	INGENIERIA VILLALOBOS EMONET C.A.	IVE C.A.	J070448210	20060323000002	2009-01-01	2009-12-31	AV. 6 SAN FCO. SECTOR SAN RAMON EDIF. RESD SAN JORGE APART 1B			\N		\N		\N		\N	\N	2006-03-23	SIEZ-2006-03-23-000002
1988	1	2	327	1	1	SUMINISTROS Y SERVICIOS WOLCLEM, C.A.	SUSERWOLCLEMCA	J307662492	20060327000002	2009-01-01	2009-12-31	AV. 19 CALLE 8 CALLE 8-23			\N		\N		\N		\N	\N	2006-03-27	SIEZ-2006-03-27-000002
1989	1	2	327	1	1	MULTISERVICIOS DE INGENIERIA, C.A.		J309729713	20060327000003	2009-01-01	2009-12-31	PASEO 72 AV 15 DELICIAS CC PASEO 72 OFIC. 18.			\N		\N		\N		\N	\N	2006-03-27	SIEZ-2006-03-27-000003
1990	1	2	327	1	1	CONSTRUCCIONES OLAVE, COMPAÑIA ANONIMA	CONSOLCA	J070279796	20060329000001	2009-01-01	2009-12-31	CALLE 53-B URB LA TRINIDAD CASA N 15-066			\N		\N		\N		\N	\N	2006-03-29	SIEZ-2006-03-29-000001
1991	1	2	327	1	1	INVERSIONES R Y L COMPAÑIA ANONIMA		J306765514	20060109000002	2009-01-01	2009-12-31	CALLE 64A URB MARACAIBO N 12 121 12-121 QUINTA NEY VIC			\N		\N		\N		\N	\N	2006-01-09	SIEZ-2006-01-09-000002
1992	1	2	327	1	1	H & Y CONSTRUCCIONES Y SUMINISTROS C.A.	HYCONSUCA	J313935522	20060331000001	2009-01-01	2009-12-31	AV. 19 LOS HATICOS POR ARRIBA Nº 114-78. SECTOR CORITO.			\N		\N		\N		\N	\N	2006-03-31	SIEZ-2006-03-31-000001
1993	1	2	327	1	1	ASCENSORES METROPOLIS,C.A.		J303225578	20060331000002	2009-01-01	2009-12-31	AV.5DE JULIO CON CALLE72 C.C. MONTIELCO LOCAL 18			\N		\N		\N		\N	\N	2006-03-31	SIEZ-2006-03-31-000002
1994	1	2	327	1	1	SERVICIO TOTAL DE INGENIERIA, C.A.	SETINCA	J301291506	20060417000001	2009-01-01	2009-12-31	URB. LA CALIFORNIA C 50 Nº 15A-125			\N		\N		\N		\N	\N	2006-04-17	SIEZ-2006-04-17-000001
1995	1	2	327	1	1	CONSTRUCCIONES NEON, C.A.		J311950680	20060417000002	2009-01-01	2009-12-31	URB. LA MARINA CALLE O3 SECTOR SAN JACINTO BLOQE 14 RESD. 01 LOCAL 01-02			\N		\N		\N		\N	\N	2006-04-17	SIEZ-2006-04-17-000002
1996	1	2	327	1	1	SERVICIOS LEAL COMPAÑIA ANONIMA	SERLECA	J070480084	20060420000001	2009-01-01	2009-12-31	CALLEJON BOLIVAR CON CALLE SUCRE, CASCO CENTRAL CASA S/N			\N		\N		\N		\N	\N	2006-04-20	SIEZ-2006-04-20-000001
1997	1	2	327	1	1	INVERSIONES Y CONSTRUCCIONES REAL, C.A.	INCORECA	J309300520	20060424000001	2009-01-01	2009-12-31	AV. 1A Nº 4-197 SECTOR SAN ANDRES.			\N		\N		\N		\N	\N	2006-04-24	SIEZ-2006-04-24-000001
1998	1	2	327	1	1	CAÑO NEGRO SERVICIOS , C.A. CANECA		J305551081	20060426000001	2009-01-01	2009-12-31	AV. 15 DELICIAS RES JUANA DE AVILA PISO 11 APT K1			\N		\N		\N		\N	\N	2006-04-26	SIEZ-2006-04-26-000001
1999	1	2	327	1	1	MANTENIMIENTO ESPECIALIZADO DEL ZULIA C.A.	MANTEZUL	J311770984	20060503000001	2009-01-01	2009-12-31	EDIF. KALUA AV. 8 STA. RITA C/ CALLE 78 LOCAL 3			\N		\N		\N		\N	\N	2006-05-03	SIEZ-2006-05-03-000001
2008	1	2	327	1	1	PROYECTOS Y CONSTRUCCIONES DE VENEZUELA, C.A.	P & C, C.A.	J311934820	20060612000002	2009-01-01	2009-12-31	AV. 8 STA RITA,C.C. LAS CAROLINAS MEZANINE LOCAL 8 Y 9			\N		\N		\N		\N	\N	2006-06-12	SIEZ-2006-06-12-000002
641	1	2	327	1	1	PROYECTOS Y CONSTRUCCIONES ELI,	PROCONELICA	J307392118	20010808000001	2009-01-01	2009-12-31	AV.3C.C.1 SAN CARLOS DEL ZULIA C.C.LIMA P/1			\N		\N		\N		\N	\N	2006-06-27	SIEZ-2006-06-27-000003
2019	1	2	327	1	1	PROYECTO MARINA,  C.A	MARINA`S	J315390531	20060704000001	2009-01-01	2009-12-31	CALLE 72  SECTOR PARAISO EDIF. MIX  MONTIELCO LOCAL N. 20-22			\N		\N		\N		\N	\N	2006-07-04	SIEZ-2006-07-04-000001
2020	1	2	327	1	1	PULIRE SERVICIOS, COMPAÑIA   ANONIMA	PULISERVI,C.A	J308905291	20060706000001	2009-01-01	2009-12-31	KM 4 1/2 VIA A LA CAÑADA AL LADO DEL  CENTRO COMERCIAL FORCAREX			\N		\N		\N		\N	\N	2006-07-06	SIEZ-2006-07-06-000001
2022	1	2	327	1	1	CONSTRUCCIONES E INVERSIONES PARAISO  C.A	CIPACA	313697125	20060712000001	2009-01-01	2009-12-31	CALLE 61 AVE. UNIVERSIDAD C.C VILLA NUEVA PISO 1 LOCAL 8			\N		\N		\N		\N	\N	2006-07-12	SIEZ-2006-07-12-000001
2023	1	2	327	1	1	CONSTRUCCIONES ESCOBAR MAVAREZ MAVARES, C.A	CEMM, C.A	304865708	20060721000001	2009-01-01	2009-12-31	AV 24 ENTRE D Y E SECTOR BARRIO UNION S/N TIA JUANA			\N		\N		\N		\N	\N	2006-07-21	SIEZ-2006-07-21-000001
2041	1	2	327	1	1	CONSTRUCCIONES JAIMEN URDANETA C.A.	CONSJUCA	J306153446	20060922000002	2009-01-01	2009-12-31	CALLE 4 MANZANA NO. 7 URB. LAS 40 CASA NO. 34 PQUIA. CARMEN HERRERA			\N		\N		\N		\N	\N	2006-09-22	SIEZ-2006-09-22-000002
2044	1	2	327	1	1	INVERSIONES Y CONTRUCCIONES CANTABRICO, S.A.	INCOARSA	J312855142	20060925000002	2009-01-01	2009-12-31	CALLE MUNICIPAL. CASCO CENTRAL, CASA No. 91. LA VILLA DEL ROSARIO. EDO. ZULIA.			\N		\N		\N		\N	\N	2006-09-25	SIEZ-2006-09-25-000002
2063	1	2	327	1	1	PROMOCIONES 2004, C.A.	PROMOCIONES 2004	J311220127	20061207000001	2009-01-01	2009-12-31	CIRCUNVALACION 2 CENTRO DE CONVERSIONES DE MARACAIBO LOCAL 54			\N		\N		\N		\N	\N	2006-12-07	SIEZ-2006-12-07-000001
936	1	2	327	1	1	SUMINISTROS CONSTRUCCIONES Y MANTENIMIENTOS EL MENITO, C.A.	SUCOMECA	J304097883	19990322000027	2009-01-01	2009-12-31	AV.18 E/C 78/79 EDIF.IMAR LOCAL NO.4			\N		\N		\N		\N	\N	1999-03-22	SIEZ-1999-03-22-000027
937	1	2	327	1	1	DESARROLLOS, PROYECTOS, INGENIERIA, CONSTRUCCIONES, C.A.	D.P.I. CONSTRUCCIONES, C.A.	J305641269	19990324000087	2009-01-01	2009-12-31	CALLE 55 ENTRE AV.15 Y 15B NO.55-80 PROLON			\N		\N		\N		\N	\N	1999-03-24	SIEZ-1999-03-24-000087
938	1	2	327	1	1	INVERSIONES, MANTENIMIENTO DE PROYECTOS VIALES C.A.	IMPROVIALCA	J307704195	20010316000003	2009-01-01	2009-12-31	TORRE 77  EDIF. 5 DE JULIO PISO 13			\N		\N		\N		\N	\N	2001-03-16	SIEZ-2001-03-16-000003
1461	1	2	327	1	1	INVERSIONES Y DESARROLLOS LOS CEDROS I,C.A.		J304033516	20010321000002	2009-01-01	2009-12-31	CALLE CARRILLO N0. 0-8			\N		\N		\N		\N	\N	2001-03-21	SIEZ-2001-03-21-000002
2087	1	2	327	1	1	CONSTRUCCIONES Y SERVICIOS G& V COMPAÑIA ANONIMA	CONGEVECA	J308203149	20070320000001	2009-01-01	2009-12-31	SECTOR BELLA VISTA, CALLE  72  ENTRE AV. 4 Y 8 CLODOMIRA LOCAL 2-10			\N		\N		\N		\N	\N	2007-03-20	SIEZ-2007-03-20-000001
2093	1	2	327	1	1	GRUPO EMPRESARIAL LA ARBOLEDA, C.A.		J314984098	20070410000001	2009-01-01	2009-12-31	CARRETERA HURB. LOS LAURELES, EDIF. LA ARBOLEDA, Nª 421, OFI. 1			\N		\N		\N		\N	\N	2007-04-10	SIEZ-2007-04-10-000001
2094	1	2	327	1	1	TRANSPORTE Y SERVICIOS DE MANTENIMIENTO C.A.	TRANSERMACA	J306945954	20051130000003	2009-01-01	2009-12-31	CALLE 90 No. 3-45 SECTOR SANTA LUCIA			\N		\N		\N		\N	\N	2005-11-30	SIEZ-2005-11-30-000003
2095	1	2	327	1	1	GEMA CONSTRUCCION C.A.		J301571886	20070412000001	2009-01-01	2009-12-31	URB. CANTA CLARO, AV. 11 C, CASA NO. 52-298			\N		\N		\N		\N	\N	2007-04-12	SIEZ-2007-04-12-000001
2096	1	2	327	1	1	INVERSIONES 1990, C.A.		J312499834	20070417000001	2009-01-01	2009-12-31	AV. 9 B, con calle 68 sector tierra negra No- 9B-08			\N		\N		\N		\N	\N	2007-04-17	SIEZ-2007-04-17-000001
2097	1	2	327	1	1	CONSTRUCCIONES LAGO COMPAÑIA ANONIMA	CONLACA	J293830516	20070426000001	2009-01-01	2009-12-31	SECTOR TIERRA NEGRA,AV,13 CON CALLE PROFESIONAL WIDASG,NIVEL 1,LOCAL 2.			\N		\N		\N		\N	\N	2007-04-26	SIEZ-2007-04-26-000001
2128	1	2	327	1	1	IMPORTACIONES Y SERVICIOS. C.A	IMPROSER,C.A	J305660115	20071004000001	2009-01-01	2009-12-31	AV. 4 BELLA VISTA CON CALLE 67 CECILIO ACOSTA., EDIF BLITZ, PRIMER PISO, OFIC 3			\N		\N		\N		\N	\N	2007-10-04	SIEZ-2007-10-04-000001
2132	1	2	327	1	1	SUMINISTROS TAMARE,COMPAÑIA ANONIMA	SUTACA	J306476628	20071120000001	2009-01-01	2009-12-31	SECTOR TASAJERA, AV. INTERCOMUNAL, ENTRE O Y P			\N		\N		\N		\N	\N	2007-11-20	SIEZ-2007-11-20-000001
2134	1	2	327	1	1	ASOCIACION COOPERATIVA H-G-M	H-G-M	J315386372	20071121000002	2009-01-01	2009-12-31	SECTOR INDIO MARA AV. 21 CALLE 69 N. 69-60			\N		\N		\N		\N	\N	2007-11-21	SIEZ-2007-11-21-000002
2144	1	2	327	1	1	DEMARCACIONES Y SEÑALIZACIONES OCCIDENTE C.A	DEMARCA, C.A	J29412910 2	20080131000003	2009-01-01	2009-12-31	CALLE 65 C. EDIF ORITUCO PISO 7 APTO 7-D URB CIUDAD DE LA FARIA			\N		\N		\N		\N	\N	2008-01-31	SIEZ-2008-01-31-000003
2146	1	2	327	1	1	SERVICIOS, CONSTRUCCIONES Y MANTENIMIENTO VALENTY C.A.		J316473694	20080201000002	2009-01-01	2009-12-31	EL MOJAN SECTOR MONTE VERDE. C.C. SAN RAFAEL			\N		\N		\N		\N	\N	2008-02-01	SIEZ-2008-02-01-000001
2153	1	2	327	1	1	CONSTRUCTORA P Y M DEL ZULIA, C.A.	P Y M DEL ZULIA, C.A.	J070526718	20080303000001	2009-01-01	2009-12-31	MARACAIBO			\N		\N		\N		\N	\N	2008-03-03	SIEZ-2008-03-03-000001
2155	1	2	327	1	1	CONSTRUCCIONES H-M, C.A.		J306446397	20080307000001	2009-01-01	2009-12-31	AV. 41 SECTOR LR CASA Nº 2 VIA LAGUNILLAS			\N		\N		\N		\N	\N	2008-03-07	SIEZ-2008-03-07-000001
2156	1	2	327	1	1	CONSTRUCCIONES, MANTENIMIENTO, INSPECCIONES  E INVERSIONES C.A.	C & M C.A.	J314376551	20080310000001	2009-01-01	2009-12-31	URB. ALTOS DEL SOL AMADA 1ERA. ETAPA AV. BARALT No. 280			\N		\N		\N		\N	\N	2008-03-10	SIEZ-2008-03-10-000001
2157	1	2	327	1	1	CORPORACION LYNQUS C.A.		J311708650	20080314000001	2009-01-01	2009-12-31	EDIF. REGIONAL PISO 2			\N		\N		\N		\N	\N	2008-03-14	SIEZ-2008-03-14-000001
2158	1	2	327	1	1	SERVICIOS DE INGENIERIA, PROCURA Y CONSTRUCCION DE OBRAS, C.A.	SIPCA	J294438814	20080317000001	2009-01-01	2009-12-31	URB. JUANA DE AVILA, AV. 15C # 66C-46			\N		\N		\N		\N	\N	2008-03-17	SIEZ-2008-03-17-000001
2185	1	2	327	1	1	DALTON  SERVICIOS Y CONSTRUCCIONES  C.A	DALTON, C.A	J314645277	20080603000001	2009-01-01	2009-12-31	AV. 20  N. 51 KA CHINITA 113 A 31			\N		\N		\N		\N	\N	2008-06-03	SIEZ-2008-06-03-000001
1889	1	2	327	1	1	SILICE,C.A.		J312428350	20050407000001	2009-01-01	2009-12-31	CALLE 84 CON CARRETERA UNION CASA N0. 3A-55			\N		\N		\N		\N	\N	2005-04-07	SIEZ-2005-04-07-000001
2189	1	2	327	1	1	CONSTRUCTORA L.F.N  C.A		J309628496	20080606000002	2009-01-01	2009-12-31	AV. 3 N. 86A-O4  VALLE FRIO			\N		\N		\N		\N	\N	2008-06-06	SIEZ-2008-06-06-000002
2191	1	2	327	1	1	INVERSIONES OMER Y DOUGLAS  C.A	INODCA	J307003448	20080611000001	2009-01-01	2009-12-31	KM 1 VIA PERIJA, HOSPITAL GENERAL DEL SUR			\N		\N		\N		\N	\N	2008-06-11	SIEZ-2008-06-11-000001
2192	1	2	327	1	1	J.G CONST MANTENIMIENTO Y SERVICIO  C.A	J.G COMASE. C.A	J301660382	20080611000002	2009-01-01	2009-12-31	AV. 19 HATICOS POR ARRIBA N. 111 -32 AL LADO DE REFRILEC			\N		\N		\N		\N	\N	2008-06-11	SIEZ-2008-06-11-000002
2196	1	2	327	1	1	CONSTRUCCIONES BARRIO MORAN, C.A		J300639002	20080625000001	2009-01-01	2009-12-31	AV. 6 BELLAVISTA CENTRO COMERCIAL SIGMA PISO 2 EDIF 2B			\N		\N		\N		\N	\N	2008-06-25	SIEZ-2008-06-25-000001
2204	1	2	327	1	1	CONSTRUCCIONES E INVERSIONES PAZ, C.A	CONPACA	J.294950736	20080718000001	2009-01-01	2009-12-31	Av. 67-A, No. 78A-5. Urb. La Victoria			\N		\N		\N		\N	\N	2008-07-18	SIEZ-2008-07-18-000001
2206	1	2	327	1	1	CONSTRUCCIONES Y PROYECTOS DEL ZULIA, C.A.	CONSPROZUCA	J316718204	20080721000001	2009-01-01	2009-12-31	Av. El Milagro, C.C. Caribe, piso 2, oficina No. 2.			\N		\N		\N		\N	\N	2008-07-21	SIEZ-2008-07-21-000001
2209	1	2	327	1	1	COOPERATIVA LA FORTALEZA DE NUESTROS HIJOS 971, R.S		J296054940	20080811000001	2009-01-01	2009-12-31	URBA VILLA SAN JOSE CALLE 96-A N. 160			\N		\N		\N		\N	\N	2008-08-11	SIEZ-2008-08-11-000001
2210	1	2	327	1	1	QUIVA Y GALBAN CONSTRUCTORES ASOCIADOS,S.A	QUIBANCASA	J315022842	20080815000001	2009-01-01	2009-12-31	Calle 77, Edificio BHV, Mezanina 1 Zona, Sector 5 de Julio			\N		\N		\N		\N	\N	2008-08-15	SIEZ-2008-08-15-000001
2211	1	2	327	1	1	INVERSIONES & CONSTRUCCIONES GRECIA, C.A	INGRECA	J295673345	20080815000002	2009-01-01	2009-12-31	Calle 79, Dr. Quintero, Entre Av. 9 y 9B, C.C. Odepal, Local 4.			\N		\N		\N		\N	\N	2008-08-15	SIEZ-2008-08-15-000002
2213	1	2	327	1	1	A & N ASESORES, MANTENIMIENTO Y SERVICIOS COMPAÑIA ANONIMA		J311074554	20080829000001	2009-01-01	2009-12-31	Centro Comercial Internacional, Local No. 1, Planta Baja, Cabimas, Estado Zulia			\N		\N		\N		\N	\N	2008-08-29	SIEZ-2008-08-29-000001
2214	1	2	327	1	1	INGENIERIA RINCON NOGUERA, C.A	I-RINO, C.A	J312565527	20080901000001	2009-01-01	2009-12-31	Carretara Santa Barbara El Vigia, Urb. La Maroma, Casa A-096, Avenida 2.			\N		\N		\N		\N	\N	2008-09-01	SIEZ-2008-09-01-000001
2221	1	2	327	1	1	CONSTRUCTORA SANTA MARTA C.A.		J070222069	20080625000003	2009-01-01	2009-12-31	CALLE 96J CON AV. 57-A No. 57-10 BARRIO ANDRES ELOY BLANCO			\N		\N		\N		\N	\N	2008-06-25	SIEZ-2008-06-25-000003
461	1	2	327	1	1	INGENIERIA,PREFABRICADOS Y CONSTRUCCION,C.A.	INPRECO,C.A.	J306032622	20001214000001	2009-01-01	2009-12-31	AV.22 SABANETA GALPON 3			\N		\N		\N		\N	\N	2000-12-14	SIEZ-2000-12-14-000001
2230	1	2	327	1	1	INVERSIONES R & R 3000  C.A	INVERCA	J314831119	20081110000001	2009-01-01	2009-12-31	CALLE 59 A N. 4-30 SECTOR LAS MERCEDES			\N		\N		\N		\N	\N	2008-11-10	SIEZ-2008-11-10-000001
2231	1	2	327	1	1	INGENERIA GONZALEZ . C.A	INGONCA	J307138505	20081112000001	2009-01-01	2009-12-31	EDIF BANCO CARACAS 1 PISO OFIC 1-A			\N		\N		\N		\N	\N	2008-11-12	SIEZ-2008-11-12-000001
1478	1	2	327	1	1	ELECTRIFICACIONES Y CONSTRUCCIONES NEGRON,C.A.	ELECNECA	J305440034	20010628000001	2009-01-01	2009-12-31	CALLE LA MARINA N0-127 MACHIQUES			\N		\N		\N		\N	\N	2001-06-28	SIEZ-2001-06-28-000001
1479	1	2	327	1	1	INVERSIONES ROMAVA,C.A.		J300999980	20010801000000	2009-01-01	2009-12-31	AV.GONZALO PICON,QUINTA TRINIDAD PLANTA ALTA,EDO.MERIDA			\N		\N		\N		\N	\N	2001-08-01	SIEZ-2001-08-01-000000
2233	1	2	327	1	1	CONTINENTAL CONSTRUCCIONES Y SERVICIOS, COMPAÑIA ANONIMA	CONTINENTAL, C.A.	J295568487	20081215000001	2009-01-01	2009-12-31	SECTOR CERRO ALTO, CARRETERA MACHIQUES-COLON, EDIFICIO MAQUINARIAS R Y S			\N		\N		\N		\N	\N	2008-12-15	SIEZ-2008-12-15-000001
2099	1	2	327	1	1	MANUEL  LOPEZ & ASOCIODOS, C.A	MALOASCA	J312258055	20070514000001	2009-01-01	2009-12-31	BOLIVAR AV. CALLE 99C N. 257			\N		\N		\N		\N	\N	2007-05-14	SIEZ-2007-05-14-000001
741	1	2	327	1	1	SERVICIOS DE CONTABILIDAD E INGENIERIA SERRANO ARENAS C.A.	SERVICONTINSE C.A.	J070419016	20010622000000	2009-01-01	2009-12-31	URB. MONTE BELLO CALLE ÑO NO. 11-27 ENTRE AV. 10 Y 11 MCBO.			\N		\N		\N		\N	\N	2001-06-22	SIEZ-2001-06-22-000000
742	1	2	327	1	1	CONSTRUCCIONES Y ELECTRIFICACIONES R.H.,C.A.	CONSELEC,R.H.,C.A.	J307890770	20020219000000	2009-01-01	2009-12-31	CALLE 71B N0. 27-100 SECTOR SANTA MARIA			\N		\N		\N		\N	\N	2002-02-19	SIEZ-2002-02-19-000000
744	1	2	327	1	1	INGENIERIA MULTIPLE ASOCIADOS,C.A.	IMACA	J070453940	20010831000000	2009-01-01	2009-12-31	CALLE DONALDO GARCIA,DIAG. FERRETERIA LA CONFIANZA.			\N		\N		\N		\N	\N	2001-08-31	SIEZ-2001-08-31-000000
745	1	2	327	1	1	GLOBEX,C.A.	GLOBEX,C.A.	J307272864	20001220000000	2009-01-01	2009-12-31	C.C.SALTO ANGEL L.27 AV. 3Y C.CALLE 78 Y 79			\N		\N		\N		\N	\N	2000-12-20	SIEZ-2000-12-20-000000
492	1	2	327	1	1	CONSTRUCCIONES Y MANTENIMIENTO DE OBRAS ELECTRICAS Y CIVILES	COMEC C.A.	J300141730	19990422000062	2009-01-01	2009-12-31	CARRETERA L ENTRE 33/34 CAMPO LINDO CABIMAS			\N		\N		\N		\N	\N	1999-04-22	SIEZ-1999-04-22-000062
497	1	2	327	1	1	MAXIMILIANO CONSTRUCCIONES, C.A.		J304975341	19990324000092	2009-01-01	2009-12-31	AV.14B NO.84-65 SECTOR DELICIAS			\N		\N		\N		\N	\N	1999-03-24	SIEZ-1999-03-24-000092
498	1	2	327	1	1	CONSTRUCTORA CANALES, C.A.		J070458038	19990318000016	2009-01-01	2009-12-31	AVDA 16 ENTRE CALLES 83Y84 LAS DELICIAS NO.83-88			\N		\N		\N		\N	\N	1999-03-18	SIEZ-1999-03-18-000016
503	1	2	327	1	1	PROYECTOS Y CONSTRUCCIONES, H.P., C.A.		J303422055	19990312000045	2009-01-01	2009-12-31	AV.59 SECTOR CUMBRES DE MCBO,RES.TORRE MOLINO I EDIF.D			\N		\N		\N		\N	\N	1999-03-12	SIEZ-1999-03-12-000045
508	1	2	327	1	1	BPC CONSTRUCCIONES,C.A.		J300033244000	20010314000000	2009-01-01	2009-12-31	CALLE 72 ENTE AV.3C Y 3D SECT.LA LAGO RESD. EL CUJI PB-SOT.			\N		\N		\N		\N	\N	2001-03-14	SIEZ-2001-03-14-000000
513	1	2	327	1	1	CONSTRUCCIONES,PROYECTOS E INVERSIONES ROJAS,C.A.	COPREINCA	J306654127	20010222000002	2009-01-01	2009-12-31	CALLE 89 BARRIO 1RO.DE MAYO CASA N0. 19A-95			\N		\N		\N		\N	\N	2001-02-22	SIEZ-2001-02-22-000002
528	1	2	327	1	1	CONSTRUCCIONES Y CONSULTORIAS TECNICAS INDUSTRIALES C.A.	COTEICA	J303304281	20000607000000	2009-01-01	2009-12-31	C.C. LAS TEJITAS LOCAL # 4 SECTOR INDIO MARA			\N		\N		\N		\N	\N	2000-06-07	SIEZ-2000-06-07-000000
2119	1	2	327	1	1	INVERSIMC		V 091828886	20070801000001	2009-01-01	2009-12-31	CALLE 172 N. 44- 86 URB COROMOTO SAM FCSO			\N		\N		\N		\N	\N	2007-08-01	SIEZ-2007-08-01-000001
773	1	2	327	1	1	DIMARCO INTERNACIONAL COMPAÑIA ANONIMA	DIMINCA	J070202998	20001214000000	2009-01-01	2009-12-31	CALLE 115 NO.56-70 LOS ESTANQUES SECTOR ZONA INDUSTRIAL			\N		\N		\N		\N	\N	2000-12-14	SIEZ-2000-12-14-000000
775	1	2	327	1	1	CONSTRUCCIONES BOUTIER,C.A.	BOUTIERCA	J306670126	20010219000001	2009-01-01	2009-12-31	CALLE 95 SECTOR CASCO CENTRAL EDIF. CLINICA CATEDRAL			\N		\N		\N		\N	\N	2001-02-19	SIEZ-2001-02-19-000001
777	1	2	327	1	1	CONSTRUCCIONES PETROCA,S.A.	PETROCASA	J070546026	20010829000000	2009-01-01	2009-12-31	AV.4,CON C.67,C.C.SOCUY,LOCAL 27			\N		\N		\N		\N	\N	2001-08-29	SIEZ-2001-08-29-000000
538	1	2	327	1	1	CONSTRUCCIONES INGENIERIA Y SERVICIOS DE ELECTRICIDAD C.A.	COINSECA	J305882339	19990806000001	2009-01-01	2009-12-31	CIRCUNVALACION # 2 C.C. EL DIVIDIVE LOCAL 4 DIAG. H. MARUMA			\N		\N		\N		\N	\N	1999-08-06	SIEZ-1999-08-06-000001
543	1	2	327	1	1	ODINCA, S.A.		J070317639	19990319000044	2009-01-01	2009-12-31	AV.13A,ESQUINA CALLE 84.NO.83-79,SECTOR BELLOSO			\N		\N		\N		\N	\N	1999-03-19	SIEZ-1999-03-19-000044
545	1	2	327	1	1	SUMINISTROS,SERVICIOS E INGENIERIA DAVILA, C.A.	SUSIDCA	J300138518	19990304000018	2009-01-01	2009-12-31	CARRETERA H SECT. TIA JUANA.			\N		\N		\N		\N	\N	1999-03-04	SIEZ-1999-03-04-000018
556	1	2	327	1	1	CONTRUING, C.A.		J303554881	19990305000055	2009-01-01	2009-12-31	CALLE 89D NO.89D-52 CIRCUVALACION NO.1 FRENTE A DELICIAS			\N		\N		\N		\N	\N	1999-03-05	SIEZ-1999-03-05-000055
563	1	2	327	1	1	LINNCA,C.A.		J070321458	20001221000004	2009-01-01	2009-12-31	AV.15 EDIF. LAS PALMERAS 2DO.PISO OFICINA 2-6			\N		\N		\N		\N	\N	2000-12-21	SIEZ-2000-12-21-000004
568	1	2	327	1	1	MEDICIONES Y MANTENIMIENTOS, C.A.	M.Y.M.C.A.	J304121032	20010110000000	2009-01-01	2009-12-31	URB. LA ROTARIA AV. 111 NO.84-167			\N		\N		\N		\N	\N	2001-01-10	SIEZ-2001-01-10-000000
569	1	2	327	1	1	PROYECTOS Y OBRAS CIVILES C.A.	PROCICA	J307162788	20001214000004	2009-01-01	2009-12-31	SECTOR LA PRINGAMOSA DIAGONAL A ENELVEN			\N		\N		\N		\N	\N	2000-12-14	SIEZ-2000-12-14-000004
573	1	2	327	1	1	HEITKAMP CONSTRUCCIONES DE VENEZUELA,S.A.	HEICOVEN,S.A.	J002137355	20010207000003	2009-01-01	2009-12-31	CALLE LOS HUERTOS QTA.ELENA ENTRE CALLE EL MIRADOR-MOLINO			\N		\N		\N		\N	\N	2001-02-07	SIEZ-2001-02-07-000003
576	1	2	327	1	1	CONSTRUCTORA NACIONAL,C.A.	CONAL,C.A.	J304564813	20010212000000	2009-01-01	2009-12-31	AV.4 BELLA VISTA CON CALLE 83 EDIF. CARACAS PISO 1			\N		\N		\N		\N	\N	2001-02-12	SIEZ-2001-02-12-000000
580	1	2	327	1	1	COSTA SUR INGENIERIA,C.A.	COSTASURCA	J307571438	20010208000000	2009-01-01	2009-12-31	CARRETERA A PERIJA KM.6.5 N0. 163-55 EL SILENCIO			\N		\N		\N		\N	\N	2001-02-08	SIEZ-2001-02-08-000000
581	1	2	327	1	1	CONSTRUCCIONES E INGENIERIA,C.A.	CEINCA	J307708450	20010313000001	2009-01-01	2009-12-31	AV.BOLIVAR S/N PUEBLO NUEVO EL CHIVO SANTA BARBARA			\N		\N		\N		\N	\N	2001-03-13	SIEZ-2001-03-13-000001
582	1	2	327	1	1	CORPORACION HABITAT 2000,C.A.		J307708468	20010308000000	2009-01-01	2009-12-31	AV.3E ESQ.CALLE 79 N0.3E-11			\N		\N		\N		\N	\N	2001-03-08	SIEZ-2001-03-08-000000
583	1	2	327	1	1	GRUPO DMO,C.A.		J307237449	20010207000001	2009-01-01	2009-12-31	AV.3D N0. 65-A-13 SECTOR DON BOSCO PAROQUIA O.VILLALOBOS			\N		\N		\N		\N	\N	2001-02-07	SIEZ-2001-02-07-000001
584	1	2	327	1	1	SERVICIOS Y MANTENIMINETO GASIFEROS DE VENEZUELA,C.A.	GASVENCA	J307354542	20010125000003	2009-01-01	2009-12-31	CALLE 70 URB. LOS OLIVOS CASA N0. 66-124			\N		\N		\N		\N	\N	2001-01-25	SIEZ-2001-01-25-000003
611	1	2	327	1	1	GEVENMED,S.A.		J002214040	20010330000003	2009-01-01	2009-12-31	CALLE PASCUALE GIORGIO CON AV.DIEGO CISNERO LOS RUICES P.4			\N		\N		\N		\N	\N	2001-03-30	SIEZ-2001-03-30-000003
612	1	2	327	1	1	CONSTRUCCIONES OKINAWA,C.A.		J307657197	20010403000002	2009-01-01	2009-12-31	VIA PALITO BLANCO HACIA EL KM.18 CARRETERA A PERIJA			\N		\N		\N		\N	\N	2001-04-03	SIEZ-2001-04-03-000002
613	1	2	327	1	1	CONSTRUCCIONES LA CONCHA,S.A.	C.LA C.,S.A.	J307310715	20010405000003	2009-01-01	2009-12-31	AV.12 ENTRE CALLE 78 Y 79 EDIF.TORRE 12 OFICINA 8D			\N		\N		\N		\N	\N	2001-04-05	SIEZ-2001-04-05-000003
614	1	2	327	1	1	INVERSIONES BERMUDEZ RIOS,C.A.	INBERIOS,C.A.	J307776609	20010402000001	2009-01-01	2009-12-31	CALLE 61 SECTOR LAS TARABAS N0. 12-60			\N		\N		\N		\N	\N	2001-04-02	SIEZ-2001-04-02-000001
615	1	2	327	1	1	B.I.C.OCCIDENTAL DE CONSTRUCCIONES, C.A.	BICOC,C.A.	J302452074	20010406000004	2009-01-01	2009-12-31	CONJ.RESID.LA PARAGUA EDIF.CUCHIVERO III 1 PISO APTO.1C			\N		\N		\N		\N	\N	2001-04-06	SIEZ-2001-04-06-000004
617	1	2	327	1	1	CONSTRUCCIONES GOVEA VARGAS,C.A.	GOVAR,C.A.	J307391618	20001228000000	2009-01-01	2009-12-31	CALLE 1A BARRIO MAIQUETIA STA.BARBARA NO.68-92			\N		\N		\N		\N	\N	2000-12-28	SIEZ-2000-12-28-000000
618	1	2	327	1	1	ASESORIA,CONSTRUCCIONES Y SUMINISTROS ELECTRICOS,C.A.	ACSE,C.A.	J306853030	20010402000002	2009-01-01	2009-12-31	LOS ESTANQUES CALLE 115 N0. 54-45			\N		\N		\N		\N	\N	2001-04-02	SIEZ-2001-04-02-000002
619	1	2	327	1	1	TURBO SERVICIOS,C.A.		J306048332	20010411000001	2009-01-01	2009-12-31	AV.INTERCOMUNAL SECTOR LA VACA KLEES,TIA JAUNA			\N		\N		\N		\N	\N	2001-04-11	SIEZ-2001-04-11-000001
622	1	2	327	1	1	DISEÑOS TECNICOS Y SUPERVISION BENNY,C.A.	DISBENCA	J307194600	20010420000000	2009-01-01	2009-12-31	AV.62A N0. 98A-84 URB.SAN RAFAEL			\N		\N		\N		\N	\N	2001-04-20	SIEZ-2001-04-20-000000
623	1	2	327	1	1	SUPLIDORA INDUSTRIAL REPRESENTACIONES,C.A.	SIR,C.A.	J070266503	20010426000000	2009-01-01	2009-12-31	CALLE PIAR A 100 MTS. CARRETARA L CIUDAD OJEDA			\N		\N		\N		\N	\N	2001-04-26	SIEZ-2001-04-26-000000
624	1	2	327	1	1	INVERSIONES,ASESORIAS Y SERVICIOS,C.A,	INSOVICA	J307906162	20010625000002	2009-01-01	2009-12-31	AV.17A CALLE 108B N0.108B-81 SECTOR HATICOS			\N		\N		\N		\N	\N	2001-06-25	SIEZ-2001-06-25-000002
625	1	2	327	1	1	CONSTRUCTORA Y SERVICIOS LAGO NORTE,C.A.	CONSERLAGO,C.A.	J307797274	20010430000000	2009-01-01	2009-12-31	VIA LA TUBERIA SECTOR LA MOCHA HACIENDA SAN JUAN LOS PUERTO			\N		\N		\N		\N	\N	2001-04-30	SIEZ-2001-04-30-000000
628	1	2	327	1	1	SERVICIOS Y CONSTRUCCIONES VENEZOLANAS,C.A.	SERCOVENCA	J304554117	20010702000000	2009-01-01	2009-12-31	CALLE 106 N0. 18-91 URB. VILLA HERMOSA			\N		\N		\N		\N	\N	2001-07-02	SIEZ-2001-07-02-000000
1009	1	2	327	1	1	INVERSIONES FERNANDEZ & RODRIGUEZ,C.A.	INVERSIONES F & R,C.A.	J308052337	20021030000001	2009-01-01	2009-12-31	AV.16 LA GUAJIRA CONJ.RESID. EL CUJI EDIF.1 NUCLEO 4 PISO 4			\N		\N		\N		\N	\N	2002-10-30	SIEZ-2002-10-30-000001
630	1	2	327	1	1	CONSTRUCCIONES O Y V,C.A.	CONOYVCA	J307680377	20010516000001	2009-01-01	2009-12-31	URB.CANTA CLARO CASA N0.50-125			\N		\N		\N		\N	\N	2001-05-16	SIEZ-2001-05-16-000001
631	1	2	327	1	1	CONSTRUCCIONES BROMBIN,C.A.		J305896194	20010713000000	2009-01-01	2009-12-31	URB.FUNDACOLON CASA N0. 3-27			\N		\N		\N		\N	\N	2001-07-13	SIEZ-2001-07-13-000000
632	1	2	327	1	1	CONSTRUCCIONES RAIMAR,C.A.	CONSTRUCCIONES RM,C.A.	J308794204	20010606000000	2009-01-01	2009-12-31	BARRIO LIBERTAD,CALLE PRINCIPAL# 06			\N		\N		\N		\N	\N	2001-06-06	SIEZ-2001-06-06-000000
633	1	2	327	1	1	CONSTRUCCIONES Y SERVICIOS DIAZ & HERRERA,C.A.	CONSERDIHE,C.A.	J304109075	20010525000000	2009-01-01	2009-12-31	CALLE 100 SABANETA CON AV. 20B N0.20B-06			\N		\N		\N		\N	\N	2001-05-25	SIEZ-2001-05-25-000000
635	1	2	327	1	1	INVERSORA FLOWERS,C.A.	INVERFLOWERS,C.A.	J308235563	20010717000000	2009-01-01	2009-12-31	URB.EL GUAYABAL CALLE 98 CASA N0. 45-50			\N		\N		\N		\N	\N	2001-07-17	SIEZ-2001-07-17-000000
636	1	2	327	1	1	INVERSIONES Y PROYECTOS REYMONT,C.A.		J307538740	20010627000001	2009-01-01	2009-12-31	AV.4 BELLA VISTA C.CALLE 85(FALCON)QTA.CASA DE MADERA			\N		\N		\N		\N	\N	2001-06-27	SIEZ-2001-06-27-000001
637	1	2	327	1	1	CONSTRUCCIONES Y SUMINISTROS VALBUENA,C.A.	CONSUVAL,C.A.	J307891785	20010529000000	2009-01-01	2009-12-31	AV.17 SECTOR EL POTENTE EDIF.SAN MIGUEL P.B. LOCAL 6			\N		\N		\N		\N	\N	2001-05-29	SIEZ-2001-05-29-000000
1644	1	2	327	1	1	CONSTRUCCIONES CONSPERCA, C.A.	CONSPERCA	J070504528	19990322000005	2009-01-01	2009-12-31	CALLE 67 CON AV. 27 EDIF.FINQUITA SECTOR STA.MARIA NO.26-82			\N		\N		\N		\N	\N	1999-03-22	SIEZ-1999-03-22-000005
644	1	2	327	1	1	INVERSIONES,DUCTOS Y CONSTRUCCIONES,C.A.	DUCONSCA	J307773456	20010614000001	2009-01-01	2009-12-31	CALLE 60B N0.15E-04 FTE.AL ABASTO BUENOS AIRES B/ZIRUMA			\N		\N		\N		\N	\N	2001-06-14	SIEZ-2001-06-14-000001
645	1	2	327	1	1	CONSTRUCTORA LA ESTANCIA,C.A.	CONLESCA	J308018341	20010620000002	2009-01-01	2009-12-31	CASCO CENTRAL CALLE 95 CASA N0. 3-68			\N		\N		\N		\N	\N	2001-06-20	SIEZ-2001-06-20-000002
647	1	2	327	1	1	CONSTRUCCIONES EXCEL,S.A.	EXCELSA	J300683060	20010329000001	2009-01-01	2009-12-31	AV.3Y SAN MARTIN C.C. LOS PERINEOS LOCAL 08			\N		\N		\N		\N	\N	2001-03-29	SIEZ-2001-03-29-000001
649	1	2	327	1	1	RAEL INMUEBLES,C.A.	RAELCA	J301143841	20010710000000	2009-01-01	2009-12-31	C.100 SABANETA C.C.EL VARILLAL LOCAL 47C			\N		\N		\N		\N	\N	2001-07-10	SIEZ-2001-07-10-000000
652	1	2	327	1	1	INGENIERIA,MANTENIMIENTO Y CONSTRUCCIONES DE OCCIDENTE,C.A.	IMACON,C.A.	J307893583	20010627000003	2009-01-01	2009-12-31	CALLE 95 SECTOR CASCO CENTRAL CASA N0.3-68			\N		\N		\N		\N	\N	2001-06-27	SIEZ-2001-06-27-000003
1034	1	2	327	1	1	CONSTRUCTORA LIZARD, C.A.		J070543990	19990416000045	2009-01-01	2009-12-31	CALLE 45 CASA NO. 13-104 URB. EL ROSAL SUR			\N		\N		\N		\N	\N	1999-04-16	SIEZ-1999-04-16-000045
655	1	2	327	1	1	SOTO Y MARTINEZ, C.A.	SOTO MAR,C.A.	J308097713	20010803000000	2009-01-01	2009-12-31	C.C.EL CASTAÑO L.09 Y 10 PLANTA ALTA AV.8 STA.RITA C/C 66-A			\N		\N		\N		\N	\N	2001-08-03	SIEZ-2001-08-03-000000
657	1	2	327	1	1	KAIN C.A.		J300486133	20010406000007	2009-01-01	2009-12-31	C.C. NIVALDO  CALLE 66 SECTOR INDIO MARA LOCAL 4			\N		\N		\N		\N	\N	2001-04-06	SIEZ-2001-04-06-000007
660	1	2	327	1	1	VIPALKA,PROYECTOS Y CONSTRUCCIONES,C.A.	VIPALKA,C.A.	J308019577	20010712000000	2009-01-01	2009-12-31	AV.10 C.CALLE URB.MONTE BELLO RESID.LAS AVES PISO 9 APTO 9H			\N		\N		\N		\N	\N	2001-07-12	SIEZ-2001-07-12-000000
661	1	2	327	1	1	CONSTRUCTORES ELECTRICOS INDUSTRIALES C.A.	CEICA	J070143290	20010709000001	2009-01-01	2009-12-31	CARRETERA LA PLATA ESQ.CARRETERA WILLIAMS SECT.PUNTA GORDA			\N		\N		\N		\N	\N	2001-07-09	SIEZ-2001-07-09-000001
666	1	2	327	1	1	INGENIERIA DE MANTENIMIENTO Y CONSTRUCCIONES,C.A.	IMC,C.A.	J307679590	20010807000000	2009-01-01	2009-12-31	AV.70B N0.79F-75			\N		\N		\N		\N	\N	2001-08-07	SIEZ-2001-08-07-000000
667	1	2	327	1	1	ARQ.JEANNETTE GANSER LYNCH		V045236230	20010509000000	2009-01-01	2009-12-31	AV.12 N0.74-09 QTA. LOS MONJES			\N		\N		\N		\N	\N	2001-05-09	SIEZ-2001-05-09-000000
669	1	2	327	1	1	INVERSIONES Y CONSTRUCCIONES RADA,C.A.	RADACA	J308206130	20011004000000	2009-01-01	2009-12-31	MONTE BELLO AV.10 C.CALLE N EDIF.LAS AVES 2D0.PISO APTO.2H			\N		\N		\N		\N	\N	2001-10-04	SIEZ-2001-10-04-000000
670	1	2	327	1	1	INVERSIONES VERA TRIGGIANO C.A.	INVERTRICA	J307754168	20010809000002	2009-01-01	2009-12-31	AV.12C/CALLE 52´C.C.CARIDAD DEL COBRE,URB.CANTA CLARO.			\N		\N		\N		\N	\N	2001-08-09	SIEZ-2001-08-09-000002
671	1	2	327	1	1	CONSTRUCTORA SANBE,C.A.		J307692570	20010810000000	2009-01-01	2009-12-31	AV.4 SECTOR CASCO CENTRAL CASA N0.94-55			\N		\N		\N		\N	\N	2001-08-10	SIEZ-2001-08-10-000000
673	1	2	327	1	1	DISEÑO SERVICIOS Y MANTENIMIENTO ESPECIALIZADOS,C.A.	DISERMECA,C.A.	J306419381	20010911000002	2009-01-01	2009-12-31	BA. LOS ANDES, SECTOR POMONA,CALLE 111 NO.19-30			\N		\N		\N		\N	\N	2001-09-11	SIEZ-2001-09-11-000002
674	1	2	327	1	1	INVERSIONES Y CONSTRUCCIONES DI DAVIDE,C.A.	INCODICA	J308061409	20010816000000	2009-01-01	2009-12-31	CALLE 116 BARRIO 23 DE ENERO CASA N0.19B-87			\N		\N		\N		\N	\N	2001-08-16	SIEZ-2001-08-16-000000
676	1	2	327	1	1	CONSTRUCCIONES, ESTUDIOS Y PROYECTOS DE INGENIERIA, C.A.	CEPROCA	J070274069	19990421000058	2009-01-01	2009-12-31	CALLE 77 EDIF.TORRE 77 2DO.PISO			\N		\N		\N		\N	\N	1999-04-21	SIEZ-1999-04-21-000058
677	1	2	327	1	1	CONSTRUCCIONES CONZUVEN,COMPAÑIA ANONIMA	CONZUVEN,C.A.	J308320919	20010911000000	2009-01-01	2009-12-31	SECTOR EL CEMENTERIO,C.PADRE LANDAETA,QTA.SISMELY S/N.			\N		\N		\N		\N	\N	2001-09-11	SIEZ-2001-09-11-000000
678	1	2	327	1	1	HEVERSON,C.A.		J303872050	20011022000000	2009-01-01	2009-12-31	CAMPO ALEGRIA SEG.CALLE # 26  MENE GRANDE			\N		\N		\N		\N	\N	2001-10-22	SIEZ-2001-10-22-000000
682	1	2	327	1	1	SOL Y AGUA INVERSIONES,C.A.	SOL Y AGUA,C.A.	J308440043	20011102000000	2009-01-01	2009-12-31	AV.SABANETA URB.URDANETA BLOQUE 1 APTO.A-1			\N		\N		\N		\N	\N	2001-11-02	SIEZ-2001-11-02-000000
686	1	2	327	1	1	INGENIEROS CONSULTORES C.A.	I.C.C.A.	J304712502	20001226000000	2009-01-01	2009-12-31	AV.DELICIAS C.C.PUENTE CRISTAL 1 PISO OFIC.84			\N		\N		\N		\N	\N	2000-12-26	SIEZ-2000-12-26-000000
687	1	2	327	1	1	KEMER INGENIERIA, C.A.	KEMERCA	J305822948	19990324000086	2009-01-01	2009-12-31	SECTOR CASCO CENTRAL CALLE 95 NO.3-68 LOCAL NO.01			\N		\N		\N		\N	\N	1999-03-24	SIEZ-1999-03-24-000086
698	1	2	327	1	1	CONSTRUCCIONES EL MILAGRO,C.A.		J307757302	20011026000001	2009-01-01	2009-12-31	AV.9B ENTE CALLE 66 Y 66A			\N		\N		\N		\N	\N	2001-10-26	SIEZ-2001-10-26-000001
710	1	2	327	1	1	CONSTRUCCIONES CAMPISI,C.A.		J070341327	20010302000001	2009-01-01	2009-12-31	CALLE 100 SABANETA RESD.PAUL 1 LOCALES 5 Y 6			\N		\N		\N		\N	\N	2001-03-02	SIEZ-2001-03-02-000001
711	1	2	327	1	1	VILLA MORA, C.A.		J307130741	20010302000002	2009-01-01	2009-12-31	CALLE 100 SABANETA EDIF. LA VEGA 1D APART.3-2			\N		\N		\N		\N	\N	2001-03-02	SIEZ-2001-03-02-000002
713	1	2	327	1	1	ELECTRIC Y CONSTRUCCIONES BARBOZA ALBORNOZ,C.A.		J306063277	20010307000000	2009-01-01	2009-12-31	AV.8 CASA 14 SECT.STO.DOMINGO STA.BARBARA DEL ZULIA			\N		\N		\N		\N	\N	2001-03-07	SIEZ-2001-03-07-000000
714	1	2	327	1	1	CONSTRUCCIONES L.V.,C.A.		J30733664	20011108000000	2009-01-01	2009-12-31	AV.19 ENTRE CALLES 3 Y 2 N0.3-91 SIERRA MAESTRA			\N		\N		\N		\N	\N	2001-11-08	SIEZ-2001-11-08-000000
715	1	2	327	1	1	DIRECCION ADMINISTRATIVA COMERCIAL Y CONSTRUCCIONES,S.A.	DACCSA	J070236949	20010319000001	2009-01-01	2009-12-31	CALLE 77 AV.3Y SAN MARTIN C.C. COSENZA IER.PISO OFIC.5			\N		\N		\N		\N	\N	2001-03-19	SIEZ-2001-03-19-000001
716	1	2	327	1	1	JOSELINCA,C.A.	JOSELINCA,C.A.	J308663972	20011206000000	2009-01-01	2009-12-31	CALLE 83A SECTOR SANTA MARIA N0. 69-68			\N		\N		\N		\N	\N	2001-12-06	SIEZ-2001-12-06-000000
717	1	2	327	1	1	INVERSIONES Y CONSTRUCCIONES DIEGO,C.A.	INCODICA	J308329932	20011206000001	2009-01-01	2009-12-31	CALLE 13 EDIF.EL PIONIO PISO 2 OFIC.03 ESTADO.PORTUGUESA			\N		\N		\N		\N	\N	2001-12-06	SIEZ-2001-12-06-000001
719	1	2	327	1	1	A & Z CONSTRUCCIONES,C.A.	A & Z, C.A.	J305903425	20010309000002	2009-01-01	2009-12-31	AV. BELLA VISTA CALLE 82B N0. 3G-35			\N		\N		\N		\N	\N	2001-03-09	SIEZ-2001-03-09-000002
720	1	2	327	1	1	PROYECTOS INDUSTRIALES E INVERSIONES, S.A.	PROINSA	J070266236	19990310000084	2009-01-01	2009-12-31	CALLE 72 NO.3C,EDIF.PALMA REAL APTO.10-A,			\N		\N		\N		\N	\N	1999-03-10	SIEZ-1999-03-10-000084
722	1	2	327	1	1	INTELEC,C.A.		J070385669	20010314000001	2009-01-01	2009-12-31	CALLE 72 CON AV.3H C.C. LAS TINAJITAS LOCAL 7 P.B.			\N		\N		\N		\N	\N	2001-03-14	SIEZ-2001-03-14-000001
723	1	2	327	1	1	CONSTRUCTORA YOHEL LEAL,COMPAÑIA ANONIMA	CONYOLECA	J305812152	19990906000001	2009-01-01	2009-12-31	CALLE 99C AV.55 #99A-160P			\N		\N		\N		\N	\N	1999-09-06	SIEZ-1999-09-06-000001
725	1	2	327	1	1	CONSTRUCCIONES MARIN  C.A	CONSMARCA	J307335327	20010125000001	2009-01-01	2009-12-31	AV 3Y ENTRE  CALLES 78 Y 79 C.C. SALTO ANGEL NIVEL 2 OFI.3			\N		\N		\N		\N	\N	2001-01-25	SIEZ-2001-01-25-000001
727	1	2	327	1	1	INVERSIONES Y CONSTRUCCIONES BALMAZ,C.A.	INCOBALMAZCA	J306689788	20010305000000	2009-01-01	2009-12-31	AV.23 ENTRE CALLES 66 Y 67 RESD.STA.MARIA PISO 7 APTO 7-A			\N		\N		\N		\N	\N	2001-03-05	SIEZ-2001-03-05-000000
728	1	2	327	1	1	CONSTRUCCIONES Y SERVICIOS JIBELL,C.A.	JIBELLCA	J307291362	20001214000006	2009-01-01	2009-12-31	AV.16 SECTOR DELICIAS CON CALLE 88 Y 89 NO.88-40			\N		\N		\N		\N	\N	2000-12-14	SIEZ-2000-12-14-000006
729	1	2	327	1	1	INVERSIONES E IMPORTACIONES RONALD IMPORT,C.A.		J306477624	20011228000000	2009-01-01	2009-12-31	VIA PANAMERICANA AV.PPAL.AGUA SANTA,VALERA			\N		\N		\N		\N	\N	2001-12-28	SIEZ-2001-12-28-000000
731	1	2	327	1	1	MARIN & MARIN CONSTRUCCIONES Y PROYECTOS,C.A.	M.C.P.,C.A.	J304398280	20010326000002	2009-01-01	2009-12-31	CENTRO EMPRESARIAL OLA AV.11 ENTRE CALLE 72 Y 73			\N		\N		\N		\N	\N	2001-03-26	SIEZ-2001-03-26-000002
732	1	2	327	1	1	SUMINISTROS,SERVICIOS Y REPRESENTACIONES MULTIPLES,C.A.	SUSREMCA	J305062315	20010614000000	2009-01-01	2009-12-31	AV.12 CALLE 78 Y 79 EDIF.TORRE 12 PH NORTE LOCAL 2			\N		\N		\N		\N	\N	2001-06-14	SIEZ-2001-06-14-000000
1708	1	2	327	1	1	SOLER FERNANDO,C.A.	SOFECA	J303545033	20021015000000	2009-01-01	2009-12-31	AV. GUAJIRA 16-A N0.61-87			\N		\N		\N		\N	\N	2002-10-15	SIEZ-2002-10-15-000000
1495	1	2	327	1	1	CONSTRUCTORA OMEGA,C.A.	OMEGA,C.A.	J070258349	20001221000002	2009-01-01	2009-12-31	CALLE 76 C/AV.12 EDIF.UPEMA PISO 2			\N		\N		\N		\N	\N	2000-12-21	SIEZ-2000-12-21-000002
1497	1	2	327	1	1	CONSTRUCTORA MOLSAN,C.A.	COMOLSANCA	J306817492	20001220000001	2009-01-01	2009-12-31	SECTOR SOTOVENTO CALLE PRINCIPAL			\N		\N		\N		\N	\N	2000-12-20	SIEZ-2000-12-20-000001
1513	1	2	327	1	1	CONTRUCTORAS OBRAS Y DESARROLLO, C.A.	COYDECA	J301212444	19990414000030	2009-01-01	2009-12-31	VIA LAS LOMAS C.C. DOÑA ANA LOCAL NO.9			\N		\N		\N		\N	\N	1999-04-14	SIEZ-1999-04-14-000030
1517	1	2	327	1	1	O.P. & P.SERVICIOS INTEGRALES,C.A.		J306933093	20010409000004	2009-01-01	2009-12-31	AV.3H CON CALLE 79 N0-79-39			\N		\N		\N		\N	\N	2001-04-09	SIEZ-2001-04-09-000004
1518	1	2	327	1	1	SERVICIOS BIOTECNICOS,C.A.	SERBIOTEC,C.A.	J303797253	20010427000000	2009-01-01	2009-12-31	CALLE 79 ENTRE AV. 11 Y 12 EDIF. KAIKA LOCAL 3			\N		\N		\N		\N	\N	2001-04-27	SIEZ-2001-04-27-000000
733	1	2	327	1	1	OBRAS,CONSTRUCCIONES Y SERVICIOS ANGELINI,C.A.	OCONSA,C.A.	J306699660	20010405000004	2009-01-01	2009-12-31	CALLE 75 CON AV. 13A C.C.PRIMAVERA LOCALES 9-10-11			\N		\N		\N		\N	\N	2001-04-05	SIEZ-2001-04-05-000004
738	1	2	327	1	1	SERVICIOS Y MANTENIMIENTOS MOAL-CA,C.A.		J070319623	20001205000003	2009-01-01	2009-12-31	CALLE 79 CON AVS. 17 Y 18 NO. 17-89			\N		\N		\N		\N	\N	2000-12-05	SIEZ-2000-12-05-000003
739	1	2	327	1	1	ROCOSA CONSTRUCCIONES,S.A.	ROCOSA	J306592156	20010529000003	2009-01-01	2009-12-31	AV.51 N0. 96E-180 SECTOR LOS CLAVELES			\N		\N		\N		\N	\N	2001-05-29	SIEZ-2001-05-29-000003
740	1	2	327	1	1	ACCESORIOS MEDICOS,C.A.		J305633282	20010502000000	2009-01-01	2009-12-31	AV.3Y CON CALLE 72 C.C. LAS TINAJITAS P.B.			\N		\N		\N		\N	\N	2001-05-02	SIEZ-2001-05-02-000000
746	1	2	327	1	1	INGENIERIA GARCIA HERNANDEZ, C.A.	INGAHECA	J302327261	19990708000006	2009-01-01	2009-12-31	CALLE 64 AVS.71A Y 72 QTA.VILLA 2 # 71URB. CIUDADELA FARIA			\N		\N		\N		\N	\N	1999-07-08	SIEZ-1999-07-08-000006
748	1	2	327	1	1	SELIMAT,C.A.		J070118601	20010528000000	2009-01-01	2009-12-31	AV.9 ENTRE CALLES 77 Y 78 N0. 77-61			\N		\N		\N		\N	\N	2001-05-28	SIEZ-2001-05-28-000000
751	1	2	327	1	1	BALANOS BROTHERS SERVICE,S.A.	B.B.S.,S.A.	J301662962	20010613000002	2009-01-01	2009-12-31	AV.42 CARRETERA N Y O SECTOR LOS SAMANES CIUDAD OJEDA			\N		\N		\N		\N	\N	2001-06-13	SIEZ-2001-06-13-000002
752	1	2	327	1	1	INVERSIONES Y DESARROLLOS DE INGENIERIA,C.A.	IDINCA	J307137800	20010129000001	2009-01-01	2009-12-31	CALLE 2-A SECTOR SIERRA MAESTRA EDIF.PARAGUALITO			\N		\N		\N		\N	\N	2001-01-29	SIEZ-2001-01-29-000001
758	1	2	327	1	1	CONSTRUCCIONES E INVERSIONES VIGER,C.A.	VIGERCA	J307696656	20010228000001	2009-01-01	2009-12-31	SECT.VALLE CLARO CALLE 82A EDIF.MATLDE APTO.1-C			\N		\N		\N		\N	\N	2001-02-28	SIEZ-2001-02-28-000001
761	1	2	327	1	1	CONSTRUCCIONES Y TELECOMUNICACIONES C.A.	CONSTELCA	J307687401	20010315000002	2009-01-01	2009-12-31	C.C.PUENTE CRISTAL PB LOCAL 19 CALLE 99 CON AV.14			\N		\N		\N		\N	\N	2001-03-15	SIEZ-2001-03-15-000002
2229	1	2	327	1	1	INVERSIONES ANTEL C.A.	ANTEL. C.A	J296008183	20081009000002	2009-01-01	2009-12-31	URB. COROMOTO AV. 36 No. 165-181, SAN FRANCISCO			\N		\N		\N		\N	\N	2008-10-09	SIEZ-2008-10-09-000002
1094	1	2	327	1	1	CONSTRUCCIONES Y SERVICIOS J & V,C.A.	J & V,C.A.	J310086583	20030701000000	2009-01-01	2009-12-31	AV. 08 SAN JACINTO CASA N0. 70			\N		\N		\N		\N	\N	2003-07-01	SIEZ-2003-07-01-000000
1894	1	2	327	1	1	V & P INGENIERIA,C.A.		J312967390	20050422000001	2009-01-01	2009-12-31	AV.17 N0.101-58 SECTOR PUENTE ESPAÑA			\N		\N		\N		\N	\N	2005-04-22	SIEZ-2005-04-22-000001
766	1	2	327	1	1	RAYCO,C.A.		J070296917	20010730000000	2009-01-01	2009-12-31	CALLE YARACUY N0.20 DELICIAS NUEVAS			\N		\N		\N		\N	\N	2001-07-30	SIEZ-2001-07-30-000000
769	1	2	327	1	1	EDIF. CONST Y VIALIDAD EDICONVIALSA.S.A	EDICONVIALSA.	J070461250	19990319000045	2009-01-01	2009-12-31	CALLE 72 CON AV.25 EDIF.NESUL P.B.			\N		\N		\N		\N	\N	1999-03-19	SIEZ-1999-03-19-000045
770	1	2	327	1	1	LAMBDA INGENIERIA,C.A.		J307738979	20010406000005	2009-01-01	2009-12-31	CALLE 62 SECTOR PUEBLO NUEVO CASA N0. 98-01			\N		\N		\N		\N	\N	2001-04-06	SIEZ-2001-04-06-000005
772	1	2	327	1	1	CONSTRUCTORA MENDOZA Y FINOL,S.A.	MENFI	J306268421	20010925000004	2009-01-01	2009-12-31	CALLE B URB.LA POMONA EDIF.BLOQUE 19A-36 APTP.1			\N		\N		\N		\N	\N	2001-09-25	SIEZ-2001-09-25-000004
780	1	2	327	1	1	CONSTRUCCIONES OBRAS Y VIALIDAD,C.A.	COVIALCA	J307670096	20010305000002	2009-01-01	2009-12-31	AV.4 SECT.CASCO CENTRAL CASA N0.94-55			\N		\N		\N		\N	\N	2001-03-05	SIEZ-2001-03-05-000002
781	1	2	327	1	1	CONSTRUCCIONES CIVILES VENEZOLANAS,C.A.	CONCIVENCA	J307565861	20010518000002	2009-01-01	2009-12-31	AV.EL MILAGRO BARRIO EL RELLENO CASA N0. 76A-73			\N		\N		\N		\N	\N	2001-05-18	SIEZ-2001-05-18-000002
782	1	2	327	1	1	INGENIERIA DE CONSTRUCCIONES Y SERVICIOS TECNICOS,C.A.	INCOSERTEC,C.A.	J306603301	20010925000002	2009-01-01	2009-12-31	ENTRADA PPAL.DE CASIGUA EL CUBO-FRENTA A CAUCHERA SAN BENITO			\N		\N		\N		\N	\N	2001-09-25	SIEZ-2001-09-25-000002
783	1	2	327	1	1	PERFECCIONES VIALES,C.A.	PEVILCA	J305958297	20010606000002	2009-01-01	2009-12-31	AV. VIA BOBURES URB. LA CONQUISTA CASA # 1-92			\N		\N		\N		\N	\N	2001-06-06	SIEZ-2001-06-06-000002
785	1	2	327	1	1	PROYECTOS DE INGENIERIA Y MONTAJE,S.A.	PRIMSA	J307469986	20010424000000	2009-01-01	2009-12-31	AV.4 CON CALLE 65 EDIF. SIGMA APTO.4-A			\N		\N		\N		\N	\N	2001-04-24	SIEZ-2001-04-24-000000
816	1	2	327	1	1	OFICINA TECNICA DE MANTENIMIENTO ZULIA C.A.	O.T.M. ZULIA,C.A.	J303469108	19990722000000	2009-01-01	2009-12-31	AV.13 #.66A-26 APTO 2B RESIDENCIA DON EDMUNDO			\N		\N		\N		\N	\N	1999-07-22	SIEZ-1999-07-22-000000
817	1	2	327	1	1	AC INGENIERIA, C.A.		J304355122	19990322000015	2009-01-01	2009-12-31	AV.28 LA LIMPIA SECTOR LA FUSTA NO.3-9			\N		\N		\N		\N	\N	1999-03-22	SIEZ-1999-03-22-000015
818	1	2	327	1	1	ING. DANIEL HOMEZ		J050641569	20001019000001	2009-01-01	2009-12-31	AV.13 SECTOR TIERRA NEGRA NO.66A-21 EDIF.MACBO.AP.9A			\N		\N		\N		\N	\N	2000-10-19	SIEZ-2000-10-19-000001
820	1	2	327	1	1	CONSTRUCCIONES Y MANTENIMIENTOS A.I.,C.A.	COYMACA	J070547375	20010406000002	2009-01-01	2009-12-31	AV.5 DE JULIO TORRE CRISTAL 4TO. PISO			\N		\N		\N		\N	\N	2001-04-06	SIEZ-2001-04-06-000002
821	1	2	327	1	1	INVERSIONES MENDOZA OVIEDO,C.A.	INVERMOCA	J306439021	20020313000000	2009-01-01	2009-12-31	CALLE 69C URB.SANTA MARIA CASA NO.28A-32			\N		\N		\N		\N	\N	2002-03-13	SIEZ-2002-03-13-000000
822	1	2	327	1	1	RINCON Y LINARES,C.A.	R Y L,C.A.	J307884231	20010425000000	2009-01-01	2009-12-31	AV.04 CASCO CENTRAL CASA NO.94-55 LAB,.ISIDRO			\N		\N		\N		\N	\N	2001-04-25	SIEZ-2001-04-25-000000
824	1	2	327	1	1	CONSTRUCTORA AMAYA RISCO,C.A.	CONARCA	J306306374	20010129000000	2009-01-01	2009-12-31	CALLE 21 CON CALLE AV. 14 SECTOR SANTA TERESA			\N		\N		\N		\N	\N	2001-01-29	SIEZ-2001-01-29-000000
825	1	2	327	1	1	INVERSIONES JAINCA,C.A.	JAINCA	J308538868	20020305000000	2009-01-01	2009-12-31	CALLE 51 VILLA DELICIAS CASA N0. 15G-67 ALCARROAL			\N		\N		\N		\N	\N	2002-03-05	SIEZ-2002-03-05-000000
828	1	2	327	1	1	CONSTRUCTORA WILPERCA,C.A.		J308523941	20020319000000	2009-01-01	2009-12-31	CALLE ZULIA FTE.FERRETERIA GAMA,SCTOR CASIGUA EL CUBO			\N		\N		\N		\N	\N	2002-03-19	SIEZ-2002-03-19-000000
829	1	2	327	1	1	ASFALTADO,VIALIDAD Y CONSTRUCCIONES J.K.,C.A.	ASVICONCA	J307560797	20020313000002	2009-01-01	2009-12-31	AV.3H ENTRE CALLE 78 Y 79 EDIF.REPUBLICA LOCAL 2			\N		\N		\N		\N	\N	2002-03-13	SIEZ-2002-03-13-000002
831	1	2	327	1	1	START-UP & SERVICES,C.A.	START-UP,C.A.	J308802719	20020528000000	2009-01-01	2009-12-31	CALLE 89 CON AVES.18 SECTOR 1 DE MAYO CASA N0. 18-63			\N		\N		\N		\N	\N	2002-05-28	SIEZ-2002-05-28-000000
833	1	2	327	1	1	INGENIERIA Y SERVICIOS R & R,C.A.		J308824569	20020416000000	2009-01-01	2009-12-31	CALLE LOS NOVIOS,SECTOR EL BATEY,CASA N. 35			\N		\N		\N		\N	\N	2002-04-16	SIEZ-2002-04-16-000000
835	1	2	327	1	1	VENEZUELAN  NETHERLAND FIELD CONTRACTORS,S.A.	VENEFCO,S.A.	J070022108	20011001000000	2009-01-01	2009-12-31	CALLE JUNIN ANTIGUA CARRETERA NACIONAL PUNTA GORDA,CABIMAS			\N		\N		\N		\N	\N	2001-10-01	SIEZ-2001-10-01-000000
836	1	2	327	1	1	DESARROLLO DE SOLUCIONES TECNICAS,C.A.	DESTACA	J307492112	20010329000003	2009-01-01	2009-12-31	CALLE 101 SABANETA CONJ.RESID.LAS FLORES			\N		\N		\N		\N	\N	2001-03-29	SIEZ-2001-03-29-000003
837	1	2	327	1	1	ING. RAFAEL DIONISIO VASQUEZ AVILA		V004246671	20010927000000	2009-01-01	2009-12-31	AV.11 N0. 53-8D URB. CANTA CLARO			\N		\N		\N		\N	\N	2001-09-27	SIEZ-2001-09-27-000000
838	1	2	327	1	1	VENEQUIP S.A.		J304780869	20010410000003	2009-01-01	2009-12-31	ZONA INDUSTRIAL KM. 4 1/2 VIA PERIJA EDIF. VENEQUIP			\N		\N		\N		\N	\N	2001-04-10	SIEZ-2001-04-10-000003
839	1	2	327	1	1	CONSTRUCCIONES CIVILES PURDUE,C.A.	PURDUE,C.A	J307462418	20001219000000	2009-01-01	2009-12-31	CALLE 72 CON AV.2D EDIF.AMBASSADOR PISO 19 APART.19			\N		\N		\N		\N	\N	2000-12-19	SIEZ-2000-12-19-000000
1124	1	2	327	1	1	CONSTRUCTORA LOS RUICES, C.A.		J070365064	19990324000083	2009-01-01	2009-12-31	AV.1 CASA # 11-04			\N		\N		\N		\N	\N	1999-03-24	SIEZ-1999-03-24-000083
272	1	2	327	1	1	URBANIZADORA FAMA, C.A.		J070506253	19990318000004	2009-01-01	2009-12-31	CALLE 72 CON AV.19 EDIF.NOEL P.B. LOCAL H			\N		\N		\N		\N	\N	1999-03-18	SIEZ-1999-03-18-000004
284	1	2	327	1	1	EDM CONSTRUCCIONES, C.A.		J303663443	20000127000002	2009-01-01	2009-12-31	C/115 #.59-115 SECTOR LOS ROBLES			\N		\N		\N		\N	\N	2000-01-27	SIEZ-2000-01-27-000002
294	1	2	327	1	1	VORTEX, COMPAÑIA ANONIMA	VORTEXCA	J303649670	19990526000006	2009-01-01	2009-12-31	AV.LIBERTAD C/ BELGRANO MINIICENTRO JHOINER P.A. LOCAL 03 CAB			\N		\N		\N		\N	\N	1999-05-26	SIEZ-1999-05-26-000006
947	1	2	327	1	1	SERVICIOS, CONSTRUCCIONES Y MANTENIMIENTO SINAMAICA, C.A.	SERCONMACA	J305982066	19991026000008	2009-01-01	2009-12-31	CALLE 5 #.17 SECTOR 15 URB. SAN JACINTO			\N		\N		\N		\N	\N	1999-10-26	SIEZ-1999-10-26-000008
1476	1	2	327	1	1	TECNO EMBOBINADOS PENIEL,C.A.	PENIELCA	J305948682	20010820000000	2009-01-01	2009-12-31	SECTOR BELLOSO CALLE 89D,N0.13B-01			\N		\N		\N		\N	\N	2001-08-20	SIEZ-2001-08-20-000000
1059	1	2	327	1	1	ELORRIAGA, FARIA & ASOCIADOS, C.A.	EFACA	J301390741	19990318000093	2009-01-01	2009-12-31	CALLE 72 C/AVE.3G RESIDENCIAS EL CARMEN			\N		\N		\N		\N	\N	1999-03-18	SIEZ-1999-03-18-000093
1061	1	2	327	1	1	N.O.R.,CONSTRUCCIONES,DISEÑOS Y MANTENIMIENTO,C.A.	N.O.R.CODIMA	J307953659	20010525000001	2009-01-01	2009-12-31	AV.19B SECTOR SABANETA N0. 99A-49			\N		\N		\N		\N	\N	2001-05-25	SIEZ-2001-05-25-000001
1062	1	2	327	1	1	EMPRESA RENTAL DE LA FACULT.DE ARQUITEC.DE LA U.DEL ZULIA	ARQUILUZ,C.A.	J304980531	20011022000003	2009-01-01	2009-12-31	CALLE 68 ENTRE AV.4 Y 8 EDIF.TORRE SUR LOCAL 4 MEZZANINE			\N		\N		\N		\N	\N	2001-10-22	SIEZ-2001-10-22-000003
1063	1	2	327	1	1	IMPORTADORA Y EXPORTADORA MEJOCA SOCIEDAD ANONIMA	MEJOCA,S.A.	J302188679	20030825000000	2009-01-01	2009-12-31	AV,79 LA LIMPIA URB.LA FLORIDA SECT. AYACUCHO EDIF CARABOBO			\N		\N		\N		\N	\N	2003-08-25	SIEZ-2003-08-25-000000
1539	1	2	327	1	1	G.M. PROYECTOS, C.A.		J307883901	20010823000001	2009-01-01	2009-12-31	AV.MIRAFLORES CABIMAS,CASA NO.28			\N		\N		\N		\N	\N	2001-08-23	SIEZ-2001-08-23-000001
1083	1	2	327	1	1	OPERADORA DE SERVICIOS MEDICOS,C.A.	OSM,C.A.	J310320152	20030814000000	2009-01-01	2009-12-31	AV.3CH SECTOR LA LAGO CASA NO. 71-40			\N		\N		\N		\N	\N	2003-08-14	SIEZ-2003-08-14-000000
1084	1	2	327	1	1	CAMELOT CONSTRUCCIONES,C.A.		J311316760	20030815000000	2009-01-01	2009-12-31	AV.4 Y 8 ESQ.CALLE 72 EDIF.CLODOMIRA PISO 2 L.303			\N		\N		\N		\N	\N	2003-08-15	SIEZ-2003-08-15-000000
853	1	2	327	1	1	SERVICIOS TECNICOS AR-VI, COMPAÑIA ANONIMA		J070234318	20020905000000	2009-01-01	2009-12-31	CALLE 67 N. 63-155 LOS OLIVOS			\N		\N		\N		\N	\N	2002-09-05	SIEZ-2002-09-05-000000
1652	1	2	327	1	1	CORPORACION ZUMAQUE,S.A.		J307585080	20010522000000	2009-01-01	2009-12-31	CARRETERA N SECTOR EL DANTO CIUDAD OJEDA			\N		\N		\N		\N	\N	2001-05-22	SIEZ-2001-05-22-000000
1669	1	2	327	1	1	CONSTRUCTORA VALLES,C.A.	CONVALLES	J070210117	20001116000000	2009-01-01	2009-12-31	CIRCUNVALACION 2 AV.58 NO. 96J-77			\N		\N		\N		\N	\N	2000-11-16	SIEZ-2000-11-16-000000
1441	1	2	327	1	1	INGENIERIA Y GESTION EMPRESARIAL,S.A.	INGEMSA	J306674527	20010301000001	2009-01-01	2009-12-31	C.C.SOCUY AV. 4 CALLE 67 OFICINA 29			\N		\N		\N		\N	\N	2001-03-01	SIEZ-2001-03-01-000001
908	1	2	327	1	1	NICODIBARCA,S.A.		J309519212	20021125000001	2009-01-01	2009-12-31	CIRCUNVALACION N0. 1 SECT.LOS PINOS N0. 500-125			\N		\N		\N		\N	\N	2002-11-25	SIEZ-2002-11-25-000001
1697	1	2	327	1	1	CONSTRUCCIONES Y SERVICIOS LA TORRE,C.A.	CYSLATO,C.A.	J070328061	20010813000001	2009-01-01	2009-12-31	MENE GRANDE SECTOR SANTA MARIA QUINTA MARIELIANA			\N		\N		\N		\N	\N	2001-08-13	SIEZ-2001-08-13-000001
1698	1	2	327	1	1	CASTEBAR, C.A.		J307357991	20001102000003	2009-01-01	2009-12-31	CALLEJK URB.MONTE BELLO CASA NO.11-58			\N		\N		\N		\N	\N	2000-11-02	SIEZ-2000-11-02-000003
1593	1	2	327	1	1	CONSTRUCCIONES SIGMA,S.A.	CONSSA	J070173866	20000427000000	2009-01-01	2009-12-31	AV.PRINCIPAL, ANTIGUAS OFICINAS DEL M.G.O.			\N		\N		\N		\N	\N	2000-04-27	SIEZ-2000-04-27-000000
1594	1	2	327	1	1	ZULIA INDUSTRIAL CONSTRUCTIONS,C.A.	ZIC,C.A.	J070093501	20011019000000	2009-01-01	2009-12-31	AV.5 DE JULIO ESQ.AV.17 EDIF.SAN LUIS PISO 3			\N		\N		\N		\N	\N	2001-10-19	SIEZ-2001-10-19-000000
1907	1	2	327	1	1	SUMINISTROS  Y CONSTRUCCIONES NOLETTI,C.A.		J309578103	20050607000001	2009-01-01	2009-12-31	CALLE 100 CON AV. 20 N0. 20A-17			\N		\N		\N		\N	\N	2005-06-07	SIEZ-2005-06-07-000001
1596	1	2	327	1	1	INGENIERIA B Y C, C.A.		J307562269	20010410000000	2009-01-01	2009-12-31	CALLE 74 CON ESQ.AV.14 N0.14A-126			\N		\N		\N		\N	\N	2001-04-10	SIEZ-2001-04-10-000000
974	1	2	327	1	1	CONSTRUCTORA GONMADY,C.A.	GONMADYCA	J305184402	20010330000000	2009-01-01	2009-12-31	CALLE 95 N0.3-68 EDIF.CLINICA CATEDRAL LOCAL 01			\N		\N		\N		\N	\N	2001-03-30	SIEZ-2001-03-30-000000
1766	1	2	327	1	1	SEWER WORLD SERVICES,C.A.	SEWOCA	J308739413	20031031000001	2009-01-01	2009-12-31	AV. 3E C/C 76 EDIF. ALEJANDRA PAOLA APTO. 13			\N		\N		\N		\N	\N	2003-10-31	SIEZ-2003-10-31-000001
1767	1	2	327	1	1	COSTA ATLANTIC INGENIERIA,C.A.		J310002908	20031031000002	2009-01-01	2009-12-31	A.V. 13A C/C 75 C.C EL BAUL DE LA ABUELA			\N		\N		\N		\N	\N	2003-10-31	SIEZ-2003-10-31-000002
1532	1	2	327	1	1	REPARACIONES ELECTRICAS,MECANICAS,INDUSTRIALES,NAVALES,C.A.	R.E.M.I.N.C.A.	J070153857	20010125000000	2009-01-01	2009-12-31	AV.18A N0.123-87 LOS HATICOS			\N		\N		\N		\N	\N	2001-01-25	SIEZ-2001-01-25-000000
1533	1	2	327	1	1	REPRESENTACIONES INDUSTRIALES DE OCCIDENTE,C.A.	REINOCA	J303915469	20010307000002	2009-01-01	2009-12-31	CALLE 69A N0.15-44 SECTOR DELICIAS			\N		\N		\N		\N	\N	2001-03-07	SIEZ-2001-03-07-000002
1535	1	2	327	1	1	SERVICIOS MULTIPLES DE CONTRATACION,S.A.	SERMUCOSA	J303915450	20010307000001	2009-01-01	2009-12-31	CALLE 69A N0.15-44 SECT.DELICIAS			\N		\N		\N		\N	\N	2001-03-07	SIEZ-2001-03-07-000001
1537	1	2	327	1	1	CONSTRUCCIONES E INVERSIONES A.R.C.A.		J060049571	20010406000003	2009-01-01	2009-12-31	CARRETERA STA.BARBARA EL VIGIA KM.2			\N		\N		\N		\N	\N	2001-04-06	SIEZ-2001-04-06-000003
1043	1	2	327	1	1	INVERSIONES GON-PORT,C.A.		J307402555	20020722000001	2009-01-01	2009-12-31	CALLE CONSUELO N0.3 CASCO CENTRAL			\N		\N		\N		\N	\N	2002-07-22	SIEZ-2002-07-22-000001
1832	1	2	327	1	1	GALINDO COMPAÑIA ANONIMA DE VENEZUELA	GALCAVEN	J307079002	20040504000001	2009-01-01	2009-12-31	CARRETERA LA CAÑADA AV.48 KM.10			\N		\N		\N		\N	\N	2004-05-04	SIEZ-2004-05-04-000001
1459	1	2	327	1	1	CONSTRUCTORA HERMANOS FURLANETTO,C.A.	CONFURCA	J070125098	20010405000000	2009-01-01	2009-12-31	CALLE PIAR N0.100 CIUDAD OJEDA			\N		\N		\N		\N	\N	2001-04-05	SIEZ-2001-04-05-000000
1653	1	2	327	1	1	OBRAS CIVILES FERNANDEZ, C.A.	OCIFERCA	J305857679	19990329000038	2009-01-01	2009-12-31	CIRCUNV.NO.3 EL ROSARIO CALLE 97 ENTRE AV.84B Y 85 NO.84B-50			\N		\N		\N		\N	\N	1999-03-29	SIEZ-1999-03-29-000038
1654	1	2	327	1	1	CONSTRUCCIONES Y ASFALTO ANDES, C.A.		J090015043	19990707000002	2009-01-01	2009-12-31	CARRETERA PANAMERICANA-CAJA SECA			\N		\N		\N		\N	\N	1999-07-07	SIEZ-1999-07-07-000002
1657	1	2	327	1	1	NAUD INGENIERIA,C.A.		J304311826	20010418000001	2009-01-01	2009-12-31	AV.19 ENTRE CALLES 71 Y 72 RESID.MARTA LOCAL 02			\N		\N		\N		\N	\N	2001-04-18	SIEZ-2001-04-18-000001
1659	1	2	327	1	1	CONSTRUCTORA MACBO COMPAÑIA ANONIMA		J304933410	19990929000000	2009-01-01	2009-12-31	AV.68 #65-35.LOS OLIVOS			\N		\N		\N		\N	\N	1999-09-29	SIEZ-1999-09-29-000000
1874	1	2	327	1	1	D.R.CONSTRUCCIONES C.A.	D.R.C.,C.A.	J311523324	20050221000001	2009-01-01	2009-12-31	CALLE YARACUY CASA N0. 20			\N		\N		\N		\N	\N	2005-02-21	SIEZ-2005-02-21-000001
1682	1	2	327	1	1	ACOND.MANTENIMIENTO PETROLERO Y SERVICIOS AFINES,C.A.	AMPSA,C.A.	J070162899	20030612000001	2009-01-01	2009-12-31	AV.5 C.C.18B N0.18B-75 SAN FRANCISCO			\N		\N		\N		\N	\N	2003-06-12	SIEZ-2003-06-12-000001
1814	1	2	327	1	1	CONSTRUCTORA CANQUIZ Y PERNIA,C.A.	CAYPERCA	J302207169	20040226000002	2009-01-01	2009-12-31	CALLE BOLIVAR # 124 CASA S/N			\N		\N		\N		\N	\N	2004-02-26	SIEZ-2004-02-26-000002
1692	1	2	327	1	1	TECNOLOGIA Y CONSTRUCCION DE OCCIDENTE,S.A.	TECOSA	J304189443	20020809000000	2009-01-01	2009-12-31	URB.CIUDADELA FARIA VCALLE 65 N0. 71A-26			\N		\N		\N		\N	\N	2002-08-09	SIEZ-2002-08-09-000000
1693	1	2	327	1	1	CONSTRUCTORA CATATUMBO, S.A.		J070121327	19990304000017	2009-01-01	2009-12-31	CALLE 92 N0. 82A-47			\N		\N		\N		\N	\N	1999-03-04	SIEZ-1999-03-04-000017
1694	1	2	327	1	1	INVERSIONES Y CONSTRUCCIONES AMAZONA, C.A.		J070497165	19990315000069	2009-01-01	2009-12-31	EDIFICIO BELINI,AV.15 C/C 74 PISO 2 OFIC.02			\N		\N		\N		\N	\N	1999-03-15	SIEZ-1999-03-15-000069
1181	1	2	327	1	1	CONSTRUCCIONES FERNANDEZ,C.A.	COFECA	J306421904	20010524000000	2009-01-01	2009-12-31	CALLE 72 C.C. MONTIELCO PISO 4 OF.4-4			\N		\N		\N		\N	\N	2001-05-24	SIEZ-2001-05-24-000000
1961	1	2	327	1	1	INGENIERIA Y PROYECTOS DEL LAGO, C.A.	INPROLAGO	J311509240	20051208000002	2009-01-01	2009-12-31	URB EL PINAR EDIF PINO NIGRAL 1 APART 3-F			\N		\N		\N		\N	\N	2005-12-08	SIEZ-2005-12-08-000002
1460	1	2	327	1	1	SERVICIOS,MONTAJES Y MANTENIMIENTOS,C.A.	SERMOMACA	J070548142	20010312000001	2009-01-01	2009-12-31	VIA AEROPUERTO N0. 75-1591			\N		\N		\N		\N	\N	2001-03-12	SIEZ-2001-03-12-000001
1781	1	2	327	1	1	DISTRIBUIDORA BRACHO VILLALOBOS,C.A.	DISBRAVICA	J305945403	20031202000002	2009-01-01	2009-12-31	CALLE 96A GALPON # 19-55			\N		\N		\N		\N	\N	2003-12-02	SIEZ-2003-12-02-000002
1782	1	2	327	1	1	CONSTRUCCIONES BARBOZA & BARBOZA,C.A.		J300221385	20031204000001	2009-01-01	2009-12-31	CALLE 84 AV.3E EDIF.COMUNIMAR P.B.			\N		\N		\N		\N	\N	2003-12-04	SIEZ-2003-12-04-000001
1783	1	2	327	1	1	NELLY HERNANDEZ REPRESENTACIONES,C.A.	N.H.REPRESENTACIONES,C.A.	J303415636	20031210000001	2009-01-01	2009-12-31	CALLE 72 ESQ.CALLE 77 C.C.TAMACUARY LOCAL16 P.A.			\N		\N		\N		\N	\N	2003-12-10	SIEZ-2003-12-10-000001
1785	1	2	327	1	1	CONSTRUCTORA TERRAPLEN,C.A.		J001326324	20031211000001	2009-01-01	2009-12-31	URB. EL CAUJARO KM.11 VIA A PERIJA CALLE 49H			\N		\N		\N		\N	\N	2003-12-11	SIEZ-2003-12-11-000001
1524	1	2	327	1	1	ARQUITEC,S.A.		J070520639	20010131000001	2009-01-01	2009-12-31	CALLE 84 UNION RES.DON PAULO 3F-110			\N		\N		\N		\N	\N	2001-01-31	SIEZ-2001-01-31-000001
1855	1	2	327	1	1	TOPOGRAFIA,INSPECCION Y CONSTRUCCION,C.A.	TOINCO,C.A.	J311801804	20040831000002	2009-01-01	2009-12-31	VIA LA CULEBRA SEGUNDAENTRADA URB. DOÑA VALENTINA CASA N0.1			\N		\N		\N		\N	\N	2004-08-31	SIEZ-2004-08-31-000002
1856	1	2	327	1	1	CONSTRUCCIONES & PROYECTOS ,C.A.	C & P,C.A.	J311423885	20040831000003	2009-01-01	2009-12-31	C.C. EL RIEGO LOCAL 3			\N		\N		\N		\N	\N	2004-08-31	SIEZ-2004-08-31-000003
1857	1	2	327	1	1	CONSTRUCCIONES RODRIGUEZ & MALAVE,C.A.	C.R.&M,C.A.	J311735810	20040903000001	2009-01-01	2009-12-31	CALLE 83B AV. 2A Y 2B EDIF.LUGANO PIAZZA APT. 15C			\N		\N		\N		\N	\N	2004-09-03	SIEZ-2004-09-03-000001
1858	1	2	327	1	1	CONSTRUCCIONES E INVERSIONES ISRAEL ANDRADE,C.A.	CONIAND,C.A.	J070504447	20040908000001	2009-01-01	2009-12-31	AV.15 CON CALLE 89B EDIF. LAS PALMERAS			\N		\N		\N		\N	\N	2004-09-08	SIEZ-2004-09-08-000001
1681	1	2	327	1	1	CONSTRUCTORA ZODIACO,C.A.	CONZO,C.A.	J070499400	20001128000001	2009-01-01	2009-12-31	EDIF.PIACOA AV.20 PISO 2 ENTRE CALLE 69 Y 69A			\N		\N		\N		\N	\N	2000-11-28	SIEZ-2000-11-28-000001
2002	1	2	327	1	1	SERVICIO MARITIMOS & IMPORTADORA LEON C.A.	SERMALECA	J306307737	20060406000001	2009-01-01	2009-12-31	CALLE 17 CON AV.6 No 6-75. SECTOR PERU			\N		\N		\N		\N	\N	2006-04-06	SIEZ-2006-04-06-000001
2003	1	2	327	1	1	INVERSIONES YAHOO, C.A.	INYA, C.A	J305947007	20060406000002	2009-01-01	2009-12-31	AV.49. SECTOR SABANETA #99F-60			\N		\N		\N		\N	\N	2006-04-06	SIEZ-2006-04-06-000002
2057	1	2	327	1	1	COOPERATIVA  DE SERVICIOS MULTIPLES CASIGUA 41	COOPESERVICA 41	J311127836	20061113000001	2009-01-01	2009-12-31	BARRIO NORIEGA TRIGO SECTOR LA CRUZ  CASA S/N			\N		\N		\N		\N	\N	2006-11-13	SIEZ-2006-11-13-000001
2058	1	2	327	1	1	CONSTRUCCIONES E INVERSIONES COMPOSTELA SOCIEDAD ANONIMA	CONCOSA	J312835680	20061113000002	2009-01-01	2009-12-31	KM.90 SAN JUAN II,VILLA DEL ROSARIO			\N		\N		\N		\N	\N	2006-11-13	SIEZ-2006-11-13-000002
2059	1	2	327	1	1	EDIFICACIONES 50/50, C.A.		J070560380	20061114000001	2009-01-01	2009-12-31	AV. 3C CON CALLE 67A CC RESIDENCIA DEL LADO PISO 1 OF 11			\N		\N		\N		\N	\N	2006-11-14	SIEZ-2006-11-14-000001
2061	1	2	327	1	1	INFRAESTRUCTURAS VENEZOLANAS COMPAÑIA ANONIMA	INFRAVE,C.A.	J311616888	20061117000001	2009-01-01	2009-12-31	CARRETERA L, CIUDAD OJEDA,C.C. VILLA SAN JOSE LOCAL 02			\N		\N		\N		\N	\N	2006-11-17	SIEZ-2006-11-17-000001
1984	1	2	327	1	1	DESARROLLOS DIMAR, C.A.		J305828555	20060323000001	2009-01-01	2009-12-31	CIRCUNVALACION Nº 2 Nº 98 E-71			\N		\N		\N		\N	\N	2006-03-23	SIEZ-2006-03-23-000001
1185	1	2	327	1	1	INVERSORA S Y D, C.A.		J303360254	19990308000062	2009-01-01	2009-12-31	AV.12 ENTRE CALLES 78 Y 79 EDIF.TORRE 12 MEZZANINE 3			\N		\N		\N		\N	\N	1999-03-08	SIEZ-1999-03-08-000062
688	1	2	327	1	1	AIRES Y PROYECTOS,C.A.	AIPROCA	J308594849	20011031000001	2009-01-01	2009-12-31	URB.RAUL LEONI II ETAPA BLOQUE 6 EDIF.2 APTO.00-01			\N		\N		\N		\N	\N	2001-10-31	SIEZ-2001-10-31-000001
689	1	2	327	1	1	DISEÑOS,PROYECTOS E INVERSIONES MARAF,C.A.		J307429038	20010928000000	2009-01-01	2009-12-31	AV.08 CON CALLE 95 SECTOR CASCO CENTRAL C.C.STA.BARBARA L.22			\N		\N		\N		\N	\N	2001-09-28	SIEZ-2001-09-28-000000
690	1	2	327	1	1	CORPORACION VENEZOLANA DE SERVICIOS DAVILA,C.A.	CODAVEN,C.A.	J308421944	20010926000000	2009-01-01	2009-12-31	SHOWROOM AV. 15 MALL DELICIAS PLAZA,LOCAL 129 PLANTA ALTA			\N		\N		\N		\N	\N	2001-09-26	SIEZ-2001-09-26-000000
691	1	2	327	1	1	MAGNA, COMPAÑIA ANONIMA		J070369612	20001205000000	2009-01-01	2009-12-31	C.C.CARIDAD DEL COBRE AV.12 C/C 52 2DO.NIVEL			\N		\N		\N		\N	\N	2000-12-05	SIEZ-2000-12-05-000000
693	1	2	327	1	1	CONSTRUCCIONES Y ASESORIAS VENEZOLANAS,C.A.	CAVENCA	J307499354	20011002000001	2009-01-01	2009-12-31	CALLE 64 N0.8-33 SECTOR SANTA RITA			\N		\N		\N		\N	\N	2001-10-02	SIEZ-2001-10-02-000001
694	1	2	327	1	1	CONSTRUCTORA LOAIZA-VILCHEZ,C.A.	CLOVILCA	J307578548	20011022000004	2009-01-01	2009-12-31	SECTOR VIRGEN DEL CARMEN CARRETERA EL CANO CASA S/N			\N		\N		\N		\N	\N	2001-10-22	SIEZ-2001-10-22-000004
695	1	2	327	1	1	CONSTRUCCIONES JIMENEZ CAMACHO, C.A.	CONSTRUCCIONES JIMECA	J070272430	19990310000007	2009-01-01	2009-12-31	AV.15 DELICIAS CON CALLE 89B.EDIF.CENTRO EMPRESARIAL PISO 2			\N		\N		\N		\N	\N	1999-03-10	SIEZ-1999-03-10-000007
696	1	2	327	1	1	CONSTRUCCIONES,MANTENIMIENTO Y SERVICIOS TABORDA,C.A.	COMSERTA	J303457754	20011011000001	2009-01-01	2009-12-31	URB.MONTE CLARO SECTOR M N0.M9			\N		\N		\N		\N	\N	2001-10-11	SIEZ-2001-10-11-000001
438	1	2	327	1	1	CONSTRUCCIONES Y PROYECTOS CYPCA,C.A.	CYPCA,C.A.	J070456299	20001213000002	2009-01-01	2009-12-31	AV. LA LIMPIA NO-41-45			\N		\N		\N		\N	\N	2000-12-13	SIEZ-2000-12-13-000002
699	1	2	327	1	1	REPRESENTACIONES Y SERVICIOS MEDINA,C.A.	RESERMECA	J302339391	20011126000000	2009-01-01	2009-12-31	CARRETERA J BARRIO SAN JOSE N0. 23A  CIUDAD OJEDA			\N		\N		\N		\N	\N	2001-11-26	SIEZ-2001-11-26-000000
704	1	2	327	1	1	VERZAM,C.A.	VERZACA	J306220682	20010213000000	2009-01-01	2009-12-31	URB.EL ROSAL SUR CALLE 40 N0. 13-40			\N		\N		\N		\N	\N	2001-02-13	SIEZ-2001-02-13-000000
616	1	2	327	1	1	CONSTRUCTORA RONSAN		V093304620	20010405000002	2009-01-01	2009-12-31	AV.49A CALLE 167 N0. 1-61 BA. DALIA DE FERNANDEZ			\N		\N		\N		\N	\N	2001-04-05	SIEZ-2001-04-05-000002
840	1	2	327	1	1	CONSTRUCTORA NISI Y ASOCIADOS,C.A.		J307827777	20020530000000	2009-01-01	2009-12-31	CIRC.3 AV.98 N0.98-57 SECT.EL ROSARIO CARDON II EDIF.EPIAYU			\N		\N		\N		\N	\N	2002-05-30	SIEZ-2002-05-30-000000
924	1	2	327	1	1	OCTAVO GRUPO INVERSIONES, C.A.	OCTAINCA	J070557370	19990324000095	2009-01-01	2009-12-31	CIRCUNVALACION NO.2,C/C 99 NO.99-48 CENTRO OCTAINCA			\N		\N		\N		\N	\N	1999-03-24	SIEZ-1999-03-24-000095
925	1	2	327	1	1	TELECOMUNICACIONES OK-TEL,C.A.		J307428287	20010404000001	2009-01-01	2009-12-31	URB.FUNDA PERIJA INTERCEP.DE LA C/B CON C/A-2 N0.34D-3			\N		\N		\N		\N	\N	2001-04-04	SIEZ-2001-04-04-000001
778	1	2	327	1	1	CONSTRUCCIONES HENCARCA		J307678810	20011015000000	2009-01-01	2009-12-31	CALLE 108 BARRIO ALTAMIRA N0. 108-35			\N		\N		\N		\N	\N	2001-10-15	SIEZ-2001-10-15-000000
1493	1	2	327	1	1	MEDITRON,C.A.		J000814660	20011002000000	2009-01-01	2009-12-31	CALLE 10 LA URBINA EDIF. MEDITRON,CARACAS			\N		\N		\N		\N	\N	2001-10-02	SIEZ-2001-10-02-000000
1494	1	2	327	1	1	INVERSIONES COSTA MARENSE,C.A.	ICOMCA	J300079929	20001213000004	2009-01-01	2009-12-31	AV.7 ENTRE CALLE 58 Y 59 NO. 58-61 ZAPARA DOS			\N		\N		\N		\N	\N	2000-12-13	SIEZ-2000-12-13-000004
849	1	2	327	1	1	SERVICIOS DE GEOLOGIA,ELECTRICIDAD Y SUMINISTRO,C.A.	GESCA	J070472529	20010620000000	2009-01-01	2009-12-31	C.C.SIMON BOLIVAR,PLANTA ALTA,LOCAL 8 URB.TAMARE			\N		\N		\N		\N	\N	2001-06-20	SIEZ-2001-06-20-000000
918	1	2	327	1	1	INCIARTE INGENIERIA,C.A.	ININCA	J300168107	20001228000001	2009-01-01	2009-12-31	AV.13-A N0.74-45			\N		\N		\N		\N	\N	2000-12-28	SIEZ-2000-12-28-000001
973	1	2	327	1	1	EQUIPA DE OCCIDENTE C.A.		J070474513	20000316000000	2009-01-01	2009-12-31	AV. 3F CALLE 64 NO. 3F-47 SECTOR DON BOSCO			\N		\N		\N		\N	\N	2000-03-16	SIEZ-2000-03-16-000000
1112	1	2	327	1	1	OLAR CONTRATACIONES,C.A.	OLAR CONTRATACIONES,C.A.	J310250073	20030808000000	2009-01-01	2009-12-31	CALLE 71 NO. 12-54 ENTRE AV. 12 Y 13 SECTOR TIERRA NEGRA			\N		\N		\N		\N	\N	2003-08-08	SIEZ-2003-08-08-000000
1133	1	2	327	1	1	SER.TECNOLOGICOS DE GEOLOGIA,OBRAS CIVILES E INFORMATICA,C.A	GEOCINTECH,C.A.	J308224510	20010710000001	2009-01-01	2009-12-31	AV.4 SECTOR CASCO CENTRAL CASA N0.94-55			\N		\N		\N		\N	\N	2001-07-10	SIEZ-2001-07-10-000001
1707	1	2	327	1	1	CONSTRUCCIONES Y SERVICIOS DEL NORTE,C.A.	CONSTRUNORTE,C.A.	J303432905	20010308000002	2009-01-01	2009-12-31	AV.DELICIAS C.C.DEL SAVIO N0. 55-243N P.B. LOCAL 1-A			\N		\N		\N		\N	\N	2001-03-08	SIEZ-2001-03-08-000002
1780	1	2	327	1	1	INVERSIONES MATAPALO,C.A.		J309500406	20031202000001	2009-01-01	2009-12-31	AV.2A CASA #71-146			\N		\N		\N		\N	\N	2003-12-02	SIEZ-2003-12-02-000001
1887	1	2	327	1	1	SISTEMA INTEGRAL DE SALUD,C.A.	SISCA	J312898437	20050406000001	2009-01-01	2009-12-31	AV.3E C.CALLE 79 N0. 3E-11			\N		\N		\N		\N	\N	2005-04-06	SIEZ-2005-04-06-000001
1890	1	2	327	1	1	CONSTRUCCIONES Y SERVICIOS LIDOTE,C.A.		J312665840	20050408000001	2009-01-01	2009-12-31	CALLE 49B AV. 99  EDIF. A-3 APTO.14			\N		\N		\N		\N	\N	2005-04-08	SIEZ-2005-04-08-000001
1868	1	2	327	1	1	H.B.M. SUPPLY,C.A.		J309365878	20041206000001	2009-01-01	2009-12-31	AV.13 ENTRE CALLES 78-79 N0. 78-68			\N		\N		\N		\N	\N	2004-12-06	SIEZ-2004-12-06-000001
1935	1	2	327	1	1	CONSTRUCCIONES CIYEN, C.A.		J312701676	20050909000001	2009-01-01	2009-12-31	CALLE 124 N0. 67A-11			\N		\N		\N		\N	\N	2005-09-09	SIEZ-2005-09-09-000001
1956	1	2	327	1	1	CONSTRUCCIONES OMNICA, C.A.	OMNICA, C.A.	J313900710	20051130000001	2009-01-01	2009-12-31	URB. LA TRINIDAD C.C. PALAIMA PISO 2 OFICINA 2-6			\N		\N		\N		\N	\N	2005-11-30	SIEZ-2005-11-30-000001
967	1	2	327	1	1	CONSTRUCCIONES,LINEAS,ACUEDUCTOS,MONTAJES,INSTALACIONES S.A.	CLAM INSTALACIONES,S.A.	J070361425	20010427000002	2009-01-01	2009-12-31	CARRETERA PERIJA KM.6 1/2 C.EMPRESARIAL INDICA ZONA INDUST.			\N		\N		\N		\N	\N	2001-04-27	SIEZ-2001-04-27-000002
1107	1	2	327	1	1	GRUPO DE INVERSIONES Y SERVICIOS,C.A.	GRISERCA	J304353006	20010907000000	2009-01-01	2009-12-31	AV 3F,NO.58A-58,ANTIGUO GALPON LA SUIZA.			\N		\N		\N		\N	\N	2001-09-07	SIEZ-2001-09-07-000000
1166	1	2	327	1	1	INVERSIONES JADID, C.A.	JADIDCA	J070421860	19990319000036	2009-01-01	2009-12-31	CALLE 80 AV.13 NO.80-80			\N		\N		\N		\N	\N	1999-03-19	SIEZ-1999-03-19-000036
814	1	2	327	1	1	INVERSIONES RODRIGUEZ RAMIREZ,C.A.	RORINCA	J302827361	20011107000001	2009-01-01	2009-12-31	URB.MONTE BELLO CALLES M-N N0. 12-31			\N		\N		\N		\N	\N	2001-11-07	SIEZ-2001-11-07-000001
433	1	2	327	1	1	CONSTRUCTORA CRESMO, C.A.		J070413379	19990308000068	2009-01-01	2009-12-31	AV.9B C/CALLE QTA.CHECHE SECTOR TIERRA NEGRA			\N		\N		\N		\N	\N	1999-03-08	SIEZ-1999-03-08-000068
913	1	2	327	1	1	CONSTRUCTORA BOSCAN,C.A.	CONBOS,C.A.	J308893781	20021022000000	2009-01-01	2009-12-31	CALLE 69 N0. 66-25 LOS OLIVOS			\N		\N		\N		\N	\N	2002-10-22	SIEZ-2002-10-22-000000
931	1	2	327	1	1	CONSTRUCCIONES A & M, C.A.		J306411194	20010122000000	2009-01-01	2009-12-31	URB.MAGISTERIAL CASA NO. 185			\N		\N		\N		\N	\N	2001-01-22	SIEZ-2001-01-22-000000
1595	1	2	327	1	1	BELLO GONZALEZ,S.A	BEGOSA	J307461918	20010824000000	2009-01-01	2009-12-31	CALLE CHURUGUARA NO.149,SECTOR LA GLORIA			\N		\N		\N		\N	\N	2001-08-24	SIEZ-2001-08-24-000000
1711	1	2	327	1	1	D.I.T. PROYECTOS Y CONSTRUCCIONES, C.A.		J301986903	19990412000029	2009-01-01	2009-12-31	SECTOR LAS TUNAS CALLE 80 CON AV.78			\N		\N		\N		\N	\N	1999-04-12	SIEZ-1999-04-12-000029
1776	1	2	327	1	1	ING. NOE CARRASQUERO GONZALES		V016599162	20010207000000	2009-01-01	2009-12-31	CALLE 69# 15-75 EDIF.EDIMAR.APTO.4-B			\N		\N		\N		\N	\N	2001-02-07	SIEZ-2001-02-07-000000
1827	1	2	327	1	1	PROYECTOS Y OBRAS DEL LAGO,C.A.	PROYLAGOCA	J311012702	20040318000001	2009-01-01	2009-12-31	AV.4 BELLA VISTA CON CALLE 78 C.C. DON SILVIO LOCAL PA-1			\N		\N		\N		\N	\N	2004-03-18	SIEZ-2004-03-18-000001
1881	1	2	327	1	1	ICEL,C.A.		J303383858	20050311000002	2009-01-01	2009-12-31	CALLE 69A N0. 19-11			\N		\N		\N		\N	\N	2005-03-11	SIEZ-2005-03-11-000002
1925	1	2	327	1	1	BAHICONSA  S.A.	BAHICONSA	J30988892	20050805000001	2009-01-01	2009-12-31	CALLE 7 SECTOR EL PARE DIAG. TERM. DE PASAJEROS NO. 6-95			\N		\N		\N		\N	\N	2005-08-05	SIEZ-2005-08-05-000001
1948	1	2	327	1	1	CONSTRUCCIONES E INVERSIONES VENEZOLANAS, C. A.	COINVECA	J313671126	20051031000001	2009-01-01	2009-12-31	ZONA INDUSTRIAL, SECTOR EL GAITERO, AV 68 Nº 131-99.			\N		\N		\N		\N	\N	2005-10-31	SIEZ-2005-10-31-000001
1949	1	2	327	1	1	SERVICIOS Y CONSTRUCCIONES, C.A.	SERVICONCA	J313264245	20051101000001	2009-01-01	2009-12-31	URB. LA PAZ, AV. 56 Nº 96D-31			\N		\N		\N		\N	\N	2005-11-01	SIEZ-2005-11-01-000001
1950	1	2	327	1	1	CONSTRUCTORA  MARTONE & PEREZ,C.A.	CONMARPE,C.A.	J070488042	20051110000001	2009-01-01	2009-12-31	CIRCUNVALACION N0.1 AV.23 N0. 21-64 SECTOR NORIEGA TRIGO			\N		\N		\N		\N	\N	2005-11-10	SIEZ-2005-11-10-000001
1951	1	2	327	1	1	INVERSIONES Y SERVICIOS OCCIDENTALES,C.A.	INSEROCA	J313977268	20051110000002	2009-01-01	2009-12-31	AV.83 BACHAQUERO SECTOR EL MURO			\N		\N		\N		\N	\N	2005-11-10	SIEZ-2005-11-10-000002
1602	1	2	327	1	1	CASAL C.A.		J070196890	20000530000000	2009-01-01	2009-12-31	URB. LA ROTARIA CALLE 83 NO. 85-147			\N		\N		\N		\N	\N	2000-05-30	SIEZ-2000-05-30-000000
2091	1	2	327	1	1	GOLLARZA & CARDOZO , CONSTRUCCIONES, C.A	G & C, C.A	J293666074	20070402000002	2009-01-01	2009-12-31	POMONA SECTOR COREA, CALLE SAN LUIS N. 105A			\N		\N		\N		\N	\N	2007-04-02	SIEZ-2007-04-02-000002
2159	1	2	327	1	1	INVERSIONES GONTA, COMPAÑIA ANONIMA	GONTA, C.A.	J295414951	20080317000002	2009-01-01	2009-12-31	AV. 82A NO. 79F-08 SECTOR AYACUCHO			\N		\N		\N		\N	\N	2008-03-17	SIEZ-2008-03-17-000002
730	1	2	327	1	1	DELTRY,C.A.		J303355145	20020102000000	2009-01-01	2009-12-31	RESID.RIO ARRIBA EDIF.12 APTO.51 MERIDA			\N		\N		\N		\N	\N	2002-01-02	SIEZ-2002-01-02-000000
848	1	2	327	1	1	REMODELACIONES Y MANTENIMIENTO,C.A.	REMANCA	J309089129	20020826000000	2009-01-01	2009-12-31	CALLE 65 ENTRE AV. 4 Y 8,RESIDENCIAS TOVAR PISO 7,APTO.7B			\N		\N		\N		\N	\N	2002-08-26	SIEZ-2002-08-26-000000
850	1	2	327	1	1	PROYECTOS Y CONSTRUCCIONES L & T, C.A.	PROYCO	J305854920	19990324000070	2009-01-01	2009-12-31	AV.BELLA VISTA CON CALLE 67 CECILIO ACOSTA			\N		\N		\N		\N	\N	1999-03-24	SIEZ-1999-03-24-000070
920	1	2	327	1	1	INVERSIONES DON ANGEL,C.A.		J070292761	20011102000001	2009-01-01	2009-12-31	CALLE 69A N0.224-42			\N		\N		\N		\N	\N	2001-11-02	SIEZ-2001-11-02-000001
1624	1	2	327	1	1	OBRAS DE INGENIERIA DEL LAGO, C.A.	OBRINLAGO, C.A.	J070296160	19990305000048	2009-01-01	2009-12-31	B\\EL MANZANILLO, AV.28 N0.131-693			\N		\N		\N		\N	\N	1999-03-05	SIEZ-1999-03-05-000048
1626	1	2	327	1	1	ESTRUCTURA Y VIALIDAD,C.A.	ESTRUVIAL,C.A.	J307770856	20010511000001	2009-01-01	2009-12-31	AV.2 EL MILAGRO C.CALLE 86 EDIF.ANGELICA B LOCAL 06			\N		\N		\N		\N	\N	2001-05-11	SIEZ-2001-05-11-000001
1634	1	2	327	1	1	CONSTRUCTORA ARRIETA Y NORIEGA C.A.	ARNOCA	J070321300	20010406000000	2009-01-01	2009-12-31	AV.21A N0. 100-60 SABANETA			\N		\N		\N		\N	\N	2001-04-06	SIEZ-2001-04-06-000000
1635	1	2	327	1	1	SERVICIOS PROFESIONALES DE INGENIERIA,C.A.	SEPROIN,C.A.	J309353411	20020917000000	2009-01-01	2009-12-31	AV.3H RESID.REPUBLICA P.B. LOCAL N0. 2			\N		\N		\N		\N	\N	2002-09-17	SIEZ-2002-09-17-000000
1636	1	2	327	1	1	IMECAV C.A.		J070141530	20000410000000	2009-01-01	2009-12-31	AVE.INTERCOMUNAL CARRETERA "H" SECTOR EL PRADO.			\N		\N		\N		\N	\N	2000-04-10	SIEZ-2000-04-10-000000
1637	1	2	327	1	1	MECANICA-ELECTRICIDAD INSTRUMENTACION,C.A.	M.E.I.C.A.	J070141336	20001124000000	2009-01-01	2009-12-31	AV 10 CALLES 66 Y 66A EDIF.UCHIRE APTO.1-A			\N		\N		\N		\N	\N	2000-11-24	SIEZ-2000-11-24-000000
1500	1	2	327	1	1	CONSTRUCCIONES H Y P,C.A.		J306959092	20010212000001	2009-01-01	2009-12-31	KM.48 VIA A PERIJA			\N		\N		\N		\N	\N	2001-02-12	SIEZ-2001-02-12-000001
1501	1	2	327	1	1	INGENIERIA ESPECIALIZADA DE MARACAIBO, C.A.	INGEMA,C.A.	J304366175	20000807000000	2009-01-01	2009-12-31	AV.8B 61-49 ENTRE CALLES 61 Y 62			\N		\N		\N		\N	\N	2000-08-07	SIEZ-2000-08-07-000000
1504	1	2	327	1	1	CONSTRUCTORA MUNICIPAL,C.A.	CONMUPALCA	J301944224	20010302000000	2009-01-01	2009-12-31	SECTOR SAN AGUSTIN CALLE 47 N0. 16B-48			\N		\N		\N		\N	\N	2001-03-02	SIEZ-2001-03-02-000000
1506	1	2	327	1	1	SERVICIOS INTEGRALES DE INGENIERIA,C.A.	SERTINCA	J306066942	20010302000003	2009-01-01	2009-12-31	CALLE 59A N0.4-30 SECTOR LAS MERCEDES			\N		\N		\N		\N	\N	2001-03-02	SIEZ-2001-03-02-000003
981	1	2	327	1	1	HYDROSERVICES C.A.		J302274664	19991105000002	2009-01-01	2009-12-31	AV.SANTA RITA ESQ. CALLE 8A 73-80			\N		\N		\N		\N	\N	1999-11-05	SIEZ-1999-11-05-000002
1004	1	2	327	1	1	CONSTRUCCIONES Y MANTENIMIENTO PROCCY,C.A.	COMPROCA	J309008340	20021002000000	2009-01-01	2009-12-31	URB.RAUL LEONI 1ERA.ETAPA AV. 92-C EDIF. 7			\N		\N		\N		\N	\N	2002-10-02	SIEZ-2002-10-02-000000
1078	1	2	327	1	1	PROYECTOS CONSTRUCCIONES Y SOLUCIONES ALTERNATIVAS,C.A.	PROSALCA	J308793833	20020425000000	2009-01-01	2009-12-31	S.MONTE CLARO AV.06, C.C. IRAMA,LOCAL1			\N		\N		\N		\N	\N	2002-04-25	SIEZ-2002-04-25-000000
1080	1	2	327	1	1	SUPLIDORES TECNICOS ESPECIALIZADOS,C.A.	SUPLITECA	J310029709	20030606000000	2009-01-01	2009-12-31	CALLE 63 C.AV.5 EDIF.LAS MERCEDES P.B. OFIC.A-2 S.LAS MERCED			\N		\N		\N		\N	\N	2003-06-06	SIEZ-2003-06-06-000000
1081	1	2	327	1	1	ONICA, S.A.		J070092920	19990302000007	2009-01-01	2009-12-31	CIRCUVALACION NO.1 N.500 DETRAS DEL IMAU			\N		\N		\N		\N	\N	1999-03-02	SIEZ-1999-03-02-000007
1115	1	2	327	1	1	CONSTRUCCIONES LANGUT C.A.		J304508875	20000829000000	2009-01-01	2009-12-31	AV.13A ENTRE CALLES 71 Y 72 NO. 71-84			\N		\N		\N		\N	\N	2000-08-29	SIEZ-2000-08-29-000000
1453	1	2	327	1	1	FIGUEROA GARCIA,C.A.	FIGARCA	J305082294	20010108000000	2009-01-01	2009-12-31	CARRETERA NACIONAL ESQUINA TASAJERAS,LAGUNILLAS			\N		\N		\N		\N	\N	2001-01-08	SIEZ-2001-01-08-000000
1455	1	2	327	1	1	BLINDACA,SERVICIO Y MANTENIMIENTO,C.A.	BLINDACA	J300059979	20010130000000	2009-01-01	2009-12-31	AV.8 SANTA RITA CON CALLE 71 EDIF.RISSON LOCALES 1 Y 2			\N		\N		\N		\N	\N	2001-01-30	SIEZ-2001-01-30-000000
934	1	2	327	1	1	CONSTRUCTORES ASOCIADOS INTERNACIONALES, S.A.	CONSTRUINSA	J303587321	19990416000044	2009-01-01	2009-12-31	CALLE 88 ENTRE AVDAS.15/16 NO.15-32			\N		\N		\N		\N	\N	1999-04-16	SIEZ-1999-04-16-000044
1462	1	2	327	1	1	GERENCIA,MANTENIMIENTO Y CONSTRUCCIONES,C.A.	GEMACOCA	J090379207	20010320000000	2009-01-01	2009-12-31	AV.BOLIVAR C.C.EDIVICA II LOCAL 44 VALERA EDO.TRUJILLO			\N		\N		\N		\N	\N	2001-03-20	SIEZ-2001-03-20-000000
1605	1	2	327	1	1	YOLRUF CONSTRUCCIONES, C.A.	YOLRUFCA	J306525815	20001025000000	2009-01-01	2009-12-31	AV.13 CON CALLE 72 CASA NO. 71-62			\N		\N		\N		\N	\N	2000-10-25	SIEZ-2000-10-25-000000
1647	1	2	327	1	1	LUFER CONSTRUCCIONES,C.A.	LUFERCA	J307326891	20030506000000	2009-01-01	2009-12-31	CALLE 100 EDIF.ARAGUANEY N0.5 APTO.1-D			\N		\N		\N		\N	\N	2003-05-06	SIEZ-2003-05-06-000000
1648	1	2	327	1	1	REALIZACION, INVERSIONES, PROYECTOS Y CONSTRUCCIONES, C.A.	REIMPROCA	J070288264	19991214000003	2009-01-01	2009-12-31	AV.8 SECTOR ZAPARA NO.58-56			\N		\N		\N		\N	\N	1999-12-14	SIEZ-1999-12-14-000003
1672	1	2	327	1	1	INGENIERIA DE CONTROL, C.A.	INTROL,C.A.	J304885091	19990319000022	2009-01-01	2009-12-31	AV.12 CALLE 63 N0.63-35 URB.MARACAIBO			\N		\N		\N		\N	\N	1999-03-19	SIEZ-1999-03-19-000022
1710	1	2	327	1	1	INVERSIONES Y CONSTRUCCIONES CDF 2193, C.A.		J301986890	19990416000037	2009-01-01	2009-12-31	AV.9 N. F-36 URB. IRAMA			\N		\N		\N		\N	\N	1999-04-16	SIEZ-1999-04-16-000037
1712	1	2	327	1	1	GRUPO VENEZOLANO DE CONSTRUCCION C.A.	GRUVECO	J300616940	20001019000002	2009-01-01	2009-12-31	AV.16 ESQ.CALLE 89-B C.C. DELICIAS II LOCAL 05			\N		\N		\N		\N	\N	2000-10-19	SIEZ-2000-10-19-000002
1774	1	2	327	1	1	MAYOR,C.A.		J310118310	20031119000001	2009-01-01	2009-12-31	SANTA ELENA DE ARENALES CALLE 3 # 2-5			\N		\N		\N		\N	\N	2003-11-19	SIEZ-2003-11-19-000001
1880	1	2	327	1	1	CONSTRUCTORA MONTIEL PARRA.C.A.	MOPARCA	J312643730	20050311000001	2009-01-01	2009-12-31	AV.4 BELLA VISTA C.C.CLODOMIRA PISO 2 OFIC. 303			\N		\N		\N		\N	\N	2005-03-11	SIEZ-2005-03-11-000001
1505	1	2	327	1	1	INVERSIONES Y DESARROLLO LOS ANDES,C.A.	INDERANDES,C.A.	J302956110	20010312000000	2009-01-01	2009-12-31	URB.LAS ACACIAS C.C. EL PINAR PISO 5 APTO 13			\N		\N		\N		\N	\N	2001-03-12	SIEZ-2001-03-12-000000
1509	1	2	327	1	1	CONSTRUCTORA FUTURO,C.A.	COFUCA	J304886497	20020115000000	2009-01-01	2009-12-31	CALLE EL POZO C.C. CALLE SANTA ROSA N0.26 POZUELO			\N		\N		\N		\N	\N	2002-01-15	SIEZ-2002-01-15-000000
1510	1	2	327	1	1	PALAS INVERSORA,C.A.	PALINCA	J304415052	20010315000005	2009-01-01	2009-12-31	AV.14A N0. 76-11 SECT.5 DE JULIO C.C. LUCKY LOCAL 5			\N		\N		\N		\N	\N	2001-03-15	SIEZ-2001-03-15-000005
590	1	2	327	1	1	INSTALACIONES, MECANICAS ELECTRICAS Y REFRIGERACION, C.A.	IMARECA	J306451960	19991026000006	2009-01-01	2009-12-31	B/PUERTO RICO CALLE 61C #.29C-219			\N		\N		\N		\N	\N	1999-10-26	SIEZ-1999-10-26-000006
957	1	2	327	1	1	PERFORACIONES ANDRADE COMPAÑIA ANONIMA	PERGAR	J070443707	19990528000000	2009-01-01	2009-12-31	CALLE 90-# 16-23 SECTOR DELICIAS			\N		\N		\N		\N	\N	1999-05-28	SIEZ-1999-05-28-000000
958	1	2	327	1	1	CONSTRUCTION & ENGINEERING SERVICE, S.A.	CONESSA	J305739137	19990329000057	2009-01-01	2009-12-31	CARRETERA H NO.95			\N		\N		\N		\N	\N	1999-03-29	SIEZ-1999-03-29-000057
959	1	2	327	1	1	CARIBBEAN ENERGY SERVICES,C.A.		J308684104	20020709000000	2009-01-01	2009-12-31	AV.INTERCOMUNAL SECTOR LA VACA- TIA JUANA			\N		\N		\N		\N	\N	2002-07-09	SIEZ-2002-07-09-000000
960	1	2	327	1	1	CONSTRUCCIONES E INVERSIONES DURADERO S, C.A.		J303685021	19990517000009	2009-01-01	2009-12-31	EL PINAR PINO MORO 11 APTO 2D ZULIA ZONA POSTAL 4001			\N		\N		\N		\N	\N	1999-05-17	SIEZ-1999-05-17-000009
961	1	2	327	1	1	ANAN CONSTRUCCIONES,C.A.	ANANCO,C.A.	J306526064	20010122000003	2009-01-01	2009-12-31	LA CONCEPCION,CAMPO ELIAS CASA NO. 30 "B"			\N		\N		\N		\N	\N	2001-01-22	SIEZ-2001-01-22-000003
962	1	2	327	1	1	CONSTRUCCIONES TOMCAR,C.A.	TOMCAR,C.A.	J307378387	20010202000002	2009-01-01	2009-12-31	AV.45 CASA NO.97-03			\N		\N		\N		\N	\N	2001-02-02	SIEZ-2001-02-02-000002
963	1	2	327	1	1	INGENIERIA MODERNA DE VENEZUELA,C.A.	INGEMOVECA	J305498270	20011031000000	2009-01-01	2009-12-31	URB. FUNFACION MENDOZA CALLE 126-B # 22A-50			\N		\N		\N		\N	\N	2001-10-31	SIEZ-2001-10-31-000000
1023	1	2	327	1	1	INVERSIONES RIBAR,C.A.	INRIBARCA	J307460113	20010607000002	2009-01-01	2009-12-31	AV.6 ENTRE CALLES 23 Y 24 CASA N0. 23-51 ESTADO MERIDA			\N		\N		\N		\N	\N	2001-06-07	SIEZ-2001-06-07-000002
1450	1	2	327	1	1	CONSTRUCTORA NORTE SUR, C.A.		J070201878	20001207000003	2009-01-01	2009-12-31	URB. EL PORTAL CALLE 51A NO.13-73			\N		\N		\N		\N	\N	2000-12-07	SIEZ-2000-12-07-000003
488	1	2	327	1	1	CONSTRUCCIONES Y SERVICIOS MORALES,C.A.	CONSTRUSERMO	J303240330	20001227000002	2009-01-01	2009-12-31	CALLE 74 AV.14A Y 15 C.C. LA COLINA LOCAL 06			\N		\N		\N		\N	\N	2000-12-27	SIEZ-2000-12-27-000002
1866	1	2	327	1	1	PROYECTOS & CONSTRUCCIONES, T & M,C.A.		J305223084	20041026000001	2009-01-01	2009-12-31	AV.31 N0. 58-172			\N		\N		\N		\N	\N	2004-10-26	SIEZ-2004-10-26-000001
1130	1	2	327	1	1	PROYECTO Y SERVICIO AGRO-CIVIL MORA GUTIERREZ,C.A.	PROMOGCA	J307453508	20010202000000	2009-01-01	2009-12-31	URB.FUNDACOLON KM.5 VIA STA.BARBARA-ELVIGIA,CASA 3-43			\N		\N		\N		\N	\N	2001-02-02	SIEZ-2001-02-02-000000
1919	1	2	327	1	1	CONSTRUCTORA  ALGE, C.A.		J304108230	20050630000002	2009-01-01	2009-12-31	CALLE STA. BARBARA C.CALLE 3E CASA N0. 3-5			\N		\N		\N		\N	\N	2005-06-30	SIEZ-2005-06-30-000002
1920	1	2	327	1	1	CONSTRUCCIONES,INSPECCIONES,MANTENIMIENTO Y ADQUISICIONES,C.A.	CIMACA	J313303186	20050708000001	2009-01-01	2009-12-31	CALLE 216-A N0. 49 I-48 LA GALLERA			\N		\N		\N		\N	\N	2005-07-08	SIEZ-2005-07-08-000001
1921	1	2	327	1	1	GERENPRO,S.A.		J303017444	20050708000002	2009-01-01	2009-12-31	CARRETERA 44 FEDERACION 2 LOCAL 5			\N		\N		\N		\N	\N	2005-07-08	SIEZ-2005-07-08-000002
1922	1	2	327	1	1	DESARROLLO DE SOLUCIONES ESPECIFICAS,C.A.	DESCA	J303388078	20050722000001	2009-01-01	2009-12-31	CALLE 72 AV. 3H C.C. LAS TINAJITAS LOCAL 19			\N		\N		\N		\N	\N	2005-07-22	SIEZ-2005-07-22-000001
1923	1	2	327	1	1	SUMINISTROS, MANTENIMIENTO Y SERVICIOS LOS LUISES,C.A.	SUMSELUCA	J312557133	20050727000001	2009-01-01	2009-12-31	AV.15B C.C. 54			\N		\N		\N		\N	\N	2005-07-27	SIEZ-2005-07-27-000001
1924	1	2	327	1	1	CHACIN INGENIERIA,C.A.	CHACINCA	J312162325	20050729000001	2009-01-01	2009-12-31	EDIF.RIO MACOITA APTO. 6-H			\N		\N		\N		\N	\N	2005-07-29	SIEZ-2005-07-29-000001
995	1	2	327	1	1	CONSTRUCCIONES LA GALERA,C.A.		J065074299	20011003000000	2009-01-01	2009-12-31	AV. 9B CON CALLE 78 Y 79 N. 78-80			\N		\N		\N		\N	\N	2001-10-03	SIEZ-2001-10-03-000000
1933	1	2	327	1	1	ING. OSCAR PACHECO PIFANO Y ASOCIADOS,C.A.		J302037433	20050908000001	2009-01-01	2009-12-31	C.C. EL TRIANGULO LOCAL 31, AV. 4 C-3Y BELLA VISTA			\N		\N		\N		\N	\N	2005-09-08	SIEZ-2005-09-08-000001
1481	1	2	327	1	1	SEGOVIA INGENIERIA Y PROYECTOS,C.A.	SEINPROCA	J304912870	20010911000001	2009-01-01	2009-12-31	CALLE 105,N0. 18A-276,LA POMONA			\N		\N		\N		\N	\N	2001-09-11	SIEZ-2001-09-11-000001
757	1	2	327	1	1	OBRAS SERVICIOS C.E.N.,C.A.	OCENCA	J304715897	20010131000000	2009-01-01	2009-12-31	CALLE 78B ENTRE 41 Y 42 NO. 58-30			\N		\N		\N		\N	\N	2001-01-31	SIEZ-2001-01-31-000000
765	1	2	327	1	1	CONSTRUCCIONES PRIETO 2021,C.A.		J307443995	20010305000001	2009-01-01	2009-12-31	URB.ROSAL SUR CALLE 41 N0.13-132			\N		\N		\N		\N	\N	2001-03-05	SIEZ-2001-03-05-000001
866	1	2	327	1	1	INVERSORA MIZE LAMEDA, C.A.		J301185315	19990304000043	2009-01-01	2009-12-31	AV.8 CON CALLE F NO.F-09 URB. IRAMA			\N		\N		\N		\N	\N	1999-03-04	SIEZ-1999-03-04-000043
1519	1	2	327	1	1	INVERSIONES PRIETO BAVARESCO,C.A.	P Y B ,C.A.	J304997477	19990329000051	2009-01-01	2009-12-31	CIRC.2 C.COMERCIAL ANPARO LOCAL 10 AL LADO DE LA FERRETERIA LA CAMPECINA			\N		\N		\N		\N	\N	1999-03-29	SIEZ-1999-03-29-000051
1521	1	2	327	1	1	CONSTRUCCIONES INCIARTE,C.A.		J301322932	20010604000000	2009-01-01	2009-12-31	AV.15 CON CALLE 93 LA PADILLA EDIF.LATINA PISO 1 LOCAL 2			\N		\N		\N		\N	\N	2001-06-04	SIEZ-2001-06-04-000000
1895	1	2	327	1	1	PROYECTOS Y CONSTRUCCIONES DE SUR,C.A.	PROSURCA	J312967269	20050422000002	2009-01-01	2009-12-31	CALLE 16 N0. 6-24			\N		\N		\N		\N	\N	2005-04-22	SIEZ-2005-04-22-000002
1896	1	2	327	1	1	SERVICIOS TECNICOS VOM,S.A.		J306274871	20050502000001	2009-01-01	2009-12-31	AV.3D C/C.80 NO. 2C-1-7			\N		\N		\N		\N	\N	2005-05-02	SIEZ-2005-05-02-000001
1897	1	2	327	1	1	INVERSIONES BOSQUE EL RETIRO,C.A.		J311555218	20050502000002	2009-01-01	2009-12-31	AV.3D C/C 80 N0. 2C-1-7			\N		\N		\N		\N	\N	2005-05-02	SIEZ-2005-05-02-000002
1018	1	2	327	1	1	HERCO CONSTRUCCIONES,C.A.		J307294000	20010515000000	2009-01-01	2009-12-31	CALLE 61 SECTOR LA ESTRELLA CASA N0.11-215			\N		\N		\N		\N	\N	2001-05-15	SIEZ-2001-05-15-000000
1054	1	2	327	1	1	CONSTRUCTORA SAN MIGUEL,S.A.		J306812571	20001122000000	2009-01-01	2009-12-31	CALLE 70 CON AV.24 C.C. PALMIRA LOCAL 6			\N		\N		\N		\N	\N	2000-11-22	SIEZ-2000-11-22-000000
1943	1	2	327	1	1	PROYECTOS MONT RIVER, C. A.		J304098790	20050929000001	2009-01-01	2009-12-31	CALLE 70 Nº 28A-128			\N		\N		\N		\N	\N	2005-09-29	SIEZ-2005-09-29-000001
1953	1	2	327	1	1	MENEMARINA		J304897642	20051116000002	2009-01-01	2009-12-31	AV. HOLLIWOOD C. C. SCHILACI LOCAL Nº 1			\N		\N		\N		\N	\N	2005-11-16	SIEZ-2005-11-16-000002
1962	1	2	327	1	1	PROMOTORA DE LA ROCA, C.A.		J309428810	20051209000001	2009-01-01	2009-12-31	AV.7 CON CALLE N SECTOR MONTE CLARO CASA S/N			\N		\N		\N		\N	\N	2005-12-09	SIEZ-2005-12-09-000001
1684	1	2	327	1	1	CONSTRUCTORA KAEX,C.A.		J308747068	20030930000000	2009-01-01	2009-12-31	CALLE 42 NO.15J-55 URB.CANAIMA			\N		\N		\N		\N	\N	2003-09-30	SIEZ-2003-09-30-000000
2089	1	2	327	1	1	PEDRO D CLIMASTONE FUENTES		V 027722675	20070329000001	2009-01-01	2009-12-31	URBA  LAS 5O CALLE 2 CASA No. 14			\N		\N		\N		\N	\N	2007-03-29	SIEZ-2007-03-29-000001
599	1	2	327	1	1	TORNILLERIA Y MATERIALES PETROLEROS,C.A.	TMP,C.A.	J303120253	20010426000002	2009-01-01	2009-12-31	CALLE 59 CON EQUI. A.V.3F-18			\N		\N		\N		\N	\N	2001-04-26	SIEZ-2001-04-26-000002
978	1	2	327	1	1	CONSTRUCCIONES BRIGOT COMPAÑIA ANONIMA	BRIGOT	J070480742	20000428000000	2009-01-01	2009-12-31	AV.2 CALLE 78A-100			\N		\N		\N		\N	\N	2000-04-28	SIEZ-2000-04-28-000000
629	1	2	327	1	1	ACROPOLIS,CONSTRUCCIONES Y SERVICIOS,C.A.	ACROPOLIS,C.A	J307729090	20010517000000	2009-01-01	2009-12-31	CALLE 41 SECTOR DELICIAS C.C. VIENTO NORTE PISO 1 LOCAL 4			\N		\N		\N		\N	\N	2001-05-17	SIEZ-2001-05-17-000000
1066	1	2	327	1	1	INVERSIONES VR,C.A.		J304184824	20010208000001	2009-01-01	2009-12-31	URB. LA TRINIDAD CALLE 52B N0. 15R-35			\N		\N		\N		\N	\N	2001-02-08	SIEZ-2001-02-08-000001
654	1	2	327	1	1	CONSTRUCCIONES E INVERSIONES VER-PER.C.A.	VERPERCA	J307890657	20010627000002	2009-01-01	2009-12-31	CALLE 85 BARRIO VALLE FRIO CASA N0.3E-94			\N		\N		\N		\N	\N	2001-06-27	SIEZ-2001-06-27-000002
1079	1	2	327	1	1	MANTENIMIENTOS  NEATNESS,C.A.		J300416330	20010830000001	2009-01-01	2009-12-31	C.C. CONSENSA  AV.5 DE JULIO PISO 1 OFICINA 7			\N		\N		\N		\N	\N	2001-08-30	SIEZ-2001-08-30-000001
1031	1	2	327	1	1	FUNDACION PARA EL DESARROLLO FRONTERIZO LIBANO-LA MOTILONA	FUNDEFROLIMO	J309308971	20030319000000	2009-01-01	2009-12-31	C.MACHIQUES COLON SECT.LIBANO MOTILONA FINCA EL ENCANTO			\N		\N		\N		\N	\N	2003-03-19	SIEZ-2003-03-19-000000
948	1	2	327	1	1	CONSTRUCCIONES GALIOTO,C.A.	COGALCA	J308419273	20020122000000	2009-01-01	2009-12-31	CALLE 66A CON AV. 9C SECTOR TIERRA NEGRA EDIF.COTOPERIZ L.2B			\N		\N		\N		\N	\N	2002-01-22	SIEZ-2002-01-22-000000
988	1	2	327	1	1	CONSTRUCTORA BRAVO,C.A.		J305014825	20010316000000	2009-01-01	2009-12-31	CALLE 104 N0. 18B-24			\N		\N		\N		\N	\N	2001-03-16	SIEZ-2001-03-16-000000
1952	1	2	327	1	1	R & A INVERSIONES, CA		J313639710	20051116000001	2009-01-01	2009-12-31	AV. 40A EDIF. MADISON APART. 1-B			\N		\N		\N		\N	\N	2005-11-16	SIEZ-2005-11-16-000001
1941	1	2	327	1	1	SIMONCA INGENIERIA, C. A.		J305361240	20050923000001	2009-01-01	2009-12-31	AV. 22A ENTRE CALLE 69 Y 70 C. C. LAS PALMAS			\N		\N		\N		\N	\N	2005-09-23	SIEZ-2005-09-23-000001
1870	1	2	327	1	1	OPERADORA,PREVENCION Y SALUD INTEGRAL,C.A.	OPRESAIN,C.A.	J312539097	20050111000001	2009-01-01	2009-12-31	CALLE 74 CON AV.11 RESID. MACOITA PISO 7 APTO 7A			\N		\N		\N		\N	\N	2005-01-11	SIEZ-2005-01-11-000001
1908	1	2	327	1	1	ANDRADE RIGUAL ARQUITECTOS,C.A.	ANRIARCA	J312757914	20050608000001	2009-01-01	2009-12-31	SAN JACINTO SECTOR 4 VEREDA 1 CASA 9			\N		\N		\N		\N	\N	2005-06-08	SIEZ-2005-06-08-000001
2000	1	2	327	1	1	ACEROTEC.COMPAÑIA ANONIMA	ACEROTEC, C.A.	J304469497	20060504000001	2009-01-01	2009-12-31	SECTOR PARAISO AV.22A CON CALLE 65 # 65-02			\N		\N		\N		\N	\N	2006-05-04	SIEZ-2006-05-04-000001
1116	1	2	327	1	1	CENTRAL DE ACRILICOS SANTA RITA,C.A.		J302145324	20010403000000	2009-01-01	2009-12-31	AV.8 SANTA RITA N0.82-35			\N		\N		\N		\N	\N	2001-04-03	SIEZ-2001-04-03-000000
665	1	2	327	1	1	ARQDECO, C.A.		J300050823	19990324000073	2009-01-01	2009-12-31	RES.VALLE CLARO EDIF. DON JUAQUIN APTO 6B			\N		\N		\N		\N	\N	1999-03-24	SIEZ-1999-03-24-000073
1778	1	2	327	1	1	CONSTRUCTORA PETRO AGRO,C.A.		J305849510	20010329000004	2009-01-01	2009-12-31	URB.RAFAEL ALBARADO # 03 CASA #63-09			\N		\N		\N		\N	\N	2001-03-29	SIEZ-2001-03-29-000004
2141	1	2	327	1	1	INVERSIONES D & B, C.A.		J312477032	20080128000001	2009-01-01	2009-12-31	CABIMAS			\N		\N		\N		\N	\N	2008-01-28	SIEZ-2008-01-28-000001
338	1	2	327	1	1	CONSTRUCTORA MISOA, C.A.	COMISO, C.A.	J302552583	19990310000092	2009-01-01	2009-12-31	CALLE CAMINO NUEVO,CASA SIN NO.,C/C BOJAS ROMERO,LA RITA			\N		\N		\N		\N	\N	1999-03-10	SIEZ-1999-03-10-000092
379	1	2	327	1	1	TRANSPORTE RODGHER, S.A.		J300238199	20000417000000	2009-01-01	2009-12-31	C.SAN MATIAS ENTRANDO POR LA AV. 41			\N		\N		\N		\N	\N	2000-04-17	SIEZ-2000-04-17-000000
1621	1	2	327	1	1	DRACO,S.A.		J301270797	20010423000001	2009-01-01	2009-12-31	CALLE 71  N0.78A-28			\N		\N		\N		\N	\N	2001-04-23	SIEZ-2001-04-23-000001
1622	1	2	327	1	1	CONSTRUCCIONES INSTALACIONES Y SERVICIOS PUBLICOS,S.A.	CIPSA	J307446331	20010122000004	2009-01-01	2009-12-31	CALLE 67 ENTRE AV. 11 Y 12,EDIF. LEOMARA,LOCAL 04,CECILIO AC			\N		\N		\N		\N	\N	2001-01-22	SIEZ-2001-01-22-000004
787	1	2	327	1	1	CONSTRUCCIONES Y PROYECTOS DICASAS,C.A.		J303525288	20010814000001	2009-01-01	2009-12-31	CALLE 79B N0. 108-57			\N		\N		\N		\N	\N	2001-08-14	SIEZ-2001-08-14-000001
921	1	2	327	1	1	D & M CONSTRUCCIONES,C.A.		J308101885	20030131000000	2009-01-01	2009-12-31	AV.4 CON CALLE 65 SECT.BELLA VISTA EDIF. SIGMA OFIC. 4-A			\N		\N		\N		\N	\N	2003-01-31	SIEZ-2003-01-31-000000
922	1	2	327	1	1	CONSTRUCCIONES ACOSTA ROMERO,C.A.	ACORO,C.A.	J305149364	20011102000003	2009-01-01	2009-12-31	CALLE D CON AV. 4 N0. 5-57 SECTOR 18 DE OCTUBRE			\N		\N		\N		\N	\N	2001-11-02	SIEZ-2001-11-02-000003
923	1	2	327	1	1	SANTA RITA CONSTRUCCIONES, C.A.		J070497947	19990310000079	2009-01-01	2009-12-31	AV.PEDRO LUCAS URRIBARRI,SECTOR LA CAÑADITA SANTA RITA			\N		\N		\N		\N	\N	1999-03-10	SIEZ-1999-03-10-000079
1057	1	2	327	1	1	M.A.P.R. INVERSIONES,C.A.	M.A.P.R.C.A.	J307666447	20030623000001	2009-01-01	2009-12-31	CALLE 80 CON AV.13 Y 13A NO.28-54			\N		\N		\N		\N	\N	2003-06-23	SIEZ-2003-06-23-000001
1024	1	2	327	1	1	CONSTRUCTORA ARIANNA,C.A.		J303694365	20030410000001	2009-01-01	2009-12-31	SIN DIRECCIÓN			\N		\N		\N		\N	\N	2003-04-10	SIEZ-2003-04-10-000001
1550	1	2	327	1	1	MEGA CONSTRUCCIONES,C.A.		J305218730	20010409000002	2009-01-01	2009-12-31	CALLE 71 N0.28-60 SECTOR SANTA MARIA			\N		\N		\N		\N	\N	2001-04-09	SIEZ-2001-04-09-000002
1552	1	2	327	1	1	ACRE INVERSIONES, C.A.		J304959915	20010406000006	2009-01-01	2009-12-31	AV.28 LA LIMPIA N0.14 54 EDIF.RODRIGUEZ BARBOZA PISO 2 OF.7			\N		\N		\N		\N	\N	2001-04-06	SIEZ-2001-04-06-000006
1643	1	2	327	1	1	CONSTRUCCIONES ALZO, C.A.		J070479205	19990324000047	2009-01-01	2009-12-31	CALLE 5 NO.4-251,SAN CARLOS DEL ZULIA LOCAL 1-A			\N		\N		\N		\N	\N	1999-03-24	SIEZ-1999-03-24-000047
1687	1	2	327	1	1	CONSTRUCCIONES LAGIOIA, C.A.	CONGIOCA	J303572545	19991210000001	2009-01-01	2009-12-31	CALLE 100 SABANETA NO. 22B-53			\N		\N		\N		\N	\N	1999-12-10	SIEZ-1999-12-10-000001
1193	1	2	327	1	1	PAVIMENTADORA ONICA, S.A.		J300066908	19990318000013	2009-01-01	2009-12-31	CARRETERA EL VIGIA  STA.BARBARA SECTOR LOS POZONES			\N		\N		\N		\N	\N	1999-03-18	SIEZ-1999-03-18-000013
1194	1	2	327	1	1	CONSTRUCCIONES VILORIA,C.A.	VICOCA	J308551910	20020121000000	2009-01-01	2009-12-31	AV.14A SECTOR LAS DELICIAS CASA N0. 74-15			\N		\N		\N		\N	\N	2002-01-21	SIEZ-2002-01-21-000000
1837	1	2	327	1	1	CONSTRUCTORA TEL-ZULIA,C.A.	CONTEZUCA	J310558485	20040519000001	2009-01-01	2009-12-31	CALLE 16 CASA N0. 5-47			\N		\N		\N		\N	\N	2004-05-19	SIEZ-2004-05-19-000001
1662	1	2	327	1	1	CONSTRUCCIONES DAS, C.A.	CODASCA	J305025231	19990302000012	2009-01-01	2009-12-31	AV.16 ESQUINA CALLE 89B CENTRO COMERCIAL DELICIAS II LOCAL 9			\N		\N		\N		\N	\N	1999-03-02	SIEZ-1999-03-02-000012
1663	1	2	327	1	1	PROYECTOS Y OBRAS FERNANDEZ,C.A.	PROBAFER,C.A.	J305049610	20010312000002	2009-01-01	2009-12-31	AV.13 SIERRA MAESTRA ENTRE CALLE 20 Y 21 N0. 20-52			\N		\N		\N		\N	\N	2001-03-12	SIEZ-2001-03-12-000002
1910	1	2	327	1	1	DISTRIBUIDORA MIRANDA,C.A.		J305831564	20050610000001	2009-01-01	2009-12-31	AV.15A CON CALLE 69			\N		\N		\N		\N	\N	2005-06-10	SIEZ-2005-06-10-000001
1724	1	2	327	1	1	CONSTRUCTORA ESFERA,C.A.		J300400654	20001117000000	2009-01-01	2009-12-31	URB.JUANA DE AVILA CALLE 66 AV.16 Y 16A QUINTA NO.15D-42			\N		\N		\N		\N	\N	2000-11-17	SIEZ-2000-11-17-000000
1725	1	2	327	1	1	MANTENIMIENTO VIAL 252,C.A.		J301721942	20010525000002	2009-01-01	2009-12-31	CALLE MARIÑO NORTE C/CARRETERA NNAL CAGUA,ESTADO ARAGUA			\N		\N		\N		\N	\N	2001-05-25	SIEZ-2001-05-25-000002
1979	1	2	327	1	1	JOMA CONSTRUCCIONES C.A.	JOMACON, C.A.	J314358537	20060301000001	2009-01-01	2009-12-31	CALLE 72 ENTRE AV. 9B Y 10 RESID. CLARET TORRE 3			\N		\N		\N		\N	\N	2006-03-01	SIEZ-2006-03-01-000001
1987	1	2	327	1	1	CONSTRUCTORA S. Y N. SILNA		V104306108	20060327000001	2009-01-01	2009-12-31	LA BLANCA C/PRINCIPAL Nº 19			\N		\N		\N		\N	\N	2006-03-27	SIEZ-2006-03-27-000001
784	1	2	327	1	1	CONSTRUCCIONES GUSSY,C.A.		J070463503	20010327000000	2009-01-01	2009-12-31	URB.LOS OLIVOS CALLE 75 N0-61-31 QTA.LILIA			\N		\N		\N		\N	\N	2001-03-27	SIEZ-2001-03-27-000000
638	1	2	327	1	1	PROYECTOS MECANICOS INTEGRALES,C.A.	PROMEINCA	J307435399	20010606000005	2009-01-01	2009-12-31	URB.LA ROSA CALLE E-7 N0.17			\N		\N		\N		\N	\N	2001-06-06	SIEZ-2001-06-06-000005
640	1	2	327	1	1	C Y M CONSTRUCCIONES Y MANTENIMIENTOS,C.A.	CYMYCA	J305867780	20010612000001	2009-01-01	2009-12-31	CALLE 24 C.C. CUNSOLO FINOLL LOCAL P.A. 2 EL MOJAN			\N		\N		\N		\N	\N	2001-06-12	SIEZ-2001-06-12-000001
642	1	2	327	1	1	INVERSIONES SHANGAY,C.A.		J307856335	20010612000000	2009-01-01	2009-12-31	AV.13 CON CALLE 45  N0.45-41			\N		\N		\N		\N	\N	2001-06-12	SIEZ-2001-06-12-000000
929	1	2	327	1	1	CONSTRUCCIONES HERNANDEZ PACHECO,C.A.	CONHERPACA	J307669497	20010503000001	2009-01-01	2009-12-31	AV.15J CON CALLE 55 C.C. LA TRINIDAD			\N		\N		\N		\N	\N	2001-05-03	SIEZ-2001-05-03-000001
930	1	2	327	1	1	CONSTRUCTORA LA YAPACANA,C.A.	COYAPA,C.A,	J307811773	20011101000000	2009-01-01	2009-12-31	CALLE 1 URB. EL SILENCIO CASA # 3 ARAPUEY EDO. MERIDA			\N		\N		\N		\N	\N	2001-11-01	SIEZ-2001-11-01-000000
789	1	2	327	1	1	VENEMAR SUPPLY,C.A.		J306750851	20010615000001	2009-01-01	2009-12-31	AV.3F N0.78-48 EDIF.ALGARROBO LOCAL			\N		\N		\N		\N	\N	2001-06-15	SIEZ-2001-06-15-000001
790	1	2	327	1	1	CONSPLACA,C.A.		J307541970	20010627000000	2009-01-01	2009-12-31	CIRCUNV.3 SECTOR EL ROSARIO AV. 98 CARDON N0.1 LOCAL 98-57			\N		\N		\N		\N	\N	2001-06-27	SIEZ-2001-06-27-000000
2212	1	2	327	1	1	" SEGOVIA CONSTRUCCIONES, C.A, SEGCONCA"	SEGCONCA	J295997361	78688868	2009-01-01	2009-12-31	wdsad	4001	segonca@idyt.com	1	C	1500.00	null	\N	null	\N	1	2008-08-28	SIEZ-2008-08-28-000001
\.


--
-- TOC entry 2191 (class 0 OID 35338269)
-- Dependencies: 1506
-- Data for Name: contratistas_acjdrl; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY contratistas_acjdrl (ajr_contratistas_acjdrl_pk, con_contratistas_fk, pnt_personas_naturales_fk, ajr_cargo_actual, ajr_accionista, ajr_miembro_junta_directiva, ajr_representante_legal, ajr_porcentaje_acciones) FROM stdin;
203	2238	281	Presidente	t	t	t	60.00
212	2262	286	PRESIDENTE	t	t	t	50.00
213	2262	287	Vicepresidente	t	t	t	50.00
205	2237	283	Director General	t	t	f	50.00
207	2240	284	No es nada	t	t	f	25.45
215	2212	289	Vicepresidente	t	f	t	48.00
214	2212	288	Presidente	t	f	t	52.00
216	1791	290	Presidente	f	f	t	0.00
217	1791	291	VicePresidente	t	t	t	50.00
218	1791	292	Secretaria	t	t	t	50.00
219	2260	293	fghfgh	t	f	t	44.54
220	2260	294		t	t	t	2.54
\.


--
-- TOC entry 2192 (class 0 OID 35338271)
-- Dependencies: 1507
-- Data for Name: contratistas_comisarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY contratistas_comisarios (com_contratistas_comisarios_pk, con_contratistas_fk, pnt_personas_naturales_fk, com_profesion, com_numero_colegiado, com_vigencia_colegiado) FROM stdin;
33	2238	282	Contador Público	1234560	2010-07-09
\.


--
-- TOC entry 2193 (class 0 OID 35338273)
-- Dependencies: 1508
-- Data for Name: contratistas_contratos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY contratistas_contratos (ctt_contratistas_contratos_pk, con_contratistas_fk, tpa_tipo_actividad_fk, ett_estatus_fk, org_organismos_fk, ctt_numero, ctt_descripcion, ctt_fecha, ctt_observaciones, ren_rendimiento_fk) FROM stdin;
51	2212	5	9	5	7887	mnmnmn	2009-05-29	bmnbmbn	5
52	2212	6	13	5	04444	gljkgkjhkjhkl	2009-06-18	hhihihihi	5
53	2240	5	13	5	4324	dsfsdfdsf	2009-06-24	sdfsdfds	5
54	2212	12	6	5	232	sdfsdf	2009-06-24	dsfd	5
55	2262	12	13	2	0287		2009-06-24		5
\.


--
-- TOC entry 2194 (class 0 OID 35338278)
-- Dependencies: 1509
-- Data for Name: contratistas_estatus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY contratistas_estatus (ett_contratistas_estatus_pk, ett_nombre, ett_activo) FROM stdin;
3	Por Desincorporar	t
2	Desincorporada	t
1	Registrada	t
5	No Actualizada	t
4	Actualizada	t
\.


--
-- TOC entry 2195 (class 0 OID 35338280)
-- Dependencies: 1510
-- Data for Name: contratistas_legal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY contratistas_legal (clg_contratistas_legal_pk, con_contratistas_fk, dec_denominacion_comercial_fk, clg_numero_registro, clg_circunscripcion_judicial, clg_fecha_inscripcion, clg_numero_inscripcion, clg_numero_tomo, clg_numero_folio, clg_objeto_social, clg_domicilio_legal_actual, clg_fecha_constitutiva, clg_cierre_fiscal_actual, clg_capital_social_suscrito, clg_capital_social_pagado, clg_modificacion, clg_numero_modificaciones, clg_observaciones) FROM stdin;
80	2212	1	Primero	Estado Zulia	2009-05-27	2	2-A	II	Obras	Sector Tierra	2008-04-07	2009-12-31	123456.78	123456789.01	t	2	
85	1791	\N	44545	trttrrt	2009-05-30	45554	45	45	hhgg	hghhgh	2009-05-28	2009-05-30	44545.45	121212.11	f		hgh
86	1791	\N	545454	fhhghghg	2009-05-30	54	5454	5454	fghfg	hgfhgfh	2009-05-30	2009-05-30	76575.67	657657657.65	f		hfghfghgf
88	2212	1	Primero	Estado Zulia	2009-06-18	125	33	452	Obras	sdsdsd	2008-04-07	2009-06-25	2002.54	2500.00	t	40	fgfhghgf
89	385	1	Tercero	Estado Zulia	2009-05-03	01	10-A	I	Obras de Infraestructura	La Pomona	2009-04-06	2009-12-31	125489.96	120220.00	f		
90	385	1	Tercero	Estado Zulia	2009-06-01	01	12-A	12-A	Obras de Infraestructura	La Pomona	2009-04-06	2009-12-31	123456.97	120000.00	t	1	
91	2238	2	Primero	Estado Zulia	2007-05-01	15	15-A	III	Servicios Generales	Av. 28 La Limpia 	2007-06-01	2009-12-31	12580000.96	8900560.00	f		
92	2240	1	125	la que ssea	2009-06-25	155	c343	1fd5	dfsdfsdfsdf	dsfsdfdsf	2009-06-24	2009-06-30	1225.44	55412.25	f		sdfsdfsdfd
93	2256	2	Segundo	Estado Carabobo	2008-06-02	25	1A	II	obras	carrera guacara - san joaquin, Urb. la pradera, sector los bucares, segunda etapa, manzana G, casa nº 272	2008-03-03	2009-12-31	9000.00	849708.60	f	1	
94	2261	2	Primero	Estado Carabobo	2007-06-06	12	12-A	12-A	Obras	Zona Norte, Av. Bolívar, Callejon Don Bosco. Piso 4, OFIC. 4-6.	2007-06-05	2009-12-31	19247348.58	19247348.58	f		
95	2262	1	Primero	Estado Monagas	2007-02-05	25	2	III	obras	Calle 2, Nº3 Urb. Raul Leoni	2006-11-27	2009-12-31	150000.00	100000.00	f	1	
96	1671	1	67567	jhhjgh	2009-08-10	110	1a	4	Estamos consientes que las politicas del pais estan orientadas a nada	La nueva direccion 	2009-05-21	2008-12-31	990000000.00	990000000.00	t	2	Aumento de Capital
98	2260	1	el di dod fog gog ho kfmk	gdgdgd	2009-08-13	345345	35345	gsdger	2rwerwewrw	wrwrw	2009-08-13	2009-08-13	990000000.00	990000000.00	f	232	wrwr
79	2212	1	Primero	Estado Zulia	2008-05-12	11	11-A	11-A	Obras	Sector Tierra Negra	2008-04-07	2009-12-31	456.80	456.80	f		
78	1671	1	67567	jhhjgh	2009-05-28	67	657	67	jghjghj	hgjghj	2009-05-21	2009-05-28	100000.00	100000.00	f	765	hjghjghj
87	1791	1	546546	56456	2009-05-29	55	545	545	tyryrty	tryrty	2009-05-29	2009-05-29	645655.00	46547.00	f		tyrty
99	1791	2	546546	56456	2009-08-20	45	2	2	tyryrty	La misma	2009-05-29	2009-12-31	5522.00	5522.00	t	2	Cambio de Denominacion Comercial
\.


--
-- TOC entry 2196 (class 0 OID 35338285)
-- Dependencies: 1511
-- Data for Name: contratistas_solvencias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY contratistas_solvencias (sol_contratistas_solvencias_pk, con_contratistas_fk, sol_fecha_emision, sol_fecha_vencimiento, sol_periodo, sol_activo) FROM stdin;
32	2262	2009-06-10	2009-06-30	2009	t
33	2262	2009-08-13	2009-08-31	2009	t
34	2238	2009-08-20	2009-08-31	2009	t
\.


--
-- TOC entry 2197 (class 0 OID 35338287)
-- Dependencies: 1512
-- Data for Name: contratistas_sucursales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY contratistas_sucursales (csu_contratistas_sucursales_pk, con_contratistas_fk, csu_descripcion, csu_direccion, csu_activo) FROM stdin;
165	2213	443tfgdfg	fdgdfg	t
166	2213	gfhj	54dfhghgf	t
167	2213	sin numeri deberia ser el 167	sin numero deberia ser el 167	t
169	2237	fbcfb	retgfgfdg	f
168	2237	dfv554	fddfgfdg	f
170	2237	Compañía Anónima II	Av. Maranorte	t
171	2237	Compañía Anónima III	Urb. La Coromoto	t
172	2212	dsfdsf	dfsdff	f
173	2240	sdsds	dsdsdsss	t
174	2240	dfdfsd	sdfdsfsdf	t
175	2240	lkxcjvlkd	fdgfdg	t
176	2212	erere	fdgfdgfd	t
177	2212	nueva3	dadasda	t
\.


--
-- TOC entry 2198 (class 0 OID 35338289)
-- Dependencies: 1513
-- Data for Name: contratistas_tipo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY contratistas_tipo (ctp_contratistas_tipo_pk, ctp_descripcion, ctp_activo) FROM stdin;
1	Empresa	t
13	Unipersonal	t
10	Cooperativa	t
\.


--
-- TOC entry 2199 (class 0 OID 35338291)
-- Dependencies: 1514
-- Data for Name: denominacion_comercial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY denominacion_comercial (dec_denominacion_comercial_pk, dec_descripcion, dec_abreviatura, dec_activo) FROM stdin;
3	Sociedad de Responsabilidad Limitada	S.R.L.	t
2	Sociedad Anónima	S.A	t
5	Persona Natural	Pers Nat	t
1	Compañía  Anónima	C.A	t
\.


--
-- TOC entry 2200 (class 0 OID 35338293)
-- Dependencies: 1515
-- Data for Name: esp_are_xcontratista; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY esp_are_xcontratista (eac_esp_are_xcontratista_pk, con_contratistas_fk, epo_especialidad_objeto_fk, eac_principal) FROM stdin;
362	2238	7	f
363	2238	8	f
364	2238	17	t
368	2240	1	f
369	2240	3	f
370	2240	4	t
371	2240	5	f
372	2240	9	f
382	2256	12	t
383	2256	14	f
384	2256	15	f
385	2261	5	t
386	2261	20	f
387	2261	21	f
388	2261	22	f
389	2262	5	t
390	2262	11	f
395	2212	2	f
396	2212	3	f
397	2212	7	t
398	2212	11	f
\.


--
-- TOC entry 2201 (class 0 OID 35338295)
-- Dependencies: 1516
-- Data for Name: especialidad_objeto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY especialidad_objeto (epo_especialidad_objeto_pk, aob_areas_objeto_fk, epo_nombre, epo_inicial, epo_activo) FROM stdin;
11	3	Pavimentos	p	t
2	3	Puentes y Pontones	pp	t
16	19	Aires Forzados	af	t
13	5	Cloacas	cl	t
15	19	Concreto	cr	t
18	5	Diques y Dragados	dd	t
3	3	Drenaje	d	t
12	19	En General	gn	t
20	18	Estudios	e	t
22	18	Gerencia	ge	t
14	19	Instalaciones Sanitarias	i	t
5	3	Obras Complementarias	oc	t
21	18	Proyectos	p	t
1	5	Ríos	r	t
19	18	Ingeniería	i	t
6	5	Acueductos	a	f
23	18	Asesoría	as	t
26	5	Tanques	t	f
4	5	En General	gl	f
24	18	En General	ga	f
9	3	En General	eg	f
17	4	Técnico	t	f
7	4	Comercial	c	f
8	4	En General	g	f
\.


--
-- TOC entry 2202 (class 0 OID 35338297)
-- Dependencies: 1517
-- Data for Name: estados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY estados (est_estados_pk, est_nombre, est_abreviatura, est_activo) FROM stdin;
22	VARGAS	VR	t
24	ZULIA	ZU	t
1	AMAZONAS	AM	t
2	ANZOÁTEGUI	AN	t
3	APURE	AP	t
4	ARAGUA	AR	t
5	BARINAS	BA	t
6	BOLÍVAR	BO	t
7	CARABOBO	CA	t
8	COJEDES	CO	t
9	DELTA AMACURO	DA	t
10	DISTRITO CAPITAL	DC	t
11	FALCÓN	FA	t
12	GUARICO	GU	t
13	LARA	LA	t
14	MÉRIDA	ME	t
15	MIRANDA	MI	t
16	MONAGAS	MO	t
17	NUEVA ESPARTA	NE	t
18	PORTUGUESA	PG	t
19	SUCRE	SU	t
20	TÁCHIRA	TA	t
21	TRUJILLO	TR	t
23	YARACUY	YA	t
\.


--
-- TOC entry 2203 (class 0 OID 35338299)
-- Dependencies: 1518
-- Data for Name: estatus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY estatus (ett_estatus_pk, ett_nombre, ett_activo) FROM stdin;
5	Por Iniciar	t
6	Ejecutada	t
9	Paralizada	t
13	En Ejecución	t
\.


--
-- TOC entry 2204 (class 0 OID 35338301)
-- Dependencies: 1519
-- Data for Name: indice_capital_social; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY indice_capital_social (ics_indice_capital_social_pk, ics_descripcion, ics_desde, ics_hasta, ics_activo) FROM stdin;
1	1	0.00	20000.00	t
4	6	401000.00	800000.00	t
7	7	801000.00	1500000.00	t
8	8	1501000.00	2000000.00	t
9	9	2000001.00	4000000.00	t
10	10	4000001.00	8000000.00	t
11	11	8000001.00	15000000.00	t
12	12	15000001.00	30000000.00	t
13	13	30000001.00	50000000.00	t
14	14	50000001.00	70000000.00	t
6	2	21000.00	50000.00	t
2	3	51000.00	100000.00	t
5	4	101000.00	200000.00	t
15	15	70000001.00	99999999.00	t
3	5	201000.00	400000.00	t
\.


--
-- TOC entry 2205 (class 0 OID 35338303)
-- Dependencies: 1520
-- Data for Name: municipio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY municipio (mun_municipio_pk, est_estados_fk, mun_nombre, mun_abreviatura, mun_activo) FROM stdin;
176	14	ZEA	ZEA	t
315	24	ALMIRANTE PADILLA	ALPA	t
316	24	BARALT	BAR	t
318	24	CATATUMBO	CAT	t
319	24	COLON	COL	t
321	24	JESUS ENRIQUE LOSADA	JEL	t
322	24	JESUS M. SEMPRUN	JMS	t
323	24	LA CAÑADA DE URDANETA	LCU	t
324	24	LAGUNILLAS	LAG	t
325	24	MACHIQUES DE PERIJA	MPJ	t
326	24	MARA	MARA	t
328	24	MIRANDA	MIR	t
329	24	PAEZ	PAEZ	t
331	24	SAN FRANCISCO	SF	t
332	24	SANTA RITA	SR	t
333	24	SIMON BOLIVAR	SB	t
334	24	SUCRE	SU	t
335	24	VALMORE RODRIGUEZ	VR	t
317	24	CABIMAS	CAB	t
320	24	FRANCISCO J. PULGAR	FJP	t
327	24	MARACAIBO	MCBO	t
330	24	ROSARIO DE PERIJA	RPJ	t
1	1	ALTO ORINOCO	AORI	t
2	1	ATABAPO	ATAB	t
3	1	ATURES	ATU	t
4	1	AUTANA	AUT	t
5	1	MANAPIARE	MANA	t
6	1	MAROA	MAR	t
7	1	RÍO NEGRO	RNEG	t
8	2	ANACO	ANA	t
9	2	ARAGUA	ARA	t
10	2	DIEGO BAUTISTA URBANEJA	DBU	t
11	2	FERNANDO PEÑALVER	FP	t
12	2	FRANCISCO DEL CARMEN CARVAJAL	FCC	t
13	2	FRANCISCO DE MIRANDA	FDM	t
14	2	GUANTA	GUA	t
15	2	INDEPENDENCIA	INDP	t
16	2	JOSÉ GREGORIO MONAGAS	JGM	t
17	2	JUAN ANTONIO SOTILLO	JAS	t
18	2	JUAN MANUEL CAJIGAL	JMC	t
19	2	LIBERTAD	LIB	t
20	2	MANUEL EZEQUIEL BRUZUAL	MEB	t
21	2	PEDRO MARÍA FREITES	PMF	t
22	2	PÍRITU	PRT	t
23	2	SAN JOSÉ DE GUANIPA	SJG	t
24	2	SAN JUAN DE CAPISTRANO	SJC	t
25	2	SANTA ANA	STA	t
26	2	SIMÓN BOLÍVAR	SB	t
27	2	SIMÓN RODRÍGUEZ	SR	t
28	2	SIR ARTHUR MCGREGOR	SAM	t
29	3	ACHAGUAS	ACHA	t
30	3	BIRUACA	BIR	t
31	3	MUÑOZ	MU	t
32	3	PEDRO CAMEJO	PC	t
33	3	PÁEZ	PAEZ	t
34	3	RÓMULO GALLEGOS	RG	t
35	3	SAN FERNANDO	SNF	t
36	4	BOLÍVAR	BOL	t
37	4	CAMATAGUA	CMT	t
38	4	FRANCISCO LINARES ALCÁNTARA	FLA	t
39	4	GIRARDOT	GRDT	t
40	4	JOSÉ ÁNGEL LAMAS	JAL	t
41	4	JOSÉ FÉLIX RIBAS	JFR	t
42	4	JOSÉ RAFAEL REVENGA	JRR	t
43	4	LIBERTADOR	LIB	t
44	4	MARIO BRICEÑO IRAGORRY	MBI	t
45	4	OCUMARE DE LA COSTA DE ORO	OCO	t
46	4	SAN CASIMIRO	SNC	t
47	4	SAN SEBASTIÁN	SNSB	t
48	4	SANTIAGO MARIÑO	SNMA	t
49	4	SANTOS MICHELENA	SNMI	t
50	4	SUCRE	SUC	t
51	4	TOVAR	TOV	t
52	4	URDANETA	URD	t
53	4	ZAMORA	ZMR	t
54	5	ALBERTO ARVELO TORREALBA	AAT	t
55	5	ANDRÉS ELOY BLANCO	AEB	t
56	5	ANTONIO JOSÉ DE SUCRE	AJS	t
57	5	ARISMENDI	ARI	t
58	5	BARINAS	BAR	t
59	5	BOLÍVAR	BOL	t
60	5	CRUZ PAREDES	CP	t
61	5	EZEQUIEL ZAMORA	EZ	t
62	5	OBISPOS	OBI	t
63	5	PEDRAZA	PDZ	t
64	5	ROJAS	ROJ	t
65	5	SOSA	SOSA	t
66	6	CARONÍ	CARO	t
67	6	CEDEÑO	CED	t
68	6	EL CALLAO	ECLL	t
69	6	GRAN SABANA	GSAB	t
70	6	HERES	HER	t
71	6	PADRE PEDRO CHIEN	PPC	t
72	6	PIAR	PIAR	t
73	6	RAÚL LEONI	RL	t
74	6	ROSCIO	ROS	t
75	6	SIFONTES	SIF	t
76	6	SUCRE	SUC	t
77	7	BEJUMA	BEJ	t
78	7	CARLOS ARVELO	CA	t
79	7	DIEGO IBARRA	DIB	t
80	7	GUACARA	GUA	t
81	7	JUAN JOSÉ MORA	JJM	t
82	7	LIBERTADOR	LIB	t
83	7	LOS GUAYOS	LGY	t
84	7	MIRANDA	MIR	t
85	7	MONTALBÁN	MNTB	t
86	7	NAGUANAGUA	NAG	t
87	7	PUERTO CABELLO	PTCB	t
88	7	SAN DIEGO	SND	t
89	7	SAN JOAQUÍN	SNJ	t
90	7	VALENCIA	VAL	t
91	8	ANZOÁTEGUI	ANZ	t
92	8	PAO DE SAN JUAN BAUTISTA	PSJB	t
93	8	FALCÓN	FAL	t
94	8	GIRARDOT	GIR	t
95	8	LIMA BLANCO	LB	t
96	8	RICAURTE	RIC	t
97	8	RÓMULO GALLEGOS	RGLL	t
98	8	SAN CARLOS DE AUSTRIA	SNCA	t
99	8	TINACO	TIN	t
100	9	ANTONIO DÍAZ	ADI	t
101	9	CASACOIMA	CCMA	t
102	9	PEDERNALES	PED	t
103	9	TUCUPITA	TUC	t
104	10	LIBERTADOR	LIB	t
105	11	ACOSTA	ACO	t
106	11	BOLÍVAR	BOL	t
107	11	BUCHIVACOA	BUC	t
108	11	CACIQUE MANAURE	CMAN	t
109	11	CARIRUBANA	CAR	t
110	11	COLINA	COL	t
111	11	DABAJURO	DAB	t
112	11	DEMOCRACIA	DEM	t
113	11	FALCÓN	FAL	t
114	11	FEDERACIÓN	FED	t
115	11	JACURA	JAC	t
116	11	LOS TAQUES	LTQ	t
117	11	MAUROA	MAU	t
118	11	MIRANDA	MIR	t
119	11	MONSEÑOR ITURRIZA	MIT	t
120	11	PALMA SOLA	PSO	t
121	11	PETIT	PET	t
122	11	PÍRITU	PIR	t
123	11	SAN FRANCISCO	SFCO	t
124	11	SILVA	SIL	t
125	11	SUCRE	SUC	t
126	11	TOCÓPERO	TOC	t
127	11	UNIÓN	UNI	t
128	11	URUMACO	URU	t
129	11	ZAMORA	ZMR	t
130	12	CAMAGUÁN	CAMA	t
131	12	CHAGUARAMAS	CHAG	t
132	12	EL SOCORRO	ESOC	t
133	12	SEBASTIAN FRANCISCO DE MIRANDA	SFDM	t
134	12	JOSÉ FÉLIX RIBAS	JFR	t
135	12	JOSÉ TADEO MONAGAS	JTM	t
136	12	JUAN GERMÁN ROSCIO	JGR	t
137	12	JULIÁN MELLADO	JM	t
138	12	LAS MERCEDES	LM	t
139	12	LEONARDO INFANTE	LIN	t
140	12	ORTIZ	ORT	t
141	12	PEDRO ZARAZA	PZ	t
142	12	SAN GERÓNIMO DE GUAYABAL	SGG	t
143	12	SAN JOSÉ DE GUARIBE	SJG	t
144	12	SANTA MARÍA DE IPIRE	SMI	t
145	13	ANDRÉS ELOY BLANCO	AEB	t
146	13	CRESPO	CRE	t
147	13	IRIBARREN	IRR	t
148	13	JIMÉNEZ	JIM	t
149	13	MORÁN	MOR	t
150	13	PALAVECINO	PAL	t
151	13	SIMÓN PLANAS	SPLA	t
152	13	TORRES	TORR	t
153	13	URDANETA	URD	t
154	14	ALBERTO ADRIANI	ALAD	t
155	14	ANDRÉS BELLO	AB	t
156	14	ANTONIO PINTO SALINAS	APS	t
157	14	ARICAGUA	ARI	t
158	14	ARZOBISPO CHACÓN	AZCH	t
159	14	CAMPO ELÍAS	CEL	t
160	14	CARACCIOLO PARRA OLMEDO	CPO	t
161	14	CARDENAL QUINTERO	CQ	t
162	14	GUARAQUE	GUA	t
163	14	JULIO CÉSAR SALAS	JCS	t
164	14	JUSTO BRICEÑO	JBR	t
165	14	LIBERTADOR	LIB	t
166	14	MIRANDA	MIR	t
167	14	OBISPO RAMOS DE LORA	ORL	t
168	14	PADRE NOGUERA	PNG	t
169	14	PUEBLO LLANO	PLL	t
170	14	RANGEL	RAN	t
171	14	RIVAS DÁVILA	RDA	t
172	14	SANTOS MARQUINA	SNMQ	t
173	14	SUCRE	SUC	t
174	14	TOVAR	TOV	t
175	14	TULIO FEBRES CORDERO	TFC	t
177	15	ACEVEDO	ACV	t
178	15	ANDRÉS BELLO	AB	t
179	15	BARUTA	BAR	t
180	15	BRIÓN	BRI	t
181	15	BUROZ	BUR	t
182	15	CARRIZAL	CAR	t
183	15	CHACAO	CHA	t
184	15	CRISTÓBAL ROJAS	CROJ	t
185	15	EL HATILLO	EHAT	t
186	15	GUAICAIPURO	GUAI	t
187	15	INDEPENDENCIA	INDP	t
188	15	LANDER	LAN	t
189	15	LOS SALIAS	LSAL	t
190	15	PÁEZ	PAEZ	t
191	15	PAZ CASTILLO	PZCT	t
192	15	PEDRO GUAL	PGUAL	t
193	15	PLAZA	PLA	t
194	15	SIMÓN BOLÍVAR	SB	t
195	15	URDANETA	URD	t
196	15	SUCRE	SUC	t
197	15	ZAMORA	ZMR	t
198	16	ACOSTA	ACO	t
199	16	AGUASAY	AGU	t
200	16	BOLÍVAR	BOL	t
201	16	CARIPE	CAR	t
202	16	CEDEÑO	CED	t
203	16	EZEQUIEL ZAMORA	EZ	t
204	16	LIBERTADOR	LIB	t
205	16	MATURÍN	MAT	t
206	16	PIAR	PIAR	t
207	16	PUNCERES	PUN	t
208	16	SANTA BÁRBARA	SNBR	t
209	16	SOTILLO	SOT	t
210	16	URACOA	URA	t
211	17	ANTOLÍN DEL CAMPO	ADC	t
212	17	ARISMENDI	ARI	t
213	17	DÍAZ	DIAZ	t
214	17	GARCÍA	GAR	t
215	17	GÓMEZ	GOM	t
216	17	MANEIRO	MAN	t
217	17	MARCANO	MRC	t
218	17	MARIÑO	MAR	t
219	17	MACANAO	MAC	t
220	17	TUBORES	TUB	t
221	17	VILLALBA	VILL	t
222	18	AGUA BLANCA	AGBC	t
223	18	ARAURE	ARA	t
224	18	ESTELLER	EST	t
225	18	GUANARE	GUA	t
226	18	GUANARITO	GTO	t
227	18	JOSÉ VICENTE DE UNDA	JVU	t
228	18	OSPINO	OSP	t
229	18	PÁEZ	PAEZ	t
230	18	PAPELÓN	PPLN	t
231	18	SAN GENARO DE BOCONOÍTO	SNGB	t
232	18	SAN RAFAEL DE ONOTO	SNRO	t
233	18	SANTA ROSALÍA	SNRO	t
234	18	SUCRE	SUC	t
235	18	TURÉN	TUR	t
236	19	ANDRÉS ELOY BLANCO	AEB	t
237	19	ANDRÉS MATA	AMAT	t
238	19	ARISMENDI	ARI	t
239	19	BENÍTEZ	BEN	t
240	19	BERMÚDEZ	VER	t
241	19	BOLÍVAR	BOL	t
242	19	CAJIGAL	CAJ	t
243	19	CRUZ SALMERÓN ACOSTA	CSA	t
244	19	LIBERTADOR	LIB	t
245	19	MARIÑO	MAR	t
246	19	MEJÍA	MEJ	t
247	19	MONTES	MON	t
248	19	RIBERO	RIB	t
249	19	SUCRE	SUC	t
250	19	VALDEZ	VAL	t
251	20	ANDRÉS BELLO	AB	t
252	20	ANTONIO RÓMULO COSTA	ARC	t
253	20	AYACUCHO	AYA	t
254	20	BOLÍVAR	BOL	t
255	20	CÁRDENAS	CAR	t
256	20	CÓRDOBA	COR	t
257	20	FERNÁNDEZ FEO	FFEO	t
258	20	FRANCISCO DE MIRANDA	FDM	t
259	20	GARCÍA DE HEVIA	GDH	t
260	20	GUÁSIMOS	GUA	t
261	20	INDEPENDENCIA	INDP	t
262	20	JÁUREGUI	JAU	t
263	20	JOSÉ MARÍA VARGAS	JMV	t
264	20	JUNÍN	JUN	t
265	20	LIBERTAD	LBTD	t
266	20	LIBERTADOR	LIB	t
267	20	LOBATERA	LOB	t
268	20	MICHELENA	MICH	t
269	20	PANAMERICANO	PANA	t
270	20	PEDRO MARÍA UREÑA	PMU	t
271	20	RAFAEL URDANETA	RUDT	t
272	20	SAMUEL DARÍO MALDONADO	SDM	t
273	20	SAN CRISTÓBAL	SNCR	t
274	20	SEBORUCO	SEB	t
275	20	SIMÓN RODRÍGUEZ	SR	t
276	20	SUCRE	SUC	t
277	20	TORBES	TOR	t
278	20	URIBANTE	URI	t
279	20	SAN JUDAS TADEO	SJT	t
280	21	ANDRÉS BELLO	AB	t
281	21	BOCONÓ	BOC	t
282	21	BOLÍVAR	BOL	t
283	21	CANDELARIA	CND	t
284	21	CARACHE	CAR	t
285	21	ESCUQUE	ESQ	t
286	21	JOSÉ FELIPE MÁRQUEZ CAÑIZALEZ	JFMC	t
287	21	JUAN VICENTE CAMPOS ELÍAS	JVCE	t
288	21	LA CEIBA	LCB	t
289	21	MIRANDA	MIR	t
290	21	MONTE CARMELO	MTC	t
291	21	MOTATÁN	MOT	t
292	21	PAMPÁN	PAM	t
293	21	PAMPANITO	PMPT	t
294	21	RAFAEL RANGEL	RRNG	t
295	21	SAN RAFAEL DE CARVAJAL	SRC	t
296	21	SUCRE	SUC	t
297	21	TRUJILLO	TRU	t
298	21	URDANETA	URD	t
299	21	VALERA	VAL	t
300	22	VARGAS	VAR	t
301	23	ARÍSTIDES BASTIDAS	ABST	t
302	23	BOLÍVAR	BOL	t
303	23	COCOROTE	COC	t
304	23	INDEPENDENCIA	INDP	t
305	23	LA TRINIDAD	LTRD	t
306	23	MANUEL MONGE	MMON	t
307	23	NIRGUA	NIR	t
308	23	PEÑA	PEÑA	t
309	23	SAN FELIPE	SNF	t
310	23	SUCRE	SUC	t
311	23	URACHICHE	URA	t
312	23	VEROES	VER	t
313	23	BRUZUAL	BRZ	t
314	23	JOSÉ ANTONIO PÁEZ	JAP	t
\.


--
-- TOC entry 2206 (class 0 OID 35338305)
-- Dependencies: 1521
-- Data for Name: nivel_financiero_snc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY nivel_financiero_snc (nfs_nivel_financiero_snc_pk, nfs_nivel, nfs_capital_desde, nfs_capital_hasta) FROM stdin;
12	VII	700001.00	900000.00
13	VIII	900001.00	1100000.00
14	IX	1100001.00	1300000.00
15	X	1300001.00	1500000.00
16	XI	1500001.00	1800000.00
17	XII	1800001.00	2100000.00
18	XIII	2100001.00	2400000.00
19	XIV	2400001.00	2700000.00
20	XV	2700001.00	3000000.00
21	XVI	3000001.00	3500000.00
22	XVII	3500001.00	4000000.00
1	I	0.00	100000.00
3	III	200001.00	300000.00
6	IV	300001.00	400000.00
10	V	400001.00	500000.00
11	VI	500001.00	700000.00
23	XVIII	4000001.00	4500000.00
24	XIX	4500001.00	5000000.00
25	XX	5000001.00	10000000.00
26	XXI	10000001.00	15000000.00
27	XXII	15000001.00	20000000.00
28	XXIII	20000001.00	25000000.00
29	XXIV	25000001.00	30000000.00
30	XXV	30000001.00	35000000.00
31	XXVI	35000001.00	40000000.00
32	XXVII	40000001.00	45000000.00
33	XVIII	45000001.00	50000000.00
34	XXIX	50000001.00	55000000.00
35	XXX	55000001.00	60000000.00
36	XXXI	60000001.00	65000000.00
37	XXXII	65000001.00	70000000.00
38	XXXIII	70000001.00	75000000.00
39	XXXIV	75000001.00	80000000.00
40	XXXV	80000001.00	85000000.00
41	XXXVI	85000001.00	90000000.00
42	XXXVII	90000001.00	95000000.00
2	II	100001.00	200000.00
57	XXXVIII	95000001.00	100000000.00
60	XXXIX	100000001.00	999999999.00
\.


--
-- TOC entry 2207 (class 0 OID 35338307)
-- Dependencies: 1522
-- Data for Name: numeros_telefonicos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY numeros_telefonicos (tel_numeros_telefonicos_pk, ntt_numeros_telefonicos_tipo_fk, con_contratistas_fk, tel_numero, tel_codigo_area, tel_activo) FROM stdin;
453	1	2233	54	122	t
454	1	2233	7972827	0261	t
455	1	2233	43	43	t
456	1	2234	43	43	t
477	1	2238	7548961	0261	t
492	1	2237	7258963	0261	t
493	2	2237	6225896	0414	t
494	3	2237	7258935	0261	t
495	1	2239	8150871	0264	t
497	1	2241	546	45654	t
498	1	2250	435345	43534	t
499	2	2250	534534	34534	t
500	3	2250	345345	53453	t
501	1	2251	435345	43534	t
502	2	2251	534534	34534	t
503	3	2251	345345	53453	t
504	1	2252	435345	43534	t
505	2	2252	534534	34534	t
506	3	2252	345345	53453	t
507	1	2253	435	435	t
508	2	2253	45	435	t
509	3	2253	435	345	t
510	4	2253	435	435	t
511	1	2256	5320656	0412	t
512	2	2256	4966569	0414	t
513	3	2256	5621876	0245	t
519	2	2259	66	66	t
520	1	2259	666	666	t
521	3	2259	6666	6666	t
522	4	2259	666666	66666	t
523	7	2259	777777	7777	t
539	2	2240	453	54	t
540	1	2240	2332	332	t
541	3	2240	45	435	t
542	7	2240	11111	45345	t
551	2	2261	7810442	0416	t
552	1	2261	8390530	0241	t
553	3	2261	8390530	0241	t
554	7	2261	8390530	0241	t
555	1	2260	6756	657	t
556	3	2260	782	782	t
557	7	2260	78	78	t
558	1	1791	455	455	t
559	3	1791	7888	45588	t
560	7	1791	232	3	t
561	2	2262	7925767	0414	t
562	1	2262	7671655	0281	t
563	3	2262	7671655	0281	t
\.


--
-- TOC entry 2208 (class 0 OID 35338309)
-- Dependencies: 1523
-- Data for Name: numeros_telefonicos_sucursales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY numeros_telefonicos_sucursales (tls_numeros_telefonicos_sucursales_pk, ntt_numeros_telefonicos_tipo_fk, csu_contratistas_sucursales_fk, tls_numero, tls_codigo_area, tls_activo) FROM stdin;
140	2	165	4344	434	t
141	1	166	5455454	435	t
142	1	170	7528963	0261	t
147	1	171	323	32	t
148	1	173	34234	34434	t
149	1	175	543543	2123	t
150	2	175	534534	43534	t
151	3	175	34534	53453	t
152	4	175	435345	345	t
169	2	176	5345	4545	t
170	1	176	4334	43455	t
171	3	176	345	535	t
172	4	176	345	345	t
173	7	176	555	55	t
177	1	177	1111	1111	t
178	3	177	2222	2222	t
179	7	177	3333	333	t
\.


--
-- TOC entry 2209 (class 0 OID 35338311)
-- Dependencies: 1524
-- Data for Name: numeros_telefonicos_tipo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY numeros_telefonicos_tipo (ntt_numeros_telefonicos_tipo_pk, ntt_descripcion, ntt_obligatorio) FROM stdin;
2	Teléfono Móvil	f
1	Teléfono Fijo	t
3	Teléfono Fax	t
4	Oficina 2	f
7	oficina 3	f
\.


--
-- TOC entry 2210 (class 0 OID 35338313)
-- Dependencies: 1525
-- Data for Name: organismos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY organismos (org_organismos_pk, org_nombre, org_siglas, org_activo) FROM stdin;
4	Oficina de Control de Obras y Programas	OCOP	t
5	Fundación Jesús Enrique Lossada	JEL	t
2	Secretaría de Infraestructura del estado Zulia	SIEZ	t
3	Servicio Autónomo Municipal de Administración Tributaria	SAMAT	t
6	Gobierno Electronico	Ge	t
\.


--
-- TOC entry 2211 (class 0 OID 35338315)
-- Dependencies: 1526
-- Data for Name: personas_naturales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY personas_naturales (pnt_personas_naturales_pk, pnt_nombres, pnt_apellidos, pnt_cedula_de_identidad, pnt_rif_personal, pnt_email, pnt_otro_documento) FROM stdin;
224	Pablo	Perex	V55555	54	correo@dyt.org	otros
177	Carlos	gonzalez	v15839590	15839590-2	carlos@idyt.org	otros
179	Edward	Velásquez	v13933816	V13933816-9	edwardv1@hotmail.com	otros
181	comisario	Apellido Comisario	E111	dcdcdc	dcdcdc	otros
182	Ricardo	Camejo	V9999	45646	eretert	otros
183	utyuytuy	ytutyuyt	E6666666	yghfghf	ghgfhfgh	otros
184	vbnbnb	bnbvn	Vbbb	fgfcg	bvbcbc	otros
185	noo	ooono	E1254	1213213	jghjghj	otros
186	Cárrr	dkjfbdskfññ¨sff	V4444	444	444	otros
187	carlo	weafywuef	E45556	44555		otros
188	carlós	fds	V125	44	dsfdfsddf	otros
228	Paula G	Torres	V14256890	142568901	ptorres@gmail.com	otros
229	Rafael 	Urdaneta	V10685231	010685231	rafael@gmail.com	otros
230	Carlos Luis	Inciarte Ocando	V8702939	08702939	carlo@gmail.com	otros
231	Ramon 	Vera Quintero	V7623848	07623848	ramon@gmail.com	otros
232	Jesus	Rodriguez	V9740514	07623848	jesus@gmail.com	otros
234	accionista	apellido acionista	V11	45	fdfdg	otros
235	Yulimar	Valero	V124578	124578	correo@idyt.org	otros
236	mariana	paz	V15478639	045781269	lapaz@hotmail.com	otros
237	mariana	paz	V15847236	012458794	lamary@hotmail.com	otros
238	mariela	gomez	V125478963	2554668771	ladfv@hotmail.com	otros
239	lucia	gomez	V15487561445	1521121	sftryhyhg@hotmail.com	otros
240	petra 	rojas	V15544523	16000655752	dgfytutjgjgjjh@hotmail.com	otros
241	paula	liz	V1454545454	12145477774	ksfdefeetetkr@mewwr3	otros
233	Carlos	Mendoza	V7125415	07125415	Carlos@gmail.com	otros
225	Arianne	Rodriguez	V7090331	7090331	Arianne@hotmail.com	otros
242	massiel	jerez	V12457632	124578896	landerrfrf_@hotmail.com	otros
243	carlos	medina	V145788952224	44471211255	kaksssns@hotmail.com	otros
244	irwiin	gutierres 	V12445781	124457744	mwedkwk@,lsklsklsk	otros
248	fefiowpfweoqrewp	jmkjdsz	V155558865	459856556	gmail.com	otros
246	mia isabella	contreras	V154785545	2445578147	mar@gmial.com	otros
247	mayorlis	mederana	V125552127	1478729520	sdhejdgmail.com	otros
249	isabel	peres	V1474558444	14555445121	masdecar@rgrgvdv	otros
250	mare	mendez	V44545424242454	54555555555555555		otros
245	Carla	mendoza	V1245789234544	14425525555554	cm@hotmail.com	otros
252	Laura	Pereira	V12002003	120020031	lpereira@hotmail.com	otros
253	Laura	Pereira	V12002003	120020031	lpereira@hotmail.com	otros
251	Richard	Parra	V9865231	98652310	mgonzalez@gmail.com	otros
254	Albaldo de jesus	Solano	V4991538	49915388		otros
255	José	Villalobos	V5803164	58031648		otros
256	shdfcfh	ncvnvn	V2587456	25874568		otros
257	sdsad	sdad	V34243	3424	dfsdfdsf	otros
258	dddd	ffffd	V466	55	fgfdg	otros
259	hjghj	ghjgh	V677	7676	hgjhgj	otros
260	erer	dsfdsf	V434	444	rfdsfdsf	otros
261	fefds	dfsfsd	V657657	6567	hgfh	otros
262	fds	dsf	V43	43	dfsd	otros
263	fggfdg	fgdfg	V56546	54645	546456	otros
264	hhgf	hgfhfgh	V565465	56456	ty	otros
266	erw	rerew	V434443	44	dffsd	otros
265	fff	fff	V55	545	fff	otros
267	bdfbfn 	metm	V12658974	126589748		otros
268	yrt	ytr	V435	56	rty	otros
269	Jorge	Sanchez	V5551715	55517150	jsanchez@gmail.com	otros
270	Yulimar	Rodriguez	V14525986	145259866	yrodriguez	otros
271	lucio orlando	carrero arellano	V3791447	37914479	marylaviva@hotmail.com	otros
272	VICTOR 	VASQUEZ	V13995259	139952599	VICTORVASQ@HOTMAIL.COM	otros
273	jghj	sdasdsad	V458977	34234	dsfsdfsdf	otros
275	sdfdsfsdf	fdfdsf	V9546821 	09546821 	dfsdfsdf	otros
274	Marilis	Dias	V9546821	09546821	Marilis@gmail.com	otros
226	Isabel 	Borragan 	V12996278	012996278	isabel@hotmail.com	otros
276	Rchard	Parra	V7372175	07372175	Rchard@gmail.com	otros
277	Goyo	Suarez	V9541910	09541910	Goyo@gmail.com	otros
278	elizabeth	VÃ¡squez	V8289005	08289005	elizabeth@hotmail.com	otros
279	fghgfh	gfhfghgfh	V4545	453454	fgdfgfgd	otros
281	Manuel	Sobrino	V9868520	98685202	msobrino@gmail.com	otros
282	Luís	González	V8528236	85282360	lgonzalez@gmail.com	otros
280	cdff	ffff	V455445	545454	correo@idyt	otros
285	ertg	fgfdg	V56546599	6456	hgfhgfh	otros
227	Carlos	Ramirez	V15839590	158395902	casslos@hotmail.com	otros
286	Migdalia	Perez	V9280718	92807180		otros
287	Ildemaro	Perez	V17422982	174229820		otros
283	Rafael 	Montenegro	V8785201	87852010	rmontenegro@hotmail.com	otros
284	secreto	Sumarial	V1254	12585	correo@idyt.com	otros
289	Vinicio	Del Toro	V7896210	78962100	vtoro@gmail.com	otros
288	Eleazar	Lopez	V4554	4434	CORREO@DYT.COM	otros
290	Ricardo	Camejo	V11453342	11453342	ratardo@hotmail.com	otros
291	Virginia	NuÃ±ez	V16161871	16161871	virgi@cantv.net	otros
292	Luisa	De Camejo	V1636451	1636451	luisa@cant.net	otros
293	fsd	fgdfg	V6665	544	yrty	otros
294	et	thg	V55454	45435	gfdgdfg	otros
\.


--
-- TOC entry 2212 (class 0 OID 35338320)
-- Dependencies: 1527
-- Data for Name: rendimientos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rendimientos (ren_rendimientos_pk, ren_descripcion, ren_activo) FROM stdin;
2	Regular	t
3	Aceptable	t
5	Bueno	t
1	Deficiente	t
\.


--
-- TOC entry 2213 (class 0 OID 35338322)
-- Dependencies: 1528
-- Data for Name: sol_rec_xtipo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sol_rec_xtipo (srt_sol_rec_xtipo_pk, ctp_contratistas_tipo_fk, svr_solvencias_recaudos_fk, srt_vigente_hasta, srt_obligatorio) FROM stdin;
8	1	11	2010-07-30	t
7	1	6	2010-07-30	t
19	10	16	2010-07-30	t
15	10	15	2010-07-30	t
21	10	20	2010-07-31	t
25	1	13	2010-07-31	t
29	1	17	2010-12-30	t
12	10	18	2010-07-30	t
1	1	1	2010-07-30	t
14	10	19	2010-07-30	t
13	10	14	2010-07-30	t
30	1	14	2010-07-30	t
31	1	15	2010-07-30	f
32	1	16	2010-07-30	t
33	10	11	2010-07-30	t
34	10	1	2010-07-30	t
35	10	8	2009-07-30	t
36	10	6	2010-07-30	t
37	10	17	2010-07-30	t
38	13	1	2009-05-31	t
40	1	24	2009-08-31	t
6	1	8	2010-07-30	f
\.


--
-- TOC entry 2214 (class 0 OID 35338325)
-- Dependencies: 1529
-- Data for Name: solvencias_recaudos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY solvencias_recaudos (svr_solvencias_recaudos_pk, svr_descripcion, svr_tiene_vencimiento, svr_vencimiento_dias, svr_activo) FROM stdin;
6	Solvencia Laboral	t	90	t
11	Acta Constitutiva	f	\N	t
13	Ultima Declaración del Impuesto Sobre la Renta (ISLR)	t	365	t
15	Carta de Aceptación y Solvencia del Ingeniero Residente	t	365	t
16	Solvencia I.N.C.E.	t	365	t
17	Solvencia del Seguro Social	t	365	t
19	Fotocopia de la Cédula de Identidad de todos los integrantes de la Junta Administradora	t	365	t
20	Afiliación con otras Cooperativas	t	365	t
1	R.I.F.	t	365	t
24	Número de Identificación Tributaria	t	365	t
25	numero de identicacion tributaria	f	365	t
18	Solvencia X	t	365	t
14	Copia del Certificado de Inscripción del Registro Nacional de Contratistas y Reporte de Actividades	t	365	t
8	Balance General visado	t	365	t
\.


--
-- TOC entry 2215 (class 0 OID 35338329)
-- Dependencies: 1531
-- Data for Name: tipo_actividad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo_actividad (tpa_tipo_actividad_pk, tpa_nombre, tpa_activo) FROM stdin;
6	Servicios de Edición e Impresión	t
5	Servicios Turísticos y Recreacionales	t
8	Servicios de Mantenimiento y Reparación de Equipos	t
\.


--
-- TOC entry 2216 (class 0 OID 35338331)
-- Dependencies: 1532
-- Data for Name: tipo_cooperativa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo_cooperativa (tpc_tipo_cooperativa_pk, tpc_nombre, tpc_activo) FROM stdin;
3	Producción de Bienes y Servicios	t
2	Ahorro y Crédito	t
4	Consumo de Bienes y Servicios	t
6	Mixta	t
\.


--
-- TOC entry 2217 (class 0 OID 35338333)
-- Dependencies: 1533
-- Data for Name: tipo_firma; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo_firma (tpf_tipo_firma_pk, tpf_descripcion, tpf_activo) FROM stdin;
1	Conjunta	t
2	Separadas	t
\.


SET search_path = sistema, pg_catalog;

--
-- TOC entry 2218 (class 0 OID 35338510)
-- Dependencies: 1581
-- Data for Name: usuarios; Type: TABLE DATA; Schema: sistema; Owner: postgres
--

COPY usuarios (usr_usuarios_pk, usr_nombre, usr_clave, usr_correo_electronico, usr_nivel, usr_fecha_creacion, usr_fecha_expira, usr_rol) FROM stdin;
26	isabel	731d11c52b59e96c5abba26382d5db538d0a2ce2	isabel@idyt.org	1	2009-05-19	2009-05-31	1
1	demo	7110eda4d09e062aa5e4a390b0a572ac0d2c0220	rcamejo@idyt.org	1	\N	2009-12-05	\N
25	rosario	64331d9d57282194df50c93024152c10e60dc374	rcamejo@idyt.com	1	2009-05-18	2009-05-31	1
\.


--
-- TOC entry 2219 (class 0 OID 35338512)
-- Dependencies: 1582
-- Data for Name: usuarios_menu; Type: TABLE DATA; Schema: sistema; Owner: postgres
--

COPY usuarios_menu (usm_usuarios_menu_pk, usm_nivel, usm_codigo, usm_titulos, usm_activo) FROM stdin;
13	0011	stm_aix("p1i10","p1i0",[0,"Escala de Rendimiento","","",-1,-1,0,"baseurlindex.php/con_listview_Rendimiento"]);	Escala de Rendimiento	t
22	0401	stm_aix("p5i0","p1i0",[0,"Salir","","",-1,-1,0,"baseurlindex.php/con_acceso/salir", "_parent"]);	Salir	t
24	0403	stm_aix("p5i2","p1i0",[0,"Cambiar Contraseña","","",-1,-1,0,"baseurlindex.php/con_acceso/cambio_password"]);	Cambiar Contraseña	t
23	0402	stm_aix("p5i1","p1i0",[0,"Acerca de","","",-1,-1,0,"baseurlindex.php/con_sistema/acerca", "_blank"]);	Acerca de	t
25	0404	stm_aix("p5i3","p1i0",[0,"Contenido","","",-1,-1,0,"baseurlindex.php/con_sistema/ayuda","_blank"]);;	Contenido	t
26	0405	stm_aix("p5i4","p1i0",[0,"Mantenimiento","","",-1,-1,0,"baseurlindex.php/con_sistema/mantenimiento"])	Mantenimiento	t
5	0003	stm_aix("p1i2","p1i0",[0,"Índice de Capital Social","","",-1,-1,0,"baseurlindex.php/con_listview_Indice"]);	Índice de Capital Social	t
6	0004	stm_aix("p1i3","p1i0",[0,"Nivel Financiero","","",-1,-1,0,"baseurlindex.php/con_listview_Nivel"]);	Nivel Financiero	t
8	0006	stm_aix("p1i5","p1i0",[0,"Tipos de Cooperativas","","",-1,-1,0,"baseurlindex.php/con_listview_TiposCooperativas"]);	Tipos de Cooperativas	t
9	0007	stm_aix("p1i6","p1i0",[0,"Tipos de Firmas","","",-1,-1,0,"baseurlindex.php/con_listview_TiposFirmas"]);	Tipos de Firmas	t
10	0008	stm_aix("p1i7","p1i0",[0,"Tipos de Actividades","","",-1,-1,0,"baseurlindex.php/con_listview_TiposActividades"]);	Tipos de Actividades	t
3	0001	stm_aix("p1i0","p0i0",[0,"Áreas de la Contratista","","",-1,-1,0,"baseurlindex.php/con_listview_Areas","_parent","","","","",0,0,0,"","",0,0,0,0,1,"#FFFFFF",0,"#4f6594",0,"","",0,0,0,0,"#E6EFF9","#000000","#161747","#FFFFFF"]);	Áreas de la Contratista	t
4	0002	stm_aix("p1i1","p1i0",[0,"Especialidades de la Contratista","","",-1,-1,0,"baseurlindex.php/con_listview_Especialidad"]);	Especialidades de la Contratista	t
7	0005	stm_aix("p1i4","p1i0",[0,"Tipos de Contratistas","","",-1,-1,0,"baseurlindex.php/con_listview_TiposEmpresas"]);	Tipos de Contratista	t
2	00		Mantenimiento	f
27	01		Operaciones	f
28	02		Seguimiento	f
29	03		Reportes	f
30	04		Sistema	f
11	0009	stm_aix("p1i8","p1i0",[0,"Recaudos","","",-1,-1,0,"baseurlindex.php/con_listview_Recaudos"]);	Recaudos	t
15	0101	stm_aix("p2i0","p1i0",[0,"Registro de Contratistas","","",-1,-1,0,"baseurlindex.php/con_listview_Contratistas"]);	Registro de Contratistas	t
20	0302	stm_aix("p4i1","p1i0",[0,"Planilla de Recaudos","","",-1,-1,0,"baseurlindex.php/con_reportes/rep_recaudos"]);;	Planilla de Recaudos	t
12	0010	stm_aix("p1i9","p1i0",[0,"Clasificación de Recaudos","","",-1,-1,0,"baseurlindex.php/con_listview_TipoRecaudo"]);	Clasificación de Recaudos	t
19	0301	stm_aix("p4i0","p1i0",[0,"Generador de Reporte","","",-1,-1,0,"baseurlindex.php/con_RepConstructor"]);;	Generador de Reportes	t
18	0203	stm_aix("p3i2","p1i0",[0,"Desincorporación","","",-1,-1,0,"baseurlindex.php/con_Desincorporacion"]);;	Desincorporación	t
16	0201	stm_aix("p3i0","p1i0",[0,"Actualización de Contratistas","","",-1,-1,0,"baseurlindex.php/con_consult_regco"]);	Actualización de Contratistas	t
17	0202	stm_aix("p3i1","p1i0",[0,"Actualización de Recaudos","","",-1,-1,0,"baseurlindex.php/Con_consult_solv"]);;	Actualización de Recaudos	t
1	0012	stm_aix("p1i11","p1i0",[0,"Organismos","","",-1,-1,0,"baseurlindex.php/con_listview_Organismos"]);	Organismos	t
\.


--
-- TOC entry 2220 (class 0 OID 35338514)
-- Dependencies: 1583
-- Data for Name: usuarios_opciones; Type: TABLE DATA; Schema: sistema; Owner: postgres
--

COPY usuarios_opciones (uso_usuarios_opciones_pk, usr_usuarios_fk, usm_usuarios_fk, uso_ver, uso_incluir, uso_modificar, uso_borrar, uso_campos) FROM stdin;
642	1	2	f	f	f	f	\N
643	1	3	t	t	f	f	\N
644	1	4	t	f	f	f	\N
645	1	5	t	f	f	f	\N
646	1	6	t	f	f	f	\N
647	1	7	t	f	f	f	\N
648	1	8	t	f	f	f	\N
649	1	9	t	f	f	f	\N
650	1	10	t	f	f	f	\N
651	1	11	t	f	f	f	\N
652	1	12	t	f	f	f	\N
653	1	13	t	f	f	f	\N
654	1	1	t	f	f	f	\N
655	1	27	f	f	f	f	\N
656	1	15	t	f	f	f	\N
657	1	28	f	f	f	f	\N
658	1	16	t	f	f	f	\N
659	1	17	t	f	f	f	\N
660	1	18	t	f	f	f	\N
661	1	29	f	f	f	f	\N
662	1	19	t	f	f	f	\N
663	1	20	t	f	f	f	\N
664	1	30	f	f	f	f	\N
665	1	22	t	f	f	f	\N
666	1	23	t	f	f	f	\N
667	1	24	t	f	f	f	\N
668	1	25	t	f	f	f	\N
669	1	26	t	f	f	f	\N
762	26	2	f	f	f	f	\N
763	26	3	t	t	t	t	\N
764	26	4	t	t	t	t	\N
765	26	5	t	t	t	t	\N
766	26	6	t	t	t	t	\N
767	26	7	t	t	t	t	\N
768	26	8	t	t	t	t	\N
769	26	9	t	t	t	t	\N
770	26	10	t	t	t	t	\N
771	26	11	t	t	t	t	\N
772	26	12	t	t	t	t	\N
773	26	13	t	t	t	t	\N
774	26	1	t	t	t	t	\N
775	26	27	f	f	f	f	\N
776	26	15	t	t	t	t	\N
777	26	28	f	f	f	f	\N
778	26	16	t	t	t	t	\N
779	26	17	t	t	t	t	\N
780	26	18	t	t	t	t	\N
781	26	29	f	f	f	f	\N
782	26	19	t	t	t	t	\N
783	26	20	t	t	t	t	\N
784	26	30	f	f	f	f	\N
785	26	22	t	t	t	t	\N
786	26	23	t	t	t	t	\N
787	26	24	t	t	t	t	\N
788	26	25	t	t	t	t	\N
789	26	26	t	t	t	t	\N
790	25	2	f	f	f	f	\N
791	25	3	t	t	t	t	\N
792	25	4	t	t	t	t	\N
793	25	5	t	t	t	t	\N
794	25	6	t	t	t	t	\N
795	25	7	t	t	t	t	\N
796	25	8	t	t	t	t	\N
797	25	9	t	t	t	t	\N
798	25	10	t	t	t	t	\N
799	25	11	t	t	t	t	\N
800	25	12	t	t	t	t	\N
801	25	13	t	t	t	t	\N
802	25	1	t	t	t	t	\N
803	25	27	f	f	f	f	\N
804	25	15	t	t	t	t	\N
805	25	28	f	f	f	f	\N
806	25	16	t	t	t	t	\N
807	25	17	t	t	t	t	\N
808	25	18	t	t	t	t	\N
809	25	29	f	f	f	f	\N
810	25	19	t	t	t	t	\N
811	25	20	t	t	t	t	\N
812	25	30	f	f	f	f	\N
813	25	22	t	t	t	t	\N
814	25	23	t	t	t	t	\N
815	25	24	t	t	t	t	\N
816	25	25	t	t	t	t	\N
817	25	26	t	t	t	t	\N
\.


SET search_path = public, pg_catalog;

--
-- TOC entry 2058 (class 2606 OID 35338725)
-- Dependencies: 1500 1500
-- Name: pk_areas_objeto; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY areas_objeto
    ADD CONSTRAINT pk_areas_objeto PRIMARY KEY (aob_areas_objeto_pk);


--
-- TOC entry 2061 (class 2606 OID 35338727)
-- Dependencies: 1502 1502
-- Name: pk_auditoria; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auditoria
    ADD CONSTRAINT pk_auditoria PRIMARY KEY (adt_auditoria_pk);


--
-- TOC entry 2064 (class 2606 OID 35338729)
-- Dependencies: 1503 1503
-- Name: pk_ciudades; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ciudades
    ADD CONSTRAINT pk_ciudades PRIMARY KEY (ciu_ciudades_pk);


--
-- TOC entry 2067 (class 2606 OID 35338731)
-- Dependencies: 1504 1504
-- Name: pk_contratista_evaluacion; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contratista_evaluacion
    ADD CONSTRAINT pk_contratista_evaluacion PRIMARY KEY (eva_contratista_evaluacion_pk);


--
-- TOC entry 2070 (class 2606 OID 35338733)
-- Dependencies: 1505 1505
-- Name: pk_contratistas; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contratistas
    ADD CONSTRAINT pk_contratistas PRIMARY KEY (con_contratistas_pk);


--
-- TOC entry 2073 (class 2606 OID 35338735)
-- Dependencies: 1506 1506
-- Name: pk_contratistas_acjdrl; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contratistas_acjdrl
    ADD CONSTRAINT pk_contratistas_acjdrl PRIMARY KEY (ajr_contratistas_acjdrl_pk);


--
-- TOC entry 2076 (class 2606 OID 35338737)
-- Dependencies: 1507 1507
-- Name: pk_contratistas_comisarios; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contratistas_comisarios
    ADD CONSTRAINT pk_contratistas_comisarios PRIMARY KEY (com_contratistas_comisarios_pk);


--
-- TOC entry 2078 (class 2606 OID 35338739)
-- Dependencies: 1508 1508
-- Name: pk_contratistas_contratos; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contratistas_contratos
    ADD CONSTRAINT pk_contratistas_contratos PRIMARY KEY (ctt_contratistas_contratos_pk);


--
-- TOC entry 2081 (class 2606 OID 35338741)
-- Dependencies: 1509 1509
-- Name: pk_contratistas_estatus; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contratistas_estatus
    ADD CONSTRAINT pk_contratistas_estatus PRIMARY KEY (ett_contratistas_estatus_pk);


--
-- TOC entry 2084 (class 2606 OID 35338743)
-- Dependencies: 1510 1510
-- Name: pk_contratistas_legal; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contratistas_legal
    ADD CONSTRAINT pk_contratistas_legal PRIMARY KEY (clg_contratistas_legal_pk);


--
-- TOC entry 2087 (class 2606 OID 35338745)
-- Dependencies: 1511 1511
-- Name: pk_contratistas_solvencias; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contratistas_solvencias
    ADD CONSTRAINT pk_contratistas_solvencias PRIMARY KEY (sol_contratistas_solvencias_pk);


--
-- TOC entry 2090 (class 2606 OID 35338747)
-- Dependencies: 1512 1512
-- Name: pk_contratistas_sucursales; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contratistas_sucursales
    ADD CONSTRAINT pk_contratistas_sucursales PRIMARY KEY (csu_contratistas_sucursales_pk);


--
-- TOC entry 2093 (class 2606 OID 35338749)
-- Dependencies: 1513 1513
-- Name: pk_contratistas_tipo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contratistas_tipo
    ADD CONSTRAINT pk_contratistas_tipo PRIMARY KEY (ctp_contratistas_tipo_pk);


--
-- TOC entry 2095 (class 2606 OID 35338751)
-- Dependencies: 1514 1514
-- Name: pk_denominacion_comercial; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY denominacion_comercial
    ADD CONSTRAINT pk_denominacion_comercial PRIMARY KEY (dec_denominacion_comercial_pk);


--
-- TOC entry 2098 (class 2606 OID 35338753)
-- Dependencies: 1515 1515
-- Name: pk_esp_are_xcontratista; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY esp_are_xcontratista
    ADD CONSTRAINT pk_esp_are_xcontratista PRIMARY KEY (eac_esp_are_xcontratista_pk);


--
-- TOC entry 2101 (class 2606 OID 35338755)
-- Dependencies: 1516 1516
-- Name: pk_especialidad_objeto; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY especialidad_objeto
    ADD CONSTRAINT pk_especialidad_objeto PRIMARY KEY (epo_especialidad_objeto_pk);


--
-- TOC entry 2104 (class 2606 OID 35338757)
-- Dependencies: 1517 1517
-- Name: pk_estados; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estados
    ADD CONSTRAINT pk_estados PRIMARY KEY (est_estados_pk);


--
-- TOC entry 2107 (class 2606 OID 35338759)
-- Dependencies: 1518 1518
-- Name: pk_estatus; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estatus
    ADD CONSTRAINT pk_estatus PRIMARY KEY (ett_estatus_pk);


--
-- TOC entry 2109 (class 2606 OID 35338761)
-- Dependencies: 1519 1519
-- Name: pk_indice_capital_social; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY indice_capital_social
    ADD CONSTRAINT pk_indice_capital_social PRIMARY KEY (ics_indice_capital_social_pk);


--
-- TOC entry 2112 (class 2606 OID 35338763)
-- Dependencies: 1520 1520
-- Name: pk_municipio; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY municipio
    ADD CONSTRAINT pk_municipio PRIMARY KEY (mun_municipio_pk);


--
-- TOC entry 2115 (class 2606 OID 35338765)
-- Dependencies: 1521 1521
-- Name: pk_nivel_financiero_snc; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY nivel_financiero_snc
    ADD CONSTRAINT pk_nivel_financiero_snc PRIMARY KEY (nfs_nivel_financiero_snc_pk);


--
-- TOC entry 2117 (class 2606 OID 35338767)
-- Dependencies: 1522 1522
-- Name: pk_numeros_telefonicos; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY numeros_telefonicos
    ADD CONSTRAINT pk_numeros_telefonicos PRIMARY KEY (tel_numeros_telefonicos_pk);


--
-- TOC entry 2119 (class 2606 OID 35338769)
-- Dependencies: 1523 1523
-- Name: pk_numeros_telefonicos_sucursales; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY numeros_telefonicos_sucursales
    ADD CONSTRAINT pk_numeros_telefonicos_sucursales PRIMARY KEY (tls_numeros_telefonicos_sucursales_pk);


--
-- TOC entry 2122 (class 2606 OID 35338771)
-- Dependencies: 1524 1524
-- Name: pk_numeros_telefonicos_tipo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY numeros_telefonicos_tipo
    ADD CONSTRAINT pk_numeros_telefonicos_tipo PRIMARY KEY (ntt_numeros_telefonicos_tipo_pk);


--
-- TOC entry 2125 (class 2606 OID 35338773)
-- Dependencies: 1525 1525
-- Name: pk_organismos; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY organismos
    ADD CONSTRAINT pk_organismos PRIMARY KEY (org_organismos_pk);


--
-- TOC entry 2128 (class 2606 OID 35338775)
-- Dependencies: 1526 1526
-- Name: pk_personas_naturales; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY personas_naturales
    ADD CONSTRAINT pk_personas_naturales PRIMARY KEY (pnt_personas_naturales_pk);


--
-- TOC entry 2130 (class 2606 OID 35338777)
-- Dependencies: 1527 1527
-- Name: pk_rendimientos; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rendimientos
    ADD CONSTRAINT pk_rendimientos PRIMARY KEY (ren_rendimientos_pk);


--
-- TOC entry 2133 (class 2606 OID 35338779)
-- Dependencies: 1528 1528
-- Name: pk_sol_rec_xtipo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sol_rec_xtipo
    ADD CONSTRAINT pk_sol_rec_xtipo PRIMARY KEY (srt_sol_rec_xtipo_pk);


--
-- TOC entry 2138 (class 2606 OID 35338781)
-- Dependencies: 1529 1529
-- Name: pk_solvencias_recaudos; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY solvencias_recaudos
    ADD CONSTRAINT pk_solvencias_recaudos PRIMARY KEY (svr_solvencias_recaudos_pk);


--
-- TOC entry 2141 (class 2606 OID 35338783)
-- Dependencies: 1531 1531
-- Name: pk_tipo_actividad; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_actividad
    ADD CONSTRAINT pk_tipo_actividad PRIMARY KEY (tpa_tipo_actividad_pk);


--
-- TOC entry 2144 (class 2606 OID 35338785)
-- Dependencies: 1532 1532
-- Name: pk_tipo_cooperativa; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_cooperativa
    ADD CONSTRAINT pk_tipo_cooperativa PRIMARY KEY (tpc_tipo_cooperativa_pk);


--
-- TOC entry 2146 (class 2606 OID 35338787)
-- Dependencies: 1533 1533
-- Name: pk_tipo_firma; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_firma
    ADD CONSTRAINT pk_tipo_firma PRIMARY KEY (tpf_tipo_firma_pk);


--
-- TOC entry 2135 (class 2606 OID 35338789)
-- Dependencies: 1528 1528 1528
-- Name: u_sol_rec_xtipo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sol_rec_xtipo
    ADD CONSTRAINT u_sol_rec_xtipo UNIQUE (ctp_contratistas_tipo_fk, svr_solvencias_recaudos_fk);


SET search_path = sistema, pg_catalog;

--
-- TOC entry 2148 (class 2606 OID 35338791)
-- Dependencies: 1581 1581
-- Name: pk_usuarios; Type: CONSTRAINT; Schema: sistema; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT pk_usuarios PRIMARY KEY (usr_usuarios_pk);


--
-- TOC entry 2150 (class 2606 OID 35338793)
-- Dependencies: 1582 1582
-- Name: pk_usuarios_menu; Type: CONSTRAINT; Schema: sistema; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuarios_menu
    ADD CONSTRAINT pk_usuarios_menu PRIMARY KEY (usm_usuarios_menu_pk);


--
-- TOC entry 2152 (class 2606 OID 35338795)
-- Dependencies: 1583 1583
-- Name: pk_usuarios_opciones; Type: CONSTRAINT; Schema: sistema; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuarios_opciones
    ADD CONSTRAINT pk_usuarios_opciones PRIMARY KEY (uso_usuarios_opciones_pk);


SET search_path = public, pg_catalog;

--
-- TOC entry 2056 (class 1259 OID 35338796)
-- Dependencies: 1500
-- Name: aob_nombre; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX aob_nombre ON areas_objeto USING btree (aob_areas_objeto_pk);


--
-- TOC entry 2102 (class 1259 OID 35338797)
-- Dependencies: 1517
-- Name: est_nombre; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX est_nombre ON estados USING btree (est_estados_pk);


--
-- TOC entry 2059 (class 1259 OID 35338798)
-- Dependencies: 1502
-- Name: ind_adt_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX ind_adt_pk ON auditoria USING btree (adt_auditoria_pk);


--
-- TOC entry 2071 (class 1259 OID 35338799)
-- Dependencies: 1506
-- Name: ind_ajr_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX ind_ajr_pk ON contratistas_acjdrl USING btree (ajr_contratistas_acjdrl_pk);


--
-- TOC entry 2062 (class 1259 OID 35338800)
-- Dependencies: 1503
-- Name: ind_ciu_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX ind_ciu_pk ON ciudades USING btree (ciu_ciudades_pk);


--
-- TOC entry 2082 (class 1259 OID 35338801)
-- Dependencies: 1510
-- Name: ind_clg_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX ind_clg_pk ON contratistas_legal USING btree (clg_contratistas_legal_pk);


--
-- TOC entry 2074 (class 1259 OID 35338802)
-- Dependencies: 1507
-- Name: ind_com_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX ind_com_pk ON contratistas_comisarios USING btree (com_contratistas_comisarios_pk);


--
-- TOC entry 2068 (class 1259 OID 35338803)
-- Dependencies: 1505
-- Name: ind_con_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX ind_con_pk ON contratistas USING btree (con_contratistas_pk);


--
-- TOC entry 2088 (class 1259 OID 35338804)
-- Dependencies: 1512
-- Name: ind_csu_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX ind_csu_pk ON contratistas_sucursales USING btree (csu_contratistas_sucursales_pk);


--
-- TOC entry 2091 (class 1259 OID 35338805)
-- Dependencies: 1513
-- Name: ind_ctp_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX ind_ctp_pk ON contratistas_tipo USING btree (ctp_contratistas_tipo_pk);


--
-- TOC entry 2096 (class 1259 OID 35338806)
-- Dependencies: 1515
-- Name: ind_eac_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX ind_eac_pk ON esp_are_xcontratista USING btree (eac_esp_are_xcontratista_pk);


--
-- TOC entry 2099 (class 1259 OID 35338807)
-- Dependencies: 1516
-- Name: ind_epo_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX ind_epo_pk ON especialidad_objeto USING btree (epo_especialidad_objeto_pk);


--
-- TOC entry 2079 (class 1259 OID 35338808)
-- Dependencies: 1509
-- Name: ind_ett_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX ind_ett_pk ON contratistas_estatus USING btree (ett_contratistas_estatus_pk);


--
-- TOC entry 2105 (class 1259 OID 35338809)
-- Dependencies: 1518
-- Name: ind_ett_pk1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX ind_ett_pk1 ON estatus USING btree (ett_estatus_pk);


--
-- TOC entry 2065 (class 1259 OID 35338810)
-- Dependencies: 1504
-- Name: ind_eva_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX ind_eva_pk ON contratista_evaluacion USING btree (eva_contratista_evaluacion_pk);


--
-- TOC entry 2110 (class 1259 OID 35338811)
-- Dependencies: 1520
-- Name: ind_mun_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX ind_mun_pk ON municipio USING btree (mun_municipio_pk);


--
-- TOC entry 2113 (class 1259 OID 35338812)
-- Dependencies: 1521
-- Name: ind_nfs_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX ind_nfs_pk ON nivel_financiero_snc USING btree (nfs_nivel_financiero_snc_pk);


--
-- TOC entry 2120 (class 1259 OID 35338813)
-- Dependencies: 1524
-- Name: ind_ntt_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX ind_ntt_pk ON numeros_telefonicos_tipo USING btree (ntt_numeros_telefonicos_tipo_pk);


--
-- TOC entry 2123 (class 1259 OID 35338814)
-- Dependencies: 1525
-- Name: ind_org_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX ind_org_pk ON organismos USING btree (org_organismos_pk);


--
-- TOC entry 2142 (class 1259 OID 35338815)
-- Dependencies: 1532
-- Name: ind_pk_cooperativa; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX ind_pk_cooperativa ON tipo_cooperativa USING btree (tpc_tipo_cooperativa_pk);


--
-- TOC entry 2126 (class 1259 OID 35338816)
-- Dependencies: 1526
-- Name: ind_pnt_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX ind_pnt_pk ON personas_naturales USING btree (pnt_personas_naturales_pk);


--
-- TOC entry 2085 (class 1259 OID 35338817)
-- Dependencies: 1511
-- Name: ind_sol_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX ind_sol_pk ON contratistas_solvencias USING btree (sol_contratistas_solvencias_pk);


--
-- TOC entry 2131 (class 1259 OID 35338818)
-- Dependencies: 1528
-- Name: ind_srt_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX ind_srt_pk ON sol_rec_xtipo USING btree (srt_sol_rec_xtipo_pk);


--
-- TOC entry 2136 (class 1259 OID 35338819)
-- Dependencies: 1529
-- Name: ind_svr_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX ind_svr_pk ON solvencias_recaudos USING btree (svr_solvencias_recaudos_pk);


--
-- TOC entry 2139 (class 1259 OID 35338820)
-- Dependencies: 1531
-- Name: ind_tpa_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX ind_tpa_pk ON tipo_actividad USING btree (tpa_tipo_actividad_pk);


--
-- TOC entry 2170 (class 2606 OID 35338821)
-- Dependencies: 2069 1505 1510
-- Name: contratistas_legal_con_contratistas_pk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratistas_legal
    ADD CONSTRAINT contratistas_legal_con_contratistas_pk FOREIGN KEY (con_contratistas_fk) REFERENCES contratistas(con_contratistas_pk) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2171 (class 2606 OID 35338826)
-- Dependencies: 1514 1510 2094
-- Name: contratistas_legal_denominacion_comercial_pk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratistas_legal
    ADD CONSTRAINT contratistas_legal_denominacion_comercial_pk FOREIGN KEY (dec_denominacion_comercial_fk) REFERENCES denominacion_comercial(dec_denominacion_comercial_pk) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2162 (class 2606 OID 35338831)
-- Dependencies: 1505 2069 1506
-- Name: fk_contrati_ref_ajr_c_contrati; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratistas_acjdrl
    ADD CONSTRAINT fk_contrati_ref_ajr_c_contrati FOREIGN KEY (con_contratistas_fk) REFERENCES contratistas(con_contratistas_pk) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2163 (class 2606 OID 35338836)
-- Dependencies: 1526 1506 2127
-- Name: fk_contrati_ref_ajr_p_personas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratistas_acjdrl
    ADD CONSTRAINT fk_contrati_ref_ajr_p_personas FOREIGN KEY (pnt_personas_naturales_fk) REFERENCES personas_naturales(pnt_personas_naturales_pk) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2164 (class 2606 OID 35338841)
-- Dependencies: 1507 2069 1505
-- Name: fk_contrati_ref_com_c_contrati; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratistas_comisarios
    ADD CONSTRAINT fk_contrati_ref_com_c_contrati FOREIGN KEY (con_contratistas_fk) REFERENCES contratistas(con_contratistas_pk) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2165 (class 2606 OID 35338846)
-- Dependencies: 1526 1507 2127
-- Name: fk_contrati_ref_com_p_personas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratistas_comisarios
    ADD CONSTRAINT fk_contrati_ref_com_p_personas FOREIGN KEY (pnt_personas_naturales_fk) REFERENCES personas_naturales(pnt_personas_naturales_pk) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2155 (class 2606 OID 35338851)
-- Dependencies: 1513 1505 2092
-- Name: fk_contrati_ref_con_c_contrati; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratistas
    ADD CONSTRAINT fk_contrati_ref_con_c_contrati FOREIGN KEY (ctp_contratistas_tipo_fk) REFERENCES contratistas_tipo(ctp_contratistas_tipo_pk) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2156 (class 2606 OID 35338856)
-- Dependencies: 2080 1505 1509
-- Name: fk_contrati_ref_con_e_contrati; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratistas
    ADD CONSTRAINT fk_contrati_ref_con_e_contrati FOREIGN KEY (ett_contratistas_estatus_fk) REFERENCES contratistas_estatus(ett_contratistas_estatus_pk) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2157 (class 2606 OID 35338861)
-- Dependencies: 2108 1505 1519
-- Name: fk_contrati_ref_con_indice_capital_social; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratistas
    ADD CONSTRAINT fk_contrati_ref_con_indice_capital_social FOREIGN KEY (ics_indice_capital_social_fk) REFERENCES indice_capital_social(ics_indice_capital_social_pk) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2158 (class 2606 OID 35338866)
-- Dependencies: 2063 1505 1503
-- Name: fk_contrati_ref_con_m_ciudades; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratistas
    ADD CONSTRAINT fk_contrati_ref_con_m_ciudades FOREIGN KEY (ciu_ciudades_fk) REFERENCES ciudades(ciu_ciudades_pk) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2159 (class 2606 OID 35338871)
-- Dependencies: 1521 2114 1505
-- Name: fk_contrati_ref_con_n_nivel_fi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratistas
    ADD CONSTRAINT fk_contrati_ref_con_n_nivel_fi FOREIGN KEY (nfs_nivel_financiero_snc_fk) REFERENCES nivel_financiero_snc(nfs_nivel_financiero_snc_pk) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2160 (class 2606 OID 35338876)
-- Dependencies: 1505 2143 1532
-- Name: fk_contrati_ref_con_t_tipo_coo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratistas
    ADD CONSTRAINT fk_contrati_ref_con_t_tipo_coo FOREIGN KEY (tpc_tipo_cooperativa_fk) REFERENCES tipo_cooperativa(tpc_tipo_cooperativa_pk) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2161 (class 2606 OID 35338881)
-- Dependencies: 1505 1533 2145
-- Name: fk_contrati_ref_con_tipo_firma; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratistas
    ADD CONSTRAINT fk_contrati_ref_con_tipo_firma FOREIGN KEY (tpf_tipo_firma_fk) REFERENCES tipo_firma(tpf_tipo_firma_pk) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2173 (class 2606 OID 35338886)
-- Dependencies: 2069 1505 1512
-- Name: fk_contrati_ref_csu_c_contrati; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratistas_sucursales
    ADD CONSTRAINT fk_contrati_ref_csu_c_contrati FOREIGN KEY (con_contratistas_fk) REFERENCES contratistas(con_contratistas_pk) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2166 (class 2606 OID 35338891)
-- Dependencies: 1505 1508 2069
-- Name: fk_contrati_ref_ctt_c_contrati; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratistas_contratos
    ADD CONSTRAINT fk_contrati_ref_ctt_c_contrati FOREIGN KEY (con_contratistas_fk) REFERENCES contratistas(con_contratistas_pk) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2167 (class 2606 OID 35338896)
-- Dependencies: 1518 1508 2106
-- Name: fk_contrati_ref_ctt_e_estatus; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratistas_contratos
    ADD CONSTRAINT fk_contrati_ref_ctt_e_estatus FOREIGN KEY (ett_estatus_fk) REFERENCES estatus(ett_estatus_pk) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2168 (class 2606 OID 35338901)
-- Dependencies: 1525 2124 1508
-- Name: fk_contrati_ref_ctt_o_organism; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratistas_contratos
    ADD CONSTRAINT fk_contrati_ref_ctt_o_organism FOREIGN KEY (org_organismos_fk) REFERENCES organismos(org_organismos_pk) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2169 (class 2606 OID 35338906)
-- Dependencies: 1508 1527 2129
-- Name: fk_contrati_ref_ctt_rendimientos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratistas_contratos
    ADD CONSTRAINT fk_contrati_ref_ctt_rendimientos FOREIGN KEY (ren_rendimiento_fk) REFERENCES rendimientos(ren_rendimientos_pk) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2153 (class 2606 OID 35338911)
-- Dependencies: 1505 1504 2069
-- Name: fk_contrati_ref_eva_c_contrati; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratista_evaluacion
    ADD CONSTRAINT fk_contrati_ref_eva_c_contrati FOREIGN KEY (con_contratistas_fk) REFERENCES contratistas(con_contratistas_pk) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2154 (class 2606 OID 35338916)
-- Dependencies: 1504 1529 2137
-- Name: fk_contrati_ref_eva_s_solvenci; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratista_evaluacion
    ADD CONSTRAINT fk_contrati_ref_eva_s_solvenci FOREIGN KEY (svr_solvencias_recaudos_fk) REFERENCES solvencias_recaudos(svr_solvencias_recaudos_pk) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2172 (class 2606 OID 35338921)
-- Dependencies: 1511 2069 1505
-- Name: fk_contrati_ref_sol_c_contrati; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratistas_solvencias
    ADD CONSTRAINT fk_contrati_ref_sol_c_contrati FOREIGN KEY (con_contratistas_fk) REFERENCES contratistas(con_contratistas_pk) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2174 (class 2606 OID 35338926)
-- Dependencies: 1515 2069 1505
-- Name: fk_esp_are__ref_eac_c_contrati; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY esp_are_xcontratista
    ADD CONSTRAINT fk_esp_are__ref_eac_c_contrati FOREIGN KEY (con_contratistas_fk) REFERENCES contratistas(con_contratistas_pk) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2175 (class 2606 OID 35338931)
-- Dependencies: 1515 1516 2100
-- Name: fk_esp_are__ref_eac_e_especial; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY esp_are_xcontratista
    ADD CONSTRAINT fk_esp_are__ref_eac_e_especial FOREIGN KEY (epo_especialidad_objeto_fk) REFERENCES especialidad_objeto(epo_especialidad_objeto_pk) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2176 (class 2606 OID 35338936)
-- Dependencies: 2057 1516 1500
-- Name: fk_especial_ref_epo_a_areas_ob; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY especialidad_objeto
    ADD CONSTRAINT fk_especial_ref_epo_a_areas_ob FOREIGN KEY (aob_areas_objeto_fk) REFERENCES areas_objeto(aob_areas_objeto_pk) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2177 (class 2606 OID 35338941)
-- Dependencies: 1517 1520 2103
-- Name: fk_municipi_ref_mun_e_estados; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY municipio
    ADD CONSTRAINT fk_municipi_ref_mun_e_estados FOREIGN KEY (est_estados_fk) REFERENCES estados(est_estados_pk) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2180 (class 2606 OID 35338946)
-- Dependencies: 1512 1523 2089
-- Name: fk_numeros__ref_contratita; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY numeros_telefonicos_sucursales
    ADD CONSTRAINT fk_numeros__ref_contratita FOREIGN KEY (csu_contratistas_sucursales_fk) REFERENCES contratistas_sucursales(csu_contratistas_sucursales_pk) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2178 (class 2606 OID 35338951)
-- Dependencies: 1524 1522 2121
-- Name: fk_numeros__ref_tel_n_numeros_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY numeros_telefonicos
    ADD CONSTRAINT fk_numeros__ref_tel_n_numeros_ FOREIGN KEY (ntt_numeros_telefonicos_tipo_fk) REFERENCES numeros_telefonicos_tipo(ntt_numeros_telefonicos_tipo_pk) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2181 (class 2606 OID 35338956)
-- Dependencies: 2121 1523 1524
-- Name: fk_numeros__ref_telnumeros_suc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY numeros_telefonicos_sucursales
    ADD CONSTRAINT fk_numeros__ref_telnumeros_suc FOREIGN KEY (ntt_numeros_telefonicos_tipo_fk) REFERENCES numeros_telefonicos_tipo(ntt_numeros_telefonicos_tipo_pk) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2182 (class 2606 OID 35338961)
-- Dependencies: 2092 1513 1528
-- Name: fk_sol_rec__ref_srt_c_contrati; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sol_rec_xtipo
    ADD CONSTRAINT fk_sol_rec__ref_srt_c_contrati FOREIGN KEY (ctp_contratistas_tipo_fk) REFERENCES contratistas_tipo(ctp_contratistas_tipo_pk) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2183 (class 2606 OID 35338966)
-- Dependencies: 1528 2137 1529
-- Name: fk_sol_rec__ref_srt_s_solvenci; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sol_rec_xtipo
    ADD CONSTRAINT fk_sol_rec__ref_srt_s_solvenci FOREIGN KEY (svr_solvencias_recaudos_fk) REFERENCES solvencias_recaudos(svr_solvencias_recaudos_pk) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2179 (class 2606 OID 35338971)
-- Dependencies: 2069 1505 1522
-- Name: pk_numeros_ref_contratistas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY numeros_telefonicos
    ADD CONSTRAINT pk_numeros_ref_contratistas FOREIGN KEY (con_contratistas_fk) REFERENCES contratistas(con_contratistas_pk) ON UPDATE RESTRICT ON DELETE RESTRICT;


SET search_path = sistema, pg_catalog;

--
-- TOC entry 2184 (class 2606 OID 35338976)
-- Dependencies: 2149 1583 1582
-- Name: fk_usuarios_menu_pk; Type: FK CONSTRAINT; Schema: sistema; Owner: postgres
--

ALTER TABLE ONLY usuarios_opciones
    ADD CONSTRAINT fk_usuarios_menu_pk FOREIGN KEY (usm_usuarios_fk) REFERENCES usuarios_menu(usm_usuarios_menu_pk);


--
-- TOC entry 2185 (class 2606 OID 35338981)
-- Dependencies: 1583 2147 1581
-- Name: fk_usuarios_pk; Type: FK CONSTRAINT; Schema: sistema; Owner: postgres
--

ALTER TABLE ONLY usuarios_opciones
    ADD CONSTRAINT fk_usuarios_pk FOREIGN KEY (usr_usuarios_fk) REFERENCES usuarios(usr_usuarios_pk);


--
-- TOC entry 2226 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 2227 (class 0 OID 0)
-- Dependencies: 6
-- Name: sistema; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA sistema FROM PUBLIC;
REVOKE ALL ON SCHEMA sistema FROM postgres;
GRANT ALL ON SCHEMA sistema TO postgres;
GRANT ALL ON SCHEMA sistema TO PUBLIC;


SET search_path = public, pg_catalog;

--
-- TOC entry 2228 (class 0 OID 0)
-- Dependencies: 25
-- Name: act_contratista_evaluacion(integer, integer, date); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION act_contratista_evaluacion(integer, integer, date) FROM PUBLIC;
REVOKE ALL ON FUNCTION act_contratista_evaluacion(integer, integer, date) FROM postgres;
GRANT ALL ON FUNCTION act_contratista_evaluacion(integer, integer, date) TO postgres;
GRANT ALL ON FUNCTION act_contratista_evaluacion(integer, integer, date) TO PUBLIC;


--
-- TOC entry 2229 (class 0 OID 0)
-- Dependencies: 26
-- Name: del_areas_objeto(bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION del_areas_objeto(bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION del_areas_objeto(bigint) FROM postgres;
GRANT ALL ON FUNCTION del_areas_objeto(bigint) TO postgres;
GRANT ALL ON FUNCTION del_areas_objeto(bigint) TO PUBLIC;


--
-- TOC entry 2230 (class 0 OID 0)
-- Dependencies: 27
-- Name: del_ciudades(bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION del_ciudades(bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION del_ciudades(bigint) FROM postgres;
GRANT ALL ON FUNCTION del_ciudades(bigint) TO postgres;
GRANT ALL ON FUNCTION del_ciudades(bigint) TO PUBLIC;


--
-- TOC entry 2231 (class 0 OID 0)
-- Dependencies: 28
-- Name: del_contratista_evaluacion(bigint, date); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION del_contratista_evaluacion(bigint, date) FROM PUBLIC;
REVOKE ALL ON FUNCTION del_contratista_evaluacion(bigint, date) FROM postgres;
GRANT ALL ON FUNCTION del_contratista_evaluacion(bigint, date) TO postgres;
GRANT ALL ON FUNCTION del_contratista_evaluacion(bigint, date) TO PUBLIC;


--
-- TOC entry 2232 (class 0 OID 0)
-- Dependencies: 29
-- Name: del_contratistas_acjdrl(bigint, integer); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION del_contratistas_acjdrl(bigint, integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION del_contratistas_acjdrl(bigint, integer) FROM postgres;
GRANT ALL ON FUNCTION del_contratistas_acjdrl(bigint, integer) TO postgres;
GRANT ALL ON FUNCTION del_contratistas_acjdrl(bigint, integer) TO PUBLIC;


--
-- TOC entry 2233 (class 0 OID 0)
-- Dependencies: 30
-- Name: del_contratistas_comisarios(bigint, integer); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION del_contratistas_comisarios(bigint, integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION del_contratistas_comisarios(bigint, integer) FROM postgres;
GRANT ALL ON FUNCTION del_contratistas_comisarios(bigint, integer) TO postgres;
GRANT ALL ON FUNCTION del_contratistas_comisarios(bigint, integer) TO PUBLIC;


--
-- TOC entry 2234 (class 0 OID 0)
-- Dependencies: 31
-- Name: del_contratistas_contratos(bigint, integer); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION del_contratistas_contratos(bigint, integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION del_contratistas_contratos(bigint, integer) FROM postgres;
GRANT ALL ON FUNCTION del_contratistas_contratos(bigint, integer) TO postgres;
GRANT ALL ON FUNCTION del_contratistas_contratos(bigint, integer) TO PUBLIC;


--
-- TOC entry 2235 (class 0 OID 0)
-- Dependencies: 32
-- Name: del_contratistas_estatus(); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION del_contratistas_estatus() FROM PUBLIC;
REVOKE ALL ON FUNCTION del_contratistas_estatus() FROM postgres;
GRANT ALL ON FUNCTION del_contratistas_estatus() TO postgres;
GRANT ALL ON FUNCTION del_contratistas_estatus() TO PUBLIC;


--
-- TOC entry 2236 (class 0 OID 0)
-- Dependencies: 33
-- Name: del_contratistas_legal(integer, integer); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION del_contratistas_legal(integer, integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION del_contratistas_legal(integer, integer) FROM postgres;
GRANT ALL ON FUNCTION del_contratistas_legal(integer, integer) TO postgres;
GRANT ALL ON FUNCTION del_contratistas_legal(integer, integer) TO PUBLIC;


--
-- TOC entry 2237 (class 0 OID 0)
-- Dependencies: 34
-- Name: del_contratistas_tipo(bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION del_contratistas_tipo(bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION del_contratistas_tipo(bigint) FROM postgres;
GRANT ALL ON FUNCTION del_contratistas_tipo(bigint) TO postgres;
GRANT ALL ON FUNCTION del_contratistas_tipo(bigint) TO PUBLIC;


--
-- TOC entry 2238 (class 0 OID 0)
-- Dependencies: 35
-- Name: del_denominacion_comercial(bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION del_denominacion_comercial(bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION del_denominacion_comercial(bigint) FROM postgres;
GRANT ALL ON FUNCTION del_denominacion_comercial(bigint) TO postgres;
GRANT ALL ON FUNCTION del_denominacion_comercial(bigint) TO PUBLIC;


--
-- TOC entry 2239 (class 0 OID 0)
-- Dependencies: 36
-- Name: del_esp_are_xcontratista(bigint, bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION del_esp_are_xcontratista(bigint, bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION del_esp_are_xcontratista(bigint, bigint) FROM postgres;
GRANT ALL ON FUNCTION del_esp_are_xcontratista(bigint, bigint) TO postgres;
GRANT ALL ON FUNCTION del_esp_are_xcontratista(bigint, bigint) TO PUBLIC;


--
-- TOC entry 2240 (class 0 OID 0)
-- Dependencies: 37
-- Name: del_esp_are_xcontratista(bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION del_esp_are_xcontratista(bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION del_esp_are_xcontratista(bigint) FROM postgres;
GRANT ALL ON FUNCTION del_esp_are_xcontratista(bigint) TO postgres;
GRANT ALL ON FUNCTION del_esp_are_xcontratista(bigint) TO PUBLIC;


--
-- TOC entry 2241 (class 0 OID 0)
-- Dependencies: 38
-- Name: del_especialidad_objeto(bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION del_especialidad_objeto(bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION del_especialidad_objeto(bigint) FROM postgres;
GRANT ALL ON FUNCTION del_especialidad_objeto(bigint) TO postgres;
GRANT ALL ON FUNCTION del_especialidad_objeto(bigint) TO PUBLIC;


--
-- TOC entry 2242 (class 0 OID 0)
-- Dependencies: 39
-- Name: del_estados(bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION del_estados(valor_pk bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION del_estados(valor_pk bigint) FROM postgres;
GRANT ALL ON FUNCTION del_estados(valor_pk bigint) TO postgres;
GRANT ALL ON FUNCTION del_estados(valor_pk bigint) TO PUBLIC;


--
-- TOC entry 2243 (class 0 OID 0)
-- Dependencies: 40
-- Name: del_estatus(bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION del_estatus(valor_pk bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION del_estatus(valor_pk bigint) FROM postgres;
GRANT ALL ON FUNCTION del_estatus(valor_pk bigint) TO postgres;
GRANT ALL ON FUNCTION del_estatus(valor_pk bigint) TO PUBLIC;


--
-- TOC entry 2244 (class 0 OID 0)
-- Dependencies: 41
-- Name: del_municipio(bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION del_municipio(valor_pk bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION del_municipio(valor_pk bigint) FROM postgres;
GRANT ALL ON FUNCTION del_municipio(valor_pk bigint) TO postgres;
GRANT ALL ON FUNCTION del_municipio(valor_pk bigint) TO PUBLIC;


--
-- TOC entry 2245 (class 0 OID 0)
-- Dependencies: 42
-- Name: del_nivel_financiero_snc(bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION del_nivel_financiero_snc(bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION del_nivel_financiero_snc(bigint) FROM postgres;
GRANT ALL ON FUNCTION del_nivel_financiero_snc(bigint) TO postgres;
GRANT ALL ON FUNCTION del_nivel_financiero_snc(bigint) TO PUBLIC;


--
-- TOC entry 2246 (class 0 OID 0)
-- Dependencies: 43
-- Name: del_numeros_telefonicos(integer); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION del_numeros_telefonicos(integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION del_numeros_telefonicos(integer) FROM postgres;
GRANT ALL ON FUNCTION del_numeros_telefonicos(integer) TO postgres;
GRANT ALL ON FUNCTION del_numeros_telefonicos(integer) TO PUBLIC;


--
-- TOC entry 2247 (class 0 OID 0)
-- Dependencies: 44
-- Name: del_numeros_telefonicos_sucursales(integer); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION del_numeros_telefonicos_sucursales(integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION del_numeros_telefonicos_sucursales(integer) FROM postgres;
GRANT ALL ON FUNCTION del_numeros_telefonicos_sucursales(integer) TO postgres;
GRANT ALL ON FUNCTION del_numeros_telefonicos_sucursales(integer) TO PUBLIC;


--
-- TOC entry 2248 (class 0 OID 0)
-- Dependencies: 45
-- Name: del_numeros_telefonicos_tipo(bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION del_numeros_telefonicos_tipo(bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION del_numeros_telefonicos_tipo(bigint) FROM postgres;
GRANT ALL ON FUNCTION del_numeros_telefonicos_tipo(bigint) TO postgres;
GRANT ALL ON FUNCTION del_numeros_telefonicos_tipo(bigint) TO PUBLIC;


--
-- TOC entry 2249 (class 0 OID 0)
-- Dependencies: 46
-- Name: del_organismos(bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION del_organismos(bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION del_organismos(bigint) FROM postgres;
GRANT ALL ON FUNCTION del_organismos(bigint) TO postgres;
GRANT ALL ON FUNCTION del_organismos(bigint) TO PUBLIC;


--
-- TOC entry 2250 (class 0 OID 0)
-- Dependencies: 47
-- Name: del_rendimientos(bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION del_rendimientos(bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION del_rendimientos(bigint) FROM postgres;
GRANT ALL ON FUNCTION del_rendimientos(bigint) TO postgres;
GRANT ALL ON FUNCTION del_rendimientos(bigint) TO PUBLIC;


--
-- TOC entry 2251 (class 0 OID 0)
-- Dependencies: 48
-- Name: del_sol_rec_xtipo(bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION del_sol_rec_xtipo(bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION del_sol_rec_xtipo(bigint) FROM postgres;
GRANT ALL ON FUNCTION del_sol_rec_xtipo(bigint) TO postgres;
GRANT ALL ON FUNCTION del_sol_rec_xtipo(bigint) TO PUBLIC;


--
-- TOC entry 2252 (class 0 OID 0)
-- Dependencies: 49
-- Name: del_solvencias_recaudos(bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION del_solvencias_recaudos(bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION del_solvencias_recaudos(bigint) FROM postgres;
GRANT ALL ON FUNCTION del_solvencias_recaudos(bigint) TO postgres;
GRANT ALL ON FUNCTION del_solvencias_recaudos(bigint) TO PUBLIC;


--
-- TOC entry 2253 (class 0 OID 0)
-- Dependencies: 50
-- Name: del_tipo_actividad(bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION del_tipo_actividad(bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION del_tipo_actividad(bigint) FROM postgres;
GRANT ALL ON FUNCTION del_tipo_actividad(bigint) TO postgres;
GRANT ALL ON FUNCTION del_tipo_actividad(bigint) TO PUBLIC;


--
-- TOC entry 2254 (class 0 OID 0)
-- Dependencies: 51
-- Name: del_tipo_cooperativa(bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION del_tipo_cooperativa(bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION del_tipo_cooperativa(bigint) FROM postgres;
GRANT ALL ON FUNCTION del_tipo_cooperativa(bigint) TO postgres;
GRANT ALL ON FUNCTION del_tipo_cooperativa(bigint) TO PUBLIC;


--
-- TOC entry 2255 (class 0 OID 0)
-- Dependencies: 52
-- Name: del_tipo_firma(bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION del_tipo_firma(bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION del_tipo_firma(bigint) FROM postgres;
GRANT ALL ON FUNCTION del_tipo_firma(bigint) TO postgres;
GRANT ALL ON FUNCTION del_tipo_firma(bigint) TO PUBLIC;


--
-- TOC entry 2256 (class 0 OID 0)
-- Dependencies: 53
-- Name: ett_contratistas(integer, integer); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION ett_contratistas(integer, integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION ett_contratistas(integer, integer) FROM postgres;
GRANT ALL ON FUNCTION ett_contratistas(integer, integer) TO postgres;
GRANT ALL ON FUNCTION ett_contratistas(integer, integer) TO PUBLIC;


--
-- TOC entry 2257 (class 0 OID 0)
-- Dependencies: 54
-- Name: gen_codigo_siez(date); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION gen_codigo_siez(date) FROM PUBLIC;
REVOKE ALL ON FUNCTION gen_codigo_siez(date) FROM postgres;
GRANT ALL ON FUNCTION gen_codigo_siez(date) TO postgres;
GRANT ALL ON FUNCTION gen_codigo_siez(date) TO PUBLIC;


--
-- TOC entry 2258 (class 0 OID 0)
-- Dependencies: 55
-- Name: ins_areas_objeto(character varying, character varying, boolean); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION ins_areas_objeto(character varying, character varying, boolean) FROM PUBLIC;
REVOKE ALL ON FUNCTION ins_areas_objeto(character varying, character varying, boolean) FROM postgres;
GRANT ALL ON FUNCTION ins_areas_objeto(character varying, character varying, boolean) TO postgres;
GRANT ALL ON FUNCTION ins_areas_objeto(character varying, character varying, boolean) TO PUBLIC;


--
-- TOC entry 2259 (class 0 OID 0)
-- Dependencies: 56
-- Name: ins_ciudades(bigint, character varying, character varying, boolean); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION ins_ciudades(bigint, character varying, character varying, boolean) FROM PUBLIC;
REVOKE ALL ON FUNCTION ins_ciudades(bigint, character varying, character varying, boolean) FROM postgres;
GRANT ALL ON FUNCTION ins_ciudades(bigint, character varying, character varying, boolean) TO postgres;
GRANT ALL ON FUNCTION ins_ciudades(bigint, character varying, character varying, boolean) TO PUBLIC;


--
-- TOC entry 2260 (class 0 OID 0)
-- Dependencies: 57
-- Name: ins_contratista_evaluacion(integer, integer, date, character varying, date, character varying); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION ins_contratista_evaluacion(integer, integer, date, character varying, date, character varying) FROM PUBLIC;
REVOKE ALL ON FUNCTION ins_contratista_evaluacion(integer, integer, date, character varying, date, character varying) FROM postgres;
GRANT ALL ON FUNCTION ins_contratista_evaluacion(integer, integer, date, character varying, date, character varying) TO postgres;
GRANT ALL ON FUNCTION ins_contratista_evaluacion(integer, integer, date, character varying, date, character varying) TO PUBLIC;


--
-- TOC entry 2261 (class 0 OID 0)
-- Dependencies: 58
-- Name: ins_contratistas(integer, integer, integer, integer, integer, character varying, character varying, character varying, character varying, date, date, character varying, character varying, character varying, integer, character varying, numeric, character varying, integer, character varying, integer, integer, date, character varying); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION ins_contratistas(integer, integer, integer, integer, integer, character varying, character varying, character varying, character varying, date, date, character varying, character varying, character varying, integer, character varying, numeric, character varying, integer, character varying, integer, integer, date, character varying) FROM PUBLIC;
REVOKE ALL ON FUNCTION ins_contratistas(integer, integer, integer, integer, integer, character varying, character varying, character varying, character varying, date, date, character varying, character varying, character varying, integer, character varying, numeric, character varying, integer, character varying, integer, integer, date, character varying) FROM postgres;
GRANT ALL ON FUNCTION ins_contratistas(integer, integer, integer, integer, integer, character varying, character varying, character varying, character varying, date, date, character varying, character varying, character varying, integer, character varying, numeric, character varying, integer, character varying, integer, integer, date, character varying) TO postgres;
GRANT ALL ON FUNCTION ins_contratistas(integer, integer, integer, integer, integer, character varying, character varying, character varying, character varying, date, date, character varying, character varying, character varying, integer, character varying, numeric, character varying, integer, character varying, integer, integer, date, character varying) TO PUBLIC;


--
-- TOC entry 2262 (class 0 OID 0)
-- Dependencies: 59
-- Name: ins_contratistas_acjdrl(integer, integer, character varying, boolean, boolean, boolean, numeric); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION ins_contratistas_acjdrl(integer, integer, character varying, boolean, boolean, boolean, numeric) FROM PUBLIC;
REVOKE ALL ON FUNCTION ins_contratistas_acjdrl(integer, integer, character varying, boolean, boolean, boolean, numeric) FROM postgres;
GRANT ALL ON FUNCTION ins_contratistas_acjdrl(integer, integer, character varying, boolean, boolean, boolean, numeric) TO postgres;
GRANT ALL ON FUNCTION ins_contratistas_acjdrl(integer, integer, character varying, boolean, boolean, boolean, numeric) TO PUBLIC;


--
-- TOC entry 2263 (class 0 OID 0)
-- Dependencies: 60
-- Name: ins_contratistas_comisarios(integer, integer, character varying, character varying, date); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION ins_contratistas_comisarios(integer, integer, character varying, character varying, date) FROM PUBLIC;
REVOKE ALL ON FUNCTION ins_contratistas_comisarios(integer, integer, character varying, character varying, date) FROM postgres;
GRANT ALL ON FUNCTION ins_contratistas_comisarios(integer, integer, character varying, character varying, date) TO postgres;
GRANT ALL ON FUNCTION ins_contratistas_comisarios(integer, integer, character varying, character varying, date) TO PUBLIC;


--
-- TOC entry 2264 (class 0 OID 0)
-- Dependencies: 61
-- Name: ins_contratistas_contratos(integer, integer, integer, integer, character varying, character varying, date, character varying, bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION ins_contratistas_contratos(integer, integer, integer, integer, character varying, character varying, date, character varying, bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION ins_contratistas_contratos(integer, integer, integer, integer, character varying, character varying, date, character varying, bigint) FROM postgres;
GRANT ALL ON FUNCTION ins_contratistas_contratos(integer, integer, integer, integer, character varying, character varying, date, character varying, bigint) TO postgres;
GRANT ALL ON FUNCTION ins_contratistas_contratos(integer, integer, integer, integer, character varying, character varying, date, character varying, bigint) TO PUBLIC;


--
-- TOC entry 2265 (class 0 OID 0)
-- Dependencies: 62
-- Name: ins_contratistas_estatus(character varying, boolean); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION ins_contratistas_estatus(character varying, boolean) FROM PUBLIC;
REVOKE ALL ON FUNCTION ins_contratistas_estatus(character varying, boolean) FROM postgres;
GRANT ALL ON FUNCTION ins_contratistas_estatus(character varying, boolean) TO postgres;
GRANT ALL ON FUNCTION ins_contratistas_estatus(character varying, boolean) TO PUBLIC;


--
-- TOC entry 2266 (class 0 OID 0)
-- Dependencies: 113
-- Name: ins_contratistas_legal(integer, character varying, integer, character varying, date, character varying, character varying, character varying, character varying, character varying, date, date, numeric, numeric, boolean, character varying, character varying); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION ins_contratistas_legal(integer, character varying, integer, character varying, date, character varying, character varying, character varying, character varying, character varying, date, date, numeric, numeric, boolean, character varying, character varying) FROM PUBLIC;
REVOKE ALL ON FUNCTION ins_contratistas_legal(integer, character varying, integer, character varying, date, character varying, character varying, character varying, character varying, character varying, date, date, numeric, numeric, boolean, character varying, character varying) FROM postgres;
GRANT ALL ON FUNCTION ins_contratistas_legal(integer, character varying, integer, character varying, date, character varying, character varying, character varying, character varying, character varying, date, date, numeric, numeric, boolean, character varying, character varying) TO postgres;
GRANT ALL ON FUNCTION ins_contratistas_legal(integer, character varying, integer, character varying, date, character varying, character varying, character varying, character varying, character varying, date, date, numeric, numeric, boolean, character varying, character varying) TO PUBLIC;


--
-- TOC entry 2267 (class 0 OID 0)
-- Dependencies: 63
-- Name: ins_contratistas_solvencias(integer, date, date, character varying, boolean); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION ins_contratistas_solvencias(integer, date, date, character varying, boolean) FROM PUBLIC;
REVOKE ALL ON FUNCTION ins_contratistas_solvencias(integer, date, date, character varying, boolean) FROM postgres;
GRANT ALL ON FUNCTION ins_contratistas_solvencias(integer, date, date, character varying, boolean) TO postgres;
GRANT ALL ON FUNCTION ins_contratistas_solvencias(integer, date, date, character varying, boolean) TO PUBLIC;


--
-- TOC entry 2268 (class 0 OID 0)
-- Dependencies: 64
-- Name: ins_contratistas_sucursales(integer, character varying, character varying, boolean); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION ins_contratistas_sucursales(integer, character varying, character varying, boolean) FROM PUBLIC;
REVOKE ALL ON FUNCTION ins_contratistas_sucursales(integer, character varying, character varying, boolean) FROM postgres;
GRANT ALL ON FUNCTION ins_contratistas_sucursales(integer, character varying, character varying, boolean) TO postgres;
GRANT ALL ON FUNCTION ins_contratistas_sucursales(integer, character varying, character varying, boolean) TO PUBLIC;


--
-- TOC entry 2269 (class 0 OID 0)
-- Dependencies: 65
-- Name: ins_contratistas_tipo(character varying, boolean); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION ins_contratistas_tipo(character varying, boolean) FROM PUBLIC;
REVOKE ALL ON FUNCTION ins_contratistas_tipo(character varying, boolean) FROM postgres;
GRANT ALL ON FUNCTION ins_contratistas_tipo(character varying, boolean) TO postgres;
GRANT ALL ON FUNCTION ins_contratistas_tipo(character varying, boolean) TO PUBLIC;


--
-- TOC entry 2270 (class 0 OID 0)
-- Dependencies: 66
-- Name: ins_denominacion_comercial(character varying, character varying, boolean); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION ins_denominacion_comercial(character varying, character varying, boolean) FROM PUBLIC;
REVOKE ALL ON FUNCTION ins_denominacion_comercial(character varying, character varying, boolean) FROM postgres;
GRANT ALL ON FUNCTION ins_denominacion_comercial(character varying, character varying, boolean) TO postgres;
GRANT ALL ON FUNCTION ins_denominacion_comercial(character varying, character varying, boolean) TO PUBLIC;


--
-- TOC entry 2271 (class 0 OID 0)
-- Dependencies: 67
-- Name: ins_esp_are_xcontratista(integer, integer, boolean); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION ins_esp_are_xcontratista(integer, integer, boolean) FROM PUBLIC;
REVOKE ALL ON FUNCTION ins_esp_are_xcontratista(integer, integer, boolean) FROM postgres;
GRANT ALL ON FUNCTION ins_esp_are_xcontratista(integer, integer, boolean) TO postgres;
GRANT ALL ON FUNCTION ins_esp_are_xcontratista(integer, integer, boolean) TO PUBLIC;


--
-- TOC entry 2272 (class 0 OID 0)
-- Dependencies: 68
-- Name: ins_especialidad_objeto(bigint, character varying, character varying, boolean); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION ins_especialidad_objeto(bigint, character varying, character varying, boolean) FROM PUBLIC;
REVOKE ALL ON FUNCTION ins_especialidad_objeto(bigint, character varying, character varying, boolean) FROM postgres;
GRANT ALL ON FUNCTION ins_especialidad_objeto(bigint, character varying, character varying, boolean) TO postgres;
GRANT ALL ON FUNCTION ins_especialidad_objeto(bigint, character varying, character varying, boolean) TO PUBLIC;


--
-- TOC entry 2273 (class 0 OID 0)
-- Dependencies: 69
-- Name: ins_estados(character varying, character varying, boolean); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION ins_estados(character varying, character varying, boolean) FROM PUBLIC;
REVOKE ALL ON FUNCTION ins_estados(character varying, character varying, boolean) FROM postgres;
GRANT ALL ON FUNCTION ins_estados(character varying, character varying, boolean) TO postgres;
GRANT ALL ON FUNCTION ins_estados(character varying, character varying, boolean) TO PUBLIC;


--
-- TOC entry 2274 (class 0 OID 0)
-- Dependencies: 70
-- Name: ins_estatus(character varying, boolean); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION ins_estatus(character varying, boolean) FROM PUBLIC;
REVOKE ALL ON FUNCTION ins_estatus(character varying, boolean) FROM postgres;
GRANT ALL ON FUNCTION ins_estatus(character varying, boolean) TO postgres;
GRANT ALL ON FUNCTION ins_estatus(character varying, boolean) TO PUBLIC;


--
-- TOC entry 2275 (class 0 OID 0)
-- Dependencies: 71
-- Name: ins_indice_capital_social(character varying, numeric, numeric, boolean); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION ins_indice_capital_social(character varying, numeric, numeric, boolean) FROM PUBLIC;
REVOKE ALL ON FUNCTION ins_indice_capital_social(character varying, numeric, numeric, boolean) FROM postgres;
GRANT ALL ON FUNCTION ins_indice_capital_social(character varying, numeric, numeric, boolean) TO postgres;
GRANT ALL ON FUNCTION ins_indice_capital_social(character varying, numeric, numeric, boolean) TO PUBLIC;


--
-- TOC entry 2276 (class 0 OID 0)
-- Dependencies: 72
-- Name: ins_municipio(bigint, character varying, character varying, boolean); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION ins_municipio(bigint, character varying, character varying, boolean) FROM PUBLIC;
REVOKE ALL ON FUNCTION ins_municipio(bigint, character varying, character varying, boolean) FROM postgres;
GRANT ALL ON FUNCTION ins_municipio(bigint, character varying, character varying, boolean) TO postgres;
GRANT ALL ON FUNCTION ins_municipio(bigint, character varying, character varying, boolean) TO PUBLIC;


--
-- TOC entry 2277 (class 0 OID 0)
-- Dependencies: 73
-- Name: ins_nivel_financiero_snc(character varying, numeric, numeric); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION ins_nivel_financiero_snc(character varying, numeric, numeric) FROM PUBLIC;
REVOKE ALL ON FUNCTION ins_nivel_financiero_snc(character varying, numeric, numeric) FROM postgres;
GRANT ALL ON FUNCTION ins_nivel_financiero_snc(character varying, numeric, numeric) TO postgres;
GRANT ALL ON FUNCTION ins_nivel_financiero_snc(character varying, numeric, numeric) TO PUBLIC;


--
-- TOC entry 2278 (class 0 OID 0)
-- Dependencies: 74
-- Name: ins_numeros_telefonicos(integer, integer, character varying, character varying, boolean); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION ins_numeros_telefonicos(integer, integer, character varying, character varying, boolean) FROM PUBLIC;
REVOKE ALL ON FUNCTION ins_numeros_telefonicos(integer, integer, character varying, character varying, boolean) FROM postgres;
GRANT ALL ON FUNCTION ins_numeros_telefonicos(integer, integer, character varying, character varying, boolean) TO postgres;
GRANT ALL ON FUNCTION ins_numeros_telefonicos(integer, integer, character varying, character varying, boolean) TO PUBLIC;


--
-- TOC entry 2279 (class 0 OID 0)
-- Dependencies: 75
-- Name: ins_numeros_telefonicos_sucursales(integer, integer, character varying, character varying, boolean); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION ins_numeros_telefonicos_sucursales(integer, integer, character varying, character varying, boolean) FROM PUBLIC;
REVOKE ALL ON FUNCTION ins_numeros_telefonicos_sucursales(integer, integer, character varying, character varying, boolean) FROM postgres;
GRANT ALL ON FUNCTION ins_numeros_telefonicos_sucursales(integer, integer, character varying, character varying, boolean) TO postgres;
GRANT ALL ON FUNCTION ins_numeros_telefonicos_sucursales(integer, integer, character varying, character varying, boolean) TO PUBLIC;


--
-- TOC entry 2280 (class 0 OID 0)
-- Dependencies: 76
-- Name: ins_numeros_telefonicos_tipo(character varying, boolean); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION ins_numeros_telefonicos_tipo(character varying, boolean) FROM PUBLIC;
REVOKE ALL ON FUNCTION ins_numeros_telefonicos_tipo(character varying, boolean) FROM postgres;
GRANT ALL ON FUNCTION ins_numeros_telefonicos_tipo(character varying, boolean) TO postgres;
GRANT ALL ON FUNCTION ins_numeros_telefonicos_tipo(character varying, boolean) TO PUBLIC;


--
-- TOC entry 2281 (class 0 OID 0)
-- Dependencies: 77
-- Name: ins_organismos(character varying, character varying, boolean); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION ins_organismos(character varying, character varying, boolean) FROM PUBLIC;
REVOKE ALL ON FUNCTION ins_organismos(character varying, character varying, boolean) FROM postgres;
GRANT ALL ON FUNCTION ins_organismos(character varying, character varying, boolean) TO postgres;
GRANT ALL ON FUNCTION ins_organismos(character varying, character varying, boolean) TO PUBLIC;


--
-- TOC entry 2282 (class 0 OID 0)
-- Dependencies: 78
-- Name: ins_pais(character varying, character varying, integer); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION ins_pais(character varying, character varying, integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION ins_pais(character varying, character varying, integer) FROM postgres;
GRANT ALL ON FUNCTION ins_pais(character varying, character varying, integer) TO postgres;


--
-- TOC entry 2283 (class 0 OID 0)
-- Dependencies: 79
-- Name: ins_personas_naturales(character varying, character varying, character varying, character varying, character varying, character varying); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION ins_personas_naturales(character varying, character varying, character varying, character varying, character varying, character varying) FROM PUBLIC;
REVOKE ALL ON FUNCTION ins_personas_naturales(character varying, character varying, character varying, character varying, character varying, character varying) FROM postgres;
GRANT ALL ON FUNCTION ins_personas_naturales(character varying, character varying, character varying, character varying, character varying, character varying) TO postgres;
GRANT ALL ON FUNCTION ins_personas_naturales(character varying, character varying, character varying, character varying, character varying, character varying) TO PUBLIC;


--
-- TOC entry 2284 (class 0 OID 0)
-- Dependencies: 80
-- Name: ins_rendimientos(character varying, boolean); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION ins_rendimientos(character varying, boolean) FROM PUBLIC;
REVOKE ALL ON FUNCTION ins_rendimientos(character varying, boolean) FROM postgres;
GRANT ALL ON FUNCTION ins_rendimientos(character varying, boolean) TO postgres;
GRANT ALL ON FUNCTION ins_rendimientos(character varying, boolean) TO PUBLIC;


--
-- TOC entry 2285 (class 0 OID 0)
-- Dependencies: 81
-- Name: ins_sol_rec_xtipo(integer, integer, date, boolean); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION ins_sol_rec_xtipo(integer, integer, date, boolean) FROM PUBLIC;
REVOKE ALL ON FUNCTION ins_sol_rec_xtipo(integer, integer, date, boolean) FROM postgres;
GRANT ALL ON FUNCTION ins_sol_rec_xtipo(integer, integer, date, boolean) TO postgres;
GRANT ALL ON FUNCTION ins_sol_rec_xtipo(integer, integer, date, boolean) TO PUBLIC;


--
-- TOC entry 2286 (class 0 OID 0)
-- Dependencies: 82
-- Name: ins_solvencias_recaudos(character varying, boolean, integer, boolean); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION ins_solvencias_recaudos(character varying, boolean, integer, boolean) FROM PUBLIC;
REVOKE ALL ON FUNCTION ins_solvencias_recaudos(character varying, boolean, integer, boolean) FROM postgres;
GRANT ALL ON FUNCTION ins_solvencias_recaudos(character varying, boolean, integer, boolean) TO postgres;
GRANT ALL ON FUNCTION ins_solvencias_recaudos(character varying, boolean, integer, boolean) TO PUBLIC;


--
-- TOC entry 2287 (class 0 OID 0)
-- Dependencies: 83
-- Name: ins_tipo_actividad(character varying, boolean); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION ins_tipo_actividad(character varying, boolean) FROM PUBLIC;
REVOKE ALL ON FUNCTION ins_tipo_actividad(character varying, boolean) FROM postgres;
GRANT ALL ON FUNCTION ins_tipo_actividad(character varying, boolean) TO postgres;
GRANT ALL ON FUNCTION ins_tipo_actividad(character varying, boolean) TO PUBLIC;


--
-- TOC entry 2288 (class 0 OID 0)
-- Dependencies: 84
-- Name: ins_tipo_cooperativa(character varying, boolean); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION ins_tipo_cooperativa(character varying, boolean) FROM PUBLIC;
REVOKE ALL ON FUNCTION ins_tipo_cooperativa(character varying, boolean) FROM postgres;
GRANT ALL ON FUNCTION ins_tipo_cooperativa(character varying, boolean) TO postgres;
GRANT ALL ON FUNCTION ins_tipo_cooperativa(character varying, boolean) TO PUBLIC;


--
-- TOC entry 2289 (class 0 OID 0)
-- Dependencies: 85
-- Name: ins_tipo_firma(character varying, boolean); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION ins_tipo_firma(character varying, boolean) FROM PUBLIC;
REVOKE ALL ON FUNCTION ins_tipo_firma(character varying, boolean) FROM postgres;
GRANT ALL ON FUNCTION ins_tipo_firma(character varying, boolean) TO postgres;
GRANT ALL ON FUNCTION ins_tipo_firma(character varying, boolean) TO PUBLIC;


--
-- TOC entry 2290 (class 0 OID 0)
-- Dependencies: 86
-- Name: pg_att_campo(name, name); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION pg_att_campo(name, name) FROM PUBLIC;
REVOKE ALL ON FUNCTION pg_att_campo(name, name) FROM postgres;
GRANT ALL ON FUNCTION pg_att_campo(name, name) TO postgres;
GRANT ALL ON FUNCTION pg_att_campo(name, name) TO PUBLIC;


--
-- TOC entry 2291 (class 0 OID 0)
-- Dependencies: 87
-- Name: upd_activo_contratistas(character varying, integer); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION upd_activo_contratistas(character varying, integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION upd_activo_contratistas(character varying, integer) FROM postgres;
GRANT ALL ON FUNCTION upd_activo_contratistas(character varying, integer) TO postgres;
GRANT ALL ON FUNCTION upd_activo_contratistas(character varying, integer) TO PUBLIC;


--
-- TOC entry 2292 (class 0 OID 0)
-- Dependencies: 88
-- Name: upd_areas_objeto(character varying, character varying, boolean, bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION upd_areas_objeto(character varying, character varying, boolean, bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION upd_areas_objeto(character varying, character varying, boolean, bigint) FROM postgres;
GRANT ALL ON FUNCTION upd_areas_objeto(character varying, character varying, boolean, bigint) TO postgres;
GRANT ALL ON FUNCTION upd_areas_objeto(character varying, character varying, boolean, bigint) TO PUBLIC;


--
-- TOC entry 2293 (class 0 OID 0)
-- Dependencies: 89
-- Name: upd_ciudades(bigint, character varying, character varying, boolean, bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION upd_ciudades(bigint, character varying, character varying, boolean, bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION upd_ciudades(bigint, character varying, character varying, boolean, bigint) FROM postgres;
GRANT ALL ON FUNCTION upd_ciudades(bigint, character varying, character varying, boolean, bigint) TO postgres;
GRANT ALL ON FUNCTION upd_ciudades(bigint, character varying, character varying, boolean, bigint) TO PUBLIC;


--
-- TOC entry 2294 (class 0 OID 0)
-- Dependencies: 90
-- Name: upd_contratistas(integer, integer, integer, integer, character varying, character varying, character varying, date, date, character varying, character varying, character varying, integer, character varying, numeric, character varying, bigint, character varying, bigint, bigint, bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION upd_contratistas(integer, integer, integer, integer, character varying, character varying, character varying, date, date, character varying, character varying, character varying, integer, character varying, numeric, character varying, bigint, character varying, bigint, bigint, bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION upd_contratistas(integer, integer, integer, integer, character varying, character varying, character varying, date, date, character varying, character varying, character varying, integer, character varying, numeric, character varying, bigint, character varying, bigint, bigint, bigint) FROM postgres;
GRANT ALL ON FUNCTION upd_contratistas(integer, integer, integer, integer, character varying, character varying, character varying, date, date, character varying, character varying, character varying, integer, character varying, numeric, character varying, bigint, character varying, bigint, bigint, bigint) TO postgres;
GRANT ALL ON FUNCTION upd_contratistas(integer, integer, integer, integer, character varying, character varying, character varying, date, date, character varying, character varying, character varying, integer, character varying, numeric, character varying, bigint, character varying, bigint, bigint, bigint) TO PUBLIC;


--
-- TOC entry 2295 (class 0 OID 0)
-- Dependencies: 91
-- Name: upd_contratistas_acjdrl(character varying, boolean, boolean, boolean, numeric, integer); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION upd_contratistas_acjdrl(character varying, boolean, boolean, boolean, numeric, integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION upd_contratistas_acjdrl(character varying, boolean, boolean, boolean, numeric, integer) FROM postgres;
GRANT ALL ON FUNCTION upd_contratistas_acjdrl(character varying, boolean, boolean, boolean, numeric, integer) TO postgres;
GRANT ALL ON FUNCTION upd_contratistas_acjdrl(character varying, boolean, boolean, boolean, numeric, integer) TO PUBLIC;


--
-- TOC entry 2296 (class 0 OID 0)
-- Dependencies: 92
-- Name: upd_contratistas_comisarios(character varying, character varying, date, integer); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION upd_contratistas_comisarios(character varying, character varying, date, integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION upd_contratistas_comisarios(character varying, character varying, date, integer) FROM postgres;
GRANT ALL ON FUNCTION upd_contratistas_comisarios(character varying, character varying, date, integer) TO postgres;
GRANT ALL ON FUNCTION upd_contratistas_comisarios(character varying, character varying, date, integer) TO PUBLIC;


--
-- TOC entry 2297 (class 0 OID 0)
-- Dependencies: 93
-- Name: upd_contratistas_contratos(integer, integer, integer, character varying, character varying, date, character varying, bigint, integer); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION upd_contratistas_contratos(integer, integer, integer, character varying, character varying, date, character varying, bigint, integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION upd_contratistas_contratos(integer, integer, integer, character varying, character varying, date, character varying, bigint, integer) FROM postgres;
GRANT ALL ON FUNCTION upd_contratistas_contratos(integer, integer, integer, character varying, character varying, date, character varying, bigint, integer) TO postgres;
GRANT ALL ON FUNCTION upd_contratistas_contratos(integer, integer, integer, character varying, character varying, date, character varying, bigint, integer) TO PUBLIC;


--
-- TOC entry 2298 (class 0 OID 0)
-- Dependencies: 94
-- Name: upd_contratistas_estatus(character varying, boolean, bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION upd_contratistas_estatus(character varying, boolean, bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION upd_contratistas_estatus(character varying, boolean, bigint) FROM postgres;
GRANT ALL ON FUNCTION upd_contratistas_estatus(character varying, boolean, bigint) TO postgres;
GRANT ALL ON FUNCTION upd_contratistas_estatus(character varying, boolean, bigint) TO PUBLIC;


--
-- TOC entry 2299 (class 0 OID 0)
-- Dependencies: 95
-- Name: upd_contratistas_legal(integer, character varying, character varying, date, character varying, character varying, character varying, character varying, character varying, date, date, numeric, numeric, boolean, character varying, character varying, integer, integer); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION upd_contratistas_legal(integer, character varying, character varying, date, character varying, character varying, character varying, character varying, character varying, date, date, numeric, numeric, boolean, character varying, character varying, integer, integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION upd_contratistas_legal(integer, character varying, character varying, date, character varying, character varying, character varying, character varying, character varying, date, date, numeric, numeric, boolean, character varying, character varying, integer, integer) FROM postgres;
GRANT ALL ON FUNCTION upd_contratistas_legal(integer, character varying, character varying, date, character varying, character varying, character varying, character varying, character varying, date, date, numeric, numeric, boolean, character varying, character varying, integer, integer) TO postgres;
GRANT ALL ON FUNCTION upd_contratistas_legal(integer, character varying, character varying, date, character varying, character varying, character varying, character varying, character varying, date, date, numeric, numeric, boolean, character varying, character varying, integer, integer) TO PUBLIC;


--
-- TOC entry 2300 (class 0 OID 0)
-- Dependencies: 96
-- Name: upd_contratistas_sucursales(character varying, character varying, integer); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION upd_contratistas_sucursales(character varying, character varying, integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION upd_contratistas_sucursales(character varying, character varying, integer) FROM postgres;
GRANT ALL ON FUNCTION upd_contratistas_sucursales(character varying, character varying, integer) TO postgres;
GRANT ALL ON FUNCTION upd_contratistas_sucursales(character varying, character varying, integer) TO PUBLIC;


--
-- TOC entry 2301 (class 0 OID 0)
-- Dependencies: 97
-- Name: upd_contratistas_tipo(character varying, boolean, bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION upd_contratistas_tipo(character varying, boolean, bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION upd_contratistas_tipo(character varying, boolean, bigint) FROM postgres;
GRANT ALL ON FUNCTION upd_contratistas_tipo(character varying, boolean, bigint) TO postgres;
GRANT ALL ON FUNCTION upd_contratistas_tipo(character varying, boolean, bigint) TO PUBLIC;


--
-- TOC entry 2302 (class 0 OID 0)
-- Dependencies: 98
-- Name: upd_denominacion_comercial(character varying, character varying, boolean, bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION upd_denominacion_comercial(character varying, character varying, boolean, bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION upd_denominacion_comercial(character varying, character varying, boolean, bigint) FROM postgres;
GRANT ALL ON FUNCTION upd_denominacion_comercial(character varying, character varying, boolean, bigint) TO postgres;
GRANT ALL ON FUNCTION upd_denominacion_comercial(character varying, character varying, boolean, bigint) TO PUBLIC;


--
-- TOC entry 2303 (class 0 OID 0)
-- Dependencies: 99
-- Name: upd_especialidad_objeto(bigint, character varying, character varying, boolean, bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION upd_especialidad_objeto(bigint, character varying, character varying, boolean, bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION upd_especialidad_objeto(bigint, character varying, character varying, boolean, bigint) FROM postgres;
GRANT ALL ON FUNCTION upd_especialidad_objeto(bigint, character varying, character varying, boolean, bigint) TO postgres;
GRANT ALL ON FUNCTION upd_especialidad_objeto(bigint, character varying, character varying, boolean, bigint) TO PUBLIC;


--
-- TOC entry 2304 (class 0 OID 0)
-- Dependencies: 100
-- Name: upd_indice_capital_social(character varying, numeric, numeric, boolean, bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION upd_indice_capital_social(character varying, numeric, numeric, boolean, bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION upd_indice_capital_social(character varying, numeric, numeric, boolean, bigint) FROM postgres;
GRANT ALL ON FUNCTION upd_indice_capital_social(character varying, numeric, numeric, boolean, bigint) TO postgres;
GRANT ALL ON FUNCTION upd_indice_capital_social(character varying, numeric, numeric, boolean, bigint) TO PUBLIC;


--
-- TOC entry 2305 (class 0 OID 0)
-- Dependencies: 101
-- Name: upd_municipio(bigint, character varying, character varying, boolean, bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION upd_municipio(bigint, character varying, character varying, boolean, bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION upd_municipio(bigint, character varying, character varying, boolean, bigint) FROM postgres;
GRANT ALL ON FUNCTION upd_municipio(bigint, character varying, character varying, boolean, bigint) TO postgres;
GRANT ALL ON FUNCTION upd_municipio(bigint, character varying, character varying, boolean, bigint) TO PUBLIC;


--
-- TOC entry 2306 (class 0 OID 0)
-- Dependencies: 102
-- Name: upd_nivel_financiero_snc(character varying, numeric, numeric, bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION upd_nivel_financiero_snc(character varying, numeric, numeric, bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION upd_nivel_financiero_snc(character varying, numeric, numeric, bigint) FROM postgres;
GRANT ALL ON FUNCTION upd_nivel_financiero_snc(character varying, numeric, numeric, bigint) TO postgres;
GRANT ALL ON FUNCTION upd_nivel_financiero_snc(character varying, numeric, numeric, bigint) TO PUBLIC;


--
-- TOC entry 2307 (class 0 OID 0)
-- Dependencies: 103
-- Name: upd_numeros_telefonicos_tipo(character varying, boolean, bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION upd_numeros_telefonicos_tipo(character varying, boolean, bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION upd_numeros_telefonicos_tipo(character varying, boolean, bigint) FROM postgres;
GRANT ALL ON FUNCTION upd_numeros_telefonicos_tipo(character varying, boolean, bigint) TO postgres;
GRANT ALL ON FUNCTION upd_numeros_telefonicos_tipo(character varying, boolean, bigint) TO PUBLIC;


--
-- TOC entry 2308 (class 0 OID 0)
-- Dependencies: 104
-- Name: upd_organismos(character varying, character varying, boolean, bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION upd_organismos(character varying, character varying, boolean, bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION upd_organismos(character varying, character varying, boolean, bigint) FROM postgres;
GRANT ALL ON FUNCTION upd_organismos(character varying, character varying, boolean, bigint) TO postgres;
GRANT ALL ON FUNCTION upd_organismos(character varying, character varying, boolean, bigint) TO PUBLIC;


--
-- TOC entry 2309 (class 0 OID 0)
-- Dependencies: 105
-- Name: upd_personas_naturales(character varying, character varying, character varying, character varying, integer); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION upd_personas_naturales(character varying, character varying, character varying, character varying, integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION upd_personas_naturales(character varying, character varying, character varying, character varying, integer) FROM postgres;
GRANT ALL ON FUNCTION upd_personas_naturales(character varying, character varying, character varying, character varying, integer) TO postgres;
GRANT ALL ON FUNCTION upd_personas_naturales(character varying, character varying, character varying, character varying, integer) TO PUBLIC;


--
-- TOC entry 2310 (class 0 OID 0)
-- Dependencies: 106
-- Name: upd_rendimientos(character varying, boolean, bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION upd_rendimientos(character varying, boolean, bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION upd_rendimientos(character varying, boolean, bigint) FROM postgres;
GRANT ALL ON FUNCTION upd_rendimientos(character varying, boolean, bigint) TO postgres;
GRANT ALL ON FUNCTION upd_rendimientos(character varying, boolean, bigint) TO PUBLIC;


--
-- TOC entry 2311 (class 0 OID 0)
-- Dependencies: 107
-- Name: upd_sol_rec_xtipo(bigint, bigint, date, boolean, bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION upd_sol_rec_xtipo(bigint, bigint, date, boolean, bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION upd_sol_rec_xtipo(bigint, bigint, date, boolean, bigint) FROM postgres;
GRANT ALL ON FUNCTION upd_sol_rec_xtipo(bigint, bigint, date, boolean, bigint) TO postgres;
GRANT ALL ON FUNCTION upd_sol_rec_xtipo(bigint, bigint, date, boolean, bigint) TO PUBLIC;


--
-- TOC entry 2312 (class 0 OID 0)
-- Dependencies: 108
-- Name: upd_solvencias_recaudos(character varying, boolean, integer, boolean, bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION upd_solvencias_recaudos(character varying, boolean, integer, boolean, bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION upd_solvencias_recaudos(character varying, boolean, integer, boolean, bigint) FROM postgres;
GRANT ALL ON FUNCTION upd_solvencias_recaudos(character varying, boolean, integer, boolean, bigint) TO postgres;
GRANT ALL ON FUNCTION upd_solvencias_recaudos(character varying, boolean, integer, boolean, bigint) TO PUBLIC;


--
-- TOC entry 2313 (class 0 OID 0)
-- Dependencies: 109
-- Name: upd_tipo_actividad(character varying, boolean, bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION upd_tipo_actividad(character varying, boolean, bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION upd_tipo_actividad(character varying, boolean, bigint) FROM postgres;
GRANT ALL ON FUNCTION upd_tipo_actividad(character varying, boolean, bigint) TO postgres;
GRANT ALL ON FUNCTION upd_tipo_actividad(character varying, boolean, bigint) TO PUBLIC;


--
-- TOC entry 2314 (class 0 OID 0)
-- Dependencies: 110
-- Name: upd_tipo_cooperativa(character varying, boolean, bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION upd_tipo_cooperativa(character varying, boolean, bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION upd_tipo_cooperativa(character varying, boolean, bigint) FROM postgres;
GRANT ALL ON FUNCTION upd_tipo_cooperativa(character varying, boolean, bigint) TO postgres;
GRANT ALL ON FUNCTION upd_tipo_cooperativa(character varying, boolean, bigint) TO PUBLIC;


--
-- TOC entry 2315 (class 0 OID 0)
-- Dependencies: 111
-- Name: upd_tipo_firma(character varying, boolean, bigint); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION upd_tipo_firma(character varying, boolean, bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION upd_tipo_firma(character varying, boolean, bigint) FROM postgres;
GRANT ALL ON FUNCTION upd_tipo_firma(character varying, boolean, bigint) TO postgres;
GRANT ALL ON FUNCTION upd_tipo_firma(character varying, boolean, bigint) TO PUBLIC;


--
-- TOC entry 2338 (class 0 OID 0)
-- Dependencies: 1508
-- Name: contratistas_contratos; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE contratistas_contratos FROM PUBLIC;
REVOKE ALL ON TABLE contratistas_contratos FROM postgres;
GRANT ALL ON TABLE contratistas_contratos TO postgres;
GRANT ALL ON TABLE contratistas_contratos TO PUBLIC;


--
-- TOC entry 2412 (class 0 OID 0)
-- Dependencies: 1613
-- Name: seq_codigo_siez; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE seq_codigo_siez FROM PUBLIC;
REVOKE ALL ON SEQUENCE seq_codigo_siez FROM postgres;
GRANT ALL ON SEQUENCE seq_codigo_siez TO postgres;
GRANT ALL ON SEQUENCE seq_codigo_siez TO PUBLIC;


--
-- TOC entry 2427 (class 0 OID 0)
-- Dependencies: 1625
-- Name: vis_contratistas; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vis_contratistas FROM PUBLIC;
REVOKE ALL ON TABLE vis_contratistas FROM postgres;
GRANT ALL ON TABLE vis_contratistas TO postgres;
GRANT ALL ON TABLE vis_contratistas TO PUBLIC;


--
-- TOC entry 2428 (class 0 OID 0)
-- Dependencies: 1539
-- Name: vis_contratistas_estatus; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vis_contratistas_estatus FROM PUBLIC;
REVOKE ALL ON TABLE vis_contratistas_estatus FROM postgres;
GRANT ALL ON TABLE vis_contratistas_estatus TO postgres;
GRANT ALL ON TABLE vis_contratistas_estatus TO PUBLIC;


--
-- TOC entry 2429 (class 0 OID 0)
-- Dependencies: 1545
-- Name: vis_desincorporar; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vis_desincorporar FROM PUBLIC;
REVOKE ALL ON TABLE vis_desincorporar FROM postgres;
GRANT ALL ON TABLE vis_desincorporar TO postgres;
GRANT ALL ON TABLE vis_desincorporar TO PUBLIC;


--
-- TOC entry 2430 (class 0 OID 0)
-- Dependencies: 1547
-- Name: vis_estados; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vis_estados FROM PUBLIC;
REVOKE ALL ON TABLE vis_estados FROM postgres;
GRANT ALL ON TABLE vis_estados TO postgres;
GRANT ALL ON TABLE vis_estados TO PUBLIC;


--
-- TOC entry 2431 (class 0 OID 0)
-- Dependencies: 1548
-- Name: vis_estatus; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vis_estatus FROM PUBLIC;
REVOKE ALL ON TABLE vis_estatus FROM postgres;
GRANT ALL ON TABLE vis_estatus TO postgres;
GRANT ALL ON TABLE vis_estatus TO PUBLIC;


--
-- TOC entry 2432 (class 0 OID 0)
-- Dependencies: 1622
-- Name: vis_indice_capital_social; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vis_indice_capital_social FROM PUBLIC;
REVOKE ALL ON TABLE vis_indice_capital_social FROM postgres;
GRANT ALL ON TABLE vis_indice_capital_social TO postgres;
GRANT ALL ON TABLE vis_indice_capital_social TO PUBLIC;


--
-- TOC entry 2433 (class 0 OID 0)
-- Dependencies: 1552
-- Name: vis_municipio; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vis_municipio FROM PUBLIC;
REVOKE ALL ON TABLE vis_municipio FROM postgres;
GRANT ALL ON TABLE vis_municipio TO postgres;
GRANT ALL ON TABLE vis_municipio TO PUBLIC;


--
-- TOC entry 2434 (class 0 OID 0)
-- Dependencies: 1554
-- Name: vis_numeros_telefonicos_tipo; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vis_numeros_telefonicos_tipo FROM PUBLIC;
REVOKE ALL ON TABLE vis_numeros_telefonicos_tipo FROM postgres;
GRANT ALL ON TABLE vis_numeros_telefonicos_tipo TO postgres;
GRANT ALL ON TABLE vis_numeros_telefonicos_tipo TO PUBLIC;


--
-- TOC entry 2435 (class 0 OID 0)
-- Dependencies: 1563
-- Name: vis_sol_rec_xtipo; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vis_sol_rec_xtipo FROM PUBLIC;
REVOKE ALL ON TABLE vis_sol_rec_xtipo FROM postgres;
GRANT ALL ON TABLE vis_sol_rec_xtipo TO postgres;
GRANT ALL ON TABLE vis_sol_rec_xtipo TO PUBLIC;


--
-- TOC entry 2436 (class 0 OID 0)
-- Dependencies: 1566
-- Name: vis_tipo_cooperativa; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vis_tipo_cooperativa FROM PUBLIC;
REVOKE ALL ON TABLE vis_tipo_cooperativa FROM postgres;
GRANT ALL ON TABLE vis_tipo_cooperativa TO postgres;


--
-- TOC entry 2437 (class 0 OID 0)
-- Dependencies: 1567
-- Name: vis_tipo_firma; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE vis_tipo_firma FROM PUBLIC;
REVOKE ALL ON TABLE vis_tipo_firma FROM postgres;
GRANT ALL ON TABLE vis_tipo_firma TO postgres;
GRANT ALL ON TABLE vis_tipo_firma TO PUBLIC;


--
-- TOC entry 2438 (class 0 OID 0)
-- Dependencies: 1568
-- Name: visfk_areas_objeto; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE visfk_areas_objeto FROM PUBLIC;
REVOKE ALL ON TABLE visfk_areas_objeto FROM postgres;
GRANT ALL ON TABLE visfk_areas_objeto TO postgres;
GRANT ALL ON TABLE visfk_areas_objeto TO PUBLIC;


--
-- TOC entry 2439 (class 0 OID 0)
-- Dependencies: 1570
-- Name: visfk_contratistas_estatus; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE visfk_contratistas_estatus FROM PUBLIC;
REVOKE ALL ON TABLE visfk_contratistas_estatus FROM postgres;
GRANT ALL ON TABLE visfk_contratistas_estatus TO postgres;
GRANT ALL ON TABLE visfk_contratistas_estatus TO PUBLIC;


--
-- TOC entry 2440 (class 0 OID 0)
-- Dependencies: 1573
-- Name: visfk_estados; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE visfk_estados FROM PUBLIC;
REVOKE ALL ON TABLE visfk_estados FROM postgres;
GRANT ALL ON TABLE visfk_estados TO postgres;
GRANT ALL ON TABLE visfk_estados TO PUBLIC;


--
-- TOC entry 2441 (class 0 OID 0)
-- Dependencies: 1574
-- Name: visfk_estatus; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE visfk_estatus FROM PUBLIC;
REVOKE ALL ON TABLE visfk_estatus FROM postgres;
GRANT ALL ON TABLE visfk_estatus TO postgres;
GRANT ALL ON TABLE visfk_estatus TO PUBLIC;


--
-- TOC entry 2442 (class 0 OID 0)
-- Dependencies: 1623
-- Name: visfk_indice_capital_social; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE visfk_indice_capital_social FROM PUBLIC;
REVOKE ALL ON TABLE visfk_indice_capital_social FROM postgres;
GRANT ALL ON TABLE visfk_indice_capital_social TO postgres;
GRANT ALL ON TABLE visfk_indice_capital_social TO PUBLIC;


--
-- TOC entry 2443 (class 0 OID 0)
-- Dependencies: 1576
-- Name: visfk_rendimientos; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE visfk_rendimientos FROM PUBLIC;
REVOKE ALL ON TABLE visfk_rendimientos FROM postgres;
GRANT ALL ON TABLE visfk_rendimientos TO postgres;
GRANT ALL ON TABLE visfk_rendimientos TO PUBLIC;


--
-- TOC entry 2444 (class 0 OID 0)
-- Dependencies: 1579
-- Name: visfk_tipo_cooperativa; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE visfk_tipo_cooperativa FROM PUBLIC;
REVOKE ALL ON TABLE visfk_tipo_cooperativa FROM postgres;
GRANT ALL ON TABLE visfk_tipo_cooperativa TO postgres;


--
-- TOC entry 2445 (class 0 OID 0)
-- Dependencies: 1580
-- Name: visfk_tipo_firma; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE visfk_tipo_firma FROM PUBLIC;
REVOKE ALL ON TABLE visfk_tipo_firma FROM postgres;
GRANT ALL ON TABLE visfk_tipo_firma TO postgres;
GRANT ALL ON TABLE visfk_tipo_firma TO PUBLIC;


SET search_path = sistema, pg_catalog;

--
-- TOC entry 2452 (class 0 OID 0)
-- Dependencies: 1584
-- Name: vis_usuarios; Type: ACL; Schema: sistema; Owner: postgres
--

REVOKE ALL ON TABLE vis_usuarios FROM PUBLIC;
REVOKE ALL ON TABLE vis_usuarios FROM postgres;
GRANT ALL ON TABLE vis_usuarios TO postgres;
GRANT ALL ON TABLE vis_usuarios TO PUBLIC;


--
-- TOC entry 2453 (class 0 OID 0)
-- Dependencies: 1585
-- Name: vis_usuarios_menu; Type: ACL; Schema: sistema; Owner: postgres
--

REVOKE ALL ON TABLE vis_usuarios_menu FROM PUBLIC;
REVOKE ALL ON TABLE vis_usuarios_menu FROM postgres;
GRANT ALL ON TABLE vis_usuarios_menu TO postgres;
GRANT ALL ON TABLE vis_usuarios_menu TO PUBLIC;


-- Completed on 2009-09-17 10:46:12

--
-- PostgreSQL database dump complete
--

