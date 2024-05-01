package xyz.tests; //Change me

/**
 * Project imports
 */
import xyz.controller.Controller; //Change me
import xyz.view.XYZPanel; //Change me
import javax.swing.*;

import java.awt.*;
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

public class PanelTest
{
	private Controller testedController; //Change me
	private XYZPanel testedPanel; //Change me

	@BeforeEach
	void setUp() throws Exception
	{
		this.testedController = new Controller(); //Change me
		this.testedPanel = new XYZPanel(testedController); //Change me
	} 

	@AfterEach
	void tearDown() throws Exception
	{
		this.testedController = null;
		this.testedPanel = null;
	}

	@Test
	void testFrameworkMethodsExist()
	{
		Method [] methods = testedPanel.getClass().getDeclaredMethods();
		assertTrue(methods.length >= 3, "You need at least 3 methods in the DataPanel");
		
		boolean hasSetupPanel = false;
		boolean hasSetupListeners = false;
		boolean hasSetupLayout = false;
		
		for (Method method : methods)
		{
			assertTrue(Modifier.isPrivate(method.getModifiers()), "The " + method.getName()+ " method must be private");
			
			if (method.getName().equals("setupPanel"))
			{
				hasSetupPanel = true;
				assertTrue(method.getReturnType().equals(Void.TYPE), "The " + method.getName()+ " method needs to be a void method!");
			}
			else if (method.getName().equals("setupListeners"))
			{
				hasSetupListeners = true;
				assertTrue(method.getReturnType().equals(Void.TYPE), "The " + method.getName()+ " method needs to be a void method!");
				
			}
			else if (method.getName().equals("setupLayout"))
			{
				hasSetupLayout = true;
				assertTrue(method.getReturnType().equals(Void.TYPE), "The " + method.getName()+ " method needs to be a void method!");
			}
		}
		
		assertTrue(hasSetupPanel, "You need a method named setupPanel");
		assertTrue(hasSetupListeners, "You need a method named setupListeners");
		assertTrue(hasSetupLayout, "You need a method named setupLayout");
		
	}
	
	@Test
	void testPanelComponents()
	{
		Field [] fields = testedPanel.getClass().getDeclaredFields();
		assertTrue(fields.length > 2, "You need at least 3 data members in your XYZPanel");
		
		int buttonCount = 0;
		
		boolean hasCorrectLayout = false;
		
		if(testedPanel.getLayout() instanceof SpringLayout)
		{
			hasCorrectLayout = true;
		}
		
		Component [] components = testedPanel.getComponents();
		
		for(Component component : components)
		{
			if (component instanceof JButton)
			{
				buttonCount++;
				JButton tested = (JButton)component;
				assertTrue(tested.getActionListeners().length == 1, "Each button needs a listener");
			}
			if (component instanceof JPanel)
			{
				JPanel subPanel = (JPanel) component;
				assertTrue(subPanel.getLayout() instanceof GridLayout, "Subpanels need GridLayout as the layout manager");
			}
		}
		assertTrue(buttonCount > 0, "You need at least 1 button");
		assertTrue(hasCorrectLayout, "The layout needs to be a SpringLayout");
	}

}
