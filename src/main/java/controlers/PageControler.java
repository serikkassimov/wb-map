package controlers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import services.DataServices;

/**
 * Created by Serik on 02.12.2015.
 */
@Controller
public class PageControler {
    @Autowired
    private DataServices dataServices;

    @RequestMapping(value = "/index")
    public ModelAndView openMain() {
        return new ModelAndView("index");
    }

    @RequestMapping(value = "/")
    public ModelAndView openIndex() {
        return new ModelAndView("index");
    }

    @RequestMapping(value = "/map")
    public ModelAndView openMap() {
        dataServices.loadSource();
        return new ModelAndView("map");
    }

    @RequestMapping(value = "/mapforedit")
    public ModelAndView openMapForEdit() {
        dataServices.loadSource();
        return new ModelAndView("map_foredit");
    }


    @RequestMapping(value = "/mapfortest")
    public ModelAndView openMapForTest() {
        dataServices.loadSource();
        return new ModelAndView("map_test");
    }


    @RequestMapping(value = "/test_data")
    public ModelAndView openTestData() {
        dataServices.loadSource();
        return new ModelAndView("test_data");
    }


    @RequestMapping(value = "/dataupload")
    public ModelAndView openDataUpload() {
        dataServices.loadSource();
        return new ModelAndView("dataupload");
    }


    @RequestMapping(value = "/login")
    public ModelAndView login() {
        return new ModelAndView("login");
    }

}
