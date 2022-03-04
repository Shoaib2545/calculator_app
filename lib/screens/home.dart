import 'package:calculator/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _history = '';
  String _expression = '';

  void numberClicked(text) {
    setState(() => _expression += text);
  }

  void allClear(text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(text) {
    Parser p = Parser();
    Expression expression = p.parse(_expression);
    ContextModel contextModel = ContextModel();

    setState(() {
      _history = _expression;
      _expression = expression.evaluate(EvaluationType.REAL, contextModel).toString();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF5C842),
          title: const Text('Calculator',
          style: TextStyle(
            color: Color(0xFFFFFFFF)
          ),),
        ),
        backgroundColor: const Color(0xFF283637),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    _history,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Color(0xFF545F61),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    _expression,
                    style: const TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                      ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: 'AC',
                    buttonColor: 0xFFF5A442,
                    textColor: 0xFF000000,
                    textSize: 20,
                    callbackFunction: allClear,
                  ),
                  CalculatorButton(
                    text: 'C',
                    buttonColor: 0xFFF5A442,
                    textColor: 0xFF000000,
                    callbackFunction: clear,
                  ),
                  CalculatorButton(
                    text: '%',
                    buttonColor: 0xAAF5DD42,
                    textColor: 0xFF000000,
                    callbackFunction: numberClicked,
                  ),
                  CalculatorButton(
                    text: '/',
                    buttonColor: 0xAAF5DD42,
                    textColor: 0xFF000000,
                    callbackFunction: numberClicked,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: '7',
                    buttonColor: 0xFFF5C842,
                    textColor: 0xFF000000,
                    callbackFunction: numberClicked,
                  ),
                  CalculatorButton(
                    text: '8',
                    buttonColor: 0xFFF5C842,
                    textColor: 0xFF000000,
                    callbackFunction: numberClicked,
                  ),
                  CalculatorButton(
                    text: '9',
                    buttonColor: 0xFFF5C842,
                    textColor: 0xFF000000,
                    callbackFunction: numberClicked,
                  ),
                  CalculatorButton(
                    text: '*',
                    buttonColor: 0xAAF5DD42,
                    textColor: 0xFF000000,
                    textSize: 24,
                    callbackFunction: numberClicked,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: '4',
                    buttonColor: 0xFFF5C842,
                    textColor: 0xFF000000,
                    callbackFunction: numberClicked,
                  ),
                  CalculatorButton(
                    text: '5',
                    buttonColor: 0xFFF5C842,
                    textColor: 0xFF000000,
                    callbackFunction: numberClicked,
                  ),
                  CalculatorButton(
                    text: '6',
                    buttonColor: 0xFFF5C842,
                    textColor: 0xFF000000,
                    callbackFunction: numberClicked,
                  ),
                  CalculatorButton(
                    text: '-',
                    buttonColor: 0xAAF5DD42,
                    textColor: 0xFF000000,
                    textSize: 38,
                    callbackFunction: numberClicked,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: '1',
                    buttonColor: 0xFFF5C842,
                    textColor: 0xFF000000,
                    callbackFunction: numberClicked,
                  ),
                  CalculatorButton(
                    text: '2',
                    buttonColor: 0xFFF5C842,
                    textColor: 0xFF000000,
                    callbackFunction: numberClicked,
                  ),
                  CalculatorButton(
                    text: '3',
                    buttonColor: 0xFFF5C842,
                    textColor: 0xFF000000,
                    callbackFunction: numberClicked,
                  ),
                  CalculatorButton(
                    text: '+',
                    buttonColor: 0xAAF5DD42,
                    textColor: 0xFF000000,
                    textSize: 30,
                    callbackFunction: numberClicked,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: '.',
                    buttonColor: 0xFFF5C842,
                    textColor: 0xFF000000,
                    callbackFunction: numberClicked,
                  ),
                  CalculatorButton(
                    text: '0',
                    buttonColor: 0xFFF5C842,
                    textColor: 0xFF000000,
                    callbackFunction: numberClicked,
                  ),
                  CalculatorButton(
                    text: '00',
                    buttonColor: 0xFFF5C842,
                    textColor: 0xFF000000,
                    callbackFunction: numberClicked,
                    textSize: 26,
                  ),
                  CalculatorButton(
                    text: '=',
                    buttonColor: 0xAAF5DD42,
                    textColor: 0xFF000000,
                    callbackFunction: evaluate,
                  ),
                ],
              )
            ],
          ),
        ),
      );
  }
}