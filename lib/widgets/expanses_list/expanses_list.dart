import 'package:expenses/widgets/expanses_list/expanses_item.dart';
import 'package:flutter/material.dart';
import '../../models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context,index)=>Dismissible(
          background: Container(color: Theme.of(context).colorScheme.error,),
          key: ValueKey(expenses[index]),
          onDismissed: (direction) => onRemoveExpense(expenses[index]),
          child: ExpensesItem(
              expense: expenses[index],
          ),
        )
    );
  }
}
