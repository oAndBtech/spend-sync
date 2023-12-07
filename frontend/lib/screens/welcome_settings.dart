import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spend_sync/const/colors.dart';
import 'package:spend_sync/const/fontSizes.dart';

class WelocomeSettings extends StatefulWidget {
  const WelocomeSettings({super.key});

  @override
  State<WelocomeSettings> createState() => _WelocomeSettingsState();
}

class _WelocomeSettingsState extends State<WelocomeSettings> {
  @override
  Widget build(BuildContext context) {
    String currencyName = 'Currency';
    double width = MediaQuery.of(context).size.width;
    int currentPage = 0;
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
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 58,
                      width: width * 0.78,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: currencyName,
                          hintStyle: GoogleFonts.inter(
                            color: darkModeColors().textColor.withOpacity(0.7),
                          ),
                          prefixIcon: const Icon(Icons.category),
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
                                favorite: ['eur'],
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
                        // controller:
                        //     TextEditingController(text: selectedCategory),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ])))));
  }
}
