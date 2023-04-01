import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ml_invest_app/shared/models/stock_model.dart';
import 'package:ml_invest_app/shared/models/trend_stock_enum.dart';
import 'package:ml_invest_app/shared/utils/number_util.dart';
import 'package:ml_invest_app/shared/utils/routes.dart';
import 'package:ml_invest_app/shared/utils/widget_util.dart';
import 'package:ml_invest_app/shared/widgets/ticker_stock/ticker_stock.dart';

class StocksByTrend extends StatelessWidget {
  const StocksByTrend({super.key, required this.type, required this.stocks});
  final TrendStockEnum type;
  final List<StockModel>? stocks;

  @override
  Widget build(BuildContext context) {
    return WidgetUtil.showIfTrue(
        stocks != null && stocks!.isNotEmpty,
        Container(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10, left: 10),
                child: Text(
                  type.description,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              Column(
                children: stocks!.map((e) => _getStock(e)).toList(),
              ),
            ],
          ),
        ));
  }

  Widget _getStock(StockModel stock) {
    return SizedBox(
      height: 60,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () => Get.toNamed(Routes.detailStock),
          child: Container(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(stock.image as String),
                ),
                TickerStock(title: stock.ticker as String),
                Expanded(
                    flex: 2,
                    child: Text(
                      stock.name as String,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white),
                    )),
                Expanded(
                  flex: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        NumberUtil.formatedCurrency(stock
                            .summary!.price!.regularMarketPrice!
                            .toDouble()),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Image(image: AssetImage(type.image))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
