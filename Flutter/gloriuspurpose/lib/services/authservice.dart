import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService
{

  static Future<bool> signInWithGoogle() async {
    try {

      print("inside Function");
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      print("User Cred $credential");
      final userCred = await FirebaseAuth.instance.signInWithCredential(credential);

      print(userCred.user!.photoURL);
      if(userCred!=null){
        return true;
      }

    }catch (e) {
      print('exception->$e');
    }

    return false;
  }

}