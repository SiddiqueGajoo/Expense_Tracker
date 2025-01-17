import 'package:flutter/material.dart';
import 'package:practice/model/expense.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem(this.expense,{super.key});
final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal:1,
        vertical: 16,
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(expense.title,style: const TextStyle(
                fontWeight: FontWeight.bold
              ),),
              const SizedBox(height: 4,),
              Row(
                children: [
                  Text('\$ ${expense.amount.toStringAsFixed(2)}'),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(categoryIcons[expense.category]),
                      const SizedBox(width: 8,),
                      Text(expense.formattedDate)
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
