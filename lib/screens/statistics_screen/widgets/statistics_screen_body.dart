import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/size_utils.dart';
import '../../../theme/app_style.dart';

class StatisticsScreenContent extends StatelessWidget {
  final Map<String, Map> data;
  const StatisticsScreenContent(this.data,{super.key});

  String capitalCase(String text) {
    return text.split(' ').map((word) => word[0].toUpperCase() + word.substring(1)).join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(data.length, (index) {
            var key = data.keys.elementAt(index);
            var value = data[key];
            var sortedKeys = value!.keys.toList()..sort();
            var sortedValues = value.values.toList()..sort();
            double minX = sortedKeys.first.toDouble();
            double maxX = sortedKeys.last.toDouble();
            double minY = sortedValues.first.toDouble();
            double maxY = sortedValues.last.toDouble();
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    capitalCase(
                      data.keys.elementAt(index),
                    ),
                    style: AppStyle.txtUrbanistRomanBold18.copyWith(fontSize: getFontSize(30)),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                    height: 200,
                    child: LineChart(
                      LineChartData(
                        minX: minX,
                        maxX: maxX,
                        minY: minY - 1,
                        maxY: maxY + 1,
                        gridData: FlGridData(
                          show: true,
                          getDrawingHorizontalLine: (value) {
                            return FlLine(
                              color: const Color(0xff37434d),
                              strokeWidth: 1,
                            );
                          },
                          drawVerticalLine: true,
                          getDrawingVerticalLine: (value) {
                            return FlLine(
                              color: const Color(0xff37434d),
                              strokeWidth: 1,
                            );
                          },
                        ),
                        borderData: FlBorderData(
                          show: true,
                          border: Border.all(color: const Color(0xff37434d), width: 1),
                        ),
                        titlesData: FlTitlesData(
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            ),
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            ),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 22,
                              getTitlesWidget: (value, meta) {
                                switch (value.toInt()) {
                                  case 1:
                                    return Text(
                                      'Jan',
                                      style: AppStyle.txtUrbanistRomanBold18
                                          .copyWith(fontSize: getFontSize(12)),
                                    );
                                  case 2:
                                    return Text(
                                      'Feb',
                                      style: AppStyle.txtUrbanistRomanBold18
                                          .copyWith(fontSize: getFontSize(12)),
                                    );
                                  case 3:
                                    return Text(
                                      'Mar',
                                      style: AppStyle.txtUrbanistRomanBold18
                                          .copyWith(fontSize: getFontSize(12)),
                                    );
                                  case 4:
                                    return Text(
                                      'Apr',
                                      style: AppStyle.txtUrbanistRomanBold18
                                          .copyWith(fontSize: getFontSize(12)),
                                    );
                                  case 5:
                                    return Text(
                                      'May',
                                      style: AppStyle.txtUrbanistRomanBold18
                                          .copyWith(fontSize: getFontSize(12)),
                                    );
                                  case 6:
                                    return Text(
                                      'Jun',
                                      style: AppStyle.txtUrbanistRomanBold18
                                          .copyWith(fontSize: getFontSize(12)),
                                    );
                                  case 7:
                                    return Text(
                                      'Jul',
                                      style: AppStyle.txtUrbanistRomanBold18
                                          .copyWith(fontSize: getFontSize(12)),
                                    );
                                  case 8:
                                    return Text(
                                      'Aug',
                                      style: AppStyle.txtUrbanistRomanBold18
                                          .copyWith(fontSize: getFontSize(12)),
                                    );
                                  case 9:
                                    return Text(
                                      'Sep',
                                      style: AppStyle.txtUrbanistRomanBold18
                                          .copyWith(fontSize: getFontSize(12)),
                                    );
                                  case 10:
                                    return Text(
                                      'Oct',
                                      style: AppStyle.txtUrbanistRomanBold18
                                          .copyWith(fontSize: getFontSize(12)),
                                    );
                                  case 11:
                                    return Text(
                                      'Nov',
                                      style: AppStyle.txtUrbanistRomanBold18
                                          .copyWith(fontSize: getFontSize(12)),
                                    );
                                  case 12:
                                    return Text(
                                      'Dec',
                                      style: AppStyle.txtUrbanistRomanBold18
                                          .copyWith(fontSize: getFontSize(12)),
                                    );
                                  default:
                                    return Text(
                                      '',
                                      style: AppStyle.txtUrbanistRomanBold18
                                          .copyWith(fontSize: getFontSize(12)),
                                    );
                                }
                              },
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 22,
                              getTitlesWidget: (value, meta) {
                                return Text(
                                  '$value',
                                  style: AppStyle.txtUrbanistRomanBold18
                                      .copyWith(fontSize: getFontSize(12)),
                                );
                              },
                            ),
                          ),
                        ),
                        lineBarsData: [
                          LineChartBarData(
                            spots:
                                List.generate(value.length, (index) => value.keys.elementAt(index))
                                    .map(
                                      (e) => FlSpot(
                                        e.toDouble(),
                                        value[e]!.toDouble(),
                                      ),
                                    )
                                    .toList(),
                            isCurved: true,
                            color: const Color(0xff23b6e6),
                            barWidth: 5,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      );
  }
}