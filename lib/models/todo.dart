class Todo {
  late String title;
  late String image;
  late bool isChecked;
  late dynamic createdAt;
  String? id;

  Todo(
      {required this.title,
      required this.isChecked,
      required this.image,
      required this.createdAt,
      this.id});
}
