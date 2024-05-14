import 'package:flutter/material.dart';
import 'package:simple_budget/Widgets/ui/text_ui.dart';
import 'package:simple_budget/constants/padding.dart';

class ButtonUI extends StatelessWidget {
  const ButtonUI({super.key, required this.label, this.onPressed});

  final String label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: defaultSize,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onPressed,
      child: TextUI(
        label: label,
        size: 16,
        weight: FontWeight.bold,
      ),
    );
  }
}
