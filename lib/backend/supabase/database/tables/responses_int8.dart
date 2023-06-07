import '../database.dart';

class ResponsesInt8Table extends SupabaseTable<ResponsesInt8Row> {
  @override
  String get tableName => 'responses_int8';

  @override
  ResponsesInt8Row createRow(Map<String, dynamic> data) =>
      ResponsesInt8Row(data);
}

class ResponsesInt8Row extends SupabaseDataRow {
  ResponsesInt8Row(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ResponsesInt8Table();

  String get questionId => getField<String>('question_id')!;
  set questionId(String value) => setField<String>('question_id', value);

  int? get value => getField<int>('value');
  set value(int? value) => setField<int>('value', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get reportId => getField<String>('report_id')!;
  set reportId(String value) => setField<String>('report_id', value);
}
