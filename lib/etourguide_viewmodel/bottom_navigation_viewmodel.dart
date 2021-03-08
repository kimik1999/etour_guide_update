import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_etourguide/etourguide_model/bottom_navigation_model.dart';

class AnimatedItemViewModel extends StatefulWidget {
  List<AnimatedItem> items;
  Duration animationDuration;
  final Function onBarTap;

  AnimatedItemViewModel({List<AnimatedItem> item, Duration duration, this.onBarTap});

  List<AnimatedItem> get ListItem{
    items = [
     AnimatedItem(title: "Home", icon: Icons.home, iconColor: Colors.indigo),
     AnimatedItem(title: "Favorite", icon: Icons.favorite, iconColor: Colors.indigo),
     AnimatedItem(title: "Tour", icon: Icons.tour, iconColor: Colors.indigo),
     AnimatedItem(title: "Map", icon: Icons.map, iconColor: Colors.indigo),
   ];
    return items;
  }

  Duration get AnimationDuration{
    animationDuration = const Duration(milliseconds: 500);
    return animationDuration;
  }


  @override
  _AnimatedItemViewModelState createState() => _AnimatedItemViewModelState();
}

class _AnimatedItemViewModelState extends State<AnimatedItemViewModel> with TickerProviderStateMixin{
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12, top: 12, right: 10, left: 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _buildAnimatedItem(),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildAnimatedItem(){
    List<Widget> _items = List();
    for(int i = 0; i < widget.ListItem.length; i++){
      AnimatedItem item = widget.ListItem[i];
      bool isSelected = selectedIndex == i;
      _items.add(
        InkWell(
          splashColor: Colors.transparent,
          onTap: (){
            setState(() {
              selectedIndex = i;
              widget.onBarTap(selectedIndex);
            });
          },
          child: AnimatedContainer(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            duration: widget.AnimationDuration,
            decoration: BoxDecoration(
              color: isSelected ? item.iconColor.withOpacity(0.1): null,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Row(
              children: <Widget>[
                Icon(item.Icon, color: isSelected ? item.IconColor : Colors.grey),
                AnimatedSize(
                  duration: widget.AnimationDuration,
                  curve: Curves.easeInOut,
                  vsync: this,
                  child: Text(isSelected ? item.Title : "", style: TextStyle(fontSize: 16, color: item.IconColor),
                  ),
                ),
              ],
            ),
          ),
        )
      );
    }
    return _items;
  }
}





