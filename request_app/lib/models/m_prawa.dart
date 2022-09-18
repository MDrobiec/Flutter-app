class MPrawa {
  final int idUser;
  final String namePrivilages;
  final int idSPrivilages;

  MPrawa({
    required this.idSPrivilages,
    required this.idUser,
    required this.namePrivilages,
  });

  factory MPrawa.fromJson(Map<String, dynamic> json) => MPrawa(
      idSPrivilages: json["id_sprivilages"],
      idUser: json["id_user"],
      namePrivilages: json["name_privilages"]);
}
