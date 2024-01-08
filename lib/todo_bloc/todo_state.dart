part of 'todo_bloc.dart';
enum TodoStatus { initial, loading, success, error }
class TodoState extends Equatable {
  final List<Todo> todos;
  final TodoStatus status;
  final Brightness brightness;
  const TodoState({
    this.todos = const <Todo>[],
    this.status = TodoStatus.initial,
    this.brightness = Brightness.light
  });
  TodoState copyWith({
    TodoStatus? status,
    List<Todo>? todos,
    Brightness? brightness
  }) {
    return TodoState(
      todos: todos ?? this.todos,
      status: status ?? this.status,
      brightness: brightness ?? this.brightness,
    );
  }
  @override
  factory TodoState.fromJson(Map<String, dynamic> json) {
    try {
      var listOfTodos = (json['todo'] as List<dynamic>)
          .map((e) => Todo.fromJson(e as Map<String, dynamic>))
          .toList();
      return TodoState(
          todos: listOfTodos,
          status: TodoStatus.values.firstWhere(
                  (element) => element.name.toString() == json['status']),
          brightness: json["brightness"] == Brightness.light.toString() ? Brightness.light : Brightness.dark
      );
    } catch (e) {
      rethrow;
    }
  }
  Map<String, dynamic> toJson() {
    return {
      'todo': todos,
      'status': status.name,
      "brightness": brightness.toString()
    };
  }
  @override
  List<Object?> get props => [todos, status];
}