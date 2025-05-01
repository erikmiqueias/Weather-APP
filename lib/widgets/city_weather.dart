import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/pages/weather_city_info.dart';

class CityWeather extends StatelessWidget {
  const CityWeather({
    super.key,
    required this.title,
    required this.weatherIcon,
    required this.temperature,
    required this.humidity,
    required this.minMaxTemperature,
    required this.description,
  });
  final String title;
  final String weatherIcon;
  final String temperature;
  final String humidity;
  final String minMaxTemperature;
  final String description;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => WeatherCityInfo(
                  title: title,
                  temperature: temperature,
                  weatherIcon: weatherIcon,
                  humidity: humidity,
                  minMaxTemperature: minMaxTemperature,
                  description: description,
                ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(54, 117, 117, 117),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 35,
              height: 35,
              child: SvgPicture.asset(weatherIcon),
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 15,
              ),
            ),
            Text(
              temperature,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
