import 'package:flutter/material.dart';
import 'package:flutter_etourguide/etourguide_viewmodel/list_event_viewmodel.dart';
import 'package:flutter_etourguide/etourguide_viewmodel/list_exhibit_viewmodel.dart';
import 'package:flutter_etourguide/etourguide_viewmodel/list_topic_viewmodel.dart';
import 'package:flutter_etourguide/etourguide_viewmodel/room_viewmodel.dart';
import 'package:flutter_etourguide/etourguide_widget/gallerypage/item_widget.dart';

import 'package:flutter_etourguide/etourguide_widget/search_widget.dart';
import 'package:provider/provider.dart';

class ListItemStf extends StatefulWidget {
  String item_name;
  ListItemStf({this.item_name});
  @override
  _ListItemStfState createState() => _ListItemStfState();
}

class _ListItemStfState extends State<ListItemStf> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.item_name.toLowerCase().contains("topic")) {
        Provider.of<ListTopicViewModel>(context, listen: false).getAllTopic();
        // print("topic loading");
      } else if (widget.item_name.toLowerCase().contains("event")) {
        Provider.of<ListEventViewModel>(context, listen: false).getAllEvent();
      } else if (widget.item_name.toLowerCase().contains("exhibit")) {
        Provider.of<ListExhibitViewModel>(context, listen: false)
            .getAllExhibit();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.centerStart,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 25),
                    height: 50,
                    width: 50,
                    //alignment: AlignmentDirectional.topStart,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black45.withOpacity(0.8),
                        size: 22,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 25),
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Text(
                      widget.item_name,
                      style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'CourNew',
                          fontSize: 20),
                    ),
                  )
                ],
              ),
              SearchWidget(),
              Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 15),
                  child: Container(
                   // height: MediaQuery.of(context).size.height * 0.72,
                    child: ListView.builder(
                      primary: false,
//                        physics: const BouncingScrollPhysics(
//                            parent: AlwaysScrollableScrollPhysics()),
                        shrinkWrap: true,
                        itemCount: getListLength(widget.item_name, context),
                        itemBuilder: (BuildContext context, int index) {
                          print(widget.item_name);
                          print(getListLength(widget.item_name, context));
                          return getListGalleryItem(
                              widget.item_name, index, context);
                        }),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  int getListLength(String item_name, BuildContext context) {
    if (item_name.toLowerCase().contains("event")) {
      var listEventViewModel = Provider.of<ListEventViewModel>(context);
       // print("event ${listEventViewModel.events.length}");
        return listEventViewModel.events.length;
    } else if (item_name.toLowerCase().contains("topic")) {
      var listTopicViewModel = Provider.of<ListTopicViewModel>(context);
      return listTopicViewModel.topics.length;
    } else if (item_name.toLowerCase().contains("exhibit")) {
      var listExhibitViewModel = Provider.of<ListExhibitViewModel>(context);
      print(listExhibitViewModel.exhibits.length);
      return listExhibitViewModel.exhibits.length;
    } else {
      RoomViewModel roomViewModel = new RoomViewModel();
      return roomViewModel.ListRoom.length;
    }
  }

  Widget getListGalleryItem(String item_name, int index, BuildContext context) {
    if (item_name.toLowerCase().contains("event")) {
      var listEventViewModel = Provider.of<ListEventViewModel>(context);
      if (listEventViewModel.events.length > 0)
        return ItemWidget(
          id: listEventViewModel.events[index].id,
          tab_name: "event",
          totalFeedback: listEventViewModel.events[index].totalFeedback,
          item_name: listEventViewModel.events[index].name,
          imageUrl: listEventViewModel.events[index].imageUrl,
          description: listEventViewModel.events[index].description,
          endDate: listEventViewModel.events[index].endDate,
          startDate: listEventViewModel.events[index].startedDate,
          rating: listEventViewModel.events[index].rating,
        );
    } else if (item_name.toLowerCase().contains("topic")) {
      var listTopicViewModel = Provider.of<ListTopicViewModel>(context);
      if (listTopicViewModel.topics.length > 0)
        return ItemWidget(
          tab_name: "topic",
          id: listTopicViewModel.topics[index].id,
          description: listTopicViewModel.topics[index].description,
          rating: listTopicViewModel.topics[index].rating,
          totalFeedback: listTopicViewModel.topics[index].totalFeedback,
          item_name: listTopicViewModel.topics[index].name,
          imageUrl: listTopicViewModel.topics[index].imageUrl,
        );
    } else if (item_name.toLowerCase().contains("exhibit")) {
      var listExhibitViewModel = Provider.of<ListExhibitViewModel>(context);
      if (listExhibitViewModel.exhibits.length > 0)
        return ItemWidget(
          tab_name: "exhibit",
          id: listExhibitViewModel.exhibits[index].id,
          description: listExhibitViewModel.exhibits[index].description,
          totalFeedback: listExhibitViewModel.exhibits[index].totalFeedback,
          rating: listExhibitViewModel.exhibits[index].rating,
          item_name: listExhibitViewModel.exhibits[index].name,
          imageUrl: listExhibitViewModel.exhibits[index].imageUrl,
        );
    } else {
      RoomViewModel roomViewModel = new RoomViewModel();
      return ItemWidget(
        item_name: roomViewModel.ListRoom[index].name,
        imageUrl: roomViewModel.ListRoom[index].imageUrl,
      );
    }
  }
}
