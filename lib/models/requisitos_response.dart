// To parse this JSON data, do
//
//     final requisitoResponse = requisitoResponseFromJson(jsonString);

import 'dart:convert';

import 'package:master_jobz/models/requisito.dart';

RequisitoResponse requisitosResponseFromJson(String str) => RequisitoResponse.fromJson(json.decode(str));

String requisitosResponseToJson(RequisitoResponse data) => json.encode(data.toJson());

class RequisitoResponse {
    RequisitoResponse({
        required this.ok,
        required this.requisitos,
    });

    bool ok;
    List<Requisito> requisitos;

    factory RequisitoResponse.fromJson(Map<String, dynamic> json) => RequisitoResponse(
        ok: json["ok"],
        requisitos: List<Requisito>.from(json["requisitos"].map((x) => Requisito.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "requisitos": List<dynamic>.from(requisitos.map((x) => x.toJson())),
    };
}
