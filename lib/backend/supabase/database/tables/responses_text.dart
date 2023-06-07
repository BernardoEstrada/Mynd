import '../database.dart';

class ResponsesTextTable extends SupabaseTable<ResponsesTextRow> {
  @override
  String get tableName => 'responses_text';

  @override
  ResponsesTextRow createRow(Map<String, dynamic> data) =>
      ResponsesTextRow(data);
}

class ResponsesTextRow extends SupabaseDataRow {
  ResponsesTextRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ResponsesTextTable();

  String get questionId => getField<String>('question_id')!;
  set questionId(String value) => setField<String>('question_id', value);

  String? get value => getField<String>('value');
  set value(String? value) => setField<String>('value', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get reportId => getField<String>('report_id')!;
  set reportId(String value) => setField<String>('report_id', value);
}
