import 'package:firebase/models/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  //firebase instanace
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create a user from uid
  UserModel? _userWithFirebaseUserUid(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  //create the stream checking the auth changes user
  Stream<UserModel?> get user {
    return _auth.authStateChanges().map(_userWithFirebaseUserUid);
  }

  //Sign in Anonymous
  Future signInAnonymous() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userWithFirebaseUserUid(user);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

//Register using Email and Password
//Sign in using email and Password
//Sign in using Email
//Signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (err) {
      print(err.toString());
      return null;
    }
  }
}
