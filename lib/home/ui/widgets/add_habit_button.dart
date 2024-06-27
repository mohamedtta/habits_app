import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared_widgets/my_button.dart';
import '../../../shared_widgets/my_form.dart';
import '../../logic/habit_cubit.dart';

class AddHabitButton extends StatelessWidget {
  DateTime dateTime = DateTime.now();
  AddHabitButton({super.key});

  @override
  Widget build(context) {
    return MyButton(
        onTap: () {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: MyForm(
                        controller: context.read<HabitCubit>().habitController,
                        text: 'Habit Name'),
                    content: BlocBuilder<HabitCubit, HabitState>(
                      builder: (context, state) {
                        return TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              showPicker(
                                context: context,
                                is24HrFormat: false,
                                value: context.read<HabitCubit>().time ,
                                sunrise: const TimeOfDay(hour: 6, minute: 0), // optional
                                sunset: const TimeOfDay(hour: 18, minute: 0), // optional
                                duskSpanInMinutes: 120, // optional
                                onChange: (myTime){
                                  context.read<HabitCubit>().setTime(myTime);
                                },
                              ),
                            );
                          },
                          child:  context.read<HabitCubit>().time.period.name == 'pm' ? Text(
                            "${context.read<HabitCubit>().time.hour - 12} ${context.read<HabitCubit>().time.minute} ${context.read<HabitCubit>().time.period.name}",
                          ): Text(
                            "${context.read<HabitCubit>().time.hour} ${context.read<HabitCubit>().time.minute} ${context.read<HabitCubit>().time.period.name}",
                          ),
                        );
                      },
                    ),
                    actions: [
                      MyButton(
                          text: 'Add',
                          onTap: () {
                            context.read<HabitCubit>().addHabit();
                          })
                    ],
                  ));
        },
        text: 'Add habit');
  }
}
