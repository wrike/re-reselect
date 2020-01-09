library re_reselect;

import 'package:reselect/reselect.dart';
import 'cache/flat_cache.dart';

export 'package:reselect/reselect.dart';

class SelectorClass<S, K, T> {
  final Map<K, Selector<S, T>> _cache;
  final Selector<S, Selector<S, T>> _selector;

  SelectorClass(this._cache, this._selector);

  Map<K, Selector<S, T>> get cache => _cache;

  T call(S state) => _selector(state)(state);
  void clearCache() => _cache.clear();
}

SelectorClass<S, K, T> createCachedSelector1<S, R1, K, T>(
  Selector<S, R1> selector,
  T Function(R1) combiner,
  Selector<S, K> keySelector, {
  Map<K, Selector<S, T>> cacheObject,
}) {
  final cache = cacheObject ?? FlatMapCache<K, Selector<S, T>>();
  return SelectorClass(
      cache,
      (S state) => cache.putIfAbsent(
          keySelector(state),
          () => createSelector1(
                selector,
                combiner,
              )));
}

SelectorClass<S, K, T> createCachedSelector2<S, R1, R2, K, T>(
  Selector<S, R1> selector1,
  Selector<S, R2> selector2,
  T Function(R1, R2) combiner,
  Selector<S, K> keySelector, {
  Map<K, Selector<S, T>> cacheObject,
}) {
  final cache = cacheObject ?? FlatMapCache<K, Selector<S, T>>();
  return SelectorClass(
      cache,
      (S state) => cache.putIfAbsent(
          keySelector(state),
          () => createSelector2(
                selector1,
                selector2,
                combiner,
              )));
}

SelectorClass<S, K, T> createCachedSelector3<S, R1, R2, R3, K, T>(
  Selector<S, R1> selector1,
  Selector<S, R2> selector2,
  Selector<S, R3> selector3,
  T Function(R1, R2, R3) combiner,
  Selector<S, K> keySelector, {
  Map<K, Selector<S, T>> cacheObject,
}) {
  final cache = cacheObject ?? FlatMapCache<K, Selector<S, T>>();
  return SelectorClass(
      cache,
      (S state) => cache.putIfAbsent(
          keySelector(state),
          () => createSelector3(
                selector1,
                selector2,
                selector3,
                combiner,
              )));
}

SelectorClass<S, K, T> createCachedSelector4<S, R1, R2, R3, R4, K, T>(
  Selector<S, R1> selector1,
  Selector<S, R2> selector2,
  Selector<S, R3> selector3,
  Selector<S, R4> selector4,
  T Function(R1, R2, R3, R4) combiner,
  Selector<S, K> keySelector, {
  Map<K, Selector<S, T>> cacheObject,
}) {
  final cache = cacheObject ?? FlatMapCache<K, Selector<S, T>>();
  return SelectorClass(
      cache,
      (S state) => cache.putIfAbsent(
          keySelector(state),
          () => createSelector4(
                selector1,
                selector2,
                selector3,
                selector4,
                combiner,
              )));
}

SelectorClass<S, K, T> createCachedSelector5<S, R1, R2, R3, R4, R5, K, T>(
  Selector<S, R1> selector1,
  Selector<S, R2> selector2,
  Selector<S, R3> selector3,
  Selector<S, R4> selector4,
  Selector<S, R5> selector5,
  T Function(R1, R2, R3, R4, R5) combiner,
  Selector<S, K> keySelector, {
  Map<K, Selector<S, T>> cacheObject,
}) {
  final cache = cacheObject ?? FlatMapCache<K, Selector<S, T>>();
  return SelectorClass(
      cache,
      (S state) => cache.putIfAbsent(
          keySelector(state),
          () => createSelector5(
                selector1,
                selector2,
                selector3,
                selector4,
                selector5,
                combiner,
              )));
}

SelectorClass<S, K, T> createCachedSelector6<S, R1, R2, R3, R4, R5, R6, K, T>(
  Selector<S, R1> selector1,
  Selector<S, R2> selector2,
  Selector<S, R3> selector3,
  Selector<S, R4> selector4,
  Selector<S, R5> selector5,
  Selector<S, R6> selector6,
  T Function(R1, R2, R3, R4, R5, R6) combiner,
  Selector<S, K> keySelector, {
  Map<K, Selector<S, T>> cacheObject,
}) {
  final cache = cacheObject ?? FlatMapCache<K, Selector<S, T>>();
  return SelectorClass(
      cache,
      (S state) => cache.putIfAbsent(
          keySelector(state),
          () => createSelector6(
                selector1,
                selector2,
                selector3,
                selector4,
                selector5,
                selector6,
                combiner,
              )));
}

SelectorClass<S, K, T> createCachedSelector7<S, R1, R2, R3, R4, R5, R6, R7, K, T>(
  Selector<S, R1> selector1,
  Selector<S, R2> selector2,
  Selector<S, R3> selector3,
  Selector<S, R4> selector4,
  Selector<S, R5> selector5,
  Selector<S, R6> selector6,
  Selector<S, R7> selector7,
  T Function(R1, R2, R3, R4, R5, R6, R7) combiner,
  Selector<S, K> keySelector, {
  Map<K, Selector<S, T>> cacheObject,
}) {
  final cache = cacheObject ?? FlatMapCache<K, Selector<S, T>>();
  return SelectorClass(
      cache,
      (S state) => cache.putIfAbsent(
          keySelector(state),
          () => createSelector7(
                selector1,
                selector2,
                selector3,
                selector4,
                selector5,
                selector6,
                selector7,
                combiner,
              )));
}

SelectorClass<S, K, T> createCachedSelector8<S, R1, R2, R3, R4, R5, R6, R7, R8, K, T>(
  Selector<S, R1> selector1,
  Selector<S, R2> selector2,
  Selector<S, R3> selector3,
  Selector<S, R4> selector4,
  Selector<S, R5> selector5,
  Selector<S, R6> selector6,
  Selector<S, R7> selector7,
  Selector<S, R8> selector8,
  T Function(R1, R2, R3, R4, R5, R6, R7, R8) combiner,
  Selector<S, K> keySelector, {
  Map<K, Selector<S, T>> cacheObject,
}) {
  final cache = cacheObject ?? FlatMapCache<K, Selector<S, T>>();
  return SelectorClass(
      cache,
      (S state) => cache.putIfAbsent(
          keySelector(state),
          () => createSelector8(
                selector1,
                selector2,
                selector3,
                selector4,
                selector5,
                selector6,
                selector7,
                selector8,
                combiner,
              )));
}

SelectorClass<S, K, T> createCachedSelector9<S, R1, R2, R3, R4, R5, R6, R7, R8, R9, K, T>(
  Selector<S, R1> selector1,
  Selector<S, R2> selector2,
  Selector<S, R3> selector3,
  Selector<S, R4> selector4,
  Selector<S, R5> selector5,
  Selector<S, R6> selector6,
  Selector<S, R7> selector7,
  Selector<S, R8> selector8,
  Selector<S, R9> selector9,
  T Function(R1, R2, R3, R4, R5, R6, R7, R8, R9) combiner,
  Selector<S, K> keySelector, {
  Map<K, Selector<S, T>> cacheObject,
}) {
  final cache = cacheObject ?? FlatMapCache<K, Selector<S, T>>();
  return SelectorClass(
      cache,
      (S state) => cache.putIfAbsent(
          keySelector(state),
          () => createSelector9(
                selector1,
                selector2,
                selector3,
                selector4,
                selector5,
                selector6,
                selector7,
                selector8,
                selector9,
                combiner,
              )));
}

SelectorClass<S, K, T> createCachedSelector10<S, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, K, T>(
  Selector<S, R1> selector1,
  Selector<S, R2> selector2,
  Selector<S, R3> selector3,
  Selector<S, R4> selector4,
  Selector<S, R5> selector5,
  Selector<S, R6> selector6,
  Selector<S, R7> selector7,
  Selector<S, R8> selector8,
  Selector<S, R9> selector9,
  Selector<S, R10> selector10,
  T Function(R1, R2, R3, R4, R5, R6, R7, R8, R9, R10) combiner,
  Selector<S, K> keySelector, {
  Map<K, Selector<S, T>> cacheObject,
}) {
  final cache = cacheObject ?? FlatMapCache<K, Selector<S, T>>();
  return SelectorClass(
      cache,
      (S state) => cache.putIfAbsent(
          keySelector(state),
          () => createSelector10(
                selector1,
                selector2,
                selector3,
                selector4,
                selector5,
                selector6,
                selector7,
                selector8,
                selector9,
                selector10,
                combiner,
              )));
}
