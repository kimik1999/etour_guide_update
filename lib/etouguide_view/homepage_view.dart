
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_etourguide/etourguide_viewmodel/list_event_viewmodel.dart';
import 'package:flutter_etourguide/etourguide_viewmodel/list_exhibit_viewmodel.dart';
import 'package:flutter_etourguide/etourguide_widget/gallerypage/category_item.dart';
import 'package:flutter_etourguide/etourguide_widget/homepage/event_widget.dart';
import 'package:flutter_etourguide/etourguide_widget/homepage/exhibit_widget.dart';
import 'package:flutter_etourguide/etourguide_widget/search_widget.dart';
import 'package:provider/provider.dart';

class HomePageView extends StatefulWidget {
  @override
  _HomePageViewState createState() => _HomePageViewState();

}

class _HomePageViewState extends State<HomePageView> with AutomaticKeepAliveClientMixin<HomePageView>{

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ListEventViewModel()),
        ChangeNotifierProvider(create: (_) => ListExhibitViewModel()),
      ],
      child: SingleChildScrollView(
        child: SafeArea(
          child: Container(
              color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchWidget(),
                EventWidget(),
               ExhibitWidget(150, 200),
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 5, 15, 15),
                  child: Text(
                    "Catelogy",
                    style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'CourNew',
                      fontSize: 21
                    ),
                  ),
                ),
                Category(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
