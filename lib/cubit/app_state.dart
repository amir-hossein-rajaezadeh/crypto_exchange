import 'package:equatable/equatable.dart';

class AppState extends Equatable {
  final int topContainerHeight;
  final bool isFirstTry;
  final int selectedCryptoIndex;
  const AppState({
    required this.selectedCryptoIndex,
    required this.topContainerHeight,
    required this.isFirstTry,
  });

  AppState copyWith({
    int? topContainerHeight,
    bool? isFirstTry,
    int? selectedCryptoIndex,
  }) {
    return AppState(
      topContainerHeight: topContainerHeight ?? this.topContainerHeight,
      isFirstTry: isFirstTry ?? this.isFirstTry,
      selectedCryptoIndex: selectedCryptoIndex ?? this.selectedCryptoIndex,
    );
  }

  @override
  List<Object?> get props => [
        topContainerHeight,
        isFirstTry,
        selectedCryptoIndex,
      ];
}
