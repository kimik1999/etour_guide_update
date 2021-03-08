import 'dart:ui';

import 'package:flutter/material.dart';


class MapTouchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return IgnorePointer(
      ignoring: true,
      child: Container(
        color: Colors.black.withOpacity(0.8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ImageIcon(
                AssetImage(
                  "assets/images/icon_pinch.png"
                ),
                color: Colors.white,
                size: 100,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Zoom in/Zoom out by pinch with your fingers',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '<Tab to Start>',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
