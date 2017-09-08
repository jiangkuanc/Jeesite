package com.dagongsoft.p2p.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FilenameUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellValue;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.thinkgem.jeesite.common.config.Global;

/**
 * Excel导入导出工具类
 *
 * @author Quincy
 */
public class ExcelHelper {

    //Excel 2003
    private final static String XLS = "xls";

    //Excel 2007
    private final static String XLSX = "xlsx";

    //分隔符
    public final static String SEPARATOR = "|";

    /**
     * 由Excel文件的Sheet导出至List
     *
     * @param file     Excel文件
     * @param sheetNum sheet序号
     * @return
     * @throws IOException
     */
    public static List<String> exportListFromExcel(File file, int sheetNum) throws IOException {
        return exportListFromExcel(new FileInputStream(file),
                FilenameUtils.getExtension(file.getName()), sheetNum);
    }

    /**
     * 由Excel流的Sheet导出至List
     *
     * @param is       Excel文件
     * @param suffix   文件后缀名
     * @param sheetNum sheet序号
     * @return
     * @throws IOException
     */
    public static List<String> exportListFromExcel(InputStream is,
                                                   String suffix, int sheetNum) throws IOException {
        Workbook workbook = null;
        if (suffix.toLowerCase().equals(XLS)) {
            workbook = new HSSFWorkbook(is);
        } else if (suffix.toLowerCase().equals(XLSX)) {
            workbook = new XSSFWorkbook(is);
        }
        return exportListFromExcel(workbook, sheetNum);
    }

    /**
     * 由指定的Sheet导出至List
     *
     * @param workbook Excel文件POI对象
     * @param sheetNum sheet序号
     * @return
     */
    private static List<String> exportListFromExcel(Workbook workbook, int sheetNum) {
        //根据sheet的序号，获得对应sheet
        Sheet sheet = workbook.getSheetAt(sheetNum);
        //解析公式结果
        FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();
        //创建List用来存储导出数据
        List<String> list = new ArrayList<String>();
        //通过sheet获得最大行序号和最小行序号
        int minRowIx = sheet.getFirstRowNum();
        int maxRowIx = sheet.getLastRowNum();
        //以最大最小行序号为区间，进行循环
        for (int rowIx = minRowIx; rowIx <= maxRowIx; rowIx++) {
            //通过当前行序号，获得row对象
            Row row = sheet.getRow(rowIx);
            StringBuilder sb = new StringBuilder();
            //通过当前row对象获得最大单元格序号和最小单元格序号
            short minCellIx = row.getFirstCellNum();
            short maxCellIx = row.getLastCellNum();
            //以最大最小单元格序号为区间，进行循环
            for (int cellIx = minCellIx; cellIx <= maxCellIx; cellIx++) {
                //通过当前单元格序号，获得cell对象
                Cell cell = row.getCell(cellIx);
                //获得单元格Value对象
                CellValue cellValue = evaluator.evaluate(cell);
                if (cellValue == null) {
                    continue;
                }
                //经过公式解析，最后只存在Boolean、Numeric和String三种数据类型，此外就是Error了
                switch (cellValue.getCellType()) {
                    case Cell.CELL_TYPE_STRING:
                        sb.append(SEPARATOR + cellValue.getStringValue());
                        break;
                    case Cell.CELL_TYPE_BOOLEAN:
                        sb.append(SEPARATOR + cellValue.getBooleanValue());
                        break;
                    case Cell.CELL_TYPE_NUMERIC:
                        if (DateUtil.isCellDateFormatted(cell)) {
                            sb.append(SEPARATOR + cell.getDateCellValue());
                        } else {
                            sb.append(SEPARATOR + cellValue.getNumberValue());
                        }
                        break;
                    case Cell.CELL_TYPE_FORMULA:
                        break;
                    case Cell.CELL_TYPE_BLANK:
                        break;
                    case Cell.CELL_TYPE_ERROR:
                        break;
                    default:
                        break;
                }
            }
            list.add(sb.toString());
        }
        return list;
    }

    /**
     * 由多个List导出至Excel文件
     *
     * @param headers2 各sheet的表头信息
     * @param list     各sheet的数据
     * @return
     * @throws Exception
     * @author Quincy
     */
    public static File exportExcelFromList(String[][] headers2, List<List<Object>> list) throws Exception {
        HSSFWorkbook wb = new HSSFWorkbook();
        for (int i = 0; i < list.size(); i++) {
            List<Object> sheetlist = list.get(i);
            String[] headers = headers2[i];
            exportExcelFromList(headers, sheetlist, "第" + (i + 1) + "页", wb);
        }
        File file = null;
        String path = Global.getConfig("filePath");
        file = new File(path + "exportExcel/");
        if (!file.exists()) {
            file.mkdirs();
        }
        try {
            file = new File(path + "exportExcel/" + new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + ".xls");
            FileOutputStream fos = new FileOutputStream(file);
            wb.write(fos);
            fos.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return file;
    }

    /**
     * 由指定的List导出至Sheet
     *
     * @param headers   表头信息
     * @param list      数据
     * @param sheetName sheet名称
     * @param wb        ExcelPOI对象
     * @throws Exception
     * @author Quincy
     */
    public static void exportExcelFromList(String[] headers, List<Object> list,
                                           String sheetName, HSSFWorkbook wb) throws Exception {
        // 第一步，创建一个webbook，对应一个Excel文件
//		HSSFWorkbook wb = new HSSFWorkbook();
        // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
        HSSFSheet sheet = wb.createSheet(sheetName);
        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short
        HSSFRow row = sheet.createRow(0);
        // 第四步，设置表头居中
        HSSFCellStyle style = wb.createCellStyle();
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);//创建一个居中样式
        // 第五步，设置表头字段,循环创建表头单元格
        HSSFCell cell = null;
        for (int i = 0; i < headers.length; i++) {
            cell = row.createCell(i);
            cell.setCellStyle(style);
            cell.setCellValue(headers[i]);
        }
        // 第六步， 创建数据行
        for (int i = 0; i < list.size(); i++) {
            row = sheet.createRow(i + 1);
            // 第七步， 根据当前数据行创建单元格并赋值
            Object obj = list.get(i);
            Class clazz = obj.getClass();
            Field[] fields = clazz.getDeclaredFields();
            int k = 0;
            for (int j = 0; j < fields.length; j++) {
                Field f = fields[j];
                String methodName = f.getName();
                if (f.getName().equals("serialVersionUID")) {
                    k++;
                } else {
                    methodName = "get" + methodName.substring(0, 1).toUpperCase() + methodName.substring(1);
                    Method method = clazz.getDeclaredMethod(methodName);
                    Object str = method.invoke(obj);
                    if (str != null) {
                        cell = row.createCell(j - k);
                        if (f.getType().getName().equals("java.lang.Double")) {
                            Double amount = (Double) str;
                            str = new DecimalFormat("###,##0.00").format(amount);
                        }
                        if (f.getType().getName().equals("java.util.Date")) {
                            Date date = (Date) str;
                            str = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
                        }
                        cell.setCellValue(str.toString());
                    } else {
                        k++;
                    }
                }
            }
        }
    }
}
