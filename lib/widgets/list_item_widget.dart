import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_app/models/item.dart';

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Item>(
      builder: (_, item, child) {
        return (item.isActive)
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  elevation: 5,
                  child: Container(
                    decoration: BoxDecoration(
                        color: item.isTimerActive()
                            ? Colors.white
                            : Colors.yellow),
                    padding: const EdgeInsets.all(8),
                    height: 100,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            item.time,
                            style: TextStyle(
                                color: item.remainingSeconds < 30
                                    ? Colors.red
                                    : Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          TextButton(
                              onPressed: () {
                                if (item.isTimerActive()) {
                                  item.pauseTimer();
                                } else {
                                  item.resumeTimer();
                                }
                              },
                              child:
                                  Text(item.isTimerActive() ? "Stop" : "Start"))
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : Container();
      },
    );
  }
}
