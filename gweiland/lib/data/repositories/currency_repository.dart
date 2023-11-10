import '../../domain/entity/crypto_entity.dart';
import '../datasources/currency_datasource.dart';
import '../datasources/homepage_datasources.dart';

class CurrencyRepository {
  Future<List<CryptoEntity>> getCryptoData() async {
    List<CryptoEntity> allCrypto = [];

    CurrencyDataSource cryptoDataSource = CurrencyDataSource();
    HomePageDataSource homePageDataSource = HomePageDataSource();

    try {
      var data = await homePageDataSource.getHomepageData();
      var cryptos = data["data"];
      for (int i = 0; i < 50; i++) {
        var crypto = cryptos[i];
        int id = crypto["id"];
        var cryptoDetail = await cryptoDataSource.getCurrencyData(id);
        String logo = cryptoDetail["data"]["$id"];

        CryptoEntity tempCrypto = CryptoEntity(
          logo,
          crypto["symbol"],
          crypto["name"],
          crypto["symbol"]["quote"]["USD"]["price"],
          crypto["symbol"]["quote"]["USD"]["percent_change_24h"],
        );

        allCrypto.add(tempCrypto);
      }

      return allCrypto;
    } catch (e) {
      throw Exception(e);
    }
  }
}
