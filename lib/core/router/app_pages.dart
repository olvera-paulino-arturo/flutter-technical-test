enum AppPages {
  auth('/auth'),
  moviesDetail('/moviesDetail'),
  maps('/maps'),
  home('/home');

  const AppPages(this.route);
  final String route;
}