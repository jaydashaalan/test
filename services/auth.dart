import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/models/user.dart';
import 'package:flutter_firebase/services/database.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on firebaseuser
  User _userFromFirebaseUser(FirebaseUser user){

    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<User> get user {

    return _auth.onAuthStateChanged
    
    //.map((FirebaseUser user)=> _userFromFirebaseUser(user));
    .map(_userFromFirebaseUser);

  }

//sign in anon
Future signInanon() async {
try {
AuthResult result = await _auth.signInAnonymously();
FirebaseUser user = result.user;
return _userFromFirebaseUser(user);

} catch(e){
print(e.tostring());
return null;

}

}

//sign in with email and password
Future signInwithEmailandPassword(String email, String password) async {
try {
  AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
FirebaseUser user = result.user;
return _userFromFirebaseUser(user);
}catch(e){
print (e.toString());
return null;
}
}

//register with email and password
Future registerwithEmailandPassword(String email, String password) async {
try {
  AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
FirebaseUser user = result.user;

//create a new document for the user with uid
await DatabaseService(uid: user.uid).updateUserData('firstname', 'lastname', 0, 'example@example.com', 0, 0, 0, 'username' );

return _userFromFirebaseUser(user);
}catch(e){
print (e.toString());
return null;
}
}

//sign out
Future signOut() async {
  try { 
    return await _auth.signOut();

  }catch(e) {
    print(e.toString());
    return null;
  }


}

}