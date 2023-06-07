import '../database.dart';

class ResponseTypesTable extends SupabaseTable<ResponseTypesRow> {
  @override
  String get tableName => 'response_types';

  @override
  ResponseTypesRow createRow(Map<String, dynamic> data) =>
      ResponseTypesRow(data);
}

class ResponseTypesRow extends SupabaseDataRow {
  ResponseTypesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ResponseTypesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get type => getField<String>('type')!;
  set type(String value) => setField<String>('type', value);

  String get lang => getField<String>('lang')!;
  set lang(String value) => setField<String>('lang', value);

  String? get friendlyName => getField<String>('friendly_name');
  set friendlyName(String? value) => setField<String>('friendly_name', value);
}
