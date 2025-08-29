int add(String numbers) {
  if (numbers.isEmpty) {
    return 0;
  }

  String delimiter = ',';
  String numbersToProcess = numbers;

  // Check for custom delimiter
  if (numbers.startsWith('//')) {
    final lines = numbers.split('\n');
    if (lines.length >= 2) {
      delimiter = lines[0].substring(2);
      numbersToProcess = lines.sublist(1).join('\n');
    }
  }

  // Replace newlines with the current delimiter
  final normalizedNumbers = numbersToProcess.replaceAll('\n', delimiter);
  final numbersList = normalizedNumbers.split(delimiter);

  // Filter out empty strings and parse to integers
  final nonEmptyNumbers = numbersList.where((num) => num.isNotEmpty);
  final numbersInt = nonEmptyNumbers.map(int.parse).toList();

  // Check for negative numbers
  final negatives = numbersInt.where((num) => num < 0).toList();
  if (negatives.isNotEmpty) {
    final negativeStrings = negatives.map((n) => n.toString()).join(',');
    throw Exception('negative numbers not allowed $negativeStrings');
  }

  return numbersInt.fold(0, (sum, num) => sum + num);
}
