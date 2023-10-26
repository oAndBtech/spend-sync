import 'package:flutter/material.dart';
import 'package:spend_sync/services/user_model.dart';
import 'package:spend_sync/widget/friends/grid_view.dart';

class GroupsTab extends StatefulWidget {
  const GroupsTab({super.key});

  @override
  State<GroupsTab> createState() => _GroupsTabState();
}

class _GroupsTabState extends State<GroupsTab> {
  // final count = 45; 
 //TODO:change this according to user
  final List<UserModel> dummydata = List.generate(20, (index) => UserModel(name: "Apple Don", email: "email", pic: "pic"));

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
      body:  SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Center(
              child: GridViewWidget(
                listOfData: dummydata,
                isFriend: false,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
