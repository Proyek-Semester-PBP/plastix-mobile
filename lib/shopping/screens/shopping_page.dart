import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fryo/shopping/screens/bookmarks.dart';
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
              const Divider(
                height: 20,
                thickness: 5,
                indent: 8,
                endIndent: 8,
                color: Colors.green,
              ),
              const SizedBox(height: 8),
              const Text(
                "Featured Items",
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
                        margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
                        color: const Color.fromARGB(255, 207, 223, 208),
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
                                  style: TextStyle(color: Colors.green.shade900, fontSize: 18, fontWeight: FontWeight.bold),
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
              const Divider(
                height: 20,
                thickness: 5,
                indent: 8,
                endIndent: 8,
                color: Colors.green,
              ),
              const SizedBox(height: 8),
              const Text(
                "Featured Vendors",
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
                        margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
                        color: const Color.fromARGB(255, 207, 223, 208),
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
                                  style: TextStyle(color: Colors.green.shade900, fontSize: 24, fontWeight: FontWeight.bold,),
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
              const Divider(
                height: 20,
                thickness: 5,
                indent: 8,
                endIndent: 8,
                color: Colors.green,
              ),
              const SizedBox(height: 8),
              const Text(
                "Highlighted Review",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              FutureBuilder(
                future: fetchReview(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Card(
                        margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
                        color: const Color.fromARGB(255, 207, 223, 208),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.green,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              const SizedBox(height: 8),
                              ListTile(
                                title: Text(
                                  snapshot.data![0].fields.item,
                                  style: TextStyle(color: Colors.green.shade900, fontSize: 24, fontWeight: FontWeight.bold,),
                                  textAlign: TextAlign.center,
                                ),
                                subtitle: Text(
                                  "Reviewed by ${snapshot.data![0].fields.user}",
                                  style: TextStyle(color: Colors.green.shade900, fontSize: 18,),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const Divider(
                                height: 20,
                                thickness: 2,
                                color: Colors.green,
                              ),
                              RatingBar.builder(
                                initialRating: snapshot.data![0].fields.rating.toDouble(),
                                minRating: 1,
                                direction: Axis.horizontal,
                                itemCount: 5,
                                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.green,
                                ),
                                ignoreGestures: true,
                                onRatingUpdate: (rating) {},
                              ),
                              const SizedBox(height: 12),
                              Text(
                                snapshot.data![0].fields.comment,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                      );
                  }
                },
              ),
              const SizedBox(height: 8),
            ],
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'bookmarks',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Bookmarks()),
          );
        },
        tooltip: 'Bookmarks',
        child: const Icon(Icons.bookmark),
      ),
    );
  }
}