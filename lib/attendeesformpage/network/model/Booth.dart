// To parse this JSON data, do
//
//     final states = statesFromJson(jsonString);

import 'dart:convert';

Booth statesFromJson(String str) => Booth.fromJson(json.decode(str));

String statesToJson(Booth data) => json.encode(data.toJson());

class Booth {
  Booth({
    required this.status,
    required this.message,
    required this.data,
    required this.code,
  });

  bool status;
  String message;
  List<ApiDataList> data;
  String code;

  factory Booth.fromJson(Map<String, dynamic> json) => Booth(
    status: json["status"],
    message: json["message"],
    data: List<ApiDataList>.from(json["data"].map((x) => ApiDataList.fromJson(x))),
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "code": code,
  };
}

class ApiDataList {
  ApiDataList({
    required this.name,
    required this.id,
  });

  String name;
  int id;

  factory ApiDataList.fromJson(Map<String, dynamic> json) => ApiDataList(
    name: json["name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
  };
}
