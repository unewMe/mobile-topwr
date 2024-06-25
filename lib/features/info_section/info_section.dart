import 'package:flutter/material.dart';
import '../../config/ui_config.dart';
import '../../theme/app_theme.dart';
import 'widgets/about_section.dart';
import 'widgets/dormitories_section.dart';
import 'widgets/library_section.dart';
import 'widgets/student_id_section.dart';
import 'widgets/parking_section.dart';
import 'widgets/cableway_section.dart';
import 'widgets/psychological_help_section.dart';
import 'logo_app_bar.dart';
import 'custom_search_bar.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> sections = [
      const AboutSection(),
      const DormitoriesSection(),
      const LibrarySection(),
      const StudentIdSection(),
      const ParkingSection(),
      const CablewaySection(),
      const PsychologicalHelpSection(),
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: LogoAppBar(context),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const CustomSearchBar(),
          const SizedBox(height: 16.0),
          ...sections,
        ],
      ),
    );
  }
}
