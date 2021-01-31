var bounce_speed = 2;
if (other.x > x) {other.x += bounce_speed;}
if (other.y > y) {other.y += bounce_speed;}
if (other.x < x) {other.x -= bounce_speed;}
if (other.y < y) {other.y -= bounce_speed;}

other.speed /= 2;
other.direction -= 180;