/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Yermek
 */
public class ComparatorByFields implements Comparator<Object> {

    public ComparatorByFields(String... fieldNames) {
        for (String fieldName : fieldNames) {
            getFields().add(fieldName);
        }
    }

    private List<String> fields;

    @Override
    public int compare(Object o1, Object o2) {
        int res = 0;
        for (String fieldName : fields) {
            try {
                Field f1 = o1.getClass().getDeclaredField(fieldName);
                f1.setAccessible(true);
                Object fo1 = f1.get(o1);
                Field f2 = o2.getClass().getDeclaredField(fieldName);
                f2.setAccessible(true);
                Object fo2 = f1.get(o2);
               // System.out.println("fo1 instance " + fo1.getClass());
                if (fo1 instanceof String) {
                    res = ((String) fo1).compareToIgnoreCase((String) fo2);
                } else if (fo1 instanceof Integer) {
                    res = ((Integer) fo1).compareTo((Integer) fo2);
                } else if (fo1 instanceof java.sql.Date) {
                    res = ((java.sql.Date) fo1).compareTo((java.sql.Date) fo2);
                } else {
                    throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
                }
                if (res != 0) {
                    return res;
                }
            } catch (NoSuchFieldException ex) {
                Logger.getLogger(ComparatorByFields.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SecurityException ex) {
                Logger.getLogger(ComparatorByFields.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IllegalArgumentException ex) {
                Logger.getLogger(ComparatorByFields.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IllegalAccessException ex) {
                Logger.getLogger(ComparatorByFields.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return res;
    }

    /**
     * @return the fields
     */
    public List<String> getFields() {
        if (fields == null) {
            fields = new ArrayList<String>();
        }
        return fields;
    }

    /**
     * @param fields the fields to set
     */
    public void setFields(List<String> fields) {
        this.fields = fields;
    }

}
