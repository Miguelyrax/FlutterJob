


import 'package:flutter/material.dart';
import 'package:master_jobz/helpers/environment.dart';
import 'package:http/http.dart' as http;
import 'package:master_jobz/models/postulantes_response.dart';
import 'package:master_jobz/peticiones/auth.dart';

class Postulantes with ChangeNotifier {
  List<Postulante> postulantes = [];
  Postulante? postulante;
  Future getPostulantes(String id)async{
    final url = Uri.parse('${Environment.baseURL}/postulantes/$id');
    final String? token = await Auth.getToken();
    final resp = await http.get(url,headers: {
      'Content-type':'application/json',
      'x-token':token.toString()
    });
  
    if(resp.statusCode == 200){
      final postulantesResponse = postulantesResponseFromJson(resp.body);
      postulantes = postulantesResponse.postulantes;
      return postulantes;
    }
    
  }

}