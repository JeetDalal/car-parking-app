import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<User?> signInWithGoogle() async {
  try {
    // Trigger the Google Sign In flow.
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      // Obtain the auth details from the request.
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      // Create a new credential.
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      // Sign in to Firebase with the Google credential.
      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      final User? user = authResult.user;

      assert(!user!.isAnonymous);

      assert(await user!.getIdToken() != null);

      final User? currentUser = _auth.currentUser;
      assert(user!.uid == currentUser!.uid);

      print('signInWithGoogle succeeded: $user');

      return user;
    }
    return null; // If user cancels the sign-in process
  } catch (e) {
    print(e.toString());
    return null;
  }
}

void signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Signed Out");
}
