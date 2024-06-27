import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit/home/logic/habit_cubit.dart';
import 'package:habit/home/ui/widgets/add_habit_button.dart';
import 'package:habit/home/ui/widgets/habit_container.dart';
import 'package:habit/home/ui/widgets/show_history_button.dart';
import 'package:habit/shared_widgets/background_container.dart';
import '../../../shared_widgets/my_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HabitCubit>(context).showHabits();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        myChild: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     AddHabitButton(),
                    context.read<HabitCubit>().deleteMode
                        ? MyButton(
                            text: 'Cancel',
                            buttonColor: Colors.red,
                            onTap: () {
                              context.read<HabitCubit>().changeDeleteMode();
                              setState(() {});
                            })
                        : MyButton(
                            text: 'Delete habit',
                            onTap: () {
                              context.read<HabitCubit>().changeDeleteMode();
                              setState(() {});
                            }),
                  ],
                ),
                BlocBuilder<HabitCubit, HabitState>(builder: (context, state) {
                  if (state is HabitInitial) {
                    return const Text('');
                  } else if (state is HabitsLoaded) {
                    return context.read<HabitCubit>().deleteMode
                        ? Expanded(
                            child: ListView.builder(
                                itemCount:
                                    context.read<HabitCubit>().habits.length,
                                itemBuilder: (context, i) {
                                  return HabitContainer(index: i , deleteIcon:   IconButton(
                                    onPressed: () {
                                      context
                                          .read<HabitCubit>()
                                          .deleteHabit(i);
                                    },
                                    icon: const Icon(Icons.delete),
                                    color: Colors.red,
                                  ),);
                                }),
                          )
                        : Expanded(
                            child: ListView.builder(
                                itemCount:
                                    context.read<HabitCubit>().habits.length,
                                itemBuilder: (context, i) {
                                  return HabitContainer(index:i);
                                }),
                          );
                  } else {
                    return const CircularProgressIndicator(
                      strokeWidth: 4,
                      color: Colors.blue,
                    );
                  }
                })
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: const ShowHistoryButton()
    );
  }
}
