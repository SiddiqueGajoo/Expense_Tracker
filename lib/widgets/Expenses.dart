import 'package:flutter/material.dart';
import 'package:practice/model/expense.dart';
import 'package:practice/widgets/chart/chart.dart';
import 'package:practice/widgets/new_expense.dart';

import 'Expenses-List/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  void showAddExpensesOverlay() {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(onAddExpense: addExpense));
  }

  void addExpense(Expense expense) {
    setState(() {
      registeredExpense.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    final expenseIndex = registeredExpense.indexOf(expense);
    setState(() {
      registeredExpense.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text('Expense Deleted'),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              registeredExpense.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  final List<Expense> registeredExpense = [
    Expense(
        title: 'Flutter Course',
        date: DateTime.now(),
        amount: 19.22,
        category: Category.work),
    Expense(
        title: 'Cinema',
        date: DateTime.now(),
        amount: 15.72,
        category: Category.leisure),
  ];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Widget mainContent = const Text('No any Expense. Try add some...');
    if (registeredExpense.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: registeredExpense,
        onRemoveExpense: removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title:  const Text('Flutter expense Tracker',style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.white,
        )),
        actions: [
          IconButton(
              onPressed: showAddExpensesOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: width <600? Column(
        children: [
          Chart(expenses: registeredExpense),
          Expanded(
              //Wrapping with Expanded bcz Column(ExpensesList although its listview builder) inside Column has some issues of sizes
              child: mainContent)
        ],
      ): Row(
        children: [
          Expanded(child: Chart(expenses: registeredExpense)),
          Expanded(
            //Wrapping with Expanded bcz Column(ExpensesList although its listview builder) inside Column has some issues of sizes
              child: mainContent)
        ],
      ),
    );
  }
}
