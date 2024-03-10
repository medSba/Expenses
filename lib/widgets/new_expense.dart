import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _title = TextEditingController();
  final _amount = TextEditingController();
  DateTime? _selectedDate ;
  final formatter = DateFormat.yMd();
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
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amount,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Amount'),
                    prefixText: '\$'
                  ),
                ),
              ),
              const SizedBox(width: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text( _selectedDate==null? 'No Selected Date': formatter.format(_selectedDate!)),
                    IconButton(
                        onPressed: () async{
                          final now=DateTime.now();
                          final firstDate=DateTime(now.year-1,now.month-1,now.day-1);
                          final pickDater = await showDatePicker(
                              context: context,
                              firstDate: firstDate,
                              lastDate: now);
                          setState(() {
                            _selectedDate=pickDater;
                          });
                        },
                        icon: const Icon(Icons.date_range_outlined))
                  ],
                ),
            ],
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
