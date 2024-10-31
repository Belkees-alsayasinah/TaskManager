class TodoResponse {
  final int id;
  final String todo;
  final bool completed;
  final int userId;

  TodoResponse({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  factory TodoResponse.fromJson(Map<String, dynamic> json) {
    return TodoResponse(
      id: json['id'],
      todo: json['todo'],
      completed: json['completed'],
      userId: json['userId'],
    );
  }
}
