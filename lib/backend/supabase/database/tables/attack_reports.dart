import '../database.dart';

class AttackReportsTable extends SupabaseTable<AttackReportsRow> {
  @override
  String get tableName => 'attack_reports';

  @override
  AttackReportsRow createRow(Map<String, dynamic> data) =>
      AttackReportsRow(data);
}

class AttackReportsRow extends SupabaseDataRow {
  AttackReportsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AttackReportsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int get rate => getField<int>('rate')!;
  set rate(int value) => setField<int>('rate', value);

  bool get accompanied => getField<bool>('accompanied')!;
  set accompanied(bool value) => setField<bool>('accompanied', value);

  bool get identifySource => getField<bool>('identify_source')!;
  set identifySource(bool value) => setField<bool>('identify_source', value);

  bool get getAway => getField<bool>('get_away')!;
  set getAway(bool value) => setField<bool>('get_away', value);

  bool get canAct => getField<bool>('can_act')!;
  set canAct(bool value) => setField<bool>('can_act', value);

  bool get relatedToPeople => getField<bool>('related_to_people')!;
  set relatedToPeople(bool value) => setField<bool>('related_to_people', value);

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  bool get safe => getField<bool>('safe')!;
  set safe(bool value) => setField<bool>('safe', value);

  bool get deleted => getField<bool>('deleted')!;
  set deleted(bool value) => setField<bool>('deleted', value);
}
