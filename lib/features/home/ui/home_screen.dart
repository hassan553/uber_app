import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_app/core/extension/text_extension.dart';
import 'package:uber_app/core/utils/app_colors.dart';
import 'package:uber_app/features/home/controller/home_controller.dart';

class ChatScreen extends GetView<HomeController> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        leading: null,
        title: Row(
          children: [
            const Icon(Icons.android, color: AppColors.primaryColor, size: 30),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ChatGPT', style: context.f18600),
                FutureBuilder(
                    future: controller.isOnline(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text('• Online',
                            style: context.f16400!
                                .copyWith(color: AppColors.greenColor));
                      } else {
                        return Text('• Offline',
                            style: context.f16400!
                                .copyWith(color: AppColors.bgGrey));
                      }
                    }),
              ],
            ),
          ],
        ),
      ),
      body: GetBuilder<HomeController>(
       
        builder: (controller) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
                child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 15),
                    itemCount: controller.list.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          _buildChatMessage(
                            context: context,
                            isUser: true,
                            message:
                                controller.list[index].keys.first.toString(),
                          ),
                          _buildChatMessage(
                            context: context,
                            isUser: false,
                            message:
                                controller.list[index].values.first.toString(),
                          ),
                        ],
                      );
                    }),
              ),
              const SizedBox(height: 30),
              const MessageInput(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildChatMessage(
      {required bool isUser,
      required String message,
      required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Align(
        alignment: isUser ? Alignment.topRight : Alignment.topLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment:
              isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            if (!isUser)
              const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Icon(Icons.android,
                    color: AppColors.primaryColor, size: 20),
              ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: isUser ? AppColors.primaryColor : Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20),
                  bottomLeft: Radius.circular(isUser ? 20 : 0),
                  bottomRight: Radius.circular(isUser ? 0 : 20),
                ),
              ),
              child: DefaultTextStyle(
                style: context.f16400!.copyWith(
                  color: isUser ? Colors.white : Colors.black,
                ),
                child: AnimatedTextKit(
                  repeatForever: false,
                  isRepeatingAnimation: false,
                  animatedTexts: [TypewriterAnimatedText(message)],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageInput extends GetView<HomeController> {
  const MessageInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
        left: 20,
        right: 20,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller.textController,
              decoration: InputDecoration(
                hintText: 'Write your message',
                hintStyle:
                    context.f16400!.copyWith(color: AppColors.primaryColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send,
                      size: 30, color: AppColors.primaryColor),
                  onPressed: () async {
                    if (controller.textController.text.isNotEmpty) {
                      await controller.getData();
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
