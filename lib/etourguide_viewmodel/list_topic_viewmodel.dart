import 'package:flutter/material.dart';
import 'package:flutter_etourguide/etourguide_model/topic_model.dart';
import 'package:flutter_etourguide/etourguide_viewmodel/topic_viewmodel.dart';
import 'package:flutter_etourguide/services/web_services.dart';
enum LoadingStatus {
  completed,
  searching,
  empty
}
class ListTopicViewModel with ChangeNotifier{
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<TopicViewModel> topics = List<TopicViewModel>();

  void getAllTopic() async{
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    List<Topic> listTopic = await WebService().fetchAllTopic();
    this.topics = listTopic.map((topic) => TopicViewModel(topic: topic)).toList();
    if(this.topics.isEmpty){
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }

  void getSuggestionTopic() async{
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    List<Topic> listSuggestionTopic = await WebService().fetchSuggestionTopic();
    this.topics = listSuggestionTopic.map((topic) => TopicViewModel(topic: topic)).toList();
    if(this.topics.isEmpty){
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}