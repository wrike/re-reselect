import 'package:re_reselect/cache/lru_cache.dart';
import 'package:re_reselect/rereselect.dart';
import 'package:test/test.dart';

import 'utils/car.dart';

void main() {
  group('Selectors with LRU strategy', () {
    test('replace oldest value', () {
      final stateSelector = (Car state) => state;
      final combine = (Car state) => state.name;
      final selector = createCachedSelector1(stateSelector, combine, (Car state) => state.name,
          cacheObject: LruCache<String, Selector<Car, String>>(3));

      selector(Car('audi'));
      expect(selector.cache.length, 1);

      selector(Car('bmw'));
      expect(selector.cache.length, 2);

      selector(Car('kia'));
      expect(selector.cache.length, 3);

      expect(selector(Car('toyota')), equals('toyota'));
      expect(selector.cache.length, 3);
      expect(selector.cache.keys, equals(['bmw', 'kia', 'toyota']));

      expect(selector(Car('kia')), equals('kia'));
      expect(selector.cache.length, 3);
      expect(selector.cache.keys, equals(['bmw', 'toyota', 'kia']));
    });

    test('update oldest value', () {
      final stateSelector = (Car state) => state;
      final combine = (Car state) => state.name;
      final selector = createCachedSelector1(stateSelector, combine, (Car state) => state.name,
          cacheObject: LruCache<String, Selector<Car, String>>(3));

      selector(Car('audi'));
      expect(selector.cache.length, 1);

      selector(Car('bmw'));
      expect(selector.cache.length, 2);

      selector(Car('kia'));
      expect(selector.cache.length, 3);

      selector(Car('audi'));
      expect(selector.cache.length, 3);

      expect(selector(Car('lada')), equals('lada'));
      expect(selector.cache.length, 3);
      expect(selector.cache.keys, equals(['kia', 'audi', 'lada']));
    });

    test('dont replace same value', () {
      final stateSelector = (Car state) => state;
      final combine = (Car state) => state.name;
      final selector = createCachedSelector1(stateSelector, combine, (Car state) => state.name,
          cacheObject: LruCache<String, Selector<Car, String>>(3));

      selector(Car('audi'));
      expect(selector.cache.length, 1);

      selector(Car('audi'));
      expect(selector.cache.length, 1);

      selector(Car('audi'));
      expect(selector.cache.length, 1);

      selector(Car('audi'));
      expect(selector.cache.length, 1);
      expect(selector.cache.keys, equals(['audi']));
    });

    test('zero size', () {
      final stateSelector = (Car state) => state;
      final combine = (Car state) => state.name;
      final selector = createCachedSelector1(stateSelector, combine, (Car state) => state.name,
          cacheObject: LruCache<String, Selector<Car, String>>(0));

      selector(Car('audi'));
      expect(selector.cache.isEmpty, isTrue);
    });
  });
}
