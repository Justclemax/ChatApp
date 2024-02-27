import 'package:flutter/material.dart';

class UserTitle extends StatelessWidget {

  final String text ;
  final void Function()? ontap;
  const UserTitle ({super.key, required this.text, required this.ontap});
  @override
  Widget build(BuildContext context) {
     return GestureDetector(
       onTap: ontap,
       child: Container(
         decoration: BoxDecoration(
           color: Theme.of(context).colorScheme.secondary,
           borderRadius: BorderRadius.circular(12),
         ),
         margin: EdgeInsets.all(10),
         padding: EdgeInsets.all(23),
         child: Row(
           children: [
             Icon(Icons.person),
             const SizedBox(width: 10,),
             Text(text, style: TextStyle(fontSize: 20),)
           ],
         ),
       ),
     );
  }
}