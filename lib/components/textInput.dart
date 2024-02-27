import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget{


  // ignore: prefer_typing_uninitialized_variables
  final textInput;
  final bool  masquefield ;

  final TextEditingController controller;

  const TextInputField ({super.key, required this.textInput, required this.masquefield  , required this.controller});
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:25.0),

      child: TextField(
        obscureText: masquefield,
        controller:controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary)

          ),
          fillColor:Theme.of(context).colorScheme.tertiary,
          filled: true,
          hintText: textInput,



        ),
      ),
    );
  }

}