import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '.network_generator.mocks.dart';

void main() {
  test('should check the call DataConnectionChecker', () async {
    final networkStatusImpl = MockNetworkStatusImpl();

    when(networkStatusImpl.isConnected).thenAnswer((_) async => true);

    final result = await networkStatusImpl.isConnected;

    verify(networkStatusImpl.isConnected).called(1);
    verifyNoMoreInteractions(networkStatusImpl);

    expect(result, true);
  });
}
