// To parse this JSON data, do
//
//     final jobsResponse = jobsResponseFromJson(jsonString);

import 'dart:convert';

import 'job.dart';

JobsResponse jobsResponseFromJson(String str) => JobsResponse.fromJson(json.decode(str));

String jobsResponseToJson(JobsResponse data) => json.encode(data.toJson());

class JobsResponse {
    JobsResponse({
        required this.ok,
        required this.jobs,
    });

    bool ok;
    List<Job> jobs;

    factory JobsResponse.fromJson(Map<String, dynamic> json) => JobsResponse(
        ok: json["ok"],
        jobs: List<Job>.from(json["jobs"].map((x) => Job.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "jobs": List<dynamic>.from(jobs.map((x) => x.toJson())),
    };
}

