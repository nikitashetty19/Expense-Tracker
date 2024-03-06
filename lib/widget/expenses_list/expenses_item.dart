import 'package:flutter/material.dart';
import 'package:expenses_tracker/model/expense.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem(this.expenses, {super.key});
  final Expense expenses;
  @override
  Widget build(context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        child: Column(
          children: [
            Text(
              expenses.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text('\$${expenses.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(
                      categoryItem[expenses.category],
                    ),
                    Text(
                      expenses.formattedDate,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
