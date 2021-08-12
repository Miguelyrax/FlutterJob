// To parse this JSON data, do
//
//     final habilidad = habilidadFromJson(jsonString);

import 'dart:convert';

Habilidad habilidadFromJson(String str) => Habilidad.fromJson(json.decode(str));

String habilidadToJson(Habilidad data) => json.encode(data.toJson());

class Habilidad {
    Habilidad({
        required this.id,
        required this.habilidad,
        required this.v,
    });

    String id;
    String habilidad;
    int v;

    factory Habilidad.fromJson(Map<String, dynamic> json) => Habilidad(
        id: json["_id"],
        habilidad: json["habilidad"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "habilidad": habilidad,
        "__v": v,
    };
}
