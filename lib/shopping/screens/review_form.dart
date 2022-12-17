import 'package:flutter/material.dart';
import 'package:fryo/shopping/models/recommended_item.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import '../../profile/utils/userProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewForm extends StatefulWidget {
  const ReviewForm({super.key, required this.item});
  final String title = 'Review';
  final RecommendedItem item;

  @override
  State<ReviewForm> createState() => _ReviewFormState();
}

class _ReviewFormState extends State<ReviewForm> {
  final _formKey = GlobalKey<FormState>();
  int _rating = 0;
  String _comment = "";

  void postReview(request, rating, comment) async {
    await request.post(
      "https://proyek-semester-pbp.up.railway.app/auth/post_review/",
      {
        "item": widget.item.fields.name,
        "rating": rating,
        "comment": comment,
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    final request = context.read<CookieRequest>();
    final userProvider = context.watch<UserProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 12.0),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                    children: [
                      const TextSpan(text: "Leave a review for:\n", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      TextSpan(text: widget.item.fields.name, style: const TextStyle(color: Colors.green, fontSize: 24, fontWeight: FontWeight.bold)),
                    ]
                  )
                ),
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
                  padding: const EdgeInsets.only(left: 6.0, top: 18.0, right: 6.0, bottom: 6.0),
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
                        "Rating",
                        style: TextStyle(color: Colors.green.shade900, fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 6.0),
                      RatingBar.builder(
                        initialRating: 1,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.green,
                        ),
                        onRatingUpdate: (rating) {
                          setState(() {
                            _rating = rating.round();
                          });
                        },
                      ),
                      const SizedBox(height: 18.0),
                      Text(
                        "Comment",
                        style: TextStyle(color: Colors.green.shade900, fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 6.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Comment",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          maxLines: 5,
                          maxLength: 100,
                          style: const TextStyle(fontSize: 18),
                          onChanged: (String? value) {
                            setState(() {
                              _comment = value!;
                            });
                          },
                          onSaved: (String? value) {
                            setState(() {
                              _comment = value!;
                            });
                          },
                        ),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.green),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            postReview(request, _rating, _comment);
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
                                          'Thanks for the review!',
                                          style: TextStyle(fontSize: 20),
                                        )
                                      ),
                                      const SizedBox(height: 6),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
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
                          }
                        },
                        child: const Text(
                          "Submit Review",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}