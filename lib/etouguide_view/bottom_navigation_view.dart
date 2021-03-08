import 'package:flutter/material.dart';
import 'package:flutter_etourguide/etouguide_view/favoritepage_view.dart';
import 'package:flutter_etourguide/etouguide_view/gallerypage_view.dart';
import 'package:flutter_etourguide/etouguide_view/homepage_view.dart';
import 'package:flutter_etourguide/etouguide_view/mappage_view.dart';
import 'package:flutter_etourguide/etouguide_view/tour_duration_page_view.dart';
import 'package:flutter_etourguide/etourguide_model/map_model.dart';
import 'package:flutter_etourguide/etourguide_viewmodel/bottom_navigation_viewmodel.dart';
import 'package:provider/provider.dart';


class BottomNavigationView extends StatefulWidget {
//List ViewPage = [new HomePageView(), new FavoritePageView(), new MapPageView(), new GalleryPageView()];
AnimatedItemViewModel animatedItemViewModel = new AnimatedItemViewModel();

  @override
  _BottomNavigationViewState createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  int selectedIndex;
  List<Widget> viewPage;
  PageController _pageController;
  @override
  void initState() {
    selectedIndex = 0;
    viewPage = [HomePageView(), FavoritePageView(), TourDurationPageView(), MapPageView()];
    _pageController = PageController(initialPage: selectedIndex);
    super.initState();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => Map(),
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: viewPage,
        ),
        bottomNavigationBar: AnimatedItemViewModel(
          item: widget.animatedItemViewModel.ListItem,
          duration: widget.animatedItemViewModel.AnimationDuration,
          onBarTap: (index){
             setState(() {
               selectedIndex = index;
               _pageController.jumpToPage(index);
             });
          },),

      ),
    );
  }
}

