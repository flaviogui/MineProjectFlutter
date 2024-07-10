import "home.dart";
import "edit.dart";
import "selection.dart";
import "sobre.dart";
import "login.dart";

final routes = {
  "/": (context) => const Home(),
  "/selection": (context) => const Selection(),
  "/edit": (context) => const Edit(),
  "/sobre": (context) => const Sobre(),
  "/login": (context) => const Login()
};
