import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SupabaseAuthSource {
  final SupabaseClient supabaseClient;
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  SupabaseAuthSource(this.supabaseClient);

  // Sign in method
  Future<String> signIn(String email, String password) async {
    final response = await supabaseClient.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (response.session == null || response.user == null) {
      throw Exception('Failed to sign in. Please check your credentials and try again.');
    }

    // Store access token in secure storage
    await secureStorage.write(key: 'access_token', value: response.session?.accessToken);

    return response.user!.email!;
  }

  // Sign up method
  Future<String> signUp(String email, String password) async {
    final response = await supabaseClient.auth.signUp(
      email: email,
      password: password,
    );

    if (response.session == null || response.user == null) {
      throw Exception('Failed to sign up. Please check your details and try again.');
    }

    // Store access token in secure storage
    await secureStorage.write(key: 'access_token', value: response.session?.accessToken);

    return response.user!.email!;
  }

  // Sign out method (remove token from secure storage)
  Future<void> signOut() async {
    await secureStorage.delete(key: 'access_token');
    await supabaseClient.auth.signOut();
  }

  // Check if the user has an existing session
  Future<String?> checkSession() async {
    // Retrieve access token from secure storage
    final token = await secureStorage.read(key: 'access_token');
    
    if (token != null) {
      // If token is found, return email or some user data
      final session = supabaseClient.auth.currentSession;
      if (session != null) {
        return session.user.email; // Return email or any other user data if needed
      }
    }
    return null; // No session found
  }
}
