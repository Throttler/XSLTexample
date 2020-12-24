import javax.xml.transform.TransformerConfigurationException;
import java.io.File;

public class Application {
    public static void main(String[] args) {
        TransformerXSLT transformerXSLT = new TransformerXSLT();
        File xslt = new File("src/main/resources/xsltTemplate2.xsl");

        try {
            transformerXSLT.defineXslt(xslt);
        } catch (TransformerConfigurationException e) {
            e.printStackTrace();
        }

        File input = new File("src/main/resources/input2.xml");
        transformerXSLT.transformXML(input,"src/main/resources/output.html");
    }
}
