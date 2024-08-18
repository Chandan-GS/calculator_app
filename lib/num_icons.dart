import 'package:flutter/material.dart';

class NumIcons extends StatelessWidget {
  final String numIcon;
  final VoidCallback func;

  // Define final variables for button styles
  final MaterialStateProperty<Color?> backgroundColorButton;
  final Color buttonColorText;
  final MaterialStateProperty<Color?> overlayColor;

  NumIcons({
    super.key,
    required this.numIcon,
    required this.func,
  })  : backgroundColorButton = _getBackgroundColor(numIcon),
        buttonColorText = _getButtonColorText(numIcon),
        overlayColor = _getOverlayColor(numIcon);

  // Helper methods to determine colors
  static MaterialStateProperty<Color?> _getBackgroundColor(String numIcon) {
    if (['C', '/', 'x', '-', '+'].contains(numIcon)) {
      return const MaterialStatePropertyAll(Color.fromARGB(251, 255, 144, 34));
    }
    return const MaterialStatePropertyAll(Color.fromARGB(250, 101, 101, 101));
  }

  static Color _getButtonColorText(String numIcon) {
    if (['C', '/', 'x', '-', '+'].contains(numIcon)) {
      return const Color.fromARGB(238, 19, 19, 19);
    }
    return const Color.fromARGB(239, 218, 218, 218);
  }

  static MaterialStateProperty<Color?> _getOverlayColor(String numIcon) {
    if (['C', '/', 'x', '-', '+'].contains(numIcon)) {
      return const MaterialStatePropertyAll(Color.fromARGB(255, 255, 180, 100));
    }
    return const MaterialStatePropertyAll(Color.fromARGB(255, 113, 113, 113));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: ElevatedButton(
        onPressed: func,
        style: ButtonStyle(
          overlayColor: overlayColor,
          shadowColor: const MaterialStatePropertyAll(Colors.black),
          backgroundColor: backgroundColorButton,
          elevation: const MaterialStatePropertyAll(4),
          minimumSize: const MaterialStatePropertyAll(Size(70, 70)),
          shape: MaterialStateProperty.all(const CircleBorder()),
        ),
        child: Text(
          numIcon,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: buttonColorText,
          ),
        ),
      ),
    );
  }
}

class SpecialElevatedButton extends StatelessWidget {
  final IconData specialIcon;
  final VoidCallback funcSpecialIcons;

  const SpecialElevatedButton({
    super.key,
    required this.specialIcon,
    required this.funcSpecialIcons,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: ElevatedButton(
        style: ButtonStyle(
          overlayColor: const MaterialStatePropertyAll(
              Color.fromARGB(255, 255, 180, 100)),
          shadowColor: const MaterialStatePropertyAll(Colors.black),
          backgroundColor:
              const MaterialStatePropertyAll(Color.fromARGB(251, 255, 144, 34)),
          elevation: const MaterialStatePropertyAll(4),
          minimumSize: const MaterialStatePropertyAll(Size(70, 70)),
          shape: MaterialStateProperty.all(const CircleBorder()),
        ),
        onPressed: funcSpecialIcons,
        child: Icon(
          specialIcon,
          color: const Color.fromARGB(240, 11, 11, 11),
          size: 24,
        ),
      ),
    );
  }
}
