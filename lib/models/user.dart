class User {
  final String name;
  final String email;
  final String phone;
  final String company;
  final String city;
  final String avatar;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.company,
    required this.city,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      company: json["company"]["name"],
      city: json["address"]["city"],
      avatar: "https://i.pravatar.cc/150?img=${json["email"]}",
    );
  }
}