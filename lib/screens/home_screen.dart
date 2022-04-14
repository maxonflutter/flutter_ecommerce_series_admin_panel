import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '/controllers/controllers.dart';
import '/screens/screens.dart';
import '/models/models.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final OrderStatsController orderStatsController =
      Get.put(OrderStatsController());

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
            FutureBuilder(
              future: orderStatsController.stats.value,
              builder: (context, AsyncSnapshot<List<OrderStats>> snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    height: 250,
                    padding: const EdgeInsets.all(10),
                    child: CustomBarChart(
                      orderStats: snapshot.data!,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              },
            ),
            Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {
                  Get.to(() => ProductsScreen());
                },
                child: const Card(
                  child: Center(
                    child: Text('Go To Products'),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {
                  Get.to(() => OrdersScreen());
                },
                child: const Card(
                  child: Center(
                    child: Text('Go To Orders'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBarChart extends StatelessWidget {
  const CustomBarChart({
    Key? key,
    required this.orderStats,
  }) : super(key: key);

  final List<OrderStats> orderStats;
  @override
  Widget build(BuildContext context) {
    List<charts.Series<OrderStats, String>> series = [
      charts.Series(
          id: "orders",
          data: orderStats,
          domainFn: (series, _) =>
              DateFormat.d().format(series.dateTime).toString(),
          measureFn: (series, _) => series.orders,
          colorFn: (series, _) => series.barColor!)
    ];

    return charts.BarChart(series, animate: true);
  }
}
