import 'package:flutter/material.dart';

class CablewaySection extends StatelessWidget {
  const CablewaySection({super.key});

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
                    'Polinka',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text('Podziwiaj Wrocław z góry koszystając z Polinki PWR.'),
                ],
              ),
            ),
            const SizedBox(width: 16.0),
            Image.asset(
              'assets/images/polinka_image.png',
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
