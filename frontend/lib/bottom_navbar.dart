import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spend_sync/screens/activity.dart';
import 'package:spend_sync/screens/split_bill/home/home.dart';
import 'package:spend_sync/screens/profile.dart';
import 'package:spend_sync/screens/split_bill/split_bill.dart';
import 'package:spend_sync/widget/drawer.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatefulWidget {
  int index;
  BottomNavBar({super.key, this.index = 0});
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}


class _BottomNavBarState extends State<BottomNavBar> {
  
  int selectedIndex = 0;
  List<Widget> screens =[
    HomeScreen(),
    ActivityScreen(),
    SplitBillScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    selectedIndex = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: BottomNavBar.scaffoldKey,
      drawer: SpendDrawer(profilePic: "profilePic", emailID: "emailID", userName: "userName"),
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selectedIndex = value;
            widget.index = value;
          });
        },

        selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white,
     showSelectedLabels: true,  // always show the selected item's label
    showUnselectedLabels: true,

        type: BottomNavigationBarType.fixed,
    selectedLabelStyle: GoogleFonts.inter(
        fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400),
    unselectedLabelStyle: GoogleFonts.inter(
        fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400),
        
        currentIndex: selectedIndex,
        backgroundColor: Color(0xff131921),
        items: const [
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 6,top: 4),
                child: Icon(
                  FontAwesomeIcons.house,
                  color: Colors.white,
                  size: 24.0,
                ),
              ),
              
              activeIcon: ActiveButtonWidget(
                  icon: Icon(
                FontAwesomeIcons.house,
                color: Colors.black,
                size: 24.0,
              )),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 6,top: 4),
                child: Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.white,
                  size: 28.0,
                ),
              ),
              activeIcon: ActiveButtonWidget(
                  icon: Icon(
                Icons.calendar_today_outlined,
                color: Colors.black,
                size: 28.0,
              )),
              label: 'Calender'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.forum_outlined,
                color: Colors.white,
                size: 29.0,
              ),
              activeIcon: ActiveButtonWidget(
                  icon: Icon(
                Icons.forum_outlined,
                color: Colors.black,
                size: 29.0,
              )),
              label: 'Feed'),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 11,top: 4),
                child: Icon(
                  FontAwesomeIcons.solidUser,
                  color: Colors.white,
                  size: 25.0,
                ),
              ),
              activeIcon: ActiveButtonWidget(
                  icon: Icon(
                FontAwesomeIcons.solidUser,
                color: Colors.black,
                size: 25.0,
              )),
              label: 'Profile'),
        ],
      ),
    );
  }
}

class ActiveButtonWidget extends StatelessWidget {
  final Icon icon;
  const ActiveButtonWidget({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 40,
      decoration: BoxDecoration(
          color: const Color(0xffFFD369), borderRadius: BorderRadius.circular(48)),
      child: icon,
    );
  }
}

