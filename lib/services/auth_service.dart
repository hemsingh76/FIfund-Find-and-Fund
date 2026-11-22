import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> get authStateChanges => _auth.authStateChanges();
  User? get currentUser => _auth.currentUser;   //gets current user

  Future<String?> register(String email, String password, {String? name}) async{
    try{
      final cred= await _auth.createUserWithEmailAndPassword(email: email.trim(), password: password);

      // Save user's name in Firebase profile
      if (name != null && name.trim().isNotEmpty) {
        await cred.user?.updateDisplayName(name.trim());
      }


      return null;
    }


    on FirebaseAuthException catch(e){
      return _message(e.code);
    }

  }

  Future<String?> login(String email, String password) async{
    try{
      await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      return null;
    }
    on FirebaseAuthException catch(e){
      return _message(e.code);
    }

  }

  Future<void> logout() => _auth.signOut();

  String _message(String code){
    switch(code){
      case 'email-already-in-use':
        return 'An account already exists for that email.';
      case 'invalid-email':
        return 'That email address looks invalid.';
      case 'weak-password':
        return 'Password must be at least 6 characters.';
      case 'user-not-found':
      case 'wrong-password':
      case 'invalid-credential':
        return 'Incorrect email or password.';
      case 'too-many-requests':
        return 'Too many attempts. Try again later.';
      case 'network-request-failed':
        return 'No internet connection.';
      default:
        return 'Something went wrong ($code).';
    }
  }



}
