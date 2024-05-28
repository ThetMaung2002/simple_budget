import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_budget/models/expense_models/expense_models.dart';

class HiveDatabase {
  //* Reference hive box
  final _myBox = Hive.box("expense_database");

  //* Write data
  void saveData(List<ExpenseModel> allExpense) {
    /*
        * Hive can only store strings and dateTime. And not custom object.
        * Convert ExpenseItem object to types that can be stored in our db.
    */

    List<List<dynamic>> allExpenseFormatted = [];

    for (var expense in allExpense) {
      //* Convert each expense items into a list for storable types.
      List<dynamic> expenseFormatted = [
        expense.name,
        expense.amount,
        expense.dateTime,
      ];
      allExpenseFormatted.add(expenseFormatted);
    }

    //* Now can be stored in database
    _myBox.put("ALL_EXPENSES", allExpenseFormatted);
  }

  //* Read data
  List<ExpenseModel> readData() {
    /*
      * Data is stored in Hive database is as in only string + datetime
      * As now, convert the saved data into ExpenseItem objects
    */

    List saveExpenses = _myBox.get("ALL_EXPENSES") ?? [];
    List<ExpenseModel> allExpenses = [];

    for (int i = 0; i < saveExpenses.length; i++) {
      //* Collect individual expense data

      String name = saveExpenses[i][0];
      String amount = saveExpenses[i][1];
      DateTime dateTime = saveExpenses[i][2];

      //* Create expense items
      ExpenseModel expense = ExpenseModel(
        name: name,
        amount: amount,
        dateTime: dateTime,
      );

      allExpenses.add(expense);
    }

    return allExpenses;
  }
}
