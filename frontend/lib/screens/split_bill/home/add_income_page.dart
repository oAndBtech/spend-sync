import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:spend_sync/const/colors.dart';
import 'package:spend_sync/const/fontSizes.dart';
import 'package:spend_sync/widget/app_bar.dart';

class AddIncomePage extends StatefulWidget {
  const AddIncomePage({super.key});

  @override
  State<AddIncomePage> createState() => _AddIncomePageState();
}

class _AddIncomePageState extends State<AddIncomePage> {
  String selectedCategory = 'Select Category';
  List<String> categories = [
    'Food',
    'Transportation',
    'Shopping',
    'Entertainment',
    'Other'
  ];

  String selectedDate = "";

  String getCurrenctDate() {
    String date = DateFormat('dd/MM/yyyy').format(DateTime.now());
    setState(() {
      selectedDate = date;
    });
    return date; //if needed
  }

  DateTime parseDateString(String date) {
    return DateFormat('dd/MM/yyyy').parse(date);
  }

  @override
  void initState() {
    super.initState();
    getCurrenctDate();
  }

  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const NewAppBar(
                isNotification: false, title: 'Add Income', leadingIcon: 2),
            Center(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 24, left: 18, right: 18),
                    child: Container(
                      decoration: BoxDecoration(
                        color: darkModeColors().cardColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, top: 32, bottom: 18),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 58,
                              width: width * 0.78,
                              child: TextField(
                                controller: amountController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Amount',
                                  labelStyle: GoogleFonts.inter(
                                    color: darkModeColors()
                                        .textColor
                                        .withOpacity(0.7),
                                  ),
                                  prefixIconColor: darkModeColors().textColor,
                                  prefixIcon:
                                      const Icon(FontAwesomeIcons.dollarSign),
                                  focusColor: darkModeColors().textColor,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: darkModeColors()
                                            .textColor
                                            .withOpacity(0.2)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: darkModeColors()
                                            .textColor
                                            .withOpacity(0.3)),
                                  ),
                                ),
                                style: GoogleFonts.inter(
                                  color: darkModeColors().textColor,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              height: 58,
                              width: width * 0.78,
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: 'Category',
                                  labelStyle: GoogleFonts.inter(
                                    color: darkModeColors()
                                        .textColor
                                        .withOpacity(0.7),
                                  ),
                                  prefixIcon: const Icon(Icons.category),
                                  prefixIconColor: darkModeColors().textColor,
                                  suffixIcon: IconButton(
                                    icon: const Icon(
                                      FontAwesomeIcons.chevronDown,
                                      size: 16,
                                    ),
                                    color: darkModeColors().textColor,
                                    onPressed: () {
                                      _showCategoryDialog(context);
                                    },
                                  ),
                                  suffixIconColor: darkModeColors().textColor,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: darkModeColors()
                                            .textColor
                                            .withOpacity(0.2)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: darkModeColors()
                                            .textColor
                                            .withOpacity(0.2)),
                                  ),
                                ),
                                style: GoogleFonts.inter(
                                  color: darkModeColors().textColor,
                                ),
                                readOnly: true,
                                controller: TextEditingController(
                                    text: selectedCategory),
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              height: 58,
                              width: width * 0.78,
                              child: TextField(
                                controller:
                                    TextEditingController(text: selectedDate),
                                decoration: InputDecoration(
                                  labelText: 'Date',
                                  labelStyle: GoogleFonts.inter(
                                    color: darkModeColors()
                                        .textColor
                                        .withOpacity(0.7),
                                  ),
                                  prefixIcon: const Icon(
                                    FontAwesomeIcons.calendar,
                                    size: 24,
                                  ),
                                  prefixIconColor: darkModeColors().textColor,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: darkModeColors()
                                            .textColor
                                            .withOpacity(0.2)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: darkModeColors()
                                            .textColor
                                            .withOpacity(0.2)),
                                  ),
                                ),
                                style: GoogleFonts.inter(
                                  color: darkModeColors().textColor,
                                ),
                                readOnly: true,
                                onTap: () async {
                                  DateTime initDate =
                                      parseDateString(selectedDate);
                                  print(initDate);
                                  final DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate: initDate,
                                    firstDate: DateTime(2000, 8),
                                    lastDate: DateTime(2101),
                                  );
                                  if (picked != null) {
                                    setState(() {
                                      selectedDate = DateFormat('dd/MM/yyyy')
                                          .format(picked);
                                    });
                                  }
                                },
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              height: 100,
                              width: width * 0.78,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Description(optional)',
                                  hintStyle: GoogleFonts.inter(
                                    color: darkModeColors()
                                        .textColor
                                        .withOpacity(0.7),
                                    fontWeight: FontWeight.w400,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: darkModeColors()
                                            .textColor
                                            .withOpacity(0.2)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: darkModeColors()
                                            .textColor
                                            .withOpacity(0.3)),
                                  ),
                                ),
                                style: GoogleFonts.inter(
                                  color: darkModeColors().textColor,
                                ),
                                maxLines: 3,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Center(
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {},
                                child: Container(
                                  height: 40,
                                  width: 82,
                                  decoration: BoxDecoration(
                                      color: darkModeColors().textColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 23),
                                      ),
                                      Center(
                                        child: Text(
                                          'Add',
                                          style: GoogleFonts.inter(
                                            color: darkModeColors().cardColor,
                                            fontWeight: FontWeight.w300,
                                            letterSpacing: -0.2,
                                            fontSize: fontSizes().addExpenseIncomeButton,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  void _showCategoryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Select a Category',
            style: GoogleFonts.inter(color: darkModeColors().textColor),
          ),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    categories[index],
                    style: GoogleFonts.inter(color: darkModeColors().textColor),
                  ),
                  onTap: () {
                    setState(() {
                      selectedCategory = categories[index];
                    });
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
