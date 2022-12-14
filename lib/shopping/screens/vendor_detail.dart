import 'package:flutter/material.dart';
import 'package:fryo/shopping/models/recommended_vendor.dart';
import 'package:url_launcher/url_launcher.dart';

class VendorDetail extends StatefulWidget {
  const VendorDetail({super.key, required this.vendor});
  final String title = 'Detail';
  final RecommendedVendor vendor;

  @override
  State<VendorDetail> createState() => _VendorDetailState();
}

class _VendorDetailState extends State<VendorDetail> {
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
                    "https://proyek-semester-pbp.up.railway.app${widget.vendor.fields.image}",
                    height: 200.0,
                    width: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 6.0, top: 6.0, right: 6.0, bottom: 18.0),
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  children: [
                    Text(
                      widget.vendor.fields.name,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      widget.vendor.fields.description,
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
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
              Uri url = Uri.parse(widget.vendor.fields.link);
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