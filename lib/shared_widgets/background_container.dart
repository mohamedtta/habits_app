import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  Widget myChild;
  BackgroundContainer({super.key , required this.myChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/forest.jpg'),
          )
      ),
      child: myChild,
    );
  }
}
