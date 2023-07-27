import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:mobile_banking/utils/WAColors.dart';
import 'package:mobile_banking/utils/WAWidgets.dart';

import '../Controllers/recipentsController.dart';
import '../model/cardDetailsModel.dart';
import '../screen/WADashboardScreen.dart';

class WAMoneyTransferCompleteDialog extends StatefulWidget {
  // final CreditCardModel data;
  // const WAMoneyTransferCompleteDialog({
  //   Key? key,
  //   required this.data,
    
  // })  : assert(data != null),
  //       super(key: key);
  static String tag = '/WAMoneyTransferCompleteDialog';

  @override
  WAMoneyTransferCompleteDialogState createState() => WAMoneyTransferCompleteDialogState();
}

class WAMoneyTransferCompleteDialogState extends State<WAMoneyTransferCompleteDialog> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReceiptsNameController());
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        waCommonCachedNetworkImage(
            'https://media.istockphoto.com/vectors/online-payment-service-banking-or-money-transfer-with-mobile-app-and-vector-id1152615463?k=20&m=1152615463&s=612x612&w=0&h=BoT8RNVKIw1YC_3yhXv-5wrVxXM9NmoaZJx_CKG_3zw=',
            height: 200,
            width: 200,
            fit: BoxFit.fill),
        16.height,
        Text('Done!', style: secondaryTextStyle()),
        16.height,
        Text('Money Transfer Complete', style: boldTextStyle(size: 22), textAlign: TextAlign.center),
        8.height,
        createRichText(list: [
          TextSpan(text: "You have sent ${controller.newamountController.text.toString()} to ", style: secondaryTextStyle()),
          TextSpan(text: " ${controller.receiptsNameController.text.toString()}", style: boldTextStyle()),
        ], textAlign: TextAlign.center),
        8.height,
        Text('Account no endings ***${controller.reciverAccountNumController.text.toString()}', style: secondaryTextStyle()),
        30.height,
        AppButton(
          color: WAPrimaryColor,
          width: 180,
          height: 50,
          shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          text: "Back to Home",
          onTap: () {
            WADashboardScreen(/*data: widget.data,*/).launch(context);
          },
          textStyle: boldTextStyle(color: Colors.white),
        ),
        16.height,
      ],
    );
  }
}
