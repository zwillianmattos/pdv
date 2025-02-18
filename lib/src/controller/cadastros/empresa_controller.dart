/*
Title: T2Ti ERP 3.0
Description: Controller utilizado para a Empresa
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2021 T2Ti.COM                                          
                                                                                
Permission is hereby granted, free of charge, to any person                     
obtaining a copy of this software and associated documentation                  
files (the "Software"), to deal in the Software without                         
restriction, including without limitation the rights to use,                    
copy, modify, merge, publish, distribute, sublicense, and/or sell               
copies of the Software, and to permit persons to whom the                       
Software is furnished to do so, subject to the following                        
conditions:                                                                     
                                                                                
The above copyright notice and this permission notice shall be                  
included in all copies or substantial portions of the Software.                 
                                                                                
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,                 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES                 
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND                        
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT                     
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,                    
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING                    
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR                   
OTHER DEALINGS IN THE SOFTWARE.                                                 
                                                                                
       The author may be contacted at:                                          
           t2ti.com@gmail.com                                                   
                                                                                
@author Albert Eije (alberteije@gmail.com)                    
@version 1.0.0
*******************************************************************************/
import 'package:flutter/material.dart';
import 'package:my_pdv/src/infra/infra.dart';
import 'package:my_pdv/src/view/shared/caixas_de_dialogo.dart';

class EmpresaController {

  static void obrigarCadastroCnpj(BuildContext context) {
    if (Sessao.empresa!.cnpj == null || (Sessao.empresa!.registrado == null || Sessao.empresa!.registrado == false)) {
      Navigator.pushNamed(context, '/empresaPersiste',);
      gerarDialogBoxInformacao(context, 'Por favor, informe o CNPJ e demais dados da empresa');
    }
  }

  /// a empresa só pode usar o sistema gratuito se for MEI - (213-5 Empresário Individual)
  static bool podeUsarSistemaGratuito() {
    if (Sessao.empresa!.simei!) {
      return true;
    } else {
      return false;
    }
  }
}