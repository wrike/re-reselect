import 'flat_cache.dart';

class FifoCache<K, V> extends FlatMapCache<K, V> {
  final int _cacheSize;

  FifoCache(this._cacheSize);

  @override
  V putIfAbsent(K key, V Function() ifAbsent) {
    final result = super.putIfAbsent(key, ifAbsent);
    if (length > _cacheSize) {
      remove(keys.first);
    }

    return result;
  }
}
