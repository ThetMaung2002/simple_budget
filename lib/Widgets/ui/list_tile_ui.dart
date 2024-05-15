import 'package:flutter/material.dart';
import 'package:simple_budget/Widgets/ui/text_ui.dart';
import 'package:simple_budget/constants/theme_constants/light_theme_constants.dart';

class ListTileUI extends StatelessWidget {
  const ListTileUI(
      {super.key,
      required this.title,
      required this.trailing,
      required this.dateTime});

  final String title;
  final DateTime dateTime;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: secondaryColor,
      textColor: secondaryFgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      title: TextUI(label: title),
      subtitle: TextUI(
        label: "${dateTime.day} / ${dateTime.month} / ${dateTime.year}",
        size: 12,
      ),
      trailing: Container(
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(8.0),
        child: TextUI(
          label: "$trailing kyat",
          size: 16,
          color: primaryFgColor,
        ),
      ),
    );
  }
}
