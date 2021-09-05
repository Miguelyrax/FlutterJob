// To parse this JSON data, do
//
//     final requerimiento = requerimientoFromJson(jsonString);

// To parse this JSON data, do
//
//     final requerimiento = requerimientoFromJson(jsonString);

import 'dart:convert';

import 'package:master_jobz/models/requisito.dart';

Requerimiento requerimientoFromJson(String str) => Requerimiento.fromJson(json.decode(str));

String requerimientoToJson(Requerimiento data) => json.encode(data.toJson());

class Requerimiento {
    Requerimiento({
        required this.requisitos,
        required this.id,
        required this.title,
        required this.idJob,
        required this.v,
    });

    List<Requisito> requisitos;
    String id;
    String title;
    String idJob;
    double total =0;
    double suma =0;
    bool status =false;
    bool estado =false;
    int v;

    factory Requerimiento.fromJson(Map<String, dynamic> json) => Requerimiento(
        requisitos: List<Requisito>.from(json["requisitos"].map((x) => Requisito.fromJson(x))),
        id: json["_id"],
        title: json["title"],
        idJob: json["idJob"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "requisitos": List<dynamic>.from(requisitos.map((x) => x.toJson())),
        "_id": id,
        "title": title,
        "idJob": idJob,
        "__v": v,
    };
}


