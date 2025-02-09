import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDisplayCubit extends Cubit<bool> {
  ProductDisplayCubit() : super(true);

  void loadingProduct() async {
    await Future.delayed(const Duration(seconds: 2));
    emit(false);
  }
}
