import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../theme/app_theme.dart';
import '../../../utils/context_extensions.dart';
import '../repositories/search_provider.dart';

class SearchWidget extends ConsumerWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: TextField(
        onChanged: (query){
          ref.read(searchTextControllerProvider.notifier).onTextChanged(query);
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          hintText: '${context.localize!.search}...',
          hintStyle: TextStyle(
            color: context.colorTheme.blackMirage,
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
            gapPadding: 0,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
            gapPadding: 0,
          ),
          icon: Icon(
            Icons.search_outlined,
            size: 14,
            color: context.colorTheme.blackMirage,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}