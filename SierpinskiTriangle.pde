int siz=750;
boolean invert = true, tri=true, rec=false, circ=false, lin=false;
public void setup()
{
	size(1000,1000);
	background(0, 0, 255);
}
public void draw()
{
	fill(0,0,255);
	rect(0,0,width,height);
	noFill();
	textSize(25);
	fill(0, 0, 0);
	text("More Shapes: "+invert,5,25);
	text("Less Shapes: "+!invert,5,50);
	text("Triangle Fractal: T",5,75);
	text("Square Fractal: R",5,100);
	text("Circle Fractal: E",5,125);
	text("Line Fractal: Y",5,150);
	if(tri)
	{
		sierpinski(250,750,500);
	}
	if(rec)
	{
		sierpinski(250,250,500);
	}
	if(circ)
	{
		sierpinski(500,500,750);
	}
	if(lin)
	{
		sierpinski(500,500,250);
	}
}
public void mousePressed()
{
	if(invert)
	{
		siz/=2;
		fill(0,0,255);
		rect(0,0,width,height);
	}else if(invert==false)
	{
		siz*=2;
		fill(0,0,255);
		rect(0,0,width,height);
	}
}
public void sierpinski(float x, float y, int len) 
{
	if(tri)
	{
		if(len<=siz)
		{
			fill(255,0,0);
			triangle(x,y,x+len,y,x+len/2,y-len);
		}
		if(len>siz)
		{
			fill(255,0,0);
			sierpinski(x,y,len/2);
			sierpinski(x+len/2, y,len/2);
			sierpinski(x+len/4,y-len/2,len/2);
		}
	}
	if(rec)
	{
		if(len<=siz)
		{
			fill(255,0,0);
			rect(x, y, len, len);
		}
		if(len>siz)
		{
			fill(255,0,0);
			sierpinski(x,y,len/2);
			sierpinski(x+len/2,y+len/2,len/2);
			sierpinski(x+len/2,y,len/2);
			sierpinski(x,y+len/2,len/2);
		}
	}
	if(circ)
	{
		if(len<=siz)
		{
			fill(255,0,0);
			ellipse(x, y, len/2, len/2);
		}
		if(len>siz)
		{
			fill(255,0,0);
			ellipse(x, y, len/2, len/2);
			sierpinski(x, y-len/4, len/3);
			sierpinski(x+(len/4)*cos(44.7676999),y+(len/4)*sin(44.7676999),len/3);
			sierpinski(x+len/4,y,len/3);
			sierpinski(x-(len/4)*cos(44.7676999),y+(len/4)*sin(-44.7676999),len/3);
			sierpinski(x,y+len/4,len/3);
			sierpinski(x-(len/4)*cos(3.926990816989),y+(len/4)*sin(3.926990816989),len/3);
			sierpinski(x-len/4,y,len/3);
			sierpinski(x+(len/4)*cos(3.926990816989),y+(len/4)*sin(-3.926990816989),len/3);
			// sierpinski(x, y-len/2, len/2);
			// sierpinski(x+(len/2)*cos(44.7676999),y+(len/2)*sin(44.7676999),len/2);
			// sierpinski(x+len/2,y,len/2);
			// sierpinski(x-(len/2)*cos(44.7676999),y+(len/2)*sin(-44.7676999),len/2);
			// sierpinski(x,y+len/2,len/2);
			// sierpinski(x-(len/2)*cos(3.926990816989),y+(len/2)*sin(3.926990816989),len/2);
			// sierpinski(x-len/2,y,len/2);
			// sierpinski(x+(len/2)*cos(3.926990816989),y+(len/2)*sin(-3.926990816989),len/2);
		}
	}
	if(lin)
	{
		if(len<=siz)
		{
			stroke(255,0,0);
			strokeWeight(1);
			line(x-len,y-len,x+len,y+len);
			line(x-len,y+len,x+len,y-len);
		}
		if(len>siz)
		{
			stroke(255,0,0);
			strokeWeight(1);
			line(x-len,y-len,x+len,y+len);
			line(x-len,y+len,x+len,y-len);
			sierpinski(x-len/2,y-len/2,len/2);
			sierpinski(x+len/2,y+len/2,len/2);
			sierpinski(x-len/2,y+len/2,len/2);
			sierpinski(x+len/2,y-len/2,len/2);
		}
	}
}
public void keyPressed()
{
	switch(key)
	{
		case ' ':
			invert=!invert;
		break;
		case 'e':
			circ=true;
			rec=false;
			tri=false;
			lin=false;
		break;
		case 'r':
			circ=false;
			rec=true;
			tri=false;
			lin=false;
		break;
		case 't':
			circ=false;
			rec=false;
			tri=true;
			lin=false;
		break;
		case 'l':
			circ=false;
			rec=false;
			tri=false;
			lin=true;
		break;
	}
}