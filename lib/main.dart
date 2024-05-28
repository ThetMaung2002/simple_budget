import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:simple_budget/data/expense_data/expense_data.dart';
import 'package:simple_budget/page/home_page.dart';
import 'package:simple_budget/providers/theme_provider/theme_provider.dart';

void main() async {
  //* Initialize Local Database
  await Hive.initFlutter();

  //* Open Hive box
  await Hive.openBox("expense_database");

  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExpenseData(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        theme: Provider.of<ThemeProvider>(context).themeData,
      ),
    );
  }
}
