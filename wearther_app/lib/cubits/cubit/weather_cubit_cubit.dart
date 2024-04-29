import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'weather_cubit_state.dart';

class WeatherCubitCubit extends Cubit<WeatherCubitState> {
  WeatherCubitCubit() : super(WeatherCubitLoading());

  

}
