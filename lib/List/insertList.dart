import 'package:flutter/material.dart';
import 'package:todo_list_practice/List/message.dart';

class InsertList extends StatefulWidget {
  InsertList({Key? key}) : super(key: key);

  @override
  State<InsertList> createState() => _InsertListState();
}

enum ImgValue { buying, time, study }

class _InsertListState extends State<InsertList> {
  TextEditingController txtController = TextEditingController();
  ImgValue? _imgValue = ImgValue.buying; //null-able
  String _imgPath = "images/cart.png";

  @override
  void dispose() {
    // TODO: implement dispose
    txtController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add List"),
        ),
        body: Center(
          child: Column(
            children: [
              ListTile(
                title: Text("Buying"),
                leading: Radio(
                  groupValue: _imgValue,
                  value: ImgValue.buying,
                  onChanged: (ImgValue? value) {
                    setState(() {
                      _imgValue = value;
                      _imgPath = "images/cart.png";
                    });
                  },
                ),
              ),
              ListTile(
                title: Text("Appointment"),
                leading: Radio(
                  groupValue: _imgValue,
                  value: ImgValue.time,
                  onChanged: (ImgValue? value) {
                    setState(() {
                      _imgValue = value;
                      _imgPath = "images/clock.png";
                    });
                  },
                ),
              ),
              ListTile(
                title: Text("Studying"),
                leading: Radio(
                  groupValue: _imgValue,
                  value: ImgValue.study,
                  onChanged: (ImgValue? value) {
                    setState(() {
                      _imgValue = value;
                      _imgPath = "images/pencil.png";
                    });
                  },
                ),
              ),
              TextField(
                controller: txtController,
                decoration: InputDecoration(
                  labelText: "type",
                ),
                keyboardType: TextInputType.text,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (txtController.text.isNotEmpty) {
                      setState(() {
                        Message.imgPath = _imgPath;
                        Message.workList = txtController.text;
                        Message.action = true;
                      });

                      Navigator.pop(context);
                    }
                  },
                  child: Text("submit!"))
            ],
          ),
        ));
  }
}
