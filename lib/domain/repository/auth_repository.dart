import 'package:driver_reports/features/login/domain/entities/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepository {
  Stream<User?> get user;
  Future<void> SignIn(String email, String password);
  Future<void> SignOut();
}