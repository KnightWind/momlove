package com.bizconf.inner.portal.util;


import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.InputStream;

import javax.imageio.ImageIO;

public class ImageTool {
	
	private static final int WIDTH=1230;
	private static final int HEIGHT=690;
	
	/**
	 * 缩放图片的方法  支持正确的jpg，png，bmp,gif(动画格式)
	 * @param sourceImage 原始图片
	 * @param destImage 缩放之后图片
	 * @param formatName 文件格式：比如 jpg，png，bmp，gif
	 * @throws Exception
	 */
	public static void getPreviewImage(File sourceImage,File destImage,String formatName)throws Exception{
		//读取原始图片文件
		BufferedImage source =ImageIO.read(sourceImage);
		//创建缩放之后图片画布。
		BufferedImage newImage  =new BufferedImage(WIDTH,HEIGHT,BufferedImage.TYPE_INT_RGB);
		
		int x =source.getWidth();
		int y =source.getHeight();
		
		int x1 =WIDTH;
		int y1 =HEIGHT;
		if( (x*HEIGHT)>(WIDTH*y) ){
			y1=y*WIDTH/x;
		}
		else if((x*HEIGHT)<(WIDTH*y)){
			x1=x*HEIGHT/y;
		}
		Graphics2D g2d= newImage.createGraphics();
		g2d.setColor(new Color(255, 255, 255, 255));

		g2d.fillRect (0, 0, WIDTH, HEIGHT);
		Image image =source.getScaledInstance(x1, y1, Image.SCALE_SMOOTH);
		g2d.drawImage(image, (WIDTH-x1)/2, (HEIGHT-y1)/2, null);
		
		if("gif".equalsIgnoreCase(formatName.trim())){
			AnimatedGifEncoder encoder =new AnimatedGifEncoder();
			encoder.start(destImage.getPath());
			encoder.addFrame(newImage);
			encoder.finish();
		}else{
			
			ImageIO.write(newImage, formatName, destImage);
		}
	}
	
	public static void getPreviewImage(InputStream in,String destImagePath,String formatName)throws Exception{
		File destImage = new File(destImagePath);
		//读取原始图片文件
		BufferedImage source =ImageIO.read(in);
		//创建缩放之后图片画布。
		BufferedImage newImage  =new BufferedImage(WIDTH,HEIGHT,BufferedImage.TYPE_INT_RGB);
		
		int x =source.getWidth();
		int y =source.getHeight();
		
		int x1 =WIDTH;
		int y1 =HEIGHT;
		if( (x*HEIGHT)>(WIDTH*y) ){
			y1=y*WIDTH/x;
		}
		else if((x*HEIGHT)<(WIDTH*y)){
			x1=x*HEIGHT/y;
		}
		Graphics2D g2d= newImage.createGraphics();
		g2d.setColor(new Color(255, 255, 255, 255));
		
		g2d.fillRect (0, 0, WIDTH, HEIGHT);
		Image image =source.getScaledInstance(x1, y1, Image.SCALE_SMOOTH);
		g2d.drawImage(image, (WIDTH-x1)/2, (HEIGHT-y1)/2, null);
		
		if("gif".equalsIgnoreCase(formatName.trim())){
			AnimatedGifEncoder encoder =new AnimatedGifEncoder();
			encoder.start(destImage.getPath());
			encoder.addFrame(newImage);
			encoder.finish();
		}else{
			
			ImageIO.write(newImage, formatName, destImage);
		}
		
	}
	
	public static void getPreviewImage(InputStream in,String destImagePath,int height,int width)throws Exception{
		File destImage = new File(destImagePath);
		String formatName = UploadUtil.getExt(destImagePath);
		//读取原始图片文件
		BufferedImage source =ImageIO.read(in);
		//创建缩放之后图片画布。
		BufferedImage newImage  =new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
		
		int x =source.getWidth();
		int y =source.getHeight();
		
		int x1 =width;
		int y1 =height;
		if( (x*height)>(width*y) ){
			y1=y*width/x;
		}
		else if((x*height)<(width*y)){
			x1=x*height/y;
		}
		Graphics2D g2d= newImage.createGraphics();
		g2d.setColor(new Color(255, 255, 255, 255));
		
		g2d.fillRect (0, 0, width, height);
		Image image =source.getScaledInstance(x1, y1, Image.SCALE_SMOOTH);
		g2d.drawImage(image, (width-x1)/2, (height-y1)/2, null);
		
		if("gif".equalsIgnoreCase(formatName.trim())){
			AnimatedGifEncoder encoder =new AnimatedGifEncoder();
			encoder.start(destImage.getPath());
			encoder.addFrame(newImage);
			encoder.finish();
		}else{
			ImageIO.write(newImage, formatName, destImage);
		}
		
	}
	
	public static void main(String[] args) throws Exception {
		getPreviewImage(new File("D:/resource/mom.jpg"), new File("D:/resource/momds.jpg"),"jpg");
	}
}
