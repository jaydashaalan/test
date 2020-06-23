import 'package:flutter/material.dart';
import 'package:flutter_firebase/services/auth.dart';
import 'package:flutter_firebase/shared/constants.dart';
import 'package:flutter_firebase/shared/loading.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

//text field state

String email = '';
String password = '';
String error = '';


  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(

      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[800],
        elevation: 0.0,
        title: Text('Sign in to M-Life'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: () {
              widget.toggleView();
            }
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical:20.0, horizontal:50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height:20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email Address'),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);

                }
              ),
              SizedBox(height:20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                obscureText: true,
                validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (val) {
                  setState(() => password = val);

                }
              ),
              SizedBox(height:20.0),
              RaisedButton(
                color: Colors.green[60],
                child: Text (
                  'Sign in',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()){
                    setState(() => loading = true); 
                    dynamic result = await _auth.signInwithEmailandPassword(email, password);
                    if (result == null){
                      setState(() {
                        error = 'Could not sign in with these credentials';
                        loading = false;

                      } 
                      
                      );

                    }
                  }

                }
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color:Colors.red, fontSize:14.0),
              ),


            ],
          ),
        )

      ),

    );
  }
}