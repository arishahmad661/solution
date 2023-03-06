import 'package:flutter/material.dart';
import 'package:ellipsis_overflow_text/ellipsis_overflow_text.dart';

import 'newsPageTwo.dart';
class Top extends StatelessWidget {
  String? title;
  String? imagee;
  String? creator;
  String? date;
  int? index;
  Top(this.title, this.imagee, this.creator, this.date, this.index,{super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          Navigator.push(
                    context, MaterialPageRoute(builder: (context) => 
          NewsPageTwo(index)
                     ));
        },
        child: Card(
            child: Row(
          children: [
            // Image.network(imagee!),
            Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: 50,
                        height: 50,
                        child: 
                         imagee != 'null'
                ? Image.network(
                          imagee!,
                          fit: BoxFit.fill,
                        ) :
                        Image.asset("assets/noimage.png"),
                        ),
                  ),
                // : Text("No Image"),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width -
                        100 -
                        8 -
                        18,
                    height: 25,
                    child: EllipsisOverflowText(title!,
                        showEllipsisOnBreakLineOverflow: true
                        // overflow: TextOverflow.ellipsis,
                        ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width -
                        100 -
                        16 -
                        16 -
                        16 -
                        16 - 
                        8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.person,size: 2,),
                            Text(
                              creator!.length >= 6 ? "${creator!.substring(0,6)}.." : creator!
                            ),
                          ],
                        ),
                        date != 'null'
                            ? Row(
                              children: [
                                Icon(Icons.date_range_outlined,size: 2,),
                                Text(date!.substring(0, 10)),
                              ],
                            )
                            : Text("No Date"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}

