import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../config.dart';
import '../navigator/utils/selected_tab_observer.dart';
import 'nav_bar_config.dart';

part 'bottom_nav_bar_controller.g.dart';

@Riverpod(keepAlive: true)
class BottomNavBarController extends _$BottomNavBarController {
  late final SelectedTabObserver selectedTabObserver =
      SelectedTabObserver(_onTabChanged);

  @override
  NavBarEnum build() {
    return MyAppConfig.initialTab;
  }

  void _onTabChanged(NavBarEnum tab) {
    if (state != tab) {
      state = tab;
    }
  }
}
