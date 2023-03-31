import 'package:flutter/material.dart';

class FeatureBox extends StatelessWidget {
  const FeatureBox({
    super.key,
    required this.colour,
    required this.headerText,
    required this.discriptionText,
  });

  final Color colour;
  final String headerText;
  final String discriptionText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Text(
            headerText,
            style: TextStyle(
              fontFamily: 'Cera Pro',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            discriptionText,
            style: TextStyle(
              fontFamily: 'Cera Pro',
            ),
          ),
        ],
      ),
    );
  }
}
