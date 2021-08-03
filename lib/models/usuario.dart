// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
    Usuario({
        required this.status,
        required this.google,
        required this.online,
        required this.id,
        required this.nombre,
        required this.email,
        required this.password,
        required this.role,
        required this.v,
    });

    bool status;
    bool google;
    String online;
    String id;
    String nombre;
    String email;
    String password;
    String role;
    int v;

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        status: json["status"],
        google: json["google"],
        online: json["online"],
        id: json["_id"],
        nombre: json["nombre"],
        email: json["email"],
        password: json["password"],
        role: json["role"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "google": google,
        "online": online,
        "_id": id,
        "nombre": nombre,
        "email": email,
        "password": password,
        "role": role,
        "__v": v,
    };
}
