class Character {
  float x, y;
  PVector position;
  PVector velocity;
  int health = 100;
  float width, height;//题目要求，我也不知道为什么会变色
  boolean alive = true;//这个我觉得没必要，basicenemy没有血量，bossenemy设定受击次数直接消失就行，你看着要不要删

  Character(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void moveCharacter(){
  //根据我的理解，用PVector来设定当前位置移动角色。
  }
  
  void accelerate(){
  //这里要用PVector 判断加速。
  }
  
  void drawCharacter(){
   //dummy method， 供子类重写用。
  fill(150);
  ellipse(position.x, position.y, width, height);
  }
  
  void decreaseCharacter(int damage){ //传入伤害参数减少血量，最低为0.
    health -= damage;
    if (health < 0){
      health = 0;
    }
  }

  boolean hitCharacter(Character other) {
    //与传入对象a判断碰撞。这边的东西我不会写，你看看之前的作业就行
    if (!this.alive || !other.alive) {
      return false;
    }
    float d = dist(this.x, this.y, other.x, other.y);
    
    health -= 10;
    if (health <= 0) {
      alive = false;
    }
    return d < 20;
  }
  
  void update(){
    //调用墙边碰撞和位置更新
    checkWalls();
    moveCharacter();
  }
  
  void checkWalls(){
    //检查角色是否超出边界并进行相应补偿。方法应正确考虑角色的尺寸和形状
  }
  
}
