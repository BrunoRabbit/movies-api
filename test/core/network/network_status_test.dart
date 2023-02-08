import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_api/core/network/network_status.dart';

import 'network_status_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NetworkStatusImpl>()])

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
