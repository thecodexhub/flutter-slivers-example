part of 'app_bar_config_cubit.dart';

class AppBarConfigState extends Equatable {
  const AppBarConfigState({
    this.isPinned = false,
    this.isFloating = true,
    this.isSnap = false,
  });

  final bool isPinned;
  final bool isFloating;
  final bool isSnap;

  AppBarConfigState copyWith({
    bool? isPinned,
    bool? isFloating,
    bool? isSnap,
  }) {
    return AppBarConfigState(
      isPinned: isPinned ?? this.isPinned,
      isFloating: isFloating ?? this.isFloating,
      isSnap: isSnap ?? this.isSnap,
    );
  }

  @override
  List<Object> get props => [isPinned, isFloating, isSnap];
}
