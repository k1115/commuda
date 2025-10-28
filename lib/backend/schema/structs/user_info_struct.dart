// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserInfoStruct extends BaseStruct {
  UserInfoStruct({
    int? id,
    String? name,
    String? photo,
    String? phone,
    List<int>? notification,
    List<int>? threadBookmarkId,
    List<int>? communityBookmarkId,
    int? point,
  })  : _id = id,
        _name = name,
        _photo = photo,
        _phone = phone,
        _notification = notification,
        _threadBookmarkId = threadBookmarkId,
        _communityBookmarkId = communityBookmarkId,
        _point = point;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  set photo(String? val) => _photo = val;

  bool hasPhoto() => _photo != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  set phone(String? val) => _phone = val;

  bool hasPhone() => _phone != null;

  // "notification" field.
  List<int>? _notification;
  List<int> get notification => _notification ?? const [];
  set notification(List<int>? val) => _notification = val;

  void updateNotification(Function(List<int>) updateFn) {
    updateFn(_notification ??= []);
  }

  bool hasNotification() => _notification != null;

  // "threadBookmarkId" field.
  List<int>? _threadBookmarkId;
  List<int> get threadBookmarkId => _threadBookmarkId ?? const [];
  set threadBookmarkId(List<int>? val) => _threadBookmarkId = val;

  void updateThreadBookmarkId(Function(List<int>) updateFn) {
    updateFn(_threadBookmarkId ??= []);
  }

  bool hasThreadBookmarkId() => _threadBookmarkId != null;

  // "communityBookmarkId" field.
  List<int>? _communityBookmarkId;
  List<int> get communityBookmarkId => _communityBookmarkId ?? const [];
  set communityBookmarkId(List<int>? val) => _communityBookmarkId = val;

  void updateCommunityBookmarkId(Function(List<int>) updateFn) {
    updateFn(_communityBookmarkId ??= []);
  }

  bool hasCommunityBookmarkId() => _communityBookmarkId != null;

  // "point" field.
  int? _point;
  int get point => _point ?? 0;
  set point(int? val) => _point = val;

  void incrementPoint(int amount) => point = point + amount;

  bool hasPoint() => _point != null;

  static UserInfoStruct fromMap(Map<String, dynamic> data) => UserInfoStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        photo: data['photo'] as String?,
        phone: data['phone'] as String?,
        notification: getDataList(data['notification']),
        threadBookmarkId: getDataList(data['threadBookmarkId']),
        communityBookmarkId: getDataList(data['communityBookmarkId']),
        point: castToType<int>(data['point']),
      );

  static UserInfoStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserInfoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'photo': _photo,
        'phone': _phone,
        'notification': _notification,
        'threadBookmarkId': _threadBookmarkId,
        'communityBookmarkId': _communityBookmarkId,
        'point': _point,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'photo': serializeParam(
          _photo,
          ParamType.String,
        ),
        'phone': serializeParam(
          _phone,
          ParamType.String,
        ),
        'notification': serializeParam(
          _notification,
          ParamType.int,
          isList: true,
        ),
        'threadBookmarkId': serializeParam(
          _threadBookmarkId,
          ParamType.int,
          isList: true,
        ),
        'communityBookmarkId': serializeParam(
          _communityBookmarkId,
          ParamType.int,
          isList: true,
        ),
        'point': serializeParam(
          _point,
          ParamType.int,
        ),
      }.withoutNulls;

  static UserInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserInfoStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        photo: deserializeParam(
          data['photo'],
          ParamType.String,
          false,
        ),
        phone: deserializeParam(
          data['phone'],
          ParamType.String,
          false,
        ),
        notification: deserializeParam<int>(
          data['notification'],
          ParamType.int,
          true,
        ),
        threadBookmarkId: deserializeParam<int>(
          data['threadBookmarkId'],
          ParamType.int,
          true,
        ),
        communityBookmarkId: deserializeParam<int>(
          data['communityBookmarkId'],
          ParamType.int,
          true,
        ),
        point: deserializeParam(
          data['point'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'UserInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserInfoStruct &&
        id == other.id &&
        name == other.name &&
        photo == other.photo &&
        phone == other.phone &&
        listEquality.equals(notification, other.notification) &&
        listEquality.equals(threadBookmarkId, other.threadBookmarkId) &&
        listEquality.equals(communityBookmarkId, other.communityBookmarkId) &&
        point == other.point;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        name,
        photo,
        phone,
        notification,
        threadBookmarkId,
        communityBookmarkId,
        point
      ]);
}

UserInfoStruct createUserInfoStruct({
  int? id,
  String? name,
  String? photo,
  String? phone,
  int? point,
}) =>
    UserInfoStruct(
      id: id,
      name: name,
      photo: photo,
      phone: phone,
      point: point,
    );
