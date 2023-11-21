import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spend_sync/const/colors.dart';
import 'package:spend_sync/const/fontSizes.dart';

class GroupProfileItemWidget extends StatelessWidget {
  const GroupProfileItemWidget({
    super.key,
    required this.name,
    required this.onTap,
    this.profilePic,
  });

  final String name;
  final VoidCallback onTap;
  final String? profilePic;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: (){onTap();},
      child: SizedBox(
        width: 90,
        height: 130,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: (profilePic != null && profilePic is String)
                  ? NetworkImage(profilePic!)
                  : const AssetImage('assets/images/group_default.png')
                      as ImageProvider,
              child: const SizedBox.shrink(),
            ),
            const SizedBox(height: 6),
            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                color: darkModeColors().textColor,
                fontSize: fontSizes().groupProfileName,
                letterSpacing: -0.2,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
