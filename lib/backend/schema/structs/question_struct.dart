// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionStruct extends BaseStruct {
  QuestionStruct({
    String? id,
    String? question,
    String? type,
  })  : _id = id,
        _question = question,
        _type = type;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  set question(String? val) => _question = val;
  bool hasQuestion() => _question != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  static QuestionStruct fromMap(Map<String, dynamic> data) => QuestionStruct(
        id: data['id'] as String?,
        question: data['question'] as String?,
        type: data['type'] as String?,
      );

  static QuestionStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? QuestionStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'question': _question,
        'type': _type,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'question': serializeParam(
          _question,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
      }.withoutNulls;

  static QuestionStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuestionStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        question: deserializeParam(
          data['question'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'QuestionStruct(${toMap()})';
}

QuestionStruct createQuestionStruct({
  String? id,
  String? question,
  String? type,
}) =>
    QuestionStruct(
      id: id,
      question: question,
      type: type,
    );
