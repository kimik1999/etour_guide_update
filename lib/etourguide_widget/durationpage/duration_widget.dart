import 'package:flutter/material.dart';
import 'package:flutter_etourguide/etouguide_view/exhibit_details_page_view.dart';
import 'package:flutter_etourguide/etourguide_model/exhibit_model.dart';
import 'package:flutter_etourguide/etourguide_viewmodel/list_exhibit_viewmodel.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class DurationWidget extends StatefulWidget {
  String time;
  DurationWidget({this.time});
  @override
  _DurationWidgetState createState() => _DurationWidgetState();
}

class _DurationWidgetState extends State<DurationWidget> {

  @override
  void didUpdateWidget(covariant DurationWidget oldWidget) {
    WidgetsBinding.instance.addPostFrameCallback((_){
      if(context != null)
        Provider.of<ListExhibitViewModel>(context, listen: false)
            .getExhibitInduration(widget.time);
    });
    super.didUpdateWidget(oldWidget);
  }
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      if(context != null)
        Provider.of<ListExhibitViewModel>(context, listen: false)
            .getExhibitInduration(widget.time);
    });
    //getBoolValue(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var listExhibit = Provider.of<ListExhibitViewModel>(context);
    return listExhibit.loadingStatus.toString().contains("completed") ? Container(
      color: Colors.white,
      child: GridView.count(crossAxisCount: 3,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.all(8.0),
        children: List.generate(listExhibit.exhibits.length, (index){
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return ExhibitDetailsPageView(exhibit: new Exhibit(
                    id: listExhibit.exhibits[index].id,
                    name: listExhibit.exhibits[index].name,
                    avgRating:listExhibit.exhibits[index].rating,
                    imageUrl: listExhibit.exhibits[index].imageUrl,
                    description: listExhibit.exhibits[index].description,
                    totalFeedback: listExhibit.exhibits[index].totalFeedback
                ));
              }));
            },
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    image: DecorationImage(
                        image: NetworkImage(listExhibit.exhibits[index].imageUrl),
                        fit: BoxFit.fill
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                      color: Colors.black.withOpacity(0.5)
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        listExhibit.exhibits[index].name,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'CourNew',
                            fontWeight: FontWeight.bold,
                            fontSize: 12
                        ),
                      ),
                      SmoothStarRating(
                        starCount: 5,
                        size: 10,
                        color: Colors.amber[900],
                        borderColor: Colors.amber[900],
                        rating: listExhibit.exhibits[index].rating,
                        isReadOnly: true,
                        allowHalfRating: true,
                        spacing: 1,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }
        ),
      ),
    ) : listExhibit.loadingStatus.toString().contains("searching") ? Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: LoadingBouncingGrid(
       inverted: true,
       shape: BoxShape.rectangle,
        color: Colors.cyan[400],
        size: 25,
        duration: Duration(milliseconds: 1200),
      ),
    ) : Container(
      child: Center(child: Text("No record marched !")),
    );
  }

}
