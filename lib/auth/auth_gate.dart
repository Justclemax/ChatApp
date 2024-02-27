import 'package:chatapp/auth/log_or_reg.dart';
import 'package:chatapp/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}); // Fix the constructor syntax

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            // Fix the typo in the 'return' statement
            return const LoginOrRegister(); // Fix the typo in the class name
          }
        },
      ),
    );
  }
}
