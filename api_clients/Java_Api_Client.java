public class Java_Api_Client{
    public static void main(String args[]){
	try (java.util.Scanner s = new java.util.Scanner(new java.net.URL("https://api.ipify.org").openStream(), "UTF-8").useDelimiter("\\A")) {
	    System.out.println("My current IP address is " + s.next());
	} catch (java.io.IOException e) {
	    e.printStackTrace();
	}
    }
}
