import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_app/models/item.dart';
import 'package:timer_app/providers/data_provider.dart';
import 'package:timer_app/widgets/list_item_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Consumer<DataProvider>(
          builder: (_, dataProvider, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.05),
                    height: size.height * 0.19,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          width: size.width * 0.35,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: dataProvider.minutesController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Minutes',
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          width: size.width * 0.35,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: dataProvider.secondsController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Seconds',
                            ),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              dataProvider.validateInput();
                            },
                            child: const Text("Add"))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                    child: Text(
                      dataProvider.message,
                      style: const TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),
                  (dataProvider.items.isNotEmpty)
                      ? ListView.builder(
                        reverse: true,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: dataProvider.items.length,
                          itemBuilder: (context, index) {
                            return ChangeNotifierProvider<Item>(
                                create: (context) => dataProvider.items[index],
                                child: const ListItemWidget());
                          })
                      : Container()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
