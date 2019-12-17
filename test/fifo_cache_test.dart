import 'package:re_reselect/cache/fifo_cache.dart';
import 'package:re_reselect/rereselect.dart';
import 'package:test/test.dart';

import 'utils/car.dart';

void main() {
  group('Selectors with FIFO strategy', () {
    test('replace first value', () {
      final stateSelector = (Car state) => state;
      final combine = (Car state) => state.name;
      final selector = createCachedSelector1(stateSelector, combine, (Car state) => state.name,
          cacheObject: FifoCache<String, Selector<Car, String>>(3));

      selector(Car('audi'));
      expect(selector.cache.length, 1);

      selector(Car('bmw'));
      expect(selector.cache.length, 2);

      selector(Car('kia'));
      expect(selector.cache.length, 3);

      selector(Car('toyota'));
      expect(selector.cache.length, 3);
      expect(selector.cache.keys, equals(['bmw', 'kia', 'toyota']));

      expect(selector(Car('lada')), equals('lada'));
      expect(selector.cache.length, 3);
      expect(selector.cache.keys, equals(['kia', 'toyota', 'lada']));
    });

    test('dont replace same value', () {
      final stateSelector = (Car state) => state;
      final combine = (Car state) => state.name;
      final selector = createCachedSelector1(stateSelector, combine, (Car state) => state.name,
          cacheObject: FifoCache<String, Selector<Car, String>>(3));

      selector(Car('audi'));
      expect(selector.cache.length, 1);

      selector(Car('audi'));
      expect(selector.cache.length, 1);

      selector(Car('audi'));
      expect(selector.cache.length, 1);

      expect(selector(Car('audi')), equals('audi'));
      expect(selector.cache.length, 1);
      expect(selector.cache.keys, equals(['audi']));
    });

    test('zero size', () {
      final stateSelector = (Car state) => state;
      final combine = (Car state) => state.name;
      final selector = createCachedSelector1(stateSelector, combine, (Car state) => state,
          cacheObject: FifoCache<Car, Selector<Car, String>>(0));

      selector(Car('audi'));
      expect(selector.cache.isEmpty, isTrue);
    });
  });
}
