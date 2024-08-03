import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: Container(
            margin: const EdgeInsets.only(top: 28.0),
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: AppBar(
              shadowColor: null,
              elevation: 0.0,
              leading: Image.asset(
                'images/placeImage.png',
              ),
              actions: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 14,
                        bottom: 24,
                        child: Image.asset('images/dot.png'),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/trivia');
                        },
                        icon: const Icon(
                          Icons.notifications_outlined,
                          // color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
              title: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'July 31, 2024',
                      style: GoogleFonts.syne(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color.fromRGBO(170, 170, 170, 1),
                        ),
                      ),
                    ),
                    const SizedBox(),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Hello, ',
                            style: GoogleFonts.sora(
                              textStyle: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(102, 102, 102, 1),
                              ),
                            ),
                          ),
                          TextSpan(
                            text: 'Nebil!',
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(0, 0, 0, 1),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            _middlebar(context),
            Container(
              height: (MediaQuery.of(context).size.height) * 0.75,
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: ListView(
                children: [
                  const SizedBox(height: 10),
                  _itemList(context),
                  const SizedBox(height: 20),
                  _itemList(context),
                  const SizedBox(height: 20),
                  _itemList(context),
                  const SizedBox(height: 20),
                  _itemList(context),
                  const SizedBox(height: 20),

                  // _topbar(context),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color.fromRGBO(63, 81, 243, 1),
          shape: const CircleBorder(),
          child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/update_page');
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              )),
        ),
      ),
    );
  }

  Widget _middlebar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.maxFinite,
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Available Products',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Color.fromRGBO(62, 62, 62, 1),
              )),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: Colors.white,
              shape: BoxShape.rectangle,
              border: Border.all(
                color: Colors.grey,
                width: 2,
              ),
            ),
            child: Stack(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/search_page');
                  },
                  icon: const Icon(
                    Icons.search_outlined,
                    size: 24,
                    color: Color.fromRGBO(217, 217, 217, 1),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _itemList(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/details_page');
      },
      child: Container(
        height: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: Colors.white,
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(3, 5),
            ),
          ],
        ),
        // color: Colors.red,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset('images/shoes.png'),
            Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Derby Leather Shoes',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color.fromRGBO(62, 62, 62, 1),
                      ),
                    ),
                  ),
                  Text(
                    '\$120',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                    )),
                  )
                ],
              ),
            ),
            // const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Men’s shoe',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(170, 170, 170, 1),
                        fontSize: 12.0,
                        height: 0.5,
                      ),
                    ),
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(0),
                        height: 24,
                        width: 24,
                        child: Center(
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.star,
                              size: 12,
                              color: Color.fromRGBO(255, 215, 0, 1),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '(4.0)',
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                          color: Color.fromRGBO(170, 170, 170, 1),
                        )),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _topbar(BuildContext context) {
  return SizedBox(
    // width: double.maxFinite,
    child: Row(
      children: <Widget>[
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              child: Image.asset('images/placeImage.png'),
            ),
          ],
        ),
        // const SizedBox(
        //   width: 1,
        // ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text('July 31, 2024'),
              const SizedBox(),
              RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Hello, ',
                    ),
                    TextSpan(
                      text: 'Nebil!',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        SizedBox(
          child: Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications),
              ),
              Image.asset('images/dot.png')
            ],
          ),
        ),
      ],
    ),
  );
}
