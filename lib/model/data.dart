import 'dart:convert';

class Data {
  final int id;
  final String email;
  final String firstname;
  final String lastname;
  final String avatar;
  Data({
    required this.id,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.avatar,
  });

  Data copyWith({
    int? id,
    String? email,
    String? firstname,
    String? lastname,
    String? avatar,
  }) {
    return Data(
      id: id ?? this.id,
      email: email ?? this.email,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'first_name': firstname,
      'last_name': lastname,
      'avatar': avatar,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      id: map['id'].toInt() as int,
      email: map['email'] as String,
      firstname: map['first_name'] as String,
      lastname: map['last_name'] as String,
      avatar: map['avatar'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) =>
      Data.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Data(id: $id, email: $email, first_name: $firstname, last_name: $lastname, avatar: $avatar)';
  }

  @override
  bool operator ==(covariant Data other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.email == email &&
        other.firstname == firstname &&
        other.lastname == lastname &&
        other.avatar == avatar;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        firstname.hashCode ^
        lastname.hashCode ^
        avatar.hashCode;
  }
}
