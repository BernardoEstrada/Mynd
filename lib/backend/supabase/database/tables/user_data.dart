import '../database.dart';

class UserDataTable extends SupabaseTable<UserDataRow> {
  @override
  String get tableName => 'user_data';

  @override
  UserDataRow createRow(Map<String, dynamic> data) => UserDataRow(data);
}

class UserDataRow extends SupabaseDataRow {
  UserDataRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserDataTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String get type => getField<String>('type')!;
  set type(String value) => setField<String>('type', value);

  double? get age => getField<double>('age');
  set age(double? value) => setField<double>('age', value);

  dynamic? get dataField => getField<dynamic>('data');
  set dataField(dynamic? value) => setField<dynamic>('data', value);

  String get lang => getField<String>('lang')!;
  set lang(String value) => setField<String>('lang', value);

  String get gender => getField<String>('gender')!;
  set gender(String value) => setField<String>('gender', value);

  int? get country => getField<int>('country');
  set country(int? value) => setField<int>('country', value);

  int? get state => getField<int>('state');
  set state(int? value) => setField<int>('state', value);

  bool get anxietyDiagnosed => getField<bool>('anxiety_diagnosed')!;
  set anxietyDiagnosed(bool value) =>
      setField<bool>('anxiety_diagnosed', value);

  bool get depressionDiagnosed => getField<bool>('depression_diagnosed')!;
  set depressionDiagnosed(bool value) =>
      setField<bool>('depression_diagnosed', value);

  bool get adhdDiagnosed => getField<bool>('adhd_diagnosed')!;
  set adhdDiagnosed(bool value) => setField<bool>('adhd_diagnosed', value);

  bool get anxietyTreated => getField<bool>('anxiety_treated')!;
  set anxietyTreated(bool value) => setField<bool>('anxiety_treated', value);

  bool get depressionTreated => getField<bool>('depression_treated')!;
  set depressionTreated(bool value) =>
      setField<bool>('depression_treated', value);

  bool get adhdTreated => getField<bool>('adhd_treated')!;
  set adhdTreated(bool value) => setField<bool>('adhd_treated', value);
}
