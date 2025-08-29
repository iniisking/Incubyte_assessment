/// A string calculator that adds numbers provided in various formats.
///
/// Supports:
/// - Empty strings (returns 0)
/// - Single numbers
/// - Multiple numbers separated by commas
/// - New lines as delimiters
/// - Custom delimiters (e.g., "//;\n1;2")
/// - Negative number validation
int add(String numbers) {
  if (numbers.isEmpty) {
    return 0;
  }

  String delimiter = ',';
  String numbersToProcess = numbers;

  // Handle custom delimiter
  if (numbers.startsWith('//')) {
    final lines = numbers.split('\n');
    if (lines.length >= 2) {
      delimiter = lines[0].substring(2);
      numbersToProcess = lines.sublist(1).join('\n');
    } else {
      return 0; // Invalid format, return 0
    }
  }

  // Normalize all delimiters to the current delimiter
  final normalizedNumbers = numbersToProcess.replaceAll('\n', delimiter);

  // Split and filter out empty strings
  final numbersList = normalizedNumbers.split(delimiter);
  final nonEmptyNumbers = numbersList.where((num) => num.isNotEmpty);

  if (nonEmptyNumbers.isEmpty) {
    return 0;
  }

  // Parse to integers
  final numbersInt = nonEmptyNumbers.map(int.parse).toList();

  // Check for negative numbers
  final negatives = numbersInt.where((num) => num < 0).toList();
  if (negatives.isNotEmpty) {
    final negativeStrings = negatives.map((n) => n.toString()).join(',');
    throw Exception('negative numbers not allowed $negativeStrings');
  }

  // Calculate sum
  return numbersInt.fold(0, (sum, num) => sum + num);
}
