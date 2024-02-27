import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget{

  final  String texts ;
  final void Function()? onTap;
  const  SubmitButton ({super.key, required this.texts, required this.onTap});

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration:  BoxDecoration(
            color :Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(horizontal: 80),
          child: Center(
            child:  Text(texts,
            style: TextStyle(
                color: Colors.black,
              fontSize: 20
            ),


            ),

        ),
      ),
    );
  }
}