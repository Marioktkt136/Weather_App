import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather/weather_cubit.dart';
import 'package:weather_app/cubits/weather/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/widgets/success_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage(
                );
              }));
            },
            icon: const Icon(Icons.search),
          ),
        ],
        title: const Text('Weather App',style: TextStyle(fontWeight: FontWeight.bold),),
      ),

      body: BlocBuilder<WeatherCubit,WeatherState>(builder: (context, state) {
        if(state is WeatherLoading){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }else if(state is WeatherSuccess){
          weatherData = BlocProvider.of<WeatherCubit>(context).weatherModel;
         return SuccessBody(weatherData: weatherData);
        }
        else if(state is WeatherFailure){
         return const Center(child:  Text('SomeThing went wrong!! Please Try Again'),); 
        }
        else{
          return const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            );
        }
        }
      ),
  
    );
  }
}
