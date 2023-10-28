import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:spend_sync/bottom_navbar.dart';
import 'package:spend_sync/const/colors.dart';
import 'package:spend_sync/widget/login/blue_text_button.dart';
import 'package:spend_sync/widget/login/login_button.dart';
import 'package:spend_sync/widget/login/skip_button.dart';
// import 'package:spend_sync/providers/null_provider_logout.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Future<void> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

        await auth.signInWithCredential(credential);
      }
    } catch (error) {
      // snack bar / Toast
      Fluttertoast.showToast(
        msg: 'Failed to Sign in',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  Future<bool> checkLoggedIn() {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    return googleSignIn.isSignedIn();
  }

  Future<void> logout() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    // NullProviderAfterLogout.nullAfterLogout(ref);

    await googleSignIn.signOut();
  }

  void isLoggedIn() async {
    bool isLoggedIn = await checkLoggedIn();

    if (isLoggedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => BottomNavBar()));
    }
  }

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
                    'Welcome!',
                    style: GoogleFonts.inter(
                        color: darkModeColors().textColor,
                        fontSize: 36.0,
                        letterSpacing: -0.2,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.1),
                  child: Text(
                    'Start keeping your spending records efficiently',
                    style: GoogleFonts.inter(
                        color: darkModeColors().secondaryTextColor,
                        fontSize: 21.0,
                        letterSpacing: -0.2,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 42,
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.072),
                  child: LoginButton(
                      onTap: () async {
                        await signInWithGoogle();

                        bool isLoggedIn = await checkLoggedIn();

                        if (isLoggedIn) {
                          var email = FirebaseAuth.instance.currentUser!.email
                              .toString();

                          if (email.isEmpty) {
                            await logout();

                            Fluttertoast.showToast(
                              msg: 'Error',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                            );
                          }
                        }
                      },
                      buttonText: 'Continue with Google',
                      icon: Icon(
                        FontAwesomeIcons.google,
                        color: darkModeColors().textColor,
                        size: 32,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.072),
                  child: LoginButton(
                      onTap: () {
                        navigateToHomePage(context);
                      },
                      buttonText: 'Continue with Facebook',
                      icon: Icon(
                        FontAwesomeIcons.facebook,
                        color: darkModeColors().textColor,
                        size: 32,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: EdgeInsets.only(left: width * 0.072),
                    child: SkipButtonWidget(
                      buttonText: 'Skip',
                      onTap: () {
                        navigateToHomePage(context);
                      },
                    )),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.1),
                  child: Row(
                    children: [
                      Text(
                        'Need help?',
                        style: GoogleFonts.inter(
                            color: darkModeColors().secondaryTextColor,
                            fontSize: 18.0,
                            letterSpacing: -0.2,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      BlueTextButton(
                          onTap: () {},
                          buttonText: 'Contact us',
                          custonFontSize: 18)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  navigateToHomePage(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (ctx) => BottomNavBar()));
  }
}
