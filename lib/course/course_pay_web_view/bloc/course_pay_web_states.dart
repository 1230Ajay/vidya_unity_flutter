class PayViewStates{
  final String url;
  const PayViewStates({this.url=''});

  PayViewStates copyWith({String? url}){
    return PayViewStates(url: url??this.url);
  }
}