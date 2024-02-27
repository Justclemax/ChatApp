import 'package:chatapp/auth/auth_gate.dart';
import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/pages/register.dart';
import 'package:chatapp/themes/ligth.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/auth/log_or_reg.dart';
import 'package:firebase_core/firebase_core.dart';


void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: MyMode,
    );
  }
}

