class Todo {
  final String title;
  final String image;
  final bool isChecked;
  final dynamic createdAt;
  final String? id;

  const Todo({
    required this.title,
    required this.image,
    required this.isChecked,
    required this.createdAt,
    this.id,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Todo &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          image == other.image &&
          isChecked == other.isChecked &&
          createdAt == other.createdAt &&
          id == other.id);

  @override
  int get hashCode =>
      title.hashCode ^
      image.hashCode ^
      isChecked.hashCode ^
      createdAt.hashCode ^
      id.hashCode;

  @override
  String toString() {
    return 'Todo{' +
        ' title: $title,' +
        ' image: $image,' +
        ' isChecked: $isChecked,' +
        ' createdAt: $createdAt,' +
        ' id: $id,' +
        '}';
  }

  Todo copyWith({
    String? title,
    String? image,
    bool? isChecked,
    dynamic? createdAt,
    String? id,
  }) {
    return Todo(
      title: title ?? this.title,
      image: image ?? this.image,
      isChecked: isChecked ?? this.isChecked,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'image': image,
      'isChecked': isChecked,
      'createdAt': createdAt,
      'id': id,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      title: map['title'] as String,
      image: map['image'] as String,
      isChecked: map['isChecked'] as bool,
      createdAt: map['createdAt'] as dynamic,
      id: map['id'] as String,
    );
  }
}
