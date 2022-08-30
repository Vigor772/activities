// This is a Dart class,
// not a Flutter widget.
import 'dart:convert';

class ItemModel {
  final String title;
  final String description;
  final String date;
  final bool completed;
  ItemModel({
    required this.title,
    required this.description,
    required this.date,
    this.completed = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'date': date,
      'completed': completed,
    };
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      title: json['title'],
      description: json['description'] ?? '',
      date: json['date'] ?? '',
      completed: json['completed'] ?? false,
    );
  }
}
