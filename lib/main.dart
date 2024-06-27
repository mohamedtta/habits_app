import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit/home/logic/habit_cubit.dart';
import 'home/ui/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HabitCubit>(
      create: (context) => HabitCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Habit App',
        home: HomePage(),
      ),
    );
  }
}


