import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/app/models/bank_model.dart';
import 'package:test/app/views/banks/details_banks_view.dart';

//layot references:https://github.com/akmak1103/E-Commerce-UI-Flutter
class ListBankView extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  ListBankView({Key? key}) : super(key: key);

  @override
  State<ListBankView> createState() => _ListBankViewState();
}

class _ListBankViewState extends State<ListBankView> {
  BankModel? bankModel = BankModel();
  // List<BankModel> bankModel = [
  //   BankModel(id: "01", name: "Brasil"),
  //   BankModel(id: "01", name: "Brasil"),
  //   BankModel(id: "01", name: "Brasil"),
  //   BankModel(id: "01", name: "Brasil"),
  //   BankModel(id: "01", name: "Brasil"),
  // ];
  bool? orderList = true;

  @override
  void initState() {
    super.initState();

    bankModel!.listBank.sort((a, b) => a.compareTo(b));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildAppBar(),
              buildTitle(),
              buildSearch(),
              buildTitleList(),
              buildListContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAppBar() {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.menu),
              // Icon(Icons.shopping_cart)
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTitle() {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 25),
      child: Column(
        children: [
          Text(
            'Hello Eduardo,',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: height * 0.011,
          ),
          Text(
            'Administrator',
            style: GoogleFonts.montserrat(
              color: Colors.black45,
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSearch() {
    var ctlSearch = TextEditingController();
    return TextField(
      controller: ctlSearch,
      onChanged: null,
      decoration: InputDecoration(
        hintText: 'Search Bank',
        hintStyle: GoogleFonts.montserrat(color: Colors.black38),
        prefixIcon: Icon(Icons.search),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Colors.white, width: 3)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Colors.white, width: 0)),
        filled: true,
        fillColor: Colors.black.withAlpha(15),
      ),
    );
  }

  Widget buildTitleList() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Alfabetic Order',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              fontSize: 22,
            ),
          ),
          TextButton(
            onPressed: () => switchOrder(),
            child: Text(
              'Change Order',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildListContent() {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 1,
      child: ListView.builder(
        itemCount: bankModel!.listBank.length,
        itemBuilder: (context, index) {
          return Stack(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return DetailsBanksViews(title: bankModel!.listBank[index]);
                  }));
                },
                child: Card(
                  color: const Color(0xffFFE08E),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 18, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              bankModel!.listBank[index],
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                fontSize: 22,
                              ),
                            ),
                            Text(
                              'cod. id',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
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
        },
      ),
    );
  }

  switchOrder() {
    if (orderList == true) {
      setState(() {
        orderList = !orderList!;
        bankModel!.listBank.sort((a, b) => b.compareTo(a));
      });
    } else {
      setState(() {
        orderList = !orderList!;
        bankModel!.listBank.sort((a, b) => a.compareTo(b));
      });
    }
  }

  // onSearch(String text) async {
  //   bankModel!.listBank.clear();
  //   if (text.isEmpty) {
  //     setState(() {});
  //     return;
  //   }

  //   bankModel!.listBank.forEach((userDetail) {
  //     if (bankModel!.listBank.firstName.contains(text) ||
  //         bankModel!.listBank.lastName.contains(text))
  //       _searchResult.add(userDetail);
  //   });

  //   setState(() {});
  // }
}
