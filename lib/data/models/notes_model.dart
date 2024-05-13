class NotesModel {
  final String categoryName;
  final String title;
  final String subtitle;
  final String uuid;

  NotesModel({
    required this.title,
    required this.categoryName,
    required this.subtitle,
    required this.uuid,
  });

  factory NotesModel.fromJson(Map<String, dynamic> json) {
    return NotesModel(
      title: json['title'] as String? ?? '',
      categoryName: json['categoryName'] as String? ?? '',
      subtitle: json['subtitle'] as String? ?? '',
      uuid: json['uuid'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'category_name': categoryName,
      'subtitle': subtitle,
      'uuid': uuid,
    };
  }
  Map<String, dynamic> toJsonForUpdate() {
    return {
      'title': title,
      'subtitle': subtitle,
    };
  }

  static NotesModel initial() {
    return NotesModel(
      title: '',
      categoryName: '',
      subtitle: '',
      uuid: '',
    );
  }

  NotesModel copyWith({
    String? title,
    String? categoryName,
    String? subtitle,
    String? uuid,
  }) {
    return NotesModel(
      title: title ?? this.title,
      categoryName: categoryName ?? this.categoryName,
      subtitle: subtitle ?? this.subtitle,
      uuid: uuid ?? this.uuid,
    );
  }
}
