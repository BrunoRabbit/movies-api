import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/core/network/network_status.dart';

import 'network_status_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NetworkStatus>()])
void main() {
  test('should check if has internet', () async {
    final networkStatus = MockNetworkStatus();

    when(networkStatus.isConnected).thenAnswer((_) => Future.value(true));

    final result = await networkStatus.isConnected;

    verify(await networkStatus.isConnected).called(1);
    verifyNoMoreInteractions(networkStatus);

    expect(result, true);
  });
  test('should check if not has internet', () async {
    final networkStatus = MockNetworkStatus();

    when(networkStatus.isConnected).thenAnswer((_) => Future.value(false));

    final result = await networkStatus.isConnected;

    verify(await networkStatus.isConnected).called(1);
    verifyNoMoreInteractions(networkStatus);

    expect(result, false);
  });
}
