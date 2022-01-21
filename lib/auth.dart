import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tree/user.dart';


class AuthService extends ChangeNotifier {
  
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  user? generaluser;
  String? theError;

  void setTheError(String? err) {
    theError = err;
    notifyListeners();
  }

  void setTheGeneralUser(user theuser) {
    generaluser = theuser;
    notifyListeners();
  }

  Future<bool> fetchUserInfo(String uid) async {
    DocumentSnapshot _userSnap =
        await _firebaseFirestore.collection('links').doc('xPsgCpGNiPV4g84k6c4A').get();
    if (_userSnap.exists) {
          user _generalUser =
          user.fromMap(_userSnap.data() as Map<String, dynamic>);
      setTheGeneralUser(_generalUser);
      return true;
    } else {
      return false;
    }
  }

  User? theUser = FirebaseAuth
      .instance.currentUser; 

  void setTheUser(User? user) {
    theUser = user;
    notifyListeners();
  }
}
