import 'dart:async';

import 'package:flutter/foundation.dart';

class Item extends ChangeNotifier{
  int minute =0;
  int seconds = 0;
  Timer? _timer;
  String time = "--:--";
  int remainingSeconds = 1;
  bool isActive = true;

  Item(this.minute,this.seconds);

  void startTimer({int? value}){
    int totalSeconds = value ?? minute * 60 + seconds;
    var duration = const Duration(seconds: 1);
    remainingSeconds = totalSeconds;

    _timer = Timer.periodic(duration, (Timer timer) { 
      if(remainingSeconds == 0){
      isActive = false;
      timer.cancel();
      }else{
        int min =   remainingSeconds ~/ 60;
        int sec = remainingSeconds % 60;
        time = "${min.toString().padLeft(2, "0")}:${sec.toString().padLeft(2, "0")}";
        remainingSeconds--;
    }
        notifyListeners();
    });
  }

  void pauseTimer(){
    _timer?.cancel();
    notifyListeners();
  }

  void resumeTimer(){
    startTimer(value:remainingSeconds);
  }

  bool isTimerActive(){
    return _timer?.isActive ?? false;
  }
}