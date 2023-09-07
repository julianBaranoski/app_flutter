import 'package:flutter/material.dart';
import 'package:prova0609/pages/components/menu.dart';



class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String display = '';
  late double firstNum;
  late double secondNum;
  late String operator;

  void _onButtonPressed(String buttonText) {
    if (buttonText == 'C') {
      setState(() {
        display = '';
        firstNum = 0.0;
        secondNum = 0.0;
        operator = '';
      });
    } else if (buttonText == '+' || buttonText == '-' || buttonText == 'x' || buttonText == '/') {
      setState(() {
        firstNum = double.tryParse(display)!;
        operator = buttonText;
        display = '';
      });
    } else if (buttonText == '=') {
      setState(() {
        secondNum = double.tryParse(display)!;
        if (operator == '+') {
          display = (firstNum + secondNum).toString();
        } else if (operator == '-') {
          display = (firstNum - secondNum).toString();
        } else if (operator == 'x') {
          display = (firstNum * secondNum).toString();
        } else if (operator == '/') {
          if (secondNum != 0) {
            display = (firstNum / secondNum).toString();
          } else {
            display = 'Erro';
          }
        }
        operator = '';
        firstNum = double.tryParse(display)!;
        secondNum = 0.0;
      });
    } else {
      setState(() {
        display += buttonText;
      });
    }
  }

  Widget _buildButton(String buttonText) {
    return ElevatedButton(
      onPressed: () {
        _onButtonPressed(buttonText);
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20),
        minimumSize: const Size(70, 70),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Menu(),
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        children: [
          Center(
            child: Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.bottomRight,
                child: Text(
                  display,
                  style: const TextStyle(fontSize: 40),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('7'),
              _buildButton('8'),
              _buildButton('9'),
              _buildButton('/'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('4'),
              _buildButton('5'),
              _buildButton('6'),
              _buildButton('x'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
              _buildButton('-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('0'),
              _buildButton('C'),
              _buildButton('='),
              _buildButton('+'),
            ],
          ),
        ],
      ),
    );
  }
}
