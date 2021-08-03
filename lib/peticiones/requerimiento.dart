


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:master_jobz/helpers/environment.dart';
import 'package:master_jobz/models/requerimiento.dart';
import 'package:master_jobz/models/requerimientos_response.dart';
import 'package:master_jobz/peticiones/auth.dart';

class RequerimientoProvider with ChangeNotifier{
  
  
  Future getRequerimientos(String id)async{
    final url = Uri.parse('${Environment.baseURL}/requerimiento/$id');
    final String? token = await Auth.getToken();
    final resp =await  http.get(url, headers: {
      'Content-type':'application/json',
      'x-token': token.toString()
    });

    if(resp.statusCode == 200){
      
      final requisitosResponse = requerimientosResponseFromJson(resp.body);
      return requisitosResponse.requerimiento;
    }
  }
  Future newRequerimiento(String id, String title)async{
    final data = {
      "title":title
    };
    final url = Uri.parse('${Environment.baseURL}/requerimiento/$id');
    final String? token = await Auth.getToken();
    final resp =await  http.post(url, headers: {
      'Content-type':'application/json',
      'x-token': token.toString()
    },
    body: jsonEncode(data));

    if(resp.statusCode == 200){
      
      final requisitosResponse = requerimientosResponseFromJson(resp.body);
      return requisitosResponse.requerimiento;
    }
  }

}