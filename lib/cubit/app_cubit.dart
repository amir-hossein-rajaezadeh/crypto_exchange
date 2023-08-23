import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit()
      : super(
          const AppState(
            isFirstTry: true,
            topContainerHeight: 0,
            selectedCryptoIndex: 0,
            showCryptoCalculator: false,
            selectedNumber: 0,
            showBottomBar: true,
          ),
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
    }
  }

  Future<void> onCryptoItemClicked(
      int index,
      AnimationController slideDownCartListController,
      AnimationController slideDownCryptoDetailController,
      BuildContext buildContext) async {
    emit(
      state.copyWith(
        selectedCryptoIndex: index,
      ),
    );
    await Future.delayed(
      const Duration(milliseconds: 550),
    );
    emit(
      state.copyWith(topContainerHeight: 820, showBottomBar: false),
    );
    slideDownCartListController.forward();
    await Future.delayed(
      const Duration(milliseconds: 1670),
    );
    buildContext.go('/cryptoDetail', extra: state.selectedCryptoIndex);
    slideDownCartListController.reverse();
  }

  bool isFirstTry = false;

  Future<void> startCryptoPage(
      AnimationController cryptoTransactionsListController,
      AnimationController cryptoImageAnimation,
      AnimationController sendAndBuyController,
      AnimationController dollorValueController,
      AnimationController cryptoValueController) async {
    cryptoTransactionsListController.forward();
    await Future.delayed(
      const Duration(milliseconds: 500),
    );
    sendAndBuyController.forward();
    await Future.delayed(
      const Duration(milliseconds: 200),
    );
    cryptoValueController.forward();
    cryptoImageAnimation.forward();
    await Future.delayed(
      const Duration(milliseconds: 300),
    );
    dollorValueController.forward();
    isFirstTry = true;
  }

  Future<void> onSendButtonPressed() async {
    await Future.delayed(
      const Duration(milliseconds: 500),
    );
    emit(
      state.copyWith(showCryptoCalculator: true),
    );
  }

  void doCalculation(int clickedNumber) {
    emit(
      state.copyWith(selectedNumber: clickedNumber),
    );
  }

  String calculatedPrice(double cryptoPrice) {
    int selectedNumber = state.selectedNumber;
    String result = '${(selectedNumber / cryptoPrice)}';
    return result;
  }

  void onBackButtonPressed(
    bool isInCryptoDetailPage,
    BuildContext context,
  ) {
    if (isInCryptoDetailPage) {
      emit(
        state.copyWith(showCryptoCalculator: false, selectedNumber: 0),
      );
    } else {
      emit(
        state.copyWith(topContainerHeight: 310, showBottomBar: true),
      );
      Navigator.pop(context);
    }
  }
}
