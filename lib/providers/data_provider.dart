import 'package:flutter/material.dart';
import 'package:timer_app/models/item.dart';

class DataProvider extends ChangeNotifier {
  List<Item> items = <Item>[];

  String message = "";

  TextEditingController minutesController = TextEditingController();
  TextEditingController secondsController = TextEditingController();

  void addTimer(int minutes, int seconds) {
    Item newItem = Item(minutes, seconds);
    newItem.startTimer();
    items.add(newItem);
    notifyListeners();
  }

  void validateInput() {
    message = "";
    notifyListeners();

    if (minutesController.text.isEmpty) {
      message = "* Minutes required.";
      notifyListeners();
    } else if (secondsController.text.isEmpty) {
      message = "* Seconds required.";
      notifyListeners();
    } else {
      int min = int.tryParse(minutesController.text) ?? 0;
      if (min >= 59) {
        message = "* Minute value cannot be 59 or more.";
        notifyListeners();
        return;
      }

      int sec = int.tryParse(secondsController.text) ?? 0;
      if (sec > 60) {
        message = "* Seconds value cannot be 59 or more.";
        notifyListeners();
        return;
      }

      if(min == 0 && sec == 0){
         message = "* Please add atleast seconds value.";
        notifyListeners();
        return;
      }

      int activeTimers = items.where((item) => item.isActive).length;
      if (activeTimers < 10) {
        addTimer(min, sec);
        resetControllers();
      } else {
        message = "* Only 10 timers allowed at a time.";
        notifyListeners();
      }
    }
  }

  void saveTimer() {}

  void resetControllers() {
    minutesController.clear();
    secondsController.clear();
  }
}
