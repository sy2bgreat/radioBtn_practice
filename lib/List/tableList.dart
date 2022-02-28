import 'package:flutter/material.dart';
import 'package:todo_list_practice/List/message.dart';
import 'package:todo_list_practice/List/todoList.dart';

class TableList extends StatefulWidget {
  const TableList({Key? key}) : super(key: key);

  @override
  State<TableList> createState() => _TableListState();
}

class _TableListState extends State<TableList> {
  List<TodoList> todolist = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todolist.add(TodoList(imgPath: "images/cart.png", workList: "buying"));
    todolist.add(TodoList(imgPath: "images/clock.png", workList: "time"));
    todolist.add(TodoList(imgPath: "images/pencil.png", workList: "study"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/insert").then((value) => {
                      setState(() {
                        if (Message.action == true) {
                          todolist.add(TodoList(
                              imgPath: Message.imgPath,
                              workList: Message.workList));
                          Message.action = false;
                        }
                      })
                    });
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, pile) {
            return Dismissible(
              background: Container(
                color: Colors.red,
                child: Text(
                  "remove",
                  style: TextStyle(fontSize: 80),
                ),
              ),
              key: ValueKey(todolist[pile]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset(todolist[pile].imgPath,
                        height: 100, width: 100, fit: BoxFit.contain),
                    SizedBox(
                      width: 50,
                      height: 50,
                    ),
                    Text(
                      todolist[pile].workList,
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
              onDismissed: (direction) {
                setState(() {
                  todolist.removeAt(pile);
                });
              },
            );
          },
          itemCount: todolist.length,
        ),
      ),
    );
  }
}
