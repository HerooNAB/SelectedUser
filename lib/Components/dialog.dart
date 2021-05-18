import 'package:cv_action_chonnguoiduyet/Models/popup_Dialog.dart';
import 'package:flutter/material.dart';

class MyDialog extends StatefulWidget {
  final List<ItemModel> tempList;
  final Function(List<ItemModel>) onConfirm;
  MyDialog({
    this.tempList,
    this.onConfirm,
  });

  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  List<ItemModel> _tempList = [];
  List<ItemModel> _selectedItemList = [];
  @override
  void initState() {
    _tempList = List.from(widget.tempList);
    _clear();
    // _createSelectedList();
    // print(_tempList[1].name);

    super.initState();
  }

  // _createSelectedList() {
  //   _tempList.forEach((element) {
  //     _selectedItemList.add(element);
  //   });
  // }

  _clear() {
    _tempList.forEach((element) {
      if (element.isChecked == true)
        setState(() {
          element.isChecked = false;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 103, 18, 107),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(111, 24, 70, 16),
                  child: Center(
                    child: Text(
                      'Chọn người duyệt',
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 8, 20, 16),
                  child: GestureDetector(
                    onTap: () {
                      // _test();
                      // print(_tempSelectedItemList);

                      Navigator.of(context).pop(false);
                    },
                    child: Icon(
                      Icons.close_outlined,
                      size: 22,
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 450,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1, color: Color(0xFFFFDBE4F2)),
                  bottom: BorderSide(width: 1, color: Color(0xFFFFDBE4F2)),
                ),
              ),
              child: Container(
                width: 380,
                child: Scrollbar(
                  isAlwaysShown: true,
                  radius: Radius.circular(10),
                  thickness: 6,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: new List.generate(_tempList.length, (index) {
                        return Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 8, 8, 0),
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: Color(0xFFFFDBE4F2)),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 8, 0),
                                    child: CircleAvatar(
                                      backgroundImage:
                                          AssetImage(_tempList[index].avatar),
                                    ),
                                  ),
                                  Container(
                                    width: 282,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _tempList[index].name,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          _tempList[index].subName,
                                          textAlign: TextAlign.left,
                                          // textAlign: TextAlign.center,
                                          style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontWeight: FontWeight.w100,
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  (!_tempList[index].isChecked)
                                      ? Container(
                                          width: 24,
                                          height: 24,
                                          child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _tempList[index].isChecked =
                                                      !_tempList[index]
                                                          .isChecked;
                                                });
                                              },
                                              child: Image.asset(
                                                  'asset/unCheck.jpg')),
                                        )
                                      : Container(
                                          width: 24,
                                          height: 24,
                                          child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _tempList[index].isChecked =
                                                      !_tempList[index]
                                                          .isChecked;
                                                });
                                              },
                                              child: Image.asset(
                                                  'asset/checked.jpg')),
                                        )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(24, 5, 24, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Colors.blue,
              ),
              child: Container(
                width: 300,
                height: 35,
                child: GestureDetector(
                  onTap: () {
                    for (var i = 0; i < _tempList.length; i++) {
                      if (_tempList[i].isChecked == true) {
                        _selectedItemList.add(_tempList[i]);
                        // widget.itemList[i].isChecked = testList[i].isChecked;
                      }
                    }
                    print(_selectedItemList);
                    Navigator.pop(context);

                    if (widget.onConfirm != null)
                      widget.onConfirm(_selectedItemList);
                  },
                  child: Center(
                    child: Text(
                      "Xác Nhận",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
