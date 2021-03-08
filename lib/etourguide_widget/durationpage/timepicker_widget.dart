
import 'package:flutter/material.dart';
import 'package:flutter_duration_picker/flutter_duration_picker.dart';
import 'package:flutter_etourguide/etourguide_widget/durationpage/duration_widget.dart';


class TimePickerWidget extends StatefulWidget {

  @override
  _TimePickerWidgetState createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  String time = null;
  String selectedIndex = 'Others';
  List<String> item = ['Others', '90 min', '120 min', '150 min', '180 min'];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Container(
        color: Colors.white,
       child: time != null ? DurationWidget(time: time,) : null,
      ),
      floatingActionButton: Builder(
          builder: (BuildContext context) => new FloatingActionButton(
            onPressed: () async {
              Duration resultingDuration = await showDurationPicker(
                snapToMins: 5,
                context: context,
                initialTime: new Duration(minutes: 0),
              );
              setState(() {
                time = resultingDuration.toString().padLeft(8, "0").split('.')[0];
              });
              //print(resultingDuration.toString().padLeft(8, "0").split('.')[0]);

//              Scaffold.of(context).showSnackBar(new SnackBar(
//                  content: new Text("Chose duration: $time"),
//
//              ));
            },
            tooltip: 'Popup Duration Picker',
            child: new Icon(Icons.access_time),
          )),
    );
  }

}
