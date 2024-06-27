import '../../database/database.dart';

class DoneHabitRepo{
  MyDatabase myDatabase = MyDatabase();

  addDoneHabits(String habitName , String habitTime , String habitDate)  {
    myDatabase.insert_data("INSERT INTO `done_habits`(`habits`,`habit_time`,`habit_date`) VALUES ('$habitName' , '$habitTime' , '$habitDate')");
    print('done');
  }

  showDoneHabits()async {
    var response = await myDatabase.show_data('SELECT * FROM `done_habits` ORDER BY id DESC');
    return response;
  }


}