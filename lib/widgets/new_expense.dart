import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _title = TextEditingController();
  final _amount = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _title.dispose();
    _amount.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          TextField(
            controller: _title,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          TextField(
            controller: _amount,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text('Amount'),
              prefixText: '\$'
            ),
          ),
          Row(
            children: [
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              const Spacer(),
              ElevatedButton(
                  onPressed: (){},
                  child: const Text('Save Expense'))
            ],
          )
        ],
      ),
    );
  }
}
