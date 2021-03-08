import 'package:flutter/material.dart';
import 'package:flutter_etourguide/etourguide_viewmodel/gallery_viewmodel.dart';
import 'package:flutter_etourguide/etourguide_viewmodel/list_event_viewmodel.dart';
import 'package:flutter_etourguide/etourguide_viewmodel/list_exhibit_viewmodel.dart';
import 'package:flutter_etourguide/etourguide_viewmodel/list_topic_viewmodel.dart';
import 'package:flutter_etourguide/etourguide_widget/gallerypage/list_item_widget.dart';
import 'package:provider/provider.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  GalleryViewModel galleryViewModel = new GalleryViewModel();

  @override
  Widget build(BuildContext context) {
    return GridView.count(crossAxisCount: 2,
      childAspectRatio: 1.5,
      padding: EdgeInsets.only(left: 10, right: 10),
      shrinkWrap: true,
      primary: false,
      children: List.generate(galleryViewModel.ListGallery.length, (index) {
        return GestureDetector(
            onTap: () {
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
            alignment: AlignmentDirectional.topStart,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                height: 100,
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
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 5, right: 5),
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.3),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  child:Text(
                    galleryViewModel.ListGallery[index].name,
                    style: TextStyle(color: Colors.white, fontFamily: 'CourNew', fontWeight: FontWeight.bold, fontSize: 14),),
                ),

            ],
          ),
        );
      }
      ),
    );
  }
}
