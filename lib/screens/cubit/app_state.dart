import 'package:equatable/equatable.dart';

class AppState extends Equatable {
  final int topContainerHeight;
  final bool isFirstTry;
  const AppState({
    required this.topContainerHeight,
    required this.isFirstTry,
  });

  AppState copyWith({int? topContainerHeight, bool? isFirstTry}) {
    return AppState(
        topContainerHeight: topContainerHeight ?? this.topContainerHeight,
        isFirstTry: isFirstTry ?? this.isFirstTry);
  }

  @override
  List<Object?> get props => [topContainerHeight, isFirstTry];
}
