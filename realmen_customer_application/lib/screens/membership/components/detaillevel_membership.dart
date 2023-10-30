import 'package:flutter/material.dart';

class DetailLevelMembership extends StatefulWidget {
  const DetailLevelMembership({super.key});

  @override
  State<DetailLevelMembership> createState() => _DetailLevelMembershipState();
}

class _DetailLevelMembershipState extends State<DetailLevelMembership> {
  int totalPoints = 20000;

  // Danh sách các ưu đãi
  List<Offer> offers = [
    Offer('Ưu đãi 1', 'Mô tả ưu đãi 1'),
    Offer('Ưu đãi 2', 'Mô tả ưu đãi 2'),
    Offer('Ưu đãi 3', 'Mô tả ưu đãi 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Tổng trị giá điểm < : ${totalPoints}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  for (var offer in offers)
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Icon
                            Icon(
                              Icons.card_giftcard,
                              color: Colors.red,
                              size: 24,
                            ),
                            // Mô tả ưu đãi
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  offer.name,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                offer.description, //Thông tin về ưu đãi
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: Colors.black,
                          height: 2,
                          thickness: 1,
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Offer {
  final String name;
  final String description;

  Offer(this.name, this.description);
}
