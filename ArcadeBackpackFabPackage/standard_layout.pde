/* Buttons to USB Joystick Example

   You must select Joystick from the "Tools > USB Type" menu

   This example code is in the public domain.
*/

#include <Bounce.h>

// Create Bounce objects for each button.  The Bounce object
// automatically deals with contact chatter or "bounce", and
// it makes detecting changes very simple.

//action buttons lp, mp, hp, lk, mk, hk
Bounce button0 = Bounce(0, 10);
Bounce button1 = Bounce(1, 10);  // 10 = 10 ms debounce time
Bounce button2 = Bounce(2, 10);  // which is appropriate for
Bounce button3 = Bounce(3, 10);  // most mechanical pushbuttons
Bounce button4 = Bounce(4, 10);
Bounce button5 = Bounce(5, 10);

//start button
Bounce button6 = Bounce(6, 10);

//these are for the directional buttons
Bounce button7 = Bounce(7, 10);
Bounce button8 = Bounce(8, 10);
Bounce button9 = Bounce(9, 10);
Bounce button10 = Bounce(10, 10);

boolean u = false;
boolean d = false;
boolean l = false;
boolean r = false;

void setup() {
  // Configure the pins for input mode with pullup resistors.
  // The pushbuttons connect from each pin to ground.  When
  // the button is pressed, the pin reads LOW because the button
  // shorts it to ground.  When released, the pin reads HIGH
  // because the pullup resistor connects to +5 volts inside
  // the chip.  LOW for "on", and HIGH for "off" may seem
  // backwards, but using the on-chip pullup resistors is very
  // convenient.  The scheme is called "active low", and it's
  // very commonly used in electronics... so much that the chip
  // has built-in pullup resistors!
  pinMode(0, INPUT_PULLUP);
  pinMode(1, INPUT_PULLUP);
  pinMode(2, INPUT_PULLUP);
  pinMode(3, INPUT_PULLUP);
  pinMode(4, INPUT_PULLUP);
  pinMode(5, INPUT_PULLUP);
  pinMode(6, INPUT_PULLUP);  // Teensy++ LED, may need 1k resistor pullup
  pinMode(7, INPUT_PULLUP);
  pinMode(8, INPUT_PULLUP);
  pinMode(9, INPUT_PULLUP);
  pinMode(10, INPUT_PULLUP);
}

void loop() {
  // Update all the buttons.  There should not be any long
  // delays in loop(), so this runs repetitively at a rate
  // faster than the buttons could be pressed and released.
  button0.update();
  button1.update();
  button2.update();
  button3.update();
  button4.update();
  button5.update();
  button6.update();
  button7.update();
  button8.update();
  button9.update();
  button10.update();

  // Check each button for "falling" edge.
  // Update the Joystick buttons only upon changes.
  // falling = high (not pressed - voltage from pullup resistor)
  //           to low (pressed - button connects pin to ground)
  if (button0.fallingEdge()) {
    Joystick.button(1, 1);
  }
  if (button1.fallingEdge()) {
    Joystick.button(2, 1);
  }
  if (button2.fallingEdge()) {
    Joystick.button(3, 1);
  }
  if (button3.fallingEdge()) {
    Joystick.button(4, 1);
  }
  if (button4.fallingEdge()) {
    Joystick.button(6, 1);
  }
  if (button5.fallingEdge()) {
    Joystick.button(8, 1);
  }
  
  if (button6.fallingEdge()) {
    Joystick.button(10, 1);
  }
  
  if (button7.fallingEdge()) {
    u = true;
  }
  if (button8.fallingEdge()) {
    d = true;
  }
  if (button9.fallingEdge()) {
    l = true;
  }
  if (button10.fallingEdge()) {
    r = true;
  }

  // Check each button for "rising" edge
  // Update the Joystick buttons only upon changes.
  // rising = low (pressed - button connects pin to ground)
  //          to high (not pressed - voltage from pullup resistor)
  if (button0.risingEdge()) {
    Joystick.button(1, 0);
  }
  if (button1.risingEdge()) {
    Joystick.button(2, 0);
  }
  if (button2.risingEdge()) {
    Joystick.button(3, 0);
  }
  if (button3.risingEdge()) {
    Joystick.button(4, 0);
  }
  if (button4.risingEdge()) {
    Joystick.button(6, 0);
  }
  if (button5.risingEdge()) {
    Joystick.button(8, 0);
  }
  
  
  if (button6.risingEdge()) {
    Joystick.button(10, 0);
  }
  
  
  if (button7.risingEdge()) {
    u = false;
  }
  if (button8.risingEdge()) {
    d = false;
  }
  if (button9.risingEdge()) {
    l = false;
  }
  if (button10.risingEdge()) {
    r = false;
  }
  
  
  //use this for hat mode
  /*
  int angle = -1;
  if(u)
  {
    if(l) angle = 135;
    else if(r) angle = 45;
    else angle = 90;
  } else if (d)
  {
    if(l) angle = 225;
    else if(r) angle = 315;
    else angle = 270;
  } else if(l) angle = 180;
  else if (r) angle = 0;
  Joystick.hat(angle);*/
  
  //axis mode
  if(l) Joystick.X(0);
  else if (r) Joystick.X(1023);
  else Joystick.X(512);
  
  if(u) Joystick.Y(0);
  else if (d) Joystick.Y(1023);
  else Joystick.Y(512);
}
