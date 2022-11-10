var rm = ParentPickUp;

if (global.isLastTripOfDay) rm = EndOfDay;
this = new UiButtonOneArg(room_goto, rm);