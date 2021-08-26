// To parse this JSON data, do
//
//     final capacitacioneResponse = capacitacioneResponseFromJson(jsonString);

import 'dart:convert';

import 'package:master_jobz/models/capacitacione.dart';

CapacitacioneResponse capacitacioneResponseFromJson(String str) => CapacitacioneResponse.fromJson(json.decode(str));

String capacitacioneResponseToJson(CapacitacioneResponse data) => json.encode(data.toJson());

class CapacitacioneResponse {
    CapacitacioneResponse({
        required this.ok,
        required this.educacion,
    });

    bool ok;
    Capacitacione educacion;

    factory CapacitacioneResponse.fromJson(Map<String, dynamic> json) => CapacitacioneResponse(
        ok: json["ok"],
        educacion: Capacitacione.fromJson(json["educacion"]),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "educacion": educacion.toJson(),
    };
}


