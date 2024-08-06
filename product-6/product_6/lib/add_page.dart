
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 18,
              color: Color.fromRGBO(63, 81, 243, 1),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text(
              'Add product',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(62, 62, 62, 1),
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          _forms(context),
        ],
      ),
    );
  }
}

Widget _forms(BuildContext context) {
  return Container(
    child: Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          height: 190,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(243, 243, 243, 1),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.image_outlined,
                    size: 36,
                  ),
                ),
                Text(
                  'Upload Image',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(62, 62, 62, 1),
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        _textfield(context),
      ],
    ),
  );
}

Widget _textfield(BuildContext context) {
  return Container(
    margin:const EdgeInsets.symmetric(horizontal: 32),
    child: Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Name',
            labelStyle: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(62, 62, 62, 1),
                fontWeight: FontWeight.w500,
              ),
            ),
            border: InputBorder.none,
            fillColor: const Color.fromRGBO(243, 243, 243, 1),
            filled: true,
          ),
          keyboardType: TextInputType.name,
        ),
        const SizedBox(height: 30),
        TextField(
          decoration: InputDecoration(
            labelText: 'Category',
            labelStyle: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(62, 62, 62, 1),
                fontWeight: FontWeight.w500,
              ),
            ),
            border: InputBorder.none,
            fillColor: const Color.fromRGBO(243, 243, 243, 1),
            filled: true,
          ),
          keyboardType: TextInputType.name,
        ),
        const SizedBox(height: 30),
        TextField(
          decoration: InputDecoration(
            labelText: 'Price',
            labelStyle: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(62, 62, 62, 1),
                fontWeight: FontWeight.w500,
              ),
            ),
            border: InputBorder.none,
            fillColor: const Color.fromRGBO(243, 243, 243, 1),
            filled: true,
            suffixIcon: const Icon(Icons.attach_money),
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 30),
        TextField(
          decoration: InputDecoration(
            labelText: 'Description',
            labelStyle: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(62, 62, 62, 1),
                fontWeight: FontWeight.w500,
              ),
            ),
            border: InputBorder.none,
            fillColor: const Color.fromRGBO(243, 243, 243, 1),
            filled: true,
          ),
          keyboardType: TextInputType.name,
          maxLines: 6,
        ),
        Column(
          children: [
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(63, 81, 243, 1),
                  elevation: 5,
                  shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: Text(
                  'Update',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: double.infinity,
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
            )
          ],
        ),
      ],
    ),
  );
}
