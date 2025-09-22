import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static const String supabaseUrl = 'https://uljrqjufxyruznzqqryt.supabase.co';
  static const String supabaseAnonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVsanJxanVmeHlydXpuenFxcnl0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTQ0MzI1MDksImV4cCI6MjA3MDAwODUwOX0.gJUjB0Xz2FBoQEYUb0n7raxZVuRYhdtZ240GhT8Cbkc';

  static SupabaseClient get client => Supabase.instance.client;

  static Future<void> initialize() async {
    await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);
  }
}
