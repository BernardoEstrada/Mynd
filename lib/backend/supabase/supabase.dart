import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://tsfywtmruwyxwwryxnkp.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRzZnl3dG1ydXd5eHd3cnl4bmtwIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODQyOTYzMDAsImV4cCI6MTk5OTg3MjMwMH0.rM7lR0BHq-MUgZZM8OfRJdJd1VSJpaogjuXr7HxRiAA';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
      );
}
