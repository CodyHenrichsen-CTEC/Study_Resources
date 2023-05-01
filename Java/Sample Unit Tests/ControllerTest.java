package xxx.tests; // Change!!!!

/**
 * Project imports
 */

import xxx.controller.Controller; // Change!!!!

/**
 * Reflection imports
 */
import java.lang.reflect.*;

/**
 * JUnit imports
 */
import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class ControllerTest
{
	private Controller testedController;

	@BeforeEach
	void setUp() throws Exception
	{
		this.testedController = new Controller();
	}

	@AfterEach
	void tearDown() throws Exception
	{
		this.testedController  = null;
	}


	@Test
	void testStartMethod()
	{
		Method [] methods = testedController.getClass().getDeclaredMethods();

		boolean hasStart = false;

		for (Method method : methods)
		{

			if (method.getName().equals("start"))
			{
				hasStart = true;
				assertTrue(Modifier.isPublic(method.getModifiers()), "The start method must be public");
			}
		}

		assertTrue(hasStart, "The Controller needs a start method");

	}



	@Test
	void testFrame()
	{
		assertTrue(testedController.getFrame() != null, "Can't be null");
	}

	@Test
	void testSomeOtherPiece()
	{
		assertEquals("Description", testedController.toString(), "Words match");
	}

}
