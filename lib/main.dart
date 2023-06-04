void main() async {
  final stopwatch = Stopwatch()..start();
  for (var i = 0; i < 5; i++) {
    await someOperations(i);
  }
  print('someOperations() one after one executed in ${stopwatch.elapsed}');
  final stopwatch2 = Stopwatch()..start();
  await Future.wait([
    someOperations(0),
    someOperations(1),
    someOperations(2),
    someOperations(3),
    someOperations(4),
  ]);
  print(
    'someOperations() with list of Future.wait executed in ${stopwatch2.elapsed}',
  );
}

Future<void> someOperations(int x) async {
  for (var i = 0; i < x; i++) {
    // nothing
    await Future<void>.delayed(const Duration(seconds: 1));
  }
}
