import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import 'colors.dart';

part 'app_color_theme.tailor.dart';

@tailorMixinComponent
class AppColorTheme extends ThemeExtension<AppColorTheme>
    with _$AppColorThemeTailorMixin {
  const AppColorTheme({
    this.blackMirage = ColorsConsts.blackMirage,
    this.whiteSoap = ColorsConsts.whiteSoap,
    this.orangePomegranade = ColorsConsts.orangePomegranade,
    this.greyPigeon = ColorsConsts.greyPigeon,
    this.greyLight = ColorsConsts.greyLight,
    this.blueAzure = ColorsConsts.blueAzure,
    this.toPwrGradient = ColorsConsts.toPwrGradient,
  });
  @override
  final Color blackMirage;
  @override
  final Color whiteSoap;
  @override
  final Color orangePomegranade;
  @override
  final Color greyPigeon;
  @override
  final Color greyLight;
  @override
  final Color blueAzure;
  @override
  final LinearGradient toPwrGradient;
}
