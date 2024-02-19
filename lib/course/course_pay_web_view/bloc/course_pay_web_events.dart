abstract class PayWebViewEvents{
  PayWebViewEvents();
}

class TriggerPaymentUrl extends PayWebViewEvents{
  final String? url;
  TriggerPaymentUrl({this.url});
}