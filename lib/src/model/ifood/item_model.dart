/*
Title: T2Ti ERP 3.0                                                                
Description: Classe para tratar entidade iFood
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2022 T2Ti.COM                                          
                                                                                
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
import 'dart:convert';

import 'package:my_pdv/src/model/model.dart';

class ItemModel {
  int? index;
  String? id;
  String? name;
  String? imageUrl;
  String? externalCode;
  String? ean;
  String? unit;
  double? quantity;
  double? unitPrice;
  double? addition;
  double? price;
  double? optionsPrice;
  double? totalPrice;
  String? observations;
  List<OptionModel>? options = [];

	ItemModel({
		this.index,
		this.id,
		this.name,
		this.imageUrl,
		this.externalCode,
		this.ean,
		this.unit,
		this.quantity,
		this.unitPrice,
		this.addition,
		this.price,
		this.optionsPrice,
		this.totalPrice,
		this.observations,
		this.options,
	});

	ItemModel.fromJson(Map<String, dynamic> jsonDados) {
		index = jsonDados['index'];
		id = jsonDados['id'];
		name = jsonDados['name'];
		imageUrl = jsonDados['imageUrl'];
		externalCode = jsonDados['externalCode'];
		ean = jsonDados['ean'];
		unit = jsonDados['unit'];
		quantity = jsonDados['quantity']?.toDouble();
		unitPrice = jsonDados['unitPrice']?.toDouble();
		addition = jsonDados['addition']?.toDouble();
		price = jsonDados['price']?.toDouble();
		optionsPrice = jsonDados['optionsPrice']?.toDouble();
		totalPrice = jsonDados['totalPrice']?.toDouble();
		observations = jsonDados['observations'];
		options = (jsonDados['options'] as Iterable?)?.map((m) => OptionModel.fromJson(m)).toList() ?? [];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['index'] = index;
		jsonDados['id'] = id;
		jsonDados['name'] = name;
		jsonDados['imageUrl'] = imageUrl;
		jsonDados['externalCode'] = externalCode;
		jsonDados['ean'] = ean;
		jsonDados['unit'] = unit;
		jsonDados['quantity'] = quantity;
		jsonDados['unitPrice'] = unitPrice;
		jsonDados['addition'] = addition;
		jsonDados['price'] = price;
		jsonDados['optionsPrice'] = optionsPrice;
		jsonDados['totalPrice'] = totalPrice;
		jsonDados['observations'] = observations;

		var listaOptions = [];
		for (OptionModel objeto in options ?? []) {
			listaOptions.add(objeto.toJson);
		}
		jsonDados['options'] = listaOptions;

		return jsonDados;
	}
 
	String objetoEncodeJson() {
	  final jsonDados = toJson;
	  return json.encode(jsonDados);
	}
	
}