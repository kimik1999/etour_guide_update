import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_etourguide/etourguide_viewmodel/exhibit_viewmodel.dart';
import 'package:flutter_etourguide/etourguide_viewmodel/list_exhibit_viewmodel.dart';
import 'package:flutter_etourguide/etourguide_widget/homepage/exhibit_item.dart';
import 'package:provider/provider.dart';

class ExhibitWidget extends StatefulWidget {
  double height;
  double width;
  List<ExhibitViewModel> exhibitEvent;
  int eventId;
  int topicId;
  ExhibitWidget(this.height, this.width, {this.eventId, this.exhibitEvent, this.topicId});
  ExhibitViewModel exhibitViewModel = new ExhibitViewModel();
  @override
  _ExhibitWidgetState createState() => _ExhibitWidgetState();
}

class _ExhibitWidgetState extends State<ExhibitWidget> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
        if(widget.eventId != null){
        Provider.of<ListExhibitViewModel>(context, listen: false)
            .getExhibitInEvent(widget.eventId);
        print(widget.eventId);
        } else if(widget.topicId != null) {
        Provider.of<ListExhibitViewModel>(context, listen: false)
            .getExhibitInTopic(widget.topicId);
        } else {
          Provider.of<ListExhibitViewModel>(context, listen: false)
              .getCurrentExhibit();
        }

      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 14),
      height: widget.height,
      color: Colors.white,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: getListLength(context),
          itemBuilder: (BuildContext context, int index){
            return getListGalleryItem(index, context);

          }),
    );
  }
  int getListLength(BuildContext context) {
    if (widget.eventId != null) {
      var listExhibitInEvent = Provider.of<ListExhibitViewModel>(context);
      print(listExhibitInEvent.exhibits.length);
      return listExhibitInEvent.exhibits.length;
    } else if (widget.topicId != null){
      var listExhibitInTopic = Provider.of<ListExhibitViewModel>(context);
      return listExhibitInTopic.exhibits.length;
    } else {
      var listCurrentExhibit = Provider.of<ListExhibitViewModel>(context);
      return listCurrentExhibit.exhibits.length;
    }
  }

  Widget getListGalleryItem(int index, BuildContext context) {
    if (widget.eventId != null) {
      var listExhibitInEvent = Provider.of<ListExhibitViewModel>(context);
      if (listExhibitInEvent.exhibits.length > 0)
        return ExhibitItem(
          width: widget.width,
          id: listExhibitInEvent.exhibits[index].id,
          totalFeedback: listExhibitInEvent.exhibits[index].totalFeedback,
          item_name: listExhibitInEvent.exhibits[index].name,
          imageUrl: listExhibitInEvent.exhibits[index].imageUrl,
          description: listExhibitInEvent.exhibits[index].description,
          rating: listExhibitInEvent.exhibits[index].rating,
        );
    } else if(widget.topicId != null) {
      var listExhibitInTopic = Provider.of<ListExhibitViewModel>(context);
      if(listExhibitInTopic.exhibits.length > 0)
        return ExhibitItem(
          width: widget.width,
          id: listExhibitInTopic.exhibits[index].id,
          totalFeedback: listExhibitInTopic.exhibits[index].totalFeedback,
          item_name: listExhibitInTopic.exhibits[index].name,
          imageUrl: listExhibitInTopic.exhibits[index].imageUrl,
          description: listExhibitInTopic.exhibits[index].description,
          rating: listExhibitInTopic.exhibits[index].rating,
        );
    } else {
      var listCurrentExhibit = Provider.of<ListExhibitViewModel>(context);
      if(listCurrentExhibit.exhibits.length > 0)
      return ExhibitItem(
        width: widget.width,
        id: listCurrentExhibit.exhibits[index].id,
        totalFeedback: listCurrentExhibit.exhibits[index].totalFeedback,
        item_name: listCurrentExhibit.exhibits[index].name,
        imageUrl: listCurrentExhibit.exhibits[index].imageUrl,
        description: listCurrentExhibit.exhibits[index].description,
        rating: listCurrentExhibit.exhibits[index].rating,
      );
    }
  }
}


