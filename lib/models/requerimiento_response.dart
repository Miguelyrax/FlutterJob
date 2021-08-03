// To parse this JSON data, do
//
//     final requerimientoResponse = requerimientoResponseFromJson(jsonString);

import 'dart:convert';

import 'package:master_jobz/models/requerimiento.dart';

RequerimientoResponse requerimientoResponseFromJson(String str) => RequerimientoResponse.fromJson(json.decode(str));

String requerimientoResponseToJson(RequerimientoResponse data) => json.encode(data.toJson());

class RequerimientoResponse {
    RequerimientoResponse({
        required this.ok,
        required this.requerimiento,
    });

    bool ok;
    Requerimiento requerimiento;

    factory RequerimientoResponse.fromJson(Map<String, dynamic> json) => RequerimientoResponse(
        ok: json["ok"],
        requerimiento: Requerimiento.fromJson(json["requerimiento"]),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "requerimiento": requerimiento.toJson(),
    };
}

