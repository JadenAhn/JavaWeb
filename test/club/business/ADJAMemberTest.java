/* ADJAMemberTest.java
 * Assignment 4
 * Revision History
 *      Jaden Ahn, 2018.04.11: Created
 */

package club.business;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

public class ADJAMemberTest {
    
    public ADJAMemberTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of getFullName method, of class Member.
     */
    @Test
    public void testGetFullName() {
        System.out.println("getFullName");
        Member instance = new Member();
        String expResult = "Jaden Ahn";
        instance.setFullName(expResult);
        String result = instance.getFullName();
        assertEquals(expResult, result);
    }

    /**
     * Test of getEmailAddress method, of class Member.
     */
    @Test
    public void testGetEmailAddress() {
        System.out.println("getEmailAddress");
        Member instance = new Member();
        String expResult = "jahn2488@conestogac.on.ca";
        instance.setEmailAddress(expResult);
        String result = instance.getEmailAddress();
        assertEquals(expResult, result);
    }

    /**
     * Test of getPhoneNumber method, of class Member.
     */
    @Test
    public void testGetPhoneNumber() {
        System.out.println("getPhoneNumber");
        Member instance = new Member();
        String expResult = "123-456-7890";
        instance.setPhoneNumber(expResult);
        String result = instance.getPhoneNumber();
        assertEquals(expResult, result);
    }

    /**
     * Test of getProgramName method, of class Member.
     */
    @Test
    public void testGetProgramName() {
        System.out.println("getProgramName");
        Member instance = new Member();
        String expResult = "";
        String result = instance.getProgramName();
        assertEquals(expResult, result);
    }

    /**
     * Test of getYearLevel method, of class Member.
     */
    @Test
    public void testGetYearLevel() {
        System.out.println("getYearLevel");
        Member instance = new Member();
        int expResult = 2;
        instance.setYearLevel(expResult);
        int result = instance.getYearLevel();
        assertEquals(expResult, result);
    }

    /**
     * Negative test of isValid method, of class Member.
     */
    @Test
    public void testValidNegative() {
        System.out.println("isValidNegative");
        Member instance = new Member();
        boolean expResult = false;
        boolean result = instance.isValid();
        assertEquals(expResult, result);
    }  
    
    /**
     * Test of constructor method, of class Member.
     */
    @Test
    public void testValidPositive() {
        System.out.println("isValidPositive");
        String full = "Aubrey Delong";
        String email = "aubrey@gmail.com";
        Member instance = new Member(full, email);
        boolean expResult = true;
        boolean result = instance.isValid();
        assertEquals(expResult, result);
    }
}
