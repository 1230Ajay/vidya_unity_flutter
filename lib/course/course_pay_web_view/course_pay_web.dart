import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vidya_unity/common/values/colors.dart';
import 'package:vidya_unity/common/widgets/common_widgets.dart';
import 'package:vidya_unity/course/course_pay_web_view/bloc/course_pay_web_bloc.dart';
import 'package:vidya_unity/course/course_pay_web_view/bloc/course_pay_web_states.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PayView extends StatefulWidget {
  const PayView({super.key});

  @override
  State<PayView> createState() => _PayViewState();
}

class _PayViewState extends State<PayView> {
  late String url;

  @override void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    url = args["url"];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PayWebViewBloc,PayViewStates>(builder: (state,context){
     return Scaffold(
        appBar: AppBar(title:reUsableText(text: "Grab your Course",color: AppColors.primaryText,fontWeight: FontWeight.bold),),
       body: WebViewWidget(controller: WebViewController()
         ..setJavaScriptMode(JavaScriptMode.unrestricted)
         ..setBackgroundColor(const Color(0x00000000))
         ..setNavigationDelegate(
           NavigationDelegate(
             onProgress: (int progress) {
               // Update loading bar.
             },
             onPageStarted: (String url) {},
             onPageFinished: (String url) {},
             onWebResourceError: (WebResourceError error) {},
             onNavigationRequest: (NavigationRequest request) {
               if (request.url.startsWith('https://www.youtube.com/')) {
                 return NavigationDecision.prevent;
               }
               return NavigationDecision.navigate;
             },
           ),
         )
         ..loadRequest(Uri.parse('https://youtube.com'))
       ),
      );
    });
  }
}
