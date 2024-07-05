class Task{
  String? title, description, dateCreated;
  bool isCompleted;
  int? index;

  Task({
    this.title,
    this.description,
    this.dateCreated,
    this.isCompleted = false,
    this.index,
  });
}