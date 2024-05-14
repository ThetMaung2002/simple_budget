import 'package:simple_budget/data/date_time/date_time_helper.dart';
import 'package:simple_budget/models/expense_models/expense_models.dart';

class ExpenseData {
  //* List of all expenses.
  List<ExpenseModel> overallExpenseList = [];

  //* Get expense list.
  List<ExpenseModel> getAllExpenseList() {
    return overallExpenseList;
  }

  //* Add new expense.
  void addNewExpense(ExpenseModel newExpenseModel) {
    overallExpenseList.add(newExpenseModel);
  }

  //* Delete expense.
  void deleteNewExpense(ExpenseModel expenseModel) {
    overallExpenseList.remove(expenseModel);
  }

  //* Get weekday (mon, tue, etc...) from a datetime object.
  String getDayName(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

  //* Get the date from start of the week (Sunday).
  DateTime startOfWeekDate() {
    DateTime? startOfWeek;

    //* Get today date
    DateTime? today = DateTime.now();

    //* Go Backward from today to find sunday
    for (int i = 0; i < 7; i++) {
      if (getDayName(today.subtract(Duration(days: i))) == 'Sun') {
        startOfWeek = today.subtract(Duration(days: i));
      }
    }

    return startOfWeek!;
  }

  //* Convert overall list of expenses into daily expense summery
  Map<String, dynamic> calculatorDailyExpenseSummary() {
    Map<String, double> dailyExpenseSummary = {};
    for (var expense in overallExpenseList) {
      String date = convertDateTimetoString(expense.dateTime);
      double amount = double.parse(expense.amount);

      if (dailyExpenseSummary.containsKey(date)) {
        double currentAmount = dailyExpenseSummary[date]!;
        currentAmount += amount;
        dailyExpenseSummary[date] = currentAmount;
      } else {
        dailyExpenseSummary.addAll({date: amount});
      }
    }
    return dailyExpenseSummary;
  }
}
