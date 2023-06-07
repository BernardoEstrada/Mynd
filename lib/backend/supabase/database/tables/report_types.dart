import '../database.dart';

class ReportTypesTable extends SupabaseTable<ReportTypesRow> {
  @override
  String get tableName => 'report_types';

  @override
  ReportTypesRow createRow(Map<String, dynamic> data) => ReportTypesRow(data);
}

class ReportTypesRow extends SupabaseDataRow {
  ReportTypesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ReportTypesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  dynamic get value => getField<dynamic>('value')!;
  set value(dynamic value) => setField<dynamic>('value', value);

  String? get icon => getField<String>('icon');
  set icon(String? value) => setField<String>('icon', value);
}
