extension JsonParsing on dynamic {
  String toJson() => jsonEncode(this);

  Map<String, dynamic> fromJson() => jsonDecode(this) as Map<String, dynamic>;
}
