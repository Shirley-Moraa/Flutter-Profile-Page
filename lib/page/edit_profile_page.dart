// import 'dart:html';
import 'package:flutter/material.dart';
import 'dart:io' as io;
import 'dart:convert';
import 'dart:async';

import 'package:image_picker/image_picker.dart';
import 'package:profile_user/utils/user_preferences.dart';
import 'package:profile_user/model/user.dart';
import 'package:profile_user/widgets/appbar_widget.dart';
import 'package:profile_user/widgets/profile_widget.dart';
import 'package:profile_user/widgets/text_field_widget.dart';
import 'package:profile_user/widgets/button_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late User user;
  @override
  void initState() {
    super.initState();

    user = UserPreferences.getUser();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: buildAppBar(context),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 30),
            ProfileWidget(
              imagePath: user.imagePath,
              isEdit: true,
              onClicked: () async {
                final image =
                    await ImagePicker().getImage(source: ImageSource.gallery);

                if (image == null) return;

                final directory = await getApplicationDocumentsDirectory();
                final name = basename(image.path);
                final imageFile = io.File('${directory.path}/$name');
                final newImage = await io.File(image.path).copy(imageFile.path);

                setState(() => user = user.copy(imagePath: newImage.path));
              },
            ),
            const SizedBox(height: 10),
            TextFieldWidget(
                label: 'Name',
                text: user.name,
                onChanged: (name) => user = user.copy(name: name)),
            const SizedBox(height: 10),
            TextFieldWidget(
                label: 'Email',
                text: user.email,
                onChanged: (email) => user = user.copy(email: email)),
            const SizedBox(height: 10),
            TextFieldWidget(
                label: 'Phone',
                text: user.phoneNumber,
                onChanged: (phoneNumber) =>
                    user = user.copy(phoneNumber: phoneNumber)),
            const SizedBox(height: 10),
            TextFieldWidget(
                label: 'About',
                text: user.about,
                maxLines: 5,
                onChanged: (about) => user = user.copy(about: about)),
            const SizedBox(height: 10),
            ButtonWidget(
              text: 'Save',
              onClicked: () {
                UserPreferences.setUser(user);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
}
