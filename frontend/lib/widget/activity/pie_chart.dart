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
    return AspectRatio(
      aspectRatio: 0.5,
      child: Column(
        children: [
          AspectRatio(
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
          ),
          const SizedBox(
            height: 28,
          ),
          // Column(
          //   children: buildListOfWidget(data, colors),
          // )
          Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.end,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                Row(
                  children: buildListOfWidget(data, colors),
                )
              ])
          // const Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Indicator(
          //       color: Colors.blue,
          //       text: 'First',
          //       isSquare: false,
          //     ),
          //     SizedBox(
          //       width: 4,
          //     ),
          //     Indicator(
          //       color: Colors.amber,
          //       text: 'Second',
          //       isSquare: false,
          //     ),
          //     SizedBox(
          //       width: 4,
          //     ),
          //     SizedBox(
          //       width: 4,
          //     ),
          //     Indicator(
          //       color: Colors.green,
          //       text: 'Third',
          //       isSquare: false,
          //     ),
          //     SizedBox(
          //       width: 4,
          //     ),
          //     Indicator(
          //       color: Colors.purple,
          //       text: 'Fourth',
          //       isSquare: false,
          //     ),

          //     SizedBox(
          //       width: 18,
          //     ),
          //   ],
          // ),
          //     Expanded(
          //       child: ListView.builder(
          //         shrinkWrap: true,
          // scrollDirection: Axis.horizontal,
          //         itemCount: data.length,
          //         itemBuilder: (ctx, index) {
          //           return
          //           // Row(
          //             // children: [
          //               Indicator(
          //                 color: colors[index],
          //                 text: data.entries.elementAt(index).key,
          //                 isSquare: false,
          //               // ),
          //               // SizedBox(
          //               //   width: 4,
          //               // ),
          //             // ],
          //           );
          //         },
          //       ),
          //     )
//       Wrap(
//   alignment: WrapAlignment.end,
//   crossAxisAlignment: WrapCrossAlignment.start,
//     direction: Axis.vertical,
//   children: [
//     Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Indicator(
//           color: Colors.blue,
//           text: 'First',
//           isSquare: false,
//         ),
//         SizedBox(
//           width: 4,
//         ),
//         Indicator(
//           color: Colors.amber,
//           text: 'Second',
//           isSquare: false,
//         ),
//         SizedBox(
//           width: 4,
//         ),
//         SizedBox(
//           width: 4,
//         ),
//         Indicator(
//           color: Colors.green,
//           text: 'Third',
//           isSquare: false,
//         ),
//         SizedBox(
//           width: 4,
//         ),
//         Indicator(
//           color: Colors.purple,
//           text: 'Fourth',
//           isSquare: false,
//         ),
//         SizedBox(
//           width: 18,
//         ),
//         Indicator(
//           color: Colors.blue,
//           text: 'First',
//           isSquare: false,
//         ),
//         SizedBox(
//           width: 4,
//         ),
//         Indicator(
//           color: Colors.amber,
//           text: 'Second',
//           isSquare: false,
//         ),
//         SizedBox(
//           width: 4,
//         ),
//         SizedBox(
//           width: 4,
//         ),
//         Indicator(
//           color: Colors.green,
//           text: 'Third',
//           isSquare: false,
//         ),
//         SizedBox(
//           width: 4,
//         ),
//         Indicator(
//           color: Colors.purple,
//           text: 'Fourth',
//           isSquare: false,
//         ),
//         SizedBox(
//           width: 18,
//         ),
//         Indicator(
//           color: Colors.blue,
//           text: 'First',
//           isSquare: false,
//         ),
//         SizedBox(
//           width: 4,
//         ),
//         Indicator(
//           color: Colors.amber,
//           text: 'Second',
//           isSquare: false,
//         ),
//         SizedBox(
//           width: 4,
//         ),
//         SizedBox(
//           width: 4,
//         ),
//         Indicator(
//           color: Colors.green,
//           text: 'Third',
//           isSquare: false,
//         ),
//         SizedBox(
//           width: 4,
//         ),
//         Indicator(
//           color: Colors.purple,
//           text: 'Fourth',
//           isSquare: false,
//         ),
//         SizedBox(
//           width: 18,
//         ),
//         Indicator(
//           color: Colors.blue,
//           text: 'First',
//           isSquare: false,
//         ),
//         SizedBox(
//           width: 4,
//         ),
//         Indicator(
//           color: Colors.amber,
//           text: 'Second',
//           isSquare: false,
//         ),
//         SizedBox(
//           width: 4,
//         ),
//         SizedBox(
//           width: 4,
//         ),
//         Indicator(
//           color: Colors.green,
//           text: 'Third',
//           isSquare: false,
//         ),
//         SizedBox(
//           width: 4,
//         ),
//         Indicator(
//           color: Colors.purple,
//           text: 'Fourth',
//           isSquare: false,
//         ),
//         SizedBox(
//           width: 18,
//         ),
//       ],
//     ),

//     // You can add more Row widgets here for additional items
//   ],
// )

// buildListOfWidget(data, colors)

          // Expanded(child: indicatorList(data, colors))
        ],
      ),
    );
  }

  int touchedIndex = -1;

  List<PieChartSectionData> pieSections() {
    Map<String, double> data = widget.dataMap;
    final colors = generateColors(data.length);
    return List.generate(data.length, (i) {
      final isTouched = i == touchedIndex;
      // final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      // const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      return PieChartSectionData(
          color: colors[i],
          value: data.entries.elementAt(i).value,
          radius: radius,
          showTitle: false);
      // switch (i) {
      //   case 0:
      //     return PieChartSectionData(
      //       // color: Colors.blue,
      //       value: 40,
      //       // title: '40%',
      //       radius: radius,
      //       showTitle: false,
      //     );
      //   case 1:
      //     return PieChartSectionData(
      //       // color: Colors.amber,
      //       value: 30,
      //       // title: '30%',
      //       radius: radius,
      //       showTitle: false,
      //     );
      //   case 2:
      //     return PieChartSectionData(
      //       // color: Colors.purple,
      //       value: 45,
      //       // title: '15%',
      //       radius: radius,
      //       showTitle: false,
      //     );
      //   case 3:
      //     return PieChartSectionData(
      //       // color: Colors.green,
      //       value: 20,
      //       // title: '15%',
      //       radius: radius,
      //       showTitle: false,
      //     );
      //   case 4:
      //     return PieChartSectionData(
      //       color: Colors.grey,
      //       value: 70,
      //       // title: '15%',
      //       radius: radius,
      //       showTitle: false,
      //     );
      //   default:
      //     throw Error();
      // }
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

  Widget indicatorList(Map<String, double> data, List<Color> colors) {
    return Column(children: [
      Expanded(
          child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (ctx, index) {
          return
              // Row(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              Indicator(
            color: colors[index],
            text: data.entries.elementAt(index).key,
            isSquare: false,
            // ),
            // SizedBox(
            //   width: 18,
            // ),
            // ],
          );
        },
        // scrollDirection: Axis.horizontal,
        // separatorBuilder: (BuildContext context, int index) {return const Divider(); },),
      )),
    ]);
  }

  List<Widget> buildListOfWidget(Map<String, double> data, List<Color> colors) {
    List<Widget> list = List.generate(data.length, (index) {
      return Row(
        children: [
          Indicator(
            color: colors[index],
            text: data.entries.elementAt(index).key,
            isSquare: false,
          ),
          SizedBox(
            width: 18,
          ),
        ],
      );
    });
    return list;
  }
}
