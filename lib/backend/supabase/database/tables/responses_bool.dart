import '../database.dart';

class ResponsesBoolTable extends SupabaseTable<ResponsesBoolRow> {
  @override
  String get tableName => 'responses_bool';

  @override
  ResponsesBoolRow createRow(Map<String, dynamic> data) =>
      ResponsesBoolRow(data);
}

class ResponsesBoolRow extends SupabaseDataRow {
  ResponsesBoolRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ResponsesBoolTable();

  String get questionId => getField<String>('question_id')!;
  set questionId(String value) => setField<String>('question_id', value);

  bool? get value => getField<bool>('value');
  set value(bool? value) => setField<bool>('value', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get reportId => getField<String>('report_id')!;
  set reportId(String value) => setField<String>('report_id', value);
}
