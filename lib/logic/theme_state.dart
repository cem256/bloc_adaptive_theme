part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  const ThemeState({this.themeMode = ThemeMode.system});

  //enum
  final ThemeMode themeMode;

  @override
  List<Object?> get props => [themeMode];

  ThemeState copyWith({ThemeMode? themeMode}) {
    return ThemeState(themeMode: themeMode ?? this.themeMode);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'themeMode': themeMode.index,
    };
  }

  factory ThemeState.fromMap(Map<String, dynamic> map) {
    return ThemeState(
      themeMode: ThemeMode.values[map['themeMode'] as int],
    );
  }
}
