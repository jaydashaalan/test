import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[50],
      child: Center (
        child: SpinKitThreeBounce(
          color: Colors.green,
          size: 900,
          ),
          ),
      
    );
  }
}