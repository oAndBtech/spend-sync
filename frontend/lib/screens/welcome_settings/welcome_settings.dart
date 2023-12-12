import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spend_sync/const/colors.dart';
import 'package:spend_sync/const/fontSizes.dart';
import 'package:spend_sync/screens/welcome_settings/build_dots.dart';
import 'package:spend_sync/screens/welcome_settings/next_prev_button.dart';

class WelocomeSettings extends StatefulWidget {
  const WelocomeSettings({super.key});

  // TODO: page should change on clicking next and prev
  //       page indicator should change on clicking
  //       currency symbol must chnge
  //       two question pages remaining

  @override
  State<WelocomeSettings> createState() => _WelocomeSettingsState();
}

class _WelocomeSettingsState extends State<WelocomeSettings> {
  String currencyName = 'Choose your currency';
  final PageController pageController = PageController();
  int currentPage = 0;
  int questions = 3;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              height: 248,
              color: darkModeColors().cardColor.withOpacity(0.8),
            ),
          ),
          const SizedBox(
            height: 42,
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.1),
            child: Text(
              'Personalise your app!',
              style: GoogleFonts.inter(
                  color: darkModeColors().textColor,
                  fontSize: fontSizes().perTextWS,
                  letterSpacing: -0.2,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.1),
            child: Text(
              'Set some preference before begin',
              style: GoogleFonts.inter(
                  color: darkModeColors().secondaryTextColor,
                  fontSize: fontSizes().lowerPerTextWS,
                  letterSpacing: -0.2,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 36,
          ),
          if (currentPage == 0) ...[
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 18, right: 18),
              child: Container(
                decoration: BoxDecoration(
                  color: darkModeColors().cardColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Choose your preferred currency',
                        style: GoogleFonts.inter(
                            color: darkModeColors().textColor,
                            fontSize: fontSizes().questionsSize,
                            letterSpacing: -0.2,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        height: 58,
                        width: width * 0.78,
                        child: TextField(
                          controller: TextEditingController(text: currencyName),
                          decoration: InputDecoration(
                            labelText: 'Currency',
                            labelStyle: GoogleFonts.inter(
                              color:
                                  darkModeColors().textColor.withOpacity(0.7),
                            ),
                            // TODO: change icon
                            prefixIcon: const Icon(Icons.currency_pound),
                            prefixIconColor: darkModeColors().textColor,
                            suffixIcon: IconButton(
                              icon: const Icon(
                                FontAwesomeIcons.chevronDown,
                                size: 16,
                              ),
                              color: darkModeColors().textColor,
                              onPressed: () async {
                                showCurrencyPicker(
                                  context: context,
                                  showFlag: true,
                                  showSearchField: true,
                                  showCurrencyName: true,
                                  showCurrencyCode: true,
                                  onSelect: (Currency currency) {
                                    setState(() {
                                      currencyName = currency.name;
                                    });

                                    // TODO: change currency name and symbol when changed
                                    // TODO: also add pageview.builder to change questions
                                  },
                                );
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
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ] else if (currentPage == 1) ...[
            Container(
              height: 100,
              width: width * 0.8,
              color: Colors.black,
            )
          ] else if (currentPage == 2) ...[
            Container(
              height: 100,
              width: width * 0.8,
              color: Colors.black,
            )
          ],
          SizedBox(height: 36),
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 18, right: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NextPrevButton(
                  currentPage: currentPage,
                  onTap: () {
                    setState(() {
                      if (currentPage > 0) {
                        currentPage--;
                      }
                    });
                  },
                  buttonText: 'Prev',
                  icon: Icon(
                    FontAwesomeIcons.chevronLeft,
                    color: darkModeColors().textColor,
                    size: 18,
                  ),
                ),
                buildDotsIndicator(currentPage, questions),
                NextPrevButton(
                    currentPage: currentPage,
                    onTap: () {
                      setState(() {
                        if (currentPage < questions - 1) {
                          currentPage++;
                        }
                      });
                    },
                    buttonText: 'Next',
                    icon: Icon(
                      FontAwesomeIcons.chevronRight,
                      color: darkModeColors().textColor,
                      size: 18,
                    ),
                    start: false),
              ],
            ),
          )
        ])))));
  }
}
