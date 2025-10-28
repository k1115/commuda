// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AuthProviderStruct extends BaseStruct {
  AuthProviderStruct({
    String? provider,
  }) : _provider = provider;

  // "provider" field.
  String? _provider;
  String get provider => _provider ?? '';
  set provider(String? val) => _provider = val;

  bool hasProvider() => _provider != null;

  static AuthProviderStruct fromMap(Map<String, dynamic> data) =>
      AuthProviderStruct(
        provider: data['provider'] as String?,
      );

  static AuthProviderStruct? maybeFromMap(dynamic data) => data is Map
      ? AuthProviderStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'provider': _provider,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'provider': serializeParam(
          _provider,
          ParamType.String,
        ),
      }.withoutNulls;

  static AuthProviderStruct fromSerializableMap(Map<String, dynamic> data) =>
      AuthProviderStruct(
        provider: deserializeParam(
          data['provider'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AuthProviderStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AuthProviderStruct && provider == other.provider;
  }

  @override
  int get hashCode => const ListEquality().hash([provider]);
}

AuthProviderStruct createAuthProviderStruct({
  String? provider,
}) =>
    AuthProviderStruct(
      provider: provider,
    );
