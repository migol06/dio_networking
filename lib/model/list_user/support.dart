import 'dart:convert';

class Support {
  final String url;
  final String text;
  Support({
    required this.url,
    required this.text,
  });

  Support copyWith({
    String? url,
    String? text,
  }) {
    return Support(
      url: url ?? this.url,
      text: text ?? this.text,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'text': text,
    };
  }

  factory Support.fromMap(Map<String, dynamic> map) {
    return Support(
      url: map['url'] as String,
      text: map['text'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Support.fromJson(String source) => Support.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Support(url: $url, text: $text)';

  @override
  bool operator ==(covariant Support other) {
    if (identical(this, other)) return true;
  
    return 
      other.url == url &&
      other.text == text;
  }

  @override
  int get hashCode => url.hashCode ^ text.hashCode;
}