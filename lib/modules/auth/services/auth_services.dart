import 'package:firebase_auth/firebase_auth.dart';

class AuthServices{
  static Future<UserCredential> createAccount(String email , String password,String name)async{
    try {
      final credential = await FirebaseAuth
          .instance.
      createUserWithEmailAndPassword(
          email:email , password: password);
     await credential.user!.updateDisplayName(name);
     await credential.user!.sendEmailVerification();
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw "The password provided is too weak.";
      } else if (e.code == 'email-already-in-use') {
        throw "The account already exists for that email.";
      }
      else{
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<UserCredential> login(String email , String password)async{
    try {
      final credential = await FirebaseAuth
          .instance.
      signInWithEmailAndPassword(
          email:email , password: password);
      return credential;

    } catch (e) {
      throw "Invalid Email orPassword";
    }
  }
}