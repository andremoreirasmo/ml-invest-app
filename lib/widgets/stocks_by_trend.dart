import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ml_invest_app/utils/nav.dart';
import 'package:ml_invest_app/widgets/ticker_stock.dart';

import '../pages/detail_stock_page.dart';

class StocksByTrend extends StatelessWidget {
  const StocksByTrend({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          SizedBox(
            height: 50,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () => push(context, DetailStockPage()),
                child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
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
          ),
        ],
      ),
    );
  }
}
