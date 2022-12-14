import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fryo/shopping/models/recommended_item.dart';
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
              Container(
                margin: const EdgeInsets.only(left: 18.0, top: 18.0, right: 18.0, bottom: 6.0),
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
                margin: const EdgeInsets.only(left: 6.0, top: 6.0, right: 6.0, bottom: 18.0),
                padding: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
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
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      "Rp${priceFormat.format(widget.item.fields.price).replaceAll(",", ".")}",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8.0),
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
          child: ElevatedButton(
            onPressed: () async {
              Uri url = Uri.parse(widget.item.fields.link);
              if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                throw 'Could not launch $url';
              }
            },
            child: const Text("🏬 Go to Store Page")
          ),
        )
      )
    );
  }
}