/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author Yermek
 */
public class CU {

    public static void sortList(List list, String... fields) {
        Collections.sort(list, new ComparatorByFields(fields));
    }

    public static String upperFirstSym(String s) {
        return s.substring(0, 1).toUpperCase() + s.substring(1);
    }
}
