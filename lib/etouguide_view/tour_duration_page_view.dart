import 'package:flutter/material.dart';
import 'package:flutter_etourguide/etourguide_viewmodel/list_exhibit_viewmodel.dart';
import 'package:flutter_etourguide/etourguide_widget/durationpage/duration_widget.dart';
import 'package:flutter_etourguide/etourguide_widget/durationpage/timepicker_widget.dart';
import 'package:flutter_etourguide/etourguide_widget/homepage/gridview_widget.dart';
import 'package:provider/provider.dart';

class TourDurationPageView extends StatefulWidget {
  @override
  _TourDurationPageViewState createState() => _TourDurationPageViewState();
}

class _TourDurationPageViewState extends State<TourDurationPageView> {
  int selectedIndex = 0;
  String defaultIndex = 'Others';
  List<String> item = ['Others', '90 min', '120 min', '150 min', '180 min'];
  String selectedTime = null;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ListExhibitViewModel()),
      ],
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: menu(),
//        appBar: AppBar(
//          bottom: menu(),
//        ),
          //bottomNavigationBar: menu(),
        ),
      ),
    );
  }

  Widget menu() {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 30, 20, 10),
                  child: Text(
                    "Choose Duration",
                    style: TextStyle(
                      color: Colors.black45,
                      fontFamily: 'CourNew',
                      fontSize: 21,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 30, 20, 10),
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.3),
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: Offset(0, 2)
                        )
                      ]
                    ),
                    child: Icon(IconData(0xf5a0, fontFamily: 'IconCustom'), color: Colors.black45, size: 14,),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 20, 10, 15),
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30))
                  ),
                  child: TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black45,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: Colors.white,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        30,
                      ),
                      color: Colors.black.withOpacity(0.9),
                    ),
                    onTap: (index){
                      setState(() {
                        selectedIndex = index;
                        print(selectedIndex);
                  });
                },
                    tabs: [
                      Tab(
                        child: Align(
                            alignment: Alignment.center,
                            child: Text("30 min")
                        ),
                      ),
                      Tab(
                        child: Align(
                            alignment: Alignment.center,
                            child: Text("60 min")
                        ),
                      ),
                      Tab(
                        child: Align(
                            alignment: Alignment.center,
                            child: Text('Custom')
                        ),
                      ),
                    ],
                  ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(child: DurationWidget(time: "00:30:00",)),
                  Container(child: DurationWidget(time: "01:00:00",)),
                  Container(
                      color: Colors.white,
                     child: TimePickerWidget()

                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget dropDownListDuration(){
    return DropdownButton(
      dropdownColor: Colors.black,
      style: TextStyle(

      ),
      isExpanded: true,
      value: defaultIndex,
      onChanged: (newValue) {
        setState(() {
          defaultIndex = newValue;
        });
      },
      items: item.map((location) {
        return DropdownMenuItem(
          child: new Text(location, style: TextStyle(color: Colors.white, fontSize: 14, background: Paint())),
          value: location,
          onTap: (){
            selectedIndex = 2;
            String time = location.split(" ")[0];
            if(!time.contains("Others")){
              double hour = double.parse(time) / 60;
              int minute = int.parse(time) % 60;
              setState(() {
                selectedTime = null;
                selectedTime = format(Duration(hours: hour.toInt(), minutes: minute));
                print(selectedTime);
              });
              //print(format(Duration(hours: hour.toInt(), minutes: minute)));
              //DurationWidget(time: format(Duration(hours: hour.toInt(), minutes: minute)));
              //print("${hour.toInt()}:${minute}");
            }
          },
        );
      }).toList(),
    );
  }
  //split"." to remove .0000 and padleft 8chars
  format(Duration d) => d.toString().split('.').first.padLeft(8, "0");
}
