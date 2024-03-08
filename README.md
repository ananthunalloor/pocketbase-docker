## Overview


Run flyctl launch --build-only

Run flyctl volumes create pb_data --size=1

add to fly.toml
[mounts]
  destination = "/pb/pb_data"
  source = "pb_data"

Run flyctl deploy
