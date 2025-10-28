// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoryInfoStruct extends BaseStruct {
  CategoryInfoStruct({
    int? id,
    String? category,
  })  : _id = id,
        _category = category;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;

  bool hasCategory() => _category != null;

  static CategoryInfoStruct fromMap(Map<String, dynamic> data) =>
      CategoryInfoStruct(
        id: castToType<int>(data['id']),
        category: data['category'] as String?,
      );

  static CategoryInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? CategoryInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'category': _category,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
      }.withoutNulls;

  static CategoryInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      CategoryInfoStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CategoryInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CategoryInfoStruct &&
        id == other.id &&
        category == other.category;
  }

  @override
  int get hashCode => const ListEquality().hash([id, category]);
}

CategoryInfoStruct createCategoryInfoStruct({
  int? id,
  String? category,
}) =>
    CategoryInfoStruct(
      id: id,
      category: category,
    );
