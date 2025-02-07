class UserProfile {
  final String name;
  final String email;

  UserProfile({
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }

  static UserProfile fromMap(Map<String, dynamic> map) {
    return UserProfile(
      name: map['name'],
      email: map['email'],
    );
  }
}
