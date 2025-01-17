import 'package:flutter/material.dart';
import 'package:practice/model/expense.dart';
import 'package:practice/widgets/Expenses-List/Expenses_Item.dart';

class ExpensesList extends StatelessWidget {
   ExpensesList({required this.expenses,required this.onRemoveExpense,super.key});

   final void Function (Expense expense) onRemoveExpense;
  List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
        itemBuilder: (context,index)=>
        Dismissible(
          background: Container(color: Colors.redAccent.withOpacity(0.75,),
          child: const Icon(Icons.delete),
          ),
          onDismissed: (direction){ //in this direction do nothing here we just add this bcz in this we have to add direction
            onRemoveExpense(expenses[index]);
          },
            key: ValueKey(expenses[index]),
            child: ExpensesItem(expenses[index]))
    );
  }
}
