class Todo {
  late String title;
  late String image;
  late bool isChecked;

  Todo({required this.title, required this.isChecked, required this.image});
}

// // Test data
//
// final List<Todo> todoList = [
//   Todo(
//       title: 'Math',
//       isChecked: false,
//       image:
//           'https://img.favpng.com/25/7/23/computer-icons-user-profile-avatar-image-png-favpng-LFqDyLRhe3PBXM0sx2LufsGFU.jpg'),
//   Todo(
//       title: 'Architecture',
//       isChecked: false,
//       image:
//           'https://www.cnet.com/a/img/liJ9UZA87zs1viJiuEfVnL7YYfw=/940x0/2020/05/18/5bac8cc1-4bd5-4496-a8c3-66a6cd12d0cb/fb-avatar-2.jpg'),
//   Todo(
//       title: 'Biology',
//       isChecked: false,
//       image:
//           'https://img.favpng.com/25/7/23/computer-icons-user-profile-avatar-image-png-favpng-LFqDyLRhe3PBXM0sx2LufsGFU.jpg'),
//   Todo(
//       title: 'Math',
//       isChecked: false,
//       image:
//           'https://www.cnet.com/a/img/liJ9UZA87zs1viJiuEfVnL7YYfw=/940x0/2020/05/18/5bac8cc1-4bd5-4496-a8c3-66a6cd12d0cb/fb-avatar-2.jpg'),
//   Todo(
//       title: 'Architecture',
//       isChecked: false,
//       image:
//           'https://img.favpng.com/25/7/23/computer-icons-user-profile-avatar-image-png-favpng-LFqDyLRhe3PBXM0sx2LufsGFU.jpg'),
//   Todo(title: 'Biology', isChecked: false, image: ''),
//   Todo(title: 'Math', isChecked: false, image: ''),
//   Todo(title: 'Architecture', isChecked: false, image: ''),
// ];
