class MMyUser {
  final String nameUser;
  final String surname;
  final String email;
  final String phone;

  MMyUser({
    required this.nameUser,
    required this.surname,
    required this.email,
    required this.phone,
  });

  factory MMyUser.fromJson(Map<String, dynamic> json) => MMyUser(
      nameUser: json["name_user"],
      surname: json["surname"],
      email: json["email"],
      phone: json["phone"]);
}
