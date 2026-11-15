import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modul_6/screens/profile_screen.dart';
import 'package:modul_6/screens/signin_screen.dart';
import 'package:modul_6/screens/todo_screen.dart';
import 'package:modul_6/services/auth/auth_services.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return StreamBuilder(
        stream: _auth.authStateChanges,
        builder: (context, snapshot){
          if(snapshot.hasData){
            return TodoScreen();
          }else {
            return SignInScreen();
          }
        }
    );
  }
}
