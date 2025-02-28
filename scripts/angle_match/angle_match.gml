function angle_match(goal, angle) {
    // Convert degrees to radians
    var to_radians = function(deg) { return deg * pi / 180; };

    // Calculate the difference between angles
    var diff = (angle - goal + 360) mod 360;

    // Convert to cosine similarity (-1 to 1)
    return round(cos(to_radians(diff)) * 100) / 100;
}
