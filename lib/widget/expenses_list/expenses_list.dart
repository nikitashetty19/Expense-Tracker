import 'package:flutter/material.dart';
import 'package:expenses_tracker/model/expense.dart';
import 'package:expenses_tracker/widget/expenses_list/expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.85),
        ),
        onDismissed: (direction) {
          onRemoveExpense(
            expenses[index],
          );
        },
        key: ValueKey(
          expenses[index],
        ),
        child: ExpensesItem(
          expenses[index],
        ),
      ),
    );
  }
}
