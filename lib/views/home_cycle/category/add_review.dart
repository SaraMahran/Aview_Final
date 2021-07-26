import 'package:aview2/components/widgets/buttons/login_button.dart';
import 'package:aview2/components/widgets/textFormField.dart';
import 'package:aview2/view_models/providers/reviewer_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'category_screen.dart';

class AddReviewScreen extends StatelessWidget {
  TextEditingController reviewController = TextEditingController();
  late double rate = 0;

  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<ReviewerProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.deepOrange, //change your color here
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        shadowColor: Colors.transparent,
        title: Text(
          'Write Review',
          style: TextStyle(
            fontSize: 20,
            color: Colors.deepOrange,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/From_Left.png',
              ),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 90),
              RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 60,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (c, _) =>
                    Icon(Icons.star, color: Colors.deepOrange),
                onRatingUpdate: (rating) {
                  rate = rating;
                  print(rate);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: CustomTextField(
                  keyboardType: TextInputType.text,
                  icon: Icons.reviews,
                  hint: "Write your review",
                  maxLine: 5,
                  textEditingController: reviewController,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: LoginButton(
                    onTap: () async {
                      if (reviewController.text.length == 0 || rate == 0) {
                        Fluttertoast.showToast(msg: 'complete review fields');
                      } else {
                        DateTime now = DateTime.now();
                        String date =
                            DateFormat('yyyy/MM/dd – kk:mm').format(now);
                        Map<String, dynamic> data = {
                          'description': reviewController.text,
                          'rate': rate,
                          'name':
                              userInfo.getFirstName + '' + userInfo.getLastName,
                          'date': date
                        };
                        FirebaseFirestore.instance
                            .collection('places')
                            .doc(
                              Provider.of<CategoryProvider>(context,
                                      listen: false)
                                  .getDocumentId,
                            )
                            .collection('reviews')
                            .add(data);
                        Fluttertoast.showToast(
                            msg: 'Your review has been submitted. ');
                        Navigator.pop(context);
                      }
                    },
                    buttonTitle: 'Submit Review',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
