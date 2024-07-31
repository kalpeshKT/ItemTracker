import 'dart:collection';
import 'dart:developer';

import 'package:flutter/cupertino.dart';

import '../model/item_model.dart';

class ItemProvider extends ChangeNotifier {
  final List<Item> _items = [];

  UnmodifiableListView<Item> get allItems => UnmodifiableListView(_items);

  void addItem(String id, String name, String description) {
    _items.add(Item(id: id, name: name, description: description));
    notifyListeners();
  }

  void deleteItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void editItem(String id, String name, String description) {
    Item item = Item(id: id, name: name, description: description);
    _items[_items.indexWhere((element) => element.id == id)] = item;
    notifyListeners();
  }
}