import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
// import 'package:weather_app/providers/weather_provider.dart';

import '../bloc/weather_bloc/weather_bloc.dart';
import '../bloc/weather_bloc/weather_state.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<WeatherCubit>(context);

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage(
                      // updateUi: () {
                      //   //TODO
                      // },
                      );
                }));
              },
              icon: const Icon(Icons.search),
            ),
          ],
          title: const Text('Weather App'),
        ),
        body: BlocBuilder<WeatherCubit, weatherState>(
          builder: (context, state) {
            if (state is weatherLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is weatherSuccess) {
              return SuccessWidget(weatherData: state.weatherModel);
            } else if (state is weatherfailure) {
              return Center(
                child: Text('Something went wrong '),
              );
            } else {
              return DefualteBody();
            }
          },
        )
        // body: Provider.of<WeatherProvider>(context).weatherData == null
        //     ? Center(
        //         child: Column(
        //           mainAxisSize: MainAxisSize.min,
        //           children: [
        //             Text(
        //               'there is no weather 😔 start',
        //               style: TextStyle(
        //                 fontSize: 30,
        //               ),
        //             ),
        //             Text(
        //               'searching now 🔍',
        //               style: TextStyle(
        //                 fontSize: 30,
        //               ),
        //             )
        //           ],
        //         ),
        //       )
        //     : Container(
        //         decoration: BoxDecoration(
        //             gradient: LinearGradient(
        //           colors: [
        //             weatherData!.getThemeColor(),
        //             weatherData!.getThemeColor()[300]!,
        //             weatherData!.getThemeColor()[100]!,
        //           ],
        //           begin: Alignment.topCenter,
        //           end: Alignment.bottomCenter,
        //         )),
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             const Spacer(
        //               flex: 3,
        //             ),
        //             Text(
        //               Provider.of<WeatherProvider>(context).cityName!,
        //               style: TextStyle(
        //                 fontSize: 32,
        //                 fontWeight: FontWeight.bold,
        //               ),
        //             ),
        //             Text(
        //               'updated at : ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
        //               style: TextStyle(
        //                 fontSize: 22,
        //               ),
        //             ),
        //             Spacer(),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //               children: [
        //                 Image.asset(weatherData!.getImage()),
        //                 Text(
        //                   weatherData!.temp.toInt().toString(),
        //                   style: TextStyle(
        //                     fontSize: 32,
        //                     fontWeight: FontWeight.bold,
        //                   ),
        //                 ),
        //                 Column(
        //                   children: [
        //                     Text('maxTemp :${weatherData!.maxTemp.toInt()}'),
        //                     Text('minTemp : ${weatherData!.minTemp.toInt()}'),
        //                   ],
        //                 ),
        //               ],
        //             ),
        //             Spacer(),
        //             Text(
        //               weatherData!.weatherStateName,
        //               style: TextStyle(
        //                 fontSize: 32,
        //                 fontWeight: FontWeight.bold,
        //               ),
        //             ),
        //             Spacer(
        //               flex: 5,
        //             ),
        //           ],
        //         ),
        //       ),

        );
  }
}

class DefualteBody extends StatelessWidget {
  const DefualteBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({
    Key? key,
    required this.weatherData,
  }) : super(key: key);

  final WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<WeatherCubit>(context);

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          weatherData!.getThemeColor(),
          weatherData!.getThemeColor()[300]!,
          weatherData!.getThemeColor()[100]!,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 3,
          ),
          Text(
            "${cubit.cityName!.toUpperCase()}",
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'updated at : ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(weatherData!.getImage()),
              Text(
                weatherData!.temp.toInt().toString(),
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Text('maxTemp :${weatherData!.maxTemp.toInt()}'),
                  Text('minTemp : ${weatherData!.minTemp.toInt()}'),
                ],
              ),
            ],
          ),
          const Spacer(),
          Text(
            weatherData!.weatherStateName,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }
}
