import 'dart:convert';

class EmailAddres {
  final String? value;

  const EmailAddres({this.value}) : assert(value != null);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EmailAddres && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'value': value,
    };
  }

  factory EmailAddres.fromMap(Map<String, dynamic> map) {
    return EmailAddres(
      value: map['value'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EmailAddres.fromJson(String source) =>
      EmailAddres.fromMap(json.decode(source));

  @override
  String toString() => 'EmailAddres(value: $value)';
}
