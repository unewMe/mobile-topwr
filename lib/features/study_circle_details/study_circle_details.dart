import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config.dart';
import '../../theme/app_theme.dart';
import '../../utils/context_extensions.dart';
import '../../widgets/loading_widgets/shimmer_loading.dart';
import '../../widgets/my_error_widget.dart';
import 'models/contact_section_data.dart';
import 'repository/study_circle_repository.dart';
import 'widgets/details_screen_about_us_section.dart';
import 'widgets/details_screen_app_bar.dart';
import 'widgets/details_screen_contact_section.dart';
import 'widgets/details_screen_sliver_header_section.dart';
import 'widgets/loading_widgets/about_us_section_loading.dart';
import 'widgets/loading_widgets/contact_section_loading.dart';
import 'widgets/loading_widgets/header_section_loading.dart';

class StudyCircleDetails extends StatelessWidget {
  const StudyCircleDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            DetailsScreenAppBar(context, title: context.localize.study_circles),
        body: const _CircleDetailsDataView());
  }
}

class _CircleDetailsDataView extends ConsumerWidget {
  const _CircleDetailsDataView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemId = ModalRoute.of(context)?.settings.arguments as String;
    final state = ref.watch(studyCircleRepositoryProvider(itemId));
    return switch (state) {
      AsyncLoading() => const _StudyCircleDetailsLoading(),
      AsyncError(:final error) => MyErrorWidget(error),
      AsyncValue(:final value) => CustomScrollView(slivers: [
          SliverPersistentHeader(
              delegate: SliverHeaderSection(
            logoImageUrl: value?.photo?.url,
            backgroundImageUrl: value?.backgroundPhoto?.url,
          )),
          SliverList(
            delegate: SliverChildListDelegate([
              Text(
                value?.name ?? '',
                style: context.textTheme.headline,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
              const SizedBox(height: 12),
              Text(
                value?.department?.name ?? '',
                style: context.textTheme.body,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: DetailsScreenConfig.spacerHeight),
              ContactSection(
                list: value?.infoSection
                        ?.expand((e) => e?.info ?? [])
                        .map((a) => ContactSectionData(
                              iconUrl: a?.icon?.url,
                              text: a?.visibleText,
                              url: a?.value,
                              type: a?.type,
                            ))
                        .toList() ??
                    List.empty(),
              ),
              const SizedBox(height: DetailsScreenConfig.spacerHeight),
              AboutUsSection(
                text: value?.description ?? '',
              )
            ]),
          ),
        ]),
    };
  }
}

class _StudyCircleDetailsLoading extends StatelessWidget {
  const _StudyCircleDetailsLoading();

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      linearGradient: shimmerGradient,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HeaderSectionLoading(),
          SizedBox(height: DetailsScreenConfig.spacerHeight),
          ContactSectionLoading(),
          SizedBox(height: DetailsScreenConfig.spacerHeight),
          AboutUsSectionLoading()
        ],
      ),
    );
  }
}