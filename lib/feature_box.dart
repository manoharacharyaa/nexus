import 'package:flutter/material.dart';

class FeatureBox extends StatelessWidget {
  const FeatureBox({
    super.key,
    required this.headerText,
    required this.discriptionText,
  });

  final String headerText;
  final String discriptionText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.bottomRight,
          colors: [Color(0XFF8E2DE2), Color(0XFF4A00E0)],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10)
            .copyWith(left: 15, right: 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                headerText,
                style: TextStyle(
                  fontFamily: 'Cera Pro',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
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
      ),
    );
  }
}
