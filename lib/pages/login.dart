import 'package:flutter/material.dart';
import 'package:chatapp/components/textInput.dart';
import 'package:chatapp/components/button.dart';
import 'package:chatapp/auth/auth.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  final void Function()? onTap;

  // Fix: Pass the function reference, not calling it immediately
  LoginPage({Key? key, required this.onTap});

  // Fix: Make the onTap callback nullable
  void login(BuildContext context) async {
    final authUser = AuthUser();

    try {
      await authUser.signInWithEmailPassword(
          _emailController.text, _pwController.text);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.apple,
              size: 70,
              ),
            const SizedBox(height: 30),
            Text(
              "Bienvenue",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 40),
            TextInputField(
              textInput: "Email",
              masquefield: false,
              controller: _emailController,
            ),
            const SizedBox(height: 30),
            TextInputField(
              textInput: "Mot de passe",
              masquefield: true,
              controller: _pwController,
            ),
            const SizedBox(
              height: 40,
            ),
            SubmitButton(
              // Fix: Pass the function reference, not calling it immediately
              onTap: ()  => login(context),
              texts: "Se connecter",
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Pas de compte ? "),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Créer un compte",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
