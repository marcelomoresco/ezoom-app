import 'package:bloc/bloc.dart';
import 'package:ezoom_todolist/src/modules/auth/data/usecases/auth_usecase.dart';
import 'package:ezoom_todolist/src/modules/auth/domain/entities/user.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthUsecase authUsecase;
  LoginCubit({
    required this.authUsecase,
  }) : super(LoginInitial());

  void login(String username, String password) async {
    emit(LoginLoading());
    try {
      await authUsecase(
        User(username: username, password: password),
      );
      emit(LoginSucess());
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }
}
