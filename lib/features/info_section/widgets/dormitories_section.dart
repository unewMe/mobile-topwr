import 'package:flutter/material.dart';
import '../details_pages/details_dormitories.dart';

class DormitoriesSection extends StatelessWidget {
  const DormitoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DetailsDormitories(),
          ),
        );
      },
      child: Card(
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
                      'Akademiki',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    Text('Sprawdź, jak możesz otrzymać miejsce w akademiku.'),
                  ],
                ),
              ),
              const SizedBox(width: 16.0),
              Image.asset(
                'assets/info_section/dormitories_image.png',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
