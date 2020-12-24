import javax.xml.transform.*;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.File;

public class TransformerXSLT {

    private TransformerFactory factory;
    private Transformer transformer;

    public TransformerXSLT() {
        factory = TransformerFactory.newInstance();
    }


    public void defineXslt(File file) throws TransformerConfigurationException {
        Source xslt = new StreamSource(file);
        transformer = factory.newTransformer(xslt);
    }

    public File transformXML(File file, String path) {
        Source xml = new StreamSource(file);
        try {
            File output = new File(path);
            transformer.transform(xml, new StreamResult(output));
            return output;
        } catch (TransformerException e) {
            e.printStackTrace();
        }
        return null;
    }
}
