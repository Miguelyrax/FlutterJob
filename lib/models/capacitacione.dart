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
        required this.v,
    });

    String id;
    String establecimiento;
    String tema;
    int v;

    factory Capacitacione.fromJson(Map<String, dynamic> json) => Capacitacione(
        id: json["_id"],
        establecimiento: json["establecimiento"],
        tema: json["tema"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "establecimiento": establecimiento,
        "tema": tema,
        "__v": v,
    };
}
