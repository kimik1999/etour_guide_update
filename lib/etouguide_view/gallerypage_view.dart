import 'package:flutter/material.dart';
import 'package:flutter_etourguide/etourguide_viewmodel/list_topic_viewmodel.dart';
import 'package:flutter_etourguide/etourguide_widget/gallerypage/gallery_widget.dart';
import 'package:provider/provider.dart';

class GalleryPageView extends StatefulWidget {
  @override
  _GalleryPageViewState createState() => _GalleryPageViewState();
}

class _GalleryPageViewState extends State<GalleryPageView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 25, 15, 15),
                child: Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Gallery",
                          style: TextStyle(fontFamily: "CourNew", fontWeight: FontWeight.bold, fontSize: 21, color: Colors.black45),
                        ),
                      ),
                    ),

              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.78,
                  child: GalleryWidget()),

            ],
          ),
        ),
      ),
    );
  }
}