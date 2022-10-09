function Timer(_id, _duration, _fn) constructor
{
    this = _id;
    fn = _fn;
    displayedTime = _duration;
    currTime = _duration;

    static OnEnd = function()
    {
        fn();
        exit;
    }

    // to move the countdown fn here from the obj after monday
}
