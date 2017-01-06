<?php

/**
 * Constructor de trigger en postgres, para hacer
 * auditoria de las tablas
 *
 * @author rcamejo
 */
class Con_gentrigger extends controller{

  var $tabla_nombre, $trigger_encabezado, $trigger_udp_comienzo_cuerpo, $trigger_udp_campo,
      $trigger_udp_fin_cuerpo, $trigger_ins_comienzo_cuerpo, $trigger_ins_campo, $trigger_ins_fin_cuerpo,
      $enlace_tabla_triger;

  function Con_gentrigger(){
    parent::Controller();
    $this->load->model('Mfrmclass','',TRUE);

    $this->trigger_encabezado = '
    CREATE OR REPLACE FUNCTION trg_aud_[% nft %]()
     RETURNS "trigger" AS
    $BODY$
    BEGIN
    IF (TG_OP = \'DELETE\') THEN
    RAISE EXCEPTION \'NO SE PERMITEN BORRADOS FISICOS\';
    END IF ;';

    $this->trigger_udp_comienzo_cuerpo = '
    IF (TG_OP = \'UPDATE\') THEN';
    $this->trigger_udp_campo = '
    IF (OLD.[% cp %] <> NEW.[% cp %]) THEN
        IF (\'[% cp %]\' = \'eliminado\') THEN
          insert into auditoria(adt_tabla,adt_pk_registro,adt_campo_afectado,adt_valor_old,adt_valor_new,adt_cliente_ip,adt_fecha_hora,adt_accion, adt_usuario)
          values( \'[% tabla %]\', OLD.[% id %], \'[% cp %]\', OLD.[% vcp %], NEW.[% vcp %], inet_client_addr(), current_timestamp, \'UPDATE\',CURRENT_USER);
        ELSE
          insert into auditoria(adt_tabla,adt_pk_registro,adt_campo_afectado,adt_valor_old,adt_valor_new,adt_cliente_ip,adt_fecha_hora,adt_accion,adt_usuario)
          values( \'[% tabla %]\', OLD.[% id %], \'[% cp %]\', OLD.[% vcp %], NEW.[% vcp %], inet_client_addr(), current_timestamp, \'UPDATE\',CURRENT_USER);
        END IF;
      END IF;';
    $this->trigger_udp_fin_cuerpo = '
    return new ;
    END IF ;';

    $this->trigger_ins_comienzo_cuerpo = '
    IF (TG_OP = \'INSERT\') THEN';
    $this->trigger_ins_campo = '
      IF (NEW.[% cp %] IS NOT null) THEN
        IF (\'[% cp %]\' = \'eliminado\') THEN
          insert into auditoria(adt_tabla,adt_pk_registro,adt_campo_afectado,adt_valor_old,adt_valor_new,adt_cliente_ip,adt_fecha_hora,adt_accion,adt_usuario)
          values( \'[% tabla %]\', NEW.[% id %], \'[% cp %]\', null, NEW.[% vcp %], inet_client_addr(), current_timestamp, \'INSERT\',CURRENT_USER);
        ELSE
          insert into auditoria(adt_tabla,adt_pk_registro,adt_campo_afectado,adt_valor_old,adt_valor_new,adt_cliente_ip,adt_fecha_hora,adt_accion,adt_usuario)
          values( \'[% tabla %]\', NEW.[% id %], \'[% cp %]\', null, NEW.[% vcp %], inet_client_addr(), current_timestamp, \'INSERT\',CURRENT_USER);
        END IF;
      END IF;';
    $this->trigger_ins_fin_cuerpo = '
    return new ;
    end IF ;
    END;
    $BODY$
    LANGUAGE \'plpgsql\' VOLATILE;
    ALTER FUNCTION trg_aud_[% nft %]() OWNER TO postgres;';
    $this->enlace_tabla_triger = 'CREATE TRIGGER trg_[% nft %]
    BEFORE INSERT OR UPDATE OR DELETE
    ON [% nft %]
    FOR EACH ROW
    EXECUTE PROCEDURE trg_aud_[% nft %]();';
  }

  function actualiza($plantilla, $tabla){
    $resultado = '';$con_tabla_id = '';
    if($tabla <> ''){
        if ($this->db->table_exists($tabla)){
            $con_tabla = preg_replace('/\[\% tabla \%\]/',$tabla,$plantilla);
            $query = $this->db->query('SELECT * FROM '.$tabla.' limit 1');
            foreach ($query->list_fields() as $campo){
               if(!$this->Mfrmclass->espk($campo)){
                 $carac = $this->Mfrmclass->ObtAttCampo($tabla,$campo);
                 if($carac['tipo']=='bool'){
                   $resultado .= preg_replace('/\[\% cp \%\]/',$campo,$con_tabla_id).'<br>';
                   $resultado = preg_replace('/\[\% vcp \%\]/',$campo.'::int',$resultado).'<br>';
                 }else{ $resultado .= preg_replace('/\[\% cp \%\]/',$campo,$con_tabla_id).'<br>';
                        $resultado = preg_replace('/\[\% vcp \%\]/',$campo,$resultado).'<br>';
                 }
               }else{
                 $con_tabla_id = preg_replace('/\[\% id \%\]/',$campo,$con_tabla).'<br>';
               }
            }
        }
     }
     return $resultado;
  } //Fin actualiza

  function script($tabla){
     $result = '';
     $encabezado = preg_replace('/\[\% nft \%\]/',$tabla,$this->trigger_encabezado);
     $result = $encabezado.'<br>'.$this->trigger_udp_comienzo_cuerpo.'<br>';
     $result .= $this->actualiza($this->trigger_udp_campo, $tabla).'<br>';
     $result .= $this->trigger_udp_fin_cuerpo.'<br>'.$this->trigger_ins_comienzo_cuerpo;
     $result .= $this->actualiza($this->trigger_ins_campo, $tabla);
     $final = preg_replace('/\[\% nft \%\]/',$tabla,$this->trigger_ins_fin_cuerpo);
     $result .= $final;
     $enlace = preg_replace('/\[\% nft \%\]/',$tabla,$this->enlace_tabla_triger);
     return $result.$enlace;
  }

  function index(){

     $tablas = $this->db->list_tables();
     $i=1;
     foreach($tablas as $tabla){
         $consulta = '';
         if(substr($tabla,0,3) != 'vis' and $tabla != 'auditoria'){
           //echo $i++.$tabla.'<br>';
           $consulta = $this->script($tabla);
           //echo $consulta.'<h2>Fin</h2><br>';
           $resultado = $this->db->query($consulta);
         }
     }
   } //Fin index

  
} //Fin Con_gentrigger
?>
