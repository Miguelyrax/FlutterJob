import 'dart:convert';

import 'job.dart';

JobResponse jobResponseFromJson(String str) => JobResponse.fromJson(json.decode(str));

String jobResponseToJson(JobResponse data) => json.encode(data.toJson());

class JobResponse {
    JobResponse({
        required this.ok,
        required this.job,
    });

    bool ok;
    Job job;

    factory JobResponse.fromJson(Map<String, dynamic> json) => JobResponse(
        ok: json["ok"],
        job: Job.fromJson(json["job"]),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "job": job.toJson(),
    };
}