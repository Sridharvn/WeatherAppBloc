part of 'weather_bloc.dart';

// @immutable
// abstract class WeatherEvent {}
sealed class WeatherEvent extends Equatable {
  const WeatherEvent();
  @override
  List<Object> get props => [];
}

class FetchWeather extends WeatherEvent {
  final Position position;

  FetchWeather(this.position);
  @override
  List<Object> get props => [position];
}
