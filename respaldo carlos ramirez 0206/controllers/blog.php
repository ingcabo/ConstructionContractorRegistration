<?php
/**
 * PHP Template.
 */
class Blog extends controller
{
    function Blog()
    {
        parent::Controller();
        $this->load->library('template');
        //$this->load->scaffolding('scspl_pais');
        //$this->load->library('calendar');
        //echo $this->calendar->generate(2008,10);
        //$this->output->enable_profiler(TRUE);
    }
    
    function index()
   {
//      $conten = 'Esto es una prueba
//                 para ver como se ve';
//      $this->template->write('contenido',$conten);
//      $this->template->write('sidebar','Bienvenido al SCSPL');
//      $this->template->render();
     $this->load->library('pagination');
     $config['base_url'] = 'http://localhost/SCSPL/index.php/con_listview/index/';
     $config['total_rows'] = '20';
     $config['per_page'] = '5';
     $this->pagination->initialize($config);

     echo $this->pagination->create_links();
   }
}
?>
