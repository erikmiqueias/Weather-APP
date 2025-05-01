import 'package:flutter/material.dart';
import 'package:weather_app/widgets/card_info.dart';

class WeatherCityInfo extends StatelessWidget {
  const WeatherCityInfo({
    super.key,
    required this.title,
    required this.weatherIcon,
    required this.humidity,
    required this.minMaxTemperature,
    required this.temperature,
    required this.description,
  });
  final String title;
  final String weatherIcon;
  final String humidity;
  final String minMaxTemperature;
  final String temperature;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 35, 70, 145),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        leading: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 17, 35, 73),
              Color.fromARGB(255, 7, 15, 31),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              CardInfo(
                title: title,
                weatherIcon: weatherIcon,
                temperature: temperature,
                humidity: humidity,
                minMaxTemperature: minMaxTemperature,
                description: description,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
