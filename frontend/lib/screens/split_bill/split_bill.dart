import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spend_sync/const/colors.dart';
import 'package:spend_sync/const/fontSizes.dart';
import 'package:spend_sync/screens/split_bill/friends_tab.dart';
import 'package:spend_sync/screens/split_bill/groups_tab.dart';
import 'package:spend_sync/screens/split_bill/split_tab.dart';
import 'package:spend_sync/widget/app_bar.dart';

class SplitBillScreen extends StatefulWidget {
  const SplitBillScreen({super.key});

  @override
  State<SplitBillScreen> createState() => _SplitBillScreenState();
}

class _SplitBillScreenState extends State<SplitBillScreen> {
  // int currentIndex = 0;
  //   final tabController = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 72.0 + 48.2,
            titleSpacing: 0,
            backgroundColor: Colors.transparent,
            flexibleSpace: PreferredSize(
              preferredSize: const Size.fromHeight(72.0 +
                  48.2), // 72.0 for NewAppBar and 48.0 (default) for TabBar
              child: Column(
                children: [
                  const NewAppBar(
                      isNotification: true,
                      title: 'Split Bill',
                      leadingIcon: 1),
                  Container(
                    height: 48.2,
                    color: const Color(0xff273241),
                    child: TabBar(
                        dividerColor: const Color(0xff273241),
                        // dividerColor: Colors.green,
                        labelColor: darkModeColors().activeButtons,
                        unselectedLabelColor: darkModeColors().textColor,
                        indicatorColor: darkModeColors().activeButtons,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorWeight: 2.2,
                        labelStyle: GoogleFonts.inter(
                            fontSize: fontSizes().tabsFontSize, letterSpacing: -0.2),
                        tabs: const [
                          Tab(text: "Split"),
                          Tab(text: "Friends"),
                          Tab(text: "Groups"),
                        ]),
                  )
                ],
              ),
            ),
          ),
          body: const TabBarView(children: [
            SplitTab(),
            FriendsTab(),
            GroupsTab(),
          ]),
        ),
      ),
    );
  }
}
