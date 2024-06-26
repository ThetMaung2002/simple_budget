import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_budget/Widgets/shared/expense_summary.dart';
import 'package:simple_budget/Widgets/ui/list_tile_ui.dart';
import 'package:simple_budget/Widgets/ui/text_input_ui.dart';
import 'package:simple_budget/Widgets/ui/text_ui.dart';
import 'package:simple_budget/constants/padding.dart';
import 'package:simple_budget/constants/sized_box.dart';
import 'package:simple_budget/constants/string.dart';
import 'package:simple_budget/data/expense_data/expense_data.dart';
import 'package:simple_budget/models/expense_models/expense_models.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController addExpenseName = TextEditingController();
  TextEditingController addExpenseAmount = TextEditingController();

  @override
  void initState() {
    super.initState();

    //Prepare data on start up
    Provider.of<ExpenseData>(context, listen: false).prepareData();
  }

  void save() {
    if (addExpenseName.text.isNotEmpty && addExpenseAmount.text.isNotEmpty) {
      //Create new expense item
      ExpenseModel newExpense = ExpenseModel(
        name: addExpenseName.text,
        amount: addExpenseAmount.text,
        dateTime: DateTime.now(),
      );

      // Add the new expense
      Provider.of<ExpenseData>(context, listen: false)
          .addNewExpense(newExpense);
    }
    // Clear the textfields
    addExpenseName.clear();
    addExpenseAmount.clear();

    // POP!
    Navigator.pop(context);
  }

  void deleteExpense(ExpenseModel expense) {
    Provider.of<ExpenseData>(context, listen: false).deleteNewExpense(expense);
  }

  void cancel() {
    // Clear the textfields
    addExpenseName.clear();
    addExpenseAmount.clear();

    // POP!
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) => Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: ListView(
              children: [
                ExpenseSummary(
                  startOfWeek: value.startOfWeekDate(),
                ),
                const SizedBox(height: kDefaultHeight),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: kDefaultPadding),
                  itemCount: value.getAllExpenseList().length,
                  itemBuilder: (context, index) => ListTileUI(
                    title: value.getAllExpenseList()[index].name,
                    dateTime: value.getAllExpenseList()[index].dateTime,
                    trailing: value.getAllExpenseList()[index].amount,
                    deleteTapped: (p0) => deleteExpense(
                      value.getAllExpenseList()[index],
                    ),
                  ),
                ),
              ],
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const TextUI(label: kAddNewExpense),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextInputUI(
                    keyboardType: TextInputType.text,
                    controller: addExpenseName,
                    hintText: expenseName,
                  ),
                  const SizedBox(
                    height: kDefaultHeight,
                  ),
                  TextInputUI(
                    keyboardType: TextInputType.number,
                    controller: addExpenseAmount,
                    hintText: expenseAmount,
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    save();
                  },
                  child: const TextUI(label: kSave),
                ),
                TextButton(
                  onPressed: () {
                    cancel();
                  },
                  child: const TextUI(label: kCancel),
                ),
              ],
            ),
          ),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
