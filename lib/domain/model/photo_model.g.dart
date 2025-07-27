// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PhotoAdapter extends TypeAdapter<Photo> {
  @override
  final int typeId = 3;

  @override
  Photo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Photo(
      id: fields[0] as int,
      url: fields[1] as String,
      photographer: fields[2] as String,
      src: fields[3] as Src,
    );
  }

  @override
  void write(BinaryWriter writer, Photo obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.photographer)
      ..writeByte(3)
      ..write(obj.src);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhotoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SrcAdapter extends TypeAdapter<Src> {
  @override
  final int typeId = 4;

  @override
  Src read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Src(
      original: fields[0] as String,
      large: fields[1] as String,
      medium: fields[2] as String,
      small: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Src obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.original)
      ..writeByte(1)
      ..write(obj.large)
      ..writeByte(2)
      ..write(obj.medium)
      ..writeByte(3)
      ..write(obj.small);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SrcAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Photo _$PhotoFromJson(Map<String, dynamic> json) => Photo(
      id: (json['id'] as num).toInt(),
      url: json['url'] as String,
      photographer: json['photographer'] as String,
      src: Src.fromJson(json['src'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'photographer': instance.photographer,
      'src': instance.src,
    };

Src _$SrcFromJson(Map<String, dynamic> json) => Src(
      original: json['original'] as String,
      large: json['large'] as String,
      medium: json['medium'] as String,
      small: json['small'] as String,
    );

Map<String, dynamic> _$SrcToJson(Src instance) => <String, dynamic>{
      'original': instance.original,
      'large': instance.large,
      'medium': instance.medium,
      'small': instance.small,
    };
