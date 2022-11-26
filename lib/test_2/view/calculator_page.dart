import 'package:flutter/material.dart';

import '../logic/operation.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  late final TextEditingController firstOperanController;
  late final TextEditingController secondOperandController;
  final operation = Operation();
  double? result;

  @override
  void initState() {
    firstOperanController = TextEditingController();
    secondOperandController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    firstOperanController.dispose();
    secondOperandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                key: const ValueKey("result"),
                result?.toString() ?? "Result",
                style: Theme.of(context).textTheme.headline3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextField(
                        key: const ValueKey("firstOperand"),
                        controller: firstOperanController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextField(
                        key: const ValueKey("secondOperand"),
                        controller: secondOperandController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Wrap(
                spacing: 2,
                children: [
                  MaterialButton(
                    color: Theme.of(context).primaryColorLight,
                    child: const Text("+"),
                    onPressed: () {
                      setState(() {
                        result = operation
                            .sum(
                              operand1: int.parse(firstOperanController.text),
                              operand2: int.parse(secondOperandController.text),
                            )
                            .toDouble();
                      });
                    },
                  ),
                  MaterialButton(
                    color: Theme.of(context).primaryColorLight,
                    child: const Text("-"),
                    onPressed: () {
                      setState(() {
                        result = operation
                            .difference(
                              operand1: int.parse(firstOperanController.text),
                              operand2: int.parse(secondOperandController.text),
                            )
                            .toDouble();
                      });
                    },
                  ),
                  MaterialButton(
                    color: Theme.of(context).primaryColorLight,
                    child: const Text("*"),
                    onPressed: () {
                      setState(() {
                        result = operation
                            .product(
                              operand1: int.parse(firstOperanController.text),
                              operand2: int.parse(secondOperandController.text),
                            )
                            .toDouble();
                      });
                    },
                  ),
                  MaterialButton(
                    color: Theme.of(context).primaryColorLight,
                    child: const Text("/"),
                    onPressed: () {
                      setState(() {
                        result = operation.division(
                          operand1: int.parse(firstOperanController.text),
                          operand2: int.parse(secondOperandController.text),
                        );
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
