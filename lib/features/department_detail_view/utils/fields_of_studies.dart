import "package:fast_immutable_collections/fast_immutable_collections.dart";

import "../widgets/fields_of_study_section.dart";

extension WhereTypesX on IList<FieldOfStudy> {
  Iterable<FieldOfStudy> get whereFirstDegree {
    return where((item) => !item.is2ndDegree && !item.isLongCycleStudies);
  }

  Iterable<FieldOfStudy> get whereSecondDegree {
    return where((item) => item.is2ndDegree && !item.isLongCycleStudies);
  }

  Iterable<FieldOfStudy> get whereLongCycle {
    return where((item) => item.isLongCycleStudies);
  }
}
