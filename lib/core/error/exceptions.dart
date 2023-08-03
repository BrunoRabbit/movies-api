class ServerException implements Exception {}

class NoConnectionException implements Exception {
  NoConnectionException({
    this.error = "Sem conexão com a internet",
  });

  final String error;
}
