import 'package:final_project/data/my_colors.dart';
import 'package:final_project/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:date_field/date_field.dart';

class DetailNasabah extends StatefulWidget {
  const DetailNasabah({Key? key}) : super(key: key);

  @override
  State<DetailNasabah> createState() => _DetailNasabahState();
}

class _DetailNasabahState extends State<DetailNasabah> {
  var items = ["Mangga", "Nangka", "Semangka"];
  String dropdownvalue = "items";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Detail Nasabah",
              style: TextStyle(fontWeight: FontWeight.bold)),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.share), onPressed: () {}),
            IconButton(icon: Icon(Icons.bookmark_border), onPressed: () {}),
          ]),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Nama    :", style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Text("Luluk Mufida", style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Jenis    :", style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Text("Funding", style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Created at 08:00 PM 09/09/2022",
                          style:
                              TextStyle(fontSize: 12, color: MyColors.grey_40),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: MyColors.grey_15),
            width: (MediaQuery.of(context).size.width),
            // height: 1000,
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Row(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              color: MyColors.primaryDark,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Icon(
                                Icons.whatsapp,
                                color: MyColors.white,
                                size: 30,
                              ),
                            )),
                        Container(width: 10),
                        Container(
                            decoration: BoxDecoration(
                              color: MyColors.primaryDark,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Icon(
                                Icons.phone,
                                color: MyColors.white,
                                size: 30,
                              ),
                            )),
                        Container(width: 10),
                        Container(
                            decoration: BoxDecoration(
                              color: MyColors.primaryDark,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Icon(
                                Icons.mail,
                                color: MyColors.white,
                                size: 30,
                              ),
                            )),
                        Container(width: 10)
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Form(
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(25),
                              child: Text(
                                "Status",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 25, right: 25),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                // padding: EdgeInsets.symmetric(horizontal: 25),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4))),
                                child: DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                    border: InputBorder.none,
                                    hintText: "Hot",
                                    hintStyle: MyText.body1(context)!
                                        .copyWith(color: MyColors.grey_40),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0),
                                      borderSide: BorderSide(
                                          color: MyColors.primaryDark,
                                          width: 2),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: MyColors.grey_40, width: 1),
                                    ),
                                  ),
                                  // value: dropdownvalue,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  items: items.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownvalue = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(25),
                              child: Text(
                                "Kategori",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 25, right: 25),
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4))),
                                alignment: Alignment.centerLeft,
                                // padding: EdgeInsets.symmetric(horizontal: 25),
                                child: TextField(
                                  maxLines: 1,
                                  controller: new TextEditingController(),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                    border: InputBorder.none,
                                    hintText: "Hot",
                                    hintStyle: MyText.body1(context)!
                                        .copyWith(color: MyColors.grey_40),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: MyColors.primaryDark, width: 2),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: MyColors.grey_20, width: 1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(25),
                              child: Text(
                                "Catatan",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 25, right: 25),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4))),
                                child: TextField(
                                  style: TextStyle(),
                                  keyboardType: TextInputType.multiline,
                                  cursorColor: MyColors.primaryDark,
                                  maxLines: 12,
                                  minLines: 7,
                                  decoration: InputDecoration(
                                    hintText: 'Message',
                                    hintStyle: MyText.body1(context)!
                                        .copyWith(color: MyColors.grey_40),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0),
                                      borderSide: BorderSide(
                                          color: MyColors.primaryDark,
                                          width: 2),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: MyColors.grey_40, width: 1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(25),
                              child: Text(
                                "Tanggal",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 25, right: 25),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4))),
                                child: DateTimeFormField(
                                  decoration: const InputDecoration(
                                    hintStyle: TextStyle(color: Colors.black45),
                                    errorStyle:
                                        TextStyle(color: Colors.redAccent),
                                    border: OutlineInputBorder(),
                                    suffixIcon: Icon(Icons.event_note),
                                    labelText: 'Select Date',
                                  ),
                                  mode: DateTimeFieldPickerMode.date,
                                  autovalidateMode: AutovalidateMode.always,
                                  validator: (e) => (e?.day ?? 0) == 1
                                      ? 'Please not the first day'
                                      : null,
                                  onDateSelected: (DateTime value) {
                                    print(value);
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(25),
                              child: Text(
                                "Dokumen",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Row(
                                children: [
                                  Container(
                                    child: Expanded(
                                        child:
                                            // Text("data"),
                                            ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          primary:
                                              MyColors.hijau.withOpacity(0.4)),
                                      child: Text("Unggah Dokumen"),
                                    )),
                                  ),
                                  Container(
                                    width: 15,
                                  ),
                                  Container(
                                    child: Expanded(
                                        child:
                                            // Text("data"),
                                            ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          primary:
                                              MyColors.hijau.withOpacity(0.4)),
                                      child: Text("Buka Kamera"),
                                    )),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Row(
                                children: [
                                  Container(
                                    child: Text('img_oh_sehun,jpg'),
                                  ),
                                  Container(
                                    width: 15,
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Icon(Icons.close),
                                  )
                                  // Container(
                                  //   child: Expanded(
                                  //     child:
                                  //     // Text("data"),
                                  //     ElevatedButton(onPressed: () {},
                                  //     child: Text("data"),
                                  //     )
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Container(
                                  width: (MediaQuery.of(context).size.width),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        primary: MyColors.primaryDark),
                                    child: Text("Kirim"),
                                  ),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Riwayat",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
          )
        ],
      )),
    );
  }
}
