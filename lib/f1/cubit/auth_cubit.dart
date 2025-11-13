import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formula1_fantasy/f1/cubit/auth_state.dart';
import 'package:formula1_fantasy/f1/data/firebase/firebase.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  // Check if logged in
  checkIfLoggedIn() {
    if (FirebaseAuth.instance.currentUser != null) {
      emit(AuthSuccessState(FirebaseAuth.instance.currentUser!));
    }
    //   is a getter that returns the currently signed-in user(User) in your app, or null if no user is signed in.
  }

  // Sign in
 Future<void> signIn(String email, String password) async {
    emit(AuthLoadingState());
    try {
      final credential = await FirebaseAuthServices.signIn(email, password);
      emit(AuthSuccessState(credential!.user! ));
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

  // Sign

// AuthCubit
 signUp(String email, String password, String username) async {
    emit(AuthLoadingState());
    try {
      final credential = await FirebaseAuthServices.signUp(email, password, username);
      emit(AuthSuccessState(credential.user!));
    } on FirebaseAuthException catch (e) {
      emit(AuthErrorState(e.message ?? 'Registration failed'));
    }
  }


  // sign out
  signOut() async {
    await FirebaseAuthServices.signOut();
    emit(AuthInitialState());
  }



  // updateUserName(String name)async{
  //   emit(AuthLoadingState());
  //    await FirebaseAuth.instance.currentUser?.updateDisplayName(name);
  //    emit(AuthSuccessState(FirebaseAuth.instance.currentUser!));
  // }
}
