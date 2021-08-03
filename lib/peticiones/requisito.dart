


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:master_jobz/helpers/environment.dart';
import 'package:master_jobz/models/requisitos_response.dart';
import 'package:master_jobz/peticiones/auth.dart';

class RequisitoProvider with ChangeNotifier{

  
  Future getRequerimientos(String id)async{
    final url = Uri.parse('${Environment.baseURL}/requisito/$id');
    final String? token = await Auth.getToken();
    final resp =await  http.get(url, headers: {
      'Content-type':'application/json',
      'x-token': token.toString()
    });

    if(resp.statusCode == 200){
      final requisitosResponse = requisitosResponseFromJson(resp.body);
      return requisitosResponse.requisitos;
    }
  }

}