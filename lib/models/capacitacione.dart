// To parse this JSON data, do
//
//     final capacitacione = capacitacioneFromJson(jsonString);

import 'dart:convert';

Capacitacione capacitacioneFromJson(String str) => Capacitacione.fromJson(json.decode(str));

String capacitacioneToJson(Capacitacione data) => json.encode(data.toJson());

class Capacitacione {
    Capacitacione({
        required this.id,
        required this.establecimiento,
        required this.tema,
        required this.inicio,
        required this.termino,
        required this.v,
    });

    String id;
    String establecimiento;
    String tema;
    DateTime inicio;
    DateTime termino;
    int v;

    factory Capacitacione.fromJson(Map<String, dynamic> json) => Capacitacione(
        id: json["_id"],
        establecimiento: json["establecimiento"],
        tema: json["tema"],
        inicio: DateTime.parse(json["inicio"]),
        termino: DateTime.parse(json["final"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "establecimiento": establecimiento,
        "tema": tema,
        "inicio": inicio.toIso8601String(),
        "final": termino.toIso8601String(),
        "__v": v,
    };
}
