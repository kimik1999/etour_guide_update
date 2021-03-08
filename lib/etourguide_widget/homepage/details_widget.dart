import 'package:flutter/material.dart';
import 'package:flutter_etourguide/etourguide_model/event_model.dart';
import 'package:flutter_etourguide/etourguide_model/topic_model.dart';
import 'package:flutter_etourguide/etourguide_viewmodel/list_event_viewmodel.dart';
import 'package:flutter_etourguide/etourguide_viewmodel/list_exhibit_viewmodel.dart';
import 'package:flutter_etourguide/etourguide_widget/homepage/exhibit_widget.dart';
import 'package:flutter_etourguide/etourguide_widget/homepage/gridview_widget.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class DetailsWidget extends StatefulWidget {
  Event event;
  Topic topic;
  DetailsWidget({this.event, this.topic});
  @override
  _DetailsWidgetState createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ListExhibitViewModel()),
      ],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              Container(
                child: Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: [
                    Container(
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height,
                    ),
                    Container(
                      //alignment: AlignmentDirectional.topStart,
                      height: 350,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: widget.event != null ? NetworkImage(widget.event.imageUrl) : NetworkImage(widget.topic.imageUrl),
                              fit: BoxFit.fill
                          )
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 2, top: 10, right: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              //alignment: AlignmentDirectional.topStart,
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white.withOpacity(0.8),
                                  size: 22,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                //if(listExhibitViewModelInTopic.loadingStatus.toString().contains("completed")){
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return widget.event != null ? MultiProvider(
                                        providers: [
                                          ChangeNotifierProvider(create: (_) => ListExhibitViewModel()),
                                          ChangeNotifierProvider(create: (_) => ListEventViewModel()),
                                        ],
                                        child: GridViewWidget(eventId: widget.event.id,)) :
                                    MultiProvider(
                                        providers: [
                                          ChangeNotifierProvider(create: (_) => ListExhibitViewModel()),
                                          ChangeNotifierProvider(create: (_) => ListEventViewModel()),
                                        ],
                                        child: GridViewWidget(topicId: widget.topic.id,));
                                  }));
                                //} else {

                                //}
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.8),
                                    borderRadius: BorderRadius.all(Radius.circular(100))
                                ),
                                child: Icon(
                                  IconData(0xf5a0, fontFamily: 'IconCustom'),
                                  color: Colors.black.withOpacity(0.8),
                                  size: 18,
                                ),
                              ) ,
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SafeArea(
                child: Container(
                  alignment: AlignmentDirectional.bottomStart,
                  height: MediaQuery.of(context).size.height - 300,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.event != null ? widget.event.name : widget.topic.name,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontSize: 22,
                                  fontFamily: 'CourNew',
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 12),
                              child: widget.event != null ? Text("${widget.event.startDate} - ${widget.event.endDate}",
                                  style: TextStyle(fontFamily: 'CourNew', color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold)) : null,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: widget.event != null ? EdgeInsets.only(top: 12) : null,
                                  child: SmoothStarRating(
                                    starCount: 5,
                                    size: 14,
                                    color: Colors.amber[900],
                                    borderColor: Colors.amber[900],
                                    rating: widget.event != null ? double.parse(widget.event.avgRating.toStringAsFixed(2)) : double.parse(widget.topic.avgRating.toStringAsFixed(2)),
                                    isReadOnly: true,
                                    allowHalfRating: true,
                                    spacing: 1,
                                  ),
                                ),
                                Container(
                                    padding: widget.event != null ? EdgeInsets.only(top: 12, left: 10) : EdgeInsets.only(left: 10),
                                    child: Text(
                                      widget.event != null ? widget.event.avgRating.toStringAsFixed(2) : widget.topic.avgRating.toString(),
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontFamily: 'CourNew'),
                                    )),
                                Container(
                                    padding: widget.event != null ? EdgeInsets.only(top: 12, left: 10) : EdgeInsets.only(left: 10),
                                    child: Text(widget.event != null ? "${widget.event.totalFeedback.toString()} reviews" : "${widget.topic.totalFeedback.toString()} reviews",
                                        style: TextStyle(
                                          color: Colors.black45,
                                          fontFamily: 'CourNew',
                                        ))),
                              ],
                            ),
                            Container(
                                padding: EdgeInsets.only(top: 20),
                                child: Text("Overview",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.7),
                                        fontFamily: 'CourNew',
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold
                                    ))),
                            Container(
                                padding: EdgeInsets.only(top: 10, right: 10),
                                child: Text(widget.event != null ? widget.event.description : widget.topic.description,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'CourNew',
                                      fontSize: 14,
                                    ))),
                            Container(
                                padding: EdgeInsets.only(top: 5),
                                child: RichText(
                                  text: TextSpan(
                                      children:  [
                                        TextSpan(
                                            text: "expand",
                                            style: TextStyle(
                                                color: Colors.black.withOpacity(0.8),
                                                fontFamily: 'CourNew',
                                                fontSize: 12
                                            )
                                        ),
                                        WidgetSpan(child: Icon(Icons.expand_more_outlined, size: 15, color: Colors.black26,))
                                      ]
                                  ),
                                )
                            ),
                            Container(
                              padding: widget.event != null ? const EdgeInsets.only(top: 15) : EdgeInsets.only(top: 30),
                              child: Text("Exhibit",
                                  style: TextStyle(fontFamily: 'CourNew', color: Colors.black.withOpacity(0.8), fontSize: 17, fontWeight: FontWeight.bold)),
                            ),
                            widget.event != null ? ExhibitWidget(145, 100, eventId: widget.event.id,) : ExhibitWidget(150, 100, topicId: widget.topic.id, )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}


