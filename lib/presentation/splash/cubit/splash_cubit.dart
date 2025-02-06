import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingcart/presentation/splash/cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashDisplay());

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 3));
    emit(Unthenticated());
  }
}
