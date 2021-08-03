// To parse this JSON data, do
//
//     final requisitoResponse = requisitoResponseFromJson(jsonString);

import 'dart:convert';

import 'package:master_jobz/models/requisito.dart';

RequisitoResponse requisitoResponseFromJson(String str) => RequisitoResponse.fromJson(json.decode(str));

String requisitoResponseToJson(RequisitoResponse data) => json.encode(data.toJson());

class RequisitoResponse {
    RequisitoResponse({
        required this.ok,
        required this.requisito,
    });

    bool ok;
    Requisito requisito;

    factory RequisitoResponse.fromJson(Map<String, dynamic> json) => RequisitoResponse(
        ok: json["ok"],
        requisito: Requisito.fromJson(json["requisito"]),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "requisito": requisito.toJson(),
    };
}

