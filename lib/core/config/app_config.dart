class AppConfig {
  static const String supabaseUrl = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: 'https://pllqfidqbfanhsecioky.supabase.co',
  );
  
  static const String supabaseAnonKey = String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    defaultValue: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBsbHFmaWRxYmZhbmhzZWNpb2t5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE5ODg1ODIsImV4cCI6MjA0NzU2NDU4Mn0._a0zO1g7wct8jHhUeFP0PEi8ZEZfQIhFI95z2qwWieg',
  );
} 