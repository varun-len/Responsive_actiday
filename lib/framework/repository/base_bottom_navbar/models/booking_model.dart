// To parse this JSON data, do
//
//     final booking = bookingFromJson(jsonString);

import 'dart:convert';

Booking bookingFromJson(String str) => Booking.fromJson(json.decode(str));

String bookingToJson(Booking data) => json.encode(data.toJson());

class Booking {
  List<Past>? upcoming;
  List<Past>? past;

  Booking({
    this.upcoming,
    this.past,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    upcoming: json["upcoming"] == null ? [] : List<Past>.from(json["upcoming"]!.map((x) => Past.fromJson(x))),
    past: json["past"] == null ? [] : List<Past>.from(json["past"]!.map((x) => Past.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "upcoming": upcoming == null ? [] : List<dynamic>.from(upcoming!.map((x) => x.toJson())),
    "past": past == null ? [] : List<dynamic>.from(past!.map((x) => x.toJson())),
  };
}

class Past {
  String? id;
  String? image;
  String? title;
  List<String>? subTitle;
  String? date;
  int? credit;
  String? status;

  Past({
    this.id,
    this.image,
    this.title,
    this.subTitle,
    this.date,
    this.credit,
    this.status,
  });

  factory Past.fromJson(Map<String, dynamic> json) => Past(
    id: json["id"],
    image: json["image"],
    title: json["title"],
    subTitle: json["sub_title"] == null ? [] : List<String>.from(json["sub_title"]!.map((x) => x)),
    date: json["date"],
    credit: json["credit"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "title": title,
    "sub_title": subTitle == null ? [] : List<dynamic>.from(subTitle!.map((x) => x)),
    "date": date,
    "credit": credit,
    "status": status,
  };
}
