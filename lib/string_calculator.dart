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

  return numbersList.map(int.parse).reduce((sum, num) => sum + num);
}
