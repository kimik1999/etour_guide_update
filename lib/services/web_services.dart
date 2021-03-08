
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_etourguide/etourguide_model/event_model.dart';
import 'package:flutter_etourguide/etourguide_model/exhibit_model.dart';
import 'package:flutter_etourguide/etourguide_model/topic_model.dart';
class WebService{
  String api = 'http://trunghieu.cosplane.asia/api/';
  var dio = new Dio();
  Future<List<Event>> fetchSuggestionEvent() async {
    String url = api + 'event/suggest/highlight/event';

    final response = await dio.get(url);

    if(response.statusCode == 200) {
      final result = response.data;
      Iterable list = result;
      return list.map((event) => Event.fromJson(event)).toList();
    } else {
      throw Exception("Failed to get suggestion event");
    }
  }

  Future<List<Topic>> fetchSuggestionTopic() async {
    String url = api + 'topic/suggest/highlight/topic';
    final response = await dio.get(url);

    if(response.statusCode == 200) {
      final result = response.data;
      Iterable list = result;
      return list.map((topic) => Topic.fromJson(topic)).toList();
    } else {
      throw Exception("Failed to get suggestion topic");
    }
  }

  Future<List<Exhibit>> fetchSuggestionExhibit() async {
    String url = api + 'exhibit/suggest/highlight/exhibit';

    final response = await dio.get(url);

    if(response.statusCode == 200) {
      final result = response.data;
      Iterable list = result;
      return list.map((exhibit) => Exhibit.fromJson(exhibit)).toList();
    } else {
      throw Exception("Failed to get suggestion exhibit");
    }
  }

  Future<List<Event>> fetchAllEvent() async {
    String url = api + 'event';

    final response = await dio.get(url);

    if(response.statusCode == 200) {
      final result = response.data;
      Iterable list = result;
      return list.map((event) => Event.fromJson(event)).toList();
    } else {
      throw Exception("Failed to get all event");
    }
  }


  Future<List<Topic>> fetchAllTopic() async{
    String url = api + 'topic';

    final response = await dio.get(url);

    if(response.statusCode == 200) {
      final result = response.data;
      Iterable list = result;
      return list.map((topic) => Topic.fromJson(topic)).toList();
    } else {
      throw Exception("Failed to get all topic");
    }
  }

  Future<List<Exhibit>> fetchAllExhibit() async {
    String url = api + 'exhibit';

    final response = await dio.get(url);

    if(response.statusCode == 200) {
      final result = response.data;
      Iterable list = result;
      return list.map((exhibit) => Exhibit.fromJson(exhibit)).toList();
    } else {
      throw Exception("Failed to get all exhibit");
    }
  }

  Future<List<Exhibit>> fetchExhibitInEvent(int eventId) async {
    String url = api + 'exhibit-in-event?eventId=${eventId}';

    final response = await dio.get(url);
    if(response.statusCode == 200) {
      final result = response.data;
      Iterable list = result;
      return list.map((exhibit) => Exhibit.fromJson(exhibit)).toList();
    } else {
      throw Exception("Failed to get exhibit in event");
    }
  }

  Future<List<Exhibit>> fetchCurrentExhibit() async {
    String url = api + 'exhibit/recently/createdate/exhibit';

    final response = await dio.get(url);
    if(response.statusCode == 200) {
      final result = response.data;
      Iterable list = result;
      return list.map((exhibit) => Exhibit.fromJson(exhibit)).toList();
    } else {

      throw Exception("Failed to get current exhibit");
    }
  }

  Future<List<Exhibit>> fetchExhibitInTopic(int topicId) async {
    String url = api + 'exhibit-in-topic?topicId=${topicId}';

    final response = await dio.get(url);

    if(response.statusCode == 200) {
      final result = response.data;
      Iterable list = result;
      return list.map((exhibit) => Exhibit.fromJson(exhibit)).toList();
    } else {
      throw Exception("Failed to get exhibit in topic");
    }
  }

  Future<List<Exhibit>> fetchExhibitInDuration(String time) async {
    String url = api + 'duration/duration-for-time?Time=${time}';

    final response = await dio.get(url);

    if(response.statusCode == 200) {
      final result = response.data;
      Iterable list = result;
      return list.map((exhibit) => Exhibit.fromJson(exhibit)).toList();
    } else {
      throw Exception("Failed to get exhibit in duration ${time}");
    }
  }

  Future<String> fetchEventInDuration(String eventId, List<String> exhibitId) async {
    String url = api + 'duration/total-time-to-move-and-visit-exhibit-in-a-event?eventId=${eventId}';

    final response = await dio.post(url, data: jsonEncode(exhibitId));

    if(response.statusCode == 200) {
      final result = response.data;
      String duration = result;
      return duration;
    } else {
      throw Exception("Failed to get exhibit in event with id: ${eventId}");
    }
  }

  Future<List<Event>> fetchCurrentEvent() async {
    String url = api + 'event/current/event';

    final response = await dio.get(url);

    if(response.statusCode == 200) {
      final result = response.data;
      Iterable list = result;
      return list.map((event) => Event.fromJson(event)).toList();
    } else {
      throw Exception("Failed to get current event");
    }
  }
}