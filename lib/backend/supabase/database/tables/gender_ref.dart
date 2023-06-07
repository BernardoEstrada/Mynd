import '../database.dart';

class GenderRefTable extends SupabaseTable<GenderRefRow> {
  @override
  String get tableName => 'gender_ref';

  @override
  GenderRefRow createRow(Map<String, dynamic> data) => GenderRefRow(data);
}

class GenderRefRow extends SupabaseDataRow {
  GenderRefRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GenderRefTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  dynamic get value => getField<dynamic>('value')!;
  set value(dynamic value) => setField<dynamic>('value', value);
}
