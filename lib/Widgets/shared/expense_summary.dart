import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_budget/Widgets/ui/bar_graph_ui.dart';
import 'package:simple_budget/Widgets/ui/text_ui.dart';
import 'package:simple_budget/data/date_time/date_time_helper.dart';
import 'package:simple_budget/data/expense_data/expense_data.dart';

class ExpenseSummary extends StatelessWidget {
  const ExpenseSummary({super.key, required this.startOfWeek});

  //* Calculate max amount in bar graph
  double calculateMax(
    ExpenseData value,
    String sunday,
    String monday,
    String tuesday,
    String wednesday,
    String thursday,
    String friday,
    String saturday,
  ) {
    double? max = 100;
    List<double> values = [
      value.calculatorDailyExpenseSummary()[sunday] ?? 0,
      value.calculatorDailyExpenseSummary()[monday] ?? 0,
      value.calculatorDailyExpenseSummary()[tuesday] ?? 0,
      value.calculatorDailyExpenseSummary()[wednesday] ?? 0,
      value.calculatorDailyExpenseSummary()[thursday] ?? 0,
      value.calculatorDailyExpenseSummary()[friday] ?? 0,
      value.calculatorDailyExpenseSummary()[saturday] ?? 0,
    ];

    values.sort();

    max = values.last * 1.1;
    return max == 0 ? 100 : max;
  }

  String calculateWeekTotal(
    ExpenseData value,
    String sunday,
    String monday,
    String tuesday,
    String wednesday,
    String thursday,
    String friday,
    String saturday,
  ) {
    List<double> values = [
      value.calculatorDailyExpenseSummary()[sunday] ?? 0,
      value.calculatorDailyExpenseSummary()[monday] ?? 0,
      value.calculatorDailyExpenseSummary()[tuesday] ?? 0,
      value.calculatorDailyExpenseSummary()[wednesday] ?? 0,
      value.calculatorDailyExpenseSummary()[thursday] ?? 0,
      value.calculatorDailyExpenseSummary()[friday] ?? 0,
      value.calculatorDailyExpenseSummary()[saturday] ?? 0,
    ];
    double total = 0;
    for (int i = 0; i < values.length; i++) {
      total += values[i];
    }

    return total.toStringAsFixed(2);
  }

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
      builder: (context, value, child) => Column(
        children: [
          //* week total
          Row(
            children: [
              const TextUI(
                label: "Week Total:",
                size: 18,
                weight: FontWeight.bold,
              ),
              const SizedBox(width: 8),
              TextUI(
                label:
                    "\$${calculateWeekTotal(value, sunday, monday, tuesday, wednesday, thursday, friday, saturday)}",
                size: 18,
              ),
            ],
          ),

          const SizedBox(height: 20),

          //* bar graph
          SizedBox(
            height: 140,
            child: BarGraphUI(
                maxY: calculateMax(value, sunday, monday, tuesday, wednesday,
                    thursday, friday, saturday),
                sunAmount: value.calculatorDailyExpenseSummary()[sunday] ?? 0,
                monAmount: value.calculatorDailyExpenseSummary()[monday] ?? 0,
                tueAmount: value.calculatorDailyExpenseSummary()[tuesday] ?? 0,
                wedAmount:
                    value.calculatorDailyExpenseSummary()[wednesday] ?? 0,
                thuAmount: value.calculatorDailyExpenseSummary()[thursday] ?? 0,
                friAmount: value.calculatorDailyExpenseSummary()[friday] ?? 0,
                satAmount:
                    value.calculatorDailyExpenseSummary()[saturday] ?? 0),
          ),
        ],
      ),
    );
  }
}
