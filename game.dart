import "dart:io";

void main() {
  String player = "X";
  var gamesdashboard = [
    ["", "", ""],
    ["", "", ""],
    ["", "", ""]
  ];

// display function for the UI
  displaydashboard(gamesdashboard);
  // play function to switch and enter input
  play(gamesdashboard, player);
}

void displaydashboard(List gamesdashboard) {
  print(
      "${gamesdashboard[0][0]}  |  ${gamesdashboard[0][1]}  |  ${gamesdashboard[0][2]}");
  print("-----------");
  print(
      "${gamesdashboard[1][0]}  |  ${gamesdashboard[1][1]}  |  ${gamesdashboard[1][2]}");
  print("-----------");
  print(
      "${gamesdashboard[2][0]}  |  ${gamesdashboard[2][1]}  |  ${gamesdashboard[2][2]}");
}

void play(List gamesdashboard, String player) {
  print("Player $player select the box (1-9): ");
  // takes input as box number and converts into an integer and if interger is not passed returns null
  var box = int.tryParse(stdin.readLineSync()!);
  // condition to check the input
  if (box != null && box >= 1 && box <= 9) {
    var row = (box - 1) ~/ 3; // calculate the row
    var col = (box - 1) % 3; //calculate the column
    if (gamesdashboard[row][col] == '') {
      gamesdashboard[row][col] = player;
      //checkwinner function
      checkwinner(gamesdashboard, player);
    } else {
      print("This box has already been taken. Please select another box.");
      play(gamesdashboard, player);
    }
  } else {
    print("Invalid box. Please select a number between 1-9");
  }
}

void checkwinner(List gamesdashboard, String player) {
  displaydashboard(gamesdashboard);
// code to check whether there is a draw
  bool isDraw = true;
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (gamesdashboard[i][j] == '') {
        isDraw = false;
        break; //will be used to break out of inner loop as soon as we realise that the column is empty so that the game can continue.
      }
    }
  }

  if (isDraw) {
    print("I'ts a draw");
    return;
  }
  // checking for the winner
  if (gamesdashboard[0][0] == gamesdashboard[0][1] &&
      gamesdashboard[0][1] == gamesdashboard[0][2] &&
      gamesdashboard[0][0].toString().isNotEmpty) {
    displaywinner(player);
    return;
  } else if (gamesdashboard[1][0] == gamesdashboard[1][1] &&
      gamesdashboard[1][1] == gamesdashboard[1][2] &&
      gamesdashboard[1][0].toString().isNotEmpty) {
    displaywinner(player);
    return;
  } else if (gamesdashboard[2][0] == gamesdashboard[2][1] &&
      gamesdashboard[2][1] == gamesdashboard[2][2] &&
      gamesdashboard[2][0].toString().isNotEmpty) {
    displaywinner(player);
    return;
  } else if (gamesdashboard[0][0] == gamesdashboard[1][0] &&
      gamesdashboard[1][0] == gamesdashboard[2][0] &&
      gamesdashboard[0][0].toString().isNotEmpty) {
    displaywinner(player);
    return;
  } else if (gamesdashboard[0][1] == gamesdashboard[1][1] &&
      gamesdashboard[1][1] == gamesdashboard[2][1] &&
      gamesdashboard[0][1].toString().isNotEmpty) {
    displaywinner(player);
    return;
  } else if (gamesdashboard[0][2] == gamesdashboard[1][2] &&
      gamesdashboard[1][2] == gamesdashboard[2][2] &&
      gamesdashboard[0][2].toString().isNotEmpty) {
    displaywinner(player);
    return;
  } else if (gamesdashboard[0][2] == gamesdashboard[1][1] &&
      gamesdashboard[1][1] == gamesdashboard[2][0] &&
      gamesdashboard[0][2].toString().isNotEmpty) {
    displaywinner(player);
  } else if (gamesdashboard[0][0] == gamesdashboard[1][1] &&
      gamesdashboard[1][1] == gamesdashboard[2][2] &&
      gamesdashboard[0][0].toString().isNotEmpty) {
    displaywinner(player);
    return;
  } else {
    if (player == "X") {
      player = "0";
    } else {
      player = "X";
    }
  }
  play(gamesdashboard, player);
}

void displaywinner(String player) {
  print("Player $player is the winner");
}
