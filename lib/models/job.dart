// To parse this JSON data, do
//
//     final job = jobFromJson(jsonString);

import 'dart:convert';

import 'package:master_jobz/models/requerimiento.dart';

Job jobFromJson(String str) => Job.fromJson(json.decode(str));

String jobToJson(Job data) => json.encode(data.toJson());

class Job {
    Job({
        required this.status,
        required this.requerimientos,
        required this.postulantes,
        required this.id,
        required this.title,
        required this.subtitle,
        required this.description,
         this.totalRequerido,
        required this.idUser,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    String status;
    List<Requerimiento> requerimientos;
    List<String> postulantes;
    String id;
    String title;
    String subtitle;
    String description;
    int? totalRequerido;
    String idUser;
    int v;
    DateTime createdAt;
    DateTime updatedAt;

    factory Job.fromJson(Map<String, dynamic> json) => Job(
        status: json["status"],
        requerimientos: List<Requerimiento>.from(json["requerimientos"].map((x) => Requerimiento.fromJson(x))),
        postulantes: List<String>.from(json["postulantes"].map((x) => x)),
        id: json["_id"],
        title: json["title"],
        subtitle: json["subtitle"],
        description: json["description"],
        totalRequerido: json["totalRequerido"],
        idUser: json["idUser"],
        createdAt:DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "requerimientos": List<dynamic>.from(requerimientos.map((x) => x.toJson())),
        "postulantes": List<dynamic>.from(postulantes.map((x) => x)),
        "_id": id,
        "title": title,
        "subtitle": subtitle,
        "description": description,
        "totalRequerido": totalRequerido,
        "idUser": idUser,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

