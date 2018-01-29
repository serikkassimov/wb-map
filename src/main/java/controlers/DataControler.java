package controlers;

import com.google.gson.Gson;
import datas.Data;
import org.apache.poi.util.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import services.DataServices;
import utils.MapConfig;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Serik on 03.12.2015.
 */
@Controller
public class DataControler {
    @Autowired
    private DataServices dataServices;


    @RequestMapping("/getdata")
    public void getData(Map<String, Object> model,
                        final HttpServletRequest request, HttpServletResponse response) {
        PrintWriter out = null;
        response.setContentType("application/json");
        response.setCharacterEncoding("utf8");
        try {
            Map<String, String> m = new HashMap<String, String>();
            Gson gson = new Gson();
            out = response.getWriter();
            List<Data> data = dataServices.getOblastData();
            System.out.println(gson.toJson(data));
            out.print(gson.toJson(data));
        } catch (IOException ex) {
            System.out.println(ex.getStackTrace());
        } finally {
            out.close();
        }
    }

    @RequestMapping("/getmap")
    public void getMap(Map<String, Object> model,
                       final HttpServletRequest request, HttpServletResponse response) {
        PrintWriter out = null;
        response.setContentType("application/json");
        response.setCharacterEncoding("utf8");
        try {
            Map<String, String> m = new HashMap<String, String>();
            Gson gson = new Gson();
            out = response.getWriter();
            MapConfig mapConfig = new MapConfig();
            mapConfig.setText("Kazakhstan: World Bank Projects (1993 - to date)");
            mapConfig.setMax(1200);
            String res = gson.toJson(mapConfig);
            System.out.println(res);
            out.print(res);
        } catch (IOException ex) {
            System.out.println(ex.getStackTrace());
        } finally {
            out.close();
        }
    }

    @RequestMapping("/getoblast")
    public void getOblast(Map<String, Object> model,
                          @RequestParam(value = "oblcode", required = true, defaultValue = "all") String oblcode,
                          final HttpServletRequest request, HttpServletResponse response) {
        PrintWriter out = null;
        response.setContentType("application/json");
        response.setCharacterEncoding("utf8");
        try {
            out = response.getWriter();
            String res = dataServices.htmlTableDataDisbursed(oblcode);
            res = res + dataServices.htmlTableDataCommitted(oblcode);
            out.print(res);
        } catch (IOException ex) {
            System.out.println(ex.getStackTrace());
        } finally {
            out.close();
        }
    }

    @RequestMapping("/getalltable")
    public void getalltable(Map<String, Object> model,
                            final HttpServletRequest request, HttpServletResponse response) {
        PrintWriter out = null;
        response.setContentType("application/json");
        response.setCharacterEncoding("utf8");
        try {
            out = response.getWriter();
            String res = dataServices.htmlTableDataDisbursed();
            res = res + dataServices.htmlTableDataCommitted();
            out.print(res);
        } catch (IOException ex) {
            System.out.println(ex.getStackTrace());
        } finally {
            out.close();
        }
    }


    @RequestMapping("/getoblasttreemap")
    public void getOblastTreeMap(Map<String, Object> model,
                                 @RequestParam(value = "oblcode", required = false, defaultValue = "AS") String oblcode,
                                 final HttpServletRequest request, HttpServletResponse response) {
        PrintWriter out = null;
        response.setContentType("application/json");
        response.setCharacterEncoding("utf8");
        try {
            Gson gson = new Gson();
            out = response.getWriter();
            String res = gson.toJson(dataServices.getTreeMap(oblcode));
            System.out.println(res);
            out.print(res);
        } catch (IOException ex) {
            System.out.println(ex.getStackTrace());
        } finally {
            out.close();
        }
    }

    @RequestMapping("/getkztreemap")
    public void getKzTreeMap(Map<String, Object> model,
                             final HttpServletRequest request, HttpServletResponse response) {
        PrintWriter out = null;
        response.setContentType("application/json");
        response.setCharacterEncoding("utf8");
        try {
            Gson gson = new Gson();
            out = response.getWriter();
            String res = gson.toJson(dataServices.getTreeMap());
            System.out.println(res);
            out.print(res);
        } catch (IOException ex) {
            System.out.println(ex.getStackTrace());
        } finally {
            out.close();
        }
    }

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public String handleFileUpload(
            @RequestParam(value = "file") MultipartFile file) {

        String fileName = file.getOriginalFilename();
        System.out.println(fileName);
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                dataServices.saveUploadFile(fileName,bytes);
                return "redirect:/dataupload";
            } catch (Exception e) {
                return "redirect:/dataupload";
            }
        } else {
            return "redirect:/dataupload";
        }
    }


    @RequestMapping("/getdatafiles")
    public void getDataFiles(Map<String, Object> model,
                             final HttpServletRequest request, HttpServletResponse response) {
        PrintWriter out = null;
        response.setContentType("html/text");
        response.setCharacterEncoding("utf8");
        try {
            out = response.getWriter();
            String res = dataServices.getDataFiles();
            System.out.println(res);
            out.print(res);
        } catch (IOException ex) {
            System.out.println(ex.getStackTrace());
        } finally {
            out.close();
        }
    }


    @RequestMapping(value = "/setmain", method = RequestMethod.GET)
    public String setMain(
            @RequestParam(value = "filename", required = true) String filename,
            final HttpServletRequest request, HttpServletResponse response) {
        dataServices.setMainFile(filename);
        return "redirect:/dataupload";
    }


    @RequestMapping(value = "/download", method = RequestMethod.GET)
    public void download(Map<String, Object> map, @RequestParam(value = "filename", required = true) String filename,
                        final HttpServletRequest request, HttpServletResponse response) {



        byte[] b = dataServices.getDownloadFile (filename);

        if (b != null) {
            response.setContentType("application-xdownload");
            //response.setCharacterEncoding("utf8");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
            response.setHeader("FileName", filename);
            ByteArrayInputStream in = new ByteArrayInputStream(b);
            try {
                OutputStream h = response.getOutputStream();
                IOUtils.copy(in, h);
                IOUtils.closeQuietly(in);
                IOUtils.closeQuietly(h);
                //out = response.getWriter();
               // out.print(b);
            } catch (IOException ex) {

            } finally {

            }
        } else {
            System.out.format("log is null index=%d\n", filename);
        }

    }

}
