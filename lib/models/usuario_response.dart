// To parse this JSON data, do
//
//     final usuarioResponse = usuarioResponseFromJson(jsonString);

import 'dart:convert';

import 'package:master_jobz/models/usuario.dart';

UsuarioResponse usuarioResponseFromJson(String str) => UsuarioResponse.fromJson(json.decode(str));

String usuarioResponseToJson(UsuarioResponse data) => json.encode(data.toJson());

class UsuarioResponse {
    UsuarioResponse({
        required this.ok,
        required this.usuario,
    });

    bool ok;
    Usuario usuario;

    factory UsuarioResponse.fromJson(Map<String, dynamic> json) => UsuarioResponse(
        ok: json["ok"],
        usuario: Usuario.fromJson(json["usuario"]),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "usuario": usuario.toJson(),
    };
}

