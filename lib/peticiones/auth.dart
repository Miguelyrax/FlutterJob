import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:master_jobz/helpers/environment.dart';
import 'package:master_jobz/models/auth_response.dart';
import 'package:master_jobz/models/usuario.dart';

class Auth with ChangeNotifier{
  Usuario? usuario;

  final _storage = FlutterSecureStorage();

  static Future<String?> getToken() async{
  final _storage = FlutterSecureStorage();
  final token = await _storage.read(key: 'token');
  return token;
  }
  
  Future<bool> login(String user, String password)async{
  final url = Uri.parse('${Environment.baseURL}/auth/');
  final data = {
    "email":user,
    "password":password
  };
  final resp = await http.post(url, headers: {
    'Content-type':'application/json'
  },
  body: jsonEncode(data));

  if(resp.statusCode == 200){
    final authResponse = authResponseFromJson(resp.body);
    usuario = authResponse.usuario;
    await guardarToken(authResponse.token); 
    return true;
  }
  return false;
}
  Future<bool> renew()async{
  final url = Uri.parse('${Environment.baseURL}/auth/renew');
  final String? token = await _storage.read(key: 'token');
  final resp = await http.get(url, headers: {
    'Content-type':'application/json',
    'x-token': token.toString()
  } 
  );
  
  if(resp.statusCode == 200){
    final authResponse = authResponseFromJson(resp.body);
    usuario = authResponse.usuario;
    await guardarToken(authResponse.token); 
    return true;
  }
  return false;
}

  Future guardarToken(String token) async{
    return await _storage.write(key: 'token', value: token);
 
  }
  Future logout() async{
    return await _storage.delete(key: 'token');
  }



}

