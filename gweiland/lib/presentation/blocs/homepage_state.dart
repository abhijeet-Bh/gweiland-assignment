part of 'homepage_bloc.dart';

abstract class HomepageState extends Equatable {
  const HomepageState();
}

class HomepageInitialState extends HomepageState {
  @override
  List<Object> get props => [];
}

class HomepageDataLoadingState extends HomepageState {
  @override
  List<Object> get props => [];
}

class HomepageDataLoadedState extends HomepageState {
  final List<CryptoEntity> cryptos;

  const HomepageDataLoadedState(this.cryptos);

  @override
  List<Object> get props => [cryptos];
}

class HomepageDataErrorState extends HomepageState {
  final String errorMsg;

  const HomepageDataErrorState(this.errorMsg);

  @override
  List<Object> get props => [errorMsg];
}
