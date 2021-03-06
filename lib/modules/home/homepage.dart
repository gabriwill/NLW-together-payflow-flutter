//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:payflow/modules/extrato/extratopage.dart';
import 'package:payflow/modules/home/homecontroller.dart';
import 'package:payflow/modules/meusboletos/meusboletospage.dart';
import 'package:payflow/shared/models/usermodel.dart';
import 'package:payflow/shared/themes/appcolors.dart';
import 'package:payflow/shared/themes/apptextstyles.dart';
import 'package:payflow/shared/widgets/boletolist/boletolistcontroller.dart';

import '../../main.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with RouteAware {
  final controller = HomeController();
  final bListController = BoletoListController();
  List<Widget>? pages;
  _HomePageState() {
    pages = [
      Container(
        child: MeusBoletosPage(
          bListcontroller: bListController,
        ),
      ),
      Container(
        child: ExtratoPage(
          bListcontroller: bListController,
        ),
      ),
    ];
  }
  @override
  void initState() {
    pages = [
      Container(
        child: MeusBoletosPage(
          bListcontroller: bListController,
        ),
      ),
      Container(
        child: ExtratoPage(
          bListcontroller: bListController,
        ),
      ),
    ];
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    bListController.dispose();
    super.dispose();
  }

  @override
  void didPush() {
    //print('didPush Page2');
  }

  @override
  void didPopNext() {
    // ignore: invalid_use_of_protected_member
    //(context as Element).reassemble();
    bListController.getBoletos();
    //print('didPopNext Page2');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(144),
        child: Container(
          color: AppColors.primary,
          height: 144,
          child: Center(
            child: ListTile(
              title: Text.rich(TextSpan(
                  text: "Ol??, ",
                  style: TextStyles.titleRegular,
                  children: [
                    TextSpan(
                        text: "${widget.user.name}",
                        style: TextStyles.buttonBoldBackground)
                  ])),
              subtitle: Text(
                "Mantenha suas contas em dia",
                style: TextStyles.captionShape,
              ),
              trailing: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                  image:
                      DecorationImage(image: NetworkImage(widget.user.photo!)),
                ),
              ),
            ),
          ),
        ),
      ),
      body: pages![controller.currentPage],
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                icon: Icon(
                  Icons.home,
                  color: controller.currentPage == 0
                      ? AppColors.primary
                      : AppColors.body,
                ),
                onPressed: () {
                  controller.setPage(0);
                  setState(() {});
                }),
            GestureDetector(
              child: Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(5)),
                child: IconButton(
                    icon: Icon(
                      Icons.add_box_outlined,
                      color: AppColors.background,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/barcodescanner");
                    }),
              ),
            ),
            IconButton(
                icon: Icon(
                  Icons.description_outlined,
                  color: controller.currentPage == 1
                      ? AppColors.primary
                      : AppColors.body,
                ),
                onPressed: () {
                  controller.setPage(1);
                  setState(() {});
                }),
          ],
        ),
      ),
    );
  }
}
