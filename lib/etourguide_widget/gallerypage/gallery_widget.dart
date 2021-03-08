import 'package:flutter/material.dart';
import 'package:flutter_etourguide/etourguide_viewmodel/gallery_viewmodel.dart';
import 'package:flutter_etourguide/etourguide_viewmodel/list_event_viewmodel.dart';
import 'package:flutter_etourguide/etourguide_viewmodel/list_exhibit_viewmodel.dart';
import 'package:flutter_etourguide/etourguide_viewmodel/list_topic_viewmodel.dart';
import 'package:flutter_etourguide/etourguide_widget/gallerypage/list_item_widget.dart';
import 'package:provider/provider.dart';

class GalleryWidget extends StatelessWidget {
  GalleryViewModel galleryViewModel = new GalleryViewModel();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, right: 14),
      child: ListView.builder(
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            shrinkWrap: true,
            itemCount: galleryViewModel.ListGallery.length,
            itemBuilder: (BuildContext context, int index){
              return GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context){
                            return  MultiProvider(
                                providers: [
                                  ChangeNotifierProvider(create: (_) => ListTopicViewModel()),
                                  ChangeNotifierProvider(create: (_) => ListEventViewModel()),
                                  ChangeNotifierProvider(create: (_) => ListExhibitViewModel())
                                ],
                                child: ListItemStf(item_name: galleryViewModel.ListGallery[index].name,));
                          }
                      )
                  );
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                        ],
                        color: Colors.black26,
                        image: DecorationImage(
                          image: NetworkImage(galleryViewModel.ListGallery[index].imageUrl,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
                      height: 200,
                      color: Colors.blue.withOpacity(0.3),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          galleryViewModel.ListGallery[index].name,
                          style: TextStyle(color: Colors.white, fontFamily: 'CourNew', fontWeight: FontWeight.bold, fontSize: 20),)),
                  ],
                ),
              );
            }
        ),
    );
  }

}
