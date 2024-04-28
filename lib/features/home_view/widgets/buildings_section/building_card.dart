import 'package:flutter/material.dart';

import '../../../../theme/app_theme.dart';
import '../../../../theme/hex_color.dart';
import '../../../../widgets/my_cached_image.dart';
import '../../../../widgets/tile_splash.dart';

class BuildingCard extends StatelessWidget {
  const BuildingCard({
    super.key,
    required this.onTap,
    required this.buildingName,
    this.imageUrl,
  });

  final VoidCallback onTap;
  final String buildingName;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            MyCachedImage(imageUrl),
            if (imageUrl != null)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: context.colorTheme.buildingsGradient,
                  ),
                ),
              ),
            Container(
              margin: const EdgeInsets.only(left: 16, top: 84),
              child: Text(buildingName,
                  style: context.textTheme.headlineWhite.copyWith(shadows: [
                    const Shadow(
                      color: HexColor.consts(0x6621334D66),
                      blurRadius: 4.0,
                      offset: Offset(0.0, 2.0),
                    ),
                  ])),
            ),
            TileSplash(onTap: onTap),
          ],
        ),
      ),
    );
  }
}