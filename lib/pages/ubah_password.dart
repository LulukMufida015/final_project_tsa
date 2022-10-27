import 'package:final_project/data/my_colors.dart';
import 'package:final_project/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UbahPassword extends StatefulWidget {
  const UbahPassword({Key? key}) : super(key: key);

  @override
  State<UbahPassword> createState() => _UbahPasswordState();
}

class _UbahPasswordState extends State<UbahPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:
            Text("Kata Sandi", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(height: 20,),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 25, right: 25, bottom: 10),
              child: Text(
                "Kata Sandi Anda akan diperbarui sesuai dengan kata sandi baru yang Anda isi pada form di bawah ini. Pastikan password baru tidak diketahui user selain Anda!",
                style: TextStyle(color: MyColors.grey_40),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 25, right: 25, bottom: 10),
              child: Text(
                "Kata Sandi Lama",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              alignment: Alignment.centerLeft,
              // padding: EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                maxLines: 1,
                controller: new TextEditingController(),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  border: InputBorder.none,
                  hintText: "Masukkan Kata Sandi Lama",
                  hintStyle:
                      MyText.body1(context)!.copyWith(color: MyColors.grey_40),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        BorderSide(color: MyColors.primaryDark, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: MyColors.grey_20, width: 1),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 25, right: 25, bottom: 10),
              child: Text(
                "Kata Sandi Baru",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              alignment: Alignment.centerLeft,
              // padding: EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                maxLines: 1,
                controller: new TextEditingController(),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  border: InputBorder.none,
                  hintText: "Masukkan Kata Sandi Baru",
                  hintStyle:
                      MyText.body1(context)!.copyWith(color: MyColors.grey_40),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        BorderSide(color: MyColors.primaryDark, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: MyColors.grey_20, width: 1),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 25, right: 25, bottom: 10),
              child: Text(
                "Ulangi Kata Sandi Baru",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              alignment: Alignment.centerLeft,
              // padding: EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                maxLines: 1,
                controller: new TextEditingController(),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  border: InputBorder.none,
                  hintText: "Masukkan Kembali Kata Sandi Baru",
                  hintStyle:
                      MyText.body1(context)!.copyWith(color: MyColors.grey_40),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        BorderSide(color: MyColors.primaryDark, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: MyColors.grey_20, width: 1),
                  ),
                ),
              ),
            ),
          ),
          Container(height: 25,),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                width: (MediaQuery.of(context).size.width),
                child: ElevatedButton(
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                    //   _postDataJson();
                    // }
                  },
                  style:
                      ElevatedButton.styleFrom(primary: MyColors.primaryDark),
                  child: Text("Simpan"),
                ),
              )),
        ],
      )),
    );
  }
}
