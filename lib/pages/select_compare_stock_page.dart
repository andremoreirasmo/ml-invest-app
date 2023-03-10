import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:ml_invest_app/utils/routes.dart';
import 'package:ml_invest_app/widgets/default_app_bar.dart';

import '../widgets/ticker_stock.dart';

class SelectCompareStockPage extends StatefulWidget {
  const SelectCompareStockPage({super.key});

  @override
  State<SelectCompareStockPage> createState() => _SelectCompareStockPageState();
}

class _SelectCompareStockPageState extends State<SelectCompareStockPage> {
  List<String> _options = ['Option 1', 'Option 2', 'Option 3'];
  List<String> _selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: Row(children: [
          Text(
            "Comparar ações",
            style: TextStyle(fontSize: 14),
          ),
        ]),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: _options
                  .map((option) => CheckboxListTile(
                        title: Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const CircleAvatar(
                                radius: 20,
                                backgroundImage: NetworkImage(
                                    "https://conteudos.xpi.com.br/wp-content/uploads/2021/07/amer3.jpg?w=400"),
                              ),
                              const TickerStock(title: "AMER3"),
                              Expanded(
                                  flex: 2,
                                  child: Text(
                                    option,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ],
                          ),
                        ),
                        value: _selectedOptions.contains(option),
                        onChanged: (value) {
                          setState(() {
                            if (value != null && value) {
                              _selectedOptions.add(option);
                            } else {
                              _selectedOptions.remove(option);
                            }
                          });
                        },
                      ))
                  .toList(),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: _selectedOptions.length > 1
          ? FloatingActionButton(
              onPressed: () {
                Get.offAndToNamed(Routes.compareStock);
              },
              tooltip: 'Comparar',
              elevation: 2.0,
              backgroundColor: const Color.fromRGBO(84, 84, 84, 1),
              child:
                  const Icon(Icons.send, color: Color.fromRGBO(44, 157, 4, 1)),
            )
          : null,
    );
  }
}
