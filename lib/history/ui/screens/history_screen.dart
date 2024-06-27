import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit/history/logic/done_habits_cubit.dart';
import 'package:habit/history/ui/widgets/done_habit_container.dart';
import 'package:habit/shared_widgets/background_container.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DoneHabitsCubit>(context).showDoneHabits();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        myChild: BlocBuilder<DoneHabitsCubit, DoneHabitsState>(
          builder: (context, state) {
            if(state is DoneHabitsLoaded){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: ListView.builder(
                    itemCount: context.read<DoneHabitsCubit>().doneHabits.length,
                    itemBuilder: (context, index) {
                      return DoneHabitContainer(
                        habitName: context.read<DoneHabitsCubit>().doneHabits[index]
                        ['habits'],
                        habitTime: context.read<DoneHabitsCubit>().doneHabits[index]['habit_time'],
                        habitDate: context.read<DoneHabitsCubit>().doneHabits[index]['habit_date'],
                      );
                    },
                  ),
              );
            }else{
              return const CircularProgressIndicator(backgroundColor: Colors.green,strokeWidth: 4,);
            }
          },
        ),
      ),
    );
  }
}
