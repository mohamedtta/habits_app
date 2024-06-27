import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit/history/logic/done_habits_cubit.dart';
import 'package:habit/home/logic/habit_cubit.dart';
import '../../../history/ui/screens/history_screen.dart';

class ShowHistoryButton extends StatelessWidget {
  const ShowHistoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>
            BlocProvider<DoneHabitsCubit>(
              create: (context) => DoneHabitsCubit(),
              child: const HistoryScreen(),
            )));
      },
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(15)
        ),
        child: const Text(
          'Show History', style: TextStyle(fontWeight: FontWeight.bold),),

      ),
    );
  }
}
