import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:random_string/random_string.dart';

import '../model/item_model.dart';
import '../provider/item_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController name_controller = TextEditingController();
  TextEditingController desc_controller = TextEditingController();

  String itemName = '';
  String itemDesc = '';

  @override
  void initState() {
    super.initState();
    set();
  }

  void set() {
    name_controller.addListener(() {
      itemName = name_controller.text;
    });

    desc_controller.addListener(() {
      itemDesc = desc_controller.text;
    });
  }

  void callState() {
    set();
  }

  @override
  void dispose() {
    name_controller.dispose();
    desc_controller.dispose();
    super.dispose();
  }

  void _submit() {
    String id = randomAlphaNumeric(10);
    Provider.of<ItemProvider>(context, listen: false)
        .addItem(id, itemName, itemDesc);
    Navigator.pop(context);
    name_controller.clear();
    desc_controller.clear();
  }

  void _edit(String id) {
    Provider.of<ItemProvider>(context, listen: false)
        .editItem(id, itemName, itemDesc);
    Navigator.pop(context);
    name_controller.clear();
    desc_controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final task = Provider.of<ItemProvider>(context);

    return Scaffold(
      appBar: AppBar(
          title: Text("Item Tracker",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold))),
      backgroundColor: const Color(0xFFFFF4e7),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF0F4E5B),
          onPressed: () {
            name_controller.clear();
            desc_controller.clear();
            _showAddItemDialog(false, "");
          },
          child: const Icon(Icons.add, color: Colors.white)),
      body: Container(
          child: ListView.builder(
              itemCount: task.allItems.length,
              itemBuilder: (context, index) => ListTile(
                    title: Text(task.allItems[index].name),
                    subtitle: Text(task.allItems[index].description),
                    trailing: SizedBox(
                        width: 80,
                        height: 40,
                        child: Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Item item = task.allItems[index];
                                  name_controller =
                                      TextEditingController(text: item.name);
                                  desc_controller = TextEditingController(
                                      text: item.description);
                                  callState();
                                  _showAddItemDialog(true, item.id);
                                },
                                child: Icon(Icons.edit, color: Colors.grey)),
                            SizedBox(width: 20),
                            GestureDetector(
                              onTap: () {
                                task.deleteItem(index);
                              },
                              child: Icon(Icons.delete_forever,
                                  color: Colors.grey),
                            )
                          ],
                        )),
                  ))),
    );
  }

  Future<void> _showAddItemDialog(bool flag, String id) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(flag ? "Edit Item" : "Add Item"),
            content: Container(
              height: 120,
              child: Column(
                children: [
                  TextField(
                      autofocus: true,
                      controller: name_controller,
                      decoration: InputDecoration(hintText: "Name")),
                  TextField(
                      autofocus: true,
                      controller: desc_controller,
                      decoration: InputDecoration(hintText: "Description")),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  flag ? _edit(id) : _submit();
                },
                style:
                    ElevatedButton.styleFrom(minimumSize: const Size(120, 40)),
                child: Text(flag ? "Edit" : "Add"),
              )
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            actionsAlignment: MainAxisAlignment.center,
          );
        });
  }
}
