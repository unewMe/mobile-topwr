import 'package:flutter/material.dart';

class ParkingSection extends StatelessWidget {
  const ParkingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Parking',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text('Zobacz, jak działa internetowy system parkingu PWR.'),
                ],
              ),
            ),
            const SizedBox(width: 16.0),
            Image.asset(
              'assets/images/parking_image.png',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
