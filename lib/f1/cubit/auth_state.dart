import 'package:firebase_auth/firebase_auth.dart';

class AuthStates {}
class AuthInitialState extends AuthStates{}
class AuthLoadingState extends AuthStates{}
class AuthSuccessState extends AuthStates{
  final User user;
  AuthSuccessState(this.user);
}
class AuthErrorState extends AuthStates{
  final String error;
  AuthErrorState(this.error);
}