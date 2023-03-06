import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:styled_text/styled_text.dart';

List? titles;
List? about_organowaste;
List? significance;
Future<void> getRecycleData() async {
  var url = Uri.parse("https://microbenotes.com/organic-waste-recycling/");
  final response = await http.get(url);
  dom.Document html = dom.Document.html(response.body);
  titles =
      html.querySelectorAll('strong').map((e) => e.innerHtml.trim()).toList();
  about_organowaste = html
      .querySelectorAll('#post-31539 > div > div > ul > li')
      .map((e) => e.innerHtml.trim())
      .toList();
  significance = html.querySelectorAll("#post-31539 > div > div > ol > li").map((e) => e.innerHtml.trim()).toList();
}

class TextWidget extends StatelessWidget {
  String? write;
  TextWidget(this.write, {super.key});
  @override
  Widget build(BuildContext context) {
    return Text(
      write!,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }
}

class ListBuilder extends StatelessWidget {
  List? write;
  int? ofset;
  int? total;
  ListBuilder(this.write, this.ofset, this.total, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: total,
        itemBuilder: (context, index) {
          return ListTile(
              title: StyledText(
            text: ' <b>${index + 1})</b> ${write![index + ofset!]}',
            tags: {
              'b': StyledTextTag(
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            },
            style: const TextStyle(fontSize: 13),
          ));
        });
  }
}
