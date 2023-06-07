import '../database.dart';

class StatesTable extends SupabaseTable<StatesRow> {
  @override
  String get tableName => 'states';

  @override
  StatesRow createRow(Map<String, dynamic> data) => StatesRow(data);
}

class StatesRow extends SupabaseDataRow {
  StatesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => StatesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get countryId => getField<int>('country_id')!;
  set countryId(int value) => setField<int>('country_id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get stateCode => getField<String>('state_code');
  set stateCode(String? value) => setField<String>('state_code', value);
}
