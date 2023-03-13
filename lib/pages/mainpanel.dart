
import 'package:dairyadmin/controllers/adminDrawercontroller.dart';
import 'package:dairyadmin/pages/webadminpage/webdesktop.dart';
import 'package:dairyadmin/pages/webadminpage/webphone.dart';
import 'package:dairyadmin/res/customfonts.dart';

import 'package:dairyadmin/res/onBackpress.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'webadminpage/customdrawerdata.dart';


class AdminClasses extends StatelessWidget {

  AdminDrawerController adminDrawerController =
  Get.put(AdminDrawerController());
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (builder, constraints) {
      return WillPopScope(
        onWillPop: () {
          onbackpress();
        },

        child: Scaffold(

          backgroundColor: Color(0xFFE2E2E2),
          body: constraints.minWidth > 1030
              ? WebAdminClasses(
                  constraints: constraints,
                )
              : WebPhoneAdminClasses(constraints: constraints,),
        ),
      );
    });
  }
}


