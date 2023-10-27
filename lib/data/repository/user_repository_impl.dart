import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver_reports/features/login/domain/entities/user.dart';
import 'package:driver_reports/features/login/domain/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class UserRepositoryImplementation implements UserRepository{
  final FirebaseAuth _firebaseAuth;
  final userCollection = FirebaseFirestore.instance.collection("users");
 UserRepositoryImplementation({FirebaseAuth? firebaseAuth,})
:_firebaseAuth=firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<void> SignIn(String email, String password) async {
    try{
     UserCredential userCredentials = await _firebaseAuth.signInWithEmailAndPassword(email:email, password: password);
    }on FirebaseAuthException catch (e){
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else if (e.message!.contains('The email address is badly formatted.'))
      {
        print('Invalid password provided for that user.');
      }
    }
  }

  @override  
  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUSer)
    => firebaseUSer);
  }
  
  @override
  Future<void> SignOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }

  // Future<void> signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //     final GoogleSignInAuthentication? googleAuth =
  //         await googleUser?.authentication;

  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth?.accessToken,
  //       idToken: googleAuth?.idToken,
  //     );

  //     await FirebaseAuth.instance.signInWithCredential(credential);
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
}
 
