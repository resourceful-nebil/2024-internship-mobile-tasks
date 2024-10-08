import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  color: const Color.fromRGBO(190, 162, 155, 350),
                  child: Image.asset('images/shoes.png'),
                ),
                Positioned(
                  right: 304,
                  bottom: 104,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 18,
                          color: Color.fromRGBO(63, 81, 243, 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 32.0, right: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Men’s shoe',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(170, 170, 170, 1),
                        fontSize: 16.0,
                        height: 0.5,
                      ),
                    ),
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(0),
                        height: 30,
                        width: 30,
                        child: Center(
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.star,
                              size: 16.0,
                              color: Color.fromRGBO(255, 215, 0, 1),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '(4.0)',
                        style: GoogleFonts.sora(
                            textStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0,
                          color: Color.fromRGBO(170, 170, 170, 1),
                        )),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0, right: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Derby Leather',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: Color.fromRGBO(62, 62, 62, 1),
                      ),
                    ),
                  ),
                  Text(
                    '\$120',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                      color: Color.fromRGBO(62, 62, 62, 1),
                    )),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                  child: Text(
                    'Size:',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Color.fromRGBO(62, 62, 62, 1),
                    )),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  int displayIndex = 39 + index;

                  Color sizeColor = selectedIndex == index
                      ? const Color.fromRGBO(63, 81, 243, 1)
                      : Colors.white;
                  Color textColor =
                      selectedIndex == index ? Colors.white : Colors.black;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      width: 60,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: sizeColor,
                        shape: BoxShape.rectangle,
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.grey.withOpacity(0.5),
                        //     spreadRadius: 2,
                        //     blurRadius: 3,
                        //     offset: const Offset(0, 5),
                        //   ),
                        // ],
                      ),
                      child: Center(
                        child: Text(
                          '$displayIndex',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color.fromRGBO(102, 102, 102, 1),
                )),
              ),
            ),
            const SizedBox(height: 8),
            _buttons(context),
          ],
        ),
      ),
    );
  }
}

Widget _horizontal_scrolling(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 32),
    height: 60,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        int displayIndex = 39 + index;

        Color sizeColor;
        Color textColor;

        if (index == 41) {
          sizeColor = const Color.fromRGBO(63, 81, 243, 1);
          textColor = Colors.white;
        } else {
          sizeColor = Colors.white;
          textColor = Colors.black;
        }

        return GestureDetector(
          onTap: () {
            // setState(() {
            //     selectedIndex = index;
            //   });
          },
          child: Container(
            width: 60,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: sizeColor,
              shape: BoxShape.rectangle,
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey.withOpacity(0.5),
              //     spreadRadius: 2,
              //     blurRadius: 3,
              //     offset: const Offset(0, 5),
              //   ),
              // ],
            ),
            // color: const Color.fromRGBO(63, 81, 243, 1),
            child: Center(
              child: Text(
                '$displayIndex',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}

Widget _buttons(BuildContext context) {
  return Container(
    height: 70,
    padding: const EdgeInsets.symmetric(horizontal: 32),
    // color: Colors.black,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                color: Colors.red,
                width: 2,
              ),
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {},
            child: Text(
              'Delete',
              style: GoogleFonts.poppins(
                color: Colors.red,
              ),
            ),
          ),
        ),
        const SizedBox(width: 50),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(63, 81, 243, 1),
              elevation: 10,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/update_page');
            },
            child: Text(
              'Update',
              style: GoogleFonts.poppins(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
