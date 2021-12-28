import 'package:delivery_food/General/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final ShapeBorder shapeBorder;
  EdgeInsetsGeometry? margin;
  ShimmerWidget.card({
    this.width,
    this.height,
    this.shapeBorder = const RoundedRectangleBorder(),
    this.margin,
  });
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[300]!,
      child: Container(
        margin: margin,
        decoration: ShapeDecoration(
          color: AppColors.whiteColor,
          shape: shapeBorder,
        ),
      ),
    );
  }

  static Widget categoryLoading() => StaggeredGridView.countBuilder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) => ShimmerWidget.card(
          margin: EdgeInsets.symmetric(
              horizontal: Defaults.defaultPadding,
              vertical: Defaults.defaultPadding / 2),
          shapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        staggeredTileBuilder: (int index) => new StaggeredTile.count(1, 0.6),
        mainAxisSpacing: 5,
      );
  static Widget offersNewLoading() => StaggeredGridView.countBuilder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) => ShimmerWidget.card(
          margin: EdgeInsets.symmetric(
              horizontal: Defaults.defaultPadding,
              vertical: Defaults.defaultPadding / 2),
          shapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        staggeredTileBuilder: (int index) => new StaggeredTile.count(1, 0.4),
        mainAxisSpacing: 5,
      );
  static Widget productsLoading() => StaggeredGridView.countBuilder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) => ShimmerWidget.card(
          margin: EdgeInsets.symmetric(
              horizontal: Defaults.defaultPadding,
              vertical: Defaults.defaultPadding / 2),
          shapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        staggeredTileBuilder: (int index) => new StaggeredTile.count(1, 1),
        mainAxisSpacing: 5,
      );
}
