import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spend_sync/const/colors.dart';

class GraphWidget extends StatefulWidget {
  const GraphWidget({super.key});

  @override
  State<GraphWidget> createState() => _GraphWidgetState();
}

class _GraphWidgetState extends State<GraphWidget> {
  List<Color> gradientColors = [Color(0xff459AD8), darkModeColors().blueColor];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.4,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 18,
          left: 6,
          top: 24,
          bottom: 12,
        ),
        child: LineChart(
          mainData(),
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    TextStyle style = GoogleFonts.inter(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: darkModeColors().textColor,
        letterSpacing: -0.2);
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = Text('Mon', style: style);
        break;
      case 4:
        text = Text('Tue', style: style);
        break;
      case 6:
        text = Text('Wed', style: style);
        break;
      case 8:
        text = Text('Thu', style: style);
        break;
      case 10:
        text = Text('Fri', style: style);
        break;
      case 12:
        text = Text('Sat', style: style);
        break;
      case 0:
        text = Text('Sun', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    TextStyle style = GoogleFonts.inter(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: darkModeColors().textColor,
        letterSpacing: -0.2);
    String text;
    switch (value.toInt()) {
      case 1:
        text = '200';
        break;
      case 3:
        text = '500';
        break;
      case 5:
        text = '1000';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: .5,
        verticalInterval: .5,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: darkModeColors().primary.withOpacity(0.4),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: darkModeColors().primary.withOpacity(0.4),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 35,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 12,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2, 2),
            FlSpot(4, 5),
            FlSpot(6, 3.1),
            FlSpot(8, 4),
            FlSpot(10, 3),
            FlSpot(12, 4),
            // FlSpot(13, 3),
          ],
          // isCurved: true,
          gradient: LinearGradient(
            // colors: [Colors.white,Colors.white],
            colors: gradientColors,
          ),
          barWidth: 3.5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
              // show: false,
              ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
