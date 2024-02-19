abstract class welcomeEvents{
  welcomeEvents();
}

class PageEvent extends welcomeEvents{
  final int? page;
  PageEvent({this.page});
}