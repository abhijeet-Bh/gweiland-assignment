import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repositories/currency_repository.dart';
import '../../domain/entity/crypto_entity.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc() : super(HomepageInitialState()) {
    CurrencyRepository currencyRepository = CurrencyRepository();

    on<HomepageDataLoadingEvent>((event, emit) async {
      emit(HomepageDataLoadingState());
      try {
        List<CryptoEntity> cryptos = await currencyRepository.getCryptoData();
        emit(HomepageDataLoadedState(cryptos));
      } catch (e) {
        // emit(HomepageDataErrorState(e.toString()));
        throw Exception(e);
      }
    });
  }
}
