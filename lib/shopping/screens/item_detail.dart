import 'package:flutter/material.dart';
import 'package:fryo/shopping/screens/review_form.dart';
import 'package:intl/intl.dart';
import 'package:fryo/shopping/models/recommended_item.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemDetail extends StatefulWidget {
  const ItemDetail({super.key, required this.item});
  final String title = 'Detail';
  final RecommendedItem item;

  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  NumberFormat priceFormat = NumberFormat("###,###");

  void bookmarkItem(request) async {
    await request.post(
      "https://proyek-semester-pbp.up.railway.app/auth/bookmark/${widget.item.pk}",
      {}
    );
  }

  @override
  Widget build(BuildContext context) {
    final request = context.read<CookieRequest>();
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 18.0, top: 18.0, right: 18.0, bottom: 12.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.green,
                    width: 4,
                  )
                ),
                child: Image.network(
                  "https://proyek-semester-pbp.up.railway.app${widget.item.fields.image}", 
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 12.0, top: 6.0, right: 12.0, bottom: 18.0),
                padding: const EdgeInsets.only(left: 6.0, top: 18.0, right: 6.0, bottom: 18.0),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(76, 175, 80, 0.1),
                  border: Border.all(
                    color: Colors.green,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(4)
                ),
                child: Column(
                  children: [
                    Text(
                      widget.item.fields.name,
                      style: TextStyle(color: Colors.green.shade900, fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      "Rp${priceFormat.format(widget.item.fields.price).replaceAll(",", ".")}",
                      style: TextStyle(color: Colors.green.shade900, fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      widget.item.fields.description,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () async {
                  Uri url = Uri.parse(widget.item.fields.link);
                  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                    throw 'Could not launch $url';
                  }
                },
                child: const Text("🏬 Store Page")
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReviewForm(item: widget.item)),
                  );
                },
                child: const Text("📝 Review")
              ),
              ElevatedButton(
                onPressed: () async {
                  bookmarkItem(request);
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 15,
                        child: ListView(
                          padding: const EdgeInsets.only(top: 20),
                          shrinkWrap: true,
                          children: <Widget>[
                            const Center(
                              child: Text(
                                'Item bookmarked!',
                                style: TextStyle(fontSize: 20),
                              )
                            ),
                            const SizedBox(height: 6),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Return',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              )
                            ), 
                          ],
                        ),
                      );
                    },
                  );
                },
                child: const Text("🔖 Bookmark")
              ),
            ],
          )
        )
      )
    );
  }
}