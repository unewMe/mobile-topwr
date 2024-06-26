import 'package:flutter/foundation.dart';

import '../../../../../utils/determine_icon.dart';

@immutable
class MemberData {
  final List<String> socialLinks;
  final String? name;
  final String? subtitle;
  final List<UrlIconsModel> links;
  final String? imageUrl;

  MemberData({
    required this.socialLinks,
    required this.name,
    required this.subtitle,
    required this.imageUrl,
  }) : links = _determineLinksIcons(socialLinks);

  static List<UrlIconsModel> _determineLinksIcons(List<String> urls) {
    return urls.map((url) => UrlIconsModel(url: url)).toList();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MemberData &&
        listEquals(other.socialLinks, socialLinks) &&
        other.name == name &&
        other.subtitle == subtitle &&
        listEquals(other.links, links) &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode =>
      socialLinks.hashCode ^
      name.hashCode ^
      subtitle.hashCode ^
      links.hashCode ^
      imageUrl.hashCode;
}
