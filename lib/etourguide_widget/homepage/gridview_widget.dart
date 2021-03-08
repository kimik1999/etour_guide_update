
import 'package:flutter/material.dart';
import 'package:flutter_etourguide/etouguide_view/exhibit_details_page_view.dart';
import 'package:flutter_etourguide/etourguide_model/exhibit_model.dart';
import 'package:flutter_etourguide/etourguide_viewmodel/list_event_viewmodel.dart';
import 'package:flutter_etourguide/etourguide_viewmodel/list_exhibit_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class GridViewWidget extends StatefulWidget {
  int eventId;
  int topicId;
  GridViewWidget({this.eventId, this.topicId});

  @override
  _GridViewWidgetState createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {

  bool isCheckedAll = false;
  bool isChekedItem = false;
  int count = 0;
  List<String> exhibitId = [];
  String test = "";

  @override
  void initState() {
    exhibitId = [];
    WidgetsBinding.instance.addPostFrameCallback((_){
      if(widget.eventId != null){
        Provider.of<ListExhibitViewModel>(context, listen: false)
            .getExhibitInEvent(widget.eventId);
        if(exhibitId.length > 0)
         Provider.of<ListEventViewModel>(context, listen: false)
            .getEventInDuration(widget.eventId.toString(), exhibitId).toString();
      } else {
        Provider.of<ListExhibitViewModel>(context, listen: false)
            .getExhibitInTopic(widget.topicId);
      }
    });
    //getBoolValue(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var listExhibit = Provider.of<ListExhibitViewModel>(context);
    var duration = Provider.of<ListEventViewModel>(context);
    //var listExhibit = Provider.of<ListExhibitViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Choose Exhibit",
              style: TextStyle(
                color: Colors.black45,
                fontFamily: 'CourNew',
                fontWeight: FontWeight.bold,
              ),
            ),
            Theme(
              data: ThemeData(
                unselectedWidgetColor: Colors.black45
              ),
              child: Checkbox(value: isCheckedAll, activeColor: Colors.black, onChanged: (bool value){
                setState(() {
                  listExhibit.exhibits.forEach((index) {
                    index.isChecked = value;
                    if(index.isChecked == true){
                      exhibitId.add(index.id.toString());
                    } else{
                      exhibitId.clear();
                    }
                  });
                  isChekedItem = value;
                  //print(isChekedItem);
                  isCheckedAll = value;
                  if(isCheckedAll == true){
                    //print(exhibitId.length);
                    Provider.of<ListEventViewModel>(context, listen: false)
                        .getEventInDuration(widget.eventId.toString(), exhibitId).then((String result){
                          setState(() {
                            //print(result);
                            test = result;
                          });
                        });
                   // duration = Provider.of<ListEventViewModel>(context, listen: false);

                  } else {
                    test = '';
                  };
                  print(test);
                });
              }),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.black45
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 3,
              spreadRadius: 1,
              offset: Offset(0, 2)
            )
          ]
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          child: BottomAppBar(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(test != null ? test : "",
                  style: TextStyle(color: Colors.black, fontFamily: 'CourNew', fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Icon(Icons.arrow_forward,
                  color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: GridView.count(crossAxisCount: 3,
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
                  Stack(
                    alignment: AlignmentDirectional.topStart,
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
                      Theme(
                        data: ThemeData(unselectedWidgetColor: Colors.white),
                        child: Checkbox(
                          value: listExhibit.exhibits[index].isChecked,
                          activeColor: Colors.black,
                          onChanged: (isCheckedItem) {
                            //print('ontap ${isChekedItem}');
                            // print(value);
                            setState(() {
                              listExhibit.exhibits[index].isChecked = isCheckedItem;
                              if(isChekedItem){
                                count = 0;
                                print(isChekedItem);
                                listExhibit.exhibits.forEach((index) {
                                  if(index.isChecked) {
                                    if(count < listExhibit.exhibits.length){
                                      count = count + 1;
                                      //exhibitId.add(index.id.toString());
                                    } //count total = list.length
                                  } else {
                                    exhibitId.remove(index.id.toString());
                                  }
                                }
                                );
                                if(0 <= count && count < listExhibit.exhibits.length){
                                  // print('count false: ${count}');
                                  isCheckedAll = false;
                                }else {
                                  // print('count true: ${count}');
                                  isCheckedAll = true;
                                }
                                if(exhibitId.isNotEmpty) {
                                  Provider.of<ListEventViewModel>(
                                      context, listen: false)
                                      .getEventInDuration(
                                      widget.eventId.toString(), exhibitId)
                                      .then((String result) {
                                    setState(() {
                                      //print(result);

                                      test = result;

                                    });
                                  });
                                } else{
                                  test = "";
                                }
                              } else {
                                //print("ahihi");
                                exhibitId.clear();
                                count = 0;
                                //print('TH22 ${count}');
                                listExhibit.exhibits.forEach((index) {
                                  if(index.isChecked) {
                                    exhibitId.add(index.id.toString());
                                    //print(exhibitId.length);
                                    if(count < listExhibit.exhibits.length){
                                      count = count + 1;
                                      //print('id ${index.id.toString()}');
                                    } //count total = list.length
                                  } else{
                                    exhibitId.remove(index.id.toString());
                                  }
                                }
                                );
                                print(exhibitId.length);
                                //print('TH22 ${count}');
                                if(count == listExhibit.exhibits.length){
                                  isCheckedAll = true;
                                } else {
                                  isCheckedAll = false;
                                }
                                if(exhibitId.isNotEmpty) {
                                  Provider.of<ListEventViewModel>(
                                      context, listen: false)
                                      .getEventInDuration(
                                      widget.eventId.toString(), exhibitId)
                                      .then((String result) {
                                    setState(() {
                                      //print(result);

                                      test = result;

                                    });
                                  });
                                } else{
                                  test = "";
                                }
                              }
                            });
                          },
                        ),
                      )
                    ],
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
      ),
    );
  }
}

