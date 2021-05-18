import 'package:cv_action_chonnguoiduyet/Components/dialog.dart';
import 'package:flutter/material.dart';

import 'Models/popup_Dialog.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Checkbox Dialog Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Checkbox Dialog Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ItemModel> itemList = <ItemModel>[];

  @override
  void initState() {
    itemList = <ItemModel>[
      ItemModel("asset/avatart.jpg", "Ngô An Bình", "IT"),
      ItemModel("asset/avatart.jpg", "name2", "subName2"),
      ItemModel("asset/avatart.jpg", "name3", "subName3"),
      ItemModel("asset/avatart.jpg", "name4", "subName4"),
      ItemModel("asset/avatart.jpg", "name5", "subName5"),
      ItemModel("asset/avatart.jpg", "name6", "subName6"),
      ItemModel("asset/avatart.jpg", "name7", "subName7"),
      ItemModel("asset/avatart.jpg", "name7", "subName7"),
      ItemModel("asset/avatart.jpg", "name7", "subName7"),
      ItemModel("asset/avatart.jpg", "name7", "subName7"),
      ItemModel("asset/avatart.jpg", "name7", "subName7"),
      ItemModel("asset/avatart.jpg", "name7", "subName7"),
      ItemModel("asset/avatart.jpg", "name7", "subName7"),
      ItemModel("asset/avatart.jpg", "name7", "subName7"),
      ItemModel("asset/avatart.jpg", "name7", "subName7"),
      ItemModel("asset/avatart.jpg", "name7", "subName7"),
      ItemModel("asset/avatart.jpg", "name7", "subName7"),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showDialog(
                context: context,
                // barrierDismissible: true,
                builder: (context) {
                  return MyDialog(
                      tempList: itemList,
                      onConfirm: (items) {
                        print("${items.length}");
                      });
                });
          }),
    );
  }
}
