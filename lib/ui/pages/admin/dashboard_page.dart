import 'package:flutter/material.dart';
import 'package:menuapp/ui/general/colors.dart';
import 'package:menuapp/ui/widgets/text_custom_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardPage extends StatelessWidget {
  List<PieChartModel> dataPie = [
    PieChartModel(
      x: "Juan",
      y: 20,
      color: Colors.indigo,
    ),
    PieChartModel(
      x: "Daniel",
      y: 30,
      color: Colors.greenAccent,
    ),
    PieChartModel(
      x: "Julio",
      y: 50,
      color: Colors.redAccent,
    ),
  ];

  List<BarChartModel> dataBar = [
    BarChartModel(x: "Juan", y: 22),
    BarChartModel(x: "Daniel", y: 45),
    BarChartModel(x: "Julio", y: 12),
    BarChartModel(x: "Maria", y: 78),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                H1(
                  text: "Dashboard Principal",
                ),
                H6(
                  text: "Reportes generales de la empresa",
                  color: kBrandSecondaryColor.withOpacity(0.60),
                ),
                SfCircularChart(
                  title: ChartTitle(
                    text: "Resumen mensual",
                  ),
                  legend: Legend(
                      title: LegendTitle(
                        text: "Detalle",
                      ),
                      isVisible: true,
                      legendItemBuilder: (String name, dynamic series,
                          dynamic point, int index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 3.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.ac_unit_outlined, size: 16),
                              Text(" $name ${dataPie[index].y.toString()}"),
                            ],
                          ),
                        );
                      }),
                  tooltipBehavior: TooltipBehavior(
                    shouldAlwaysShow: true,
                    enable: true,
                  ),
                  series: <CircularSeries>[
                    RadialBarSeries<PieChartModel, String>(
                      dataSource: dataPie,
                      pointColorMapper: (model, index) => model.color,
                      xValueMapper: (model, index) => model.x,
                      yValueMapper: (model, index) => model.y,
                      radius: '90%',
                      // explode: true,
                      // explodeIndex: 1,
                    ),
                  ],
                ),
                SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  primaryYAxis:
                      NumericAxis(minimum: 0, maximum: 100, interval: 10),
                  series: [
                    ColumnSeries(
                        dataSource: dataBar,
                        xValueMapper: (model, index) => model.x,
                        yValueMapper: (model, index) => model.y,
                        width: 0.5,
                      isTrackVisible: true,
                        trackColor: Colors.redAccent.withOpacity(0.3),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(6.0),
                          topLeft: Radius.circular(6.0),
                        ),
                    ),
                    // ColumnSeries(
                    //   dataSource: dataBar,
                    //   xValueMapper: (model, index)=> model.x,
                    //   yValueMapper: (model, index)=> model.y * 0.5,
                    // ),
                    // ColumnSeries(
                    //   dataSource: dataBar,
                    //   xValueMapper: (model, index)=> model.x,
                    //   yValueMapper: (model, index)=> model.y * 0.8,
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PieChartModel {
  final String x;
  final double y;
  final Color color;

  PieChartModel({
    required this.x,
    required this.y,
    required this.color,
  });
}

class BarChartModel {
  final String x;
  final double y;

  BarChartModel({required this.x, required this.y});
}