import 'package:flutter/material.dart';
import 'package:weather_app/pages/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 17, 35, 73),
            Color.fromARGB(255, 7, 15, 31),
          ],
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              spacing: 45,
              children: [
                const Text(
                  'Climapp',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
                Image.asset('assets/images/weather_icon.png', width: 250),
                const Text(
                  'Boas-vindas!',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                  label: const Text(
                    'Entrar',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  icon: const Icon(Icons.arrow_forward),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 51, 31, 105),
                    foregroundColor: Colors.white,
                    side: const BorderSide(width: 0),
                    iconSize: 20,
                    iconAlignment: IconAlignment.end,
                    minimumSize: const Size(200, 50),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
