import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart'; // Import for TapGestureRecognizer
import 'package:url_launcher/url_launcher.dart';
import '../utils/utils.dart'; // Import utils functions

class DetailsDormitories extends StatelessWidget {
  const DetailsDormitories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Przewodnik',
          style: TextStyle(color: Colors.red),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.red),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/info_section/akademiki_image.png',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Domy Studenckie dla każdego!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Politechnika Wrocławska dysponuje 2864 miejscami w 9 domach studenckich, zlokalizowanych w czterech punktach na terenie miasta.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            buildDescriptionText(
              'Najwięcej miejsc znajduje się w najnowszych domach studenckich położonych nad Odrą. Są to akademiki T-16 do T-19. Tworzą one nad wodą teren rekreacyjny osiedle (miasteczko studenckie) potocznie nazywane Wittigowo.',
            ),
            buildDescriptionText(
              'Domy T-2 i T-3 to budynki z lat 50. nazywane potocznie Telemi ki Straszny Dwór. Ich ogromną zaletą są duże pokoje i bliskość do głównego kampusu Politechniki Wrocławskiej.',
            ),
            buildDescriptionText(
              'Przy ul. Górnickiego i Reja znajdują się domy T-4 oraz T-6 potocznie nazywane Czworak i Alcatraz. Domy te najczęściej są wybierane przez studentów wydziału Architektury, ponieważ znajdują się najbliżej kampusu tego wydziału.',
            ),
            buildDescriptionText(
              'Domy studenckie znajdują się także w miejscowościach gdzie stacjonują filie naszej uczelni. W Jeleniej Górze jest 90 miejsc, w tym 39 w Cieplicach, w Legnicy występuje 39 miejsc, a w Wałbrzychu 92 miejsc.',
            ),
            const SizedBox(height: 16.0),
            buildSectionTitle('Kto może pierwszy otrzymać pokój?'),
            buildDescriptionText(
              'Pierwszeństwo w otrzymaniu pokoju mają osoby, którym codzienny dojazd do uczelni sprawił by trudności w studiowaniu. W skrócie rzecz ujmując, zamieszkują daleko od uczelni. We wniosku o miejsce w akademiku trzeba podać nazwę miejsca zamieszkania, a także odległość w kilometrach od uczelni.',
            ),
            buildDescriptionText(
              'Osoby z problemami materialnymi także posiadają prawo pierwszeństwa w otrzymaniu miejsca w akademiku. We wniosku jest obowiązek średni miesięcznych dochodów netto na osobę w rodzinie, i na tej podstawie jest określana sytuacja materialna studenta. Dodatkowo brane są pod uwagę stypendia socjalne.',
            ),
            const SizedBox(height: 16.0),
            buildSectionTitle('Okres wynajmowania pokoju'),
            buildRichText(
              'Miejsce w domu studenckim jest przyznawane studentowi od momentu rozpoczęcia studiów aż do zakończenia sesji letniej w danym roku. Wszelkie odchylenia od tej reguły są zawarte w ',
              'regulaminie domów studenckich.',
              'https://samorzad.pwr.edu.pl/fcp/8GBUKOQtTKlQhbx08SlKTgJYQX2oBAoHNiwFEtVZDyEPCg1gBVcoFW8SBDBRKTtMKRYdEwA8MRAQwQNFXCVFJRxYrGVASBxkFOVBHCgIbCxQeBB/56/public/pomoc_materialna/akademiki/zasady-zamieszkiwania-w-domach-studenckich.pdf',
            ),
            const SizedBox(height: 16.0),
            buildSectionTitle('Jak otrzymać miejsce w domach studenckich?'),
            buildRichText(
              'Musisz złożyć wniosek o miejsce w domu studenckim za pośrednictwem systemu ',
              'EDUKACJA CL.',
              'https://prs.pwr.edu.pl/529',
            ),
            buildDescriptionText(
              'Terminy składania wniosków są ustalane przez Dział Domów Studenckich. Daty te są zawsze ogłaszane na stronie internetowej.',
            ),
            buildDescriptionText(
              'Po wypełnieniu wniosku i jego przesłaniu czekasz na decyzję. Jeśli wniosek nie otrzyma zgody możesz złożyć kolejny wniosek z odwołaniem decyzji. Jest to szansa na uargumentowanie dlaczego powinieneś otrzymać miejsce w domu studenckim.',
            ),
            const SizedBox(height: 16.0),
            buildRichText(
              'Więcej informacji oraz wzory dokumentów znajdują się na stronie ',
              'Działu Domów Studenckich.',
              'https://samorzad.pwr.edu.pl/dla-studenta/akademiki-pwr',
            ),
            buildRichText(
              'Odpowiedzi na najpopularniejsze pytania związane z domami studenckimi znajdziecie ',
              'tutaj.',
              'https://samorzad.pwr.edu.pl/studenci/praktyczne-informacje/domy-studenckie-pwr-520',
            ),
            buildRichText(
              'Warto zapoznać się też z dokumentami udostępnionymi przez Samorząd Politechniki Wrocławskiej na ich stronie internetowej.',
              'https://samorzad.pwr.edu.pl/dla-studenta/akademiki-pwr',
            ),
          ],
        ),
      ),
    );
  }
}
