package org.crowd.utils;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

public class RanImage {

	private static int WIDTH = 110;// 图片宽
	private static int HEIGHT = 35;// 图片高
	public static String code = "";

	public static InputStream getInputStream(BufferedImage image) throws IOException {
		ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
		ImageIO.write(image, "png", byteArrayOutputStream);
		InputStream inputStream = new ByteArrayInputStream(byteArrayOutputStream.toByteArray());
		return inputStream;
	}

	public static BufferedImage getVerification(HttpServletRequest request) {
		// 构造一幅图片,并得到图行
		BufferedImage image = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
		Graphics g = image.getGraphics();
		// 设置图片的背景,并设置图片的边框
		setBackGround(g);

		// 增加线条干扰
		setLine(g);

		// 画出图片中的文字
		String text = setText((Graphics2D) g);
		code = text;
		request.getSession().setAttribute("code",code);
		return image;
	}

	private static String setText(Graphics2D g) {
		int x = 6, y = 24;
		String s = "23456789abcdefghjkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ";
		Color[] color = { Color.BLACK, Color.RED, Color.DARK_GRAY, Color.MAGENTA, Color.ORANGE, Color.YELLOW,
				Color.CYAN, Color.BLUE, Color.ORANGE, Color.GREEN, Color.PINK, Color.GRAY };
		String text = "";
		for (int i = 0; i < 4; i++) {
			int num = new Random().nextInt(color.length);
			String ch = s.charAt(new Random().nextInt(s.length())) + "";
			text = text + ch;
			double degree = (new Random().nextInt(30)) * Math.PI / 180;
			if (!new Random().nextBoolean())
				degree = -degree;
			Color c = color[num];
			g.setColor(c);
			g.setFont(new Font(ch, Font.BOLD, 30));
			g.rotate(degree, x, y);
			g.drawString(ch, x, y);
			g.rotate(-degree, x, y);
			x += 25;// 此处设置字符间距
		}
		return text;
	}

	private static void setLine(Graphics g) {
		Color[] color = { Color.YELLOW, Color.CYAN, Color.BLUE, Color.ORANGE, Color.GREEN, Color.PINK };
		for (int i = 0; i <= 10; i++) {
			int num = new Random().nextInt(color.length);
			Color c = color[num];
			g.setColor(c);
			int x1 = new Random().nextInt(110);
			int y1 = new Random().nextInt(35);

			int x2 = new Random().nextInt(110);
			int y2 = new Random().nextInt(35);
			g.drawLine(x1, y1, x2, y2);
		}
	}

	private static void setBackGround(Graphics g) {
		g.setColor(Color.white);
		g.fillRect(0, 0, WIDTH, HEIGHT);

		g.setColor(Color.BLACK);
		g.drawRect(1, 1, WIDTH - 2, HEIGHT - 2);
	}

}
