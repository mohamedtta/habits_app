import 'package:bloc/bloc.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit/history/data/done_habit_repo.dart';
import 'package:habit/home/data/habit_repo.dart';
part 'habit_state.dart';

class HabitCubit extends Cubit<HabitState> {
  HabitCubit() : super(HabitInitial());


  TextEditingController habitController = TextEditingController();
  List habits = [];
  bool deleteMode = false;
  HabitRepo habitRepo = HabitRepo();
  Time time = Time(hour: 11, minute: 30);


  void setTime(timeValue){
    time = timeValue;
    emit(HabitsLoaded(myHabit: habits));
  }

  void addHabit()async{
    var response  = await habitRepo.addHabit(habitController.text, "${time.hour}:${time.minute}:${time.period.name}" , time);
    habits.insert(0,response[0]);
    emit(HabitsLoaded(myHabit: habits));
  }

  void showHabits()async{
    var response = await habitRepo.showHabits();
    habits.addAll(response);
    emit(HabitsLoaded(myHabit: habits));
  }


  void deleteHabit(int index)async{
    await habitRepo.deleteHabit(habits[index]['id']);
    habits.removeAt(index);
    emit(HabitsLoaded(myHabit: habits));
  }
  void changeDeleteMode(){
    deleteMode = !deleteMode;
  }
}
