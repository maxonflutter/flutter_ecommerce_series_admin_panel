import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_backend/models/order_series_model.dart';
import 'package:get/get.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final Map<String, dynamic> overviewCards = {
    'Orders': 750,
    'Revenue': 10000,
    'Customers': 240,
    'KPI 1': 10,
    'KPI 2': 100,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My eCommerce'),
        backgroundColor: Colors.black,
      ),
      body: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: overviewCards.entries.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 140,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              overviewCards.keys.elementAt(index),
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '${overviewCards.values.elementAt(index)}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 300,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: SimpleBarChart(),
            ),
            _buildContainer(
              const OrdersScreen(),
              const Text('Go to Orders'),
            ),
            const SizedBox(height: 10),
            _buildContainer(
              ProductsScreen(),
              const Text('Go to Products'),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  Expanded _buildContainer(
    Widget route,
    Text title,
  ) {
    return Expanded(
      flex: 2,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: InkWell(
          onTap: () {
            Get.to(() => route);
          },
          child: Card(
            child: Center(child: title),
          ),
        ),
      ),
    );
  }
}

class SimpleBarChart extends StatelessWidget {
  SimpleBarChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<OrdersSeries, String>> series = [
      charts.Series(
          id: "orders",
          data: OrdersSeries.data,
          domainFn: (OrdersSeries series, _) => series.day.toString(),
          measureFn: (OrdersSeries series, _) => series.orders,
          colorFn: (OrdersSeries series, _) => series.barColor)
    ];

    return charts.BarChart(series, animate: true);
  }
}
