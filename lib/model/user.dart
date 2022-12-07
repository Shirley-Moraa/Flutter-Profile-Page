import 'dart:ffi';

class User {
  final String imagePath;
  final String name;
  final String phoneNumber;
  final String email;
  final String about;

  const User(
      {required this.about,
      required this.imagePath,
      required this.phoneNumber,
      required this.email,
      required this.name});

  User copy({
    String? imagePath,
    String? name,
    String? email,
    String? phoneNumber,
    String? about,
  }) =>
      User(
        imagePath: imagePath ?? this.imagePath,
        name: name ?? this.name,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        about: about ?? this.about,
      );

  static User fromJson(Map<String, dynamic> json) => User(
        imagePath: json['imagePath'],
        name: json['name'],
        email: json['email'],
        phoneNumber: json['phoneNumber'],
        about: json['about'],
      );

  Map<String, dynamic> toJson() => {
        'imagePath': imagePath,
        'name': name,
        'email': email,
        'phoneNumber': phoneNumber,
        'about': about,
      };
}
