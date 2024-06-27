import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit/history/data/done_habit_repo.dart';
import 'package:habit/shared_widgets/my_button.dart';
import '../../../theme/my_fonts.dart';
import '../../logic/habit_cubit.dart';

class HabitContainer extends StatefulWidget {
  int index;
  Widget deleteIcon;
  HabitContainer({super.key,required this.index ,this.deleteIcon = const Icon(Icons.ac_unit,)});

  @override
  State<HabitContainer> createState() => _HabitContainerState();
}

class _HabitContainerState extends State<HabitContainer> {
  late DateTime dateTime;
  @override
  Widget build(BuildContext context) {
    String habitName = '${context.read<HabitCubit>().habits[widget.index]['habits']}';
    String habitTime = "${context.read<HabitCubit>().habits[widget.index]['habit_time']}";
    return Container(
      margin:
      const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: widget.deleteIcon,
        title: Text(
          habitName,
          style: MyFonts.f20bold,
        ),
        subtitle: Text(habitTime),
        trailing: MyButton(
          text: 'Done',
          buttonColor: Colors.greenAccent,
          onTap: (){
          dateTime = DateTime.now();
          String habitDate = "${dateTime.day}/${dateTime.month}/${dateTime.year}";
          DoneHabitRepo().addDoneHabits(habitName,habitTime,habitDate);
          context.read<HabitCubit>().deleteHabit(widget.index);
        },)
      )
    );
  }
}
