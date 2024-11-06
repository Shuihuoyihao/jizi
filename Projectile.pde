class Projectile {
  float x, y;
  float speedY = -5;

  Projectile(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void update() {
    y += speedY;
  }

  void display() {
    fill(0, 255, 0);
    ellipse(x, y, 10, 10);
  }

  boolean offscreen() {
    return y < 0;
  }

  boolean collide(ArrayList<BasicEnemy> targets) {
    System.out.println("enemy");
    for (int i = targets.size() - 1; i >= 0; i--) {
      BasicEnemy target = targets.get(i);
      float d = dist(x, y, target.x, target.y);
      if (d < 15) {
        targets.remove(i);
        return true;
      }
    }
    return false;
  }
  
  boolean collide(BossEnemy boss) {
    System.out.println("boss");
    if (boss != null && boss.isAlive) {
      float dBoss = dist(x, y, boss.x, boss.y);
      if (dBoss < 15) {
        boss.hitCharacter();
        if (boss.health <= 0) {
          boss.isAlive = false;
        }
        return true;
      }
    }
    return false;
  }
}
