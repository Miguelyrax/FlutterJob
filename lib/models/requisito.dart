// To parse this JSON data, do
//
//     final requisito = requisitoFromJson(jsonString);

import 'dart:convert';

Requisito requisitoFromJson(String str) => Requisito.fromJson(json.decode(str));

String requisitoToJson(Requisito data) => json.encode(data.toJson());

class Requisito {
    Requisito({
        required this.id,
        required this.requisito,
        required this.idRequerimiento,
        required this.v,
    });

    String id;
    String requisito;
    String idRequerimiento;
    bool status = false;
   
    int v;

    factory Requisito.fromJson(Map<String, dynamic> json) => Requisito(
        id: json["_id"],
        requisito: json["requisito"],
        idRequerimiento: json["idRequerimiento"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "requisito": requisito,
        "idRequerimiento": idRequerimiento,
        "__v": v,
    };
}
