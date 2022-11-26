import 'package:flutter_test/flutter_test.dart';
import 'package:unit_testing/test_2/logic/operation.dart';

void main() {
  late Operation operation;

  setUp(() {
    operation = Operation();
  });

  group("Calculator Operations test -", () {
    const int operand1 = 1;
    const int operand2 = 1;

    test("Testing SUM $operand1+$operand2", () {
      final sum = operation.sum(operand1: operand1, operand2: operand2);
      expect(sum, 2);
    });

    test("Testing Difference $operand1-$operand2", () {
      final diff = operation.difference(operand1: operand1, operand2: operand2);
      expect(diff, 0);
    });

    test("Testing product $operand1*$operand2", () {
      final product = operation.product(operand1: operand1, operand2: operand2);
      expect(product, 1);
    });

    test("Testing division $operand1/$operand2", () {
      final division = operation.division(operand1: operand1, operand2: operand2);
      expect(division, 1);
    });
  });
}
