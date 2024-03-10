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
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Expense Tracker')),
        backgroundColor: const Color.fromARGB(115, 144, 114,0),
        actions: [
        IconButton(
            onPressed: (){
              showModalBottomSheet(
                  context: context,
                  builder: (ctx)=>const NewExpense(),
              );
            },
            icon: const Icon(Icons.add)),
      ],),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('.....'),
              Expanded(
                child: ExpensesList(expenses: _registeredExpense),
              ),
            ],
        ),
      ),
    );
  }
}
