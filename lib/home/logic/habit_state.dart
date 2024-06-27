part of 'habit_cubit.dart';

@immutable
sealed class HabitState {}

final class HabitInitial extends HabitState {}
final class HabitsLoaded extends HabitState {
  List myHabit;
  HabitsLoaded({required this.myHabit});
}
