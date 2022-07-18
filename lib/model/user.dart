import 'dart:convert';

import 'data.dart';
import 'list_user/support.dart';

class User {
  final Data data;
  final Support support;
  User({
    required this.data,
    required this.support,
  });

  User copyWith({
    Data? data,
    Support? support,
  }) {
    return User(
      data: data ?? this.data,
      support: support ?? this.support,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data.toMap(),
      'support': support.toMap(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      data: Data.fromMap(map['data'] as Map<String, dynamic>),
      support: Support.fromMap(map['support'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(data: $data, support: $support)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.data == data && other.support == support;
  }

  @override
  int get hashCode => data.hashCode ^ support.hashCode;
}
