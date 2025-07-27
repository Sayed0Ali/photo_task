import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo_model.g.dart';

@HiveType(typeId: 3) // تأكد إن الرقم ما يتكرر
@JsonSerializable()
class Photo extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String url;

  @HiveField(2)
  final String photographer;

  @HiveField(3)
  @JsonKey(name: 'src')
  final Src src;

  Photo({
    required this.id,
    required this.url,
    required this.photographer,
    required this.src,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}

@HiveType(typeId: 4)
@JsonSerializable()
class Src extends HiveObject {
  @HiveField(0)
  final String original;

  @HiveField(1)
  final String large;

  @HiveField(2)
  final String medium;

  @HiveField(3)
  final String small;

  Src({
    required this.original,
    required this.large,
    required this.medium,
    required this.small,
  });

  factory Src.fromJson(Map<String, dynamic> json) => _$SrcFromJson(json);
  Map<String, dynamic> toJson() => _$SrcToJson(this);
}
