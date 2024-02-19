class welcomeStates{
  final int page;
  const welcomeStates({this.page=0});
  welcomeStates copyWith({int? page}){
    return welcomeStates(
      page: page??this.page
    );
  }


}

