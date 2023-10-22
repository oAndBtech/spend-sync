import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:spend_sync/const/colors.dart';
import 'package:spend_sync/widget/activity/indicator.dart';

class PieCharWidget extends StatefulWidget {
  const PieCharWidget({super.key});

  @override
  State<PieCharWidget> createState() => _PieCharWidgetState();
}

class _PieCharWidgetState extends State<PieCharWidget> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.55,
      child: Column(
        children: [
          Expanded(
              child: AspectRatio(
            aspectRatio: 1,
            child: PieChart(PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  setState(() {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      touchedIndex = -1;
                      return;
                    }
                    touchedIndex =
                        pieTouchResponse.touchedSection!.touchedSectionIndex;
                  });
                },
              ),
              borderData: FlBorderData(
                show: false,
              ),
              sectionsSpace: 0,
              centerSpaceRadius: 40,
              sections: pieSections(),
            )),
          )),
          const SizedBox(
            height: 28,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Indicator(
                color: Colors.blue,
                text: 'First',
                isSquare: false,
              ),
              SizedBox(
                width: 4,
              ),
              Indicator(
                color: Colors.amber,
                text: 'Second',
                isSquare: false,
              ),
              SizedBox(
                width: 4,
              ),
              SizedBox(
                width: 4,
              ),
              Indicator(
                color: Colors.green,
                text: 'Third',
                isSquare: false,
              ),
              SizedBox(
                width: 4,
              ),
              Indicator(
                color: Colors.purple,
                text: 'Fourth',
                isSquare: false,
              ),
              
              SizedBox(
                width: 18,
              ),
            ],
          ),
        ],
      ),
    );
  }

  int touchedIndex = -1;

  List<PieChartSectionData> pieSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      // final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      // const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.blue,
            value: 40,
            // title: '40%',
            radius: radius,
            showTitle: false,
          );
        case 1:
          return PieChartSectionData(
            color: Colors.amber,
            value: 30,
            // title: '30%',
            radius: radius,
            showTitle: false,
          );
        case 2:
          return PieChartSectionData(
            color: Colors.purple,
            value: 45,
            // title: '15%',
            radius: radius,
            showTitle: false,
          );
        case 3:
          return PieChartSectionData(
            color: Colors.green,
            value: 20,
            // title: '15%',
            radius: radius,
            showTitle: false,
          );
        case 4:
          return PieChartSectionData(
            color: Colors.grey,
            value: 70,
            // title: '15%',
            radius: radius,
            showTitle: false,
          );
        default:
          throw Error();
      }
    });
  }

}
