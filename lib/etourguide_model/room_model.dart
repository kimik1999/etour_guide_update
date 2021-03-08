import 'package:flutter/material.dart';

class Room{
  String id;
  String name;
  String description;
  String imageUrl;

  Room({this.id, this.name, this.description, this.imageUrl});

  String get Id{
    return id;
  }
  String get Name{
    return name;
  }
  String get Description{
    return description;
  }
  String get ImageUrl{
    return imageUrl;
  }
  
}