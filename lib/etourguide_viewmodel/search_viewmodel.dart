import 'package:flutter/material.dart';
import 'package:flutter_etourguide/etouguide_view/details_page_view.dart';

class SearchViewModel extends SearchDelegate<String>{
  List<String> suggestionList = ["Suggestion 1", "Suggestion 2", "Suggestion 3"];
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [IconButton(icon: Icon(Icons.clear), onPressed: null)];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(icon: AnimatedIcon(
      icon: AnimatedIcons.menu_arrow,
      progress: transitionAnimation,
    ), onPressed: (){
      close(context, null);
    });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (BuildContext context, int index){
        return ListTile(
          title: Text(suggestionList[index]),
        );
    });
  }

}