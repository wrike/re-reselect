import 'dart:core';

class FlatMapCache<K, V> implements Map<K, V> {
  final _map = <K, V>{};

  @override
  Map<RK, RV> cast<RK, RV>() => _map.cast<RK, RV>();

  @override
  void clear() => _map.clear();

  @override
  bool containsKey(Object key) => _map.containsKey(key);

  @override
  bool containsValue(Object value) => _map.containsValue(value);

  @override
  bool get isEmpty => _map.isEmpty;

  @override
  bool get isNotEmpty => _map.isNotEmpty;

  @override
  Iterable<MapEntry<K, V>> get entries => _map.entries;

  @override
  void forEach(void Function(K key, V value) f) => _map.forEach(f);

  @override
  Iterable<V> get values => _map.values;

  @override
  Iterable<K> get keys => _map.keys;

  @override
  int get length => _map.length;

  @override
  Map<K2, V2> map<K2, V2>(MapEntry<K2, V2> Function(K key, V value) f) => _map.map(f);

  @override
  V putIfAbsent(K key, V Function() ifAbsent) => _map.putIfAbsent(key, ifAbsent);

  @override
  V remove(Object key) => _map.remove(key);

  @override
  void removeWhere(bool Function(K key, V value) predicate) => _map.removeWhere(predicate);

  @override
  V update(K key, V Function(V value) update, {V Function() ifAbsent}) => _map.update(key, update);

  @override
  void updateAll(V Function(K key, V value) update) => _map.updateAll(update);

  @override
  V operator [](Object key) => _map[key];

  @override
  void operator []=(K key, V value) => _map[key] = value;

  @override
  void addAll(Map<K, V> other) => _map.addAll(other);

  @override
  void addEntries(Iterable<MapEntry<K, V>> newEntries) => _map.addEntries(newEntries);
}
