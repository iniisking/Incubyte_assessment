// Test 1

import 'package:test/test.dart';
import 'package:string_calculator/string_calculator.dart';

void main() {
  test('add empty string returns 0', () {
    expect(add(''), equals(0));
  });
}
