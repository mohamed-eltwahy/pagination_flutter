// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Welcome({
        required this.totalPassengers,
        required this.totalPages,
        required this.data,
    });

    dynamic totalPassengers;
    dynamic totalPages;
    List<Datum> data;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        totalPassengers: json["totalPassengers"],
        totalPages: json["totalPages"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "totalPassengers": totalPassengers,
        "totalPages": totalPages,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.id,
        required this.name,
        required this.trips,
        required this.v,
    });

    String id;
    String name;
    dynamic trips;
    dynamic v;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        name: json["name"],
        trips: json["trips"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "trips": trips,
        "__v": v,
    };
}
