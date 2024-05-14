import 'package:flutter/material.dart';
import 'package:simple_budget/Widgets/ui/button_ui.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonUI(
              label: "Submit",
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
