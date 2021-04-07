import 'package:admibka/api/buyHistory.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Counter value should be incremented', () async {
    int id = 1;
    final result = await VHistoryApi().getServ(id);

    expect(result.length > 20, true);
  });
  test('Counter value should be incremented', () async {
    int id = 1;
    final result = await VHistoryApi().getServ(id);

    expect(result.length > 1, true);
  });
}
