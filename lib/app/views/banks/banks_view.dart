import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/app/bloc/bank_bloc.dart';
import 'package:test/app/bloc/bank_events.dart';
import 'package:test/app/bloc/bank_state.dart';
import 'package:test/app/models/bank_model.dart';
import 'package:test/app/views/banks/details_banks_view.dart';

//layot references:https://github.com/akmak1103/E-Commerce-UI-Flutter
//search references:https://www.kindacode.com/article/how-to-create-a-filter-search-listview-in-flutter/
class BanksView extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  BanksView({Key? key}) : super(key: key);

  @override
  State<BanksView> createState() => _BanksViewState();
}

class _BanksViewState extends State<BanksView> {
  late bool orderList = true;
  late List<BankModel> _foundBanks = [];
  // final List<BankModel> _allBanks = [
  //   BankModel(id: "1", name: "Brasil"),
  //   BankModel(id: "2", name: "Caixa"),
  //   BankModel(id: "3", name: "NuBank"),
  //   BankModel(id: "4", name: "Itau"),
  //   BankModel(id: "5", name: "C6"),
  //   BankModel(id: "6", name: "Parana"),
  //   BankModel(id: "7", name: "Bahia"),
  //   BankModel(id: "8", name: "Santander"),
  //   BankModel(id: "9", name: "Carrefour"),
  //   BankModel(id: "10", name: "PagSeguro"),
  // ];
  late final BankBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = BankBloc();
    bloc.inputBank.add(LoadBankEvent());
    // _foundBanks = bloc.;
    // _foundBanks.sort(
    //   (a, b) {
    //     return a.name!.toLowerCase().compareTo(b.name!.toLowerCase());
    //   },
    // );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    bloc.inputBank.close();
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
      // onChanged: (value) => bloc,
      // onChanged: (value) => _runFilter(value),
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
            onPressed: () => {},
            // onPressed: () => _changeOrder(),
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
      height: height * 0.5,
      child: StreamBuilder<BankState>(
          stream: bloc.stream,
          builder: (context, snapshot) {
            final bankList = snapshot.data?.banks ?? [];
            return ListView.builder(
              itemCount: bankList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return DetailsBanksViews(title: bankList[index].name);
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
                                "${bankList[index].name}",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 22,
                                ),
                              ),
                              Text(
                                '${bankList[index].id}',
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
                );
              },
            );
          }),
      // : const Center(
      //     child: Text(
      //       'No results found',
      //       style: TextStyle(fontSize: 24),
      //     ),
      //   ),
    );
  }

  _changeOrder() {
    if (orderList == true) {
      setState(() {
        orderList = !orderList;
        _foundBanks.sort(
          (a, b) {
            return b.name!.toLowerCase().compareTo(a.name!.toLowerCase());
          },
        );
      });
    } else {
      setState(() {
        orderList = !orderList;
        _foundBanks.sort(
          (a, b) {
            return a.name!.toLowerCase().compareTo(b.name!.toLowerCase());
          },
        );
      });
    }
  }

  _runFilter(String text) async {
    List<BankModel> results = [];
    if (text.isEmpty) {
      results = [];
    } else {
      // results =   bloc. where((item)=>item.contains(keyword)).toList();
      // results = _foundBanks
      //     .where((bank) =>
      //         bank.name.toString().toLowerCase().contains(text.toLowerCase()))
      //     .toList();
    }

    // Refresh the UI
    setState(() {
      _foundBanks = results;
    });
  }
}
