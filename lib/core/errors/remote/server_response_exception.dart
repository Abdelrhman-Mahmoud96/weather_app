class ServerResponseException implements Exception{
  ServerResponseException({this.exceptionMessage});
  final String? exceptionMessage;
}