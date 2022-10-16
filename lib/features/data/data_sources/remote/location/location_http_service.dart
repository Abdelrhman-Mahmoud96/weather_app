import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:weather_app_task/core/errors/remote/server_connection_exception.dart';
import 'package:weather_app_task/core/errors/remote/server_response_exception.dart';
import 'package:weather_app_task/features/data/data_sources/remote/constants.dart';


class LocationHttpService {
  Future<http.Response> sendRequest(String locationName) async {
    final url = Uri.https(
      kBaseURL,
      kLocationSearchPath,
      {
        'apikey': kApiKey,
        'q': locationName,
        'offset': kSearchOffset,
      },
    );

    try {
      final response = await http.get(url).timeout(const Duration(seconds: 5));
      if (response.statusCode != 200) {
        throw ServerResponseException(
            exceptionMessage:
                'REQUEST FAILED WITH STATUS ${response.statusCode}');
      }
      return response;
    } 
    // we will keep it like that until we use connectivity to properly checking connection.
    on SocketException catch (_) {
      throw ServerConnectionException(
          exceptionMessage:
              'CONNECTING TO THE SERVER HAS FAILED, CHECK YOUR INTERNET CONNECTION');
    }
  }
}
