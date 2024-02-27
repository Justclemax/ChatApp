import 'package:flutter/material.dart';
import 'package:chatapp/pages/login.dart';
import 'package:chatapp/pages/register.dart';
class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool loginPage = true;
  void swicthPages(){
    setState(() {
      loginPage = !loginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(loginPage){
      return LoginPage(
        onTap: swicthPages,
      );
    } else {
      return  RegisterPage(onTap: swicthPages,);
    }
    ;
  }
}
