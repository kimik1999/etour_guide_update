import 'package:flutter/material.dart';
import 'package:flutter_etourguide/etouguide_view/exhibit_details_page_view.dart';
import 'package:flutter_etourguide/etourguide_model/exhibit_model.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ExhibitItem extends StatelessWidget {
  double width;
  int id;
  String item_name;
  String imageUrl;
  String startDate;
  String endDate;
  String description;
  double rating;
  int totalFeedback;
  ExhibitItem({this.width, this.item_name, this.imageUrl, this.id, this.rating, this.totalFeedback, this.description, this.endDate, this.startDate});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print(item_name);
        Navigator.push(context,
            MaterialPageRoute(
                builder: (context){
                  return ExhibitDetailsPageView(exhibit: new Exhibit(
                    name: item_name,
                    description: description,
                    imageUrl: imageUrl,
                    avgRating: rating,
                  ),);
                }
            )
        );
      },
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(14, 14, 2, 14),
            width: width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Colors.black45,
                image: DecorationImage(
                    image: NetworkImage(
                        imageUrl != null && imageUrl.contains("http") ? imageUrl :
                        "https://img.freepik.com/free-photo/abstract-surface-textures-white-concrete-stone-wall_74190-8184.jpg?size=626&ext=jpg"
                    ),
                    fit: BoxFit.fill
                )
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(20, 15, 2, 5),
                child: Text(item_name,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'CourNew',
                  fontSize: 12
                ),),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 2, 20),
                child: SmoothStarRating(
                  starCount: 5,
                  size: 8,
                  color: Colors.amber[900],
                  borderColor: Colors.amber[900],
                  rating: rating != null ? rating : 0,
                  isReadOnly: true,
                  allowHalfRating: true,
                  spacing: 1,
                )
              ),
            ],
          )
        ],
      ),
    );
  }
}
