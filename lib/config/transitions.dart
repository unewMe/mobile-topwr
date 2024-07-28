import "package:auto_route/auto_route.dart";

// TODO(simon-the-shark): adjust this settings if desired
abstract class TransitionsConfig {
  static const durationInMiliseconds = 200;
  static const detailDurationInMiliseconds = 200;
  static const slideLeftBuilder = TransitionsBuilders.slideLeftWithFade;
  static const slideRightBuilder = TransitionsBuilders.slideRightWithFade;
  static const fallbackBuilder = TransitionsBuilders.fadeIn;
  static const detailViewBuilder = TransitionsBuilders.slideBottom;
}
