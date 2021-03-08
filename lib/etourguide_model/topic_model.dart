import 'package:flutter/material.dart';

class Topic{
  int id;
  String name;
  String description;
  String imageUrl;
  String startDate;
  double avgRating;
  int totalFeedback;

  Topic({this.id, this.name, this.description, this.imageUrl, this.startDate,
    this.avgRating, this.totalFeedback});

  factory Topic.fromJson(Map<String, dynamic> json){
    return new Topic(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        imageUrl: json['image'],
        startDate: json['startDate'],
        avgRating: json['rating'],
        totalFeedback: json['totalFeedback']
    );
  }
}