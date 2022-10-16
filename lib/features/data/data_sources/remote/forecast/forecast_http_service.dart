import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:weather_app_task/core/errors/remote/server_connection_exception.dart';
import 'package:weather_app_task/core/errors/remote/server_response_exception.dart';
import 'package:weather_app_task/features/data/data_sources/remote/constants.dart';

class ForecastHttpService {
  Future<http.Response> sendRequest(
      String locationId, String forecastPath) async {
    final url = Uri.https(
      kBaseURL,
      forecastPath + locationId,
      {
        'apikey': kApiKey,
        'details': 'true',
        'metric': 'true',
      },
    );

    try {
      final response = await http.get(url);
      if (response.statusCode != 200) {
        throw ServerResponseException(
            exceptionMessage:
                'REQUEST FAILED WITH STATUS ${response.statusCode}');
      }
      return response;
    } on SocketException catch (_) {
      throw ServerConnectionException(
          exceptionMessage:
              'CONNECTING TO THE SERVER HAS FAILED, CHECK YOUR INTERNET CONNECTION');
    }
  }
}
