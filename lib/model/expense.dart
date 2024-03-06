import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category { food, travel, leisure, work }

const categoryItem = {
  Category.food: Icons.food_bank,
  Category.travel: Icons.flight_takeoff_rounded,
  Category.leisure: Icons.movie_creation_sharp,
  Category.work: Icons.local_post_office_outlined,
};

class Expense {
  Expense({
    required this.title,
    required this.date,
    required this.amount,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final double amount;
  final String title;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.expenses,
    required this.category,
  });
  ExpenseBucket.forCategory(List<Expense> allExpense, this.category)
      : expenses = allExpense
            .where((expense) => expense.category == category)
            .toList();
  final List<Expense> expenses;
  final Category category;

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
