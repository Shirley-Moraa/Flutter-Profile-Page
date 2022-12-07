import 'package:flutter/material.dart';
import 'package:profile_user/page/edit_profile_page.dart';
import 'package:profile_user/widgets/appbar_widget.dart';
import 'package:profile_user/utils/user_preferences.dart';
import 'package:profile_user/widgets/profile_widget.dart';
import 'package:profile_user/model/user.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    // getting our user
    final user = UserPreferences.getUser();

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        // ignore: prefer_const_constructors
        physics: BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 30),
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => EditProfilePage()),
              );
              setState(() {});
            },
          ),
          const SizedBox(height: 10),
          const SizedBox(height: 10),
          buildName(user),
          const SizedBox(height: 50),
          buildAbout(user),
        ],
      ),
    );
  }
}

Widget buildName(User user) => Column(
      children: [
        Text(
          user.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          user.email,
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          user.phoneNumber,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ],
    );

Widget buildAbout(User user) => Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text(
            'About',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(
            height: 19,
          ),
          Text(
            user.about,
            style: TextStyle(fontSize: 22, height: 1.4),
          ),
        ],
      ),
    );
