import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/widgets/city_weather.dart';
import 'package:weather_app/models/clouds_icon.dart' as weatherIcons;
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> weatherResponse = {};
  TextEditingController cityName = TextEditingController();
  String apiKey = '';

  Future<void> _getApiKey() async {
    await dotenv.load(fileName: '.env');
    final apiKey = dotenv.env['API_KEY'];

    setState(() {
      this.apiKey = apiKey!;
    });
  }

  int kelvinToCelsius(double kelvin) {
    double celsius = kelvin - 273.15;
    return celsius.ceil();
  }

  void clearTextField() {
    FocusScope.of(context).unfocus();
    setState(() {
      cityName.clear();
    });
  }

  Future<void> getWeatherData() async {
    try {
      await _getApiKey();
      final response = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=${Uri.encodeComponent(cityName.text)}&appid=$apiKey&lang=pt',
        ),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          weatherResponse = data;
        });
        print(weatherResponse);
        clearTextField();
      } else {
        setState(() {
          weatherResponse = {};
        });
      }
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  @override
  void dispose() {
    super.dispose();
    cityName.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 15),
          child: Column(
            spacing: 30,
            children: [
              TextField(
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                controller: cityName,
                onSubmitted: (_) => getWeatherData(),
                decoration: InputDecoration(
                  hintText: 'Digite a cidade',
                  suffixIcon: GestureDetector(
                    onTap: getWeatherData,
                    child: const Icon(Icons.search),
                  ),
                  hintStyle: const TextStyle(color: Colors.white),
                  suffixIconColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(55, 117, 117, 117),
                ),
              ),
              SizedBox(
                child: Column(
                  spacing: 15,
                  children: [
                    weatherResponse.isNotEmpty
                        ? CityWeather(
                          title:
                              '${weatherResponse['name']}, ${weatherResponse['sys']['country']}',
                          temperature:
                              '${kelvinToCelsius(weatherResponse['main']['temp'])}°',
                          weatherIcon:
                              weatherIcons
                                  .weatherIcons[weatherResponse['weather'][0]['main']]!,
                          humidity: '${weatherResponse['main']['humidity']}%',
                          minMaxTemperature:
                              '${kelvinToCelsius(weatherResponse['main']['temp_min'])}°/${kelvinToCelsius(weatherResponse['main']['temp_max'])}°',
                          description:
                              '${weatherResponse['weather'][0]['description']}',
                        )
                        : const Text(
                          'Nenhuma cidade encontrada',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
