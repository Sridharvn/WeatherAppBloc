import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_bloc/bloc/weather_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300:
        return Image.asset("assets/1.png");
      case >= 300 && < 400:
        return Image.asset("assets/2.png");
      case >= 400 && < 500:
        return Image.asset("assets/2.png");
      case >= 500 && < 600:
        return Image.asset("assets/3.png");
      case >= 600 && < 700:
        return Image.asset("assets/4.png");
      case >= 700 && < 800:
        return Image.asset("assets/5.png");
      case == 800:
        return Image.asset("assets/6.png");
      case > 800 && <= 804:
        return Image.asset("assets/7.png");
      default:
        return Image.asset("assets/7.png");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            Align(
              alignment: const AlignmentDirectional(15, -0.3),
              child: Container(
                height: 300,
                width: 300,
                decoration: const BoxDecoration(
                    color: Colors.deepPurple, shape: BoxShape.circle),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-15, -0.3),
              child: Container(
                height: 300,
                width: 300,
                decoration: const BoxDecoration(
                    color: Colors.deepPurple, shape: BoxShape.circle),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0, -1.2),
              child: Container(
                height: 300,
                width: 300,
                decoration: const BoxDecoration(
                    color: Colors.orange, shape: BoxShape.rectangle),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 100, sigmaX: 100),
              child: Container(
                decoration: const BoxDecoration(color: Colors.transparent),
              ),
            ),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                // print(state);
                if (state is WeatherSuccess) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${state.weather.areaName}",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Good Morning",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        getWeatherIcon(state.weather.weatherConditionCode!),
                        Center(
                          child: Text(
                            "${state.weather.temperature?.celsius?.round()} Degree C",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            state.weather.weatherMain!.toUpperCase(),
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Center(
                          child: Text(
                            DateFormat('EEEE dd -')
                                .add_jm()
                                .format(state.weather.date!),
                            // "Friday, 2 February 2020 - 7:43PM",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/11.png",
                                  scale: 8,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Sunrise",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      DateFormat('')
                                          .add_jm()
                                          .format(state.weather.sunrise!),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/12.png",
                                  scale: 8,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Sunset",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      DateFormat('')
                                          .add_jm()
                                          .format(state.weather.sunset!),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Divider(
                            color: Colors.grey,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/13.png",
                                  scale: 8,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Temp Max",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "${state.weather.tempMax?.celsius?.round().toString()} Degree C",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/14.png",
                                  scale: 8,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Temp Min",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "${state.weather.tempMin?.celsius?.round().toString()} Degree C",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container(
                    child: Text("You Failed Miserably"),
                  );
                }
              },
            )
          ]),
        ),
      ),
    );
  }
}
