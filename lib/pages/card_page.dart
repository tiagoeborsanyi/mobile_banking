import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:mobile_banking/data_json/card_json.dart';
import 'package:mobile_banking/theme/color.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: getAppBar(),
      ),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: white,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: black,
          size: 22,
        ),
      ),
      title: const Text(
        "Card",
        style: TextStyle(fontSize: 18, color: black),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert,
            color: black,
            size: 25,
          ),
        ),
      ],
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    final PageController controller = PageController();
    return Column(
      children: [
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: 240,
          child: PageView(
            controller: controller,
            children: List.generate(cardLists.length, (index) {
              return getCards(
                cardLists[index]['amount'],
                cardLists[index]['currency'],
                cardLists[index]['card_number'],
                cardLists[index]['valid_date'],
                cardLists[index]['bg_color'],
              );
            }),
          ),
        )
      ],
    );
  }

  Widget getCards(amount, currency, cardNumber, validDate, bgColor) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              currency,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: black,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              amount,
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Container(
          width: size.width * .85,
          height: 170,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Feather.credit_card,
                  size: 30,
                  color: white.withOpacity(.3),
                ),
                const SizedBox(height: 15),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        cardNumber,
                        style: TextStyle(
                          color: white.withOpacity(.8),
                          fontSize: 20,
                          wordSpacing: 15,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "VALID DATE",
                                style: TextStyle(
                                    color: white.withOpacity(.3), fontSize: 12),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                validDate,
                                style:
                                    const TextStyle(color: white, fontSize: 14),
                              ),
                            ],
                          ),
                          Image.asset(
                            "assets/images/master_card_logo.png",
                            width: 50,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
