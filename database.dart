import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase/models/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

//collection reference
final CollectionReference userCollection = Firestore.instance.collection('User');

Future updateUserData(String firstName, String lastName, int levelID, String mailadress, int pointStatus, int ridesTaken, int tipsRead, String username) async {
  return await userCollection.document(uid).setData({
    'firstName': firstName,
    'lastName': lastName,
    'levelID': levelID,
    'mailadress': mailadress,
    'pointStatus': pointStatus,
    'ridesTaken': ridesTaken,
    'tipsRead': tipsRead,
    'username': username,

  }); 
}

//user data from snapshot
UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
  return UserData(
    uid: uid,
    firstName: snapshot.data['firstname'],
    lastName: snapshot.data['lastname'],
    levelID: snapshot.data['levelID'],
    mailadress: snapshot.data['mailadress'],
    pointStatus: snapshot.data['pointStatus'],
    ridesTaken: snapshot.data['ridesTaken'],
    tipsRead: snapshot.data['tipsRead'],
    username: snapshot.data['username'],
  );
}

//get user doc stream
Stream<UserData> get userData {
  return userCollection.document(uid).snapshots()
  .map(_userDataFromSnapshot);
}

}