import 'dart:convert';

import 'package:profile_user/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  static const _keyUser = 'user';

  static const myUser = User(
      name: 'Jane Doe',
      phoneNumber: "+1 234-576-1111",
      email: 'janedoe@gmail.com',
      about:
          'A brilliant Scientist with NASA with 20 years experience in creating space technology. Focused on educating people about space',
      imagePath:
          'https://images.pexels.com/photos/12733781/pexels-photo-12733781.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);
    // is json is null, return default user details, otherwise...
    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}
