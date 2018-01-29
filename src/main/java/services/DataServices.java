package services;

import datas.Data;
import datas.SourceData;
import datas.TreeMapData;
import dict.DictMapObject;
import dict.DictSector;
import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;
import utils.FileItem;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

/**
 * Created by Serik on 03.12.2015.
 */

@Component
public class DataServices {
    @Autowired
    private Environment env;
    private HashMap<String, DictSector> mapDictSectors = new HashMap<>();
    private HashMap<String, DictMapObject> mapDictMapObject = new HashMap<>();
    SourceData sourceData = new SourceData();


    public void loadSource() {
        Properties prop = loadProperties();
        String datafilename = prop.get("datafilename").toString();
        String path = env.getProperty("path") + System.getProperty("file.separator") + datafilename;
        System.out.println(path);
        sourceData.loadData(path);
    }

    public Properties loadProperties() {
        Properties prop = new Properties();
        InputStream input = null;
        try {
            System.out.println(env.getProperty("path"));
            input = new FileInputStream(env.getProperty("path") + System.getProperty("file.separator") + "app.properties");
            prop.load(input);
        } catch (IOException ex) {
            ex.printStackTrace();
        } finally {
            if (input != null) {
                try {
                    input.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        return prop;
    }

    public void saveProperties(Properties prop) {

        OutputStream output = null;
        try {
            output = new FileOutputStream(env.getProperty("path") + System.getProperty("file.separator") + "app.properties");
            prop.store(output, null);
        } catch (IOException ex) {
            ex.printStackTrace();
        } finally {
            if (output != null) {
                try {
                    output.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public List<Data> getOblastData() {
        return sourceData.getAllOblast();
    }

    public String htmlTableDataCommitted(String oblCode) {
        return sourceData.htmlTableDataCommitted(oblCode);
    }

    public String htmlTableDataDisbursed(String oblCode) {
        return sourceData.htmlTableDataDisbursed(oblCode);
    }

    public String htmlTableDataDisbursed() {
        return sourceData.htmlTableDataDisbursed();
    }

    public String htmlTableDataCommitted() {
        return sourceData.htmlTableDataCommitted();
    }

    public List<TreeMapData> getTreeMap(String oblCode) {
        return sourceData.getTreeMap(oblCode);
    }

    public List<TreeMapData> getTreeMap() {
        return sourceData.getTreeMap();
    }


    public String getDataFiles() {
        Properties properties = loadProperties();
        String datafilename = properties.get("datafilename").toString();
        StringBuilder sb = new StringBuilder();
        sb.append("<table>");
        sb.append("<thead>");
        sb.append("<tr>");
        sb.append("<th>N</th>");
        sb.append("<th>File name</th>");
        sb.append("<th colspan='2'>Action</th>");
        sb.append("</tr>");
        sb.append("</thead>");
        List<String> results = new ArrayList<String>();
        String path = env.getProperty("path") + System.getProperty("file.separator");
        File[] files = new File(path).listFiles();
        int i = 0;
        for (File file : files) {
            if (file.isFile()) {
                System.out.println("not:" + file.getName());
                if ((file.getName().endsWith(".xlsx")) & (!file.getName().startsWith("~$"))) {
                    i++;
                    sb.append("<tr>");
                    sb.append("<td>");
                    sb.append(i);
                    sb.append("</td>");
                    sb.append("<td>");
                    sb.append(file.getName());
                    sb.append("</td>");
                    sb.append("<td>");
                    sb.append("<button class=\"ui-button\" onclick='download(\"").append(file.getName()).append("\")'>Download</button>");
                    sb.append("</td>");
                    // sb.append("<td>");
                    //sb.append("<button>Delete</button>");
                    //sb.append("</td>");
                    sb.append("<td>");
                    if (!datafilename.equals(file.getName())) {
                        sb.append("<button class=\"ui-button\" onclick='setmain(\"").append(file.getName()).append("\")'>Set main data</button>");
                    }
                    sb.append("</td>");
                    sb.append("</tr>");
                }
            }
        }
        sb.append("</table>");
        return sb.toString();
    }

    public void setMainFile(String filename) {
        Properties properties = loadProperties();
        properties.setProperty("datafilename", filename);
        saveProperties(properties);
    }


    public byte[] getDownloadFile(String filename) {
        String path = env.getProperty("path") + System.getProperty("file.separator") + filename;
        Path pat = Paths.get(path);
        byte[] data = new byte[0];
        try {
            data = Files.readAllBytes(pat);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return data;
    }

    public void saveUploadFile(String fileName, byte[] bytes) {
        String path = env.getProperty("path") + System.getProperty("file.separator") + fileName;
        try {
            BufferedOutputStream stream =
                    new BufferedOutputStream(new FileOutputStream(new File(path)));
            stream.write(bytes);
            stream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}

