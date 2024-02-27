import 'package:chatapp/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/components/button.dart';
import 'package:chatapp/components/textInput.dart';

class RegisterPage extends StatelessWidget{
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final void Function()? onTap;
  final TextEditingController _confirmpwController = TextEditingController();
  // La fonction de la connection
  void register(BuildContext context) {
    final _auth = AuthUser();

    if (_pwController.text == _confirmpwController.text) {
      if (_pwController.text.length >= 6) {
        try {
          _auth.signUpWithEmailPassword(
              _emailController.text, _pwController.text, _nameController.text);
        } catch (e) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(e.toString()),
            ),
          );
        }
      } else {
        // Afficher un message d'erreur si le mot de passe a moins de 6 caractères
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Le mot de passe doit contenir au moins 6 caractères."),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Les mots de passe ne correspondent pas."),
        ),
      );
    }
  }

  RegisterPage ({super.key, required this.onTap});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
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
              textInput: "Prénom",
              masquefield: false,
              controller: _nameController,
            ),
            const SizedBox(height: 40),
            TextInputField(
              textInput: "Email",
              masquefield: false,
              controller: _emailController,
            ),
            const SizedBox(height: 30),
            TextInputField(
              textInput: "Créer le mot de passe",
              masquefield: true,
              controller: _pwController,
            ),
            const SizedBox(height: 30),
            TextInputField(
              textInput: "Confirmer un mot de passe",
              masquefield: true,
              controller: _confirmpwController,
            ),
            const SizedBox(height: 40,),

            SubmitButton(

              texts: "Créer ",
              onTap: ()  => register(context)

            ),

            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("J'ai déjà un compte ? "),

                GestureDetector(
                  onTap: onTap,
                  child: Text("Se connecter",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      )
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