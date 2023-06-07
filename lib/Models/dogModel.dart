// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DogModel {
  final int id;
  final int lifeExpectancy;
  final String origin;
  final String name;
  final String type;
  final String? imageUrl;

  DogModel(
      {required this.id,
      required this.lifeExpectancy,
      required this.origin,
      required this.name,
      required this.type,
      this.imageUrl});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'lifeExpectancy': lifeExpectancy,
      'origin': origin,
      'name': name,
      'type': type,
      'imageUrl': imageUrl,
    };
  }

  factory DogModel.fromMap(Map<String, dynamic> map) {
    return DogModel(
      id: map['id'] as int,
      lifeExpectancy: map['lifeExpectancy'] as int,
      origin: map['origin'] as String,
      name: map['name'] as String,
      type: map['type'] as String,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DogModel.fromJson(String source) =>
      DogModel.fromMap(json.decode(source) as Map<String, dynamic>);

  DogModel copyWith({
    int? id,
    int? lifeExpectancy,
    String? origin,
    String? name,
    String? type,
    String? imageUrl,
  }) {
    return DogModel(
      id: id ?? this.id,
      lifeExpectancy: lifeExpectancy ?? this.lifeExpectancy,
      origin: origin ?? this.origin,
      name: name ?? this.name,
      type: type ?? this.type,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
