import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

Widget buildSectionTitle(String title) {
  return Text(
    title,
    style: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget buildDescriptionText(String text) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 8.0),
      Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    ],
  );
}

Widget buildRichText(String text, String linkText, String link) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 8.0),
      RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: text,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
            TextSpan(
              text: linkText,
              style: const TextStyle(fontSize: 16, color: Colors.blue, decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()..onTap = () => _launchURL(link),
            ),
          ],
        ),
      ),
    ],
  );
}

Future<void> _launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}
