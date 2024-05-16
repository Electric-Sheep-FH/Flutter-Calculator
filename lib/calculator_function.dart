import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key, required this.title});

  final String title;

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int _counter = 0;
  int _clickCounter = 0;
  int _incrementValue = 2;
  final myController = TextEditingController();
  
  void _incrementCounter() {
    setState(() {
      _counter += _incrementValue;
      _clickCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: myController,
            ),
            ElevatedButton(
              onPressed: () {
                if (RegExp(r'^[0-9]*$').hasMatch(myController.text) && !RegExp(r'^0+$').hasMatch(myController.text) )
                {
                  setState(() {
                    _incrementValue = int.parse(myController.text);
                  });
                }
                else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Error'),
                        content: const Text('Please enter only number(s) and no 0.'),
                        actions: <Widget>[
                          TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: const Color.fromARGB(255, 177, 24, 24),
                              padding: const EdgeInsets.all(16.0),
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Understood')
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text('Submit'),
            ),
            if (_clickCounter >= 1)
              Text('Vous avez cliqué $_clickCounter fois'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${_counter - _incrementValue} + $_incrementValue = '
                ),
                Text(
                  ' $_counter',
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                    ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Text('+$_incrementValue'),
        //child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}