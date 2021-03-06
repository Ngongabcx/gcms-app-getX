import 'package:flutter/material.dart';
import 'package:gcms/app/modules/ActiveGameScreen/views/competition_detail_view.dart';
import 'package:gcms/app/modules/commonWidgets/loader/loader.dart';
import 'package:gcms/app/modules/commonWidgets/search_card.dart';
import 'package:gcms/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'matchInvitationsCard.dart';

class MatchInvitesScreenView extends GetView<HomeController> {
  final _controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    var invitations = _controller.matchInvites.value.payload;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        title: Text(
          ' Match Invites',
          style: Theme.of(context).textTheme.headline3,
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20.0),
          child: _controller.isProcessing.value == true
              ? Loader()
              : Column(
                  children: [
                    SearchCard(),
                    Expanded(
                      child: _controller.matchInvites.value.payload == null
                          ? Center(
                              child: Text("No Invitations."),
                            ) : Obx(
                              () => ListView.builder(
                                itemCount: _controller
                                    .matchInvites.value.payload!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(
                                        CompetitionDetailView(
                                            competition: invitations![index]),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: MatchInvitationsCard(
                                        invitations: invitations![index],
                                      ),
                                    ),
                                  );
                                },
                              ),
                              // ),
                            )
                          ,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
