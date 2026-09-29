import java.net.URL;
import java.net.URLConnection;
import java.io.InputStream;
public class TestSSL {
    public static void main(String[] args) throws Exception {
        URL url = new URL("https://services.gradle.org/distributions/gradle-7.6.3-all.zip");
        URLConnection conn = url.openConnection();
        InputStream is = conn.getInputStream();
        System.out.println("Got input stream, read " + is.read() + " bytes");
    }
}
