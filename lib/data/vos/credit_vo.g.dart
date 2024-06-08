// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CreditVOAdapter extends TypeAdapter<CreditVO> {
  @override
  final int typeId = 8;

  @override
  CreditVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CreditVO(
      adult: fields[0] as bool?,
      gender: fields[1] as int?,
      id: fields[2] as int?,
      knowForDepartment: fields[3] as String?,
      name: fields[4] as String?,
      originalName: fields[5] as String?,
      popularity: fields[6] as double?,
      profilePath: fields[7] as String?,
      castId: fields[8] as int?,
      character: fields[9] as String?,
      creditId: fields[10] as String?,
      order: fields[11] as int?,
      department: fields[12] as String?,
      job: fields[13] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CreditVO obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.gender)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.knowForDepartment)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.originalName)
      ..writeByte(6)
      ..write(obj.popularity)
      ..writeByte(7)
      ..write(obj.profilePath)
      ..writeByte(8)
      ..write(obj.castId)
      ..writeByte(9)
      ..write(obj.character)
      ..writeByte(10)
      ..write(obj.creditId)
      ..writeByte(11)
      ..write(obj.order)
      ..writeByte(12)
      ..write(obj.department)
      ..writeByte(13)
      ..write(obj.job);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreditVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditVO _$CreditVOFromJson(Map<String, dynamic> json) => CreditVO(
      adult: json['adult'] as bool?,
      gender: (json['gender'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      knowForDepartment: json['known_for_department'] as String?,
      name: json['name'] as String?,
      originalName: json['original_name'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      profilePath: json['profile_path'] as String?,
      castId: (json['cast_id'] as num?)?.toInt(),
      character: json['character'] as String?,
      creditId: json['credit_id'] as String?,
      order: (json['order'] as num?)?.toInt(),
      department: json['department'] as String?,
      job: json['job'] as String?,
    );

Map<String, dynamic> _$CreditVOToJson(CreditVO instance) => <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.knowForDepartment,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
      'cast_id': instance.castId,
      'character': instance.character,
      'credit_id': instance.creditId,
      'order': instance.order,
      'department': instance.department,
      'job': instance.job,
    };
