import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formula1_fantasy/f1/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());
  // Sign in
  signIn(String email, String password) async {
    emit(AuthLoadingState());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthSuccessState(credential));
    } on FirebaseAuthException catch (e) {
      emit(AuthErrorState(e.toString()));
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }

      return;
    }
  }

  // Sign up
  signUp(String email, String password) async {
    emit(AuthLoadingState());
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      emit(AuthSuccessState(credential));
    } catch (e) {
      emit(AuthErrorState(e.toString()));
      return;
    }
  }

  // sign out
  signOut() async {
    await FirebaseAuth.instance.signOut();
    emit(AuthInitialState());
  }
}
