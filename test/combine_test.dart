import 'package:re_reselect/rereselect.dart';
import 'package:test/test.dart';

void main() {
  group('Combine methods', () {
    test('diff argument types', () {
      final stateSelector1 = (_State state) => state.first;
      final stateSelector2 = (_State state) => state.second;
      final combine = (int first, String second) => '$first$second';
      final selector = createCachedSelector2(stateSelector1, stateSelector2, combine, (_State state) => state);

      expect(selector(_State(42, 'rock')), equals('42rock'));
    });
  });
}

class _State {
  final int first;
  final String second;

  _State(this.first, this.second);
}
