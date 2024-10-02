import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:web_gnom/core/app/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://jwepwetnsbpefkwswabn.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp3ZXB3ZXRuc2JwZWZrd3N3YWJuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjc4MDI3NDksImV4cCI6MjA0MzM3ODc0OX0.xuwPrMJHh3T-XyCfHOY9LMIWj7Mx0FGVOa-DWqVfDp0',
  );
  runApp(const MainApp());
}
