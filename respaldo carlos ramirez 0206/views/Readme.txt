-----------------------------------------------------------------------------------------------------------------------------------
"Contenido" (link a manual.pdf)
-----------------------------------------------------------------------------------------------------------------------------------
*Archivos*

JavaScript para el llamado de la ventana "acerca de..."

<script language="javascript">

function Abrir()
{
OpenWindow = window.open('archivos/xxx.pdf','','titlebars=0, toolbar=0,scrollbars=0,location=0,statusbar=1,menubar=0,resizable=0,width=1024,height=728');OpenWindow.document.title='Manual de Usuario (REGCO)';
}

</script>

Nota: sustituir xxx por el nombre real del archivo pdf.


-----------------------------------------------------------------------------------------------------------------------------------
"Acerca de..."
-----------------------------------------------------------------------------------------------------------------------------------
*Archivos*
-acerca_de.html
-archivos/bg.jpg
-archivos/bg_info.jpg

JavaScript para el llamado de la ventana "acerca de..."

<script language="javascript">

function Abrir()
{
OpenWindow = window.open('acerca_de.html','','titlebars=0, toolbar=0,scrollbars=0,location=0,statusbar=1,menubar=0,resizable=0,width=640,height=480,top=150,left=300');OpenWindow.document.title='Acerca de...';
}

</script>
-----------------------------------------------------------------------------------------------------------------------------------