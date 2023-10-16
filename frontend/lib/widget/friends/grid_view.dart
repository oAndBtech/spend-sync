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
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
            ),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
           itemBuilder: (BuildContext context, int index) {
              return isFriend? ProfileItemWidget(
                onTap: (){},
                // profilePic: 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcS-A_IpSIrFyh9HK_x9jWVc4o_jFu01HU4HBhznpXI4fnWj7NuE',
                name: "Apple Don",
              ) :
              GroupProfileItemWidget(
                onTap: (){},
                // profilePic: 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcS-A_IpSIrFyh9HK_x9jWVc4o_jFu01HU4HBhznpXI4fnWj7NuE',
                name: "Apple Don",
              );
              
            },
    );
  }
}