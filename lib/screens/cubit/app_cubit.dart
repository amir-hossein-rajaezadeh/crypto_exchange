import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit()
      : super(
          const AppState(
              isFirstTry: true, topContainerHeight: 0, selectedCryptoIndex: -1),
        );
  Future<void> onStart() async {
    emit(
      state.copyWith(topContainerHeight: 0),
    );
    await Future.delayed(
      const Duration(milliseconds: 1),
    );
    if (state.isFirstTry) {
      emit(
        state.copyWith(topContainerHeight: 310, isFirstTry: false),
      );
      print('called ${state.isFirstTry}');
    }
  }

  Future<void> onCryptoItemClicked(
      int index, AnimationController slideDownCartListController) async {
    emit(
      state.copyWith(selectedCryptoIndex: index),
    );
    await Future.delayed(
      const Duration(milliseconds: 700),
    );
    emit(
      state.copyWith(topContainerHeight: 820),
    );
    slideDownCartListController.forward();
  }
}
