import 'package:bloc/bloc.dart';
import 'package:ezoom_todolist/src/core/widgets/ezoom_toast.dart';
import 'package:ezoom_todolist/src/modules/auth/data/usecases/auth_usecase.dart';
import 'package:ezoom_todolist/src/modules/auth/domain/entities/user.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthUsecase authUsecase;
  LoginCubit({
    required this.authUsecase,
  }) : super(LoginInitial());

  void login(User user) async {
    try {
      emit(LoginLoading());
      await authUsecase(user);
      emit(LoginSucess());
    } catch (e) {
      EzoomToast.showErrorToast("Opss...algo occoreu!");
    }
  }
}
