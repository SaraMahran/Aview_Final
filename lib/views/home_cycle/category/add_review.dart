import 'package:aview2/components/widgets/buttons/login_button.dart';
import 'package:aview2/components/widgets/textFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddReviewScreen extends StatelessWidget {
  TextEditingController reviewController = TextEditingController();
  late double rate = 0;

  @override
  Widget build(BuildContext context) {
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
                initialRating: 3,
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
                    onTap: () {
                      if (reviewController.text.length == 0 || rate == 0) {
                        Fluttertoast.showToast(msg: 'complete review fields');
                      } else {
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
