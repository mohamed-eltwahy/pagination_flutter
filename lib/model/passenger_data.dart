class Passengers {
  late dynamic totalPassengers;
  late dynamic totalPages;
  late List<Data> data;

  Passengers(
      {required this.totalPassengers,
      required this.totalPages,
      required this.data});

  Passengers.fromJson(Map<String, dynamic> json) {
    totalPassengers = json['totalPassengers'];
    totalPages = json['totalPages'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalPassengers'] = this.totalPassengers;
    data['totalPages'] = this.totalPages;
    data['data'] = this.data.map((v) => v.toJson()).toList();
    return data;
  }
}

class Data {
  late dynamic sId;
  late dynamic name;
  late dynamic trips;
  late List<Airline> airline;
  late dynamic iV;

  Data(
      {required this.sId,
      required this.name,
      required this.trips,
      required this.airline,
      required this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    trips = json['trips'];
    if (json['airline'] != null) {
      airline = <Airline>[];
      json['airline'].forEach((v) {
        airline.add(new Airline.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['trips'] = this.trips;
    data['airline'] = this.airline.map((v) => v.toJson()).toList();
    data['__v'] = this.iV;
    return data;
  }
}

class Airline {
  late dynamic id;
  late dynamic name;
  late dynamic country;
  late dynamic logo;
  late dynamic slogan;
  late dynamic headQuaters;
  late dynamic website;
  late dynamic established;

  Airline(
      {required this.id,
      required this.name,
      required this.country,
      required this.logo,
      required this.slogan,
      required this.headQuaters,
      required this.website,
      required this.established});

  Airline.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country = json['country'];
    logo = json['logo'];
    slogan = json['slogan'];
    headQuaters = json['head_quaters'];
    website = json['website'];
    established = json['established'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['country'] = this.country;
    data['logo'] = this.logo;
    data['slogan'] = this.slogan;
    data['head_quaters'] = this.headQuaters;
    data['website'] = this.website;
    data['established'] = this.established;
    return data;
  }
}
