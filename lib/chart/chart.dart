import 'package:expenses/chart/chart_bar.dart';
import 'package:flutter/material.dart';
import '../models/expense.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});
  final List<Expense> expenses;

  List<ExpenseBucket> get bucket{
    return [
      ExpenseBucket.forCategory(expenses, Category.food),
      ExpenseBucket.forCategory(expenses, Category.work),
      ExpenseBucket.forCategory(expenses, Category.leisure),
      ExpenseBucket.forCategory(expenses, Category.travel),
    ];
  }

  double get maxTotalExpense{
    double maxTotalExpense=0;
    for(var element in bucket){
      if(element.totalExpenses > maxTotalExpense){
        maxTotalExpense = element.totalExpenses;
      }
    }
    return maxTotalExpense;
  }
  @override
  Widget build(BuildContext context) {
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.0),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        )
      ),
      child: Column(
        children: [
          Expanded(
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (var ele in bucket)
                    ChartBar(fill:
                    ele.totalExpenses==0 ? 0 : ele.totalExpenses/maxTotalExpense,
                  ),
              ],
              ),
          ),
          const SizedBox(height: 10,),
          Row(
            children: bucket.map(
                    (e) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Icon(categoryIcons[e.category],
                        color: isDarkMode
                            ?Theme.of(context).colorScheme.primaryContainer
                            :Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.7),
                        ),
                        )
                    )
            ).toList(),
          ),
        ],
      ),
    );
  }
}
