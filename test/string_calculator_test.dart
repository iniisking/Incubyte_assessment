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

  test('add numbers with new lines returns correct sum', () {
    expect(add('1\n2,3'), equals(6));
    expect(add('1\n2\n3'), equals(6));
  });

  test('add numbers with custom delimiter returns correct sum', () {
    expect(add('//;\n1;2'), equals(3));
    expect(add('//|\n1|2|3'), equals(6));
    expect(add('//\$\n10\$20\$30'), equals(60));
  });

  test('add with negative numbers throws exception', () {
    expect(() => add('1,-2,3'), throwsA(isA<Exception>()));

    expect(
      () => add('1,-2,3'),
      throwsA(
        predicate(
          (e) => e.toString().contains('negative numbers not allowed -2'),
        ),
      ),
    );

    expect(
      () => add('//;\n1;-2;-3'),
      throwsA(
        predicate(
          (e) => e.toString().contains('negative numbers not allowed -2,-3'),
        ),
      ),
    );
  });

  test('add with mixed delimiters returns correct sum', () {
    expect(add('1,2\n3'), equals(6));
  });

  test('add with large numbers returns correct sum', () {
    expect(add('100,200,300'), equals(600));
  });

  test('add with zeros returns correct sum', () {
    expect(add('0,5,0'), equals(5));
    expect(add('0,0,0'), equals(0));
  });

  test('add single negative number throws exception', () {
    expect(
      () => add('-1'),
      throwsA(
        predicate(
          (e) => e.toString().contains('negative numbers not allowed -1'),
        ),
      ),
    );
  });

  test('add with trailing delimiter handles correctly', () {
    expect(add('1,2,'), equals(3));
  });
}
