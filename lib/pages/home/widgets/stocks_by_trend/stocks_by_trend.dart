import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ml_invest_app/shared/models/stock_model.dart';
import 'package:ml_invest_app/shared/utils/routes.dart';
import 'package:ml_invest_app/shared/widgets/ticker_stock/ticker_stock.dart';

class StocksByTrend extends StatelessWidget {
  const StocksByTrend({super.key, required this.title, required this.stocks});
  final String title;
  final List<StockModel>? stocks;

  @override
  Widget build(BuildContext context) {
    return (stocks != null && stocks!.isNotEmpty)
        ? Container(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10, left: 10),
                  child: Text(
                    title,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                Column(
                  children: stocks!.map((e) => _getStock(e)).toList(),
                ),
              ],
            ),
          )
        : const SizedBox.shrink();
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
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      "https://conteudos.xpi.com.br/wp-content/uploads/2021/07/amer3.jpg?w=400"),
                ),
                const TickerStock(title: "AMER3"),
                const Expanded(
                    flex: 2,
                    child: Text(
                      "AMERICANAS ON NM",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white),
                    )),
                Expanded(
                  flex: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        "R\$ 12,63",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Image(image: AssetImage('assets/images/high.png'))
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
