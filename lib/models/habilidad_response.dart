// To parse this JSON data, do
//
//     final habilidadResponse = habilidadResponseFromJson(jsonString);

import 'dart:convert';

import 'habilidad.dart';

HabilidadResponse habilidadResponseFromJson(String str) => HabilidadResponse.fromJson(json.decode(str));

String habilidadResponseToJson(HabilidadResponse data) => json.encode(data.toJson());

class HabilidadResponse {
    HabilidadResponse({
        required this.ok,
        required this.habilidad,
    });

    bool ok;
    Habilidad habilidad;

    factory HabilidadResponse.fromJson(Map<String, dynamic> json) => HabilidadResponse(
        ok: json["ok"],
        habilidad: Habilidad.fromJson(json["habilidad"]),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "habilidad": habilidad.toJson(),
    };
}
