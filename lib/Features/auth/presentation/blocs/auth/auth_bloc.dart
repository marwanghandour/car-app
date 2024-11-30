import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../data/sources/supabase_auth_sources.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, MyAuthState> {
  final SupabaseAuthSource authSource;
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  AuthBloc(this.authSource) : super(AuthInitialState()) {
    on<SignInEvent>(_onSignIn);
    on<SignUpEvent>(_onSignUp);
    on<SignOutEvent>(_onSignOut);
    on<CheckSessionEvent>(_onCheckSession); 
  }

  Future<void> _onCheckSession(CheckSessionEvent event, Emitter<MyAuthState> emit) async {
    emit(AuthLoadingState());
    try {
      final email = await authSource.checkSession();
      if (email != null) {
        emit(AuthSuccessState(email: email));
      } else {
        emit(AuthInitialState());
      }
    } catch (e) {
      final errorMessage = _getCustomErrorMessage(e.toString());
      emit(AuthFailureState(message: errorMessage));
    }
  }

  Future<void> _onSignIn(SignInEvent event, Emitter<MyAuthState> emit) async {
    emit(AuthLoadingState());
    try {
      final email = await authSource.signIn(event.email, event.password);
      emit(AuthSuccessState(email: email));
    } catch (e) {
      final errorMessage = _getCustomErrorMessage(e.toString());
      emit(AuthFailureState(message: errorMessage));
    }
  }

  Future<void> _onSignUp(SignUpEvent event, Emitter<MyAuthState> emit) async {
    emit(AuthLoadingState());
    try {
      final email = await authSource.signUp(event.email, event.password);
      emit(AuthSuccessState(email: email));
    } catch (e) {
      final errorMessage = _getCustomErrorMessage(e.toString());
      emit(AuthFailureState(message: errorMessage));
    }
  }

  Future<void> _onSignOut(SignOutEvent event, Emitter<MyAuthState> emit) async {
    emit(AuthLoadingState());
    try {
      await authSource.signOut();
      emit(AuthInitialState());
    } catch (e) {
      final errorMessage = _getCustomErrorMessage(e.toString());
      emit(AuthFailureState(message: errorMessage));
    }
  }

  String _getCustomErrorMessage(String error) {
    if (error.contains('email') && error.contains('invalid')) {
      return 'The email address is invalid. Please enter a valid email.';
    } else if (error.contains('email') && error.contains('not found')) {
      return 'No account found with this email address.';
    } else if (error.contains('password') && error.contains('incorrect')) {
      return 'Incorrect password. Please try again.';
    } else if (error.contains('password') && error.contains('weak')) {
      return 'Your password is too weak. Please use a stronger password.';
    } else if (error.contains('network')) {
      return 'Network issue detected. Check your connection and try again.';
    } else if (error.contains('timeout')) {
      return 'Request timed out. Please try again later.';
    } else if (error.contains('user') && error.contains('disabled')) {
      return 'Your account is disabled. Contact support for assistance.';
    } else if (error.contains('account') && error.contains('locked')) {
      return 'Your account is locked due to multiple failed attempts. Try again later.';
    } else if (error.contains('email') && error.contains('already exists')) {
      return 'An account with this email already exists. Try logging in or use another email.';
    } else if (error.contains('server')) {
      return 'Server issue encountered. Please try again later.';
    } else if (error.contains('unauthorized')) {
      return 'Unauthorized access. Verify your credentials.';
    } else if (error.contains('quota')) {
      return 'Quota exceeded. Please try again after some time.';
    } else if (error.contains('unexpected')) {
      return 'Unexpected error. Try again later or contact support.';
    } else {
      return 'An unknown error occurred. Please contact support.';
    }
  }
}
