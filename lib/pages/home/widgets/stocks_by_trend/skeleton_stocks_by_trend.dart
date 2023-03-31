import 'package:flutter/material.dart';
import 'package:ml_invest_app/shared/utils/generate_widgets.dart';
import 'package:ml_invest_app/shared/widgets/ticker_stock/skeleton_ticker_stocker.dart';
import 'package:skeletons/skeletons.dart';

class SkeletonStocksByTrend extends StatelessWidget {
  const SkeletonStocksByTrend({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 500,
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10, left: 10),
            child: const SkeletonLine(
              style: SkeletonLineStyle(
                height: 15,
                width: 120,
              ),
            ),
          ),
          Container(
            // height: 60,
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Column(
              children: GenerateWidgets.getWidgets(2, () => _getStock()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getStock() => Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SkeletonAvatar(
            style: SkeletonAvatarStyle(
                shape: BoxShape.circle, height: 50, width: 40),
          ),
          const SkeletonTickerStocker(),
          const SkeletonLine(
            style: SkeletonLineStyle(
              height: 20,
              width: 130,
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: const [
                SkeletonLine(
                  style: SkeletonLineStyle(
                    height: 20,
                    width: 80,
                  ),
                )
              ],
            ),
          )
        ],
      );
}
