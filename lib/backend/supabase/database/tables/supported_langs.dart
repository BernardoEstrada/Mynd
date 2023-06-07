import '../database.dart';

class SupportedLangsTable extends SupabaseTable<SupportedLangsRow> {
  @override
  String get tableName => 'supported_langs';

  @override
  SupportedLangsRow createRow(Map<String, dynamic> data) =>
      SupportedLangsRow(data);
}

class SupportedLangsRow extends SupabaseDataRow {
  SupportedLangsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SupportedLangsTable();

  String get iso6391 => getField<String>('iso_639_1')!;
  set iso6391(String value) => setField<String>('iso_639_1', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String get localizedName => getField<String>('localized_name')!;
  set localizedName(String value) => setField<String>('localized_name', value);
}
