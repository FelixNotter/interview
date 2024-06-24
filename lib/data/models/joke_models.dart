import 'package:flutter/foundation.dart';

class Joke {
  final String category;
  final String type;
  final String joke_text;
  final Map<String,dynamic> flags;

  Joke({
    required this.category,
    required this.type,
    required this.joke_text,
    required this.flags,
  });

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      category: json['category'],
      type: json['type'],
      joke_text: json['joke'],
      flags: json['flags'],
    );
  }
}
