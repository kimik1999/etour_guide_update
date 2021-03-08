
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_etourguide/etourguide_viewmodel/list_event_viewmodel.dart';
import 'package:flutter_etourguide/etourguide_viewmodel/list_exhibit_viewmodel.dart';
import 'package:flutter_etourguide/etourguide_viewmodel/list_topic_viewmodel.dart';
import 'package:flutter_etourguide/etourguide_widget/categorypage/carousel_slider_widget.dart';
import 'package:provider/provider.dart';

class FavoritePageView extends StatefulWidget {
  @override
  _FavoritePageViewState createState() => _FavoritePageViewState();
}

class _FavoritePageViewState extends State<FavoritePageView> with AutomaticKeepAliveClientMixin<FavoritePageView>{
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ListEventViewModel()),
        ChangeNotifierProvider(create: (_) => ListTopicViewModel()),
        ChangeNotifierProvider(create: (_) => ListExhibitViewModel())
      ],
      child: DefaultTabController(
          length: 3,
          child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                shadowColor: Colors.transparent,
                backgroundColor: Colors.white,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text("Favorite",
                        style: TextStyle(fontFamily: "CourNew", fontWeight: FontWeight.bold, fontSize: 21, color: Colors.black45),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(100))
                        ),
                        child: Icon(
                          Icons.search,
                          color: Colors.black26,
                          size: 28,
                        ),
                      ),
                    ),
                  ],
                ),
                bottom: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black26,
                  indicatorColor: Colors.blueAccent,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: UnderlineTabIndicator(
                      insets: EdgeInsets.only(left: 52, right: 52),
                      borderSide: BorderSide(
                          width: 2,
                          color: Colors.black
                      )
                  ),
//                indicator: BoxDecoration(
//                    color: Colors.black,
//                    borderRadius: BorderRadius.all(Radius.circular(30))
//                ),
                  labelStyle: TextStyle(
                    fontFamily: "CourNew",
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  tabs: [
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                          child: Text("Event")
                      ),
                    ),
                    Tab(
                      child: Align(
                          alignment: Alignment.center,
                          child: Text("Topic")
                      ),
                    ),
                    Tab(
                      child: Align(
                          alignment: Alignment.center,
                          child: Text("Exhibit")
                      ),
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  Container(
                    color: Colors.white,
                    child: CarouselSliderWidget(tab_name: "event",),
                  ),
                  Container(
                    color: Colors.white,
                    child: CarouselSliderWidget(tab_name: "topic",),
                  ),
                  Container(
                    color: Colors.white,
                    child: CarouselSliderWidget(tab_name: "exhibit",),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
