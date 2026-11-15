import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // Signleton Pattern -> 1 objek
  static final AuthService _instace = AuthService._internal();
  AuthService._internal();

  factory AuthService(){
    return _instace;
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Sign Up
  Future<User?> signUp(String email, String password) async{
    try{
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      return credential.user;
    }catch (e) {
      print('Error Sign Up : $e');
    }
  }

  // Sign In
  Future<User?> signIn(String email, String password) async{
    try{
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return credential.user;
    }catch (e) {
      print('Error Sign In : $e');
    }
  }

  // Sign Out
  Future<void> signOut() async {
    await _auth.signOut();
  }

}