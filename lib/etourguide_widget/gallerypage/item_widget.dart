import 'package:flutter/material.dart';
import 'package:flutter_etourguide/etouguide_view/details_page_view.dart';
import 'package:flutter_etourguide/etouguide_view/exhibit_details_page_view.dart';
import 'package:flutter_etourguide/etourguide_model/event_model.dart';
import 'package:flutter_etourguide/etourguide_model/exhibit_model.dart';
import 'package:flutter_etourguide/etourguide_model/topic_model.dart';

class ItemWidget extends StatelessWidget {
  String tab_name;
  int id;
  String item_name;
  String imageUrl;
  String startDate;
  String endDate;
  String description;
  double rating;
  int totalFeedback;
  ItemWidget({this.tab_name, this.item_name, this.imageUrl, this.id, this.rating, this.totalFeedback, this.description, this.endDate, this.startDate});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          tab_name != null ? Navigator.push(context, MaterialPageRoute(builder: (context) {
            if (tab_name != null) {
              if (tab_name.contains("event")) {
                return DetailsPageView(
                    event: new Event(
                        id: id,
                        name: item_name,
                        avgRating: rating,
                        imageUrl: imageUrl,
                        startDate: startDate != null ? startDate : "",
                        endDate: endDate != null ? endDate : "",
                        description: description,
                        totalFeedback: totalFeedback));
              } else if (tab_name.contains("topic")) {
                return DetailsPageView(
                    topic: new Topic(
                        id: id,
                        name: item_name,
                        avgRating: rating,
                        imageUrl: imageUrl,
                        startDate: startDate != null ? startDate : "",
                        description: description,
                        totalFeedback: totalFeedback));
              } else {
                return ExhibitDetailsPageView(
                  exhibit: new Exhibit(
                    id: id,
                    name: item_name,
                    avgRating: rating,
                    imageUrl: imageUrl,
                    description: description,
                    totalFeedback: totalFeedback,
                  ),
                );
              }
            } else{

            }
          })) : "";
        },
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.topStart,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
                height: 250,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6)),
                  color: Colors.black26,
                  image: DecorationImage(
                    image: NetworkImage(imageUrl,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 20),
            child: Text(
              item_name,
              style: TextStyle(
                fontFamily: 'CourNew',
                fontSize: 16
              ),
            ),
          ),

        ],
      ),
    );
  }
}
