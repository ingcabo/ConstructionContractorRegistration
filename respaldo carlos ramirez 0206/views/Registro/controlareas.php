

<script language="JavaScript">



		function objClick(checkbox)
				{
					var f = document.frmPlanilla;
					if (!checkbox.checked)
						switch(checkbox.name)
						{
							case "provF":
								f.codTipAct[0].checked = false;
								break;
							case "provD":
								f.codTipAct[1].checked = false;
								break;
							case "provA":
								f.codTipAct[2].checked = false;
								break;
							case "obras":
								f.codTipAct[3].checked = false;
								break;
							case "servN":
								f.codTipAct[4].checked = false;
								break;
							case "servA":
								f.codTipAct[5].checked = false;
								break;
						}
				}

				function objPrinClick(radio)
				{
					var f = document.frmPlanilla;
					if (radio.checked)
						switch (radio.value)
						{
							case "01":
								f.provF.checked = true;
								break;
							case "02":
								f.provD.checked = true;
								break;
							case "03":
								f.provA.checked = true;
								break;
							case "04":
								f.obras.checked = true;
								break;
							case "05":
								f.servN.checked = true;
								break;
							case "06":
								f.servA.checked = true;
								break;
						}
				}




</script>

 







 <tr>
                            <td colspan="5" class="titTabla">Proveedor</td>
                            <td rowspan="7" align="center" class="textNormal" valign="middle">
                              <div align="center">Debe seleccionar al menos un
                                objeto de empresa e indicar cual de ellos es el
                                objeto principal</div>
                            </td>
                          </tr>

                          <tr>
                            <td width="4%">&nbsp;</td>
                            <td class="etiqueta" width="29%">Fabricante</td>
                            <td width="8%">&nbsp;</td>
                            <td width="11%">
                              <div align="center">
                                <input type="checkbox" name="provF" value="1" onclick="objClick(this)">
                              </div>
                            </td>
                            <td width="16%">
                              <div align="center">
                                <input type="radio" name="codTipAct" value="01" onclick="objPrinClick(this)">

                              </div>
                            </td>
                          </tr>
                          <tr>
                            <td width="4%">&nbsp;</td>
                            <td class="etiqueta" width="29%">Distribuidor</td>
                            <td width="8%">&nbsp;</td>
                            <td width="11%">
                              <div align="center">
                                <input type="checkbox" name="provD" value="1" onclick="objClick(this)">

                              </div>
                            </td>
                            <td width="16%">
                              <div align="center">
                                <input type="radio" name="codTipAct" value="02" onclick="objPrinClick(this)">
                              </div>
                            </td>
                          </tr>
                          <tr>
                            <td width="4%">&nbsp;</td>

                            <td class="etiqueta" width="29%">Distribuidor Autorizado</td>
                            <td width="8%">&nbsp;</td>
                            <td width="11%">
                              <div align="center">
                                <input type="checkbox" name="provA" value="1" onclick="objClick(this)">
                              </div>
                            </td>
                            <td width="16%">
                              <div align="center">
                                <input type="radio" name="codTipAct" value="03" onclick="objPrinClick(this)">

                              </div>
                            </td>
                          </tr>
                          <tr>
                            <td colspan="5" class="titTabla">Obras</td>
                          </tr>
                          <tr>
                            <td width="4%">&nbsp;</td>
                            <td class="etiqueta" width="29%">Obras</td>

                            <td width="8%">&nbsp;</td>
                            <td width="11%">
                              <div align="center">
                                <input type="checkbox" name="obras" value="1" onclick="objClick(this)">
                              </div>
                            </td>
                            <td width="16%">
                              <div align="center">
                                <input type="radio" name="codTipAct" value="04" onclick="objPrinClick(this)">
                              </div>
                            </td>

                          </tr>
                          <tr>
                            <td colspan="5" class="titTabla">Servicios</td>
                          </tr>
                          <tr>
                            <td width="4%">&nbsp;</td>
                            <td class="etiqueta" width="29%">Servicios</td>
                            <td width="8%">&nbsp;</td>
                            <td width="11%">
                              <div align="center">
                                <input type="checkbox" name="servN" value="1" onclick="objClick(this)">

                              </div>
                            </td>
                            <td width="16%">
                              <div align="center">
                                <input type="radio" name="codTipAct" value="05" onclick="objPrinClick(this)">
                              </div>
                            </td>
                            <td width="32%">&nbsp;</td>
                          </tr>
                          <tr>
                            <td width="4%">&nbsp;</td>

                            <td class="etiqueta" width="29%">Servicios Autorizados</td>
                            <td width="8%">&nbsp;</td>
                            <td width="11%">
                              <div align="center">
                                <input type="checkbox" name="servA" value="1" onclick="objClick(this)">
                              </div>
                            </td>
                            <td width="16%">
                              <div align="center">
                                <input type="radio" name="codTipAct" value="06" onclick="objPrinClick(this)">

                              </div>
                            </td>
                            <td width="32%">&nbsp;</td>
                          </tr>
                        </table>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td width="33%">&nbsp;</td>

                    <td width="2%">&nbsp;</td>
                    <td width="65%">&nbsp;</td>
                  </tr>

