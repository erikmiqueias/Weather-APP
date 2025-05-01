import 'package:flutter/material.dart';

class WeatherSituation extends StatelessWidget {
  const WeatherSituation({
    super.key,
    required this.data,
    required this.icon,
    required this.title,
    required this.color,
  });
  final String data;
  final IconData icon;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 8,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Icon(icon, color: color),
            ),
            Text(title, style: const TextStyle(color: Colors.white)),
          ],
        ),
        Text(
          data,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
