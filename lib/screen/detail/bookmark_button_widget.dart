// import 'package:flutter/material.dart';

// class BookmarkButtonWidget extends StatefulWidget {
//   final Tourism tourism;
  
//   const BookmarkButtonWidget({
//     super.key, 
//     required this.tourism
//   });

//   @override
//   State<BookmarkButtonWidget> createState() => _BookmarkButtonWidgetState();
// }

// class _BookmarkButtonWidgetState extends State<BookmarkButtonWidget> {
//   late bool _isBookmarked;

  
  
//   @override
//   void initState() {
//     final tourismInList = bookmarkTourismList.where(
//       (element) => element.id == widget.tourism.id,
//     );
//     setState(() {
//       if (tourismInList.isNotEmpty) {
//         _isBookmarked = true;
//       } else {
//         _isBookmarked = false;
//       }
//     });

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//      onPressed: () {
//        setState(() {
//          if (_isBookmarked) {
//            bookmarkTourismList
//                .removeWhere((element) => element.id == widget.tourism.id);
//          } else {
//            bookmarkTourismList.add(widget.tourism);
//          }
//          _isBookmarked = !_isBookmarked;
//        });
//      },
//       icon: Icon(
//        _isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
//      ),
//     );
//   }
// }
