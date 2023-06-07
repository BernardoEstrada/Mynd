import '../database.dart';

class AttackReportsSummaryTable extends SupabaseTable<AttackReportsSummaryRow> {
  @override
  String get tableName => 'attack_reports_summary';

  @override
  AttackReportsSummaryRow createRow(Map<String, dynamic> data) =>
      AttackReportsSummaryRow(data);
}

class AttackReportsSummaryRow extends SupabaseDataRow {
  AttackReportsSummaryRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AttackReportsSummaryTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  DateTime? get startTime => getField<DateTime>('start_time');
  set startTime(DateTime? value) => setField<DateTime>('start_time', value);

  String? get avgInterval => getField<String>('avg_interval');
  set avgInterval(String? value) => setField<String>('avg_interval', value);

  double? get rate => getField<double>('rate');
  set rate(double? value) => setField<double>('rate', value);

  int? get accompanied => getField<int>('accompanied');
  set accompanied(int? value) => setField<int>('accompanied', value);

  int? get identifySource => getField<int>('identify_source');
  set identifySource(int? value) => setField<int>('identify_source', value);

  int? get getAway => getField<int>('get_away');
  set getAway(int? value) => setField<int>('get_away', value);

  int? get canAct => getField<int>('can_act');
  set canAct(int? value) => setField<int>('can_act', value);

  int? get relatedToPeople => getField<int>('related_to_people');
  set relatedToPeople(int? value) => setField<int>('related_to_people', value);

  int? get safe => getField<int>('safe');
  set safe(int? value) => setField<int>('safe', value);

  int? get tookNotes => getField<int>('took_notes');
  set tookNotes(int? value) => setField<int>('took_notes', value);

  int? get total => getField<int>('total');
  set total(int? value) => setField<int>('total', value);
}
