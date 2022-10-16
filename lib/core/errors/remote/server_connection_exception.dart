class ServerConnectionException implements Exception{
  ServerConnectionException({this.exceptionMessage});
  final String? exceptionMessage;
}