import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_budget/Widgets/ui/bar_graph_ui.dart';
import 'package:simple_budget/data/date_time/date_time_helper.dart';
import 'package:simple_budget/data/expense_data/expense_data.dart';

class ExpenseSummary extends StatelessWidget {
  const ExpenseSummary({super.key, required this.startOfWeek});

  final DateTime startOfWeek;

  @override
  Widget build(BuildContext context) {
    String sunday = convertDateTimetoString(
      startOfWeek.add(
        const Duration(days: 0),
      ),
    );
    String monday = convertDateTimetoString(
      startOfWeek.add(
        const Duration(days: 1),
      ),
    );
    String tuesday = convertDateTimetoString(
      startOfWeek.add(
        const Duration(days: 2),
      ),
    );
    String wednesday = convertDateTimetoString(
      startOfWeek.add(
        const Duration(days: 3),
      ),
    );
    String thursday = convertDateTimetoString(
      startOfWeek.add(
        const Duration(days: 4),
      ),
    );
    String friday = convertDateTimetoString(
      startOfWeek.add(
        const Duration(days: 5),
      ),
    );
    String saturday = convertDateTimetoString(
      startOfWeek.add(
        const Duration(days: 6),
      ),
    );

    return Consumer<ExpenseData>(
      builder: (context, value, child) => SizedBox(
        height: 140,
        child: BarGraphUI(
            maxY: 10000,
            sunAmount: value.calculatorDailyExpenseSummary()[sunday] ?? 0,
            monAmount: value.calculatorDailyExpenseSummary()[monday] ?? 0,
            tueAmount: value.calculatorDailyExpenseSummary()[tuesday] ?? 0,
            wedAmount: value.calculatorDailyExpenseSummary()[wednesday] ?? 0,
            thuAmount: value.calculatorDailyExpenseSummary()[thursday] ?? 0,
            friAmount: value.calculatorDailyExpenseSummary()[friday] ?? 0,
            satAmount: value.calculatorDailyExpenseSummary()[saturday] ?? 0),
      ),
    );
  }
}
