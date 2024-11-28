import 'package:car_app/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'Features/auth/data/sources/supabase_auth_sources.dart';
import 'Features/auth/data/repo/secure_storage_service.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imhpcmh3a3JkZ2Nucmpvc3lwZmpnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzIyNzIxNjEsImV4cCI6MjA0Nzg0ODE2MX0.6JaylnrYPcnMUB8fk8qkX_1P1QV4fSVmJSR8O4hMZL0',
    url: 'https://hirhwkrdgcnrjosypfjg.supabase.co',
  );
  final supabaseClient = Supabase.instance.client;
  final authSource = SupabaseAuthSource(supabaseClient);
  final SecureStorageService secureStorageService = SecureStorageService();
  final sessionString = await secureStorageService.readSecureData('supabase_session');
  
  if (sessionString != null) {
    supabaseClient.auth.setSession(sessionString);
  }
  
  
  runApp(MyApp(authSource));
  setup();
}

