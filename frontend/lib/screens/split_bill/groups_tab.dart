import 'package:flutter/material.dart';
import 'package:spend_sync/widget/friends/grid_view.dart';

class GroupsTab extends StatelessWidget {
  const GroupsTab({super.key});

  final count = 45; //TODO:change this according to user

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.group_add,
          color: Colors.black,
          size: 30,
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            GridViewWidget(
              isFriend: false,
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
