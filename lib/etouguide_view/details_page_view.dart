import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_etourguide/etourguide_model/event_model.dart';
import 'package:flutter_etourguide/etourguide_model/topic_model.dart';
import 'package:flutter_etourguide/etourguide_viewmodel/list_exhibit_viewmodel.dart';
import 'package:flutter_etourguide/etourguide_widget/homepage/details_widget.dart';
import 'package:provider/provider.dart';


class DetailsPageView extends StatefulWidget {
  Event event;
  Topic topic;
  DetailsPageView({this.event, this.topic});
  @override
  _DetailsPageViewState createState() => _DetailsPageViewState();

}

class _DetailsPageViewState extends State<DetailsPageView> {

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ListExhibitViewModel()),
      ],
      child: Scaffold(
        body: DetailsWidget(event: widget.event, topic: widget.topic,),
      ),
    );
  }

}
