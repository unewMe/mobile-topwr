import 'package:flutter/material.dart';

import '../../../config.dart';
import '../../../shared_repositories/departments_repository/departments_extra_params_ext.dart';
import '../../../shared_repositories/departments_repository/departments_repository.dart';
import '../../../widgets/my_cached_image.dart';
import '../../../widgets/wide_tile_card.dart';

class DepartmentCard extends StatelessWidget {
  final Department department;
  const DepartmentCard(this.department, {super.key});

  @override
  Widget build(BuildContext context) {
    return WideTileCard(
      isActive: true,
      title: department.code,
      subtitle: department.name,
      activeShadows: null,
      activeGradient: department.gradient,
      trailing: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: SizedBox.square(
          dimension: WideTileCardConfig.imageSize,
          child: Opacity(
            opacity: .5,
            child: MyCachedImage(
              department.logo?.url,
              boxFit: BoxFit.contain,
              noShimmeringLoading: true,
            ),
          ),
        ),
      ),
    );
  }
}