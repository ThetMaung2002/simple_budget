import 'package:flutter/material.dart';
import 'package:simple_budget/Widgets/ui/text_ui.dart';
import 'package:simple_budget/constants/string.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextUI(
          label: home,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const TextUI(label: kAddNewExpense),
            content: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(),
                SizedBox(
                  height: 20,
                ),
                TextField(),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const TextUI(label: close),
              )
            ],
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
