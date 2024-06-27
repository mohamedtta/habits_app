part of 'done_habits_cubit.dart';

@immutable
sealed class DoneHabitsState {}

final class DoneHabitsInitial extends DoneHabitsState {}


final class DoneHabitsLoaded extends DoneHabitsState {
  List myHabit;
  DoneHabitsLoaded({required this.myHabit});
}
