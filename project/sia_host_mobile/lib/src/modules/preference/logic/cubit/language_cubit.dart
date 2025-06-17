import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sia_host_mobile/src/modules/preference/data/repositories/preference_repository.dart';
import 'package:sia_host_mobile/src/shared/exceptions/exceptions.dart';
import 'package:sia_host_mobile/src/shared/utils/enums.dart';

part 'language_state.dart';

@Injectable()
class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit(this._repository) : super(LanguageInitial());

  final PreferenceRepository _repository;

  Future<void> getCurrentLanguage() async {
    final locale = await _repository.getCurrentLanguage();
    if (locale != null) {
      emit(LanguageSuccess(locale));
    } else {
      emit(LanguageSuccess(Locale(AppLocales.en.name)));
    }
  }

  Future<void> setLanguage(AppLocales locale) async {
    emit(LanguageLoading());
    try {
      await _repository.setCurrentLanguage(locale);
      emit(LanguageSuccess(Locale(locale.name)));
    } catch (e) {
      emit(LanguageFailure(DartSiaException.handleError(e)));
    }
  }
}
