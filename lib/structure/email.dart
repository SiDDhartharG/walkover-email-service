final EmailTableName = "emails";

class EmailStructure {
  static final List<String> values = [
    id,
    toEmail,
    fromEmail,
    body,
  ];
  static final String id = "_id";
  static final String toEmail = "toEmail";
  static final String fromEmail = "fromEmail";
  static final String body = "body";
  static final String createdAt = "createdAt";
}

class Email {
  final int? id;
  final String toEmail;
  final String fromEmail;
  final String body;
  final DateTime createdAt;

  const Email(
      {this.id,
      required this.toEmail,
      required this.fromEmail,
      required this.body,
      required this.createdAt});

  static Email fromJson(Map<String, Object?> json) => Email(
        id: json[EmailStructure.id] as int?,
        fromEmail: json[EmailStructure.fromEmail] as String,
        toEmail: json[EmailStructure.toEmail] as String,
        body: json[EmailStructure.body] as String,
        createdAt: DateTime.parse(json[EmailStructure.createdAt] as String),
      );

  Email copy({
    int? id,
    String? toEmail,
    String? fromEmail,
    String? body,
    DateTime? createdAt,
  }) =>
      Email(
        id: id ?? this.id,
        toEmail: toEmail ?? this.toEmail,
        fromEmail: fromEmail ?? this.fromEmail,
        body: body ?? this.body,
        createdAt: createdAt ?? this.createdAt,
      );

  Map<String, Object?> toJson() => {
        EmailStructure.id: id,
        EmailStructure.toEmail: toEmail,
        EmailStructure.fromEmail: fromEmail,
        EmailStructure.body: body,
        EmailStructure.createdAt: createdAt.toIso8601String(),
      };
}
