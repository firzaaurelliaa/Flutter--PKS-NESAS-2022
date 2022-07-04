// import 'package:akhir/pilihan_atas.dart';
// import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
// import 'package:flutter/material.dart';

// class ManuallyControlledSlider extends StatefulWidget {
//   const ManuallyControlledSlider({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() {
//     return _ManuallyControlledSliderState();
//   }
// }

// class _ManuallyControlledSliderState extends State<ManuallyControlledSlider> {
//   final CarouselController _controller = CarouselController();

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Percobaan')),
//       body: Center(
//         child: Container(
//           padding: EdgeInsets.all(5),
//           width: 324,
//           height: 147,
//           decoration: BoxDecoration(
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.2),
//                 spreadRadius: 0,
//                 blurRadius: 1.5,
//                 offset: const Offset(0, 7),
//               ),
//             ],
//             borderRadius: BorderRadius.circular(10),
//             color: Colors.purple,
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               FlutterCarousel(
//                 items: [
//                   InkWell(
//                     onTap: () => {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) =>  PilihanAtas(),
//                         ),
//                       ),
//                     },
//                     child: const ImageSlider(
//                       image: "assets/images/AKL.png",
//                     ),
//                   ),
//                   const ImageSlider(
//                     image: "assets/images/OKTP.png",
//                   ),
//                   const ImageSlider(
//                     image: "assets/images/BDP.png",
//                   ),
//                   const ImageSlider(
//                     image: "assets/images/TPM.png",
//                   ),
//                   const ImageSlider(
//                     image: "assets/images/TBSM.png",
//                   ),
//                   const ImageSlider(
//                     image: "assets/images/TKI.png",
//                   ),
//                   const ImageSlider(
//                     image: "assets/images/TL.png",
//                   ),
//                   const ImageSlider(
//                     image: "assets/images/TB.png",
//                   ),
//                   const ImageSlider(
//                     image: "assets/images/TKI.png",
//                   ),
//                   const ImageSlider(
//                     image: "assets/images/DG.png",
//                   ),
//                 ],
//                 options: CarouselOptions(
//                   viewportFraction: 0.3,
//                   aspectRatio: 1.5 / 0.4,
//                   autoPlay: false,
//                   floatingIndicator: true,
//                   enlargeCenterPage: true,
//                   // slideIndicator: CircularWaveSlideIndicator(),
//                   showIndicator: false,
//                 ),
//                 carouselController: _controller,
//               ),
//               SizedBox(height: 16),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 16.0,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       width: 50,
//                       height: 35,
//                       child: Flexible(
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             primary: Color(0xff142D4C),
//                           ),
//                           onPressed: _controller.previousPage,
//                           child: Icon(Icons.arrow_back),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       width: 50,
//                       height: 35,
//                       child: Flexible(
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             primary: Color(0xff142D4C),
//                           ),
//                           onPressed: _controller.nextPage,
//                           child: Icon(Icons.arrow_forward),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ImageSlider extends StatelessWidget {
//   const ImageSlider({
//     Key? key,
//     required this.image,
//   }) : super(key: key);

//   final String image;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 67,
//       height: 67,
//       child: Image.asset(
//         image,
//       ),
//     );
//   }
// }
