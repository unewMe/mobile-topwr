import 'package:flutter/material.dart';

class LibrarySection extends StatelessWidget {
  const LibrarySection({super.key});

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
                    'Biblioteka',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text('Dowiedz się, jak utworzyć internetowe konto biblioteczne.'),
                ],
              ),
            ),
            const SizedBox(width: 16.0),
            Image.asset(
              'assets/images/biblioteka_image.png',
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
