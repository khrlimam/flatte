import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseAuth {
  Future<String> signIn();
  Future<FirebaseUser> getCurrentUser();
  Future<void> signOut();

}

class Auth implements BaseAuth {

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String nama;
  String gambar;



  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _auth.currentUser();
    return user;
  }

  Future<void> signOut() async {
    _googleSignIn.signOut();
    return _auth.signOut();
  }

  @override
  Future<String> signIn() async {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: gSA.accessToken,
      idToken: gSA.idToken,
    );

    final FirebaseUser user = await _auth.signInWithCredential(credential);
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

//    setState((){
    updateData(user.displayName, user.photoUrl);
//    });
//    _alertDialog();

    print("Nama User : $user");
    return user.uid;
  }
  void updateData(namar,gambarr) {
//  setState(() {
    nama = namar;
    gambar = gambarr;
//  });
  }

}