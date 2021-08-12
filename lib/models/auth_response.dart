// To parse this JSON data, do
//
//     final authResponse = authResponseFromJson(jsonString);

import 'dart:convert';

import 'package:master_jobz/models/usuario.dart';


AuthResponse authResponseFromJson(String str) => AuthResponse.fromJson(json.decode(str));

String authResponseToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
    AuthResponse({
        required this.ok,
        required this.usuario,
        required this.token,
    });

    bool ok;
    Usuario usuario;
    String token;

    factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        ok: json["ok"],
        usuario: Usuario.fromJson(json["usuario"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "usuario": usuario.toJson(),
        "token": token,
    };
}






