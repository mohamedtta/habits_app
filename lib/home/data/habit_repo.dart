import 'package:day_night_time_picker/lib/state/time.dart';

import '../../database/database.dart';

class HabitRepo{
  MyDatabase myDatabase = MyDatabase();

  Future addHabit(String habitName,String habitTime,Time time)async {
    if(time.period.name == 'pm'){
      myDatabase.insert_data("INSERT INTO `habit`(`habits`,`habit_time`) VALUES ('$habitName' , '$habitTime')");
    }else{
      myDatabase.insert_data("INSERT INTO `habit`(`habits`,`habit_time`) VALUES ('$habitName' , '$habitTime')");
    }
    var response = await myDatabase.show_data('SELECT * FROM habit ORDER BY id DESC');
    return response;
  }

  showHabits()async {
    var response = await myDatabase.show_data('SELECT * FROM `habit` ORDER BY id DESC');
    return response;
  }

  void deleteAllHabits()async{
    await myDatabase.delete_database();
  }

  Future deleteHabit(int id)async{
    await myDatabase.delete_data('Delete FROM `habit` WHERE id = $id');
  }


}