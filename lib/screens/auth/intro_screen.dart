import 'package:desain/repositories/repositories.dart';
import 'package:desain/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:desain/style/theme.dart' as Style;

class IntroPage extends StatefulWidget {
  final UserRepository userRepository;

  const IntroPage({Key? key, required this.userRepository}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState(userRepository);
}

class _IntroPageState extends State<IntroPage> {
  final UserRepository userRepository;

  _IntroPageState(this.userRepository);

  bool clicked = false;

  void afterIntroComplete() {
    setState(() {
      clicked = true;
    });
  }

  final List<PageViewModel> pages = [
    PageViewModel(
        titleWidget: Column(
          children: [
            Text('FREE GIFT', style: TextStyle(
                fontSize: 18.0, fontWeight: FontWeight.w600
            ),),
            SizedBox(height: 8,),
            Container(
              height: 3,
              width: 100,
              decoration: BoxDecoration(
                  color: Style.Colors.mainColor,
                  borderRadius: BorderRadius.circular(10)
              ),
            )
          ],
        ),
        body: "Free gifts with purchase. Offer free gifts like a gift wrap, gift card, or any free product.",
        image: Center(
          child: SvgPicture.asset("assets/icons/gift.svg"),
        ),

        decoration: const PageDecoration(
            pageColor: Colors.white,
            bodyTextStyle: TextStyle(color: Colors.black54, fontSize: 16,),
            bodyPadding: EdgeInsets.only(left: 20, right: 20),
            imagePadding: EdgeInsets.all(20),
        ),
    ),
    PageViewModel(
      titleWidget: Column(
        children: [
          const Text('PAYMENT INTEGRATION',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.0, fontWeight: FontWeight.w600,
          ),),
          const SizedBox(height: 8,),
          Container(
            height: 3,
            width: 100,
            decoration: BoxDecoration(
              color: Style.Colors.mainColor,
              borderRadius: BorderRadius.circular(10)
            ),
          )
        ],
      ),
      body: "A payment gateway as a merchant service that processes credit card payments for ecommerce sites and traditional brick and mortar stores.",
      image: Center(
        child: SizedBox(
          width: 450.0,
          child: SvgPicture.asset("assets/icons/payment.svg"),
        ),
      ),
      decoration: const PageDecoration(
        pageColor: Colors.white,
        bodyTextStyle: TextStyle(color: Colors.black54, fontSize: 16,),
        bodyPadding: EdgeInsets.only(left: 20, right: 20),
        imagePadding: EdgeInsets.all(20)
      ),
    ),
    PageViewModel(
      titleWidget: Column(
        children: [
          const Text('CALL CENTER', style: TextStyle(
            fontSize: 18.0, fontWeight: FontWeight.w600
          ),),
          const SizedBox(height: 8,),
          Container(
            height: 3,
            width: 100,
            decoration: BoxDecoration(
              color: Style.Colors.mainColor,
              borderRadius: BorderRadius.circular(10)
            ),
          )
        ],
      ),
      body: "Call center gives a small business a big business feel. 24-hour sales, order entry, payment processing, billing inquiries, and more.",
      image: Center(
        child: SizedBox(
          width: 450.0,
          child: SvgPicture.asset("assets/icons/call.svg"),
        ),
      ),
      decoration: const PageDecoration(
        pageColor: Colors.white,
        bodyTextStyle: TextStyle(color: Colors.black54, fontSize: 16,),
        bodyPadding: EdgeInsets.only(left: 20, right: 20),
        imagePadding: EdgeInsets.all(20)
      )
    )
  ];

  @override
  Widget build(BuildContext context) {
    return clicked ? LoginScreen(userRepository: userRepository,) : IntroductionScreen(
      pages: pages,
      onDone: () {
        afterIntroComplete();
      },
      onSkip: () {
        afterIntroComplete();
      },
      showSkipButton: true,
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey)),
      next: const Icon(Icons.navigate_next),
      done: const Text("DONE", style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: DotsDecorator(
          size: const Size.square(7.0),
          activeSize: const Size(20.0, 5.0),
          activeColor: Style.Colors.mainColor,
          color: Colors.black12,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0))),
    );
  }
}
