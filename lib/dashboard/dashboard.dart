import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../app_config/routerName.dart';
import '../constant.dart';
import '../helper/firebase_helper.dart';
import '../widgets/common_textfeild.dart';

class DashboardScreen extends StatelessWidget {
  int _current = 0;

  final CarouselController _controller = CarouselController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  DashboardScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: dashboardRoute),
        builder: (_) => DashboardScreen());
  }

  TextEditingController searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const NavDrawer(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: blueColor),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      clipBehavior: Clip.hardEdge,
                      child: (user?.photoURL != null)
                          ? CachedNetworkImage(
                              imageUrl: user!.photoURL!,
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            )
                          : Image.asset(
                              userPNG,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
                Flexible(
                  child: CommonTextfield(
                    textEditingController: searchTextController!,
                    hint: "Search Product",
                    prefixIcon: const Icon(
                      Icons.search_outlined,
                      color: blueColor,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border),
                  color: grayColor,
                  iconSize: 30,
                ),
                IconButton(
                  splashRadius: 5.0,
                  onPressed: () {},
                  icon: Stack(fit: StackFit.loose, children: [
                    const Icon(
                      Icons.notifications_outlined,
                    ),
                    Positioned(
                      right: 5,
                      top: 5,
                      child: Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red),
                      ),
                    ),
                  ]),
                  color: grayColor,
                  iconSize: 30,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: grayColor,
            ),
            CarouselSlider(
              items: imageSliders,
              carouselController: _controller,
              options: CarouselOptions(
                  enableInfiniteScroll: false,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.2,
                  enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  onPageChanged: (index, reason) {
                    _current = index;
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageSliders.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  Text(
                    "Category",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "More Category",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: blueColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 160,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                children: [
                  categoryTag(menSVG, "Man Shirt"),
                  categoryTag(productSVG, "Dress"),
                  categoryTag(bagSVG, "Man Work Equipment"),
                  categoryTag(womenBagSVG, "Woman Bag"),
                  categoryTag(shoesSVG, "Man Shoes"),
                  categoryTag(womenshoesSVG, "Woman Shoes"),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  Text(
                    "Flash Sale",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "See More",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: blueColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                children: [
                  productTag(p1PNG, context, "FS - Nike Air Max 270 React...",
                      "\$299,43", "\$534,33", "24% Off"),
                  productTag(p2PNG, context, "FS - QUILTED MAXI CROS...",
                      "\$299,43", "\$534,33", "24% Off"),
                  productTag(p3PNG, context, "FS - Nike Air Max 270 React...",
                      "\$299,43", "\$534,33", "24% Off"),
                  productTag(p4PNG, context, "FS - Nike Air Max 270 React...",
                      "\$299,43", "\$534,33", "24% Off"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(productDayPNG)),
            )
          ],
        ),
      )),
    );
  }
}

class NavDrawer extends StatelessWidget {
  const NavDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(drawerBG), fit: BoxFit.cover),
              color: blueColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: blueColor),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    clipBehavior: Clip.hardEdge,
                    child: (user?.photoURL != null)
                        ? CachedNetworkImage(
                            imageUrl: user!.photoURL!,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          )
                        : Image.asset(
                            userPNG,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    user?.displayName ?? "",
                    style: const TextStyle(
                      fontFamily: poppins,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Text(
                    user?.email ?? "",
                    style: const TextStyle(
                      fontFamily: poppins,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // Navigate to the home screen here
              // For example: Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Navigate to the settings screen here
              // For example: Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout_sharp),
            title: const Text('Logout'),
            onTap: () {
              handleSignOut();
              Navigator.pushNamed(context, signinRoute);
            },
          ),
          // Add more list tiles for additional options as needed
        ],
      ),
    );
  }
}

List<Widget> imageSliders = [
  FlashSale(
      "https://img.freepik.com/premium-vector/megaphone-with-new-product-speech-bubble-banner-loudspeaker-label-business-marketing-advertising-vector-isolated-background-eps-10_399089-1695.jpg"),
  FlashSale(
      "https://assetstorev1-prd-cdn.unity3d.com/key-image/acb3e1b5-9947-482a-892c-b85b97b75573.jpg"),
  FlashSale(
      "https://img.freepik.com/premium-vector/flash-sale-banner-promotion_131000-379.jpg?w=2000"),
  // FlashSale(),
];

Widget FlashSale(String url) {
  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
    clipBehavior: Clip.hardEdge,
    padding: const EdgeInsets.all(4),
    child: CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    ),
  );
}

Widget categoryTag(String assestTag, String tagName) {
  return SizedBox(
    height: 250,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: SvgPicture.asset(
            assestTag,
            height: 80,
            width: 80,
          ),
        ),
        SizedBox(
          width: 80,
          child: Text(
            tagName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: poppins,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget productTag(String assestTag, BuildContext context, String productName,
    String productPrice, String orignalPrice, String discPrice) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    padding: const EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: grayColor, width: 1)),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
          child: Image.asset(
            assestTag,
            height: 100,
            width: 100,
          ),
        ),
        SizedBox(
          width: 100,
          child: Text(
            productName,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontFamily: poppins,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(
          width: 100,
          child: Text(
            productPrice,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontFamily: poppins,
              fontWeight: FontWeight.bold,
              color: blueColor,
              fontSize: 12,
            ),
          ),
        ),
        SizedBox(
          width: 100,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                orignalPrice,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    fontFamily: poppins,
                    fontWeight: FontWeight.normal,
                    color: grayColor,
                    fontSize: 10,
                    decoration: TextDecoration.lineThrough),
              ),
              Text(
                discPrice,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontFamily: poppins,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
