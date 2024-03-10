import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpense = [
    Expense(category: Category.food.toString(), title: 'Breakfast', amount: 15.0, date: DateTime.now()),
    Expense(category: Category.work.toString(), title: 'FireBase', amount: 100.0, date: DateTime.now()),
    Expense(category: Category.leisure.toString(), title: 'Breakfast', amount: 15.0, date: DateTime.now()),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expenses'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('.....'),
              Expanded(
                child: ListView.builder(
                    itemCount: _registeredExpense.length,
                    itemBuilder: (context,index)=>Text(_registeredExpense[index].title)
                ),
              ),
            ],
        ),
      ),
    );
  }
}
