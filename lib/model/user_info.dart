import 'dart:convert';

class UserInfo {
  final String name;
  final String job;
  final String? id;
  final String? createdAt;
  UserInfo({
    required this.name,
    required this.job,
    this.id,
    this.createdAt,
  });

  UserInfo copyWith({
    String? name,
    String? job,
    String? id,
    String? createdAt,
  }) {
    return UserInfo(
      name: name ?? this.name,
      job: job ?? this.job,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'job': job,
      'id': id,
      'createdAt': createdAt,
    };
  }

  factory UserInfo.fromMap(Map<String, dynamic> map) {
    return UserInfo(
      name: map['name'] as String,
      job: map['job'] as String,
      id: map['id'] as String,
      createdAt: map['createdAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInfo.fromJson(String source) =>
      UserInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserInfo(name: $name, job: $job, id: $id, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant UserInfo other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.job == job &&
        other.id == id &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return name.hashCode ^ job.hashCode ^ id.hashCode ^ createdAt.hashCode;
  }
}
