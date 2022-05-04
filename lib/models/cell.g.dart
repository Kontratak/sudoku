// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cell.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CellAdapter extends TypeAdapter<Cell> {
  @override
  final int typeId = 0;

  @override
  Cell read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cell(
      fields[0] as String?,
      fields[1] as Location,
      fields[2] as String,
      fields[3] as String,
      fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Cell obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.location)
      ..writeByte(2)
      ..write(obj.gameId)
      ..writeByte(3)
      ..write(obj.cellId)
      ..writeByte(4)
      ..write(obj.isModifiable);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CellAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
