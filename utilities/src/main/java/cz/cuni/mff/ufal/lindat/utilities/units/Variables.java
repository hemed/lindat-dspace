package cz.cuni.mff.ufal.lindat.utilities.units;

import java.io.*;
import java.net.URL;
import java.util.Properties;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;

public class Variables {

	private static final Logger log = Logger.getLogger(Variables.class);
	private static boolean initialized = false;

	public static String emptyName = "";

	public static String databaseURL;
	public static String databaseUser;
	public static String databasePassword;

	/**
	 * Final values not to be changed.
	 */
	public final static String configurationEnabled = "true";
	public final static int invalidIntValue = -1;
	public final static String testProperties = "testProperties";
	public static final String loggingProperties = "utilities.logging";
	public static final String logFile = "utilities.status";

	/**
	 * Loaded properties from the property file.
	 */
	private static Properties properties = new Properties();
	private static String _errorMessage = "";


	/**
	 * Function returns the information whether the used functionality is
	 * enabled
	 * 
	 * @param functionalityName
	 *            is the functionality name
	 * @return true if the configuration is enabled
	 */
	public static boolean isConfigurationTrue(String functionalityName) {
		if (properties.containsKey(functionalityName))
			return properties.getProperty(functionalityName).equals(
					configurationEnabled);
		return false;
	}

	/**
	 * Function returngs the property value for the key.
	 * 
	 * @param key
	 *            is the key in properties
	 * @return the property value as String
	 */
	public static String get(String key) {
		return properties.getProperty(key);
	}

	/**
	 * Function initializes the Variables class.
	 * 
	 * @param path
	 *            is where the property file is stored.
	 */
  public static void init() {
    init(null);
  }
  
  public static void init(String dspace_cfg_path) {
		if (initialized)
			return;
		try {

			Reader reader = null;
			if ( null == dspace_cfg_path ) {
				// try to search inside the archive (jm)
				InputStream is = Variables.class.getClassLoader().getResourceAsStream("modules/lr.cfg");
				if (null == is) {
					is = Variables.class.getClassLoader().getResourceAsStream("config/modules/lr.cfg");
				}
				if ( null != is ) {
					reader = new BufferedReader(new InputStreamReader(is));
				}
				// try to search the original way
				if (null == reader ) {
					URL url = Variables.class.getClassLoader().getResource("modules/lr.cfg");
					if(url == null){
						url = Variables.class.getClassLoader().getResource("config/modules/lr.cfg");
					}
					if ( null != url ) {
						reader = new FileReader(url.getPath());
					}
				}
			}else {
				reader = new FileReader(  new URL(dspace_cfg_path).getPath() );
			}

			// last nasty try
			if (reader == null) {
				log.debug("Failed to find lr.cfg.\nUsing nasty trick.\nThe class loader search was from " + Variables.class.getClassLoader().getResource("./"));
				System.err.println("Failed to find lr.cfg. The class loader search is from " + Variables.class.getClassLoader().getResource("./"));
				URL url = Variables.class.getClassLoader().getResource(Variables.class.getName().replace('.', '/') + ".class");
				url = new URL(  new URL(url.getPath().split("utilities-")[0]), "../../../../config/modules/lr.cfg");
				reader = new FileReader( url.getPath() );
			}

			properties.load(reader);
			databaseURL = get("lr.utilities.db.url");
			databaseUser = get("lr.utilities.db.username");
			databasePassword = get("lr.utilities.db.password");
			initialized = true;
		} catch(Exception e) {
			log.error(e);
		}
	}

	/**
	 * Function sets actual error message.
	 * 
	 * @param object
	 */
	public static void setErrorMessage(String message, boolean append_default_msg) {
		_errorMessage = message;
		if(message!=null && !message.equals("")) {
			log.log(Level.ERROR, "Message '" + message + "' has been set up!");
		}
		if (null != message && append_default_msg) {
			_errorMessage += " For more information please contact our Help Desk.";
		}
	}

	public static void setErrorMessage(String message) {
		setErrorMessage( message, true );
	}
	/**
	 * Function gets actual error message.
	 * 
	 * @return the string representation of the error
	 */
	public static String getErrorMessage() {
		if (_errorMessage == null)
			return "";
		return _errorMessage;
	}

}



