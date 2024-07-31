import 'package:flutter/material.dart';
import 'package:item_tracker/pages/home_page.dart';
import 'package:item_tracker/provider/item_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ItemProvider>(
      create: ((context) => ItemProvider()),
      child: MaterialApp(
        title: 'Item Tracker',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
