import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:fryo/shopping/models/fetch_models.dart';
import 'package:fryo/shopping/screens/item_detail.dart';
import 'package:fryo/shopping/screens/vendor_detail.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});
  final String title = 'Shopping';

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  NumberFormat priceFormat = NumberFormat("###,###");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 8),
              const Text(
                "Items",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              FutureBuilder(
                future: fetchRecommendedItem(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => Card(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.green,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: InkWell(
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 18.0, top: 18.0, right: 18.0, bottom: 6.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.green,
                                    width: 4,
                                  )
                                ),
                                child: Image.network(
                                  "https://proyek-semester-pbp.up.railway.app${snapshot.data![index].fields.image}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  snapshot.data![index].fields.name,
                                  style: const TextStyle(fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                                subtitle: Text(
                                  "Rp${priceFormat.format(snapshot.data![index].fields.price).replaceAll(",", ".")}",
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ItemDetail(item: snapshot.data![index])),
                            );
                          },
                        ),
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    );
                  }
                },
              ),
              const SizedBox(height: 8),
              const Text(
                "Vendors",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              FutureBuilder(
                future: fetchRecommendedVendor(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => Card(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.green,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: InkWell( 
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 18, bottom: 6),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.green,
                                    width: 4
                                  ),
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                child: ClipOval(
                                  child: Image.network(
                                    "https://proyek-semester-pbp.up.railway.app${snapshot.data![index].fields.image}",
                                    height: 200.0,
                                    width: 200.0,
                                    fit:BoxFit.cover,
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  snapshot.data![index].fields.name,
                                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => VendorDetail(vendor: snapshot.data![index])),
                            );
                          },
                        ),
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    );
                  }
                },
              ),
              const SizedBox(height: 8),
            ],
          ),
        )
      )
    );
  }
}