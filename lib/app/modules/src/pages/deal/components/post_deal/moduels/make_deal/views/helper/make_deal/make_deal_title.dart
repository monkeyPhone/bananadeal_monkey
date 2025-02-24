import 'package:flutter/material.dart';

import 'make_deal_title_main.dart';

class MakeDealTitle extends StatelessWidget {
  final int page;
  const MakeDealTitle({
    required this.page,
    super.key});

  @override
  Widget build(BuildContext context) {
    return page <= 9
        ? MakeDealTitleMain(page: page,)
        : const SizedBox();
  }
}
