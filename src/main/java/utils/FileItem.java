package utils;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

/**
 * Created by Serik on 04.12.2015.
 */
public class FileItem {

    public FileItem(String path) throws FileNotFoundException {
        super();
        setPath(path);
        setInputStream(new FileInputStream(path));
    }

    private String path;

    private InputStream inputStream;

    /**
     * @return the path
     */
    public String getPath() {
        return path;
    }

    /**
     * @param path the path to set
     */
    public void setPath(String path) {
        this.path = path;
    }

    /**
     * @return the inputStream
     */
    public InputStream getInputStream() {
        return inputStream;
    }

    /**
     * @param inputStream the inputStream to set
     */
    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }
}
