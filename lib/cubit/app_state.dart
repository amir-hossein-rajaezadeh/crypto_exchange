import 'package:equatable/equatable.dart';

class AppState extends Equatable {
  final int topContainerHeight;
  final bool isFirstTry;
  final int selectedCryptoIndex;
  final bool showCryptoDetailPage;
  const AppState({
    required this.showCryptoDetailPage,
    required this.selectedCryptoIndex,
    required this.topContainerHeight,
    required this.isFirstTry,
  });

  AppState copyWith(
      {int? topContainerHeight,
      bool? isFirstTry,
      int? selectedCryptoIndex,
      bool? showCryptoDetailPage}) {
    return AppState(
        topContainerHeight: topContainerHeight ?? this.topContainerHeight,
        isFirstTry: isFirstTry ?? this.isFirstTry,
        selectedCryptoIndex: selectedCryptoIndex ?? this.selectedCryptoIndex,
        showCryptoDetailPage:
            showCryptoDetailPage ?? this.showCryptoDetailPage);
  }

  @override
  List<Object?> get props => [
        topContainerHeight,
        isFirstTry,
        selectedCryptoIndex,
        showCryptoDetailPage
      ];
}
