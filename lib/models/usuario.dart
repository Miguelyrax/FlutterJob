// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

import 'package:master_jobz/models/capacitacione.dart';
import 'package:master_jobz/models/empleo.dart';
import 'package:master_jobz/models/habilidad.dart';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
    Usuario({
        required this.status,
        required this.online,
        required this.empleos,
        required this.habilidades,
        required this.capacitaciones,
        required this.id,
        required this.nombre,
        required this.apellido,
        required this.email,
        required this.password,
        required this.profesion,
        required this.telefono,
        required this.role,
        required this.v,
    });

    bool status;
    String online;
    List<Empleo> empleos;
    List<Habilidad> habilidades;
    List<Capacitacione> capacitaciones;
    String id;
    String nombre;
    String apellido;
    String email;
    String password;
    String profesion;
    String telefono;
    String role;
    int v;

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        status: json["status"],
        online: json["online"],
        empleos: List<Empleo>.from(json["empleos"].map((x) => Empleo.fromJson(x))),
        habilidades: List<Habilidad>.from(json["habilidades"].map((x) => Habilidad.fromJson(x))),
        capacitaciones: List<Capacitacione>.from(json["capacitaciones"].map((x) => Capacitacione.fromJson(x))),
        id: json["_id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        email: json["email"],
        password: json["password"],
        profesion: json["profesion"],
        telefono: json["telefono"],
        role: json["role"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "online": online,
        "empleos": List<dynamic>.from(empleos.map((x) => x.toJson())),
        "habilidades": List<dynamic>.from(habilidades.map((x) => x.toJson())),
        "capacitaciones": List<dynamic>.from(capacitaciones.map((x) => x.toJson())),
        "_id": id,
        "nombre": nombre,
        "apellido": apellido,
        "email": email,
        "password": password,
        "profesion": profesion,
        "telefono": telefono,
        "role": role,
        "__v": v,
    };
}