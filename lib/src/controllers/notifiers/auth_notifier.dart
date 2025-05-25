import 'package:flutter_bottom_tabs/src/controllers/repositories/auth_repository.dart';
import 'package:flutter_bottom_tabs/src/model/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AuthStatus { initial, login, register, loaded, error }

class AuthState {
  final AuthStatus status;
  final User? user;
  final bool isLoading;
  final String? errorMessage;

  const AuthState(
    this.status, {
    this.user,
    this.errorMessage,
    this.isLoading = false,
  });

  AuthState copyWith({
    AuthStatus? status,
    User? user,
    bool? isLoading,
    String? errorMessage,
  }) {
    return AuthState(
      status ?? this.status,
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  int get hashCode =>
      user.hashCode + isLoading.hashCode + errorMessage.hashCode;
}

class AuthNotifier extends StateNotifier<AuthState> {
  final IAuthRepository _authRepository;

  AuthNotifier(this._authRepository) : super(AuthState(AuthStatus.initial));

  Future<void> authInit() async {
    state = state.copyWith(isLoading: true);
    final user = await _authRepository.getCurrentUser();
    state = state.copyWith(
      status: user != null ? AuthStatus.loaded : AuthStatus.login,
      isLoading: false,
      user: user,
    );
  }
}
