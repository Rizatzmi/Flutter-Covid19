import 'package:covid19/app/widgets/statscard.dart';
import 'package:covid19/data/models/models.dart';
import 'package:covid19/data/repository/api.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<Stat> futurestat;
  late Future<Vaksin> futureVaksin;

  @override
  void initState() {
    super.initState();
    futurestat = Repository().fetchStat();
    futureVaksin = Repository().fetchVaksin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1,
              height: 200,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Image.network(
                    "http://covid19maluku.com/images/illustration.png"),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Statistik Covid-19",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins"),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  FutureBuilder<Stat>(
                    future: futurestat,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: statsCard(
                                      Colors.red,
                                      "Terkonfirmasi",
                                      snapshot.data!.jumlahPositif.toString(),
                                      snapshot.data!.updatePositif.toString()),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: statsCard(
                                      Colors.deepOrangeAccent,
                                      "Dalam Perawatan",
                                      snapshot.data!.jumlahDirawat.toString(),
                                      snapshot.data!.updateDirawat.toString()),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: statsCard(
                                      Colors.green,
                                      "Sembuh",
                                      snapshot.data!.jumlahSembuh.toString(),
                                      snapshot.data!.updateSembuh.toString()),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: statsCard(
                                      Colors.red,
                                      "Meninggal",
                                      snapshot.data!.jumlahMeninggal.toString(),
                                      snapshot.data!.updateMeninggal
                                          .toString()),
                                )
                              ],
                            )
                          ],
                        );
                      }
                      return const CircularProgressIndicator();
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  FutureBuilder<Vaksin>(
                      future: futureVaksin,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: [
                              statsCard(
                                  Colors.lightBlue,
                                  "Vaksinasi Ke-1",
                                  snapshot.data!.vaksin_1.toString(),
                                  snapshot.data!.updateVaksin_1.toString()),
                              const SizedBox(
                                height: 20,
                              ),
                              statsCard(
                                  Colors.blue,
                                  "Vaksinasi Ke-1",
                                  snapshot.data!.vaksin_2.toString(),
                                  snapshot.data!.updateVaksin_2.toString())
                            ],
                          );
                        }
                        return const CircularProgressIndicator();
                      }),                 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}