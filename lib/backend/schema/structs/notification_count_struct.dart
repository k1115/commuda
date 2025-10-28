// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationCountStruct extends BaseStruct {
  NotificationCountStruct({
    int? total,
  }) : _total = total;

  // "total" field.
  int? _total;
  int get total => _total ?? 0;
  set total(int? val) => _total = val;

  void incrementTotal(int amount) => total = total + amount;

  bool hasTotal() => _total != null;

  static NotificationCountStruct fromMap(Map<String, dynamic> data) =>
      NotificationCountStruct(
        total: castToType<int>(data['total']),
      );

  static NotificationCountStruct? maybeFromMap(dynamic data) => data is Map
      ? NotificationCountStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'total': _total,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'total': serializeParam(
          _total,
          ParamType.int,
        ),
      }.withoutNulls;

  static NotificationCountStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      NotificationCountStruct(
        total: deserializeParam(
          data['total'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'NotificationCountStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NotificationCountStruct && total == other.total;
  }

  @override
  int get hashCode => const ListEquality().hash([total]);
}

NotificationCountStruct createNotificationCountStruct({
  int? total,
}) =>
    NotificationCountStruct(
      total: total,
    );
