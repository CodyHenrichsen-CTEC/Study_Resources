package xyz.tests; //Change!

/**
 * Project imports
 */
import xyz.controller.Controller; //Change!
import xyz.view.XYZPanel; //Change!
import xyz.view.XYZFrame; //Change!
import javax.swing.*;

import java.awt.Component;
/**
 * Reflection imports
 */
import java.lang.reflect.*;
/**
 * Testing imports
 */
import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class FrameTest
{
	private Controller testedController; //Change!
	private XYZFrame testedFrame; //Change!

	@BeforeEach
	void setUp() throws Exception
	{
		this.testedController = new Controller();
		this.testedFrame = new XYZFrame(testedController);
	}

	@AfterEach
	void tearDown() throws Exception
	{
		this.testedController = null;
		this.testedFrame = null;
	}

	@Test
	void testChatFrame()
	{
		assertTrue(testedFrame instanceof JFrame, "XYZFrame needs to extend JFrame");
		Method [] methods = testedFrame.getClass().getDeclaredMethods();
		assertTrue(methods.length == 1, "You need 1 method in the ChatFrame");
		assertTrue(methods[0].getName().equals("setupFrame"), "The XYZFrame needs to have a method named setupFrame");
		assertTrue(!testedFrame.isResizable(), "Your XYZFrame should NOT be resizable!");
		assertTrue(testedFrame.getTitle().length() > 5, "Your title needs at least 6 letters");
		assertTrue(testedFrame.getContentPane() instanceof XYZPanel, "Your XYZFrame needs to have a XYZPanel inside");  //Change!
	}

}
