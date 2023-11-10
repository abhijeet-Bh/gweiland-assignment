import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gweiland/domain/entity/crypto_entity.dart';
import 'package:gweiland/presentation/blocs/homepage_bloc.dart';

import '../../core/assets.dart';
import '../widgets/navbar_widget.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  void initState() {
    BlocProvider.of<HomepageBloc>(context).add(HomepageDataLoadingEvent());
    super.initState();
  }

  SortCriteria sortType = SortCriteria.price;

  _sortData(List<CryptoEntity> list, SortCriteria sortType) {
    if (sortType == SortCriteria.price) {
      list.sort((a, b) => a.price.compareTo(b.price));
    } else if (sortType == SortCriteria.marketCap) {
      list.sort((a, b) => a.cmCap.compareTo(b.cmCap));
    } else if (sortType == SortCriteria.rank) {
      list.sort((a, b) => a.cmr.compareTo(b.cmr));
    } else if (sortType == SortCriteria.volume) {
      list.sort((a, b) => a.dayVol.compareTo(b.dayVol));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomepageBloc, HomepageState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          debugPrint(state.toString());
          if (state is HomepageDataLoadingState) {
            return Center(
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeCap: StrokeCap.round,
                  ),
                ),
              ),
            );
          } else if (state is HomepageDataLoadedState) {
            List<CryptoEntity> allCryptos = _sortData(state.cryptos, sortType);
            CryptoEntity firstCrypto = allCryptos[0];
            return SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 26.0, right: 26.0, top: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "EXCHANGES",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              Assets.notificationIcon,
                              width: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset(
                              Assets.settingIcon,
                              width: 20,
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(11, 11, 11, 0.05),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide.none,
                                ),
                                prefixIcon: const Icon(Icons.search),
                                hintText: "Search Cryptocurrency",
                                hintStyle: const TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(50)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 20,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                    Assets.filterIcon,
                                    width: 20,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text("Filter")
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "EXCHANGES",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "NFT",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Stack(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 150,
                                    decoration: const BoxDecoration(
                                      color: Color.fromRGBO(0, 206, 8, 0.1),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: SvgPicture.asset(
                                      Assets.waveGraphic,
                                      width: MediaQuery.of(context).size.width -
                                          54,
                                    ),
                                  ),
                                  Positioned(
                                    top: 40,
                                    left: 20,
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          94,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(26),
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        firstCrypto.logoImg),
                                                  ),
                                                ),
                                                height: 46,
                                                width: 46,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    allCryptos[0].symbol,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  Text(
                                                    allCryptos[0].name,
                                                    style: const TextStyle(
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                firstCrypto.price
                                                    .toStringAsFixed(2),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              Text(
                                                (firstCrypto.dayChange > 0)
                                                    ? '+${firstCrypto.dayChange.toStringAsFixed(2)}'
                                                    : '-${firstCrypto.dayChange.toStringAsFixed(2)}',
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  color: (firstCrypto
                                                              .dayChange >
                                                          0)
                                                      ? const Color(0xff00CE08)
                                                      : Colors.redAccent,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Top Cryptocurrencies",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "View All",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (ctx, index) {
                                double change = allCryptos[index].dayChange;
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(26),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                    allCryptos[index].logoImg,
                                                  ),
                                                  fit: BoxFit.cover),
                                            ),
                                            height: 46,
                                            width: 46,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                allCryptos[index].symbol,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              Text(
                                                allCryptos[index].name,
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          SvgPicture.asset(
                                            (change > 0)
                                                ? Assets.upwardIcon
                                                : Assets.downwardIcon,
                                            width: 50,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            allCryptos[index]
                                                .price
                                                .toStringAsFixed(2),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            ((change > 0))
                                                ? '+ ${change.toStringAsFixed(2)}'
                                                : '- ${change.toStringAsFixed(2)}',
                                            style: TextStyle(
                                              fontSize: 13,
                                              color:
                                                  (allCryptos[index].dayChange >
                                                          0)
                                                      ? const Color(0xff00CE08)
                                                      : Colors.redAccent,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              },
                              itemCount: allCryptos.length,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: Text("Something went Wrong!"),
            );
          }
        },
      ),
      bottomNavigationBar: const NavBarWidget(),
    );
  }
}

enum SortCriteria { rank, marketCap, price, volume }
