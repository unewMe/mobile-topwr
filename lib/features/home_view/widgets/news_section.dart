import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../api_base/directus_assets_url.dart';
import '../../../config/ui_config.dart';
import '../../../utils/context_extensions.dart';
import '../../../utils/where_non_null_iterable.dart';
import '../../../widgets/big_preview_card.dart';
import '../../../widgets/my_error_widget.dart';
import '../../../widgets/subsection_header.dart';
import '../../../config/nav_bar_config.dart';
import '../../navigator/navigator/nested_navigator.dart';
import '../../navigator/navigator/tab_bar_navigator.dart';
import '../repositories/infos_repository/infos_preview_repository.dart';
import 'loading_widgets/big_scrollable_section_loading.dart';
import 'paddings.dart';

class NewsSection extends ConsumerWidget {
  const NewsSection({super.key});
  static void goToInfoTab(WidgetRef ref) =>
      ref.read(navigatorProvider).changeTabBar(NavBarEnum.info);

  @override
  Widget build(BuildContext context, WidgetRef ref) => Column(
        children: [
          SubsectionHeader(
            title: context.localize.whats_up,
            onClick: () => goToInfoTab(ref),
          ),
          const _NewsList()
        ],
      );
}

class _NewsList extends ConsumerWidget {
  const _NewsList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(infosPreviewRepositoryProvider);
    return switch (state) {
      AsyncLoading() => const Padding(
          padding: EdgeInsets.only(
              left: HomeScreenConfig.paddingMedium,
              top: HomeScreenConfig.paddingMedium),
          child: BigScrollableSectionLoading(),
        ),
      AsyncError(:final error) => MyErrorWidget(error),
      AsyncValue(:final value) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: HomeScreenConfig.paddingSmall,
                  right: HomeScreenConfig.paddingSmall,
                  top: HomeScreenConfig.paddingMedium),
              child: SizedBox(
                  height: BigPreviewCardConfig.cardHeight,
                  child: _NewsDataList(value.whereNonNull.toList())),
            )
          ],
        )
    };
  }
}

class _NewsDataList extends StatelessWidget {
  const _NewsDataList(this.value);

  final List<InfosPreview> value;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        cacheExtent: 4,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: value.length,
        itemBuilder: (BuildContext context, int index) {
          return MediumLeftPadding(
            child: BigPreviewCard(
              title: value[index].title,
              shortDescription: value[index].content ?? "",
              photoUrl: value[index].cover?.filename_disk?.directusUrl,
              date: value[index].date_created,
              onClick: () {},
            ),
          );
        });
  }
}
