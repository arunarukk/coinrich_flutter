import 'package:coinrich_flutter/api_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApiService().getCoins();
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text('CoinRich'),
          centerTitle: true,
        ),
        body: FutureBuilder<List<Map<String, dynamic>>>(
            future: ApiService().getCoins(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              }
              if (snapshot.data == null) {
                return Center(
                  child: Text('N0 data'),
                );
              }
              final data = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Column(
                  children: [
                    SizedBox(
                      height: size * .14,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: size * .27,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.pie_chart_outline_rounded,
                                    color: Colors.yellow,
                                  ),
                                  Text(
                                    'Show Chart',
                                    style: TextStyle(color: Colors.yellow),
                                  ),
                                ],
                              )),
                          Text('Count: ${data.length}'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          final coins = data[index];
                          final price = coins['quote']['USD']['price'];
                          final percentage =
                              coins['quote']['USD']['percent_change_24h'];

                          return Card(
                            color: Colors.black,
                            child: SizedBox(
                              height: size * .22,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              coins['name'],
                                              style: TextStyle(
                                                color: Colors.yellow,
                                                fontSize: 24,
                                              ),
                                            ),
                                            SizedBox(
                                              width: size * .06,
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.arrow_upward,
                                                  color: Colors.green,
                                                ),
                                                Text(
                                                    '${percentage.toStringAsFixed(2)}%'),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Container(
                                          height: size * .05,
                                          width: size * .2,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade800,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Center(
                                              child: Text(coins['symbol'])),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                                'Price  \$${price.toStringAsFixed(2)}'),
                                            SizedBox(
                                              width: size * .08,
                                            ),
                                            Text('Rank  ${coins['cmc_rank']}'),
                                          ],
                                        ),
                                        Container(
                                          height: size * .08,
                                          width: size * .08,
                                          decoration: BoxDecoration(
                                              color: Colors.yellow,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Icon(Icons.arrow_forward),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: 3,
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: size * .04,
                          );
                        },
                      ),
                    )
                  ],
                ),
              );
            }));
  }
}
