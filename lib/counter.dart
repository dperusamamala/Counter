import 'package:flutter/material.dart';

class CounterView extends StatefulWidget {
   CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int counter = 0;
  addValue() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Column(
        children: [
          Text('Counter$counter'),
       ElevatedButton(
          onPressed: () {
            addValue();
          },
          child: Text('add value')),
        ],
      )
       
    );
  }
}
