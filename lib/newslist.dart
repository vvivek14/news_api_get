import 'package:flutter/material.dart';
import 'package:news/models/newsrenspons.dart';
import 'package:news/searvice/searvice_api.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsList extends StatefulWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  Future<void> _launchInBrowser(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'News App',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'business, or am working on behalf of a business',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: FutureBuilder<List<Articles>?>(
                  future: NewsApi().fetchnewsArticle(),
                  builder: ((context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      List<Articles>? newsArticle = snapshot.data;
                      return SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                            itemCount: newsArticle?.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ListTile(
                                    onTap: () async {
                                      // launch(snapshot.data![index].link!);
                                      await launchUrl(Uri.parse(snapshot
                                              .data![index].link
                                              .toString()))
                                          ? await launchUrl(Uri.parse(snapshot
                                              .data![index].link
                                              .toString()))
                                          : throw 'could not launch ${newsArticle![index].link}';
                                    },
                                    // tileColor: Colors.blue,
                                    title: Text(
                                      newsArticle![index].title!,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    subtitle: Text(
                                      newsArticle[index].summary!,
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    leading: snapshot.data![index].media != null
                                        ? Container(
                                            width: 100,
                                            // /height: 200,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade200,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  newsArticle[index].media!,
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          )
                                        : null,
                                  ),
                                  const Divider(
                                    thickness: 1,
                                  )
                                ],
                              );
                            }),
                      );
                    }
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
