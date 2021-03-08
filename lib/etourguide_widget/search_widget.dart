import 'package:flutter/material.dart';
import 'package:flutter_etourguide/etourguide_viewmodel/search_viewmodel.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 35, 15, 15),
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              border: Border.all(color: Colors.white),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              onTap: (){
                showSearch(context: context, delegate: SearchViewModel());
              },
              decoration: InputDecoration(
                  icon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(Icons.search,
                        color: Colors.black26),
                  ),
                  hintText: 'What would you like to find?',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(0)
              ),
            ),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(100))
            ),
            child: Icon(
              Icons.filter_list_outlined,
              color: Colors.black26,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}
