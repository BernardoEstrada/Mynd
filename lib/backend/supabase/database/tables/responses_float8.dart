import '../database.dart';

class ResponsesFloat8Table extends SupabaseTable<ResponsesFloat8Row> {
  @override
  String get tableName => 'responses_float8';

  @override
  ResponsesFloat8Row createRow(Map<String, dynamic> data) =>
      ResponsesFloat8Row(data);
}

class ResponsesFloat8Row extends SupabaseDataRow {
  ResponsesFloat8Row(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ResponsesFloat8Table();

  String get questionId => getField<String>('question_id')!;
  set questionId(String value) => setField<String>('question_id', value);

  double? get value => getField<double>('value');
  set value(double? value) => setField<double>('value', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get reportId => getField<String>('report_id')!;
  set reportId(String value) => setField<String>('report_id', value);
}
