import 'package:flutter/material.dart';
import 'package:ml_invest_app/widgets/stocks_by_trend.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  pinned: true,
                  snap: false,
                  floating: false,
                  expandedHeight: 250.0,
                  backgroundColor: const Color.fromRGBO(97, 97, 97, 1),
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: false,
                    titlePadding: const EdgeInsets.all(15),
                    title: const Text('ML Invest'),
                    background: Container(
                        padding: const EdgeInsets.only(top: 45),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: const [
                            Image(
                                image: AssetImage(
                                    'assets/images/undraw_robotics_kep.png')),
                          ],
                        )),
                  ),
                ),
              ];
            },
            body: Container(
              color: const Color.fromRGBO(48, 48, 48, 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  StocksByTrend(title: 'Tendência de alta'),
                  StocksByTrend(title: 'Neutro'),
                  StocksByTrend(title: 'Tendência de baixa'),
                ],
              ),
            )));
  }
}
