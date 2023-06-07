import '../database.dart';

class QuestionsUnexpiredRandomTable
    extends SupabaseTable<QuestionsUnexpiredRandomRow> {
  @override
  String get tableName => 'questions_unexpired_random';

  @override
  QuestionsUnexpiredRandomRow createRow(Map<String, dynamic> data) =>
      QuestionsUnexpiredRandomRow(data);
}

class QuestionsUnexpiredRandomRow extends SupabaseDataRow {
  QuestionsUnexpiredRandomRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => QuestionsUnexpiredRandomTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  String? get question => getField<String>('question');
  set question(String? value) => setField<String>('question', value);

  String? get lang => getField<String>('lang');
  set lang(String? value) => setField<String>('lang', value);
}
