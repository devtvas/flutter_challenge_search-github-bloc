import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test/app/views/details_banks.dart';

class ListBanksViews extends StatefulWidget {
  const ListBanksViews({Key? key}) : super(key: key);

  @override
  State<ListBanksViews> createState() => _ListBanksViewsState();
}

class _ListBanksViewsState extends State<ListBanksViews> {
  bool orderList = true;
  List<String> listBank = [
    "Banco do Brasil S.A.",
    "CAIXA ECONOMICA FEDERAL",
    "Banco Inter S.A.",
    "BANCO COOPERATIVO SICREDI S.A.",
    "BANCO COOPERATIVO SICOOB S.A. - BANCO SICOOB",
    "COOPERATIVA DE ECONOMIA E CREDITO MUTUO DOS TRABALHADORES PORTUARIOS DA GRANDE V",
    "PORTOSEG S.A. - CREDITO",
    "J&F DISTRIBUIDORA DE TÍTULOS E VALORES MOBILIÁRIOS LTDA",
    "PAGSEGURO INTERNET INSTITUIÇÃO DE PAGAMENTO S.A.",
    "MERCADO PAGO INSTITUIÇÃO DE PAGAMENTO LTDA.",
    "Banco Agibank S.A.",
    "GAZINCRED S.A. SOCIEDADE DE CRÉDITO",
    "NU PAGAMENTOS S.A. - INSTITUIÇÃO DE PAGAMENTO",
    "CDC SOCIEDADE DE CRÉDITO AO MICROEMPREENDEDOR E À EMPRESADE PEQUENO PORTE LTDA.",
    "PICPAY INSTITUIçãO DE PAGAMENTO S.A.",
    "WILL FINANCEIRA S.A. CRÉDITO",
    "Banco Digio S.A.",
    "Banco C6 S.A.",
    "Banco Caixa Geral - Brasil S.A.",
    "J17 - SOCIEDADE DE CRÉDITO DIRETO S/A",
    "UNAVANTI SOCIEDADE DE CRÉDITO DIRETO S/A",
    "Banco Safra S.A.",
    "Banco Pan S.A.",
    "Banco Votorantim S.A.",
    "ITAÚ UNIBANCO S.A.",
    "Banco Bradesco S.A.",
    "Banco BMG S.A.",
    "Banco BS2 S.A.",
    "BANCO SANTANDER (BRASIL) S.A.",
    "BANCO DIGIMAIS S.A.",
    "Banco Original S.A."
  ];
  @override
  void initState() {
    super.initState();
    listBank.sort((a, b) => a.compareTo(b));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Credifit'), actions: [
        IconButton(
          onPressed: () => switchOrder(),
          icon: Icon(Icons.abc),
        )
      ]),
      body: ListView.builder(
        itemCount: listBank.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailsBanksViews(title: listBank[index])),
              )
            },
            title: Text('${listBank[index]}'),
          );
        },
      ),
    );
  }

  switchOrder() {
    if (orderList == true) {
      setState(() {
        orderList = !orderList;
        listBank.sort((a, b) => b.compareTo(a));
      });
    } else {
      setState(() {
        orderList = !orderList;
        listBank.sort((a, b) => a.compareTo(b));
      });
    }
  }
}
