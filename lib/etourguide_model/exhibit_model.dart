import 'package:flutter/material.dart';

class Exhibit{
  int id;
  String name;
  String description;
  String imageUrl;
  String createdDate;
  double avgRating;
  int totalFeedback;
  bool isChecked = false;

  Exhibit({this.id, this.name, this.description, this.imageUrl, this.createdDate,
    this.avgRating, this.totalFeedback});

  factory Exhibit.fromJson(Map<String, dynamic> json){
    return new Exhibit(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['image'],
      avgRating: json['rating'],
      totalFeedback: json['totalFeedback']
    );
  }


}