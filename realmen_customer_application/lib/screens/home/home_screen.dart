import 'package:community_material_icon/community_material_icon.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:realmen_customer_application/models/account_info_model.dart';
import 'package:realmen_customer_application/screens/home/components/recoment_services.dart';
import 'package:realmen_customer_application/screens/home/components/top_barber.dart';
import 'package:realmen_customer_application/screens/home/components/branch_shop_near_you.dart';
import 'package:realmen_customer_application/screens/list_branch/list_branch.dart';
import 'package:realmen_customer_application/screens/message/success_screen.dart';
import 'package:realmen_customer_application/service/account/account_info_service.dart';
import 'package:realmen_customer_application/service/authentication/authenticateService.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:custom_rounded_rectangle_border/custom_rounded_rectangle_border.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen(this.callback);
  Function callback;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  static const String HomeScreenRoute = "/home-screen";
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg.png'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          SafeArea(
              child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 15,
                bottom: 27,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.only(top: 20, left: 0),
                    width: 90.w,
                    height: 90.h,
                    // height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: ListView(
                      children: [
                        Container(
                          height: 80,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          alignment: Alignment.topLeft,
                          child: Image.asset('assets/images/logo.png'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 70,
                          margin: const EdgeInsets.only(right: 25),
                          padding: const EdgeInsets.only(left: 25),
                          decoration: const ShapeDecoration(
                            shape: CustomRoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              // leftSide: BorderSide.none,
                              topRightCornerSide: BorderSide(
                                width: 1,
                                color: Color(0x73444444),
                              ),
                              bottomRightCornerSide: BorderSide(
                                width: 1,
                                color: Color(0x73444444),
                              ),
                              bottomSide: BorderSide(
                                width: 1,
                                color: Color(0x73444444),
                              ),
                              topSide: BorderSide(
                                width: 1,
                                color: Color(0x73444444),
                              ),
                              rightSide: BorderSide(
                                width: 1,
                                color: Color(0x73444444),
                              ),
                            ),
                          ),
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 60,
                                height: 60,
                                child: CircleAvatar(
                                  child: ClipOval(
                                    child: Image.network(
                                      avatarUrl ?? avatarDefault,
                                      scale: 1.0,
                                      fit: BoxFit.cover,
                                      width: 120,
                                      height: 120,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              SizedBox(
                                width: 248,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Chào buổi $time, $name",
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.quicksand(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      "Level 1",
                                      style: GoogleFonts.quicksand(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          color: Colors.white,
                          child: GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 4,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 10,
                            childAspectRatio: 4 / 4.5,
                            children: [
                              cardHolder(
                                'Đặt lịch',
                                Icons.calendar_month,
                                const Color(0xffE3E3E3),
                                () {},
                              ),
                              cardHolder(
                                'Lịch sử đặt lịch',
                                Icons.history,
                                const Color(0xffE3E3E3),
                                () {},
                              ),
                              GestureDetector(
                                onTap: () {
                                  widget.callback(1);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(
                                          color: Color(0xffE3E3E3),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          CommunityMaterialIcons
                                              .view_list_outline,
                                          color: Color(0xff323232),
                                          size: 24,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Bảng giá'.toUpperCase(),
                                        style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              cardHolder(
                                'Realmen Member',
                                CommunityMaterialIcons.crown,
                                const Color(0xffE3E3E3),
                                () {},
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                      ListBranchScreen.ListBranchScreenRoute);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(
                                          color: Color(0xffE3E3E3),
                                          shape: BoxShape.circle,
                                        ),
                                        child: SvgPicture.asset(
                                          'assets/icons/store-marker-outline.svg',
                                          color: const Color(0xff323232),
                                          height: 24,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Chi nhánh'.toUpperCase(),
                                        style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              cardHolder(
                                'Ưu Đãi',
                                CommunityMaterialIcons.ticket_percent_outline,
                                const Color(0xffE3E3E3),
                                () {},
                              ),
                              cardHolder(
                                'Lịch đặt của bạn',
                                CommunityMaterialIcons.calendar_check_outline,
                                const Color(0xffE3E3E3),
                                () {},
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                "Trải Nghiệm Dịch Vụ",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            RecomendServices(),
                            const SizedBox(
                              height: 30,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                "Top Thợ Cắt Tóc",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            barberTop(),
                            const SizedBox(
                              height: 30,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                "Chi Nhánh Gần Bạn",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            branchShopNearYou(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }

  cardHolder(String title, IconData iconData, Color background,
          VoidCallback onTap) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: background,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  iconData,
                  color: const Color(0xff323232),
                  size: 24,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                title.toUpperCase(),
                textAlign: TextAlign.center,
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              )
            ],
          ),
        ),
      );
// Logic
  @override
  void initState() {
    super.initState();
    getAccountInfo();
  }

  AccountInfoModel? accountInfo = AccountInfoModel();
  String? name;
  String? avatarUrl;
  final now = DateTime.now();
  String? time;
  final storage = FirebaseStorage.instance;

  String avatarDefault =
      "https://cdn.vectorstock.com/i/preview-1x/62/38/avatar-13-vector-42526238.jpg";
  Future<void> getAccountInfo() async {
    try {
      AccountService accountService = AccountService();
      final result = await accountService.getAccountInfo();
      if (result['statusCode'] == 200) {
        accountInfo = result['data'] as AccountInfoModel;
        if (accountInfo!.thumbnailUrl != null &&
            accountInfo!.thumbnailUrl != "") {
          var reference = storage.ref('avatar/${accountInfo!.thumbnailUrl}');
          avatarUrl = await reference.getDownloadURL();
        } else {
          var reference = storage.ref('avatar/default-2.png');
          avatarUrl = await reference.getDownloadURL();
        }
        setState(() {
          name = accountInfo!.lastName ?? "";
          time = getTimeOfDay();
          avatarUrl;
        });
      } else if (result['statusCode'] == 403) {
        AuthenticateService authenticateService = AuthenticateService();
        authenticateService.logout();
        _errorMessage("$result['statusCode'] : Cần đăng nhập lại");
      } else {
        _errorMessage("$result['statusCode'] : $result['error']");
      }
    } on Exception catch (e) {
      _errorMessage(e.toString());
      print("Error: $e");
    }
  }

  void _errorMessage(String? message) {
    try {
      ShowSnackBar.ErrorSnackBar(context, message!);
    } catch (e) {
      print(e);
    }
  }

  String getTimeOfDay() {
    if (now.hour >= 6 && now.hour < 12) {
      return "sáng";
    } else if (now.hour >= 12 && now.hour < 15) {
      return "trưa";
    } else if (now.hour >= 15 && now.hour < 19) {
      return "chiều";
    } else if (now.hour >= 19 && now.hour < 6) {
      return "tối";
    }
    return "";
  }
}
