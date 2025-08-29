import 'package:test/test.dart';
import 'package:string_calculator/string_calculator.dart';

void main() {
  test('add empty string returns 0', () {
    expect(add(''), equals(0));
  });

  test('add single number returns the number', () {
    expect(add('1'), equals(1));
    expect(add('5'), equals(5));
  });

  test('add two numbers returns their sum', () {
    expect(add('1,2'), equals(3));
    expect(add('3,5'), equals(8));
  });
}
