import 'package:re_reselect/rereselect.dart';

class OriginalState {
  final String key;
  final int a;
  final int b;
  final int c;
  final int d;
  OriginalState(this.key, this.a, this.b, this.c, this.d);
}

void main() {
  // First state selector
  final stateSelector1 = (OriginalState state) => state.a + state.b;

  // Second state selector
  final stateSelector2 = (OriginalState state) => state.c + state.d;

  // Computation method
  final combine = (int state1, int state2) => state1 + state2;

  // Create Re-reselect selector from two selector methods and Key as cache key
  final selector = createCachedSelector2(stateSelector1, stateSelector2, combine, (OriginalState state) => state.key);

  // Will execute combine method and print 10
  print(selector(OriginalState('test', 1, 2, 3, 4)));

  // Will NOT execute combine method and print 10 from cache
  print(selector(OriginalState('test', 1, 2, 3, 4)));

  // Will execute combine method and print 10
  print(selector(OriginalState('test2', 1, 2, 3, 4)));

  // Will execute combine method and print 18 (because of params changes)
  print(selector(OriginalState('test2', 1, 10, 3, 4)));

  // Clear cache
  selector.clearCache();
}
