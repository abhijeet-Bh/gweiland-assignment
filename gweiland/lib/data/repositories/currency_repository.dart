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
      for (int i = 0; i < 20; i++) {
        var crypto = cryptos[i];
        int id = crypto["id"];
        var cryptoDetail = await cryptoDataSource.getCurrencyData(id);
        String logo = cryptoDetail["data"]["$id"]["logo"];

        CryptoEntity tempCrypto = CryptoEntity(
          logo,
          crypto["symbol"],
          crypto["name"],
          crypto["quote"]["USD"]["price"],
          crypto["quote"]["USD"]["percent_change_24h"],
          crypto["quote"]["USD"]["volume_24h"],
          crypto["quote"]["USD"]["market_cap"],
          crypto["cmc_rank"],
        );

        allCrypto.add(tempCrypto);
      }

      return allCrypto;
    } catch (e) {
      throw Exception(e);
    }
  }
}
