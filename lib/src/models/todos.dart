class Todos {
  late String title;
  late String image;

  Todos({required this.title, required this.image});
}

// Test data

final List<Todos> todoItems = [
  Todos(
      title: 'Math',
      image:
          'https://img.favpng.com/25/7/23/computer-icons-user-profile-avatar-image-png-favpng-LFqDyLRhe3PBXM0sx2LufsGFU.jpg'),
  Todos(
      title: 'Architecture',
      image:
          'https://www.cnet.com/a/img/liJ9UZA87zs1viJiuEfVnL7YYfw=/940x0/2020/05/18/5bac8cc1-4bd5-4496-a8c3-66a6cd12d0cb/fb-avatar-2.jpg'),
  Todos(
      title: 'Biology',
      image:
          'https://img.favpng.com/25/7/23/computer-icons-user-profile-avatar-image-png-favpng-LFqDyLRhe3PBXM0sx2LufsGFU.jpg'),
  Todos(
      title: 'Math',
      image:
          'https://www.cnet.com/a/img/liJ9UZA87zs1viJiuEfVnL7YYfw=/940x0/2020/05/18/5bac8cc1-4bd5-4496-a8c3-66a6cd12d0cb/fb-avatar-2.jpg'),
  Todos(
      title: 'Architecture',
      image:
          'https://img.favpng.com/25/7/23/computer-icons-user-profile-avatar-image-png-favpng-LFqDyLRhe3PBXM0sx2LufsGFU.jpg'),
  Todos(title: 'Biology', image: ''),
  Todos(title: 'Math', image: ''),
  Todos(title: 'Architecture', image: ''),
];
