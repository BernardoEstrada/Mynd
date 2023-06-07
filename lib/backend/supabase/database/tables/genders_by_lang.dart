import '../database.dart';

class GendersByLangTable extends SupabaseTable<GendersByLangRow> {
  @override
  String get tableName => 'genders_by_lang';

  @override
  GendersByLangRow createRow(Map<String, dynamic> data) =>
      GendersByLangRow(data);
}

class GendersByLangRow extends SupabaseDataRow {
  GendersByLangRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GendersByLangTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get iso6391 => getField<String>('iso_639_1');
  set iso6391(String? value) => setField<String>('iso_639_1', value);

  String? get value => getField<String>('value');
  set value(String? value) => setField<String>('value', value);
}
