import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_slivers_example/extensions/extensions.dart';

class SliverPinnedHeader extends StatelessWidget {
  const SliverPinnedHeader({
    Key? key,
    required this.headerColor,
    required this.headerLabel,
  }) : super(key: key);
  final Color headerColor;
  final String headerLabel;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverPinnedHeaderDelegate(
        maxHeight: 60,
        minHeight: 60,
        builder: (context, shrinkOffset) {
          return Material(
            elevation: 8,
            child: Container(
              color: headerColor,
              padding: const EdgeInsets.only(left: 16.0),
              alignment: Alignment.centerLeft,
              child: Text(headerLabel)
                  .fontSize(18)
                  .fontWeight(FontWeight.w500)
                  .italics
                  .color(Colors.black),
            ),
          );
        },
      ),
    );
  }
}

typedef SliverPinnedHeaderDelegateBuilder = Widget Function(
    BuildContext context, double shrinkOffset);

class _SliverPinnedHeaderDelegate extends SliverPersistentHeaderDelegate {
  _SliverPinnedHeaderDelegate({
    required this.maxHeight,
    required this.minHeight,
    required this.builder,
  });

  final double maxHeight;
  final double minHeight;
  final SliverPinnedHeaderDelegateBuilder builder;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: builder(context, shrinkOffset));
  }

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _SliverPinnedHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxExtent ||
        minHeight != oldDelegate.minExtent ||
        builder != oldDelegate.builder;
  }
}
