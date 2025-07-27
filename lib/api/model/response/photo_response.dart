import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../domain/model/photo_model.dart';
part 'photo_response.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class PhotoResponse extends HiveObject {
  @HiveField(0)
  final int page;

  @HiveField(1)
  @JsonKey(name: 'per_page')
  final int perPage;

  @HiveField(2)
  final List<Photo> photos;

  PhotoResponse({
    required this.page,
    required this.perPage,
    required this.photos,
  });

  factory PhotoResponse.fromJson(Map<String, dynamic> json) =>
      _$PhotoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoResponseToJson(this);
}
