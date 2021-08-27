// To parse this JSON data, do
//
//     final postulantesResponse = postulantesResponseFromJson(jsonString);

import 'dart:convert';

import 'package:master_jobz/models/requisito.dart';
import 'package:master_jobz/models/usuario.dart';

PostulantesResponse postulantesResponseFromJson(String str) => PostulantesResponse.fromJson(json.decode(str));

String postulantesResponseToJson(PostulantesResponse data) => json.encode(data.toJson());

class PostulantesResponse {
    PostulantesResponse({
        required this.ok,
        required this.postulantes,
    });

    bool ok;
    List<Postulante> postulantes;

    factory PostulantesResponse.fromJson(Map<String, dynamic> json) => PostulantesResponse(
        ok: json["ok"],
        postulantes: List<Postulante>.from(json["postulantes"].map((x) => Postulante.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "postulantes": List<dynamic>.from(postulantes.map((x) => x.toJson())),
    };
}

class Postulante {
    Postulante({
        required this.status,
        required this.requisitos,
        required this.id,
        required this.idJob,
        required this.usuario,
        required this.v,
    });

    bool status;
    List<Requisito> requisitos;
    String id;
    String idJob;
    Usuario usuario;
    int v;

    factory Postulante.fromJson(Map<String, dynamic> json) => Postulante(
        status: json["status"],
        requisitos: List<Requisito>.from(json["requisitos"].map((x) => Requisito.fromJson(x))),
        id: json["_id"],
        idJob: json["idJob"],
        usuario: Usuario.fromJson(json["idUser"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "requisitos": List<dynamic>.from(requisitos.map((x) => x.toJson())),
        "_id": id,
        "idJob": idJob,
        "idUser": usuario.toJson(),
        "__v": v,
    };
}

