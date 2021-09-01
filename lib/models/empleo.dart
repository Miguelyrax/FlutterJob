// To parse this JSON data, do
//
//     final empleo = empleoFromJson(jsonString);

import 'dart:convert';

Empleo empleoFromJson(String str) => Empleo.fromJson(json.decode(str));

String empleoToJson(Empleo data) => json.encode(data.toJson());

class Empleo {
    Empleo({
        required this.id,
        required this.empresa,
        required this.cargo,
        required this.description,
        required this.inicio,
        required this.termino,
        required this.v,
    });

    String id;
    String empresa;
    String cargo;
    String description;
    DateTime inicio;
    DateTime termino;
    int v;

    factory Empleo.fromJson(Map<String, dynamic> json) => Empleo(
        id: json["_id"],
        empresa: json["empresa"],
        cargo: json["cargo"],
        description: json["description"],
        inicio: DateTime.parse(json["inicio"]),
        termino: DateTime.parse(json["final"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "empresa": empresa,
        "cargo": cargo,
        "description": description,
        "inicio": inicio.toIso8601String(),
        "final": termino.toIso8601String(),
        "__v": v,
    };
}
