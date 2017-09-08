package com.thinkgem.jeesite.common.utils;


public class ChineseEnglishReTo {
    static String guojia[][] = new String[][]{
            {"美国 ", "USA"},
            {"俄罗斯", "Russia"},
            {"泰国", "Thailand"},
            {"老挝", "Laos"},
            {"文莱", "Brunei"},
            {"东帝汶", "Timor Leste"},
            {"斯里兰卡", "Sri Lanka"},
            {"阿富汗", "Afghanistan"},
            {"尼泊尔", "Nepal"},
            {"马尔代夫", "Maldives"},
            {"不丹", "Bhutan"},
            {"沙特阿拉伯", "Saudi Arabia"},
            {"阿联酋", "The United Arab Emirates"},
            {"阿曼", "Oman"},
            {"伊朗", "Iran"},
            {"以色列", "Israel"},
            {"埃及", "Egypt"},
            {"科威特", "Kuwait"},
            {"伊拉克", "Iraq"},
            {"卡塔尔", "Qatar"},
            {"约旦", "Jordan"},
            {"黎巴嫩", "Lebanon"},
            {"巴林", "Bahrain"},
            {"也门共和国", "Republic of Yemen"},
            {"叙利亚", "Syria"},


            {"英国", "UK"},
            {"加拿大", "CANADA"},
            {"澳大利亚", "AUSTRALIA"},
            {"日本", "JAPAN"},
            {"韩国", "KOREA"},
            {"马来西亚", "MALAYSIA"},
            {"南非", "SOUTH AFRICA"},
            {"法国", "FRANCE"},
            {"德国", "GERMANY"},
            {"爱尔兰", "Ireland"},
            {"荷兰", "Netherlands"},
            {"比利时", "Belgium"},
            {"卢森堡", "Luxembourg"},
            {"摩纳哥", "Monaco"},
            {"波兰", "Poland"},
            {"瑞士", "Switzerland"},
            {"奥地利", "Austria"},
            {"匈牙利", "Hungary"},
            {"葡萄牙", "Portugal"},
            {"西班牙", "Spain"},
            {"希腊", "Greece"},
            {"意大利", "Italy"},
            {"马耳他", "Malta"},
            {"丹麦", "Denmark"},
            {"挪威", "Norway"},
            {"冰岛", "Iceland"},
            {"芬兰", "Finland"},
            {"瑞典", "Sweden"},
            {"意大利", "ITALY"},
            {"荷兰", "THENETHERLANDS"},
            {"西班牙", "SPAIN"},
            {"比利时", "BELGIUM"},
            {"奥地利", "AUSTRIA"},
            {"希腊", "GREECE"},
            {"葡萄牙", "PORTUGAL"},
            {"匈牙利", "PORTUGAL"},
            {"瑞典", "SWEDEN"},
            {"瑞士", "SWITZERLAND"},
            {"挪威", "NORWAY"},
            {"丹麦", "DENMARK"},
            {"芬兰", "FINLAND"},
            {"冰岛", "ICELAND"},
            {"捷克", "CZECH REPUBLIC"},
            {"斯洛伐克", "SLOVAKIA"},
            {"波兰", "POLAND"},
            {"罗马尼亚", "Romania"},
            {"保加利亚", "Bulgaria"},
            {"克罗地亚", "Croatia"},
            {"阿尔巴尼亚", "Albania"},
            {"塞尔维亚", "Serbia"},
            {"马其顿", "Macedonia"},
            {"波黑", "Bosnia and Herzegovina"},
            {"黑山", "Montenegro"},
            {"哈萨克斯坦", "Kazakhstan"},
            {"乌兹别克斯坦", "Uzbekistan"},
            {"土库曼斯坦", "Turkmenistan"},
            {"吉尔吉斯斯坦", "Kyrgyzstan"},
            {"塔吉克斯坦", "Tajikistan"},
            {"乌克兰", "Ukraine"},
            {"白俄罗斯", "Belarus"},
            {"克鲁吉亚", "Georgia"},
            {"阿塞拜疆", "Azerbaijan"},
            {"亚美尼亚", "Armenia"},
            {"摩尔多瓦", "Moldova"},
            {"斯洛文尼亚", "SLOVENIA"},
            {"爱沙尼亚", "ESTONIA"},
            {"立陶宛", "LITHUANIA"},
            {"卢森堡", "LUXEMBURG"},
            {"马尔他", "MALTA"},
            {"拉脱维亚", "LATVIA"},
            {"孟加拉国", " Bangladesh"},
            {"缅甸", "Burma"},
            {"柬埔寨", " Cambodia"},
            {"印度", "India"},
            {"印度尼西亚", "Indonesia"},
            {"马来西亚", "Malaysia "},
            {"蒙古", "Mongolia"},
            {"尼泊尔", "Nepal"},
            {"朝鲜", "North Korea"},
            {"巴基斯坦", "Pakistan"},
            {"新加坡", "Singapore"},
            {"泰国", "Thailand"},
            {"土耳其", "Turkey"},
            {"越南", "Vietnam"},
            {"巴勒斯坦", "Palestine"},
            {"阿根廷", "Argentina"},
            {"巴西", "Brazil"},
            {"智利", "Chile"},
            {"哥伦比亚", "Colombia"},
            {"古巴", "Cuba"},
            {"牙买加", "Jamaica"},
            {"墨西哥", "Mexico"},
            {"巴拿马", "Panama"},
            {"秘鲁", "Peru"},
            {"乌拉圭", "Uruguay"},
            {"委内瑞拉", "Venezuela"},

    };

    public static String selectEnName(String name) {
        String guojiaName = "";

        for (int i = 0; i < guojia.length; i++) {
            for (int j = 0; j < guojia[i].length - 1; j++) {
                String value = guojia[i][j];
                if (value.equals(name.trim())) {
                    guojiaName = guojia[i][j + 1];
                    return guojiaName;

                }


            }
        }
        System.out.println("=============================" + guojiaName);
        return guojiaName;
    }

    ;

	/*public static void main(String[] args) {
    System.out.println(ChineseEnglishReTo.selectEnName("英国"));
	}*/

    //读写文件
/*	public static void main(String[] args) {
        StringBuffer buf=new StringBuffer();
		String guo[][]=ChineseEnglishReTo.guojia;
		for (int i = 0; i < guo.length; i++) {
			for (int j = 0; j < guo[i].length-1; j++) {
				String v1=guo[i][j];
				String v2=guo[i][j+1];
				buf.append("['"+v1+"','"+v2+"'],");  
			}
		}
		System.out.println(buf.toString());
		
	
		
	}
	*/


}
