// To parse this JSON data, do
//
//     final postulanteResponse = postulanteResponseFromJson(jsonString);

import 'dart:convert';

import 'package:master_jobz/models/postulantes_response.dart';

PostulanteResponse postulanteResponseFromJson(String str) => PostulanteResponse.fromJson(json.decode(str));

String postulanteResponseToJson(PostulanteResponse data) => json.encode(data.toJson());

class PostulanteResponse {
    PostulanteResponse({
        required this.ok,
        required this.idUser,
    });

    bool ok;
    String idUser;

    factory PostulanteResponse.fromJson(Map<String, dynamic> json) => PostulanteResponse(
        ok: json["ok"],
        idUser: json["idUser"],
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "idUser": idUser,
    };
}

