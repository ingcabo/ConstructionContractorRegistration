<?php
/**
 * Description of mod_usuario
 *
 * @author rcamejo
 */
class Mod_usuario extends Model {

    function Mod_usuario(){
        parent::Model();
        $this->load->helper('date');
        $this->load->library('Mylib_base');
    }

    function en_session(){
      $centinela = new Centinela();
	  if(!$centinela->check(0, FALSE))
        redirect("con_acceso/entrar");
    } //Fin index

    function cambio($usuario_actual,$nueva){
      $this->db->query("UPDATE sistema.usuarios SET usr_clave = '$nueva' WHERE usr_usuarios_pk = $usuario_actual");
    } //fin cambio

    function nuevo($valores){
      $this->db->trans_start();
       $this->db->query("INSERT INTO sistema.usuarios (usr_nombre, usr_clave, usr_correo_electronico, usr_nivel, usr_fecha_creacion, usr_fecha_expira, usr_rol) VALUES (?,?,?,'1','".mdate('%Y/%m/%d',now())."',?,'1')", $valores);
       $pk = $this->db->query('Select max(usr_usuarios_pk) from sistema.usuarios');
      $this->db->trans_complete();
      return $pk;
    } //Fin nuevo

    function modificar($valores){
      $this->db->query("UPDATE sistema.usuarios SET usr_correo_electronico=?, usr_fecha_expira=? WHERE usr_usuarios_pk =?" , $valores);
    } //Fin nuevo

    function borrar($pk){
      $this->db->query('DELETE FROM sistema.usuarios WHERE usr_usuarios_pk ='.$pk);  
    }

    //Con esta funcion consulto la tabla directamente, para obtener todos los registros
    function ObtRegistros($field,$param,$tabla){
        //echo "Campo: $field, Condicion: $param";
        $query = $this->db->where($field,$param);
        $query = $this->db->get($tabla);
        return $query->row();
      } //Fin ObtRegistros

} //fin clase
?>
