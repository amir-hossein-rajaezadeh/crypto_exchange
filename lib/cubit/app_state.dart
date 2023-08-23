import 'package:equatable/equatable.dart';

class AppState extends Equatable {
  final int topContainerHeight;
  final bool isFirstTry;
  final int selectedCryptoIndex;
  final bool showCryptoCalculator;
  final int selectedNumber;
  final bool showBottomBar;
  const AppState(
      {required this.selectedCryptoIndex,
      required this.topContainerHeight,
      required this.isFirstTry,
      required this.showCryptoCalculator,
      required this.selectedNumber,
      required this.showBottomBar});

  AppState copyWith({
    int? topContainerHeight,
    bool? isFirstTry,
    int? selectedCryptoIndex,
    bool? showCryptoCalculator,
    int? selectedNumber,
    bool? showBottomBar,
  }) {
    return AppState(
      topContainerHeight: topContainerHeight ?? this.topContainerHeight,
      isFirstTry: isFirstTry ?? this.isFirstTry,
      selectedCryptoIndex: selectedCryptoIndex ?? this.selectedCryptoIndex,
      showCryptoCalculator: showCryptoCalculator ?? this.showCryptoCalculator,
      selectedNumber: selectedNumber ?? this.selectedNumber,
      showBottomBar: showBottomBar ?? this.showBottomBar,
    );
  }

  @override
  List<Object?> get props => [
        topContainerHeight,
        isFirstTry,
        selectedCryptoIndex,
        showCryptoCalculator,
        selectedNumber,showBottomBar
      ];
}
