import 'package:flutter/material.dart';
import 'package:fryo/shopping/models/fetch_models.dart';
import 'package:intl/intl.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Bookmarks extends StatefulWidget {
  const Bookmarks({super.key});
  final String title = 'Bookmarks';

  @override
  State<Bookmarks> createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> {
  NumberFormat priceFormat = NumberFormat("###,###");

  void removeBookmark(request, id) async {
    await request.post(
      "https://proyek-semester-pbp.up.railway.app/auth/remove_bookmark/$id",
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
      body: FutureBuilder(
        future: fetchBookmarks(request),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.data!.isEmpty) {
              return Center(
                child: Text(
                  "No bookmarks here...",
                  style: TextStyle(fontSize: 24, color: Colors.grey.shade300, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.all(12.0),
                color: const Color.fromARGB(255, 207, 223, 208),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.green,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
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
                        alignment: Alignment.center,
                        height: 150,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            Uri url = Uri.parse(snapshot.data![index].fields.link);
                            if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                              throw 'Could not launch $url';
                            }
                          },
                          child: const Text("🏬 Store Page")
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            removeBookmark(request, snapshot.data![index].pk);
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
                                          'Bookmark removed!',
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
                            setState(() {});
                          },
                          child: const Text("❌ Remove")
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0)
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}