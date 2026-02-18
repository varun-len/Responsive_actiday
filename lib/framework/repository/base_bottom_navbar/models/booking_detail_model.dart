// To parse this JSON data, do
//
//     final bookingDetail = bookingDetailFromJson(jsonString);

import 'dart:convert';

BookingDetail bookingDetailFromJson(String str) => BookingDetail.fromJson(json.decode(str));

String bookingDetailToJson(BookingDetail data) => json.encode(data.toJson());

class BookingDetail {
  List<Past>? upcoming;
  List<Past>? past;

  BookingDetail({
    this.upcoming,
    this.past,
  });

  factory BookingDetail.fromJson(Map<String, dynamic> json) => BookingDetail(
    upcoming: json["upcoming"] == null ? [] : List<Past>.from(json["upcoming"]!.map((x) => Past.fromJson(x))),
    past: json["past"] == null ? [] : List<Past>.from(json["past"]!.map((x) => Past.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "upcoming": upcoming == null ? [] : List<dynamic>.from(upcoming!.map((x) => x.toJson())),
    "past": past == null ? [] : List<dynamic>.from(past!.map((x) => x.toJson())),
  };
}

class Past {
  String? image;
  double? rating;
  String? category;
  int? time;
  String? specialist;
  String? timeSlot;
  String? bookingId;
  String? address;
  int? distance;

  Past({
    this.image,
    this.rating,
    this.category,
    this.time,
    this.specialist,
    this.timeSlot,
    this.bookingId,
    this.address,
    this.distance,
  });

  factory Past.fromJson(Map<String, dynamic> json) => Past(
    image: json["image"],
    rating: json["rating"]?.toDouble(),
    category: json["category"],
    time: json["time"],
    specialist: json["specialist"],
    timeSlot: json["time-slot"],
    bookingId: json["bookingId"],
    address: json["address"],
    distance: json["distance"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "rating": rating,
    "category": category,
    "time": time,
    "specialist": specialist,
    "time-slot": timeSlot,
    "bookingId": bookingId,
    "address": address,
    "distance": distance,
  };
}