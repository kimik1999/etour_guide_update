import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_etourguide/etouguide_view/details_page_view.dart';
import 'package:flutter_etourguide/etourguide_model/event_model.dart';
import 'package:flutter_etourguide/etourguide_viewmodel/list_event_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
class EventWidget extends StatefulWidget {
  @override
  _EventWidgetState createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
    Provider.of<ListEventViewModel>(context, listen: false)
        .getCurrentEvent();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var listEventModel = Provider.of<ListEventViewModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 5, 0, 0),
          child: Text(
            "Today's impression",
            style: TextStyle(color: Colors.black45, fontSize: 20, fontFamily: "CourNew", fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 14),
          height: 380,
          color: Colors.white,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listEventModel.events.length,
              itemBuilder: (BuildContext context, int index){
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context){
                              return DetailsPageView(
                                  event: new Event(
                                      id: listEventModel.events[index].id,
                                      name: listEventModel.events[index].name,
                                      avgRating:listEventModel.events[index].rating,
                                      imageUrl: listEventModel.events[index].imageUrl,
                                      startDate: listEventModel.events[index].startedDate,
                                      endDate: listEventModel.events[index].endDate,
                                      description: listEventModel.events[index].description,
                                      totalFeedback: listEventModel.events[index].totalFeedback));
                            }
                        )
                    );
//                  print("ahihi");
                  },
                  child: Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(14, 14, 7, 14),
                        width: 270,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            color: Colors.grey,
                            image: DecorationImage(
                                image: NetworkImage(listEventModel.events[index].imageUrl.isNotEmpty ? listEventModel.events[index].imageUrl :
                                "https://img.freepik.com/free-photo/abstract-surface-textures-white-concrete-stone-wall_74190-8184.jpg?size=626&ext=jpg"),
                              fit: BoxFit.cover
                            )
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 10),
                            padding: EdgeInsets.fromLTRB(14,14, 0, 0),
                            child: Text(
                              listEventModel.events[index].name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: "CourNew",
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                padding: EdgeInsets.fromLTRB(14,14, 0, 0),
                                child: Text(
                                  "Reviews",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.85),
                                      fontSize: 18,
                                      fontFamily: "CourNew",
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                padding: EdgeInsets.fromLTRB(5,14, 0, 0),
                                child: Text(
                                  "(${listEventModel.events[index].totalFeedback.toString()})",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.85),
                                      fontSize: 12,
                                      fontFamily: "CourNew",
                                      fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 9, top: 5, bottom: 14),
                            padding: EdgeInsets.fromLTRB(14, 0, 0, 14),
                            child: SmoothStarRating(
                              starCount: 5,
                              size: 14,
                              color: Colors.amber[900].withOpacity(0.85),
                              borderColor: Colors.amber[900].withOpacity(0.85),
                              rating: listEventModel.events[index].rating,
                              isReadOnly: true,
                              allowHalfRating: true,
                              spacing: 1,

                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 5, 0, 0),
          child: Text(
            "New Exhibits",
            style: TextStyle(color: Colors.black45, fontSize: 20, fontFamily: "CourNew", fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

