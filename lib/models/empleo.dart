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
        required this.v,
    });

    String id;
    String empresa;
    String cargo;
    String description;
    int v;

    factory Empleo.fromJson(Map<String, dynamic> json) => Empleo(
        id: json["_id"],
        empresa: json["empresa"],
        cargo: json["cargo"],
        description: json["description"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "empresa": empresa,
        "cargo": cargo,
        "description": description,
        "__v": v,
    };
}
