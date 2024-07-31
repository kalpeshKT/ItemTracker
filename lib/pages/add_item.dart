import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  TextEditingController name_controller = TextEditingController();
  TextEditingController desc_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Add Item",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold))),
      body: Container(
          margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Name",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight : FontWeight.bold )
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: const Color(0xffececf8),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextField(
                      controller: name_controller,
                      decoration: const InputDecoration(border: InputBorder.none,
                          hintText: "Name")
                  )
              ),
              const SizedBox(height: 20),
              const Text(
                  "Description",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight : FontWeight.bold )
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: const Color(0xffececf8),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextField(
                      controller: desc_controller,
                      decoration: const InputDecoration(border: InputBorder.none,
                          hintText: "Description")
                  )
              ),
              const SizedBox(height: 20),
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  decoration: BoxDecoration(
                      color: const Color(0xFF0F4E5B),
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: const Center(
                    child: Text("Add", style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    )
                    ),
                  ),
                ),
            ],
          ),
      ),
    );
  }
}
