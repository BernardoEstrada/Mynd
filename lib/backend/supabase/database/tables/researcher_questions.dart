import '../database.dart';

class ResearcherQuestionsTable extends SupabaseTable<ResearcherQuestionsRow> {
  @override
  String get tableName => 'researcher_questions';

  @override
  ResearcherQuestionsRow createRow(Map<String, dynamic> data) =>
      ResearcherQuestionsRow(data);
}

class ResearcherQuestionsRow extends SupabaseDataRow {
  ResearcherQuestionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ResearcherQuestionsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get question => getField<String>('question');
  set question(String? value) => setField<String>('question', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime? get expiresAt => getField<DateTime>('expires_at');
  set expiresAt(DateTime? value) => setField<DateTime>('expires_at', value);

  String get questionResponseType =>
      getField<String>('question_response_type')!;
  set questionResponseType(String value) =>
      setField<String>('question_response_type', value);

  String? get createdBy => getField<String>('created_by');
  set createdBy(String? value) => setField<String>('created_by', value);
}
