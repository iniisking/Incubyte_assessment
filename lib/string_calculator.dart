int add(String numbers) {
  if (numbers.isEmpty) {
    return 0;
  }

  // Replace newlines with commas
  final normalizedNumbers = numbers.replaceAll('\n', ',');
  final numbersList = normalizedNumbers.split(',');

  return numbersList.map(int.parse).reduce((sum, num) => sum + num);
}
