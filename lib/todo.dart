import 'package:flutter/material.dart';

class ToDoView extends StatefulWidget {
  const ToDoView({super.key});

  @override
  State<ToDoView> createState() => _ToDoViewState();
}

class _ToDoViewState extends State<ToDoView> {
  List<String> friendList = ['usama', 'qadir', 'ismail'];
  TextEditingController itemController = TextEditingController();
  TextEditingController updateController = TextEditingController();

  addItem() {
    setState(() {
      friendList.add(itemController.text);
    });
    itemController.clear();
  }

  deleteItem(i) {
    setState(() {
      friendList.removeAt(i);
    });
  }

  updateItem(index) {
    setState(() {
      friendList[index] = updateController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: itemController,
        ),
      ),
      body: ListView.builder(
        itemCount: friendList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(friendList[index]),
            trailing: Wrap(
              children: [
                IconButton(//updateItem ka yahan se start hwa
                    onPressed: () {
                      friendList[index] = itemController.text;
                      showDialog(barrierDismissible: true,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('update List'),
                            content: TextField(
                              controller: updateController,
                            ),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    updateItem(index);
                                    Navigator.pop(context);
                                  },
                                  child: Text('update')),
                            ],
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.edit)),//updateItem yahan khatam hwa
                IconButton(
                    onPressed: () {
                      deleteItem(index);
                    },
                    icon: Icon(Icons.delete_outline_outlined)),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
        onPressed: () {
          addItem();
        },
        child:  Center(child: Text('+',style: TextStyle(fontSize: 40),))
      ),
    );
  }
}
