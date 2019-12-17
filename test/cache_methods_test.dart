import 'package:re_reselect/rereselect.dart';
import 'package:test/test.dart';

import 'utils/car.dart';

void main() {
  group('Cache methods', () {
    test('clear сache', () {
      final stateSelector = (Car state) => state;
      final combine = (Car state) => state.name;
      final selector = createCachedSelector1(stateSelector, combine, (Car state) => state.name);

      selector(Car('audi'));
      expect(selector.cache.length, 1);

      selector(Car('bmw'));
      expect(selector.cache.length, 2);

      selector(Car('kia'));
      expect(selector.cache.length, 3);

      selector(Car('kia'));
      expect(selector.cache.length, 3);

      selector.clearCache();
      expect(selector.cache.isEmpty, isTrue);
    });
  });
}
