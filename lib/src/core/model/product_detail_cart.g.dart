// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_cart.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductDetailCartAdapter extends TypeAdapter<ProductDetailCart> {
  @override
  final int typeId = 0;

  @override
  ProductDetailCart read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductDetailCart(
      productID: fields[0] as int,
      productQuantity: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ProductDetailCart obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.productID)
      ..writeByte(1)
      ..write(obj.productQuantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductDetailCartAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
