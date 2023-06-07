import '../database.dart';

class QuestionReportsTable extends SupabaseTable<QuestionReportsRow> {
  @override
  String get tableName => 'question_reports';

  @override
  QuestionReportsRow createRow(Map<String, dynamic> data) =>
      QuestionReportsRow(data);
}

class QuestionReportsRow extends SupabaseDataRow {
  QuestionReportsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => QuestionReportsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get reportedBy => getField<String>('reported_by')!;
  set reportedBy(String value) => setField<String>('reported_by', value);

  String get reportType => getField<String>('report_type')!;
  set reportType(String value) => setField<String>('report_type', value);

  String get questionId => getField<String>('question_id')!;
  set questionId(String value) => setField<String>('question_id', value);
}
