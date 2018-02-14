public int count = 0;
private double fractionLength = .8; 
private int smallestBranch = 6; 
private double branchAngle = .5;  
public void setup() 
{   
	size(640,480);    
	noLoop(); 
} 
public void draw() 
{   
	//background
	background(0);
	for (int i = 0; i < 500; i++)
	{
		stroke(60,60+i/8,60+i/3);
		line(0,i,640,i);
	}   
	stroke(50,150,50); //green
	line(320,480,320,380);   
	drawBranches(320,380,100,3*Math.PI/2);
	count++;
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1 = angle + branchAngle;
	double angle2 = angle + branchAngle;
	double angle3 = angle - branchAngle;
	double angle4 = angle - branchAngle;
	branchLength *= fractionLength;
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);
	int endX3 = (int)(branchLength*Math.cos(angle3) + x);
	int endY3 = (int)(branchLength*Math.sin(angle3) + y);
	int endX4 = (int)(branchLength*Math.cos(angle4) + x);
	int endY4 = (int)(branchLength*Math.sin(angle4) + y);
	if (branchLength < 10)
		stroke(225,225,225); //white
	else if (branchLength < 15)
		stroke(50,20,20); //brown	
	else 
		stroke(50,150,50); //green
		
	line(x,y,endX1,endY1);
	line(x,y,endX2,endY2);
	
	if (branchLength > smallestBranch)
	{
		
		drawBranches(endX1,endY1,branchLength,angle1);
		drawBranches(endX2,endY2,branchLength,angle2);	
		drawBranches(endX3,endY3,branchLength,angle3);	
		drawBranches(endX4,endY4,branchLength,angle4);	
		// drawBranches(endX1,endY1,branchLength,(int)Math.random());
	}
} 
