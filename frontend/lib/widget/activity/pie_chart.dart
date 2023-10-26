import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spend_sync/const/colors.dart';
import 'package:spend_sync/widget/activity/indicator.dart';

class PieCharWidget extends StatefulWidget {
  const PieCharWidget({super.key, required this.dataMap});
  final Map<String, double> dataMap;

  @override
  State<PieCharWidget> createState() => _PieCharWidgetState();
}

class _PieCharWidgetState extends State<PieCharWidget> {
  int touchedIndex = -1;
  double totalExpense = 0;

  getTotalExpense(){
    final data = widget.dataMap;
    double total = 0;
    for (var i = 0; i < data.length; i++) {
      total += data.entries.elementAt(i).value;
    }
    setState(() {
      totalExpense = total;
    });
  }
  @override
  void initState() {
    getTotalExpense();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colors = generateColors(widget.dataMap.length);
    final data = widget.dataMap;

    // print(touchedIndex);
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1.6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: PieChart(PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          // touchedIndex = -1;
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
              Flexible(child: amountWidget(type: 'Total Expense', amount: '\$ $totalExpense',isClicked: touchedIndex!=-1, type2: touchedIndex!=-1 ? data.entries.elementAt(touchedIndex) : const MapEntry("", 0))),
            ],
          ),
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
  Widget amountWidget({required String type ,required String amount,required bool isClicked, required MapEntry<String,double> type2}){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          type,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.inter(
            color: darkModeColors().textColor,
            fontSize: 17,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.2
          ),
        ),
        Text(
          amount,
          style: GoogleFonts.inter(
            color: darkModeColors().textColor,
            fontSize: 17,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.2
          ),
        ),
        const Spacer(),
        isClicked? Text(
          type2.key,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.inter(
            color: darkModeColors().textColor,
            fontSize: 17,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.2
          ),
        ): Container(),
        isClicked?Text(
          '\$ ${type2.value}',
          style: GoogleFonts.inter(
            color: darkModeColors().textColor,
            fontSize: 17,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.2
          ),
        ):Container(),
        const Spacer(),

      ],
    );
  }
}
