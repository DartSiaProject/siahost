part of 'language_cubit.dart';

sealed class LanguageState extends Equatable {
  const LanguageState();

  @override
  List<Object> get props => [];
}

final class LanguageInitial extends LanguageState {}

final class LanguageLoading extends LanguageState {}

final class LanguageSuccess extends LanguageState {
  const LanguageSuccess(this.locale);
  final Locale locale;

  @override
  List<Object> get props => [locale];
}

final class LanguageFailure extends LanguageState {
  const LanguageFailure(this.error);
  final DartSiaException error;

  @override
  List<Object> get props => [error];
}
