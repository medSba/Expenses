import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

final dateTime = DateFormat.yMd();
enum Category {food,travel,leisure,work}

const categoryIcons = {
  Category.food : Icons.fastfood_outlined,
  Category.leisure : Icons.shopify_outlined,
  Category.work : Icons.work_outline,
  Category.travel : Icons.airplanemode_active_outlined,
};

class Expense{

  String get formatDateTime{
    return dateTime.format(date);
  }

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense({required this.category,
    required this.title,
    required this.amount,
    required this.date
  }) : id = uuid.v4();

}