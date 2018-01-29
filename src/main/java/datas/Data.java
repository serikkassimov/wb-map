package datas;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;

/**
 * Created by Serik on 03.12.2015.
 */
public class Data {
    protected String code;
    protected String descript;
    private String color;
    protected double value;

    public Data() {

    }

    public Data(String acode) {
        this.code = acode;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDescript() {
        return descript;
    }

    public void setDescript(String descript) {
        this.descript = descript;
    }




    public void setValue(double val) {
       this.value=val;
    }
    public double getValue() {
      return this.value;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }
}
