import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:spend_sync/const/colors.dart';
import 'package:spend_sync/widget/activity/indicator.dart';

class PieCharWidget extends StatefulWidget {
  const PieCharWidget({super.key, required this.dataMap});
  final Map<String, double> dataMap;

  @override
  State<PieCharWidget> createState() => _PieCharWidgetState();
}

class _PieCharWidgetState extends State<PieCharWidget> {
  @override
  Widget build(BuildContext context) {
    final colors = generateColors(widget.dataMap.length);
    final data = widget.dataMap;
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1.4,
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
            centerSpaceRadius: 50,
            sections: pieSections(),
          )),
        ),
            const SizedBox(height: 10,),

        Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            children: 
                buildListOfWidget(data, colors),
            ),
            const SizedBox(height: 10,),
      ],
    );
  }

  int touchedIndex = -1;

  List<PieChartSectionData> pieSections() {
    Map<String, double> data = widget.dataMap;
    final colors = generateColors(data.length);
    return List.generate(data.length, (i) {
      final isTouched = i == touchedIndex;
      final radius = isTouched ? 60.0 : 50.0;
      return PieChartSectionData(
          color: colors[i],
          value: data.entries.elementAt(i).value,
          radius: radius,
          showTitle: false);
    });
  }

  List<Color> generateColors(int length) {
    final colors = darkModeColors().pieChartColors;

    if (length <= colors.length) {
      return colors.getRange(0, length).toList();
    } else {
      List<Color> generatedColors = [];
      for (int i = 0; i < length; i++) {
        generatedColors.add(colors[i % colors.length]);
      }
      return generatedColors;
    }
  }

  List<Widget> buildListOfWidget(Map<String, double> data, List<Color> colors) {
    List<Widget> list = List.generate(data.length, (index) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Indicator(
            color: colors[index],
            text: data.entries.elementAt(index).key,
            isSquare: false,
          ),
          const SizedBox(
            width: 18,
          ),
        ],
      );
    });
    return list;
  }
}
