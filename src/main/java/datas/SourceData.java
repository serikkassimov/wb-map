package datas;

import org.apache.poi.ss.usermodel.*;
import utils.CU;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.*;

/**
 * Created by Serik on 12.12.2015.
 */
public class SourceData {
    List<SourceDataRow> listSourceData = null;
    HashMap<String, List<SourceDataRow>> sectorMap;
    HashMap<String, String> sectorColors;
    HashMap<String, List<SourceDataRow>> oblastMap;
    HashMap<String, List<SourceDataRow>> projectMap;

    List<Data> oblastDataList;

    public ArrayList<Data> loadData(String fileName) {
        ArrayList<Data> dataArrayList = new ArrayList<>();
        try {
            listSourceData = new ArrayList<>();
            sectorMap = new HashMap<>();
            sectorColors = new HashMap<>();
            oblastMap = new HashMap<>();
            projectMap = new HashMap<>();
            oblastDataList = new ArrayList<>();
            Workbook wb = WorkbookFactory.create(new FileInputStream(fileName));

            Sheet sheet = wb.getSheetAt(0);
            System.out.println(sheet.getSheetName());
            int endRow = sheet.getLastRowNum();
            int endCol = 8;
            System.out.println("rows=" + endRow);
            for (int r = 1; r < endRow + 1; r++) {
                Row row = sheet.getRow(r);
                SourceDataRow dataRow = new SourceDataRow();
                if (row == null) {
                    break;
                } else {
                    Cell cell = row.getCell(0);
                    if (cell != null) {
                        dataRow.setYear(((int) Math.round(cell.getNumericCellValue())));
                    } else {
                        System.out.println("Cell 0 is null row = " + r);
                    }
                    cell = row.getCell(1);
                    if (cell != null) {
                        dataRow.setSector(cell.getStringCellValue());
                    } else {
                        System.out.println("Cell 1 is null row = " + r);
                    }
                    cell = row.getCell(2);
                    if (cell != null) {
                        dataRow.setOblasctCode(cell.getStringCellValue());
                    } else {
                        System.out.println("Cell 2 is null row = " + r);
                    }
                    cell = row.getCell(3);
                    if (cell != null) {
                        dataRow.setProject(cell.getStringCellValue());
                    } else {
                        System.out.println("Cell 3 is null row = " + r);
                    }
                    cell = row.getCell(4);
                    if (cell != null) {
                        dataRow.setProjectNomer(cell.getStringCellValue());
                    } else {
                        System.out.println("Cell 4 is null row = " + r);
                    }
                    cell = row.getCell(5);
                    if (cell != null) {
                        dataRow.setDescription(cell.getStringCellValue());
                    } else {
                        System.out.println("Cell 5 is null row = " + r);
                    }
                    cell = row.getCell(6);
                    if (cell != null) {
                        dataRow.setPlanValue(cell.getNumericCellValue());
                    } else {
                        System.out.println("Cell 6 is null row = " + r);
                    }
                    cell = row.getCell(7);
                    if (cell != null) {
                        dataRow.setFactValue(cell.getNumericCellValue());
                    } else {
                        System.out.println("Cell 7 is null row = " + r);
                    }
                    listSourceData.add(dataRow);
                    parseToMaps(dataRow);
                }
            }


            sheet = wb.getSheetAt(2);
            System.out.println(sheet.getSheetName());
            endRow = sheet.getLastRowNum();
            System.out.println("rows=" + endRow);
            for (int r = 1; r < endRow - 1; r++) {
                Row row = sheet.getRow(r);
                SourceDataRow dataRow = new SourceDataRow();
                if (row == null) {
                    break;
                } else {
                    Cell cell1 = row.getCell(1);
                    Cell cell2 = row.getCell(2);
                    if (cell1 != null) {
                        sectorColors.put(cell1.getStringCellValue(), cell2.getStringCellValue());
                    } else {
                        break;
                    }

                }
            }


        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            System.out.println("mapDictSectors.size()=" + listSourceData.size());
            return dataArrayList;
        }
    }

    private void parseToMaps(SourceDataRow row) {
        List<SourceDataRow> list = null;
        String key = null;
        key = row.getSector();
        list = sectorMap.get(key);
        if (list == null) {
            list = new ArrayList<>();
            list.add(row);
            sectorMap.put(key, list);
        } else {
            list.add(row);
        }
        key = row.getOblasctCode();
        list = oblastMap.get(key);
        if (list == null) {
            list = new ArrayList<>();
            list.add(row);
            oblastMap.put(key, list);
        } else {
            list.add(row);
        }
        key = row.getProject();
        list = projectMap.get(key);
        if (list == null) {
            list = new ArrayList<>();
            list.add(row);
            projectMap.put(key, list);
        } else {
            list.add(row);
        }
    }

    public List<Data> getAllOblast() {
        if (oblastDataList.isEmpty()) {
            oblastDataList = new ArrayList<>();
            for (Map.Entry<String, List<SourceDataRow>> entrySet : oblastMap.entrySet()) {
                String key = entrySet.getKey();
                List<SourceDataRow> list = entrySet.getValue();
                Data data = new Data();
                data.setCode(key);
                double val = 0;
                for (SourceDataRow row : list) {
                    val = val + row.getPlanValue();
                }
                data.setValue(val);
                oblastDataList.add(data);
            }
        }
        addRoads(oblastDataList);
        return oblastDataList;
    }

    private void addRoads(List<Data> oblastDataList) {
        Data road = new Data();
        road.setCode("RO3");
        road.setColor("brown");
        oblastDataList.add(road);
        road = new Data();
        road.setCode("RO2");
        road.setColor("yellow");
        oblastDataList.add(road);
        road = new Data();
        road.setCode("RO4");
        road.setColor("yellow");
        oblastDataList.add(road);
        road = new Data();
        road.setCode("RO1");
        road.setColor("brown");
        road.setValue(600.0);
        oblastDataList.add(road);
        road = new Data();
        road.setCode("RO5");
        road.setColor("brown");
        oblastDataList.add(road);
        road = new Data();
        road.setCode("RO6");
        road.setColor("yellow");
        oblastDataList.add(road);
        road = new Data();
        road.setCode("RO7");
        road.setColor("yellow");
        oblastDataList.add(road);
        road = new Data();
        road.setCode("RO8");
        road.setColor("yellow");
        oblastDataList.add(road);
        road = new Data();
        road.setCode("RO9");
        road.setColor("yellow");
        oblastDataList.add(road);
        road = new Data();
        road.setCode("RO10");
        road.setColor("yellow");
        oblastDataList.add(road);
        road = new Data();
        road.setCode("RO11");
        road.setColor("brown");
        oblastDataList.add(road);
        road = new Data();
        road.setCode("RO12");
        road.setColor("brown");
        road.setValue(1100.5 + 767.4);
        oblastDataList.add(road);
        road = new Data();
        road.setCode("RO13");
        road.setColor("yellow");
        oblastDataList.add(road);
        road = new Data();
        road.setCode("RO14");
        road.setColor("yellow");
        oblastDataList.add(road);
        road = new Data();
        road.setCode("RO15");
        road.setColor("yellow");
        oblastDataList.add(road);
    }

    public String htmlTableDataCommitted(String oblCode) {
        List<SourceDataRow> dataList = oblastMap.get(oblCode);
        CU.sortList(dataList, "Sector", "ProjectNomer");
        StringBuilder sb = new StringBuilder();
        addTableHeader(sb, "datagrid", "Disbursed");
        if (addTableRowsCommitted(dataList, sb) == 0) {
            return "";
        }
        addTableFooter(sb);
        return sb.toString();
    }

    public String htmlTableDataDisbursed(String oblCode) {
        List<SourceDataRow> dataList = oblastMap.get(oblCode);
        CU.sortList(dataList, "Sector", "ProjectNomer");
        StringBuilder sb = new StringBuilder();
        addTableHeader(sb, "datagrid", "Committed");
        if (addTableRowsDisbursed(dataList, sb) == 0) {
            return "";
        }
        addTableFooter(sb);
        return sb.toString();
    }

    public String htmlTableDataCommitted() {
        List<SourceDataRow> dataList = agregate(listSourceData);
        CU.sortList(dataList, "Sector", "ProjectNomer");
        StringBuilder sb = new StringBuilder();
        addTableHeader(sb, "datagrid", "Disbursed");
        if (addTableRowsCommitted(dataList, sb) == 0) {
            return "";
        }
        addTableFooter(sb);
        return sb.toString();
    }

    public String htmlTableDataDisbursed() {
        List<SourceDataRow> dataList = agregate(listSourceData);
        CU.sortList(dataList, "Sector", "ProjectNomer");
        StringBuilder sb = new StringBuilder();
        addTableHeader(sb, "datagrid", "Committed");
        if (addTableRowsDisbursed(dataList, sb) == 0) {
            return "";
        }
        addTableFooter(sb);
        return sb.toString();
    }

    private List<SourceDataRow> agregate(List<SourceDataRow> listSourceData) {
        List<SourceDataRow> res = new ArrayList<>();
        for (SourceDataRow dataRow : listSourceData) {
            summToResult(res, dataRow);
        }
        return res;
    }

    private void summToResult(List<SourceDataRow> res, SourceDataRow dataRow) {
        boolean isadded = false;
        for (SourceDataRow row : res) {
            if (row.getSector().equals(dataRow.getSector()) && (row.getProjectNomer().equals(dataRow.getProjectNomer()))) {
                row.setPlanValue(row.getPlanValue() + dataRow.getPlanValue());
                row.setFactValue(row.getFactValue() + dataRow.getFactValue());
                isadded = true;
                break;
            }
        }
        if (!isadded) {
            SourceDataRow r = new SourceDataRow();
            r.setSector(dataRow.getSector());
            r.setProject(dataRow.getProject());
            r.setPlanValue(dataRow.getPlanValue());
            r.setFactValue(dataRow.getFactValue());
            r.setDescription(dataRow.getDescription());
            r.setOblasctCode(dataRow.getOblasctCode());
            r.setProjectNomer(dataRow.getProjectNomer());
            r.setYear(dataRow.getYear());
            res.add(r);
        }
    }

    private void addTableFooter(StringBuilder sb) {
        sb.append("</tbody>");
        sb.append("</table>");
        sb.append("</div>");
    }

    private void addTableHeader(StringBuilder sb, String css_class, String headName) {
        sb.append("<div class=\"" + css_class + "\"  style=\"width: 100%\">");
        sb.append("<table>");
        sb.append("<thead>");
        sb.append("<tr>");
        sb.append("<th colspan=4 class='tdalign_center'>");
        sb.append(headName);
        sb.append("</th>");
        sb.append("</tr>");
        sb.append("<tr>");
        sb.append("<th>").append("Sector").append("</th>").append("<th>").append("ProjectNumber").append("</th>")
                .append("<th>").append("Project").append("</th>").append("<th class='tdalign'>").append("Amount").append("</th>");
        sb.append("</tr>");
        sb.append("<thead>");
        sb.append("<tbody>");
    }

    private int addTableRowsCommitted(List<SourceDataRow> dataList, StringBuilder sb) {
        Map<String, Integer> sec = new HashMap<>();
        for (SourceDataRow row : dataList) {
            if (row.getFactValue() > 0) {
                if (sec.containsKey(row.getSector())) {
                    Integer cnt = sec.get(row.getSector());
                    cnt = cnt + 1;
                    sec.put(row.getSector(), cnt);
                } else {
                    sec.put(row.getSector(), 1);
                }
            }
        }

        int i = 0;
        SourceDataRow prewrow = null;
        for (SourceDataRow row : dataList) {
            if (row.getFactValue() > 0) {
                sb.append("<tr>");
                if ((prewrow == null) || (!prewrow.getSector().equals(row.getSector()))) {
                    sb.append("<td")
                            .append(" rowspan='").append(sec.get(row.getSector())).append("'")
                            .append(">").append(row.getSector())
                            .append("</td>");
                }
                sb.append("</td>").append("<td>").append(row.getProjectNomer()).append("</td>");
                sb.append("<td>").append(row.getProject()).append("</td>").append("<td class='tdalign_right'>").append(String.format("%,.1f", row.getPlanValue())).append("</td>");
                sb.append("</tr>");
                i++;
                prewrow = row;
            }
        }
        return i;
    }

    private int addTableRowsDisbursed(List<SourceDataRow> dataList, StringBuilder sb) {
        Map<String, Integer> sec = new HashMap<>();
        for (SourceDataRow row : dataList) {
            if (row.getPlanValue() != row.getFactValue()) {
                if (sec.containsKey(row.getSector())) {
                    Integer cnt = sec.get(row.getSector());
                    cnt = cnt + 1;
                    sec.put(row.getSector(), cnt);
                } else {
                    sec.put(row.getSector(), 1);
                }
            }
        }
        int i = 0;
        SourceDataRow prewrow = null;
        for (SourceDataRow row : dataList) {
            if (row.getPlanValue() != row.getFactValue()) {
                sb.append("<tr>");
                if ((prewrow == null) || (!prewrow.getSector().equals(row.getSector()))) {
                    sb.append("<td")
                            .append(" rowspan='").append(sec.get(row.getSector())).append("'")
                            .append(">").append(row.getSector())
                            .append("</td>");
                }
                sb.append("</td>").append("<td>").append(row.getProjectNomer()).append("</td>");
                sb.append("<td>").append(row.getProject()).append("</td>").append("<td class='tdalign_right'>").append(String.format("%,.1f", row.getPlanValue())).append("</td>");
                sb.append("</tr>");
                i++;
                prewrow = row;
            }
        }
        return i;
    }


    public List<TreeMapData> getTreeMap(String oblCode) {
        List<TreeMapData> res = new ArrayList<>();
        List<SourceDataRow> dataList = oblastMap.get(oblCode);
        Map<String, TreeMapData> sectorTreeMap = new HashMap();
        CU.sortList(dataList, "Sector", "Project");
        for (Map.Entry<String, List<SourceDataRow>> entrySet : sectorMap.entrySet()) {
            String key = entrySet.getKey();
            TreeMapData mapData = new TreeMapData();
            mapData.setId(key);
            mapData.setName(key);
            mapData.setColor(sectorColors.get(key));
            res.add(mapData);
            sectorTreeMap.put(key, mapData);
        }
        for (SourceDataRow row : dataList) {
            TreeMapData mapData = new TreeMapData();
            mapData.setValue(row.getPlanValue());
            mapData.setName(row.getProject());
            mapData.setParent(row.getSector());
            TreeMapData parent = sectorTreeMap.get(row.getSector());
            parent.setValue(parent.getValue().doubleValue() + mapData.getValue().doubleValue());
            mapData.setDescription(row.getDescription());
            res.add(mapData);
        }
        return res;
    }

    public List<TreeMapData> getTreeMap() {
        List<TreeMapData> res = new ArrayList<>();
        List<SourceDataRow> dataList = listSourceData;
        Map<String, TreeMapData> sectorTreeMap = new HashMap();
        CU.sortList(dataList, "Sector", "Project");
        for (Map.Entry<String, List<SourceDataRow>> entrySet : sectorMap.entrySet()) {
            String key = entrySet.getKey();
            TreeMapData mapData = new TreeMapData();
            mapData.setId(key);
            mapData.setName(key);
            mapData.setColor(sectorColors.get(key));
            res.add(mapData);
            sectorTreeMap.put(key, mapData);
        }
        for (Map.Entry<String, List<SourceDataRow>> entrySet : projectMap.entrySet()) {
            String key = entrySet.getKey();
            List<SourceDataRow> value = projectMap.get(key);
            TreeMapData mapData = new TreeMapData();
            mapData.setName(key);
            double val = 0;
            for (SourceDataRow row : value) {
                mapData.setParent(row.getSector());
                val = val + row.getPlanValue();
                mapData.setDescription(row.getDescription());
                TreeMapData parent = sectorTreeMap.get(row.getSector());
                parent.setValue(parent.getValue().doubleValue() + row.getPlanValue());
            }
            mapData.setValue(val);
            res.add(mapData);
        }
        return res;
    }
}
