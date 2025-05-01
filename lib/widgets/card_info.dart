import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/widgets/weather_situation.dart';
import '../extensions/string_extensions.dart';
import '../extensions/datetime_extension.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({
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
    final date = DateTime.now().toFormattedDate();

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Text('Hoje: $date', style: TextStyle(color: Colors.white)),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 85,
                    height: 85,
                    child: SvgPicture.asset(weatherIcon),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    temperature,
                    style: const TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    description.capitalizeEachWord(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Column(
                    spacing: 7,
                    children: [
                      WeatherSituation(
                        title: 'Umidade:',
                        data: humidity,
                        icon: Icons.water_drop,
                        color: Colors.blue,
                      ),
                      WeatherSituation(
                        data: minMaxTemperature,
                        icon: Icons.thermostat,
                        title: title,
                        color: Colors.deepOrange.shade600,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
