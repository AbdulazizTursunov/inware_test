import 'package:flutter/material.dart';


class PerfectUi extends StatefulWidget {
  const PerfectUi({super.key});

  @override
  State<PerfectUi> createState() => _PerfectUiState();
}

class _PerfectUiState extends State<PerfectUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(toolbarHeight: 0,elevation: 0,),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius:
                const BorderRadius.only(bottomRight: Radius.circular(50)),
                color: Theme.of(context).primaryColor),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text("Hi Aziz",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: Colors.white)),
                  subtitle: Text("Good morning",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.white)),
                  trailing: const CircleAvatar(
                      radius: 30,
                      backgroundImage:
                      AssetImage('assets/image/profile.jpg')),
                )
              ],
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(100))),
              child: GridView.count(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 30,
                mainAxisSpacing: 40,
                children: [
                  itemDashBoard('video', Icons.video_call, Colors.deepOrange),
                  itemDashBoard('music', Icons.music_note, Colors.purple),
                  itemDashBoard('image', Icons.image, Colors.green),
                  itemDashBoard('video', Icons.video_call, Colors.deepOrange),
                  itemDashBoard('music', Icons.music_note, Colors.purple),
                  itemDashBoard('image', Icons.image, Colors.green),
                  itemDashBoard('video', Icons.video_call, Colors.deepOrange),
                  itemDashBoard('music', Icons.music_note, Colors.purple),
                  itemDashBoard('image', Icons.image, Colors.green),
                  itemDashBoard('video', Icons.video_call, Colors.deepOrange),
                  itemDashBoard('music', Icons.music_note, Colors.purple),
                  itemDashBoard('image', Icons.image, Colors.green),
                  itemDashBoard('video', Icons.video_call, Colors.deepOrange),
                  itemDashBoard('music', Icons.music_note, Colors.purple),
                  itemDashBoard('image', Icons.image, Colors.green),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  itemDashBoard(String title, IconData icon, Color backgroundColor) =>
      Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 5),
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
              )
            ]),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(title, style: Theme.of(context).textTheme.titleMedium)
        ]),
      );
}




























// class PerfectUi extends StatefulWidget {
//   const PerfectUi({super.key});
//
//   @override
//   State<PerfectUi> createState() => _PerfectUiState();
// }
//
// class _PerfectUiState extends State<PerfectUi> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               borderRadius:
//                   const BorderRadius.only(bottomRight: Radius.circular(50)),
//               color: Theme.of(context).primaryColor,
//             ),
//             child: Column(
//               children: [
//                 const SizedBox(height: 50),
//                 ListTile(
//                   contentPadding: const EdgeInsets.symmetric(horizontal: 30),
//                   title: Text(
//                     "Abdulaziz",
//                     style: Theme.of(context)
//                         .textTheme
//                         .headlineSmall!
//                         .copyWith(color: Colors.white),
//                   ),
//                   subtitle: Text(
//                     'Hayrli tong',
//                     style: Theme.of(context)
//                         .textTheme
//                         .headlineMedium!
//                         .copyWith(color: Colors.white),
//                   ),
//                   trailing: const CircleAvatar(
//                     radius: 30,
//                     backgroundImage: AssetImage('assets/image/profile.jpg'),
//                   ),
//                 ),
//                 Container(
//                   // color: Theme.of(context).primaryColor,
//                   child: Container(
//                     margin: EdgeInsets.symmetric(horizontal: 30),
//                     decoration:const BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: const BorderRadius.only(
//                           topLeft: Radius.circular(100),),
//                     ),
//                     child: GridView.count(
//                       padding: EdgeInsets.symmetric(horizontal: 5),
//                       physics: const BouncingScrollPhysics(),
//                       crossAxisCount: 2,
//                       shrinkWrap: true,
//                       crossAxisSpacing: 10,
//                       mainAxisSpacing: 20,
//                       children: [
//                         itemDashBoard(
//                             'video', Icons.video_call, Colors.deepOrange),
//                         itemDashBoard('music', Icons.music_note, Colors.purple),
//                         itemDashBoard('image', Icons.image, Colors.green),
//                         itemDashBoard(
//                             'video', Icons.video_call, Colors.deepOrange),
//                         itemDashBoard('music', Icons.music_note, Colors.purple),
//                         itemDashBoard('image', Icons.image, Colors.green),
//                         itemDashBoard(
//                             'video', Icons.video_call, Colors.deepOrange),
//                         itemDashBoard('music', Icons.music_note, Colors.purple),
//                         itemDashBoard('image', Icons.image, Colors.green),
//                         itemDashBoard(
//                             'video', Icons.video_call, Colors.deepOrange),
//                         itemDashBoard('music', Icons.music_note, Colors.purple),
//                         itemDashBoard('image', Icons.image, Colors.green),
//                         itemDashBoard(
//                             'video', Icons.video_call, Colors.deepOrange),
//                         itemDashBoard('music', Icons.music_note, Colors.purple),
//                         itemDashBoard('image', Icons.image, Colors.green),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   itemDashBoard(String title, IconData icon, Color backgroundColor) =>
//       Container(
//         decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(10),
//             boxShadow: [
//               BoxShadow(
//                 offset: Offset(0, 5),
//                 spreadRadius: 2,
//                 blurRadius: 5,
//                 color: Theme.of(context).primaryColor.withOpacity(0.2),
//               )
//             ]),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(10),
//               decoration:
//                   BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
//               child: Icon(
//                 icon,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               title,
//               style: Theme.of(context).textTheme.titleMedium,
//             )
//           ],
//         ),
//       );
// }
