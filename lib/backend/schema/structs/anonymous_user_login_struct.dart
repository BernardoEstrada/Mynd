// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnonymousUserLoginStruct extends BaseStruct {
  AnonymousUserLoginStruct({
    String? email,
    String? pass,
  })  : _email = email,
        _pass = pass;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  // "pass" field.
  String? _pass;
  String get pass => _pass ?? '';
  set pass(String? val) => _pass = val;
  bool hasPass() => _pass != null;

  static AnonymousUserLoginStruct fromMap(Map<String, dynamic> data) =>
      AnonymousUserLoginStruct(
        email: data['email'] as String?,
        pass: data['pass'] as String?,
      );

  static AnonymousUserLoginStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? AnonymousUserLoginStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'email': _email,
        'pass': _pass,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'pass': serializeParam(
          _pass,
          ParamType.String,
        ),
      }.withoutNulls;

  static AnonymousUserLoginStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AnonymousUserLoginStruct(
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        pass: deserializeParam(
          data['pass'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AnonymousUserLoginStruct(${toMap()})';
}

AnonymousUserLoginStruct createAnonymousUserLoginStruct({
  String? email,
  String? pass,
}) =>
    AnonymousUserLoginStruct(
      email: email,
      pass: pass,
    );
