int add(String numbers) {
  if (numbers.isEmpty) {
    return 0;
  }

  final numbersList = numbers.split(',');
  return numbersList.map(int.parse).reduce((sum, num) => sum + num);
}
