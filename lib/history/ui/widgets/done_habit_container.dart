import 'package:flutter/material.dart';

import '../../../theme/my_fonts.dart';

class DoneHabitContainer extends StatelessWidget {
  String habitName;
  String habitTime;
  String habitDate;

  DoneHabitContainer({super.key,required this.habitName,required this.habitTime,required this.habitDate});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        alignment: Alignment.center,
        padding:
          const EdgeInsets.symmetric(vertical: 20),
        margin:
          const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(15)),
          child: ListTile(
            title: Text(
                  habitName,
                  style: MyFonts.f20bold,
                ),
            subtitle: Text(
              habitTime
            ),
            trailing: Text(
              habitDate

            ),
          ),

      ),
    );
  }
}
