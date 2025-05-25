import 'package:flutter_bottom_tabs/src/controllers/notifiers/auth_notifier.dart';
import 'package:flutter_bottom_tabs/src/controllers/repositories/auth_repository.dart';
import 'package:flutter_bottom_tabs/src/model/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<IAuthRepository>(
  (ref) => AuthRepository(),
);

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(ref.watch(authRepositoryProvider))..authInit(),
);

final authUserProvider = Provider<User>((ref) {
  final authState = ref.watch(authNotifierProvider);
  if (authState.status == AuthStatus.loaded) {
    return authState.user!;
  }
  return User();
});
