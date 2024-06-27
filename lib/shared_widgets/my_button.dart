import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  void Function()? onTap;
  String text;
  Color buttonColor;
  MyButton({super.key , required this.text , required this.onTap ,this.buttonColor = Colors.green});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(15)
        ),
        child: Text(text,style: const TextStyle(fontWeight: FontWeight.bold),),
      ),
    );
  }
}
