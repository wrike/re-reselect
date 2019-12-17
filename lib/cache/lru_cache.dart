import 'fifo_cache.dart';

class LruCache<K, V> extends FifoCache<K, V> {
  LruCache(int cacheSize) : super(cacheSize);

  @override
  V putIfAbsent(K key, V Function() ifAbsent) {
    if (containsKey(key)) {
      remove(key);
    }

    return super.putIfAbsent(key, ifAbsent);
  }
}
