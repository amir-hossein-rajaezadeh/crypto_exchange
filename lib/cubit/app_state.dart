import 'package:equatable/equatable.dart';

class AppState extends Equatable {
  final int topContainerHeight;
  final bool isFirstTry;
  final int selectedCryptoIndex;
  final bool showCryptoCalculator;
  const AppState({
    required this.selectedCryptoIndex,
    required this.topContainerHeight,
    required this.isFirstTry,
    required  this.showCryptoCalculator
  });

  AppState copyWith({
    int? topContainerHeight,
    bool? isFirstTry,
    int? selectedCryptoIndex,
    bool? showCryptoCalculator,
  }) {
    return AppState(
      topContainerHeight: topContainerHeight ?? this.topContainerHeight,
      isFirstTry: isFirstTry ?? this.isFirstTry,
      selectedCryptoIndex: selectedCryptoIndex ?? this.selectedCryptoIndex, showCryptoCalculator: showCryptoCalculator??this.showCryptoCalculator,
    );
  }

  @override
  List<Object?> get props => [
        topContainerHeight,
        isFirstTry,
        selectedCryptoIndex,
        showCryptoCalculator
      ];
}
