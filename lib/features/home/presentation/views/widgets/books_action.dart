import 'package:bookly_app/core/utils/Function/launch_url.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/widgets/custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const  EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
         const  Expanded(
            child: CustomButton(
              text: 'Free',
              textColor: Colors.black,
              backgroundColor: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16)),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () async{
                luanchCustomUrl(context, "bookModel.volumeInfo.previewLink!");
              },
              text: getText(bookModel),//bookModel.volumeInfo.previewLink==null?'Not Available':'Preview(),
              textColor: Colors.white,
              backgroundColor:const  Color(0xffEF8262),
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16)),
            ),
          )
        ],
      ),
    );
  }
  
 String getText(BookModel bookModel){
    if(bookModel.volumeInfo.previewLink==null){
      return 'Not Available';
    }
    else{
      return 'Preview';
    }
    
  }
}
