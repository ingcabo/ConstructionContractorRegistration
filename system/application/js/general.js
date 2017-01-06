
function SoloNumero(e)
{
    tecla = (document.all) ? e.keyCode : e.which;
    if (tecla == 8 || tecla == 0 || tecla == 9) return true; //Tecla de retroceso (para poder borrar)
    patron = /\d/;
    //patron = /(^[0-9.]$)/;
    te = String.fromCharCode(tecla);
    return patron.test(te);
}

function puntitos(donde,caracter,ndecimales)
{

    N = ndecimales; //numero de decimales a generar solo hasta 3 decimales
    decimales = true; //si quiero decimales
    dec = new Number(N)

    //alert(dec);
    pat = /[\*,\+,\(,\),\?,\\,\$,\[,\],\^]/
    valor = donde.value

    largo = valor.length

    crtr = true
    if(isNaN(caracter) || pat.test(caracter) == true)
        {
        if (pat.test(caracter)==true)
            {caracter = "\\" + caracter}
        carcter = new RegExp(caracter,"g")
        valor = valor.replace(carcter,"")
        donde.value = valor
        crtr = false
        }
    else
        {

        var nums = new Array()

             cont = 0
           for(m=0;m<largo;m++)
            {
        if(valor.charAt(m) == "." || valor.charAt(m) == " " || valor.charAt(m) == ",")
                {continue;}
            else{
                nums[cont] = valor.charAt(m)
                cont++
                }

            }
        }

    if(decimales == true) {
        ctdd = eval(1 + dec);
        nmrs = 1
        }
    else {
        ctdd = 1; nmrs = 3
        }
    var cad1="",cad2="",cad3="",tres=0
    if(largo > nmrs && crtr == true)
        {
        for (k=nums.length-ctdd;k>=0;k--){
            cad1 = nums[k]
            cad2 = cad1 + cad2
            tres++
            if((tres%3) == 0){
                if(k!=0){
                    cad2 = "." + cad2
                    }
                }
            }

        for (dd = dec; dd > 0; dd--)
        {cad3 += nums[nums.length-dd] }
        if(decimales == true)
        {cad2 += "," + cad3}
         donde.value = cad2
        }
//donde.focus()  // no hanilitar esto, es una vaina seria
}	
	


function cumpleReglas(simpleTexto)
        {
            //la pasamos por una poderosa expresión regular
            var expresion = new RegExp("^(|([0-9]{1,3}?))$");

            //si pasa la prueba, es válida
            if(expresion.test(simpleTexto))
                return true;
            return false;
        }//end function checaReglas

    //ESTA FUNCIÓN REVISA QUE TODO LO QUE SE ESCRIBA ESTÉ EN ORDEN
    function revisaCadena(textItem)
        {
            //si comienza con un punto, le agregamos un cero
            if(textItem.value.substring(0,1) == '.')
                textItem.value = '0' + textItem.value;

            //si no cumples las reglas, no te dejo escribir
            if(!cumpleReglas(textItem.value))
                textItem.value = textoAnterior;
            else //todo en orden
                textoAnterior = textItem.value;
        }//end function revisaCadena





function numeros_coma(n){
//alert(v);
var nav4 = window.Event ? true : false;
//alert('si entra')
// NOTE: Backspace = 8, Enter = 13, '0' = 48, '9' = 57
var key = nav4 ? n.which : n.keyCode;
return ((key >= 48 && key <= 59) || key == 46 );

}

function numerico(t) {

var patron = /^\d{1,3}(,\d{3})*\.{1}\d{2}/;
var str = t.value;
var result;
if (str.match(patron)){
            result = str.match(patron);
            if (result!= null){
            t.value = result[0];
            }
}else{

        //return numeros_coma();
        //alert(t.id+” contiene un numero malformateado”);
        }
}





function Convertir(objeto)
{
var index;
var tmpStr;
var tmpChar;
var preString;
var postString;
var strlen;
tmpStr = objeto.value.toLowerCase();
strLen = tmpStr.length;
    if (strLen > 0)
    {
    for (index = 0; index < strLen; index++)
        {
        if (index == 0)
            {
            tmpChar = tmpStr.substring(0,1).toUpperCase();
            postString = tmpStr.substring(1,strLen);
            tmpStr = tmpChar + postString;
            }
            else
            {
            tmpChar = tmpStr.substring(index, index+1);
                if (tmpChar == " " && index < (strLen-1))
                {
                tmpChar = tmpStr.substring(index+1, index+2).toUpperCase();
                preString = tmpStr.substring(0, index+1);
                postString = tmpStr.substring(index+2,strLen);
                tmpStr = preString + tmpChar + postString;
                }
            }
        }
    }
objeto.value = tmpStr;
}


//*************************************************



 function invFecha(nTipFormat,dFecIni){

  //var dFecIni = dFecIni.replace(⁄-⁄g,"⁄");

   // ⁄⁄// primera division fecha
     var nPosUno  = ponCero(dFecIni.substr(0,dFecIni.indexOf("⁄")));
//    ⁄⁄ 2º divicion fecha
    var nPosDos  = ponCero(dFecIni.substr(parseInt(dFecIni.indexOf("⁄")) + 1,parseInt(dFecIni.lastIndexOf("⁄")) - parseInt(dFecIni.indexOf("⁄")) - 1));

    var nPosTres = ponCero(dFecIni.substr(parseInt(dFecIni.lastIndexOf("⁄")) + 1));

    switch(nTipFormat){
        case 1 :   
            dReturnFecha = nPosTres + "" + nPosDos + "" + nPosUno;
            break;

        case 2 :  
            dReturnFecha = nPosTres + "" + nPosUno + "" +nPosDos;
            break;

        case 3 :   
           dReturnFecha = nPosUno + "" + nPosDos + "" +nPosTres;
            break;

       case 4 :   
            dReturnFecha = nPosUno + "" + nPosTres + "" +nPosDos;
             break;
     }

    return dReturnFecha;  
 }

 

function ponCero(strPon){
     if(parseInt(strPon.length) < 2)
        strPon = "0" + strPon;
    return strPon;
 }




 function comparaFecha(dFormat,dFecMenor, dFecMayor){
     dFecMenor = invFecha(dFormat,dFecMenor);
     dFecMayor = invFecha(dFormat,dFecMayor);

     if(dFecMenor > dFecMayor)
         return false;
     else
         return true;
 }

 function validaFecha( con_listview ){
     var dFechaMenor = con_listview.dFecMenor.value;
     var dFechaMayor = con_listview.dFecMayor.value;

     if(comparaFecha( formato,dFechaMenor,dFechaMayor) == true)
         a=b
     else
         alert("Error. la fecha de Inscripción no debe ser mayor a la finalización");
 }



//****************************




function upperCase(b)
{
var x=document.getElementById(b).value;
document.getElementById(b).value = x.toUpperCase();
}

function cambiar(obj) { // la primera letra es mayuscula
  txt = obj.value;
  txt = txt.substr(0,1).toUpperCase()+txt.substr(1,txt.length).toLowerCase();
  obj.value = txt;
}

function recargar()
{


    // frmPlanilla.action = "http://192.168.1.199/desarrolloidyt/index.php/con_listview/view_reg_contrt_1";
     //alert(document.frmPlanilla.estados.value);
     frmPlanilla.submit();
}

function enviar(op,pk,bse){
 
		switch (op){
			case 1:{ 
                   //  alert('Operación Exitosa!!');
          
			document.form_legal.action =  bse+"index.php/con_consult_regco";
            document.form_legal.submit();
			break;
			}
			
			case 2:{
			document.form_legal.action = bse+"index.php/con_reg_3/index/"+pk+"/0/new";
			document.form_legal.submit();
			break;
			}

			case 3:{
			document.form_personas.action = bse+"index.php/con_reg_5/index/"+pk+"/0/new";
			document.form_personas.submit();
			break;
			}
            case 4:{
			document.form_contratos.action = bse+"index.php/con_consult_regco";
			document.form_contratos.submit();
			break;
			}
        
            case 5:{
			document.form_sucursal.action = bse+"index.php/con_reg_6/index/"+pk+"/0/new";
			document.form_sucursal.submit();
			break;
			}

            case 6:{
			document.form_personas.action = bse+"index.php/con_consult_regco";
			document.form_personas.submit();
			break;
			}
             case 7:{
			document.form_sucursal.action = bse+"index.php/con_consult_regco";
			document.form_sucursal.submit();
			break;
			}

             case 8:{

            //document.form_contratos.action = "http://idyt38/regco/index.php/Con_reportes/rep_inscripcion/"+pk+"";
               window.open(bse+"index.php/Con_reportes/rep_inscripcion/"+pk+"");
               document.form_contratos.action = bse+"index.php/con_listview_Contratistas";
               document.form_contratos.submit();
			break;
			}

            case 9:{

			document.form_contratos.action = bse+"index.php/con_consult_regco";
			document.form_contratos.submit();
			break;
			}




        }
}




function Alternar(Seccion){
    if (Seccion.style.display=="none")

    {
        Seccion.style.display=""
    }
      else{ Seccion.style.display="none"}
}






function MM_callJS(jsStr) { //v2.0
  return eval(jsStr)
  
}


function numeroValido()
{
      var f = document.con_listview;
   
      if (f.numEmp.value < 1)
        {
            alert("Recuerde debe colocar al menos un (1) empleado");
           // f.numEmp.value="";
          //  f.numEmp.focus();
        }    

     
   

}



function siglas() //un minimo de 10 caracteres en las siglas
{
    var f = document.con_listview;
    var aux = f.siglas.value;

if (aux.length > 10)
  {
   alert("Debe Introdicir Hasta un Maximo de Diez (10) Caracteres");
   f.siglas.value = "";
   f.siglas.focus();
  }

}

function validar()
	{//var f = document.frmPlanilla;

		//window.location.href = "/rnc/aspcode/validarRif.asp?rifced=" + f.rifCed.value;

	}

		

				
				
				function validarForm()
				{
					var param = "consEdo=1";
					var arrFalt = new Array();
					var tp = false;
					var f = document.frmPlanilla;
					var hayObjEmp = false;
					if (f.rifCed.value.length)
						param = param + "&rifCed=" + escape(f.rifCed.value);
					else
						arrFalt[arrFalt.length] = "Rif o C&eacute;dula";
					if (f.confRif.value.length)
						param = param + "&confRif=" + escape(f.confRif.value);
					if (f.nombre.value.length)
						param = param + "&nombre=" +  escape(f.nombre.value);
					else
						arrFalt[arrFalt.length] = "Nombre o Razon Social";
					for (var i=0; i < f.esNatural.length; i++)
					{
						if (f.esNatural[i].checked)
						{
							param = param + "&esNatural=" + f.esNatural[i].value;
							tp = true;
						}
					}
					if (!tp)
						arrFalt[arrFalt.length] = "Tipo de Persona";

					if (f.idDenCom.value != "0")
						param = param + "&idDenCom=" + f.idDenCom.value;
					else
						arrFalt[arrFalt.length] = "Denominaci&oacute;n Comercial";

					if (f.siglas.value.length)
						param = param + "&siglas=" + escape(f.siglas.value);

					if (f.provF.checked)
					{
						param = param + "&provF=" + f.provF.value;
						hayObjEmp = true;
					}

					if (f.provD.checked)
					{
						param = param + "&provD=" + f.provD.value;
						hayObjEmp = true;
					}

					if (f.provA.checked)
					{
						param = param + "&provA=" + f.provA.value;
						hayObjEmp = true;
					}

					if (f.obras.checked)
					{
						param = param + "&obras=" + f.obras.value;
						hayObjEmp = true;
					}

					if (f.servN.checked)
					{
						param = param + "&servN=" + f.servN.value;
						hayObjEmp = true;
					}

					if (f.servA.checked)
					{
						param = param + "&servA=" + f.servA.value;
						hayObjEmp = true;
					}

					if (!hayObjEmp)
						arrFalt[arrFalt.length] = "Objeto de Empresa";

					var oprn = false;
					for (var i=0; i < f.codTipAct.length; i++)
					{
						if (f.codTipAct[i].checked)
						{
							param = param + "&codTipAct=" + f.codTipAct[i].value;
							oprn = true;
						}
					}
					if (!oprn)
						arrFalt[arrFalt.length] = "Objeto de Empresa - Principal"
					if (f.numEmp.value.length)
						param = param + "&numEmp=" + f.numEmp.value;
					else
						arrFalt[arrFalt.length] = "N&uacute;mero de Empleados";
					if (f.infDom1.value.length)
						param = param + "&infDom1=" + escape(f.infDom1.value);
					else
						arrFalt[arrFalt.length] = "Sector/Zona/Urbanizaci&oacute;n"
					if (f.infDom2.value.length)
						param = param + "&infDom2=" + escape(f.infDom2.value);
					if (f.infDom3.value.length)
						param = param + "&infDom3=" + escape(f.infDom3.value);
					if (f.infDom4.value.length)
						param = param + "&infDom4=" + escape(f.infDom4.value);
					if (f.idEstado.value != "0")
						param = param + "&idEstado=" + f.idEstado.value;
					else
						arrFalt[arrFalt.length] = "Estado";
					if ((f.codUG.value != "0") && (f.codUG.value != null))
						param = param + "&codUG=" + f.codUG.value;
					else
						arrFalt[arrFalt.length] = "Municipio";
					if ((f.idCiu.value != "0") && (f.idCiu.value != null))
						param = param + "&idCiu=" + f.idCiu.value;
					if (f.perContacto.value.length)
						param = param + "&perContacto=" + escape(f.perContacto.value);
					else
						arrFalt[arrFalt.length] = "Persona de Contacto Directo"
					if (f.telFijo.value.length)
						param = param + "&telFijo=" + escape(f.telFijo.value);
					else
						arrFalt[arrFalt.length] = "Tel&eacute;fono fijo";
					if (f.telMovil.value.length)
						param = param + "&telMovil=" + escape(f.telMovil.value);
					if (f.telFax.value.length)
						param = param + "&telFax=" + escape(f.telFax.value);
					if (f.website.value.length)
						param = param + "&website=" + escape(f.website.value);
					if (arrFalt.length)
					{
						param = param + "&msg=3&codMsg=0006"
						for (var j = 0; j < arrFalt.length; j++)
						{
							param = param + "&paramMsg=" + arrFalt[j];
						}
						window.location.href = "planilla.asp?" + param;
						return false;
					}
					else
					{
						if (f.rifCed.value == f.confRif.value)
							return true;
						else
						{
							window.location.href = "planilla.asp?msg=3&codMsg=0016&" + param;
							return false;
						}
					}
				}

                function cargarEdo()
						{
							var param = "1";
							var f = document.con_listview;
							if (f.rifCed.value.length)
								param = param + "&rifCed=" + escape(f.rifCed.value);
							if (f.confRif.value.length)
								param = param + "&confRif=" + escape(f.confRif.value);
							if (f.nombre.value.length)
								param = param + "&nombre=" + escape(f.nombre.value);
							for (var i=0; i < f.esNatural.length; i++)
							{
								if (f.esNatural[i].checked)
									param = param + "&esNatural=" + f.esNatural[i].value;
							}
							if (f.idDenCom.value != "0")
								param = param + "&idDenCom=" + f.idDenCom.value;
							if (f.siglas.value.length)
								param = param + "&siglas=" + escape(f.siglas.value);
							if (f.numEmp.value.length)
								param = param + "&numEmp=" + f.numEmp.value;
							if (f.provF.checked)
								param = param + "&provF=" + f.provF.value;
							if (f.provD.checked)
								param = param + "&provD=" + f.provD.value;
							if (f.provA.checked)
								param = param + "&provA=" + f.provA.value;
							if (f.obras.checked)
								param = param + "&obras=" + f.obras.value;
							if (f.servN.checked)
								param = param + "&servN=" + f.servN.value;
							if (f.servA.checked)
								param = param + "&servA=" + f.servA.value;
							for (var i=0; i < f.codTipAct.length; i++)
								if (f.codTipAct[i].checked)
									param = param + "&codTipAct=" + f.codTipAct[i].value;
							if (f.infDom1.value.length)
								param = param + "&infDom1=" + escape(f.infDom1.value);
							if (f.infDom2.value.length)
								param = param + "&infDom2=" + escape(f.infDom2.value);
							if (f.infDom3.value.length)
								param = param + "&infDom3=" + escape(f.infDom3.value);
							if (f.infDom4.value.length)
								param = param + "&infDom4=" + escape(f.infDom4.value);
							if (f.idEstado.value != "0")
								param = param + "&idEstado=" + f.idEstado.value;
							if (f.perContacto.value.length)
								param = param + "&perContacto=" + escape(f.perContacto.value);
							if (f.telFijo.value.length)
								param = param + "&telFijo=" + escape(f.telFijo.value);
							if (f.telMovil.value.length)
								param = param + "&telMovil=" + escape(f.telMovil.value);
							if (f.telFax.value.length)
								param = param + "&telFax=" + escape(f.telFax.value);
							if (f.website.value.length)
								param = param + "&website=" + escape(f.website.value);
							window.location.href = "regcontratista_1.php?" + param + "#estado";
						}
