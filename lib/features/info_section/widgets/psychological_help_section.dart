import 'package:flutter/material.dart';

class PsychologicalHelpSection extends StatelessWidget {
  const PsychologicalHelpSection({super.key});

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
                    'Pomoc Psychologiczna',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text('Jeśli potrzebujesz pomocy, skontaktuj się z naszymi specjalistami.'),
                ],
              ),
            ),
            const SizedBox(width: 16.0),
            Image.asset(
              'assets/info_section/pomoc_psychologiczna_image.png',
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
