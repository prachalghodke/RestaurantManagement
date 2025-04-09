package com_prachal_Hotel;

import java.sql.*;

public class DBConnection 
{
    private static Connection con = null;
    
    private DBConnection()
    {
    	
    }
    
    static
    {
    	try
    	{
    		Class.forName(DBInfo.driver);
    		
    		 con = DriverManager.getConnection(DBInfo.dbUrl, DBInfo.dbUName, DBInfo.dbPass);
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    }
    
    
    public static Connection getCon()
    {
    	return con;
    }
}
