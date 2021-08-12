// To parse this JSON data, do
//
//     final empleoResponse = empleoResponseFromJson(jsonString);

import 'dart:convert';

import 'package:master_jobz/models/empleo.dart';

EmpleoResponse empleoResponseFromJson(String str) => EmpleoResponse.fromJson(json.decode(str));

String empleoResponseToJson(EmpleoResponse data) => json.encode(data.toJson());

class EmpleoResponse {
    EmpleoResponse({
        required this.ok,
        required this.empleo,
    });

    bool ok;
    Empleo empleo;

    factory EmpleoResponse.fromJson(Map<String, dynamic> json) => EmpleoResponse(
        ok: json["ok"],
        empleo: Empleo.fromJson(json["empleo"]),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "empleo": empleo.toJson(),
    };
}

