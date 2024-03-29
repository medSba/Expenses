import 'package:expenses/chart/chart.dart';
import 'package:expenses/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import '../models/expense.dart';
import 'expanses_list/expanses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpense = [
    Expense(category: Category.food, title: 'Breakfast', amount: 15.0, date: DateTime.now()),
    Expense(category: Category.work, title: 'FireBase', amount: 100.0, date: DateTime.now()),
    Expense(category: Category.leisure, title: 'Cinema', amount: 80.49, date: DateTime.now()),
  ];

  void _addExpenses(Expense expense){
    setState(() {
      _registeredExpense.add(expense);
    });
  }

  void _removeExpenses(Expense expense){
    setState(() {
      _registeredExpense.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Expense Tracker'),
        actions: [
        IconButton(
            onPressed: (){
              showModalBottomSheet(
                  context: context,
                  builder: (ctx)=> NewExpense(onAddExpense: _addExpenses,),
              );
            },
            icon: const Icon(Icons.add)),
      ],),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Chart(expenses: _registeredExpense),
              Expanded(
                child: ExpensesList(
                  expenses: _registeredExpense,
                  onRemoveExpense: _removeExpenses,
                ),
              ),
            ],
        ),
      ),
    );
  }
}
