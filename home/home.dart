import 'package:flutter/material.dart';
import 'package:flutter_firebase/services/auth.dart';
//import 'package:flutter_firebase/services/database.dart';
//import 'package:provider/provider.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(

          title: Text('M-Life'),
          backgroundColor: Colors.blueGrey[800],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign out'),
            onPressed: () async  {
              await _auth.signOut();
            },
            )
          ],
          
          //body: remaining items in the homepage?


          ),


    );
  }
}