import 'package:flutter_firebase/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:flutter_firebase/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   //return either home or authenticate widget

   final user = Provider.of<User>(context);
    //print(user);
    //return Home();   
      //return Authenticate();

      if (user == null) {
        return Authenticate();
      }else {
        return Home();
      }
    
  }
}