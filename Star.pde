class Star{
  private float x,y,size;
  public Star(){
    x = (float)Math.random() * 400;
    y = (float)Math.random() * 400;
    size = 1 + 3 * (float)(Math.random());
  }
  public void Show(){
    fill(255,255,255);
    ellipse(x,y,size,size);
  }
}
