import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../../api_base/directus_assets_url.dart";
import "../../config/ui_config.dart";
import "../../theme/app_theme.dart";
import "../../utils/context_extensions.dart";
import "../../utils/determine_contact_icon.dart";
import "../../utils/where_non_null_iterable.dart";
import "../../widgets/detail_views/contact_section.dart";
import "../../widgets/detail_views/detail_view_app_bar.dart";
import "../../widgets/detail_views/sliver_header_section.dart";
import "../../widgets/loading_widgets/contact_section_loading.dart";
import "../../widgets/loading_widgets/header_section_loading.dart";
import "../../widgets/loading_widgets/shimmer_loading.dart";
import "../../widgets/my_error_widget.dart";
import "repository/science_club_details_repository.dart";
import "widgets/about_us_section.dart";
import "widgets/about_us_section_loading.dart";

@RoutePage()
class ScienceClubDetailView extends StatelessWidget {
  const ScienceClubDetailView({
    @PathParam("id") required this.id,
    super.key,
  });
  final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailViewAppBar(context, title: context.localize.study_circles),
      body: _SciClubDetailDataView(id),
    );
  }
}

class _SciClubDetailDataView extends ConsumerWidget {
  const _SciClubDetailDataView(this.id);
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(scienceClubDetailsRepositoryProvider(id));
    return switch (state) {
      AsyncLoading() => const _SciClubDetailViewLoading(),
      AsyncError(:final error) => MyErrorWidget(error),
      AsyncValue(:final value) => CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: SliverHeaderSection(
                logoImageUrl: value?.logo?.filename_disk?.directusUrl,
                backgroundImageUrl: value?.cover?.filename_disk?.directusUrl,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    value?.name ?? "",
                    style: context.textTheme.headline,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  value?.department?.name ?? "",
                  style: context.textTheme.body,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: DetailViewsConfig.spacerHeight),
                ContactSection(
                  title: context.localize.contact,
                  list: value?.links.whereNonNull
                          .map(
                            (a) => ContactIconsModel(
                              text: a.name,
                              url: a.link,
                            ),
                          )
                          .toList() ??
                      List.empty(),
                ),
                const SizedBox(height: DetailViewsConfig.spacerHeight),
                AboutUsSection(
                  text: value?.description ?? "",
                ),
              ]),
            ),
          ],
        ),
    };
  }
}

class _SciClubDetailViewLoading extends StatelessWidget {
  const _SciClubDetailViewLoading();

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      linearGradient: shimmerGradient,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HeaderSectionLoading(),
          SizedBox(height: DetailViewsConfig.spacerHeight),
          ContactSectionLoading(),
          SizedBox(height: DetailViewsConfig.spacerHeight),
          AboutUsSectionLoading(),
        ],
      ),
    );
  }
}
