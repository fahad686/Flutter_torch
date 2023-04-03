import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';

class TorchScreen extends StatefulWidget {
  const TorchScreen({super.key});
  @override
  State<TorchScreen> createState() => _TorchScreenState();
}

class _TorchScreenState extends State<TorchScreen> {
  var isActive = false;
  //passing Torch controller
  var controller = TorchController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
          backgroundColor: Colors.yellow[300],
          centerTitle: true,
          elevation: 0.0,
          title: const Text(
            "Torch Light",
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          )),
      body: Column(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(isActive
                        ? 'assets/torch_on1.png'
                        : 'assets/torch_off.png'),
                    width: 160,
                    height: 160,
                    color: isActive ? Colors.green[300] : Colors.yellow[300],
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  CircleAvatar(
                    minRadius: 30,
                    maxRadius: 40,
                    child: Transform.scale(
                      scale: 1.5,
                      child: IconButton(
                        color: Colors.yellow[300],
                        onPressed: () {
                          controller.toggle();
                          isActive = !isActive;
                          setState(() {});
                        },
                        icon: const Icon(
                          Icons.power_settings_new_outlined,
                          color: Colors.black38,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Text(
          "Developed By Fahad Brogrammar",
          style: TextStyle(
              color: Colors.yellow[300],
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
        SizedBox(
          height: size.height * 0.05,
        )
      ]),
    );
  }
}
