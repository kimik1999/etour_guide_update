import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_etourguide/etourguide_model/map_model.dart';
import 'package:flutter_etourguide/etourguide_widget/mappage/maptouch_widget.dart';
import 'package:provider/provider.dart';


class MapPageView extends StatefulWidget{
  @override
  _MapPageViewState createState() => _MapPageViewState();
}

class _MapPageViewState extends State<MapPageView> {
  bool hasTouch = false;
  int floor = 1;
  @override
  void didUpdateWidget(covariant MapPageView oldWidget) {
    hasTouch == true ? Container(height: 0, width: 0,) : MapTouchWidget();
    super.didUpdateWidget(oldWidget);
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          hasTouch = true;
        });
        print(hasTouch);
      },
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          InteractiveViewer(
            panEnabled: true, // Set it to false to prevent panning.
            boundaryMargin: EdgeInsets.all(80),
            minScale: 1,
            maxScale: 1.2,
            scaleEnabled: true,

            child: Container(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.2),
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                'assets/images/museum_map_floor$floor.jpg'
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.width * 0.55,
            right: 10,
            width: 40,
            height: 40,
            child: RaisedButton(
              color: floor == 2 ? Colors.orangeAccent[200] : null,
              onPressed: (){
                setState(() {
                  floor = 2;
                });
              },
              child: Text(
                "2",
                style: TextStyle(
                    fontFamily: 'CourNew',
                    color: Colors.brown,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.width * 0.435,
            right: 10,
            width: 40,
            height: 40,
            child: RaisedButton(
              color: floor == 1 ? Colors.orangeAccent[200] : null,
              onPressed: (){
                  setState(() {
                    floor = 1;
                  });
              },
              child: Text(
                "1",
                style: TextStyle(
                    fontFamily: 'CourNew',
                    color: Colors.brown,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          hasTouch ? Container(height: 0, width: 0,) : MapTouchWidget()
        ],
      ),

    );
  }
//   Widget callMapTouchWidget(bool hasTouch){
//     setState(() {
//       hasTouch = true;
//     });
//     MapTouchWidget();
//   }
}