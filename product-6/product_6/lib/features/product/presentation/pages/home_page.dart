import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/product_bloc.dart';
import '../bloc/product_state.dart';
import '../widgets/product_card.dart';
import 'add_page.dart';
import 'details_page.dart';

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
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  print('Loading');
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ErrorState) {
                  print('error');
                  return Center(
                    child: Text(state.message),
                  );
                } else if (state is LoadedAllProductState) {
                  print('Loaded');
                  state.products;
                  return Container(
                    height: (MediaQuery.of(context).size.height) * 0.75,
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: ListView(
                      children: [
                        for (var product in state.products)
                          ProductCard(productObject: product),
                      ],
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color.fromRGBO(63, 81, 243, 1),
          shape: const CircleBorder(),
          child: IconButton(
              onPressed: () {
                 Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddPage(),
              ),
            );
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
}
