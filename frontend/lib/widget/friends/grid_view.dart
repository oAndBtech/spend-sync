import 'package:flutter/material.dart';
import 'package:spend_sync/services/user_model.dart';
import 'package:spend_sync/widget/friends/friend_profile.dart';
import 'package:spend_sync/widget/friends/groups_profile.dart';

class GridViewWidget extends StatelessWidget {
  final bool isFriend;
  final List<UserModel> listOfData; //friends or groups
  const GridViewWidget(
      {super.key, this.isFriend = true, required this.listOfData});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: isFriend? buildListOfWidgetOfFriends(listOfData) : buildListOfWidgetOfGroups(listOfData),
    );
    // GridView.builder(
    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //           crossAxisCount: 4,
    //           mainAxisSpacing: 6.0,
    //           crossAxisSpacing: 6.0,
    //         ),
    //         physics: const NeverScrollableScrollPhysics(),
    //         shrinkWrap: true,
    //         itemCount: 10,
    //        itemBuilder: (BuildContext context, int index) {
    //           return isFriend? ProfileItemWidget(
    //             onTap: (){},
    //             name: "Apple Don",
    //           ) :
    //           GroupProfileItemWidget(
    //             onTap: (){},
    //             name: "Apple Don",
    //           );

    //         },
    // );
  }

  List<Widget> buildListOfWidgetOfFriends(
    List<UserModel> data,
  ) {
    List<Widget> list = List.generate(data.length, (index) {
      return ProfileItemWidget(name: data[index].name, onTap: () {});
    });
    return list;
  }
  List<Widget> buildListOfWidgetOfGroups(
    List<UserModel> data,
  ) {
    List<Widget> list = List.generate(data.length, (index) {
      return GroupProfileItemWidget(name: data[index].name, onTap: () {});
    });
    return list;
  }
}
