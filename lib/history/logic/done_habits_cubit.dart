import 'package:bloc/bloc.dart';
import 'package:habit/history/data/done_habit_repo.dart';
import 'package:meta/meta.dart';
part 'done_habits_state.dart';

class DoneHabitsCubit extends Cubit<DoneHabitsState> {
  DoneHabitsCubit() : super(DoneHabitsInitial());

  DoneHabitRepo doneHabitRepo = DoneHabitRepo();
  List doneHabits = [];


  void showDoneHabits()async{
    var response = await doneHabitRepo.showDoneHabits();
    doneHabits.addAll(response);
    emit(DoneHabitsLoaded(myHabit: doneHabits));
  }

}
