// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Welcome({
        required this.totalPassengers,
        required this.totalPages,
        required this.data,
    });

    int totalPassengers;
    int totalPages;
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
        required this.trips,
        required this.v,
    });

    dynamic id;
    dynamic trips;
    dynamic v;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        trips: json["trips"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "trips": trips,
        "__v": v,
    };
}

class Airline {
    Airline({
        required this.id,
        required this.name,
        required this.country,
        required this.logo,
        required this.slogan,
        required this.headQuaters,
        required this.website,
        required this.established,
    });

    int id;
    Name name;
    Country country;
    String logo;
    Slogan slogan;
    HeadQuaters headQuaters;
    Website website;
    String established;

    // factory Airline.fromJson(Map<String, dynamic> json) => Airline(
    // id: json["id"],
    // name: json["name"],
    // country: json["country"],
    // logo: json["logo"],
    // slogan: json["slogan"],
    // headQuaters: json["head_quaters"],
    // website: json["website"],
    // established: json["established"],
    // );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "country": countryValues.reverse[country],
        "logo": logo,
        "slogan": sloganValues.reverse[slogan],
        "head_quaters": headQuatersValues.reverse[headQuaters],
        "website": websiteValues.reverse[website],
        "established": established,
    };
}

enum Country { TAIWAN, SINGAPORE }

final countryValues = EnumValues({
    "Singapore": Country.SINGAPORE,
    "Taiwan": Country.TAIWAN
});

enum HeadQuaters { THE_376_HSIN_NAN_RD_SEC_1_LUZHU_TAOYUAN_CITY_TAIWAN, AIRLINE_HOUSE_25_AIRLINE_ROAD_SINGAPORE_819829 }

final headQuatersValues = EnumValues({
    "Airline House, 25 Airline Road, Singapore 819829": HeadQuaters.AIRLINE_HOUSE_25_AIRLINE_ROAD_SINGAPORE_819829,
    "376, Hsin-Nan Rd., Sec. 1, Luzhu, Taoyuan City, Taiwan": HeadQuaters.THE_376_HSIN_NAN_RD_SEC_1_LUZHU_TAOYUAN_CITY_TAIWAN
});

enum Name { EVA_AIR, SINGAPORE_AIRLINES }

final nameValues = EnumValues({
    "Eva Air": Name.EVA_AIR,
    "Singapore Airlines": Name.SINGAPORE_AIRLINES
});

enum Slogan { SHARING_THE_WORLD_FLYING_TOGETHER, A_GREAT_WAY_TO_FLY }

final sloganValues = EnumValues({
    "A Great Way to Fly": Slogan.A_GREAT_WAY_TO_FLY,
    "Sharing the World, Flying Together": Slogan.SHARING_THE_WORLD_FLYING_TOGETHER
});

enum Website { WWW_EVAAIR_COM, WWW_SINGAPOREAIR_COM }

final websiteValues = EnumValues({
    "www.evaair.com": Website.WWW_EVAAIR_COM,
    "www.singaporeair.com": Website.WWW_SINGAPOREAIR_COM
});

class EnumValues<T> {
    Map<String, T> map;
  late  Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
