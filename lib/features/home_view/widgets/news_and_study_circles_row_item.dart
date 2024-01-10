import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';
import '../../../utils/context_extensions.dart';


class ScrollableRowItem extends StatelessWidget {
  const ScrollableRowItem({
    super.key,
    required this.title,
    required this.id,
    required this.shortDescription,
    required this.photoUrl,
    this.date = "",
    required this.onClick,
  });

  final String title;
  final String id;
  final String shortDescription;
  final String photoUrl;
  final String date;
  final Function(String val) onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: context.colorTheme.greyLight,
          borderRadius: BorderRadius.circular(8)),
      width: 240,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(photoUrl)),
                ),
                child: Visibility(
                  visible: date.isNotEmpty,
                  child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: context.colorTheme.blackMirage,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          date,
                          style: context.textTheme.bodyWhite,
                        ),
                      )),
                )),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    title,
                    style: context.textTheme.title,
                  ),
                  Text(
                    shortDescription,
                    maxLines: 5,
                    style: context.textTheme.body,
                    overflow: TextOverflow.ellipsis,
                  ),
                  MaterialButton(
                    padding: const EdgeInsets.all(8),
                    onPressed: onClick(id),
                    color: context.colorTheme.orangePomegranade,
                    textColor: context.colorTheme.whiteSoap,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    child: Text(context.localize!.read_more),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}