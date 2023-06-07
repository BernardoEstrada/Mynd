import '../database.dart';

class ReportsByLangTable extends SupabaseTable<ReportsByLangRow> {
  @override
  String get tableName => 'reports_by_lang';

  @override
  ReportsByLangRow createRow(Map<String, dynamic> data) =>
      ReportsByLangRow(data);
}

class ReportsByLangRow extends SupabaseDataRow {
  ReportsByLangRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ReportsByLangTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get iso6391 => getField<String>('iso_639_1');
  set iso6391(String? value) => setField<String>('iso_639_1', value);

  String? get value => getField<String>('value');
  set value(String? value) => setField<String>('value', value);

  String? get icon => getField<String>('icon');
  set icon(String? value) => setField<String>('icon', value);
}
