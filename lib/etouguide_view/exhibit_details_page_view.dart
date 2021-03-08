import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_etourguide/etourguide_model/exhibit_model.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ExhibitDetailsPageView extends StatefulWidget {
  Exhibit exhibit;
  ExhibitDetailsPageView({this.exhibit});
  @override
  _ExhibitDetailsPageViewState createState() => _ExhibitDetailsPageViewState();
}

class _ExhibitDetailsPageViewState extends State<ExhibitDetailsPageView> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
  }

//  @override
//  void dispose() {
//    SystemChrome.setEnabledSystemUIOverlays(
//        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
//    super.dispose();
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: <Widget>[
                Container(
                  color: Colors.white,
                  child: Stack(
                    alignment: AlignmentDirectional.topStart,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        color: Colors.white,
                      ),
                      Container(
                        //alignment: AlignmentDirectional.topStart,
                        height: 450,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: NetworkImage(widget.exhibit.imageUrl),
                          fit: BoxFit.cover,
                        )),
                      ),
                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12, top: 12),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(100))
                            ),
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
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 400,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 35, 20, 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.exhibit.name,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontFamily: 'CourNew',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 12),
                                  child: SmoothStarRating(
                                    starCount: 5,
                                    size: 14,
                                    color: Colors.amber[900],
                                    borderColor: Colors.amber[900],
                                    rating: widget.exhibit.avgRating,
                                    isReadOnly: true,
                                    allowHalfRating: true,
                                    spacing: 1,
                                  ),
                                ),
                                Container(
                                    padding: EdgeInsets.only(top: 12, left: 10),
                                    child: Text(
                                      widget.exhibit.avgRating.toStringAsFixed(2),
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontFamily: 'CourNew'),
                                    )),
                                Container(
                                    padding: EdgeInsets.only(top: 12, left: 10),
                                    child: Text("${widget.exhibit.totalFeedback.toString()} reviews",
                                        style: TextStyle(
                                          color: Colors.black45,
                                          fontFamily: 'CourNew',
                                        ))),
                              ],
                            ),
                            Container(
                                padding: EdgeInsets.only(top: 30),
                                child: Text("Overview",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.7),
                                        fontFamily: 'CourNew',
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold
                                    ))),
                            Container(
                                padding: EdgeInsets.only(top: 10, right: 10),
                                child: Text(widget.exhibit.description,
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
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 30),
                  color: Colors.white,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF76c6bd),
                            blurRadius: 3,
                            offset: Offset(0, 2)
                          )
                        ]
                      ),
                      height: 40,
                      width: 170,
                      child: RaisedButton(onPressed: (){
                      },
                        color: Color(0xFF76c6bd),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),

                        ),
                        child: Text("View Route",
                            style: TextStyle(fontFamily: 'CourNew', color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
