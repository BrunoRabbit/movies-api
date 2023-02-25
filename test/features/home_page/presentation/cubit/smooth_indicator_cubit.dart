import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies_api/features/home_page/presentation/cubit/smooth_indicator_cubit/smooth_indicator_cubit.dart';

void main() {
  group('method counter', () {
    late SmoothIndicatorCubit smoothIndicatorCubit;

    setUp(() {
      smoothIndicatorCubit = SmoothIndicatorCubit();
    });
    test('initial state is SmoothIndicatorState', () {
      expect(smoothIndicatorCubit.state, isA<SmoothIndicatorState>());
    });

    blocTest<SmoothIndicatorCubit, SmoothIndicatorState>(
      'should change [SmothIndicatorState] value',
      build: () => smoothIndicatorCubit,
      act: (cubit) => cubit.counter(0),
      expect: () => <SmoothIndicatorState>[SmoothIndicatorState(value: 0)],
    );
    
    blocTest<SmoothIndicatorCubit, SmoothIndicatorState>(
      'should change [SmothIndicatorState] value',
      build: () => smoothIndicatorCubit,
      act: (cubit) => cubit.counter(1),
      expect: () => <SmoothIndicatorState>[SmoothIndicatorState(value: 1)],
    );
    blocTest<SmoothIndicatorCubit, SmoothIndicatorState>(
      'should change [SmothIndicatorState] value',
      build: () => smoothIndicatorCubit,
      act: (cubit) => cubit.counter(2),
      expect: () => <SmoothIndicatorState>[SmoothIndicatorState(value: 2)],
    );
    blocTest<SmoothIndicatorCubit, SmoothIndicatorState>(
      'should change [SmothIndicatorState] value',
      build: () => smoothIndicatorCubit,
      act: (cubit) => cubit.counter(3),
      expect: () => <SmoothIndicatorState>[SmoothIndicatorState(value: 3)],
    );

    blocTest<SmoothIndicatorCubit, SmoothIndicatorState>(
      'should change [SmothIndicatorState] value',
      build: () => smoothIndicatorCubit,
      act: (cubit) => cubit.counter(4),
      expect: () => <SmoothIndicatorState>[SmoothIndicatorState(value: 4)],
    );
  });
}
