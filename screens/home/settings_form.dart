import 'package:flutter/material.dart';
import 'package:flutter_firebase/services/database.dart';
import 'package:flutter_firebase/shared/constants.dart';
import 'package:flutter_firebase/models/user.dart';
import 'package:flutter_firebase/shared/loading.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  
  //form values
  String _firstName;
  String _lastName;
  String _mailadress;
  String _username;



  @override
  Widget build(BuildContext context) {
       
       final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData){
          UserData userData = snapshot.data;
          return Form(
          
          child: Column(
            children: <Widget>[
              Text(
                'Update your user settings',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height:20.0),
              TextFormField(
                initialValue: userData.firstName,
                decoration: textInputDecoration,
                validator: (val) => val.isEmpty ? 'Please enter your first name' : null,
                onChanged: (val) => setState(() => _firstName = val),
              ),
              SizedBox(height:20.0),
              TextFormField(
                initialValue: userData.lastName,
                decoration: textInputDecoration,
                validator: (val) => val.isEmpty ? 'Please enter your last name' : null,
                onChanged: (val) => setState(() => _lastName = val),
              ),
              SizedBox(height:20.0),
              TextFormField(
                initialValue: userData.mailadress,
                decoration: textInputDecoration,
                validator: (val) => val.isEmpty ? 'Please enter your email address' : null,
                onChanged: (val) => setState(() => _mailadress = val),
              ),
              SizedBox(height:20.0),
              TextFormField(
                initialValue: userData.username,
                decoration: textInputDecoration,
                validator: (val) => val.isEmpty ? 'Please enter your username' : null,
                onChanged: (val) => setState(() => _username = val),
              ),
              RaisedButton (
                color: Colors.grey[400],
                  
                  child: Text (
                    'Update',
                    style: TextStyle(color: Colors.white),
                    
                  ),
                  onPressed: () async { 
                    print(_firstName);
                    print(_lastName);
                    print(_mailadress);
                    print(_username);

                   }
                ),
            ],
          ),
          
        );

        }else {
          return Loading(); 

        }
        
      }
    );
  }
}