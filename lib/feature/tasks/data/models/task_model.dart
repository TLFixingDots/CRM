import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
class Task with _$Task {
  const factory Task({
    @Default(0) int id,
    @Default('') String title,
    @Default('') String description,
    @Default('') String dueDate,
    @Default('Pending') String status, // Pending, In Progress, Completed, Overdue
    @Default('Medium') String priority, // Low, Medium, High
    @Default('') String relatedLeadName,
    @Default('') String createdAt,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
