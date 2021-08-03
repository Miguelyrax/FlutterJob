// To parse this JSON data, do
//
//     final requerimientoResponse = requerimientoResponseFromJson(jsonString);

import 'dart:convert';

import 'package:master_jobz/models/requerimiento.dart';

// To parse this JSON data, do
//
//     final requerimientoResponse = requerimientoResponseFromJson(jsonString);


RequerimientoResponse requerimientosResponseFromJson(String str) => RequerimientoResponse.fromJson(json.decode(str));

String requerimientosResponseToJson(RequerimientoResponse data) => json.encode(data.toJson());

class RequerimientoResponse {
    RequerimientoResponse({
        required this.ok,
        required this.requerimiento,
    });

    bool ok;
    List<Requerimiento> requerimiento;

    factory RequerimientoResponse.fromJson(Map<String, dynamic> json) => RequerimientoResponse(
        ok: json["ok"],
        requerimiento: List<Requerimiento>.from(json["requerimiento"].map((x) => Requerimiento.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "requerimiento": List<dynamic>.from(requerimiento.map((x) => x.toJson())),
    };
}



