// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snacks_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SnacksVOAdapter extends TypeAdapter<SnacksVO> {
  @override
  final int typeId = 11;

  @override
  SnacksVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SnacksVO(
      fields[0] as int?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as double?,
      fields[4] as int?,
      fields[5] as String?,
      fields[6] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, SnacksVO obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.categoryId)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SnacksVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SnacksVO _$SnacksVOFromJson(Map<String, dynamic> json) => SnacksVO(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['description'] as String?,
      (json['price'] as num?)?.toDouble(),
      (json['category_id'] as num?)?.toInt(),
      json['image'] as String?,
      (json['quantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SnacksVOToJson(SnacksVO instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'category_id': instance.categoryId,
      'image': instance.image,
      'quantity': instance.quantity,
    };
