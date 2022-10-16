import 'package:weather_app_task/core/errors/local/failure.dart';

class SharedPreferenceFailure extends Failure {
  SharedPreferenceFailure({this.sharedPreferenceMessage});

  final String? sharedPreferenceMessage;

  @override
  String? get message => sharedPreferenceMessage;
}
