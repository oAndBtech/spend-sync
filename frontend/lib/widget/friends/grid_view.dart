import 'package:flutter/material.dart';
import 'package:spend_sync/widget/friends/friend_profile.dart';
import 'package:spend_sync/widget/friends/groups_profile.dart';

class GridViewWidget extends StatelessWidget {
  final bool isFriend;
  const GridViewWidget({super.key,this.isFriend = true});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 6.0,
              crossAxisSpacing: 6.0,
            ),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
           itemBuilder: (BuildContext context, int index) {
              return isFriend? ProfileItemWidget(
                onTap: (){},
                name: "Apple Don",
              ) :
              GroupProfileItemWidget(
                onTap: (){},
                name: "Apple Don",
              );
              
            },
    );
  }
}