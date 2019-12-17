import 'package:re_reselect/rereselect.dart';
import 'package:test/test.dart';

import 'utils/car.dart';
import 'utils/identical_composite_key.dart';

void main() {
  int computations;

  group('General selectors', () {
    setUp(() {
      computations = 0;
    });

    Object compute(Function func) {
      computations++;
      return func();
    }

    group('createCachedSelector1', () {
      test('default cache container recomputes when the value changes', () {
        final stateSelector = (Car state) => state;
        final combine = (Car state) => compute(() => state.name);
        final selector = createCachedSelector1(stateSelector, combine, (Car car) => car.name);

        expect(computations, 0);

        selector(Car('audi'));
        expect(computations, 1);
        expect(selector.cache.length, 1);

        selector(Car('audi'));
        expect(computations, 1);
        expect(selector.cache.length, 1);

        selector(Car('audi', 2));
        expect(computations, 2);
        expect(selector.cache.length, 1);

        expect(selector(Car('BMW')), 'BMW');
        expect(computations, 3);
        expect(selector.cache.length, 2);
      });

      test('accepts an alternate cache container that can behave differently', () {
        final stateSelector = (Car state) => state;
        final combine = (Car state) => compute(() => state.name);
        final selector = createCachedSelector1(
          stateSelector,
          combine,
          (Car state) => IdenticalCompositeKey(state),
        );

        expect(computations, 0);

        selector(Car('audi'));
        expect(computations, 1);
        expect(selector.cache.length, 1);

        selector(Car('audi'));
        expect(computations, 2);
        expect(selector.cache.length, 2);

        selector(Car('audi', 2));
        expect(computations, 3);
        expect(selector.cache.length, 3);

        expect(selector(Car('BMW')), 'BMW');
        expect(computations, 4);
        expect(selector.cache.length, 4);
      });
    });

    group('createCachedSelector2', () {
      test('default cache container recomputes when the value changes', () {
        final stateSelector1 = (Car state) => state;
        final stateSelector2 = (Car state) => state;
        final combine = (Car state1, Car state2) => compute(() => state1.name + state2.name.toLowerCase());
        final selector = createCachedSelector2(
          stateSelector1,
          stateSelector2,
          combine,
          (Car state) => state.name,
        );

        expect(computations, 0);

        selector(Car('audi'));
        expect(computations, 1);
        expect(selector.cache.length, 1);

        selector(Car('audi'));
        expect(computations, 1);
        expect(selector.cache.length, 1);

        selector(Car('audi', 2));
        expect(computations, 2);
        expect(selector.cache.length, 1);

        expect(selector(Car('BMW')), 'BMWbmw');
        expect(computations, 3);
        expect(selector.cache.length, 2);
      });

      test('accepts an alternate cache container that can behave differently', () {
        final stateSelector1 = (Car state) => state;
        final stateSelector2 = (Car state) => state;
        final combine = (Car state1, Car state2) => compute(() => state1.name + state2.name.toLowerCase());
        final selector = createCachedSelector2(
          stateSelector1,
          stateSelector2,
          combine,
          (Car state) => IdenticalCompositeKey(state),
        );

        selector(Car('audi'));
        expect(computations, 1);
        expect(selector.cache.length, 1);

        selector(Car('audi'));
        expect(computations, 2);
        expect(selector.cache.length, 2);

        selector(Car('audi', 2));
        expect(computations, 3);
        expect(selector.cache.length, 3);

        expect(selector(Car('BMW')), 'BMWbmw');
        expect(computations, 4);
        expect(selector.cache.length, 4);
      });
    });

    group('createCachedSelector3', () {
      test('default cache container recomputes when the value changes', () {
        final stateSelector1 = (Car state) => state;
        final stateSelector2 = (Car state) => state;
        final stateSelector3 = (Car state) => state;
        final combine = (Car state1, Car state2, Car state3) =>
            compute(() => state1.name + state2.name.toLowerCase() + state3.name);
        final selector = createCachedSelector3(
          stateSelector1,
          stateSelector2,
          stateSelector3,
          combine,
          (Car state) => state.name,
        );

        expect(computations, 0);

        selector(Car('audi'));
        expect(computations, 1);
        expect(selector.cache.length, 1);

        selector(Car('audi'));
        expect(computations, 1);
        expect(selector.cache.length, 1);

        selector(Car('audi', 2));
        expect(computations, 2);
        expect(selector.cache.length, 1);

        expect(selector(Car('BMW')), 'BMWbmwBMW');
        expect(computations, 3);
        expect(selector.cache.length, 2);
      });

      test('accepts an alternate cache container that can behave differently', () {
        final stateSelector1 = (Car state) => state;
        final stateSelector2 = (Car state) => state;
        final stateSelector3 = (Car state) => state;
        final combine = (Car state1, Car state2, Car state3) =>
            compute(() => state1.name + state2.name.toLowerCase() + state3.name);
        final selector = createCachedSelector3(
          stateSelector1,
          stateSelector2,
          stateSelector3,
          combine,
          (Car state) => IdenticalCompositeKey(state),
        );

        expect(computations, 0);

        selector(Car('audi'));
        expect(computations, 1);
        expect(selector.cache.length, 1);

        selector(Car('audi'));
        expect(computations, 2);
        expect(selector.cache.length, 2);

        selector(Car('audi', 2));
        expect(computations, 3);
        expect(selector.cache.length, 3);

        expect(selector(Car('BMW')), 'BMWbmwBMW');
        expect(computations, 4);
        expect(selector.cache.length, 4);
      });
    });

    group('createCachedSelector4', () {
      test('default cache container recomputes when the value changes', () {
        final stateSelector1 = (Car state) => state;
        final stateSelector2 = (Car state) => state;
        final stateSelector3 = (Car state) => state;
        final stateSelector4 = (Car state) => state;
        final combine = (Car state1, Car state2, Car state3, Car state4) =>
            compute(() => state1.name + state2.name.toLowerCase() + state3.name + state4.name.toLowerCase());
        final selector = createCachedSelector4(
          stateSelector1,
          stateSelector2,
          stateSelector3,
          stateSelector4,
          combine,
          (Car state) => state.name,
        );

        expect(computations, 0);

        selector(Car('audi'));
        expect(computations, 1);
        expect(selector.cache.length, 1);

        selector(Car('audi'));
        expect(computations, 1);
        expect(selector.cache.length, 1);

        selector(Car('audi', 2));
        expect(computations, 2);
        expect(selector.cache.length, 1);

        expect(selector(Car('BMW')), 'BMWbmwBMWbmw');
        expect(computations, 3);
        expect(selector.cache.length, 2);
      });

      test('accepts an alternate cache container that can behave differently', () {
        final stateSelector1 = (Car state) => state;
        final stateSelector2 = (Car state) => state;
        final stateSelector3 = (Car state) => state;
        final stateSelector4 = (Car state) => state;
        final combine = (Car state1, Car state2, Car state3, Car state4) =>
            compute(() => state1.name + state2.name.toLowerCase() + state3.name + state4.name.toLowerCase());
        final selector = createCachedSelector4(
          stateSelector1,
          stateSelector2,
          stateSelector3,
          stateSelector4,
          combine,
          (Car state) => IdenticalCompositeKey(state),
        );

        expect(computations, 0);

        selector(Car('audi'));
        expect(computations, 1);
        expect(selector.cache.length, 1);

        selector(Car('audi'));
        expect(computations, 2);
        expect(selector.cache.length, 2);

        selector(Car('audi', 2));
        expect(computations, 3);
        expect(selector.cache.length, 3);

        expect(selector(Car('BMW')), 'BMWbmwBMWbmw');
        expect(computations, 4);
        expect(selector.cache.length, 4);
      });
    });

    group('createCachedSelector5', () {
      test('default cache container recomputes when the value changes', () {
        final stateSelector1 = (Car state) => state;
        final stateSelector2 = (Car state) => state;
        final stateSelector3 = (Car state) => state;
        final stateSelector4 = (Car state) => state;
        final stateSelector5 = (Car state) => state;
        final combine = (Car state1, Car state2, Car state3, Car state4, Car state5) => compute(
            () => state1.name + state2.name.toLowerCase() + state3.name + state4.name.toLowerCase() + state5.name);
        final selector = createCachedSelector5(
          stateSelector1,
          stateSelector2,
          stateSelector3,
          stateSelector4,
          stateSelector5,
          combine,
          (Car state) => state.name,
        );

        expect(computations, 0);

        selector(Car('audi'));
        expect(computations, 1);
        expect(selector.cache.length, 1);

        selector(Car('audi'));
        expect(computations, 1);
        expect(selector.cache.length, 1);

        selector(Car('audi', 2));
        expect(computations, 2);
        expect(selector.cache.length, 1);

        expect(selector(Car('BMW')), 'BMWbmwBMWbmwBMW');
        expect(computations, 3);
        expect(selector.cache.length, 2);
      });

      test('accepts an alternate cache container that can behave differently', () {
        final stateSelector1 = (Car state) => state;
        final stateSelector2 = (Car state) => state;
        final stateSelector3 = (Car state) => state;
        final stateSelector4 = (Car state) => state;
        final stateSelector5 = (Car state) => state;
        final combine = (Car state1, Car state2, Car state3, Car state4, Car state5) => compute(
            () => state1.name + state2.name.toLowerCase() + state3.name + state4.name.toLowerCase() + state5.name);
        final selector = createCachedSelector5(
          stateSelector1,
          stateSelector2,
          stateSelector3,
          stateSelector4,
          stateSelector5,
          combine,
          (Car state) => IdenticalCompositeKey(state),
        );

        expect(computations, 0);

        selector(Car('audi'));
        expect(computations, 1);
        expect(selector.cache.length, 1);

        selector(Car('audi'));
        expect(computations, 2);
        expect(selector.cache.length, 2);

        selector(Car('audi', 2));
        expect(computations, 3);
        expect(selector.cache.length, 3);

        expect(selector(Car('BMW')), 'BMWbmwBMWbmwBMW');
        expect(computations, 4);
        expect(selector.cache.length, 4);
      });
    });

    group('createCachedSelector6', () {
      test('default cache container recomputes when the value changes', () {
        final stateSelector1 = (Car state) => state;
        final stateSelector2 = (Car state) => state;
        final stateSelector3 = (Car state) => state;
        final stateSelector4 = (Car state) => state;
        final stateSelector5 = (Car state) => state;
        final stateSelector6 = (Car state) => state;
        final combine = (Car state1, Car state2, Car state3, Car state4, Car state5, Car state6) => compute(() =>
            state1.name +
            state2.name.toLowerCase() +
            state3.name +
            state4.name.toLowerCase() +
            state5.name +
            state6.name.toLowerCase());
        final selector = createCachedSelector6(
          stateSelector1,
          stateSelector2,
          stateSelector3,
          stateSelector4,
          stateSelector5,
          stateSelector6,
          combine,
          (Car state) => state.name,
        );

        expect(computations, 0);

        selector(Car('audi'));
        expect(computations, 1);
        expect(selector.cache.length, 1);

        selector(Car('audi'));
        expect(computations, 1);
        expect(selector.cache.length, 1);

        selector(Car('audi', 2));
        expect(computations, 2);
        expect(selector.cache.length, 1);

        expect(selector(Car('BMW')), 'BMWbmwBMWbmwBMWbmw');
        expect(computations, 3);
        expect(selector.cache.length, 2);
      });

      test('accepts an alternate cache container that can behave differently', () {
        final stateSelector1 = (Car state) => state;
        final stateSelector2 = (Car state) => state;
        final stateSelector3 = (Car state) => state;
        final stateSelector4 = (Car state) => state;
        final stateSelector5 = (Car state) => state;
        final stateSelector6 = (Car state) => state;
        final combine = (Car state1, Car state2, Car state3, Car state4, Car state5, Car state6) => compute(() =>
            state1.name +
            state2.name.toLowerCase() +
            state3.name +
            state4.name.toLowerCase() +
            state5.name +
            state6.name.toLowerCase());
        final selector = createCachedSelector6(
          stateSelector1,
          stateSelector2,
          stateSelector3,
          stateSelector4,
          stateSelector5,
          stateSelector6,
          combine,
          (Car state) => IdenticalCompositeKey(state),
        );

        expect(computations, 0);

        selector(Car('audi'));
        expect(computations, 1);
        expect(selector.cache.length, 1);

        selector(Car('audi'));
        expect(computations, 2);
        expect(selector.cache.length, 2);

        selector(Car('audi', 2));
        expect(computations, 3);
        expect(selector.cache.length, 3);

        expect(selector(Car('BMW')), 'BMWbmwBMWbmwBMWbmw');
        expect(computations, 4);
        expect(selector.cache.length, 4);
      });
    });

    group('createCachedSelector7', () {
      test('default cache container recomputes when the value changes', () {
        final stateSelector1 = (Car state) => state;
        final stateSelector2 = (Car state) => state;
        final stateSelector3 = (Car state) => state;
        final stateSelector4 = (Car state) => state;
        final stateSelector5 = (Car state) => state;
        final stateSelector6 = (Car state) => state;
        final stateSelector7 = (Car state) => state;
        final combine = (Car state1, Car state2, Car state3, Car state4, Car state5, Car state6, Car state7) => compute(
            () =>
                state1.name +
                state2.name.toLowerCase() +
                state3.name +
                state4.name.toLowerCase() +
                state5.name +
                state6.name.toLowerCase() +
                state7.name);
        final selector = createCachedSelector7(
          stateSelector1,
          stateSelector2,
          stateSelector3,
          stateSelector4,
          stateSelector5,
          stateSelector6,
          stateSelector7,
          combine,
          (Car state) => state.name,
        );

        expect(computations, 0);

        selector(Car('audi'));
        expect(computations, 1);
        expect(selector.cache.length, 1);

        selector(Car('audi'));
        expect(computations, 1);
        expect(selector.cache.length, 1);

        selector(Car('audi', 2));
        expect(computations, 2);
        expect(selector.cache.length, 1);

        expect(selector(Car('BMW')), 'BMWbmwBMWbmwBMWbmwBMW');
        expect(computations, 3);
        expect(selector.cache.length, 2);
      });

      test('accepts an alternate cache container that can behave differently', () {
        final stateSelector1 = (Car state) => state;
        final stateSelector2 = (Car state) => state;
        final stateSelector3 = (Car state) => state;
        final stateSelector4 = (Car state) => state;
        final stateSelector5 = (Car state) => state;
        final stateSelector6 = (Car state) => state;
        final stateSelector7 = (Car state) => state;
        final combine = (Car state1, Car state2, Car state3, Car state4, Car state5, Car state6, Car state7) => compute(
            () =>
                state1.name +
                state2.name.toLowerCase() +
                state3.name +
                state4.name.toLowerCase() +
                state5.name +
                state6.name.toLowerCase() +
                state7.name);
        final selector = createCachedSelector7(
          stateSelector1,
          stateSelector2,
          stateSelector3,
          stateSelector4,
          stateSelector5,
          stateSelector6,
          stateSelector7,
          combine,
          (Car state) => IdenticalCompositeKey(state),
        );

        expect(computations, 0);

        selector(Car('audi'));
        expect(computations, 1);
        expect(selector.cache.length, 1);

        selector(Car('audi'));
        expect(computations, 2);
        expect(selector.cache.length, 2);

        selector(Car('audi', 2));
        expect(computations, 3);
        expect(selector.cache.length, 3);

        expect(selector(Car('BMW')), 'BMWbmwBMWbmwBMWbmwBMW');
        expect(computations, 4);
        expect(selector.cache.length, 4);
      });
    });

    group('createCachedSelector8', () {
      test('default cache container recomputes when the value changes', () {
        final stateSelector1 = (Car state) => state;
        final stateSelector2 = (Car state) => state;
        final stateSelector3 = (Car state) => state;
        final stateSelector4 = (Car state) => state;
        final stateSelector5 = (Car state) => state;
        final stateSelector6 = (Car state) => state;
        final stateSelector7 = (Car state) => state;
        final stateSelector8 = (Car state) => state;
        final combine =
            (Car state1, Car state2, Car state3, Car state4, Car state5, Car state6, Car state7, Car state8) => compute(
                () =>
                    state1.name +
                    state2.name.toLowerCase() +
                    state3.name +
                    state4.name.toLowerCase() +
                    state5.name +
                    state6.name.toLowerCase() +
                    state7.name +
                    state8.name.toLowerCase());
        final selector = createCachedSelector8(
          stateSelector1,
          stateSelector2,
          stateSelector3,
          stateSelector4,
          stateSelector5,
          stateSelector6,
          stateSelector7,
          stateSelector8,
          combine,
          (Car state) => state.name,
        );

        expect(computations, 0);

        selector(Car('audi'));
        expect(computations, 1);
        expect(selector.cache.length, 1);

        selector(Car('audi'));
        expect(computations, 1);
        expect(selector.cache.length, 1);

        selector(Car('audi', 2));
        expect(computations, 2);
        expect(selector.cache.length, 1);

        expect(selector(Car('BMW')), 'BMWbmwBMWbmwBMWbmwBMWbmw');
        expect(computations, 3);
        expect(selector.cache.length, 2);
      });

      test('accepts an alternate cache container that can behave differently', () {
        final stateSelector1 = (Car state) => state;
        final stateSelector2 = (Car state) => state;
        final stateSelector3 = (Car state) => state;
        final stateSelector4 = (Car state) => state;
        final stateSelector5 = (Car state) => state;
        final stateSelector6 = (Car state) => state;
        final stateSelector7 = (Car state) => state;
        final stateSelector8 = (Car state) => state;
        final combine =
            (Car state1, Car state2, Car state3, Car state4, Car state5, Car state6, Car state7, Car state8) => compute(
                () =>
                    state1.name +
                    state2.name.toLowerCase() +
                    state3.name +
                    state4.name.toLowerCase() +
                    state5.name +
                    state6.name.toLowerCase() +
                    state7.name +
                    state8.name.toLowerCase());
        final selector = createCachedSelector8(
          stateSelector1,
          stateSelector2,
          stateSelector3,
          stateSelector4,
          stateSelector5,
          stateSelector6,
          stateSelector7,
          stateSelector8,
          combine,
          (Car state) => IdenticalCompositeKey(state),
        );

        expect(computations, 0);

        selector(Car('audi'));
        expect(computations, 1);
        expect(selector.cache.length, 1);

        selector(Car('audi'));
        expect(computations, 2);
        expect(selector.cache.length, 2);

        selector(Car('audi', 2));
        expect(computations, 3);
        expect(selector.cache.length, 3);

        expect(selector(Car('BMW')), 'BMWbmwBMWbmwBMWbmwBMWbmw');
        expect(computations, 4);
        expect(selector.cache.length, 4);
      });
    });

    group('createCachedSelector9', () {
      test('default cache container recomputes when the value changes', () {
        final stateSelector1 = (Car state) => state;
        final stateSelector2 = (Car state) => state;
        final stateSelector3 = (Car state) => state;
        final stateSelector4 = (Car state) => state;
        final stateSelector5 = (Car state) => state;
        final stateSelector6 = (Car state) => state;
        final stateSelector7 = (Car state) => state;
        final stateSelector8 = (Car state) => state;
        final stateSelector9 = (Car state) => state;
        final combine = (
          Car state1,
          Car state2,
          Car state3,
          Car state4,
          Car state5,
          Car state6,
          Car state7,
          Car state8,
          Car state9,
        ) =>
            compute(() =>
                state1.name +
                state2.name.toLowerCase() +
                state3.name +
                state4.name.toLowerCase() +
                state5.name +
                state6.name.toLowerCase() +
                state7.name +
                state8.name.toLowerCase() +
                state9.name);
        final selector = createCachedSelector9(
          stateSelector1,
          stateSelector2,
          stateSelector3,
          stateSelector4,
          stateSelector5,
          stateSelector6,
          stateSelector7,
          stateSelector8,
          stateSelector9,
          combine,
          (Car state) => state.name,
        );

        expect(computations, 0);

        selector(Car('audi'));
        expect(computations, 1);
        expect(selector.cache.length, 1);

        selector(Car('audi'));
        expect(computations, 1);
        expect(selector.cache.length, 1);

        selector(Car('audi', 2));
        expect(computations, 2);
        expect(selector.cache.length, 1);

        expect(selector(Car('BMW')), 'BMWbmwBMWbmwBMWbmwBMWbmwBMW');
        expect(computations, 3);
        expect(selector.cache.length, 2);
      });

      test('accepts an alternate cache container that can behave differently', () {
        final stateSelector1 = (Car state) => state;
        final stateSelector2 = (Car state) => state;
        final stateSelector3 = (Car state) => state;
        final stateSelector4 = (Car state) => state;
        final stateSelector5 = (Car state) => state;
        final stateSelector6 = (Car state) => state;
        final stateSelector7 = (Car state) => state;
        final stateSelector8 = (Car state) => state;
        final stateSelector9 = (Car state) => state;
        final combine = (
          Car state1,
          Car state2,
          Car state3,
          Car state4,
          Car state5,
          Car state6,
          Car state7,
          Car state8,
          Car state9,
        ) =>
            compute(() =>
                state1.name +
                state2.name.toLowerCase() +
                state3.name +
                state4.name.toLowerCase() +
                state5.name +
                state6.name.toLowerCase() +
                state7.name +
                state8.name.toLowerCase() +
                state9.name);
        final selector = createCachedSelector9(
          stateSelector1,
          stateSelector2,
          stateSelector3,
          stateSelector4,
          stateSelector5,
          stateSelector6,
          stateSelector7,
          stateSelector8,
          stateSelector9,
          combine,
          (Car state) => IdenticalCompositeKey(state),
        );

        expect(computations, 0);

        selector(Car('audi'));
        expect(computations, 1);
        expect(selector.cache.length, 1);

        selector(Car('audi'));
        expect(computations, 2);
        expect(selector.cache.length, 2);

        selector(Car('audi', 2));
        expect(computations, 3);
        expect(selector.cache.length, 3);

        expect(selector(Car('BMW')), 'BMWbmwBMWbmwBMWbmwBMWbmwBMW');
        expect(computations, 4);
        expect(selector.cache.length, 4);
      });
    });

    group('createCachedSelector10', () {
      test('default cache container recomputes when the value changes', () {
        final stateSelector1 = (Car state) => state;
        final stateSelector2 = (Car state) => state;
        final stateSelector3 = (Car state) => state;
        final stateSelector4 = (Car state) => state;
        final stateSelector5 = (Car state) => state;
        final stateSelector6 = (Car state) => state;
        final stateSelector7 = (Car state) => state;
        final stateSelector8 = (Car state) => state;
        final stateSelector9 = (Car state) => state;
        final stateSelector10 = (Car state) => state;
        final combine = (
          Car state1,
          Car state2,
          Car state3,
          Car state4,
          Car state5,
          Car state6,
          Car state7,
          Car state8,
          Car state9,
          Car state10,
        ) =>
            compute(() =>
                state1.name +
                state2.name.toLowerCase() +
                state3.name +
                state4.name.toLowerCase() +
                state5.name +
                state6.name.toLowerCase() +
                state7.name +
                state8.name.toLowerCase() +
                state9.name +
                state10.name.toLowerCase());
        final selector = createCachedSelector10(
          stateSelector1,
          stateSelector2,
          stateSelector3,
          stateSelector4,
          stateSelector5,
          stateSelector6,
          stateSelector7,
          stateSelector8,
          stateSelector9,
          stateSelector10,
          combine,
          (Car state) => state.name,
        );

        expect(computations, 0);

        selector(Car('audi'));
        expect(computations, 1);
        expect(selector.cache.length, 1);

        selector(Car('audi'));
        expect(computations, 1);
        expect(selector.cache.length, 1);

        selector(Car('audi', 2));
        expect(computations, 2);
        expect(selector.cache.length, 1);

        expect(selector(Car('BMW')), 'BMWbmwBMWbmwBMWbmwBMWbmwBMWbmw');
        expect(computations, 3);
        expect(selector.cache.length, 2);
      });

      test('accepts an alternate cache container that can behave differently', () {
        final stateSelector1 = (Car state) => state;
        final stateSelector2 = (Car state) => state;
        final stateSelector3 = (Car state) => state;
        final stateSelector4 = (Car state) => state;
        final stateSelector5 = (Car state) => state;
        final stateSelector6 = (Car state) => state;
        final stateSelector7 = (Car state) => state;
        final stateSelector8 = (Car state) => state;
        final stateSelector9 = (Car state) => state;
        final stateSelector10 = (Car state) => state;
        final combine = (
          Car state1,
          Car state2,
          Car state3,
          Car state4,
          Car state5,
          Car state6,
          Car state7,
          Car state8,
          Car state9,
          Car state10,
        ) =>
            compute(() =>
                state1.name +
                state2.name.toLowerCase() +
                state3.name +
                state4.name.toLowerCase() +
                state5.name +
                state6.name.toLowerCase() +
                state7.name +
                state8.name.toLowerCase() +
                state9.name +
                state10.name.toLowerCase());
        final selector = createCachedSelector10(
          stateSelector1,
          stateSelector2,
          stateSelector3,
          stateSelector4,
          stateSelector5,
          stateSelector6,
          stateSelector7,
          stateSelector8,
          stateSelector9,
          stateSelector10,
          combine,
          (Car state) => IdenticalCompositeKey(state),
        );

        expect(computations, 0);

        selector(Car('audi'));
        expect(computations, 1);
        expect(selector.cache.length, 1);

        selector(Car('audi'));
        expect(computations, 2);
        expect(selector.cache.length, 2);

        selector(Car('audi', 2));
        expect(computations, 3);
        expect(selector.cache.length, 3);

        expect(selector(Car('BMW')), 'BMWbmwBMWbmwBMWbmwBMWbmwBMWbmw');
        expect(computations, 4);
        expect(selector.cache.length, 4);
      });
    });
  });
}
