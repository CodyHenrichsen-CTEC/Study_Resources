package chat.tests; //Change me


/**
 * Project imports
 */
import chat.controller.Controller; //Change me
import chat.view.ChatPanel; //Change me
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

class PanelTest
{
	private Controller testedController; //Change me
	private ChatPanel testedPanel; //Change me

	@BeforeEach
	void setUp() throws Exception
	{
		this.testedController = new Controller(); //Change me
		this.testedPanel = new ChatPanel(testedController); //Change me
	} 

	@AfterEach
	void tearDown() throws Exception
	{
		this.testedController = null;
		this.testedPanel = null;
	}

	@Test
	void testPanelMethods()
	{
		Method [] methods = testedPanel.getClass().getDeclaredMethods();
		assertTrue(methods.length >= 4, "You need at least 3 methods in the controller");
		boolean hasSetupPane = false;
		boolean hasSetupPanel = false;
		boolean hasSetupListeners = false;
		boolean hasSetupLayout = false;
		
		for (Method method : methods)
		{
			if (method.getName().equals("setupPanel"))
			{
				hasSetupPanel = true;
				assertTrue(Modifier.isPrivate(method.getModifiers()), "The setupPanel method must be private");
			}
			else if (method.getName().equals("setupListeners"))
			{
				hasSetupListeners = true;
				assertTrue(Modifier.isPrivate(method.getModifiers()), "The setupListeners method must be private");
			}
			else if (method.getName().equals("setupLayout"))
			{
				hasSetupLayout = true;
				assertTrue(Modifier.isPrivate(method.getModifiers()), "The setupLayout method must be private");
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
		assertTrue(fields.length > 2, "You need at least 3 data members in your ChatPanel");
		
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
			
		}

		assertTrue(hasCorrectLayout, "The layout needs to be a SpringLayout");

	}

}
