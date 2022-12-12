import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/fetch_data.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  Uri url = Uri.parse('https://google.com');

  Future<void> _launchUrl(int id) async {
    if (id == 1) {
      url = Uri.parse(
          'https://ebtke.esdm.go.id/post/2022/10/24/3301/kementerian.esdm.dan.irena.luncurkan.indonesia.energy.transition.outlook');
    }
    if (id == 2) {
      url = Uri.parse(
          'https://www.liputan6.com/lifestyle/read/5108232/usaha-daur-ulang-sampah-plastik-kemasan-kosmetik-jadi-perabot-fungsional');
    }
    if (id == 3) {
      url = Uri.parse(
          'https://lifestyle.kompas.com/read/2022/10/26/114654720/program-recycle-me-coca-cola-ubah-sampah-plastik-jadi-cuan');
    }
    if (id == 4) {
      url = Uri.parse(
          'https://www.suara.com/tekno/2022/10/25/062716/380-juta-ton-plastik-dibuat-setiap-tahun-tidak-ada-yang-benar-benar-didaur-ulang');
    }
    if (id == 5) {
      url = Uri.parse(
          'https://20.detik.com/detikflash/20221024-221024046/biodegradable-solusi-atasi-permasalahan-sampah-plastik');
    }
    if (id == 6) {
      url = Uri.parse(
          'https://www.suara.com/tekno/2022/10/25/062716/380-juta-ton-plastik-dibuat-setiap-tahun-tidak-ada-yang-benar-benar-didaur-ulang');
    }
    if (id == 7) {
      url = Uri.parse(
          'https://jakarta.suaramerdeka.com/nasional/pr-1345341953/2025-indonesia-targetkan-sampah-plastik-laut-berkurang-70-persen');
    }
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('News'),
          backgroundColor: Color(0xFF008000),
          leadingWidth: 64,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          )),
      body: FutureBuilder(
          future: fetchData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "No News!",
                      style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => InkWell(
                          onTap: (() => _launchUrl(snapshot.data![index].pk)),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 27, vertical: 9),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              color: Color(0xFFE6E6B3),
                              border: Border(
                                bottom: BorderSide(
                                  width: 2.0,
                                  color: Color(0xff008000),
                                ),
                              ),
                              // borderRadius:
                              // BorderRadius.all(Radius.circular(10))
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (snapshot.data![index].pk == 1)
                                        SizedBox(
                                          width: 200,
                                          child: Image.network(
                                              fit: BoxFit.fitWidth,
                                              'https://ebtke.esdm.go.id/images/b2b592de783ecdf967d4379ad865c574_p.jpeg'),
                                        ),
                                      if (snapshot.data![index].pk == 2)
                                        SizedBox(
                                          width: 200,
                                          child: Image.network(
                                              fit: BoxFit.fitWidth,
                                              'https://cdn0-production-images-kly.akamaized.net/BJDMhDAiM6sE07QqsNjAxj_ccEI=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/4204506/original/076318600_1666782157-IMG20221018144800.jpg'),
                                        ),
                                      if (snapshot.data![index].pk == 3)
                                        SizedBox(
                                          width: 200,
                                          child: Image.network(
                                              fit: BoxFit.fitWidth,
                                              'https://asset.kompas.com/crops/0ypS5DmK3DI94KFAPBEmnc3lmpw=/1x0:2000x1333/750x500/data/photo/2022/10/26/6358b9f54096c.jpg'),
                                        ),
                                      if (snapshot.data![index].pk == 4)
                                        SizedBox(
                                          width: 200,
                                          child: Image.network(
                                              fit: BoxFit.fitWidth,
                                              'https://thumb.suara.com/72RM54y_ymGdXf4Kx42fRtE3d2A=/653x366/https://media.suara.com/pictures/653x366/2022/07/23/21112-sampah-plastik.webp'),
                                        ),
                                      if (snapshot.data![index].pk == 5)
                                        SizedBox(
                                          width: 200,
                                          child: Image.network(
                                              fit: BoxFit.fitWidth,
                                              'https://cdn1-production-images-kly.akamaized.net/5atA_LENre-jGKEtxM95NbMSiQo=/1200x675/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/4197343/original/068266100_1666205490-WhatsApp_Image_2022-10-18_at_21.14.12__1_.jpeg'),
                                        ),
                                      if (snapshot.data![index].pk == 6)
                                        SizedBox(
                                          width: 200,
                                          child: Image.network(
                                              fit: BoxFit.fitWidth,
                                              'https://media.suara.com/pictures/653x366/2020/01/16/99993-ilustrasi-sampah-plastik-menumpuk-shutterstock.jpg'),
                                        ),
                                      if (snapshot.data![index].pk == 7)
                                        SizedBox(
                                          width: 200,
                                          child: Image.network(
                                              fit: BoxFit.fitWidth,
                                              'https://assets.promediateknologi.com/crop/0x0:0x0/x/photo/2022/10/27/453331436.jpeg'),
                                        ),
                                      Container(
                                        height: 10,
                                      ),
                                      Text(snapshot.data![index].fields.date,
                                          style: const TextStyle(
                                            fontSize: 14.0,
                                          )),
                                      Text(
                                          "${snapshot.data![index].fields.title}",
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ));
              }
            }
          }),
    );
  }
}
