import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:km_test/src/constant/color.dart';
import 'package:km_test/src/models/user_model.dart';
import 'package:km_test/src/pages/widget/btn_primary.dart';
import 'package:km_test/src/pages/widget/space_w.dart';
import 'package:km_test/src/providers/user/user_provider.dart';
import 'package:km_test/src/routes.dart';
import 'package:provider/provider.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Third Screen",
          style: GoogleFonts.poppins(
            color: black,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: blue,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return const AlertDialog(
                title: Text("Tunggu sebentar"),
                content: SizedBox(
                  width: 100,
                  height: 100,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: primary,
                    ),
                  ),
                ),
              );
            },
          );
          return Provider.of<UserProvider>(
            context,
            listen: false,
          ).refreshData().then((value) {
            Navigator.pop(context);
          });
        },
        child: FutureBuilder<void>(
          future: Provider.of<UserProvider>(context, listen: false).saveAll(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: primary,
                ),
              );
            }
            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 15,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Consumer<UserProvider>(
                      builder: (context, data, _) => ListView.builder(
                        itemCount: data.users.length,
                        itemBuilder: (BuildContext bc, int i) {
                          // print(data.users[i].email);
                          UserModel user = data.users[i];
                          return CardUser(
                            data: user,
                          );
                        },
                      ),
                    ),
                  ),
                  ButtonPrimary(
                    width: MediaQuery.of(context).size.width,
                    text: "Load More",
                    function: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            title: Text("Tunggu sebentar"),
                            content: SizedBox(
                              width: 100,
                              height: 100,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: primary,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                      Provider.of<UserProvider>(
                        context,
                        listen: false,
                      ).nextPage().then((value) {
                        Navigator.pop(context);
                      });
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class CardUser extends StatelessWidget {
  const CardUser({
    Key? key,
    required this.data,
  }) : super(key: key);

  final UserModel data;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<UserProvider>(context, listen: false)
            .getName("${data.firstName} ${data.lastName}");
        Provider.of<UserProvider>(context, listen: false).selection();
        Navigator.pushNamed(context, MyRoute.second);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 18,
        ),
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(
          vertical: 5,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                data.avatar,
              ),
            ),
            spaceW(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${data.firstName} ${data.lastName}",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                  ),
                ),
                Text(
                  data.email,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
